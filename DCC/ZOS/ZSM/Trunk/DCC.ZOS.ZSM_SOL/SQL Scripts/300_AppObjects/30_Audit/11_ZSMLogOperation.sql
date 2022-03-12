
IF EXISTS (SELECT 1 FROM SYSOBJECTS WHERE NAME = 'LogOperation' AND TYPE = 'P')
DROP PROCEDURE LogOperation
GO
CREATE	PROCEDURE	LogOperation
(
	@p_session_id				INTEGER,
	@p_package_id				CHAR(3),
	@p_application_id			CHAR (7),
	@p_user_no					INTEGER,			
	@p_user_role_id				VARCHAR (10),
	@p_operation				CHAR (1),
	@p_screen_id				CHAR (6),
	@p_object_id				VARCHAR (50),
	@p_sewadar_id				sewadar_id	=	NULL,
	@p_sewa_id					sewa_id		=	NULL,
	@p_transaction_dt			DATETIME	=	NULL,
	@p_satsang_centre_id		satsang_centre_id = NULL,
	@p_sewadar_grno				sewadar_grno = NULL
)
WITH	ENCRYPTION
AS
	DECLARE
		@audit_log_id				INTEGER,
		@is_insert_logged			CHAR (3),
		@is_update_logged			CHAR (3),
		@is_delete_logged			CHAR (3),
		@is_action_logged			CHAR (3),
		@is_print_logged			CHAR (3),				
		@is_update_changes_logged	CHAR (3),
		@is_delete_changes_logged	CHAR (3)

BEGIN

	DECLARE	@is_query_session	boolean,
			@v_arg_1			VARCHAR (50),
			@v_arg_2			VARCHAR (50),
			@str1				VARCHAR(50),
	        @str2				VARCHAR(50),
	        @str3				VARCHAR(50)

	--EXEC	SysAdmin..ValidateSession	@p_user_no, @p_application_id, @p_session_id, @is_query_session		--- M002: @p_user_id --> @p_user_no

	IF (@@ERROR <> 0)
		RETURN 1

	IF (@is_query_session = 'Yes')
		BEGIN
			EXEC	SysAdmin..RaiseErrorMessage	'NoPrivilege', NULL, 'This session to save; only queries and reports are allowed', NULL, NULL
			RETURN 1
		END

	IF (@p_user_role_id = '' OR @p_user_role_id IS NULL)
		BEGIN
			EXEC	SysAdmin..RaiseErrorMessage	'ValueReqd', NULL, 'User Role ID', NULL, NULL
			RETURN 1
		END

	IF (@p_operation = '' OR @p_operation IS NULL OR @p_operation NOT IN ('A', 'P', 'I', 'U', 'D'))			--- M001: 'P' added in IN list
		BEGIN
			EXEC	SysAdmin..RaiseErrorMessage	'ValueReqd', NULL, 'Correct Type of Operation', NULL, NULL
			RETURN 1
		END

	IF (@p_screen_id = '' OR @p_screen_id IS NULL)
		BEGIN
			EXEC	SysAdmin..RaiseErrorMessage	'ValueReqd', NULL, 'Screen ID', NULL, NULL
			RETURN 1
		END
	SELECT	@is_insert_logged			=	is_insert_logged,
			@is_update_logged			=	is_update_logged,
			@is_delete_logged			=	is_delete_logged,
			@is_action_logged			=	is_action_logged,
			@is_print_logged			=	is_print_logged,
			@is_update_changes_logged	=	is_update_changes_logged,
			@is_delete_changes_logged	=	is_delete_changes_logged
	FROM	SysAdmin..application_screen_audits
	WHERE	application_id	=	@p_application_id
	AND		screen_id		=	@p_screen_id

	IF (@@ROWCOUNT = 0)
	BEGIN
		SET	@v_arg_1 = 'Screen ID (' + @p_screen_id + ')'
		SET	@v_arg_2 = 'Application ID (' + @p_application_id + ')'
		EXEC	SysAdmin..RaiseErrorMessage	'MisMatchInfo', NULL, @v_arg_1, @v_arg_2, NULL
		RETURN 1
	END

	IF	(	(@p_operation = 'I' AND @is_insert_logged = 'Yes')
		OR	(@p_operation = 'U' AND @is_update_logged = 'Yes')
		OR	(@p_operation = 'D' AND @is_delete_logged = 'Yes')
		OR	(@p_operation = 'A' AND @is_action_logged = 'Yes')
		OR	(@p_operation = 'P' AND @is_print_logged = 'Yes')
		)
	BEGIN
		INSERT	INTO	audit_logs
			(	session_id, application_id, user_no, user_role_id, operation, screen_id,
				object_id, sewadar_id, sewa_id, transaction_dt, satsang_centre_id, sewadar_grno
			)
		VALUES
			(	@p_session_id, @p_application_id, @p_user_no, @p_user_role_id, @p_operation, @p_screen_id,		---- M002: @p_user_id --> @p_user_no
				@p_object_id, @p_sewadar_id, @p_sewa_id, @p_transaction_dt, @p_satsang_centre_id, @p_sewadar_grno
			)
		SET	@audit_log_id = SCOPE_IDENTITY();

		IF 	(@p_operation = 'A')
		BEGIN
			IF (@p_screen_id = 'ACT_19' AND @p_object_id LIKE '%Process%')
			BEGIN
				INSERT INTO	adt_scanned_badges
					SELECT	@audit_log_id, b.scanning_sub_job_id, b.controlling_dt, b.satsang_centre_id, b.sewadar_grno, b.scanned_dtm
					FROM	scanned_badges	b
						JOIN	scanning_sub_jobs	j
							ON	(	j.scanning_job_id		=	@p_sewa_id
								AND	b.scanning_sub_job_id	=	j.scanning_sub_job_id
								AND	b.controlling_dt		<=	@p_transaction_dt
								);
			END
		END
		ELSE IF (	(@p_operation = 'U' AND @is_update_changes_logged = 'Yes')
				OR	(@p_operation = 'D' AND @is_delete_changes_logged = 'Yes')
				)
		BEGIN
			IF(@p_screen_id = 'ENT_06')   --colours   
			BEGIN			
				INSERT INTO adt_colours
				(
					audit_log_id,colour_id,colour_nm,red_component,green_component,blue_component,remarks,effective_from,effective_till					
				)
				SELECT @audit_log_id,colour_id,colour_nm,red_component,green_component,blue_component,remarks,effective_from,effective_till					
				FROM colours
				WHERE colour_id = @p_object_id
			END			
			ELSE IF(@p_screen_id = 'ENT_11')   --satsang centre details
			BEGIN
				INSERT INTO adt_satsang_centres_details
				(
					audit_log_id,satsang_centre_id,is_main_centre,centre_nm,centre_alphabet,centre_cd,reports_to_centre_id,colour_id,remarks,secretary_signature
				)
				SELECT @audit_log_id,satsang_centre_id,is_main_centre,centre_nm,centre_alphabet,centre_cd,reports_to_centre_id,colour_id,remarks,secretary_signature
				FROM satsang_centres_details
				WHERE satsang_centre_id = @p_object_id				
				
			END		
			ELSE IF(@p_screen_id = 'ENT_15')   --departments
			BEGIN
				INSERT INTO adt_departments
				(
					audit_log_id,department_id,department_cd,department_nm,colour_id,has_sub_departments,remarks
				)
				SELECT @audit_log_id,department_id,department_cd,department_nm,colour_id,has_sub_departments,remarks
				FROM departments
				WHERE department_id = @p_object_id
				
				INSERT INTO adt_sub_departments
				(
					audit_log_id,sub_department_id,department_id,sub_department_cd,sub_department_nm,remarks
				)
				SELECT @audit_log_id,sub_department_id,department_id,sub_department_cd,sub_department_nm,remarks
				FROM sub_departments
				WHERE department_id = @p_object_id
				
				INSERT INTO adt_departments_satsang_centres
				(
					audit_log_id,department_id,satsang_centre_id,genders_allowed,is_common_roster,is_generic,is_weekly,sub_department_mandatory,effective_from,effective_till
				)
				SELECT @audit_log_id,department_id,satsang_centre_id,genders_allowed,is_common_roster,is_generic,is_weekly,sub_department_mandatory,effective_from,effective_till
				FROM departments_satsang_centres
				WHERE department_id = @p_object_id
				
				INSERT INTO adt_sub_departments_satsang_centres
				(
					audit_log_id,sub_department_id,satsang_centre_id,effective_from,effective_till
				)
				SELECT @audit_log_id,sub_department_id,satsang_centre_id,effective_from,effective_till
				FROM sub_departments_satsang_centres
				WHERE sub_department_id = (select sub_department_id from departments where department_id = @p_object_id)				
				
			END														
			ELSE IF(@p_screen_id = 'STP_02')   --credit specifications
			BEGIN
				INSERT INTO adt_credit_specifications
				(
					audit_log_id,credit_specification_id,credit_specification_nm,credit_specification_dt,satsang_centre_id,last_appointment_dt,credit_group_nm,is_uniform_specification,is_outstation_sewadar,credit_cnt,unit_cnt,is_exemption_considered,presence_sewa_id,min_credit_cnt,specification_ts,computation_ts,is_finally_used
				)
				SELECT @audit_log_id,credit_specification_id,credit_specification_nm,credit_specification_dt,satsang_centre_id,last_appointment_dt,credit_group_nm,is_uniform_specification,is_outstation_sewadar,credit_cnt,unit_cnt,is_exemption_considered,presence_sewa_id,min_credit_cnt,specification_ts,computation_ts,is_finally_used
				FROM credit_specifications
				WHERE credit_specification_id = @p_object_id
				
				INSERT INTO adt_credit_specifications_sewas
				(
					audit_log_id,credit_specification_id,sewa_id,credit_cnt,unit_cnt,is_exemption_considered,min_credit_cnt,max_credit_cnt
				)
				SELECT @audit_log_id,credit_specification_id,sewa_id,credit_cnt,unit_cnt,is_exemption_considered,min_credit_cnt,max_credit_cnt
				FROM credit_specifications_sewas
				WHERE credit_specification_id = @p_object_id
			END												
			
			ELSE IF(@p_screen_id = 'ACT_01') --sewadars
			BEGIN
				INSERT INTO adt_sewadars
				(
					audit_log_id, sewadar_id, first_nm, middle_nm, last_nm, gender, birth_dtm, is_married, initiation_dt, initiation_place_id, initiation_by, current_satsang_centre_id, current_sewadar_grno, global_sewadar_status_cd, global_sewadar_status_dt
				)
				SELECT @audit_log_id, sewadar_id, first_nm, middle_nm, last_nm, gender, birth_dtm, is_married, initiation_dt, initiation_place_id, initiation_by, current_satsang_centre_id, current_sewadar_grno, global_sewadar_status_cd, global_sewadar_status_dt
				FROM sewadars
				WHERE sewadar_id = @p_object_id
				/*
				INSERT INTO ZSM_Photos..adt_sewadars_photos
				(
					audit_log_id, sewadar_id, sewadar_photo, photo_dt
				)
				SELECT @audit_log_id, sewadar_id, sewadar_photo, photo_dt
				FROM ZSM_Photos..sewadars_photos
				WHERE sewadar_id = @p_object_id
				*/
			END
			ELSE IF(@p_screen_id = 'ACT_02') --sewadar details
			BEGIN
				INSERT INTO adt_sewadars_details
				(
					audit_log_id, address_proof, other_address_proof_id, sewadar_id, telephone_mobile, telephone_residence, telephone_office, occupation, attends_weekly_satsang, weekly_satsang_centre_id, has_hypertension, is_diabetic, has_skin_problem, has_epillepsy
				)
				SELECT @audit_log_id, address_proof, other_address_proof_id, sewadar_id, telephone_mobile, telephone_residence, telephone_office, occupation, attends_weekly_satsang, weekly_satsang_centre_id, has_hypertension, is_diabetic, has_skin_problem, has_epillepsy
				FROM sewadars_details
				WHERE sewadar_id = @p_object_id
				INSERT INTO adt_sewadars_qualifications
				(
					audit_log_id, sewadar_id, qualification_sq, qualification_id, qlfctn_subject_id
				)
				SELECT @audit_log_id, sewadar_id, qualification_sq, qualification_id, qlfctn_subject_id
				FROM sewadars_qualifications
				WHERE sewadar_id = @p_object_id
				INSERT INTO adt_sewadars_remarks
				(
					audit_log_id, sewadar_id, remarks_type, remarks_sq, remarks
				)
				SELECT @audit_log_id, sewadar_id, remarks_type, remarks_sq, remarks
				FROM sewadars_remarks
				WHERE sewadar_id = @p_object_id
				INSERT INTO adt_sewadars_skills
				(
					audit_log_id, sewadar_id, skill_id, skill_sq
				)
				SELECT @audit_log_id, sewadar_id, skill_id, skill_sq
				FROM sewadars_skills
				WHERE sewadar_id = @p_object_id
				INSERT INTO adt_sewadars_other_disabilities
				(
					audit_log_id, sewadar_id, medical_disability_id, medical_disability_sq
				)
				SELECT @audit_log_id, sewadar_id, medical_disability_id, medical_disability_sq
				FROM sewadars_other_disabilities
				WHERE sewadar_id = @p_object_id
				INSERT INTO adt_sewadars_addresses
				(
					audit_log_id, sewadar_id, address_type, address_line_1, address_line_2, post_office_or_city_id, pin_or_zip_code
				)
				SELECT @audit_log_id, sewadar_id, address_type, address_line_1, address_line_2, post_office_or_city_id, pin_or_zip_code
				FROM sewadars_addresses 
				WHERE sewadar_id = @p_object_id AND address_type = 'Residence'
			END
			ELSE IF(@p_screen_id = 'ACT_03') --sewadar informations
			BEGIN
				select @str2 = RIGHT(@p_object_id, LEN(@p_object_id) - CHARINDEX('|', @p_object_id))
				select @str1 = LEFT(@p_object_id, CHARINDEX('|', @p_object_id)-1)
				
				INSERT INTO adt_sewadars_registrations
				(
					audit_log_id, satsang_centre_id, sewadar_grno, sewadar_id, appointment_dt, is_outstation_sewadar, department_id, sub_department_id, department_dt, sewadar_status_cd, sewadar_status_dtm, responsibility, responsibility_dtm, reference_1_sewadar_id, reference_1_relationship, reference_1_nm, reference_1_centre_id, reference_1_department, reference_2_sewadar_id, reference_2_relationship, reference_2_nm, reference_2_centre_id, reference_2_department, sponsorer_id, area_secretary_id, secretary_id, security_approver_id, sewa_samiti_approver_id, weekly_sewa_location_id, weekly_department_id, sewadar_type
				)
				SELECT 	@audit_log_id, satsang_centre_id, sewadar_grno, sewadar_id, appointment_dt, is_outstation_sewadar, department_id, sub_department_id, department_dt, sewadar_status_cd, sewadar_status_dtm, responsibility, responsibility_dtm, reference_1_sewadar_id, reference_1_relationship, reference_1_nm, reference_1_centre_id, reference_1_department, reference_2_sewadar_id, reference_2_relationship, reference_2_nm, reference_2_centre_id, reference_2_department, sponsorer_id, area_secretary_id, secretary_id, security_approver_id, sewa_samiti_approver_id, weekly_sewa_location_id, weekly_department_id, sewadar_type
				FROM sewadars_registrations
				WHERE satsang_centre_id = @str1 AND sewadar_grno = @str2
				
			END
			ELSE IF(@p_screen_id = 'ACT_04') -- particulars
			BEGIN
				EXEC ParsePipeSeparatedThreeArgs @p_object_id, @str1 OUTPUT, @str2 OUTPUT, @str3 OUTPUT
				INSERT INTO adt_sewadars_particulars
				(
					audit_log_id, satsang_centre_id, sewadar_grno
				)
				SELECT @audit_log_id, satsang_centre_id, sewadar_grno
				FROM sewadars_particulars
				WHERE satsang_centre_id = @str2 AND sewadar_grno = @str1
				INSERT INTO adt_sewadars_attributes
				(
					audit_log_id, satsang_centre_id, sewadar_grno, attribute_id, boolean_value, date_value, int_value, number_value, list_value, string_value, remarks, effective_from, effective_till
				)
				SELECT @audit_log_id, satsang_centre_id, sewadar_grno, attribute_id, boolean_value, date_value, int_value, number_value, list_value, string_value, remarks, effective_from, effective_till
				FROM sewadars_attributes
				WHERE satsang_centre_id = @str2 AND sewadar_grno = @str1
			END
			ELSE IF(@p_screen_id = 'ACT_05')
			BEGIN				
				INSERT INTO adt_sewadars_transfers
				(
					audit_log_id, satsang_centre_id, sewadar_grno, effective_dt, old_department_id, old_sub_department_id, department_id, sub_department_id, remarks
				)
				SELECT 	@audit_log_id, satsang_centre_id, sewadar_grno, effective_dt, old_department_id, old_sub_department_id, department_id, sub_department_id, remarks
				FROM adt_sewadars_transfers
				WHERE satsang_centre_id = @p_satsang_centre_id AND sewadar_grno = @p_sewadar_grno AND effective_dt = @p_transaction_dt
			END
			--ELSE IF(@p_screen_id = 'ACT_06')
			--BEGIN
			--	select @str2 = RIGHT(@p_object_id, LEN(@p_object_id) - CHARINDEX('|', @p_object_id))
			--	select @str1 = LEFT(@p_object_id, CHARINDEX('|', @p_object_id)-1)
			--	INSERT INTO adt_SEWADA
			--	(
			--		audit_log_id, satsang_centre_id, sewadar_grno, effective_dt, old_department_id, old_sub_department_id, department_id, sub_department_id, remarks
			--	)
			--	SELECT 	@audit_log_id, old_satsang_centre_id,old_sewadar_grno,satsang_centre_id,sewadar_grno,effective_dt,remarks
			--	FROM sewadars_satsang_centre_transfers
			--	WHERE satsang_centre_id = @str1 AND sewadar_grno = @str2 
			--END
			--ELSE IF(@p_screen_id = 'ACT_07')
			--BEGIN
			--	select @str3 = RIGHT(@p_object_id, LEN(@p_object_id) - CHARINDEX('|', @p_object_id))
			--	select @str1 = LEFT(@p_object_id, CHARINDEX('|', @p_object_id)-1)
			--	INSERT INTO adt
			--	(
			--		audit_log_id, satsang_centre_id, sewadar_grno, effective_dt, old_department_id, old_sub_department_id, department_id, sub_department_id, remarks
			--	)
			--	SELECT 	@audit_log_id, satsang_centre_id, sewadar_grno, effective_dt, old_department_id, old_sub_department_id, department_id, sub_department_id, remarks
			--	FROM adt_sewadars_transfers
			--	WHERE satsang_centre_id = @str1 AND sewadar_grno = @str2 AND effective_dt = @str3
			--END
			--ELSE IF(@p_screen_id = 'ACT_08')
			--BEGIN
			--	select @str3 = RIGHT(@p_object_id, LEN(@p_object_id) - CHARINDEX('|', @p_object_id))
			--	select @str1 = LEFT(@p_object_id, CHARINDEX('|', @p_object_id)-1)
			--	INSERT INTO adt_sewadars_transfers
			--	(
			--		audit_log_id, satsang_centre_id, sewadar_grno, effective_dt, old_department_id, old_sub_department_id, department_id, sub_department_id, remarks
			--	)
			--	SELECT 	@audit_log_id, satsang_centre_id, sewadar_grno, effective_dt, old_department_id, old_sub_department_id, department_id, sub_department_id, remarks
			--	FROM adt_sewadars_transfers
			--	WHERE satsang_centre_id = @str1 AND sewadar_grno = @str2 AND effective_dt = @str3
			--END
			--ELSE IF(@p_screen_id = 'ACT_09')
			--BEGIN
			--	select @str3 = RIGHT(@p_object_id, LEN(@p_object_id) - CHARINDEX('|', @p_object_id))
			--	select @str1 = LEFT(@p_object_id, CHARINDEX('|', @p_object_id)-1)
			--	INSERT INTO adt_sewadars_transfers
			--	(
			--		audit_log_id, satsang_centre_id, sewadar_grno, effective_dt, old_department_id, old_sub_department_id, department_id, sub_department_id, remarks
			--	)
			--	SELECT 	@audit_log_id, satsang_centre_id, sewadar_grno, effective_dt, old_department_id, old_sub_department_id, department_id, sub_department_id, remarks
			--	FROM adt_sewadars_transfers
			--	WHERE satsang_centre_id = @str1 AND sewadar_grno = @str2 AND effective_dt = @str3
			--END
			--ELSE IF(@p_screen_id = 'ACT_10')
			--BEGIN
			--	select @str3 = RIGHT(@p_object_id, LEN(@p_object_id) - CHARINDEX('|', @p_object_id))
			--	select @str1 = LEFT(@p_object_id, CHARINDEX('|', @p_object_id)-1)
			--	INSERT INTO adt_sewadars_transfers
			--	(
			--		audit_log_id, satsang_centre_id, sewadar_grno, effective_dt, old_department_id, old_sub_department_id, department_id, sub_department_id, remarks
			--	)
			--	SELECT 	@audit_log_id, satsang_centre_id, sewadar_grno, effective_dt, old_department_id, old_sub_department_id, department_id, sub_department_id, remarks
			--	FROM adt_sewadars_transfers
			--	WHERE satsang_centre_id = @str1 AND sewadar_grno = @str2 AND effective_dt = @str3
			--END
			--ELSE IF(@p_screen_id = 'ACT_11')
			--BEGIN
			--	select @str3 = RIGHT(@p_object_id, LEN(@p_object_id) - CHARINDEX('|', @p_object_id))
			--	select @str1 = LEFT(@p_object_id, CHARINDEX('|', @p_object_id)-1)
			--	INSERT INTO adt_sewadars_transfers
			--	(
			--		audit_log_id, satsang_centre_id, sewadar_grno, effective_dt, old_department_id, old_sub_department_id, department_id, sub_department_id, remarks
			--	)
			--	SELECT 	@audit_log_id, satsang_centre_id, sewadar_grno, effective_dt, old_department_id, old_sub_department_id, department_id, sub_department_id, remarks
			--	FROM adt_sewadars_transfers
			--	WHERE satsang_centre_id = @str1 AND sewadar_grno = @str2 AND effective_dt = @str3
			--END			
			ELSE IF(@p_screen_id = 'ACT_12')
			BEGIN
				INSERT INTO adt_generic_sewadar_lists
				(
					audit_log_id, sewadar_list_id, satsang_centre_id, sewadar_list_nm, sewadar_list_use, sewadar_list_other_use, other_satsang_centre_sewadars, is_other_satsang_centre, is_editing_allowed, remarks, generated_dtm, report_nm, session_id, is_for_export, exported_dtm, programme_satsang_centre_id
				)
				SELECT @audit_log_id, sewadar_list_id, satsang_centre_id, sewadar_list_nm, sewadar_list_use, sewadar_list_other_use, other_satsang_centre_sewadars, is_other_satsang_centre, is_editing_allowed, remarks, generated_dtm, report_nm, session_id, is_for_export, exported_dtm, programme_satsang_centre_id
				FROM generic_sewadar_lists
				WHERE sewadar_list_id = @p_object_id
			END
			ELSE IF(@p_screen_id = 'ACT_14')
			BEGIN
				EXEC ParsePipeSeparatedThreeArgs @p_object_id, @str1 OUTPUT, @str2 OUTPUT, @str3 OUTPUT
				INSERT INTO adt_generic_sewadar_lists_sewadars
				(
					audit_log_id, sewadar_list_id, satsang_centre_id, sewadar_grno
				)
				SELECT @audit_log_id, sewadar_list_id, satsang_centre_id, sewadar_grno
				FROM generic_sewadar_lists_sewadars
				WHERE sewadar_list_id = @str1 AND satsang_centre_id = @str2 AND sewadar_grno = @str3
			END
			ELSE IF(@p_screen_id = 'ACT_13')
			BEGIN
				INSERT INTO adt_sewadars
				(
					audit_log_id, sewadar_id, first_nm, middle_nm, last_nm, gender, birth_dtm, is_married, initiation_dt, initiation_place_id, initiation_by, current_satsang_centre_id, current_sewadar_grno, global_sewadar_status_cd, global_sewadar_status_dt
				)
				SELECT @audit_log_id, sewadar_id, first_nm, middle_nm, last_nm, gender, birth_dtm, is_married, initiation_dt, initiation_place_id, initiation_by, current_satsang_centre_id, current_sewadar_grno, global_sewadar_status_cd, global_sewadar_status_dt
				FROM sewadars
				WHERE sewadar_id = @p_object_id
				INSERT INTO adt_sewadars_details
				(
					audit_log_id, address_proof, other_address_proof_id, sewadar_id, telephone_mobile, telephone_residence, telephone_office, occupation, attends_weekly_satsang, weekly_satsang_centre_id, has_hypertension, is_diabetic, has_skin_problem, has_epillepsy
				)
				SELECT @audit_log_id, address_proof, other_address_proof_id, sewadar_id, telephone_mobile, telephone_residence, telephone_office, occupation, attends_weekly_satsang, weekly_satsang_centre_id, has_hypertension, is_diabetic, has_skin_problem, has_epillepsy
				FROM sewadars_details
				WHERE sewadar_id = @p_object_id
				INSERT INTO adt_sewadars_qualifications
				(
					audit_log_id, sewadar_id, qualification_sq, qualification_id, qlfctn_subject_id
				)
				SELECT @audit_log_id, sewadar_id, qualification_sq, qualification_id, qlfctn_subject_id
				FROM sewadars_qualifications
				WHERE sewadar_id = @p_object_id
				INSERT INTO adt_sewadars_remarks
				(
					audit_log_id, sewadar_id, remarks_type, remarks_sq, remarks
				)
				SELECT @audit_log_id, sewadar_id, remarks_type, remarks_sq, remarks
				FROM sewadars_remarks
				WHERE sewadar_id = @p_object_id
				INSERT INTO adt_sewadars_skills
				(
					audit_log_id, sewadar_id, skill_id, skill_sq
				)
				SELECT @audit_log_id, sewadar_id, skill_id, skill_sq
				FROM sewadars_skills
				WHERE sewadar_id = @p_object_id
				INSERT INTO adt_sewadars_other_disabilities
				(
					audit_log_id, sewadar_id, medical_disability_id, medical_disability_sq
				)
				SELECT @audit_log_id, sewadar_id, medical_disability_id, medical_disability_sq
				FROM sewadars_other_disabilities
				WHERE sewadar_id = @p_object_id
				INSERT INTO adt_sewadars_addresses
				(
					audit_log_id, sewadar_id, address_type, address_line_1, address_line_2, post_office_or_city_id, pin_or_zip_code
				)
				SELECT @audit_log_id, sewadar_id, address_type, address_line_1, address_line_2, post_office_or_city_id, pin_or_zip_code
				FROM sewadars_addresses 
				WHERE sewadar_id = @p_object_id
				INSERT INTO adt_sewadars_registrations
				(
					audit_log_id, satsang_centre_id, sewadar_grno, sewadar_id, appointment_dt, is_outstation_sewadar, department_id, sub_department_id, department_dt, sewadar_status_cd, sewadar_status_dtm, responsibility, responsibility_dtm, reference_1_sewadar_id, reference_1_relationship, reference_1_nm, reference_1_centre_id, reference_1_department, reference_2_sewadar_id, reference_2_relationship, reference_2_nm, reference_2_centre_id, reference_2_department, sponsorer_id, area_secretary_id, secretary_id, security_approver_id, sewa_samiti_approver_id, weekly_sewa_location_id, weekly_department_id
				)
				SELECT 	@audit_log_id, satsang_centre_id, sewadar_grno, sewadar_id, appointment_dt, is_outstation_sewadar, department_id, sub_department_id, department_dt, sewadar_status_cd, sewadar_status_dtm, responsibility, responsibility_dtm, reference_1_sewadar_id, reference_1_relationship, reference_1_nm, reference_1_centre_id, reference_1_department, reference_2_sewadar_id, reference_2_relationship, reference_2_nm, reference_2_centre_id, reference_2_department, sponsorer_id, area_secretary_id, secretary_id, security_approver_id, sewa_samiti_approver_id, weekly_sewa_location_id, weekly_department_id
				FROM sewadars_registrations
				WHERE sewadar_id = @p_object_id
				INSERT INTO ZSM_Photos..adt_sewadars_photos
				(
					audit_log_id, sewadar_id, sewadar_photo, photo_dt
				)
				SELECT @audit_log_id, sewadar_id, sewadar_photo, photo_dt
				FROM ZSM_Photos..sewadars_photos
				WHERE sewadar_id = @p_object_id
			END
			ELSE IF(@p_screen_id = 'ACT_19')
			BEGIN
				EXEC ParsePipeSeparatedTwoArgs @p_object_id, @str1 OUTPUT, @str2 OUTPUT
				INSERT INTO adt_scanning_jobs_controlling_dates
				(
					audit_log_id, scanning_job_id, controlling_dt, last_transfer_dtm, total_processed_cnt, is_closed
				)
				SELECT @audit_log_id, scanning_job_id, controlling_dt, last_transfer_dtm, total_processed_cnt, is_closed
				FROM scanning_jobs_controlling_dates
				WHERE scanning_job_id = @str1 AND controlling_dt = @str2
			END
			ELSE IF(@p_screen_id = 'ACT_21')
			BEGIN
				EXEC ParsePipeSeparatedTwoArgs @p_object_id, @str1 OUTPUT, @str2 OUTPUT
				INSERT INTO adt_scanning_jobs_controlling_dates
				(
					audit_log_id, scanning_job_id, controlling_dt, last_transfer_dtm, total_processed_cnt, is_closed
				)
				SELECT @audit_log_id, scanning_job_id, controlling_dt, last_transfer_dtm, total_processed_cnt, is_closed
				FROM scanning_jobs_controlling_dates
				WHERE scanning_job_id = @str1 AND controlling_dt = @str2
			END
			ELSE IF(@p_screen_id = 'STP_01')   -- badge templates
			BEGIN
				INSERT INTO adt_badge_templates
				(
					audit_log_id, badge_template_id, badge_template_nm, badge_shape, information_type, foreground_colour_control, foreground_colour_id, background_colour_control, background_colour_id, top_line_font_size, top_line_part_1_type, top_line_part_1_text, top_line_parts_separator, top_line_part_2_type, top_line_part_2_text, middle_line_font_size, middle_line_part_1_type, middle_line_part_1_text, middle_line_parts_separator, middle_line_part_2_type, middle_line_part_2_text, bottom_line_font_size, bottom_line_part_1_type, bottom_line_part_1_text, bottom_line_parts_separator, bottom_line_part_2_type, bottom_line_part_2_text, expiry_year, is_expiry_year_check, are_outstation_sewadars_allowed, report_file_nm_front, report_file_nm_back, procedure_nm_front, procedure_nm_back
				)
				SELECT @audit_log_id, badge_template_id, badge_template_nm, badge_shape, information_type, foreground_colour_control, foreground_colour_id, background_colour_control, background_colour_id, top_line_font_size, top_line_part_1_type, top_line_part_1_text, top_line_parts_separator, top_line_part_2_type, top_line_part_2_text, middle_line_font_size, middle_line_part_1_type, middle_line_part_1_text, middle_line_parts_separator, middle_line_part_2_type, middle_line_part_2_text, bottom_line_font_size, bottom_line_part_1_type, bottom_line_part_1_text, bottom_line_parts_separator, bottom_line_part_2_type, bottom_line_part_2_text, expiry_year, is_expiry_year_check, are_outstation_sewadars_allowed, report_file_nm_front, report_file_nm_back, procedure_nm_front, procedure_nm_back
				FROM badge_templates
				WHERE badge_template_id = @p_object_id
			END
			ELSE IF(@p_screen_id = 'ENT_16')
			BEGIN
				INSERT INTO adt_medical_disabilities
				(
					audit_log_id, medical_disability_id, medical_disability_nm, medical_disability_cd, effective_from, effective_till 
				)
				SELECT @audit_log_id, medical_disability_id, medical_disability_nm, medical_disability_cd, effective_from, effective_till 
				FROM medical_disabilities
			END
			ELSE IF(@p_screen_id = 'STP_03')
			BEGIN
				INSERT INTO adt_sewas
				(
					audit_log_id, sewa_id, satsang_centre_id, sewa_cd, sewa_nm, start_dt, finish_dt, is_satsang_programme, is_scanner_used, is_leave_allowed, is_exemption_allowed, is_default_sewa, sewa_frequency, attendance_unit, attendance_marking, min_sewa_duration, max_sewa_duration, gents_born_after, ladies_born_after, referred_sewa_id, attendance_ts, summary_ts, deleted_ts, locked_dtm
				)
				SELECT @audit_log_id, sewa_id, satsang_centre_id, sewa_cd, sewa_nm, start_dt, finish_dt, is_satsang_programme, is_scanner_used, is_leave_allowed, is_exemption_allowed, is_default_sewa, sewa_frequency, attendance_unit, attendance_marking, min_sewa_duration, max_sewa_duration, gents_born_after, ladies_born_after, referred_sewa_id, attendance_ts, summary_ts, deleted_ts, locked_dtm
				FROM sewas
				WHERE sewa_id = @p_object_id
				INSERT INTO adt_sewas_satsang_centres
				(
					audit_log_id, sewa_id, satsang_centre_id
				)
				SELECT 	@audit_log_id, sewa_id, satsang_centre_id
				FROM sewas_satsang_centres
				WHERE sewa_id = @p_object_id
				INSERT INTO adt_sewas_sewa_shifts
				(
					audit_log_id, sewa_id, sewa_shift, sewa_shift_sq, credit_cnt, unit_cnt
				)
				SELECT 
					@audit_log_id, sewa_id, sewa_shift, sewa_shift_sq, credit_cnt, unit_cnt
				FROM sewas_sewa_shifts
				WHERE sewa_id = @p_object_id
				INSERT INTO adt_sewas_periods
				(
					audit_log_id, sewa_id, start_dt, finish_dt
				)
				SELECT @audit_log_id, sewa_id, start_dt, finish_dt
				FROM sewas_periods
				WHERE sewa_id = @p_object_id

				
			END
			ELSE IF(@p_screen_id = 'STP_04')
			BEGIN
				INSERT INTO adt_scanning_jobs
				(
					audit_log_id, scanning_job_id, satsang_centre_id, scanning_job_nm, scanning_job_type_cd, remarks, effective_from, effective_till, sewadar_list_id, sewa_id, is_deleting_allowed, status_system_info_cd, last_transfer_dtm, total_processed_cnt, is_closed, is_concluded
				)
				SELECT @audit_log_id, scanning_job_id, satsang_centre_id, scanning_job_nm, scanning_job_type_cd, remarks, effective_from, effective_till, sewadar_list_id, sewa_id, is_deleting_allowed, status_system_info_cd, last_transfer_dtm, total_processed_cnt, is_closed, is_concluded
				FROM scanning_jobs
				WHERE scanning_job_id = @p_object_id
				INSERT INTO adt_scanning_sub_jobs
				(
					audit_log_id, scanning_sub_job_id, scanning_job_id, scanning_sub_job_nm, scanning_sub_job_sq
				)
				SELECT	@audit_log_id, scanning_sub_job_id, scanning_job_id, scanning_sub_job_nm, scanning_sub_job_sq
				FROM scanning_sub_jobs
				WHERE scanning_job_id = @p_object_id
				INSERT INTO adt_scanning_jobs_periods
				(
					audit_log_id, scanning_job_id, effective_from, effective_till
				)
				SELECT @audit_log_id, scanning_job_id, effective_from, effective_till
				FROM scanning_jobs_periods
				WHERE scanning_job_id = @p_object_id
				
			END
			ELSE IF(@p_screen_id = 'STP_05')
			BEGIN
				INSERT INTO adt_sewa_teams
				(
					audit_log_id, sewa_team_id, sewa_team_nm, team_description, sewa_id, acceptance_ts
				)
				SELECT @audit_log_id, sewa_team_id, sewa_team_nm, team_description, sewa_id, acceptance_ts
				FROM sewa_teams
				WHERE sewa_team_id = @p_object_id
			END
			ELSE IF(@p_screen_id = 'STP_06')
			BEGIN
				INSERT INTO adt_system_information_values
				(
					audit_log_id, system_info_cd, value_int, value_varchar, value_dt, value_dtm
				)
				SELECT @audit_log_id, system_info_cd, value_int, value_varchar, value_dt, value_dtm
				FROM system_information_values
				WHERE system_info_cd = @p_object_id
				INSERT INTO adt_system_information_codes
				(
					audit_log_id, system_info_cd, system_info_nm, remarks
				)
				SELECT @audit_log_id, system_info_cd, system_info_nm, remarks
				FROM system_information_codes
				WHERE system_info_cd = @p_object_id
			END			
			ELSE IF(@p_screen_id = 'STP_08')    --GENERIC ATTRIBUTES
			BEGIN
				INSERT INTO adt_generic_attributes
				(
					audit_log_id,attribute_id,attribute_nm,attribute_group,attribute_sq,attribute_type,attribute_length,attribute_scale,is_temporal,is_mandatory,is_status_applicable,remarks
				)
				SELECT @audit_log_id,attribute_id,attribute_nm,attribute_group,attribute_sq,attribute_type,attribute_length,attribute_scale,is_temporal,is_mandatory,is_status_applicable,remarks
				FROM generic_attributes
				WHERE attribute_id = @p_object_id
				
				INSERT INTO adt_generic_attributes_status
				(
					audit_log_id,attribute_id,sewadar_status_cd
				)
				SELECT @audit_log_id,attribute_id,sewadar_status_cd
				FROM generic_attributes_status
				WHERE attribute_id = @p_object_id
				
				INSERT INTO adt_generic_attributes_list_values
				(
					audit_log_id,attribute_id,attribute_value,attribute_value_sq
				)
				SELECT @audit_log_id,attribute_id,attribute_value,attribute_value_sq
				FROM generic_attributes_list_values
				WHERE attribute_id = @p_object_id
				
				INSERT INTO adt_generic_attributes_satsang_centres
				(
					audit_log_id,attribute_id,satsang_centre_id,effective_from,effective_till
				)
				SELECT @audit_log_id,attribute_id,satsang_centre_id,effective_from,effective_till
				FROM generic_attributes_satsang_centres
				WHERE attribute_id = @p_object_id
			END			
			ELSE IF(@p_screen_id = 'ATT_01') 
			BEGIN
				INSERT INTO adt_sewadar_wise_sewa_summaries
				(
					audit_log_id, sewa_id, satsang_centre_id, sewadar_grno, present_cnt, exempt_cnt, leave_cnt, absent_cnt, is_system_recorded
				)
				SELECT @audit_log_id, sewa_id, satsang_centre_id, sewadar_grno, present_cnt, exempt_cnt, leave_cnt, absent_cnt, is_system_recorded
				FROM sewadar_wise_sewa_summaries
				WHERE sewa_id = @p_sewa_id AND satsang_centre_id = @p_satsang_centre_id AND sewadar_grno = @p_sewadar_grno	
			END
			ELSE IF(@p_screen_id = 'ATT_02') 
			BEGIN
				INSERT INTO adt_arbitrary_daily_presences
				(
					audit_log_id, sewa_id, satsang_centre_id, sewadar_grno, presence_dt, is_scanned
				)
				SELECT @audit_log_id, sewa_id, satsang_centre_id, sewadar_grno, presence_dt, is_scanned
				FROM arbitrary_daily_presences
				WHERE sewa_id = @p_sewa_id AND satsang_centre_id = @p_satsang_centre_id AND sewadar_grno = @p_sewadar_grno AND presence_dt = @p_transaction_dt
			END
			ELSE IF(@p_screen_id = 'ATT_03') 
			BEGIN
				INSERT INTO adt_arbitrary_summarised_exemptions
				(
					audit_log_id, sewa_id, satsang_centre_id, sewadar_grno, sewa_exemption_id, exemption_days
				)
				SELECT @audit_log_id, sewa_id, satsang_centre_id, sewadar_grno, sewa_exemption_id, exemption_days
				FROM arbitrary_summarised_exemptions
				WHERE sewa_id = @p_sewa_id AND satsang_centre_id = @p_satsang_centre_id AND sewadar_grno = @p_sewadar_grno
			END
			--ELSE IF(@p_screen_id = 'ATT_04') 
			--BEGIN
			--	INSERT INTO adt_arbitrary_daily_presences
			--	(
			--		audit_log_id,sewa_id,satsang_centre_id,sewadar_grno,presence_dt,is_scanned
			--	)
			--	SELECT @audit_log_id, sewa_team_id,serial_id,attendance_dt,attendance,sewa_exemption_id,is_scanned
			--	FROM team_wise_daily_attendance	
			--	WHERE sewa_team_id = @p_sewa_id AND satsang_centre_id = @p_satsang_centre_id AND sewadar_grno = @p_sewadar_grno
			--END
			ELSE IF(@p_screen_id = 'ATT_06') 
			BEGIN
				INSERT INTO adt_arbitrary_shift_presences
				(
					audit_log_id, sewa_id, satsang_centre_id, sewadar_grno, presence_dt, sewa_shift, is_scanned
				)
				SELECT @audit_log_id, sewa_id, satsang_centre_id, sewadar_grno, presence_dt, sewa_shift, is_scanned
				FROM arbitrary_shift_presences
				WHERE sewa_id = @p_sewa_id AND satsang_centre_id = @p_satsang_centre_id AND sewadar_grno = @p_sewadar_grno AND presence_dt = @p_transaction_dt AND sewa_shift = @p_object_id
			END
			ELSE IF(@p_screen_id = 'ENT_12') --POSTOFFICESORCITIES
			BEGIN
				INSERT INTO adt_post_offices_or_cities
				(
					audit_log_id, post_office_or_city_id,district_id,post_office_or_city_cd,post_office_or_city_nm,std_code,effective_from,effective_till
				)
				SELECT @audit_log_id, post_office_or_city_id,district_id,post_office_or_city_cd,post_office_or_city_nm,std_code,effective_from,effective_till
				FROM post_offices_or_cities
				WHERE post_office_or_city_id = @p_object_id
			END
			ELSE IF(@p_screen_id = 'ENT_13') 
			BEGIN
				INSERT INTO adt_sewa_exemptions
				(
					audit_log_id, sewa_exemption_id, sewa_exemption_nm, sewa_exemption_description, sewa_exemption_type, sewa_applicability, is_computed, effective_from, effective_till
				)
				SELECT @audit_log_id, sewa_exemption_id, sewa_exemption_nm, sewa_exemption_description, sewa_exemption_type, sewa_applicability, is_computed, effective_from, effective_till
				FROM sewa_exemptions
				WHERE sewa_exemption_id = @p_object_id
				INSERT INTO adt_sewa_exemptions_applicable_sewas
				(
					audit_log_id, sewa_exemption_id, sewa_id, exemption_days
				)
				SELECT @audit_log_id, sewa_exemption_id, sewa_id, exemption_days
				FROM sewa_exemptions_applicable_sewas
				WHERE sewa_exemption_id = @p_object_id
			END
			ELSE IF(@p_screen_id = 'ENT_14') 
			BEGIN
				INSERT INTO adt_weekly_sewa_locations
				(
					audit_log_id, weekly_sewa_location_id, weekly_sewa_location_nm, satsang_centre_id, remarks, effective_from, effective_till
				)
				SELECT @audit_log_id, weekly_sewa_location_id, weekly_sewa_location_nm, satsang_centre_id, remarks, effective_from, effective_till
				FROM weekly_sewa_location_id
				WHERE weekly_sewa_location_id = @p_object_id
			END
		END
	END
END
Go
	
