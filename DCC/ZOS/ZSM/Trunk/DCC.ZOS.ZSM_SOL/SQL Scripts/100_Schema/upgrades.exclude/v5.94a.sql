/* ==================================================================================
    Source File		:	upgrade_v5.94a.sql
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
	SET	version_no = 5.94,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'
GO

-- =============================================================================
--		CDB changes
-- =============================================================================

Use CDB
Go

DROP TABLE party_role_applications

DROP TABLE party_roles

DROP table party_addresses

DROP table parties

DROP table post_offices


-- =============================================================================
--		Thane to Palghar
-- =============================================================================

--New district Palghar

SET IDENTITY_INSERT districts_or_cities	ON;

INSERT INTO districts_or_cities
           (district_or_city_id, [district_cd]
           ,[district_nm]
           ,[state_id]
           ,[effective_from]
           ,[effective_till])
     VALUES

           (2862, 'PLGHR'
           ,'Palghar'
           ,124
           ,GetDate()
           ,'9999-12-31')
GO

SET IDENTITY_INSERT districts_or_cities	OFF;
