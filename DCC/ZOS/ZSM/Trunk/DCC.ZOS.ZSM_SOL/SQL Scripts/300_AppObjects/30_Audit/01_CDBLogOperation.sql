
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
	@p_person_id				person_id = NULL,
	@p_sewadar_id				person_id = NULL,
	@p_dependant_id				person_id = NULL
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
			@v_arg_2			VARCHAR (50)

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
				@is_print_logged			=	is_print_logged,					---- M001
				@is_update_changes_logged	=	is_update_changes_logged,
				@is_delete_changes_logged	=	is_delete_changes_logged
																					---- M016:REMOVED	FROM	SysAdmin..package_screens
																					---- M016:REMOVED	WHERE	package_id	=	SUBSTRING (@p_application_id, 1, 3)
		FROM	SysAdmin..application_screen_audits							---- M016
		WHERE	application_id	=	@p_application_id						---- M016
		AND		screen_id		=	@p_screen_id

		IF (@@ROWCOUNT = 0)
		BEGIN
			SET	@v_arg_1 = 'Screen ID (' + @p_screen_id + ')'
			SET	@v_arg_2 = 'Application ID (' + @p_application_id + ')'
			EXEC	SysAdmin..RaiseErrorMessage	'MisMatchInfo', NULL, @v_arg_1, @v_arg_2, NULL
			RETURN 1
		END

		INSERT	INTO	audit_logs
			(	session_id, application_id, user_no, user_role_id, operation, screen_id,
				object_id
			)
		VALUES
			(	@p_session_id, @p_application_id, @p_user_no, @p_user_role_id, @p_operation, @p_screen_id,		---- M002: @p_user_id --> @p_user_no
				@p_object_id
			)
		SELECT	@audit_log_id = IDENT_CURRENT('audit_logs')				

		IF(@p_screen_id = 'ENT_01') --countries
		BEGIN
			INSERT INTO adt_countries
			(
				audit_log_id, country_id, country_cd, country_nm, isd_code, gmt_diff, effective_from, effective_till
			)
			SELECT @audit_log_id, country_id, country_cd, country_nm, isd_code, gmt_diff, effective_from, effective_till
			FROM countries
			WHERE country_id = @p_object_id
		END
		ELSE IF(@p_screen_id = 'ENT_02') --states
		BEGIN
			INSERT INTO adt_states
			(
				audit_log_id, state_id, state_cd, state_nm, country_id, effective_from, effective_till
			)
			SELECT @audit_log_id, state_id, state_cd, state_nm, country_id, effective_from, effective_till
			FROM states
			WHERE state_id = @p_object_id
		END
		ELSE IF(@p_screen_id = 'ENT_03') --district_or_cities
		BEGIN
			INSERT INTO adt_districts_or_cities
			(
				audit_log_id, district_or_city_id, district_cd, district_nm, state_id, effective_from, effective_till
			)
			SELECT
				@audit_log_id, district_or_city_id, district_cd, district_nm, state_id, effective_from, effective_till
			FROM districts_or_cities
			WHERE district_or_city_id = @p_object_id
		END
		ELSE IF(@p_screen_id = 'ENT_04') --occupations
		BEGIN
			INSERT INTO adt_occupations
			(
				audit_log_id, occupation_id, occupation_cd, occupation_nm, effective_from, effective_till
			)
			SELECT
				@audit_log_id, occupation_id, occupation_cd, occupation_nm, effective_from, effective_till
			FROM occupations
			WHERE @p_object_id = occupation_id					
		END
		ELSE IF(@p_screen_id = 'ENT_05') --skill
		BEGIN
			INSERT INTO adt_skills
			(
				audit_log_id, skill_id, skill_nm, effective_from, effective_till
			)
			SELECT 
				@audit_log_id, skill_id, skill_nm, effective_from, effective_till
			FROM skills
			WHERE @p_object_id = skill_id
		END
		ELSE IF(@p_screen_id = 'ENT_07') --relations
		BEGIN
			INSERT INTO adt_relations
			(
				audit_log_id, relation_id, relation_nm, effective_from, effective_till
			)
			SELECT
				@audit_log_id, relation_id, relation_nm, effective_from, effective_till
			FROM relations
			WHERE @p_object_id = relation_id
		END
		ELSE IF(@p_screen_id = 'ENT_08') --qualifi
		BEGIN
			INSERT INTO adt_qualifications
			(
				audit_log_id, qualification_id, qualification_type, qualification_cd, qualification_nm, remarks, effective_from, effective_till
			)
			SELECT
				@audit_log_id, qualification_id, qualification_type, qualification_cd, qualification_nm, remarks, effective_from, effective_till
			FROM qualifications
			WHERE @p_object_id = qualification_id

		END
		ELSE IF(@p_screen_id = 'ENT_09') --qualifi_subj
		BEGIN
			INSERT INTO adt_qlfctn_subjects
			(
				audit_log_id, qlfctn_subject_id, qlfctn_subject_cd, qlfctn_subject_nm, description, effective_from, effective_till
			)
			SELECT
				@audit_log_id, qlfctn_subject_id, qlfctn_subject_cd, qlfctn_subject_nm, description, effective_from, effective_till
			FROM qlfctn_subjects
			WHERE @p_object_id = qlfctn_subject_id
		END
	END
