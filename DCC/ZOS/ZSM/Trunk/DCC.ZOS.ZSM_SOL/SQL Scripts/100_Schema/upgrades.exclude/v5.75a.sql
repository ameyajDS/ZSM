/* ==================================================================================
    Source File		:	upgrade_v5.75.sql
    Author(s)		:	Anil
    Started On		:	10 Oct, 2015
    Last updated	:	
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Upgrade Script for v5.75
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
	SET	version_no = 5.75,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'

-- =============================================================================
--		ZSM changes
-- =============================================================================

USE ZSM
GO
IF EXISTS(SELECT distinct any_disability
from sewadars_details x
where any_disability not in ('Allergy', 'Allergy, Asthma', 'Amputation (Hand)', 'Amputation (Left Arm)', 'Artificial Leg', 'Asthma', 'Arthritis',
'Asthma, Arthritis',
'B/L Kidney Failure', 'Back Bone Problem', 'Breathlessness', 'Breast Cancer', 'Cervical Spondylosis', 'Deaf', 'Deaf, Dumb',
'Ear Disorder', 'Foot Drop', 'Gout', 'Hearing Impairment', 'Kidney Problem', 'Knee Joint Disorder', 'Loss of Speech-Paralysis',
'Mentally challenged', 'Migraine', 'One Eye', 'Osteoporosis', 'Ovary Cancer', 'Paralytic', 'Parkinson''s disease',
'Physical Handicap', 'Physical Handicap (Hand)', 'Physical Handicap (Leg)',
'Polio', 'Polio (Foot)', 'Polio (Hand)', 'Polio (Hand/ Leg)', 'Polio (Leg)',
'Rod in Arm', 'Rod in Leg', 'Back Bone, Knee Joint Disorder',
'Skin Allergy', 'Slip Disc', 'Spondylitis', 'Sunburn',
'Thyroid', 'Thyroid, Allergy', 'Varicose Veins')
          )
BEGIN
	SELECT *
	from sewadars_details x
	where any_disability not in (	'Allergy', 'Allergy, Asthma', 'Amputation (Hand)', 'Amputation (Left Arm)', 'Artificial Leg', 'Asthma', 'Arthritis', 'Asthma, Arthritis',
									'B/L Kidney Failure', 'Back Bone Problem', 'Breathlessness', 'Breast Cancer', 'Cervical Spondylosis', 'Deaf', 'Deaf, Dumb',
									'Ear Disorder', 'Foot Drop', 'Gout', 'Hearing Impairment', 'Kidney Problem', 'Knee Joint Disorder', 'Loss of Speech-Paralysis',
									'Mentally challenged', 'Migraine', 'One Eye', 'Osteoporosis', 'Ovary Cancer', 'Paralytic', 'Parkinson''s disease',
									'Physical Handicap', 'Physical Handicap (Hand)', 'Physical Handicap (Leg)',
									'Polio', 'Polio (Foot)', 'Polio (Hand)', 'Polio (Hand/ Leg)', 'Polio (Leg)',
									'Rod in Arm', 'Rod in Leg', 'Back Bone, Knee Joint Disorder',
									'Skin Allergy', 'Slip Disc', 'Spondylitis', 'Sunburn',
									'Thyroid', 'Thyroid, Allergy', 'Varicose Veins')
								
	EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'upgrade v5.75', 'any_disability contains invalid entries', NULL
	RETURN
END 

-- =============================================================================

IF EXISTS (SELECT * FROM systypes WHERE name = 'medical_disability_id')
	EXEC	sp_droptype	'medical_disability_id'
GO
EXEC	sp_addtype	'medical_disability_id',	SMALLINT,			'NULL'
GO

-- =============================================================================

CREATE	TABLE	medical_disabilities
(
	medical_disability_id				medical_disability_id	NOT NULL 	IDENTITY (1, 1)
																			CONSTRAINT	MedicalDisabilities_PK_MedicalDisabilityID
																				PRIMARY KEY	NONCLUSTERED,
	
	medical_disability_nm 				gnc_long_nm				NOT NULL	CONSTRAINT	MedicalDisabilities_U1_MedicalDisabilityName
																				UNIQUE	CLUSTERED,

	medical_disability_cd				VARCHAR (10)			NOT NULL	CONSTRAINT	MedicalDisabilities_U2_MedicalDisabilityCode
																				UNIQUE	NONCLUSTERED,

	effective_from						DATETIME				NOT NULL	CONSTRAINT	MedicalDisabilities_DF_EffectiveFrom
																				DEFAULT Convert (VARCHAR (11), GetDate(), 106),
	effective_till						DATETIME				NOT NULL	CONSTRAINT	MedicalDisabilities_DF_EffectiveTill
																				DEFAULT '31-Dec-9999',
	txn_ts								TIMESTAMP				NOT NULL,

	CONSTRAINT	MedicalDisabilities_CK_EffectiveDates
			CHECK	(	effective_from <= effective_till	)
)
GO

CREATE	TABLE	sewadars_other_disabilities
(
	sewadar_id					sewadar_id					NOT NULL	CONSTRAINT	SewadarsOtherDisabilities_FK_SewadarID
																			REFERENCES	sewadars_details,
	medical_disability_id		medical_disability_id		NOT NULL	CONSTRAINT	SewadarsOtherDisabilities_FK_MedicalDisabilityID
																			REFERENCES	medical_disabilities,
	medical_disability_sq		display_order				NOT NULL,

		CONSTRAINT	SewadarsOtherDisabilities_PK_SewadarID_MedicalDisabilitySequence
			PRIMARY KEY	CLUSTERED	(	sewadar_id, medical_disability_sq	),
			
		CONSTRAINT	SewadarsOtherDisabilities_UK_MedicalDisabilityID_SewadarID
			UNIQUE	NONCLUSTERED	(	medical_disability_id, sewadar_id	)
)
GO

CREATE	TABLE	adt_sewadars_other_disabilities
(
 	audit_log_id	audit_log_id							NOT NULL	CONSTRAINT	AdtSewadarsOtherDisabilities_FK_AuditLogId
																			REFERENCES	audit_logs,
	sewadar_id					sewadar_id					NOT NULL,
	medical_disability_id		medical_disability_id		NOT NULL,
	medical_disability_sq		display_order				NOT NULL,

		CONSTRAINT	AdtSewadarsOtherDisabilities_PK_AuditLogId_SewadarId_MedicalDisabilityId	
			PRIMARY KEY		CLUSTERED	(	audit_log_id, sewadar_id, medical_disability_id	)
)
GO

CREATE	TABLE	adt_medical_disabilities
(
 	audit_log_id						audit_log_id			NOT NULL	CONSTRAINT	AdtMedicalDisabilities_FK_AuditLogId
																				REFERENCES	audit_logs,
	medical_disability_id				medical_disability_id	NOT NULL,
	medical_disability_nm 				gnc_long_nm				NOT NULL,
	medical_disability_cd				VARCHAR (10)			NOT NULL,
	effective_from						DATETIME				NOT NULL,
	effective_till						DATETIME				NOT NULL,

		CONSTRAINT	AdtMedicalDisabilities_PK_AuditLogId_MedicalDisabilityId	
			PRIMARY KEY		CLUSTERED	(	audit_log_id, medical_disability_id)
)
GO

-- =============================================================================
