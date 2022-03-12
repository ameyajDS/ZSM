SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertWorkingUnit
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertWorkingUnit'
			)
	BEGIN
		DROP PROCEDURE  dbo.InsertWorkingUnit
	END
GO
CREATE PROCEDURE dbo.InsertWorkingUnit
(
	@working_unit_id			working_unit_id output,
	@working_unit_cd			varchar(10),
	@working_unit_nm			varchar(50),
	@is_root					boolean,
	@is_leaf					boolean,
	@society_id					society_id,
	@is_staff_posted			boolean,
	@working_unit_entity_id		working_unit_entity_id,
	@group_working_unit_id		working_unit_id = NULL,
	@effective_from				datetime,
	@effective_till				datetime
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO working_units
	(
		working_unit_cd, working_unit_nm, is_root, is_leaf, society_id, is_staff_posted, working_unit_entity_id, group_working_unit_id, effective_from, effective_till
	)
	VALUES
	(
		@working_unit_cd, @working_unit_nm, @is_root, @is_leaf, @society_id, @is_staff_posted, @working_unit_entity_id, @group_working_unit_id, @effective_from, @effective_till
	)
	SELECT @working_unit_id = SCOPE_IDENTITY()
END
GO
-- =============================================================================
