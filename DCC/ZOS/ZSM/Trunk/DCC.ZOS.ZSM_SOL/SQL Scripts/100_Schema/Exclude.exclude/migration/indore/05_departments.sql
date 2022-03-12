/* ==================================================================================
	Source File		:	20_departments.sql
	Author(s)		:	Manish Saluja / Jitendra Loyal
	Started On		:	
	Version			:	
	Module ID		:	ZSM (Indore)
	Language		:	TRANSACT-SQL
	Last updated	:	Sat 28 Apr 2012
	Reviewed By		:	
	Reviewed On		:	
	==================================================================================
														 				   Usage Notes
	==================================================================================
																	  Revision History
	==================================================================================*/

DECLARE
	@ind_centre_id		INT,
	@dept_id			INT,
	@sub_dept_id		INT,
	@colour_black		INT,
	@colour_blue_dark	INT,
	@colour_blue_light	INT,
	@colour_brown		INT,
	@colour_green		INT,
	@colour_grey		INT,
	@colour_orange		INT,
	@colour_purple		INT,
	@colour_red			INT,
	@counter			INT,
	@active_eff_from	DATETIME,
	@active_eff_till	DATETIME,
	@inactiv_eff_from	DATETIME,
	@inactiv_eff_till	DATETIME,
	@sub_dept_str		CHAR(3);

	SET @colour_black		=	1;
	SET @colour_blue_dark	=	3;
	SET @colour_blue_light	=	4;
	SET @colour_brown		=	5;
	SET @colour_green		=	6;
	SET @colour_grey		=	7;
	SET @colour_orange		=	8;
	SET @colour_purple		=	9;
	SET @colour_red			=	10;
	SET	@active_eff_from 	= '01-Apr-2012';
	SET @active_eff_till	= '31-Dec-9999';
	SET @inactiv_eff_from	= '01-Jan-1980';
	SET @inactiv_eff_till	= '31-Mar-2012';

SELECT	@ind_centre_id	=	satsang_centre_id
FROM	satsang_centres_details
WHERE	centre_nm = 'Indore'
AND		is_main_centre = 'Yes';

IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Indore Centre not found', 16, 1);
	RETURN
END
----------------------------------------------------------------------------------------------------------
-- Updating departments_satsang_centres for Indore (common departments)
-- ====================================================================

/*		... JL ... this should have been taken care in the Procedure for Centre Set-up

SELECT @dept_id = department_id FROM departments WHERE department_nm = 'Canteen';

INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @ind_centre_id, '%',	'No',	'Yes',	'Yes',	'No',	@inactiv_eff_from, @active_eff_till	);

SELECT @dept_id = department_id FROM departments WHERE department_nm = 'Langar';

INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @ind_centre_id, '%',	'No',	'Yes',	'Yes',	'No',	@inactiv_eff_from, @active_eff_till	);

SELECT @dept_id = department_id FROM departments WHERE department_nm = 'Luggage';

INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @ind_centre_id, '%',	'No',	'Yes',	'Yes',	'No',	@inactiv_eff_from, @active_eff_till	);

SELECT @dept_id = department_id FROM departments WHERE department_nm = 'Nam Dan';

INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @ind_centre_id, '%',	'No',	'Yes',	'Yes',	'No',	@inactiv_eff_from, @active_eff_till	);

SELECT @dept_id = department_id FROM departments WHERE department_nm = 'Pandal';

INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @ind_centre_id, '%',	'No',	'Yes',	'Yes',	'No',	@inactiv_eff_from, @active_eff_till	);

SELECT @dept_id = department_id FROM departments WHERE department_nm = 'Security';

INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @ind_centre_id, '%',	'No',	'Yes',	'Yes',	'No',	@inactiv_eff_from, @active_eff_till	);

SELECT @dept_id = department_id FROM departments WHERE department_nm = 'Sewa Samiti';

INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @ind_centre_id, '%',	'No',	'Yes',	'Yes',	'No',	@inactiv_eff_from, @active_eff_till	);

SELECT @dept_id = department_id FROM departments WHERE department_nm = 'Shamiana';

INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @ind_centre_id, 'M',	'No',	'Yes',	'Yes',	'No',	@inactiv_eff_from, @active_eff_till	);

							*/

----------------------------------------------------------------------------------------------------------
-- New Department to be added as effective department in ZSM Indore
-- ================================================================
-- LATER: Badge Colour will change for this department
INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'HORT',  	'Horticulture',	@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();

INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @ind_centre_id, '%',	'No',	'Yes',	'Yes',	'No',	@inactiv_eff_from, @active_eff_till	);

-- LATER: Badge Colour will change for this department
INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'L&F',  	'Lost & Found',	@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();

INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @ind_centre_id, '%',	'No',	'Yes',	'Yes',	'No',	@inactiv_eff_from, @active_eff_till	);

-- LATER: Badge Colour will change for this department
SELECT @dept_id = department_id FROM departments WHERE department_nm = 'Accomodation'

INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @ind_centre_id, '%',	'No',	'Yes',	'Yes',	'No',	@inactiv_eff_from, @active_eff_till	);

----------------------------------------------------------------------------------------------------------

-- Adding to existing ineffective departments for Indore
-- =====================================================

SELECT @dept_id = department_id FROM departments WHERE department_nm = 'Carpentry'

INSERT INTO departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @ind_centre_id, 'M',	'No',	'Yes',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

SELECT @dept_id = department_id FROM departments WHERE department_nm = 'Coupons'

INSERT INTO departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @ind_centre_id, '%',	'No',	'Yes',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

SELECT @dept_id = department_id FROM departments WHERE department_nm = 'Darshan Sewa'

INSERT INTO departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @ind_centre_id, '%',	'No',	'Yes',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

SELECT @dept_id = department_id FROM departments WHERE department_nm = 'Engineering'

INSERT INTO departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @ind_centre_id, 'M',	'No',	'Yes',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

SELECT @dept_id = department_id FROM departments WHERE department_nm = 'Guest House'

INSERT INTO departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @ind_centre_id, 'F',	'No',	'Yes',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

SELECT @dept_id = department_id FROM departments WHERE department_nm = 'Office'

INSERT INTO departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @ind_centre_id, '%',	'No',	'Yes',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

SELECT @dept_id = department_id FROM departments WHERE department_nm = 'Safai'

INSERT INTO departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @ind_centre_id, '%',	'No',	'Yes',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

SELECT @dept_id = department_id FROM departments WHERE department_nm = 'Stores'

INSERT INTO departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @ind_centre_id, '%',	'No',	'Yes',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

-----------------------------------------------------------------------------------------------------------

-- Newly Added ineffective departments as they are present in Indore
-- =================================================================

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'ACNTS',  	'Accounts',	@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();

INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @ind_centre_id, 'M',	'No',	'Yes',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'ARSEC',  	'Area Secretary',	@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();

INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @ind_centre_id, '%',	'No',	'Yes',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'B&P',  	'Banners & Painting',	@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();

INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @ind_centre_id, '%',	'No',	'Yes',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'BS',  	'Book Stall',	@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();

INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @ind_centre_id, '%',	'No',	'Yes',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'CHBL',  	'Chhabeel',	@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();

INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @ind_centre_id, '%',	'No',	'Yes',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'COMMB',  	'Committee Member',	@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();

INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @ind_centre_id, '%',	'No',	'Yes',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'DISPY',  	'Dispensary',	@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();

INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @ind_centre_id, '%',	'No',	'Yes',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

/*
INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'ELECL',  	'Electrical',	@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();


INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @ind_centre_id, '%',	'No',	'Yes',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);
*/

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'ENQRY',  	'Enquiry',	@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();

INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @ind_centre_id, '%',	'No',	'Yes',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'FUNCY',  	'Functionary',	@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();

INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @ind_centre_id, '%',	'No',	'Yes',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'NRSRY',  	'Nursery',	@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();

INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @ind_centre_id, '%',	'No',	'Yes',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'PRES',  	'President',	@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();

INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @ind_centre_id, '%',	'No',	'Yes',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'PURCH',  	'Purchase',	@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();

INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @ind_centre_id, '%',	'No',	'Yes',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'TAC',  	'T.a.c.',	@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();

INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @ind_centre_id, '%',	'No',	'Yes',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'TRFSE',  	'Traffic (sec)',	@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();

INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @ind_centre_id, '%',	'No',	'Yes',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'WASUP',  	'Water Supply',	@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();

INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @ind_centre_id, '%',	'No',	'Yes',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO	departments	(	department_cd, department_nm, colour_id, has_sub_departments	)
			VALUES	(	'WRKSH',  	'Workshop',	@colour_black,	'No'	);
SET	@dept_id	=	SCOPE_IDENTITY();

INSERT INTO	departments_satsang_centres	(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till	)
							VALUES		(	@dept_id, @ind_centre_id, '%',	'No',	'Yes',	'Yes',	'No',	@inactiv_eff_from, @inactiv_eff_till	);

--------------------------------------------------------------------------------------------------------------------------------------------
-- Updating sub_departments_satsang_centres for Indore (exisiting sub-departments)
-- ========================================================================

/*		... JL ... this should have been taken care in the Procedure for Centre Set-up

SELECT @sub_dept_id = s.sub_department_id FROM sub_departments s JOIN departments d ON d.department_id = s.department_id
	WHERE department_nm = 'Administration' AND sub_department_nm = 'Office'

INSERT INTO sub_departments_satsang_centres	(	sub_department_id, satsang_centre_id, effective_from, effective_till	)
			VALUES	(	@sub_dept_id, @ind_centre_id, @active_eff_from, @active_eff_till	);

SELECT @sub_dept_id = s.sub_department_id FROM sub_departments s JOIN departments d ON d.department_id = s.department_id
	WHERE department_nm = 'Construction' AND sub_department_nm = 'Carpentry'

INSERT INTO sub_departments_satsang_centres	(	sub_department_id, satsang_centre_id, effective_from, effective_till	)
			VALUES	(	@sub_dept_id, @ind_centre_id, @active_eff_from, @active_eff_till	);

SELECT @sub_dept_id = s.sub_department_id FROM sub_departments s JOIN departments d ON d.department_id = s.department_id
	WHERE department_nm = 'Construction' AND sub_department_nm = 'Engineering'

INSERT INTO sub_departments_satsang_centres	(	sub_department_id, satsang_centre_id, effective_from, effective_till	)
			VALUES	(	@sub_dept_id, @ind_centre_id, @active_eff_from, @active_eff_till	);

SELECT @sub_dept_id = s.sub_department_id FROM sub_departments s JOIN departments d ON d.department_id = s.department_id
	WHERE department_nm = 'Construction' AND sub_department_nm = 'Plumbing'

INSERT INTO sub_departments_satsang_centres	(	sub_department_id, satsang_centre_id, effective_from, effective_till	)
			VALUES	(	@sub_dept_id, @ind_centre_id, @active_eff_from, @active_eff_till	);

SELECT @sub_dept_id = s.sub_department_id FROM sub_departments s JOIN departments d ON d.department_id = s.department_id
	WHERE department_nm = 'Sanitation' AND sub_department_nm = 'Safai'

INSERT INTO sub_departments_satsang_centres	(	sub_department_id, satsang_centre_id, effective_from, effective_till	)
			VALUES	(	@sub_dept_id, @ind_centre_id, @active_eff_from, @active_eff_till	);

SELECT @sub_dept_id = s.sub_department_id FROM sub_departments s JOIN departments d ON d.department_id = s.department_id
	WHERE department_nm = 'Sewa Samiti' AND sub_department_nm = 'Art work'

INSERT INTO sub_departments_satsang_centres	(	sub_department_id, satsang_centre_id, effective_from, effective_till	)
			VALUES	(	@sub_dept_id, @ind_centre_id, @active_eff_from, @active_eff_till	);

SELECT @sub_dept_id = s.sub_department_id FROM sub_departments s JOIN departments d ON d.department_id = s.department_id
	WHERE department_nm = 'Sewa Samiti' AND sub_department_nm = 'Pathi'

INSERT INTO sub_departments_satsang_centres	(	sub_department_id, satsang_centre_id, effective_from, effective_till	)
			VALUES	(	@sub_dept_id, @ind_centre_id, @active_eff_from, @active_eff_till	);

SELECT @sub_dept_id = s.sub_department_id FROM sub_departments s JOIN departments d ON d.department_id = s.department_id
	WHERE department_nm = 'Sewa Samiti' AND sub_department_nm = 'Stores'

INSERT INTO sub_departments_satsang_centres	(	sub_department_id, satsang_centre_id, effective_from, effective_till	)
			VALUES	(	@sub_dept_id, @ind_centre_id, @active_eff_from, @active_eff_till	);
*/
----------------------------------------------------------------------------------------------------------
-- Adding to existing ineffective sub-departments for Indore
-- =====================================================


SELECT @dept_id = department_id FROM departments WHERE department_nm = 'Langar';

SET @counter = 1;

WHILE @counter < 121
BEGIN
	SELECT @sub_dept_str = 
		CASE (LEN(@counter))
			WHEN 1 THEN '00'+CONVERT(CHAR(1), @counter)
			WHEN 2 THEN '0'+CONVERT(CHAR(2), @counter)
			WHEN 3 THEN CONVERT(CHAR(3), @counter)
		END;

	INSERT INTO sub_departments (	department_id, sub_department_cd, sub_department_nm	)
				VALUES	(	@dept_id, CONVERT(VARCHAR(3), @counter)+'tw', @sub_dept_str + '-tawa');
	SET @sub_dept_id	=	SCOPE_IDENTITY();
	
	INSERT INTO sub_departments_satsang_centres	(	sub_department_id, satsang_centre_id, effective_from, effective_till	)
				VALUES	(	@sub_dept_id, @ind_centre_id, @inactiv_eff_from, @inactiv_eff_till	);
	
	SET @counter = @counter + 1;
END;

INSERT INTO sub_departments (	department_id, sub_department_cd, sub_department_nm	)
			VALUES	(	@dept_id, 'AtaMc', 'Aata Machine');
SET @sub_dept_id	=	SCOPE_IDENTITY();

INSERT INTO sub_departments_satsang_centres	(	sub_department_id, satsang_centre_id, effective_from, effective_till	)
			VALUES	(	@sub_dept_id, @ind_centre_id, @inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO sub_departments (	department_id, sub_department_cd, sub_department_nm	)
			VALUES	(	@dept_id, 'AtKiS', 'Aate Ki Sewa');
SET @sub_dept_id	=	SCOPE_IDENTITY();

INSERT INTO sub_departments_satsang_centres	(	sub_department_id, satsang_centre_id, effective_from, effective_till	)
			VALUES	(	@sub_dept_id, @ind_centre_id, @inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO sub_departments (	department_id, sub_department_cd, sub_department_nm	)
			VALUES	(	@dept_id, 'BdBai', 'Badam Bai');
SET @sub_dept_id	=	SCOPE_IDENTITY();

INSERT INTO sub_departments_satsang_centres	(	sub_department_id, satsang_centre_id, effective_from, effective_till	)
			VALUES	(	@sub_dept_id, @ind_centre_id, @inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO sub_departments (	department_id, sub_department_cd, sub_department_nm	)
			VALUES	(	@dept_id, 'BBSaf', 'Bade Bartan Safai');
SET @sub_dept_id	=	SCOPE_IDENTITY();

INSERT INTO sub_departments_satsang_centres	(	sub_department_id, satsang_centre_id, effective_from, effective_till	)
			VALUES	(	@sub_dept_id, @ind_centre_id, @inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO sub_departments (	department_id, sub_department_cd, sub_department_nm	)
			VALUES	(	@dept_id, 'BgGrp', 'Baghar Group');
SET @sub_dept_id	=	SCOPE_IDENTITY();

INSERT INTO sub_departments_satsang_centres	(	sub_department_id, satsang_centre_id, effective_from, effective_till	)
			VALUES	(	@sub_dept_id, @ind_centre_id, @inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO sub_departments (	department_id, sub_department_cd, sub_department_nm	)
			VALUES	(	@dept_id, 'BtGrp', 'Bartan Group');
SET @sub_dept_id	=	SCOPE_IDENTITY();

INSERT INTO sub_departments_satsang_centres	(	sub_department_id, satsang_centre_id, effective_from, effective_till	)
			VALUES	(	@sub_dept_id, @ind_centre_id, @inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO sub_departments (	department_id, sub_department_cd, sub_department_nm	)
			VALUES	(	@dept_id, 'BhJal', 'Bhatti Jalav');
SET @sub_dept_id	=	SCOPE_IDENTITY();

INSERT INTO sub_departments_satsang_centres	(	sub_department_id, satsang_centre_id, effective_from, effective_till	)
			VALUES	(	@sub_dept_id, @ind_centre_id, @inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO sub_departments (	department_id, sub_department_cd, sub_department_nm	)
			VALUES	(	@dept_id, 'BrGrp', 'Burner Group');
SET @sub_dept_id	=	SCOPE_IDENTITY();

INSERT INTO sub_departments_satsang_centres	(	sub_department_id, satsang_centre_id, effective_from, effective_till	)
			VALUES	(	@sub_dept_id, @ind_centre_id, @inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO sub_departments (	department_id, sub_department_cd, sub_department_nm	)
			VALUES	(	@dept_id, 'CnGrp', 'Counter Group');
SET @sub_dept_id	=	SCOPE_IDENTITY();

INSERT INTO sub_departments_satsang_centres	(	sub_department_id, satsang_centre_id, effective_from, effective_till	)
			VALUES	(	@sub_dept_id, @ind_centre_id, @inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO sub_departments (	department_id, sub_department_cd, sub_department_nm	)
			VALUES	(	@dept_id, 'GtGrp', 'Gate Group');
SET @sub_dept_id	=	SCOPE_IDENTITY();

INSERT INTO sub_departments_satsang_centres	(	sub_department_id, satsang_centre_id, effective_from, effective_till	)
			VALUES	(	@sub_dept_id, @ind_centre_id, @inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO sub_departments (	department_id, sub_department_cd, sub_department_nm	)
			VALUES	(	@dept_id, 'GnKsr', 'General Kesar');
SET @sub_dept_id	=	SCOPE_IDENTITY();

INSERT INTO sub_departments_satsang_centres	(	sub_department_id, satsang_centre_id, effective_from, effective_till	)
			VALUES	(	@sub_dept_id, @ind_centre_id, @inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO sub_departments (	department_id, sub_department_cd, sub_department_nm	)
			VALUES	(	@dept_id, 'GnMan', 'General Mangilal');
SET @sub_dept_id	=	SCOPE_IDENTITY();

INSERT INTO sub_departments_satsang_centres	(	sub_department_id, satsang_centre_id, effective_from, effective_till	)
			VALUES	(	@sub_dept_id, @ind_centre_id, @inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO sub_departments (	department_id, sub_department_cd, sub_department_nm	)
			VALUES	(	@dept_id, 'GnRam', 'General Ramlal');
SET @sub_dept_id	=	SCOPE_IDENTITY();

INSERT INTO sub_departments_satsang_centres	(	sub_department_id, satsang_centre_id, effective_from, effective_till	)
			VALUES	(	@sub_dept_id, @ind_centre_id, @inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO sub_departments (	department_id, sub_department_cd, sub_department_nm	)
			VALUES	(	@dept_id, 'JlGrp', 'Jal Group');
SET @sub_dept_id	=	SCOPE_IDENTITY();

INSERT INTO sub_departments_satsang_centres	(	sub_department_id, satsang_centre_id, effective_from, effective_till	)
			VALUES	(	@sub_dept_id, @ind_centre_id, @inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO sub_departments (	department_id, sub_department_cd, sub_department_nm	)
			VALUES	(	@dept_id, 'Kadav', 'Kadav');
SET @sub_dept_id	=	SCOPE_IDENTITY();

INSERT INTO sub_departments_satsang_centres	(	sub_department_id, satsang_centre_id, effective_from, effective_till	)
			VALUES	(	@sub_dept_id, @ind_centre_id, @inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO sub_departments (	department_id, sub_department_cd, sub_department_nm	)
			VALUES	(	@dept_id, 'KhGrp', 'Khichadi Group');
SET @sub_dept_id	=	SCOPE_IDENTITY();

INSERT INTO sub_departments_satsang_centres	(	sub_department_id, satsang_centre_id, effective_from, effective_till	)
			VALUES	(	@sub_dept_id, @ind_centre_id, @inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO sub_departments (	department_id, sub_department_cd, sub_department_nm	)
			VALUES	(	@dept_id, 'LtSaf', 'Lt Safai');
SET @sub_dept_id	=	SCOPE_IDENTITY();

INSERT INTO sub_departments_satsang_centres	(	sub_department_id, satsang_centre_id, effective_from, effective_till	)
			VALUES	(	@sub_dept_id, @ind_centre_id, @inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO sub_departments (	department_id, sub_department_cd, sub_department_nm	)
			VALUES	(	@dept_id, 'Offic', 'Office');
SET @sub_dept_id	=	SCOPE_IDENTITY();

INSERT INTO sub_departments_satsang_centres	(	sub_department_id, satsang_centre_id, effective_from, effective_till	)
			VALUES	(	@sub_dept_id, @ind_centre_id, @inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO sub_departments (	department_id, sub_department_cd, sub_department_nm	)
			VALUES	(	@dept_id, 'Paros', 'Parosai');
SET @sub_dept_id	=	SCOPE_IDENTITY();

INSERT INTO sub_departments_satsang_centres	(	sub_department_id, satsang_centre_id, effective_from, effective_till	)
			VALUES	(	@sub_dept_id, @ind_centre_id, @inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO sub_departments (	department_id, sub_department_cd, sub_department_nm	)
			VALUES	(	@dept_id, 'ParB1', 'Parosai B-1');
SET @sub_dept_id	=	SCOPE_IDENTITY();

INSERT INTO sub_departments_satsang_centres	(	sub_department_id, satsang_centre_id, effective_from, effective_till	)
			VALUES	(	@sub_dept_id, @ind_centre_id, @inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO sub_departments (	department_id, sub_department_cd, sub_department_nm	)
			VALUES	(	@dept_id, 'ParB2', 'Parosai B-2');
SET @sub_dept_id	=	SCOPE_IDENTITY();

INSERT INTO sub_departments_satsang_centres	(	sub_department_id, satsang_centre_id, effective_from, effective_till	)
			VALUES	(	@sub_dept_id, @ind_centre_id, @inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO sub_departments (	department_id, sub_department_cd, sub_department_nm	)
			VALUES	(	@dept_id, 'ParB3', 'Parosai B-3');
SET @sub_dept_id	=	SCOPE_IDENTITY();

INSERT INTO sub_departments_satsang_centres	(	sub_department_id, satsang_centre_id, effective_from, effective_till	)
			VALUES	(	@sub_dept_id, @ind_centre_id, @inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO sub_departments (	department_id, sub_department_cd, sub_department_nm	)
			VALUES	(	@dept_id, 'ParB4', 'Parosai B-4');
SET @sub_dept_id	=	SCOPE_IDENTITY();

INSERT INTO sub_departments_satsang_centres	(	sub_department_id, satsang_centre_id, effective_from, effective_till	)
			VALUES	(	@sub_dept_id, @ind_centre_id, @inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO sub_departments (	department_id, sub_department_cd, sub_department_nm	)
			VALUES	(	@dept_id, 'ParB5', 'Parosai B-5');
SET @sub_dept_id	=	SCOPE_IDENTITY();

INSERT INTO sub_departments_satsang_centres	(	sub_department_id, satsang_centre_id, effective_from, effective_till	)
			VALUES	(	@sub_dept_id, @ind_centre_id, @inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO sub_departments (	department_id, sub_department_cd, sub_department_nm	)
			VALUES	(	@dept_id, 'ParBh', 'Parsada Bhandar');
SET @sub_dept_id	=	SCOPE_IDENTITY();

INSERT INTO sub_departments_satsang_centres	(	sub_department_id, satsang_centre_id, effective_from, effective_till	)
			VALUES	(	@sub_dept_id, @ind_centre_id, @inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO sub_departments (	department_id, sub_department_cd, sub_department_nm	)
			VALUES	(	@dept_id, 'PrGrp', 'Parsada Group');
SET @sub_dept_id	=	SCOPE_IDENTITY();

INSERT INTO sub_departments_satsang_centres	(	sub_department_id, satsang_centre_id, effective_from, effective_till	)
			VALUES	(	@sub_dept_id, @ind_centre_id, @inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO sub_departments (	department_id, sub_department_cd, sub_department_nm	)
			VALUES	(	@dept_id, 'RkGrp', 'Rakhodi Group');
SET @sub_dept_id	=	SCOPE_IDENTITY();

INSERT INTO sub_departments_satsang_centres	(	sub_department_id, satsang_centre_id, effective_from, effective_till	)
			VALUES	(	@sub_dept_id, @ind_centre_id, @inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO sub_departments (	department_id, sub_department_cd, sub_department_nm	)
			VALUES	(	@dept_id, 'RatSt', 'Ration Store');
SET @sub_dept_id	=	SCOPE_IDENTITY();

INSERT INTO sub_departments_satsang_centres	(	sub_department_id, satsang_centre_id, effective_from, effective_till	)
			VALUES	(	@sub_dept_id, @ind_centre_id, @inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO sub_departments (	department_id, sub_department_cd, sub_department_nm	)
			VALUES	(	@dept_id, 'SbGrp', 'Sabji Group');
SET @sub_dept_id	=	SCOPE_IDENTITY();

INSERT INTO sub_departments_satsang_centres	(	sub_department_id, satsang_centre_id, effective_from, effective_till	)
			VALUES	(	@sub_dept_id, @ind_centre_id, @inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO sub_departments (	department_id, sub_department_cd, sub_department_nm	)
			VALUES	(	@dept_id, 'Safai', 'Safai');
SET @sub_dept_id	=	SCOPE_IDENTITY();

INSERT INTO sub_departments_satsang_centres	(	sub_department_id, satsang_centre_id, effective_from, effective_till	)
			VALUES	(	@sub_dept_id, @ind_centre_id, @inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO sub_departments (	department_id, sub_department_cd, sub_department_nm	)
			VALUES	(	@dept_id, 'ScGrp', 'Security Group');
SET @sub_dept_id	=	SCOPE_IDENTITY();

INSERT INTO sub_departments_satsang_centres	(	sub_department_id, satsang_centre_id, effective_from, effective_till	)
			VALUES	(	@sub_dept_id, @ind_centre_id, @inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO sub_departments (	department_id, sub_department_cd, sub_department_nm	)
			VALUES	(	@dept_id, 'TtGrp', 'Tatpatti Group');
SET @sub_dept_id	=	SCOPE_IDENTITY();

INSERT INTO sub_departments_satsang_centres	(	sub_department_id, satsang_centre_id, effective_from, effective_till	)
			VALUES	(	@sub_dept_id, @ind_centre_id, @inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO sub_departments (	department_id, sub_department_cd, sub_department_nm	)
			VALUES	(	@dept_id, 'TeGrp', 'Tea Group');
SET @sub_dept_id	=	SCOPE_IDENTITY();

INSERT INTO sub_departments_satsang_centres	(	sub_department_id, satsang_centre_id, effective_from, effective_till	)
			VALUES	(	@sub_dept_id, @ind_centre_id, @inactiv_eff_from, @inactiv_eff_till	);

INSERT INTO sub_departments (	department_id, sub_department_cd, sub_department_nm	)
			VALUES	(	@dept_id, 'VegCt', 'Veg Cutting');
SET @sub_dept_id	=	SCOPE_IDENTITY();

INSERT INTO sub_departments_satsang_centres	(	sub_department_id, satsang_centre_id, effective_from, effective_till	)
			VALUES	(	@sub_dept_id, @ind_centre_id, @inactiv_eff_from, @inactiv_eff_till	);

--------------------------------------------------------------------------------------------------------------------------------------------

GO
