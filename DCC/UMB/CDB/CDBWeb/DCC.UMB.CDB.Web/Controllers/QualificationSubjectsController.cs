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
    public class QualificationSubjectsController : AbstractCDBWebApiController<QualificationSubjectViewModel>
    {
        public override string ScreenId
        {
            get { return null; }
        }

        public override List<QualificationSubjectViewModel> GetMultiple(QualificationSubjectViewModel criteria)
        {
            ViewQualificationSubjectsSQLSelectQuery query = new ViewQualificationSubjectsSQLSelectQuery();
            string qualificationId = criteria.GetKeyValue("QUALIFICATION_ID");
            if (!string.IsNullOrEmpty(qualificationId)){
                query.qualification_id.Equal(qualificationId);
            }
            query.AddOrderByClause(query.qlfctn_subject_nm, OrderByTypes.ASC);
            string strQuery = query.LoadCriteriaAndGetQuery(criteria);
            DataSet dset = CDBUtils.GetNewDbManager().ExecuteSQL(strQuery);
            return ModelUtils<QualificationSubjectViewModel>.CreateObjects(dset);
        }

        public override JObject LookupListing(QualificationSubjectViewModel criteria)
        {
            criteria.DisplayPropertyName = QualificationSubjectViewModel.flds.qlfctn_subject_nm.ToString();
            criteria.IdPropertyName = QualificationSubjectViewModel.flds.qlfctn_subject_id.ToString();
            criteria.CodePropertyName = QualificationSubjectViewModel.flds.qlfctn_subject_cd.ToString();

            List<QualificationSubjectViewModel> lst = this.GetMultiple(criteria);
            ListingCreator<QualificationSubjectViewModel> lc = new ListingCreator<QualificationSubjectViewModel>(lst);
            lc.AddColumnDefinition("Name", 25, QualificationSubjectViewModel.flds.Display.ToString(), false);            
            lc.AddColumnDefinition("Id", 25, QualificationSubjectViewModel.flds.Id.ToString(), true);
            return lc.CreateListing(this.IsInsertAllowed, this.IsUpdateAllowed, this.IsSelectAllowed, null);
        }

        public override List<BaseEntity> ComboListing(QualificationSubjectViewModel criteria) {
            return GetMultiple(criteria).Cast<BaseEntity>().ToList();
        }

        public override JObject GridListing(QualificationSubjectViewModel criteria) {
            List<QualificationSubjectViewModel> lstRelations = this.GetMultiple(criteria);

            ListingCreator<QualificationSubjectViewModel> lc = new ListingCreator<QualificationSubjectViewModel>(lstRelations);
            lc.AddColumnDefinition("Name", 25, QualificationSubjectViewModel.flds.Display.ToString(), false);
            lc.AddColumnDefinition("Id", 25, QualificationSubjectViewModel.flds.Id.ToString(), true);
            return lc.CreateListing();
        }
        
        public override void DeleteRecord(QualificationSubjectViewModel obj) {

            throw new NotImplementedException();
        }       

        public override QualificationSubjectViewModel Get(string id) {
            return GetMultiple(new QualificationSubjectViewModel() { qlfctn_subject_id = short.Parse(id) })[0];
        }
        public override List<string> GetActions(QualificationSubjectViewModel obj) {
            throw new NotImplementedException();
        }

        public override HttpResponseMessage ExecuteAction(QualificationSubjectViewModel obj, string actionId) {
            throw new NotImplementedException();
        }
    }
}
