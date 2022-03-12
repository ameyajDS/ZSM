SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateLevel1AddressComponent
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateLevel1AddressComponent'
			)
	BEGIN
		DROP PROCEDURE  dbo.UpdateLevel1AddressComponent
	END
GO
CREATE PROCEDURE dbo.UpdateLevel1AddressComponent
(
	@level_1_address_component_id		address_component_id,
	@level_1_address_component_cd		address_component_cd,
	@level_1_address_component_nm		address_component_nm,
	@country_id							country_id,
	@is_authentic						bit,
	@txn_ts								timestamp,
	@effective_from						date,
	@effective_till						date,
	@state_id							int
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    level_1_address_components
	SET
		level_1_address_component_cd		=	@level_1_address_component_cd,
		level_1_address_component_nm		=	@level_1_address_component_nm,
		country_id							=	@country_id,
		is_authentic						=	@is_authentic,
		effective_from						=	@effective_from,
		effective_till						=	@effective_till,
		state_id							=	@state_id
	WHERE level_1_address_component_id = @level_1_address_component_id
	AND txn_ts							=	@txn_ts
	IF (@@ROWCOUNT != 1)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotUpdated', NULL, NULL, NULL, NULL
	END
END
GO
-- =============================================================================