SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	DeleteCountrie
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteCountrie'
			)
	BEGIN
		DROP PROCEDURE  dbo.DeleteCountrie
	END
GO
CREATE PROCEDURE dbo.DeleteCountrie
(
	@country_id						country_id,	
	@txn_ts							timestamp	
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM countries
	WHERE country_id = @country_id
	AND txn_ts=	@txn_ts
	IF (@@ROWCOUNT != 1)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotDeleted', NULL, NULL, NULL, NULL
	END
END
GO
-- =============================================================================
