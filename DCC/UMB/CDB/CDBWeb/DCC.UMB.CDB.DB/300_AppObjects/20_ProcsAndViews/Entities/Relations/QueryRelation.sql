SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	QueryRelation
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QueryRelation'
			)
	BEGIN
		DROP PROCEDURE  dbo.QueryRelation
	END
GO
CREATE PROCEDURE dbo.QueryRelation
(
	@relation_id		relation_id,
	@relation_nm		varchar(20)
)
WITH ENCRYPTION
AS
BEGIN
	SELECT
		relation_id, 
		relation_nm, 
		txn_ts, 
		effective_from, 
		effective_till
	FROM relations
	WHERE (1 = 2) --ADD YOUR WHERE CLAUSE
END
GO
-- =============================================================================