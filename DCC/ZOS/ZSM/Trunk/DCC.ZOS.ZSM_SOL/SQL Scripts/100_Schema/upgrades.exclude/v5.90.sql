/* ==================================================================================
    Source File		:	upgrade_v5.90.sql
    Author(s)		:	Jiten
    Started On		:	25 May, 2017
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
	SET	version_no = 5.90,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'
GO


-- =============================================================================
--		ZSM changes
-- =============================================================================

USE ZSM
GO

-- =============================================================================
ALTER	TABLE	sewadars_other_disabilities
	DROP	CONSTRAINT	SewadarsOtherDisabilities_FK_MedicalDisabilityID

ALTER TABLE	medical_disabilities
	DROP	CONSTRAINT	MedicalDisablities_PK_MedicalDisabilityID
ALTER TABLE	medical_disabilities
	DROP	CONSTRAINT	MedicalDisablities_U1_MedicalDisabilityName
ALTER TABLE	medical_disabilities
	DROP	CONSTRAINT	MedicalDisablities_U2_MedicalDisabilityCode
ALTER TABLE	medical_disabilities
	DROP	CONSTRAINT	MedicalDisablities_DF_EffectiveFrom
ALTER TABLE	medical_disabilities
	DROP	CONSTRAINT	MedicalDisablities_DF_EffectiveTill

ALTER TABLE	medical_disabilities
	ADD	CONSTRAINT	MedicalDisabilities_PK_MedicalDisabilityID
		PRIMARY KEY	NONCLUSTERED 	(	medical_disability_id	)
	
ALTER TABLE	medical_disabilities
	ADD	CONSTRAINT	MedicalDisabilities_U1_MedicalDisabilityName
		UNIQUE	CLUSTERED	(	medical_disability_nm	)

ALTER TABLE	medical_disabilities
	ADD	CONSTRAINT	MedicalDisabilities_U2_MedicalDisabilityCode
		UNIQUE	NONCLUSTERED	(	medical_disability_cd	)

ALTER TABLE	medical_disabilities
	ADD	CONSTRAINT	MedicalDisabilities_DF_EffectiveFrom
		DEFAULT Convert (VARCHAR (11), GetDate(), 106)	FOR		effective_from

ALTER TABLE	medical_disabilities
	ADD	CONSTRAINT	MedicalDisabilities_DF_EffectiveTill        				  
		DEFAULT '31-Dec-9999'							FOR		effective_till

ALTER	TABLE	sewadars_other_disabilities
	ADD	CONSTRAINT	SewadarsOtherDisabilities_FK_MedicalDisabilityID
		FOREIGN KEY  (medical_disability_id)
			REFERENCES	medical_disabilities

-- =============================================================================

-- vim:ts=4 ht=8 sw=4
