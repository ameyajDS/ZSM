using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace DCC.UMB.CDF.DB
{
    public class DCCWebSqlDataReader : DCCSqlDataReader
    {
        //This WebDbmanager will work independently for this reader. Each instance of webdbmanager has a dedicated connection
        //opened on the web server (the dbmanager service, identified by guid, which is a property in webdbmanager). 
        WebDbManager webDBManager = null;
        //public DCCWebSqlDataReader(string applicationId, string userRoleId, string dbServerName, string password, string dbServiceURL)
        //{
        //    webDBManager = new WebDbManager(applicationId, userRoleId, dbServerName, password, dbServiceURL);

        //}
        public DCCWebSqlDataReader(WebDbManager underlyingWebDbManager)
        {
            this.webDBManager = underlyingWebDbManager;

        }

        internal override bool IsClosed
        {
            get { return this.webDBManager.IsReaderClosed; }
        }
        internal override DataTable GetSchemaTable()
        {
            return this.webDBManager.GetSchemaTableOfCurrentReader();
        }
        internal override DataTable ReadNextBucketFromBrowseModeDataReader(int bucketSize)
        {
            return this.webDBManager.ReadNextBucketFromBrowseModeDataReader(bucketSize);
        }
        internal override void CloseReaderAndConnection()
        {
            this.webDBManager.CloseReaderAndConnection();
        }

    }
}

