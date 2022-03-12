/* ==================================================================================
    Source File		:	upgrade_v5.76.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	30 Jun, 2014
    Last updated	:	29-Oct-2014
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Upgrade Script for v5.76
			.... schema change

		====================
		VERY VERY IMPORTANT:
		====================
			Remember to change the schema file when this is rolled into production.
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
	SET	version_no = 5.76,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'
GO

-- =============================================================================

USE ZSM
GO

ALTER	TABLE	generic_report_headers
	ADD	report_nm		report_nm;

GO

-- =============================================================================

ALTER	TABLE	generic_report_headers
	ADD	is_summary	Boolean;

GO

-- =============================================================================

ALTER	TABLE	scanning_jobs_controlling_dates
	ADD	CONSTRAINT	ScanningJobsControllingDates_CK_ControllingDate
		CHECK	(	controlling_dt	<	GetDate ());
GO

-- =============================================================================
-- vim:ts=4 sw=4 ht=4
-- =============================================================================
