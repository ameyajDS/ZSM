SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertArbitraryDailyPresence
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertArbitraryDailyPresence'
			)
	BEGIN
		DROP PROCEDURE  InsertArbitraryDailyPresence
	END
GO
CREATE PROCEDURE InsertArbitraryDailyPresence
(
	@sewa_id				sewa_id,
	@satsang_centre_id		satsang_centre_id,
	@sewadar_grno			sewadar_grno,
	@presence_dt			smalldatetime,
	@is_scanned				Boolean
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO arbitrary_daily_presences
	(
		sewa_id, satsang_centre_id, sewadar_grno, presence_dt, is_scanned
	)
	VALUES
	(
		@sewa_id, @satsang_centre_id, @sewadar_grno, @presence_dt, @is_scanned
	)
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateArbitraryDailyPresence
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateArbitraryDailyPresence'
			)
	BEGIN
		DROP PROCEDURE  UpdateArbitraryDailyPresence
	END
GO
CREATE PROCEDURE UpdateArbitraryDailyPresence
(
	@sewa_id						sewa_id,
	@satsang_centre_id				satsang_centre_id,
	@sewadar_grno					sewadar_grno,
	@presence_dt					smalldatetime,
	@is_scanned						Boolean,
	
	@old_sewa_id					sewa_id,
	@old_satsang_centre_id			satsang_centre_id,
	@old_sewadar_grno				sewadar_grno,
	@old_presence_dt				smalldatetime
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    arbitrary_daily_presences
	SET
		sewa_id					=	@sewa_id,
		satsang_centre_id		=	@satsang_centre_id,
		sewadar_grno			=	@sewadar_grno,
		presence_dt				=	@presence_dt,
		is_scanned				=	@is_scanned
	WHERE 	
	sewa_id				=		 @old_sewa_id AND 
	satsang_centre_id	=		 @old_satsang_centre_id AND
	sewadar_grno		=		 @old_sewadar_grno AND
	presence_dt			=		 @old_presence_dt
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	DeleteArbitraryDailyPresence
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteArbitraryDailyPresence'
			)
	BEGIN
		DROP PROCEDURE  DeleteArbitraryDailyPresence
	END
GO
CREATE PROCEDURE DeleteArbitraryDailyPresence
(
	@old_sewa_id					sewa_id,
	@old_satsang_centre_id			satsang_centre_id,
	@old_sewadar_grno				sewadar_grno,
	@old_presence_dt				smalldatetime
	
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM arbitrary_daily_presences
	WHERE 	
	sewa_id				=		 @old_sewa_id AND 
	satsang_centre_id	=		 @old_satsang_centre_id AND
	sewadar_grno		=		 @old_sewadar_grno AND
	presence_dt			=		 @old_presence_dt	
END
GO
-- =============================================================================

-- =============================================================================
--	Procedure	ViewArbitraryDailyPresence
-- =============================================================================

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF EXISTS	(	SELECT  *
				FROM    sysobjects
				WHERE name = 'ViewArbitraryDailyPresence' and TYPE='V'				
			)
	BEGIN
		DROP VIEW  ViewArbitraryDailyPresence
	END
GO

CREATE VIEW ViewArbitraryDailyPresence

WITH ENCRYPTION
AS

	SELECT
		ad.sewa_id, 
		sw.sewa_nm,
		ad.satsang_centre_id, 
		ad.sewadar_grno, 
		presence_dt,
		is_scanned,
		ad.sewa_id as old_sewa_id,
		ad.satsang_centre_id as old_satsang_centre_id, 
		ad.sewadar_grno as old_sewadar_grno,
		presence_dt as old_presence_dt,		
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
		sw.finish_dt,
		sw.start_dt,	
		stt.screen_id,
		stt.txn_ts as sewadar_txn_ts
	FROM arbitrary_daily_presences  ad
	JOIN sewas sw	ON sw.sewa_id = ad.sewa_id
	JOIN ViewSewadarHeaderOnGRNo vs  ON  ad.satsang_centre_id = vs.satsang_centre_id AND ad.sewadar_grno = vs.sewadar_grno 
	JOIN sewadars_txn_ts stt ON stt.satsang_centre_id = sw.satsang_centre_id AND stt.sewadar_grno = vs.sewadar_grno AND  sw.sewa_id = stt.sewa_id
GO

-- =============================================================================




-- vim:ts=4 sw=4 ht=4
