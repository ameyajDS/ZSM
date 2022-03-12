
-- ====================================================================================================
--	This script transfers all the Sewadars of a Department/Sub-Department to another at a Centre.
--	If required,
--		(a) it enables (makes effective) the Destination (To) Department/Sub-Department, if it is not already.
--		(b) it disables (makes ineffective) the Source (From) Department/Sub-Department, if it is not already.
-- ====================================================================================================


DECLARE 
	@centre_nm VARCHAR (30), @centre_id INT, @from_dept_id INT, @to_dept_id INT, @from_sub_dept_id INT, @to_sub_dept_id INT,
	@from_dept_nm VARCHAR (30), @to_dept_nm VARCHAR (30), @from_sub_dept_nm VARCHAR (30), @to_sub_dept_nm VARCHAR (30),
	@enable_destination	CHAR (1), @disable_source	CHAR (1), @transfer_dt DATETIME, @from_dt DATETIME, @to_dt DATETIME,
	@reference_centre_nm VARCHAR (30), @reference_centre_id INT, @remarks VARCHAR (100), @do_transfer CHAR (1)

-- ====================================================================================================
--	Specify the From and To Departments/Sub-Departments and the Centre at which the transfers are to be done
-- ====================================================================================================
SET @centre_nm = 'Biaora'				---	Centre at which transfers are to be done

SET @reference_centre_nm = 'Mumbai'		---	Reference centre for picking Department Configuration for a Centre like Gender allowed, Common Roster, etc.

SET @from_dept_nm = 'Canteen'			---	Department from which Transfer is to be done
SET @from_sub_dept_nm = 'Canteen 1 Jatha 01'	---	Optional Sub-Department from which Transfer is to be done; specify NULL, if not needed

SET @to_dept_nm = 'Canteen'				---	Department to which Transfer is to be done                                          
SET @to_sub_dept_nm = 'Jatha G01'				---	Optional Sub-Department to which Transfer is to be done; specify NULL, if not needed

SET @enable_destination = 'N'			--- Y[es] or N[o] whether the Destination Department (or Sub-Department, if specified) is to be enabled at the Satsang Centre
SET @disable_source = 'N'				--- Y[es] or N[o] whether the Source Department (or Sub-Department, if specified) is to be disabled at the Satsang Centre

SET	@transfer_dt = CONVERT (VARCHAR (11), GetDate(), 106)	-- Specify the Date of Transfer like '23-Dec-2013', if not current date
SET @remarks	=	'Bulk transfer of ' + @from_dept_nm + ' from ' + @from_sub_dept_nm + ' to ' + @to_sub_dept_nm 

SET @do_transfer	= 'N'				--- Set this to Y when a test run is done and the number of Sewadars reported match


-- ====================================================================================================
-- Check whether the Centre, Department and Sub-departments are valid, and get their IDs
-- ====================================================================================================

SELECT	@centre_id	=	satsang_centre_id
FROM	satsang_centres_details
WHERE	centre_nm	=	@centre_nm
AND		is_main_centre	=	'Yes'
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Centre [%s] not found', 16, 1, @centre_nm);
	RETURN
END

SELECT	@reference_centre_id	=	satsang_centre_id
FROM	satsang_centres_details
WHERE	centre_nm	=	@reference_centre_nm
AND		is_main_centre	=	'Yes'
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Reference Centre [%s] not found', 16, 1, @reference_centre_nm);
	RETURN
END

SELECT	@from_dept_id	=	department_id
FROM	departments
WHERE	department_nm	LIKE	@from_dept_nm
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('From Department [%s] not found or there are more than one records', 16, 1, @from_dept_nm);
	RETURN
END

IF (@from_sub_dept_nm IS NOT NULL)
BEGIN
	SELECT	@from_sub_dept_id	=	sub_department_id
	FROM	sub_departments
	WHERE	sub_department_nm	LIKE	@from_sub_dept_nm
	AND		department_id	=	@from_dept_id;
	IF (@@ROWCOUNT != 1)
	BEGIN
		RAISERROR ('From Sub Department [%s] not found or there are more than one records', 16, 1, @from_sub_dept_nm);
		RETURN
	END
END

SELECT	@to_dept_id	=	department_id
FROM	departments
WHERE	department_nm	LIKE	@to_dept_nm
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('To Department [%s] not found or there are more than one records', 16, 1, @to_dept_nm);
	RETURN
END

IF (@to_sub_dept_nm IS NOT NULL)
BEGIN
	SELECT	@to_sub_dept_id	=	sub_department_id
	FROM	sub_departments
	WHERE	sub_department_nm	LIKE	@to_sub_dept_nm
	AND		department_id	=	@to_dept_id;
	IF (@@ROWCOUNT != 1)
	BEGIN
		RAISERROR ('To Sub Department [%s] not found or there are more than one records', 16, 1, @to_sub_dept_nm);
		RETURN
	END
END

-- ====================================================================================================
-- Check whether the Destination Department / Sub-department is effective at a Centre; if not, enable it
-- ====================================================================================================

IF (@enable_destination = 'Y')
BEGIN
	IF (@to_sub_dept_id IS NULL)
	BEGIN
		SELECT	@from_dt	=	effective_from,	@to_dt	=	effective_till
		FROM	departments_satsang_centres
		WHERE	department_id	=	@to_dept_id
		AND		satsang_centre_id	=	@centre_id
		IF (@@ROWCOUNT = 1)
		BEGIN
			IF (GetDate() NOT BETWEEN @from_dt AND @to_dt	AND @do_transfer = 'Y')
			BEGIN
				UPDATE	departments_satsang_centres
					SET	effective_from	=	CONVERT (VARCHAR (11), GetDate(), 106),
						effective_till	=	'31-Dec-1999'
				WHERE	department_id	=	@to_dept_id
				AND		satsang_centre_id	=	@centre_id;
			END
		END
		ELSE IF (@do_transfer = 'Y'	AND @do_transfer = 'Y')
			INSERT INTO departments_satsang_centres
					(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly,
						sub_department_mandatory, effective_from, effective_till
					)
				SELECT	@to_dept_id, @centre_id, genders_allowed, is_common_roster, is_generic, is_weekly,
						sub_department_mandatory, @transfer_dt, '31-Dec-9999'
				FROM	departments_satsang_centres
				WHERE	department_id	=	@to_dept_id
				AND		satsang_centre_id	=	@reference_centre_id;
	END
	ELSE
	BEGIN
		SELECT	@from_dt	=	effective_from,	@to_dt	=	effective_till
		FROM	sub_departments_satsang_centres
		WHERE	sub_department_id	=	@to_sub_dept_id
		AND		satsang_centre_id	=	@centre_id
		IF (@@ROWCOUNT = 1)
		BEGIN
			IF (GetDate() NOT BETWEEN @from_dt AND @to_dt	AND @do_transfer = 'Y')
			BEGIN
				UPDATE	sub_departments_satsang_centres
					SET	effective_from	=	CONVERT (VARCHAR (11), GetDate(), 106),
						effective_till	=	'31-Dec-1999'
				WHERE	sub_department_id	=	@to_sub_dept_id
				AND		satsang_centre_id	=	@centre_id;
			END
		END
		ELSE IF (@do_transfer = 'Y')
			INSERT INTO sub_departments_satsang_centres
					(	sub_department_id, satsang_centre_id, effective_from, effective_till	)
				VALUES
					(	@to_sub_dept_id, @centre_id, @transfer_dt, '31-Dec-9999'	)
	END
END

-- ====================================================================================================
-- Check whether the Source Department / Sub-department is ineffective at a Centre; if not, disable it
-- ====================================================================================================

IF (@disable_source = 'Y')
BEGIN
	IF (@from_sub_dept_id IS NULL)
	BEGIN
		SELECT	@from_dt	=	effective_from,	@to_dt	=	effective_till
		FROM	departments_satsang_centres
		WHERE	department_id	=	@from_dept_id
		AND		satsang_centre_id	=	@centre_id
		IF (@@ROWCOUNT = 1)
		BEGIN
			IF (GetDate() BETWEEN @from_dt AND @to_dt	AND @do_transfer = 'Y')
			BEGIN
				UPDATE	departments_satsang_centres
					SET	effective_till	=	@transfer_dt
				WHERE	department_id	=	@from_dept_id
				AND		satsang_centre_id	=	@centre_id;
			END
		END
		ELSE
		BEGIN
			RAISERROR ('From Department [%s] not found at the Centre[%s]', 16, 1, @from_dept_nm, @centre_nm);
			RETURN
		END
	END
	ELSE
	BEGIN
		SELECT	@from_dt	=	effective_from,	@to_dt	=	effective_till
		FROM	sub_departments_satsang_centres
		WHERE	sub_department_id	=	@from_sub_dept_id
		AND		satsang_centre_id	=	@centre_id
		IF (@@ROWCOUNT = 1)
		BEGIN
			IF (GetDate() NOT BETWEEN @from_dt AND @to_dt	AND @do_transfer = 'Y')
			BEGIN
				UPDATE	sub_departments_satsang_centres
					SET	effective_till	=	'31-Dec-1999'
				WHERE	sub_department_id	=	@from_sub_dept_id
				AND		satsang_centre_id	=	@centre_id;
			END
		END
		ELSE
		BEGIN
			RAISERROR ('From Sub Department [%s] not found at the Centre[%s]', 16, 1, @from_sub_dept_nm, @centre_nm);
			RETURN
		END
	END
END

-- ====================================================================================================
-- Do the transfers now
-- ====================================================================================================
IF (@do_transfer = 'Y')
	INSERT INTO sewadars_transfers
			(	satsang_centre_id, sewadar_grno, effective_dt, old_department_id, old_sub_department_id, department_id, sub_department_id, remarks) 
		SELECT	r.satsang_centre_id, r.sewadar_grno, @transfer_dt, r.department_id, r.sub_department_id, @to_dept_id, @to_sub_dept_id, @remarks
		FROM	sewadars_registrations	r
			JOIN	sewadars	s
				ON	(	s.sewadar_id	=	r.sewadar_id	)
		WHERE	r.satsang_centre_id	=	@centre_id
		AND		r.department_id	=	@from_dept_id
		AND		(	(	@from_sub_dept_id	IS NULL		AND	r.sub_department_id	IS NULL	)
				OR	(	@from_sub_dept_id	IS NOT NULL	AND	r.sub_department_id	=	@from_sub_dept_id	)
				)
		AND		r.sewadar_status_cd	IN	(	'Perm', 'Temp', 'NI', 'Retd'	)
		AND		s.global_sewadar_status_cd	IS NULL
ELSE
	SELECT	s.*, r.*, r.satsang_centre_id, r.sewadar_grno, @transfer_dt, r.department_id, r.sub_department_id, @to_dept_id, @to_sub_dept_id, @remarks
	FROM	sewadars_registrations	r
		JOIN	sewadars	s
			ON	(	s.sewadar_id	=	r.sewadar_id	)
	WHERE	r.satsang_centre_id	=	@centre_id
	AND		r.department_id	=	@from_dept_id
	AND		(	(	@from_sub_dept_id	IS NULL		AND	r.sub_department_id	IS NULL	)
			OR	(	@from_sub_dept_id	IS NOT NULL	AND	r.sub_department_id	=	@from_sub_dept_id	)
			)
	AND		r.sewadar_status_cd	IN	(	'Perm', 'Temp', 'NI', 'Retd'	)
	AND		s.global_sewadar_status_cd	IS NULL

