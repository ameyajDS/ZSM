using System;
using System.Collections.Generic;
using System.Text;
using DCC.UMB.CDF.DB;

using System.Data;
using DCC.UMB.CDF.Configuration;
using DCC.UMB.CDF.Log;
using DCC.UMB.CDF.Utils;
using System.Configuration;
using DCC.UMB.CDF.MGMT.Global;

namespace DCC.UMB.CDF.MGMT.Modal
{
    public class AppContext
    {
        internal enum CommandLineArgs
        {
            ApplicationId = 0,
            ApplicationName,
            PackageId,
            PackageName,
            VersionNumber,
            VersionDate,
            DatabaseName,
            ServerName,
            DSNName,
            UserId,
            UserNumber,
            UserName,
            UserRoleId,
            UserRoleIdentity,
            SessionId,
            IsQuerySession,
            LogLevel,
            LogFileSizeInMB,
            ReportTitle,
            ReportFooter,
            Path1,
            Path2,
            Path3,
            Argument1,
            Argument2,
            Argument3,
            Argument4,
            Argument5
        }
        private string[] arguments;
        private DataTable userScreenPrivilegesTable = null;
        private DataTable userActionPrivilegesTable = null;
        private DataTable applicationsTable = null;
        private DataTable packageMenusGroupsTable = null;
        private DataTable packageMenusTable = null;
        private DataTable userRoleGrantedActionsTable = null;
        private IDbManager dbManager = null;

        private bool isWebDBEnabled = false;
        private string cdfwsURL = null;
        internal AppContext(string commandLineArguments)
        {
            try
            {
                LoadCommandLineArguments(commandLineArguments);
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        internal IDbManager AppDbManager
        {
            get
            {
                return dbManager;
            }
        }
        internal void InitializeAppContext(string strCDFWSUrl)
        {
            if (string.IsNullOrEmpty(strCDFWSUrl))
            {
                dbManager = UtilityManager.CreateDBManagerInstance(this.ApplicationId); 
                //DbConnectionFactory.DataSource = this.ServerName;
                //DbConnectionFactory.UserId = this.UserRoleId;
                //DbConnectionFactory.Password = this.UserRoleIdentity;                
            }
            else
            {
                dbManager = new WebDbManager(this.ApplicationId, this.UserRoleId, this.ServerName, this.UserRoleIdentity, strCDFWSUrl);
                isWebDBEnabled = true;
                this.cdfwsURL = strCDFWSUrl;
            }
            LoadUserPrivileges();
        }

        internal string GetPrintableCommandLineArgs()
        {
            StringBuilder sb = new StringBuilder();
            foreach (CommandLineArgs args in Enum.GetValues(typeof(CommandLineArgs)))
            {
                sb.Append(args == CommandLineArgs.UserRoleIdentity ? "****" : this.arguments[(int)args]);
                sb.Append("|");
            }
            return sb.ToString();
        }

        public bool IsWebDBEnabled
        {
            get { return isWebDBEnabled; }
        }
        internal string DBWebServiceURL
        {
            get
            {
                return this.cdfwsURL;
            }
        }

        private void LoadUserPrivileges()
        {
            try
            {
                DataSet dset = dbManager.ExecuteSQL("sysadmin..qryApplicationContext '" + this.UserRoleId + "'");
                this.applicationsTable = dset.Tables[0];
                this.userScreenPrivilegesTable = dset.Tables[1];
                this.userActionPrivilegesTable = dset.Tables[2];
                this.packageMenusGroupsTable = dset.Tables[3];
                this.packageMenusTable = dset.Tables[4];
                this.userRoleGrantedActionsTable = dset.Tables[5];
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        private string LoadCommandLineArguments(string commandLineArguments)
        {
            if (string.IsNullOrEmpty(commandLineArguments))
            {
                throw new Exception("Command line arguments are missing");
            }
            //'see if the argument string does not have "|" in it then throw an error
            if (!commandLineArguments.Contains("|"))
            {
                throw new Exception("Command line arguments are invalid, separator '|' is missing");
            }
            //See if the command line arguments start with double quotes
            if (commandLineArguments.StartsWith("\""))
            {
                commandLineArguments = commandLineArguments.Substring(1);
            }

            //Remove the trailing double quote
            if (commandLineArguments.EndsWith("\""))
            {
                commandLineArguments = commandLineArguments.Substring(0, commandLineArguments.Length - 1);
            }
            ///[[Finally assign the command line arguments to the local string array *arguments*
            arguments = commandLineArguments.Split(new char[] { '|' }, StringSplitOptions.None);
            ///]]
            return commandLineArguments;
        }
        public string ApplicationId
        {
            get { return arguments[0]; }
        }
        public string ApplicationName
        {
            get { return arguments[1]; }
        }
        public string PackageId
        {
            get { return this.arguments[2]; }
        }
        public string PackageName
        {
            get { return this.arguments[3]; }
        }


        public string VersionNumber
        {
            get { return arguments[4]; }
        }
        public DateTime VersionDate
        {
            get { return DateTime.Parse(arguments[5]); }
        }

        public string DatabaseName
        {
            get { return this.arguments[6]; }
        }

        public string ServerName
        {
            get { return this.arguments[7]; }
        }

        public string DSNName
        {
            get { return this.arguments[8]; }
        }
        public string UserId
        {
            get { return this.arguments[9]; }
        }
        public int UserNumber
        {
            get { return int.Parse(this.arguments[10]); }
        }

        public string UserName
        {
            get { return this.arguments[11]; }
        }

        public string UserRoleId
        {
            get { return this.arguments[12]; }
        }


        public string UserRoleIdentity
        {
            get { return this.arguments[13]; }
        }

        public string SessionId
        {
            get { return this.arguments[14]; }
        }
        public int SessionIdAsInteger
        {
            get { return int.Parse(SessionId); }
        }
        public bool IsQuerySession
        {
            get { return DbManager.GetBool(this.arguments[15]); }
        }

        public LogLevels LogLevel
        {
            get { return (LogLevels)Enum.Parse(typeof(LogLevels), this.arguments[16], true); }
        }
        public int LogFileSizeInMB
        {
            get { return int.Parse(this.arguments[17]); }
        }
        public string ReportTitle
        {
            get { return this.arguments[18]; }
        }


        public string ReportFooter
        {
            get { return this.arguments[19]; }
        }
        public string Path1
        {
            get { return this.arguments[20]; }
        }
        public string Path2
        {
            get { return this.arguments[21]; }
        }
        public string Path3
        {
            get { return this.arguments[22]; }
        }
        public string Argument1
        {
            get { return this.arguments[23]; }
        }
        public string Argument2
        {
            get { return this.arguments[24]; }
        }
        public string Argument3
        {
            get { return this.arguments[25]; }
        }
        public string Argument4
        {
            get { return this.arguments[26]; }
        }
        public string Argument5
        {
            get { return this.arguments[27]; }
        }

        public int BrowseModeRetrivalBucketSize
        {
            //TODO this is hard coded to 25, this should be taken from the application arguments passed by application launcher.
            get { return 25; }
        }

        public DataTable UserScreenPrivilegesTable
        {
            get { return userScreenPrivilegesTable; }
            set { userScreenPrivilegesTable = value; }
        }

        public DataTable UserActionPrivilegesTable
        {
            get { return userActionPrivilegesTable; }
        }

        public DataTable ApplicationsTable
        {
            get { return applicationsTable; }
        }

        public DataTable PackageMenusGroupsTable
        {
            get { return packageMenusGroupsTable; }
        }

        public DataTable PackageMenusTable
        {
            get { return packageMenusTable; }
        }

        public DataTable UserRoleGrantedActionsTable
        {
            get { return userRoleGrantedActionsTable; }
        }

        internal string GetPackageName(string anApplicationId)
        {
            DataRow[] rows = this.ApplicationsTable.Select(string.Format("application_id = '{0}'", anApplicationId));
            if (rows.Length > 1)
            {
                throw new Exception("Multiple entries found having same applicationId");
            }
            if (rows.Length == 0)
            {
                throw new Exception("No entry found having applicationId: " + anApplicationId);
            }
            return rows[0]["package_id"].ToString();
        }

        internal string GetScreenName(string anApplicationId, string screenId)
        {
            string packageId = GetPackageName(anApplicationId);
            DataRow[] rows = this.UserScreenPrivilegesTable.Select(string.Format("screen_id = '{0}' AND package_id='{1}'", screenId, packageId));
            if (rows.Length > 1)
            {
                throw new Exception("Multiple entries found having same screen_id, package_id combination");
            }
            if (rows.Length == 0)
            {
                throw new Exception("No entry found having screen_id, package_id combination");
            }
            return rows[0]["screen_nm"].ToString();
        }


        internal bool IsInsertGranted(string screenId, string applicationId)
        {
            return CheckOperationGranted(screenId, applicationId, "is_insert_granted");
        }
        public bool IsSelectGranted(string screenId, string applicationId)
        {
            return CheckOperationGranted(screenId, applicationId, "is_select_granted");
        }

        public bool IsUpdateGranted(string screenId, string applicationId)
        {
            return CheckOperationGranted(screenId, applicationId, "is_update_granted");
        }

        public bool IsDeleteGranted(string screenId, string applicationId)
        {
            return CheckOperationGranted(screenId, applicationId, "is_delete_granted");
        }

        public bool IsPrintGranted(string screenId, string applicationId)
        {
            return CheckOperationGranted(screenId, applicationId, "is_print_granted");
        }


        internal bool IsInsertSupported(string screenId, string applicationId)
        {
            return CheckOperationSupported(screenId, applicationId, "is_insert_supported");
        }
        internal bool IsSelectSupported(string screenId, string applicationId)
        {
            return CheckOperationSupported(screenId, applicationId, "is_select_supported");
        }

        internal bool IsUpdateSupported(string screenId, string applicationId)
        {
            return CheckOperationSupported(screenId, applicationId, "is_update_supported");
        }

        internal bool IsDeleteSupported(string screenId, string applicationId)
        {
            return CheckOperationSupported(screenId, applicationId, "is_delete_supported");
        }

        internal bool IsPrintSupported(string screenId, string applicationId)
        {
            return CheckOperationSupported(screenId, applicationId, "is_print_supported");
        }


        private bool CheckOperationGranted(string screenId, string applicationId, string grantName)
        {
            string packageId = GetPackageName(applicationId);
            bool isGranted = false;
            DataRow[] rows =
                this.UserScreenPrivilegesTable.Select(
                    string.Format("{0}='Yes' AND screen_id = '{1}' AND package_id='{2}'", grantName, screenId, packageId));
            if (rows != null && rows.Length > 0)
            {
                isGranted = true;
            }

            return isGranted;
        }
        private bool CheckOperationSupported(string screenId, string applicationId, string supportName)
        {
            string packageId = GetPackageName(applicationId);
            bool isSupported = false;

            DataRow[] rows =
                this.UserScreenPrivilegesTable.Select(
                    string.Format("{0}='Yes' AND screen_id = '{1}' AND package_id='{2}'", supportName, screenId, packageId));
            if (rows != null && rows.Length > 0)
            {
                isSupported = true;
            }
            return isSupported;
        }
    }
}
