SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	QuerySewadarHistory
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QuerySewadarHistory'
			)
	BEGIN
		DROP PROCEDURE  QuerySewadarHistory
	END
GO
CREATE PROCEDURE QuerySewadarHistory
(
	@sewadar_id			sewadar_id
)
WITH ENCRYPTION
AS
BEGIN
SELECT
		department_nm = dep.department_nm + ISNULL(' (' + sub_dep.sub_department_nm +')', ''),
		sr.sewadar_status_cd,
		vs.global_sewadar_status_dt,
		sr.department_dt,
		sr.appointment_dt,
		sr.sewadar_grno,
		sr.sewadar_status_dtm,
		sr.sewadar_status_cd,
		sr.satsang_centre_id,
		sr.is_outstation_sewadar,
		vsd.centre_nm,
		sr.responsibility, 
		wsl.weekly_sewa_location_nm
	FROM sewadars_registrations sr
	JOIN sewadars vs ON vs.sewadar_id = sr.sewadar_id
	JOIN ViewBasicSatsangCentreDetails vsd ON vsd.satsang_centre_id = sr.satsang_centre_id	
	JOIN departments dep ON sr.department_id = dep.department_id	
	LEFT JOIN sub_departments sub_dep ON sr.sub_department_id = sub_dep.sub_department_id
	LEFT OUTER JOIN weekly_sewa_locations wsl ON wsl.weekly_sewa_location_id = sr.weekly_sewa_location_id
	WHERE sr.sewadar_id = @sewadar_id
END
GO

