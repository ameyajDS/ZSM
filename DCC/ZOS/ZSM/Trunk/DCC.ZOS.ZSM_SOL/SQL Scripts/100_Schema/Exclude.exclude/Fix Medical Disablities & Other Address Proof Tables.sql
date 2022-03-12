 /* ==================================================================================
    Source File		:	Fix Medical Disablities & Other Address Proof Tables.sql
    Author(s)		:	Pramod
    Started On		:	24 July, 2015
    Last updated	:	
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:	Jiten Loyal
    Reviewed On		:
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
	This routine fixes

	a. medical_disabilities table where medical_disability_id  begins with 44 (instead of 1)
	b. medical_disabilities table effective_from date is set to 28 Dec 2014 (Date for the zone)
	c. other_address_proofs table effective_from date is set to 28 Dec 2014 (Date for the zone)

	selected database will be ZSM or ZSM_XXX or ZSM_PRVEXP_XXX								      								  Revision History
    ----------------------------------------------------------------------------------

    ==================================================================================*/

BEGIN TRAN

GO

CREATE	TABLE	tmp_sewadars_other_disabilities
(
	sewadar_id			sewadar_id,
	medical_disability_nm		gnc_long_nm,
	medical_disability_sq		display_order
)
GO



INSERT INTO tmp_sewadars_other_disabilities
		(	sewadar_id, medical_disability_nm, medical_disability_sq	)
	SELECT	sewadar_id, medical_disability_nm, medical_disability_sq
	FROM	sewadars_other_disabilities	o
		JOIN	medical_disabilities	m
			ON	(	m.medical_disability_id	=	o.medical_disability_id	)


DROP	TABLE	adt_sewadars_other_disabilities
DROP	TABLE	adt_medical_disabilities
DROP	TABLE	sewadars_other_disabilities
DROP	TABLE	medical_disabilities

-- This portion copied from v5.75a
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
																				DEFAULT '28 Dec 2014', -- ORIGINAL DEFAULT Convert (VARCHAR (11), GetDate(), 106),
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
-- End copy from v5.75a

-- This portion copied from 43_setup_medical_disabilities
delete from medical_disabilities

INSERT INTO   medical_disabilities ( medical_disability_nm, medical_disability_cd )
VALUES ('Allergy', 'AL')
INSERT INTO   medical_disabilities ( medical_disability_nm, medical_disability_cd )
VALUES ('Amputation (Hand)', 'AH')
INSERT INTO   medical_disabilities ( medical_disability_nm, medical_disability_cd )
VALUES ('Amputation (Left Arm)', 'AM')
INSERT INTO   medical_disabilities ( medical_disability_nm, medical_disability_cd )
VALUES ('Artificial Leg', 'ALG')
INSERT INTO   medical_disabilities ( medical_disability_nm, medical_disability_cd )
VALUES ('Asthma', 'AS')
INSERT INTO   medical_disabilities ( medical_disability_nm, medical_disability_cd )
VALUES ('Arthritis', 'AR')
INSERT INTO   medical_disabilities ( medical_disability_nm, medical_disability_cd )
VALUES ('B/L Kidney Failure', 'KF')
INSERT INTO   medical_disabilities ( medical_disability_nm, medical_disability_cd )
VALUES ('Back Bone Problem', 'BP')
INSERT INTO   medical_disabilities ( medical_disability_nm, medical_disability_cd )
VALUES ('Breathlessness', 'BL')
INSERT INTO   medical_disabilities ( medical_disability_nm, medical_disability_cd )
VALUES ('Breast Cancer', 'BC')
INSERT INTO   medical_disabilities ( medical_disability_nm, medical_disability_cd )
VALUES ('Cervical Spondylosis', 'CS')
INSERT INTO   medical_disabilities ( medical_disability_nm, medical_disability_cd )
VALUES ('Deaf', 'DF')
INSERT INTO   medical_disabilities ( medical_disability_nm, medical_disability_cd )
VALUES ('Dumb', 'DU')
INSERT INTO   medical_disabilities ( medical_disability_nm, medical_disability_cd )
VALUES ('Ear Disorder', 'ED')
INSERT INTO   medical_disabilities ( medical_disability_nm, medical_disability_cd )
VALUES ('Foot Drop', 'FD')
INSERT INTO   medical_disabilities ( medical_disability_nm, medical_disability_cd )
VALUES ('Gout', 'GT')
INSERT INTO   medical_disabilities ( medical_disability_nm, medical_disability_cd )
VALUES ('Hearing Impairment', 'HI')
INSERT INTO   medical_disabilities ( medical_disability_nm, medical_disability_cd )
VALUES ('Kidney Problem', 'KP')
INSERT INTO   medical_disabilities ( medical_disability_nm, medical_disability_cd )
VALUES ('Knee Joint Disorder', 'KJ')
INSERT INTO   medical_disabilities ( medical_disability_nm, medical_disability_cd )
VALUES ('Loss of Speech- Paralysis', 'LSP')
INSERT INTO   medical_disabilities ( medical_disability_nm, medical_disability_cd )
VALUES ('Mentally challenged', 'MC')
INSERT INTO   medical_disabilities ( medical_disability_nm, medical_disability_cd )
VALUES ('Migraine', 'MI')
INSERT INTO   medical_disabilities ( medical_disability_nm, medical_disability_cd )
VALUES ('One Eye', 'OE')
INSERT INTO   medical_disabilities ( medical_disability_nm, medical_disability_cd ) 
VALUES ('Osteoporosis', 'OS')
INSERT INTO   medical_disabilities ( medical_disability_nm, medical_disability_cd )
VALUES ('Ovary Cancer', 'OC')
INSERT INTO   medical_disabilities ( medical_disability_nm, medical_disability_cd )
VALUES ('Paralytic', 'PA')
INSERT INTO   medical_disabilities ( medical_disability_nm, medical_disability_cd )
VALUES ('Parkinson''s disease', 'PR')
INSERT INTO   medical_disabilities ( medical_disability_nm, medical_disability_cd )
VALUES ('Physical Handicap', 'PH')
INSERT INTO   medical_disabilities ( medical_disability_nm, medical_disability_cd )
VALUES ('Physical Handicap (Hand)', 'HH')
INSERT INTO   medical_disabilities ( medical_disability_nm, medical_disability_cd )
VALUES ('Physical Handicap (Leg)', 'HL')
INSERT INTO   medical_disabilities ( medical_disability_nm, medical_disability_cd )
VALUES ('Polio', 'PO')
INSERT INTO   medical_disabilities ( medical_disability_nm, medical_disability_cd )
VALUES ('Polio (Foot)', 'PF')
INSERT INTO   medical_disabilities ( medical_disability_nm, medical_disability_cd )
VALUES ('Polio (Hand)', 'PLH')
INSERT INTO   medical_disabilities ( medical_disability_nm, medical_disability_cd )
VALUES ('Polio (Leg)', 'PL')
INSERT INTO   medical_disabilities ( medical_disability_nm, medical_disability_cd )
VALUES ('Rod in Arm', 'RA')
INSERT INTO   medical_disabilities ( medical_disability_nm, medical_disability_cd )
VALUES ('Rod in Leg', 'RL')
INSERT INTO   medical_disabilities ( medical_disability_nm, medical_disability_cd )
VALUES ('Skin Allergy', 'SA')
INSERT INTO   medical_disabilities ( medical_disability_nm, medical_disability_cd )
VALUES ('Slip Disc', 'SD')
INSERT INTO   medical_disabilities ( medical_disability_nm, medical_disability_cd )
VALUES ('Spondylitis', 'SP')
INSERT INTO   medical_disabilities ( medical_disability_nm, medical_disability_cd )
VALUES ('Sunburn', 'SB')
INSERT INTO   medical_disabilities ( medical_disability_nm, medical_disability_cd )
VALUES ('Thyroid', 'TH')
INSERT INTO   medical_disabilities ( medical_disability_nm, medical_disability_cd )
VALUES ('Thyroid, Allergy', 'TA')
INSERT INTO   medical_disabilities ( medical_disability_nm, medical_disability_cd )
VALUES ('Varicose Veins', 'VV')
-- End Copy from 43_setup_medical_disabilities

INSERT INTO sewadars_other_disabilities
		(	sewadar_id, medical_disability_id, medical_disability_sq	)
	SELECT	sewadar_id, medical_disability_id, medical_disability_sq
	FROM	tmp_sewadars_other_disabilities	o
		JOIN	medical_disabilities	m
			ON	(	m.medical_disability_nm	=	o.medical_disability_nm	)


DROP	TABLE	tmp_sewadars_other_disabilities

update other_address_proofs set effective_from = '28 Dec 2014'

-- COMMIT OR ROLLBACK

