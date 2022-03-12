SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertSewadarsRegistration
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertSewadarsRegistration'
			)
	BEGIN
		DROP PROCEDURE  InsertSewadarsRegistration
	END
GO
CREATE PROCEDURE InsertSewadarsRegistration
(
	@satsang_centre_id				satsang_centre_id,
	@sewadar_grno					sewadar_grno,
	@sewadar_id						sewadar_id,
	@appointment_dt					smalldatetime,
	@is_outstation_sewadar			Boolean,
	@department_id					department_id,
	@sub_department_id				department_id = NULL,
	@department_dt					smalldatetime,
	@sewadar_status_cd				sewadar_status_cd,
	@sewadar_status_dtm				smalldatetime,
	@responsibility					responsibility = NULL,
	@responsibility_dtm				smalldatetime = NULL,
	@reference_1_sewadar_id			sewadar_id = NULL,
	@reference_1_relationship		relationship_id = NULL,
	@reference_1_nm					gnc_nm = NULL,
	@reference_1_centre_id			satsang_centre_id = NULL,
	@reference_1_department			varchar(20) = NULL,
	@reference_2_sewadar_id			sewadar_id = NULL,
	@reference_2_relationship		relationship_id = NULL,
	@reference_2_nm					gnc_nm = NULL,
	@reference_2_centre_id			satsang_centre_id = NULL,
	@reference_2_department			varchar(20) = NULL,
	@sponsorer_id					sewadar_id = NULL,
	@area_secretary_id				centre_functionary_id = NULL,
	@secretary_id					centre_functionary_id = NULL,
	@security_approver_id			sewadar_id,
	@sewa_samiti_approver_id		sewadar_id = NULL,
	@weekly_sewa_location_id		weekly_sewa_location_id = NULL,
	@weekly_department_id			department_id = NULL,
	@sewadar_type					sewadar_type = NULL,
	@sewa_id						sewa_id = NULL,
	@location_district_id 		    district_id = NULL
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO sewadars_registrations
	(
		satsang_centre_id, sewadar_grno, sewadar_id, appointment_dt, is_outstation_sewadar, department_id, sub_department_id, department_dt, sewadar_status_cd, sewadar_status_dtm, responsibility, responsibility_dtm, reference_1_sewadar_id, reference_1_relationship, reference_1_nm, reference_1_centre_id, reference_1_department, reference_2_sewadar_id, reference_2_relationship, reference_2_nm, reference_2_centre_id, reference_2_department, sponsorer_id, area_secretary_id, secretary_id, security_approver_id, sewa_samiti_approver_id, weekly_sewa_location_id, weekly_department_id, sewadar_type, location_district_id, sewa_id
	)
	VALUES
	(
		@satsang_centre_id, @sewadar_grno, @sewadar_id, @appointment_dt, @is_outstation_sewadar, @department_id, @sub_department_id, @department_dt, @sewadar_status_cd, @sewadar_status_dtm, @responsibility, @responsibility_dtm, @reference_1_sewadar_id, @reference_1_relationship, @reference_1_nm, @reference_1_centre_id, @reference_1_department, @reference_2_sewadar_id, @reference_2_relationship, @reference_2_nm, @reference_2_centre_id, @reference_2_department, @sponsorer_id, @area_secretary_id, @secretary_id, @security_approver_id, @sewa_samiti_approver_id, @weekly_sewa_location_id, @weekly_department_id, @sewadar_type, @location_district_id, @sewa_id
	)
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateSewadarsRegistration
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateSewadarsRegistration'
			)
	BEGIN
		DROP PROCEDURE  UpdateSewadarsRegistration
	END
GO
CREATE PROCEDURE UpdateSewadarsRegistration
(
	@satsang_centre_id				satsang_centre_id,
	@sewadar_grno					sewadar_grno,
	@sewadar_id						sewadar_id,
	@appointment_dt					smalldatetime,
	@is_outstation_sewadar			Boolean,
	@department_id					department_id,
	@sub_department_id				department_id,
	@department_dt					smalldatetime,
	@sewadar_status_cd				sewadar_status_cd,
	@sewadar_status_dtm				smalldatetime,
	@responsibility					responsibility,
	@responsibility_dtm				smalldatetime,
	@reference_1_sewadar_id			sewadar_id,
	@reference_1_relationship		relationship_id,
	@reference_1_nm					gnc_nm,
	@reference_1_centre_id			satsang_centre_id,
	@reference_1_department			varchar(20),
	@reference_2_sewadar_id			sewadar_id,
	@reference_2_relationship		relationship_id,
	@reference_2_nm					gnc_nm,
	@reference_2_centre_id			satsang_centre_id,
	@reference_2_department			varchar(20),
	@sponsorer_id					sewadar_id,
	@area_secretary_id				centre_functionary_id,
	@secretary_id					centre_functionary_id,
	@security_approver_id			sewadar_id,
	@sewa_samiti_approver_id		sewadar_id,
	@weekly_sewa_location_id		weekly_sewa_location_id,
	@weekly_department_id			department_id,
	@sewadar_type					sewadar_type,
	@sewa_id						sewa_id = NULL,
	@location_district_id 		    district_id,
	@txn_ts							timestamp
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    sewadars_registrations
	SET
		sewadar_id						=	@sewadar_id,
		appointment_dt					=	@appointment_dt,
		is_outstation_sewadar			=	@is_outstation_sewadar,
		sewadar_status_cd				=	@sewadar_status_cd,
		sewadar_status_dtm				=	@sewadar_status_dtm,
		responsibility					=	@responsibility,
		responsibility_dtm				=	@responsibility_dtm,
		reference_1_sewadar_id			=	@reference_1_sewadar_id,
		reference_1_relationship		=	@reference_1_relationship,
		reference_1_nm					=	@reference_1_nm,
		reference_1_centre_id			=	@reference_1_centre_id,
		reference_1_department			=	@reference_1_department,
		reference_2_sewadar_id			=	@reference_2_sewadar_id,
		reference_2_relationship		=	@reference_2_relationship,
		reference_2_nm					=	@reference_2_nm,
		reference_2_centre_id			=	@reference_2_centre_id,
		reference_2_department			=	@reference_2_department,
		sponsorer_id					=	@sponsorer_id,
		area_secretary_id				=	@area_secretary_id,
		secretary_id					=	@secretary_id,
		security_approver_id			=	@security_approver_id,
		sewa_samiti_approver_id			=	@sewa_samiti_approver_id,
		weekly_sewa_location_id			=	@weekly_sewa_location_id,
		weekly_department_id			=	@weekly_department_id,
		sewadar_type					=	@sewadar_type,
		sewa_id							=	@sewa_id,
		location_district_id 		    =	@location_district_id
	WHERE
		satsang_centre_id				=	@satsang_centre_id
	AND	sewadar_grno					=	@sewadar_grno
	AND txn_ts						=	@txn_ts
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
--	Procedure	CancelOpenOrTraineeSewadar
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='CancelOpenOrTraineeSewadar'
			)
	BEGIN
		DROP PROCEDURE  CancelOpenOrTraineeSewadar
	END
GO
CREATE PROCEDURE CancelOpenOrTraineeSewadar
(
	@satsang_centre_id				satsang_centre_id,
	@sewadar_grno					sewadar_grno,
	@txn_ts							timestamp
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE sewadars_registrations
	set 
		sewadar_status_cd = 'Cncl',
		sewadar_status_dtm = GetDate()
	WHERE
		satsang_centre_id				=	@satsang_centre_id
	AND	sewadar_grno					=	@sewadar_grno
	AND txn_ts=	@txn_ts
	AND sewadar_status_cd IN ('Trn','Open')
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
--	Procedure	DeleteSewadarsRegistration
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteSewadarsRegistration'
			)
	BEGIN
		DROP PROCEDURE  DeleteSewadarsRegistration
	END
GO
CREATE PROCEDURE DeleteSewadarsRegistration
(
	@satsang_centre_id				satsang_centre_id,
	@sewadar_grno					sewadar_grno,
	@txn_ts							timestamp
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM sewadars_registrations
	WHERE
		satsang_centre_id				=	@satsang_centre_id
	AND	sewadar_grno					=	@sewadar_grno
	AND txn_ts=	@txn_ts
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
--	Procedure	ViewSewadarsRegistration
-- =============================================================================
IF EXISTS	(	SELECT  *
				FROM    sysobjects
				WHERE name = 'ViewSewadarsRegistration' and TYPE='v'
			)

	BEGIN
		DROP VIEW ViewSewadarsRegistration
	END
GO
CREATE VIEW ViewSewadarsRegistration

WITH ENCRYPTION
AS
	SELECT
		sr.is_outstation_sewadar,
		sr.satsang_centre_id,
		sr.weekly_sewa_location_id,
		wsl.weekly_sewa_location_nm,
		dep.department_nm,
		sr.department_id,
		weekly_department_nm = weekly_dep.department_nm,
		sr.weekly_department_id,
		sub_department_nm = sub_dep.sub_department_nm,
		sr.sub_department_id,
		sr.sewadar_status_cd,
		st.global_sewadar_status_dt,
		sr.department_dt,
		sr.appointment_dt,
		sr.sewadar_grno,
		ss.sewadar_status_nm,
		sr.sewadar_status_dtm,
		st.gender,
		st.age,
		st.global_sewadar_status_nm,
		st.centre_nm,
		st.full_nm,
		st.sewadar_id,

		sp_centre_nm = sp_vs.centre_nm,
		sp_centre_id = sp_vs.satsang_centre_id,
		sp_sewadar_grno = sp_vs.sewadar_grno,
		sp_sponsorer_id = sr.sponsorer_id,
		sp_full_nm = sp_vs.full_nm,
		sp_responsibility = sp_vs.responsibility,
		sp_sewadar_id = sr.sponsorer_id,
		sp_sewadar_status = sp_vs.sewadar_status_nm,
		sp_years_in_sewa = DATEDIFF(YEAR, sp_vs.appointment_dt, GETDATE()) ,

		s_centre_nm = s_scd.centre_nm,
		s_centre_id = s_scf.satsang_centre_id,
		s_full_nm = s_scf.functionary_nm,
		sr.secretary_id,

		as_centre_id = a_scf.satsang_centre_id,
		as_centre_nm = a_scd.centre_nm,
		as_full_nm = a_scf.functionary_nm,
		sr.area_secretary_id,

		sa_centre_nm = sa_vs.centre_nm,
		sa_centre_id = sa_vs.satsang_centre_id,
		sa_sewadar_grno = sa_vs.sewadar_grno,
		sa_sewadar_id = sr.security_approver_id,
		sa_full_nm = sa_vs.full_nm,
		reference_2_centre_nm = COALESCE(ref2_scd.centre_nm, ref2_vs.centre_nm),
		reference_2_centre_id = COALESCE(sr.reference_2_centre_id, ref2_vs.satsang_centre_id),
		app_responsibility = sa_vs.responsibility,
		app_sewadar_status = sa_vs.sewadar_status_nm,
		app_years_in_sewa = DATEDIFF(YEAR, sa_vs.appointment_dt, GETDATE()) ,

		sr.reference_2_sewadar_id,
		reference_2_relationship_nm = ref2_rel.relation_nm,
		sr.reference_2_relationship,
		reference_2_department = COALESCE(sr.reference_2_department, ref2_vs.full_department_nm),
		ref2_sewadar_grno = ref2_vs.sewadar_grno,
		reference_2_nm = COALESCE(sr.reference_2_nm, ref2_vs.full_nm),
		ref2_sewadar_id = ref2_vs.sewadar_id,
				
		reference_1_centre_nm = COALESCE(ref1_scd.centre_nm, ref1_vs.centre_nm),
		reference_1_centre_id = COALESCE(sr.reference_1_centre_id, ref1_vs.satsang_centre_id),
		reference_1_relationship_nm = ref1_rel.relation_nm,
		sr.reference_1_relationship,
		reference_1_department = COALESCE(sr.reference_1_department, ref1_vs.full_department_nm),
		reference_1_nm = COALESCE(sr.reference_1_nm, ref1_vs.full_nm),
		ref1_sewadar_grno = ref1_vs.sewadar_grno,
		ref1_sewadar_id = ref1_vs.sewadar_id,
		
		ss_centre_nm = ss_vs.centre_nm,
		ss_centre_id = ss_vs.satsang_centre_id,
		ss_sewadar_grno = ss_vs.sewadar_grno,
		ss_sewadar_id = sr.sewa_samiti_approver_id,
		ss_full_nm = ss_vs.full_nm,
		ss_responsibility = ss_vs.responsibility,
		ss_sewadar_status = ss_vs.sewadar_status_nm,
		ss_years_in_sewa = DATEDIFF(YEAR, ss_vs.appointment_dt, GETDATE()) ,
		sr.responsibility_dtm,
		sr.responsibility, 
		sr.sewadar_type,
		doc.district_or_city_id,
		doc.district_nm,
		sr.sewa_id,
		sewa.sewa_nm,
		sewa.finish_dt,
		sewa.start_dt,
		sd.occupation,
		states.state_id,
		states.state_nm,
		sr.txn_ts
	FROM sewadars_registrations sr
	JOIN ViewSewadarsTableOnly st ON st.sewadar_id = sr.sewadar_id
	JOIN sewadars_details sd ON sd.sewadar_id = sr.sewadar_id
	JOIN departments dep ON sr.department_id = dep.department_id	
	LEFT OUTER JOIN sewadar_status ss ON sr.sewadar_status_cd = ss.sewadar_status_cd
	LEFT OUTER JOIN departments weekly_dep ON sr.weekly_department_id = weekly_dep.department_id	
	LEFT OUTER JOIN sub_departments sub_dep ON sr.sub_department_id = sub_dep.sub_department_id
	LEFT OUTER JOIN sewas sewa ON sewa.sewa_id = sr.sewa_id
	LEFT OUTER JOIN ViewSewadarHeader sp_vs ON sp_vs.sewadar_id = sr.sponsorer_id
	LEFT OUTER JOIN ViewSewadarHeader ss_vs ON ss_vs.sewadar_id = sr.sewa_samiti_approver_id
	LEFT OUTER JOIN ViewSewadarHeader sa_vs ON sa_vs.sewadar_id = sr.security_approver_id
	LEFT OUTER JOIN satsang_centre_functionaries a_scf ON a_scf.centre_functionary_id = sr.area_secretary_id
	LEFT OUTER JOIN ViewBasicSatsangCentreDetails a_scd ON a_scd.satsang_centre_id = a_scf.satsang_centre_id
	LEFT OUTER JOIN satsang_centre_functionaries s_scf ON s_scf.centre_functionary_id = sr.secretary_id
	LEFT OUTER JOIN ViewBasicSatsangCentreDetails s_scd ON s_scd.satsang_centre_id = s_scf.satsang_centre_id
	LEFT OUTER JOIN CDB..relations ref1_rel ON ref1_rel.relation_id = sr.reference_1_relationship
	LEFT OUTER JOIN CDB..relations ref2_rel ON ref2_rel.relation_id = sr.reference_2_relationship
	LEFT OUTER JOIN ViewBasicSatsangCentreDetails ref1_scd ON ref1_scd.satsang_centre_id = sr.reference_1_centre_id
	LEFT OUTER JOIN ViewBasicSatsangCentreDetails ref2_scd ON ref2_scd.satsang_centre_id = sr.reference_2_centre_id
	LEFT OUTER JOIN ViewSewadarHeader ref1_vs ON ref1_vs.sewadar_id = sr.reference_1_sewadar_id
	LEFT OUTER JOIN ViewSewadarHeader ref2_vs ON ref2_vs.sewadar_id = sr.reference_2_sewadar_id
	LEFT OUTER JOIN weekly_sewa_locations wsl ON wsl.weekly_sewa_location_id = sr.weekly_sewa_location_id
	LEFT OUTER JOIN CDB..districts_or_cities doc ON doc.district_or_city_id = sr.location_district_id
	LEFT OUTER JOIN CDB..states states ON doc.state_id = states.state_id
GO
-- =============================================================================



-- vim:ts=4 sw=4 ht=4

