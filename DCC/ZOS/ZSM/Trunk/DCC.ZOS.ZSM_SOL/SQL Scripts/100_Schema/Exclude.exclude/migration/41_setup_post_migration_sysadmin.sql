update packages
	set server_distribution_root = '\\ZSMT\ZSM\BIN\' + package_id,
		client_default_root	=	'C:\ZSM\BIN\'  + package_id,
		version_no = 5.00, version_dt = '18-Jan-2011';

UPDATE package_databases
	SET	server_nm = 'ZSMT';

SELECT * FROM  packages


SELECT * FROM  APPLICATIONS

select * from applications

select * from package_user_roles
select * from user_privileges
select * from application_users
select * from all_users



