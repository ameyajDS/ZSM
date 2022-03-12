USE ZSM
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertSewadarApplication
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertSewadarApplication'
			)
	BEGIN
		DROP PROCEDURE  dbo.InsertSewadarApplication
	END
GO
CREATE PROCEDURE dbo.InsertSewadarApplication
(
	@application_id						int output,
	@application_centre_id				satsang_centre_id,
	@application_dt						date,
	@application_status					varchar(20),
	@application_status_dtm				smalldatetime = NULL,
	@first_nm							name_part,
	@middle_nm							name_part,
	@last_nm							name_part,
	@gender								Gender,
	@birth_dtm							smalldatetime,
	@is_married							Boolean,
	@initiation_dt						smalldatetime = NULL,
	@initiation_place_id				initiation_place_id = NULL,
	@initiation_by						patron_id = NULL,
	@address_line_1						address_line,
	@address_line_2						address_line = NULL,
	@post_office_or_city_id				post_office_or_city_id,
	@pin_or_zip_code					pin_or_zip_code = NULL,
	@address_proof						address_proof = NULL,
	@other_address_proof_id				address_proof_id = NULL,
	@telephone_mobile					telephone_lines = NULL,
	@telephone_residence				telephone_lines = NULL,
	@telephone_office					telephone_lines = NULL,
	@occupation							occupation,
	@attends_weekly_satsang				Boolean = NULL,
	@weekly_satsang_centre_id			satsang_centre_id = NULL,
	@has_hypertension					Boolean,
	@is_diabetic						Boolean,
	@has_skin_problem					Boolean,
	@has_epillepsy						Boolean,
	@photo_id							varchar(20) = NULL,
	@photo_dt							date = NULL,
	@appointment_dt						smalldatetime,
	@is_outstation_sewadar				Boolean,
	@department_id						department_id,
	@sub_department_id					department_id = NULL,
	@old_grno							varchar(10) = NULL,
	@reference_1_sewadar_id				sewadar_id = NULL,
	@reference_1_grno					sewadar_grno = NULL,
	@reference_1_relationship			relationship_id,
	@reference_1_nm						reference_nm = NULL,
	@reference_1_centre_id				satsang_centre_id,
	@reference_1_department				varchar(20) = NULL,
	@reference_2_sewadar_id				sewadar_id = NULL,
	@reference_2_grno					sewadar_grno = NULL,
	@reference_2_relationship			relationship_id,
	@reference_2_nm						reference_nm = NULL,
	@reference_2_centre_id				satsang_centre_id,
	@reference_2_department				varchar(20) = NULL,
	@security_approver_id				sewadar_id = NULL,
	@security_approver_centre_id		satsang_centre_id,
	@security_approver_grno				sewadar_grno,
	@security_approver_nm				reference_nm = NULL,
	@sewa_samiti_approver_id			sewadar_id = NULL,
	@sewa_samiti_approver_centre_id		satsang_centre_id,
	@sewa_samiti_approver_grno			sewadar_grno,
	@sewa_samiti_approver_nm			reference_nm = NULL,
	@area_secretary_id					centre_functionary_id = NULL,
	@area_secretary_centre_id			satsang_centre_id,
	@area_secretary_grno				sewadar_grno,
	@area_secretary_nm					reference_nm = NULL,
	@secretary_id						centre_functionary_id = NULL,
	@secretary_centre_id				satsang_centre_id,
	@secretary_grno						sewadar_grno,
	@secretary_nm						reference_nm = NULL,
	@sponsorer_id						sewadar_id = NULL,
	@sponsorer_centre_id				satsang_centre_id,
	@sponsorer_grno						sewadar_grno,
	@sponsorer_nm						reference_nm = NULL,
	@sponsorer_department				varchar(20) = NULL,
	@remarks							varchar(500) = NULL,
	@reason								varchar(200) = NULL,
	@registered_sewadar_grno			sewadar_grno = NULL,
	@registered_sewadar_id				sewadar_id = NULL
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO sewadar_applications
	(
		application_centre_id, application_dt, application_status, application_status_dtm, first_nm, middle_nm, last_nm, gender, birth_dtm, is_married, initiation_dt, initiation_place_id, initiation_by, address_line_1, address_line_2, post_office_or_city_id, pin_or_zip_code, address_proof, other_address_proof_id, telephone_mobile, telephone_residence, telephone_office, occupation, attends_weekly_satsang, weekly_satsang_centre_id, has_hypertension, is_diabetic, has_skin_problem, has_epillepsy, photo_id, photo_dt, appointment_dt, is_outstation_sewadar, department_id, sub_department_id, old_grno, reference_1_sewadar_id, reference_1_grno, reference_1_relationship, reference_1_nm, reference_1_centre_id, reference_1_department, reference_2_sewadar_id, reference_2_grno, reference_2_relationship, reference_2_nm, reference_2_centre_id, reference_2_department, security_approver_id, security_approver_centre_id, security_approver_grno, security_approver_nm, sewa_samiti_approver_id, sewa_samiti_approver_centre_id, sewa_samiti_approver_grno, sewa_samiti_approver_nm, area_secretary_id, area_secretary_centre_id, area_secretary_grno, area_secretary_nm, secretary_id, secretary_centre_id, secretary_grno, secretary_nm, sponsorer_id, sponsorer_centre_id, sponsorer_grno, sponsorer_nm, sponsorer_department, remarks, reason, registered_sewadar_grno, registered_sewadar_id
	)
	VALUES
	(
		@application_centre_id, @application_dt, @application_status, @application_status_dtm, @first_nm, @middle_nm, @last_nm, @gender, @birth_dtm, @is_married, @initiation_dt, @initiation_place_id, @initiation_by, @address_line_1, @address_line_2, @post_office_or_city_id, @pin_or_zip_code, @address_proof, @other_address_proof_id, @telephone_mobile, @telephone_residence, @telephone_office, @occupation, @attends_weekly_satsang, @weekly_satsang_centre_id, @has_hypertension, @is_diabetic, @has_skin_problem, @has_epillepsy, @photo_id, @photo_dt, @appointment_dt, @is_outstation_sewadar, @department_id, @sub_department_id, @old_grno, @reference_1_sewadar_id, @reference_1_grno, @reference_1_relationship, @reference_1_nm, @reference_1_centre_id, @reference_1_department, @reference_2_sewadar_id, @reference_2_grno, @reference_2_relationship, @reference_2_nm, @reference_2_centre_id, @reference_2_department, @security_approver_id, @security_approver_centre_id, @security_approver_grno, @security_approver_nm, @sewa_samiti_approver_id, @sewa_samiti_approver_centre_id, @sewa_samiti_approver_grno, @sewa_samiti_approver_nm, @area_secretary_id, @area_secretary_centre_id, @area_secretary_grno, @area_secretary_nm, @secretary_id, @secretary_centre_id, @secretary_grno, @secretary_nm, @sponsorer_id, @sponsorer_centre_id, @sponsorer_grno, @sponsorer_nm, @sponsorer_department, @remarks, @reason, @registered_sewadar_grno, @registered_sewadar_id
	)
	SELECT @application_id = SCOPE_IDENTITY()
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateSewadarApplication
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateSewadarApplication'
			)
	BEGIN
		DROP PROCEDURE  dbo.UpdateSewadarApplication
	END
GO
CREATE PROCEDURE dbo.UpdateSewadarApplication
(
	@application_id						int,
	@application_centre_id				satsang_centre_id,
	@application_dt						date,
	@application_status					varchar(20),
	@application_status_dtm				smalldatetime,
	@first_nm							name_part,
	@middle_nm							name_part,
	@last_nm							name_part,
	@gender								Gender,
	@birth_dtm							smalldatetime,
	@is_married							Boolean,
	@initiation_dt						smalldatetime,
	@initiation_place_id				initiation_place_id,
	@initiation_by						patron_id,
	@address_line_1						address_line,
	@address_line_2						address_line,
	@post_office_or_city_id				post_office_or_city_id,
	@pin_or_zip_code					pin_or_zip_code,
	@address_proof						address_proof,
	@other_address_proof_id				address_proof_id,
	@telephone_mobile					telephone_lines,
	@telephone_residence				telephone_lines,
	@telephone_office					telephone_lines,
	@occupation							occupation,
	@attends_weekly_satsang				Boolean,
	@weekly_satsang_centre_id			satsang_centre_id,
	@has_hypertension					Boolean,
	@is_diabetic						Boolean,
	@has_skin_problem					Boolean,
	@has_epillepsy						Boolean,
	@photo_id							varchar(20),
	@photo_dt							date,
	@appointment_dt						smalldatetime,
	@is_outstation_sewadar				Boolean,
	@department_id						department_id,
	@sub_department_id					department_id,
	@old_grno							varchar(10),
	@reference_1_sewadar_id				sewadar_id,
	@reference_1_grno					sewadar_grno,
	@reference_1_relationship			relationship_id,
	@reference_1_nm						reference_nm,
	@reference_1_centre_id				satsang_centre_id,
	@reference_1_department				varchar(20),
	@reference_2_sewadar_id				sewadar_id,
	@reference_2_grno					sewadar_grno,
	@reference_2_relationship			relationship_id,
	@reference_2_nm						reference_nm,
	@reference_2_centre_id				satsang_centre_id,
	@reference_2_department				varchar(20),
	@security_approver_id				sewadar_id,
	@security_approver_centre_id		satsang_centre_id,
	@security_approver_grno				sewadar_grno,
	@security_approver_nm				reference_nm,
	@sewa_samiti_approver_id			sewadar_id,
	@sewa_samiti_approver_centre_id		satsang_centre_id,
	@sewa_samiti_approver_grno			sewadar_grno,
	@sewa_samiti_approver_nm			reference_nm,
	@area_secretary_id					centre_functionary_id,
	@area_secretary_centre_id			satsang_centre_id,
	@area_secretary_grno				sewadar_grno,
	@area_secretary_nm					reference_nm,
	@secretary_id						centre_functionary_id,
	@secretary_centre_id				satsang_centre_id,
	@secretary_grno						sewadar_grno,
	@secretary_nm						reference_nm,
	@sponsorer_id						sewadar_id,
	@sponsorer_centre_id				satsang_centre_id,
	@sponsorer_grno						sewadar_grno,
	@sponsorer_nm						reference_nm,
	@sponsorer_department				varchar(20),
	@remarks							varchar(500),
	@reason								varchar(200),
	@registered_sewadar_grno			sewadar_grno,
	@registered_sewadar_id				sewadar_id,
	@txn_ts								timestamp
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    sewadar_applications
	SET
		application_centre_id				=	@application_centre_id,
		application_dt						=	@application_dt,
		application_status					=	@application_status,
		application_status_dtm				=	@application_status_dtm,
		first_nm							=	@first_nm,
		middle_nm							=	@middle_nm,
		last_nm								=	@last_nm,
		gender								=	@gender,
		birth_dtm							=	@birth_dtm,
		is_married							=	@is_married,
		initiation_dt						=	@initiation_dt,
		initiation_place_id					=	@initiation_place_id,
		initiation_by						=	@initiation_by,
		address_line_1						=	@address_line_1,
		address_line_2						=	@address_line_2,
		post_office_or_city_id				=	@post_office_or_city_id,
		pin_or_zip_code						=	@pin_or_zip_code,
		address_proof						=	@address_proof,
		other_address_proof_id				=	@other_address_proof_id,
		telephone_mobile					=	@telephone_mobile,
		telephone_residence					=	@telephone_residence,
		telephone_office					=	@telephone_office,
		occupation							=	@occupation,
		attends_weekly_satsang				=	@attends_weekly_satsang,
		weekly_satsang_centre_id			=	@weekly_satsang_centre_id,
		has_hypertension					=	@has_hypertension,
		is_diabetic							=	@is_diabetic,
		has_skin_problem					=	@has_skin_problem,
		has_epillepsy						=	@has_epillepsy,
		photo_id							=	@photo_id,
		photo_dt							=	@photo_dt,
		appointment_dt						=	@appointment_dt,
		is_outstation_sewadar				=	@is_outstation_sewadar,
		department_id						=	@department_id,
		sub_department_id					=	@sub_department_id,
		old_grno							=	@old_grno,
		reference_1_sewadar_id				=	@reference_1_sewadar_id,
		reference_1_grno					=	@reference_1_grno,
		reference_1_relationship			=	@reference_1_relationship,
		reference_1_nm						=	@reference_1_nm,
		reference_1_centre_id				=	@reference_1_centre_id,
		reference_1_department				=	@reference_1_department,
		reference_2_sewadar_id				=	@reference_2_sewadar_id,
		reference_2_grno					=	@reference_2_grno,
		reference_2_relationship			=	@reference_2_relationship,
		reference_2_nm						=	@reference_2_nm,
		reference_2_centre_id				=	@reference_2_centre_id,
		reference_2_department				=	@reference_2_department,
		security_approver_id				=	@security_approver_id,
		security_approver_centre_id			=	@security_approver_centre_id,
		security_approver_grno				=	@security_approver_grno,
		security_approver_nm				=	@security_approver_nm,
		sewa_samiti_approver_id				=	@sewa_samiti_approver_id,
		sewa_samiti_approver_centre_id		=	@sewa_samiti_approver_centre_id,
		sewa_samiti_approver_grno			=	@sewa_samiti_approver_grno,
		sewa_samiti_approver_nm				=	@sewa_samiti_approver_nm,
		area_secretary_id					=	@area_secretary_id,
		area_secretary_centre_id			=	@area_secretary_centre_id,
		area_secretary_grno					=	@area_secretary_grno,
		area_secretary_nm					=	@area_secretary_nm,
		secretary_id						=	@secretary_id,
		secretary_centre_id					=	@secretary_centre_id,
		secretary_grno						=	@secretary_grno,
		secretary_nm						=	@secretary_nm,
		sponsorer_id						=	@sponsorer_id,
		sponsorer_centre_id					=	@sponsorer_centre_id,
		sponsorer_grno						=	@sponsorer_grno,
		sponsorer_nm						=	@sponsorer_nm,
		sponsorer_department				=	@sponsorer_department,
		remarks								=	@remarks,
		reason								=	@reason,
		registered_sewadar_grno				=	@registered_sewadar_grno,
		registered_sewadar_id				=	@registered_sewadar_id
	WHERE
	 	application_id 						=   @application_id
	AND txn_ts								=	@txn_ts
	IF (@@ROWCOUNT != 1)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotUpdated', NULL, NULL, NULL, NULL
	END
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	DeleteSewadarApplication
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteSewadarApplication'
			)
	BEGIN
		DROP PROCEDURE  dbo.DeleteSewadarApplication
	END
GO
CREATE PROCEDURE dbo.DeleteSewadarApplication
(
	@application_id						int,
	@txn_ts								timestamp
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM sewadar_application_qualifications
	WHERE
	    sewadar_application_id = 	@application_id

	DELETE FROM sewadar_application_other_disabilities
	WHERE
	    sewadar_application_id = 	@application_id

	DELETE FROM sewadar_application_skills
	WHERE
	    sewadar_application_id = 	@application_id

	DELETE FROM sewadar_applications
	WHERE
	    application_id = 	@application_id
	AND txn_ts		   =	@txn_ts
	IF (@@ROWCOUNT != 1)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotDeleted', NULL, NULL, NULL, NULL
	END
END
GO
-- =============================================================================

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	ViewSewadarApplication
-- =============================================================================
IF EXISTS	(	SELECT  *
				FROM    sysobjects
				WHERE name = 'ViewSewadarApplication' and TYPE='v'
			)

	BEGIN
		DROP VIEW ViewSewadarApplication
	END
GO
CREATE VIEW ViewSewadarApplication

WITH ENCRYPTION
AS
	SELECT
		sa.application_id, 
		sa.application_centre_id, 
		application_centre_nm = sa_scd.centre_nm,
		sa.application_dt, 
		sa.application_status, 
		sa.application_status_dtm, 
		sa.first_nm, 
		sa.middle_nm, 
		sa.last_nm, 
		sa.gender, 
		sa.birth_dtm, 
		age = DATEDIFF(year, sa.birth_dtm, GETDATE()),
		sa.is_married, 
		sa.initiation_dt, 
		sa.initiation_place_id, 
		sa.initiation_by, 
		sa.address_line_1, 
		sa.address_line_2, 
		sa.post_office_or_city_id, 
		poc.post_office_or_city_nm,
		doc.district_or_city_id,
		doc.district_nm,
		s.state_nm,
		s.state_id,
		c.country_nm,
		c.country_id,
		sa.pin_or_zip_code, 
		sa.address_proof, 
		sa.other_address_proof_id, 
		other_address_proof_nm = oap.address_proof_nm, 
		sa.telephone_mobile, 
		sa.telephone_residence, 
		sa.telephone_office, 
		sa.occupation, 
		sa.attends_weekly_satsang, 
		sa.weekly_satsang_centre_id, 
		sa.has_hypertension, 
		sa.is_diabetic, 
		sa.has_skin_problem, 
		sa.has_epillepsy, 
		sa.photo_id, 
		sa.photo_dt, 
		sa.appointment_dt, 
		sa.is_outstation_sewadar, 
		sa.department_id, 
		dep.department_nm,
		sa.sub_department_id,
		sub_department_nm = sub_dep.sub_department_nm,
		sa.old_grno, 
		sa.reference_1_sewadar_id, 
		sa.reference_1_grno, 
		sa.reference_1_relationship,
		reference_1_relationship_nm = ref1_rel.relation_nm,
		sa.reference_1_nm, 
		sa.reference_1_centre_id, 
		ref1_scd.centre_nm as reference_1_centre_nm,
		sa.reference_1_department, 
		sa.reference_2_sewadar_id, 
		sa.reference_2_grno, 
		sa.reference_2_relationship, 
		reference_2_relationship_nm = ref2_rel.relation_nm,
		sa.reference_2_nm, 
		sa.reference_2_centre_id,
		ref2_scd.centre_nm as reference_2_centre_nm,
		sa.reference_2_department, 
		sa.security_approver_id, 
		sa.security_approver_centre_id,
		security_approver_centre_nm = security_scd.centre_nm,
		sa.security_approver_grno, 
		sa.security_approver_nm, 
		sa.sewa_samiti_approver_id, 
		sa.sewa_samiti_approver_centre_id, 
		sewa_samiti_approver_centre_nm = sewa_samiti_scd.centre_nm,
		sa.sewa_samiti_approver_grno, 
		sa.sewa_samiti_approver_nm, 
		sa.area_secretary_id, 
		sa.area_secretary_centre_id, 
		area_secretary_centre_nm = area_secretary_scd.centre_nm,
		sa.area_secretary_grno, 
		CASE WHEN sa.area_secretary_id IS NOT NULL THEN sa.area_secretary_nm ELSE NULL END AS area_secretary_nm,
		CASE WHEN sa.area_secretary_id IS NULL THEN sa.area_secretary_nm ELSE NULL END AS entered_area_secretary_nm,
		sa.secretary_id, 
		sa.secretary_centre_id,
		secretary_centre_nm = secretary_scd.centre_nm,
		sa.secretary_grno, 
		CASE WHEN sa.secretary_id IS NOT NULL THEN sa.secretary_nm ELSE NULL END AS secretary_nm,
		CASE WHEN sa.secretary_id IS NULL THEN sa.secretary_nm  ELSE NULL END AS entered_secretary_nm, 
		sa.sponsorer_id, 
		sa.sponsorer_centre_id,
		sponsorer_centre_nm = sponsorer_scd.centre_nm,
		sa.sponsorer_grno, 
		sa.sponsorer_nm, 
		sa.sponsorer_department, 
		sa.remarks, 
		sa.reason, 
		sa.registered_sewadar_grno, 
		sa.registered_sewadar_id, 
		weekly_satsang_centre_nm = sc.centre_nm,
		sa.txn_ts
	FROM sewadar_applications sa
	JOIN ViewBasicSatsangCentreDetails sa_scd ON sa_scd.satsang_centre_id = sa.application_centre_id
	JOIN departments dep ON sa.department_id = dep.department_id
	JOIN post_offices_or_cities poc ON poc.post_office_or_city_id = sa.post_office_or_city_id
	LEFT OUTER JOIN sub_departments sub_dep ON sa.sub_department_id = sub_dep.sub_department_id
	LEFT OUTER JOIN CDB..districts_or_cities doc ON poc.district_id = doc.district_or_city_id
	LEFT OUTER JOIN CDB..states s ON s.state_id = doc.state_id
	LEFT OUTER JOIN CDB..countries c ON c.country_id = s.country_id
	LEFT OUTER JOIN CDB..relations ref1_rel ON ref1_rel.relation_id = sa.reference_1_relationship
	LEFT OUTER JOIN CDB..relations ref2_rel ON ref2_rel.relation_id = sa.reference_2_relationship
	LEFT OUTER JOIN other_address_proofs oap ON oap.address_proof_id = sa.other_address_proof_id
	LEFT OUTER JOIN ViewBasicSatsangCentreDetails sc ON sc.satsang_centre_id = sa.weekly_satsang_centre_id
	LEFT OUTER JOIN ViewBasicSatsangCentreDetails ref1_scd ON ref1_scd.satsang_centre_id = sa.reference_1_centre_id
	LEFT OUTER JOIN ViewBasicSatsangCentreDetails ref2_scd ON ref2_scd.satsang_centre_id = sa.reference_2_centre_id
	LEFT OUTER JOIN ViewBasicSatsangCentreDetails security_scd ON security_scd.satsang_centre_id = sa.security_approver_centre_id
	LEFT OUTER JOIN ViewBasicSatsangCentreDetails sewa_samiti_scd ON sewa_samiti_scd.satsang_centre_id = sa.sewa_samiti_approver_centre_id
	LEFT OUTER JOIN ViewBasicSatsangCentreDetails area_secretary_scd ON area_secretary_scd.satsang_centre_id = sa.area_secretary_centre_id
	LEFT OUTER JOIN ViewBasicSatsangCentreDetails secretary_scd ON secretary_scd.satsang_centre_id = sa.secretary_centre_id
	LEFT OUTER JOIN ViewBasicSatsangCentreDetails sponsorer_scd ON sponsorer_scd.satsang_centre_id = sa.sponsorer_centre_id
	LEFT OUTER JOIN ViewSewadarHeader ref1_vs ON ref1_vs.sewadar_id = sa.reference_1_sewadar_id
	LEFT OUTER JOIN ViewSewadarHeader ref2_vs ON ref2_vs.sewadar_id = sa.reference_2_sewadar_id
	LEFT OUTER JOIN ViewSewadarHeader sa_vs ON sa_vs.sewadar_id = sa.security_approver_centre_id
	LEFT OUTER JOIN ViewSewadarHeader ss_vs ON ss_vs.sewadar_id = sa.sewa_samiti_approver_id
	LEFT OUTER JOIN ViewSewadarHeader sp_vs ON sp_vs.sewadar_id = sa.sponsorer_id
	LEFT OUTER JOIN satsang_centre_functionaries a_scf ON a_scf.centre_functionary_id = sa.area_secretary_id
	LEFT OUTER JOIN satsang_centre_functionaries s_scf ON s_scf.centre_functionary_id = sa.secretary_id
GO
-- =============================================================================

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertSewadarApplicationQualification
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertSewadarApplicationQualification'
			)
	BEGIN
		DROP PROCEDURE  dbo.InsertSewadarApplicationQualification
	END
GO
CREATE PROCEDURE dbo.InsertSewadarApplicationQualification
(
	@sewadar_application_id		int,
	@qualification_sq			display_order,
	@qualification_id			qualification_id,
	@qlfctn_subject_id			qlfctn_subject_id = NULL
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO sewadar_application_qualifications
	(
		sewadar_application_id, qualification_sq, qualification_id, qlfctn_subject_id
	)
	VALUES
	(
		@sewadar_application_id, @qualification_sq, @qualification_id, @qlfctn_subject_id
	)
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateSewadarApplicationQualification
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateSewadarApplicationQualification'
			)
	BEGIN
		DROP PROCEDURE  dbo.UpdateSewadarApplicationQualification
	END
GO
CREATE PROCEDURE dbo.UpdateSewadarApplicationQualification
(
	@sewadar_application_id		int,
	@qualification_sq			display_order,
	@old_qualification_sq	    display_order,
	@qualification_id			qualification_id,
	@qlfctn_subject_id			qlfctn_subject_id
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    sewadar_application_qualifications
	SET
		qualification_id			=	@qualification_id,
		qlfctn_subject_id			=	@qlfctn_subject_id,
		qualification_sq			=	@qualification_sq
	WHERE
		sewadar_application_id		=	@sewadar_application_id
	AND	qualification_sq			=	@old_qualification_sq
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	DeleteSewadarApplicationQualification
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteSewadarApplicationQualification'
			)
	BEGIN
		DROP PROCEDURE  dbo.DeleteSewadarApplicationQualification
	END
GO
CREATE PROCEDURE dbo.DeleteSewadarApplicationQualification
(
	@sewadar_application_id		int,
	@qualification_sq			display_order,
	@qualification_id			qualification_id,
	@qlfctn_subject_id			qlfctn_subject_id
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM sewadar_application_qualifications
	WHERE (1 = 2) --ADD YOUR WHERE CLAUSE
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	QuerySewadarApplicationQualification
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QuerySewadarApplicationQualification'
			)
	BEGIN
		DROP PROCEDURE  dbo.QuerySewadarApplicationQualification
	END
GO
CREATE PROCEDURE dbo.QuerySewadarApplicationQualification
(
	@sewadar_application_id		int
)
WITH ENCRYPTION
AS
BEGIN

	SELECT	
		PQ.qualification_sq,
		PQ.qualification_id,
		cdb..qualifications.qualification_nm,
		PQ.qlfctn_subject_id,
		old_qualification_sq = PQ.qualification_sq,
		old_qualification_id = 	PQ.qualification_id,
		cdb..qlfctn_subjects.qlfctn_subject_nm
	FROM sewadar_application_qualifications PQ
	INNER JOIN	cdb..qualifications ON	PQ.qualification_id=cdb..qualifications.qualification_id
	LEFT OUTER JOIN      cdb..qlfctn_subjects ON	PQ.qlfctn_subject_id=cdb..qlfctn_subjects.qlfctn_subject_id 
	WHERE
		sewadar_application_id			=	@sewadar_application_id
	ORDER BY PQ.qualification_sq
END
GO
-- =============================================================================



-- vim:ts=4 sw=4 ht=4
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertSewadarApplicationOtherDisabilitie
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertSewadarApplicationOtherDisabilitie'
			)
	BEGIN
		DROP PROCEDURE  dbo.InsertSewadarApplicationOtherDisabilitie
	END
GO
CREATE PROCEDURE dbo.InsertSewadarApplicationOtherDisabilitie
(
	@sewadar_application_id		int,
	@medical_disability_id		medical_disability_id,
	@medical_disability_sq		display_order
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO sewadar_application_other_disabilities
	(
		sewadar_application_id, medical_disability_id, medical_disability_sq
	)
	VALUES
	(
		@sewadar_application_id, @medical_disability_id, @medical_disability_sq
	)
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateSewadarApplicationOtherDisabilitie
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateSewadarApplicationOtherDisabilitie'
			)
	BEGIN
		DROP PROCEDURE  dbo.UpdateSewadarApplicationOtherDisabilitie
	END
GO
CREATE PROCEDURE dbo.UpdateSewadarApplicationOtherDisabilitie
(
	@sewadar_application_id		int,
	@medical_disability_id		medical_disability_id,
	@old_medical_disability_id	medical_disability_id,
	@medical_disability_sq		display_order
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    sewadar_application_other_disabilities
	SET
		medical_disability_id		=	@medical_disability_id
	WHERE
		sewadar_application_id		=	@sewadar_application_id
	AND medical_disability_id		=	@old_medical_disability_id
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	DeleteSewadarApplicationOtherDisabilitie
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteSewadarApplicationOtherDisabilitie'
			)
	BEGIN
		DROP PROCEDURE  dbo.DeleteSewadarApplicationOtherDisabilitie
	END
GO
CREATE PROCEDURE dbo.DeleteSewadarApplicationOtherDisabilitie
(
	@sewadar_application_id		int,
	@old_medical_disability_id		medical_disability_id,
	@medical_disability_sq		display_order
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM sewadar_application_other_disabilities
	WHERE
		sewadar_application_id		=	@sewadar_application_id
	AND medical_disability_id		=	@old_medical_disability_id
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	QuerySewadarApplicationOtherDisabilitie
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QuerySewadarApplicationOtherDisabilitie'
			)
	BEGIN
		DROP PROCEDURE  dbo.QuerySewadarApplicationOtherDisabilitie
	END
GO
CREATE PROCEDURE dbo.QuerySewadarApplicationOtherDisabilitie
(
	@sewadar_application_id		int
)
WITH ENCRYPTION
AS
BEGIN
	SELECT
		s.medical_disability_nm, 
		old_medical_disability_id = ss.medical_disability_id,
		ss.medical_disability_id,
		medical_disability_sq
	FROM sewadar_application_other_disabilities ss
	JOIN medical_disabilities s ON s.medical_disability_id = ss.medical_disability_id
	WHERE
		ss.sewadar_application_id = @sewadar_application_id
END
GO
-- =============================================================================



-- vim:ts=4 sw=4 ht=4
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertSewadarApplicationSkill
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertSewadarApplicationSkill'
			)
	BEGIN
		DROP PROCEDURE  dbo.InsertSewadarApplicationSkill
	END
GO
CREATE PROCEDURE dbo.InsertSewadarApplicationSkill
(
	@sewadar_application_id		int,
	@skill_id					skill_id,
	@skill_sq					display_order
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO sewadar_application_skills
	(
		sewadar_application_id, skill_id, skill_sq
	)
	VALUES
	(
		@sewadar_application_id, @skill_id, @skill_sq
	)
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateSewadarApplicationSkill
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateSewadarApplicationSkill'
			)
	BEGIN
		DROP PROCEDURE  dbo.UpdateSewadarApplicationSkill
	END
GO
CREATE PROCEDURE dbo.UpdateSewadarApplicationSkill
(
	@sewadar_application_id		int,
	@skill_id					skill_id,
	@old_skill_id		skill_id
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    sewadar_application_skills
	SET
		skill_id					=	@skill_id
	WHERE
		sewadar_application_id		=	@sewadar_application_id
	AND	skill_id					=	@old_skill_id
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	DeleteSewadarApplicationSkill
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteSewadarApplicationSkill'
			)
	BEGIN
		DROP PROCEDURE  dbo.DeleteSewadarApplicationSkill
	END
GO
CREATE PROCEDURE dbo.DeleteSewadarApplicationSkill
(
	@sewadar_application_id		int,
	@old_skill_id					skill_id
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM sewadar_application_skills
	WHERE
		sewadar_application_id		=	@sewadar_application_id
	AND	skill_id		=	@old_skill_id
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	QuerySewadarApplicationSkill
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QuerySewadarApplicationSkill'
			)
	BEGIN
		DROP PROCEDURE  dbo.QuerySewadarApplicationSkill
	END
GO
CREATE PROCEDURE dbo.QuerySewadarApplicationSkill
(
	@sewadar_application_id		int
)
WITH ENCRYPTION
AS
BEGIN

	SELECT
		s.skill_nm, 
		old_skill_id = ss.skill_id,
		ss.skill_id,
		skill_sq
	FROM sewadar_application_skills ss
	JOIN CDB..skills s ON s.skill_id = ss.skill_id
	WHERE
		sewadar_application_id = @sewadar_application_id
END
GO
-- =============================================================================



-- vim:ts=4 sw=4 ht=4

-- vim:ts=4 sw=4 ht=4
