/* ==================================================================================
	Source File		:	setup_departments.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	Wed Dec 08 12:32 IST 2010
	Version			:	1.00
	Module ID		:	ZSM
	Language		:	TRANSACT-SQL
	Last updated	:	09-Dec-2010
	Reviewed By		:
	Reviewed On		:
	==================================================================================
																		   Usage Notes
	----------------------------------------------------------------------------------
		This script sets up the departments.
		The Sub-Departments are set up using migration scripts. Therefore, it is essential
		that this script is run before migration (which will be usually the case)
	==================================================================================
																	  Revision History
	----------------------------------------------------------------------------------

	==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

-- =============================================================================
--	Departments
-- =============================================================================


DECLARE
	@centre_id			INT,
	@ngp_centre_id		INT,
	@dept_id			INT,
	@colour_black		INT,
	@colour_blue_dark	INT,
	@colour_blue_light	INT,
	@colour_brown		INT,
	@colour_green		INT,
	@colour_grey		INT,
	@colour_orange		INT,
	@colour_purple		INT,
	@colour_red			INT,
	@active_eff_from	DATETIME,
	@active_eff_till	DATETIME,
	@inactiv_eff_from	DATETIME,
	@inactiv_eff_till	DATETIME;

	SET	@centre_id			=	6015			----- Mumbai, Bhayendar
	SET	@ngp_centre_id		=	6056			----- Nagpur
	SET @colour_black		=	1;
	SET @colour_blue_dark	=	3;
	SET @colour_blue_light	=	4;
	SET @colour_brown		=	5;
	SET @colour_green		=	6;
	SET @colour_grey		=	7;
	SET @colour_orange		=	8;
	SET @colour_purple		=	9;
	SET @colour_red			=	10;
	SET	@active_eff_from 	= '01-Jan-2000'
	SET @active_eff_till	= '31-Dec-9999'
	SET @inactiv_eff_from	= '01-Jan-2000'
	SET @inactiv_eff_till	= '31-Dec-2009'

DELETE FROM	satsang_centres_details
WHERE	satsang_centre_id	=	@centre_id;

INSERT INTO	satsang_centres_details
		(	satsang_centre_id, is_main_centre, centre_nm, centre_alphabet, centre_cd	)
	VALUES
		(	@centre_id, 'Yes', 'Mumbai', 'M', 'MUM'	);

INSERT INTO	satsang_centres_details
		(	satsang_centre_id, is_main_centre, centre_nm, centre_alphabet, centre_cd	)
	VALUES
		(	@ngp_centre_id, 'Yes', 'Nagpur', 'N', 'NGP'	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'AC',   	'Accomodation',			@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, '%',	'No',	'No',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'ADM',  	'Administration',		@colour_green,	'Yes'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, '%',	'Yes',	'No',	'Yes',	'No',	@active_eff_from,	@active_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'AR',   	'Art Work',				@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, 'M',	'No',	'No',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'BAV',  	'BAV',					@colour_green,	'Yes'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, 'M',	'No',	'No',	'Yes',	'No',	@active_eff_from,	@active_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'BI',   	'Shamiana',			@colour_blue_dark,	'Yes'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, 'M',	'No',	'No',	'Yes',	'No',	@active_eff_from,	@active_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'BR',   	'Book Reading',			@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, '%',	'No',	'No',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'CA',   	'Carpentry',			@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, 'M',	'No',	'No',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'CC',   	'Child Care',			@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, '%',	'No',	'No',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'CD',   	'Cold Drinks',			@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, '%',	'No',	'No',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'CNT',  	'Canteen',			@colour_blue_light,	'Yes'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, '%',	'No',	'No',	'Yes',	'No',	@active_eff_from,	@active_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'CNTOF',	'Canteen Office',		@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, '%',	'No',	'No',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'CNTST',	'Canteen Stores',		@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, 'M',	'No',	'No',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'COM',  	'Committee',			@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, '%',	'No',	'No',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'COMP', 	'Computers',			@colour_black,	'Yes'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, '%',	'No',	'No',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'CONS', 	'Construction',			@colour_green,	'Yes'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, 'M',	'No',	'No',	'Yes',	'No',	@active_eff_from,	@active_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'COOR', 	'Coordination',			@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, '%',	'No',	'No',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'COU',  	'Coupons',				@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, 'M',	'No',	'No',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'DBB',  	'Distribution B.B.',	@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, '%',	'No',	'No',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'DCNT', 	'Distrib. Cant.',		@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, '%',	'No',	'No',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'DIST', 	'Distribution',			@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, '%',	'No',	'No',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'DS',   	'Darshan Sewa',			@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, '%',	'No',	'No',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'EL',   	'Electric',				@colour_green,	'Yes'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, 'M',	'No',	'No',	'Yes',	'No',	@active_eff_from,	@active_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'EN',   	'Engineering',			@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, 'M',	'No',	'No',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'FI',   	'Fire Services',		@colour_green,	'Yes'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, 'M',	'No',	'No',	'Yes',	'No',	@active_eff_from,	@active_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'GDT',  	'Goods Transport',		@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, 'M',	'No',	'No',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'GH',   	'Guest House',			@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, '%',	'No',	'No',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'GS',   	'Gate Sewa',			@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, 'M',	'No',	'No',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'HO',   	'Homeopathic',			@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, '%',	'No',	'No',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'KI',   	'Kitchen',				@colour_black,	'Yes'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, '%',	'No',	'No',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'LD',   	'Ladies Depts.',		@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, '%',	'No',	'No',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'LIA',  	'Liaison',				@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, '%',	'No',	'No',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'LN',   	'Langar',				@colour_orange,	'Yes'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, '%',	'No',	'No',	'Yes',	'No',	@active_eff_from,	@active_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'MAINT',	'Maintenance',			@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, '%',	'No',	'No',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'ME',   	'Medical',				@colour_green,	'Yes'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, '%',	'No',	'No',	'Yes',	'No',	@active_eff_from,	@active_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'MUNIC',	'Municipality',			@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, '%',	'No',	'No',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'ND',   	'Nam Dan',				@colour_purple,	'Yes'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, '%',	'No',	'No',	'Yes',	'No',	@active_eff_from,	@active_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'NDT',  	'Night Duty',			@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, '%',	'No',	'No',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'OF',   	'Office',				@colour_green,	'Yes'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, '%',	'Yes',	'No',	'Yes',	'No',	@active_eff_from,	@active_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'PA',   	'Pathi',				@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, '%',	'No',	'No',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'PATA', 	'Patawala',				@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, '%',	'No',	'No',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'PL',   	'Plumbing',				@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, 'M',	'No',	'No',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'PLANT',	'Plantation',			@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, '%',	'No',	'No',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'POCO', 	'Police Coordination',	@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, '%',	'No',	'No',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'PR',   	'Prasad',				@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, '%',	'No',	'No',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'PUBL', 	'Public Transport',		@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, '%',	'No',	'No',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'QH',   	'Q-Helpers',			@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, '%',	'No',	'No',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'RAIL', 	'Railways',				@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, '%',	'No',	'No',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'REKIT',	'Retired Kitchen',		@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, '%',	'No',	'No',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'RQTRA',	'Request For Transfer',	@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, '%',	'No',	'No',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'SA',   	'Sanitation',			@colour_green,	'Yes'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, '%',	'No',	'No',	'Yes',	'No',	@active_eff_from,	@active_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'SAFAI',	'Safai',				@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, '%',	'No',	'No',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'SE',   	'Security',				@colour_red,	'Yes'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, '%',	'No',	'No',	'Yes',	'No',	@active_eff_from,	@active_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'SH',   	'Luggage',				@colour_green,	'Yes'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, '%',	'No',	'No',	'Yes',	'No',	@active_eff_from,	@active_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'SIC',  	'Sewadar-In-Charge',	@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, '%',	'No',	'No',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'SOF',  	'Secretary Office',		@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, '%',	'No',	'No',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'SS',   	'Sewa Samiti',			@colour_green,	'Yes'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, '%',	'No',	'No',	'Yes',	'No',	@active_eff_from,	@active_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'SSOFF',	'Sewa Samiti Office',	@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, '%',	'No',	'No',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'STO',  	'Stores',				@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, '%',	'No',	'No',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'STV',  	'Sound & TV',			@colour_green,	'Yes'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, 'M',	'No',	'No',	'Yes',	'No',	@active_eff_from,	@active_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'TAPE', 	'Tape Recording',		@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, '%',	'No',	'No',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'TE',   	'Telephone',			@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, '%',	'No',	'No',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'TR',   	'Transport',			@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, 'M',	'No',	'No',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'TRAF', 	'Traffic',				@colour_brown,	'Yes'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, 'M',	'No',	'No',	'Yes',	'No',	@active_eff_from,	@active_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'UNKN', 	'Unknown Department',	@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, '%',	'No',	'No',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'US',   	'Pandal',				@colour_green,	'Yes'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, '%',	'No',	'No',	'Yes',	'No',	@active_eff_from,	@active_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'WA',   	'Water',				@colour_black,	'Yes'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, '%',	'No',	'No',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'WAIT', 	'Waiting List',			@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, '%',	'No',	'No',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'WNW',  	'Watch And Ward',		@colour_grey,	'Yes'	);
SET	@dept_id	=	SCOPE_IDENTITY();
INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @centre_id, 'M',	'No',	'No',	'Yes',	'No',	@active_eff_from,	@active_eff_till	);

GO

-- =============================================================================

