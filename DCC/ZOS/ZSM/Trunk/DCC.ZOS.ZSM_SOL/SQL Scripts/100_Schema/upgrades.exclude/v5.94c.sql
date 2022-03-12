/* ==================================================================================
    Source File		:	upgrade_v5.94c.sql
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
USE CDB 
Go

-- =============================================================================
--		Andhra Pradesh to Telangana
-- =============================================================================

SELECT * FROM CDB..states WHERE state_nm = 'Telangana'
IF (@@ROWCOUNT = 0)
BEGIN
SET IDENTITY_INSERT states ON
INSERT INTO states (state_id, state_cd, state_nm, country_id, effective_from, effective_till)
VALUES
(775, 'TLNGN','Telangana', 1, getdate(), '9999-12-31')
SET IDENTITY_INSERT states OFF
END

-- 10 districts out of the list were already present. They have been transferred to Telangana. These districts have been marked with a '--'


UPDATE districts_or_cities
SET state_id = 775 --Telangana
WHERE state_id = 135 --Andhra Pradesh
and district_nm in
(
'Adilabad', --
'Bhadradri Kothagudem',
'Hyderabad', --
'Jagtial',
'Jangaon',
'Jayashankar Bhupalapally',
'Jogulamba Gadwal',
'Kamareddy',
'Karimnagar', --
'Khammam', --
'Kumarambheem Asifabad',
'Mahabubabad',
'Mahabubnagar', --
'Mancherial',
'Medak', --
'Medchal–Malkajgiri',
'Nagarkurnool',
'Nalgonda', --
'Nirmal',
'Nizamabad', --
'Peddapalli',
'Rajanna Sircilla',
'Ranga Reddy', --
'Sangareddy',
'Siddipet',
'Suryapet',
'Vikarabad',
'Wanaparthy',
'Warangal Rural', --
'Warangal Urban', -- (Combined into Warangal. Post offices separated in the next part)
'Warangal', --added this temporarily
'Yadadri Bhuvanagiri'
)

-- There are no post offices currently under district Warangal. Disrectly renaming Warangal to Warangal Urban and creating a district called Warangal Rural

UPDATE districts_or_cities
SET district_nm = 'Warangal Urban'
WHERE district_or_city_id = 128

SET IDENTITY_INSERT districts_or_cities	ON;

INSERT INTO districts_or_cities
           (district_or_city_id, [district_cd]
           ,[district_nm]
           ,[state_id]
           ,[effective_from]
           ,[effective_till])
     VALUES
           (2863, 'WRGLR'
           ,'Warangal Rural'
           ,775
           ,GetDate()
           ,'9999-12-31')

SET IDENTITY_INSERT districts_or_cities	OFF;


-- =============================================================================
--		Districts and post offices updation
-- =============================================================================

-- =============================================================================
--		Andaman and Nicobar
-- =============================================================================


DELETE FROM states WHERE state_id = 751 -- duplicate row 

--


DELETE FROM districts_or_cities WHERE district_or_city_id = 2598

-- =============================================================================
--		Andhra Pradesh
-- =============================================================================

--removing duplicate rows

DELETE FROM districts_or_cities WHERE district_or_city_id in( 2648, 2649)


-- =============================================================================
--		Arunachal Pradesh
-- =============================================================================

--Deleting Along. It is headquarter of district West Siang; not a district in itself

DELETE FROM districts_or_cities WHERE district_or_city_id = 601

-- =============================================================================
--		Assam
-- =============================================================================

--correcting spellings

UPDATE districts_or_cities
SET district_nm = 'Kamrup Metropolitan'
WHERE district_nm = 'Guwahati'

UPDATE districts_or_cities
SET district_nm = 'Karbi Anglong'
WHERE district_nm = 'Karbi Anglog'

UPDATE districts_or_cities
SET district_nm = 'Morigaon'
WHERE district_nm = 'Marigaon'

UPDATE districts_or_cities
SET district_nm = 'Sivasagar'
WHERE district_nm = 'Sibsagar'

DELETE FROM districts_or_cities
WHERE district_nm = 'North Cachar Hills'


-- =============================================================================
--		Bihar
-- =============================================================================

--Chapra is the headquarter of Saran. Saran is already present as a district

--Satsang centres in Saran district use Chapra's district id. Changing that to Saran's district_id 
--Get this confirmed^^^
UPDATE satsang_centres
SET district_or_city_id = 193
WHERE district_or_city_id = 169 --Chapra


DELETE FROM districts_or_cities
WHERE district_or_city_id = 169 --Chapra

-- Dumka is a district in Jharkhand. Deleting FROM Bihar

DELETE FROM districts_or_cities
WHERE district_or_city_id = 171 -- Dumka

UPDATE districts_or_cities
SET district_nm = 'Jehanabad'
WHERE district_nm = 'Jahanabad'

-- The satsang centre Jamshedpur Area is reffering to Jamshedpur in Bihar. Changing that to East Singhbum 

UPDATE satsang_centres
SET district_or_city_id = 2693
WHERE district_or_city_id = 175

--Removing Jamshedpur FROM Bihar. It is in Jharkhand

DELETE FROM districts_or_cities WHERE district_or_city_id = 175

--Motihari is the headquarter of East Champaran district. Changing district id to that of East Champaran

UPDATE satsang_centres
SET district_or_city_id = 2826
WHERE district_or_city_id = 181


DELETE FROM districts_or_cities 
WHERE district_or_city_id = 181

-- Monghyr is not a district and does not have any dependencies

DELETE FROM districts_or_cities 
WHERE district_or_city_id = 182

--Paschimi Champaran is West Champaran. Deleting Paschimi Champaran

DELETE FROM districts_or_cities 
WHERE district_or_city_id = 186

