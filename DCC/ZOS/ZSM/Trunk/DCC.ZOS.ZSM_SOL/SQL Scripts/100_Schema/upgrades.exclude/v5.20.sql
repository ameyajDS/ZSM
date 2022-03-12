/* ==================================================================================
    Source File		:	upgrade.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Mar 19 17:08 IST 2011
    Version			:	1.00
    Last updated	:	Mar 25, 2011
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:	
    Reviewed On		:	
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Script to upgrade to v5.20
    ==================================================================================
								   									  Revision History
    ----------------------------------------------------------------------------------

   ==================================================================================*/
USE SysAdmin
GO


UPDATE packages
	SET	version_no = 5.20,			---- build / release 16645
		version_dt = GetDate()
WHERE	package_id = 'ZSM'

GO
USE ZSM


-- =============================================================================
--	Changes dated 19-Mar-2011			-- [
-- =============================================================================
ALTER	TABLE	generic_reports
    ADD	is_badge_template               CHAR (1)		NOT NULL	Default	'N';
GO

ALTER	TABLE	generic_reports
	ADD	badge_template_id_prm			TINYINT			NOT NULL	Default	0;
GO

ALTER	TABLE	generic_reports
	ADD	badge_template_nm_prm			TINYINT			NOT NULL	Default	0;
GO


-- =============================================================================
--	Changes dated 19-Mar-2011			-- ]
-- =============================================================================


-- =============================================================================
--	Changes dated 23-Mar-2011			-- [
-- =============================================================================

CREATE	TABLE 	sewas_periods
(
	sewa_id			sewa_id				NOT NULL	CONSTRAINT	SewasPeriods_FK_SewaID
														REFERENCES	sewas,
	start_dt		SMALLDATETIME 		NOT NULL,
	finish_dt		SMALLDATETIME		NOT NULL,

		CONSTRAINT	SewasPeriods_PK_SewaID_StartDt
			PRIMARY KEY	NONCLUSTERED	(	sewa_id, start_dt	),

		CONSTRAINT	SewasPeriods_CK_StartDt_FinishDt
			CHECK	(	start_dt <= finish_dt	),
)
GO

CREATE	TABLE 	adt_sewas_periods
(
 	audit_log_id	audit_log_id		NOT NULL	CONSTRAINT	AdtSewasPeriods_FK_AuditLogId
														REFERENCES	audit_logs,
	sewa_id			sewa_id				NOT NULL,
	start_dt		SMALLDATETIME 		NOT NULL,
	finish_dt		SMALLDATETIME		NOT NULL,

		CONSTRAINT	AdtSewasPeriods_PK_AuditLogId_SewaId_StartDt	
			PRIMARY KEY		NONCLUSTERED	(	audit_log_id, sewa_id, start_dt	)
)
GO


CREATE TABLE 	scanning_jobs_periods
(
	scanning_job_id 		scanning_job_id		NOT NULL	CONSTRAINT	ScanningJobsPeriods_FK_ScanningJobID
																REFERENCES	scanning_jobs,
	effective_from			DATETIME 			NOT NULL,
	effective_till			DATETIME			NOT NULL,

		CONSTRAINT	ScanningJobsPeriods_PK_ScanningJobId_EffectiveFrom
			PRIMARY KEY	NONCLUSTERED	(	scanning_job_id, effective_from	),

		CONSTRAINT	ScanningJobsPeriods_CK_EffectiveFrom_EffectiveTill
			CHECK	(	effective_from <= effective_till	)
)
GO

CREATE TABLE 	adt_scanning_jobs_periods
(
 	audit_log_id			audit_log_id		NOT NULL	CONSTRAINT	AdtScanningJobsPeriods_FK_AuditLogId
																REFERENCES	audit_logs,
	scanning_job_id 		scanning_job_id		NOT NULL,
	effective_from			DATETIME 			NOT NULL,
	effective_till			DATETIME			NOT NULL,

		CONSTRAINT	AdtScanningJobsPeriods_PK_AuditLogId_ScanningJobId_EffectiveFrom	
			PRIMARY KEY		NONCLUSTERED	(	audit_log_id, scanning_job_id, effective_from	)
)
GO

DROP	TABLE 	adt_sewas_sewa_shifts
GO

CREATE	TABLE 	adt_sewas_sewa_shifts
(
 	audit_log_id	audit_log_id		NOT NULL	CONSTRAINT	AdtSewasSewaShifts_FK_AuditLogId
														REFERENCES	audit_logs,
	sewa_id			sewa_id				NOT NULL,
	sewa_shift		sewa_shift			NOT NULL,
	sewa_shift_sq	display_order		NOT NULL,
	credit_cnt		CreditCnt			NOT NULL,
	unit_cnt		CreditCnt			NOT NULL,

		CONSTRAINT	AdtSewasSewaShifts_PK_AuditLogId_SewaId_SewaShift	
			PRIMARY KEY		NONCLUSTERED	(	audit_log_id, sewa_id, sewa_shift	)
)
GO

DELETE	Sysadmin.dbo.standard_messages
WHERE	message_cd	=	'ParameterMisMatch';

INSERT INTO Sysadmin.dbo.standard_messages (package_id, message_cd,message_text)    VALUES( 'ZSM', 'ParameterMisMatch','@1 can be updated only if @2 is @3');

-- =============================================================================
--	Changes dated 23-Mar-2011			-- ]
-- =============================================================================
