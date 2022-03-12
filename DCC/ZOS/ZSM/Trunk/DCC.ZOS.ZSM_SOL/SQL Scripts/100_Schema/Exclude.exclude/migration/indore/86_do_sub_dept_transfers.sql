/* ==================================================================================
    Source File		:	do_sub_dept_transfers.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Sat Sep 29 10:36 IST 2012
    Version			:	1.00
    Last updated	:	Sep 29, 2012
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    ==================================================================================
									   									   Usage Notes
    ----------------------------------------------------------------------------------
		Does the Sub-Department Transfer of Indore Sewadars
		Pre-requisite:
			1. Table mgr_sewadars_sub_depts exists with centre_grno, dept_id, sub_dept_id and remarks column
			2. Integrity checks should not have reported errors
    ==================================================================================
								      								  Revision History
    ----------------------------------------------------------------------------------
	v1.01 JL : 13-Oct-2012
			* Changes for multiple runs so that more sewadars sub-department transfers can be done.
				+ Bulk transfer from Sanitation (Safai) to Sanotation removed
	v1.00 JL : 29-Sep-2012
			* Initial version
   ==================================================================================*/


SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO



IF NOT EXISTS	(	SELECT	1
					FROM	sysobjects
					WHERE	name	=	'mgr_sewadars_sub_depts'
					AND		xtype	=	'U'
				)
BEGIN
	RAISERROR ('Table mgr_sewadars_sub_depts not found', 16, -1);
	RETURN
END

DECLARE
	@centre_id		INT,
	@transfer_dtm	DATETIME,
	@transfer_dt	DATETIME,
	@list_id		INT,
	@dept_id		INT,
	@sub_dept_id	INT;

SELECT	@centre_id	=	satsang_centre_id
FROM	satsang_centres_details
WHERE	centre_nm	=	'Indore'
AND		is_main_centre	=	'Yes'

IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Satsang Centre ID for Indore not found', 16, -1);
	RETURN
END


/*
SELECT	@dept_id	=	department_id
FROM	departments
WHERE	department_nm	=	'Sanitation'

IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Department ID for Sanitation not found', 16, -1);
	RETURN
END


SELECT	@sub_dept_id	=	sub_department_id
FROM	sub_departments
WHERE	sub_department_nm	=	'Safai'
AND		department_id		=	@dept_id

IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Sub-Department ID for Safai of Sanitation not found', 16, -1);
	RETURN
END
*/


UPDATE	m
	SET	remarks	=	COALESCE (m.remarks + '; ', '') + 'Department of Sewadar is ' + d.department_nm
FROM	mgr_sewadars_sub_depts	m
	JOIN	mgr_centre_sewadars	c
		ON	(	c.centre_grno	=	m.centre_grno
			AND	c.is_migrated	=	'Y'
			)
	JOIN	sewadars	s
		ON	(	s.sewadar_id	=	c.sewadar_id	)
	JOIN	sewadars_registrations	r
		ON	(	r.sewadar_id		=	s.sewadar_id
			AND	r.satsang_centre_id	=	s.current_satsang_centre_id
			AND	r.sewadar_grno		=	s.current_sewadar_grno
			AND	r.satsang_centre_id	=	@centre_id
			)
	JOIN	departments	d
		ON	(	r.department_id	=	d.department_id	)
WHERE	m.dept_id	!=	r.department_id
AND		m.remarks	IS	NULL
AND		m.transfer_dtm	IS NULL
AND		m.sewadar_grno  IS NULL;

IF (@@ROWCOUNT > 0)
	PRINT 'There were records where the department did not match'

UPDATE	m
	SET	remarks	=	COALESCE (m.remarks + '; ', '') + 'Department and Sub-Department match'
FROM	mgr_sewadars_sub_depts	m
	JOIN	mgr_centre_sewadars	c
		ON	(	c.centre_grno	=	m.centre_grno
			AND	c.is_migrated	=	'Y'
			)
	JOIN	sewadars	s
		ON	(	s.sewadar_id	=	c.sewadar_id	)
	JOIN	sewadars_registrations	r
		ON	(	r.sewadar_id		=	s.sewadar_id
			AND	r.satsang_centre_id	=	s.current_satsang_centre_id
			AND	r.sewadar_grno		=	s.current_sewadar_grno
			AND	r.satsang_centre_id	=	@centre_id
			)
WHERE	m.dept_id		=	r.department_id
AND		m.sub_dept_id	=	r.sub_department_id
AND		m.remarks	IS	NULL
AND		m.transfer_dtm	IS NULL
AND		m.sewadar_grno  IS NULL;

IF (@@ROWCOUNT > 0)
	PRINT 'There were records where the department/sub-department matched'

UPDATE	m
	SET	remarks	=	COALESCE (m.remarks + '; ', '') + 'Status of Sewadar is ' + r.sewadar_status_cd 
FROM	mgr_sewadars_sub_depts	m
	JOIN	mgr_centre_sewadars	c
		ON	(	c.centre_grno	=	m.centre_grno
			AND	c.is_migrated	=	'Y'
			)
	JOIN	sewadars	s
		ON	(	s.sewadar_id	=	c.sewadar_id	)
	JOIN	sewadars_registrations	r
		ON	(	r.sewadar_id		=	s.sewadar_id
			AND	r.satsang_centre_id	=	s.current_satsang_centre_id
			AND	r.sewadar_grno		=	s.current_sewadar_grno
			AND	r.satsang_centre_id	=	@centre_id
			)
WHERE	r.sewadar_status_cd	NOT IN ('Perm', 'Temp');

IF (@@ROWCOUNT > 0)
	PRINT 'There were records where the Status of Sewadar is not Permanent or Temporary'

SELECT	x.*, l.sewadar_id, s.first_nm, s.middle_nm, s.last_nm, s.gender, s.current_sewadar_grno, k.remarks as "Photo ID"
FROM	mgr_sewadars_sub_depts x
	LEFT JOIN	sewadars_remarks l
		ON	(	l.remarks=convert (varchar, x.centre_grno)
			AND l.remarks_type like 'Old G.R.No.'
			)
	LEFT JOIN	sewadars s
		ON	(	s.sewadar_id = l.sewadar_id)
	LEFT JOIN	sewadars_remarks k
		ON	(	k.sewadar_id = s.sewadar_id
			AND	k.remarks_type = 'Reference'
			)
WHERE	x.remarks IS NOT NULL


/*
	--- .... first transfer all Sewadars in Sanitation (Safai) to Sanitation on Day - 1 ............
	------------------------------------------

SET @transfer_dt = CONVERT (VARCHAR, GetDate() -1, 106);


INSERT INTO sewadars_transfers
		(	satsang_centre_id, sewadar_grno, effective_dt, old_department_id, department_id, old_sub_department_id, remarks) 
	SELECT	@centre_id, sewadar_grno, @transfer_dt, @dept_id, @dept_id, @sub_dept_id, 'Sanitation (Safai) bulk transfer'
	FROM	sewadars_registrations
	WHERE	department_id		=	@dept_id
	AND		sub_department_id	=	@sub_dept_id
	AND		satsang_centre_id	=	@centre_id
	AND		sewadar_status_cd	IN	(	'Perm', 'Temp'	);

*/
	--- .... main job begins here ............
	------------------------------------------

SET @transfer_dtm = GetDate()
SET @transfer_dt = CONVERT (VARCHAR, GetDate(), 106);

DECLARE		@trnsfr	TABLE(	centre_grno		INT			PRIMARY KEY,
							sewadar_grno	CHAR (6)	UNIQUE,
							dept_id			INT,
							sub_dept_id		INT
						);


INSERT INTO @trnsfr
	SELECT	m.centre_grno, r.sewadar_grno, m.dept_id, m.sub_dept_id
	FROM	mgr_sewadars_sub_depts	m
		JOIN	mgr_centre_sewadars	c
			ON	(	c.centre_grno	=	m.centre_grno
				AND	c.is_migrated	=	'Y'
				)
		JOIN	sewadars	s
			ON	(	s.sewadar_id	=	c.sewadar_id	)
		JOIN	sewadars_registrations	r
			ON	(	r.sewadar_id		=	s.sewadar_id
				AND	r.satsang_centre_id	=	s.current_satsang_centre_id
				AND	r.sewadar_grno		=	s.current_sewadar_grno
				AND	r.satsang_centre_id	=	@centre_id
				)
	WHERE	m.dept_id		=	r.department_id
	AND		r.sub_department_id	IS NULL
	AND		m.remarks	IS NULL
	AND		m.transfer_dtm	IS NULL
	AND		m.sewadar_grno  IS NULL;

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('No records to transfer', 16, -1);
	RETURN
END

INSERT INTO sewadars_transfers
		(	satsang_centre_id, sewadar_grno, effective_dt, old_department_id, department_id, sub_department_id, remarks) 
	SELECT	@centre_id, sewadar_grno, @transfer_dt, dept_id, dept_id, sub_dept_id, 'Sub-department bulk transfer'
	FROM	@trnsfr;

INSERT INTO generic_sewadar_lists
		(	satsang_centre_id, sewadar_list_nm, sewadar_list_use, sewadar_list_other_use	)
	VALUES
		(	@centre_id, 'Transferred (Sub-Departments) Indore Sewadars on ' + CONVERT (VARCHAR, @transfer_dt, 106),
			'Miscellaneous', 'Sub-Department Transfers'
		)
SET @list_id = SCOPE_IDENTITY();

INSERT INTO generic_sewadar_lists_sewadars
	SELECT	@list_id, @centre_id, sewadar_grno
	FROM	@trnsfr;

UPDATE	m
	SET	sewadar_grno	=	d.sewadar_grno,
		transfer_dtm	=	@transfer_dtm
FROM	mgr_sewadars_sub_depts	m
	JOIN	@trnsfr	d
		ON	(	m.centre_grno	=	d.centre_grno	);
	
