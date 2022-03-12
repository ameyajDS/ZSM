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


namespace DCC.UMB.CDB.Web.Controllers
{   
    public class CDBOccupationController : CDBAbstractLookupController<Occupation>
    {
        public override string ScreenId
        {
            get
            {
                return null;
            }
        }
        public override List<Occupation> GetMultiple(Occupation criteria)
        {
            OccupationsSQLSelectQuery query = new OccupationsSQLSelectQuery();
            query.AddSelectTopNRecords(1000); 
            query.AddOrderByClause(query.occupation_nm, OrderByTypes.ASC);
            string strQuery = query.LoadCriteriaAndGetQuery(criteria);
            DataSet dset = CDBUtils.GetNewDbManager().ExecuteSQL(strQuery);
            return ModelUtils<Occupation>.CreateObjects(dset);
        }

        public override JObject LookupListing(Occupation criteria)
        {
            criteria.DisplayPropertyName = Occupation.flds.occupation_nm.ToString();
            criteria.CodePropertyName = Occupation.flds.occupation_cd.ToString();
            criteria.IdPropertyName = Occupation.flds.occupation_id.ToString();
            List<Occupation> lst = this.GetMultiple(criteria);
            ListingCreator<Occupation> lc = new ListingCreator<Occupation>(lst);            
            lc.AddColumnDefinition("Name", 50, Occupation.flds.occupation_nm.ToString(), false);
            lc.AddColumnDefinition("Id", 25, Occupation.flds.occupation_id.ToString(), true);
            lc.AddColumnDefinition("Code", 50, Occupation.flds.occupation_cd.ToString(), false);
            return lc.CreateListing(this.IsInsertAllowed, this.IsUpdateAllowed, this.IsSelectAllowed, null);
        }

        public override List<BaseEntity> ComboListing(Occupation criteria)
        {
            return GetMultiple(criteria).Cast<BaseEntity>().ToList();
        }
    }
}
