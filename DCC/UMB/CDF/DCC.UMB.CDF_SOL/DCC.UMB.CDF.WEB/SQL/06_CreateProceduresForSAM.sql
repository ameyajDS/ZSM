

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'AlterBackupForUser')
                                BEGIN
                                DROP PROCEDURE DBO.AlterBackupForUser
                                END
                                GO

                                CREATE PROCEDURE AlterBackupForUser(
 
	@p_user_id	varchar(10), 
	@p_operation	varchar(6))
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.AlterBackupForUser @p_user_id, @p_operation
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'ChangeIdentity')
                                BEGIN
                                DROP PROCEDURE DBO.ChangeIdentity
                                END
                                GO

                                CREATE PROCEDURE ChangeIdentity(
 
	@p_package_id	char(3), 
	@p_user_role_id	varchar(10))
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.ChangeIdentity @p_package_id, @p_user_role_id
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'ClearSingleSession')
                                BEGIN
                                DROP PROCEDURE DBO.ClearSingleSession
                                END
                                GO

                                CREATE PROCEDURE ClearSingleSession(
 
	@p_session_id	int)
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.ClearSingleSession @p_session_id
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'ClearUserSessions')
                                BEGIN
                                DROP PROCEDURE DBO.ClearUserSessions
                                END
                                GO

                                CREATE PROCEDURE ClearUserSessions(
 
	@p_user_no	int)
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.ClearUserSessions @p_user_no
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'CloseSession')
                                BEGIN
                                DROP PROCEDURE DBO.CloseSession
                                END
                                GO

                                CREATE PROCEDURE CloseSession(
 
	@p_user_no	int, 
	@p_application_id	char(7), 
	@p_session_id	int)
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.CloseSession @p_user_no, @p_application_id, @p_session_id
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'CreateRole')
                                BEGIN
                                DROP PROCEDURE DBO.CreateRole
                                END
                                GO

                                CREATE PROCEDURE CreateRole(
 
	@p_package_id	char(3), 
	@p_user_role_id	varchar(10), 
	@p_user_role_nm	varchar(60), 
	@p_executable_nm	varchar(30))
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.CreateRole @p_package_id, @p_user_role_id, @p_user_role_nm, @p_executable_nm
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'CreateUser')
                                BEGIN
                                DROP PROCEDURE DBO.CreateUser
                                END
                                GO

                                CREATE PROCEDURE CreateUser(
 
	@p_user_id	varchar(10), 
	@p_user_nm	varchar(30), 
	@p_password	varchar(15), 
	@p_application_id	char(7), 
	@p_user_role_id	varchar(10), 
	@p_user_no	int	 OUTPUT)
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.CreateUser @p_user_id, @p_user_nm, @p_password, @p_application_id, @p_user_role_id, @p_user_no	 OUTPUT
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'DeleteUser')
                                BEGIN
                                DROP PROCEDURE DBO.DeleteUser
                                END
                                GO

                                CREATE PROCEDURE DeleteUser(
 
	@p_user_id	varchar(10))
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.DeleteUser @p_user_id
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'delUserRoleGrantedAction')
                                BEGIN
                                DROP PROCEDURE DBO.delUserRoleGrantedAction
                                END
                                GO

                                CREATE PROCEDURE delUserRoleGrantedAction(
 
	@package_id	char(3), 
	@user_role_id	varchar(10), 
	@screen_id	char(6), 
	@action_id	varchar(30))
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.delUserRoleGrantedAction @package_id, @user_role_id, @screen_id, @action_id
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'delUserRolePrivilege')
                                BEGIN
                                DROP PROCEDURE DBO.delUserRolePrivilege
                                END
                                GO

                                CREATE PROCEDURE delUserRolePrivilege(
 
	@package_id	char(3), 
	@user_role_id	varchar(10), 
	@screen_id	char(6))
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.delUserRolePrivilege @package_id, @user_role_id, @screen_id
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'DropRole')
                                BEGIN
                                DROP PROCEDURE DBO.DropRole
                                END
                                GO

                                CREATE PROCEDURE DropRole(
 
	@p_package_id	char(3), 
	@p_user_role_id	varchar(10))
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.DropRole @p_package_id, @p_user_role_id
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'DropUser')
                                BEGIN
                                DROP PROCEDURE DBO.DropUser
                                END
                                GO

                                CREATE PROCEDURE DropUser(
 
	@p_user_id	varchar(10))
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.DropUser @p_user_id
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'GetActiveSessions')
                                BEGIN
                                DROP PROCEDURE DBO.GetActiveSessions
                                END
                                GO

                                CREATE PROCEDURE GetActiveSessions(
 
	@p_user_no	int, 
	@p_sessions_cnt	int	 OUTPUT, 
	@p_application_id	char(7)	 OUTPUT)
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.GetActiveSessions @p_user_no, @p_sessions_cnt	 OUTPUT, @p_application_id	 OUTPUT
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'GetApplicationServerDatabase')
                                BEGIN
                                DROP PROCEDURE DBO.GetApplicationServerDatabase
                                END
                                GO

                                CREATE PROCEDURE GetApplicationServerDatabase(
 
	@p_application_id	char(7))
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.GetApplicationServerDatabase @p_application_id
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'GetApplicationUserRoles')
                                BEGIN
                                DROP PROCEDURE DBO.GetApplicationUserRoles
                                END
                                GO

                                CREATE PROCEDURE GetApplicationUserRoles(
 
	@p_package_id	varchar(3), 
	@p_application_id	varchar(7))
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.GetApplicationUserRoles @p_package_id, @p_application_id
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'GetAuditInformationDetails')
                                BEGIN
                                DROP PROCEDURE DBO.GetAuditInformationDetails
                                END
                                GO

                                CREATE PROCEDURE GetAuditInformationDetails(
 
	@p_package_id	char(3), 
	@p_application_id	char(7))
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.GetAuditInformationDetails @p_package_id, @p_application_id
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'GetIdentity')
                                BEGIN
                                DROP PROCEDURE DBO.GetIdentity
                                END
                                GO

                                CREATE PROCEDURE GetIdentity(
 
	@p_user_role_identity	varchar(15)	 OUTPUT, 
	@p_encrypted_id	varchar(15)	 OUTPUT)
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.GetIdentity @p_user_role_identity	 OUTPUT, @p_encrypted_id	 OUTPUT
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'GetMessageDetails')
                                BEGIN
                                DROP PROCEDURE DBO.GetMessageDetails
                                END
                                GO

                                CREATE PROCEDURE GetMessageDetails(
 
	@p_session_id	int)
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.GetMessageDetails @p_session_id
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'GetOtherMachineSessions')
                                BEGIN
                                DROP PROCEDURE DBO.GetOtherMachineSessions
                                END
                                GO

                                CREATE PROCEDURE GetOtherMachineSessions(
 
	@p_user_no	int, 
	@p_current_machine_nm	varchar(60), 
	@p_sessions_cnt	int	 OUTPUT, 
	@p_application_id	char(7)	 OUTPUT, 
	@p_machine_nm	varchar(60)	 OUTPUT)
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.GetOtherMachineSessions @p_user_no, @p_current_machine_nm, @p_sessions_cnt	 OUTPUT, @p_application_id	 OUTPUT, @p_machine_nm	 OUTPUT
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'GetPackageDatabases')
                                BEGIN
                                DROP PROCEDURE DBO.GetPackageDatabases
                                END
                                GO

                                CREATE PROCEDURE GetPackageDatabases(
 
	@p_package_id	char(3))
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.GetPackageDatabases @p_package_id
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'GetPackageExecutables')
                                BEGIN
                                DROP PROCEDURE DBO.GetPackageExecutables
                                END
                                GO

                                CREATE PROCEDURE GetPackageExecutables(
 
	@p_package_id	char(3))
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.GetPackageExecutables @p_package_id
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'GetPackages')
                                BEGIN
                                DROP PROCEDURE DBO.GetPackages
                                END
                                GO

                                CREATE PROCEDURE GetPackages(
 
	@p_package_id	varchar(3), 
	@p_package_nm	varchar(60))
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.GetPackages @p_package_id, @p_package_nm
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'GetPackageUserRoles')
                                BEGIN
                                DROP PROCEDURE DBO.GetPackageUserRoles
                                END
                                GO

                                CREATE PROCEDURE GetPackageUserRoles(
 
	@p_package_id	varchar(3))
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.GetPackageUserRoles @p_package_id
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'GetUserDetails')
                                BEGIN
                                DROP PROCEDURE DBO.GetUserDetails
                                END
                                GO

                                CREATE PROCEDURE GetUserDetails(
 
	@p_user_id	varchar(10))
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.GetUserDetails @p_user_id
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'GetUserRoleIdentity')
                                BEGIN
                                DROP PROCEDURE DBO.GetUserRoleIdentity
                                END
                                GO

                                CREATE PROCEDURE GetUserRoleIdentity(
 
	@p_user_role_id	varchar(10), 
	@p_user_role_identity	varchar(15)	 OUTPUT)
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.GetUserRoleIdentity @p_user_role_id, @p_user_role_identity	 OUTPUT
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'IdentifyUserRole')
                                BEGIN
                                DROP PROCEDURE DBO.IdentifyUserRole
                                END
                                GO

                                CREATE PROCEDURE IdentifyUserRole(
 
	@p_package_id	char(3), 
	@p_user_role_id	varchar(10), 
	@p_user_role_identity	varchar(15)	 OUTPUT)
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.IdentifyUserRole @p_package_id, @p_user_role_id, @p_user_role_identity	 OUTPUT
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'InitialiseSession')
                                BEGIN
                                DROP PROCEDURE DBO.InitialiseSession
                                END
                                GO

                                CREATE PROCEDURE InitialiseSession(
 
	@p_user_no	int, 
	@p_machine_nm	varchar(60), 
	@p_application_id	char(7), 
	@p_user_role_id	varchar(10), 
	@p_is_query_session	char(3)	 OUTPUT, 
	@p_session_id	int	 OUTPUT)
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.InitialiseSession @p_user_no, @p_machine_nm, @p_application_id, @p_user_role_id, @p_is_query_session	 OUTPUT, @p_session_id	 OUTPUT
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'insApplication')
                                BEGIN
                                DROP PROCEDURE DBO.insApplication
                                END
                                GO

                                CREATE PROCEDURE insApplication(
 
	@application_id	char(7), 
	@application_nm	varchar(60), 
	@package_id	char(3), 
	@database_nm	varchar(20), 
	@implementation_dt	smalldatetime, 
	@error_log_level	varchar(10), 
	@log_file_size_in_mb	tinyint, 
	@report_title	varchar(100), 
	@report_footer	varchar(100), 
	@path_1	varchar(128), 
	@path_2	varchar(128), 
	@path_3	varchar(128), 
	@argument_1	varchar(100), 
	@argument_2	varchar(100), 
	@argument_3	varchar(100), 
	@argument_4	varchar(100), 
	@argument_5	varchar(100))
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.insApplication @application_id, @application_nm, @package_id, @database_nm, @implementation_dt, @error_log_level, @log_file_size_in_mb, @report_title, @report_footer, @path_1, @path_2, @path_3, @argument_1, @argument_2, @argument_3, @argument_4, @argument_5
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'insApplicationScreenAudit')
                                BEGIN
                                DROP PROCEDURE DBO.insApplicationScreenAudit
                                END
                                GO

                                CREATE PROCEDURE insApplicationScreenAudit(
 
	@application_id	char(7), 
	@screen_id	char(6), 
	@is_insert_logged	char(3), 
	@is_update_logged	char(3), 
	@is_delete_logged	char(3), 
	@is_action_logged	char(3), 
	@is_print_logged	char(3), 
	@is_update_changes_logged	char(3), 
	@is_delete_changes_logged	char(3))
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.insApplicationScreenAudit @application_id, @screen_id, @is_insert_logged, @is_update_logged, @is_delete_logged, @is_action_logged, @is_print_logged, @is_update_changes_logged, @is_delete_changes_logged
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'insLogMessage')
                                BEGIN
                                DROP PROCEDURE DBO.insLogMessage
                                END
                                GO

                                CREATE PROCEDURE insLogMessage(
 
	@session_id	int, 
	@message_cd	varchar(1), 
	@severity_level	char(1), 
	@message_dts	datetime, 
	@screen_id	char(6), 
	@screen_mode	char(1), 
	@message_information	varchar(1), 
	@other_information	varchar(1), 
	@stack_trace	varchar(1))
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.insLogMessage @session_id, @message_cd, @severity_level, @message_dts, @screen_id, @screen_mode, @message_information, @other_information, @stack_trace
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'insPackage')
                                BEGIN
                                DROP PROCEDURE DBO.insPackage
                                END
                                GO

                                CREATE PROCEDURE insPackage(
 
	@package_id	char(3), 
	@package_nm	varchar(60), 
	@version_no	decimal, 
	@version_dt	smalldatetime, 
	@server_distribution_root	varchar(128), 
	@client_default_root	varchar(128))
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.insPackage @package_id, @package_nm, @version_no, @version_dt, @server_distribution_root, @client_default_root
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'insPackageDatabase')
                                BEGIN
                                DROP PROCEDURE DBO.insPackageDatabase
                                END
                                GO

                                CREATE PROCEDURE insPackageDatabase(
 
	@package_id	char(3), 
	@database_nm	varchar(20), 
	@server_nm	varchar(20), 
	@dsn_nm	varchar(20), 
	@backup_path	varchar(128))
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.insPackageDatabase @package_id, @database_nm, @server_nm, @dsn_nm, @backup_path
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'insPackageMenu')
                                BEGIN
                                DROP PROCEDURE DBO.insPackageMenu
                                END
                                GO

                                CREATE PROCEDURE insPackageMenu(
 
	@package_id	char(3), 
	@menu_group_id	varchar(20), 
	@menu_nm	varchar(40), 
	@menu_dsc	varchar(100), 
	@ctrl_key_accessor	char(1), 
	@display_order	smallint)
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.insPackageMenu @package_id, @menu_group_id, @menu_nm, @menu_dsc, @ctrl_key_accessor, @display_order
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'insPackageMenuGroup')
                                BEGIN
                                DROP PROCEDURE DBO.insPackageMenuGroup
                                END
                                GO

                                CREATE PROCEDURE insPackageMenuGroup(
 
	@package_id	char(3), 
	@menu_group_id	varchar(20), 
	@parent_menu_group_id	varchar(20), 
	@menu_group_nm	varchar(40), 
	@menu_group_dsc	varchar(100), 
	@ctrl_key_accessor	char(1), 
	@display_order	smallint)
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.insPackageMenuGroup @package_id, @menu_group_id, @parent_menu_group_id, @menu_group_nm, @menu_group_dsc, @ctrl_key_accessor, @display_order
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'insPackageScreen')
                                BEGIN
                                DROP PROCEDURE DBO.insPackageScreen
                                END
                                GO

                                CREATE PROCEDURE insPackageScreen(
 
	@package_id	char(3), 
	@screen_id	char(6), 
	@screen_nm	varchar(40), 
	@is_select_supported	char(3), 
	@is_insert_supported	char(3), 
	@is_update_supported	char(3), 
	@is_delete_supported	char(3), 
	@is_print_supported	char(3), 
	@is_update_changes_supported	char(3), 
	@is_delete_changes_supported	char(3), 
	@is_partial_save_supported	char(3))
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.insPackageScreen @package_id, @screen_id, @screen_nm, @is_select_supported, @is_insert_supported, @is_update_supported, @is_delete_supported, @is_print_supported, @is_update_changes_supported, @is_delete_changes_supported, @is_partial_save_supported
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'insPackageScreenAction')
                                BEGIN
                                DROP PROCEDURE DBO.insPackageScreenAction
                                END
                                GO

                                CREATE PROCEDURE insPackageScreenAction(
 
	@package_id	char(3), 
	@screen_id	char(6), 
	@action_id	varchar(30), 
	@display_order	smallint)
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.insPackageScreenAction @package_id, @screen_id, @action_id, @display_order
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'InsUpdRevUserPrivileges')
                                BEGIN
                                DROP PROCEDURE DBO.InsUpdRevUserPrivileges
                                END
                                GO

                                CREATE PROCEDURE InsUpdRevUserPrivileges(
 
	@p_user_id	varchar(10), 
	@p_user_role_id	varchar(10), 
	@p_application_id	char(7), 
	@p_is_backup_allowed	char(3), 
	@p_mode	char(3))
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.InsUpdRevUserPrivileges @p_user_id, @p_user_role_id, @p_application_id, @p_is_backup_allowed, @p_mode
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'insUserRoleGrantedAction')
                                BEGIN
                                DROP PROCEDURE DBO.insUserRoleGrantedAction
                                END
                                GO

                                CREATE PROCEDURE insUserRoleGrantedAction(
 
	@package_id	char(3), 
	@user_role_id	varchar(10), 
	@screen_id	char(6), 
	@action_id	varchar(30), 
	@display_order	int)
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.insUserRoleGrantedAction @package_id, @user_role_id, @screen_id, @action_id, @display_order
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'insUserRolePrivilege')
                                BEGIN
                                DROP PROCEDURE DBO.insUserRolePrivilege
                                END
                                GO

                                CREATE PROCEDURE insUserRolePrivilege(
 
	@package_id	char(3), 
	@user_role_id	varchar(10), 
	@screen_id	char(6), 
	@is_select_granted	char(3), 
	@is_insert_granted	char(3), 
	@is_update_granted	char(3), 
	@is_delete_granted	char(3), 
	@is_print_granted	char(3))
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.insUserRolePrivilege @package_id, @user_role_id, @screen_id, @is_select_granted, @is_insert_granted, @is_update_granted, @is_delete_granted, @is_print_granted
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'IsUserIDExisting')
                                BEGIN
                                DROP PROCEDURE DBO.IsUserIDExisting
                                END
                                GO

                                CREATE PROCEDURE IsUserIDExisting(
 
	@p_userID	varchar(20))
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.IsUserIDExisting @p_userID
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'LogOperation')
                                BEGIN
                                DROP PROCEDURE DBO.LogOperation
                                END
                                GO

                                CREATE PROCEDURE LogOperation(
 
	@p_session_id	int, 
	@p_package_id	char(3), 
	@p_application_id	char(7), 
	@p_user_no	int, 
	@p_user_role_id	varchar(10), 
	@p_operation	char(1), 
	@p_screen_id	char(6), 
	@p_object_id	varchar(50), 
	@p_obj_user_id	varchar(10), 
	@p_obj_application_id	char(7), 
	@p_obj_user_role_id	varchar(10))
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.LogOperation @p_session_id, @p_package_id, @p_application_id, @p_user_no, @p_user_role_id, @p_operation, @p_screen_id, @p_object_id, @p_obj_user_id, @p_obj_application_id, @p_obj_user_role_id
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'qryApplicationContext')
                                BEGIN
                                DROP PROCEDURE DBO.qryApplicationContext
                                END
                                GO

                                CREATE PROCEDURE qryApplicationContext(
 
	@user_role_id	varchar(10))
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.qryApplicationContext @user_role_id
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'qryPackageMenuGroups')
                                BEGIN
                                DROP PROCEDURE DBO.qryPackageMenuGroups
                                END
                                GO

                                CREATE PROCEDURE qryPackageMenuGroups(
 
	@p_group_id	int, 
	@p_package_id	char(3), 
	@p_parent_group_id	int, 
	@group_nm	varchar(60), 
	@group_desc	varchar(100), 
	@ctrl_key_accessor	char(1), 
	@display_order	smallint)
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.qryPackageMenuGroups @p_group_id, @p_package_id, @p_parent_group_id, @group_nm, @group_desc, @ctrl_key_accessor, @display_order
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'qryUserRoleGrantedActions')
                                BEGIN
                                DROP PROCEDURE DBO.qryUserRoleGrantedActions
                                END
                                GO

                                CREATE PROCEDURE qryUserRoleGrantedActions
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.qryUserRoleGrantedActions
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'qryUserRolePrivilege')
                                BEGIN
                                DROP PROCEDURE DBO.qryUserRolePrivilege
                                END
                                GO

                                CREATE PROCEDURE qryUserRolePrivilege
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.qryUserRolePrivilege
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'RaiseErrorMessage')
                                BEGIN
                                DROP PROCEDURE DBO.RaiseErrorMessage
                                END
                                GO

                                CREATE PROCEDURE RaiseErrorMessage(
 
	@p_message_cd	varchar(35), 
	@p_control_nm	varchar(30), 
	@p_arg_1	varchar(50), 
	@p_arg_2	varchar(50), 
	@p_arg_3	varchar(50))
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.RaiseErrorMessage @p_message_cd, @p_control_nm, @p_arg_1, @p_arg_2, @p_arg_3
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'RaiseFatalError')
                                BEGIN
                                DROP PROCEDURE DBO.RaiseFatalError
                                END
                                GO

                                CREATE PROCEDURE RaiseFatalError(
 
	@p_message_cd	varchar(35), 
	@p_control_nm	varchar(30), 
	@p_arg_1	varchar(50), 
	@p_arg_2	varchar(50), 
	@p_arg_3	varchar(50))
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.RaiseFatalError @p_message_cd, @p_control_nm, @p_arg_1, @p_arg_2, @p_arg_3
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'RaiseSQLError')
                                BEGIN
                                DROP PROCEDURE DBO.RaiseSQLError
                                END
                                GO

                                CREATE PROCEDURE RaiseSQLError(
 
	@p_type	varchar(10), 
	@p_message_cd	varchar(35), 
	@p_control_nm	varchar(30), 
	@p_arg_1	varchar(50), 
	@p_arg_2	varchar(50), 
	@p_arg_3	varchar(50))
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.RaiseSQLError @p_type, @p_message_cd, @p_control_nm, @p_arg_1, @p_arg_2, @p_arg_3
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'RaiseWarningMessage')
                                BEGIN
                                DROP PROCEDURE DBO.RaiseWarningMessage
                                END
                                GO

                                CREATE PROCEDURE RaiseWarningMessage(
 
	@p_message_cd	varchar(35), 
	@p_control_nm	varchar(30), 
	@p_arg_1	varchar(50), 
	@p_arg_2	varchar(50), 
	@p_arg_3	varchar(50))
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.RaiseWarningMessage @p_message_cd, @p_control_nm, @p_arg_1, @p_arg_2, @p_arg_3
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'removePacakgeCascade')
                                BEGIN
                                DROP PROCEDURE DBO.removePacakgeCascade
                                END
                                GO

                                CREATE PROCEDURE removePacakgeCascade(
 
	@package_id	char(3))
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.removePacakgeCascade @package_id
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'removePackageCascade')
                                BEGIN
                                DROP PROCEDURE DBO.removePackageCascade
                                END
                                GO

                                CREATE PROCEDURE removePackageCascade(
 
	@package_id	char(3))
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.removePackageCascade @package_id
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'RetrieveAllActiveSessions')
                                BEGIN
                                DROP PROCEDURE DBO.RetrieveAllActiveSessions
                                END
                                GO

                                CREATE PROCEDURE RetrieveAllActiveSessions(
 
	@p_own_session_id	int)
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.RetrieveAllActiveSessions @p_own_session_id
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'RetrieveApplicationInformation')
                                BEGIN
                                DROP PROCEDURE DBO.RetrieveApplicationInformation
                                END
                                GO

                                CREATE PROCEDURE RetrieveApplicationInformation(
 
	@p_package_nm	varchar(60), 
	@p_version_no	int, 
	@p_version_dt	smalldatetime, 
	@p_application_id	varchar(7), 
	@p_application_nm	varchar(60), 
	@P_implementation_dt	smalldatetime, 
	@p_database_nm	varchar(20), 
	@p_server_nm	varchar(20), 
	@p_dsn_nm	varchar(20), 
	@p_error_log_level	varchar(7), 
	@p_log_file_size_in_mb	tinyint, 
	@p_report_title	varchar(100), 
	@p_report_footer	varchar(100), 
	@p_path1	varchar(128), 
	@p_path2	varchar(128), 
	@p_path3	varchar(128), 
	@p_argument1	varchar(100), 
	@p_argument2	varchar(100), 
	@p_argument3	varchar(100), 
	@p_argument4	varchar(100), 
	@p_argument5	varchar(100))
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.RetrieveApplicationInformation @p_package_nm, @p_version_no, @p_version_dt, @p_application_id, @p_application_nm, @P_implementation_dt, @p_database_nm, @p_server_nm, @p_dsn_nm, @p_error_log_level, @p_log_file_size_in_mb, @p_report_title, @p_report_footer, @p_path1, @p_path2, @p_path3, @p_argument1, @p_argument2, @p_argument3, @p_argument4, @p_argument5
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'RetrieveMessageLogInformation')
                                BEGIN
                                DROP PROCEDURE DBO.RetrieveMessageLogInformation
                                END
                                GO

                                CREATE PROCEDURE RetrieveMessageLogInformation(
 
	@p_session_id	int, 
	@p_application_nm	varchar(60), 
	@p_user_role_nm	varchar(60), 
	@p_user_nm	varchar(30), 
	@p_user_no	int, 
	@p_machine_nm	varchar(30), 
	@p_start_dtm	datetime, 
	@p_finish_dtm	datetime, 
	@p_clear_dtm	datetime, 
	@p_is_query_session	char(3))
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.RetrieveMessageLogInformation @p_session_id, @p_application_nm, @p_user_role_nm, @p_user_nm, @p_user_no, @p_machine_nm, @p_start_dtm, @p_finish_dtm, @p_clear_dtm, @p_is_query_session
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'RetrievePackageApplications')
                                BEGIN
                                DROP PROCEDURE DBO.RetrievePackageApplications
                                END
                                GO

                                CREATE PROCEDURE RetrievePackageApplications(
 
	@p_package_nm	varchar(60), 
	@p_application_nm	varchar(60), 
	@p_database_nm	varchar(20))
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.RetrievePackageApplications @p_package_nm, @p_application_nm, @p_database_nm
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'RetrievePackages')
                                BEGIN
                                DROP PROCEDURE DBO.RetrievePackages
                                END
                                GO

                                CREATE PROCEDURE RetrievePackages(
 
	@p_package_id	varchar(3), 
	@p_package_nm	varchar(60), 
	@p_version_no	decimal, 
	@p_version_dt	smalldatetime, 
	@p_server_distribution_root	varchar(128), 
	@p_client_default_root	varchar(128))
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.RetrievePackages @p_package_id, @p_package_nm, @p_version_no, @p_version_dt, @p_server_distribution_root, @p_client_default_root
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'RetrieveUsers')
                                BEGIN
                                DROP PROCEDURE DBO.RetrieveUsers
                                END
                                GO

                                CREATE PROCEDURE RetrieveUsers(
 
	@p_user_id	varchar(10), 
	@p_user_no	int, 
	@p_user_nm	varchar(30), 
	@p_activation_dt	smalldatetime, 
	@p_package_nm	varchar(60), 
	@p_application_nm	varchar(60), 
	@p_user_role_nm	varchar(60), 
	@p_database_nm	varchar(20))
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.RetrieveUsers @p_user_id, @p_user_no, @p_user_nm, @p_activation_dt, @p_package_nm, @p_application_nm, @p_user_role_nm, @p_database_nm
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'RPT_07_BoardMemberCountry')
                                BEGIN
                                DROP PROCEDURE DBO.RPT_07_BoardMemberCountry
                                END
                                GO

                                CREATE PROCEDURE RPT_07_BoardMemberCountry(
 
	@session_id	int, 
	@screen_id	char(6), 
	@AllContinents	char(3), 
	@AllCountries	char(3), 
	@AllCountryGroups	char(3), 
	@Status	varchar(10), 
	@Allofficeholders	char(3), 
	@Allofficetitles	char(3))
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.RPT_07_BoardMemberCountry @session_id, @screen_id, @AllContinents, @AllCountries, @AllCountryGroups, @Status, @Allofficeholders, @Allofficetitles
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'RPT_29_Secretaries_by_expiry')
                                BEGIN
                                DROP PROCEDURE DBO.RPT_29_Secretaries_by_expiry
                                END
                                GO

                                CREATE PROCEDURE RPT_29_Secretaries_by_expiry(
 
	@session_id	int, 
	@screen_id	char(6), 
	@AllContinents	char(3), 
	@AllCountries	char(3), 
	@AllCountryGroups	char(3), 
	@Allsatsangcentres	char(3), 
	@Status	varchar(10))
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.RPT_29_Secretaries_by_expiry @session_id, @screen_id, @AllContinents, @AllCountries, @AllCountryGroups, @Allsatsangcentres, @Status
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'RPT_30_Secretaries_approval')
                                BEGIN
                                DROP PROCEDURE DBO.RPT_30_Secretaries_approval
                                END
                                GO

                                CREATE PROCEDURE RPT_30_Secretaries_approval(
 
	@session_id	int, 
	@screen_id	char(6), 
	@AllContinents	char(3), 
	@AllCountries	char(3), 
	@AllCountryGroups	char(3), 
	@Allsatsangcentres	char(3), 
	@Status	varchar(10))
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.RPT_30_Secretaries_approval @session_id, @screen_id, @AllContinents, @AllCountries, @AllCountryGroups, @Allsatsangcentres, @Status
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'SetDefaultUserRole')
                                BEGIN
                                DROP PROCEDURE DBO.SetDefaultUserRole
                                END
                                GO

                                CREATE PROCEDURE SetDefaultUserRole(
 
	@p_user_id	varchar(10), 
	@p_user_role_id	varchar(10), 
	@p_application_id	char(7))
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.SetDefaultUserRole @p_user_id, @p_user_role_id, @p_application_id
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'SetUserPassword')
                                BEGIN
                                DROP PROCEDURE DBO.SetUserPassword
                                END
                                GO

                                CREATE PROCEDURE SetUserPassword(
 
	@p_user_id	varchar(10), 
	@p_password	varchar(15))
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.SetUserPassword @p_user_id, @p_password
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'StoreLastBackupPath')
                                BEGIN
                                DROP PROCEDURE DBO.StoreLastBackupPath
                                END
                                GO

                                CREATE PROCEDURE StoreLastBackupPath(
 
	@p_package_id	char(3), 
	@p_database_nm	varchar(20), 
	@p_backup_path	varchar(128))
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.StoreLastBackupPath @p_package_id, @p_database_nm, @p_backup_path
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'UpdateApplications')
                                BEGIN
                                DROP PROCEDURE DBO.UpdateApplications
                                END
                                GO

                                CREATE PROCEDURE UpdateApplications(
 
	@p_application_id	char(7), 
	@p_application_nm	varchar(60), 
	@p_implementation_dt	smalldatetime, 
	@p_error_log_level	varchar(7), 
	@p_log_file_size_in_mb	tinyint, 
	@p_server_nm	varchar(20), 
	@p_package_id	char(3), 
	@p_database_nm	varchar(20), 
	@p_backup_path	varchar(128), 
	@p_dsn_nm	varchar(20), 
	@p_report_title	varchar(100), 
	@p_report_footer	varchar(100), 
	@p_path_1	varchar(128), 
	@p_path_2	varchar(128), 
	@p_path_3	varchar(128), 
	@p_argument_1	varchar(100), 
	@p_argument_2	varchar(100), 
	@p_argument_3	varchar(100), 
	@p_argument_4	varchar(100), 
	@p_argument_5	varchar(100))
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.UpdateApplications @p_application_id, @p_application_nm, @p_implementation_dt, @p_error_log_level, @p_log_file_size_in_mb, @p_server_nm, @p_package_id, @p_database_nm, @p_backup_path, @p_dsn_nm, @p_report_title, @p_report_footer, @p_path_1, @p_path_2, @p_path_3, @p_argument_1, @p_argument_2, @p_argument_3, @p_argument_4, @p_argument_5
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'UpdateAuditInformation')
                                BEGIN
                                DROP PROCEDURE DBO.UpdateAuditInformation
                                END
                                GO

                                CREATE PROCEDURE UpdateAuditInformation(
 
	@p_application_id	char(7), 
	@p_screen_id	char(6), 
	@p_insert_logged	char(3), 
	@p_update_logged	char(3), 
	@p_delete_logged	char(3), 
	@p_action_logged	char(3), 
	@p_print_logged	char(3), 
	@p_update_changes_logged	char(3), 
	@p_delete_changes_logged	char(3))
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.UpdateAuditInformation @p_application_id, @p_screen_id, @p_insert_logged, @p_update_logged, @p_delete_logged, @p_action_logged, @p_print_logged, @p_update_changes_logged, @p_delete_changes_logged
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'UpdateUserLockStatus')
                                BEGIN
                                DROP PROCEDURE DBO.UpdateUserLockStatus
                                END
                                GO

                                CREATE PROCEDURE UpdateUserLockStatus(
 
	@p_user_id	varchar(10), 
	@p_lock	char(3))
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.UpdateUserLockStatus @p_user_id, @p_lock
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'UpdLogInformation')
                                BEGIN
                                DROP PROCEDURE DBO.UpdLogInformation
                                END
                                GO

                                CREATE PROCEDURE UpdLogInformation(
 
	@p_application_id	char(7), 
	@p_screen_id	char(6), 
	@p_is_insert_logged	char(3), 
	@p_is_update_logged	char(3), 
	@p_is_delete_logged	char(3), 
	@p_is_action_logged	char(3), 
	@p_is_print_logged	char(3), 
	@p_is_update_changes_logged	char(3), 
	@p_is_delete_changes_logged	char(3))
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.UpdLogInformation @p_application_id, @p_screen_id, @p_is_insert_logged, @p_is_update_logged, @p_is_delete_logged, @p_is_action_logged, @p_is_print_logged, @p_is_update_changes_logged, @p_is_delete_changes_logged
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'UpdPackageExecutable')
                                BEGIN
                                DROP PROCEDURE DBO.UpdPackageExecutable
                                END
                                GO

                                CREATE PROCEDURE UpdPackageExecutable(
 
	@p_package_id	char(3), 
	@p_user_role_id	varchar(10), 
	@p_user_role_nm	varchar(60), 
	@p_executable_file_nm	varchar(30))
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.UpdPackageExecutable @p_package_id, @p_user_role_id, @p_user_role_nm, @p_executable_file_nm
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'UpdPackageRootPaths')
                                BEGIN
                                DROP PROCEDURE DBO.UpdPackageRootPaths
                                END
                                GO

                                CREATE PROCEDURE UpdPackageRootPaths(
 
	@p_package_id	char(3), 
	@p_server_distribution_root	varchar(128), 
	@p_client_default_root	varchar(128))
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.UpdPackageRootPaths @p_package_id, @p_server_distribution_root, @p_client_default_root
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'UpdUserHeaderInfo')
                                BEGIN
                                DROP PROCEDURE DBO.UpdUserHeaderInfo
                                END
                                GO

                                CREATE PROCEDURE UpdUserHeaderInfo(
 
	@p_user_no	int, 
	@p_user_id	varchar(10), 
	@p_user_nm	varchar(30), 
	@p_application_id	char(7), 
	@p_user_role_id	varchar(10))
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.UpdUserHeaderInfo @p_user_no, @p_user_id, @p_user_nm, @p_application_id, @p_user_role_id
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'updUserRolePrivilege')
                                BEGIN
                                DROP PROCEDURE DBO.updUserRolePrivilege
                                END
                                GO

                                CREATE PROCEDURE updUserRolePrivilege(
 
	@package_id	char(3), 
	@user_role_id	varchar(10), 
	@screen_id	char(6), 
	@is_select_granted	char(3), 
	@is_insert_granted	char(3), 
	@is_update_granted	char(3), 
	@is_delete_granted	char(3), 
	@is_print_granted	char(3))
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.updUserRolePrivilege @package_id, @user_role_id, @screen_id, @is_select_granted, @is_insert_granted, @is_update_granted, @is_delete_granted, @is_print_granted
                            END
                           GO 

------------------------------------------------------------------------------------

                                IF EXISTS (SELECT TOP 1 1 FROM SYSOBJECTS WHERE TYPE = 'p' AND NAME = 'ValidateSession')
                                BEGIN
                                DROP PROCEDURE DBO.ValidateSession
                                END
                                GO

                                CREATE PROCEDURE ValidateSession(
 
	@p_user_no	int, 
	@p_application_id	char(7), 
	@p_session_id	int, 
	@p_is_query_session	char(3)	 OUTPUT)
                                        AS
                                        BEGIN 
 exec dsql2k.SysAdmin.dbo.ValidateSession @p_user_no, @p_application_id, @p_session_id, @p_is_query_session	 OUTPUT
                            END
                           GO 

------------------------------------------------------------------------------------