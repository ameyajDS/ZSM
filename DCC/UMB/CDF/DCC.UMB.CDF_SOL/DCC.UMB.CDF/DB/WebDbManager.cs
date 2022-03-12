using System;
using System.Data;
using System.Data.Common;
using System.Collections.Generic;
using System.Net;
using System.Text;
using System.Windows.Forms;
using System.Xml;
using System.Data.Sql;
using System.Data.SqlClient;
using DCC.UMB.CDF.Log;
using System.Linq;
using DCC.UMB.CDF.MGMT.Controller;
using DCC.UMB.CDF.Configuration;
using DCC.UMB.CDF.MGMT.Global;

namespace DCC.UMB.CDF.DB
{
    public class WebDbManager : IDbManager
    {
        private string applicationId;
        private static bool isValidated = true;
        private bool isLoggingEnabled = true;

        /// This variable is the identity of this webdbmanager on the web-server (the dbmanager web service. For each
        /// instance of this class, the webservice holds a dedicated sql connection identified by this guid.        
        private string guid;
        private string userRoleId, dbServerName, password, dbServiceURL;
        private DCC.UMB.CDF.DbManagerWebService.DBManagerWS objDbManagerWS;
        private System.Windows.Forms.Timer keepLiveTimer = new Timer();

        public WebDbManager(string anApplicationId, string anUserRoleId, string aDBServerName, string aPassword, string aDBServiceURL)
        {
            if (!WebDbManager.isValidated)
            {
                string input = Microsoft.VisualBasic.Interaction.InputBox("Please provide validation code", "CDF Validation", "<Validation Code>", 100, 100);
                if (input == "CDF@1234")
                {
                    WebDbManager.isValidated = true;
                }
                else
                {
                    MessageBox.Show("Invalid Validation Code, exiting");
                    Application.Exit();
                    throw new Exception("Invalid validation code found");
                }
            }
            this.applicationId = anApplicationId;
            this.userRoleId = anUserRoleId;
            this.dbServerName = aDBServerName;
            this.password = aPassword;
            this.dbServiceURL = aDBServiceURL;
            this.guid = Guid.NewGuid().ToString();
            objDbManagerWS = new DCC.UMB.CDF.DbManagerWebService.DBManagerWS();            
            objDbManagerWS.Url = dbServiceURL;
            //objDbManagerWS.UnsafeAuthenticatedConnectionSharing = true;
            //string s = objDbManagerWS.Ping();
            objDbManagerWS.CreateConnection(guid, applicationId, userRoleId, dbServerName,
                                            System.Environment.MachineName);
            keepLiveTimer.Interval = 1000 * 5 * 60;
            keepLiveTimer.Tick += new EventHandler(keepLiveTimer_Tick);
            keepLiveTimer.Start();
            //[[Since there could be multiple such webdbmanager instance which are not referenced, but are holding a connection on the
            //web server. So force a GC cycle to shut them down.
            System.GC.Collect();
            //]]
        }
        public bool IsLoggingEnabled
        {
            get { return isLoggingEnabled; }
            set { isLoggingEnabled = value; }
        }
        public string DBServiceURL
        {
            get { return objDbManagerWS.Url; }
        }

        private void keepLiveTimer_Tick(object sender, EventArgs e)
        {
            try
            {
                objDbManagerWS.NotifyClientStillActive(guid);
            }
            catch (Exception ex)
            {
                UIManager.ShowMessage(MsgCodes.InvalidValue, "GUID on Server|this screen, close [" + GlobalAppVariables.ObjMDIMain.ActiveChild.Text + "] screen", MessageTypes.Error);
            }
        }

        ~WebDbManager()
        {
            if (objDbManagerWS != null)
            {
                try
                {
                    objDbManagerWS.DisposeConnection(guid);
                }
                catch (Exception ex)
                {   
                    //DO NOTHING   
                }
            }
        }
        public void ManualDispose()
        {
            if (objDbManagerWS != null)
            {
                try
                {
                    objDbManagerWS.DisposeConnection(guid);
                }
                catch (Exception ex)
                {
                    //DO NOTHING   
                }
            }
        }

        public string ApplicationId
        {
            get { return applicationId; }
        }

        public string GUID
        {
            get { return guid; }
        }

        public void BeginTrans()
        {
            if (isLoggingEnabled) Logger.Debug("Transaction Created");
            objDbManagerWS.BeginTrans(guid);
        }

        public void BeginTrans(IsolationLevel isolationLevel)
        {
            if (isLoggingEnabled) Logger.Debug("Transaction Created with isolation level: "+isolationLevel.ToString());
            objDbManagerWS.BeginTransWithIsolationLevel(guid, ConvertToCDFIsolationLevel(isolationLevel));
        }

        /// <summary>
        /// Commits on the transaction object passed. Also logs to the logger that the trnasaction has been commited.
        /// </summary>
        public void CommitTrans()
        {
            objDbManagerWS.CommitTrans(guid);
            if (isLoggingEnabled) Logger.Debug("Transaction Commited");
        }

        /// <summary>
        /// Perfomrs rollback on the transaction object passed. Also logs to the logger that the trnasaction has been rolled back.
        /// </summary>
        public void RollbackTrans()
        {
            objDbManagerWS.RollbackTrans(guid);
            if (isLoggingEnabled) Logger.Debug("Transaction Rolledback");
        }

        public DataSet ExecuteSQL(string sqlString)
        {
            if (isLoggingEnabled) Logger.Debug("Executing SQL: " + sqlString);
            return objDbManagerWS.ExecuteSQL(sqlString, guid);
        }
        public DataSet ExecuteSQL(string sqlString, int timeoutSeconds)
        {
            if (isLoggingEnabled) Logger.Debug("Executing SQL: " + sqlString);
            return objDbManagerWS.ExecuteSQL(sqlString, guid);
        }
        public DataSet ExecuteStoredProc(string storedProcedureName, List<SqlParameter> parameters, bool logQuery)
        {
            return ExecuteStoredProc(storedProcedureName, parameters);
        }
        public DataSet ExecuteStoredProc(string storedProcedureName, List<SqlParameter> parameters, int timeoutSeconds)
        {
            return ExecuteStoredProc(storedProcedureName, parameters);
        }

        public DataSet ExecuteStoredProc(string storedProcedureName,
                                         List<SqlParameter> parameters)
        {
            if (isLoggingEnabled) Logger.Debug(GetPrintableSQLString(storedProcedureName, parameters));
            DCC.UMB.CDF.DbManagerWebService.SqlParameter[] lstCDFSqlParameter = CreateWebServiceScopedSqlParameters(parameters);
            DataSet dset =  objDbManagerWS.ExecuteStoredProc(storedProcedureName, lstCDFSqlParameter, guid);
            //[[now see if this dataset has its last table named as "refParametersTable", if yes, take out the values and assign those back to appropritae parameters
            if (dset != null && dset.Tables != null && dset.Tables.Count > 0 && 
                dset.Tables[dset.Tables.Count - 1].TableName == "refParametersTable")
            {
                DataTable paramsTable = dset.Tables[dset.Tables.Count - 1];
                dset.Tables.Remove(paramsTable);
                foreach (DataRow row in paramsTable.Rows)
                {
                    SqlParameter targetParam = parameters.FirstOrDefault(p => p.ParameterName == row["paramName"].ToString());
                    if (targetParam != null)
                    {
                        targetParam.Value = row["paramValue"];
                    }

                }
            }
            //]]
            return dset;
        }


        /// <summary>
        /// Executes the given Stored Procedure.
        /// Executes the storedProcedureName with parameterValues and returns the results 
        /// in a new System.Data.DataSet.
        /// It creates a DbCommand object and then uses ExecuteDataSet method to reutrn the result in term of
        /// DataSet.
        /// </summary>
        /// <param name="storedProcedureName">Strored Procedure Name to execute.</param>
        /// <returns>A System.Data.DataSet with the results of the storedProcedureName.</returns>
        public DataSet ExecuteStoredProc(string storedProcedureName)
        {
            return ExecuteStoredProc(storedProcedureName, new List<SqlParameter>());
        }

        /// <summary>
        /// Executes the command and returns the first column of the first row in the
        /// result set returned by the query. Extra columns or rows are ignored.
        /// </summary>
        /// <param name="sqlString">the query to execute</param>
        /// <returns>The first column of the first row in the result set.</returns>
        public Object ExecuteScalar(string sqlString)
        {
            if (isLoggingEnabled) Logger.Debug("Executing Scalar: " + sqlString);
            return objDbManagerWS.ExecuteScalar(sqlString, guid);
        }
        public SqlParameter CreateSqlParameter(string parameterName,
                                                 object paramValue,
                                                 SqlDbType parameterType,
                                                ParameterDirection direction)
        {
            return Utils.UtilityManager.CreateSqlParameter(parameterName, paramValue, parameterType, direction);
        }

        private static DCC.UMB.CDF.DbManagerWebService.SqlParameter[] CreateWebServiceScopedSqlParameters(List<SqlParameter> parameters)
        {
            DCC.UMB.CDF.DbManagerWebService.SqlParameter[] lstCDFSqlParameter =
                new DCC.UMB.CDF.DbManagerWebService.SqlParameter[parameters == null ? 0 : parameters.Count];
            int i = 0;
            if (parameters != null)
            {
                foreach (SqlParameter param in parameters)
                {
                    DCC.UMB.CDF.DbManagerWebService.SqlParameter cdfSqlParameter =
                        new DCC.UMB.CDF.DbManagerWebService.SqlParameter();
                    cdfSqlParameter.ParameterName = param.ParameterName;
                    cdfSqlParameter.Value = param.Value == DBNull.Value ? "DBNull.Value" : param.Value;
                    cdfSqlParameter.DbType = (DCC.UMB.CDF.DbManagerWebService.DbType)Enum.Parse(typeof(DCC.UMB.CDF.DbManagerWebService.DbType), param.DbType.ToString(), true);
                    cdfSqlParameter.SqlDbType = (DCC.UMB.CDF.DbManagerWebService.SqlDbType)Enum.Parse(typeof(DCC.UMB.CDF.DbManagerWebService.SqlDbType), param.SqlDbType.ToString(), true);
                    cdfSqlParameter.Direction =
                        (DCC.UMB.CDF.DbManagerWebService.ParameterDirection)
                        Enum.Parse(typeof(DCC.UMB.CDF.DbManagerWebService.ParameterDirection),
                                   param.Direction.ToString(),
                                   true);
                    lstCDFSqlParameter[i++] = cdfSqlParameter;
                }
            }
            return lstCDFSqlParameter;
        }

        public string GetCommaSeparatedParameters(List<SqlParameter> parameters)
        {
            return Utils.UtilityManager.GetCommaSeparatedParameters(parameters);
        }
        public string GetPrintableSQLString(string storedProcedureName, List<SqlParameter> lstParameters)
        {
            return Utils.UtilityManager.GetPrintableSQLString(storedProcedureName, lstParameters);
        }

        #region Utility Methods for Getting Data from DataRow

        private static DCC.UMB.CDF.DbManagerWebService.IsolationLevel ConvertToCDFIsolationLevel(
            IsolationLevel isolcationLevel)
        {
            return
                (DCC.UMB.CDF.DbManagerWebService.IsolationLevel)
                Enum.Parse(typeof(DCC.UMB.CDF.DbManagerWebService.IsolationLevel), isolcationLevel.ToString());
        }

        #endregion // Utility Methods for Getting Data from DataRow
        #region Reader Related methods
        internal bool IsReaderClosed
        {
            get { return objDbManagerWS.IsReaderClosed(guid); }
        }
        internal DataTable GetSchemaTableOfCurrentReader()
        {
            return this.objDbManagerWS.GetSchemaTableOfCurrentReader(this.GUID);
        }
        internal DataTable ReadNextBucketFromBrowseModeDataReader(int bucketSize)
        {
            return objDbManagerWS.ReadNextBucketFromDataReader(this.GUID, bucketSize);
        }
        internal void CloseReaderAndConnection()
        {
            objDbManagerWS.CloseReaderAndConnection(this.GUID);
        }
        public DCCSqlDataReader ExecuteReader(string storedProcedureName)
        {
            return ExecuteReader(storedProcedureName, new List<SqlParameter>());
        }
        public DCCSqlDataReader ExecuteReader(string storedProcedureName, List<SqlParameter> lstParameters)
        {
            DataTable table = null;
            return ExecuteReader(storedProcedureName, lstParameters,0, ref table);
        }
        public DCCSqlDataReader ExecuteReaderSQL(string sqlString)
        {
           DataTable table = null;
           return ExecuteReaderSQL(sqlString,0,ref table);
        }
        public DCCSqlDataReader ExecuteReader(string storedProcedureName, List<SqlParameter> lstParameters, int bucketSize, ref DataTable table)
        {
            //[[Create a new instance of WebDbManager as we want a dedicated connection to be established on the DB-webservice 
            //which will be connected to the database till the reader is explicitly closed
            WebDbManager newWebDbManagerForThisReader = new WebDbManager(this.applicationId, this.userRoleId, this.dbServerName, this.password, this.dbServiceURL);
            if (isLoggingEnabled) Logger.Debug(GetPrintableSQLString(storedProcedureName,lstParameters));
            table = newWebDbManagerForThisReader.objDbManagerWS.ExecuteReader(newWebDbManagerForThisReader.GUID, storedProcedureName, CreateWebServiceScopedSqlParameters(lstParameters), bucketSize);
            return new DCCWebSqlDataReader(newWebDbManagerForThisReader);
            //]]
        }
        public DCCSqlDataReader ExecuteReaderSQL(string sqlString, int bucketSize, ref DataTable table)
        {
             //[[Create a new instance of WebDbManager as we want a dedicated connection to be established on the bdwebservice 
            //which will be connected to the database till the reader is explicitly closed
            WebDbManager newWebDbManagerForThisReader = new WebDbManager(this.applicationId, this.userRoleId, this.dbServerName, this.password, this.dbServiceURL);
            if (isLoggingEnabled) Logger.Debug("Executing SQL: " + sqlString); 
            table = newWebDbManagerForThisReader.objDbManagerWS.ExecuteReaderSQL(newWebDbManagerForThisReader.GUID, sqlString, bucketSize);
            return new DCCWebSqlDataReader(newWebDbManagerForThisReader);
            //]]
        }
        #endregion



        internal bool IsReportFileExisting(string reportName)
        {
            return objDbManagerWS.IsReportFileExisting(GlobalAppVariables.AppContext.PackageId, reportName);
        }
        internal byte[] GetReportOutput(string reportName,DataTable paramTable)
        {
            return objDbManagerWS.GetReportOutput(GlobalAppVariables.AppContext.PackageId+"\\"+reportName,
                        paramTable,
                        GlobalAppVariables.AppContext.ServerName,
                        GlobalAppVariables.AppContext.DatabaseName,
                        GlobalAppVariables.AppContext.UserRoleId,
                        GlobalAppVariables.AppContext.ApplicationId);
        }
    }
}