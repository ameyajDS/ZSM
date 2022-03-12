/* ==================================================================================
    Source File		:	upgrade_v5.74.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	30 Sep, 2014
    Last updated	:	30 Sep, 2014
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Upgrade Script for v5.74
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
	SET	version_no = 5.74,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'
GO

-- =============================================================================

USE ZSM
GO

ALTER	TABLE	generic_sewadar_lists
	ADD	is_for_export	Boolean		NOT NULL
			CONSTRAINT	GenericSewadarLists_DF_IsForExport
				DEFAULT	'No';
GO

ALTER	TABLE	generic_sewadar_lists
	ADD	exported_dtm					DATETIME					NULL;
GO

ALTER	TABLE	generic_sewadar_lists
	ADD	programme_satsang_centre_id 	satsang_centre_id			NULL
			CONSTRAINT	GenericSewadarLists_FK_ProgrammeSatsangCentreID
				REFERENCES	satsang_centres_details;
GO

ALTER	TABLE	generic_sewadar_lists
	ADD	CONSTRAINT	GenericSewadarLists_CK_ExportedDateTime_IsEditingAllowed
			CHECK	(	(	exported_dtm	IS NOT NULL		AND	is_editing_allowed	=	'No'	)
					OR	(	exported_dtm	IS NULL												)
					);
GO

ALTER	TABLE	generic_sewadar_lists
	ADD	CONSTRAINT	GenericSewadarLists_CK_IsForExport_ExportedDateTime
			CHECK	(	(	is_for_export	=	'No'	AND	exported_dtm	IS NULL	)
					OR	(	is_for_export	=	'Yes'								)
					);
GO

ALTER	TABLE	generic_sewadar_lists
	ADD	CONSTRAINT	GenericSewadarLists_CK_IsForExport_ProgrammeSatsangCentreID
			CHECK	(	(	is_for_export	=	'No'	AND	programme_satsang_centre_id	IS NULL	)
					OR	(	is_for_export	=	'Yes'								)
					);
GO

-- =============================================================================

SELECT	*	INTO	ZSM_TMP..generic_sewadar_lists
FROM	generic_sewadar_lists
WHERE	2 = 1

SELECT	*	INTO	ZSM_TMP..generic_sewadar_lists_sewadars
FROM	generic_sewadar_lists_sewadars
WHERE	2 = 1

-- =============================================================================
-- vim:ts=4 sw=4 ht=4
-- =============================================================================
