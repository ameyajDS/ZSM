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
    public class CDBLevel1StateController : AbstractCDBWebApiController<Level1StateViewModel>
    {
        public override string ScreenId
        {
            get
            {
                return "GEO_02";
            }
        }

        public override List<Level1StateViewModel> GetMultiple(Level1StateViewModel criteria)
        {
            ViewLevel1AddressComponentSQLSelectQuery query = new ViewLevel1AddressComponentSQLSelectQuery();
            query.AddSelectTopNRecords(1000); 
            query.AddOrderByClause(query.level_1_address_component_nm, OrderByTypes.ASC);
            query.LoadCriteria(criteria);
            if (!string.IsNullOrEmpty(criteria.ParentId)) {
                query.country_id.Equal(criteria.ParentId);
            }
            string strQuery = query.GetLoadedCriteriaQuery(criteria);
            DataSet dset = CDBUtils.GetNewDbManager().ExecuteSQL(strQuery);
            return ModelUtils<Level1StateViewModel>.CreateObjects(dset);
        }

        public override JObject LookupListing(Level1StateViewModel criteria)
        {            
            criteria.DisplayPropertyName = Level1StateViewModel.flds.level_1_address_component_nm.ToString();
            criteria.CodePropertyName = Level1StateViewModel.flds.level_1_address_component_cd.ToString();
            criteria.IdPropertyName = Level1StateViewModel.flds.level_1_address_component_id.ToString();
            List<Level1StateViewModel> lst = this.GetMultiple(criteria);
            ListingCreator<Level1StateViewModel> lc = new ListingCreator<Level1StateViewModel>(lst);
            lc.AddColumnDefinition("Name", 25, Level1StateViewModel.flds.Display.ToString(), false);
            lc.AddColumnDefinition("Id", 25, Level1StateViewModel.flds.Id.ToString(), true);

            /*By default listing creator only set proper property name for display and id, for bal fields it uses 1,2,3 etc. Flag optimizeSerialization
              controls that behaviour, so for code property name, we need the proper label */            
            lc.AddColumnDefinition("Code", 25, Level1StateViewModel.flds.level_1_address_component_cd.ToString(), false, optimizeSerialization: false);
            lc.AddColumnDefinition("Country", 25, "country_id_display", false, true);
            return lc.CreateListing(this.IsInsertAllowed, this.IsUpdateAllowed, this.IsSelectAllowed, null);
        }

        public override List<BaseEntity> ComboListing(Level1StateViewModel criteria)
        {
            return GetMultiple(criteria).Cast<BaseEntity>().ToList();
        }

        public override JObject GridListing(Level1StateViewModel criteria) {
            List<Level1StateViewModel> lstStates = this.GetMultiple(criteria);

            ListingCreator<Level1StateViewModel> lc = new ListingCreator<Level1StateViewModel>(lstStates);
            lc.AddColumnDefinition("Name", 25, Level1StateViewModel.flds.Display.ToString(), false);
            lc.AddColumnDefinition("Id", 25, Level1StateViewModel.flds.Id.ToString(), true);
            return lc.CreateListing();
        }

        public override void CreateRecord(Level1StateViewModel obj) {
            Hashtable table = new Hashtable();
            string task = UtilityManager.GetProcedureDbTask(obj, facade, "InsertLevel1AddressComponentAsTask", table);
            facade.AddDbTask(task);
            DataSet dset = facade.ExecuteDbTasks();
            int id = DbManager.GetInteger(dset.Tables[0].Rows[0][0]);
            obj.level_1_address_component_id = id;
        }

        public override void UpdateRecord(Level1StateViewModel obj) {
            Hashtable table = new Hashtable();
            string task = UtilityManager.GetProcedureDbTask(obj, facade, "UpdateLevel1AddressComponentAsTask", table);
            facade.AddDbTask(task);
            DataSet dset = facade.ExecuteDbTasks();
        }
        public override string IsValid(Level1StateViewModel obj) {
            string ErrMsg = "";
            return ErrMsg;
        }
        public override void DeleteRecord(Level1StateViewModel obj) {

            Hashtable table = new Hashtable();
            string task = UtilityManager.GetProcedureDbTask(obj, facade, "DeleteLevel1AddressComponentAsTask", table);
            facade.AddDbTask(task);
            DataSet dset = facade.ExecuteDbTasks();
        }

        public override Level1StateViewModel Get(string id) {
            return GetMultiple(new Level1StateViewModel() { level_1_address_component_id = int.Parse(id) })[0];
        }
        public override List<string> GetActions(Level1StateViewModel obj) {
            throw new NotImplementedException();
        }

        public override HttpResponseMessage ExecuteAction(Level1StateViewModel obj, string actionId) {
            throw new NotImplementedException();
        }
        [HttpGet]
        public List<string> GetStateSuggestions(string term) {
            DataSet dset = CDBUtils.GetNewDbManager().ExecuteSQL(GetDistinctQuery("level_1_address_component_nm", "level_1_address_components", term));
            return UtilityManager.GetStringLists(dset.Tables[0], "level_1_address_component_nm");
        }
        private string GetDistinctQuery(string fieldName, string tableName, string term) {
            return string.Format("Select distinct top 20 {0} from {1} where {0} like '{2}%' order by {0}", fieldName, tableName, term);
        }
    }
}
