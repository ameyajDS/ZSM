SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateCountrie
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateCountrie'
			)
	BEGIN
		DROP PROCEDURE  dbo.UpdateCountrie
	END
GO
CREATE PROCEDURE dbo.UpdateCountrie
(
	@country_id						country_id,
	@country_cd						varchar(5),
	@country_nm						varchar(55),
	@isd_code						varchar(10),
	@gmt_diff						numeric,
	@txn_ts							timestamp,
	@effective_from					datetime,
	@effective_till					datetime,
	@is_authentic					bit,
	@level_1_address_component		address_component_nm,
	@level_2_address_component		address_component_nm,
	@level_3_address_component		address_component_nm
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    countries
	SET
		country_cd						=	@country_cd,
		country_nm						=	@country_nm,
		isd_code						=	@isd_code,
		gmt_diff						=	@gmt_diff,
		effective_from					=	@effective_from,
		effective_till					=	@effective_till,
		is_authentic					=	@is_authentic,
		level_1_address_component		=	@level_1_address_component,
		level_2_address_component		=	@level_2_address_component,
		level_3_address_component		=	@level_3_address_component
	WHERE country_id = @country_id
	AND txn_ts						=	@txn_ts
	IF (@@ROWCOUNT != 1)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotUpdated', NULL, NULL, NULL, NULL
	END
END
GO
-- =============================================================================