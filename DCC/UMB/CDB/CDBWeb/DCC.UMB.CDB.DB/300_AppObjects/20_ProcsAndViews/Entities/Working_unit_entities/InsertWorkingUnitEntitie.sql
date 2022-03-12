SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertWorkingUnitEntitie
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertWorkingUnitEntitie'
			)
	BEGIN
		DROP PROCEDURE  dbo.InsertWorkingUnitEntitie
	END
GO
CREATE PROCEDURE dbo.InsertWorkingUnitEntitie
(
	@entity_id				working_unit_entity_id output,
	@entity_singular_nm		varchar(20),
	@entity_plural_nm		varchar(20),
	@effective_from			datetime,
	@effective_till			datetime
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO working_unit_entities
	(
		entity_singular_nm, entity_plural_nm, effective_from, effective_till
	)
	VALUES
	(
		@entity_singular_nm, @entity_plural_nm, @effective_from, @effective_till
	)
	SELECT @entity_id = SCOPE_IDENTITY()
END
GO
-- =============================================================================
