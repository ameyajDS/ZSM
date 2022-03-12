SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertRelation
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertRelation'
			)
	BEGIN
		DROP PROCEDURE  dbo.InsertRelation
	END
GO
CREATE PROCEDURE dbo.InsertRelation
(
	@relation_id		relation_id output,
	@relation_nm		varchar(20),
	@effective_from		datetime,
	@effective_till		datetime
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO relations
	(
		relation_nm, effective_from, effective_till
	)
	VALUES
	(
		@relation_nm, @effective_from, @effective_till
	)
	SELECT @relation_id = SCOPE_IDENTITY()
END
GO
-- =============================================================================