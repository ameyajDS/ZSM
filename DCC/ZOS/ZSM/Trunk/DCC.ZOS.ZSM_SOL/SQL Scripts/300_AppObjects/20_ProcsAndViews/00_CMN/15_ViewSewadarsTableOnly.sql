-- =============================================================================
--	Procedure	ViewSewadarsTableOnly
-- =============================================================================
IF EXISTS	(	SELECT  *
				FROM    sysobjects
				WHERE name = 'ViewSewadarsTableOnly' and TYPE='v'				
			)
	BEGIN
		DROP View  ViewSewadarsTableOnly
	END
GO
CREATE View ViewSewadarsTableOnly

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
		ip.place_nm,
		s.initiation_by, 
		s.current_satsang_centre_id, -- define where clause on this column 
		s.global_sewadar_status_cd, 
		s.global_sewadar_status_dt,
		s.current_sewadar_grno, 
		global_sewadar_status_nm = ss_g.sewadar_status_nm,
		sc.centre_nm,
		sc.centre_cd,
		s.txn_ts
	FROM sewadars s
	LEFT OUTER JOIN sewadar_status ss_g ON s.global_sewadar_status_cd  = ss_g.sewadar_status_cd
	LEFT OUTER JOIN CDB..initiation_places ip ON ip.place_id = s.initiation_place_id
	LEFT OUTER JOIN ViewBasicSatsangCentreDetails sc ON sc.satsang_centre_id = s.current_satsang_centre_id

GO
