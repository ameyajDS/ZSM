USE ZSM_photos
GO
EXEC sp_change_users_login 'auto_fix','ZSM_ADM'
EXEC sp_change_users_login 'auto_fix','ZSM_RDR'
EXEC sp_change_users_login 'auto_fix','ZSM_ATM'
EXEC sp_change_users_login 'auto_fix','ZSM_USR'
EXEC sp_change_users_login 'auto_fix','ZSM_SUP'
EXEC sp_change_users_login 'auto_fix','ZSM_CU'
EXEC sp_change_users_login 'auto_fix','ZSM_PC'


USE ZSM
GO
EXEC sp_change_users_login 'auto_fix','ZSM_ADM'
EXEC sp_change_users_login 'auto_fix','ZSM_RDR'
EXEC sp_change_users_login 'auto_fix','ZSM_ATM'
EXEC sp_change_users_login 'auto_fix','ZSM_USR'
EXEC sp_change_users_login 'auto_fix','ZSM_SUP'
EXEC sp_change_users_login 'auto_fix','ZSM_CU'
EXEC sp_change_users_login 'auto_fix','ZSM_PC'


USE Log
GO
EXEC sp_change_users_login 'update_one','ZSM_ADM','ZSM_ADM';
EXEC sp_change_users_login 'update_one','ZSM_RDR','ZSM_RDR';
EXEC sp_change_users_login 'update_one','ZSM_ATM','ZSM_ATM';
EXEC sp_change_users_login 'update_one','ZSM_USR','ZSM_USR';
EXEC sp_change_users_login 'update_one','ZSM_SUP','ZSM_SUP';
EXEC sp_change_users_login 'update_one','ZSM_CU', 'ZSM_CU';
EXEC sp_change_users_login 'update_one','ZSM_PC', 'ZSM_PC';

USE CDB
GO
EXEC sp_change_users_login 'update_one','ZSM_ADM','ZSM_ADM';
EXEC sp_change_users_login 'update_one','ZSM_RDR','ZSM_RDR';
EXEC sp_change_users_login 'update_one','ZSM_ATM','ZSM_ATM';
EXEC sp_change_users_login 'update_one','ZSM_USR','ZSM_USR';
EXEC sp_change_users_login 'update_one','ZSM_SUP','ZSM_SUP';
EXEC sp_change_users_login 'update_one','ZSM_CU', 'ZSM_CU';
EXEC sp_change_users_login 'update_one','ZSM_PC', 'ZSM_PC';

USE SysAdmin
GO

sp_change_users_login 'update_one', 'ZSM_ADM', 'ZSM_ADM'
EXEC ChangeIdentity 'ZSM', 'ZSM_ADM'
GO
sp_change_users_login 'update_one', 'ZSM_RDR', 'ZSM_RDR'
EXEC ChangeIdentity 'ZSM', 'ZSM_RDR'
GO
sp_change_users_login 'update_one', 'ZSM_ATM', 'ZSM_ATM'
EXEC ChangeIdentity 'ZSM', 'ZSM_ATM'
GO
sp_change_users_login 'update_one', 'ZSM_USR', 'ZSM_USR'
EXEC ChangeIdentity 'ZSM', 'ZSM_USR'
GO
sp_change_users_login 'update_one', 'ZSM_SUP', 'ZSM_SUP'
EXEC ChangeIdentity 'ZSM', 'ZSM_SUP'
GO
sp_change_users_login 'update_one', 'ZSM_CU', 'ZSM_CU'
EXEC ChangeIdentity 'ZSM', 'ZSM_CU'
GO
EXEC sp_change_users_login 'update_one','ZSM_PC', 'ZSM_PC';
EXEC ChangeIdentity 'ZSM', 'ZSM_PC'
GO