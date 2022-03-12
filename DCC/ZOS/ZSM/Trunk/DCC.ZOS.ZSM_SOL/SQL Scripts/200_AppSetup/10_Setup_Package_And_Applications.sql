
removePackageCascade 'ZSM'
go

/* -- Use this commented code for Mumbai Setup
BEGIN TRAN

--[[Insert into Packages
EXEC inspackage 
@package_id = 'ZSM', 
@package_nm = 'Zonal Sewadar Manager', 
@version_no = '1.0', 
@version_dt = '20100101',
@server_distribution_root = 'NOT SET', 
@client_default_root = 'NOT SET'

--[[Insert into Package_databases
EXEC inspackagedatabase 
@package_id = 'ZSM', 
@database_nm ='ZSM', 
@server_nm = 'NOT SET', 
@dsn_nm = 'NOT SET', 
@backup_path = 'NOT SET'

--[[Insert into Package_databases
EXEC inspackagedatabase 
@package_id = 'ZSM', 
@database_nm ='CDB', 
@server_nm = 'NOT SET', 
@dsn_nm = 'NOT SET', 
@backup_path = 'NOT SET'

--[[Insert into Application
EXEC insApplication 
@application_id = 'ZSM_MUM', 
@application_nm = 'Zonal Sewadar Manager (Mumbai)', 
@package_id = 'ZSM', @database_nm = 'ZSM', 
@implementation_dt = '20100101', 
@error_log_level = 'Error', 
@log_file_size_in_mb = '10',
@report_title = NULL,
@report_footer = NULL,
@path_1 = NULL,
@path_2 = NULL,
@path_3 = NULL,
@argument_1 = 6015,
@argument_2 = 'Mumbai',
@argument_3 = 'Yes',				--- Whether Export to Excel / PDF is to be supported
@argument_4 = NULL, 
@argument_5 = NULL

COMMIT TRAN
*/ -- Use this commented code for Mumbai Setup

BEGIN TRAN

EXEC inspackage 
@package_id = 'ZSM', 
@package_nm = 'Zonal Sewadar Manager', 
@version_no = '5.48', 
@version_dt = '23-Feb-2012',
@server_distribution_root = '\\KOL1\E\ZSM\BIN\ZSM', 
@client_default_root = 'NULL'

--[[Insert into Package_databases
EXEC inspackagedatabase 
@package_id = 'ZSM', 
@database_nm ='ZSM', 
@server_nm = 'NOT SET', 
@dsn_nm = 'NOT SET', 
@backup_path = 'NOT SET'

--[[Insert into Package_databases
EXEC inspackagedatabase 
@package_id = 'ZSM', 
@database_nm ='CDB', 
@server_nm = 'NOT SET', 
@dsn_nm = 'NOT SET', 
@backup_path = 'NOT SET'

--[[Insert into Package_databases
EXEC inspackagedatabase 
@package_id = 'ZSM', 
@database_nm ='ZSM_Photos', 
@server_nm = 'NOT SET', 
@dsn_nm = 'NOT SET', 
@backup_path = 'NOT SET'

--[[Insert into Application
EXEC insApplication 
@application_id = 'ZSM_KOL', 
@application_nm = 'Zonal Sewadar Manager (Kolkata)', 
@package_id = 'ZSM', @database_nm = 'ZSM', 
@implementation_dt = '23-Feb-2012', 
@error_log_level = 'Error', 
@log_file_size_in_mb = '10',
@report_title = NULL,
@report_footer = NULL,
@path_1 = NULL,
@path_2 = NULL,
@path_3 = NULL,
@argument_1 = 7210,
@argument_2 = 'Kolkata',
@argument_3 = 'No',
@argument_4 = NULL, 
@argument_5 = NULL


EXEC inspackage 
@package_id = 'CDB', 
@package_nm = 'Central Database', 
@version_no = '2.99', 
@version_dt = '23-Feb-2012',
@server_distribution_root = '\\KOL1\E\ZSM\BIN\CDB', 
@client_default_root = 'NULL'

--[[Insert into Package_databases
EXEC inspackagedatabase 
@package_id = 'CDB', 
@database_nm ='CDB', 
@server_nm = 'NOT SET', 
@dsn_nm = 'NOT SET', 
@backup_path = 'NOT SET'


--[[Insert into Application
EXEC insApplication 
@application_id = 'CDB_APP', 
@application_nm = 'Central Database (Generic)', 
@package_id = 'CDB', @database_nm = 'CDB', 
@implementation_dt = '23-Feb-2012', 
@error_log_level = 'Error', 
@log_file_size_in_mb = '10',
@report_title = NULL,
@report_footer = NULL,
@path_1 = NULL,
@path_2 = NULL,
@path_3 = NULL,
@argument_1 = NULL,
@argument_2 = NULL,
@argument_3 = NULL,
@argument_4 = NULL, 
@argument_5 = NULL

COMMIT TRAN

update packages
	set server_distribution_root = '\\KOL1\E\ZSM\BIN\' + package_id,
		client_default_root = 'C:\ZSM\BIN\' + package_id

update  package_databases
	set server_nm = 'KOL1'


