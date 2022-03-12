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
    public class MeasuringUnitsController : AbstractCDBWebApiController<Measuring_unit>
    {
        public override string ScreenId
        {
            get { return null; }
        }

        public override List<Measuring_unit> GetMultiple(Measuring_unit criteria)
        {
            Measuring_unitsSQLSelectQuery query = new Measuring_unitsSQLSelectQuery();
            query.AddOrderByClause(query.measuring_unit_nm, OrderByTypes.ASC);
            if (!string.IsNullOrEmpty(criteria.GetKeyValue("TYPES"))){
                string[] types = criteria.GetKeyValue("TYPES").Split(',');
                query.type_of_unit.In(types);
            }
            string strQuery = query.LoadCriteriaAndGetQuery(criteria);
            DataSet dset = CDBUtils.GetNewDbManager().ExecuteSQL(strQuery);
            return ModelUtils<Measuring_unit>.CreateObjects(dset);
        }

        public override JObject LookupListing(Measuring_unit criteria)
        {
            criteria.DisplayPropertyName = Measuring_unit.flds.measuring_unit_nm.ToString();
            criteria.IdPropertyName = Measuring_unit.flds.measuring_unit_id.ToString();
            criteria.IdPropertyName = Measuring_unit.flds.measuring_unit_cd.ToString();

            List<Measuring_unit> lst = this.GetMultiple(criteria);
            ListingCreator<Measuring_unit> lc = new ListingCreator<Measuring_unit>(lst);
            lc.AddColumnDefinition("Name", 25, Measuring_unit.flds.Display.ToString(), false);
            lc.AddColumnDefinition("Id", 25, Measuring_unit.flds.Id.ToString(), true);
            return lc.CreateListing(this.IsInsertAllowed, this.IsUpdateAllowed, this.IsSelectAllowed, null);
        }

        public override List<BaseEntity> ComboListing(Measuring_unit criteria) {
            return GetMultiple(criteria).Cast<BaseEntity>().ToList();
        }

        public override JObject GridListing(Measuring_unit criteria) {
            List<Measuring_unit> lstObjects = this.GetMultiple(criteria);

            ListingCreator<Measuring_unit> lc = new ListingCreator<Measuring_unit>(lstObjects);
            lc.AddColumnDefinition("Name", 25, Measuring_unit.flds.Display.ToString(), false);
            lc.AddColumnDefinition("Id", 25, Measuring_unit.flds.Id.ToString(), true);
            return lc.CreateListing();
        }
        
        public override void DeleteRecord(Measuring_unit obj) {

            throw new NotImplementedException();
        }       

        public override Measuring_unit Get(string id) {
            return GetMultiple(new Measuring_unit() { measuring_unit_id = short.Parse(id) })[0];
        }
        public override List<string> GetActions(Measuring_unit obj) {
            throw new NotImplementedException();
        }

        public override HttpResponseMessage ExecuteAction(Measuring_unit obj, string actionId) {
            throw new NotImplementedException();
        }
    }
}
