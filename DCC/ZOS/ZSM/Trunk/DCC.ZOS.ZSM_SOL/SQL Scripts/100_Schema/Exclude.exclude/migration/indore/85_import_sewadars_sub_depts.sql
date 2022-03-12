/* ==================================================================================
    Source File		:	import_sewadars_sub_depts.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Sat Sep 29 08:02 IST 2012
    Version			:	1.01
    Last updated	:	Oct 11, 2012
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    ==================================================================================
									   									   Usage Notes
    ----------------------------------------------------------------------------------
		Imports the Sub-Departments of Indore Sewadars for Transfers
    ==================================================================================
								      								  Revision History
    ----------------------------------------------------------------------------------
	v1.01 JL : 11-Oct-2012
			*   Script modified so that the table is not created (and the existing table is used).
				This is to facilitate uploading of Sub-departments for other departments.
	v1.00 JL : 29-Sep-2012
			*   Initial version
   ==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

SET ANSI_WARNINGS ON
GO



/*
IF EXISTS	(	SELECT	1
				FROM	sysobjects
				WHERE	name	=	'mgr_sewadars_sub_depts'
				AND		xtype	=	'U'
			)
	DROP TABLE	mgr_sewadars_sub_depts
GO

CREATE TABLE	mgr_sewadars_sub_depts
(
	centre_grno		INT				PRIMARY KEY,
	dept_nm			VARCHAR (20),
	sub_dept_nm		VARCHAR (20),
	dept_id			INT,
	sub_dept_id		INT,
	transfer_dtm	DATETIME,
	sewadar_grno	CHAR (6),
	remarks			VARCHAR (4000)
)
*/

DECLARE
	@centre_id	INT

SELECT	@centre_id	=	satsang_centre_id
FROM	satsang_centres_details
WHERE	centre_nm	=	'Indore'
AND		is_main_centre	=	'Yes'

IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Satsang Centre ID for Indore not found', 16, -1);
	RETURN
END

SELECT	*
FROM	mgr_sewadars_sub_depts	a
WHERE	EXISTS	(
	SELECT	1
 	FROM	OPENROWSET	('Microsoft.Jet.OLEDB.4.0', 'Excel 8.0;
							Database=e:\users\indore\Sewadars_SubDepts.xls',
							'SELECT [gr_no], [Dept], [SubDepartment] FROM [sub-depts$]'
						)
	WHERE	gr_no = centre_grno
	);
IF (@@ROWCOUNT > 0)
BEGIN
	RAISERROR ('Excel File contains Sewadars whose sub-department transfer is already done', 16, -1);
	RETURN
END



	---- Read the Excel File
	------------------------

INSERT	INTO	mgr_sewadars_sub_depts
		(	centre_grno, dept_nm, sub_dept_nm	)
	SELECT	[gr_no], [Dept], [SubDepartment]
 	FROM	OPENROWSET	('Microsoft.Jet.OLEDB.4.0', 'Excel 8.0;
							Database=e:\users\indore\Sewadars_SubDepts.xls',
							'SELECT [gr_no], [Dept], [SubDepartment] FROM [sub-depts$]'
						);


	---- Perform checks on Department / Sub-department, and if successful, set the IDs for both
	------------------------

SELECT	*
FROM	mgr_sewadars_sub_depts
WHERE	centre_grno	IS NULL
OR		dept_nm		IS NULL
OR		sub_dept_nm	IS NULL
OR		dept_nm		=	''
OR		sub_dept_nm	=	'';
IF (@@ROWCOUNT > 0)
BEGIN
	RAISERROR ('There is data where the G.R. No. and/or Department and/or Sub-Department is not specified', 16, -1);
	RETURN
END

SELECT	*
FROM	mgr_sewadars_sub_depts	m
WHERE	NOT	EXISTS	(	SELECT	1
						FROM	departments	d
							JOIN	departments_satsang_centres	s
								ON	(	d.department_id	=	s.department_id
									AND	s.satsang_centre_id	=	@centre_id
									)
						WHERE	d.department_nm	=	m.dept_nm
					);

IF (@@ROWCOUNT > 0)
BEGIN
	RAISERROR ('There is data such that the Department is not valid for Indore Satsang Centre', 16, -1);
	RETURN
END

UPDATE	m
	SET	dept_id	=	d.department_id
FROM	mgr_sewadars_sub_depts	m
	JOIN	departments	d
		ON	(	m.dept_nm	=	d.department_nm	)
WHERE	m.dept_id	IS NULL;
	
SELECT	*
FROM	mgr_sewadars_sub_depts	m
WHERE	NOT	EXISTS	(	SELECT	1
						FROM	sub_departments	d
							JOIN	sub_departments_satsang_centres	s
								ON	(	d.sub_department_id	=	s.sub_department_id
									AND	s.satsang_centre_id	=	@centre_id
									)
						WHERE	d.sub_department_cd =	m.sub_dept_nm
						AND		d.department_id		=	m.dept_id
					);

IF (@@ROWCOUNT > 0)
BEGIN
	RAISERROR ('There is data such that the Sub-Department is not valid for Indore Satsang Centre', 16, -1);
	RETURN
END

UPDATE	m
	SET	sub_dept_id	=	d.sub_department_id
FROM	mgr_sewadars_sub_depts	m
	JOIN	sub_departments	d
		ON	(	m.sub_dept_nm	=	d.sub_department_cd
			AND	m.dept_id		=	d.department_id
			)
WHERE	m.sub_dept_id	IS NULL;
	
