/* ==================================================================================
    Source File		:	procs_photos_exp.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Thu Dec 27 22:20:03 IST 2011
    Last updated	:	Dec 27, 2011
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:	JL
    Reviewed On		:	
    ==================================================================================
									   									   Usage Notes
    ----------------------------------------------------------------------------------

    ==================================================================================
								      								  Revision History
    ----------------------------------------------------------------------------------
		JL : 22,24-Dec-2011
			Initial version
   ==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

-- =============================================================================
-- Procedure _MovePhotosForCentre
--	It copies the photos from ZSM_Photos to ZSM_<CentreCode>_Photos database
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = '_MovePhotosForCentre' AND xtype = 'P')
	DROP PROCEDURE _MovePhotosForCentre
GO

CREATE PROCEDURE _MovePhotosForCentre
(
	@p_centre_code			CHAR (3)
)
WITH ENCRYPTION
AS
	DECLARE
		@stmt			VARCHAR (1000),
		@centre_id		INT;
BEGIN
	IF (@p_centre_code IS NULL OR @p_centre_code = '')
	BEGIN
		RAISERROR('"Centre Code" must be specified', 16, 1)
		RETURN;
	END

	SET @stmt = 'ZSM_' + @p_centre_code + '_Photos';
	IF (@stmt != DB_NAME())
	BEGIN
		RAISERROR('Current Database is not for the ZSM Photos as per the Centre Code specified', 16, 1)
		RETURN;
	END

	SELECT	@centre_id	=	satsang_centre_id
	FROM	ZSM..satsang_centres_details
	WHERE	centre_cd	=	@p_centre_code
	AND		is_main_centre	=	'Yes';

	IF (@@ROWCOUNT != 1)
	BEGIN
		RAISERROR('"Main Satsang Centre" not found for the Centre Code [%s}', 16, 1, @p_centre_code)
		RETURN;
	END

	SET @stmt = ' INSERT	INTO	sewadars_photos
						(	sewadar_id, sewadar_photo, photo_dt	)
					SELECT	sewadar_id, sewadar_photo, photo_dt
					FROM	ZSM_Photos..sewadars_photos	s
					WHERE	EXISTS	(	SELECT	1
										FROM	ZSM_' + @p_centre_code + '..sewadars	r
										WHERE	r.sewadar_id	=	s.sewadar_id
									)';
	EXEC (@stmt);
END
GO

-- =============================================================================
-- Procedure _CopyPhotosDB
--	It copies the photos from ZSM_Old_Photos to ZSM_Photos database
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = '_CopyPhotosDB' AND xtype = 'P')
	DROP PROCEDURE _CopyPhotosDB
GO

CREATE PROCEDURE _CopyPhotosDB

WITH ENCRYPTION
AS
	DECLARE
		@stmt			VARCHAR (1000)
BEGIN
	INSERT	INTO	sewadars_photos
			(	sewadar_id, sewadar_photo, photo_dt	)
		SELECT	sewadar_id, sewadar_photo, photo_dt
		FROM	ZSM_Old_Photos..sewadars_photos
		ORDER BY sewadar_id;

	INSERT	INTO	adt_sewadars_photos
			(	audit_log_id, sewadar_id, sewadar_photo, photo_dt	)
		SELECT	audit_log_id, sewadar_id, sewadar_photo, photo_dt
		FROM	ZSM_Old_Photos..adt_sewadars_photos
		ORDER BY 1, 2;
END
GO

-- =============================================================================
-- vim:ts=4 ht=8 sw=4 guifont=Lucida_Console

