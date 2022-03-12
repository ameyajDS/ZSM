SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
--	View	ViewWorkingUnitEntities
-- =============================================================================
IF EXISTS	(	SELECT  *
				FROM    sysobjects
				WHERE name = 'ViewWorkingUnitEntities' and TYPE='V'	
			)
	BEGIN
		DROP VIEW  ViewWorkingUnitEntities
	END
GO
CREATE VIEW ViewWorkingUnitEntities
AS
	SELECT
		entity_id, 
		entity_singular_nm, 
		entity_plural_nm, 
		effective_from, 
		effective_till
	FROM working_unit_entities
GO
-- =============================================================================