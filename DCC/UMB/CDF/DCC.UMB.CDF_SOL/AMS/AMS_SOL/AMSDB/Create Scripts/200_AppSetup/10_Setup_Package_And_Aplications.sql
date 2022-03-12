Use SysAdmin
GO
BEGIN TRAN

--[[Insert the pcakges
EXEC insPackage @package_id='AMS', 
	@package_nm='Asset Management System', 
	@version_no='1.0', 
	@version_dt = '20070606',
	@server_distribution_root='NOT SET',
	@client_default_root='NOT SET'
--]]

--[[Insert into pacakge databases	
EXEC insPackageDatabase
		@package_id = 'AMS',
		@database_nm = 'AMS',
		@server_nm = 'NOT SET',
		@dsn_nm = 'NOT SET',
		@backup_path = 'NOT SET'	
--]]

--[[Insert into application
EXEC insApplication
	@application_id = 'AMS_APP',
	@application_nm = 'Asset Management System Application',
	@package_id = 'AMS',
	@database_nm = 'AMS', 
	@implementation_dt = '20070606',
	@error_log_level = 'Error',
	@log_file_size_in_mb = '10',
	@report_title = 'Asset Management System', 
	@report_footer = 'Asset Management System', 
	@path_1 = NULL,
	@path_2 = NULL,
	@path_3 = NULL,
	@argument_1 = NULL,
	@argument_2 = NULL,
	@argument_3 = NULL,
	@argument_4 = NULL,
	@argument_5 = NULL
--]]

COMMIT TRAN