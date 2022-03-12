SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
--	View	ViewLevel1AddressComponent
-- =============================================================================
IF EXISTS	(	SELECT  *
				FROM    sysobjects
				WHERE name = 'ViewLevel1AddressComponent' and TYPE='V'	
			)
	BEGIN
		DROP VIEW  ViewLevel1AddressComponent
	END
GO
CREATE VIEW ViewLevel1AddressComponent
AS
	SELECT 
		  lac.level_1_address_component_id
		, lac.level_1_address_component_cd
		, lac.level_1_address_component_nm
		, c.country_id
		, c.country_nm as country_id_display
		, lac.is_authentic
		, lac.txn_ts
		, lac.effective_from
		, lac.effective_till, state_id
	 FROM dbo.level_1_address_components lac
	 JOIN dbo.countries c ON lac.country_id = c.country_id
GO
-- =============================================================================