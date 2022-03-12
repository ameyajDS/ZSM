/* ==================================================================================
    Source File		:	upgrade_v5.36.sql.exclude
    Author(s)		:	Jitendra Loyal
    Started On		:	Tue Dec 13 19:11 IST 2011
    Last updated	:	Dec 13, 2011
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Upgrade Script for v5.36
			..... Sewadar's Photos are kept in a separate database
		IMPORTANT.
			Pre-requisites...... 
				1. Create Database ZSM_Photos
				2. execute 17_use_zsm_photos.sql through 19_use_zsm.sql
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
	SET	version_no = 5.36,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'

GO

USE ZSM
GO


-- =============================================================================
-- Migrate the photos
-- =============================================================================

INSERT INTO	ZSM_Photos..sewadars_photos
	SELECT	*
	FROM	sewadars_photos;
GO


-- =============================================================================
-- Migrate the photo audits
-- =============================================================================

INSERT INTO	ZSM_Photos..adt_sewadars_photos
	SELECT	*
	FROM	adt_sewadars_photos;
GO


-- vim:sw=4 ht=4 ai ts=4
