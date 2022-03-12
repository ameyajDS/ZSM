using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using DCC.DBFacade;
using DCC.UMB.CDF.DB;
using DCC.UMB.CDF.Crypto;
using System.Text;
using Microsoft.VisualBasic;

namespace DCC.UMB.CDF.Web.Launcher.auth
{

    public partial class Portfolio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.grdPortfolio.DataSource = this.GetAutherizedApplications();
            this.grdPortfolio.DataBind();
        }
        public string DisplayAppLink(object o)
        {
            return "abc";
        }
        public string GetPackageId(object objRow)
        {
            DataRowView row = (DataRowView)objRow;
            return row["package_id"].ToString();
        }
        public string GetApplicationName(object objRow)
        {
            DataRowView row = (DataRowView)objRow;
            return row["application_nm"].ToString();
        }

        public string GetApplicationRole(object objRow)
        {
            DataRowView row = (DataRowView)objRow;
            return row["user_role_id"].ToString();
        }
        public string CreateCommandArgument(object objRow)
        {
            DataRowView row = (DataRowView)objRow;
            return row["package_id"].ToString() + "," + row["application_id"].ToString() + "," + row["user_role_id"].ToString();
        }
        public string GetExecutableFileName(string packageUserRole, string packageId)
        {
            //SELECT executable_file_nm FROM dbo.package_user_roles WHERE package_id='ZSM' AND USER_role_id='ZSM_ADM'
            using (SqlConnection con = GetSysAdminSqlConnection())
            {
                SqlCommand command = con.CreateCommand();
                command.CommandType = CommandType.Text;
                command.CommandText = string.Format(@"SELECT executable_file_nm FROM dbo.package_user_roles WHERE package_id='{0}' AND USER_role_id='{1}'", packageId, packageUserRole);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataSet dset = new DataSet();
                adapter.Fill(dset);

                return dset.Tables[0].Rows[0][0].ToString();
            }
        }
        public DataTable GetAutherizedApplications()
        {
            using (SqlConnection con = GetSysAdminSqlConnection())
            {
                SqlCommand command = con.CreateCommand();
                command.CommandType = CommandType.Text;
                command.CommandText = string.Format(@"EXEC dbo.GetUserDetails '{0}'", Membership.GetUser().UserName);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataSet dset = new DataSet();
                adapter.Fill(dset);

                return dset.Tables[0];
            }
        }
        private SqlConnection GetSysAdminSqlConnection()
        {
            string sysAdminConString = ConfigurationManager.ConnectionStrings["SysAdminServices"].ConnectionString;
            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
            builder.ConnectionString = sysAdminConString;
            SqlConnection con = new SqlConnection(builder.ConnectionString);
            return con;
        }

        protected void grdPortfolio_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            Console.WriteLine("here in command");
            if (e.CommandName == "Launch App")
            {
                string packageId = e.CommandArgument.ToString().Split(new char[] { ',' })[0];
                string applicationId = e.CommandArgument.ToString().Split(new char[] { ',' })[1];
                string userRoleId = e.CommandArgument.ToString().Split(new char[] { ',' })[2];
                Guid guid = Guid.NewGuid();

                string exeName = GetExecutableFileName(userRoleId, packageId);
                string s = ConfigurationManager.ConnectionStrings["SysAdminServices"].ConnectionString;
                System.Data.SqlClient.SqlConnectionStringBuilder sb = new SqlConnectionStringBuilder(s);

               
                SAMDbFacade dbfacade = new SAMDbFacade("SAM");
                string userRoleIdentity = "NOTSET";
                string isQuerySession = "";
                int sessionId = 0;
                int userNo = int.Parse(Membership.GetUser().ProviderUserKey.ToString());
                dbfacade.GetUserRoleIdentity(userRoleId, ref userRoleIdentity);
                dbfacade.IdentifyUserRole(packageId, userRoleId, ref userRoleIdentity);
                dbfacade.ClearUserSessions(userNo);
                dbfacade.InitialiseSession(userNo, Environment.MachineName, applicationId, userRoleId, ref isQuerySession, ref sessionId);
                string commandStirng = CreateCommandStringForTargetApp(dbfacade, applicationId, userRoleId, userRoleIdentity, sessionId, isQuerySession);
                CommandArgsProvider.AddGuid(guid, commandStirng);
                Response.Redirect(string.Format("~/apps/{0}?guid={1}", packageId + "/" + exeName.ToLower().Replace("exe", "application"), guid.ToString()));
            }
        }
        

        private string CreateCommandStringForTargetApp(SAMDbFacade dbFacade, string applicationId, string userRoleId, string userRoleIdentity, int sessionId, string isQuerySession)
        {
            string strSql = string.Format("SELECT * FROM  v_application_user_roles WHERE application_id='{0}' AND user_role_id='{1}'", applicationId, userRoleId);
            DataRow row = dbFacade.ObjDBManager.ExecuteSQL(strSql).Tables[0].Rows[0];
            StringBuilder sb = new StringBuilder();
            sb.Append(applicationId + "|");
            sb.Append(row["application_nm"] + "|");
            sb.Append(row["package_id"] + "|");
            sb.Append(row["package_nm"] + "|");
            sb.Append(row["version_no"] + "|");
            sb.Append(row["version_dt"] + "|");
            sb.Append(row["database_nm"] + "|");
            sb.Append(row["server_nm"] + "|");
            sb.Append(row["dsn_nm"] + "|");
            sb.Append(Membership.GetUser().UserName + "|");                        
            sb.Append(Membership.GetUser().ProviderUserKey + "|");
            sb.Append(Membership.GetUser().UserName + "|");
            sb.Append(userRoleId + "|");
            sb.Append(userRoleIdentity + "|");
            sb.Append(sessionId + "|");
            sb.Append("No" + "|");
            sb.Append(row["error_log_level"] + "|");
            sb.Append(row["log_file_size_in_mb"] + "|");
            sb.Append(row["report_title"] + "|");
            sb.Append(row["report_footer"] + "|");
            sb.Append(row["path_1"] + "|");
            sb.Append(row["path_2"] + "|");
            sb.Append(row["path_3"] + "|");
            sb.Append(row["argument_1"] + "|");
            sb.Append(row["argument_2"] + "|");
            sb.Append(row["argument_3"] + "|");
            sb.Append(row["argument_4"] + "|");
            sb.Append(row["argument_5"]);

            return sb.ToString();
        }

    }
    public class UserPackage
    {
        private List<UserApp> lstApps = new List<UserApp>();
        public string Name { get; set; }
        public string Id { get; set; }
        public List<UserApp> LstApps
        {
            get
            {
                return lstApps;
            }
        }
        public UserPackage(string name, string id)
        {
            this.Name = name;
            this.Id = id;
        }
        public static void AddPackage(DataRow row, List<UserPackage> lstPackages)
        {
            UserPackage existingPackage = null;
            string pacakgeId = row["package_id"].ToString();
            foreach (UserPackage p in lstPackages)
            {
                if (p.Id == pacakgeId)
                {
                    existingPackage = p;
                }
            }
            if (existingPackage == null)
            {
                existingPackage = UserPackage.CreateNew(row);
                lstPackages.Add(existingPackage);
            }
            string applicationName = row["application_nm"].ToString();
            string databaseName = row["database_nm"].ToString();
            DateTime implementationDate = (DateTime)row["implementation_dt"];
            string errorLogLevel = row["error_log_level"].ToString();
            string logFileSizeInMb = row["log_file_size_in_mb"].ToString();
            string reportTitle = row["report_title"].ToString();
            string reportFooter = row["report_footer"].ToString();
            string path1 = row["path_1"].ToString();
            string path2 = row["path_2"].ToString();
            string path3 = row["path_3"].ToString();

            string argument1 = row["argument_1"].ToString();
            string argument2 = row["argument_2"].ToString();
            string argument3 = row["argument_3"].ToString();
            string argument4 = row["argument_4"].ToString();
            string argument5 = row["argument_5"].ToString();
            UserApp app = new UserApp();
            app.Name = applicationName;
            app.DatabaseName = databaseName;
            app.iImplementationDTM = implementationDate.ToString();
            app.LogFileSizeInMb = logFileSizeInMb;
            app.ReportTitle = reportTitle;
            app.ReportFooter = reportFooter;
            app.Path_1 = path1;
            app.Path_2 = path2;
            app.Path_3 = path3;
            app.Argument_1 = argument1;
            app.Argument_2 = argument2;
            app.Argument_3 = argument3;
            app.Argument_4 = argument4;
            app.Argument_5 = argument5;
            existingPackage.lstApps.Add(app);




        }
        public static UserPackage CreateNew(DataRow row)
        {
            string id = row["package_id"].ToString();
            string name = row["package_nm"].ToString();
            return new UserPackage(name, id);
        }

        internal static void AddPackage(List<UserPackage> lstPackages, DataRow row)
        {
            throw new NotImplementedException();
        }
    }
    public class UserApp
    {
        public string Name { get; set; }
        public string Id { get; set; }
        public string PackageId { get; set; }
        public string DatabaseName { get; set; }
        public string iImplementationDTM { get; set; }
        public string ErrorLogLevel { get; set; }
        public string LogFileSizeInMb { get; set; }
        public string ReportTitle { get; set; }
        public string ReportFooter { get; set; }
        public string Path_1 { get; set; }
        public string Path_2 { get; set; }
        public string Path_3 { get; set; }
        public string Argument_1 { get; set; }
        public string Argument_2 { get; set; }
        public string Argument_3 { get; set; }
        public string Argument_4 { get; set; }
        public string Argument_5 { get; set; }
        public UserApp Create(DataRow row)
        {
            UserApp app = null;
            return app;
        }
    }
}
