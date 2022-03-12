-- =============================================================================
--	Procedure	ViewBasicSewadarsRegistrationInfo
-- =============================================================================
IF EXISTS	(	SELECT  *
				FROM    sysobjects
				WHERE name = 'ViewBasicSewadarsRegistrationInfo' and TYPE='v'				
			)
	BEGIN
		DROP View  ViewBasicSewadarsRegistrationInfo
	END
GO
CREATE View ViewBasicSewadarsRegistrationInfo

WITH ENCRYPTION
AS

	SELECT
		sr.sewadar_id,
		sr.satsang_centre_id,
		sc.centre_nm,
		sc.centre_cd,
		sr.weekly_sewa_location_id,
		sr.department_id,
		dep.department_nm,
		sr.weekly_department_id,
		sr.sub_department_id,
		sub_department_nm = sub_dep.sub_department_nm,
		sr.department_dt,
		sr.appointment_dt,
		sr.sewadar_grno,
		sr.sewadar_status_dtm,
		sr.sewadar_status_cd,
		ss.sewadar_status_nm,
		sr.responsibility_dtm,
		sr.responsibility, 
		sr.sewadar_type
	FROM sewadars_registrations sr
	JOIN departments dep ON sr.department_id = dep.department_id	
	LEFT OUTER JOIN sub_departments sub_dep ON sr.sub_department_id = sub_dep.sub_department_id
	LEFT OUTER JOIN sewadar_status ss ON sr.sewadar_status_cd = ss.sewadar_status_cd
	LEFT OUTER JOIN ViewBasicSatsangCentreDetails sc ON sc.satsang_centre_id = sr.satsang_centre_id
GO
