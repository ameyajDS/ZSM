/* ==================================================================================
    Source File		:	upgrade_v5.80.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	05 Feb, 2015
    Last updated	:	05 Feb, 2015
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Upgrade Script for v5.80
			.... schema change
			-----------------------------------------------------------------------
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
	SET	version_no = 5.80,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'
GO

-- =============================================================================

USE ZSM
GO

ALTER	TABLE	adt_generic_sewadar_lists
	ADD	is_for_export	Boolean		NOT NULL
--			CONSTRAINT	GenericSewadarLists_DF_IsForExport
			CONSTRAINT	adt_generic_sewadar_lists_DF_IsForExport
				DEFAULT	'No';
GO

ALTER	TABLE	adt_generic_sewadar_lists
	ADD	exported_dtm					DATETIME					NULL
GO

ALTER	TABLE	adt_generic_sewadar_lists
	ADD	programme_satsang_centre_id 	satsang_centre_id			NULL
GO

-- =============================================================================
-- vim:ts=4 sw=4 ht=4
-- =============================================================================
