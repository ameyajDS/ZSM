
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'QueryPhotoIdsToMigrate' AND xtype = 'P')
	DROP PROCEDURE QueryPhotoIdsToMigrate
GO

CREATE PROCEDURE QueryPhotoIdsToMigrate
(
	@satsang_centre_id			satsang_centre_id,
	@is_migrated				CHAR (1)
)
WITH ENCRYPTION
AS
BEGIN
    SELECT  m.centre_grno, m.photo_id,
			CASE m.is_name_overridden WHEN 'Y' THEN LTRIM(RTRIM(SUBSTRING (m.name, 1, CHARINDEX (' ', m.name) - 1))) ELSE i.first_name END AS first_name,
			i.sewadar_id
    FROM     mgr_tmp_sewadars m
		JOIN	mgr_centre_sewadars i
	         ON	(	m.centre_grno = i.centre_grno
				AND i.is_migrated = @is_migrated
				AND	i.satsang_centre_id = @satsang_centre_id
				AND	m.to_be_migrated = 'Y'
				)
    ORDER BY photo_id;
END

GO


IF EXISTS (SELECT * FROM sysobjects WHERE name = 'ReportDiscrepancies' AND xtype = 'P')
	DROP PROCEDURE ReportDiscrepancies
GO

CREATE PROCEDURE ReportDiscrepancies
(
	@satsang_centre_nm			gnc_nm,
	@satsang_centre_id			satsang_centre_id,
	@ret_str					VARCHAR(8000) OUTPUT
)
WITH ENCRYPTION
AS
DECLARE
	@telephone_from_excel_file	VARCHAR(20),
	@first_nm					VARCHAR(30),
	@middle_nm					VARCHAR(30),
	@last_nm					VARCHAR(30),
	@sewadar_list_id			sewadar_list_id,
	@is_name_overridden			CHAR,
	@gr_no						VARCHAR (10),
	@photo_id					VARCHAR(20),
	@status						VARCHAR(30),
	@name						VARCHAR(100),
	@gender						CHAR,
	@old_gender					CHAR,
    @is_local_sewadar			CHAR,
    @is_migrated				CHAR,
    @sub_department_nm			VARCHAR (50),
    @department_nm				VARCHAR (50),
    @position1					INT,
	@position2					INT,
	@old_first_nm				VARCHAR(30),
	@old_middle_nm				VARCHAR(30),
	@old_last_nm				VARCHAR(30),
	@dept_id					INT,
	@dept_eff_frm_dt			DATETIME,
	@dept_eff_tll_dt			DATETIME,
	@sub_dept_id				INT,
	@sub_dept_eff_frm_dt		DATETIME,
	@sub_dept_eff_tll_dt		DATETIME;
	
BEGIN

	DECLARE crsr CURSOR FOR
		SELECT	RTRIM (LTRIM (m.centre_grno)), RTRIM (LTRIM (m.photo_id)), REPLACE (REPLACE (m.name, '  ', ' '), '  ', ' '), m.is_name_overridden, m.telephone_no, m.is_local_sewadar, m.gender, m.department_nm, m.sub_department_nm,
				i.first_name, i.middle_name, i.surname, i.gender, i.is_migrated, i.status,
				d.department_id, ds.effective_from, ds.effective_till, s.sub_department_id, ss.effective_from, ss.effective_till
		FROM    mgr_tmp_sewadars m
			LEFT OUTER JOIN    mgr_centre_sewadars i
				ON  (   m.centre_grno = i.centre_grno
					)
			LEFT JOIN	departments d
				ON	(	m.department_nm = d.department_nm	)
			LEFT JOIN	sub_departments	s
				ON	(	s.department_id = d.department_id
					AND	s.sub_department_nm = m.sub_department_nm
					)
			LEFT JOIN	departments_satsang_centres	ds
				ON	(	ds.department_id = d.department_id
					AND	ds.satsang_centre_id = @satsang_centre_id
					)
			LEFT JOIN	sub_departments_satsang_centres	ss
				ON	(	ss.sub_department_id = s.sub_department_id
					AND	ss.satsang_centre_id = @satsang_centre_id
					)
		WHERE	m.to_be_migrated = 'Y'
		ORDER BY photo_id;

	SET @ret_str =  ''

	OPEN crsr
	FETCH crsr INTO @gr_no, @photo_id , @name, @is_name_overridden, @telephone_from_excel_file, @is_local_sewadar, @gender, @department_nm, @sub_department_nm,
					@old_first_nm, @old_middle_nm, @old_last_nm, @old_gender, @is_migrated, @status,
					@dept_id, @dept_eff_frm_dt, @dept_eff_tll_dt, @sub_dept_id, @sub_dept_eff_frm_dt, @sub_dept_eff_tll_dt
	WHILE (@@FETCH_STATUS = 0)
	BEGIN
--		print 'iterating over ' + @gr_no + '[' + @photo_id +']'
		IF (@old_first_nm IS NULL)
			SET @ret_str =  @ret_str + 'Old GR No. is NOT found in the Temporarily Migrated Data for ' + @gr_no +'[' + @photo_id +']' + CHAR (13);
		ELSE IF (@is_migrated = 'Y')
			SET @ret_str =  @ret_str + 'Data is already Migrated for ' + @gr_no +'[' + @photo_id +']' + CHAR (13);
		ELSE IF (@status NOT IN ( 'Permanent', 'Retired', 'Non-initiated') OR @status IS NULL)
			SET @ret_str =  @ret_str + 'Status of Sewadar is not one of Permanent, Retired or Non-initiated for ' + @gr_no +'[' + @photo_id +']' + CHAR (13);
		ELSE
		BEGIN
			SET @position1 = CHARINDEX (' ', @name)
			IF (@position1 > 0)
			BEGIN
				SET @first_nm = LTRIM(RTRIM(SUBSTRING (@name, 1, @position1 - 1)));
				SET @position2 = CHARINDEX (' ', LTRIM(RTRIM(SUBSTRING (@name, @position1 + 1, 100))))
				IF (@position2 > 0)
				BEGIN
					SET @middle_nm = LTRIM(RTRIM(SUBSTRING ( LTRIM(RTRIM(SUBSTRING (@name, @position1 + 1, 100))), 1, @position2 -1)));
					SET @last_nm = LTRIM(RTRIM(SUBSTRING (@name, @position1 + @position2 + 1, 100)))
				END
				ELSE
					SET @ret_str =  @ret_str + 'Name [' + @name + '] does not have First Name, Middle Name and Surname separated by a space for ' + @gr_no +'[' + @photo_id +']' + CHAR (13);
			END
			ELSE
				SET @ret_str =  @ret_str + 'Name [' + @name + '] does not have First Name, Middle Name and Surname separated by a space for ' + @gr_no +'[' + @photo_id +']' + CHAR (13);
		
			IF (@is_name_overridden IS NULL OR @is_name_overridden = 'N')
			BEGIN
				IF @old_first_nm != @first_nm
					SET @ret_str =  @ret_str + 'First Name [' + COALESCE (' ' + @old_first_nm, '') + COALESCE (' ' + @old_middle_nm, '') + COALESCE (' ' + @old_last_nm, '') + '] does not match for '  + @gr_no +'[' + @photo_id +']' + CHAR (13)
				ELSE IF @old_last_nm != @last_nm
					SET @ret_str =  @ret_str + 'Last Name [' + COALESCE (' ' + @old_first_nm, '') + COALESCE (' ' + @old_middle_nm, '') + COALESCE (' ' + @old_last_nm, '') + '] does not match for '  + @gr_no +'[' + @photo_id +']' + CHAR (13)
				ELSE IF @first_nm IS NULL OR @last_nm IS NULL OR @middle_nm IS NULL
					SET @ret_str =  @ret_str + 'There should be three parts in Name column in the migrated data for '  + @gr_no +'[' + @photo_id +']' + CHAR (13)
			END
			ELSE
			BEGIN
				IF (@first_nm IS NULL OR @last_nm IS NULL OR @middle_nm IS NULL OR CHARINDEX (' ', @first_nm) > 0  OR CHARINDEX (' ', @middle_nm) > 0 OR CHARINDEX (' ', @last_nm) > 0)
					SET @ret_str =  @ret_str + 'There should be three parts in Name column, viz., First Name, Middle Name and Last Name separated by a space each for '  + @gr_no +'[' + @photo_id +']' + CHAR (13)
			END

			IF (@is_local_sewadar NOT IN ( 'Y', 'N'))
				SET @ret_str =  @ret_str + 'Outstation Sewadar should Y or N for '  + @gr_no +'[' + @photo_id +']' + CHAR (13)
			IF (@gender NOT IN ( 'G', 'L'))
				SET @ret_str =  @ret_str + 'Gender should G or L for '  + @gr_no +'[' + @photo_id +']' + CHAR (13)
			IF (@old_gender != @gender)
				SET @ret_str =  @ret_str + 'Gender does not match for '  + @gr_no +'[' + @photo_id +']' + CHAR (13)

			IF (@dept_id IS NULL)
				SET @ret_str =  @ret_str + 'Department [' + @department_nm + '] does not exist for '  + @gr_no +'[' + @photo_id +']' + CHAR (13)
			ELSE IF (@dept_eff_frm_dt IS NULL)
				SET @ret_str =  @ret_str + 'Department [' + @department_nm + '] is not valid this Centre for '  + @gr_no +'[' + @photo_id +']' + CHAR (13)
			ELSE IF (GetDate () NOT BETWEEN @dept_eff_frm_dt AND @dept_eff_tll_dt)
				SET @ret_str =  @ret_str + 'Department [' + @department_nm + '] is not Active for '  + @gr_no +'[' + @photo_id +']' + CHAR (13)
			IF (@sub_department_nm IS NOT NULL AND @sub_department_nm != '')
			BEGIN
				IF (@sub_dept_id IS NULL)
					SET @ret_str =  @ret_str + 'Sub-department [' + @department_nm + '(' + @sub_department_nm + ')] does not exist for '  + @gr_no +'[' + @photo_id +']' + CHAR (13)
				ELSE IF (@sub_dept_eff_frm_dt IS NULL)
					SET @ret_str =  @ret_str + 'Sub-department [' + @department_nm + '(' + @sub_department_nm + ')] is not valid this Centre for '  + @gr_no +'[' + @photo_id +']' + CHAR (13)
				ELSE IF (GetDate () NOT BETWEEN @sub_dept_eff_frm_dt AND @sub_dept_eff_tll_dt)
					SET @ret_str =  @ret_str + 'Sub-department [' + @department_nm + '(' + @sub_department_nm + ')] is not Active for '  + @gr_no +'[' + @photo_id +']' + CHAR (13)
			END
			UPDATE	mgr_tmp_sewadars
				SET	department_id = @dept_id,
					sub_department_id = @sub_dept_id
			WHERE	centre_grno	= @gr_no;
		END
		FETCH crsr INTO @gr_no, @photo_id , @name, @is_name_overridden, @telephone_from_excel_file, @is_local_sewadar, @gender, @department_nm, @sub_department_nm,
						@old_first_nm, @old_middle_nm, @old_last_nm, @old_gender, @is_migrated, @status,
						@dept_id, @dept_eff_frm_dt, @dept_eff_tll_dt, @sub_dept_id, @sub_dept_eff_frm_dt, @sub_dept_eff_tll_dt
	END 
	CLOSE crsr
	DEALLOCATE crsr
END
GO

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'MigrateSewadars' AND xtype = 'P')
	DROP PROCEDURE MigrateSewadars
GO

CREATE PROCEDURE MigrateSewadars
(
	@satsang_centre_nm			gnc_nm,
	@satsang_centre_id			satsang_centre_id,
	@photo_dt					SMALLDATETIME
)
WITH ENCRYPTION
AS
	DECLARE
		@sewadar_id					sewadar_id,
		@telephone_from_excel_file	VARCHAR(20),
		@first_nm					VARCHAR(30),
		@middle_nm					VARCHAR(30),
		@last_nm					VARCHAR(30),
		@sewadar_list_id			sewadar_list_id,
		@is_name_overridden			CHAR,
		@gr_no						INT,
		@photo_id					VARCHAR (10),
		@name						VARCHAR(100),
		@gender						CHAR,
		@db_gender					VARCHAR (6),
		@is_local_sewadar			CHAR,
		@is_outstation_sewadar		VARCHAR (3),
		@sewadar_grno               sewadar_grno,
		@status						VARCHAR(30),
		@new_status					VARCHAR(30),
		@sub_department_id			INT,
		@app_dt						DATETIME,
		@department_id				INT,
		@old_sub_department_id		INT,
		@old_department_id			INT,
		@position1					INT,
		@position2					INT,
		@attendance_97				CHAR(1),
		@attendance_98				CHAR(1),
		@attendance_99				CHAR(1),
		@attendance_2k				CHAR(1),
		@attendance_01				CHAR(1),
		@attendance_02				CHAR(1),
		@attendance_03				CHAR(1),
		@attendance_04				CHAR(1),
		@attendance_05				CHAR(1),
		@attendance_06				CHAR(1),
		@attendance_07				CHAR(1),
		@attendance_08				CHAR(1),
		@attendance_09				CHAR(1),
		@attendance_10				CHAR(1),
		@attendance_11				CHAR(1),
		@attendance_12				CHAR(1),
		@sewa_id_97					INT,
		@sewa_id_98					INT,
		@sewa_id_99					INT,
		@sewa_id_2k					INT,
		@sewa_id_01					INT,
		@sewa_id_02					INT,
		@sewa_id_03					INT,
		@sewa_id_04					INT,
		@sewa_id_05					INT,
		@sewa_id_06					INT,
		@sewa_id_07					INT,
		@sewa_id_08					INT,
		@sewa_id_09					INT,
		@sewa_id_10					INT,
		@sewa_id_11					INT,
		@sewa_id_12					INT;

BEGIN

	SELECT	@sewa_id_97	= sewa_id	FROM	sewas	WHERE	sewa_nm = 'Annual Satsang Programme 1997'	AND	satsang_centre_id	= @satsang_centre_id;
	SELECT	@sewa_id_98	= sewa_id	FROM	sewas	WHERE	sewa_nm = 'Annual Satsang Programme 1998'	AND	satsang_centre_id	= @satsang_centre_id;
	SELECT	@sewa_id_99	= sewa_id	FROM	sewas	WHERE	sewa_nm = 'Annual Satsang Programme 1999'	AND	satsang_centre_id	= @satsang_centre_id;
	SELECT	@sewa_id_2k	= sewa_id	FROM	sewas	WHERE	sewa_nm = 'Annual Satsang Programme 2000'	AND	satsang_centre_id	= @satsang_centre_id;
	SELECT	@sewa_id_01	= sewa_id	FROM	sewas	WHERE	sewa_nm = 'Annual Satsang Programme 2001'	AND	satsang_centre_id	= @satsang_centre_id;
	SELECT	@sewa_id_02	= sewa_id	FROM	sewas	WHERE	sewa_nm = 'Annual Satsang Programme 2002'	AND	satsang_centre_id	= @satsang_centre_id;
	SELECT	@sewa_id_03	= sewa_id	FROM	sewas	WHERE	sewa_nm = 'Annual Satsang Programme 2003'	AND	satsang_centre_id	= @satsang_centre_id;
	SELECT	@sewa_id_04	= sewa_id	FROM	sewas	WHERE	sewa_nm = 'Annual Satsang Programme 2004'	AND	satsang_centre_id	= @satsang_centre_id;
	SELECT	@sewa_id_05	= sewa_id	FROM	sewas	WHERE	sewa_nm = 'Annual Satsang Programme 2005'	AND	satsang_centre_id	= @satsang_centre_id;
	SELECT	@sewa_id_06	= sewa_id	FROM	sewas	WHERE	sewa_nm = 'Annual Satsang Programme 2006'	AND	satsang_centre_id	= @satsang_centre_id;
	SELECT	@sewa_id_07	= sewa_id	FROM	sewas	WHERE	sewa_nm = 'Annual Satsang Programme 2007'	AND	satsang_centre_id	= @satsang_centre_id;
	SELECT	@sewa_id_08	= sewa_id	FROM	sewas	WHERE	sewa_nm = 'Annual Satsang Programme 2008'	AND	satsang_centre_id	= @satsang_centre_id;
	SELECT	@sewa_id_09	= sewa_id	FROM	sewas	WHERE	sewa_nm = 'Annual Satsang Programme 2009'	AND	satsang_centre_id	= @satsang_centre_id;
	SELECT	@sewa_id_10	= sewa_id	FROM	sewas	WHERE	sewa_nm = 'Annual Satsang Programme 2010'	AND	satsang_centre_id	= @satsang_centre_id;
	SELECT	@sewa_id_11	= sewa_id	FROM	sewas	WHERE	sewa_nm = 'Annual Satsang Programme 2011'	AND	satsang_centre_id	= @satsang_centre_id;
	SELECT	@sewa_id_12	= sewa_id	FROM	sewas	WHERE	sewa_nm = 'Annual Satsang Programme 2012'	AND	satsang_centre_id	= @satsang_centre_id;

	INSERT INTO generic_sewadar_lists
			(	satsang_centre_id, sewadar_list_nm, sewadar_list_use, sewadar_list_other_use	)
		VALUES
			(	@satsang_centre_id, 'Migrated ' + @satsang_centre_nm + ' Sewadars on ' + CONVERT (VARCHAR, GetDate(), 106) + ' at ' + CONVERT (VARCHAR, GetDate(), 8), 
				'Miscellaneous', 'Migrate Sewadar Records'
			)
	SET @sewadar_list_id = SCOPE_IDENTITY();

	DECLARE crsr CURSOR FOR
		SELECT  LTRIM (RTRIM (m.centre_grno)), LTRIM (RTRIM (m.photo_id)), REPLACE (REPLACE (m.name, '  ', ' '), '  ', ' '), m.is_name_overridden, m.telephone_no, m.is_local_sewadar, m.gender,
				m.department_id, COALESCE (m.sub_department_id, x.sub_dept_id), i.department_id, i.sub_department_id, i.status, i.appointment_dt,
				i.attendance_97, i.attendance_98, i.attendance_99, i.attendance_2k, i.attendance_01, i.attendance_02, i.attendance_03, i.attendance_04, i.attendance_05,
				i.attendance_06, i.attendance_07, i.attendance_08, i.attendance_09, i.attendance_10, i.attendance_11, i.attendance_12
		FROM     mgr_tmp_sewadars m
			JOIN    mgr_centre_sewadars i
				ON  (   m.centre_grno = i.centre_grno
					AND i.is_migrated = 'N'
					AND	m.to_be_migrated = 'Y'
					AND	i.satsang_centre_id = @satsang_centre_id
					AND	i.status		IN	(	'Permanent', 'Retired', 'Non-Initiated'	)
					)
			LEFT JOIN	mgr_sewadars_sub_depts x
				ON	(	x.centre_grno	=	m.centre_grno
					AND	x.dept_id		=	m.department_id
					)
		ORDER BY photo_id;

	OPEN crsr
	FETCH crsr INTO @gr_no, @photo_id , @name, @is_name_overridden, @telephone_from_excel_file, @is_local_sewadar, @gender,
					@department_id, @sub_department_id, @old_department_id, @old_sub_department_id, @status, @app_dt,
					@attendance_97, @attendance_98, @attendance_99, @attendance_2k, @attendance_01, @attendance_02, @attendance_03, @attendance_04, @attendance_05,
					@attendance_06, @attendance_07, @attendance_08, @attendance_09, @attendance_10, @attendance_11, @attendance_12
	WHILE (@@FETCH_STATUS = 0)
	BEGIN
		BEGIN TRAN
			IF (@is_local_sewadar = 'Y')
				SET @is_outstation_sewadar = 'No';
			ELSE
				SET @is_outstation_sewadar = 'Yes';

			IF (@gender = 'G')
				SET @db_gender = 'Male';
			ELSE
				SET @db_gender = 'Female';

			IF (@is_name_overridden = 'Y')
			BEGIN
				SET @position1 = CHARINDEX (' ', @name)
				IF (@position1 > 0)
				BEGIN
					SET @first_nm = LTRIM(RTRIM(SUBSTRING (@name, 1, @position1 - 1)));
					SET @position2 = CHARINDEX (' ', LTRIM(RTRIM(SUBSTRING (@name, @position1 + 1, 100))))
					IF (@position2 > 0)
					BEGIN
						SET @middle_nm = LTRIM(RTRIM(SUBSTRING ( LTRIM(RTRIM(SUBSTRING (@name, @position1 + 1, 100))), 1, @position2 - 1)));
						SET @last_nm = LTRIM(RTRIM(SUBSTRING (@name, @position1 + @position2 + 1, 100)))
					END
				END
			END
			ELSE
				SELECT @first_nm = first_name, @middle_nm = middle_name, @last_nm = surname
				FROM	mgr_centre_sewadars 
				WHERE	centre_grno = @gr_no
				AND		satsang_centre_id = @satsang_centre_id;

			SET @new_status = 'Perm';
			IF (@status = 'Retired')
				SET @status = 'Retd';
			ELSE IF (@status = 'Non-initiated')
				SET @status = 'NI';
			ELSE IF (@status = 'Permanent')
				IF (@app_dt < '01-Jan-2010')
					SET @status = 'Perm';
				ELSE
				BEGIN
					SET @status = 'Temp';
					SET @new_status = 'Temp';
				END
			ELSE
			BEGIN
				SET @new_status = NULL;
				SET @status = NULL;
			END

--		print 'iterating over ' + CONVERT (VARCHAR, @gr_no) + '[' + @photo_id +'] with Name as ' + @first_nm + ' ' + @middle_nm + ' ' + @last_nm
			INSERT INTO sewadars 
					(	first_nm, middle_nm, last_nm, gender, birth_dtm, is_married,
						initiation_dt, initiation_place_id, initiation_by,
						current_satsang_centre_id, current_sewadar_grno, global_sewadar_status_cd, global_sewadar_status_dt
					)
				SELECT	@first_nm, @middle_nm, @last_nm, @db_gender, birth_dtm, CASE is_married WHEN 1 THEN 'Yes' ELSE 'No' END,
						CASE WHEN initiation_place_id IS NOT NULL THEN initiation_dt END, initiation_place_id, CASE WHEN initiation_place_id IS NOT NULL THEN initiation_by END,
						NULL, NULL, NULL, NULL
				FROM	mgr_centre_sewadars
				WHERE	centre_grno = @gr_no
				AND		satsang_centre_id = @satsang_centre_id;
			
			SET @sewadar_id = SCOPE_IDENTITY();
			
			INSERT INTO sewadars_details
					(	sewadar_id, address_proof, other_address_proof_id, telephone_mobile, telephone_residence, telephone_office, occupation,
						attends_weekly_satsang, weekly_satsang_centre_id
					)
			SELECT	@sewadar_id, NULL, NULL, COALESCE (@telephone_from_excel_file, m.telephone_mobile), m.telephone_residence, m.telephone_office, m.occupation,
			CASE m.attends_weekly_satsang WHEN 0 THEN 'No' ELSE (CASE WHEN m.weekly_satsang_centre_id IS NULL THEN NULL ELSE 'Yes' END) END, m.weekly_satsang_centre_id
			FROM	mgr_centre_sewadars m
			WHERE	m.centre_grno = @gr_no
			AND		satsang_centre_id = @satsang_centre_id;
			
			
			INSERT INTO sewadars_addresses
				(	sewadar_id, address_type, address_line_1, address_line_2, post_office_or_city_id, pin_or_zip_code)
				SELECT	@sewadar_id, 'Residence', m.address_line_1, m.address_line_2, m.post_office_or_city_id, m.pin_or_zip_code
				FROM	mgr_centre_sewadars m
				WHERE	m.centre_grno = @gr_no
				AND		satsang_centre_id = @satsang_centre_id
				AND		m.post_office_or_city_id IS NOT NULL;
				
			
			INSERT INTO sewadars_qualifications
					(	sewadar_id, qualification_sq, qualification_id, qlfctn_subject_id	)
				SELECT	@sewadar_id, 1, m.qualification1_id, m.qlfctn_subject1_id
				FROM	mgr_centre_sewadars m
				WHERE	m.centre_grno = @gr_no
				AND		m.qualification1_id IS NOT NULL
				AND		satsang_centre_id = @satsang_centre_id;
			
			INSERT INTO sewadars_qualifications
					(	sewadar_id, qualification_sq, qualification_id, qlfctn_subject_id	)
				SELECT	@sewadar_id, 2, m.qualification2_id, m.qlfctn_subject2_id
				FROM	mgr_centre_sewadars m
				WHERE	m.centre_grno = @gr_no
				AND		m.qualification2_id IS NOT NULL
				AND		satsang_centre_id = @satsang_centre_id;
			
	      	INSERT INTO sewadars_skills
					(	sewadar_id, skill_id, skill_sq	)
	     		SELECT	@sewadar_id, 1, m.skill1_id
	      		FROM	mgr_centre_sewadars m
				WHERE	m.centre_grno = @gr_no
				AND		m.skill1_id IS NOT NULL
				AND		satsang_centre_id = @satsang_centre_id;
			
	      	INSERT INTO sewadars_skills
					(	sewadar_id, skill_id, skill_sq	)
	     		SELECT	@sewadar_id, 2, m.skill2_id
	      		FROM	mgr_centre_sewadars m
				WHERE	m.centre_grno = @gr_no
				AND		m.skill2_id IS NOT NULL
				AND		satsang_centre_id = @satsang_centre_id;
			
	      	INSERT INTO sewadars_skills
					(	sewadar_id, skill_id, skill_sq	)
	     		SELECT	@sewadar_id, 3, m.skill3_id
	      		FROM	mgr_centre_sewadars m
				WHERE	m.centre_grno = @gr_no
				AND		m.skill3_id IS NOT NULL
				AND		satsang_centre_id = @satsang_centre_id;
			
			INSERT INTO sewadars_remarks (sewadar_id, remarks_type, remarks_sq, remarks) VALUES (@sewadar_id, 'Old G.R.No.', 1, @gr_no)
			INSERT INTO sewadars_remarks (sewadar_id, remarks_type, remarks_sq, remarks) VALUES (@sewadar_id, 'Reference', 1, @photo_id)

			If (@is_name_overridden = 'Y')
			BEGIN
				INSERT INTO sewadars_remarks 
						(	sewadar_id, remarks_type, remarks_sq, remarks	) 
					SELECT	@sewadar_id, 'Migration', 1, 'Name change ' + ISNULL(m.first_name + ' ','') + ISNULL(m.middle_name + ' ', '') + ISNULL(m.surname, '') + '=>' + @name
					FROM	mgr_centre_sewadars m
					WHERE	m.centre_grno = @gr_no
					AND		satsang_centre_id = @satsang_centre_id;
			END

				INSERT INTO sewadars_remarks -- 'Unknown occupation is put as Un-employed'
						(	sewadar_id, remarks_type, remarks_sq, remarks	) 
					SELECT	@sewadar_id, 'Migration', 2, m.migration_remark2
					FROM	mgr_centre_sewadars m
					WHERE	m.centre_grno = @gr_no
					AND		m.migration_remark2 IS NOT NULL
					AND		satsang_centre_id = @satsang_centre_id;
						
				INSERT INTO sewadars_remarks -- 'Unknown appointment_dt is put as 1-Feb-2012'
						(	sewadar_id, remarks_type, remarks_sq, remarks	) 
					SELECT	@sewadar_id, 'Migration', 3, m.migration_remark3
					FROM	mgr_centre_sewadars m
					WHERE	m.centre_grno = @gr_no
					AND		m.migration_remark3 IS NOT NULL
					AND		satsang_centre_id = @satsang_centre_id;
						
			EXEC GetSewadarRegistrationNumber @satsang_centre_id,      -- Should be Indore and if part of application, should be the one that is passed as a Parameter to the Application
											@db_gender,                -- Values allowed are Male or Female
											@is_outstation_sewadar,  -- Values allowed are Yes or No
											@sewadar_grno OUTPUT
											
			INSERT INTO sewadars_registrations 
				(	satsang_centre_id, sewadar_grno, sewadar_id, appointment_dt, is_outstation_sewadar,
					department_id, sub_department_id, department_dt, sewadar_status_cd, sewadar_status_dtm,
					responsibility, responsibility_dtm, weekly_sewa_location_id, sewadar_type, sewa_samiti_approver_id
				) 
				SELECT	@satsang_centre_id, @sewadar_grno, @sewadar_id, m.appointment_dt, @is_outstation_sewadar,
						m.department_id, COALESCE (m.sub_department_id, x.sub_dept_id), m.appointment_dt, @new_status, @photo_dt,
						NULL, NULL, NULL, 'R', 3421		--- 3421 is Sewadar ID for Sewa Samiti In-charge Mr. Sewa Ram
				FROM mgr_centre_sewadars m
					LEFT JOIN	mgr_sewadars_sub_depts x
						ON	(	x.centre_grno	=	m.centre_grno
							AND	x.dept_id		=	m.department_id
							)
				WHERE m.centre_grno = @gr_no
				AND		satsang_centre_id = @satsang_centre_id;
			
			IF (@old_department_id != @department_id
					OR (@old_sub_department_id != @sub_department_id)
					OR (@old_sub_department_id IS NOT NULL AND @sub_department_id IS NULL)
					OR (@old_sub_department_id IS NULL AND @sub_department_id IS NOT NULL)
			   )
				INSERT INTO sewadars_transfers
						(	satsang_centre_id, sewadar_grno, effective_dt, old_department_id, old_sub_department_id, department_id, sub_department_id, remarks) 
					VALUES
						(	@satsang_centre_id, @sewadar_grno, CONVERT (VARCHAR (11), GetDate(), 106), @old_department_id, @old_sub_department_id, @department_id, @sub_department_id, 'Migration');
			
			IF (@status != @new_status AND @status IS NOT NULL)
				UPDATE sewadars_registrations 
					SET	sewadar_status_cd	=	@status,
						sewadar_status_dtm	=	GetDate()
				WHERE	satsang_centre_id	=	@satsang_centre_id
				AND		sewadar_grno		=	@sewadar_grno;

			INSERT INTO generic_sewadar_lists_sewadars VALUES (@sewadar_list_id, @satsang_centre_id, @sewadar_grno);
			
			IF (@attendance_97 = 'P')
			BEGIN
				INSERT INTO sewadar_wise_sewa_summaries
						(sewa_id, satsang_centre_id, sewadar_grno, present_cnt, exempt_cnt, leave_cnt, absent_cnt, is_system_recorded )
					VALUES              
						(@sewa_id_97, @satsang_centre_id, @sewadar_grno, 10, 0, 0, 0, 'Yes' );
				INSERT INTO sewadars_txn_ts
						(satsang_centre_id, sewadar_grno, sewa_id, screen_id )
					VALUES
						(@satsang_centre_id, @sewadar_grno, @sewa_id_97, 'ATT_01' );
			END
			IF (@attendance_98 = 'P')
			BEGIN
				INSERT INTO sewadar_wise_sewa_summaries
						(sewa_id, satsang_centre_id, sewadar_grno, present_cnt, exempt_cnt, leave_cnt, absent_cnt, is_system_recorded )
					VALUES              
						(@sewa_id_98, @satsang_centre_id, @sewadar_grno, 10, 0, 0, 0, 'Yes' );
				INSERT INTO sewadars_txn_ts
						(satsang_centre_id, sewadar_grno, sewa_id, screen_id )
					VALUES
						(@satsang_centre_id, @sewadar_grno, @sewa_id_98, 'ATT_01' );
			END
			IF (@attendance_99 = 'P')
			BEGIN
				INSERT INTO sewadar_wise_sewa_summaries
						(sewa_id, satsang_centre_id, sewadar_grno, present_cnt, exempt_cnt, leave_cnt, absent_cnt, is_system_recorded )
					VALUES              
						(@sewa_id_99, @satsang_centre_id, @sewadar_grno, 10, 0, 0, 0, 'Yes' );
				INSERT INTO sewadars_txn_ts
						(satsang_centre_id, sewadar_grno, sewa_id, screen_id )
					VALUES
						(@satsang_centre_id, @sewadar_grno, @sewa_id_99, 'ATT_01' );
			END
			IF (@attendance_2k = 'P')
			BEGIN
				INSERT INTO sewadar_wise_sewa_summaries
						(sewa_id, satsang_centre_id, sewadar_grno, present_cnt, exempt_cnt, leave_cnt, absent_cnt, is_system_recorded )
					VALUES              
						(@sewa_id_2k, @satsang_centre_id, @sewadar_grno, 10, 0, 0, 0, 'Yes' );
				INSERT INTO sewadars_txn_ts
						(satsang_centre_id, sewadar_grno, sewa_id, screen_id )
					VALUES
						(@satsang_centre_id, @sewadar_grno, @sewa_id_2k, 'ATT_01' );
			END
			IF (@attendance_01 = 'P')
			BEGIN
				INSERT INTO sewadar_wise_sewa_summaries
						(sewa_id, satsang_centre_id, sewadar_grno, present_cnt, exempt_cnt, leave_cnt, absent_cnt, is_system_recorded )
					VALUES              
						(@sewa_id_01, @satsang_centre_id, @sewadar_grno, 10, 0, 0, 0, 'Yes' );
				INSERT INTO sewadars_txn_ts
						(satsang_centre_id, sewadar_grno, sewa_id, screen_id )
					VALUES
						(@satsang_centre_id, @sewadar_grno, @sewa_id_01, 'ATT_01' );
			END
			IF (@attendance_02 = 'P')
			BEGIN
				INSERT INTO sewadar_wise_sewa_summaries
						(sewa_id, satsang_centre_id, sewadar_grno, present_cnt, exempt_cnt, leave_cnt, absent_cnt, is_system_recorded )
					VALUES              
						(@sewa_id_02, @satsang_centre_id, @sewadar_grno, 10, 0, 0, 0, 'Yes' );
				INSERT INTO sewadars_txn_ts
						(satsang_centre_id, sewadar_grno, sewa_id, screen_id )
					VALUES
						(@satsang_centre_id, @sewadar_grno, @sewa_id_02, 'ATT_01' );
			END
			IF (@attendance_03 = 'P')
			BEGIN
				INSERT INTO sewadar_wise_sewa_summaries
						(sewa_id, satsang_centre_id, sewadar_grno, present_cnt, exempt_cnt, leave_cnt, absent_cnt, is_system_recorded )
					VALUES              
						(@sewa_id_03, @satsang_centre_id, @sewadar_grno, 10, 0, 0, 0, 'Yes' );
				INSERT INTO sewadars_txn_ts
						(satsang_centre_id, sewadar_grno, sewa_id, screen_id )
					VALUES
						(@satsang_centre_id, @sewadar_grno, @sewa_id_03, 'ATT_01' );
			END
			IF (@attendance_04 = 'P')
			BEGIN
				INSERT INTO sewadar_wise_sewa_summaries
						(sewa_id, satsang_centre_id, sewadar_grno, present_cnt, exempt_cnt, leave_cnt, absent_cnt, is_system_recorded )
					VALUES              
						(@sewa_id_04, @satsang_centre_id, @sewadar_grno, 10, 0, 0, 0, 'Yes' );
				INSERT INTO sewadars_txn_ts
						(satsang_centre_id, sewadar_grno, sewa_id, screen_id )
					VALUES
						(@satsang_centre_id, @sewadar_grno, @sewa_id_04, 'ATT_01' );
			END
			IF (@attendance_05 = 'P')
			BEGIN
				INSERT INTO sewadar_wise_sewa_summaries
						(sewa_id, satsang_centre_id, sewadar_grno, present_cnt, exempt_cnt, leave_cnt, absent_cnt, is_system_recorded )
					VALUES              
						(@sewa_id_05, @satsang_centre_id, @sewadar_grno, 10, 0, 0, 0, 'Yes' );
				INSERT INTO sewadars_txn_ts
						(satsang_centre_id, sewadar_grno, sewa_id, screen_id )
					VALUES
						(@satsang_centre_id, @sewadar_grno, @sewa_id_05, 'ATT_01' );
			END
			IF (@attendance_06 = 'P')
			BEGIN
				INSERT INTO sewadar_wise_sewa_summaries
						(sewa_id, satsang_centre_id, sewadar_grno, present_cnt, exempt_cnt, leave_cnt, absent_cnt, is_system_recorded )
					VALUES              
						(@sewa_id_06, @satsang_centre_id, @sewadar_grno, 10, 0, 0, 0, 'Yes' );
				INSERT INTO sewadars_txn_ts
						(satsang_centre_id, sewadar_grno, sewa_id, screen_id )
					VALUES
						(@satsang_centre_id, @sewadar_grno, @sewa_id_06, 'ATT_01' );
			END
			IF (@attendance_07 = 'P')
			BEGIN
				INSERT INTO sewadar_wise_sewa_summaries
						(sewa_id, satsang_centre_id, sewadar_grno, present_cnt, exempt_cnt, leave_cnt, absent_cnt, is_system_recorded )
					VALUES              
						(@sewa_id_07, @satsang_centre_id, @sewadar_grno, 10, 0, 0, 0, 'Yes' );
				INSERT INTO sewadars_txn_ts
						(satsang_centre_id, sewadar_grno, sewa_id, screen_id )
					VALUES
						(@satsang_centre_id, @sewadar_grno, @sewa_id_07, 'ATT_01' );
			END
			IF (@attendance_08 = 'P')
			BEGIN
				INSERT INTO sewadar_wise_sewa_summaries
						(sewa_id, satsang_centre_id, sewadar_grno, present_cnt, exempt_cnt, leave_cnt, absent_cnt, is_system_recorded )
					VALUES              
						(@sewa_id_08, @satsang_centre_id, @sewadar_grno, 10, 0, 0, 0, 'Yes' );
				INSERT INTO sewadars_txn_ts
						(satsang_centre_id, sewadar_grno, sewa_id, screen_id )
					VALUES
						(@satsang_centre_id, @sewadar_grno, @sewa_id_08, 'ATT_01' );
			END
			IF (@attendance_09 = 'P')
			BEGIN
				INSERT INTO sewadar_wise_sewa_summaries
						(sewa_id, satsang_centre_id, sewadar_grno, present_cnt, exempt_cnt, leave_cnt, absent_cnt, is_system_recorded )
					VALUES              
						(@sewa_id_09, @satsang_centre_id, @sewadar_grno, 10, 0, 0, 0, 'Yes' );
				INSERT INTO sewadars_txn_ts
						(satsang_centre_id, sewadar_grno, sewa_id, screen_id )
					VALUES
						(@satsang_centre_id, @sewadar_grno, @sewa_id_09, 'ATT_01' );
			END
			IF (@attendance_10 = 'P')
			BEGIN
				INSERT INTO sewadar_wise_sewa_summaries
						(sewa_id, satsang_centre_id, sewadar_grno, present_cnt, exempt_cnt, leave_cnt, absent_cnt, is_system_recorded )
					VALUES              
						(@sewa_id_10, @satsang_centre_id, @sewadar_grno, 10, 0, 0, 0, 'Yes' );
				INSERT INTO sewadars_txn_ts
						(satsang_centre_id, sewadar_grno, sewa_id, screen_id )
					VALUES
						(@satsang_centre_id, @sewadar_grno, @sewa_id_10, 'ATT_01' );
			END
			IF (@attendance_11 = 'P')
			BEGIN
				INSERT INTO sewadar_wise_sewa_summaries
						(sewa_id, satsang_centre_id, sewadar_grno, present_cnt, exempt_cnt, leave_cnt, absent_cnt, is_system_recorded )
					VALUES              
						(@sewa_id_11, @satsang_centre_id, @sewadar_grno, 10, 0, 0, 0, 'Yes' );
				INSERT INTO sewadars_txn_ts
						(satsang_centre_id, sewadar_grno, sewa_id, screen_id )
					VALUES
						(@satsang_centre_id, @sewadar_grno, @sewa_id_11, 'ATT_01' );
			END
			IF (@attendance_12 = 'P')
			BEGIN
				INSERT INTO sewadar_wise_sewa_summaries
						(sewa_id, satsang_centre_id, sewadar_grno, present_cnt, exempt_cnt, leave_cnt, absent_cnt, is_system_recorded )
					VALUES              
						(@sewa_id_12, @satsang_centre_id, @sewadar_grno, 10, 0, 0, 0, 'Yes' );
				INSERT INTO sewadars_txn_ts
						(satsang_centre_id, sewadar_grno, sewa_id, screen_id )
					VALUES
						(@satsang_centre_id, @sewadar_grno, @sewa_id_12, 'ATT_01' );
			END

			UPDATE mgr_centre_sewadars
				SET is_migrated = 'Y',
					sewadar_id  = @sewadar_id
			WHERE	centre_grno = @gr_no
			AND		satsang_centre_id = @satsang_centre_id;

			UPDATE	mgr_sewadars_sub_depts
				SET	sewadar_grno	=	@sewadar_grno,
					transfer_dtm	=	GetDate()
			WHERE	centre_grno	= @gr_no
			AND		dept_id		= @department_id
			AND		sub_dept_id = @sub_department_id;

		COMMIT
		FETCH crsr INTO @gr_no, @photo_id , @name, @is_name_overridden, @telephone_from_excel_file, @is_local_sewadar, @gender,
						@department_id, @sub_department_id, @old_department_id, @old_sub_department_id, @status, @app_dt,
						@attendance_97, @attendance_98, @attendance_99, @attendance_2k, @attendance_01, @attendance_02, @attendance_03, @attendance_04, @attendance_05,
						@attendance_06, @attendance_07, @attendance_08, @attendance_09, @attendance_10, @attendance_11, @attendance_12
	END
	CLOSE crsr
	DEALLOCATE crsr

--	END
END
GO


IF EXISTS (SELECT * FROM sysobjects WHERE name = 'FillMgrTmpSewadars' AND xtype = 'P')
	DROP PROCEDURE FillMgrTmpSewadars
GO

CREATE PROCEDURE FillMgrTmpSewadars
(
   @loc VARCHAR(200)
)
WITH ENCRYPTION
AS
BEGIN

exec(
'IF EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = ''#processed'')
	DROP TABLE #processed


CREATE TABLE #processed
(
	old_grno 			INT 			,
	name				VARCHAR (100) 	,
	gender				CHAR (1) 		,
	is_local_sewadar 	CHAR (1) 		,
	department_nm		VARCHAR (100)	,
	sub_department_nm 	VARCHAR (100) 	,
	telephone_no		VARCHAR (50)	,
	photo_id 			VARCHAR (10)		,
	to_be_migrated		CHAR (1)		,
	is_name_overridden 	CHAR (1) 		
);

--EXEC sp_configure ''show advanced options'', 1
--GO
--RECONFIGURE
--GO

INSERT INTO #processed
	(
	old_grno 			,	name	,	gender		,	is_local_sewadar 	,	department_nm  , 	sub_department_nm 	,	telephone_no	,photo_id ,		to_be_migrated,	is_name_overridden 	
	)
	SELECT 
		old_grno 		,	name	,	gender		,	is_local_sewadar 	,	department_nm  , 	sub_department_nm 	,	telephone_no	,photo_id ,		to_be_migrated,	is_name_overridden 	
	FROM OPENROWSET(''Microsoft.Jet.OLEDB.4.0'', ''Excel 8.0;Database='+ @loc +''', ''SELECT * FROM [Sheet1$]'');
--GO


DELETE
FROM mgr_tmp_sewadars


INSERT INTO mgr_tmp_sewadars
	(
	centre_grno 		,	name	,	gender		,	is_local_sewadar 	,	department_nm  , 	sub_department_nm 	,	is_name_overridden 	,	photo_id ,	telephone_no	,	to_be_migrated
	)
	SELECT 
		old_grno 		,	name	,	gender		,	is_local_sewadar 	,	department_nm  , 	sub_department_nm 	,	is_name_overridden 	,	photo_id ,	telephone_no	,	to_be_migrated
	FROM #processed;

DROP TABLE #processed;
')
--------------------------------------------------------------------------------------------------------------------------------------------

END
GO



