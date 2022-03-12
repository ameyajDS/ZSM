using DCC.CDB.DBFacade;
using DCC.UMB.WDF.Controllers;
using DCC.UMB.WDF.DB;
using DCC.UMB.WDF.Models.Record;
using DCC.UMB.WDF.Providers;
using DCC.UMB.WDF.Utils;
using Newtonsoft.Json.Linq;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace DCC.UMB.CDB.Web.Controllers
{
    public abstract class AbstractCDBWebApiController<T> : WDFAbstractAPIController<T> where T : BaseEntity
    {
        protected CDB_APPDbFacade facade = null;

        public override IDBFacade Facade{
            get { return this.facade; }
        }

        public AbstractCDBWebApiController()
        {
            if(facade == null)
                facade = CDBUtils.GetCDBFacade();
        }
        

        public virtual void CreateRecord(T obj)
        {
            throw new Exception("Child Screen must implement this method 'CreateRecord'");
        }
        public virtual void UpdateRecord(T obj)
        {
            throw new Exception("Child Screen must implement this method 'UpdateRecord'");
        }
        public virtual void DeleteRecord(T obj)
        {
            throw new Exception("Child Screen must implement this method 'DeleteRecord'");
        }
        public virtual string IsValid(T obj)
        {
            return string.Empty;
        }
        private static long BeginTrans(CDB_APPDbFacade facade, int userNo, string applicationId, string userRoleId, string auditedObjectId, AuditableActions action, string screenId)
        {
            try
            {
                facade.ObjDBManager.BeginTrans();
                long audit_log_id = 0;
                //this.InsertAuditLog(ref audit_log_id, userNo, auditedObjectId, action.ToString().Substring(0, 1), userRoleId, applicationId, screenId);
                //facade.ObjDBManager.AuditLogId = audit_log_id;
                facade.ObjDBManager.AuditLogId = null;
                return audit_log_id;
            }
            catch (Exception ex)
            {
                facade.ObjDBManager.RollbackTrans();
                throw ex;
            }
        }
        public static long BeginTran(CDB_APPDbFacade facade, string auditObjectId, string screenId, AuditableActions action)
        {
            DCCMembershipUser dccMembershipUser = (DCCMembershipUser)Membership.GetUser();
            if (dccMembershipUser != null)
            {
                return BeginTrans(facade, dccMembershipUser.UserNo,
                    AppContextManager.Instance.GetApplication().application_id,
                    AppContextManager.Instance.GetCurrentUserRole(),
                    auditObjectId, action,
                    screenId);
            }
            else
            {
                throw new Exception("The Membership User cant be null while starting a transaction with audit log");
            }
        }

        public override HttpResponseMessage Delete(T obj)
        {
            long auditLogId = BeginTran(facade, obj.AuditObjectId, this.ScreenId, AuditableActions.Delete);
            try
            {
                this.DeleteRecord(obj);
                facade.CommitTrans(obj.AuditObjectId);
                return this.CreateSuccessDeletedResponse(obj.Id);
            }
            catch (Exception ex)
            {
                facade.RollbackTrans();
                return this.CreateExceptionResponse(ex);
            }
           
        }
        public override HttpResponseMessage Save(T obj)
        {
            string errMsg = this.IsValid(obj);
            if (!string.IsNullOrEmpty(errMsg))
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest, errMsg);
            }
            try
            {
               long auditLogId = BeginTran(facade, obj.AuditObjectId, this.ScreenId, 
                    string.IsNullOrEmpty(obj.Id) ? AuditableActions.Insert : AuditableActions.Update);
                if (string.IsNullOrEmpty(obj.Id))
                {
                    CreateRecord(obj);
                }
                else
                {//case of update
                    UpdateRecord(obj);
                }
                if (auditLogId == 0)
                    facade.CommitTrans();
                else
                    facade.CommitTrans(obj.AuditObjectId);
                return this.CreateSuccessSaveResponse(obj.Id);
            }
            catch (Exception ex)
            {
                facade.RollbackTrans();
                return this.CreateExceptionResponse(ex);
            }
        }


        public override JObject GridListing(T criteria)
        {
            throw new NotImplementedException();
        }
        public override List<BaseEntity> ComboListing(T criteria)
        {
            return GetMultiple(criteria).Cast<BaseEntity>().ToList();
        }
        public override JObject LookupListing(T criteria)
        {
            throw new Exception("Not implemented");
        }
    }
}
