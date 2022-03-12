using System;
using System.Web;
using System.Collections;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using CrystalDecisions.Windows.Forms;
using System.IO;

namespace DCC.UMB.CDFWS.DBManager
{
    /// <summary>
    /// Summary description for DBManagerWS
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    public class DBManagerWS : System.Web.Services.WebService
    {
        [WebMethod]
        public string Ping()
        {
            ConnectionPool.CheckForIdleConnections();
            return "Ping Successful";
        }
        [WebMethod]
        public void CreateConnection(string guid, string applicationId, string userId, string serverName, string clientName)
        {
            ConnectionPool.CreteAndOpenConnection(guid, applicationId, userId, serverName, clientName);
        }
        [WebMethod]
        public void NotifyClientStillActive(string guid)
        {
            ConnectionPool.GetConnectionTransactionRow(guid);
        }

        [WebMethod]
        public void DisposeConnection(string guid)
        {
            ConnectionPool.DisposeConnection(guid);
        }

        [WebMethod]
        public void BeginTrans(string guid)
        {
            ConnectionPool.BeginTran(guid);
        }

        [WebMethod]
        public void BeginTransWithIsolationLevel(string guid, IsolationLevel isolationLevel)
        {
            ConnectionPool.BeginTran(guid, isolationLevel);
        }

        [WebMethod]
        public void CommitTrans(string guid)
        {
            try
            {
                ConnectionPool.CommitTran(guid);
            }
            finally
            {
                ConnectionPool.CloseConnectionIfNotInTransactionAndReader(guid);
            }
        }

        [WebMethod]
        public void RollbackTrans(string guid)
        {
            try
            {
                ConnectionPool.RollbackTran(guid);
            }
            finally
            {
                ConnectionPool.CloseConnectionIfNotInTransactionAndReader(guid);
            }
        }

        [WebMethod]
        [System.Xml.Serialization.XmlInclude(typeof(DBNull))]
        public DataSet ExecuteSQL(string sqlString, string guid)
        {
            try
            {
                SqlConnection connection = ConnectionPool.GetConnection(guid);
                SqlCommand objSqlCommand = connection.CreateCommand();
                objSqlCommand.Transaction = ConnectionPool.GetTransaction(guid);
                objSqlCommand.CommandType = CommandType.Text;
                objSqlCommand.CommandText = sqlString;
                SqlDataAdapter adapter = new SqlDataAdapter(objSqlCommand);
                DataSet dset = new DataSet();
                adapter.Fill(dset);
                return dset;
            }
            finally
            {
                ConnectionPool.CloseConnectionIfNotInTransactionAndReader(guid);
            }
        }

        [WebMethod]
        [System.Xml.Serialization.XmlInclude(typeof(DBNull))]
        public DataSet ExecuteStoredProc(string storedProcedureName,
                                            List<SqlParameter> parameters, string guid)
        {
            try
            {
                SqlConnection con = ConnectionPool.GetConnection(guid);
                SqlCommand objDBCommand = con.CreateCommand();
                objDBCommand.Transaction = ConnectionPool.GetTransaction(guid);
                objDBCommand.CommandType = CommandType.StoredProcedure;
                objDBCommand.CommandText = storedProcedureName;

                foreach (SqlParameter param in parameters)
                {
                    if (param.Value != null && param.Value.ToString() == "DBNull.Value")//Work around for passing DBNull from client.
                    {
                        param.Value = DBNull.Value;
                    }
                    objDBCommand.Parameters.Add(param);
                }
                SqlDataAdapter adapter = new SqlDataAdapter(objDBCommand);

                DataSet dset = new DataSet();
                adapter.Fill(dset);
                DataTable refParamTable = new DataTable("refParametersTable");
                refParamTable.Columns.Add(new DataColumn("paramName", typeof(string)));
                refParamTable.Columns.Add(new DataColumn("paramValue", typeof(object)));
                foreach (SqlParameter param in parameters)
                {
                    if (param.Direction == ParameterDirection.InputOutput || param.Direction == ParameterDirection.Output)//Work around for passing DBNull from client.
                    {
                        DataRow row = refParamTable.NewRow();
                        refParamTable.Rows.Add(row);
                        if (param.Value != null && param.Value.ToString() == "DBNull.Value")//Work around for passing DBNull from client.
                        {
                            row["paramValue"] = DBNull.Value;
                        }
                        row["paramName"] = param.ParameterName;
                        row["paramValue"] = param.Value;
                    }
                }
                dset.Tables.Add(refParamTable);
                return dset;
            }
            catch (Exception ex)
            {
                throw;
            }
            finally
            {
                ConnectionPool.CloseConnectionIfNotInTransactionAndReader(guid);
            }
        }

        [WebMethod]
        [System.Xml.Serialization.XmlInclude(typeof(DBNull))]
        public DataSet ExecuteStoredProcWithNoParameter(string storedProcedureName, string guid)
        {
            List<SqlParameter> lstParams = new List<SqlParameter>();
            return ExecuteStoredProc(storedProcedureName, lstParams, guid);

        }

        [WebMethod]
        [System.Xml.Serialization.XmlInclude(typeof(DBNull))]
        public Object ExecuteScalar(string sqlString, string guid)
        {
            try
            {
                SqlConnection con = ConnectionPool.GetConnection(guid);
                SqlCommand objSQLCommand = con.CreateCommand();
                objSQLCommand.Transaction = ConnectionPool.GetTransaction(guid);
                objSQLCommand.CommandType = CommandType.Text;
                objSQLCommand.CommandText = sqlString;
                return objSQLCommand.ExecuteScalar();
            }
            catch (Exception ex)
            {
                throw;
            }
            finally
            {
                ConnectionPool.CloseConnectionIfNotInTransactionAndReader(guid);
            }
        }

        [WebMethod]
        public bool IsReaderClosed(string guid)
        {
            SqlDataReader reader = ConnectionPool.GetDataReader(guid);
            if (reader == null)
            {
                return true;
            }
            return reader.IsClosed;
        }
        [WebMethod]
        [System.Xml.Serialization.XmlInclude(typeof(DBNull))]
        public DataTable GetSchemaTableOfCurrentReader(string guid)
        {
            SqlDataReader reader = ConnectionPool.GetDataReader(guid);
            if (reader == null)
            {
                return null;
            }
            return reader.GetSchemaTable();
        }
        [WebMethod]
        [System.Xml.Serialization.XmlInclude(typeof(DBNull))]
        public virtual DataTable ReadNextBucketFromDataReader(string guid, int bucketSize)
        {
            DataTable table = new DataTable();
            table.TableName = "ReaderBucketTable";

            SqlDataReader reader = ConnectionPool.GetDataReader(guid);
            if (reader == null || reader.IsClosed)
            {
                return table;
            }
            DataTable schemaTable = reader.GetSchemaTable();
            foreach (DataRow row in schemaTable.Rows)
            {
                table.Columns.Add(new DataColumn(row["ColumnName"].ToString(), Type.GetType(row["DataType"].ToString())));
            }

            int readRecords = 0;

            while (readRecords < bucketSize
                && reader.Read())
            {
                readRecords++;
                DataRow row = table.NewRow();
                //bool recordFound = true;
                for (int i = 0; i < table.Columns.Count; i++)
                {
                    int ordinal = reader.GetOrdinal(table.Columns[i].ColumnName);
                    Object obj = reader.GetValue(ordinal);
                    row[table.Columns[i].ColumnName] = obj;
                }
                table.Rows.Add(row);
            }
            //[[Now check if the readRecords < GlobalAppVariables.AppContext.BrowseModeRetrivalBucketSize
            //if true that means the reader has reached till the end of the recordset in database and should be closed
            if (readRecords < bucketSize)
            {
                CloseReaderAndConnection(guid);
            }
            return table;
        }
        [WebMethod]
        public DataTable ExecuteReader(string guid, string storedProcedureName, List<SqlParameter> parameters, int bucketSize)
        {
            try
            {
                SqlConnection con = ConnectionPool.GetConnection(guid);
                //[[First set the isolaiton level to read uncommitted, else other connections are blocked to start a transaction till this reader closes    
                SqlCommand command = con.CreateCommand();
                command.CommandText = "SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED";
                command.CommandType = CommandType.Text;
                command.ExecuteNonQuery();
                //]]
                SqlCommand objDBCommand = con.CreateCommand();
                objDBCommand.Transaction = ConnectionPool.GetTransaction(guid);
                objDBCommand.CommandType = CommandType.StoredProcedure;
                objDBCommand.CommandText = storedProcedureName;
                foreach (SqlParameter param in parameters)
                {
                    objDBCommand.Parameters.Add(param);
                }
                SqlDataReader reader = objDBCommand.ExecuteReader();
                ConnectionPool.SetDataReader(guid, reader, objDBCommand);
                return ReadDataTableFromDataReader(bucketSize, reader);
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        
        [WebMethod]
        public DataTable ExecuteReaderSQL(string guid, string sqlString, int bucketSize)
        {
            try
            {
                SqlConnection con = ConnectionPool.GetConnection(guid);
                //[[First set the isolaiton level to read uncommitted, else other connections are blocked to start a transaction till this reader closes    
                SqlCommand command = con.CreateCommand();
                command.CommandText = "SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED";
                command.CommandType = CommandType.Text;
                command.ExecuteNonQuery();
                //]]
                SqlCommand objDBCommand = con.CreateCommand();
                objDBCommand.Transaction = ConnectionPool.GetTransaction(guid);
                objDBCommand.CommandType = CommandType.Text;
                objDBCommand.CommandText = sqlString;
                SqlDataReader reader = objDBCommand.ExecuteReader();
                ConnectionPool.SetDataReader(guid, reader, objDBCommand);
                return ReadDataTableFromDataReader(bucketSize, reader);
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        private DataTable ReadDataTableFromDataReader(int bucketSize, SqlDataReader reader)
        {
            DataTable table = new DataTable("Table1");
            if (reader.IsClosed) return table;
            DataTable schemaTable = reader.GetSchemaTable();
            foreach (DataRow row in schemaTable.Rows)
            {
                table.Columns.Add(new DataColumn(row["ColumnName"].ToString(), Type.GetType(row["DataType"].ToString())));
            }

            int readRecords = 0;

            while (readRecords < bucketSize
                && reader.Read())
            {
                readRecords++;
                DataRow row = table.NewRow();
                //bool recordFound = true;
                for (int i = 0; i < table.Columns.Count; i++)
                {
                    int ordinal = reader.GetOrdinal(table.Columns[i].ColumnName);
                    Object obj = reader.GetValue(ordinal);
                    row[table.Columns[i].ColumnName] = obj;
                }
                table.Rows.Add(row);
            }

            return table;
        }


        [WebMethod]
        public virtual void CloseReaderAndConnection(string guid)
        {
            SqlDataReader reader = null;
            SqlConnection con = null;
            try
            {
                reader = ConnectionPool.GetDataReader(guid);
                con = ConnectionPool.GetConnection(guid);
                SqlCommand objDBCommand = ConnectionPool.GetReaderCommandObject(guid);
                objDBCommand.Cancel();
                objDBCommand.Dispose();
                reader.Close();
            }
            catch (System.Exception)
            {
                //Do nothing.
            }
            finally
            {
                try
                {
                    con.Close();
                }
                catch
                {
                    //Do nothing
                }
            }
        }

        private string SearchParameterValue( DataTable parameterValues,string  parameterName)
        {
            DataRow[] rows = parameterValues.Select("name='"+parameterName+"'");
            if (rows != null && rows.Length > 0)
            {
                return rows[0]["value"].ToString();
            }
            return null;
        }

        [WebMethod]
        public bool IsReportFileExisting(string packageId, string relativeReportFilePath)
        {
            if (!relativeReportFilePath.StartsWith("\\"))
            {
                relativeReportFilePath = "\\" + relativeReportFilePath;
            }
            string absoluteReportPath = HttpContext.Current.Server.MapPath("~") + @"\Reports\" + packageId + relativeReportFilePath;
            return File.Exists(absoluteReportPath);            
        }
        [WebMethod]
        public void UploadReport(string packageId, string relativePathStartingWithBackSlash, byte[] reportFileContents)
        {
            string absoluteReportPath = HttpContext.Current.Server.MapPath("/") + @"\Reports\" + packageId + relativePathStartingWithBackSlash;
            FileInfo reportFileInfo = new FileInfo(absoluteReportPath);
            if (!reportFileInfo.Directory.Exists)
            {
                Directory.CreateDirectory(reportFileInfo.Directory.FullName);
            }
            if (File.Exists(absoluteReportPath))
            {
                File.Delete(absoluteReportPath);                
            }
            File.WriteAllBytes(absoluteReportPath, reportFileContents);
        }
        [WebMethod]
        public  byte[] GetReportOutput(string relativeReportFilePath, DataTable parameterValues,
            string serverName, string dbName, string userRoleId, string applicationId)
        {
            if (!relativeReportFilePath.StartsWith("\\"))
            {
                relativeReportFilePath = "\\" + relativeReportFilePath;
            }
            string absoluteReportPath = HttpContext.Current.Server.MapPath("~") +@"\Reports"+ relativeReportFilePath;
            ReportDocument doc = new ReportDocument();
            doc.Load(absoluteReportPath);
            foreach (ParameterField field in doc.ParameterFields)
            {
                doc.SetParameterValue(field.Name, SearchParameterValue(parameterValues, field.Name.Replace("@", string.Empty)));
            }


            ConnectionInfo connectionInformation = new ConnectionInfo();
            connectionInformation.ServerName = serverName;
            connectionInformation.DatabaseName = dbName;
            connectionInformation.UserID = userRoleId;
            connectionInformation.Password = DBConnectionFactory.IdentifyPasswordFromSysAdmin(applicationId, userRoleId);


            //Loop through all tables in the report and apply the 
            //connection information for each table. 
            foreach (Table table in doc.Database.Tables)
            {

                TableLogOnInfo crTableLogOnInfo = table.LogOnInfo;
                Console.WriteLine(table.Name);
                crTableLogOnInfo.ConnectionInfo = connectionInformation;
                table.ApplyLogOnInfo(crTableLogOnInfo);
            }
            CrystalReportViewer reportViewer = GetCrystalReportViewer();
            reportViewer.ReportSource = doc;
            string guid = Guid.NewGuid().ToString();
            string generatedPdfPath = absoluteReportPath+guid+".pdf";
            doc.ExportToDisk(ExportFormatType.PortableDocFormat, generatedPdfPath);
            byte[] toReturn = File.ReadAllBytes(generatedPdfPath);
            File.Delete(generatedPdfPath);
            return toReturn;

        }
        private CrystalReportViewer GetCrystalReportViewer()
        {
            CrystalReportViewer reportViewer = new CrystalReportViewer();          
            reportViewer.ActiveViewIndex = -1;
            reportViewer.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            reportViewer.Dock = System.Windows.Forms.DockStyle.Fill;
            reportViewer.Location = new System.Drawing.Point(0, 0);
            reportViewer.Name = "reportViewer";
            reportViewer.SelectionFormula = "";
            reportViewer.Size = new System.Drawing.Size(292, 292);
            reportViewer.TabIndex = 0;
            reportViewer.ViewTimeSelectionFormula = "";
            return reportViewer;
        }
    }
}
