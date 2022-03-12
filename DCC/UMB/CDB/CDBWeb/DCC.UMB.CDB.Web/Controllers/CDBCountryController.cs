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
    public class CDBCountryController : AbstractCDBWebApiController<CountryViewModel>{
        
        public override string ScreenId
        {
            get
            {
                return "GEO_01";
            }
        }
    
        public override List<CountryViewModel> GetMultiple(CountryViewModel criteria)
        {
            ViewCountrieSQLSelectQuery query = new ViewCountrieSQLSelectQuery();
            query.AddSelectTopNRecords(1000); 
            query.AddOrderByClause(query.country_nm, OrderByTypes.ASC);
            string strQuery = query.LoadCriteriaAndGetQuery(criteria);
            DataSet dset = CDBUtils.GetNewDbManager().ExecuteSQL(strQuery);
            return ModelUtils<CountryViewModel>.CreateObjects(dset);
        }

        public override JObject LookupListing(CountryViewModel criteria)
        {
            criteria.DisplayPropertyName = CountryViewModel.flds.country_nm.ToString();
            criteria.CodePropertyName = CountryViewModel.flds.country_cd.ToString();
            criteria.IdPropertyName = CountryViewModel.flds.country_id.ToString();
            List<CountryViewModel> lst = this.GetMultiple(criteria);
            ListingCreator<CountryViewModel> lc = new ListingCreator<CountryViewModel>(lst);
            lc.AddColumnDefinition("Name", 25, CountryViewModel.flds.Display.ToString(), false);
            lc.AddColumnDefinition("Id", 25, CountryViewModel.flds.Id.ToString(), true);
            lc.AddColumnDefinition("Code", 25, CountryViewModel.flds.country_cd.ToString(), false);
            lc.AddColumnDefinition("Level 1 Title", 0, CountryViewModel.flds.level_1_address_component.ToString(), optimizeSerialization: false);
            lc.AddColumnDefinition("Level 2 Title", 0, CountryViewModel.flds.level_2_address_component.ToString(), optimizeSerialization: false);
            lc.AddColumnDefinition("Level 3 Title", 0, CountryViewModel.flds.level_3_address_component.ToString(), optimizeSerialization: false);
            return lc.CreateListing(this.IsInsertAllowed, this.IsUpdateAllowed, this.IsSelectAllowed, null);
        }

        public override JObject GridListing(CountryViewModel criteria)
        {
            List<CountryViewModel> lst = this.GetMultiple(criteria);
            ListingCreator<CountryViewModel> lc = new ListingCreator<CountryViewModel>(lst);
            lc.AddColumnDefinition("Name", 25, CountryViewModel.flds.Display.ToString(), false);
            lc.AddColumnDefinition("Id", 25, CountryViewModel.flds.Id.ToString(), true);
            lc.AddColumnDefinition("Code", 25, CountryViewModel.flds.country_cd.ToString(), false);
            lc.AddColumnDefinition("Level 1 Title", 0, CountryViewModel.flds.level_1_address_component.ToString(), optimizeSerialization: false);
            lc.AddColumnDefinition("Level 2 Title", 0, CountryViewModel.flds.level_2_address_component.ToString(), optimizeSerialization: false);
            lc.AddColumnDefinition("Level 3 Title", 0, CountryViewModel.flds.level_3_address_component.ToString(), optimizeSerialization: false);
            return lc.CreateListing();
        }

        public override void CreateRecord(CountryViewModel obj)
        {
            Hashtable table = new Hashtable();
            string task = UtilityManager.GetProcedureDbTask(obj, facade, "InsertCountrieAsTask", table);
            facade.AddDbTask(task);
            DataSet dset = facade.ExecuteDbTasks();
            short id = DbManager.GetShort(dset.Tables[0].Rows[0][0]);
            obj.country_id = id;
        }

        public override void UpdateRecord(CountryViewModel obj)
        {
            Hashtable table = new Hashtable();
            string task = UtilityManager.GetProcedureDbTask(obj, facade, "UpdateCountrieAsTask", table);
            facade.AddDbTask(task);
            DataSet dset = facade.ExecuteDbTasks();
        }

        public override string IsValid(CountryViewModel obj)
        {
            string ErrMsg = "";
            return ErrMsg;
        }
       
        public override void DeleteRecord(CountryViewModel obj) 
        {

           
        }
        public override List<string> GetActions(CountryViewModel obj)
        {
            throw new NotImplementedException();
        }

        public override HttpResponseMessage ExecuteAction(CountryViewModel obj, string actionId)
        {
            throw new NotImplementedException();
        }

        public override CountryViewModel Get(string id)
        {
            return GetMultiple(new CountryViewModel() { country_id = short.Parse(id) })[0];
        }

        [HttpGet]
        public List<string> GetCountrySuggestions(string term) {
            DataSet dset = CDBUtils.GetNewDbManager().ExecuteSQL(GetDistinctQuery("country_nm", "countries", term));
            return UtilityManager.GetStringLists(dset.Tables[0], "country_nm");
        }
        private string GetDistinctQuery(string fieldName, string tableName, string term) {
            return string.Format("Select distinct top 20 {0} from {1} where {0} like '{2}%' order by {0}", fieldName, tableName, term);
        }
    }
}
