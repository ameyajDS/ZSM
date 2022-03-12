/* ==================================================================================
    Source File		:	upgrade_v5.94b.sql
    Author(s)		:	Niharika
    Started On		:	25 Feb, 2018
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		
    ==================================================================================
								      								  Revision History
    ----------------------------------------------------------------------------------

   ==================================================================================*/

-- =============================================================================
--		ZSM changes
-- =============================================================================

USE ZSM
Go

UPDATE post_offices_or_cities
SET district_id = 2862
WHERE post_office_or_city_nm in
(
'Ambivli',
'Boisar',
'Bordi',
'Dahanu',
'Juchendra',
'Naigaon (E)',
'Naigaon (W)',
'Nalasopara',
'Nalasopara (E)',
'Nalasopara (W)',
'Palghar',
'Palghar (East)',
'Palghar (W)',
'Tarapur',
'Vasai Road',
'Vasai Road (E)',
'Vasai Road (W)',
'Virar',
'Virar (E)',
'Virar (W)'
)
and district_id = 368

-- Thane to Raigad

UPDATE post_offices_or_cities
SET district_id = 362
WHERE post_office_or_city_nm in
(
'Kharghar',
'NAVI PANVEL',
'Vitthal Wadi'
)
and district_id = 368

-- Thane to Raigad (duplicate value) Kalamboli


UPDATE sewadars_addresses
SET post_office_or_city_id = 344 -- Kalamboli in Raigad
WHERE post_office_or_city_id = 4764 --Kalamboli in Thane

-- Port Blair is under South Andaman. There were two different rows. They have been merged into one.

UPDATE post_offices_or_cities
SET district_id = 2599
WHERE district_id = 2598


--Thane to Palghar
