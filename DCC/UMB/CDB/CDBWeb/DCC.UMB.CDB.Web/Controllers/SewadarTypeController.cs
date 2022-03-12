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
    public class SewadarTypeController : AbstractCDBWebApiController<Sewadar_type>
    {
        public override string ScreenId
        {
            get
            {
                return null;
            }
        }

        public override List<Sewadar_type> GetMultiple(Sewadar_type criteria)
        {
            Sewadar_typesSQLSelectQuery query = new Sewadar_typesSQLSelectQuery();
            
            query.AddOrderByClause(query.sewadartype_nm, OrderByTypes.ASC);
            string strQuery = query.LoadCriteriaAndGetQuery(criteria);
            DataSet dset = CDBUtils.GetNewDbManager().ExecuteSQL(strQuery);
            return ModelUtils<Sewadar_type>.CreateObjects(dset);
        }

        public override JObject LookupListing(Sewadar_type criteria)
        {
            criteria.DisplayPropertyName = Sewadar_type.flds.sewadartype_nm.ToString();
            criteria.IdPropertyName = Sewadar_type.flds.sewadartype_id.ToString();

            List<Sewadar_type> lst = this.GetMultiple(criteria);
            ListingCreator<Sewadar_type> lc = new ListingCreator<Sewadar_type>(lst);
            lc.AddColumnDefinition("Name", 25, Sewadar_type.flds.Display.ToString(), false);            
            lc.AddColumnDefinition("Id", 25, Sewadar_type.flds.Id.ToString(), true);
            return lc.CreateListing();
        }

        public override List<BaseEntity> ComboListing(Sewadar_type criteria) {
            return GetMultiple(criteria).Cast<BaseEntity>().ToList();
        }

        public override JObject GridListing(Sewadar_type criteria) {
            List<Sewadar_type> lstRelations = this.GetMultiple(criteria);

            ListingCreator<Sewadar_type> lc = new ListingCreator<Sewadar_type>(lstRelations);
            lc.AddColumnDefinition("Name", 25, Sewadar_type.flds.Display.ToString(), false);
            lc.AddColumnDefinition("Id", 25, Sewadar_type.flds.Id.ToString(), true);
            return lc.CreateListing();
        }
        public override void CreateRecord(Sewadar_type obj){
            
        }

        public override void UpdateRecord(Sewadar_type obj) {
            
        }
        public string IsValid(Sewadar_type obj){
            return "";
        }
        public override void DeleteRecord(Sewadar_type obj) {

            
        }       

        public override Sewadar_type Get(string id) {
            return GetMultiple(new Sewadar_type() { sewadartype_id= short.Parse(id) })[0];
        }
        public override List<string> GetActions(Sewadar_type obj) {
            throw new NotImplementedException();
        }

        public override HttpResponseMessage ExecuteAction(Sewadar_type obj, string actionId) {
            throw new NotImplementedException();
        }
    }
}
