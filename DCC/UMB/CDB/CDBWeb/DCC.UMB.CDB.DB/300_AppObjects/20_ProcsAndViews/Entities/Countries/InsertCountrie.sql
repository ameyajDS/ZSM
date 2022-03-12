SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertCountrie
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertCountrie'
			)
	BEGIN
		DROP PROCEDURE  dbo.InsertCountrie
	END
GO
CREATE PROCEDURE dbo.InsertCountrie
(
	@country_id						country_id output,
	@country_cd						varchar(5),
	@country_nm						varchar(55),
	@isd_code						varchar(10) = NULL,
	@gmt_diff						numeric,
	@effective_from					datetime,
	@effective_till					datetime,
	@is_authentic					bit,
	@level_1_address_component		address_component_nm = NULL,
	@level_2_address_component		address_component_nm = NULL,
	@level_3_address_component		address_component_nm = NULL
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO countries
	(
		country_cd, country_nm, isd_code, gmt_diff, effective_from, effective_till, is_authentic, level_1_address_component, level_2_address_component, level_3_address_component
	)
	VALUES
	(
		@country_cd, @country_nm, @isd_code, @gmt_diff, @effective_from, @effective_till, @is_authentic, @level_1_address_component, @level_2_address_component, @level_3_address_component
	)
	SELECT @country_id = SCOPE_IDENTITY()
END
GO
-- =============================================================================
