SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	QueryWorkingUnit
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QueryWorkingUnit'
			)
	BEGIN
		DROP PROCEDURE  dbo.QueryWorkingUnit
	END
GO
CREATE PROCEDURE dbo.QueryWorkingUnit
(
	@working_unit_id			working_unit_id
)
WITH ENCRYPTION
AS
BEGIN
	SELECT
		working_unit_id, 
		working_unit_cd, 
		working_unit_nm, 
		is_root, 
		is_leaf, 
		society_id, 
		is_staff_posted, 
		working_unit_entity_id, 
		group_working_unit_id, 
		effective_from, 
		effective_till, 
		txn_ts
	FROM working_units
	WHERE working_unit_id = @working_unit_id
END
GO
-- =============================================================================