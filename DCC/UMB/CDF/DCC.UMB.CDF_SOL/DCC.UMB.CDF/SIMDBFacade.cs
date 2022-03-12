///This code is auto generated.
///Pls don't alter the contents of this file

using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using DCC.UMB.CDF.DB;
namespace DCC.DBFacade
{
    internal class SAMDbFacade
    {
        public DbManager ObjDBManager = null;
        public void BeginTrans() { ObjDBManager.BeginTrans(); }
        public void CommitTrans() { ObjDBManager.CommitTrans(); }
        public void RollbackTrans() { ObjDBManager.RollbackTrans(); }
        public SAMDbFacade(string applicationID) { this.ObjDBManager = new DbManager(applicationID); }

        public DataSet AlterBackupForUser(System.String p_user_id,
                                                        System.String p_operation)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter p_user_id_Parameter = ObjDBManager.CreateSqlParameter("p_user_id", p_user_id, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_user_id_Parameter);
            SqlParameter p_operation_Parameter = ObjDBManager.CreateSqlParameter("p_operation", p_operation, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_operation_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("AlterBackupForUser", sqlParameters);



            return dset;
        }



        public DataSet ChangeIdentity(System.String p_package_id,
                                                    System.String p_user_role_id)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter p_package_id_Parameter = ObjDBManager.CreateSqlParameter("p_package_id", p_package_id, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(p_package_id_Parameter);
            SqlParameter p_user_role_id_Parameter = ObjDBManager.CreateSqlParameter("p_user_role_id", p_user_role_id, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_user_role_id_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("ChangeIdentity", sqlParameters);



            return dset;
        }



        public DataSet ClearSingleSession(System.Int32? p_session_id)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter p_session_id_Parameter = ObjDBManager.CreateSqlParameter("p_session_id", p_session_id, SqlDbType.Int, ParameterDirection.Input);
            sqlParameters.Add(p_session_id_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("ClearSingleSession", sqlParameters);



            return dset;
        }



        public DataSet ClearUserSessions(System.Int32? p_user_no)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter p_user_no_Parameter = ObjDBManager.CreateSqlParameter("p_user_no", p_user_no, SqlDbType.Int, ParameterDirection.Input);
            sqlParameters.Add(p_user_no_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("ClearUserSessions", sqlParameters);



            return dset;
        }



        public DataSet CloseSession(System.Int32? p_user_no,
                                                System.String p_application_id,
                                                System.Int32? p_session_id)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter p_user_no_Parameter = ObjDBManager.CreateSqlParameter("p_user_no", p_user_no, SqlDbType.Int, ParameterDirection.Input);
            sqlParameters.Add(p_user_no_Parameter);
            SqlParameter p_application_id_Parameter = ObjDBManager.CreateSqlParameter("p_application_id", p_application_id, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(p_application_id_Parameter);
            SqlParameter p_session_id_Parameter = ObjDBManager.CreateSqlParameter("p_session_id", p_session_id, SqlDbType.Int, ParameterDirection.Input);
            sqlParameters.Add(p_session_id_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("CloseSession", sqlParameters);



            return dset;
        }



        public DataSet CreateRole(System.String p_package_id,
                                                System.String p_user_role_id,
                                                System.String p_user_role_nm,
                                                System.String p_executable_nm)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter p_package_id_Parameter = ObjDBManager.CreateSqlParameter("p_package_id", p_package_id, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(p_package_id_Parameter);
            SqlParameter p_user_role_id_Parameter = ObjDBManager.CreateSqlParameter("p_user_role_id", p_user_role_id, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_user_role_id_Parameter);
            SqlParameter p_user_role_nm_Parameter = ObjDBManager.CreateSqlParameter("p_user_role_nm", p_user_role_nm, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_user_role_nm_Parameter);
            SqlParameter p_executable_nm_Parameter = ObjDBManager.CreateSqlParameter("p_executable_nm", p_executable_nm, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_executable_nm_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("CreateRole", sqlParameters);



            return dset;
        }



        public DataSet CreateUser(System.String p_user_id,
                                                System.String p_user_nm,
                                                System.String p_password,
                                                System.String p_application_id,
                                                System.String p_user_role_id,
                                                ref System.Int32 p_user_no)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter p_user_id_Parameter = ObjDBManager.CreateSqlParameter("p_user_id", p_user_id, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_user_id_Parameter);
            SqlParameter p_user_nm_Parameter = ObjDBManager.CreateSqlParameter("p_user_nm", p_user_nm, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_user_nm_Parameter);
            SqlParameter p_password_Parameter = ObjDBManager.CreateSqlParameter("p_password", p_password, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_password_Parameter);
            SqlParameter p_application_id_Parameter = ObjDBManager.CreateSqlParameter("p_application_id", p_application_id, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(p_application_id_Parameter);
            SqlParameter p_user_role_id_Parameter = ObjDBManager.CreateSqlParameter("p_user_role_id", p_user_role_id, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_user_role_id_Parameter);
            SqlParameter p_user_no_Parameter = ObjDBManager.CreateSqlParameter("p_user_no", p_user_no, SqlDbType.Int, ParameterDirection.Output);
            sqlParameters.Add(p_user_no_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("CreateUser", sqlParameters);


            p_user_no = (System.Int32)p_user_no_Parameter.Value;

            return dset;
        }



        public DataSet DeleteUser(System.String p_user_id)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter p_user_id_Parameter = ObjDBManager.CreateSqlParameter("p_user_id", p_user_id, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_user_id_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("DeleteUser", sqlParameters);



            return dset;
        }



        public DataSet DelUserRoleGrantedAction(System.String package_id,
                                                            System.String user_role_id,
                                                            System.String screen_id,
                                                            System.String action_id)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter package_id_Parameter = ObjDBManager.CreateSqlParameter("package_id", package_id, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(package_id_Parameter);
            SqlParameter user_role_id_Parameter = ObjDBManager.CreateSqlParameter("user_role_id", user_role_id, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(user_role_id_Parameter);
            SqlParameter screen_id_Parameter = ObjDBManager.CreateSqlParameter("screen_id", screen_id, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(screen_id_Parameter);
            SqlParameter action_id_Parameter = ObjDBManager.CreateSqlParameter("action_id", action_id, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(action_id_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("DelUserRoleGrantedAction", sqlParameters);



            return dset;
        }



        public DataSet DelUserRolePrivilege(System.String package_id,
                                                        System.String user_role_id,
                                                        System.String screen_id)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter package_id_Parameter = ObjDBManager.CreateSqlParameter("package_id", package_id, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(package_id_Parameter);
            SqlParameter user_role_id_Parameter = ObjDBManager.CreateSqlParameter("user_role_id", user_role_id, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(user_role_id_Parameter);
            SqlParameter screen_id_Parameter = ObjDBManager.CreateSqlParameter("screen_id", screen_id, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(screen_id_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("DelUserRolePrivilege", sqlParameters);



            return dset;
        }



        public DataSet DropRole(System.String p_package_id,
                                            System.String p_user_role_id)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter p_package_id_Parameter = ObjDBManager.CreateSqlParameter("p_package_id", p_package_id, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(p_package_id_Parameter);
            SqlParameter p_user_role_id_Parameter = ObjDBManager.CreateSqlParameter("p_user_role_id", p_user_role_id, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_user_role_id_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("DropRole", sqlParameters);



            return dset;
        }



        public DataSet DropUser(System.String p_user_id)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter p_user_id_Parameter = ObjDBManager.CreateSqlParameter("p_user_id", p_user_id, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_user_id_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("DropUser", sqlParameters);



            return dset;
        }



        public DataSet GetActiveSessions(System.Int32? p_user_no,
                                                    ref System.Int32 p_sessions_cnt,
                                                    ref System.String p_application_id)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter p_user_no_Parameter = ObjDBManager.CreateSqlParameter("p_user_no", p_user_no, SqlDbType.Int, ParameterDirection.Input);
            sqlParameters.Add(p_user_no_Parameter);
            SqlParameter p_sessions_cnt_Parameter = ObjDBManager.CreateSqlParameter("p_sessions_cnt", p_sessions_cnt, SqlDbType.Int, ParameterDirection.Output);
            sqlParameters.Add(p_sessions_cnt_Parameter);
            SqlParameter p_application_id_Parameter = ObjDBManager.CreateSqlParameter("p_application_id", p_application_id, SqlDbType.Char, ParameterDirection.Output);
            sqlParameters.Add(p_application_id_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("GetActiveSessions", sqlParameters);


            p_sessions_cnt = (System.Int32)p_sessions_cnt_Parameter.Value;
            p_application_id = (System.String)p_application_id_Parameter.Value;

            return dset;
        }



        public DataSet GetApplicationUserRoles(System.String p_package_id,
                                                            System.String p_application_id)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter p_package_id_Parameter = ObjDBManager.CreateSqlParameter("p_package_id", p_package_id, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_package_id_Parameter);
            SqlParameter p_application_id_Parameter = ObjDBManager.CreateSqlParameter("p_application_id", p_application_id, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_application_id_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("GetApplicationUserRoles", sqlParameters);



            return dset;
        }



        public DataSet GetAuditInformationDetails(System.String p_package_id,
                                                                System.String p_application_id)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter p_package_id_Parameter = ObjDBManager.CreateSqlParameter("p_package_id", p_package_id, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(p_package_id_Parameter);
            SqlParameter p_application_id_Parameter = ObjDBManager.CreateSqlParameter("p_application_id", p_application_id, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(p_application_id_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("GetAuditInformationDetails", sqlParameters);



            return dset;
        }



        public DataSet GetIdentity(ref System.String p_user_role_identity,
                                                ref System.String p_encrypted_id)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter p_user_role_identity_Parameter = ObjDBManager.CreateSqlParameter("p_user_role_identity", p_user_role_identity, SqlDbType.VarChar, ParameterDirection.Output);
            sqlParameters.Add(p_user_role_identity_Parameter);
            SqlParameter p_encrypted_id_Parameter = ObjDBManager.CreateSqlParameter("p_encrypted_id", p_encrypted_id, SqlDbType.VarChar, ParameterDirection.Output);
            sqlParameters.Add(p_encrypted_id_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("GetIdentity", sqlParameters);


            p_user_role_identity = (System.String)p_user_role_identity_Parameter.Value;
            p_encrypted_id = (System.String)p_encrypted_id_Parameter.Value;

            return dset;
        }



        public DataSet GetMessageDetails(System.Int32? p_session_id)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter p_session_id_Parameter = ObjDBManager.CreateSqlParameter("p_session_id", p_session_id, SqlDbType.Int, ParameterDirection.Input);
            sqlParameters.Add(p_session_id_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("GetMessageDetails", sqlParameters);



            return dset;
        }



        public DataSet GetOtherMachineSessions(System.Int32? p_user_no,
                                                            System.String p_current_machine_nm,
                                                            ref System.Int32 p_sessions_cnt,
                                                            ref System.String p_application_id,
                                                            ref System.String p_machine_nm)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter p_user_no_Parameter = ObjDBManager.CreateSqlParameter("p_user_no", p_user_no, SqlDbType.Int, ParameterDirection.Input);
            sqlParameters.Add(p_user_no_Parameter);
            SqlParameter p_current_machine_nm_Parameter = ObjDBManager.CreateSqlParameter("p_current_machine_nm", p_current_machine_nm, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_current_machine_nm_Parameter);
            SqlParameter p_sessions_cnt_Parameter = ObjDBManager.CreateSqlParameter("p_sessions_cnt", p_sessions_cnt, SqlDbType.Int, ParameterDirection.Output);
            sqlParameters.Add(p_sessions_cnt_Parameter);
            SqlParameter p_application_id_Parameter = ObjDBManager.CreateSqlParameter("p_application_id", p_application_id, SqlDbType.Char, ParameterDirection.Output);
            sqlParameters.Add(p_application_id_Parameter);
            SqlParameter p_machine_nm_Parameter = ObjDBManager.CreateSqlParameter("p_machine_nm", p_machine_nm, SqlDbType.VarChar, ParameterDirection.Output);
            sqlParameters.Add(p_machine_nm_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("GetOtherMachineSessions", sqlParameters);


            p_sessions_cnt = (System.Int32)p_sessions_cnt_Parameter.Value;
            p_application_id = (System.String)p_application_id_Parameter.Value;
            p_machine_nm = (System.String)p_machine_nm_Parameter.Value;

            return dset;
        }



        public DataSet GetPackageDatabases(System.String p_package_id)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter p_package_id_Parameter = ObjDBManager.CreateSqlParameter("p_package_id", p_package_id, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(p_package_id_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("GetPackageDatabases", sqlParameters);



            return dset;
        }



        public DataSet GetPackageExecutables(System.String p_package_id)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter p_package_id_Parameter = ObjDBManager.CreateSqlParameter("p_package_id", p_package_id, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(p_package_id_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("GetPackageExecutables", sqlParameters);



            return dset;
        }



        public DataSet GetPackages(System.String p_package_id,
                                                System.String p_package_nm)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter p_package_id_Parameter = ObjDBManager.CreateSqlParameter("p_package_id", p_package_id, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_package_id_Parameter);
            SqlParameter p_package_nm_Parameter = ObjDBManager.CreateSqlParameter("p_package_nm", p_package_nm, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_package_nm_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("GetPackages", sqlParameters);



            return dset;
        }



        public DataSet GetPackageUserRoles(System.String p_package_id)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter p_package_id_Parameter = ObjDBManager.CreateSqlParameter("p_package_id", p_package_id, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_package_id_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("GetPackageUserRoles", sqlParameters);



            return dset;
        }



        public DataSet GetUserDetails(System.String p_user_id)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter p_user_id_Parameter = ObjDBManager.CreateSqlParameter("p_user_id", p_user_id, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_user_id_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("GetUserDetails", sqlParameters);



            return dset;
        }



        public DataSet GetUserRoleIdentity(System.String p_user_role_id,
                                                        ref System.String p_user_role_identity)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter p_user_role_id_Parameter = ObjDBManager.CreateSqlParameter("p_user_role_id", p_user_role_id, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_user_role_id_Parameter);
            SqlParameter p_user_role_identity_Parameter = ObjDBManager.CreateSqlParameter("p_user_role_identity", p_user_role_identity, SqlDbType.VarChar, ParameterDirection.Output);
            sqlParameters.Add(p_user_role_identity_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("GetUserRoleIdentity", sqlParameters);


            p_user_role_identity = (System.String)p_user_role_identity_Parameter.Value;

            return dset;
        }



        public DataSet IdentifyUserRole(System.String p_package_id,
                                                    System.String p_user_role_id,
                                                    ref System.String p_user_role_identity)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter p_package_id_Parameter = ObjDBManager.CreateSqlParameter("p_package_id", p_package_id, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(p_package_id_Parameter);
            SqlParameter p_user_role_id_Parameter = ObjDBManager.CreateSqlParameter("p_user_role_id", p_user_role_id, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_user_role_id_Parameter);
            SqlParameter p_user_role_identity_Parameter = ObjDBManager.CreateSqlParameter("p_user_role_identity", p_user_role_identity, SqlDbType.VarChar, ParameterDirection.Output);
            sqlParameters.Add(p_user_role_identity_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("IdentifyUserRole", sqlParameters);


            p_user_role_identity = (System.String)p_user_role_identity_Parameter.Value;

            return dset;
        }



        public DataSet InitialiseSession(System.Int32? p_user_no,
                                                    System.String p_machine_nm,
                                                    System.String p_application_id,
                                                    System.String p_user_role_id,
                                                    ref System.String p_is_query_session,
                                                    ref System.Int32 p_session_id)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter p_user_no_Parameter = ObjDBManager.CreateSqlParameter("p_user_no", p_user_no, SqlDbType.Int, ParameterDirection.Input);
            sqlParameters.Add(p_user_no_Parameter);
            SqlParameter p_machine_nm_Parameter = ObjDBManager.CreateSqlParameter("p_machine_nm", p_machine_nm, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_machine_nm_Parameter);
            SqlParameter p_application_id_Parameter = ObjDBManager.CreateSqlParameter("p_application_id", p_application_id, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(p_application_id_Parameter);
            SqlParameter p_user_role_id_Parameter = ObjDBManager.CreateSqlParameter("p_user_role_id", p_user_role_id, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_user_role_id_Parameter);
            SqlParameter p_is_query_session_Parameter = ObjDBManager.CreateSqlParameter("p_is_query_session", p_is_query_session, SqlDbType.Char, ParameterDirection.Output);
            sqlParameters.Add(p_is_query_session_Parameter);
            SqlParameter p_session_id_Parameter = ObjDBManager.CreateSqlParameter("p_session_id", p_session_id, SqlDbType.Int, ParameterDirection.Output);
            sqlParameters.Add(p_session_id_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("InitialiseSession", sqlParameters);


            p_is_query_session = (System.String)p_is_query_session_Parameter.Value;
            p_session_id = (System.Int32)p_session_id_Parameter.Value;

            return dset;
        }



        public DataSet InsApplication(System.String application_id,
                                                    System.String application_nm,
                                                    System.String package_id,
                                                    System.String database_nm,
                                                    System.DateTime? implementation_dt,
                                                    System.String error_log_level,
                                                    System.Byte? log_file_size_in_mb,
                                                    System.String report_title,
                                                    System.String report_footer,
                                                    System.String path_1,
                                                    System.String path_2,
                                                    System.String path_3,
                                                    System.String argument_1,
                                                    System.String argument_2,
                                                    System.String argument_3,
                                                    System.String argument_4,
                                                    System.String argument_5)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter application_id_Parameter = ObjDBManager.CreateSqlParameter("application_id", application_id, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(application_id_Parameter);
            SqlParameter application_nm_Parameter = ObjDBManager.CreateSqlParameter("application_nm", application_nm, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(application_nm_Parameter);
            SqlParameter package_id_Parameter = ObjDBManager.CreateSqlParameter("package_id", package_id, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(package_id_Parameter);
            SqlParameter database_nm_Parameter = ObjDBManager.CreateSqlParameter("database_nm", database_nm, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(database_nm_Parameter);
            SqlParameter implementation_dt_Parameter = ObjDBManager.CreateSqlParameter("implementation_dt", implementation_dt, SqlDbType.SmallDateTime, ParameterDirection.Input);
            sqlParameters.Add(implementation_dt_Parameter);
            SqlParameter error_log_level_Parameter = ObjDBManager.CreateSqlParameter("error_log_level", error_log_level, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(error_log_level_Parameter);
            SqlParameter log_file_size_in_mb_Parameter = ObjDBManager.CreateSqlParameter("log_file_size_in_mb", log_file_size_in_mb, SqlDbType.TinyInt, ParameterDirection.Input);
            sqlParameters.Add(log_file_size_in_mb_Parameter);
            SqlParameter report_title_Parameter = ObjDBManager.CreateSqlParameter("report_title", report_title, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(report_title_Parameter);
            SqlParameter report_footer_Parameter = ObjDBManager.CreateSqlParameter("report_footer", report_footer, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(report_footer_Parameter);
            SqlParameter path_1_Parameter = ObjDBManager.CreateSqlParameter("path_1", path_1, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(path_1_Parameter);
            SqlParameter path_2_Parameter = ObjDBManager.CreateSqlParameter("path_2", path_2, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(path_2_Parameter);
            SqlParameter path_3_Parameter = ObjDBManager.CreateSqlParameter("path_3", path_3, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(path_3_Parameter);
            SqlParameter argument_1_Parameter = ObjDBManager.CreateSqlParameter("argument_1", argument_1, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(argument_1_Parameter);
            SqlParameter argument_2_Parameter = ObjDBManager.CreateSqlParameter("argument_2", argument_2, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(argument_2_Parameter);
            SqlParameter argument_3_Parameter = ObjDBManager.CreateSqlParameter("argument_3", argument_3, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(argument_3_Parameter);
            SqlParameter argument_4_Parameter = ObjDBManager.CreateSqlParameter("argument_4", argument_4, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(argument_4_Parameter);
            SqlParameter argument_5_Parameter = ObjDBManager.CreateSqlParameter("argument_5", argument_5, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(argument_5_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("InsApplication", sqlParameters);



            return dset;
        }



        public DataSet InsLogMessage(System.Int32? session_id,
                                                System.String message_cd,
                                                System.String severity_level,
                                                System.DateTime? message_dts,
                                                System.String screen_id,
                                                System.String screen_mode,
                                                System.String message_information,
                                                System.String other_information,
                                                System.String stack_trace)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter session_id_Parameter = ObjDBManager.CreateSqlParameter("session_id", session_id, SqlDbType.Int, ParameterDirection.Input);
            sqlParameters.Add(session_id_Parameter);
            SqlParameter message_cd_Parameter = ObjDBManager.CreateSqlParameter("message_cd", message_cd, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(message_cd_Parameter);
            SqlParameter severity_level_Parameter = ObjDBManager.CreateSqlParameter("severity_level", severity_level, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(severity_level_Parameter);
            SqlParameter message_dts_Parameter = ObjDBManager.CreateSqlParameter("message_dts", message_dts, SqlDbType.DateTime, ParameterDirection.Input);
            sqlParameters.Add(message_dts_Parameter);
            SqlParameter screen_id_Parameter = ObjDBManager.CreateSqlParameter("screen_id", screen_id, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(screen_id_Parameter);
            SqlParameter screen_mode_Parameter = ObjDBManager.CreateSqlParameter("screen_mode", screen_mode, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(screen_mode_Parameter);
            SqlParameter message_information_Parameter = ObjDBManager.CreateSqlParameter("message_information", message_information, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(message_information_Parameter);
            SqlParameter other_information_Parameter = ObjDBManager.CreateSqlParameter("other_information", other_information, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(other_information_Parameter);
            SqlParameter stack_trace_Parameter = ObjDBManager.CreateSqlParameter("stack_trace", stack_trace, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(stack_trace_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("InsLogMessage", sqlParameters);



            return dset;
        }



        public DataSet InsPackage(System.String package_id,
                                                System.String package_nm,
                                                System.Decimal? version_no,
                                                System.DateTime? version_dt,
                                                System.String server_distribution_root,
                                                System.String client_default_root)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter package_id_Parameter = ObjDBManager.CreateSqlParameter("package_id", package_id, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(package_id_Parameter);
            SqlParameter package_nm_Parameter = ObjDBManager.CreateSqlParameter("package_nm", package_nm, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(package_nm_Parameter);
            SqlParameter version_no_Parameter = ObjDBManager.CreateSqlParameter("version_no", version_no, SqlDbType.Decimal, ParameterDirection.Input);
            sqlParameters.Add(version_no_Parameter);
            SqlParameter version_dt_Parameter = ObjDBManager.CreateSqlParameter("version_dt", version_dt, SqlDbType.SmallDateTime, ParameterDirection.Input);
            sqlParameters.Add(version_dt_Parameter);
            SqlParameter server_distribution_root_Parameter = ObjDBManager.CreateSqlParameter("server_distribution_root", server_distribution_root, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(server_distribution_root_Parameter);
            SqlParameter client_default_root_Parameter = ObjDBManager.CreateSqlParameter("client_default_root", client_default_root, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(client_default_root_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("InsPackage", sqlParameters);



            return dset;
        }



        public DataSet InsPackageDatabase(System.String package_id,
                                                        System.String database_nm,
                                                        System.String server_nm,
                                                        System.String dsn_nm,
                                                        System.String backup_path)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter package_id_Parameter = ObjDBManager.CreateSqlParameter("package_id", package_id, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(package_id_Parameter);
            SqlParameter database_nm_Parameter = ObjDBManager.CreateSqlParameter("database_nm", database_nm, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(database_nm_Parameter);
            SqlParameter server_nm_Parameter = ObjDBManager.CreateSqlParameter("server_nm", server_nm, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(server_nm_Parameter);
            SqlParameter dsn_nm_Parameter = ObjDBManager.CreateSqlParameter("dsn_nm", dsn_nm, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(dsn_nm_Parameter);
            SqlParameter backup_path_Parameter = ObjDBManager.CreateSqlParameter("backup_path", backup_path, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(backup_path_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("InsPackageDatabase", sqlParameters);



            return dset;
        }



        public DataSet InsPackageMenu(System.Int32? group_id,
                                                    System.String menu_nm,
                                                    System.String menu_desc,
                                                    System.String screen_params,
                                                    System.String ctrl_key_accessor,
                                                    System.Int16? display_order)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter group_id_Parameter = ObjDBManager.CreateSqlParameter("group_id", group_id, SqlDbType.Int, ParameterDirection.Input);
            sqlParameters.Add(group_id_Parameter);
            SqlParameter menu_nm_Parameter = ObjDBManager.CreateSqlParameter("menu_nm", menu_nm, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(menu_nm_Parameter);
            SqlParameter menu_desc_Parameter = ObjDBManager.CreateSqlParameter("menu_desc", menu_desc, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(menu_desc_Parameter);
            SqlParameter screen_params_Parameter = ObjDBManager.CreateSqlParameter("screen_params", screen_params, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(screen_params_Parameter);
            SqlParameter ctrl_key_accessor_Parameter = ObjDBManager.CreateSqlParameter("ctrl_key_accessor", ctrl_key_accessor, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(ctrl_key_accessor_Parameter);
            SqlParameter display_order_Parameter = ObjDBManager.CreateSqlParameter("display_order", display_order, SqlDbType.SmallInt, ParameterDirection.Input);
            sqlParameters.Add(display_order_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("InsPackageMenu", sqlParameters);



            return dset;
        }



        public DataSet InsPackageMenuGroup(System.String package_id,
                                                        System.Int32? parent_group_id,
                                                        System.String group_nm,
                                                        System.String group_desc,
                                                        System.String ctrl_key_accessor,
                                                        System.Int16? display_order)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter package_id_Parameter = ObjDBManager.CreateSqlParameter("package_id", package_id, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(package_id_Parameter);
            SqlParameter parent_group_id_Parameter = ObjDBManager.CreateSqlParameter("parent_group_id", parent_group_id, SqlDbType.Int, ParameterDirection.Input);
            sqlParameters.Add(parent_group_id_Parameter);
            SqlParameter group_nm_Parameter = ObjDBManager.CreateSqlParameter("group_nm", group_nm, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(group_nm_Parameter);
            SqlParameter group_desc_Parameter = ObjDBManager.CreateSqlParameter("group_desc", group_desc, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(group_desc_Parameter);
            SqlParameter ctrl_key_accessor_Parameter = ObjDBManager.CreateSqlParameter("ctrl_key_accessor", ctrl_key_accessor, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(ctrl_key_accessor_Parameter);
            SqlParameter display_order_Parameter = ObjDBManager.CreateSqlParameter("display_order", display_order, SqlDbType.SmallInt, ParameterDirection.Input);
            sqlParameters.Add(display_order_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("InsPackageMenuGroup", sqlParameters);



            return dset;
        }



        public DataSet InsPackageMenuGroups(System.String Package_Id,
                                                        System.Int32? Parent_Group_id,
                                                        System.String Group_nm,
                                                        System.String Group_desc,
                                                        System.String ctrl_key_accessor,
                                                        System.Int16? display_order)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter Package_Id_Parameter = ObjDBManager.CreateSqlParameter("Package_Id", Package_Id, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(Package_Id_Parameter);
            SqlParameter Parent_Group_id_Parameter = ObjDBManager.CreateSqlParameter("Parent_Group_id", Parent_Group_id, SqlDbType.Int, ParameterDirection.Input);
            sqlParameters.Add(Parent_Group_id_Parameter);
            SqlParameter Group_nm_Parameter = ObjDBManager.CreateSqlParameter("Group_nm", Group_nm, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(Group_nm_Parameter);
            SqlParameter Group_desc_Parameter = ObjDBManager.CreateSqlParameter("Group_desc", Group_desc, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(Group_desc_Parameter);
            SqlParameter ctrl_key_accessor_Parameter = ObjDBManager.CreateSqlParameter("ctrl_key_accessor", ctrl_key_accessor, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(ctrl_key_accessor_Parameter);
            SqlParameter display_order_Parameter = ObjDBManager.CreateSqlParameter("display_order", display_order, SqlDbType.SmallInt, ParameterDirection.Input);
            sqlParameters.Add(display_order_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("InsPackageMenuGroups", sqlParameters);



            return dset;
        }



        public DataSet InsPackageScreen(System.String package_id,
                                                    System.String screen_id,
                                                    System.String screen_nm,
                                                    System.String is_select_supported,
                                                    System.String is_insert_supported,
                                                    System.String is_update_supported,
                                                    System.String is_delete_supported,
                                                    System.String is_print_supported,
                                                    System.String is_update_changes_supported,
                                                    System.String is_delete_changes_supported,
                                                    System.String is_partial_save_supported)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter package_id_Parameter = ObjDBManager.CreateSqlParameter("package_id", package_id, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(package_id_Parameter);
            SqlParameter screen_id_Parameter = ObjDBManager.CreateSqlParameter("screen_id", screen_id, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(screen_id_Parameter);
            SqlParameter screen_nm_Parameter = ObjDBManager.CreateSqlParameter("screen_nm", screen_nm, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(screen_nm_Parameter);
            SqlParameter is_select_supported_Parameter = ObjDBManager.CreateSqlParameter("is_select_supported", is_select_supported, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(is_select_supported_Parameter);
            SqlParameter is_insert_supported_Parameter = ObjDBManager.CreateSqlParameter("is_insert_supported", is_insert_supported, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(is_insert_supported_Parameter);
            SqlParameter is_update_supported_Parameter = ObjDBManager.CreateSqlParameter("is_update_supported", is_update_supported, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(is_update_supported_Parameter);
            SqlParameter is_delete_supported_Parameter = ObjDBManager.CreateSqlParameter("is_delete_supported", is_delete_supported, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(is_delete_supported_Parameter);
            SqlParameter is_print_supported_Parameter = ObjDBManager.CreateSqlParameter("is_print_supported", is_print_supported, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(is_print_supported_Parameter);
            SqlParameter is_update_changes_supported_Parameter = ObjDBManager.CreateSqlParameter("is_update_changes_supported", is_update_changes_supported, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(is_update_changes_supported_Parameter);
            SqlParameter is_delete_changes_supported_Parameter = ObjDBManager.CreateSqlParameter("is_delete_changes_supported", is_delete_changes_supported, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(is_delete_changes_supported_Parameter);
            SqlParameter is_partial_save_supported_Parameter = ObjDBManager.CreateSqlParameter("is_partial_save_supported", is_partial_save_supported, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(is_partial_save_supported_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("InsPackageScreen", sqlParameters);



            return dset;
        }



        public DataSet InsPackageScreenAction(System.String package_id,
                                                            System.String screen_id,
                                                            System.String action_id)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter package_id_Parameter = ObjDBManager.CreateSqlParameter("package_id", package_id, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(package_id_Parameter);
            SqlParameter screen_id_Parameter = ObjDBManager.CreateSqlParameter("screen_id", screen_id, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(screen_id_Parameter);
            SqlParameter action_id_Parameter = ObjDBManager.CreateSqlParameter("action_id", action_id, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(action_id_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("InsPackageScreenAction", sqlParameters);



            return dset;
        }



        public DataSet InsUpdRevUserPrivileges(System.String p_user_id,
                                                            System.String p_user_role_id,
                                                            System.String p_application_id,
                                                            System.String p_is_backup_allowed,
                                                            System.String p_mode)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter p_user_id_Parameter = ObjDBManager.CreateSqlParameter("p_user_id", p_user_id, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_user_id_Parameter);
            SqlParameter p_user_role_id_Parameter = ObjDBManager.CreateSqlParameter("p_user_role_id", p_user_role_id, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_user_role_id_Parameter);
            SqlParameter p_application_id_Parameter = ObjDBManager.CreateSqlParameter("p_application_id", p_application_id, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(p_application_id_Parameter);
            SqlParameter p_is_backup_allowed_Parameter = ObjDBManager.CreateSqlParameter("p_is_backup_allowed", p_is_backup_allowed, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(p_is_backup_allowed_Parameter);
            SqlParameter p_mode_Parameter = ObjDBManager.CreateSqlParameter("p_mode", p_mode, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(p_mode_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("InsUpdRevUserPrivileges", sqlParameters);



            return dset;
        }



        public DataSet InsUserRoleGrantedAction(System.String package_id,
                                                            System.String user_role_id,
                                                            System.String screen_id,
                                                            System.String action_id,
                                                            System.Int32? display_order)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter package_id_Parameter = ObjDBManager.CreateSqlParameter("package_id", package_id, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(package_id_Parameter);
            SqlParameter user_role_id_Parameter = ObjDBManager.CreateSqlParameter("user_role_id", user_role_id, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(user_role_id_Parameter);
            SqlParameter screen_id_Parameter = ObjDBManager.CreateSqlParameter("screen_id", screen_id, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(screen_id_Parameter);
            SqlParameter action_id_Parameter = ObjDBManager.CreateSqlParameter("action_id", action_id, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(action_id_Parameter);
            SqlParameter display_order_Parameter = ObjDBManager.CreateSqlParameter("display_order", display_order, SqlDbType.Int, ParameterDirection.Input);
            sqlParameters.Add(display_order_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("InsUserRoleGrantedAction", sqlParameters);



            return dset;
        }



        public DataSet InsUserRolePrivilege(System.String package_id,
                                                        System.String user_role_id,
                                                        System.String screen_id,
                                                        System.String is_select_granted,
                                                        System.String is_insert_granted,
                                                        System.String is_update_granted,
                                                        System.String is_delete_granted,
                                                        System.String is_print_granted)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter package_id_Parameter = ObjDBManager.CreateSqlParameter("package_id", package_id, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(package_id_Parameter);
            SqlParameter user_role_id_Parameter = ObjDBManager.CreateSqlParameter("user_role_id", user_role_id, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(user_role_id_Parameter);
            SqlParameter screen_id_Parameter = ObjDBManager.CreateSqlParameter("screen_id", screen_id, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(screen_id_Parameter);
            SqlParameter is_select_granted_Parameter = ObjDBManager.CreateSqlParameter("is_select_granted", is_select_granted, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(is_select_granted_Parameter);
            SqlParameter is_insert_granted_Parameter = ObjDBManager.CreateSqlParameter("is_insert_granted", is_insert_granted, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(is_insert_granted_Parameter);
            SqlParameter is_update_granted_Parameter = ObjDBManager.CreateSqlParameter("is_update_granted", is_update_granted, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(is_update_granted_Parameter);
            SqlParameter is_delete_granted_Parameter = ObjDBManager.CreateSqlParameter("is_delete_granted", is_delete_granted, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(is_delete_granted_Parameter);
            SqlParameter is_print_granted_Parameter = ObjDBManager.CreateSqlParameter("is_print_granted", is_print_granted, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(is_print_granted_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("InsUserRolePrivilege", sqlParameters);



            return dset;
        }



        public DataSet IsUserIDExisting(System.String p_userID)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter p_userID_Parameter = ObjDBManager.CreateSqlParameter("p_userID", p_userID, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_userID_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("IsUserIDExisting", sqlParameters);



            return dset;
        }



        public DataSet LogOperation(System.Int32? p_session_id,
                                                System.String p_package_id,
                                                System.String p_application_id,
                                                System.Int32? p_user_no,
                                                System.String p_user_role_id,
                                                System.String p_operation,
                                                System.String p_screen_id,
                                                System.String p_object_id,
                                                System.String p_obj_user_id,
                                                System.String p_obj_application_id,
                                                System.String p_obj_user_role_id)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter p_session_id_Parameter = ObjDBManager.CreateSqlParameter("p_session_id", p_session_id, SqlDbType.Int, ParameterDirection.Input);
            sqlParameters.Add(p_session_id_Parameter);
            SqlParameter p_package_id_Parameter = ObjDBManager.CreateSqlParameter("p_package_id", p_package_id, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(p_package_id_Parameter);
            SqlParameter p_application_id_Parameter = ObjDBManager.CreateSqlParameter("p_application_id", p_application_id, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(p_application_id_Parameter);
            SqlParameter p_user_no_Parameter = ObjDBManager.CreateSqlParameter("p_user_no", p_user_no, SqlDbType.Int, ParameterDirection.Input);
            sqlParameters.Add(p_user_no_Parameter);
            SqlParameter p_user_role_id_Parameter = ObjDBManager.CreateSqlParameter("p_user_role_id", p_user_role_id, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_user_role_id_Parameter);
            SqlParameter p_operation_Parameter = ObjDBManager.CreateSqlParameter("p_operation", p_operation, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(p_operation_Parameter);
            SqlParameter p_screen_id_Parameter = ObjDBManager.CreateSqlParameter("p_screen_id", p_screen_id, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(p_screen_id_Parameter);
            SqlParameter p_object_id_Parameter = ObjDBManager.CreateSqlParameter("p_object_id", p_object_id, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_object_id_Parameter);
            SqlParameter p_obj_user_id_Parameter = ObjDBManager.CreateSqlParameter("p_obj_user_id", p_obj_user_id, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_obj_user_id_Parameter);
            SqlParameter p_obj_application_id_Parameter = ObjDBManager.CreateSqlParameter("p_obj_application_id", p_obj_application_id, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(p_obj_application_id_Parameter);
            SqlParameter p_obj_user_role_id_Parameter = ObjDBManager.CreateSqlParameter("p_obj_user_role_id", p_obj_user_role_id, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_obj_user_role_id_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("LogOperation", sqlParameters);



            return dset;
        }



        public DataSet QryUserRoleGrantedActions()
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            DataSet dset = ObjDBManager.ExecuteStoredProc("QryUserRoleGrantedActions", sqlParameters);



            return dset;
        }



        public DataSet QryUserRolePrivilege()
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            DataSet dset = ObjDBManager.ExecuteStoredProc("QryUserRolePrivilege", sqlParameters);



            return dset;
        }



        public DataSet RaiseErrorMessage(System.String p_message_cd,
                                                    System.String p_control_nm,
                                                    System.String p_arg_1,
                                                    System.String p_arg_2,
                                                    System.String p_arg_3)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter p_message_cd_Parameter = ObjDBManager.CreateSqlParameter("p_message_cd", p_message_cd, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_message_cd_Parameter);
            SqlParameter p_control_nm_Parameter = ObjDBManager.CreateSqlParameter("p_control_nm", p_control_nm, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_control_nm_Parameter);
            SqlParameter p_arg_1_Parameter = ObjDBManager.CreateSqlParameter("p_arg_1", p_arg_1, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_arg_1_Parameter);
            SqlParameter p_arg_2_Parameter = ObjDBManager.CreateSqlParameter("p_arg_2", p_arg_2, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_arg_2_Parameter);
            SqlParameter p_arg_3_Parameter = ObjDBManager.CreateSqlParameter("p_arg_3", p_arg_3, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_arg_3_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("RaiseErrorMessage", sqlParameters);



            return dset;
        }



        public DataSet RaiseFatalError(System.String p_message_cd,
                                                    System.String p_control_nm,
                                                    System.String p_arg_1,
                                                    System.String p_arg_2,
                                                    System.String p_arg_3)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter p_message_cd_Parameter = ObjDBManager.CreateSqlParameter("p_message_cd", p_message_cd, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_message_cd_Parameter);
            SqlParameter p_control_nm_Parameter = ObjDBManager.CreateSqlParameter("p_control_nm", p_control_nm, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_control_nm_Parameter);
            SqlParameter p_arg_1_Parameter = ObjDBManager.CreateSqlParameter("p_arg_1", p_arg_1, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_arg_1_Parameter);
            SqlParameter p_arg_2_Parameter = ObjDBManager.CreateSqlParameter("p_arg_2", p_arg_2, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_arg_2_Parameter);
            SqlParameter p_arg_3_Parameter = ObjDBManager.CreateSqlParameter("p_arg_3", p_arg_3, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_arg_3_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("RaiseFatalError", sqlParameters);



            return dset;
        }



        public DataSet RaiseSQLError(System.String p_type,
                                                System.String p_message_cd,
                                                System.String p_control_nm,
                                                System.String p_arg_1,
                                                System.String p_arg_2,
                                                System.String p_arg_3)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter p_type_Parameter = ObjDBManager.CreateSqlParameter("p_type", p_type, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_type_Parameter);
            SqlParameter p_message_cd_Parameter = ObjDBManager.CreateSqlParameter("p_message_cd", p_message_cd, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_message_cd_Parameter);
            SqlParameter p_control_nm_Parameter = ObjDBManager.CreateSqlParameter("p_control_nm", p_control_nm, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_control_nm_Parameter);
            SqlParameter p_arg_1_Parameter = ObjDBManager.CreateSqlParameter("p_arg_1", p_arg_1, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_arg_1_Parameter);
            SqlParameter p_arg_2_Parameter = ObjDBManager.CreateSqlParameter("p_arg_2", p_arg_2, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_arg_2_Parameter);
            SqlParameter p_arg_3_Parameter = ObjDBManager.CreateSqlParameter("p_arg_3", p_arg_3, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_arg_3_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("RaiseSQLError", sqlParameters);



            return dset;
        }



        public DataSet RaiseWarningMessage(System.String p_message_cd,
                                                        System.String p_control_nm,
                                                        System.String p_arg_1,
                                                        System.String p_arg_2,
                                                        System.String p_arg_3)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter p_message_cd_Parameter = ObjDBManager.CreateSqlParameter("p_message_cd", p_message_cd, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_message_cd_Parameter);
            SqlParameter p_control_nm_Parameter = ObjDBManager.CreateSqlParameter("p_control_nm", p_control_nm, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_control_nm_Parameter);
            SqlParameter p_arg_1_Parameter = ObjDBManager.CreateSqlParameter("p_arg_1", p_arg_1, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_arg_1_Parameter);
            SqlParameter p_arg_2_Parameter = ObjDBManager.CreateSqlParameter("p_arg_2", p_arg_2, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_arg_2_Parameter);
            SqlParameter p_arg_3_Parameter = ObjDBManager.CreateSqlParameter("p_arg_3", p_arg_3, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_arg_3_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("RaiseWarningMessage", sqlParameters);



            return dset;
        }



        public DataSet RetrieveAllActiveSessions(System.Int32? p_own_session_id)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter p_own_session_id_Parameter = ObjDBManager.CreateSqlParameter("p_own_session_id", p_own_session_id, SqlDbType.Int, ParameterDirection.Input);
            sqlParameters.Add(p_own_session_id_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("RetrieveAllActiveSessions", sqlParameters);



            return dset;
        }



        public DataSet RetrieveApplicationInformation(System.String p_package_nm,
                                                                    System.Int32? p_version_no,
                                                                    System.DateTime? p_version_dt,
                                                                    System.String p_application_id,
                                                                    System.String p_application_nm,
                                                                    System.DateTime? P_implementation_dt,
                                                                    System.String p_database_nm,
                                                                    System.String p_server_nm,
                                                                    System.String p_dsn_nm,
                                                                    System.String p_error_log_level,
                                                                    System.Byte? p_log_file_size_in_mb,
                                                                    System.String p_report_title,
                                                                    System.String p_report_footer,
                                                                    System.String p_path1,
                                                                    System.String p_path2,
                                                                    System.String p_path3,
                                                                    System.String p_argument1,
                                                                    System.String p_argument2,
                                                                    System.String p_argument3,
                                                                    System.String p_argument4,
                                                                    System.String p_argument5)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter p_package_nm_Parameter = ObjDBManager.CreateSqlParameter("p_package_nm", p_package_nm, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_package_nm_Parameter);
            SqlParameter p_version_no_Parameter = ObjDBManager.CreateSqlParameter("p_version_no", p_version_no, SqlDbType.Int, ParameterDirection.Input);
            sqlParameters.Add(p_version_no_Parameter);
            SqlParameter p_version_dt_Parameter = ObjDBManager.CreateSqlParameter("p_version_dt", p_version_dt, SqlDbType.SmallDateTime, ParameterDirection.Input);
            sqlParameters.Add(p_version_dt_Parameter);
            SqlParameter p_application_id_Parameter = ObjDBManager.CreateSqlParameter("p_application_id", p_application_id, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_application_id_Parameter);
            SqlParameter p_application_nm_Parameter = ObjDBManager.CreateSqlParameter("p_application_nm", p_application_nm, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_application_nm_Parameter);
            SqlParameter P_implementation_dt_Parameter = ObjDBManager.CreateSqlParameter("P_implementation_dt", P_implementation_dt, SqlDbType.SmallDateTime, ParameterDirection.Input);
            sqlParameters.Add(P_implementation_dt_Parameter);
            SqlParameter p_database_nm_Parameter = ObjDBManager.CreateSqlParameter("p_database_nm", p_database_nm, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_database_nm_Parameter);
            SqlParameter p_server_nm_Parameter = ObjDBManager.CreateSqlParameter("p_server_nm", p_server_nm, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_server_nm_Parameter);
            SqlParameter p_dsn_nm_Parameter = ObjDBManager.CreateSqlParameter("p_dsn_nm", p_dsn_nm, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_dsn_nm_Parameter);
            SqlParameter p_error_log_level_Parameter = ObjDBManager.CreateSqlParameter("p_error_log_level", p_error_log_level, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_error_log_level_Parameter);
            SqlParameter p_log_file_size_in_mb_Parameter = ObjDBManager.CreateSqlParameter("p_log_file_size_in_mb", p_log_file_size_in_mb, SqlDbType.TinyInt, ParameterDirection.Input);
            sqlParameters.Add(p_log_file_size_in_mb_Parameter);
            SqlParameter p_report_title_Parameter = ObjDBManager.CreateSqlParameter("p_report_title", p_report_title, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_report_title_Parameter);
            SqlParameter p_report_footer_Parameter = ObjDBManager.CreateSqlParameter("p_report_footer", p_report_footer, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_report_footer_Parameter);
            SqlParameter p_path1_Parameter = ObjDBManager.CreateSqlParameter("p_path1", p_path1, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_path1_Parameter);
            SqlParameter p_path2_Parameter = ObjDBManager.CreateSqlParameter("p_path2", p_path2, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_path2_Parameter);
            SqlParameter p_path3_Parameter = ObjDBManager.CreateSqlParameter("p_path3", p_path3, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_path3_Parameter);
            SqlParameter p_argument1_Parameter = ObjDBManager.CreateSqlParameter("p_argument1", p_argument1, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_argument1_Parameter);
            SqlParameter p_argument2_Parameter = ObjDBManager.CreateSqlParameter("p_argument2", p_argument2, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_argument2_Parameter);
            SqlParameter p_argument3_Parameter = ObjDBManager.CreateSqlParameter("p_argument3", p_argument3, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_argument3_Parameter);
            SqlParameter p_argument4_Parameter = ObjDBManager.CreateSqlParameter("p_argument4", p_argument4, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_argument4_Parameter);
            SqlParameter p_argument5_Parameter = ObjDBManager.CreateSqlParameter("p_argument5", p_argument5, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_argument5_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("RetrieveApplicationInformation", sqlParameters);



            return dset;
        }



        public DataSet RetrieveMessageLogInformation(System.Int32? p_session_id,
                                                                System.String p_application_nm,
                                                                System.String p_user_role_nm,
                                                                System.String p_user_nm,
                                                                System.Int32? p_user_no,
                                                                System.String p_machine_nm,
                                                                System.DateTime? p_start_dtm,
                                                                System.DateTime? p_finish_dtm,
                                                                System.DateTime? p_clear_dtm,
                                                                System.String p_is_query_session)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter p_session_id_Parameter = ObjDBManager.CreateSqlParameter("p_session_id", p_session_id, SqlDbType.Int, ParameterDirection.Input);
            sqlParameters.Add(p_session_id_Parameter);
            SqlParameter p_application_nm_Parameter = ObjDBManager.CreateSqlParameter("p_application_nm", p_application_nm, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_application_nm_Parameter);
            SqlParameter p_user_role_nm_Parameter = ObjDBManager.CreateSqlParameter("p_user_role_nm", p_user_role_nm, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_user_role_nm_Parameter);
            SqlParameter p_user_nm_Parameter = ObjDBManager.CreateSqlParameter("p_user_nm", p_user_nm, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_user_nm_Parameter);
            SqlParameter p_user_no_Parameter = ObjDBManager.CreateSqlParameter("p_user_no", p_user_no, SqlDbType.Int, ParameterDirection.Input);
            sqlParameters.Add(p_user_no_Parameter);
            SqlParameter p_machine_nm_Parameter = ObjDBManager.CreateSqlParameter("p_machine_nm", p_machine_nm, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_machine_nm_Parameter);
            SqlParameter p_start_dtm_Parameter = ObjDBManager.CreateSqlParameter("p_start_dtm", p_start_dtm, SqlDbType.DateTime, ParameterDirection.Input);
            sqlParameters.Add(p_start_dtm_Parameter);
            SqlParameter p_finish_dtm_Parameter = ObjDBManager.CreateSqlParameter("p_finish_dtm", p_finish_dtm, SqlDbType.DateTime, ParameterDirection.Input);
            sqlParameters.Add(p_finish_dtm_Parameter);
            SqlParameter p_clear_dtm_Parameter = ObjDBManager.CreateSqlParameter("p_clear_dtm", p_clear_dtm, SqlDbType.DateTime, ParameterDirection.Input);
            sqlParameters.Add(p_clear_dtm_Parameter);
            SqlParameter p_is_query_session_Parameter = ObjDBManager.CreateSqlParameter("p_is_query_session", p_is_query_session, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(p_is_query_session_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("RetrieveMessageLogInformation", sqlParameters);



            return dset;
        }



        public DataSet RetrievePackageApplications(System.String p_package_nm,
                                                                System.String p_application_nm,
                                                                System.String p_database_nm)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter p_package_nm_Parameter = ObjDBManager.CreateSqlParameter("p_package_nm", p_package_nm, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_package_nm_Parameter);
            SqlParameter p_application_nm_Parameter = ObjDBManager.CreateSqlParameter("p_application_nm", p_application_nm, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_application_nm_Parameter);
            SqlParameter p_database_nm_Parameter = ObjDBManager.CreateSqlParameter("p_database_nm", p_database_nm, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_database_nm_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("RetrievePackageApplications", sqlParameters);



            return dset;
        }



        public DataSet RetrievePackages(System.String p_package_id,
                                                    System.String p_package_nm,
                                                    System.Decimal? p_version_no,
                                                    System.DateTime? p_version_dt,
                                                    System.String p_server_distribution_root,
                                                    System.String p_client_default_root)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter p_package_id_Parameter = ObjDBManager.CreateSqlParameter("p_package_id", p_package_id, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_package_id_Parameter);
            SqlParameter p_package_nm_Parameter = ObjDBManager.CreateSqlParameter("p_package_nm", p_package_nm, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_package_nm_Parameter);
            SqlParameter p_version_no_Parameter = ObjDBManager.CreateSqlParameter("p_version_no", p_version_no, SqlDbType.Decimal, ParameterDirection.Input);
            sqlParameters.Add(p_version_no_Parameter);
            SqlParameter p_version_dt_Parameter = ObjDBManager.CreateSqlParameter("p_version_dt", p_version_dt, SqlDbType.SmallDateTime, ParameterDirection.Input);
            sqlParameters.Add(p_version_dt_Parameter);
            SqlParameter p_server_distribution_root_Parameter = ObjDBManager.CreateSqlParameter("p_server_distribution_root", p_server_distribution_root, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_server_distribution_root_Parameter);
            SqlParameter p_client_default_root_Parameter = ObjDBManager.CreateSqlParameter("p_client_default_root", p_client_default_root, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_client_default_root_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("RetrievePackages", sqlParameters);



            return dset;
        }



        public DataSet RetrieveUsers(System.String p_user_id,
                                                System.Int32? p_user_no,
                                                System.String p_user_nm,
                                                System.DateTime? p_activation_dt,
                                                System.String p_package_nm,
                                                System.String p_application_nm,
                                                System.String p_user_role_nm,
                                                System.String p_database_nm)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter p_user_id_Parameter = ObjDBManager.CreateSqlParameter("p_user_id", p_user_id, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_user_id_Parameter);
            SqlParameter p_user_no_Parameter = ObjDBManager.CreateSqlParameter("p_user_no", p_user_no, SqlDbType.Int, ParameterDirection.Input);
            sqlParameters.Add(p_user_no_Parameter);
            SqlParameter p_user_nm_Parameter = ObjDBManager.CreateSqlParameter("p_user_nm", p_user_nm, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_user_nm_Parameter);
            SqlParameter p_activation_dt_Parameter = ObjDBManager.CreateSqlParameter("p_activation_dt", p_activation_dt, SqlDbType.SmallDateTime, ParameterDirection.Input);
            sqlParameters.Add(p_activation_dt_Parameter);
            SqlParameter p_package_nm_Parameter = ObjDBManager.CreateSqlParameter("p_package_nm", p_package_nm, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_package_nm_Parameter);
            SqlParameter p_application_nm_Parameter = ObjDBManager.CreateSqlParameter("p_application_nm", p_application_nm, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_application_nm_Parameter);
            SqlParameter p_user_role_nm_Parameter = ObjDBManager.CreateSqlParameter("p_user_role_nm", p_user_role_nm, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_user_role_nm_Parameter);
            SqlParameter p_database_nm_Parameter = ObjDBManager.CreateSqlParameter("p_database_nm", p_database_nm, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_database_nm_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("RetrieveUsers", sqlParameters);



            return dset;
        }



        public DataSet RPT_07_BoardMemberCountry(System.Int32? session_id,
                                                            System.String screen_id,
                                                            System.String AllContinents,
                                                            System.String AllCountries,
                                                            System.String AllCountryGroups,
                                                            System.String Status,
                                                            System.String Allofficeholders,
                                                            System.String Allofficetitles)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter session_id_Parameter = ObjDBManager.CreateSqlParameter("session_id", session_id, SqlDbType.Int, ParameterDirection.Input);
            sqlParameters.Add(session_id_Parameter);
            SqlParameter screen_id_Parameter = ObjDBManager.CreateSqlParameter("screen_id", screen_id, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(screen_id_Parameter);
            SqlParameter AllContinents_Parameter = ObjDBManager.CreateSqlParameter("AllContinents", AllContinents, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(AllContinents_Parameter);
            SqlParameter AllCountries_Parameter = ObjDBManager.CreateSqlParameter("AllCountries", AllCountries, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(AllCountries_Parameter);
            SqlParameter AllCountryGroups_Parameter = ObjDBManager.CreateSqlParameter("AllCountryGroups", AllCountryGroups, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(AllCountryGroups_Parameter);
            SqlParameter Status_Parameter = ObjDBManager.CreateSqlParameter("Status", Status, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(Status_Parameter);
            SqlParameter Allofficeholders_Parameter = ObjDBManager.CreateSqlParameter("Allofficeholders", Allofficeholders, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(Allofficeholders_Parameter);
            SqlParameter Allofficetitles_Parameter = ObjDBManager.CreateSqlParameter("Allofficetitles", Allofficetitles, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(Allofficetitles_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("RPT_07_BoardMemberCountry", sqlParameters);



            return dset;
        }



        public DataSet SetDefaultUserRole(System.String p_user_id,
                                                        System.String p_user_role_id,
                                                        System.String p_application_id)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter p_user_id_Parameter = ObjDBManager.CreateSqlParameter("p_user_id", p_user_id, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_user_id_Parameter);
            SqlParameter p_user_role_id_Parameter = ObjDBManager.CreateSqlParameter("p_user_role_id", p_user_role_id, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_user_role_id_Parameter);
            SqlParameter p_application_id_Parameter = ObjDBManager.CreateSqlParameter("p_application_id", p_application_id, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(p_application_id_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("SetDefaultUserRole", sqlParameters);



            return dset;
        }



        public DataSet SetUserPassword(System.String p_user_id,
                                                    System.String p_password)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter p_user_id_Parameter = ObjDBManager.CreateSqlParameter("p_user_id", p_user_id, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_user_id_Parameter);
            SqlParameter p_password_Parameter = ObjDBManager.CreateSqlParameter("p_password", p_password, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_password_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("SetUserPassword", sqlParameters);



            return dset;
        }



        public DataSet StoreLastBackupPath(System.String p_package_id,
                                                        System.String p_database_nm,
                                                        System.String p_backup_path)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter p_package_id_Parameter = ObjDBManager.CreateSqlParameter("p_package_id", p_package_id, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(p_package_id_Parameter);
            SqlParameter p_database_nm_Parameter = ObjDBManager.CreateSqlParameter("p_database_nm", p_database_nm, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_database_nm_Parameter);
            SqlParameter p_backup_path_Parameter = ObjDBManager.CreateSqlParameter("p_backup_path", p_backup_path, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_backup_path_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("StoreLastBackupPath", sqlParameters);



            return dset;
        }



        public DataSet UpdateApplications(System.String p_application_id,
                                                        System.String p_application_nm,
                                                        System.DateTime? p_implementation_dt,
                                                        System.String p_error_log_level,
                                                        System.Byte? p_log_file_size_in_mb,
                                                        System.String p_server_nm,
                                                        System.String p_package_id,
                                                        System.String p_database_nm,
                                                        System.String p_backup_path,
                                                        System.String p_dsn_nm,
                                                        System.String p_report_title,
                                                        System.String p_report_footer,
                                                        System.String p_path_1,
                                                        System.String p_path_2,
                                                        System.String p_path_3,
                                                        System.String p_argument_1,
                                                        System.String p_argument_2,
                                                        System.String p_argument_3,
                                                        System.String p_argument_4,
                                                        System.String p_argument_5)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter p_application_id_Parameter = ObjDBManager.CreateSqlParameter("p_application_id", p_application_id, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(p_application_id_Parameter);
            SqlParameter p_application_nm_Parameter = ObjDBManager.CreateSqlParameter("p_application_nm", p_application_nm, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_application_nm_Parameter);
            SqlParameter p_implementation_dt_Parameter = ObjDBManager.CreateSqlParameter("p_implementation_dt", p_implementation_dt, SqlDbType.SmallDateTime, ParameterDirection.Input);
            sqlParameters.Add(p_implementation_dt_Parameter);
            SqlParameter p_error_log_level_Parameter = ObjDBManager.CreateSqlParameter("p_error_log_level", p_error_log_level, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_error_log_level_Parameter);
            SqlParameter p_log_file_size_in_mb_Parameter = ObjDBManager.CreateSqlParameter("p_log_file_size_in_mb", p_log_file_size_in_mb, SqlDbType.TinyInt, ParameterDirection.Input);
            sqlParameters.Add(p_log_file_size_in_mb_Parameter);
            SqlParameter p_server_nm_Parameter = ObjDBManager.CreateSqlParameter("p_server_nm", p_server_nm, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_server_nm_Parameter);
            SqlParameter p_package_id_Parameter = ObjDBManager.CreateSqlParameter("p_package_id", p_package_id, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(p_package_id_Parameter);
            SqlParameter p_database_nm_Parameter = ObjDBManager.CreateSqlParameter("p_database_nm", p_database_nm, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_database_nm_Parameter);
            SqlParameter p_backup_path_Parameter = ObjDBManager.CreateSqlParameter("p_backup_path", p_backup_path, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_backup_path_Parameter);
            SqlParameter p_dsn_nm_Parameter = ObjDBManager.CreateSqlParameter("p_dsn_nm", p_dsn_nm, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_dsn_nm_Parameter);
            SqlParameter p_report_title_Parameter = ObjDBManager.CreateSqlParameter("p_report_title", p_report_title, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_report_title_Parameter);
            SqlParameter p_report_footer_Parameter = ObjDBManager.CreateSqlParameter("p_report_footer", p_report_footer, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_report_footer_Parameter);
            SqlParameter p_path_1_Parameter = ObjDBManager.CreateSqlParameter("p_path_1", p_path_1, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_path_1_Parameter);
            SqlParameter p_path_2_Parameter = ObjDBManager.CreateSqlParameter("p_path_2", p_path_2, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_path_2_Parameter);
            SqlParameter p_path_3_Parameter = ObjDBManager.CreateSqlParameter("p_path_3", p_path_3, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_path_3_Parameter);
            SqlParameter p_argument_1_Parameter = ObjDBManager.CreateSqlParameter("p_argument_1", p_argument_1, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_argument_1_Parameter);
            SqlParameter p_argument_2_Parameter = ObjDBManager.CreateSqlParameter("p_argument_2", p_argument_2, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_argument_2_Parameter);
            SqlParameter p_argument_3_Parameter = ObjDBManager.CreateSqlParameter("p_argument_3", p_argument_3, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_argument_3_Parameter);
            SqlParameter p_argument_4_Parameter = ObjDBManager.CreateSqlParameter("p_argument_4", p_argument_4, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_argument_4_Parameter);
            SqlParameter p_argument_5_Parameter = ObjDBManager.CreateSqlParameter("p_argument_5", p_argument_5, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_argument_5_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("UpdateApplications", sqlParameters);



            return dset;
        }



        public DataSet UpdateAuditInformation(System.String p_application_id,
                                                            System.String p_screen_id,
                                                            System.String p_insert_logged,
                                                            System.String p_update_logged,
                                                            System.String p_delete_logged,
                                                            System.String p_action_logged,
                                                            System.String p_print_logged,
                                                            System.String p_update_changes_logged,
                                                            System.String p_delete_changes_logged)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter p_application_id_Parameter = ObjDBManager.CreateSqlParameter("p_application_id", p_application_id, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(p_application_id_Parameter);
            SqlParameter p_screen_id_Parameter = ObjDBManager.CreateSqlParameter("p_screen_id", p_screen_id, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(p_screen_id_Parameter);
            SqlParameter p_insert_logged_Parameter = ObjDBManager.CreateSqlParameter("p_insert_logged", p_insert_logged, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(p_insert_logged_Parameter);
            SqlParameter p_update_logged_Parameter = ObjDBManager.CreateSqlParameter("p_update_logged", p_update_logged, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(p_update_logged_Parameter);
            SqlParameter p_delete_logged_Parameter = ObjDBManager.CreateSqlParameter("p_delete_logged", p_delete_logged, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(p_delete_logged_Parameter);
            SqlParameter p_action_logged_Parameter = ObjDBManager.CreateSqlParameter("p_action_logged", p_action_logged, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(p_action_logged_Parameter);
            SqlParameter p_print_logged_Parameter = ObjDBManager.CreateSqlParameter("p_print_logged", p_print_logged, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(p_print_logged_Parameter);
            SqlParameter p_update_changes_logged_Parameter = ObjDBManager.CreateSqlParameter("p_update_changes_logged", p_update_changes_logged, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(p_update_changes_logged_Parameter);
            SqlParameter p_delete_changes_logged_Parameter = ObjDBManager.CreateSqlParameter("p_delete_changes_logged", p_delete_changes_logged, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(p_delete_changes_logged_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("UpdateAuditInformation", sqlParameters);



            return dset;
        }



        public DataSet UpdateUserLockStatus(System.String p_user_id,
                                                        System.String p_lock)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter p_user_id_Parameter = ObjDBManager.CreateSqlParameter("p_user_id", p_user_id, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_user_id_Parameter);
            SqlParameter p_lock_Parameter = ObjDBManager.CreateSqlParameter("p_lock", p_lock, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(p_lock_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("UpdateUserLockStatus", sqlParameters);



            return dset;
        }



        public DataSet UpdLogInformation(System.String p_application_id,
                                                    System.String p_screen_id,
                                                    System.String p_is_insert_logged,
                                                    System.String p_is_update_logged,
                                                    System.String p_is_delete_logged,
                                                    System.String p_is_action_logged,
                                                    System.String p_is_print_logged,
                                                    System.String p_is_update_changes_logged,
                                                    System.String p_is_delete_changes_logged)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter p_application_id_Parameter = ObjDBManager.CreateSqlParameter("p_application_id", p_application_id, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(p_application_id_Parameter);
            SqlParameter p_screen_id_Parameter = ObjDBManager.CreateSqlParameter("p_screen_id", p_screen_id, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(p_screen_id_Parameter);
            SqlParameter p_is_insert_logged_Parameter = ObjDBManager.CreateSqlParameter("p_is_insert_logged", p_is_insert_logged, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(p_is_insert_logged_Parameter);
            SqlParameter p_is_update_logged_Parameter = ObjDBManager.CreateSqlParameter("p_is_update_logged", p_is_update_logged, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(p_is_update_logged_Parameter);
            SqlParameter p_is_delete_logged_Parameter = ObjDBManager.CreateSqlParameter("p_is_delete_logged", p_is_delete_logged, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(p_is_delete_logged_Parameter);
            SqlParameter p_is_action_logged_Parameter = ObjDBManager.CreateSqlParameter("p_is_action_logged", p_is_action_logged, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(p_is_action_logged_Parameter);
            SqlParameter p_is_print_logged_Parameter = ObjDBManager.CreateSqlParameter("p_is_print_logged", p_is_print_logged, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(p_is_print_logged_Parameter);
            SqlParameter p_is_update_changes_logged_Parameter = ObjDBManager.CreateSqlParameter("p_is_update_changes_logged", p_is_update_changes_logged, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(p_is_update_changes_logged_Parameter);
            SqlParameter p_is_delete_changes_logged_Parameter = ObjDBManager.CreateSqlParameter("p_is_delete_changes_logged", p_is_delete_changes_logged, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(p_is_delete_changes_logged_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("UpdLogInformation", sqlParameters);



            return dset;
        }



        public DataSet UpdPackageExecutable(System.String p_package_id,
                                                        System.String p_user_role_id,
                                                        System.String p_user_role_nm,
                                                        System.String p_executable_file_nm)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter p_package_id_Parameter = ObjDBManager.CreateSqlParameter("p_package_id", p_package_id, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(p_package_id_Parameter);
            SqlParameter p_user_role_id_Parameter = ObjDBManager.CreateSqlParameter("p_user_role_id", p_user_role_id, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_user_role_id_Parameter);
            SqlParameter p_user_role_nm_Parameter = ObjDBManager.CreateSqlParameter("p_user_role_nm", p_user_role_nm, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_user_role_nm_Parameter);
            SqlParameter p_executable_file_nm_Parameter = ObjDBManager.CreateSqlParameter("p_executable_file_nm", p_executable_file_nm, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_executable_file_nm_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("UpdPackageExecutable", sqlParameters);



            return dset;
        }



        public DataSet UpdPackageRootPaths(System.String p_package_id,
                                                        System.String p_server_distribution_root,
                                                        System.String p_client_default_root)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter p_package_id_Parameter = ObjDBManager.CreateSqlParameter("p_package_id", p_package_id, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(p_package_id_Parameter);
            SqlParameter p_server_distribution_root_Parameter = ObjDBManager.CreateSqlParameter("p_server_distribution_root", p_server_distribution_root, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_server_distribution_root_Parameter);
            SqlParameter p_client_default_root_Parameter = ObjDBManager.CreateSqlParameter("p_client_default_root", p_client_default_root, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_client_default_root_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("UpdPackageRootPaths", sqlParameters);



            return dset;
        }



        public DataSet UpdUserHeaderInfo(System.Int32? p_user_no,
                                                    System.String p_user_id,
                                                    System.String p_user_nm,
                                                    System.String p_application_id,
                                                    System.String p_user_role_id)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter p_user_no_Parameter = ObjDBManager.CreateSqlParameter("p_user_no", p_user_no, SqlDbType.Int, ParameterDirection.Input);
            sqlParameters.Add(p_user_no_Parameter);
            SqlParameter p_user_id_Parameter = ObjDBManager.CreateSqlParameter("p_user_id", p_user_id, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_user_id_Parameter);
            SqlParameter p_user_nm_Parameter = ObjDBManager.CreateSqlParameter("p_user_nm", p_user_nm, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_user_nm_Parameter);
            SqlParameter p_application_id_Parameter = ObjDBManager.CreateSqlParameter("p_application_id", p_application_id, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(p_application_id_Parameter);
            SqlParameter p_user_role_id_Parameter = ObjDBManager.CreateSqlParameter("p_user_role_id", p_user_role_id, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(p_user_role_id_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("UpdUserHeaderInfo", sqlParameters);



            return dset;
        }



        public DataSet UpdUserRolePrivilege(System.String package_id,
                                                        System.String user_role_id,
                                                        System.String screen_id,
                                                        System.String is_select_granted,
                                                        System.String is_insert_granted,
                                                        System.String is_update_granted,
                                                        System.String is_delete_granted,
                                                        System.String is_print_granted)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter package_id_Parameter = ObjDBManager.CreateSqlParameter("package_id", package_id, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(package_id_Parameter);
            SqlParameter user_role_id_Parameter = ObjDBManager.CreateSqlParameter("user_role_id", user_role_id, SqlDbType.VarChar, ParameterDirection.Input);
            sqlParameters.Add(user_role_id_Parameter);
            SqlParameter screen_id_Parameter = ObjDBManager.CreateSqlParameter("screen_id", screen_id, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(screen_id_Parameter);
            SqlParameter is_select_granted_Parameter = ObjDBManager.CreateSqlParameter("is_select_granted", is_select_granted, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(is_select_granted_Parameter);
            SqlParameter is_insert_granted_Parameter = ObjDBManager.CreateSqlParameter("is_insert_granted", is_insert_granted, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(is_insert_granted_Parameter);
            SqlParameter is_update_granted_Parameter = ObjDBManager.CreateSqlParameter("is_update_granted", is_update_granted, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(is_update_granted_Parameter);
            SqlParameter is_delete_granted_Parameter = ObjDBManager.CreateSqlParameter("is_delete_granted", is_delete_granted, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(is_delete_granted_Parameter);
            SqlParameter is_print_granted_Parameter = ObjDBManager.CreateSqlParameter("is_print_granted", is_print_granted, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(is_print_granted_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("UpdUserRolePrivilege", sqlParameters);



            return dset;
        }



        public DataSet ValidateSession(System.Int32? p_user_no,
                                                    System.String p_application_id,
                                                    System.Int32? p_session_id,
                                                    ref System.String p_is_query_session)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter p_user_no_Parameter = ObjDBManager.CreateSqlParameter("p_user_no", p_user_no, SqlDbType.Int, ParameterDirection.Input);
            sqlParameters.Add(p_user_no_Parameter);
            SqlParameter p_application_id_Parameter = ObjDBManager.CreateSqlParameter("p_application_id", p_application_id, SqlDbType.Char, ParameterDirection.Input);
            sqlParameters.Add(p_application_id_Parameter);
            SqlParameter p_session_id_Parameter = ObjDBManager.CreateSqlParameter("p_session_id", p_session_id, SqlDbType.Int, ParameterDirection.Input);
            sqlParameters.Add(p_session_id_Parameter);
            SqlParameter p_is_query_session_Parameter = ObjDBManager.CreateSqlParameter("p_is_query_session", p_is_query_session, SqlDbType.Char, ParameterDirection.Output);
            sqlParameters.Add(p_is_query_session_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("ValidateSession", sqlParameters);


            p_is_query_session = (System.String)p_is_query_session_Parameter.Value;

            return dset;
        }



        public DataSet ViewDBLocks(System.Int16? db_id)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();
            SqlParameter db_id_Parameter = ObjDBManager.CreateSqlParameter("db_id", db_id, SqlDbType.SmallInt, ParameterDirection.Input);
            sqlParameters.Add(db_id_Parameter);
            DataSet dset = ObjDBManager.ExecuteStoredProc("ViewDBLocks", sqlParameters);



            return dset;
        }
    }
}
