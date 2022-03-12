SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateWorkingUnitEntitie
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateWorkingUnitEntitie'
			)
	BEGIN
		DROP PROCEDURE  dbo.UpdateWorkingUnitEntitie
	END
GO
CREATE PROCEDURE dbo.UpdateWorkingUnitEntitie
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
	UPDATE    working_unit_entities
	SET
		entity_singular_nm		=	@entity_singular_nm,
		entity_plural_nm		=	@entity_plural_nm,
		effective_from			=	@effective_from,
		effective_till			=	@effective_till
	WHERE entity_id = @entity_id
END
GO
-- =============================================================================
