using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DCC.CDB.DBFacade;
using DCC.UMB.WDF.Controllers;
using DCC.UMB.WDF.DB;
using DCC.UMB.WDF.Models.Record;
using Newtonsoft.Json.Linq;

namespace DCC.UMB.CDB.Web.Controllers {
    public abstract class CDBAbstractLookupController<T> : WDFAbstractAPIController<T> where T : BaseEntity {
        protected CDB_APPDbFacade facade=CDBUtils.GetCDBFacade();

        public override IDBFacade Facade{
            get { return this.facade; }
        }

        public override HttpResponseMessage Save(T obj) {
            throw new NotImplementedException("Lookup cant implement save");
        }
        public override T Get(string id) {
            throw new NotImplementedException("Child class shoudl implemente it");
        }
        public override HttpResponseMessage Delete(T obj) {
            throw new NotImplementedException("Lookup cant implement delete");
        }

        public override List<string> GetActions(T obj) {
            throw new NotImplementedException("Lookup cant have actions");
        }

       public override HttpResponseMessage ExecuteAction(T obj, string actionId) {
            throw new NotImplementedException("Lookup cant have actions");
        }
        public override JObject GridListing(T criteria) {
            throw new NotImplementedException();
        }
        public override List<BaseEntity> ComboListing(T criteria) {
            throw new Exception("Not implemented");
        }
        public override JObject LookupListing(T criteria) {
            throw new Exception("Not implemented");
        }
    }
}
