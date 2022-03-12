/* ==================================================================================
    Source File		:	reset_roles.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Thu Dec 25 07:20:28 IST 2011
    Last updated	:	Dec 25, 2011
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:	JL
    Reviewed On		:	
    ==================================================================================
									   									   Usage Notes
    ----------------------------------------------------------------------------------
		This sets the users properly after Restore of a Database
    ==================================================================================
								      								  Revision History
    ----------------------------------------------------------------------------------
			..... 1. The database name in their actual server is ZSM_NGP (and not ZSM)
			..... 2. ZSM_Photos is freshly created

		JL : 25-Dec-2011
			Initial version
   ==================================================================================*/


-- =============================================================================
--  ZSM database
-- =============================================================================

USE ZSM
GO

sp_change_users_login 'update_one', 'ZSM_SUP', 'ZSM_SUP'
GO
sp_change_users_login 'update_one', 'ZSM_ADM', 'ZSM_ADM'
GO
sp_change_users_login 'update_one', 'ZSM_USR', 'ZSM_USR'
GO
sp_change_users_login 'update_one', 'ZSM_RDR', 'ZSM_RDR'
GO
sp_change_users_login 'update_one', 'ZSM_ATM', 'ZSM_ATM'
GO
sp_change_users_login 'update_one', 'ZSM_ CU', 'ZSM_CU'
GO
sp_change_users_login 'update_one', 'ZSM_ PC', 'ZSM_PC'
GO

EXEC sp_grantdbaccess 'ZSM_PC','ZSM_PC'
EXEC sp_grantdbaccess 'ZSM_ATM','ZSM_ATM'
EXEC sp_grantdbaccess 'ZSM_RDR','ZSM_RDR'
EXEC sp_grantdbaccess 'ZSM_USR','ZSM_USR'
EXEC sp_grantdbaccess 'ZSM_ADM','ZSM_ADM'
EXEC sp_grantdbaccess 'ZSM_SUP','ZSM_SUP'
EXEC sp_grantdbaccess 'ZSM_CU','ZSM_CU'
GO

-- =============================================================================
--  ZSM_Photos database
-- =============================================================================

USE ZSM_Photos
GO

sp_change_users_login 'update_one', 'ZSM_SUP', 'ZSM_SUP'
GO
sp_change_users_login 'update_one', 'ZSM_ADM', 'ZSM_ADM'
GO
sp_change_users_login 'update_one', 'ZSM_USR', 'ZSM_USR'
GO
sp_change_users_login 'update_one', 'ZSM_RDR', 'ZSM_RDR'
GO
sp_change_users_login 'update_one', 'ZSM_ATM', 'ZSM_ATM'
GO
sp_change_users_login 'update_one', 'ZSM_ CU', 'ZSM_CU'
GO
sp_change_users_login 'update_one', 'ZSM_ PC', 'ZSM_PC'
GO

EXEC sp_grantdbaccess 'ZSM_PC','ZSM_PC'
EXEC sp_grantdbaccess 'ZSM_ATM','ZSM_ATM'
EXEC sp_grantdbaccess 'ZSM_RDR','ZSM_RDR'
EXEC sp_grantdbaccess 'ZSM_USR','ZSM_USR'
EXEC sp_grantdbaccess 'ZSM_ADM','ZSM_ADM'
EXEC sp_grantdbaccess 'ZSM_SUP','ZSM_SUP'
EXEC sp_grantdbaccess 'ZSM_CU','ZSM_CU'
GO

-- =============================================================================
--  CDB database - Added by Pramod on Apr 09, 2013
-- =============================================================================

USE CDB
GO

sp_change_users_login 'update_one', 'ZSM_SUP', 'ZSM_SUP'
GO
sp_change_users_login 'update_one', 'ZSM_ADM', 'ZSM_ADM'
GO
sp_change_users_login 'update_one', 'ZSM_USR', 'ZSM_USR'
GO
sp_change_users_login 'update_one', 'ZSM_RDR', 'ZSM_RDR'
GO
sp_change_users_login 'update_one', 'ZSM_ATM', 'ZSM_ATM'
GO
sp_change_users_login 'update_one', 'ZSM_CU', 'ZSM_CU'
GO
sp_change_users_login 'update_one', 'ZSM_PC', 'ZSM_PC'
GO

EXEC sp_grantdbaccess 'ZSM_PC','ZSM_PC'
EXEC sp_grantdbaccess 'ZSM_ATM','ZSM_ATM'
EXEC sp_grantdbaccess 'ZSM_RDR','ZSM_RDR'
EXEC sp_grantdbaccess 'ZSM_USR','ZSM_USR'
EXEC sp_grantdbaccess 'ZSM_ADM','ZSM_ADM'
EXEC sp_grantdbaccess 'ZSM_SUP','ZSM_SUP'
EXEC sp_grantdbaccess 'ZSM_CU','ZSM_CU'
GO

-- =============================================================================
-- vim:ts=4 ht=8 sw=4 guifont=Lucida_Console
