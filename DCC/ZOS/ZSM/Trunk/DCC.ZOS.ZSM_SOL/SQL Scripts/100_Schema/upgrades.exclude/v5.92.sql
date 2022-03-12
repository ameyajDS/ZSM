/* ==================================================================================
    Source File		:	upgrade_v5.92.sql
    Author(s)		:	Ameya
    Started On		:	16 Dec, 2017
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
	SET	version_no = 5.92,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'
GO


-- =============================================================================
--		ZSM changes
-- =============================================================================



USE ZSM
GO

-- =============================================================================
-- DataType	SpeakerStatus
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'SpeakerStatus' AND type = 'R')
BEGIN
	EXEC	sp_unbindrule	'SpeakerStatus'
	IF EXISTS (SELECT * FROM systypes WHERE name = 'SpeakerStatus')
		EXEC	sp_droptype		'SpeakerStatus'
	DROP	RULE	SpeakerStatus
END
GO

CREATE	RULE	SpeakerStatus
		AS	@VALUE	IN
				(	'Active',
					'Provisional',
					'InActive',
					'Retired',
					'Shifted'
				)
GO

EXEC	sp_addtype	'SpeakerStatus',		'VARCHAR (20)',			'NULL'
GO

EXEC	sp_bindrule	'SpeakerStatus',	'SpeakerStatus'
GO

-- =============================================================================
-- DataType	SpeakerType
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'SpeakerType' AND type = 'R')
BEGIN
	EXEC	sp_unbindrule	'SpeakerType'
	IF EXISTS (SELECT * FROM systypes WHERE name = 'SpeakerType')
		EXEC	sp_droptype		'SpeakerType'
	DROP	RULE	SpeakerType
END
GO

CREATE	RULE	SpeakerType
		AS	@VALUE	IN
				(	'Satsang Karta',
					'Satsang Reader',
					'Pathi',
					'Bal Satsang Karta',
					'Bal Pathi'
				)
GO

EXEC	sp_addtype	'SpeakerType',		'VARCHAR (20)',			'NULL'
GO

EXEC	sp_bindrule	'SpeakerType',	'SpeakerType'
GO


-- ======================================================================================
--	Speakers (Satsang Kartas, Satsang Readers, Pathis, Bal Satsang Kartas and Bal Pathis)
-- ======================================================================================

CREATE	TABLE	speakers
(
	speaker_id					sewadar_id			NOT NULL	CONSTRAINT	Speakers_PK_SpeakerID
																	PRIMARY KEY	CLUSTERED
																CONSTRAINT	Speakers_FK_SpeakerID
																	REFERENCES	sewadars_details,
	speaker_type				SpeakerType			NOT	NULL,
	satsang_centre_id 			satsang_centre_id	NOT	NULL	CONSTRAINT	Speakers_FK_SatsangCentreID
																	REFERENCES	satsang_centres_details,
	speaker_status				SpeakerStatus		NOT	NULL,
	speaker_status_dtm			SMALLDATETIME		NOT NULL,

	txn_ts						TIMESTAMP			NOT NULL
)
GO

-- =============================================================================

CREATE	TABLE	speakers_approvals_renewals
(
	speaker_id					sewadar_id			NOT NULL	CONSTRAINT	SpeakersApprovalsRenewals_FK_SpeakerID
																	REFERENCES	speakers,
	request_for_speaker_type	SpeakerType			NOT	NULL,

		--	When 0, request is for renewal
	is_approval					BIT					NOT NULL,

		--	Next renewal is 5 years from this date
	approval_dt					DATE				NOT	NULL,
	request_dt					DATE					NULL,

	reference_no				VARCHAR (20)			NULL,
	reference_dt				DATE					NULL,

	audition_remarks			VARCHAR (200)			NULL,

	review_remarks				VARCHAR (200)			NULL,
	review_sewadar_id			sewadar_id				NULL	CONSTRAINT	SpeakersApprovalsRenewals_FK_ReviewSewadarID
																	REFERENCES	sewadars,
	review_non_sewadar_nm		VARCHAR (30)			NULL,

	remarks						VARCHAR (200)			NULL,

	txn_ts						TIMESTAMP			NOT NULL,

		CONSTRAINT	SpeakersApprovalsRenewals_PK_SpeakerID_ApprovalDate
			PRIMARY	KEY	CLUSTERED	(	speaker_id, approval_dt),

		CONSTRAINT	SpeakersApprovalsRenewals_CK_ReferenceNo_ReferenceDate
			CHECK	(	(	reference_no	IS		NULL	AND	reference_dt	IS		NULL	)
					OR	(	reference_no	IS	NOT	NULL										)
					),

		CONSTRAINT	SpeakersApprovalsRenewals_CK_ReviewRemarks_ReviewSewadarID_ReviewNonSewadarName
			CHECK	(	(	review_remarks	IS		NULL	AND	review_sewadar_id	IS		NULL	AND		review_non_sewadar_nm	IS		NULL	)
					OR	(	review_remarks	IS	NOT	NULL	AND	review_sewadar_id	IS	NOT	NULL	AND		review_non_sewadar_nm	IS		NULL	)
					OR	(	review_remarks	IS	NOT	NULL	AND	review_sewadar_id	IS		NULL	AND		review_non_sewadar_nm	IS	NOT	NULL	)
					)
)
GO

-- =============================================================================

CREATE	TABLE	speakers_trainings
(
	speaker_id					sewadar_id			NOT NULL	CONSTRAINT	SpeakersTrainings_FK_SpeakerID
																	REFERENCES	speakers,
	training_for_speaker_type	SpeakerType			NOT	NULL,

		--	When is_attended is 1 or 0 (signifying attended training or did not attend training), training_dt should be in past;
		--	when is_attended is NULL, training_dt can be in future.	
	training_dt					DATE				NOT	NULL,
	is_attended					BIT						NULL,

	request_dt					DATE					NULL,

	reference_no				VARCHAR (20)			NULL,
	reference_dt				DATE					NULL,

	remarks						VARCHAR (200)			NULL,

	txn_ts						TIMESTAMP			NOT NULL,

		CONSTRAINT	SpeakersTrainings_PK_SpeakerID_TrainingDate
			PRIMARY	KEY	CLUSTERED	(	speaker_id, training_dt),

		CONSTRAINT	SpeakersTrainings_CK_ReferenceNo_ReferenceDate
			CHECK	(	(	reference_no	IS		NULL	AND	reference_dt	IS		NULL	)
					OR	(	reference_no	IS	NOT	NULL										)
					)
)
GO


-- =============================================================================
