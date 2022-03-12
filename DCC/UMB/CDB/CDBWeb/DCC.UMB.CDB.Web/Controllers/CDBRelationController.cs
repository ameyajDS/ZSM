using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

using CDBModel;
using DCC.CDB.DBFacade;
using DCC.UMB.WDF.DB;
using DCC.UMB.WDF.Lookup;
using DCC.UMB.WDF.Models;
using DCC.UMB.WDF.Models.Record;
using DCC.UMB.WDF.Utils;
using Newtonsoft.Json.Linq;


namespace DCC.UMB.CDB.Web.Controllers
{
    public class CDBRelationController : AbstractCDBWebApiController<RelationsViewModel>
    {
        public override string ScreenId
        {
            get
            {
                return "CDB_01";
            }
        }

        public override List<RelationsViewModel> GetMultiple(RelationsViewModel criteria)
        {
            RelationsSQLSelectQuery query = new RelationsSQLSelectQuery();
            query.AddSelectTopNRecords(1000);
            string restrictedIds = ""+criteria.GetKeyValue("RESTRICTED_IDS");
            if (!string.IsNullOrEmpty(restrictedIds)){
                restrictedIds = restrictedIds.Trim().Trim('"');
                query.relation_id.In(restrictedIds.Split(new string[]{","},StringSplitOptions.RemoveEmptyEntries));
            }
            query.AddOrderByClause(query.relation_nm, OrderByTypes.ASC);
            string strQuery = query.LoadCriteriaAndGetQuery(criteria);
            DataSet dset = CDBUtils.GetNewDbManager().ExecuteSQL(strQuery);
            return ModelUtils<RelationsViewModel>.CreateObjects(dset);
        }

        public override JObject LookupListing(RelationsViewModel criteria)
        {
            criteria.DisplayPropertyName = RelationsViewModel.flds.relation_nm.ToString();
            criteria.CodePropertyName = RelationsViewModel.flds.relation_nm.ToString();
            criteria.IdPropertyName = RelationsViewModel.flds.relation_id.ToString();

            List<RelationsViewModel> lst = this.GetMultiple(criteria);
            ListingCreator<RelationsViewModel> lc = new ListingCreator<RelationsViewModel>(lst);
            lc.AddColumnDefinition("Name", 25, RelationsViewModel.flds.Display.ToString(), false);            
            lc.AddColumnDefinition("Id", 25, RelationsViewModel.flds.Id.ToString(), true);
            return lc.CreateListing(this.IsInsertAllowed, this.IsUpdateAllowed, this.IsSelectAllowed, null);
        }

        public override List<BaseEntity> ComboListing(RelationsViewModel criteria) {
            return GetMultiple(criteria).Cast<BaseEntity>().ToList();
        }

        public override JObject GridListing(RelationsViewModel criteria) {
            List<RelationsViewModel> lstRelations = this.GetMultiple(criteria);

            ListingCreator<RelationsViewModel> lc = new ListingCreator<RelationsViewModel>(lstRelations);
            lc.AddColumnDefinition("Name", 25, RelationsViewModel.flds.Display.ToString(), false);
            lc.AddColumnDefinition("Id", 25, RelationsViewModel.flds.Id.ToString(), true);
            return lc.CreateListing();
        }
        public override void CreateRecord(RelationsViewModel obj) {
            Hashtable table = new Hashtable();
            string task = UtilityManager.GetProcedureDbTask(obj, facade, "InsertRelationAsTask", table);
            facade.AddDbTask(task);
            DataSet dset = facade.ExecuteDbTasks();
            short id = DbManager.GetShort(dset.Tables[0].Rows[0][0]);
            obj.relation_id = id;
        }

        public override void UpdateRecord(RelationsViewModel obj) {
            Hashtable table = new Hashtable();
            string task = UtilityManager.GetProcedureDbTask(obj, facade, "UpdateRelationAsTask", table);
            facade.AddDbTask(task);
            DataSet dset = facade.ExecuteDbTasks();
        }
        public string IsValid(RelationsViewModel obj) {
            string ErrMsg = "";
            return ErrMsg;
        }
        public override void DeleteRecord(RelationsViewModel obj) {

             Hashtable table = new Hashtable();
            string task = UtilityManager.GetProcedureDbTask(obj, facade, "DeleteRelationAsTask", table);
            facade.AddDbTask(task);
            DataSet dset = facade.ExecuteDbTasks();
        }       

        public override RelationsViewModel Get(string id) {
            return GetMultiple(new RelationsViewModel() { relation_id = short.Parse(id) })[0];
        }
        public override List<string> GetActions(RelationsViewModel obj) {
            throw new NotImplementedException();
        }

        public override HttpResponseMessage ExecuteAction(RelationsViewModel obj, string actionId) {
            throw new NotImplementedException();
        }
    }
}
