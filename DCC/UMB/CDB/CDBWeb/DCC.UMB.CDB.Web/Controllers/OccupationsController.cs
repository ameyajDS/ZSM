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
    public class OccupationsController : AbstractCDBWebApiController<OccupationViewModel>
    {
        public override string ScreenId
        {
            get { return null; }
        }

        public override List<OccupationViewModel> GetMultiple(OccupationViewModel criteria)
        {
            OccupationsSQLSelectQuery query = new OccupationsSQLSelectQuery();
            query.AddOrderByClause(query.occupation_nm, OrderByTypes.ASC);
            string strQuery = query.LoadCriteriaAndGetQuery(criteria);
            DataSet dset = CDBUtils.GetNewDbManager().ExecuteSQL(strQuery);
            return ModelUtils<OccupationViewModel>.CreateObjects(dset);
        }

        public override JObject LookupListing(OccupationViewModel criteria)
        {
            criteria.DisplayPropertyName = OccupationViewModel.flds.occupation_nm.ToString();
            criteria.IdPropertyName = OccupationViewModel.flds.occupation_id.ToString();
            criteria.IdPropertyName = OccupationViewModel.flds.occupation_cd.ToString();

            List<OccupationViewModel> lst = this.GetMultiple(criteria);
            ListingCreator<OccupationViewModel> lc = new ListingCreator<OccupationViewModel>(lst);
            lc.AddColumnDefinition("Name", 25, OccupationViewModel.flds.Display.ToString(), false);
            lc.AddColumnDefinition("Id", 25, OccupationViewModel.flds.Id.ToString(), true);
            return lc.CreateListing(this.IsInsertAllowed, this.IsUpdateAllowed, this.IsSelectAllowed, null);
        }

        public override List<BaseEntity> ComboListing(OccupationViewModel criteria) {
            return GetMultiple(criteria).Cast<BaseEntity>().ToList();
        }

        public override JObject GridListing(OccupationViewModel criteria) {
            List<OccupationViewModel> lstRelations = this.GetMultiple(criteria);

            ListingCreator<OccupationViewModel> lc = new ListingCreator<OccupationViewModel>(lstRelations);
            lc.AddColumnDefinition("Name", 25, OccupationViewModel.flds.Display.ToString(), false);
            lc.AddColumnDefinition("Id", 25, OccupationViewModel.flds.Id.ToString(), true);
            return lc.CreateListing();
        }
        
        public override void DeleteRecord(OccupationViewModel obj) {

            throw new NotImplementedException();
        }       

        public override OccupationViewModel Get(string id) {
            return GetMultiple(new OccupationViewModel() { occupation_id = short.Parse(id) })[0];
        }
        public override List<string> GetActions(OccupationViewModel obj) {
            throw new NotImplementedException();
        }

        public override HttpResponseMessage ExecuteAction(OccupationViewModel obj, string actionId) {
            throw new NotImplementedException();
        }
    }
}
