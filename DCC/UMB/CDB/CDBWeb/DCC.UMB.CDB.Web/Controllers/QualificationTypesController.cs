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
    public class QualificationTypesController : AbstractCDBWebApiController<QualificationTypeViewModel>
    {
        public override string ScreenId
        {
            get { return null; }
        }

        public override List<QualificationTypeViewModel> GetMultiple(QualificationTypeViewModel criteria)
        {
            Qualification_typesSQLSelectQuery query = new Qualification_typesSQLSelectQuery();
            query.AddOrderByClause(query.qualification_type_sq, OrderByTypes.ASC);
            string strQuery = query.LoadCriteriaAndGetQuery(criteria);
            DataSet dset = CDBUtils.GetNewDbManager().ExecuteSQL(strQuery);
            return ModelUtils<QualificationTypeViewModel>.CreateObjects(dset);
        }

        public override JObject LookupListing(QualificationTypeViewModel criteria)
        {
            criteria.DisplayPropertyName = QualificationTypeViewModel.flds.qualification_type.ToString();
            criteria.IdPropertyName = QualificationTypeViewModel.flds.qualification_type.ToString();

            List<QualificationTypeViewModel> lst = this.GetMultiple(criteria);
            ListingCreator<QualificationTypeViewModel> lc = new ListingCreator<QualificationTypeViewModel>(lst);
            lc.AddColumnDefinition("Name", 25, QualificationTypeViewModel.flds.Display.ToString(), false);
            lc.AddColumnDefinition("Id", 25, QualificationTypeViewModel.flds.Id.ToString(), true);
            return lc.CreateListing(this.IsInsertAllowed, this.IsUpdateAllowed, this.IsSelectAllowed, null);
        }

        public override List<BaseEntity> ComboListing(QualificationTypeViewModel criteria) {
            return GetMultiple(criteria).Cast<BaseEntity>().ToList();
        }

        public override JObject GridListing(QualificationTypeViewModel criteria) {
            List<QualificationTypeViewModel> lstRelations = this.GetMultiple(criteria);

            ListingCreator<QualificationTypeViewModel> lc = new ListingCreator<QualificationTypeViewModel>(lstRelations);
            lc.AddColumnDefinition("Name", 25, QualificationTypeViewModel.flds.Display.ToString(), false);
            lc.AddColumnDefinition("Id", 25, QualificationTypeViewModel.flds.Id.ToString(), true);
            return lc.CreateListing();
        }
        
        public override void DeleteRecord(QualificationTypeViewModel obj) {

            throw new NotImplementedException();
        }       

        public override QualificationTypeViewModel Get(string id) {
            return GetMultiple(new QualificationTypeViewModel() { qualification_type = id })[0];
        }
        public override List<string> GetActions(QualificationTypeViewModel obj) {
            throw new NotImplementedException();
        }

        public override HttpResponseMessage ExecuteAction(QualificationTypeViewModel obj, string actionId) {
            throw new NotImplementedException();
        }
    }
}
