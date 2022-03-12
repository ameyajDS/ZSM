SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertArbitraryShiftPresence
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertArbitraryShiftPresence'
			)
	BEGIN
		DROP PROCEDURE  InsertArbitraryShiftPresence
	END
GO
CREATE PROCEDURE InsertArbitraryShiftPresence
(
	@sewa_id				sewa_id,
	@satsang_centre_id		satsang_centre_id,
	@sewadar_grno			sewadar_grno,
	@presence_dt			smalldatetime,
	@sewa_shift				sewa_shift
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO arbitrary_shift_presences
			(	sewa_id, satsang_centre_id, sewadar_grno, presence_dt, sewa_shift, is_scanned	)
		VALUES
			(	@sewa_id, @satsang_centre_id, @sewadar_grno, @presence_dt, @sewa_shift, 'No'	)
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateArbitraryShiftPresence
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateArbitraryShiftPresence'
			)
	BEGIN
		DROP PROCEDURE  UpdateArbitraryShiftPresence
	END
GO
CREATE PROCEDURE UpdateArbitraryShiftPresence
(
	@sewa_id				sewa_id,
	@satsang_centre_id		satsang_centre_id,
	@sewadar_grno			sewadar_grno,
	@presence_dt			smalldatetime,
	@sewa_shift				sewa_shift,
	@is_scanned				Boolean,
	
	@old_sewa_id				sewa_id,
	@old_satsang_centre_id		satsang_centre_id,
	@old_sewadar_grno			sewadar_grno,
	@old_presence_dt			smalldatetime,
	@old_sewa_shift				sewa_shift
	
	
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    arbitrary_shift_presences
	SET
		sewa_id					=	@sewa_id,
		satsang_centre_id		=	@satsang_centre_id,
		sewadar_grno			=	@sewadar_grno,
		presence_dt				=	@presence_dt,
		sewa_shift				=	@sewa_shift,
		is_scanned				=	@is_scanned
	WHERE 
	sewa_id				=		 @old_sewa_id AND 
	satsang_centre_id	=		 @old_satsang_centre_id AND
	sewadar_grno		=		 @old_sewadar_grno AND
	presence_dt			=		 @old_presence_dt AND
	sewa_shift			=		 @old_sewa_shift	
	
	IF(@@ROWCOUNT <> 1)
				BEGIN
					EXEC SysAdmin..RaiseErrorMessage 'NotUpdated', NULL, NULL, NULL, NULL;
				END
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	DeleteArbitraryShiftPresence
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteArbitraryShiftPresence'
			)
	BEGIN
		DROP PROCEDURE  DeleteArbitraryShiftPresence
	END
GO
CREATE PROCEDURE DeleteArbitraryShiftPresence
(
	@old_sewa_id				sewa_id,
	@old_satsang_centre_id		satsang_centre_id,
	@old_sewadar_grno			sewadar_grno,
	@old_presence_dt			smalldatetime,
	@old_sewa_shift				sewa_shift
	
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM arbitrary_shift_presences
	WHERE
	sewa_id				=		 @old_sewa_id AND 
	satsang_centre_id	=		 @old_satsang_centre_id AND
	sewadar_grno		=		 @old_sewadar_grno AND
	presence_dt			=		 @old_presence_dt AND
	sewa_shift			=		 @old_sewa_shift	
	
	IF(@@ROWCOUNT <> 1)
				BEGIN
					EXEC SysAdmin..RaiseErrorMessage 'NotUpdated', NULL, NULL, NULL, NULL;
				END
	
	
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	ViewArbitraryShiftPresence
-- =============================================================================
IF EXISTS	(	SELECT  *
				FROM    sysobjects
				WHERE name = 'ViewArbitraryShiftPresence' and TYPE='V'	
				
			)
	BEGIN
		DROP VIEW  ViewArbitraryShiftPresence
	END
GO
CREATE VIEW ViewArbitraryShiftPresence

WITH ENCRYPTION
AS
	SELECT
		asp.sewa_id, 
		sw.sewa_nm,
		asp.satsang_centre_id, 
		asp.sewadar_grno, 
		presence_dt,
		is_scanned,
		asp.sewa_id as old_sewa_id,
		asp.satsang_centre_id as old_satsang_centre_id, 
		asp.sewadar_grno as old_sewadar_grno,
		asp.sewa_shift,
		asp.sewa_shift as old_sewa_shift,
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
	FROM arbitrary_shift_presences  asp
	JOIN sewas sw ON sw.sewa_id = asp.sewa_id
	JOIN ViewSewadarHeaderOnGRNo vs ON  asp.satsang_centre_id = vs.satsang_centre_id AND asp.sewadar_grno = vs.sewadar_grno 
	LEFT JOIN sewadars_txn_ts stt ON stt.satsang_centre_id = sw.satsang_centre_id AND stt.sewadar_grno = vs.sewadar_grno AND  sw.sewa_id = stt.sewa_id AND stt.screen_id = 'ATT_06'


GO
-- =============================================================================



-- vim:ts=4 sw=4 ht=4
