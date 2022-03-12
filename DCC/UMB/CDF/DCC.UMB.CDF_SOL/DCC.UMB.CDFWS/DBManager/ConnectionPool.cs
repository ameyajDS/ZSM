using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Threading;
using System.Web;

namespace DCC.UMB.CDFWS.DBManager
{
    /// <summary>
    /// Summary description for ConnectionPool
    /// </summary>
    internal class ConnectionPool
    {
        internal static DataTable transactionalConnectionPool;
        internal static string APPLICATION_COLUMN_NAME = "Application";
        internal static string GUID_COLUMN_NAME = "Guid";
        internal static string TRANSACTION_COLUMN_NAME = "Transaction";
        internal static string CONNECTION_COLUMN_NAME = "Connection";
        internal static string LAST_ACCESS_DTM_COLUMN_NAME = "Last Accessed";
        internal static string CLIENT_COLUMN_NAME = "Client";
        internal static string READER_COLUMN_NAME = "Reader";
        internal static string READER_COMMAND_COLUMN_NAME = "Reader Command";

        private static long ticksInOneSecond = 10000000;
        
        
        static ConnectionPool()
        {
            transactionalConnectionPool = new DataTable();
            transactionalConnectionPool.Columns.Add(GUID_COLUMN_NAME, typeof(string));
            transactionalConnectionPool.Columns.Add(APPLICATION_COLUMN_NAME, typeof(string));
            transactionalConnectionPool.Columns.Add(CONNECTION_COLUMN_NAME, typeof(SqlConnection));
            transactionalConnectionPool.Columns.Add(TRANSACTION_COLUMN_NAME, typeof(SqlTransaction));
            transactionalConnectionPool.Columns.Add(LAST_ACCESS_DTM_COLUMN_NAME, typeof(DateTime));
            transactionalConnectionPool.Columns.Add(CLIENT_COLUMN_NAME, typeof(string));
            transactionalConnectionPool.Columns.Add(READER_COLUMN_NAME, typeof(SqlDataReader));
            transactionalConnectionPool.Columns.Add(READER_COMMAND_COLUMN_NAME, typeof(SqlCommand));
            //start the timer here
        }


        internal static void CreteAndOpenConnection(string guid, string applicationId, string userId, string serverName, string clientName)
        {            
            DataRow row;
            try
            {
                row = GetConnectionTransactionRow(guid);
            }
            catch
            {
                row = null;
            }
            if (row != null)
            {
                throw new Exception("Connection already exists for guid=" + guid);
            }
            SqlConnection connection = DBConnectionFactory.GetNewConnection(applicationId, userId, serverName);
            //connection.Open();
            transactionalConnectionPool.Rows.Add(new object[] { guid, applicationId, connection, null, DateTime.Now,clientName });
        }

        internal static DataRow GetConnectionTransactionRow(string guid)
        {
            CheckForIdleConnections();
            DataRow[] rows = transactionalConnectionPool.Select(GUID_COLUMN_NAME + "='" + guid + "'");
            
            if (rows == null || rows.Length <= 0)
            {
                throw new Exception("No connection exists for guid=" + guid);
            }
            rows[0][LAST_ACCESS_DTM_COLUMN_NAME] = DateTime.Now;
            return rows[0];
        }


        internal static void CheckForIdleConnections()
        {
            List<string> targetGuidsForRemoval = new List<string>();
            try
            {
                foreach (DataRow row in transactionalConnectionPool.Rows)
                {
                    if (row[LAST_ACCESS_DTM_COLUMN_NAME] == null || row[LAST_ACCESS_DTM_COLUMN_NAME] == DBNull.Value) continue;

                    DateTime lastAccessed = (DateTime)row[LAST_ACCESS_DTM_COLUMN_NAME];
                    SqlConnection con = (SqlConnection)row[CONNECTION_COLUMN_NAME];
                    string guid = (string)row[GUID_COLUMN_NAME];
                    //[[close the connection if there has not been any activity in last 11 minutes (keep live ping comes after 5 mins each)
                    if ((DateTime.Now.Ticks - lastAccessed.Ticks) >= ticksInOneSecond*6*60)
                    {
                        DisposeConnection(guid);                                                
                    }
                    //]]
                   
                }
            }
            catch (Exception ex)
            {
                //do nothing.
            }
            //[[now remove all the rows form transactionalConnectionPool table 
            //whose guids have been collected in list targetGuidsForRemoval
            foreach (string guid in targetGuidsForRemoval)
            {
                DataRow[] rows = transactionalConnectionPool.Select(GUID_COLUMN_NAME + "='" + guid + "'");
                if (rows != null && rows.Length>1)
                {
                    throw new Exception("how come multiple rows with same guid!");
                }
                if (rows != null && rows.Length > 0)
                {
                    transactionalConnectionPool.Rows.Remove(rows[0]);
                }
            }
            //]]
        }
        private static SqlConnection GetConnection(string guid, bool open)
        {
            DataRow row = GetConnectionTransactionRow(guid);
            SqlConnection toReturn = (SqlConnection)row[CONNECTION_COLUMN_NAME];
            if (open==true && 
                (toReturn.State == ConnectionState.Closed || toReturn.State == ConnectionState.Broken))
            {
                toReturn.Open();
            }
            return toReturn;
        }
       
        public static SqlConnection GetConnection(string guid)
        {
            return GetConnection(guid, true);
        }
        public static SqlDataReader GetDataReader(string guid)
        {
            DataRow row = GetConnectionTransactionRow(guid);
            if (row[READER_COLUMN_NAME] == null || row[READER_COLUMN_NAME]==DBNull.Value)
            {
                return null;
            }
            SqlDataReader reader = (SqlDataReader)row[READER_COLUMN_NAME];
            return reader;
        }
        public static SqlCommand GetReaderCommandObject(string guid)
        {
            DataRow row = GetConnectionTransactionRow(guid);
            SqlCommand toReturn = (SqlCommand)row[READER_COMMAND_COLUMN_NAME];
            return toReturn;
        }
        public static void SetDataReader(string guid, SqlDataReader reader, SqlCommand command)
        {
            //[[If there is an already existing opened reader with this guid, then throw an exception
            SqlDataReader existingReader = GetDataReader(guid);
            if (existingReader != null)
            {
                throw new Exception("There is an already opened datareader with this WebDBManagerInstance");
            }
            //]]
            
            DataRow row = GetConnectionTransactionRow(guid);
            row[READER_COLUMN_NAME] = reader;
            row[READER_COMMAND_COLUMN_NAME] = command;
        }

        public static SqlTransaction GetTransaction(string guid)
        {
            DataRow row = GetConnectionTransactionRow(guid);
            if (row[TRANSACTION_COLUMN_NAME] == null || row[TRANSACTION_COLUMN_NAME]==DBNull.Value)
            {
                return null;
            }
            SqlTransaction toReturn = (SqlTransaction)row[TRANSACTION_COLUMN_NAME];
            return toReturn;
        }

        private static void UpdateTransactionObject(string guid, SqlTransaction transaction)
        {
            DataRow row = GetConnectionTransactionRow(guid);
            row[TRANSACTION_COLUMN_NAME] = transaction;
        }

        private static void UpdateConnectionObject(string guid, SqlConnection connection)
        {
            DataRow row = GetConnectionTransactionRow(guid);
            row[CONNECTION_COLUMN_NAME] = connection;
        }

        public static void BeginTran(string guid)
        {
            SqlConnection connection = GetConnection(guid);
            SqlTransaction transaction = connection.BeginTransaction();
            UpdateTransactionObject(guid, transaction);
        }

        public static void BeginTran(string guid, IsolationLevel isolationLevel)
        {
            SqlConnection connection = GetConnection(guid);
            SqlTransaction transaction = connection.BeginTransaction(isolationLevel);
            UpdateTransactionObject(guid, transaction);
        }

        public static void CommitTran(string guid)
        {
            IDbTransaction transaction = GetTransaction(guid);
            transaction.Commit();
            DisposeTransaction(guid, transaction);
        }

        private static void DisposeTransaction(string guid, IDbTransaction transaction)
        {
            transaction.Dispose();
            UpdateTransactionObject(guid, null);
        }

        public static void RollbackTran(string guid)
        {
            IDbTransaction transaction = GetTransaction(guid);
            transaction.Rollback();
            DisposeTransaction(guid, transaction);
        }

        public static void DisposeConnection(string guid)
        {
            try
            {
                DataRow[] rows = transactionalConnectionPool.Select(GUID_COLUMN_NAME + "='" + guid + "'");
                if (rows != null && rows.Length > 0)
                {
                    if (rows[0][CONNECTION_COLUMN_NAME] == null || rows[0][CONNECTION_COLUMN_NAME]==DBNull.Value) return;
                    SqlConnection con = (SqlConnection)rows[0][CONNECTION_COLUMN_NAME];
                    con.Close();
                    con.Dispose();
                    transactionalConnectionPool.Rows.Remove(rows[0]);
                }
            }
            catch (Exception ex)
            {
                //do nothing
            }
        }

        internal static void CloseConnectionIfNotInTransactionAndReader(string guid)
        {
            if (ConnectionPool.GetTransaction(guid) == null &&
                !IsConnectionHavingOpenReader(guid)
                )
            {
                SqlConnection con = ConnectionPool.GetConnection(guid, false);
                if (con.State != ConnectionState.Closed)
                {
                    con.Close();
                }
            }
        }
        private static bool IsConnectionHavingOpenReader(string guid)
        {
            SqlDataReader reader = (SqlDataReader)ConnectionPool.GetDataReader(guid); 
            if (reader == null || reader.IsClosed)
            {
                return false;
            }
            return true;
            
            
        }
    }

} 