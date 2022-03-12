/* ==================================================================================
    Source File		:	make_indore_sub_depts_xcl.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Sun Oct 07 12:28 IST 2012
    Version			:	1.00
    Last updated	:	Oct 07, 2012
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    ==================================================================================
									   									   Usage Notes
    ----------------------------------------------------------------------------------
		Creates the Sub-Departments for Indore after reading Department Name and
		Sub-department Code from an Excel file.
    ==================================================================================
								      								  Revision History
    ----------------------------------------------------------------------------------
			*   Initial versions
   ==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

SET ANSI_WARNINGS ON
GO

EXEC sp_configure 'show advanced options', 1
GO
RECONFIGURE
GO
--EXEC sp_configure 'Ad Hoc Distributed Queries', 1
--GO
--RECONFIGURE
--GO


DECLARE
	@centre_id			INTEGER,
	@dept_id			INTEGER,
	@sub_dept_id		INTEGER,
	@has_sd				Boolean,
	@dept_nm			VARCHAR (25),
	@sub_dept_nm		VARCHAR (25),
	@sub_dept_common_nm	VARCHAR (25),
	@sub_dept_cd		VARCHAR (25),
	@msg				VARCHAR (200)


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
-- Read the Sub-departments from Excel File
-- ====================================================================================================

IF EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'mgr_sub_depts')
	DROP TABLE mgr_sub_depts

CREATE TABLE mgr_sub_depts 
(
	dept_nm				VARCHAR (25) NOT NULL,
	sub_dept_common_nm	VARCHAR (25) NOT NULL,
	sub_dept_cd			VARCHAR (25) NOT NULL
)

INSERT INTO mgr_sub_depts
		(	dept_nm, sub_dept_common_nm, sub_dept_cd	)
	SELECT	dept, common_nm, code
	FROM OPENROWSET('Microsoft.Jet.OLEDB.4.0', 'Excel 8.0;Database=C:\TEMP\sub_depts.xls', 'SELECT * FROM [Sheet1$]');


-- ====================================================================================================

DECLARE	dcrsr	CURSOR FOR
	SELECT	dept_nm, sub_dept_common_nm, sub_dept_cd
	FROM	mgr_sub_depts;

OPEN dcrsr;

FETCH dcrsr	INTO
	@dept_nm, @sub_dept_common_nm, @sub_dept_cd;

WHILE (@@FETCH_STATUS = 0)
BEGIN
	SELECT	@dept_id	=	department_id,
			@has_sd		=	has_sub_departments
	FROM	departments
	WHERE	department_nm	=	@dept_nm;

	IF (@@ROWCOUNT != 1)
	BEGIN
		SET @msg = 'Department ' + @dept_nm + ' not found';
		RAISERROR (@msg, 16, -1);
		RETURN;
	END

	IF (@has_sd = 'No')
	BEGIN
		UPDATE	departments
			SET	has_sub_departments	=	'Yes'
		WHERE	department_id		=	@dept_id;
		IF (@@ROWCOUNT != 1)
		BEGIN
			SET @msg = 'Department ' + @dept_nm + ' could not be updated to have sub-departments';
			RAISERROR (@msg, 16, -1);
			RETURN;
		END
	END

	-- ====================================================================================================
	SET @sub_dept_nm = @sub_dept_common_nm + ' ' + @sub_dept_cd;

	SELECT	@sub_dept_id	=	sub_department_id
	FROM	sub_departments
	WHERE	sub_department_nm	=	@sub_dept_nm
	AND		department_id		=	@dept_id;

	IF (@@ROWCOUNT = 0)
	BEGIN
		INSERT INTO	sub_departments
				(	department_id, sub_department_cd, sub_department_nm	)
			VALUES
				(	@dept_id, @sub_dept_cd, @sub_dept_nm	);
		
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

	SET @msg = 'Sub-department [' + @sub_dept_nm + '] for Department ' + @dept_nm + ' created';
	PRINT @msg;

	-- ====================================================================================================

	FETCH dcrsr	INTO
		@dept_nm, @sub_dept_common_nm, @sub_dept_cd;
END

CLOSE dcrsr;
DEALLOCATE dcrsr;
	
DROP TABLE mgr_sub_depts;

