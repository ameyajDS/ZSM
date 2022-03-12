/* ==================================================================================

    ==================================================================================
									   									   Usage Notes
    ----------------------------------------------------------------------------------
		The Stored Procedure Reports errors, if any, in the Excel File.
			* If there are no errors:
				* Updates the name of Sewadar, if it is to be overwritten
				* Updates the Date of Birth of Sewadar, if it is to be overwritten
				* If Dept. and/or Sub-Dept. does not match, it does a Department Transfer
				* Updates the Photo ID in Reference type of Remarks
				* Emits the Script for Renaming Photo Files

		IMPORTANT... The Excel File Name and it's location on the Server is specified below.
    ==================================================================================
								      								  Revision History
    ----------------------------------------------------------------------------------
		02-Dec-2015 : JL
			* While  generating output for renaming files, JOIN for Photo IDs was not correct; this is fixed.
		19-Oct-2015 : JL
			* Old Department and Sub Department were not set; these are set now.
		11-Oct-2015 : JL
			* Handling of scenario where record matches with an Old G.R.No. of other Centre has now been corrected.
			* An error message corrected
			
		Initial version
   ==================================================================================*/

USE ZSM
GO

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'TmpDataUpload' AND xtype = 'P')
	DROP PROCEDURE TmpDataUpload
GO

CREATE PROCEDURE TmpDataUpload
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
		@e_frst_nm				VARCHAR(30),		-- first name as per Excel
		@s_frst_nm				VARCHAR(30),		-- first name as per System
		@e_mddl_nm				VARCHAR(30),		-- middle name as per Excel
		@s_mddl_nm				VARCHAR(30),		-- middle name as per System
		@e_lst_nm				VARCHAR(30),		-- last name as per Excel
		@s_lst_nm				VARCHAR(30),		-- last name as per System
		@gender					VARCHAR(1),
		@department_nm			VARCHAR(30),
		@sub_department_nm		VARCHAR(30),
		@photo_id				VARCHAR(10),
		@e_DOB	 				DATETIME,
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
			frst_nm					VARCHAR(30),
			mddl_nm 				VARCHAR(30),	
			lst_nm 					VARCHAR(30),	
			gender 					VARCHAR(1)	CHECK (gender IN ('G','L')),
			department_nm 			VARCHAR(30),
			sub_department_nm 		VARCHAR(30),
			telephone_no 			VARCHAR(30),
			photo_id 				VARCHAR(10),
			remarks 				VARCHAR(30),
			d_id					INT,		-- department_id
			ds_id					INT,		-- department_id for Satsang centre
			sd_id					INT,		-- sub-department_id
			sds_id					INT,		-- sub-department_id for Satsang centre
			DOB_dt 					DATETIME, 
			is_name_overwritten		CHAR(1),
			is_dob_overwritten		CHAR(1),

			PRIMARY KEY	(	old_grno	),
			UNIQUE		(	photo_id	)
		);

	INSERT INTO @tbl
			(	s_no, old_grno, frst_nm, mddl_nm, lst_nm, gender, department_nm, sub_department_nm, 
				telephone_no, photo_id, DOB_dt, is_name_overwritten, is_dob_overwritten
			)
		SELECT	CONVERT (INT, [s#no#]), old_grno, [first name], [middle name], surname, gender, department_nm, sub_department_nm,
				telephone_no, photo_id, CONVERT (DATETIME, [Date of birth]), is_name_overwritten, is_dob_overwritten
		FROM OPENROWSET('Microsoft.Jet.OLEDB.4.0',

				---	====================================================================================================
				---	IMPORTANT... Change the Excel File Name and location in the following line
				---	====================================================================================================
				'Excel 8.0;Database=\\Zsmt\users\Ahmedabad\AHMEDABAD PHOTOS & EXCEL\Verified- 2015-AHMEDABAD EXCEL\A06001-A07000.xls',

				'SELECT	[s#no#], old_grno, [first name], [middle name], surname, gender, department_nm, sub_department_nm,
						telephone_no, photo_id, [Date of birth], is_name_overwritten, is_dob_overwritten
				 FROM [Sheet3$] where to_be_migrated = ''Y''') ;

	SET @cnt1	=	@@ROWCOUNT;

	IF (@cnt1 <= 0)
	BEGIN
		RAISERROR ('No Records in Excel File', 16, 1);
		RETURN -1;
	END

	SELECT	*
	FROM	@tbl
	WHERE	is_name_overwritten	NOT IN ( 'Y', 'N'	)
	OR		is_dob_overwritten	NOT IN ( 'Y', 'N'	)
	IF (@@ROWCOUNT > 0)
	BEGIN
		RAISERROR ('Records having Name/DOB overwritten with character(s) other than Y or N', 16, 1);
		SET @err = 1;
	END

	SELECT	s.gender, s.first_nm, s.last_nm, s.birth_dtm, COUNT(*)
	FROM	@tbl t
		JOIN	sewadars s 
			ON	(	s.gender = CASE t.gender WHEN 'G' THEN 'Male' ELSE 'Female' END 
				AND s.first_nm					=	LTRIM(RTRIM(t.frst_nm))
				AND s.last_nm					=	LTRIM(RTRIM(t.lst_nm))
				AND	CONVERT (VARCHAR(11), s.birth_dtm, 106)	=	t.dob_dt
				AND	s.current_satsang_centre_id =	@centre_id
				)
	WHERE	is_name_overwritten	= 'N'
	AND		is_dob_overwritten	= 'N'
	GROUP BY	s.gender, s.first_nm, s.last_nm, s.birth_dtm
	HAVING COUNT (*) > 1

	IF (@@ROWCOUNT > 0)
	BEGIN
		RAISERROR ('Mutiple sewadar records matching... (Names/DOBs which are to be over-written are not considered', 16, 1);
		SET @err = 1;
	END

	SET @cnt2 = 0;
	SET @prv_grno = '123456';

	DECLARE	crsr CURSOR FOR
		SELECT	t.s_no, s.sewadar_id, t.old_grno, t.gender, t.frst_nm, t.lst_nm, t.mddl_nm, t.dob_dt, s.first_nm, s.last_nm, s.middle_nm, s.birth_dtm, t.photo_id, t.department_nm, t.sub_department_nm,
				r.sewadar_grno, r.sewadar_status_cd, r.department_id, r.sub_department_id, m.remarks, d.department_id, ds.department_id, sd.sub_department_id, sds.sub_department_id, t.is_name_overwritten, t.is_dob_overwritten
		FROM	@tbl t
			LEFT JOIN	sewadars_remarks m
				ON	(	t.old_grno			=	m.remarks
					AND	m.remarks_type	=	'Old G.R.No.'
					)
			LEFT JOIN	sewadars s 
				ON	(	m.sewadar_id			= 	s.sewadar_id	
					AND s.gender = CASE t.gender WHEN 'G' THEN 'Male' ELSE 'Female' END 
					AND	s.current_satsang_centre_id =	@centre_id
					)
			LEFT JOIN	sewadars_registrations r
				ON	(	s.sewadar_id				=	r.sewadar_id
					AND	s.current_satsang_centre_id	=	r.satsang_centre_id
					AND	s.current_sewadar_grno		=	r.sewadar_grno
					)
			LEFT JOIN	departments	d
				ON	(	d.department_nm	=	t.department_nm	)
			LEFT JOIN	departments_satsang_centres	ds
				ON	(	d.department_id	=	ds.department_id
					AND	ds.satsang_centre_id = @centre_id
					)
			LEFT JOIN	sub_departments	sd
				ON	(	sd.department_id	=	d.department_id
					AND	sd.sub_department_nm	=	t.sub_department_nm
					)
			LEFT JOIN	sub_departments_satsang_centres	sds
				ON	(	sds.sub_department_id	=	sd.sub_department_id
					AND	sds.satsang_centre_id = @centre_id
					)
		ORDER BY t.s_no; 

	OPEN crsr;

	FETCH crsr
		INTO	@s_no, @sewadar_id, @old_grno, @gender, @e_frst_nm, @e_lst_nm, @e_mddl_nm, @e_dob, @s_frst_nm, @s_lst_nm, @s_mddl_nm, @s_dob, @photo_id, @department_nm, @sub_department_nm,
				@new_grno, @status_cd, @old_dept_id, @old_sub_dept_id, @remarks, @d_id, @ds_id, @sd_id, @sds_id, @is_name_overwritten, @is_dob_overwritten

	WHILE (@@FETCH_STATUS = 0)
	BEGIN
		IF (@prv_grno != @old_grno)
			SET @cnt2 = @cnt2 + 1;
		PRINT 'Processing ' + CONVERT (VARCHAR, @cnt2) + ' record :: S.No. ' + CONVERT (VARCHAR, @s_no) + ', Sewadar ID: ' + COALESCE (CONVERT (VARCHAR, @sewadar_id), 'XXX') + ', Old GR No. : ' + @old_grno + ', '
				+ 'Gender: ' + COALESCE (@gender, '') + ', Name: ' + COALESCE (@e_frst_nm, '') + ' ' + COALESCE (@e_lst_nm, '') + ', Photo ID :' + @photo_id + ', New GR No. : ' + COALESCE (@new_grno, '') + ', '
				+ 'Dept. : ' + COALESCE (@department_nm, '') + COALESCE (' (' + @sub_department_nm + ')', '')

		IF (@sewadar_id IS NULL)
		BEGIN
			PRINT '	ERROR: Sewadar ID could NOT be found for the Centre on the basis of Old G.R.No. and considering Gender'
			PRINT '	NOTE: This ERROR will be ignored during processing'
		END
		ELSE
		BEGIN
			IF (@new_grno IS NULL)
			BEGIN
				PRINT '	ERROR: New Sewadar G.R.No. could NOT be found'
				SET @err = 1;
			END

			IF (@is_name_overwritten = 'N')
			BEGIN
				IF (@e_frst_nm != @s_frst_nm)
				BEGIN
					PRINT '	ERROR: First Name in the Excel File (' + @e_frst_nm + ') does not match with the System (' + @s_frst_nm + ')';
					SET @err = 1;
				END
				IF (	(	@e_mddl_nm 	IS	NOT NULL AND @s_mddl_nm	IS	NOT NULL	AND	@e_mddl_nm != @s_mddl_nm	)
					OR	(	@e_mddl_nm 	IS	NOT NULL AND @s_mddl_nm	IS 		NULL	)
					OR	(	@e_mddl_nm 	IS		NULL AND @s_mddl_nm	IS	NOT NULL	)
						)
				BEGIN
					PRINT '	ERROR: Middle Name in the Excel File (' + COALESCE (@e_mddl_nm, 'NULL') + ') does not match with the System (' + COALESCE (@s_mddl_nm, 'NULL') + ')';
					SET @err = 1;
				END
				IF (@e_lst_nm != @s_lst_nm)
				BEGIN
					PRINT '	ERROR: Last Name in the Excel File (' + @e_lst_nm + ') does not match with the System (' + @s_lst_nm + ')';
					SET @err = 1;
				END
			END

			IF (@is_dob_overwritten = 'N' AND CONVERT (VARCHAR, @s_dob, 106) != CONVERT (VARCHAR, @e_dob, 106))
			BEGIN
				PRINT '	ERROR: Date of Birth in the Excel File (' + CONVERT (VARCHAR, @e_dob, 106) + ') does not match with the System (' + CONVERT (VARCHAR, @s_dob, 106) + ')';
				SET @err = 1;
			END

			IF (@is_dob_overwritten = 'Y' AND ABS (DATEDIFF (d, @s_dob, @e_dob)) > 1115)
			BEGIN
				PRINT '	ERROR: Difference of Dates of Birth in the Excel File (' + CONVERT (VARCHAR, @e_dob, 106) + ') and the System (' + CONVERT (VARCHAR, @s_dob, 106) + ') is more than three years (1115 days)';
				SET @err = 1;
			END

			IF (@d_id IS NULL)
			BEGIN
				PRINT '	ERROR: Department could not be found'
				SET @err = 1;
			END
			ELSE IF (@ds_id IS NULL)
			BEGIN
				PRINT '	ERROR: Department is NOT applicable for the Centre'
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
			
			IF	(@s_dob < '1-Jan-1946' AND @status_cd != 'Retd')
			BEGIN
				PRINT '	ERROR: Sewadar born before 1-Jan-1946 (' + CONVERT (VARCHAR, @s_dob, 106) + ') has the status other than Retired (' + @status_cd + ')'
				SET @err = 1;
			END
			IF EXISTS	(	SELECT	1
							FROM	sewadars_remarks	m
								JOIN	sewadars s 
									ON	(	m.sewadar_id			= 	s.sewadar_id	
										AND	s.current_satsang_centre_id =	@centre_id
										)
							WHERE	m.sewadar_id	=	@sewadar_id
							AND		m.remarks_type	=	'Reference'
							AND		m.remarks		=	@photo_id
						)
			BEGIN
				PRINT '	ERROR: Photo ID (' + @photo_id + ') for Sewadar already exists'
				SET @err = 1;
			END
		END

		IF (@err = 0 AND @cnt1 > 0 AND @p_is_upload_data = 'Yes' AND @new_grno IS NOT NULL)
		BEGIN
			IF (@is_name_overwritten = 'Y')
				UPDATE	sewadars
					SET	first_nm	=	@e_frst_nm,
						middle_nm	=	@e_mddl_nm,
						last_nm		=	@e_lst_nm
				WHERE	sewadar_id	=	@sewadar_id;

			IF (@is_dob_overwritten = 'Y')
				UPDATE	sewadars
					SET	birth_dtm	=	@e_dob
				WHERE	sewadar_id	=	@sewadar_id;

			--- If dept/sub-dept combination differs, do a sewadar transfer
			IF	(	(	@old_dept_id		!=	@d_id		)
				OR	(	@old_sub_dept_id	!=	@sd_id	)
				OR	(	@old_sub_dept_id	IS NULL		AND	@sd_id	IS NOT NULL	)
				OR	(	@old_sub_dept_id	IS NOT NULL	AND	@sd_id	IS NULL		)
				)
			BEGIN
				INSERT INTO sewadars_transfers
						(	satsang_centre_id, sewadar_grno, effective_dt, old_department_id, old_sub_department_id, department_id, sub_department_id	)
					VALUES
						(	@centre_id, @new_grno,  CONVERT (VARCHAR (11), GetDate(), 106), @old_dept_id, @old_sub_dept_id, @d_id, @sd_id);
			END
			
			--- Store the Photo ID
			IF EXISTS	(	SELECT	1
							FROM	sewadars_remarks	m
								JOIN	sewadars s 
									ON	(	m.sewadar_id			= 	s.sewadar_id	
										AND	s.current_satsang_centre_id =	@centre_id
										)
							WHERE	m.sewadar_id	=	@sewadar_id
							AND		m.remarks_type	=	'Reference'
							AND		m.remarks		=	@photo_id
						)
			BEGIN
				PRINT '	ERROR: Photo ID (' + @photo_id + ') for Sewadar already exists'
				SET @err = 1;
			END
			ELSE
				INSERT INTO sewadars_remarks VALUES (@sewadar_id, 'Reference', 1, @photo_id)
		END
		SET @prv_grno = @old_grno;

		FETCH crsr
			INTO	@s_no, @sewadar_id, @old_grno, @gender, @e_frst_nm, @e_lst_nm, @e_mddl_nm, @e_dob, @s_frst_nm, @s_lst_nm, @s_mddl_nm, @s_dob, @photo_id, @department_nm, @sub_department_nm,
					@new_grno, @status_cd, @old_dept_id, @old_sub_dept_id, @remarks, @d_id, @ds_id, @sd_id, @sds_id, @is_name_overwritten, @is_dob_overwritten
	END

	CLOSE crsr;
	DEALLOCATE crsr;

	IF (@err = 1)
		RETURN -1;
	IF (@p_record_cnt != @cnt2 AND  @p_is_upload_data = 'Yes')
	BEGIN
		RAISERROR ('There is a mis-match between the records in Excel (%d) and records processed (%d); upload aborted', 16, 1, @p_record_cnt, @cnt2);
		RETURN -1;
	END
	IF (@err = 0 AND  @p_is_upload_data != 'Yes')
		SET @p_record_cnt = @cnt1;

	IF (@err = 0 AND  @p_is_upload_data = 'Yes')
	BEGIN
		SELECT	'rename "' + n.remarks + '-' + s.first_nm + '.jpg"  "' + CONVERT (VARCHAR, m.sewadar_id) + '.jpg"'	AS [Rename file entry],
				t.s_no, s.sewadar_id, t.old_grno, t.gender, t.frst_nm, t.lst_nm,-- t.mddl_nm, t.dob_dt, s.first_nm, s.last_nm, s.middle_nm, s.birth_dtm, t.photo_id, t.department_nm, t.sub_department_nm,
				s.current_sewadar_grno, m.remarks, n.remarks
		FROM	@tbl	t
			JOIN	sewadars_remarks m
				ON	(	t.old_grno		=	m.remarks
					AND	m.remarks_type	=	'Old G.R.No.'
					)
			JOIN	sewadars s 
				ON	(	m.sewadar_id			= 	s.sewadar_id	
					AND s.gender = CASE t.gender WHEN 'G' THEN 'Male' ELSE 'Female' END 
					AND	s.current_satsang_centre_id =	@centre_id
					)
			JOIN	sewadars_remarks n
				ON	(	n.sewadar_id			= 	s.sewadar_id	
					AND 	t.photo_id		=	n.remarks
					AND	n.remarks_type	=	'Reference'
					)
		ORDER BY n.remarks;
		SET @cnt2 = @@ROWCOUNT;
		IF (@p_record_cnt != @cnt2)
		BEGIN
			RAISERROR ('There is a mis-match between the records in Excel (%d) and number of records for Renaming Photo Files (%d); upload aborted', 16, 1, @p_record_cnt, @cnt2);
			RETURN -1;
		END
	END
	RETURN 0;
END


