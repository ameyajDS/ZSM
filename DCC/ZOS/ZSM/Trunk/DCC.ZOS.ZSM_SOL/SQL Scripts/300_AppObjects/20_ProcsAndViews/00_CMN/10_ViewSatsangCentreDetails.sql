-- =============================================================================
--	Procedure	ViewSatsangCentreDetails
-- =============================================================================
IF EXISTS	(	SELECT  *
				FROM    sysobjects
				WHERE name = 'ViewSatsangCentreDetails' and TYPE='v'				
			)
	BEGIN
		DROP View  ViewSatsangCentreDetails
	END
GO
CREATE View ViewSatsangCentreDetails

WITH ENCRYPTION
AS

	SELECT
		sc.satsang_centre_id, 
		sc.satsang_centre_cd, 
		sc.satsang_centre_type, 
		sc.address_line_1, 
		sc.address_line_2, 	
		--pc.post_office_or_city_id,
		--pc.post_office_or_city_nm,
		post_office_or_city_id = null,
		post_office_or_city_nm = null,
		dc.district_nm, 
		sc.district_or_city_id,
		sc.pin_or_zip_code,
		s.state_nm,
		s.state_id,
		c.country_nm,
		c.country_id,
		sc.secretary, 
		sc.telephones, 
		sc.email_addresses, 
		sc.fax_lines, 
		sc.txn_ts, 
		sc.effective_from, 
		sc.effective_till,
		scd.is_main_centre,
		centre_cd = COALESCE(scd.centre_cd, sc.satsang_centre_cd),
		scd.remarks,
		scd.reports_to_centre_id,
		scd.centre_alphabet,
		cl.colour_id,
		cl.colour_nm,
		centre_nm = COALESCE(scd.centre_nm, sc.satsang_centre_nm),
		other_sc.satsang_centre_nm as reporting_centre_nm
	FROM satsang_centres_details scd  
	JOIN cdb..satsang_centres sc ON sc.satsang_centre_id = scd.satsang_centre_id
	LEFT JOIN cdb..districts_or_cities dc ON dc.district_or_city_id = sc.district_or_city_id
	LEFT JOIN CDB..states s ON s.state_id = dc.state_id
	LEFT JOIN CDB..countries c ON c.country_id = s.country_id
	LEFT JOIN colours cl ON cl.colour_id = scd.colour_id
	LEFT JOIN satsang_centres_details other_scd ON other_scd.satsang_centre_id = scd.reports_to_centre_id
	LEFT JOIN CDB..satsang_centres other_sc ON other_sc.satsang_centre_id = other_scd.satsang_centre_id


GO

-- =============================================================================
--	Procedure	ViewBasicSatsangCentreDetails
-- =============================================================================
IF EXISTS	(	SELECT  *
				FROM    sysobjects
				WHERE name = 'ViewBasicSatsangCentreDetails' and TYPE='v'				
			)
	BEGIN
		DROP View  ViewBasicSatsangCentreDetails
	END
GO
CREATE View ViewBasicSatsangCentreDetails

WITH ENCRYPTION
AS

	SELECT
		sc.satsang_centre_id, 
		centre_cd = COALESCE(scd.centre_cd, sc.satsang_centre_cd),
		centre_nm = COALESCE(scd.centre_nm, sc.satsang_centre_nm)
	FROM satsang_centres_details scd  
	JOIN cdb..satsang_centres sc ON sc.satsang_centre_id = scd.satsang_centre_id
GO
