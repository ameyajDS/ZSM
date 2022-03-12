
-- =============================================================================
--	Procedure	DelSewadarstxnts
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DelSewadarstxnts'
			)
	BEGIN
		DROP PROCEDURE  DelSewadarstxnts
	END
GO
CREATE PROCEDURE DelSewadarstxnts
(
	@satsang_centre_id		satsang_centre_id,
		@sewadar_grno			sewadar_grno,
		@sewa_id				sewa_id,
		@screen_id				CHAR (6),
		@txn_ts					timestamp

	
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM  sewadars_txn_ts
	
	WHERE		sewa_id		=	@sewa_id
			AND		screen_id	=	@screen_id
			AND		sewadar_grno =  @sewadar_grno
			AND		satsang_centre_id = @satsang_centre_id
			AND		txn_ts		=	@txn_ts

	IF(@@ROWCOUNT <> 1)
				BEGIN
					EXEC SysAdmin..RaiseErrorMessage 'NotUpdated', NULL, NULL, NULL, NULL;
				END
	
END
GO


-- =============================================================================
--	Procedure	insUpdSewadarsTxnts
-- =============================================================================

	IF EXISTS(SELECT * FROM SYSOBJECTS WHERE NAME = 'insUpdSewadarsTxnts' AND TYPE = 'P')
	DROP PROCEDURE insUpdSewadarsTxnts
	GO
	CREATE PROCEDURE insUpdSewadarsTxnts
	(
		@satsang_centre_id		satsang_centre_id,
		@sewadar_grno			sewadar_grno,
		@sewa_id				sewa_id,
		@screen_id				CHAR (6),
		@txn_ts					timestamp

	)
	WITH ENCRYPTION
	AS

	IF ((@txn_ts IS NOT NULL AND @txn_ts > 0x0) OR EXISTS( 
			SELECT 1 FROM  sewadars_txn_ts
			WHERE	satsang_centre_id = @satsang_centre_id
			AND		sewadar_grno =  @sewadar_grno
			AND		sewa_id		=	@sewa_id
			AND		screen_id	=	@screen_id))
		Begin
			UPDATE sewadars_txn_ts
				SET	screen_id	=	@screen_id
			WHERE	satsang_centre_id = @satsang_centre_id
			AND		sewadar_grno =  @sewadar_grno
			AND		sewa_id		=	@sewa_id
			AND		screen_id	=	@screen_id
			AND		(@txn_ts IS NULL OR txn_ts		=	@txn_ts);
	
			IF(@@ROWCOUNT <> 1)
				BEGIN
					EXEC SysAdmin..RaiseErrorMessage 'NotUpdated', NULL, NULL, NULL, NULL;
				END
		End
	ELSE
		Begin				

				INSERT INTO Sewadars_txn_ts
						(
						satsang_centre_id,
						sewadar_grno,
						sewa_id,
						screen_id
						)		
					VALUES
					(
						@satsang_centre_id,
						@sewadar_grno,
						@sewa_id,
						@screen_id
					)						
		End
	GO

-- =============================================================================
--	Procedure	qrySewadarstxnts
-- =============================================================================


IF EXISTS (SELECT 1 FROM sysobjects WHERE NAME = 'qrySewadarstxnts' AND TYPE = 'P')
DROP PROCEDURE qrySewadarstxnts
GO
CREATE PROCEDURE qrySewadarstxnts
(
		@satsang_centre_id		satsang_centre_id,
		@sewadar_grno			sewadar_grno,
		@sewadar_id				sewadar_id,
		@sewa_id				sewa_id,
		@screen_id				CHAR (6)
		
)
WITH ENCRYPTION
AS

	SELECT 
			sewadars_txn_ts.txn_ts,
			sewadars_txn_ts.screen_id
	FROM
			sewadars_txn_ts
	
	LEFT OUTER JOIN sewadars_registrations ON sewadars_txn_ts.satsang_centre_id	=	sewadars_registrations.satsang_centre_id
	AND sewadars_txn_ts.sewadar_grno	=	sewadars_registrations.sewadar_grno
	
	WHERE
			sewadars_txn_ts.satsang_centre_id	=	@satsang_centre_id
		AND sewadars_txn_ts.sewadar_grno		=	@sewadar_grno
		AND	sewadars_txn_ts.sewa_id				=	@sewa_id
		AND sewadars_txn_ts.screen_id			=	@screen_id
			

