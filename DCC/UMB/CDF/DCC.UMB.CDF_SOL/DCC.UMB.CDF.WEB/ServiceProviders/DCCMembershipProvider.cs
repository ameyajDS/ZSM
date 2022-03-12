using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.OleDb;
using System.Web.Security;


using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace DCC.UMB.CDF.WEB.ServiceProviders
{
    public class DCCMembershipProvider : MembershipProvider
    {
        

        public override void Initialize(string name, System.Collections.Specialized.NameValueCollection config)
        {
            try
            {
                base.Initialize(name, config);
                
            }
            catch (Exception ex)
            {
                throw;
            }
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

        public override bool ChangePassword(string username, string oldPassword, string newPassword)
        {
            throw new NotImplementedException();
        }

        public override bool ChangePasswordQuestionAndAnswer(string username, string password, string newPasswordQuestion, string newPasswordAnswer)
        {
            throw new NotImplementedException();
        }

        public override MembershipUser CreateUser(string username, string password, string email, string passwordQuestion, string passwordAnswer, bool isApproved, object providerUserKey, out MembershipCreateStatus status)
        {
            throw new Exception("Not allowed here, use Sysadmin Application to create user accounts");

        }

        public override bool DeleteUser(string username, bool deleteAllRelatedData)
        {
            throw new Exception("Not allowed here, use Sysadmin Application to create user accounts");
        }

        public override bool EnablePasswordReset
        {
            get { throw new NotImplementedException(); }
        }

        public override bool EnablePasswordRetrieval
        {
            get { throw new NotImplementedException(); }
        }

        public override MembershipUserCollection FindUsersByEmail(string emailToMatch, int pageIndex, int pageSize, out int totalRecords)
        {
            throw new NotImplementedException();
        }

        public override MembershipUserCollection FindUsersByName(string usernameToMatch, int pageIndex, int pageSize, out int totalRecords)
        {
            throw new NotImplementedException();
        }

        public override MembershipUserCollection GetAllUsers(int pageIndex, int pageSize, out int totalRecords)
        {
            throw new NotImplementedException();
        }

        public override int GetNumberOfUsersOnline()
        {
            throw new NotImplementedException();
        }

        public override string GetPassword(string username, string answer)
        {
            throw new NotImplementedException();
        }

        public override MembershipUser GetUser(string username, bool userIsOnline)
        {
            using (SqlConnection con = GetMembershipSqlConnection())
            {
                SqlCommand command = con.CreateCommand();
                command.CommandType = CommandType.Text;
                command.CommandText = string.Format(@"select u.* from all_users u join application_users au on (au.user_no = u.user_no) where u.user_id = '{0}'",username);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataSet dset = new DataSet();
                adapter.Fill(dset);
                int userNo = (int)dset.Tables[0].Rows[0]["user_no"];
                string userName = dset.Tables[0].Rows[0]["user_nm"].ToString();
                //string email = dset.Tables[0].Rows[0]["email_id"] != DBNull.Value ? dset.Tables[0].Rows[0]["email_id"].ToString() : null;
                MembershipUser user = new MembershipUser(this.Name, username, userNo.ToString(),null, null, null, true, false, default(DateTime), default(DateTime), default(DateTime), default(DateTime), default(DateTime));
                return user;
            }            
        }

        public override MembershipUser GetUser(object providerUserKey, bool userIsOnline)
        {
            throw new NotImplementedException();
        }

        public override string GetUserNameByEmail(string email)
        {
            throw new NotImplementedException();
        }

        public override int MaxInvalidPasswordAttempts
        {
            get { return 5; }
        }

        public override int MinRequiredNonAlphanumericCharacters
        {
            get { return 0; }
        }

        public override int MinRequiredPasswordLength
        {
            get { return 1; }
        }

        public override int PasswordAttemptWindow
        {
            get { throw new NotImplementedException(); }
        }

        public override MembershipPasswordFormat PasswordFormat
        {
            get { throw new NotImplementedException(); }
        }

        public override string PasswordStrengthRegularExpression
        {
            get { throw new NotImplementedException(); }
        }

        public override bool RequiresQuestionAndAnswer
        {
            get { return true; }
        }

        public override bool RequiresUniqueEmail
        {
            get { throw new NotImplementedException(); }
        }

        public override string ResetPassword(string username, string answer)
        {
            throw new NotImplementedException();
        }

        public override bool UnlockUser(string userName)
        {
            throw new NotImplementedException();
        }

        public override void UpdateUser(MembershipUser user)
        {
            throw new NotImplementedException();
        }
        public override bool ValidateUser(string username, string password)
        {
            bool isAuthenticated = false;
            //[[First try to validate this user with a password stored in the record itself
            using (SqlConnection con = GetMembershipSqlConnection())
            {
                try
                {
                    SqlCommand command = con.CreateCommand();
                    command.CommandType = CommandType.Text;
                    command.CommandText = string.Format("declare @out bit; EXEC WDF_AuthenticateUser '{0}', '{1}', @out output; select @out", username, password);
                    SqlDataAdapter adatper = new SqlDataAdapter(command);
                    DataSet dset = new DataSet();                    
                    adatper.Fill(dset);
                    isAuthenticated = Convert.ToBoolean(dset.Tables[0].Rows[0][0]);
                }
                catch (Exception ex)
                {
                    if (ex.Message.ToUpper().Contains("LOGIN FAILED FOR USER"))
                    {
                        return false;
                    }
                    throw;
                }
            }
            //]]
            //[[If the user cant be validated with the password in the record, then try to validate it with the sql surface logon
            if (!isAuthenticated)
            {
                
                
                //[[check if the user has its user_identity captured in the record, then dont try to validate against sql surface login
                using (SqlConnection con = GetMembershipSqlConnection())
                {
                    SqlCommand command = con.CreateCommand();
                    command.CommandType = CommandType.Text;
                    command.CommandText =string.Format(@"select case when user_identity is not null then convert(bit,1) else convert(bit,0) end as is_identity_present from application_users where user_id='{0}'", username);
                    SqlDataAdapter adatper = new SqlDataAdapter(command);
                    DataSet dset = new DataSet();
                    adatper.Fill(dset);

                    if (dset.Tables.Count > 0 && dset.Tables[0].Rows.Count > 0)
                    {//i.e. the userid is found in application_users table
                        bool isIdentityPresent = Convert.ToBoolean(dset.Tables[0].Rows[0][0]);
                        if (isIdentityPresent)
                        {//i.e. the identity is present in the record, but it didn't match with the given password
                            return false;
                        }
                    }
                    else
                    {//i.e. user id is not found in application_users table
                        return false;
                    }

                }
                //]]

                using (SqlConnection con = GetMembershipSqlConnection(username, password))
                {
                    try
                    {
                        con.Open();
                        SqlCommand command = con.CreateCommand();
                        command.CommandType = CommandType.Text;
                        command.CommandText = string.Format("declare @out bit; EXEC WDF_ChangePassword '{0}', '{1}',0, @out output", username, password);
                        command.ExecuteNonQuery();                        
                    }
                    catch (Exception ex)
                    {
                        if (ex.Message.ToUpper().Contains("LOGIN FAILED FOR USER"))
                        {
                            return false;
                        }
                        throw;
                    }
                }
            }
            //]]
            using (SqlConnection con = GetMembershipSqlConnection())
            {                
                 con.Open();                
                SqlCommand command = con.CreateCommand();
                command.CommandType = CommandType.Text;
                command.CommandText = @"SELECT is_locked FROM application_users WHERE user_id = '" + username + "'";
                object objIsLocked = command.ExecuteScalar();
                if (objIsLocked == null || objIsLocked == DBNull.Value || objIsLocked.ToString() == "Yes")
                {
                    return false;
                }
                MembershipUser user = GetUser(username, true);
                return true;
            }
        }
        public  bool ValidateUser1(string username, string password)
        {
            using (SqlConnection con = GetMembershipSqlConnection(username, password))
            {
                try
                {
                    con.Open();
                }
                catch (Exception ex)
                {
                    if (ex.Message.ToUpper().Contains("LOGIN FAILED FOR USER"))
                    {
                        return false;
                    }
                    throw;
                }
                SqlCommand command = con.CreateCommand();
                command.CommandType = CommandType.Text;
                command.CommandText= @"SELECT is_locked FROM application_users WHERE user_id = '" + username + "'";
                object objIsLocked = command.ExecuteScalar();
                if (objIsLocked == null || objIsLocked == DBNull.Value || objIsLocked.ToString() == "Yes")
                {
                    return false;
                }
                MembershipUser user = GetUser(username, true);
                return true;
            }
        }
       
        private SqlConnection GetMembershipSqlConnection(string username, string password)
        {
            string sysAdminConString = ConfigurationManager.ConnectionStrings["SysAdminServices"].ConnectionString;            
            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
            builder.ConnectionString = sysAdminConString;
            builder.UserID = username;
            builder.Password = password;
            SqlConnection con = new SqlConnection(builder.ConnectionString);
            return con;
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
