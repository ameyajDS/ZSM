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
    public class QualificationsController : AbstractCDBWebApiController<QualificationViewModel>
    {
        public override string ScreenId
        {
            get { return null; }
        }

        public override List<QualificationViewModel> GetMultiple(QualificationViewModel criteria)
        {
            QualificationsSQLSelectQuery query = new QualificationsSQLSelectQuery();
            query.AddOrderByClause(query.qualification_nm, OrderByTypes.ASC);
            string strQuery = query.LoadCriteriaAndGetQuery(criteria);
            DataSet dset = CDBUtils.GetNewDbManager().ExecuteSQL(strQuery);
            return ModelUtils<QualificationViewModel>.CreateObjects(dset);
        }

        public override JObject LookupListing(QualificationViewModel criteria)
        {
            criteria.DisplayPropertyName = QualificationViewModel.flds.qualification_nm.ToString();
            criteria.IdPropertyName = QualificationViewModel.flds.qualification_id.ToString();
            criteria.CodePropertyName = QualificationViewModel.flds.qualification_cd.ToString();

            List<QualificationViewModel> lst = this.GetMultiple(criteria);
            ListingCreator<QualificationViewModel> lc = new ListingCreator<QualificationViewModel>(lst);
            lc.AddColumnDefinition("Name", 25, QualificationViewModel.flds.Display.ToString(), false);            
            lc.AddColumnDefinition("Id", 25, QualificationViewModel.flds.Id.ToString(), true);
            return lc.CreateListing(this.IsInsertAllowed, this.IsUpdateAllowed, this.IsSelectAllowed, null);
        }

        public override List<BaseEntity> ComboListing(QualificationViewModel criteria) {
            return GetMultiple(criteria).Cast<BaseEntity>().ToList();
        }

        public override JObject GridListing(QualificationViewModel criteria) {
            List<QualificationViewModel> lstRelations = this.GetMultiple(criteria);

            ListingCreator<QualificationViewModel> lc = new ListingCreator<QualificationViewModel>(lstRelations);
            lc.AddColumnDefinition("Name", 25, QualificationViewModel.flds.Display.ToString(), false);
            lc.AddColumnDefinition("Id", 25, QualificationViewModel.flds.Id.ToString(), true);
            return lc.CreateListing();
        }
        
        public override void DeleteRecord(QualificationViewModel obj) {

            throw new NotImplementedException();
        }       

        public override QualificationViewModel Get(string id) {
            return GetMultiple(new QualificationViewModel() { qualification_id = short.Parse(id) })[0];
        }
        public override List<string> GetActions(QualificationViewModel obj) {
            throw new NotImplementedException();
        }

        public override HttpResponseMessage ExecuteAction(QualificationViewModel obj, string actionId) {
            throw new NotImplementedException();
        }
    }
}
