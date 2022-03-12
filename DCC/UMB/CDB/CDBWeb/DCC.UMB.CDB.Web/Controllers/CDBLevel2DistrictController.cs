using System;
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
    public class CDBLevel2DistrictController : AbstractCDBWebApiController<Level2DistrictViewModel>
    {
        public override string ScreenId {
            get {
                return "GEO_03";
            }
        }

        public override List<Level2DistrictViewModel> GetMultiple(Level2DistrictViewModel criteria) {
            ViewLevel2AddressComponentSQLSelectQuery query = new ViewLevel2AddressComponentSQLSelectQuery();
            query.AddSelectTopNRecords(1000);
            query.AddOrderByClause(query.level_2_address_component_nm, OrderByTypes.ASC);
            query.LoadCriteria(criteria);
            if (!string.IsNullOrEmpty(criteria.ParentId)) {
                query.level_1_address_component_id.Equal(criteria.ParentId);
            }
            string strQuery = query.GetLoadedCriteriaQuery(criteria);
            DataSet dset = CDBUtils.GetNewDbManager().ExecuteSQL(strQuery);
            return ModelUtils<Level2DistrictViewModel>.CreateObjects(dset);
        }

        public override JObject LookupListing(Level2DistrictViewModel criteria) {
            criteria.DisplayPropertyName = Level2DistrictViewModel.flds.level_2_address_component_nm.ToString();
            criteria.CodePropertyName = Level2DistrictViewModel.flds.level_2_address_component_cd.ToString();
            criteria.IdPropertyName = Level2DistrictViewModel.flds.level_2_address_component_id.ToString();
            List<Level2DistrictViewModel> lst = this.GetMultiple(criteria);
            ListingCreator<Level2DistrictViewModel> lc = new ListingCreator<Level2DistrictViewModel>(lst);
            lc.AddColumnDefinition("Name", 25, Level2DistrictViewModel.flds.Display.ToString(), false);
            lc.AddColumnDefinition("Id", 25, Level2DistrictViewModel.flds.Id.ToString(), true);
            lc.AddColumnDefinition("Code", 25, Level2DistrictViewModel.flds.level_2_address_component_cd.ToString(), false);
            lc.AddColumnDefinition("Level 1 Address", 25, "level_1_address_component_id_display", false, true);
            lc.AddColumnDefinition("Country", 25, "country_nm", false, true);
            return lc.CreateListing(this.IsInsertAllowed, this.IsUpdateAllowed, this.IsSelectAllowed, null);
        }

        public override List<BaseEntity> ComboListing(Level2DistrictViewModel criteria) {
            return GetMultiple(criteria).Cast<BaseEntity>().ToList();
        }

        public override JObject GridListing(Level2DistrictViewModel criteria) {
            List<Level2DistrictViewModel> lstStates = this.GetMultiple(criteria);

            ListingCreator<Level2DistrictViewModel> lc = new ListingCreator<Level2DistrictViewModel>(lstStates);
            lc.AddColumnDefinition("Name", 25, Level2DistrictViewModel.flds.Display.ToString(), false);
            lc.AddColumnDefinition("Id", 25, Level2DistrictViewModel.flds.Id.ToString(), true);
            return lc.CreateListing();
        }

        public override void CreateRecord(Level2DistrictViewModel obj) {
            Hashtable table = new Hashtable();
            string task = UtilityManager.GetProcedureDbTask(obj, facade, "InsertLevel2AddressComponentAsTask", table);
            facade.AddDbTask(task);
            DataSet dset = facade.ExecuteDbTasks();
            int id = DbManager.GetInteger(dset.Tables[0].Rows[0][0]);
            obj.level_2_address_component_id = id;
        }

        public override void UpdateRecord(Level2DistrictViewModel obj) {
            Hashtable table = new Hashtable();
            string task = UtilityManager.GetProcedureDbTask(obj, facade, "UpdateLevel2AddressComponentAsTask", table);
            facade.AddDbTask(task);
            DataSet dset = facade.ExecuteDbTasks();
        }
        public override string IsValid(Level2DistrictViewModel obj) {
            string ErrMsg = "";
            return ErrMsg;
        }
        public override void DeleteRecord(Level2DistrictViewModel obj) {

            Hashtable table = new Hashtable();
            string task = UtilityManager.GetProcedureDbTask(obj, facade, "DeleteLevel2AddressComponentAsTask", table);
            facade.AddDbTask(task);
            DataSet dset = facade.ExecuteDbTasks();
        }

        public override Level2DistrictViewModel Get(string id) {
            return GetMultiple(new Level2DistrictViewModel() { level_2_address_component_id = int.Parse(id) })[0];
        }
        public override List<string> GetActions(Level2DistrictViewModel obj) {
            throw new NotImplementedException();
        }

        public override HttpResponseMessage ExecuteAction(Level2DistrictViewModel obj, string actionId) {
            throw new NotImplementedException();
        }
        [HttpGet]
        public List<string> GetDistrictSuggestions(string term) {
            DataSet dset = CDBUtils.GetNewDbManager().ExecuteSQL(GetDistinctQuery("level_2_address_component_nm", "level_2_address_components", term));
            return UtilityManager.GetStringLists(dset.Tables[0], "level_2_address_component_nm");
        }
        private string GetDistinctQuery(string fieldName, string tableName, string term) {
            return string.Format("Select distinct top 20 {0} from {1} where {0} like '{2}%' order by {0}", fieldName, tableName, term);
        }
    }
}

