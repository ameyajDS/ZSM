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
    public class CDBWorkingUnitController : AbstractCDBWebApiController<WorkingUnitViewModel>
    {
        protected static log4net.ILog log = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        public override string ScreenId
        {
            get
            {                
                return "CDB_02";
            }
        }

        public override List<WorkingUnitViewModel> GetMultiple(WorkingUnitViewModel criteria)
        {
            ViewWorkingUnitSQLSelectQuery query = new ViewWorkingUnitSQLSelectQuery();
            query.AddSelectTopNRecords(1000); 
            query.AddOrderByClause(query.working_unit_nm, OrderByTypes.ASC);
            string strQuery = query.LoadCriteriaAndGetQuery(criteria);
            DataSet dset = CDBUtils.GetNewDbManager().ExecuteSQL(strQuery);
            return ModelUtils<WorkingUnitViewModel>.CreateObjects(dset);
        }

        public override JObject LookupListing(WorkingUnitViewModel criteria)
        {
            criteria.DisplayPropertyName = WorkingUnitViewModel.flds.working_unit_nm.ToString();
            criteria.CodePropertyName = WorkingUnitViewModel.flds.working_unit_cd.ToString();
            criteria.IdPropertyName = WorkingUnitViewModel.flds.working_unit_id.ToString();

            List<WorkingUnitViewModel> lst = this.GetMultiple(criteria);
            ListingCreator<WorkingUnitViewModel> lc = new ListingCreator<WorkingUnitViewModel>(lst);
            lc.AddColumnDefinition("Name", 25, WorkingUnitViewModel.flds.Display.ToString(), false);            
            lc.AddColumnDefinition("Code", 25, WorkingUnitViewModel.flds.working_unit_cd.ToString(), true);
            lc.AddColumnDefinition("Id", 25, WorkingUnitViewModel.flds.Id.ToString(), true);
            return lc.CreateListing(this.IsInsertAllowed, this.IsUpdateAllowed, this.IsSelectAllowed, null);
        }

        public override List<BaseEntity> ComboListing(WorkingUnitViewModel criteria) {
            return GetMultiple(criteria).Cast<BaseEntity>().ToList();
        }

        public override JObject GridListing(WorkingUnitViewModel criteria) {
            List<WorkingUnitViewModel> lstRelations = this.GetMultiple(criteria);

            ListingCreator<WorkingUnitViewModel> lc = new ListingCreator<WorkingUnitViewModel>(lstRelations);
            lc.AddColumnDefinition("Name", 25, WorkingUnitViewModel.flds.Display.ToString(), false);
            lc.AddColumnDefinition("Id", 25, WorkingUnitViewModel.flds.Id.ToString(), true);
            return lc.CreateListing();
        }

        public override void CreateRecord(WorkingUnitViewModel obj) {
            Hashtable table = new Hashtable();
            string task = UtilityManager.GetProcedureDbTask(obj, facade, "InsertWorkingUnitAsTask", table);
            facade.AddDbTask(task);
            DataSet dset = facade.ExecuteDbTasks();
            short id = DbManager.GetShort(dset.Tables[0].Rows[0][0]);
            obj.working_unit_id = id;
        }

        public override void UpdateRecord(WorkingUnitViewModel obj) {
            Hashtable table = new Hashtable();
            string task = UtilityManager.GetProcedureDbTask(obj, facade, "UpdateWorkingUnitAsTask", table);
            facade.AddDbTask(task);
            DataSet dset = facade.ExecuteDbTasks();
        }
        public string IsValid(WorkingUnitViewModel obj) {
            string ErrMsg = "";
            return ErrMsg;
        }
        public override void DeleteRecord(WorkingUnitViewModel obj) {

             Hashtable table = new Hashtable();
             string task = UtilityManager.GetProcedureDbTask(obj, facade, "DeleteWorkingUnitAsTask", table);
            facade.AddDbTask(task);
            DataSet dset = facade.ExecuteDbTasks();
        }       

        public override WorkingUnitViewModel Get(string id) {
            return GetMultiple(new WorkingUnitViewModel() { working_unit_id = short.Parse(id) })[0];
        }
        public override List<string> GetActions(WorkingUnitViewModel obj) {
            throw new NotImplementedException();
        }

        public override HttpResponseMessage ExecuteAction(WorkingUnitViewModel obj, string actionId) {
            throw new NotImplementedException();
        }
    }
}
