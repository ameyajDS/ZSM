/* ==================================================================================
	Source File		:	setup_districts.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	Mon May 21 17:29 IST 2012
	Version			:	1.00
	Module ID		:	ZSM
	Language		:	TRANSACT-SQL
	Last updated	:	22-May-2012
	Reviewed By		:
	Reviewed On		:
	==================================================================================
																		   Usage Notes
	----------------------------------------------------------------------------------

	==================================================================================
																	  Revision History
	----------------------------------------------------------------------------------
		*   Initial versions
	==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

USE CDB
GO

-- =============                   ==============
--	Districts of                   Madhya Pradesh
-- =============                   ==============

DECLARE
	@state_id	INT;

SELECT	@state_id	=	s.state_id
FROM	states s
	JOIN	countries c
		ON	(	s.country_id = c.country_id	)
WHERE	country_nm = 'India'
AND		state_nm = 'Madhya Pradesh';

IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('State Madhya Pradesh not found', 16, 1);
	RETURN
END


	------ =============
	------ New Districts
	------ =============

INSERT INTO	districts_or_cities	(district_cd, district_nm, state_id)	VALUES	(	'ALRJP',	'Alirajpur',	@state_id	);
INSERT INTO	districts_or_cities	(district_cd, district_nm, state_id)	VALUES	(	'SNGRL',	'Singrauli',	@state_id	);

	------ =======================================
	------ Districts where spellings are different
	------ =======================================

UPDATE districts_or_cities
	SET	district_nm	= 'Anuppur'
WHERE	state_id	=	@state_id
AND		district_nm	= 'Anup Nagar';

	------ ================================
	------ Districts that are no more valid
	------ ================================

UPDATE districts_or_cities
	SET	effective_from	=	GetDate() - 1
WHERE	state_id	=	@state_id
AND		district_nm	IN	( 'Bastar', 'Bhillai', 'Gondi', 'Lashkar', 'Morar', 'Sajjapur' );
GO


-- =============                   ============
--	Districts of                   Chhattisgarh
-- =============                   ============

DECLARE
	@state_id	INT;

SELECT	@state_id	=	s.state_id
FROM	states s
	JOIN	countries c
		ON	(	s.country_id = c.country_id	)
WHERE	country_nm = 'India'
AND		state_nm = 'Chhattisgarh';

IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('State Chhattisgarh not found', 16, 1);
	RETURN
END


	------ =============
	------ New Districts
	------ =============

INSERT INTO	districts_or_cities	(district_cd, district_nm, state_id)	VALUES	(	'BLD',		'Balod',		@state_id	);
INSERT INTO	districts_or_cities	(district_cd, district_nm, state_id)	VALUES	(	'BLDBZ',	'Baloda Bazar',	@state_id	);
INSERT INTO	districts_or_cities	(district_cd, district_nm, state_id)	VALUES	(	'BLRPR',	'Balrampur',	@state_id	);
INSERT INTO	districts_or_cities	(district_cd, district_nm, state_id)	VALUES	(	'BMTR',		'Bemetara',		@state_id	);
INSERT INTO	districts_or_cities	(district_cd, district_nm, state_id)	VALUES	(	'BJPR',		'Bijapur',		@state_id	);
INSERT INTO	districts_or_cities	(district_cd, district_nm, state_id)	VALUES	(	'GRBND',	'Gariaband',	@state_id	);
INSERT INTO	districts_or_cities	(district_cd, district_nm, state_id)	VALUES	(	'KNDGN',	'Kondagaon',	@state_id	);
INSERT INTO	districts_or_cities	(district_cd, district_nm, state_id)	VALUES	(	'MNGL',		'Mungeli',		@state_id	);
INSERT INTO	districts_or_cities	(district_cd, district_nm, state_id)	VALUES	(	'NRNPR',	'Narayanpur',	@state_id	);
INSERT INTO	districts_or_cities	(district_cd, district_nm, state_id)	VALUES	(	'SKM',		'Sukma',		@state_id	);
INSERT INTO	districts_or_cities	(district_cd, district_nm, state_id)	VALUES	(	'SRJPR',	'Surajpur',		@state_id	);

	------ =======================================
	------ Districts where spellings are different
	------ =======================================

UPDATE districts_or_cities
	SET	district_nm	= 'Surguja'
WHERE	state_id	=	@state_id
AND		district_nm	= 'Sarguja';

	------ ================================
	------ Districts that are no more valid
	------ ================================

UPDATE districts_or_cities
	SET	effective_from	=	GetDate() - 1
WHERE	state_id	=	@state_id
AND		district_nm	IN	( 'Ambikapur', 'Baikunthpur', 'Jagdalpur', 'Janjgir', 'Kabir Dham', 'Kawrdha' );

GO



-- ===========================================================================================
-- Qualifications
-- ===========================================================================================

DECLARE @act_effective_from DATETIME;
SET @act_effective_from = '1-Jan-2000';

-- New Qualifications
INSERT INTO qualifications (qualification_type, qualification_cd, qualification_nm, effective_from) 
	VALUES ('Under Graduate', '1st BBA', 'First Year B.B.A.', @act_effective_from);

INSERT INTO qualifications (qualification_type, qualification_cd, qualification_nm, effective_from) 
	VALUES ('Graduate', 'BVSc', 'Bachelor of Veterinary Science', @act_effective_from);

INSERT INTO qualifications (qualification_type, qualification_cd, qualification_nm, remarks, effective_from) 
	VALUES ('Diploma', 'DHB', 'Dip. in Homoeopathy & Biochemistry', 'Diploma in Homoeopathy and Biochemistry', @act_effective_from);

-- ===========================================================================================
-- Skills
-- ===========================================================================================
-- Spelling Corrections
UPDATE skills SET skill_nm = 'Barber' 			WHERE skill_nm = 'BARBAR';
UPDATE skills SET skill_nm = 'Dress Designer' 	WHERE skill_nm = 'DRESS DESIGHNER';
UPDATE skills SET skill_nm = 'Stationery Shop' 	WHERE skill_nm = 'Stationary Shop';
UPDATE skills SET skill_nm = 'Laundry' 			WHERE skill_nm = 'Laundary';
UPDATE skills SET skill_nm = 'Confectionery' 	WHERE skill_nm = 'Confectionary';
UPDATE skills SET skill_nm = 'Maintenance' 		WHERE skill_nm = 'Maintainance';
UPDATE skills SET skill_nm = 'Marriage Bureau' 	WHERE skill_nm = 'Marraige Bureau';
UPDATE skills SET skill_nm = 'Superintendent' 	WHERE skill_nm = 'Superitendent';

-- New Skills
INSERT INTO skills (skill_nm, effective_from) VALUES ('Electrician', @act_effective_from);
INSERT INTO skills (skill_nm, effective_from) VALUES ('Astrologer', @act_effective_from);
INSERT INTO skills (skill_nm, effective_from) VALUES ('Stitching', @act_effective_from);
INSERT INTO skills (skill_nm, effective_from) VALUES ('Potter', @act_effective_from);

-- vim:ts=4 sw=4 ht=4
