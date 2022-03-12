/* ==================================================================================
    Source File		:	upgrade_v5.99.sql
    Author(s)		:	Niharika
    Started On		:	13 May, 2018
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
--		ZSM Changes
-- =============================================================================

USE ZSM
GO

declare
	@india_id	int;

SELECT @india_id	=	country_id from CDB..countries where country_nm = 'India';
IF (@@ROWCOUNT != 1)
begin
	raiserror ('Country India not found', 16, 1);
	return;
end

--Trivandrum

DELETE FROM post_offices_or_cities
WHERE district_id = (SELECT district_or_city_id from CDB..districts_or_cities WHERE district_nm = 'Thiruvananthapuram'  
AND state_id = (SELECT state_id FROM CDB..states WHERE state_nm = 'Kerala' 
and country_id = @india_id) )


DELETE FROM post_offices_or_cities
WHERE district_id = (SELECT district_or_city_id from CDB..districts_or_cities WHERE district_nm = 'Sajjapur'
AND state_id = (SELECT state_id FROM CDB..states WHERE state_nm = 'Madhya Pradesh' 
and country_id = @india_id) )

--Shujalpur

UPDATE post_offices_or_cities
SET district_id = 
(SELECT district_or_city_id FROM CDB..districts_or_cities WHERE district_nm = 'Shajapur'
AND state_id = (SELECT state_id FROM CDB..states WHERE state_nm = 'Madhya Pradesh' 
and country_id = @india_id) )
WHERE district_id = 
(SELECT district_or_city_id FROM CDB..districts_or_cities WHERE district_nm = 'Shujalpur'
AND state_id = (SELECT state_id FROM CDB..states WHERE state_nm = 'Madhya Pradesh' 
and country_id = @india_id) )

--Raigarh

UPDATE post_offices_or_cities
SET district_id = 
(SELECT district_or_city_id FROM CDB..districts_or_cities WHERE district_nm = 'Raigad'  
AND state_id = (SELECT state_id FROM CDB..states WHERE state_nm = 'Maharashtra'
and country_id = @india_id))
WHERE district_id = 
(SELECT district_or_city_id FROM CDB..districts_or_cities WHERE district_nm = 'Raigarh'  
AND state_id = (SELECT state_id FROM CDB..states WHERE state_nm = 'Maharashtra'
and country_id = @india_id))

UPDATE post_offices_or_cities
SET post_office_or_city_nm = 'Raigad'
WHERE post_office_or_city_nm = 'Raigarh'
AND district_id = 
(SELECT district_or_city_id FROM CDB..districts_or_cities WHERE district_nm = 'Raigad' 
AND state_id = (SELECT state_id FROM CDB..states WHERE state_nm = 'Maharashtra'
and country_id = @india_id))

--Meghalaya

UPDATE post_offices_or_cities
SET district_id = 
(SELECT district_or_city_id FROM CDB..districts_or_cities WHERE district_nm = 'East Khasi Hills' 
AND state_id = (SELECT state_id FROM CDB..states WHERE state_nm = 'Meghalaya'
and country_id = @india_id))
WHERE district_id = 
(SELECT district_or_city_id FROM CDB..districts_or_cities WHERE district_nm = 'Shillong'
 AND state_id = (SELECT state_id FROM CDB..states WHERE state_nm = 'Meghalaya'
 and country_id = @india_id))

-- Odisha
-- 499 rows

UPDATE post_offices_or_cities
SET district_id = 
(SELECT district_or_city_id FROM CDB..districts_or_cities WHERE district_nm = 'Balasore'
AND state_id = (SELECT state_id FROM CDB..states WHERE state_nm = 'Odisha'
and country_id = @india_id))
WHERE district_id = 
(SELECT district_or_city_id FROM CDB..districts_or_cities WHERE district_nm = 'Baleshwar' 
AND state_id = (SELECT state_id FROM CDB..states WHERE state_nm = 'Odisha'
and country_id = @india_id))

--2 rows

UPDATE sewadars_addresses
SET post_office_or_city_id = (SELECT post_office_or_city_id FROM post_offices_or_cities WHERE post_office_or_city_nm = 'Chamakpur'
and district_id = 
(SELECT district_or_city_id FROM CDB..districts_or_cities WHERE district_nm = 'Kendujhar'
AND state_id = (SELECT state_id FROM CDB..states WHERE state_nm = 'Odisha'
and country_id = @india_id)))
WHERE post_office_or_city_id = (SELECT post_office_or_city_id FROM post_offices_or_cities WHERE post_office_or_city_nm = 'Chamakpur' and district_id = 
(SELECT district_or_city_id FROM CDB..districts_or_cities WHERE district_nm = 'Keonjhar'
AND state_id = (SELECT state_id FROM CDB..states WHERE state_nm = 'Odisha'
and country_id = @india_id)))

--5 rows

UPDATE sewadars_addresses
SET post_office_or_city_id = (SELECT post_office_or_city_id FROM post_offices_or_cities WHERE post_office_or_city_nm = 'Joda' and district_id = 
(SELECT district_or_city_id FROM CDB..districts_or_cities WHERE district_nm = 'Kendujhar'
AND state_id = (SELECT state_id FROM CDB..states WHERE state_nm = 'Odisha'
and country_id = @india_id)))
WHERE post_office_or_city_id = (SELECT post_office_or_city_id FROM post_offices_or_cities WHERE post_office_or_city_nm = 'Joda' and district_id = 
(SELECT district_or_city_id FROM CDB..districts_or_cities WHERE district_nm = 'Keonjhar'
AND state_id = (SELECT state_id FROM CDB..states WHERE state_nm = 'Odisha'
and country_id = @india_id)))

DELETE FROM post_offices_or_cities
WHERE post_office_or_city_nm = 'Chamakpur' and district_id = 
(SELECT district_or_city_id FROM CDB..districts_or_cities WHERE district_nm = 'Keonjhar'
AND state_id = (SELECT state_id FROM CDB..states WHERE state_nm = 'Odisha'
and country_id = @india_id))

DELETE FROM post_offices_or_cities
WHERE post_office_or_city_nm = 'Joda' and district_id = 
(SELECT district_or_city_id FROM CDB..districts_or_cities WHERE district_nm = 'Keonjhar'
AND state_id = (SELECT state_id FROM CDB..states WHERE state_nm = 'Odisha'
and country_id = @india_id))


UPDATE post_offices_or_cities
SET district_id = 
(SELECT district_or_city_id FROM CDB..districts_or_cities WHERE district_nm = 'Giridih'  
AND state_id = (SELECT state_id FROM CDB..states WHERE state_nm = 'Jharkhand' and country_id = @india_id))
WHERE district_id = 
(SELECT district_or_city_id FROM CDB..districts_or_cities WHERE district_nm = 'Giridih' 
AND state_id = (SELECT state_id FROM CDB..states WHERE state_nm = 'West Bengal' and country_id = @india_id))

--2 rows
UPDATE post_offices_or_cities
SET district_id = 
(SELECT district_or_city_id FROM CDB..districts_or_cities WHERE district_nm = 'Paschim Medinipur' 
AND state_id = (SELECT state_id FROM CDB..states WHERE state_nm = 'West Bengal'
and country_id = @india_id))
WHERE district_id = 
(SELECT district_or_city_id FROM CDB..districts_or_cities WHERE district_nm = 'Midnapore'
AND state_id = (SELECT state_id FROM CDB..states WHERE state_nm = 'West Bengal'
and country_id = @india_id))

UPDATE post_offices_or_cities
SET district_id = 
(SELECT district_or_city_id FROM CDB..districts_or_cities WHERE district_nm = 'Darjeeling'
AND state_id = (SELECT state_id FROM CDB..states WHERE state_nm = 'West Bengal' and country_id = @india_id))
WHERE district_id = 
(SELECT district_or_city_id FROM CDB..districts_or_cities WHERE district_nm = 'Siliguri'
AND state_id = (SELECT state_id FROM CDB..states WHERE state_nm = 'West Bengal' 
and country_id = @india_id))

