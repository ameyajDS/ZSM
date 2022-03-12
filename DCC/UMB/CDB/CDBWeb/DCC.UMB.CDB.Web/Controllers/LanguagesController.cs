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
    public class LanguagesController : AbstractCDBWebApiController<Language>
    {
        public override string ScreenId
        {
            get { return null; }
        }

        public override List<Language> GetMultiple(Language criteria)
        {
            LanguagesSQLSelectQuery query = new LanguagesSQLSelectQuery();
            query.AddOrderByClause(query.Language_Nm, OrderByTypes.ASC);
            string strQuery = query.LoadCriteriaAndGetQuery(criteria);
            DataSet dset = CDBUtils.GetNewDbManager().ExecuteSQL(strQuery);
            return ModelUtils<Language>.CreateObjects(dset);
        }

        public override JObject LookupListing(Language criteria)
        {
            criteria.DisplayPropertyName = Language.flds.Language_Nm.ToString();
            criteria.IdPropertyName = Language.flds.Language_Id.ToString();
            criteria.CodePropertyName = Language.flds.Language_Cd.ToString();

            List<Language> lst = this.GetMultiple(criteria);
            ListingCreator<Language> lc = new ListingCreator<Language>(lst);
            lc.AddColumnDefinition("Name", 25, Language.flds.Display.ToString(), false);            
            lc.AddColumnDefinition("Id", 25, Language.flds.Id.ToString(), true);
            return lc.CreateListing(this.IsInsertAllowed, this.IsUpdateAllowed, this.IsSelectAllowed, null);
        }

        public override List<BaseEntity> ComboListing(Language criteria) {
            return GetMultiple(criteria).Cast<BaseEntity>().ToList();
        }

        public override JObject GridListing(Language criteria) {
            List<Language> lstRelations = this.GetMultiple(criteria);

            ListingCreator<Language> lc = new ListingCreator<Language>(lstRelations);
            lc.AddColumnDefinition("Name", 25, Language.flds.Display.ToString(), false);
            lc.AddColumnDefinition("Id", 25, Language.flds.Id.ToString(), true);
            return lc.CreateListing();
        }
        
        public override void DeleteRecord(Language obj) {

            throw new NotImplementedException();
        }       

        public override Language Get(string id) {
            return GetMultiple(new Language() { Language_Id = short.Parse(id) })[0];
        }
        public override List<string> GetActions(Language obj) {
            throw new NotImplementedException();
        }

        public override HttpResponseMessage ExecuteAction(Language obj, string actionId) {
            throw new NotImplementedException();
        }
    }
}
