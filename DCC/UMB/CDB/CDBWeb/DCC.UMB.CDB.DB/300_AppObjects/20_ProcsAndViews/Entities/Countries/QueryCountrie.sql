SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	QueryCountrie
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QueryCountrie'
			)
	BEGIN
		DROP PROCEDURE  dbo.QueryCountrie
	END
GO
CREATE PROCEDURE dbo.QueryCountrie
(
	@country_id						country_id	
)
WITH ENCRYPTION
AS
BEGIN
	SELECT
		country_id, 
		country_cd, 
		country_nm, 
		isd_code, 
		gmt_diff, 
		txn_ts, 
		effective_from, 
		effective_till, 
		is_authentic, 
		level_1_address_component, 
		level_2_address_component, 
		level_3_address_component
	FROM countries
	WHERE country_id = @country_id
END
GO
-- =============================================================================
-- vim:ts=4 sw=4 ht=4
