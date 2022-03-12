SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	DeleteWorkingUnit
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteWorkingUnit'
			)
	BEGIN
		DROP PROCEDURE  dbo.DeleteWorkingUnit
	END
GO
CREATE PROCEDURE dbo.DeleteWorkingUnit
(
	@working_unit_id			working_unit_id,	
	@txn_ts						timestamp
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM working_units
	WHERE working_unit_id = @working_unit_id
	AND txn_ts=	@txn_ts
	IF (@@ROWCOUNT != 1)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotDeleted', NULL, NULL, NULL, NULL
	END
END
GO
-- =============================================================================
