/* ==================================================================================
    Source File		:	upgrade_v5.37.sql.exclude
    Author(s)		:	Jitendra Loyal
    Started On		:	Tue Dec 15 23:22 IST 2011
    Last updated	:	Dec 15, 2011
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Upgrade Script for v5.37
			..... Script for setting permissions post moving photos to ZSM_Photos
    ==================================================================================
								      								  Revision History
    ----------------------------------------------------------------------------------

   ==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

USE SysAdmin
GO


UPDATE packages
	SET	version_no = 5.37,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'

GO

USE ZSM_Photos
GO


-- =============================================================================
-- Set the connect privilege for all the user-roles
-- =============================================================================

EXEC sp_grantDBAccess 'ZSM_ADM';
EXEC sp_grantDBAccess 'ZSM_SUP';
EXEC sp_grantDBAccess 'ZSM_USR';
EXEC sp_grantDBAccess 'ZSM_ATM';
EXEC sp_grantDBAccess 'ZSM_RDR';

GO


-- =============================================================================
-- Grant the privileges to all the user-roles
-- =============================================================================

USE SysAdmin
GO

INSERT INTO package_databases
			(package_id, database_nm, server_nm, dsn_nm, backup_path)
	SELECT	'ZSM', 'ZSM_Photos', server_nm, dsn_nm, backup_path
	FROM package_databases
	WHERE package_id = 'ZSM' AND database_nm = 'ZSM'

EXEC GrantObjectPermissions 'ZSM_Photos', 'ZSM_RDR, ZSM_ATM, ZSM_USR, ZSM_SUP, ZSM_ADM', 'Yes';
GO


-- =============================================================================
-- vim:sw=4 ht=4 ai ts=4
