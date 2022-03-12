/* ==================================================================================
    Source File		:	upgrade_v5.62.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	25 Jan, 2013
    Last updated	:	
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Upgrade Script for v5.61
				....
		
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
	SET	version_no = 5.62,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'

-- =============================================================================
--		ZSM changes
-- =============================================================================

USE ZSM
GO

ALTER	TABLE	adt_scanning_jobs_controlling_dates
	ADD scanning_job_id 		scanning_job_id				NULL;
GO

UPDATE	adt_scanning_jobs_controlling_dates
	SET	scanning_job_id	=	scanning_sub_job_id;
GO

ALTER	TABLE	adt_scanning_jobs_controlling_dates
	ALTER COLUMN scanning_job_id 		scanning_job_id		NOT NULL;
GO

ALTER	TABLE	adt_scanning_jobs_controlling_dates
	DROP AdtScanningJobsControllingDates_PK_AuditLogId_ScanningSubJobId_ControllingDt;
GO

ALTER	TABLE	adt_scanning_jobs_controlling_dates
	DROP COLUMN scanning_sub_job_id;
GO

ALTER	TABLE	adt_scanning_jobs_controlling_dates
	ADD CONSTRAINT	AdtScanningJobsControllingDates_PK_AuditLogId_ScanningJobId_ControllingDt	
		PRIMARY KEY		CLUSTERED	(	audit_log_id, scanning_job_id, controlling_dt	);
	GO

ALTER	TABLE	adt_sewadars_skills
	ADD skill_sq		display_order	NULL;
GO

UPDATE	adt_sewadars_skills
	SET skill_sq =	1;
GO

ALTER	TABLE	adt_sewadars_skills
	ALTER COLUMN  skill_sq		display_order	NOT NULL;
GO

-- =============================================================================
