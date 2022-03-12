USE Sysadmin
GO
--[[add the RES_Gnrc role to package_user_role table
EXEC CreateRole
@p_package_id = 'AMS',
@p_user_role_id = 'AMS_Gnrc',
@p_user_role_nm = 'Generic AMS User',
@p_executable_nm = 'AMS.exe'


