using System;
using System.Collections.Generic;
using System.Text;
using System.Collections;
using System.Data.SqlClient;
using System.Data;


namespace DCC.UMB.CDF.DB
{
    /// <summary>
    /// This class has 3 basic properties 
    /// userId
    /// password
    /// datasource
    /// These properties are set for each instance of the this class
    /// All the connections made by this factory will use same userId and password as specified by 
    /// the command line arguments.
    /// These properties are set in the application context class, where command line arguments are
    /// parsed and first db connection is opened. So it is necessary that whenever a db connection
    /// is opened using this user, this user must have permissions on all those databases where this applicaton
    /// instance is trying to create connections.
    /// </summary>
    internal class DbConnectionFactory
    {
        private  string dataSource; //For sysadmin        
        private  string userId;
        private  string password;
        //private Hashtable connectionPool = new Hashtable();
        private Hashtable lstAppIdVsConnectionString = new Hashtable();
        private string templateConString = "Data Source=<DATA_SOURCE>;Initial Catalog=<DB_NAME>;Persist Security Info=True;User ID=<USER_ID>;Password=<PASSWORD>";
        private const string SYSADMIN_CONNECTION_KEY = "CDF.SYSADMIN";
        public  string Password
        {
            get { return password; }
            set { password = value; }
        }
        public  string UserId
        {
            get { return userId; }
            set { userId = value; }
        }
        /// <summary>
        /// Gets or sets the name/ipaddress of the db server
        /// </summary>
        public  string DataSource
        {
            get { return dataSource; }
            set { dataSource = value; }
        }
        public  SqlConnection GetSysAdminConnection()
        {   
            SqlConnection con = new System.Data.SqlClient.SqlConnection();
            con.ConnectionString = GetConnectionStringForDb("SysAdmin", this.DataSource);
            con.Open();         
            return con;
        }

        public  SqlConnection GetConnection(string applicationId, SqlTransaction tran)
        {   
            //create a new connection and add into the pool
            if (tran != null)
            {
                return tran.Connection;
            }
            SqlConnection con = new System.Data.SqlClient.SqlConnection();
            con.ConnectionString = GetConnectionStringForApplication(applicationId);
            //connectionPool.Add(applicationId, con);
            con.Open();
            return con;
        }
        /// <summary>
        /// Creates a new SQL Conenction for DataReader. The consumer of this connection must close this connection
        /// </summary>
        /// <param name="applicationId"></param>
        /// <seealso cref="DbManager.ExecuteReader()"/>
        /// <returns></returns>
        internal  SqlConnection GetDataReaderConnection(string applicationId)
        {
            SqlConnection con = new System.Data.SqlClient.SqlConnection();
            con.ConnectionString = GetConnectionStringForApplication(applicationId);            
            con.Open();
            //[[Set this connection on a isolation level of Read-uncommitted, so that the other connections can start a read-committed transactions.
            SqlCommand command = con.CreateCommand();
            command.CommandText="SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED";
            command.CommandType=CommandType.Text;
            command.ExecuteNonQuery();            
            //]]
            return con;
        }

        internal void SetConnectionStringForDirectDb(string conStringName, string dbName, string serverName)
        {
            if (lstAppIdVsConnectionString[conStringName] == null)
            {
                string conString = GetConnectionStringForDb(dbName, serverName);
                lstAppIdVsConnectionString.Add(conStringName, conString);
            }
        }
        internal  string GetConnectionStringForApplication(string applicationId)
        {
            //[[If the cache already has the connection string for this given appid, then return from cache
            if (lstAppIdVsConnectionString[applicationId] != null)
            {
                return lstAppIdVsConnectionString[applicationId].ToString();
            }
            //]]
            
            SqlConnection sysAdminCon = null;
            try
            {
                sysAdminCon = GetSysAdminConnection();
                SqlCommand command = sysAdminCon.CreateCommand();
                command.CommandText = "EXEC GetApplicationServerDatabase '" + applicationId + "'";
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable table = new DataTable();
                adapter.Fill(table);
                if (table == null || table.Rows == null || table.Rows.Count <= 0)
                {
                    throw new Exception("No Entry in SysAdmin(table applications) database for applicationId = '" + applicationId + "'");
                }
                string dbName = (string)table.Rows[0]["database_nm"];
                string serverName = (string)table.Rows[0]["server_nm"];
                string conString =  GetConnectionStringForDb(dbName, serverName);
                lstAppIdVsConnectionString.Add(applicationId, conString);
                return conString;
            }
            finally
            {
                DisposeConnection(sysAdminCon, null);
            }
        }
        internal  string GetConnectionStringForDb(string dbName, string serverName)
        {
            string conString = this.templateConString.Replace("<DATA_SOURCE>", serverName);
            conString = conString.Replace("<PASSWORD>", this.Password);
            conString = conString.Replace("<USER_ID>", this.UserId);
            conString = conString.Replace("<DB_NAME>", dbName);
            return conString;
        }
        internal  string GetConnectionStringForPackageDefaultDatabase(string packageId, string serverName)
        {
            SqlConnection sysAdminCon = null;
            try
            {
                sysAdminCon = this.GetSysAdminConnection();
                SqlCommand command = sysAdminCon.CreateCommand();
                command.CommandType = CommandType.Text;
                command.CommandText = "Select database_nm from package_databases where package_id = '" + packageId + "'";
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataSet dset = new DataSet();
                adapter.Fill(dset);
                string databaseName = dset.Tables[0].Rows[0]["database_nm"].ToString();
                return this.GetConnectionStringForDb(databaseName, serverName);
            }
            finally
            {
                DisposeConnection(sysAdminCon, null);
            }
        }
        internal void DisposeConnection(SqlConnection con, SqlTransaction trans)
        {
            if (trans != null)//i.e. the connection is in use and should be diposed only at rollback or commit.
            {
                return;
            }

            if (con != null)
            {
                con.Close();
                con.Dispose();
            }
        }
    }
}
