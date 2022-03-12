SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
--	View	ViewCountrie
-- =============================================================================
IF EXISTS	(	SELECT  *
				FROM    sysobjects
				WHERE name = 'ViewCountrie' and TYPE='V'	
			)
	BEGIN
		DROP VIEW  ViewCountrie
	END
GO
CREATE VIEW ViewCountrie
AS
	SELECT 
		country_id
		, country_cd
		, country_nm
		, isd_code
		, gmt_diff
		, txn_ts
		, effective_from
		, effective_till
		, is_authentic
		, level_1_address_component
		, level_2_address_component
		, level_3_address_component
	 FROM dbo.countries
GO
-- =============================================================================