/* ==================================================================================
    Source File		:	procs_applications.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Sat Jul 27 12:20 IST 2019
    Last updated	:	Jul 27, 2019
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		This is re-runnable script and thus is pre-qualified with DROP statements.
    ==================================================================================
								      								  Revision History
    ----------------------------------------------------------------------------------
     JL : ??-Jul-2019
		*   Initial version
   ==================================================================================*/

-- =============================================================================
-- Procedure SewadarApplicationVerify
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'SewadarApplicationVerify' AND xtype = 'P')
	DROP PROCEDURE SewadarApplicationVerify
GO

CREATE PROCEDURE SewadarApplicationVerify
(
	@p_application_id		INTEGER
)
WITH ENCRYPTION
AS
	DECLARE
		@cnt	INT,
		@application_status			VARCHAR(20),
		@is_outstation_sewadar		Boolean,
		@security_approver_id		sewadar_id,
		@sewa_samiti_approver_id	sewadar_id,
		@area_secretary_id			centre_functionary_id,
		@secretary_id				centre_functionary_id,
		@sponsorer_id				sewadar_id;
BEGIN
	SELECT	@application_status			=	application_status,
			@is_outstation_sewadar		=	is_outstation_sewadar,
			@security_approver_id		=	security_approver_id,
			@sewa_samiti_approver_id	=	sewa_samiti_approver_id,
			@area_secretary_id			=	area_secretary_id,
			@secretary_id				=	secretary_id,
			@sponsorer_id				=	sponsorer_id
	FROM	sewadar_applications
	WHERE	application_id	=	@p_application_id;
	IF (@@ROWCOUNT = 0)
	BEGIN
		RAISERROR ('Application ID (%d) not found', 16, -1, @p_application_id);
		RETURN -1;
	END

	IF (@application_status IN ('Verified', 'Processed'))
	BEGIN
		RAISERROR ('Application ID (%d) is already %s', 16, -1, @p_application_id, @application_status);
		RETURN -2;
	END
	
	IF (@security_approver_id IS NULL)
	BEGIN
		RAISERROR ('Sewadar ID of Security Approver is not identified', 16, -1);
		RETURN -3;
	END
	IF (@sewa_samiti_approver_id IS NULL)
	BEGIN
		RAISERROR ('Sewadar ID of Sewa Samiti Approver is not identified', 16, -1);
		RETURN -4;
	END
	IF (@area_secretary_id IS NULL AND @is_outstation_sewadar = 'Yes')
	BEGIN
		RAISERROR ('Functionary ID of Area Secretary is not identified for the Outstation Sewadar', 16, -1);
		RETURN -5;
	END
	IF (@secretary_id IS NULL AND @is_outstation_sewadar = 'Yes')
	BEGIN
		RAISERROR ('Functionary ID of Secretary is not identified for the Outstation Sewadar', 16, -1);
		RETURN -6;
	END
	IF (@sponsorer_id IS NULL AND @is_outstation_sewadar = 'No')
	BEGIN
		RAISERROR ('Sewadar ID of Sponsorer is not identified for the Local Sewadar', 16, -1);
		RETURN -7;
	END

	UPDATE	sewadar_applications
		SET	application_status		=	'Verified',
			application_status_dtm	=	GetDate(),
			reason					=	NULL
	WHERE	application_id	=	@p_application_id
	AND		application_status	=	@application_status;
	IF (@@ROWCOUNT = 0)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotUpdated', NULL, NULL, NULL, NULL;
		RETURN -1;
	END
END
GO

-- =============================================================================
-- Procedure SewadarApplicationProcess
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'SewadarApplicationProcess' AND xtype = 'P')
	DROP PROCEDURE SewadarApplicationProcess
GO

CREATE PROCEDURE SewadarApplicationProcess
(
	@p_application_id		INTEGER
)
WITH ENCRYPTION
AS
	DECLARE
		@cnt					INT,
		@sewadar_id				INT,
		@old_grno				VARCHAR (10),
		@photo_id				VARCHAR (20),
		@remarks				remarks,
		@gender					Gender,
		@is_outstation_sewadar	Boolean,
		@satsang_centre_id		satsang_centre_id,
		@sewadar_grno			sewadar_grno,
		@application_status 	VARCHAR(20);
BEGIN
	SELECT	@application_status		=	application_status,
			@old_grno				=	old_grno,
			@photo_id				=	photo_id,
			@gender					=	gender,
			@is_outstation_sewadar	=	is_outstation_sewadar,
			@satsang_centre_id		=	application_centre_id,
			@remarks				=	SUBSTRING (remarks, 1, 100)
	FROM	sewadar_applications
	WHERE	application_id	=	@p_application_id;
	IF (@@ROWCOUNT = 0)
	BEGIN
		RAISERROR ('Application ID (%d) not found', 16, -1, @p_application_id);
		RETURN -1;
	END

	IF (@application_status = 'Processed')
	BEGIN
		RAISERROR ('Application ID (%d) is already %s', 16, -1, @p_application_id, @application_status);
		RETURN -2;
	END

	IF (@application_status != 'Verified')
	BEGIN
		RAISERROR ('Status of Application ID (%d) should be Verified, but it is %s', 16, -1, @p_application_id, @application_status);
		RETURN -2;
	END

	INSERT INTO sewadars 
			(	first_nm, middle_nm, last_nm, gender, birth_dtm, is_married,
				initiation_dt, initiation_place_id, initiation_by
			)
		SELECT	first_nm, middle_nm, last_nm, gender, birth_dtm, is_married,
				initiation_dt, initiation_place_id, initiation_by
		FROM	sewadar_applications
		WHERE	application_id	=	@p_application_id;
	
	SET @sewadar_id = SCOPE_IDENTITY();
	
	INSERT INTO sewadars_details
			(	sewadar_id, address_proof, other_address_proof_id, telephone_mobile, telephone_residence, telephone_office, occupation,
				attends_weekly_satsang, weekly_satsang_centre_id,
				has_hypertension, is_diabetic, has_skin_problem, has_epillepsy
			)
		SELECT	@sewadar_id, address_proof, other_address_proof_id, telephone_mobile, telephone_residence, telephone_office, occupation,
				attends_weekly_satsang, weekly_satsang_centre_id,
				has_hypertension, is_diabetic, has_skin_problem, has_epillepsy
		FROM	sewadar_applications
		WHERE	application_id	=	@p_application_id;
	
	INSERT INTO sewadars_addresses
		(	sewadar_id, address_type, address_line_1, address_line_2, post_office_or_city_id, pin_or_zip_code	)
		SELECT	@sewadar_id, 'Residence', address_line_1, address_line_2, post_office_or_city_id, pin_or_zip_code
		FROM	sewadar_applications
		WHERE	application_id	=	@p_application_id;
	
	INSERT INTO sewadars_qualifications
			(	sewadar_id, qualification_sq, qualification_id, qlfctn_subject_id	)
		SELECT	@sewadar_id, qualification_sq, qualification_id, qlfctn_subject_id
		FROM	sewadar_application_qualifications
		WHERE	sewadar_application_id	=	@p_application_id;
	
	INSERT INTO sewadars_skills
			(	sewadar_id, skill_id, skill_sq	)
		SELECT	@sewadar_id, skill_id, skill_sq
		FROM	sewadar_application_skills
		WHERE	sewadar_application_id	=	@p_application_id;
	
	INSERT INTO sewadars_other_disabilities
			(	sewadar_id, medical_disability_id, medical_disability_sq	)
		SELECT	@sewadar_id, medical_disability_id, medical_disability_sq
		FROM	sewadar_application_other_disabilities
		WHERE	sewadar_application_id	=	@p_application_id;
	
	IF (@old_grno IS NOT NULL AND LEN (@old_grno) > 3)
		INSERT INTO sewadars_remarks (	sewadar_id, remarks_type, remarks_sq, remarks	) VALUES (	@sewadar_id, 'Old G.R.No.', 1, @old_grno	);

	IF (@photo_id IS NOT NULL AND LEN (@photo_id) > 5)
		INSERT INTO sewadars_remarks (	sewadar_id, remarks_type, remarks_sq, remarks	) VALUES (	@sewadar_id, 'Reference', 1, @photo_id	);

	IF (@remarks IS NOT NULL AND LEN (@remarks) > 5)
		INSERT INTO sewadars_remarks (	sewadar_id, remarks_type, remarks_sq, remarks	) VALUES (	@sewadar_id, 'Remarks', 1, @remarks	);

	EXEC GetSewadarRegistrationNumber @satsang_centre_id, @gender, @is_outstation_sewadar, @sewadar_grno OUTPUT
									
	INSERT INTO sewadars_registrations 
			(	satsang_centre_id, sewadar_grno, sewadar_id, appointment_dt, is_outstation_sewadar,
				department_id, sub_department_id, department_dt, sewadar_status_cd, sewadar_status_dtm,
				sewadar_type,
				reference_1_sewadar_id, reference_1_relationship, reference_1_nm, reference_1_centre_id, reference_1_department,
				reference_2_sewadar_id, reference_2_relationship, reference_2_nm, reference_2_centre_id, reference_2_department,
				sponsorer_id, area_secretary_id, secretary_id, security_approver_id, sewa_samiti_approver_id
			)
		SELECT	@satsang_centre_id, @sewadar_grno, @sewadar_id, appointment_dt, is_outstation_sewadar,
				department_id, sub_department_id, GetDate(), 'Temp', GetDate(),
				'R',
				reference_1_sewadar_id, reference_1_relationship, reference_1_nm, reference_1_centre_id, reference_1_department,
				reference_2_sewadar_id, reference_2_relationship, reference_2_nm, reference_2_centre_id, reference_2_department,
				sponsorer_id, area_secretary_id, secretary_id, security_approver_id, sewa_samiti_approver_id
		FROM	sewadar_applications
		WHERE	application_id	=	@p_application_id;
	
	UPDATE	sewadars
		SET	current_satsang_centre_id	=	@satsang_centre_id,
			current_sewadar_grno		=	@sewadar_grno
	WHERE	sewadar_id	=	@sewadar_id;

	UPDATE	sewadar_applications
		SET	application_status		=	'Processed',
			registered_sewadar_grno	=	@sewadar_grno,
			registered_sewadar_id	=	@sewadar_id,
			reason					=	NULL,
			application_status_dtm	=	GetDate()
	WHERE	application_id	=	@p_application_id
	AND		application_status	=	@application_status;
	IF (@@ROWCOUNT = 0)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotUpdated', NULL, NULL, NULL, NULL;
		RETURN -1;
	END
END
GO

-- =============================================================================
-- Procedure SewadarApplicationReject
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'SewadarApplicationReject' AND xtype = 'P')
	DROP PROCEDURE SewadarApplicationReject
GO

CREATE PROCEDURE SewadarApplicationReject
(
	@p_application_id		INTEGER,
	@p_reason				VARCHAR (200)
)
WITH ENCRYPTION
AS
	DECLARE
		@cnt	INT,
		@application_status VARCHAR(20);
BEGIN
	IF (@p_reason IS NULL OR LTRIM(RTRIM(@p_reason)) = '')
	BEGIN
		RAISERROR ('Reason for Rejection must be specified', 16, -1);
		RETURN -1;
	END
	SELECT	@application_status	=	application_status
	FROM	sewadar_applications
	WHERE	application_id	=	@p_application_id;
	IF (@@ROWCOUNT = 0)
	BEGIN
		RAISERROR ('Application ID (%d) not found', 16, -1, @p_application_id);
		RETURN -1;
	END

	IF (@application_status IN ('Rejected', 'Processed'))
	BEGIN
		RAISERROR ('Application ID (%d) is already %s', 16, -1, @p_application_id, @application_status);
		RETURN -2;
	END

	UPDATE	sewadar_applications
		SET	application_status		=	'Rejected',
			reason					=	@p_reason,
			application_status_dtm	=	GetDate()
	WHERE	application_id	=	@p_application_id
	AND		application_status	=	@application_status;
	IF (@@ROWCOUNT = 0)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotUpdated', NULL, NULL, NULL, NULL;
		RETURN -1;
	END
END
GO

-- =============================================================================
-- Procedure SewadarApplicationMarkPending
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'SewadarApplicationMarkPending' AND xtype = 'P')
	DROP PROCEDURE SewadarApplicationMarkPending
GO

CREATE PROCEDURE SewadarApplicationMarkPending
(
	@p_application_id		INTEGER,
	@p_reason				VARCHAR (200)
)
WITH ENCRYPTION
AS
	DECLARE
		@cnt	INT,
		@application_status VARCHAR(20);
BEGIN
	IF (@p_reason IS NULL OR LTRIM(RTRIM(@p_reason)) = '')
	BEGIN
		RAISERROR ('Reason for Pending must be specified', 16, -1);
		RETURN -1;
	END
	SELECT	@application_status	=	application_status
	FROM	sewadar_applications
	WHERE	application_id	=	@p_application_id;
	IF (@@ROWCOUNT = 0)
	BEGIN
		RAISERROR ('Application ID (%d) not found', 16, -1, @p_application_id);
		RETURN -1;
	END

	IF (@application_status IN ('Pending', 'Processed'))
	BEGIN
		RAISERROR ('Application ID (%d) is already %s', 16, -1, @p_application_id, @application_status);
		RETURN -2;
	END

	UPDATE	sewadar_applications
		SET	application_status		=	'Pending',
			reason					=	@p_reason,
			application_status_dtm	=	GetDate()
	WHERE	application_id	=	@p_application_id
	AND		application_status	=	@application_status;
	IF (@@ROWCOUNT = 0)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotUpdated', NULL, NULL, NULL, NULL;
		RETURN -1;
	END
END
GO

-- =============================================================================
-- Procedure SewadarApplicationClearError
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'SewadarApplicationClearError' AND xtype = 'P')
	DROP PROCEDURE SewadarApplicationClearError
GO

CREATE PROCEDURE SewadarApplicationClearError
(
	@p_application_id		INTEGER
)
WITH ENCRYPTION
AS
	DECLARE
		@cnt	INT,
		@application_status VARCHAR(20);

BEGIN
	SELECT	@application_status	=	application_status
	FROM	sewadar_applications
	WHERE	application_id	=	@p_application_id;
	IF (@@ROWCOUNT = 0)
	BEGIN
		RAISERROR ('Application ID (%d) not found', 16, -1, @p_application_id);
		RETURN -1;
	END

	IF (@application_status = 'Error')
	BEGIN
		RAISERROR ('Status of Application is %s; There is no Error to Clear', 16, -1, @application_status);
		RETURN -2;
	END

	UPDATE	sewadar_applications
		SET	application_status		=	'Pending',
			reason					=	NULL,
			application_status_dtm	=	GetDate()
	WHERE	application_id	=	@p_application_id
	AND		application_status	=	@application_status;
	IF (@@ROWCOUNT = 0)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotUpdated', NULL, NULL, NULL, NULL;
		RETURN -1;
	END
END
GO

-- =============================================================================
-- vim:ts=4 ht=8 sw=4 guifont=Lucida_Console
