/* ==================================================================================
    Source File		:	upgrade_v5.96a.sql
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

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

USE SysAdmin
GO

UPDATE packages
	SET	version_no = 5.96,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'
GO

-- =============================================================================
--		ZSM changes
-- =============================================================================

USE ZSM
GO

UPDATE sewadars_addresses
SET post_office_or_city_id = 58304 --Podishankar in Janjgir Champa
WHERE post_office_or_city_id = 58302 --Podishankar in Janjgir


DELETE FROM post_offices_or_cities
WHERE post_office_or_city_id = 58302 --Podishankar in Janjgir

--Kabirdham

DELETE
FROM	post_offices_or_cities
WHERE	district_id	=	685
AND		post_office_or_city_cd	IN	(	'KBD', 'KK', 'SPURI'	);


SET IDENTITY_INSERT post_offices_or_cities	ON;

INSERT INTO post_offices_or_cities
           (post_office_or_city_id,
			[district_id]
           ,[post_office_or_city_cd]
           ,[post_office_or_city_nm]
           ,[effective_from]
           ,[effective_till])
     VALUES
           (66900, 685
           ,'KBD'
           ,'Kabirdham'
           ,GetDate()
           ,'9999-12-31')

INSERT INTO post_offices_or_cities
           (post_office_or_city_id,
           [district_id]
           ,[post_office_or_city_cd]
           ,[post_office_or_city_nm]
           ,[effective_from]
           ,[effective_till])
     VALUES
           (66901, 685
           ,'KK'
           ,'Koko'
           ,GetDate()
           ,'9999-12-31')

INSERT INTO post_offices_or_cities
           (post_office_or_city_id,
           [district_id]
           ,[post_office_or_city_cd]
           ,[post_office_or_city_nm]
           ,[effective_from]
           ,[effective_till])
     VALUES
           (66902, 685
           ,'SPURI'
           ,'Singhanpuri'
           ,GetDate()
           ,'9999-12-31')

SET IDENTITY_INSERT post_offices_or_cities	OFF;

UPDATE sewadars_addresses
SET post_office_or_city_id = 66900
FROM sewadars_addresses s
JOIN post_offices_or_cities p ON 
s.post_office_or_city_id = p.post_office_or_city_id
WHERE p.post_office_or_city_nm = 'Kabirdham'
AND p.district_id = 2551


UPDATE sewadars_addresses
SET post_office_or_city_id = 66901
FROM sewadars_addresses s
JOIN post_offices_or_cities p ON 
s.post_office_or_city_id = p.post_office_or_city_id
WHERE p.post_office_or_city_nm = 'Koko'
AND p.district_id = 2551

--Singhanpuri


UPDATE sewadars_addresses
SET post_office_or_city_id = 66901
FROM sewadars_addresses s
JOIN post_offices_or_cities p ON 
s.post_office_or_city_id = p.post_office_or_city_id
WHERE p.post_office_or_city_nm = 'Singhanpuri'
AND p.district_id = 2551


DELETE FROM post_offices_or_cities
WHERE district_id = 2551


UPDATE sewadars_addresses
SET post_office_or_city_id = 58452 --Godhra in Godhra
WHERE post_office_or_city_id = 58486 --Godhra in Panchmahal

DELETE FROM post_offices_or_cities
WHERE post_office_or_city_id = 58486 --Godhra in Panchmahal

UPDATE sewadars_addresses
SET post_office_or_city_id = 58483 --Siddhpur in Patan
WHERE post_office_or_city_id = 4748 --Siddhpur in Paithan

DELETE FROM post_offices_or_cities
WHERE post_office_or_city_id = 4748 --Siddhpur in Paithan
