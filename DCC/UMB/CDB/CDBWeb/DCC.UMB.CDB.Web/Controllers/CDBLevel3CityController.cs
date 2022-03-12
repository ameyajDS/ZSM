﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using CDBModel;

using DCC.UMB.WDF.Controllers;
using DCC.UMB.WDF.DB;
using DCC.UMB.WDF.Lookup;
using DCC.UMB.WDF.Models;
using Newtonsoft.Json.Linq;

using DCC.UMB.WDF.Models.Record;
using DCC.UMB.WDF.Utils;
using System.Reflection;
using DCC.CDB.DBFacade;
using System.Collections;


namespace DCC.UMB.CDB.Web.Controllers
{
    public class CDBLevel3CityController : AbstractCDBWebApiController<Level3CityViewModel>
    {
        public override string ScreenId {
            get {
                return "GEO_04";
            }
        }

        public override List<Level3CityViewModel> GetMultiple(Level3CityViewModel criteria) {
            ViewLevel3AddressComponentSQLSelectQuery query = new ViewLevel3AddressComponentSQLSelectQuery();
            query.AddSelectTopNRecords(1000);
            query.AddOrderByClause(query.level_3_address_component_nm, OrderByTypes.ASC);
            query.LoadCriteria(criteria);
            if (!string.IsNullOrEmpty(criteria.ParentId)) {
                query.level_2_address_component_id.Equal(criteria.ParentId);
            }
            string strQuery = query.GetLoadedCriteriaQuery(criteria);
            DataSet dset = CDBUtils.GetNewDbManager().ExecuteSQL(strQuery);
            return ModelUtils<Level3CityViewModel>.CreateObjects(dset);
        }

        public override JObject LookupListing(Level3CityViewModel criteria) {
            criteria.DisplayPropertyName = Level3CityViewModel.flds.level_3_address_component_nm.ToString();
            criteria.CodePropertyName = Level3CityViewModel.flds.level_3_address_component_cd.ToString();
            criteria.IdPropertyName = Level3CityViewModel.flds.level_3_address_component_id.ToString();
            List<Level3CityViewModel> lst = this.GetMultiple(criteria);
            ListingCreator<Level3CityViewModel> lc = new ListingCreator<Level3CityViewModel>(lst);
            lc.AddColumnDefinition("Name", 25, Level3CityViewModel.flds.Display.ToString(), false);
            lc.AddColumnDefinition("Id", 25, Level3CityViewModel.flds.Id.ToString(), true);
            lc.AddColumnDefinition("Code", 25, Level3CityViewModel.flds.level_3_address_component_cd.ToString(), false);
            lc.AddColumnDefinition("Level 2 Address", 25, "level_2_address_component_id_display", false, true);
            lc.AddColumnDefinition("Level 1 Address", 25, "level_1_address_component_nm", false, true);
            lc.AddColumnDefinition("Country", 25, "country_nm", false, true);
            return lc.CreateListing(this.IsInsertAllowed, this.IsUpdateAllowed, this.IsSelectAllowed, null);
        }

        public override List<BaseEntity> ComboListing(Level3CityViewModel criteria) {
            return GetMultiple(criteria).Cast<BaseEntity>().ToList();
        }

        public override JObject GridListing(Level3CityViewModel criteria) {
            List<Level3CityViewModel> lstStates = this.GetMultiple(criteria);

            ListingCreator<Level3CityViewModel> lc = new ListingCreator<Level3CityViewModel>(lstStates);
            lc.AddColumnDefinition("Name", 25, Level3CityViewModel.flds.Display.ToString(), false);
            lc.AddColumnDefinition("Id", 25, Level3CityViewModel.flds.Id.ToString(), true);
            return lc.CreateListing();
        }

        public override void CreateRecord(Level3CityViewModel obj) {
            Hashtable table = new Hashtable();
            string task = UtilityManager.GetProcedureDbTask(obj, facade, "InsertLevel3AddressComponentAsTask", table);
            facade.AddDbTask(task);
            DataSet dset = facade.ExecuteDbTasks();
            int id = DbManager.GetInteger(dset.Tables[0].Rows[0][0]);
            obj.level_3_address_component_id = id;
        }

        public override void UpdateRecord(Level3CityViewModel obj) {
            Hashtable table = new Hashtable();
            string task = UtilityManager.GetProcedureDbTask(obj, facade, "UpdateLevel3AddressComponentAsTask", table);
            facade.AddDbTask(task);
            DataSet dset = facade.ExecuteDbTasks();
        }
        public override string IsValid(Level3CityViewModel obj) {
            string ErrMsg = "";
            return ErrMsg;
        }
        public override void DeleteRecord(Level3CityViewModel obj) {

            Hashtable table = new Hashtable();
            string task = UtilityManager.GetProcedureDbTask(obj, facade, "DeleteLevel3AddressComponentAsTask", table);
            facade.AddDbTask(task);
            DataSet dset = facade.ExecuteDbTasks();
        }

        public override Level3CityViewModel Get(string id) {
            return GetMultiple(new Level3CityViewModel() { level_3_address_component_id = int.Parse(id) })[0];
        }
        public override List<string> GetActions(Level3CityViewModel obj) {
            throw new NotImplementedException();
        }

        public override HttpResponseMessage ExecuteAction(Level3CityViewModel obj, string actionId) {
            throw new NotImplementedException();
        }
        [HttpGet]
        public List<string> GetCitySuggestions(string term) {
            DataSet dset = CDBUtils.GetNewDbManager().ExecuteSQL(GetDistinctQuery("level_3_address_component_nm", "level_3_address_components", term));
            return UtilityManager.GetStringLists(dset.Tables[0], "level_3_address_component_nm");
        }
        private string GetDistinctQuery(string fieldName, string tableName, string term) {
            return string.Format("Select distinct top 20 {0} from {1} where {0} like '{2}%' order by {0}", fieldName, tableName, term);
        }
    }
}

