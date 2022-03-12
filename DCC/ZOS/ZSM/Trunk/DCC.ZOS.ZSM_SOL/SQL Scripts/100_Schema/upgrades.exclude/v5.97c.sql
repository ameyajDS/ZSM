/* ==================================================================================
    Source File		:	upgrade_v5.100.sql
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
--		CDB Changes
-- =============================================================================

USE CDB
GO

declare
	@india_id	int;

SELECT @india_id	=	country_id from countries where country_nm = 'India';
IF (@@ROWCOUNT != 1)
begin
	raiserror ('Country India not found', 16, 1);
	return;
end

UPDATE satsang_centres
SET district_or_city_id = (SELECT district_or_city_id FROM districts_or_cities WHERE district_nm = 'Trivandrum' AND state_id = 
(SELECT state_id from states where state_nm = 'Kerala' and country_id = @india_id))
WHERE district_or_city_id = (SELECT district_or_city_id FROM districts_or_cities WHERE district_nm = 'Thiruvananthapuram' AND state_id = 
(SELECT state_id from states where state_nm = 'Kerala' and country_id = @india_id))

DELETE FROM districts_or_cities
WHERE district_nm = 'Thiruvananthapuram'
AND state_id = 
(SELECT state_id from states where state_nm = 'Kerala' and country_id = @india_id)

--Trivandrum

UPDATE districts_or_cities
SET district_nm = 'Thiruvananthapuram'
WHERE district_nm = 'Trivandrum'
AND state_id = 
(SELECT state_id from states where state_nm = 'Kerala' and country_id = @india_id)

-----Madhya Pradesh

DELETE FROM districts_or_cities
WHERE district_nm = 'Sajjapur'
AND state_id = 
(SELECT state_id from states where state_nm = 'Madhya Pradesh' and country_id = @india_id)

--Shajapur
DELETE FROM districts_or_cities
WHERE district_nm = 'Shujalpur'
AND state_id = 
(SELECT state_id from states where state_nm = 'Madhya Pradesh' and country_id = @india_id)

DELETE FROM districts_or_cities
WHERE district_nm = 'Raigarh'
AND state_id = 
(SELECT state_id from states where state_nm = 'Maharashtra' and country_id = @india_id)


DELETE FROM districts_or_cities
WHERE district_nm = 'Shillong'
AND state_id = 
(SELECT state_id from states where state_nm = 'Meghalaya' and country_id = @india_id)


DELETE FROM districts_or_cities
WHERE district_nm = 'Baleshwar'
AND state_id = 
(SELECT state_id from states where state_nm = 'Odisha' and country_id = @india_id)

DELETE FROM districts_or_cities
WHERE district_nm = 'Keonjhar'
AND state_id = 
(SELECT state_id from states where state_nm = 'Odisha' and country_id = @india_id)


DELETE FROM districts_or_cities
WHERE district_nm = 'Giridih'
AND state_id = 
(SELECT state_id from states where state_nm = 'West Bengal' and country_id = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Giridih district not deleted', 16, 1);
	RETURN;
END

DELETE FROM districts_or_cities
WHERE district_nm = 'Midnapore'
AND state_id = 
(SELECT state_id from states where state_nm = 'West Bengal' and country_id = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Midnapore district not deleted', 16, 1);
	RETURN;
END

DELETE FROM districts_or_cities
WHERE district_nm = 'Siliguri'
AND state_id = 
(SELECT state_id from states where state_nm = 'West Bengal' and country_id = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Siliguri district not deleted', 16, 1);
	RETURN;
END