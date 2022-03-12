/* ==================================================================================
    Source File		:	upgrade_v5.97.sql
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

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

USE SysAdmin
GO

UPDATE packages
	SET	version_no = 5.97,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'
GO

-- =============================================================================
--		CDB Changes
-- =============================================================================

USE CDB
GO

IF NOT EXISTS	(	SELECT  *
				FROM    sysobjects
				WHERE xtype = 'U' and name like 'rep%'
			)

	BEGIN
		raiserror ('Table representatives not found', 16, 1);
	return;
	END
GO

DROP TABLE representatives

declare
	@india_id	int;

SELECT @india_id	=	country_id from countries where country_nm = 'India';
IF (@@ROWCOUNT != 1)
begin
	raiserror ('Country India not found', 16, 1);
	return;
end



UPDATE states
SET state_nm = 'Odisha'
WHERE state_nm = 'Orissa'
and country_id  = @india_id
IF (@@ROWCOUNT != 1)
begin
	raiserror ('Orissa state not updated', 16, 1);
	return;
end


UPDATE states
SET state_nm = 'Puducherry'
WHERE state_nm = 'Pondicherry'
and country_id  = @india_id
IF (@@ROWCOUNT != 1)
begin
	raiserror ('Pondicherry state not updated', 16, 1);
	return;
end

DELETE FROM states
WHERE state_nm = 'Saharanpur (Up)'
and country_id  = @india_id
IF (@@ROWCOUNT != 1)
begin
	raiserror ('Saharanpur (Up) state not deleted', 16, 1);
	return;
end

-- =============================================================================
--		Jammu & Kashmir
-- =============================================================================

--Baramulla - Baramula


UPDATE districts_or_cities
SET district_nm = 'Baramulla'
WHERE district_nm = 'Baramula'
AND state_id = 
(SELECT state_id from states where state_nm = 'Jammu & Kashmir' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
begin
	raiserror ('Baramulla district not updated', 16, 1);
	return;
end

--Kashmir
DELETE FROM districts_or_cities
WHERE district_nm = 'Kashmir'
AND state_id = 
(SELECT state_id from states where state_nm = 'Jammu & Kashmir' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Kashmir district not deleted', 16, 1);
	RETURN;
end

--Ladakh
DELETE FROM districts_or_cities
WHERE district_nm = 'Ladakh'
AND state_id = 
(SELECT state_id from states where state_nm = 'Jammu & Kashmir' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Ladakh district not deleted', 16, 1);
	RETURN;
END

--Rajouri
DELETE FROM districts_or_cities
WHERE district_nm = 'Rajouri' 
AND state_id = 
(SELECT state_id from states where state_nm = 'Jammu & Kashmir' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Rajouri district not deleted', 16, 1);
	RETURN;
END

UPDATE districts_or_cities
SET district_nm = 'Rajouri'
WHERE district_nm = 'Rajauri'
AND state_id = 
(SELECT state_id from states where state_nm = 'Jammu & Kashmir' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Rajouri district not updated', 16, 1);
	RETURN;
END

--Deleting duplicate row Shamba (Correct spelling Samba exists)

DELETE FROM districts_or_cities
WHERE district_nm = 'Shamba'
AND state_id = 
(SELECT state_id from states where state_nm = 'Jammu & Kashmir' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Shamba district not deleted', 16, 1);
	RETURN;
END


-- =============================================================================
--		Jharkhand
-- =============================================================================

--devdhar

DELETE FROM districts_or_cities
WHERE district_nm = 'devdhar'
AND state_id = 
(SELECT state_id from states where state_nm = 'Jharkhand' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('devdhar district not deleted', 16, 1);
	RETURN;
END

--gadhwa

DELETE FROM districts_or_cities
WHERE district_nm = 'gadhwa'
AND state_id = 
(SELECT state_id from states where state_nm = 'Jharkhand' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('gadhwa district not deleted', 16, 1);
	RETURN;
END

--giridh

UPDATE districts_or_cities
SET district_nm = 'Giridih'
WHERE district_nm = 'giridh'
AND state_id = 
(SELECT state_id from states where state_nm = 'Jharkhand' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('giridh district not updated', 16, 1);
	RETURN;
END

--Kodrma

DELETE FROM districts_or_cities
WHERE district_nm = 'Kodrma'
AND state_id = 
(SELECT state_id from states where state_nm = 'Jharkhand' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Kodrma district not deleted', 16, 1);
	RETURN;
END

--Paschimi Singhbhum

UPDATE districts_or_cities
SET district_nm = 'West Sighbhum'
WHERE district_nm = 'Paschimi Singhbhum'
AND state_id = 
(SELECT state_id from states where state_nm = 'Jharkhand' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Paschimi Singhbhum district not updated', 16, 1);
	RETURN;
END


--Plamu

DELETE FROM districts_or_cities
WHERE district_nm = 'Plamu'
AND state_id = 
(SELECT state_id from states where state_nm = 'Jharkhand' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Plamu district not deleted', 16, 1);
	RETURN;
END

--Purbi Singhbhum

UPDATE districts_or_cities
SET district_nm = 'East Sighbhum'
WHERE district_nm = 'Purbi Singhbhum'
AND state_id = 
(SELECT state_id from states where state_nm = 'Jharkhand' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Purbi Singhbhum district not updated', 16, 1);
	RETURN;
END


-- =============================================================================
--		Karnataka
-- =============================================================================

--Bangalore

UPDATE districts_or_cities
SET district_nm = 'Bengaluru'
WHERE district_nm = 'Bangalore'
AND state_id = 
(SELECT state_id from states where state_nm = 'Karnataka' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Bangalore district not updated', 16, 1);
	RETURN;
END

--Bangalore Rural

UPDATE districts_or_cities
SET district_nm = 'Bengaluru Rural'
WHERE district_nm = 'Bangalore Rural'
AND state_id = 
(SELECT state_id from states where state_nm = 'Karnataka' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Bangalore Rural district not updated', 16, 1);
	RETURN;
END

--Bijapur

UPDATE districts_or_cities
SET district_nm = 'Vijayapura'
WHERE district_nm = 'Bijapur'
AND state_id = 
(SELECT state_id from states where state_nm = 'Karnataka' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Bijapur district not updated', 16, 1);
	RETURN;
END

--Chickmagalur

UPDATE districts_or_cities
SET district_nm = 'Chikkamagaluru'
WHERE district_nm = 'Chickmagalur'
AND state_id = 
(SELECT state_id from states where state_nm = 'Karnataka' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Chickmagalur district not updated', 16, 1);
	RETURN;
END


--Chikkaballa Pura
UPDATE districts_or_cities
SET district_nm = 'Chikkaballapur'
WHERE district_nm = 'Chikkaballa Pura'
AND state_id = 
(SELECT state_id from states where state_nm = 'Karnataka' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Chikkaballa Pura district not updated', 16, 1);
	RETURN;
END

-- =============================================================================
--		Kerala
-- =============================================================================

DELETE FROM districts_or_cities
WHERE district_nm = 'Alleppey'
AND state_id = 
(SELECT state_id from states where state_nm = 'Kerala' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Alleppey district not deleted', 16, 1);
	RETURN;
END

DELETE FROM districts_or_cities
WHERE district_nm = 'Kozhikode'
AND state_id = 
(SELECT state_id from states where state_nm = 'Kerala' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Kozhikode district not deleted', 16, 1);
	RETURN;
END

UPDATE districts_or_cities
SET district_nm = 'Kozhikode'
WHERE district_nm = 'Calicut'
AND state_id = 
(SELECT state_id from states where state_nm = 'Kerala' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Calicut district not updated', 16, 1);
	RETURN;
END

--Cannanore
DELETE FROM districts_or_cities
WHERE district_nm = 'Cannanore'
AND state_id = 
(SELECT state_id from states where state_nm = 'Kerala' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Cannanore district not deleted', 16, 1);
	RETURN;
END

--Palghat

DELETE FROM districts_or_cities
WHERE district_nm = 'Palghat'
AND state_id = 
(SELECT state_id from states where state_nm = 'Kerala' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Palghat district not deleted', 16, 1);
	RETURN;
END


--Quilon

DELETE FROM districts_or_cities
WHERE district_nm = 'Quilon'
AND state_id = 
(SELECT state_id from states where state_nm = 'Kerala' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Quilon district not deleted', 16, 1);
	RETURN;
END

--Trichur

DELETE FROM districts_or_cities
WHERE district_nm = 'Trichur'
AND state_id = 
(SELECT state_id from states where state_nm = 'Kerala' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Trichur district not deleted', 16, 1);
	RETURN;
END


--Wyanad
UPDATE districts_or_cities
SET district_nm = 'Wayanad'
WHERE district_nm = 'Wyanad'
AND state_id = 
(SELECT state_id from states where state_nm = 'Kerala' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Wyanad district not updated', 16, 1);
	RETURN;
END


-- =============================================================================
--		Madhya Pradesh
-- =============================================================================

--Bastar

DELETE FROM districts_or_cities
WHERE district_nm = 'Bastar'
AND  state_id = 
(SELECT state_id from states where state_nm = 'Madhya Pradesh' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Bastar district not deleted', 16, 1);
	RETURN;
END

--Bhillai

DELETE FROM districts_or_cities
WHERE district_nm = 'Bhillai'
AND  state_id = 
(SELECT state_id from states where state_nm = 'Madhya Pradesh' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Bhillai district not deleted', 16, 1);
	RETURN;
END

--Gondi
DELETE FROM districts_or_cities
WHERE district_nm = 'Gondi'
AND  state_id = 
(SELECT state_id from states where state_nm = 'Madhya Pradesh' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Gondi district not deleted', 16, 1);
	RETURN;
END


--Khandwa
UPDATE districts_or_cities
SET district_nm = 'Khandwa (East Nimar)'
WHERE district_nm = 'Khandwa'
AND state_id = 
(SELECT state_id from states where state_nm = 'Madhya Pradesh' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Khandwa district not updated', 16, 1);
	RETURN;
END

--Khargone
UPDATE districts_or_cities
SET district_nm = 'Khargone (West Nimar)'
WHERE district_nm = 'Khargone'
AND state_id = 
(SELECT state_id from states where state_nm = 'Madhya Pradesh' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Khargone district not updated', 16, 1);
	RETURN;
END

--Lashkar
DELETE FROM districts_or_cities
WHERE district_nm = 'Lashkar'
AND  state_id = 
(SELECT state_id from states where state_nm = 'Madhya Pradesh' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Lashkar district not deleted', 16, 1);
	RETURN;
END

--Morar
DELETE FROM districts_or_cities
WHERE district_nm = 'Morar'
AND  state_id = 
(SELECT state_id from states where state_nm = 'Madhya Pradesh' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Morar district not deleted', 16, 1);
	RETURN;
END


-- =============================================================================
--		Maharashtra
-- =============================================================================


--Ajanta

DELETE FROM districts_or_cities
WHERE district_nm = 'Ajanta'
AND  state_id = 
(SELECT state_id from states where state_nm = 'Maharashtra' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Ajanta district not deleted', 16, 1);
	RETURN;
END

--Buldana

UPDATE districts_or_cities
SET district_nm = 'Buldhana'
WHERE district_nm = 'Buldana'
AND state_id = 
(SELECT state_id from states where state_nm = 'Maharashtra' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Buldana district not updated', 16, 1);
	RETURN;
END

--Greater Bombay

DELETE FROM districts_or_cities
WHERE district_nm = 'Greater Bombay'
AND  state_id = 
(SELECT state_id from states where state_nm = 'Maharashtra' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Greater Bombay district not updated', 16, 1);
	RETURN;
END

--Ulhasnagar

DELETE FROM districts_or_cities
WHERE district_nm = 'Ulhasnagar'
AND  state_id = 
(SELECT state_id from states where state_nm = 'Maharashtra' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Ulhasnagar district not updated', 16, 1);
	RETURN;
END

--Yeotmal

UPDATE districts_or_cities
SET district_nm = 'Yavatmal'
WHERE district_nm = 'Yeotmal'
AND state_id = 
(SELECT state_id from states where state_nm = 'Maharashtra' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Yeotmal district not updated', 16, 1);
	RETURN;
END

-- =============================================================================
--		Manipur
-- =============================================================================

--Imphal

-- =============================================================================
--		Meghalaya
-- =============================================================================


--Jaintia Hills

DELETE FROM districts_or_cities
WHERE district_nm = 'Jaintia Hills'
AND  state_id = 
(SELECT state_id from states where state_nm = 'Meghalaya' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Jaintia Hills district not deleted', 16, 1);
	RETURN;
END


--Shillong
----------------------------------check if it affects  1 row
UPDATE satsang_centres
SET district_or_city_id = (SELECT district_or_city_id FROM districts_or_cities WHERE district_nm = 'East Khasi Hills' AND  state_id = 
(SELECT state_id from states where state_nm = 'Meghalaya' and country_id  = @india_id))
WHERE district_or_city_id = (SELECT district_or_city_id FROM districts_or_cities WHERE district_nm = 'Shillong' AND  state_id = 
(SELECT state_id from states where state_nm = 'Meghalaya' and country_id  = @india_id))
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Satsang centres of Shillong not updated', 16, 1);
	RETURN;
END

-- =============================================================================
--		Mizoram
-- =============================================================================

--Aizal

DELETE FROM districts_or_cities
WHERE district_nm = 'Aizal'
AND  state_id = 
(SELECT state_id from states where state_nm = 'Mizoram' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Aizal district not deleted', 16, 1);
	RETURN;
END

--Chhimtuipui

DELETE FROM districts_or_cities
WHERE district_nm = 'Chhimtuipui'
AND  state_id = 
(SELECT state_id from states where state_nm = 'Mizoram' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Chhimtuipui district not deleted', 16, 1);
	RETURN;
END

-- =============================================================================
--		Nagaland - no changes
-- =============================================================================

-- =============================================================================
--		Odisha
-- =============================================================================
--Khorda

UPDATE districts_or_cities
SET district_nm = 'Khordha'
WHERE district_nm = 'Khorda'
AND state_id = 
(SELECT state_id from states where state_nm = 'Odisha' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Khorda district not updated', 16, 1);
	RETURN;
END

--Bhubaneswar
--2 rows

UPDATE satsang_centres
SET district_or_city_id = (SELECT district_or_city_id FROM districts_or_cities WHERE district_nm = 'Khordha' AND  state_id = 
(SELECT state_id from states where state_nm = 'Odisha' and country_id  = @india_id))
WHERE district_or_city_id = (SELECT district_or_city_id FROM districts_or_cities WHERE district_nm = 'Bhubaneswar' AND  state_id = 
(SELECT state_id from states where state_nm = 'Odisha' and country_id  = @india_id))
IF (@@ROWCOUNT != 2)
BEGIN
	RAISERROR ('Satsang centres of Bhubaneswar not updated', 16, 1);
	RETURN;
END

DELETE FROM districts_or_cities
WHERE district_nm = 'Bhubaneswar'
AND  state_id = 
(SELECT state_id from states where state_nm = 'Odisha' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Bhubaneswar district not deleted', 16, 1);
	RETURN;
END


--Jagat Sajapur

DELETE FROM districts_or_cities
WHERE district_nm = 'Jagat Sajapur'
AND  state_id = 
(SELECT state_id from states where state_nm = 'Odisha' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Jagat Sajapur district not deleted', 16, 1);
	RETURN;
END

--Jagatsinghapur

UPDATE districts_or_cities
SET district_nm = 'Jagatsinghpur'
WHERE district_nm = 'Jagatsinghapur'
AND state_id = 
(SELECT state_id from states where state_nm = 'Odisha' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Jagatsinghapur district not updated', 16, 1);
	RETURN;
END


--Jajapur

UPDATE districts_or_cities
SET district_nm = 'Jajpur'
WHERE district_nm = 'Jajapur'
AND state_id = 
(SELECT state_id from states where state_nm = 'Odisha' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Jajapur district not updated', 16, 1);
	RETURN;
END


--Keonjhar
--5 rows

UPDATE satsang_centres
SET district_or_city_id = (SELECT district_or_city_id FROM districts_or_cities WHERE district_nm = 'Kendujhar' AND  state_id = 
(SELECT state_id from states where state_nm = 'Odisha' and country_id  = @india_id))
WHERE district_or_city_id = (SELECT district_or_city_id FROM districts_or_cities WHERE district_nm = 'Keonjhar' AND  state_id = 
(SELECT state_id from states where state_nm = 'Odisha' and country_id  = @india_id))
IF (@@ROWCOUNT != 5)
BEGIN
	RAISERROR ('Satsang centres of Keonjhar not updated', 16, 1);
	RETURN;
END


--Keonjhar Ghar

DELETE FROM districts_or_cities
WHERE district_nm = 'Keonjhar Ghar'
AND  state_id = 
(SELECT state_id from states where state_nm = 'Odisha' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Keonjhar Ghar district not deleted', 16, 1);
	RETURN;
END

--Kiwanja

DELETE FROM districts_or_cities
WHERE district_nm = 'Kiwanja'
AND  state_id = 
(SELECT state_id from states where state_nm = 'Odisha' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Kiwanja district not deleted', 16, 1);
	RETURN;
END

--Koinjhar

DELETE FROM districts_or_cities
WHERE district_nm = 'Koinjhar'
AND  state_id = 
(SELECT state_id from states where state_nm = 'Odisha' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Koinjhar district not deleted', 16, 1);
	RETURN;
END

--Nabarangapur

UPDATE districts_or_cities
SET district_nm = 'Nabarangpur'
WHERE district_nm = 'Nabarangapur'
AND state_id = 
(SELECT state_id from states where state_nm = 'Odisha' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Nabarangapur district not updated', 16, 1);
	RETURN;
END

--Nawapada Tanwat

DELETE FROM districts_or_cities
WHERE district_nm = 'Nawapada Tanwat'
AND  state_id = 
(SELECT state_id from states where state_nm = 'Odisha' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Nawapada Tanwat district not deleted', 16, 1);
	RETURN;
END

--Nawapara

DELETE FROM districts_or_cities
WHERE district_nm = 'Nawapara'
AND  state_id = 
(SELECT state_id from states where state_nm = 'Odisha' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Nawapara district not deleted', 16, 1);
	RETURN;
END

--Phulbani

DELETE FROM districts_or_cities
WHERE district_nm = 'Phulbani'
AND  state_id = 
(SELECT state_id from states where state_nm = 'Odisha' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Phulbani district not deleted', 16, 1);
	RETURN;
END

--Sonapur

UPDATE districts_or_cities
SET district_nm = 'Subarnapur'
WHERE district_nm = 'Sonapur'
AND state_id = 
(SELECT state_id from states where state_nm = 'Odisha' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Sonapur district not updated', 16, 1);
	RETURN;
END


--Sundergarh

UPDATE districts_or_cities
SET district_nm = 'Sundargarh'
WHERE district_nm = 'Sundergarh'
AND state_id = 
(SELECT state_id from states where state_nm = 'Odisha' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Sundergarh district not updated', 16, 1);
	RETURN;
END

-- =============================================================================
--		Puducherry - no changes
-- =============================================================================

-- =============================================================================
--		Punjab
-- =============================================================================

--Abohar

DELETE FROM districts_or_cities
WHERE district_nm = 'Abohar'
AND  state_id = 
(SELECT state_id FROM states WHERE state_nm = 'Punjab' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Abohar district not deleted', 16, 1);
	RETURN;
END

--Batala

DELETE FROM districts_or_cities
WHERE district_nm = 'Batala'
AND  state_id = 
(SELECT state_id FROM states WHERE state_nm = 'Punjab' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Batala district not deleted', 16, 1);
	RETURN;
END

--Dera

DELETE FROM districts_or_cities
WHERE district_nm = 'Dera'
AND  state_id = 
(SELECT state_id FROM states WHERE state_nm = 'Punjab' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Dera district not deleted', 16, 1);
	RETURN;
END


--Ferozepur

DELETE FROM districts_or_cities
WHERE district_nm = 'Ferozepur'
AND  state_id = 
(SELECT state_id FROM states WHERE state_nm = 'Punjab' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Ferozepur district not deleted', 16, 1);
	RETURN;
END

--Malout

DELETE FROM districts_or_cities
WHERE district_nm = 'Malout'
AND  state_id = 
(SELECT state_id FROM states WHERE state_nm = 'Punjab' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Malout district not deleted', 16, 1);
	RETURN;
END

--Mohali

UPDATE districts_or_cities
SET district_nm = 'Sahibzada Ajit Singh Nagar'
WHERE district_nm = 'Mohali'
AND state_id = 
(SELECT state_id from states where state_nm = 'Punjab' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Mohali district not updated', 16, 1);
	RETURN;
END


--Nawan Shahr

DELETE FROM districts_or_cities
WHERE district_nm = 'Nawan Shahr'
AND  state_id = 
(SELECT state_id FROM states WHERE state_nm = 'Punjab' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Nawan Shahr district not deleted', 16, 1);
	RETURN;
END

--Rup Nagar

UPDATE districts_or_cities
SET district_nm = 'Rupnagar'
WHERE district_nm = 'Rup Nagar'
AND state_id = 
(SELECT state_id from states where state_nm = 'Punjab' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Rup Nagar district not updated', 16, 1);
	RETURN;
END


--Ropar
----------------check if it affects one row or more

UPDATE satsang_centres
SET district_or_city_id = (SELECT district_or_city_id FROM districts_or_cities 
WHERE district_nm = 'Rupnagar' AND  state_id = 
(SELECT state_id from states where state_nm = 'Punjab' 
and country_id  = @india_id
))
WHERE district_or_city_id = (SELECT district_or_city_id FROM districts_or_cities 
WHERE district_nm = 'Ropar' AND  state_id = 
(SELECT state_id from states where state_nm = 'Punjab' 
and country_id  = @india_id
))
IF (@@ROWCOUNT != 30)
BEGIN
	RAISERROR ('Satsang centres of Ropar not updated', 16, 1);
	RETURN;
END


DELETE FROM districts_or_cities
WHERE district_nm = 'Ropar'
AND  state_id = 
(SELECT state_id FROM states WHERE state_nm = 'Punjab' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Ropar district not deleted', 16, 1);
	RETURN;
END

-- =============================================================================
--		Rajasthan
-- =============================================================================

--Nagaur Raj

DELETE FROM districts_or_cities
WHERE district_nm = 'Nagaur Raj'
AND  state_id = 
(SELECT state_id FROM states WHERE state_nm = 'Rajasthan' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Nagaur Raj district not deleted', 16, 1);
	RETURN;
END

--Pali Marwar

UPDATE satsang_centres
SET district_or_city_id = (SELECT district_or_city_id FROM districts_or_cities WHERE district_nm = 'Pali' AND  state_id = 
(SELECT state_id from states where state_nm = 'Rajasthan' and country_id  = @india_id))
WHERE district_or_city_id = (SELECT district_or_city_id FROM districts_or_cities WHERE district_nm = 'Pali Marwar' AND  state_id = 
(SELECT state_id from states where state_nm = 'Rajasthan' and country_id  = @india_id))
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Satsang centres of Pali Marwar not updated', 16, 1);
	RETURN;
END

--Raj Samand

UPDATE districts_or_cities
SET district_nm = 'Rajsamand'
WHERE district_nm = 'Raj Samand'
AND state_id = 
(SELECT state_id from states where state_nm = 'Rajasthan' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Raj Samand district not updated', 16, 1);
	RETURN;
END

--Sri Ganganagar

UPDATE districts_or_cities
SET district_nm = 'Ganganagar'
WHERE district_nm = 'Sri Ganganagar'
AND state_id = 
(SELECT state_id from states where state_nm = 'Rajasthan' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Raj Samand district not updated', 16, 1);
	RETURN;
END

-- =============================================================================
--		Sikkim - no changes
-- =============================================================================

-- =============================================================================
--		Tamil Nadu
-- =============================================================================

--Chengai-Mgr


DELETE FROM districts_or_cities
WHERE district_nm = 'Chengai-Mgr'
AND  state_id = 
(SELECT state_id FROM states WHERE state_nm = 'Tamil Nadu' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Chengai-Mgr district not deleted', 16, 1);
	RETURN;
END

--Chidambaranar

DELETE FROM districts_or_cities
WHERE district_nm = 'Chidambaranar'
AND  state_id = 
(SELECT state_id FROM states WHERE state_nm = 'Tamil Nadu' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Chidambaranar district not deleted', 16, 1);
	RETURN;
END

--Dindigul-Anna

UPDATE districts_or_cities
SET district_nm = 'Dindigul'
WHERE district_nm = 'Dindigul-Anna'
AND state_id = 
(SELECT state_id from states where state_nm = 'Tamil Nadu' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Dindigul-Anna district not updated', 16, 1);
	RETURN;
END

--Kamarajar

DELETE FROM districts_or_cities
WHERE district_nm = 'Kamarajar'
AND  state_id = 
(SELECT state_id FROM states WHERE state_nm = 'Tamil Nadu' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Kamarajar district not deleted', 16, 1);
	RETURN;
END

--Nagapattinam Quaid E Millat

UPDATE districts_or_cities
SET district_nm = 'Nagapattinam'
WHERE district_nm = 'Nagapattinam Quaid E Millat'
AND state_id = 
(SELECT state_id from states where state_nm = 'Tamil Nadu' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Nagapattinam Quaid E Millat district not updated', 16, 1);
	RETURN;
END

--Pallakarai
DELETE FROM districts_or_cities
WHERE district_nm = 'Pallakarai'
AND  state_id = 
(SELECT state_id FROM states WHERE state_nm = 'Tamil Nadu' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Pallakarai district not deleted', 16, 1);
	RETURN;
END

--Pasumpon Thevar Thirumagan

DELETE FROM districts_or_cities
WHERE district_nm = 'Pasumpon Thevar Thirumagan'
AND  state_id = 
(SELECT state_id FROM states WHERE state_nm = 'Tamil Nadu' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Pasumpon Thevar Thirumagan district not deleted', 16, 1);
	RETURN;
END

--Periyar

DELETE FROM districts_or_cities
WHERE district_nm = 'Periyar'
AND  state_id = 
(SELECT state_id FROM states WHERE state_nm = 'Tamil Nadu' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Periyar district not deleted', 16, 1);
	RETURN;
END

--Sivagamgai

UPDATE districts_or_cities
SET district_nm = 'Sivaganga'
WHERE district_nm = 'Sivagamgai'
AND state_id = 
(SELECT state_id from states where state_nm = 'Tamil Nadu' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Sivagamgai district not updated', 16, 1);
	RETURN;
END

--South Arcot

DELETE FROM districts_or_cities
WHERE district_nm = 'South Arcot'
AND  state_id = 
(SELECT state_id FROM states WHERE state_nm = 'Tamil Nadu' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('South Arcot district not deleted', 16, 1);
	RETURN;
END

--Thiruchirappalli

UPDATE districts_or_cities
SET district_nm = 'Tiruchirappalli'
WHERE district_nm = 'Thiruchirappalli'
AND state_id = 
(SELECT state_id from states where state_nm = 'Tamil Nadu' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Thiruchirappalli district not updated', 16, 1);
	RETURN;
END

--Thiruvannamalai Sambuvarayar

UPDATE districts_or_cities
SET district_nm = 'Tiruvannamalai'
WHERE district_nm = 'Thiruvannamalai Sambuvarayar'
AND state_id = 
(SELECT state_id from states where state_nm = 'Tamil Nadu' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Thiruvannamalai Sambuvarayar district not updated', 16, 1);
	RETURN;
END

--Thrivelie

DELETE FROM districts_or_cities
WHERE district_nm = 'Thrivelie'
AND  state_id = 
(SELECT state_id FROM states WHERE state_nm = 'Tamil Nadu' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Thrivelie district not deleted', 16, 1);
	RETURN;
END

--Tirunelveli Kattabomman

UPDATE districts_or_cities
SET district_nm = 'Tirunelveli'
WHERE district_nm = 'Tirunelveli Kattabomman'
AND state_id = 
(SELECT state_id from states where state_nm = 'Tamil Nadu' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Tirunelveli Kattabomman district not updated', 16, 1);
	RETURN;
END

--Trinulveli Town

DELETE FROM districts_or_cities
WHERE district_nm = 'Trinulveli Town'
AND  state_id = 
(SELECT state_id FROM states WHERE state_nm = 'Tamil Nadu' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Trinulveli Town district not deleted', 16, 1);
	RETURN;
END


-- =============================================================================
--		Telangana - no changes
-- =============================================================================

-- =============================================================================
--		Tripura - no changes
-- =============================================================================

-- =============================================================================
--		Uttar Pradesh
-- =============================================================================

--Badaun

DELETE FROM districts_or_cities
WHERE district_nm = 'Badaun'
AND  state_id = 
(SELECT state_id FROM states WHERE state_nm = 'Uttar Pradesh' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Badaun district not deleted', 16, 1);
	RETURN;
END

--Baghpat

UPDATE districts_or_cities
SET district_nm = 'Bagpat'
WHERE district_nm = 'Baghpat'
AND state_id = 
(SELECT state_id from states where state_nm = 'Uttar Pradesh' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Baghpat district not updated', 16, 1);
	RETURN;
END

--Baraely

DELETE FROM districts_or_cities
WHERE district_nm = 'Baraely'
AND  state_id = 
(SELECT state_id FROM states WHERE state_nm = 'Uttar Pradesh' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Baraely district not deleted', 16, 1);
	RETURN;
END

--Barraich

DELETE FROM districts_or_cities
WHERE district_nm = 'Barraich'
AND  state_id = 
(SELECT state_id FROM states WHERE state_nm = 'Uttar Pradesh' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Barraich district not deleted', 16, 1);
	RETURN;
END

--Bijnour

DELETE FROM districts_or_cities
WHERE district_nm = 'Bijnour'
AND  state_id = 
(SELECT state_id FROM states WHERE state_nm = 'Uttar Pradesh' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Bijnour district not deleted', 16, 1);
	RETURN;
END

--Farukhabad
DELETE FROM districts_or_cities
WHERE district_nm = 'Farukhabad'
AND  state_id = 
(SELECT state_id FROM states WHERE state_nm = 'Uttar Pradesh' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Farukhabad district not deleted', 16, 1);
	RETURN;
END

--Fatehgarh

DELETE FROM districts_or_cities
WHERE district_nm = 'Fatehgarh'
AND  state_id = 
(SELECT state_id FROM states WHERE state_nm = 'Uttar Pradesh' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Fatehgarh district not deleted', 16, 1);
	RETURN;
END

--Gautam Budh Nagar

UPDATE districts_or_cities
SET district_nm = 'Gautam Buddh Nagar'
WHERE district_nm = 'Gautam Budh Nagar'
AND state_id = 
(SELECT state_id from states where state_nm = 'Uttar Pradesh' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Gautam Budh Nagar district not updated', 16, 1);
	RETURN;
END

--Hathras

UPDATE districts_or_cities
SET district_nm = 'Hathras (Mahamaya Nagar)'
WHERE district_nm = 'Hathras'
AND state_id = 
(SELECT state_id from states where state_nm = 'Uttar Pradesh' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Hathras district not updated', 16, 1);
	RETURN;
END

--J.P.Nagar

UPDATE districts_or_cities
SET district_nm = 'Amroha (Jyotiba Phule Nagar)'
WHERE district_nm = 'J.P.Nagar'
AND state_id = 
(SELECT state_id from states where state_nm = 'Uttar Pradesh' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('J.P.Nagar district not updated', 16, 1);
	RETURN;
END

--Jai Parkash Nagar

DELETE FROM districts_or_cities
WHERE district_nm = 'Jai Parkash Nagar'
AND  state_id = 
(SELECT state_id FROM states WHERE state_nm = 'Uttar Pradesh' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Jai Parkash Nagar district not deleted', 16, 1);
	RETURN;
END

--Kanpur

UPDATE districts_or_cities
SET district_nm = 'Kanpur Nagar'
WHERE district_nm = 'Kanpur'
AND state_id = 
(SELECT state_id from states where state_nm = 'Uttar Pradesh' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Kanpur district not updated', 16, 1);
	RETURN;
END

--Kanshiram Nagar

UPDATE districts_or_cities
SET district_nm = 'Kasganj (Kanshi Ram Nagar)'
WHERE district_nm = 'Kanshiram Nagar'
AND state_id = 
(SELECT state_id from states where state_nm = 'Uttar Pradesh' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Kanshiram Nagar district not updated', 16, 1);
	RETURN;
END

--Kashinagar

DELETE FROM districts_or_cities
WHERE district_nm = 'Kashinagar'
AND  state_id = 
(SELECT state_id FROM states WHERE state_nm = 'Uttar Pradesh' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Kashinagar district not deleted', 16, 1);
	RETURN;
END

--Lakhimpur Kheri

DELETE FROM districts_or_cities
WHERE district_nm = 'Lakhimpur Kheri'
AND  state_id = 
(SELECT state_id FROM states WHERE state_nm = 'Uttar Pradesh' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Lakhimpur Kheri district not deleted', 16, 1);
	RETURN;
END

--Kheri

UPDATE districts_or_cities
SET district_nm = 'Lakhimpur Kheri'
WHERE district_nm = 'Kheri'
AND state_id = 
(SELECT state_id from states where state_nm = 'Uttar Pradesh' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Kheri district not updated', 16, 1);
	RETURN;
END


--Khushi Nagar

UPDATE districts_or_cities
SET district_nm = 'Kushinagar'
WHERE district_nm = 'Khushi Nagar'
AND state_id = 
(SELECT state_id from states where state_nm = 'Uttar Pradesh' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Khushi Nagar district not updated', 16, 1);
	RETURN;
END

--Kkaushambi

UPDATE districts_or_cities
SET district_nm = 'Kaushambi'
WHERE district_nm = 'Kkaushambi'
AND state_id = 
(SELECT state_id from states where state_nm = 'Uttar Pradesh' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Kkaushambi district not updated', 16, 1);
	RETURN;
END

--Lakhimpur Khiri

DELETE FROM districts_or_cities
WHERE district_nm = 'Lakhimpur Khiri'
AND  state_id = 
(SELECT state_id FROM states WHERE state_nm = 'Uttar Pradesh' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Lakhimpur Khiri district not deleted', 16, 1);
	RETURN;
END

--Mahamaya Nagar

DELETE FROM districts_or_cities
WHERE district_nm = 'Mahamaya Nagar'
AND  state_id = 
(SELECT state_id FROM states WHERE state_nm = 'Uttar Pradesh' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Mahamaya Nagar district not deleted', 16, 1);
	RETURN;
END

--Rae Bareli

UPDATE districts_or_cities
SET district_nm = 'Raebareli'
WHERE district_nm = 'Rae Bareli'
AND state_id = 
(SELECT state_id from states where state_nm = 'Uttar Pradesh' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Rae Bareli district not updated', 16, 1);
	RETURN;
END

--Sant Ravi Dass Nagar Bhadohi

UPDATE districts_or_cities
SET district_nm = 'Sant Ravidas Nagar'
WHERE district_nm = 'Sant Ravi Dass Nagar Bhadohi'
AND state_id = 
(SELECT state_id from states where state_nm = 'Uttar Pradesh' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Sant Ravi Dass Nagar Bhadohi district not updated', 16, 1);
	RETURN;
END

--Tehri

DELETE FROM districts_or_cities
WHERE district_nm = 'Tehri'
AND  state_id = 
(SELECT state_id FROM states WHERE state_nm = 'Uttar Pradesh' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Tehri district not deleted', 16, 1);
	RETURN;
END

-- =============================================================================
--		Uttarakhand - no changes
-- =============================================================================

-- =============================================================================
--		Uttranchal - deleting state and corresponding districts
-- =============================================================================


DELETE FROM districts_or_cities
WHERE district_nm = 'Almoda'
AND  state_id = 
(SELECT state_id FROM states WHERE state_nm = 'Uttranchal' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Almoda district not deleted', 16, 1);
	RETURN;
END

DELETE FROM districts_or_cities
WHERE district_nm = 'Hardwar'
AND  state_id = 
(SELECT state_id FROM states WHERE state_nm = 'Uttranchal' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Hardwar district not deleted', 16, 1);
	RETURN;
END

DELETE FROM states
WHERE state_nm = 'Uttranchal'
and country_id  = @india_id
IF (@@ROWCOUNT != 1)
begin
	raiserror ('Uttranchal state not deleted', 16, 1);
	return;
end

-- =============================================================================
--		West Bengal - no changes
-- =============================================================================

--East Midnapore

UPDATE districts_or_cities
SET district_nm = 'Purba Medinipur'
WHERE district_nm = 'East Midnapore'
AND state_id = 
(SELECT state_id from states where state_nm = 'West Bengal' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('East Midnapore district not updated', 16, 1);
	RETURN;
END

--Malda

UPDATE districts_or_cities
SET district_nm = 'Maldah'
WHERE district_nm = 'Malda'
AND state_id = 
(SELECT state_id from states where state_nm = 'West Bengal' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Malda district not updated', 16, 1);
	RETURN;
END

--West Midnapore

UPDATE districts_or_cities
SET district_nm = 'Paschim Medinipur'
WHERE district_nm = 'West Midnapore'
AND state_id = 
(SELECT state_id from states where state_nm = 'West Bengal' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('West Midnapore district not updated', 16, 1);
	RETURN;
END

--Midnapore

UPDATE satsang_centres
SET district_or_city_id = (SELECT district_or_city_id FROM districts_or_cities WHERE district_nm = 'Paschim Medinipur' AND  state_id = 
(SELECT state_id from states where state_nm = 'West Bengal' and country_id  = @india_id))
WHERE district_or_city_id = (SELECT district_or_city_id FROM districts_or_cities WHERE district_nm = 'Midnapore' AND  state_id = 
(SELECT state_id from states where state_nm = 'West Bengal' and country_id  = @india_id))
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Satsang centres of Pali Marwar not updated', 16, 1);
	RETURN;
END

--North Dinajpur

UPDATE districts_or_cities
SET district_nm = 'Uttar Dinajpur'
WHERE district_nm = 'North Dinajpur'
AND state_id = 
(SELECT state_id from states where state_nm = 'West Bengal' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('North Dinajpur district not updated', 16, 1);
	RETURN;
END

--South Dinajpur


UPDATE districts_or_cities
SET district_nm = 'Dakshin Dinajpur'
WHERE district_nm = 'South Dinajpur'
AND state_id = 
(SELECT state_id from states where state_nm = 'West Bengal' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('South Dinajpur district not updated', 16, 1);
	RETURN;
END

--West Dinajpur

DELETE FROM districts_or_cities
WHERE district_nm = 'West Dinajpur'
AND  state_id = 
(SELECT state_id FROM states WHERE state_nm = 'West Bengal' and country_id  = @india_id)
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('West Dinajpur district not deleted', 16, 1);
	RETURN;
END
