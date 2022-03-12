exec CreateRole
@p_package_id = 'CDB',
@p_user_role_id = 'CDB_Read',
@p_user_role_nm ='CDB Reader',
@p_executable_nm='NOT SET',
@p_create_login='No'

EXEC DROPROLE 'CDB', 'CDB_LKPRDR'
EXEC CreateRole
@p_package_id = 'CDB'
,@p_user_role_id = 'CDB_LKPRDR'
,@p_user_role_nm = 'CDB Lookup Reader'
,@p_executable_nm = '.'
,@p_create_login='No'