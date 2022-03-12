using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using System.Runtime.CompilerServices;
using System.Configuration;

namespace DCC.UMB.CDFWS.DBManager
{

    /// <summary>
    /// Summary description for DBConnectionFactory
    /// </summary>
    internal class DBConnectionFactory
    {
        private static string dataSource; //For sysadmin        
        private static string userId;
        private static string password;
        private static Hashtable connectionPool = new Hashtable();
        private static string templateConString = "Data Source=<DATA_SOURCE>;Initial Catalog=<DB_NAME>;Persist Security Info=True;User ID=<USER_ID>;Password=<PASSWORD>";
        private const string SYSADMIN_CONNECTION_KEY = "CDF.SYSADMIN";
        public static string Password
        {
            get { return password; }
            set { password = value; }
        }
        public static string UserId
        {
            get { return userId; }
            set { userId = value; }
        }
        /// <summary>
        /// Gets or sets the name/ipaddress of the db server
        /// </summary>
        public static string DataSource
        {
            get { return dataSource; }
            set { dataSource = value; }
        }
        public DBConnectionFactory()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        [MethodImpl(MethodImplOptions.Synchronized)]
        public static SqlConnection GetNewConnection(string applicationId, string userId, string serverName)
        {
            UserId = userId;
            DataSource = serverName;
            Password = IdentifyPasswordFromSysAdmin(applicationId, userId);
            //[[if no application id is specified, just open a connection to the database
            //[[These kind of calls will come when WebQueryAnalyzer is used
            if (string.IsNullOrEmpty(applicationId))
            {
                return GetSysAdminConnection();
            }
            //]]
            //create a new connection and add into the pool
            SqlConnection con = new System.Data.SqlClient.SqlConnection();
            con.ConnectionString = GetConnectionStringForApplication(applicationId);
            con.Open();
            return con;
        }

        internal static string IdentifyPasswordFromSysAdmin(string applicationId, string userRoleId)
        {
            SqlConnection con = GetSysAdminConnection();
            SqlCommand command = new SqlCommand();
            command.Connection = con;
            command.CommandType = CommandType.Text;
            command.CommandText = string.Format(@"DECLARE @packageId VARCHAR(20);
                                                    SELECT @packageId= package_id FROM dbo.package_user_roles WHERE user_role_id='{0}';
                                                    DECLARE @password password
                                                    EXEC dbo.IdentifyUserRole @p_package_id = @packageid,
                                                        @p_user_role_id = '{0}', 
                                                        @p_user_role_identity = @password OUTPUT;
                                                    SELECT @password", userRoleId);
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataSet dset = new DataSet();
            adapter.Fill(dset);
            return dset.Tables[0].Rows[0][0].ToString();
        }
        private static string GetConnectionStringForApplication(string applicationId)
        {
            SqlConnection sysAdminCon = null;
            try
            {
                sysAdminCon = GetSysAdminConnection();
                SqlCommand command = sysAdminCon.CreateCommand();
                command.CommandText = "SELECT a.database_nm, pd.server_nm from applications a JOIN package_databases pd on (pd.package_id=a.package_id)where application_id = '" + applicationId + "'";
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable table = new DataTable();
                adapter.Fill(table);
                if (table == null || table.Rows == null || table.Rows.Count <= 0)
                {
                    throw new Exception("No Entry in SysAdmin(table applications) database for applicationId = '" + applicationId + "'");
                }
                string dbName = (string)table.Rows[0]["database_nm"];
                string serverName = (string)table.Rows[0]["server_nm"];
                return GetConnectionStringForDb(dbName, serverName);
            }
            finally
            {
                if (sysAdminCon != null && sysAdminCon.State != ConnectionState.Closed)
                {
                    sysAdminCon.Close();
                    sysAdminCon.Dispose();
                }
            }
        }
        public static SqlConnection GetSysAdminConnection()
        {
            SqlConnection con = new System.Data.SqlClient.SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["SysAdminServices"].ConnectionString;
            con.Open();
            return con;
        }
        private static string GetConnectionStringForDb(string dbName, string serverName)
        {
            string conString = templateConString.Replace("<DATA_SOURCE>", serverName);
            conString = conString.Replace("<PASSWORD>", Password);
            conString = conString.Replace("<USER_ID>", UserId);
            conString = conString.Replace("<DB_NAME>", dbName);
            return conString;
        }
    }
}