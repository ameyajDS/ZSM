/* ==================================================================================
    Source File		:	upgrade_v5.87.sql
    Author(s)		:	Jiten
    Started On		:	01 Jan, 2017
    Last updated	:	01 Jan, 2017
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		
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
	SET	version_no = 5.87,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'

-- =============================================================================
--		ZSM changes
-- =============================================================================

USE ZSM
GO

-- =============================================================================

INSERT INTO	scanning_job_types
		(	scanning_job_type_cd, remarks, is_date_wise, has_sub_jobs, procedure_nm, cnt_procedure_nm, effective_from, effective_till	)
	VALUES
		(	'Increasing List', 'Increasing Sewadar List; can be used for Badges tracking', 'No', 'No', 'AddToSewadarList', NULL, '01-Jan-2017', '31-Dec-9999'	);

-- =============================================================================

-- vim:ts=4 ht=8 sw=4
