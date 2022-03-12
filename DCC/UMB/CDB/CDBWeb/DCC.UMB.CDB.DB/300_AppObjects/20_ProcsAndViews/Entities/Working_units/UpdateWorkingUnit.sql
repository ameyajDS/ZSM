SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateWorkingUnit
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateWorkingUnit'
			)
	BEGIN
		DROP PROCEDURE  dbo.UpdateWorkingUnit
	END
GO
CREATE PROCEDURE dbo.UpdateWorkingUnit
(
	@working_unit_id			working_unit_id,
	@working_unit_cd			varchar(10),
	@working_unit_nm			varchar(50),
	@is_root					boolean,
	@is_leaf					boolean,
	@society_id					society_id,
	@is_staff_posted			boolean,
	@working_unit_entity_id		working_unit_entity_id,
	@group_working_unit_id		working_unit_id,
	@effective_from				datetime,
	@effective_till				datetime,
	@txn_ts						timestamp
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    working_units
	SET
		working_unit_cd				=	@working_unit_cd,
		working_unit_nm				=	@working_unit_nm,
		is_root						=	@is_root,
		is_leaf						=	@is_leaf,
		society_id					=	@society_id,
		is_staff_posted				=	@is_staff_posted,
		working_unit_entity_id		=	@working_unit_entity_id,
		group_working_unit_id		=	@group_working_unit_id,
		effective_from				=	@effective_from,
		effective_till				=	@effective_till
	WHERE  working_unit_id = @working_unit_id
	AND txn_ts					=	@txn_ts
	IF (@@ROWCOUNT != 1)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotUpdated', NULL, NULL, NULL, NULL
	END
END
GO
-- =============================================================================