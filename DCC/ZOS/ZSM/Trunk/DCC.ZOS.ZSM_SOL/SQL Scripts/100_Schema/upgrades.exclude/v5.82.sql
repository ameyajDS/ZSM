/* ==================================================================================
    Source File		:	upgrade_v5.82.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	04 Dec, 2015
    Last updated	:	04 Dec, 2015
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Upgrade Script for v5.82
			Primary Key constraint name correction for Medical Disabilities
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
	SET	version_no = 5.82,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'
GO

-- =============================================================================

USE ZSM
GO

IF EXISTS	(	SELECT	*
				FROM	information_schema.key_column_usage
				WHERE	table_name = 'medical_disabilities'
				AND		constraint_name = 'MedicalDisablities_PK_MedicalDisabilityID'
			)
BEGIN
	ALTER	TABLE	sewadars_other_disabilities
		DROP	CONSTRAINT	SewadarsOtherDisabilities_FK_MedicalDisabilityID

	ALTER	TABLE	medical_disabilities
		DROP CONSTRAINT	MedicalDisablities_PK_MedicalDisabilityID

	ALTER	TABLE	medical_disabilities
		ADD	CONSTRAINT	MedicalDisabilities_PK_MedicalDisabilityID
			PRIMARY KEY	NONCLUSTERED	(	medical_disability_id	)
			
	ALTER	TABLE	sewadars_other_disabilities
		ADD	CONSTRAINT	SewadarsOtherDisabilities_FK_MedicalDisabilityID
			FOREIGN KEY (medical_disability_id)
				REFERENCES	medical_disabilities
END


-- =============================================================================
-- vim:ts=4 sw=4 ht=4
-- =============================================================================
