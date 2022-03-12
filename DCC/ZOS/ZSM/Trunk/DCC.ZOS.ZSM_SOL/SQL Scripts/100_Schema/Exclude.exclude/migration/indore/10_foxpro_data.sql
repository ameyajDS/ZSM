/* ==================================================================================
	Source File		:	10_foxpro_data.sql
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

IF EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = '#processed')
	DROP TABLE #processed
GO

CREATE TABLE #processed 
(
	centre_grno					VARCHAR (200),
	first_name					VARCHAR (200),
	middle_name					VARCHAR (200),	
	surname						VARCHAR (200),	
	gender						VARCHAR (200),
	is_married					VARCHAR (200),
	birth_dtm					VARCHAR (200),
	is_initiated				VARCHAR (200),
	initiation_dt				VARCHAR (200),		
	initiation_by				VARCHAR (200),
	initiation_place			VARCHAR (200),
	address_line_1				VARCHAR (200),
	address_line_2				VARCHAR (200),
	state_nm					VARCHAR (200),
	district_nm					VARCHAR (200),
	post_office_or_city_nm		VARCHAR (200),
	pin_or_zip_code				VARCHAR (200),
	telephone_mobile			VARCHAR (200),
	telephone_residence			VARCHAR (200),
	telephone_office			VARCHAR (200),
	occupation1					VARCHAR (200),
	occupation2					VARCHAR (200),
	occupation3					VARCHAR (200),
	qualification_nm			VARCHAR (200),
	attends_weekly_satsang		VARCHAR (200),	
	weekly_satsang_centre_nm	VARCHAR (200),	
	status						VARCHAR (200),
	appointment_dt				VARCHAR (200),
	department_nm				VARCHAR (200),
	sub_department_nm			VARCHAR (200),	
	attendance_97				VARCHAR (200),	
	attendance_98				VARCHAR (200),
	attendance_99				VARCHAR (200),
	attendance_2k				VARCHAR (200),
	attendance_01				VARCHAR (200),
	attendance_02				VARCHAR (200),
	attendance_03				VARCHAR (200),		
	attendance_04				VARCHAR (200),
	attendance_05				VARCHAR (200),
	attendance_06				VARCHAR (200),
	attendance_07				VARCHAR (200),
	attendance_08				VARCHAR (200),
	attendance_09				VARCHAR (200),
	attendance_10				VARCHAR (200),
	attendance_11				VARCHAR (200),
	attendance_12				VARCHAR (200),
	migration_note_fhname		VARCHAR (200),
	migration_note_skill		VARCHAR (200),
	migration_note_tehsil		VARCHAR (200)
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

INSERT INTO #processed
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
GO

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
	FROM	#processed;
GO

DROP TABLE #processed;

DECLARE @centre_id INT;
SET @centre_id = 5820;

UPDATE mgr_centre_sewadars
	SET		sub_department_nm	=	NULL	-- Changing from 'Emergency' to NULL
	WHERE	centre_grno			=	54619
	AND		satsang_centre_id	=	@centre_id;
	
UPDATE mgr_centre_sewadars
	SET		sub_department_nm	=	NULL	-- Changing from 'Casual' to NULL	
	WHERE	centre_grno			=	51205
	AND		satsang_centre_id	=	@centre_id;

UPDATE mgr_centre_sewadars
	SET		department_nm		=	'Langar'	-- Changing from '' to 'Langar'
	WHERE	centre_grno			=	47741
	AND		satsang_centre_id	=	@centre_id;

UPDATE mgr_centre_sewadars
	SET		sub_department_nm	=	NULL	-- Changing from various values of Langar sub-departments for non Langar departments to NULL
	WHERE	centre_grno			IN	(36843, 37397, 38167, 17738, 24647, 39333, 41332, 45472, 52023, 59235)
	AND		satsang_centre_id	=	@centre_id;

DELETE FROM mgr_centre_sewadars	-- Deleting the Sewadars that do not have any department
	WHERE	centre_grno			IN	(37445, 37450, 45355, 56920)
	AND		satsang_centre_id	=	@centre_id;
	
UPDATE mgr_centre_sewadars	-- Spelling Correction
	SET		department_nm	=	'Accomodation'
	WHERE	department_nm	=	'Accommodation'
	AND		satsang_centre_id	=	@centre_id;

UPDATE mgr_centre_sewadars	-- Spelling Correction
	SET		department_nm	=	'Carpentry'
	WHERE	department_nm	=	'Carpentery'
	AND		satsang_centre_id	=	@centre_id;

UPDATE mgr_centre_sewadars	-- Renaming to exisitin inactive department
	SET		department_nm	=	'Coupons'
	WHERE	department_nm	=	'Coupon Stall'
	AND		satsang_centre_id	=	@centre_id;

UPDATE mgr_centre_sewadars	-- Spelling Correction
	SET		department_nm	=	'Shamiana'
	WHERE	department_nm	=	'Shamiyana'
	AND		satsang_centre_id	=	@centre_id;

UPDATE m
	SET	m.department_id = d.department_id
	FROM mgr_centre_sewadars m
	JOIN departments d ON d.department_nm = m.department_nm
	WHERE	satsang_centre_id	=	@centre_id;

UPDATE m
	SET m.sub_department_id = s.sub_department_id
	FROM mgr_centre_sewadars m
	JOIN departments d		ON	d.department_nm		= m.department_nm
	JOIN sub_departments s	ON	s.department_id		= d.department_id AND
								s.sub_department_nm	= m.sub_department_nm;

UPDATE m
	SET m.appointment_dt 	= '1-Feb-2012',
		m.migration_remark3	= 'Unknown appointment_dt is put as 1-Feb-2012'
	FROM mgr_centre_sewadars m
	WHERE m.appointment_dt IS NULL;

	-- This data will be migrated later after fixing the birth_dtm
DELETE FROM mgr_centre_sewadars WHERE birth_dtm IS NULL;
--------------------------------------------------------------------------------------------------------------------------------------------


GO

--select MAX(LEN(occupation1)) from #processed
--select distinct initiation_dt from #processed-- where initiation_dt = ' - -'
--select distinct birth_dtm from #processed-- where birth_dtm = ' - -'
--select distinct appointment_dt from #processed-- where appointment_dt  = ' - - : :'

