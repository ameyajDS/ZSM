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


USE ZSM
GO

-- =============================================================================
--	Data migration steps to be added here.
-- =============================================================================
INSERT INTO sewadars_other_disabilities
SELECT sd.sewadar_id ,md.medical_disability_id ,1 FROM sewadars_details sd
JOIN medical_disabilities md ON sd.any_disability = md.medical_disability_nm

INSERT INTO sewadars_other_disabilities
SELECT sd.sewadar_id ,md.medical_disability_id ,1 FROM sewadars_details sd
JOIN medical_disabilities md ON 'Allergy' = md.medical_disability_nm
WHERE sd.any_disability = 'Allergy, Asthma'

INSERT INTO sewadars_other_disabilities
SELECT sd.sewadar_id ,md.medical_disability_id ,2 FROM sewadars_details sd
JOIN medical_disabilities md ON 'Asthma' = md.medical_disability_nm
WHERE sd.any_disability = 'Allergy, Asthma'

INSERT INTO sewadars_other_disabilities
SELECT sd.sewadar_id ,md.medical_disability_id ,1 FROM sewadars_details sd
JOIN medical_disabilities md ON 'Deaf' = md.medical_disability_nm
WHERE sd.any_disability = 'Deaf, Dumb'

INSERT INTO sewadars_other_disabilities
SELECT sd.sewadar_id ,md.medical_disability_id ,2 FROM sewadars_details sd
JOIN medical_disabilities md ON 'Dumb' = md.medical_disability_nm
WHERE sd.any_disability = 'Deaf, Dumb'

INSERT INTO sewadars_other_disabilities
SELECT sd.sewadar_id ,md.medical_disability_id ,1 FROM sewadars_details sd
JOIN medical_disabilities md ON 'Back Bone Problem' = md.medical_disability_nm
WHERE sd.any_disability = 'Back Bone, Knee Joint Disorder'

INSERT INTO sewadars_other_disabilities
SELECT sd.sewadar_id ,md.medical_disability_id ,2 FROM sewadars_details sd
JOIN medical_disabilities md ON 'Knee Joint Disorder' = md.medical_disability_nm
WHERE sd.any_disability = 'Back Bone, Knee Joint Disorder'

INSERT INTO sewadars_other_disabilities
SELECT sd.sewadar_id ,md.medical_disability_id ,1 FROM sewadars_details sd
JOIN medical_disabilities md ON 'Asthma' = md.medical_disability_nm
WHERE sd.any_disability = 'Asthma, Arthritis'

INSERT INTO sewadars_other_disabilities
SELECT sd.sewadar_id ,md.medical_disability_id ,2 FROM sewadars_details sd
JOIN medical_disabilities md ON 'Arthritis' = md.medical_disability_nm
WHERE sd.any_disability = 'Asthma, Arthritis'

INSERT INTO sewadars_other_disabilities
SELECT sd.sewadar_id ,md.medical_disability_id ,1 FROM sewadars_details sd
JOIN medical_disabilities md ON 'Polio (Hand)' = md.medical_disability_nm
WHERE sd.any_disability = 'Polio (Hand/ Leg)'

INSERT INTO sewadars_other_disabilities
SELECT sd.sewadar_id ,md.medical_disability_id ,2 FROM sewadars_details sd
JOIN medical_disabilities md ON 'Polio (Leg)' = md.medical_disability_nm
WHERE sd.any_disability = 'Polio (Hand/ Leg)'

INSERT INTO sewadars_other_disabilities
SELECT sd.sewadar_id ,md.medical_disability_id ,1 FROM sewadars_details sd
JOIN medical_disabilities md ON 'Thyroid' = md.medical_disability_nm
WHERE sd.any_disability = 'Thyroid, Allergy'

INSERT INTO sewadars_other_disabilities
SELECT sd.sewadar_id ,md.medical_disability_id ,2 FROM sewadars_details sd
JOIN medical_disabilities md ON 'Allergy' = md.medical_disability_nm
WHERE sd.any_disability = 'Thyroid, Allergy'

UPDATE sewadars_details
SET any_disability = NULL
WHERE EXISTS( SELECT 1 FROM medical_disabilities md
			  WHERE any_disability = md.medical_disability_nm)

UPDATE sewadars_details
SET any_disability = NULL
WHERE any_disability IN ('Thyroid, Allergy', 'Polio (Hand/ Leg)', 'Asthma, Arthritis',  'Back Bone, Knee Joint Disorder', 'Deaf, Dumb', 'Allergy, Asthma')

SELECT * FROM sewadars_details
WHERE any_disability IS NOT NULL

IF (@@ROWCOUNT = 0)
	ALTER TABLE sewadars_details
		DROP COLUMN	any_disability
ELSE
	RAISERROR ('Other Medical Disabilities of Sewadars not migrated completely', 20, -1);
GO

-- =============================================================================
