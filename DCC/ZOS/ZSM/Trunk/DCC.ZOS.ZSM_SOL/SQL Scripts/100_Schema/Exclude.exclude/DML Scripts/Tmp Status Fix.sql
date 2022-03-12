/* ==================================================================================

    ==================================================================================
									   									   Usage Notes
    ----------------------------------------------------------------------------------
		The Stored Procedure Reports errors, if any, in the Excel File.
			* If there are no errors:
				* Changes the Status of Sewadar to Non-Initiate

		IMPORTANT... The Excel File Name and it's location on the Server is specified below.
    ==================================================================================
								      								  Revision History
    ----------------------------------------------------------------------------------
		Initial version
			Copied 01 Data Upload Proc.sql and edited it to suit the needs
   ==================================================================================*/

USE ZSM
GO

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'TmpStatusNI' AND xtype = 'P')
	DROP PROCEDURE TmpStatusNI
GO

CREATE PROCEDURE TmpStatusNI
(
	@p_centre_code		CHAR (3),
	@p_is_upload_data	VARCHAR (3),
	@p_record_cnt		INT				OUTPUT
)
WITH ENCRYPTION
AS
	DECLARE
		@s_no					INT,
		@prv_grno				CHAR(6),
		@sewadar_id				INT,
		@old_grno				CHAR(6),
		@new_grno				CHAR(6),
		@nm						VARCHAR(80),		-- name as per Excel
		@e_frst_nm				VARCHAR(30),		-- first name as per Excel
		@s_frst_nm				VARCHAR(30),		-- first name as per System
		@e_mddl_nm				VARCHAR(30),		-- middle name as per Excel
		@s_mddl_nm				VARCHAR(30),		-- middle name as per System
		@e_lst_nm				VARCHAR(30),		-- last name as per Excel
		@s_lst_nm				VARCHAR(30),		-- last name as per System
		@gender					VARCHAR(1),
		@department_nm			VARCHAR(30),
		@sub_department_nm		VARCHAR(30),
		@old_department_nm			VARCHAR(30),
		@photo_id				VARCHAR(10),
		@dtm	 				DATETIME,
		@s_DOB 					DATETIME,
		@is_name_overwritten	VARCHAR(1),
		@is_dob_overwritten		VARCHAR(1),
		@status_cd				VARCHAR (10),
		@database_location		VARCHAR (300),
		@d_id					INT,		-- department_id
		@ds_id					INT,		-- department_id for Satsang centre
		@sd_id					INT,		-- sub-department_id
		@sds_id					INT,		-- sub-department_id for Satsang centre
		@remarks 				VARCHAR(30),
		@err					BIT,
		@centre_id				INT,
		@c_id					INT,		--- Centre ID as per G.R. No.
		@cnt1					INT,
		@cnt2					INT,
		@old_dept_id			INT,
		@old_sub_dept_id		INT;
	
BEGIN
	SELECT 	@centre_id		= satsang_centre_id
	FROM	satsang_centres_details
	WHERE	centre_cd	=	@p_centre_code;
	IF (@@ROWCOUNT = 0)
	BEGIN
		RAISERROR ('Centre with code [%s] not found', 16, 1, @p_centre_code);
		RETURN -1;
	END

	SET @err = 0;

	DECLARE @tbl TABLE
		(	
			s_no					INT,
			old_grno				CHAR(6),
			new_grno				CHAR(6),
			nm						VARCHAR(80),
			department_nm 			VARCHAR(30),
			sub_department_nm 		VARCHAR(30),
			d_id					INT,		-- department_id
			ds_id					INT,		-- department_id for Satsang centre
			sd_id					INT,		-- sub-department_id
			sds_id					INT		-- sub-department_id for Satsang centre

			PRIMARY KEY	(	old_grno	)
		);

	INSERT INTO @tbl
			(	s_no, old_grno, nm, department_nm, sub_department_nm
			)
		SELECT	CONVERT (INT, [SR NO]), [GR NO], [Name], [DEPT], [SUB -DEPT]
		FROM OPENROWSET('Microsoft.Jet.OLEDB.4.0',

				---	====================================================================================================
				---	IMPORTANT... Change the Excel File Name and location in the following line
				---	====================================================================================================
				'Excel 8.0;Database=C:\Users\Ahmedabad\NI AMD 2.xls',

				'SELECT	[SR NO], [GR NO], [Name], [DEPT], [SUB -DEPT]
				 FROM [Sheet1$] where LEN ([GR NO]) = 6') ;

	SET @cnt1	=	@@ROWCOUNT;

	IF (@cnt1 <= 0)
	BEGIN
		RAISERROR ('No Records in Excel File', 16, 1);
		RETURN -1;
	END

	DECLARE	crsr CURSOR FOR
		SELECT	t.s_no, s.sewadar_id, t.old_grno, t.nm, s.first_nm, s.last_nm, s.middle_nm, s.birth_dtm, t.department_nm, t.sub_department_nm,
				r.satsang_centre_id, r.sewadar_grno, r.sewadar_status_cd, r.department_id, r.sub_department_id, m.remarks, 
				d.department_id, d.department_id, sd.sub_department_id, sds.sub_department_id, dr.department_nm
		FROM	@tbl t
			LEFT JOIN	sewadars_remarks m
				ON	(	t.old_grno			=	m.remarks
					AND	m.remarks_type	=	'Old G.R.No.'
					)
			LEFT JOIN	sewadars s 
				ON	(	m.sewadar_id			= 	s.sewadar_id	
					AND	s.current_satsang_centre_id =	@centre_id
					)
			LEFT JOIN	sewadars_registrations r
				ON	(	s.sewadar_id				=	r.sewadar_id
					AND	s.current_satsang_centre_id	=	r.satsang_centre_id
					AND	s.current_sewadar_grno		=	r.sewadar_grno
					)
			LEFT JOIN	departments	d
				ON	(	d.department_nm	=	t.department_nm	)
			LEFT JOIN	departments	dr
				ON	(	dr.department_id	=	r.department_id	)
--			LEFT JOIN	departments_satsang_centres	ds
	--			ON	(	d.department_id	=	ds.department_id
		--			AND	ds.satsang_centre_id = @centre_id
			--		)
			LEFT JOIN	sub_departments	sd
				ON	(	sd.department_id	=	d.department_id
					AND	sd.sub_department_nm	=	t.sub_department_nm
					)
			LEFT JOIN	sub_departments_satsang_centres	sds
				ON	(	sds.sub_department_id	=	sd.sub_department_id
					AND	sds.satsang_centre_id = @centre_id
					)
		ORDER BY t.s_no; 

	SET @cnt2 = 0;
	SET @dtm = GetDate();
	SET @prv_grno = '123456';

	OPEN crsr;

	FETCH crsr
		INTO	@s_no, @sewadar_id, @old_grno, @nm, @s_frst_nm, @s_lst_nm, @s_mddl_nm, @s_dob, @department_nm, @sub_department_nm,
				@c_id, @new_grno, @status_cd, @old_dept_id, @old_sub_dept_id, @remarks, 
				@d_id, @ds_id, @sd_id, @sds_id, @old_department_nm

	WHILE (@@FETCH_STATUS = 0)
	BEGIN
		IF (@prv_grno != @old_grno)
			SET @cnt2 = @cnt2 + 1;
		PRINT 'Processing ' + CONVERT (VARCHAR, @cnt2) + ' record :: S.No. ' + CONVERT (VARCHAR, @s_no) + ', Sewadar ID: ' + COALESCE (CONVERT (VARCHAR, @sewadar_id), 'XXX') + ', Old GR No. : ' + @old_grno + ', '
				+ 'Name: ' + COALESCE (@nm, '') + ', New GR No. : ' + COALESCE (@new_grno, '') + ', '
				+ 'Dept. : ' + COALESCE (@department_nm, '') + COALESCE (' (' + @sub_department_nm + ') ', ' ')
				+ CASE WHEN @c_id = @centre_id THEN 'Same Centre' ELSE 'Different Centre (' + COALESCE (CONVERT (VARCHAR, @c_id), '') + ')' END
		IF (@sewadar_id IS NULL)
		BEGIN
			PRINT '	ERROR: Sewadar ID could NOT be found for the Centre on the basis of Old G.R.No.'
			PRINT '	NOTE: This ERROR will be ignored during processing'
		END
		ELSE
		BEGIN
			IF (@new_grno IS NULL)
			BEGIN
				PRINT '	ERROR: New Sewadar G.R.No. could NOT be found'
				SET @err = 1;
			END
			ELSE IF (@c_id != @centre_id)
			BEGIN
				SELECT 	@p_centre_code	=	centre_cd
				FROM	satsang_centres_details
				WHERE	satsang_centre_id	=	@c_id;
				IF (@@ROWCOUNT = 1)
					PRINT '	ERROR: Sewadar G.R.No. is not at the current centre; G.R.No. is for the centre [ ' + @p_centre_code + ' ]'
				ELSE
					PRINT '	ERROR: Sewadar G.R.No. is not at the current centre'
				SET @err = 1;
			END

				IF (SUBSTRING (@nm, 1, LEN (@s_frst_nm)) != @s_frst_nm)
				BEGIN
					PRINT '	ERROR: Name in the Excel File (' + @nm + ') does not match with the System - First Name (' + @s_frst_nm + ')';
					SET @err = 1;
				END

			IF (@d_id IS NULL)
			BEGIN
				PRINT '	ERROR: Department could not be found'
				SET @err = 1;
			END
			ELSE IF (@d_id != @old_dept_id)
			BEGIN
				PRINT '	ERROR: Current Department - ' + @old_department_nm + ' (' + CONVERT (VARCHAR, @old_dept_id) + ')  is NOT same as specified in Excel File - ' + @department_nm + ' (' + CONVERT (VARCHAR, @d_id) + ')'
				SET @err = 1;
			END

			IF (@sub_department_nm IS NOT NULL)
				IF (@sd_id IS NULL)
				BEGIN
					PRINT '	ERROR: Sub-Department could not be found'
					SET @err = 1;
				END
				ELSE IF (@sds_id IS NULL)
				BEGIN
					PRINT '	ERROR: Sub-Department is NOT applicable for the Centre'
					SET @err = 1;
				END

			IF (@status_cd = 'NI')
			BEGIN
				PRINT '	ERROR: Status is already NI'
--				SET @err = 1;
			END
			ELSE IF (@status_cd NOT IN ('Temp', 'Perm'))
			BEGIN
				PRINT '	ERROR: Status is neither Permanent nor Temporary [' + @status_cd + ']' 
				SET @err = 1;
			END
		END

		IF (@err = 0 AND @cnt1 > 0 AND @p_is_upload_data = 'Yes' AND @new_grno IS NOT NULL AND @status_cd != 'NI')
		BEGIN
			UPDATE	sewadars_registrations
				SET	sewadar_status_cd	=	'NI',
					sewadar_status_dtm	=	@dtm
			WHERE	satsang_centre_id	=	@centre_id
			AND		sewadar_grno		=	@new_grno;
			IF (@@ROWCOUNT != 1)
			BEGIN
				PRINT '	FATAL ERROR: Status NOT updated.... .investigate the cause'
				SET @err = 1;
			END
			ELSE
				PRINT 'STATUS CHANGED TO NI'
		END

		SET @prv_grno = @old_grno;

		FETCH crsr
			INTO	@s_no, @sewadar_id, @old_grno, @nm, @s_frst_nm, @s_lst_nm, @s_mddl_nm, @s_dob, @department_nm, @sub_department_nm,
					@c_id, @new_grno, @status_cd, @old_dept_id, @old_sub_dept_id, @remarks, 
					@d_id, @ds_id, @sd_id, @sds_id, @old_department_nm
	END

	CLOSE crsr;
	DEALLOCATE crsr;

	IF (@err = 1)
		RETURN -1;
	IF (@err = 0 AND  @p_is_upload_data != 'Yes')
		SET @p_record_cnt = @cnt1;
	IF (@p_record_cnt != @cnt2 AND  @p_is_upload_data = 'Yes')
	BEGIN
		RAISERROR ('There is a mis-match between the records in Excel (%d) and records processed (%d); upload aborted', 16, 1, @p_record_cnt, @cnt2);
		RETURN -1;
	END

	RETURN 0;
END

