SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	DeleteWorkingUnitEntitie
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteWorkingUnitEntitie'
			)
	BEGIN
		DROP PROCEDURE  dbo.DeleteWorkingUnitEntitie
	END
GO
CREATE PROCEDURE dbo.DeleteWorkingUnitEntitie
(
	@entity_id				working_unit_entity_id,
	@entity_singular_nm		varchar(20),
	@entity_plural_nm		varchar(20),
	@effective_from			datetime,
	@effective_till			datetime
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM working_unit_entities
	WHERE  entity_id = @entity_id
END
GO
-- =============================================================================
