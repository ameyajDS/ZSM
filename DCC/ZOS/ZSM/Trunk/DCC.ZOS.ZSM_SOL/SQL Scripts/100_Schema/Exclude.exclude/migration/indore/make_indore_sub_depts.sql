/* ==================================================================================
    Source File		:	make_indore_sub_depts.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Sun Oct 07 10:48 IST 2012
    Version			:	1.00
    Last updated	:	Oct 07, 2012
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    ==================================================================================
									   									   Usage Notes
    ----------------------------------------------------------------------------------
		Creates the Sub-Departments for Indore for Accommodation, Canteen and Langar
		Luggage, Sanitation and Pandal.
			Accommodation	:	D01 to D10
			Canteen			:	A01 to A04, A11 to A13, A21, A22, A31 to 33, A41 to A43
								B01 to B03, B11 to B13, B21, B22, B31, B32, B41 to B43
								C01, C11, C12, C21, C31, C41, C42
			Langar			:	J01 to J37 (L), J51 to J72 (G) ... only J71 and J72 are created in this script

			Luggage			:	L01, L02 (Lugagge), M11 to M14 (Mobile), L21, L22, L31 (General)
			Sanitation		:	T01 to T10 (Toilet), S01 to S07 (Brooming/Safai), S11 to S14 (Misc)
			Pandal			:	A1 to A4, B1 to B3, C1 to C3, D1 to D3, E1 to E3, M1 to M7 .... Groups
			Security 		:	G & X
			Traffic			:	P & R
    ==================================================================================
								      								  Revision History
    ----------------------------------------------------------------------------------
			*   Initial versions
   ==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

DECLARE
	@centre_id		INTEGER,
	@dept_id		INTEGER,
	@sub_dept_id	INTEGER,
	@has_sd			Boolean


SELECT	@centre_id	=	satsang_centre_id
FROM	satsang_centres_details
WHERE	centre_nm	=	'Indore'
AND		is_main_centre	=	'Yes';

IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Satsang Centre ID for Indore not found', 16, -1);
	RETURN;
END

-- ====================================================================================================
-- Sub-departments for Accommodation
-- ====================================================================================================

SELECT	@dept_id	=	department_id,
		@has_sd		=	has_sub_departments
FROM	departments
WHERE	department_nm	=	'Accommodation';

IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Department Accommodation not found', 16, -1);
	RETURN;
END

IF (@has_sd = 'No')
BEGIN
	UPDATE	departments
		SET	has_sub_departments	=	'Yes'
	WHERE	department_id		=	@dept_id;
	IF (@@ROWCOUNT != 1)
	BEGIN
		RAISERROR ('Department Accommodation could not be updated to have sub-departments', 16, -1);
		RETURN;
	END
END

-- ====================================================================================================

SELECT	@sub_dept_id	=	sub_department_id
FROM	sub_departments
WHERE	sub_department_nm	=	'Jatha D01'
AND		department_id		=	@dept_id;

IF (@@ROWCOUNT = 0)
BEGIN
	INSERT INTO	sub_departments
			(	department_id, sub_department_cd, sub_department_nm	)
		VALUES
			(	@dept_id, 'D01', 'Jatha D01'	);
	
	SET @sub_dept_id = SCOPE_IDENTITY ();
END

IF NOT EXISTS	(	SELECT	1
					FROM	sub_departments_satsang_centres
					WHERE	sub_department_id	=	@sub_dept_id
					AND		satsang_centre_id	=	@centre_id
				)
BEGIN
	INSERT INTO	sub_departments_satsang_centres
			(	sub_department_id, satsang_centre_id	)
		VALUES
			(	@sub_dept_id, @centre_id	);
END

PRINT 'Sub-department [Jatha D01] for Department Accommodation Created';

-- ====================================================================================================

SELECT	@sub_dept_id	=	sub_department_id
FROM	sub_departments
WHERE	sub_department_nm	=	'Jatha D02'
AND		department_id		=	@dept_id;

IF (@@ROWCOUNT = 0)
BEGIN
	INSERT INTO	sub_departments
			(	department_id, sub_department_cd, sub_department_nm	)
		VALUES
			(	@dept_id, 'D02', 'Jatha D02'	);
	
	SET @sub_dept_id = SCOPE_IDENTITY ();
END

IF NOT EXISTS	(	SELECT	1
					FROM	sub_departments_satsang_centres
					WHERE	sub_department_id	=	@sub_dept_id
					AND		satsang_centre_id	=	@centre_id
				)
BEGIN
	INSERT INTO	sub_departments_satsang_centres
			(	sub_department_id, satsang_centre_id	)
		VALUES
			(	@sub_dept_id, @centre_id	);
END

PRINT 'Sub-department [Jatha D02] for Department Accommodation Created';

-- ====================================================================================================

SELECT	@sub_dept_id	=	sub_department_id
FROM	sub_departments
WHERE	sub_department_nm	=	'Jatha D03'
AND		department_id		=	@dept_id;

IF (@@ROWCOUNT = 0)
BEGIN
	INSERT INTO	sub_departments
			(	department_id, sub_department_cd, sub_department_nm	)
		VALUES
			(	@dept_id, 'D03', 'Jatha D03'	);
	
	SET @sub_dept_id = SCOPE_IDENTITY ();
END

IF NOT EXISTS	(	SELECT	1
					FROM	sub_departments_satsang_centres
					WHERE	sub_department_id	=	@sub_dept_id
					AND		satsang_centre_id	=	@centre_id
				)
BEGIN
	INSERT INTO	sub_departments_satsang_centres
			(	sub_department_id, satsang_centre_id	)
		VALUES
			(	@sub_dept_id, @centre_id	);
END

PRINT 'Sub-department [Jatha D03] for Department Accommodation Created';

-- ====================================================================================================

SELECT	@sub_dept_id	=	sub_department_id
FROM	sub_departments
WHERE	sub_department_nm	=	'Jatha D04'
AND		department_id		=	@dept_id;

IF (@@ROWCOUNT = 0)
BEGIN
	INSERT INTO	sub_departments
			(	department_id, sub_department_cd, sub_department_nm	)
		VALUES
			(	@dept_id, 'D04', 'Jatha D04'	);
	
	SET @sub_dept_id = SCOPE_IDENTITY ();
END

IF NOT EXISTS	(	SELECT	1
					FROM	sub_departments_satsang_centres
					WHERE	sub_department_id	=	@sub_dept_id
					AND		satsang_centre_id	=	@centre_id
				)
BEGIN
	INSERT INTO	sub_departments_satsang_centres
			(	sub_department_id, satsang_centre_id	)
		VALUES
			(	@sub_dept_id, @centre_id	);
END

PRINT 'Sub-department [Jatha D04] for Department Accommodation Created';

-- ====================================================================================================

SELECT	@sub_dept_id	=	sub_department_id
FROM	sub_departments
WHERE	sub_department_nm	=	'Jatha D05'
AND		department_id		=	@dept_id;

IF (@@ROWCOUNT = 0)
BEGIN
	INSERT INTO	sub_departments
			(	department_id, sub_department_cd, sub_department_nm	)
		VALUES
			(	@dept_id, 'D05', 'Jatha D05'	);
	
	SET @sub_dept_id = SCOPE_IDENTITY ();
END

IF NOT EXISTS	(	SELECT	1
					FROM	sub_departments_satsang_centres
					WHERE	sub_department_id	=	@sub_dept_id
					AND		satsang_centre_id	=	@centre_id
				)
BEGIN
	INSERT INTO	sub_departments_satsang_centres
			(	sub_department_id, satsang_centre_id	)
		VALUES
			(	@sub_dept_id, @centre_id	);
END

PRINT 'Sub-department [Jatha D05] for Department Accommodation Created';

-- ====================================================================================================

SELECT	@sub_dept_id	=	sub_department_id
FROM	sub_departments
WHERE	sub_department_nm	=	'Jatha D06'
AND		department_id		=	@dept_id;

IF (@@ROWCOUNT = 0)
BEGIN
	INSERT INTO	sub_departments
			(	department_id, sub_department_cd, sub_department_nm	)
		VALUES
			(	@dept_id, 'D06', 'Jatha D06'	);
	
	SET @sub_dept_id = SCOPE_IDENTITY ();
END

IF NOT EXISTS	(	SELECT	1
					FROM	sub_departments_satsang_centres
					WHERE	sub_department_id	=	@sub_dept_id
					AND		satsang_centre_id	=	@centre_id
				)
BEGIN
	INSERT INTO	sub_departments_satsang_centres
			(	sub_department_id, satsang_centre_id	)
		VALUES
			(	@sub_dept_id, @centre_id	);
END

PRINT 'Sub-department [Jatha D06] for Department Accommodation Created';

-- ====================================================================================================

SELECT	@sub_dept_id	=	sub_department_id
FROM	sub_departments
WHERE	sub_department_nm	=	'Jatha D07'
AND		department_id		=	@dept_id;

IF (@@ROWCOUNT = 0)
BEGIN
	INSERT INTO	sub_departments
			(	department_id, sub_department_cd, sub_department_nm	)
		VALUES
			(	@dept_id, 'D07', 'Jatha D07'	);
	
	SET @sub_dept_id = SCOPE_IDENTITY ();
END

IF NOT EXISTS	(	SELECT	1
					FROM	sub_departments_satsang_centres
					WHERE	sub_department_id	=	@sub_dept_id
					AND		satsang_centre_id	=	@centre_id
				)
BEGIN
	INSERT INTO	sub_departments_satsang_centres
			(	sub_department_id, satsang_centre_id	)
		VALUES
			(	@sub_dept_id, @centre_id	);
END

PRINT 'Sub-department [Jatha D07] for Department Accommodation Created';

-- ====================================================================================================

SELECT	@sub_dept_id	=	sub_department_id
FROM	sub_departments
WHERE	sub_department_nm	=	'Jatha D08'
AND		department_id		=	@dept_id;

IF (@@ROWCOUNT = 0)
BEGIN
	INSERT INTO	sub_departments
			(	department_id, sub_department_cd, sub_department_nm	)
		VALUES
			(	@dept_id, 'D08', 'Jatha D08'	);
	
	SET @sub_dept_id = SCOPE_IDENTITY ();
END

IF NOT EXISTS	(	SELECT	1
					FROM	sub_departments_satsang_centres
					WHERE	sub_department_id	=	@sub_dept_id
					AND		satsang_centre_id	=	@centre_id
				)
BEGIN
	INSERT INTO	sub_departments_satsang_centres
			(	sub_department_id, satsang_centre_id	)
		VALUES
			(	@sub_dept_id, @centre_id	);
END

PRINT 'Sub-department [Jatha D08] for Department Accommodation Created';

-- ====================================================================================================

SELECT	@sub_dept_id	=	sub_department_id
FROM	sub_departments
WHERE	sub_department_nm	=	'Jatha D09'
AND		department_id		=	@dept_id;

IF (@@ROWCOUNT = 0)
BEGIN
	INSERT INTO	sub_departments
			(	department_id, sub_department_cd, sub_department_nm	)
		VALUES
			(	@dept_id, 'D09', 'Jatha D09'	);
	
	SET @sub_dept_id = SCOPE_IDENTITY ();
END

IF NOT EXISTS	(	SELECT	1
					FROM	sub_departments_satsang_centres
					WHERE	sub_department_id	=	@sub_dept_id
					AND		satsang_centre_id	=	@centre_id
				)
BEGIN
	INSERT INTO	sub_departments_satsang_centres
			(	sub_department_id, satsang_centre_id	)
		VALUES
			(	@sub_dept_id, @centre_id	);
END

PRINT 'Sub-department [Jatha D09] for Department Accommodation Created';

-- ====================================================================================================

SELECT	@sub_dept_id	=	sub_department_id
FROM	sub_departments
WHERE	sub_department_nm	=	'Jatha D10'
AND		department_id		=	@dept_id;

IF (@@ROWCOUNT = 0)
BEGIN
	INSERT INTO	sub_departments
			(	department_id, sub_department_cd, sub_department_nm	)
		VALUES
			(	@dept_id, 'D10', 'Jatha D10'	);
	
	SET @sub_dept_id = SCOPE_IDENTITY ();
END

IF NOT EXISTS	(	SELECT	1
					FROM	sub_departments_satsang_centres
					WHERE	sub_department_id	=	@sub_dept_id
					AND		satsang_centre_id	=	@centre_id
				)
BEGIN
	INSERT INTO	sub_departments_satsang_centres
			(	sub_department_id, satsang_centre_id	)
		VALUES
			(	@sub_dept_id, @centre_id	);
END

PRINT 'Sub-department [Jatha D10] for Department Accommodation Created';


-- ====================================================================================================
-- Sub-departments for Canteen, Langar, Luggage, Sanitation, Pandal, Security, Traffic
-- ====================================================================================================

SELECT	@dept_id	=	department_id,
		@has_sd		=	has_sub_departments
FROM	departments
WHERE	department_nm	=	'Canteen';

IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Department Canteen not found', 16, -1);
	RETURN;
END

IF (@has_sd = 'No')
BEGIN
	UPDATE	departments
		SET	has_sub_departments	=	'Yes'
	WHERE	department_id		=	@dept_id;
	IF (@@ROWCOUNT != 1)
	BEGIN
		RAISERROR ('Department Canteen could not be updated to have sub-departments', 16, -1);
		RETURN;
	END
END

-- ====================================================================================================

SELECT	@sub_dept_id	=	sub_department_id
FROM	sub_departments
WHERE	sub_department_nm	=	'Canteen 1 Jatha 01'
AND		department_id		=	@dept_id;

IF (@@ROWCOUNT = 0)
BEGIN
	INSERT INTO	sub_departments
			(	department_id, sub_department_cd, sub_department_nm	)
		VALUES
			(	@dept_id, 'A01', 'Canteen 1 Jatha 01'	);
	
	SET @sub_dept_id = SCOPE_IDENTITY ();
END

IF NOT EXISTS	(	SELECT	1
					FROM	sub_departments_satsang_centres
					WHERE	sub_department_id	=	@sub_dept_id
					AND		satsang_centre_id	=	@centre_id
				)
BEGIN
	INSERT INTO	sub_departments_satsang_centres
			(	sub_department_id, satsang_centre_id	)
		VALUES
			(	@sub_dept_id, @centre_id	);
END

PRINT 'Sub-department [Canteen 1 Jatha 01] for Department Canteen Created';

-- ====================================================================================================

SELECT	@sub_dept_id	=	sub_department_id
FROM	sub_departments
WHERE	sub_department_nm	=	'Canteen 1 Jatha 02'
AND		department_id		=	@dept_id;

IF (@@ROWCOUNT = 0)
BEGIN
	INSERT INTO	sub_departments
			(	department_id, sub_department_cd, sub_department_nm	)
		VALUES
			(	@dept_id, 'A02', 'Canteen 1 Jatha 02'	);
	
	SET @sub_dept_id = SCOPE_IDENTITY ();
END

IF NOT EXISTS	(	SELECT	1
					FROM	sub_departments_satsang_centres
					WHERE	sub_department_id	=	@sub_dept_id
					AND		satsang_centre_id	=	@centre_id
				)
BEGIN
	INSERT INTO	sub_departments_satsang_centres
			(	sub_department_id, satsang_centre_id	)
		VALUES
			(	@sub_dept_id, @centre_id	);
END

PRINT 'Sub-department [Canteen 1 Jatha 02] for Department Canteen Created';

-- ====================================================================================================

SELECT	@sub_dept_id	=	sub_department_id
FROM	sub_departments
WHERE	sub_department_nm	=	'Canteen 1 Jatha 03'
AND		department_id		=	@dept_id;

IF (@@ROWCOUNT = 0)
BEGIN
	INSERT INTO	sub_departments
			(	department_id, sub_department_cd, sub_department_nm	)
		VALUES
			(	@dept_id, 'A03', 'Canteen 1 Jatha 03'	);
	
	SET @sub_dept_id = SCOPE_IDENTITY ();
END

IF NOT EXISTS	(	SELECT	1
					FROM	sub_departments_satsang_centres
					WHERE	sub_department_id	=	@sub_dept_id
					AND		satsang_centre_id	=	@centre_id
				)
BEGIN
	INSERT INTO	sub_departments_satsang_centres
			(	sub_department_id, satsang_centre_id	)
		VALUES
			(	@sub_dept_id, @centre_id	);
END

PRINT 'Sub-department [Canteen 1 Jatha 03] for Department Canteen Created';

-- ====================================================================================================

SELECT	@sub_dept_id	=	sub_department_id
FROM	sub_departments
WHERE	sub_department_nm	=	'Canteen 1 Jatha 04'
AND		department_id		=	@dept_id;

IF (@@ROWCOUNT = 0)
BEGIN
	INSERT INTO	sub_departments
			(	department_id, sub_department_cd, sub_department_nm	)
		VALUES
			(	@dept_id, 'A04', 'Canteen 1 Jatha 04'	);
	
	SET @sub_dept_id = SCOPE_IDENTITY ();
END

IF NOT EXISTS	(	SELECT	1
					FROM	sub_departments_satsang_centres
					WHERE	sub_department_id	=	@sub_dept_id
					AND		satsang_centre_id	=	@centre_id
				)
BEGIN
	INSERT INTO	sub_departments_satsang_centres
			(	sub_department_id, satsang_centre_id	)
		VALUES
			(	@sub_dept_id, @centre_id	);
END

PRINT 'Sub-department [Canteen 1 Jatha 04] for Department Canteen Created';

-- ====================================================================================================

SELECT	@sub_dept_id	=	sub_department_id
FROM	sub_departments
WHERE	sub_department_nm	=	'Canteen 1 Jatha 11'
AND		department_id		=	@dept_id;

IF (@@ROWCOUNT = 0)
BEGIN
	INSERT INTO	sub_departments
			(	department_id, sub_department_cd, sub_department_nm	)
		VALUES
			(	@dept_id, 'A11', 'Canteen 1 Jatha 11'	);
	
	SET @sub_dept_id = SCOPE_IDENTITY ();
END

IF NOT EXISTS	(	SELECT	1
					FROM	sub_departments_satsang_centres
					WHERE	sub_department_id	=	@sub_dept_id
					AND		satsang_centre_id	=	@centre_id
				)
BEGIN
	INSERT INTO	sub_departments_satsang_centres
			(	sub_department_id, satsang_centre_id	)
		VALUES
			(	@sub_dept_id, @centre_id	);
END

PRINT 'Sub-department [Canteen 1 Jatha 11] for Department Canteen Created';

-- ====================================================================================================

SELECT	@sub_dept_id	=	sub_department_id
FROM	sub_departments
WHERE	sub_department_nm	=	'Canteen 1 Jatha 12'
AND		department_id		=	@dept_id;

IF (@@ROWCOUNT = 0)
BEGIN
	INSERT INTO	sub_departments
			(	department_id, sub_department_cd, sub_department_nm	)
		VALUES
			(	@dept_id, 'A12', 'Canteen 1 Jatha 12'	);
	
	SET @sub_dept_id = SCOPE_IDENTITY ();
END

IF NOT EXISTS	(	SELECT	1
					FROM	sub_departments_satsang_centres
					WHERE	sub_department_id	=	@sub_dept_id
					AND		satsang_centre_id	=	@centre_id
				)
BEGIN
	INSERT INTO	sub_departments_satsang_centres
			(	sub_department_id, satsang_centre_id	)
		VALUES
			(	@sub_dept_id, @centre_id	);
END

PRINT 'Sub-department [Canteen 1 Jatha 12] for Department Canteen Created';

-- ====================================================================================================

SELECT	@sub_dept_id	=	sub_department_id
FROM	sub_departments
WHERE	sub_department_nm	=	'Canteen 1 Jatha 13'
AND		department_id		=	@dept_id;

IF (@@ROWCOUNT = 0)
BEGIN
	INSERT INTO	sub_departments
			(	department_id, sub_department_cd, sub_department_nm	)
		VALUES
			(	@dept_id, 'A13', 'Canteen 1 Jatha 13'	);
	
	SET @sub_dept_id = SCOPE_IDENTITY ();
END

IF NOT EXISTS	(	SELECT	1
					FROM	sub_departments_satsang_centres
					WHERE	sub_department_id	=	@sub_dept_id
					AND		satsang_centre_id	=	@centre_id
				)
BEGIN
	INSERT INTO	sub_departments_satsang_centres
			(	sub_department_id, satsang_centre_id	)
		VALUES
			(	@sub_dept_id, @centre_id	);
END

PRINT 'Sub-department [Canteen 1 Jatha 13] for Department Canteen Created';

-- ====================================================================================================

SELECT	@sub_dept_id	=	sub_department_id
FROM	sub_departments
WHERE	sub_department_nm	=	'Canteen 1 Jatha 21'
AND		department_id		=	@dept_id;

IF (@@ROWCOUNT = 0)
BEGIN
	INSERT INTO	sub_departments
			(	department_id, sub_department_cd, sub_department_nm	)
		VALUES
			(	@dept_id, 'A21', 'Canteen 1 Jatha 21'	);
	
	SET @sub_dept_id = SCOPE_IDENTITY ();
END

IF NOT EXISTS	(	SELECT	1
					FROM	sub_departments_satsang_centres
					WHERE	sub_department_id	=	@sub_dept_id
					AND		satsang_centre_id	=	@centre_id
				)
BEGIN
	INSERT INTO	sub_departments_satsang_centres
			(	sub_department_id, satsang_centre_id	)
		VALUES
			(	@sub_dept_id, @centre_id	);
END

PRINT 'Sub-department [Canteen 1 Jatha 21] for Department Canteen Created';

-- ====================================================================================================

SELECT	@sub_dept_id	=	sub_department_id
FROM	sub_departments
WHERE	sub_department_nm	=	'Canteen 1 Jatha 22'
AND		department_id		=	@dept_id;

IF (@@ROWCOUNT = 0)
BEGIN
	INSERT INTO	sub_departments
			(	department_id, sub_department_cd, sub_department_nm	)
		VALUES
			(	@dept_id, 'A22', 'Canteen 1 Jatha 22'	);
	
	SET @sub_dept_id = SCOPE_IDENTITY ();
END

IF NOT EXISTS	(	SELECT	1
					FROM	sub_departments_satsang_centres
					WHERE	sub_department_id	=	@sub_dept_id
					AND		satsang_centre_id	=	@centre_id
				)
BEGIN
	INSERT INTO	sub_departments_satsang_centres
			(	sub_department_id, satsang_centre_id	)
		VALUES
			(	@sub_dept_id, @centre_id	);
END

PRINT 'Sub-department [Canteen 1 Jatha 22] for Department Canteen Created';

-- ====================================================================================================

SELECT	@sub_dept_id	=	sub_department_id
FROM	sub_departments
WHERE	sub_department_nm	=	'Canteen 1 Jatha 31'
AND		department_id		=	@dept_id;

IF (@@ROWCOUNT = 0)
BEGIN
	INSERT INTO	sub_departments
			(	department_id, sub_department_cd, sub_department_nm	)
		VALUES
			(	@dept_id, 'A31', 'Canteen 1 Jatha 31'	);
	
	SET @sub_dept_id = SCOPE_IDENTITY ();
END

IF NOT EXISTS	(	SELECT	1
					FROM	sub_departments_satsang_centres
					WHERE	sub_department_id	=	@sub_dept_id
					AND		satsang_centre_id	=	@centre_id
				)
BEGIN
	INSERT INTO	sub_departments_satsang_centres
			(	sub_department_id, satsang_centre_id	)
		VALUES
			(	@sub_dept_id, @centre_id	);
END

PRINT 'Sub-department [Canteen 1 Jatha 31] for Department Canteen Created';

-- ====================================================================================================

SELECT	@sub_dept_id	=	sub_department_id
FROM	sub_departments
WHERE	sub_department_nm	=	'Canteen 1 Jatha 32'
AND		department_id		=	@dept_id;

IF (@@ROWCOUNT = 0)
BEGIN
	INSERT INTO	sub_departments
			(	department_id, sub_department_cd, sub_department_nm	)
		VALUES
			(	@dept_id, 'A32', 'Canteen 1 Jatha 32'	);
	
	SET @sub_dept_id = SCOPE_IDENTITY ();
END

IF NOT EXISTS	(	SELECT	1
					FROM	sub_departments_satsang_centres
					WHERE	sub_department_id	=	@sub_dept_id
					AND		satsang_centre_id	=	@centre_id
				)
BEGIN
	INSERT INTO	sub_departments_satsang_centres
			(	sub_department_id, satsang_centre_id	)
		VALUES
			(	@sub_dept_id, @centre_id	);
END

PRINT 'Sub-department [Canteen 1 Jatha 32] for Department Canteen Created';

-- ====================================================================================================

SELECT	@sub_dept_id	=	sub_department_id
FROM	sub_departments
WHERE	sub_department_nm	=	'Canteen 1 Jatha 33'
AND		department_id		=	@dept_id;

IF (@@ROWCOUNT = 0)
BEGIN
	INSERT INTO	sub_departments
			(	department_id, sub_department_cd, sub_department_nm	)
		VALUES
			(	@dept_id, 'A33', 'Canteen 1 Jatha 33'	);
	
	SET @sub_dept_id = SCOPE_IDENTITY ();
END

IF NOT EXISTS	(	SELECT	1
					FROM	sub_departments_satsang_centres
					WHERE	sub_department_id	=	@sub_dept_id
					AND		satsang_centre_id	=	@centre_id
				)
BEGIN
	INSERT INTO	sub_departments_satsang_centres
			(	sub_department_id, satsang_centre_id	)
		VALUES
			(	@sub_dept_id, @centre_id	);
END

PRINT 'Sub-department [Canteen 1 Jatha 33] for Department Canteen Created';

-- ====================================================================================================

SELECT	@sub_dept_id	=	sub_department_id
FROM	sub_departments
WHERE	sub_department_nm	=	'Canteen 1 Jatha 41'
AND		department_id		=	@dept_id;

IF (@@ROWCOUNT = 0)
BEGIN
	INSERT INTO	sub_departments
			(	department_id, sub_department_cd, sub_department_nm	)
		VALUES
			(	@dept_id, 'A41', 'Canteen 1 Jatha 41'	);
	
	SET @sub_dept_id = SCOPE_IDENTITY ();
END

IF NOT EXISTS	(	SELECT	1
					FROM	sub_departments_satsang_centres
					WHERE	sub_department_id	=	@sub_dept_id
					AND		satsang_centre_id	=	@centre_id
				)
BEGIN
	INSERT INTO	sub_departments_satsang_centres
			(	sub_department_id, satsang_centre_id	)
		VALUES
			(	@sub_dept_id, @centre_id	);
END

PRINT 'Sub-department [Canteen 1 Jatha 41] for Department Canteen Created';

-- ====================================================================================================

SELECT	@sub_dept_id	=	sub_department_id
FROM	sub_departments
WHERE	sub_department_nm	=	'Canteen 1 Jatha 42'
AND		department_id		=	@dept_id;

IF (@@ROWCOUNT = 0)
BEGIN
	INSERT INTO	sub_departments
			(	department_id, sub_department_cd, sub_department_nm	)
		VALUES
			(	@dept_id, 'A42', 'Canteen 1 Jatha 42'	);
	
	SET @sub_dept_id = SCOPE_IDENTITY ();
END

IF NOT EXISTS	(	SELECT	1
					FROM	sub_departments_satsang_centres
					WHERE	sub_department_id	=	@sub_dept_id
					AND		satsang_centre_id	=	@centre_id
				)
BEGIN
	INSERT INTO	sub_departments_satsang_centres
			(	sub_department_id, satsang_centre_id	)
		VALUES
			(	@sub_dept_id, @centre_id	);
END

PRINT 'Sub-department [Canteen 1 Jatha 42] for Department Canteen Created';

-- ====================================================================================================

SELECT	@sub_dept_id	=	sub_department_id
FROM	sub_departments
WHERE	sub_department_nm	=	'Canteen 1 Jatha 43'
AND		department_id		=	@dept_id;

IF (@@ROWCOUNT = 0)
BEGIN
	INSERT INTO	sub_departments
			(	department_id, sub_department_cd, sub_department_nm	)
		VALUES
			(	@dept_id, 'A43', 'Canteen 1 Jatha 43'	);
	
	SET @sub_dept_id = SCOPE_IDENTITY ();
END

IF NOT EXISTS	(	SELECT	1
					FROM	sub_departments_satsang_centres
					WHERE	sub_department_id	=	@sub_dept_id
					AND		satsang_centre_id	=	@centre_id
				)
BEGIN
	INSERT INTO	sub_departments_satsang_centres
			(	sub_department_id, satsang_centre_id	)
		VALUES
			(	@sub_dept_id, @centre_id	);
END

PRINT 'Sub-department [Canteen 1 Jatha 43] for Department Canteen Created';

-- ====================================================================================================

SELECT	@sub_dept_id	=	sub_department_id
FROM	sub_departments
WHERE	sub_department_nm	=	'Canteen 2 Jatha 01'
AND		department_id		=	@dept_id;

IF (@@ROWCOUNT = 0)
BEGIN
	INSERT INTO	sub_departments
			(	department_id, sub_department_cd, sub_department_nm	)
		VALUES
			(	@dept_id, 'B01', 'Canteen 2 Jatha 01'	);
	
	SET @sub_dept_id = SCOPE_IDENTITY ();
END

IF NOT EXISTS	(	SELECT	1
					FROM	sub_departments_satsang_centres
					WHERE	sub_department_id	=	@sub_dept_id
					AND		satsang_centre_id	=	@centre_id
				)
BEGIN
	INSERT INTO	sub_departments_satsang_centres
			(	sub_department_id, satsang_centre_id	)
		VALUES
			(	@sub_dept_id, @centre_id	);
END

PRINT 'Sub-department [Canteen 2 Jatha 01] for Department Canteen Created';

-- ====================================================================================================

SELECT	@sub_dept_id	=	sub_department_id
FROM	sub_departments
WHERE	sub_department_nm	=	'Canteen 2 Jatha 02'
AND		department_id		=	@dept_id;

IF (@@ROWCOUNT = 0)
BEGIN
	INSERT INTO	sub_departments
			(	department_id, sub_department_cd, sub_department_nm	)
		VALUES
			(	@dept_id, 'B02', 'Canteen 2 Jatha 02'	);
	
	SET @sub_dept_id = SCOPE_IDENTITY ();
END

IF NOT EXISTS	(	SELECT	1
					FROM	sub_departments_satsang_centres
					WHERE	sub_department_id	=	@sub_dept_id
					AND		satsang_centre_id	=	@centre_id
				)
BEGIN
	INSERT INTO	sub_departments_satsang_centres
			(	sub_department_id, satsang_centre_id	)
		VALUES
			(	@sub_dept_id, @centre_id	);
END

PRINT 'Sub-department [Canteen 2 Jatha 02] for Department Canteen Created';

-- ====================================================================================================

SELECT	@sub_dept_id	=	sub_department_id
FROM	sub_departments
WHERE	sub_department_nm	=	'Canteen 2 Jatha 03'
AND		department_id		=	@dept_id;

IF (@@ROWCOUNT = 0)
BEGIN
	INSERT INTO	sub_departments
			(	department_id, sub_department_cd, sub_department_nm	)
		VALUES
			(	@dept_id, 'B03', 'Canteen 2 Jatha 03'	);
	
	SET @sub_dept_id = SCOPE_IDENTITY ();
END

IF NOT EXISTS	(	SELECT	1
					FROM	sub_departments_satsang_centres
					WHERE	sub_department_id	=	@sub_dept_id
					AND		satsang_centre_id	=	@centre_id
				)
BEGIN
	INSERT INTO	sub_departments_satsang_centres
			(	sub_department_id, satsang_centre_id	)
		VALUES
			(	@sub_dept_id, @centre_id	);
END

PRINT 'Sub-department [Canteen 2 Jatha 03] for Department Canteen Created';

-- ====================================================================================================

SELECT	@sub_dept_id	=	sub_department_id
FROM	sub_departments
WHERE	sub_department_nm	=	'Canteen 2 Jatha 11'
AND		department_id		=	@dept_id;

IF (@@ROWCOUNT = 0)
BEGIN
	INSERT INTO	sub_departments
			(	department_id, sub_department_cd, sub_department_nm	)
		VALUES
			(	@dept_id, 'B11', 'Canteen 2 Jatha 11'	);
	
	SET @sub_dept_id = SCOPE_IDENTITY ();
END

IF NOT EXISTS	(	SELECT	1
					FROM	sub_departments_satsang_centres
					WHERE	sub_department_id	=	@sub_dept_id
					AND		satsang_centre_id	=	@centre_id
				)
BEGIN
	INSERT INTO	sub_departments_satsang_centres
			(	sub_department_id, satsang_centre_id	)
		VALUES
			(	@sub_dept_id, @centre_id	);
END

PRINT 'Sub-department [Canteen 2 Jatha 11] for Department Canteen Created';

-- ====================================================================================================

SELECT	@sub_dept_id	=	sub_department_id
FROM	sub_departments
WHERE	sub_department_nm	=	'Canteen 2 Jatha 12'
AND		department_id		=	@dept_id;

IF (@@ROWCOUNT = 0)
BEGIN
	INSERT INTO	sub_departments
			(	department_id, sub_department_cd, sub_department_nm	)
		VALUES
			(	@dept_id, 'B12', 'Canteen 2 Jatha 12'	);
	
	SET @sub_dept_id = SCOPE_IDENTITY ();
END

IF NOT EXISTS	(	SELECT	1
					FROM	sub_departments_satsang_centres
					WHERE	sub_department_id	=	@sub_dept_id
					AND		satsang_centre_id	=	@centre_id
				)
BEGIN
	INSERT INTO	sub_departments_satsang_centres
			(	sub_department_id, satsang_centre_id	)
		VALUES
			(	@sub_dept_id, @centre_id	);
END

PRINT 'Sub-department [Canteen 2 Jatha 12] for Department Canteen Created';

-- ====================================================================================================

SELECT	@sub_dept_id	=	sub_department_id
FROM	sub_departments
WHERE	sub_department_nm	=	'Canteen 2 Jatha 13'
AND		department_id		=	@dept_id;

IF (@@ROWCOUNT = 0)
BEGIN
	INSERT INTO	sub_departments
			(	department_id, sub_department_cd, sub_department_nm	)
		VALUES
			(	@dept_id, 'B13', 'Canteen 2 Jatha 13'	);
	
	SET @sub_dept_id = SCOPE_IDENTITY ();
END

IF NOT EXISTS	(	SELECT	1
					FROM	sub_departments_satsang_centres
					WHERE	sub_department_id	=	@sub_dept_id
					AND		satsang_centre_id	=	@centre_id
				)
BEGIN
	INSERT INTO	sub_departments_satsang_centres
			(	sub_department_id, satsang_centre_id	)
		VALUES
			(	@sub_dept_id, @centre_id	);
END

PRINT 'Sub-department [Canteen 2 Jatha 13] for Department Canteen Created';

-- ====================================================================================================

SELECT	@sub_dept_id	=	sub_department_id
FROM	sub_departments
WHERE	sub_department_nm	=	'Canteen 2 Jatha 21'
AND		department_id		=	@dept_id;

IF (@@ROWCOUNT = 0)
BEGIN
	INSERT INTO	sub_departments
			(	department_id, sub_department_cd, sub_department_nm	)
		VALUES
			(	@dept_id, 'B21', 'Canteen 2 Jatha 21'	);
	
	SET @sub_dept_id = SCOPE_IDENTITY ();
END

IF NOT EXISTS	(	SELECT	1
					FROM	sub_departments_satsang_centres
					WHERE	sub_department_id	=	@sub_dept_id
					AND		satsang_centre_id	=	@centre_id
				)
BEGIN
	INSERT INTO	sub_departments_satsang_centres
			(	sub_department_id, satsang_centre_id	)
		VALUES
			(	@sub_dept_id, @centre_id	);
END

PRINT 'Sub-department [Canteen 2 Jatha 21] for Department Canteen Created';

-- ====================================================================================================

SELECT	@sub_dept_id	=	sub_department_id
FROM	sub_departments
WHERE	sub_department_nm	=	'Canteen 2 Jatha 22'
AND		department_id		=	@dept_id;

IF (@@ROWCOUNT = 0)
BEGIN
	INSERT INTO	sub_departments
			(	department_id, sub_department_cd, sub_department_nm	)
		VALUES
			(	@dept_id, 'B22', 'Canteen 2 Jatha 22'	);
	
	SET @sub_dept_id = SCOPE_IDENTITY ();
END

IF NOT EXISTS	(	SELECT	1
					FROM	sub_departments_satsang_centres
					WHERE	sub_department_id	=	@sub_dept_id
					AND		satsang_centre_id	=	@centre_id
				)
BEGIN
	INSERT INTO	sub_departments_satsang_centres
			(	sub_department_id, satsang_centre_id	)
		VALUES
			(	@sub_dept_id, @centre_id	);
END

PRINT 'Sub-department [Canteen 2 Jatha 22] for Department Canteen Created';

-- ====================================================================================================

SELECT	@sub_dept_id	=	sub_department_id
FROM	sub_departments
WHERE	sub_department_nm	=	'Canteen 2 Jatha 31'
AND		department_id		=	@dept_id;

IF (@@ROWCOUNT = 0)
BEGIN
	INSERT INTO	sub_departments
			(	department_id, sub_department_cd, sub_department_nm	)
		VALUES
			(	@dept_id, 'B31', 'Canteen 2 Jatha 31'	);
	
	SET @sub_dept_id = SCOPE_IDENTITY ();
END

IF NOT EXISTS	(	SELECT	1
					FROM	sub_departments_satsang_centres
					WHERE	sub_department_id	=	@sub_dept_id
					AND		satsang_centre_id	=	@centre_id
				)
BEGIN
	INSERT INTO	sub_departments_satsang_centres
			(	sub_department_id, satsang_centre_id	)
		VALUES
			(	@sub_dept_id, @centre_id	);
END

PRINT 'Sub-department [Canteen 2 Jatha 31] for Department Canteen Created';

-- ====================================================================================================

SELECT	@sub_dept_id	=	sub_department_id
FROM	sub_departments
WHERE	sub_department_nm	=	'Canteen 2 Jatha 32'
AND		department_id		=	@dept_id;

IF (@@ROWCOUNT = 0)
BEGIN
	INSERT INTO	sub_departments
			(	department_id, sub_department_cd, sub_department_nm	)
		VALUES
			(	@dept_id, 'B32', 'Canteen 2 Jatha 32'	);
	
	SET @sub_dept_id = SCOPE_IDENTITY ();
END

IF NOT EXISTS	(	SELECT	1
					FROM	sub_departments_satsang_centres
					WHERE	sub_department_id	=	@sub_dept_id
					AND		satsang_centre_id	=	@centre_id
				)
BEGIN
	INSERT INTO	sub_departments_satsang_centres
			(	sub_department_id, satsang_centre_id	)
		VALUES
			(	@sub_dept_id, @centre_id	);
END

PRINT 'Sub-department [Canteen 2 Jatha 32] for Department Canteen Created';

-- ====================================================================================================

SELECT	@sub_dept_id	=	sub_department_id
FROM	sub_departments
WHERE	sub_department_nm	=	'Canteen 2 Jatha 41'
AND		department_id		=	@dept_id;

IF (@@ROWCOUNT = 0)
BEGIN
	INSERT INTO	sub_departments
			(	department_id, sub_department_cd, sub_department_nm	)
		VALUES
			(	@dept_id, 'B41', 'Canteen 2 Jatha 41'	);
	
	SET @sub_dept_id = SCOPE_IDENTITY ();
END

IF NOT EXISTS	(	SELECT	1
					FROM	sub_departments_satsang_centres
					WHERE	sub_department_id	=	@sub_dept_id
					AND		satsang_centre_id	=	@centre_id
				)
BEGIN
	INSERT INTO	sub_departments_satsang_centres
			(	sub_department_id, satsang_centre_id	)
		VALUES
			(	@sub_dept_id, @centre_id	);
END

PRINT 'Sub-department [Canteen 2 Jatha 41] for Department Canteen Created';

-- ====================================================================================================

SELECT	@sub_dept_id	=	sub_department_id
FROM	sub_departments
WHERE	sub_department_nm	=	'Canteen 2 Jatha 42'
AND		department_id		=	@dept_id;

IF (@@ROWCOUNT = 0)
BEGIN
	INSERT INTO	sub_departments
			(	department_id, sub_department_cd, sub_department_nm	)
		VALUES
			(	@dept_id, 'B42', 'Canteen 2 Jatha 42'	);
	
	SET @sub_dept_id = SCOPE_IDENTITY ();
END

IF NOT EXISTS	(	SELECT	1
					FROM	sub_departments_satsang_centres
					WHERE	sub_department_id	=	@sub_dept_id
					AND		satsang_centre_id	=	@centre_id
				)
BEGIN
	INSERT INTO	sub_departments_satsang_centres
			(	sub_department_id, satsang_centre_id	)
		VALUES
			(	@sub_dept_id, @centre_id	);
END

PRINT 'Sub-department [Canteen 2 Jatha 42] for Department Canteen Created';

-- ====================================================================================================

SELECT	@sub_dept_id	=	sub_department_id
FROM	sub_departments
WHERE	sub_department_nm	=	'Canteen 2 Jatha 43'
AND		department_id		=	@dept_id;

IF (@@ROWCOUNT = 0)
BEGIN
	INSERT INTO	sub_departments
			(	department_id, sub_department_cd, sub_department_nm	)
		VALUES
			(	@dept_id, 'B43', 'Canteen 2 Jatha 43'	);
	
	SET @sub_dept_id = SCOPE_IDENTITY ();
END

IF NOT EXISTS	(	SELECT	1
					FROM	sub_departments_satsang_centres
					WHERE	sub_department_id	=	@sub_dept_id
					AND		satsang_centre_id	=	@centre_id
				)
BEGIN
	INSERT INTO	sub_departments_satsang_centres
			(	sub_department_id, satsang_centre_id	)
		VALUES
			(	@sub_dept_id, @centre_id	);
END

PRINT 'Sub-department [Canteen 2 Jatha 43] for Department Canteen Created';

-- ====================================================================================================

SELECT	@sub_dept_id	=	sub_department_id
FROM	sub_departments
WHERE	sub_department_nm	=	'Canteen 3 Jatha 01'
AND		department_id		=	@dept_id;

IF (@@ROWCOUNT = 0)
BEGIN
	INSERT INTO	sub_departments
			(	department_id, sub_department_cd, sub_department_nm	)
		VALUES
			(	@dept_id, 'C01', 'Canteen 3 Jatha 01'	);
	
	SET @sub_dept_id = SCOPE_IDENTITY ();
END

IF NOT EXISTS	(	SELECT	1
					FROM	sub_departments_satsang_centres
					WHERE	sub_department_id	=	@sub_dept_id
					AND		satsang_centre_id	=	@centre_id
				)
BEGIN
	INSERT INTO	sub_departments_satsang_centres
			(	sub_department_id, satsang_centre_id	)
		VALUES
			(	@sub_dept_id, @centre_id	);
END

PRINT 'Sub-department [Canteen 3 Jatha 01] for Department Canteen Created';

-- ====================================================================================================

SELECT	@sub_dept_id	=	sub_department_id
FROM	sub_departments
WHERE	sub_department_nm	=	'Canteen 3 Jatha 11'
AND		department_id		=	@dept_id;

IF (@@ROWCOUNT = 0)
BEGIN
	INSERT INTO	sub_departments
			(	department_id, sub_department_cd, sub_department_nm	)
		VALUES
			(	@dept_id, 'C11', 'Canteen 3 Jatha 11'	);
	
	SET @sub_dept_id = SCOPE_IDENTITY ();
END

IF NOT EXISTS	(	SELECT	1
					FROM	sub_departments_satsang_centres
					WHERE	sub_department_id	=	@sub_dept_id
					AND		satsang_centre_id	=	@centre_id
				)
BEGIN
	INSERT INTO	sub_departments_satsang_centres
			(	sub_department_id, satsang_centre_id	)
		VALUES
			(	@sub_dept_id, @centre_id	);
END

PRINT 'Sub-department [Canteen 3 Jatha 11] for Department Canteen Created';

-- ====================================================================================================

SELECT	@sub_dept_id	=	sub_department_id
FROM	sub_departments
WHERE	sub_department_nm	=	'Canteen 3 Jatha 12'
AND		department_id		=	@dept_id;

IF (@@ROWCOUNT = 0)
BEGIN
	INSERT INTO	sub_departments
			(	department_id, sub_department_cd, sub_department_nm	)
		VALUES
			(	@dept_id, 'C12', 'Canteen 3 Jatha 12'	);
	
	SET @sub_dept_id = SCOPE_IDENTITY ();
END

IF NOT EXISTS	(	SELECT	1
					FROM	sub_departments_satsang_centres
					WHERE	sub_department_id	=	@sub_dept_id
					AND		satsang_centre_id	=	@centre_id
				)
BEGIN
	INSERT INTO	sub_departments_satsang_centres
			(	sub_department_id, satsang_centre_id	)
		VALUES
			(	@sub_dept_id, @centre_id	);
END

PRINT 'Sub-department [Canteen 3 Jatha 12] for Department Canteen Created';

-- ====================================================================================================

SELECT	@sub_dept_id	=	sub_department_id
FROM	sub_departments
WHERE	sub_department_nm	=	'Canteen 3 Jatha 21'
AND		department_id		=	@dept_id;

IF (@@ROWCOUNT = 0)
BEGIN
	INSERT INTO	sub_departments
			(	department_id, sub_department_cd, sub_department_nm	)
		VALUES
			(	@dept_id, 'C21', 'Canteen 3 Jatha 21'	);
	
	SET @sub_dept_id = SCOPE_IDENTITY ();
END

IF NOT EXISTS	(	SELECT	1
					FROM	sub_departments_satsang_centres
					WHERE	sub_department_id	=	@sub_dept_id
					AND		satsang_centre_id	=	@centre_id
				)
BEGIN
	INSERT INTO	sub_departments_satsang_centres
			(	sub_department_id, satsang_centre_id	)
		VALUES
			(	@sub_dept_id, @centre_id	);
END

PRINT 'Sub-department [Canteen 3 Jatha 21] for Department Canteen Created';

-- ====================================================================================================

SELECT	@sub_dept_id	=	sub_department_id
FROM	sub_departments
WHERE	sub_department_nm	=	'Canteen 3 Jatha 31'
AND		department_id		=	@dept_id;

IF (@@ROWCOUNT = 0)
BEGIN
	INSERT INTO	sub_departments
			(	department_id, sub_department_cd, sub_department_nm	)
		VALUES
			(	@dept_id, 'C31', 'Canteen 3 Jatha 31'	);
	
	SET @sub_dept_id = SCOPE_IDENTITY ();
END

IF NOT EXISTS	(	SELECT	1
					FROM	sub_departments_satsang_centres
					WHERE	sub_department_id	=	@sub_dept_id
					AND		satsang_centre_id	=	@centre_id
				)
BEGIN
	INSERT INTO	sub_departments_satsang_centres
			(	sub_department_id, satsang_centre_id	)
		VALUES
			(	@sub_dept_id, @centre_id	);
END

PRINT 'Sub-department [Canteen 3 Jatha 31] for Department Canteen Created';

-- ====================================================================================================

SELECT	@sub_dept_id	=	sub_department_id
FROM	sub_departments
WHERE	sub_department_nm	=	'Canteen 3 Jatha 41'
AND		department_id		=	@dept_id;

IF (@@ROWCOUNT = 0)
BEGIN
	INSERT INTO	sub_departments
			(	department_id, sub_department_cd, sub_department_nm	)
		VALUES
			(	@dept_id, 'C41', 'Canteen 3 Jatha 41'	);
	
	SET @sub_dept_id = SCOPE_IDENTITY ();
END

IF NOT EXISTS	(	SELECT	1
					FROM	sub_departments_satsang_centres
					WHERE	sub_department_id	=	@sub_dept_id
					AND		satsang_centre_id	=	@centre_id
				)
BEGIN
	INSERT INTO	sub_departments_satsang_centres
			(	sub_department_id, satsang_centre_id	)
		VALUES
			(	@sub_dept_id, @centre_id	);
END

PRINT 'Sub-department [Canteen 3 Jatha 41] for Department Canteen Created';

-- ====================================================================================================

SELECT	@sub_dept_id	=	sub_department_id
FROM	sub_departments
WHERE	sub_department_nm	=	'Canteen 3 Jatha 42'
AND		department_id		=	@dept_id;

IF (@@ROWCOUNT = 0)
BEGIN
	INSERT INTO	sub_departments
			(	department_id, sub_department_cd, sub_department_nm	)
		VALUES
			(	@dept_id, 'C42', 'Canteen 3 Jatha 42'	);
	
	SET @sub_dept_id = SCOPE_IDENTITY ();
END

IF NOT EXISTS	(	SELECT	1
					FROM	sub_departments_satsang_centres
					WHERE	sub_department_id	=	@sub_dept_id
					AND		satsang_centre_id	=	@centre_id
				)
BEGIN
	INSERT INTO	sub_departments_satsang_centres
			(	sub_department_id, satsang_centre_id	)
		VALUES
			(	@sub_dept_id, @centre_id	);
END

PRINT 'Sub-department [Canteen 3 Jatha 42] for Department Canteen Created';

-- ====================================================================================================
-- Sub-departments for Langar
-- ====================================================================================================

SELECT	@dept_id	=	department_id,
		@has_sd		=	has_sub_departments
FROM	departments
WHERE	department_nm	=	'Langar';

IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Department Langar not found', 16, -1);
	RETURN;
END

IF (@has_sd = 'No')
BEGIN
	UPDATE	departments
		SET	has_sub_departments	=	'Yes'
	WHERE	department_id		=	@dept_id;
	IF (@@ROWCOUNT != 1)
	BEGIN
		RAISERROR ('Department Langar could not be updated to have sub-departments', 16, -1);
		RETURN;
	END
END

-- ====================================================================================================

SELECT	@sub_dept_id	=	sub_department_id
FROM	sub_departments
WHERE	sub_department_nm	=	'Jatha 71'
AND		department_id		=	@dept_id;

IF (@@ROWCOUNT = 0)
BEGIN
	INSERT INTO	sub_departments
			(	department_id, sub_department_cd, sub_department_nm	)
		VALUES
			(	@dept_id, 'J71', 'Jatha 71'	);
	
	SET @sub_dept_id = SCOPE_IDENTITY ();
END

IF NOT EXISTS	(	SELECT	1
					FROM	sub_departments_satsang_centres
					WHERE	sub_department_id	=	@sub_dept_id
					AND		satsang_centre_id	=	@centre_id
				)
BEGIN
	INSERT INTO	sub_departments_satsang_centres
			(	sub_department_id, satsang_centre_id	)
		VALUES
			(	@sub_dept_id, @centre_id	);
END

PRINT 'Sub-department [Jatha 71] for Department Langar Created';

-- ====================================================================================================

SELECT	@sub_dept_id	=	sub_department_id
FROM	sub_departments
WHERE	sub_department_nm	=	'Jatha 72'
AND		department_id		=	@dept_id;

IF (@@ROWCOUNT = 0)
BEGIN
	INSERT INTO	sub_departments
			(	department_id, sub_department_cd, sub_department_nm	)
		VALUES
			(	@dept_id, 'J72', 'Jatha 72'	);
	
	SET @sub_dept_id = SCOPE_IDENTITY ();
END

IF NOT EXISTS	(	SELECT	1
					FROM	sub_departments_satsang_centres
					WHERE	sub_department_id	=	@sub_dept_id
					AND		satsang_centre_id	=	@centre_id
				)
BEGIN
	INSERT INTO	sub_departments_satsang_centres
			(	sub_department_id, satsang_centre_id	)
		VALUES
			(	@sub_dept_id, @centre_id	);
END

PRINT 'Sub-department [Jatha 72] for Department Langar Created';

-- ====================================================================================================
-- Sub-departments for Luggage, Sanitation, Pandal, Security, Traffic
-- ====================================================================================================
