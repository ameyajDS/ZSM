SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertSewadarWiseSewaSummarie
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertSewadarWiseSewaSummarie'
			)
	BEGIN
		DROP PROCEDURE  InsertSewadarWiseSewaSummarie
	END
GO
CREATE PROCEDURE InsertSewadarWiseSewaSummarie
(
	@sewa_id				sewa_id,
	@satsang_centre_id		satsang_centre_id,
	@sewadar_grno			sewadar_grno,
	@present_cnt			CreditCntF0,
	@exempt_cnt				CreditCntF0,
	@leave_cnt				CreditCntF0,
	@absent_cnt				CreditCntF0,
	@is_system_recorded		Boolean
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO sewadar_wise_sewa_summaries
	(
		sewa_id, satsang_centre_id, sewadar_grno, present_cnt, exempt_cnt, leave_cnt, absent_cnt, is_system_recorded
	)
	VALUES
	(
		@sewa_id, @satsang_centre_id, @sewadar_grno, @present_cnt, @exempt_cnt, @leave_cnt, @absent_cnt, @is_system_recorded
	)
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateSewadarWiseSewaSummarie
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateSewadarWiseSewaSummarie'
			)
	BEGIN
		DROP PROCEDURE  UpdateSewadarWiseSewaSummarie
	END
GO
CREATE PROCEDURE UpdateSewadarWiseSewaSummarie
(
	@sewa_id				sewa_id,
	@satsang_centre_id		satsang_centre_id,
	@sewadar_grno			sewadar_grno,
	@present_cnt			CreditCntF0,
	@exempt_cnt				CreditCntF0,
	@leave_cnt				CreditCntF0,
	@absent_cnt				CreditCntF0,
	@is_system_recorded		Boolean,
	
	@old_sewa_id			sewa_id,
	@old_satsang_centre_id	satsang_centre_id,
	@old_sewadar_grno		sewadar_grno
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    sewadar_wise_sewa_summaries
	SET
		sewa_id					=	@sewa_id,
		satsang_centre_id		=	@satsang_centre_id,
		sewadar_grno			=	@sewadar_grno,
		present_cnt				=	@present_cnt,
		exempt_cnt				=	@exempt_cnt,
		leave_cnt				=	@leave_cnt,
		absent_cnt				=	@absent_cnt,
		is_system_recorded		=	@is_system_recorded
	WHERE 
		sewa_id = @old_sewa_id AND 
		satsang_centre_id = @old_satsang_centre_id AND
		sewadar_grno = @old_sewadar_grno		
	
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	DeleteSewadarWiseSewaSummarie
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteSewadarWiseSewaSummarie'
			)
	BEGIN
		DROP PROCEDURE  DeleteSewadarWiseSewaSummarie
	END
GO
CREATE PROCEDURE DeleteSewadarWiseSewaSummarie
(
	@old_sewa_id				sewa_id,
	@old_satsang_centre_id		satsang_centre_id,
	@old_sewadar_grno			sewadar_grno

)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM sewadar_wise_sewa_summaries
	WHERE sewa_id = @old_sewa_id
	AND satsang_centre_id = @old_satsang_centre_id
	AND sewadar_grno = @old_sewadar_grno
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	QuerySewadarWiseSewaSummarie
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QuerySewadarWiseSewaSummarie'
			)
	BEGIN
		DROP PROCEDURE  QuerySewadarWiseSewaSummarie
	END
GO
CREATE PROCEDURE QuerySewadarWiseSewaSummarie
(
	@satsang_centre_id		satsang_centre_id,
	@sewadar_grno			sewadar_grno
)
WITH ENCRYPTION
AS
BEGIN
	EXEC SummariseSewasForSewadar @satsang_centre_id, @sewadar_grno;

	SELECT
		swss.sewa_id, 
		swss.satsang_centre_id, 
		swss.sewadar_grno, 
		swss.present_cnt, 
		swss.exempt_cnt, 
		swss.leave_cnt, 
		swss.absent_cnt, 
		s.start_dt, 
		s.sewa_nm,
		s.finish_dt,
		swss.is_system_recorded
	FROM sewadar_wise_sewa_summaries swss
	JOIN sewas s ON s.sewa_id = swss.sewa_id
	WHERE
		swss.satsang_centre_id 	= 	@satsang_centre_id
	AND	swss.sewadar_grno		=	@sewadar_grno
	AND	s.referred_sewa_id IS NULL
	ORDER BY s.start_dt DESC
END
GO
-- =============================================================================


-- =============================================================================
--	Procedure	ViewSewadarWiseSewaSummarie
-- =============================================================================
IF EXISTS	(	SELECT  *
				FROM    sysobjects
				WHERE name = 'ViewSewadarWiseSewaSummarie' and TYPE='V'				
			)
	BEGIN
		DROP VIEW  ViewSewadarWiseSewaSummarie
	END
GO

CREATE VIEW ViewSewadarWiseSewaSummarie

WITH ENCRYPTION
AS

	SELECT
		ss.sewa_id,		 
		ss.satsang_centre_id, 
		ss.sewadar_grno, 
		present_cnt, 
		exempt_cnt, 
		leave_cnt, 
		absent_cnt, 
		sw.sewa_nm,
		is_system_recorded,
		ss.sewa_id as old_sewa_id,
		ss.satsang_centre_id as old_satsang_centre_id, 
		ss.sewadar_grno as old_sewadar_grno,
		sw.finish_dt,
		sw.start_dt,		
		vs.centre_nm, 
		vs.full_nm, 
		vs.sewadar_id, 
		vs.age, 
		vs.gender, 
		vs.sewadar_status_nm, 
		vs.sewadar_status_dtm, 
		vs.department_nm, 
		vs.sub_department_nm, 
		vs.department_dt,
		stt.screen_id,
		is_editable = (CASE WHEN (sw.attendance_marking = 'Summary' AND sw.locked_dtm IS NULL) THEN 'Yes' ELSE 'No' END),		
		stt.txn_ts as sewadar_txn_ts
		
	FROM sewadar_wise_sewa_summaries  ss
	JOIN sewas sw ON sw.sewa_id = ss.sewa_id
	JOIN ViewSewadarHeaderOnGRNo vs  ON  ss.satsang_centre_id = vs.satsang_centre_id AND ss.sewadar_grno = vs.sewadar_grno 
	LEFT OUTER JOIN sewadars_txn_ts stt ON stt.satsang_centre_id = sw.satsang_centre_id AND stt.sewadar_grno = vs.sewadar_grno AND  sw.sewa_id = stt.sewa_id
	WHERE stt.screen_id IS NULL OR stt.screen_id = 'ATT_01'
	 
GO


-- vim:ts=4 sw=4 ht=4
