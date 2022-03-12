/* ==================================================================================
    Source File		:	upgrade_v6.02.sql
    Author(s)		:	Jiten
    Started On		:	3rd Aug 2018
	Last updated	:	3rd Aug 2018
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		
    ==================================================================================
								      								  Revision History
    ----------------------------------------------------------------------------------

   ==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

USE SysAdmin
GO

UPDATE packages
	SET	version_no = 6.02,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'
GO

-- =============================================================================
--	Procedure	InitialiseSession
-- =============================================================================
ALTER	PROCEDURE	InitialiseSession
(
	@p_user_no			user_no,				--- M002
	@p_machine_nm		gnc_nm,
	@p_application_id	application_id,
	@p_user_role_id		user_role_id,					---- M008
	@p_is_query_session	boolean			OUTPUT,
	@p_session_id		INTEGER			OUTPUT
)
WITH	ENCRYPTION
AS
	DECLARE
		@cnt1		smallint,
		@cnt2		smallint,
		@machine_nm	gnc_nm

BEGIN
	--- M023: Direct SQL RAISERROR statements are used here as this procedure is called only from application launcher

	IF (@p_user_no = 0 OR @p_user_no IS NULL)
		BEGIN
			RAISERROR ('ERROR: User Number is not specified.', 16, -1)
			RETURN 1
		END

	IF (@p_application_id = '' OR @p_application_id IS NULL)
		BEGIN
			RAISERROR ('ERROR: Application is not specified.', 16, -1)
			RETURN 1
		END

	IF (@p_user_role_id = '' OR @p_user_role_id IS NULL)
		BEGIN
			RAISERROR ('ERROR: User Role is not specified.', 16, -1)
			RETURN 1
		END

	IF (@p_machine_nm = '' OR @p_machine_nm IS NULL)
		BEGIN
			RAISERROR ('ERROR: Machine is not specified.', 16, -1)
			RETURN 1
		END

	SET	@p_machine_nm = RTRIM (@p_machine_nm)

	SET @p_is_query_session = 'No'

	SELECT	@cnt1	=	COUNT (*)
	FROM	Log..sessions
	WHERE	user_no		=	@p_user_no
	AND		finish_dtm	IS	NULL
	AND		clear_dtm	IS	NULL

	IF (@cnt1 > 0)
		BEGIN
			UPDATE	Log..sessions
				SET	clear_dtm	=	GetDate()
			WHERE	user_no		=	@p_user_no
			AND		finish_dtm	IS	NULL
			AND		clear_dtm	IS	NULL
		END

	INSERT	INTO	Log..sessions
			(	user_no, machine_nm, application_id, user_role_id
			)
		VALUES
			(	@p_user_no, @p_machine_nm, @p_application_id, @p_user_role_id
			)
	SELECT	@p_session_id = Scope_Identity ()			
	RETURN
END
GO


