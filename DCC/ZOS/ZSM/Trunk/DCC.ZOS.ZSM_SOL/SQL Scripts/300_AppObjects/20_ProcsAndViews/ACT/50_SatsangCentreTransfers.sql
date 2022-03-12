
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================================================
--	Procedure	ViewSatsangCentreTransfers
-- =============================================================================
IF EXISTS	(	SELECT  *
				FROM    sysobjects
				WHERE name = 'ViewSatsangCentreTransfers' and TYPE='v'
			)

	BEGIN
		DROP VIEW ViewSatsangCentreTransfers
	END
GO
CREATE VIEW ViewSatsangCentreTransfers

WITH ENCRYPTION
AS
	SELECT
		ssct.old_satsang_centre_id, 
		old_satsang_centre_nm =  old_vsd.centre_nm,
		ssct.old_sewadar_grno, 
		ssct.satsang_centre_id, 
		satsang_centre_nm =  vsd.centre_nm,
		ssct.sewadar_grno, 
		ssct.effective_dt, 
		vsr.department_id, 
		vsr.department_nm,
		vsr.sub_department_nm,
		vsr.sub_department_id, 
		vsr.is_outstation_sewadar, 
		vsr.sp_centre_id,
		vsr.sp_centre_nm,
		vsr.sp_full_nm,
		vsr.sp_sewadar_grno,
		vsr.sp_sewadar_id,
		vsr.sp_sewadar_status,
		vsr.sp_sponsorer_id,
		vsr.sp_years_in_sewa,
		vsr.area_secretary_id,
		vsr.as_centre_id,
		vsr.as_centre_nm,
		vsr.as_full_nm,
		vsr.secretary_id,
		vsr.s_centre_id,
		vsr.s_centre_nm,
		vsr.s_full_nm,
		ssct.remarks
	FROM sewadars_satsang_centre_transfers ssct
	JOIN ViewSatsangCentreDetails old_vsd ON ssct.old_satsang_centre_id = old_vsd.satsang_centre_id
	JOIN ViewSatsangCentreDetails vsd ON ssct.satsang_centre_id = vsd.satsang_centre_id
	JOIN ViewSewadarsRegistration vsr On vsr.sewadar_grno = ssct.sewadar_grno AND vsd.satsang_centre_id = ssct.satsang_centre_id
GO

