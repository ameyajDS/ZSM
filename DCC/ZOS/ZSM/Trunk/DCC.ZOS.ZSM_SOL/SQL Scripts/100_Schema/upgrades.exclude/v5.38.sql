/* ==================================================================================
    Source File		:	upgrade_v5.38.sql.exclude
    Author(s)		:	Jitendra Loyal
    Started On		:	Tue Dec 15 23:48 IST 2011
    Last updated	:	Dec 16, 2011
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Upgrade Script for v5.38
			..... Script for adding columns is_sewadar_type and sewadar_type_nm_prm to table generic_reports
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
	SET	version_no = 5.38,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'

GO

USE ZSM
GO


-- =============================================================================
-- adding columns is_sewadar_type and sewadar_type_prm to table generic_reports
-- =============================================================================

ALTER	TABLE	generic_reports
    ADD	is_sewadar_type	    CHAR (1)	NOT NULL	Default	'N';
GO

ALTER	TABLE	generic_reports
    ADD	sewadar_type_nm_prm	TINYINT		NOT NULL	Default	0;
GO


-- =============================================================================
-- vim:sw=4 ht=4 ai ts=4
