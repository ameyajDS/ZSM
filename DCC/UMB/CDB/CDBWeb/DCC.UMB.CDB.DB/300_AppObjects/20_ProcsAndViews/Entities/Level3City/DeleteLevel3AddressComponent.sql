SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	DeleteLevel3AddressComponent
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteLevel3AddressComponent'
			)
	BEGIN
		DROP PROCEDURE  dbo.DeleteLevel3AddressComponent
	END
GO
CREATE PROCEDURE dbo.DeleteLevel3AddressComponent
(
	@level_3_address_component_id		address_component_id,	
	@txn_ts								timestamp	
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM level_3_address_components
	WHERE level_3_address_component_id = @level_3_address_component_id
	AND txn_ts=	@txn_ts
	IF (@@ROWCOUNT != 1)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotDeleted', NULL, NULL, NULL, NULL
	END
END
GO
-- =============================================================================