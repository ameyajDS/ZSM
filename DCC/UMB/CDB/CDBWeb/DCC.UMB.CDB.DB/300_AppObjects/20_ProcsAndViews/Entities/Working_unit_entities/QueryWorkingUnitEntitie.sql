SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	QueryWorkingUnitEntitie
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QueryWorkingUnitEntitie'
			)
	BEGIN
		DROP PROCEDURE  dbo.QueryWorkingUnitEntitie
	END
GO
CREATE PROCEDURE dbo.QueryWorkingUnitEntitie
(
	@entity_id				working_unit_entity_id	
)
WITH ENCRYPTION
AS
BEGIN
	SELECT
		entity_id, 
		entity_singular_nm, 
		entity_plural_nm, 
		effective_from, 
		effective_till
	FROM working_unit_entities
	WHERE entity_id = @entity_id
END
GO
-- =============================================================================
-- vim:ts=4 sw=4 ht=4
