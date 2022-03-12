SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateRelation
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateRelation'
			)
	BEGIN
		DROP PROCEDURE  dbo.UpdateRelation
	END
GO
CREATE PROCEDURE dbo.UpdateRelation
(
	@relation_id		relation_id,
	@relation_nm		varchar(20),
	@txn_ts				timestamp,
	@effective_from		datetime,
	@effective_till		datetime
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    relations
	SET
		relation_nm			=	@relation_nm,
		effective_from		=	@effective_from,
		effective_till		=	@effective_till
	WHERE relation_id = @relation_id
	AND txn_ts			=	@txn_ts
	IF (@@ROWCOUNT != 1)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotUpdated', NULL, NULL, NULL, NULL
	END
END
GO
-- =============================================================================