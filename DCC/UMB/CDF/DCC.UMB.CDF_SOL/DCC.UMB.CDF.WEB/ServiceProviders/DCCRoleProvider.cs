using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Security;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace DCC.UMB.CDF.WEB.ServiceProviders
{
    public class DCCRoleProvider : RoleProvider//System.Web.Security.Sql
    {
        public override string[] GetRolesForUser(string username)
        {
            using (SqlConnection con = GetMembershipSqlConnection())
            {
                SqlCommand command = con.CreateCommand();
                command.CommandType = CommandType.Text;
                command.CommandText = string.Format(@"select distinct user_role_id from user_privileges where USER_ID = '{0}'", username);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataSet dset = new DataSet();
                adapter.Fill(dset);
                List<string> lstRoles = new List<string>();
                foreach (DataRow row in dset.Tables[0].Rows)
                {
                    lstRoles.Add(row["user_role_id"].ToString());
                }
                return lstRoles.ToArray();
            }    
            //

        }
        public override bool IsUserInRole(string username, string roleName)
        {
            return GetRolesForUser(username).Contains(roleName);
        }
        public override void AddUsersToRoles(string[] usernames, string[] roleNames)
        {
            throw new NotImplementedException();
        }
        public override string ApplicationName
        {
            get
            {
                throw new NotImplementedException();
            }
            set
            {
                throw new NotImplementedException();
            }
        }
        public override void CreateRole(string roleName)
        {
            throw new NotImplementedException();
        }
        public override bool DeleteRole(string roleName, bool throwOnPopulatedRole)
        {
            throw new NotImplementedException();
        }        
        public override string[] FindUsersInRole(string roleName, string usernameToMatch)
        {
            throw new NotImplementedException();
        }
        public override string[] GetAllRoles()
        {
            throw new NotImplementedException();
        }
        public override string[] GetUsersInRole(string roleName)
        {
            throw new NotImplementedException();
        }
        public override void Initialize(string name, System.Collections.Specialized.NameValueCollection config)
        {
            base.Initialize(name, config);
        }
        public override void RemoveUsersFromRoles(string[] usernames, string[] roleNames)
        {
            throw new NotImplementedException();
        }
        public override bool RoleExists(string roleName)
        {
            throw new NotImplementedException();
        }
        private SqlConnection GetMembershipSqlConnection()
        {
            string sysAdminConString = ConfigurationManager.ConnectionStrings["SysAdminServices"].ConnectionString;
            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
            builder.ConnectionString = sysAdminConString;
            SqlConnection con = new SqlConnection(builder.ConnectionString);
            return con;
        }
    }
}
