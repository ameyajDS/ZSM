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

    // Vinod - added for society combo but currently not in use as we are using society controller in edn which is having additional society info
    public class CDBSocietyController : CDBAbstractLookupController<Society> {
        public override string ScreenId {
            get {
                return null;
            }
        }
        public override List<Society> GetMultiple(Society criteria) {
            SocietiesSQLSelectQuery query = new SocietiesSQLSelectQuery();
            query.AddOrderByClause(query.society_nm, OrderByTypes.ASC);
            string strQuery = query.LoadCriteriaAndGetQuery(criteria);                   
            DataSet dset = CDBUtils.GetNewDbManager().ExecuteSQL(strQuery);            
            return ModelUtils<Society>.CreateObjects(dset);
        }

       
        public override JObject LookupListing(Society criteria) {
            criteria.DisplayPropertyName = Society.flds.society_nm.ToString();
            criteria.CodePropertyName = Society.flds.society_nm.ToString();
            criteria.IdPropertyName = Society.flds.society_id.ToString();

            List<Society> lst = this.GetMultiple(criteria);
            ListingCreator<Society> lc = new ListingCreator<Society>(lst);
            lc.AddColumnDefinition("Name", 25, Society.flds.Display.ToString(), false);
            lc.AddColumnDefinition("Id", 25, Society.flds.Id.ToString(), true);
            return lc.CreateListing(this.IsInsertAllowed, this.IsUpdateAllowed, this.IsSelectAllowed, null);
        }
        public override List<BaseEntity> ComboListing(Society criteria) {
            return GetMultiple(criteria).Cast<BaseEntity>().ToList();
        }
    }
}
