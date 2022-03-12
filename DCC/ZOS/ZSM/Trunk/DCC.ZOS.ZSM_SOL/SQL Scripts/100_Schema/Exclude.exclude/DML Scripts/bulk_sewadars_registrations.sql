--begin tran
--rollback
set nocount on
--commit


---- Script for Bulk Sewadars Registrations for the Sewadars provided in a Sewadar List ... Pandal

DECLARE
	@sewadar_list_nm			VARCHAR (60),
	@old_status_dtm				DATETIME,
	@dst_satsang_centre_nm		gnc_nm

		---- Inputs to the script are specified below
SET	@sewadar_list_nm			=	'Indore Sewadars Registered on 07 Dec 2014 at 17:40:37'
SET	@dst_satsang_centre_nm		=	'Raipur'
SET @old_status_dtm				=	CONVERT (VARCHAR (11), GetDate(), 106) + ' 18:20'

DECLARE
	@src_satsang_centre_id		satsang_centre_id,
	@dst_satsang_centre_id		satsang_centre_id,
	@sewadar_list_id			sewadar_list_id,
	@gender						VARCHAR (6),
	@first_nm					VARCHAR (40),
	@last_nm					VARCHAR (40),
	@middle_nm					VARCHAR (40),
	@src_sewadar_grno           sewadar_grno,
	@dst_sewadar_grno           sewadar_grno,
	@app_dt						DATETIME,
	@sewadar_id					INT,
	@pandal_dept_id				INT,
	@acc_sub_dept_id			INT,
	@acc_dept_id				INT,
	@status_cd					VARCHAR (5)

	--- Departments whose Sub-departments should be retained
DECLARE	@rtn_sub_depts	TABLE	(dept_id	INT	NOT NULL PRIMARY KEY)

INSERT INTO	@rtn_sub_depts
	SELECT	department_id
	FROM	departments
	WHERE	department_nm IN	(	'Sewa Samiti', 'Administration', 'Construction'	);
IF (@@ROWCOUNT != 3)
BEGIN
	RAISERROR ('3 Departments whose Sub-departments are to be retained could not be found', 16, 1);
	RETURN;
END


SELECT	@sewadar_list_id = sewadar_list_id
FROM	generic_sewadar_lists
WHERE	sewadar_list_nm	=	@sewadar_list_nm;
IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Sewadar List not found', 16, 1);
	RETURN;
END

--SELECT	@sewadar_list_id = 1526
PRINT	@sewadar_list_id 

SELECT	@dst_satsang_centre_id	=	c.satsang_centre_id
FROM	CDB..satsang_centres	c
	JOIN	satsang_centres_details	d
		ON	(	c.satsang_centre_id	=	d.satsang_centre_id	)
WHERE	d.is_main_centre	=	'Yes'
AND		d.centre_nm			=	@dst_satsang_centre_nm;
IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Destination Satsang Centre not found', 16, 1);
	RETURN;
END

/*
SELECT	@pandal_dept_id		=	d.department_id,
		@acc_sub_dept_id	=	sub_department_id
FROM	departments	d
	JOIN	sub_departments	s
		ON	(	d.department_id	=	s.department_id	)
WHERE	department_nm		=	'Pandal'
AND		sub_department_nm	=	'Accomodation';
IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Department Pandal (Accomodation) not found', 16, 1);
	RETURN;
END

SELECT	@acc_dept_id	=	department_id
FROM	departments
WHERE	department_nm		=	'Accommodation';
IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Department Accommodation not found', 16, 1);
	RETURN;
END
*/


DECLARE crsr CURSOR FOR
	SELECT	l.satsang_centre_id, l.sewadar_grno, r.sewadar_id, s.gender, r.sewadar_status_cd, first_nm, middle_nm, last_nm
	FROM	generic_sewadar_lists_sewadars l
		JOIN    sewadars_registrations	r
			ON  (   r.satsang_centre_id =	l.satsang_centre_id
				AND	r.sewadar_grno		=	l.sewadar_grno
				AND	l.sewadar_list_id	=	@sewadar_list_id
				)
		JOIN	sewadars	s
			ON	(	s.sewadar_id	=	r.sewadar_id	)
	ORDER BY l.sewadar_grno;

OPEN crsr
FETCH crsr INTO @src_satsang_centre_id, @src_sewadar_grno, @sewadar_id, @gender, @status_cd, @first_nm, @middle_nm, @last_nm;
WHILE (@@FETCH_STATUS = 0)
BEGIN
	print 'iterating over ' + @src_sewadar_grno + ' with Name as ' + @first_nm + ' ' + @middle_nm + ' ' + @last_nm
	IF (@status_cd NOT IN ('Perm', 'Temp'))
	BEGIN
		RAISERROR ('Status of Sewadar with G.R. No. [%s] is %s; sewadar skipped', 16, 1, @src_sewadar_grno, @status_cd);
		CLOSE crsr
		DEALLOCATE crsr
		RETURN;
	END
		UPDATE	sewadars_registrations
			SET	sewadar_status_cd	=	'Shft',
				sewadar_status_dtm	=	@old_status_dtm
		WHERE 	satsang_centre_id	=	@src_satsang_centre_id
		AND		sewadar_grno		=	@src_sewadar_grno;

		IF (@@ROWCOUNT != 1)
		BEGIN
			RAISERROR ('Error when updating Sewadar with G.R. No. [%s] is %s', 16, 1, @src_sewadar_grno, @status_cd);
			CLOSE crsr
			DEALLOCATE crsr
			RETURN;
		END;

		EXEC GetSewadarRegistrationNumber @dst_satsang_centre_id,   -- Should be Indore and if part of application, should be the one that is passed as a Parameter to the Application
										@gender,                	-- Values allowed are Male or Female
										'Yes',						-- Values allowed are Yes or No
										@dst_sewadar_grno OUTPUT
										

		INSERT INTO sewadars_registrations 
			(	satsang_centre_id, sewadar_grno, sewadar_id, appointment_dt, is_outstation_sewadar,
				department_id, sub_department_id, department_dt, sewadar_status_cd, sewadar_status_dtm,
				reference_1_sewadar_id, reference_1_relationship, reference_1_nm, reference_1_centre_id, reference_1_department,
				reference_2_sewadar_id, reference_2_relationship, reference_2_nm, reference_2_centre_id, reference_2_department,
				sponsorer_id, area_secretary_id, secretary_id, security_approver_id, sewa_samiti_approver_id, location_district_id
			) 
			SELECT	@dst_satsang_centre_id, @dst_sewadar_grno, sewadar_id, appointment_dt, 'Yes',
					department_id, 
					CASE WHEN dept_id IS NOT NULL	THEN sub_department_id END,
					/*
					CASE WHEN department_id	=	@acc_dept_id THEN @pandal_dept_id	ELSE department_id END,
					CASE WHEN department_id	=	@acc_dept_id THEN @acc_sub_dept_id 	
							ELSE 
								CASE WHEN dept_id IS NOT NULL	THEN sub_department_id END
					END,
					*/
					CONVERT (VARCHAR (11), GetDate(), 106), @status_cd, CONVERT (VARCHAR (11), GetDate(), 106),
					reference_1_sewadar_id, reference_1_relationship, reference_1_nm, reference_1_centre_id, reference_1_department,
					reference_2_sewadar_id, reference_2_relationship, reference_2_nm, reference_2_centre_id, reference_2_department,
					sponsorer_id, area_secretary_id, secretary_id, security_approver_id, sewa_samiti_approver_id, location_district_id
			FROM	sewadars_registrations
				LEFT JOIN	@rtn_sub_depts	ON	(	dept_id	=	department_id	)
			WHERE 	satsang_centre_id	=	@src_satsang_centre_id
			AND		sewadar_grno		=	@src_sewadar_grno;
		
		IF (@@ROWCOUNT != 1)
		BEGIN
			RAISERROR ('Error when processing Sewadar with G.R. No. [%s] is %s', 16, 1, @src_sewadar_grno, @status_cd);
			CLOSE crsr
			DEALLOCATE crsr
			RETURN;
		END;

		--INSERT INTO generic_sewadar_lists_sewadars VALUES (@sewadar_list_id, @satsang_centre_id, @sewadar_grno);
		
	FETCH crsr INTO @src_satsang_centre_id, @src_sewadar_grno, @sewadar_id, @gender, @status_cd, @first_nm, @middle_nm, @last_nm;
END
CLOSE crsr
DEALLOCATE crsr


