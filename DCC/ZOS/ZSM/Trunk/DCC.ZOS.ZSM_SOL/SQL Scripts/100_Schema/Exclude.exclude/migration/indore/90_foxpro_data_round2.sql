/* ==================================================================================
	Source File		:	90_foxpro_data_round2.sql
	Author(s)		:	Manish Saluja / Jitendra Loyal
	Started On		:	
	Version			:	
	Module ID		:	ZSM (Indore)
	Language		:	TRANSACT-SQL
	Last updated	:	13 May 2012
	Reviewed By		:	
	Reviewed On		:	
	==================================================================================
														 				   Usage Notes
	==================================================================================
																	  Revision History
	==================================================================================*/


-- 4. department_dt -> photo clicking date, status -> mail to Jiten (temporarily sewadar_status), status_dt -> date of photo clicking
--    responsibility -> sewadars, date-> photo clicking, sewadar_type -> R

IF EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'mgr_tmp_no_dobs_sewadars')
	DROP TABLE mgr_tmp_no_dobs_sewadars
GO

CREATE TABLE mgr_tmp_no_dobs_sewadars 
(
	centre_grno					VARCHAR (20),
	first_name					VARCHAR (100),
	middle_name					VARCHAR (100),	
	surname						VARCHAR (100),	
	gender						VARCHAR (20),
	is_married					VARCHAR (50),
	birth_dtm					VARCHAR (20),
	is_initiated				VARCHAR (50),
	initiation_dt				VARCHAR (50),		
	initiation_by				VARCHAR (100),
	initiation_place			VARCHAR (100),
	address_line_1				VARCHAR (200),
	address_line_2				VARCHAR (200),
	state_nm					VARCHAR (50),
	district_nm					VARCHAR (50),
	post_office_or_city_nm		VARCHAR (50),
	pin_or_zip_code				VARCHAR (50),
	telephone_mobile			VARCHAR (100),
	telephone_residence			VARCHAR (100),
	telephone_office			VARCHAR (100),
	occupation1					VARCHAR (100),
	occupation2					VARCHAR (100),
	occupation3					VARCHAR (100),
	qualification_nm			VARCHAR (100),
	attends_weekly_satsang		VARCHAR (100),	
	weekly_satsang_centre_nm	VARCHAR (100),	
	status						VARCHAR (100),
	appointment_dt				VARCHAR (100),
	department_nm				VARCHAR (100),
	sub_department_nm			VARCHAR (100),	
	attendance_97				VARCHAR (100),	
	attendance_98				VARCHAR (100),
	attendance_99				VARCHAR (100),
	attendance_2k				VARCHAR (100),
	attendance_01				VARCHAR (100),
	attendance_02				VARCHAR (100),
	attendance_03				VARCHAR (100),		
	attendance_04				VARCHAR (100),
	attendance_05				VARCHAR (100),
	attendance_06				VARCHAR (100),
	attendance_07				VARCHAR (100),
	attendance_08				VARCHAR (100),
	attendance_09				VARCHAR (100),
	attendance_10				VARCHAR (100),
	attendance_11				VARCHAR (100),
	attendance_12				VARCHAR (100),
	migration_note_fhname		VARCHAR (100),
	migration_note_skill		VARCHAR (100),
	migration_note_tehsil		VARCHAR (100)
)
GO

EXEC sp_configure 'show advanced options', 1
GO
RECONFIGURE
GO
--EXEC sp_configure 'Ad Hoc Distributed Queries', 1
--GO
--RECONFIGURE
--GO

INSERT INTO mgr_tmp_no_dobs_sewadars
	(
		centre_grno, first_name, middle_name, surname, gender, is_married, birth_dtm, is_initiated, initiation_dt, initiation_by, initiation_place,
		address_line_1, address_line_2, state_nm, district_nm, post_office_or_city_nm, pin_or_zip_code, telephone_mobile, telephone_residence,
		telephone_office, occupation1, occupation2, occupation3, qualification_nm, attends_weekly_satsang, weekly_satsang_centre_nm, status, appointment_dt,
		department_nm, sub_department_nm, attendance_97, attendance_98, attendance_99, attendance_2k, attendance_01, attendance_02, attendance_03,
		attendance_04, attendance_05, attendance_06, attendance_07, attendance_08, attendance_09, attendance_10, attendance_11, attendance_12,
		migration_note_fhname, migration_note_skill, migration_note_tehsil
	)
	SELECT 
		centre_grno, first_name, middle_name, surname, gender, is_married, birth_dtm, is_initiated, initiation_dt, initiation_by, initiation_place,
		address_line_1, address_line_2, state_nm, district_nm, post_office_or_city_nm, pin_or_zip_code, telephone_mobile, telephone_residence,
		telephone_office, occupation1, occupation2, occupation3, qualification_nm, attends_weekly_satsang, weekly_satsang_centre_nm, status, appointment_dt,
		department_nm, sub_department_nm, attendance_97, attendance_98, attendance_99, attendance_2k, attendance_01, attendance_02, attendance_03, 
		attendance_04, attendance_05, attendance_06, attendance_07, attendance_08, attendance_09, attendance_10, attendance_11, attendance_12,
		migration_note_fhname, migration_note_skill, migration_note_tehsil
	FROM OPENROWSET('Microsoft.Jet.OLEDB.4.0', 'Excel 8.0;Database=C:\TEMP\indore_old_system.xls', 'SELECT * FROM [Sheet1$]');

DELETE FROM mgr_tmp_no_dobs_sewadars
where centre_grno NOT in (3107, 3358, 3522, 3680, 4406, 7610, 11179, 12236, 12526, 13747, 13813, 13940, 16941, 16988, 17081,
17162, 17436, 17539, 22056, 23080, 23597, 25041, 27503, 28709, 31024, 32672, 33726, 38705, 38716, 44984)

GO

DECLARE @centre_id INT;
SET @centre_id = 5820;

UPDATE mgr_tmp_no_dobs_sewadars
	SET		sub_department_nm	=	NULL	-- Changing from 'Emergency' to NULL
	WHERE	centre_grno			=	54619
	
UPDATE mgr_tmp_no_dobs_sewadars
	SET		sub_department_nm	=	NULL	-- Changing from 'Casual' to NULL	
	WHERE	centre_grno			=	51205

UPDATE mgr_tmp_no_dobs_sewadars
	SET		department_nm		=	'Langar'	-- Changing from '' to 'Langar'
	WHERE	centre_grno			=	47741

UPDATE mgr_tmp_no_dobs_sewadars
	SET		sub_department_nm	=	NULL	-- Changing from various values of Langar sub-departments for non Langar departments to NULL
	WHERE	centre_grno			IN	(36843, 37397, 38167, 17738, 24647, 39333, 41332, 45472, 52023, 59235)

UPDATE mgr_tmp_no_dobs_sewadars	-- Spelling Correction
	SET		department_nm	=	'Accomodation'
	WHERE	department_nm	=	'Accommodation'

UPDATE mgr_tmp_no_dobs_sewadars	-- Spelling Correction
	SET		department_nm	=	'Carpentry'
	WHERE	department_nm	=	'Carpentery'

UPDATE mgr_tmp_no_dobs_sewadars	-- Renaming to exisitin inactive department
	SET		department_nm	=	'Coupons'
	WHERE	department_nm	=	'Coupon Stall'

UPDATE mgr_tmp_no_dobs_sewadars	-- Spelling Correction
	SET		department_nm	=	'Shamiana'
	WHERE	department_nm	=	'Shamiyana'

DECLARE @centre_id INT;
SET @centre_id = 5820;

INSERT INTO	mgr_centre_sewadars	
	(
		centre_grno, satsang_centre_id, first_name, middle_name, surname, gender, is_married, birth_dtm, is_initiated, initiation_dt, initiation_by,
		initiation_place, address_line_1, address_line_2, state_nm, district_nm, post_office_or_city_nm, pin_or_zip_code, telephone_mobile, 
		telephone_residence, telephone_office, occupation1, occupation2, occupation3, qualification_nm, attends_weekly_satsang, weekly_satsang_centre_nm,
		status, appointment_dt, department_nm, sub_department_nm, attendance_97, attendance_98, attendance_99, attendance_2k, attendance_01, attendance_02,
		attendance_03, attendance_04, attendance_05, attendance_06, attendance_07, attendance_08, attendance_09, attendance_10, attendance_11, attendance_12,
		migration_note_fhname, migration_note_skill, migration_note_tehsil
	)
	SELECT
		centre_grno, @centre_id, REPLACE (first_name, ' ', ''), REPLACE (middle_name, ' ', ''), REPLACE (surname, ' ', ''), gender, is_married, birth_dtm, is_initiated, initiation_dt, initiation_by, 
		initiation_place, address_line_1, address_line_2, state_nm, district_nm, post_office_or_city_nm, pin_or_zip_code, telephone_mobile, 
		telephone_residence, telephone_office, occupation1, occupation2, occupation3, qualification_nm, attends_weekly_satsang, weekly_satsang_centre_nm, 
		status, appointment_dt, department_nm, sub_department_nm, attendance_97, attendance_98, attendance_99, attendance_2k, attendance_01, attendance_02, 
		attendance_03, attendance_04, attendance_05, attendance_06, attendance_07, attendance_08, attendance_09, attendance_10, attendance_11, attendance_12,
		migration_note_fhname, migration_note_skill, migration_note_tehsil
	FROM	mgr_tmp_no_dobs_sewadars;

UPDATE m
	SET	m.department_id = d.department_id
	FROM mgr_centre_sewadars m
	JOIN departments d ON d.department_nm = m.department_nm
WHERE CENTRE_GRNO IN (3107, 3358, 3522, 3680, 4406, 7610, 11179, 12236, 12526, 13747, 13813, 13940, 16941, 16988, 17081,
				17162, 17436, 17539, 22056, 23080, 23597, 25041, 27503, 28709, 31024, 32672, 33726, 38705, 38716, 44984)
AND satsang_centre_id  = @centre_id;

UPDATE m
	SET m.sub_department_id = s.sub_department_id
	FROM mgr_centre_sewadars m
	JOIN departments d		ON	d.department_nm		= m.department_nm
	JOIN sub_departments s	ON	s.department_id		= d.department_id AND
								s.sub_department_nm	= m.sub_department_nm
WHERE CENTRE_GRNO IN (3107, 3358, 3522, 3680, 4406, 7610, 11179, 12236, 12526, 13747, 13813, 13940, 16941, 16988, 17081,
				17162, 17436, 17539, 22056, 23080, 23597, 25041, 27503, 28709, 31024, 32672, 33726, 38705, 38716, 44984)
AND satsang_centre_id  = @centre_id;

UPDATE m
	SET m.appointment_dt 	= '1-Feb-2012',
		m.migration_remark3	= 'Unknown appointment_dt is put as 1-Feb-2012'
	FROM mgr_centre_sewadars m
	WHERE m.appointment_dt IS NULL;

--DROP TABLE mgr_tmp_no_dobs_sewadars;




--select MAX(LEN(occupation1)) from mgr_tmp_no_dobs_sewadars
--select distinct initiation_dt from mgr_tmp_no_dobs_sewadars-- where initiation_dt = ' - -'
--select distinct birth_dtm from mgr_tmp_no_dobs_sewadars-- where birth_dtm = ' - -'
--select distinct appointment_dt from mgr_tmp_no_dobs_sewadars-- where appointment_dt  = ' - - : :'

