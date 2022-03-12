/* ==================================================================================
    Source File		:	17_procedures.sql
    Author(s)		:	Sukhdev B. Darira, Jitendra Loyal
    Started On		:	Tue Dec 14 12:47:00 IST 2010
    Version			:	0.03
    Last updated	:	Sep 24, 2013
    Module ID		:	ZMS ()
    Language		:	TRANSACT-SQL
    Reviewed By		:	Jitendra Loyal
    Reviewed On		:	
    ==================================================================================
									Usage Notes
    ----------------------------------------------------------------------------------
		Following procedure(s) have been defined 
			InsertPhoto					(sewadar_id,			sewadar_photo,			photo_dt		)
			UpdatePhoto					(sewadar_id,			sewadar_photo,			photo_dt		)

    ==================================================================================
								      Revision History
    ----------------------------------------------------------------------------------
	JL : 24-Sep-2013
		* All Stored Procedures that raise error also now return a negative value apart from raising the error.
	SD : 23-Dec-2010 : v0.02
		*	Modified both procedures to now
			-	accept sewadar gr_no as the parameter, instead of sewadar_id
			-	and also set an internal parameter for satsang_centre_id
    ==================================================================================*/

SET QUOTED_IDENTIFIER	OFF
GO

SET ANSI_NULLS	ON
GO

-- =============================================================================
-- Function	InsertPhoto	(sewadar_id, sewadar_photo, photo_dt)
-- =============================================================================
IF EXISTS	(	SELECT	name	FROM sysobjects
				WHERE	name = 'InsertPhoto' AND xtype IN ('P')
			)
BEGIN
		DROP	PROCEDURE	InsertPhoto
END
GO
CREATE	PROCEDURE	InsertPhoto
	(
		@p_sewadar_grno			sewadar_grno,
		@p_sewadar_photo		IMAGE,
		@p_photo_dt				DATETIME = NULL
	)

WITH ENCRYPTION
AS
	DECLARE	
		@v_satsang_centre_id	satsang_centre_id,
		@v_sewadar_id			sewadar_id
BEGIN

	--	set the satsang centre id to the appropriate value
	SET	@v_satsang_centre_id = 61

	SELECT 	@v_sewadar_id = sewadar_id
	FROM	sewadars
	WHERE	current_satsang_centre_id	= @v_satsang_centre_id
	AND		current_sewadar_grno		= @p_sewadar_grno

	IF EXISTS	(	SELECT	TOP 1 1
					FROM	sewadars	s
					WHERE	sewadar_id	= @v_sewadar_id
				)
		BEGIN

			IF EXISTS	(	SELECT	TOP 1 1
							FROM	ZSM_Photos..sewadars_photos 	sp
							WHERE	sewadar_id	= @v_sewadar_id
						)
				--	The sewadar already has a photo (record), return an error
				BEGIN
					EXEC SysAdmin..RaiseErrorMessage 'ExistInfo', 'Sewadar Photo already', NULL, NULL, NULL 
					RETURN -1;
				END
			ELSE
				--	The sewadar does not have a photo earlier, insert a fresh record
				BEGIN
					INSERT	INTO	ZSM_Photos..sewadars_photos	
					VALUES	(	@v_sewadar_id,
								@p_sewadar_photo,
								COALESCE (@p_photo_dt, GETDATE () )
							)
				END
		END
	ELSE
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'NotExist', 'Sewadar', NULL, NULL, NULL 
			RETURN -2;
		END

END

GO
-- =============================================================================

-- =============================================================================
-- Function	UpdatePhoto	(sewadarn_id, sewadar_photo, photo_dt)
-- =============================================================================
IF EXISTS	(	SELECT	name	FROM sysobjects
				WHERE	name = 'UpdatePhoto' AND xtype IN ('P')
			)
BEGIN
		DROP	PROCEDURE	UpdatePhoto
END
GO
CREATE	PROCEDURE	UpdatePhoto
	(
		@p_sewadar_grno			sewadar_grno,
		@p_sewadar_photo		IMAGE,
		@p_photo_dt				DATETIME = NULL
	)

WITH ENCRYPTION
AS
	DECLARE	
		@v_satsang_centre_id	satsang_centre_id,
		@v_sewadar_id			sewadar_id
BEGIN

	--	set the satsang centre id to the appropriate value
	SET	@v_satsang_centre_id = 61

	SELECT 	@v_sewadar_id = sewadar_id
	FROM	sewadars
	WHERE	current_satsang_centre_id	= @v_satsang_centre_id
	AND		current_sewadar_grno		= @p_sewadar_grno

	IF EXISTS	(	SELECT	TOP 1 1
					FROM	sewadars	s
					WHERE	sewadar_id	= @v_sewadar_id
				)
		BEGIN

			IF EXISTS	(	SELECT	TOP 1 1
							FROM	ZSM_Photos..sewadars_photos 	sp
							WHERE	sewadar_id	= @v_sewadar_id
						)
				--	The sewadar already has a photo (record), update the photo
				BEGIN
					UPDATE	ZSM_Photos..sewadars_photos
						SET	sewadar_photo	= @p_sewadar_photo,
							photo_dt		= COALESCE (@p_photo_dt, GETDATE () )
					WHERE	sewadar_id		= @v_sewadar_id
				END
			ELSE
				--	The sewadar does not have a photo earlier, return an error
				BEGIN
					EXEC SysAdmin..RaiseErrorMessage 'NotExist', 'Sewadar Photo', NULL, NULL, NULL 
					RETURN -1;
				END
		END
	ELSE
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'NotExist', 'Sewadar', NULL, NULL, NULL 
			RETURN -2;
		END

END

GO
-- =============================================================================



-- vim:ts=4 sw=4 ht=4 guifont=Lucida_Console

