
removePackageCascade 'TZS'
go
BEGIN TRAN

--[[Insert into Packages
EXEC inspackage 
@package_id = 'TZS', 
@package_nm = 'Testing Zonal Sewadar Manager', 
@version_no = '1.0', 
@version_dt = '20110101',
@server_distribution_root = 'NOT SET', 
@client_default_root = 'NOT SET'

--[[Insert into Package_databases
EXEC inspackagedatabase 
@package_id = 'TZS', 
@database_nm ='ZSM_TEST', 
@server_nm = 'NOT SET', 
@dsn_nm = 'NOT SET', 
@backup_path = 'NOT SET'

--[[Insert into Package_databases
EXEC inspackagedatabase 
@package_id = 'TZS', 
@database_nm ='CDB', 
@server_nm = 'NOT SET', 
@dsn_nm = 'NOT SET', 
@backup_path = 'NOT SET'

--[[Insert into Application
EXEC insApplication 
@application_id = 'TZS_TST', 
@application_nm = 'Testing Zonal Sewadar Manager (Test)', 
@package_id = 'TZS', @database_nm = 'ZSM_TEST', 
@implementation_dt = '20110101', 
@error_log_level = 'Error', 
@log_file_size_in_mb = '10',
@report_title = NULL,
@report_footer = NULL,
@path_1 = NULL,
@path_2 = NULL,
@path_3 = NULL,
@argument_1 = 6015,
@argument_2 = 'Mumbai',
@argument_3 = NULL,
@argument_4 = NULL, 
@argument_5 = NULL

COMMIT TRAN

