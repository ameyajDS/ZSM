/* ==================================================================================
    Source File		:	upgrade_v5.60.sql
    Author(s)		:	Ameya Jadhav/Jitendra Loyal
    Started On		:	08 Jan, 2013 11:58
    Last updated	:	09 Jan, 2013
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Upgrade Script for v5.60
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
	SET	version_no = 5.60,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'

-- =============================================================================
--		ZSM changes
-- =============================================================================

USE ZSM
GO


-- =============================================================================
--	Check Constraint changed for Table scanning_jobs
-- =============================================================================

ALTER	TABLE	scanning_jobs
	DROP	CONSTRAINT	ScanningJobs_CK_IsConcluded_IsClosed_SewadarListId
GO

ALTER	TABLE	scanning_jobs
	ADD		CONSTRAINT	ScanningJobs_CK_IsConcluded_IsClosed_SewadarListId
				CHECK	(	(	is_concluded = 'No'								AND	sewadar_list_id	IS NOT NULL	)
						OR	(	is_concluded = 'Yes'	AND	is_closed = 'Yes'									)
						)
GO

-- =============================================================================
--	Table scanned_badges_store
-- =============================================================================

CREATE	TABLE	scanned_badges_store
(
	scanning_sub_job_id 	scanning_job_id		NOT NULL	CONSTRAINT	ScannedBadgesStore_FK_ScanningSubJobID
																REFERENCES	scanning_sub_jobs,

	controlling_dt			SMALLDATETIME		NOT	NULL,
	
	satsang_centre_id 		satsang_centre_id	NOT NULL,
	sewadar_grno			sewadar_grno		NOT NULL,

	scanned_dtm				DATETIME			NOT NULL,

		CONSTRAINT	ScannedBadgesStore_PK_ControllingDt_SatsangCentreID_SewadarGRNo_ScanningJobID
			PRIMARY KEY	NONCLUSTERED	(	controlling_dt, satsang_centre_id, sewadar_grno, scanning_sub_job_id 	),

		CONSTRAINT	ScannedBadgesStore_FK_SatsangCentreID_SewadarGRNo
			FOREIGN KEY	(	satsang_centre_id, sewadar_grno 	)
				REFERENCES	sewadars_registrations
)
GO

-- =============================================================================
-- System Information code for Status that is for tracking of badges (Issues and Returns)
-- =============================================================================

INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'SttsBdgTrk',	'Status - Badges tracking');
																								--				~~~~~~~~~~~~~~~~~~~~~~~~~~~~
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsBdgTrk',	'Perm'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsBdgTrk',	'Temp'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsBdgTrk',	'NI'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsBdgTrk',	'Retd'	);
GO

-- =============================================================================
-- Scanning Job Type for Reducing Sewadar List
-- =============================================================================

INSERT INTO	scanning_job_types
		(	scanning_job_type_cd, remarks, is_date_wise, has_sub_jobs, procedure_nm, cnt_procedure_nm, effective_from, effective_till	)
	VALUES
		(	'Reducing List', 'Reducing Sewadar List; can be used for Badges tracking', 'No', 'No', 'ReduceSewadarList', NULL, '08-Jan-2013', '31-Dec-9999'	);
GO

-- =============================================================================
---- This procedure is now dropped forever
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GetSewadarArbitraryExemptionCount' AND xtype = 'P')
	DROP PROCEDURE GetSewadarArbitraryExemptionCount
GO

-- =============================================================================
