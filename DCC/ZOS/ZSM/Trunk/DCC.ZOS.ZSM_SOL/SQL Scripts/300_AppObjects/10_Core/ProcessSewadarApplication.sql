/* ==================================================================================
    Source File		:	ProcessSewadarApplication.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Wed Feb 12 21:05 IST 2020
    Last updated	:	Feb 12, 2020
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		This is re-runnable script and thus is pre-qualified with DROP statements.
    ==================================================================================
								      								  Revision History
    ----------------------------------------------------------------------------------
     JL : ??-Feb-2020
		*   Initial version
   ==================================================================================*/

-- =============================================================================
-- Procedure ProcessSewadarApplication
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'ProcessSewadarApplication' AND xtype = 'P')
	DROP PROCEDURE ProcessSewadarApplication
GO

CREATE PROCEDURE ProcessSewadarApplication
(
	@p_sewadar_application_id		INTEGER,
	@p_current_satsang_centre_nm 	satsang_centre_id,
	@p_registered_sewadar_grno		sewadar_grno		OUTPUT,
	@p_registered_sewadar_id		sewadar_id			OUTPUT
)
WITH ENCRYPTION
AS
	DECLARE
		@centre_id	INTEGER,
		@centre_nm	gnc_nm,
		@status		VARCHAR (20);
BEGIN
	SELECT	@centre_id	=	a.application_centre_id,
			@centre_nm	=	s.centre_nm,
			@status		=	a.application_status
	FROM	sewadar_applications	a
		JOIN	satsang_centre_details	s
			ON	(	s.satsang_centre_id	=	a.application_centre_id	)
	WHERE	applicaton_id	=	@p_sewadar_application_id;
	IF (@@ROWCOUNT = 0)
	BEGIN
		RAISERROR ('Sewadar Application could NOT be found for the Application No. %d', 16, 1, @p_sewadar_application_id);
		RETURN -1;
	END

	IF (@status != 'Verified')
	BEGIN
		RAISERROR ('Status of Sewadar Application should be Verified, but it is %s', 16, 1, @status);
		RETURN -2;
	END
	
	IF (@p_current_satsang_centre_nm != 'Mumbai')
	BEGIN
		RAISERROR ('Sewadar Application of %s Satsang Centre can be processed only at Zonal Centre', 16, 1, @centre_nm);
		RETURN -3;
	END
END
GO

-- =============================================================================
-- vim:ts=4 ht=8 sw=4 guifont=Lucida_Console
