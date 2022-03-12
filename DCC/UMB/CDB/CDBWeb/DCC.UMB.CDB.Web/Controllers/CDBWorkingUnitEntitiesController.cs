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
    public class CDBWorkingUnitEntitiesController : AbstractCDBWebApiController<WorkingUnitEnititiesViewModel>
    {
        public override string ScreenId
        {
            get
            {
                return null;
            }
        }

        public override List<WorkingUnitEnititiesViewModel> GetMultiple(WorkingUnitEnititiesViewModel criteria)
        {
            ViewWorkingUnitEntitiesSQLSelectQuery query = new ViewWorkingUnitEntitiesSQLSelectQuery();
            query.AddSelectTopNRecords(1000);
            query.AddOrderByClause(query.entity_singular_nm, OrderByTypes.ASC);
            string strQuery = query.LoadCriteriaAndGetQuery(criteria);
            DataSet dset = CDBUtils.GetNewDbManager().ExecuteSQL(strQuery);
            return ModelUtils<WorkingUnitEnititiesViewModel>.CreateObjects(dset);
        }

        public override JObject LookupListing(WorkingUnitEnititiesViewModel criteria)
        {
            criteria.DisplayPropertyName = WorkingUnitEnititiesViewModel.flds.entity_singular_nm.ToString();
            criteria.CodePropertyName = WorkingUnitEnititiesViewModel.flds.entity_singular_nm.ToString();
            criteria.IdPropertyName = WorkingUnitEnititiesViewModel.flds.entity_id.ToString();

            List<WorkingUnitEnititiesViewModel> lst = this.GetMultiple(criteria);
            ListingCreator<WorkingUnitEnititiesViewModel> lc = new ListingCreator<WorkingUnitEnititiesViewModel>(lst);
            lc.AddColumnDefinition("Name", 25, WorkingUnitEnititiesViewModel.flds.Display.ToString(), false);            
            lc.AddColumnDefinition("Id", 25, WorkingUnitEnititiesViewModel.flds.Id.ToString(), true);
            return lc.CreateListing(this.IsInsertAllowed, this.IsUpdateAllowed, this.IsSelectAllowed, null);
        }

        public override List<BaseEntity> ComboListing(WorkingUnitEnititiesViewModel criteria) {
            return GetMultiple(criteria).Cast<BaseEntity>().ToList();
        }

        public override JObject GridListing(WorkingUnitEnititiesViewModel criteria) {
            List<WorkingUnitEnititiesViewModel> lstRelations = this.GetMultiple(criteria);

            ListingCreator<WorkingUnitEnititiesViewModel> lc = new ListingCreator<WorkingUnitEnititiesViewModel>(lstRelations);
            lc.AddColumnDefinition("Name", 25, WorkingUnitEnititiesViewModel.flds.Display.ToString(), false);
            lc.AddColumnDefinition("Id", 25, WorkingUnitEnititiesViewModel.flds.Id.ToString(), true);
            return lc.CreateListing();
        }

        public override void CreateRecord(WorkingUnitEnititiesViewModel obj) {
            Hashtable table = new Hashtable();
            string task = UtilityManager.GetProcedureDbTask(obj, facade, "InsertWorkingUnitEntitieAsTask", table);
            facade.AddDbTask(task);
            DataSet dset = facade.ExecuteDbTasks();
            short id = DbManager.GetShort(dset.Tables[0].Rows[0][0]);
            obj.entity_id = id;
        }

        public override void UpdateRecord(WorkingUnitEnititiesViewModel obj) {
            Hashtable table = new Hashtable();
            string task = UtilityManager.GetProcedureDbTask(obj, facade, "UpdateWorkingUnitEntitieAsTask", table);
            facade.AddDbTask(task);
            DataSet dset = facade.ExecuteDbTasks();
        }
        public string IsValid(WorkingUnitEnititiesViewModel obj) {
            string ErrMsg = "";
            return ErrMsg;
        }
        public override void DeleteRecord(WorkingUnitEnititiesViewModel obj) {

             Hashtable table = new Hashtable();
             string task = UtilityManager.GetProcedureDbTask(obj, facade, "DeleteWorkingUnitEntitieAsTask", table);
            facade.AddDbTask(task);
            DataSet dset = facade.ExecuteDbTasks();
        }       

        public override WorkingUnitEnititiesViewModel Get(string id) {
            return GetMultiple(new WorkingUnitEnititiesViewModel() { entity_id = short.Parse(id) })[0];
        }
        public override List<string> GetActions(WorkingUnitEnititiesViewModel obj) {
            throw new NotImplementedException();
        }

        public override HttpResponseMessage ExecuteAction(WorkingUnitEnititiesViewModel obj, string actionId) {
            throw new NotImplementedException();
        }
    }
}
