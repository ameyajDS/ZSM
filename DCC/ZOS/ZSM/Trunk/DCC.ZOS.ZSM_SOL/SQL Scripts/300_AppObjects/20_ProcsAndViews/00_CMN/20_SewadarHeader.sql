SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	ViewSatsangCentres
-- =============================================================================
IF EXISTS	(	SELECT  *
				FROM    sysobjects
				WHERE name = 'ViewSatsangCentres' and TYPE='v'				
			)
	BEGIN
		DROP View  ViewSatsangCentres
	END
GO
CREATE View ViewSatsangCentres

WITH ENCRYPTION
AS

	SELECT
		sc.satsang_centre_id, 
		sc.satsang_centre_cd, 
		sc.satsang_centre_nm, 
		sc.satsang_centre_type, 
		sc.address_line_1, 
		sc.address_line_2, 	
		post_office_or_city_id = null,
		post_office_or_city_nm = null,
		dc.district_nm, 
		sc.district_or_city_id,
		sc.pin_or_zip_code,
		s.state_nm as StateName,
		s.state_id as StateId,
		c.country_nm as CoutryName,
		c.country_id as CoutryId,
		cl.colour_id,
		cl.colour_nm,
		sc.secretary, 
		sc.telephones, 
		sc.email_addresses, 
		sc.fax_lines, 
		sc.txn_ts, 
		sc.effective_from, 
		sc.effective_till,
		scd.is_main_centre,
		scd.centre_cd,
		scd.remarks,
		scd.reports_to_centre_id,
		scd.centre_alphabet,
		scd.centre_nm,		
		other_sc.satsang_centre_nm as reporting_centre_nm
	FROM satsang_centres_details scd  
	JOIN cdb..satsang_centres sc ON sc.satsang_centre_id = scd.satsang_centre_id
	LEFT JOIN cdb..districts_or_cities dc ON dc.district_or_city_id = sc.district_or_city_id
	--LEFT JOIN post_offices_or_cities pc ON pc.district_id = dc.district_or_city_id
		LEFT JOIN colours cl ON cl.colour_id = scd.colour_id
	LEFT JOIN CDB..states s ON s.state_id = dc.state_id
	LEFT JOIN CDB..countries c ON c.country_id = s.country_id
	LEFT JOIN satsang_centres_details other_scd ON other_scd.satsang_centre_id = scd.reports_to_centre_id
	LEFT JOIN CDB..satsang_centres other_sc ON other_sc.satsang_centre_id = other_scd.satsang_centre_id


GO

-- =============================================================================
--	Procedure	ViewSewadarHeader
-- =============================================================================
IF EXISTS	(	SELECT  *
				FROM    sysobjects
				WHERE name = 'ViewSewadarHeader' and TYPE='v'
			)

	BEGIN
		DROP VIEW ViewSewadarHeader
	END
GO
CREATE VIEW ViewSewadarHeader

WITH ENCRYPTION
AS
	SELECT
		s.sewadar_id, 
		s.first_nm, 
		s.middle_nm, 
		s.last_nm, 
		full_nm = s.first_nm + ' ' + SUBSTRING(s.middle_nm, 1,1) + ' ' + s.last_nm,
		s.gender, 
		s.birth_dtm, 
		age = DATEDIFF(year, s.birth_dtm, GETDATE()),
		s.is_married, 
		s.initiation_dt, 
		s.initiation_place_id, 
		s.place_nm,
		s.initiation_by, 
		s.current_satsang_centre_id AS satsang_centre_id, -- define where clause on this column 
		s.global_sewadar_status_cd, 
		s.global_sewadar_status_dt,
		s.current_sewadar_grno AS sewadar_grno, 
		sr.sewadar_type,
		sr.sewadar_status_dtm,
		s.global_sewadar_status_nm,
		s.centre_nm,
		s.centre_cd,
		sewadar_status_dt = COALESCE(s.global_sewadar_status_dt, sr.sewadar_status_dtm),
		sewadar_status_nm = COALESCE(s.global_sewadar_status_nm, sr.sewadar_status_nm),
		sewadar_status_cd = COALESCE(s.global_sewadar_status_nm, sr.sewadar_status_cd),
		sr.responsibility,
		sr.department_dt,
		sr.appointment_dt,
		sr.department_nm,
		sr.sub_department_nm,
		full_department_nm = sr.department_nm + ISNULL( ' (' + sr.sub_department_nm + ')', ''),
		sr.department_id,
		sr.sub_department_id,
		sd.weekly_satsang_centre_id,
		weekly_satsang_centre_nm = sc.centre_nm,
		sr.weekly_sewa_location_id,
		F7Column = SUBSTRING(s.gender,1,1) + s.first_nm + s.last_nm,
		F8Column = SUBSTRING(s.gender,1,1) + s.last_nm + s.first_nm ,
		s.txn_ts
	FROM ViewSewadarsTableOnly s
	LEFT OUTER JOIN sewadars_details sd ON sd.sewadar_id = s.sewadar_id
	LEFT OUTER JOIN ViewBasicSatsangCentreDetails sc ON sc.satsang_centre_id = sd.weekly_satsang_centre_id
	LEFT OUTER JOIN ViewBasicSewadarsRegistrationInfo sr  ON 
		s.current_satsang_centre_id = sr.satsang_centre_id	AND s.current_sewadar_grno = sr.sewadar_grno
GO

-- =============================================================================
--	Procedure	ViewSewadarHeaderOnGRNo
-- =============================================================================
IF EXISTS	(	SELECT  *
				FROM    sysobjects
				WHERE name = 'ViewSewadarHeaderOnGRNo' and TYPE='v'
			)

	BEGIN
		DROP VIEW ViewSewadarHeaderOnGRNo
	END
GO
CREATE VIEW ViewSewadarHeaderOnGRNo

WITH ENCRYPTION
AS
	SELECT
		s.sewadar_id, 
		s.first_nm, 
		s.middle_nm, 
		s.last_nm, 
		full_nm = s.first_nm + ' ' + SUBSTRING(s.middle_nm, 1,1) + ' ' + s.last_nm,
		s.gender, 
		s.birth_dtm, 
		age = DATEDIFF(year, s.birth_dtm, GETDATE()),
		s.is_married, 
		s.initiation_dt, 
		s.initiation_place_id, 
		s.place_nm,
		s.initiation_by, 
		sr.satsang_centre_id,
		s.global_sewadar_status_cd, 
		s.global_sewadar_status_dt,
		sr.sewadar_grno,
		sr.sewadar_type,
		sr.sewadar_status_dtm,
		s.global_sewadar_status_nm,
		sr.centre_nm,
		sr.centre_cd,
		sewadar_status_dt = COALESCE(s.global_sewadar_status_dt, sr.sewadar_status_dtm),
		sewadar_status_nm = COALESCE(s.global_sewadar_status_nm, sr.sewadar_status_nm),
		sewadar_status_cd = COALESCE(s.global_sewadar_status_cd, sr.sewadar_status_cd),
		sr.responsibility,
		sr.department_dt,
		sr.appointment_dt,
		sr.department_nm,
		sr.sub_department_nm,
		full_department_nm = sr.department_nm + ISNULL( ' (' + sr.sub_department_nm + ')', ''),
		sr.department_id,
		sr.sub_department_id,
		sd.weekly_satsang_centre_id,
		weekly_satsang_centre_nm = sc.centre_nm,
		sr.weekly_sewa_location_id,
		F7Column = SUBSTRING(s.gender,1,1) + s.first_nm + s.last_nm,
		F8Column = SUBSTRING(s.gender,1,1) + s.last_nm + s.first_nm ,
		s.txn_ts
	FROM ViewBasicSewadarsRegistrationInfo sr
	JOIN ViewSewadarsTableOnly s ON s.sewadar_id = sr.sewadar_id
	LEFT OUTER JOIN sewadars_details sd ON sd.sewadar_id = s.sewadar_id
	LEFT OUTER JOIN ViewBasicSatsangCentreDetails sc ON sc.satsang_centre_id = sd.weekly_satsang_centre_id
GO
-- =============================================================================

