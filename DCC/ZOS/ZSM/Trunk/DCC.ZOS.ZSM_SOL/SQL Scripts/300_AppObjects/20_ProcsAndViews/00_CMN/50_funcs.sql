/* ==================================================================================
    Source File		:	funcs.sql
    Author(s)		:	Manish Saluja
    Started On		:	Feb 19 2013
    Version			:	1.00
    Last updated	:	Feb 19 2013
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Common functions:
			IsAnActiveStatus
    ==================================================================================
								      								  Revision History
    ----------------------------------------------------------------------------------

   ==================================================================================*/

-- =============================================================================
-- Function IsAnActiveStatus
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'IsAnActiveStatus' AND xtype = 'FN')
	DROP FUNCTION IsAnActiveStatus
GO

CREATE	FUNCTION	IsAnActiveStatus
(
	@p_status		VARCHAR (20)
)
	RETURNS Boolean

WITH ENCRYPTION
AS
BEGIN
	DECLARE
		@is_active	Boolean;
	SET @is_active = 'No';
	IF EXISTS
	(
		SELECT 1
		FROM system_information_values v
		JOIN sewadar_status s ON s.sewadar_status_cd = v.value_varchar
		WHERE v.system_info_cd = 'SttsActv' AND s.sewadar_status_nm = @p_status
	)
		SET @is_active = 'Yes';

    RETURN	@is_active;
END
GO

-- =============================================================================
-- vim:ts=4 ht=8 sw=4 guifont=Lucida_Console

