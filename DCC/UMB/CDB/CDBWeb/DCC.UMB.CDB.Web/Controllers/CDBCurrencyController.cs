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


namespace DCC.UMB.CDB.Web.Controllers {

    // Vinod - added for Currency combo but currently not in use as we are using Currency controller in edn which is having additional Currency info
    public class CDBCurrencyController : CDBAbstractLookupController<Currency> {
        public override string ScreenId {
            get {
                return null;
            }
        }
        public override List<Currency> GetMultiple(Currency criteria) {
            CurrenciesSQLSelectQuery query = new CurrenciesSQLSelectQuery();
            if (!string.IsNullOrEmpty(criteria.GetKeyValue("EXCLUDED_CURRENCY_CODES"))) {
                query.currency_cd.NotEqual(criteria.GetKeyValue("EXCLUDED_CURRENCY_CODES"));//exclude all those currencies which are specified in the request
            }
            
            query.AddOrderByClause(query.currency_nm, OrderByTypes.ASC);
            string strQuery = query.LoadCriteriaAndGetQuery(criteria);
            DataSet dset = CDBUtils.GetNewDbManager().ExecuteSQL(strQuery);
            return ModelUtils<Currency>.CreateObjects(dset);
        }
        public override JObject LookupListing(Currency criteria) {
            criteria.DisplayPropertyName = Currency.flds.currency_nm.ToString();
            criteria.CodePropertyName = Currency.flds.currency_cd.ToString();
            criteria.IdPropertyName = Currency.flds.currency_id.ToString();
            List<Currency> lstCountries = this.GetMultiple(criteria);
            ListingCreator<Currency> lc = new ListingCreator<Currency>(lstCountries);
            lc.AddColumnDefinition("Name", 25, Currency.flds.Display.ToString(), false);
            lc.AddColumnDefinition("Code", 25, Currency.flds.currency_cd.ToString(), false,true);
            lc.AddColumnDefinition("Symbol", 25, Currency.flds.currency_abbr.ToString(), false,true);
            lc.AddColumnDefinition("Id", 25, Currency.flds.Id.ToString(), true);
            return lc.CreateListing(this.IsInsertAllowed, this.IsUpdateAllowed, this.IsSelectAllowed, null);
        }
        public override List<BaseEntity> ComboListing(Currency criteria) {
            return GetMultiple(criteria).Cast<BaseEntity>().ToList();
        }
    }
}
