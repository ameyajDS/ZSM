/* ==================================================================================
    Source File		:	upgrade_v5.96b.sql
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
--		CDB changes
-- =============================================================================

USE CDB 
GO

--Purbi Champaran is East Champaran. Deleting Purbi Champaran

DELETE FROM districts_or_cities 
WHERE district_or_city_id = 188

-- Sasaram is the headquarter of Rohtas. Changing district to Rohtas in satsang_centres WHERE Sasaram is the district referred.

UPDATE satsang_centres
SET district_or_city_id = 190 --Rohtas
WHERE district_or_city_id = 194 --Sasaram

--deleting district Bhandara FROM Bihar. Doesn't exist

DELETE FROM districts_or_cities
WHERE district_or_city_id = 600

--Duplicate value

DELETE FROM districts_or_cities
WHERE district_or_city_id = 2653 --Chhapra

--Duplicate value

DELETE FROM districts_or_cities
WHERE district_or_city_id = 2654 -- Sita Mandi

--Deleting wrong row

DELETE FROM districts_or_cities
WHERE district_or_city_id = 2656 -- Tatanagar

-- =============================================================================
--		Chandigarh
-- =============================================================================

--no changes

-- =============================================================================
--		Chhattisgarh
-- =============================================================================
-- Ambikapur is under district Surguja. 

UPDATE satsang_centres
SET district_or_city_id = 2670 -- Surguja
WHERE district_or_city_id = 655 --Ambikapur

DELETE FROM districts_or_cities
WHERE district_or_city_id = 655 --Ambikapur

--Jagdalpur is under district Bastar

UPDATE satsang_centres
SET district_or_city_id = 2666 --Bastar
WHERE district_or_city_id = 661 -- Jagldalpur

DELETE FROM districts_or_cities
WHERE district_or_city_id = 661 --Jagdalpur

-- Janjgir -- Janjgir-Champa

UPDATE satsang_centres
SET district_or_city_id = 2667 --Janjgir-Champa
WHERE district_or_city_id = 684 --Janjgir


DELETE FROM districts_or_cities
WHERE district_or_city_id = 684 --Janjgir

-- Kawardha is the headquarter of Kabirdham. Changing name.

-----------------------

UPDATE districts_or_cities
SET district_nm = 'Kabirdham'
WHERE district_nm = 'Kawardha'

DELETE FROM districts_or_cities
WHERE district_or_city_id = 2668 --Kawrdha

--transferring post offices to one

UPDATE satsang_centres
SET district_or_city_id = 685
WHERE district_or_city_id = 2551

DELETE FROM districts_or_cities
WHERE district_or_city_id = 2551


--Baikunthpur is the headquarter of Koriya. Deleting Baikunthpur as Koriya exists as a separate district

DELETE FROM districts_or_cities
WHERE district_or_city_id = 689 --Baikunthpur

-- =============================================================================
--		Dadra and Nagar Haveli, Daman and Diu 
-- =============================================================================

--no changes

-- =============================================================================
--		Delhi
-- =============================================================================

DELETE FROM districts_or_cities
WHERE district_or_city_id = 2607 --Hauz Khas

-- =============================================================================
--		Ferozepur
-- =============================================================================
--Not a district. Deleting.

DELETE FROM states
WHERE state_id = 754 --Ferozepur

-- =============================================================================
--		Goa
-- =============================================================================
--Vasco da gama -- transfer everything under it to South Goa

-- =============================================================================
--		Gujarat
-- =============================================================================

UPDATE satsang_centres
SET district_or_city_id = 200 --Ahmedabad
WHERE district_or_city_id = 2671 --Ahmadabad

DELETE FROM districts_or_cities
WHERE district_or_city_id = 2671 --Ahmadabad

--Godhra

UPDATE satsang_centres
SET district_or_city_id = 212 --Panchmahal
WHERE district_or_city_id = 617 --Godhra

DELETE FROM districts_or_cities
WHERE district_or_city_id = 617

--Unjha is a part of Mahsana district

UPDATE satsang_centres
SET district_or_city_id = 211 --Mehsana
WHERE district_or_city_id = 2854 -- Unjha

DELETE FROM districts_or_cities
WHERE district_or_city_id = 2854 --Unjha

--Vijapur is a part of Mehsana district

UPDATE satsang_centres
SET district_or_city_id = 211 --Mehsana
WHERE district_or_city_id = 2853 -- Vijapur

DELETE FROM districts_or_cities
WHERE district_or_city_id = 2853 -- Vijapur

--Paithan
--Post office Siddhpur is a part of Patan district in Gujarat. Changing post office and deleting Paithan district


DELETE FROM districts_or_cities
WHERE district_or_city_id = 2819 --Paithan

--vyara
--Not a district

DELETE FROM districts_or_cities
WHERE district_or_city_id = 2532

-- =============================================================================
--		Haryana
-- =============================================================================


--Fatehbad

DELETE FROM districts_or_cities
WHERE district_or_city_id = 2673

--Jagadhari - not a district.

DELETE FROM districts_or_cities
WHERE district_or_city_id = 2672

--Narnaul - not a district. HQ of Mahendragarh

DELETE FROM districts_or_cities
WHERE district_or_city_id = 2603


--Sonepat & Sonipat
--Sonipat doesn't have any corresponding data. Deleting. Then renaming Sonepat to Sonipat.

DELETE FROM districts_or_cities
WHERE district_or_city_id = 2674

UPDATE districts_or_cities
SET district_nm = 'Sonipat'
WHERE district_or_city_id = 233 --Sonepat


--Yamuna Nagar --Yamunanagar

UPDATE districts_or_cities
SET district_nm = 'Yamunanagar'
WHERE district_or_city_id = 234 --Yamuna Nagar


-- =============================================================================
--		Haryana
-- =============================================================================
--Kulu - Kullu

UPDATE districts_or_cities
SET district_nm = 'Kullu'
WHERE district_or_city_id = 240 --Kulu

--Lahaul and Spiti --Duplicate row

DELETE FROM districts_or_cities
WHERE district_or_city_id = 2676

--Nurpur
DELETE FROM districts_or_cities
WHERE district_or_city_id = 2677

--Sirmaur

DELETE FROM districts_or_cities
WHERE district_or_city_id = 2675

