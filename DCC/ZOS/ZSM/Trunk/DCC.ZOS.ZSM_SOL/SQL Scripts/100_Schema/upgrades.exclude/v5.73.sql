/* ==================================================================================
    Source File		:	upgrade_v5.73.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	03 Feb, 2014
    Last updated	:	03 Feb, 2014
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Upgrade Script for v5.73
			.... fixes in schema
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
	SET	version_no = 5.73,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'
GO

-- =============================================================================


ALTER 	PROCEDURE 	RaiseSQLError
(
	@p_type				VARCHAR (10),
	@p_message_cd		VARCHAR (35),
	@p_control_nm		VARCHAR (30)	=	NULL,
	@p_arg_1			VARCHAR (50)	=	NULL,		---- M012: 30-->50
	@p_arg_2			VARCHAR (50)	=	NULL,		---- M012: 30-->50
	@p_arg_3			VARCHAR (50)	=	NULL		---- M012: 30-->50
)
WITH	ENCRYPTION
AS
	DECLARE
		@v_error_string	VARCHAR (200)

BEGIN

	IF (@p_type NOT IN ('Error', 'Fatal', 'Warning'))
		SET	@p_type = 'Error'

	SET	@v_error_string	=	@p_type + '|' + @p_message_cd
									+ '|'
	IF (@p_control_nm IS NOT NULL)
		SET	@v_error_string	=	@v_error_string + @p_control_nm

	SET	@v_error_string	=	@v_error_string + '|'
	IF (@p_arg_1 IS NOT NULL)
		SET	@v_error_string	=	@v_error_string + @p_arg_1

	SET	@v_error_string	=	@v_error_string + '|'
	IF (@p_arg_2 IS NOT NULL)
		SET	@v_error_string	=	@v_error_string + @p_arg_2

	SET	@v_error_string	=	@v_error_string + '|'
	IF (@p_arg_3 IS NOT NULL)
		SET	@v_error_string	=	@v_error_string + @p_arg_3

	SET	@v_error_string	=	@v_error_string + '|'
	RAISERROR (@v_error_string, 16, -1)
END
GO

-- =============================================================================

ALTER 	PROCEDURE 	RaiseBigSQLError
(
	@p_type				VARCHAR (10),
	@p_message_cd		VARCHAR (35),
	@p_control_nm		VARCHAR (30)	=	NULL,
	@p_arg_1			VARCHAR (2000)	=	NULL,		---- M012: 30-->50
	@p_arg_2			VARCHAR (2000)	=	NULL,		---- M012: 30-->50
	@p_arg_3			VARCHAR (2000)	=	NULL		---- M012: 30-->50
)
WITH	ENCRYPTION
AS
	DECLARE
		@v_error_string	VARCHAR (8000)

BEGIN

	IF (@p_type NOT IN ('Error', 'Fatal', 'Warning'))
		SET	@p_type = 'Error'

	SET	@v_error_string	=	@p_type + '|' + @p_message_cd
									+ '|'
	IF (@p_control_nm IS NOT NULL)
		SET	@v_error_string	=	@v_error_string + @p_control_nm

	SET	@v_error_string	=	@v_error_string + '|'
	IF (@p_arg_1 IS NOT NULL)
		SET	@v_error_string	=	@v_error_string + @p_arg_1

	SET	@v_error_string	=	@v_error_string + '|'
	IF (@p_arg_2 IS NOT NULL)
		SET	@v_error_string	=	@v_error_string + @p_arg_2

	SET	@v_error_string	=	@v_error_string + '|'
	IF (@p_arg_3 IS NOT NULL)
		SET	@v_error_string	=	@v_error_string + @p_arg_3

	SET	@v_error_string	=	@v_error_string + '|'
	RAISERROR (@v_error_string, 16, -1)
END
GO

-- =============================================================================
-- vim:ts=4 sw=4 ht=4
-- =============================================================================
