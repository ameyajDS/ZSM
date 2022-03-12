/* ==================================================================================
	Source File		:	nagpur_data_issues.sql
	Author(s)		:	Manish Saluja, Jiten Loyal
	Started On		:	Mon Sep 24, 2011
	Version			:	0.02
	Module ID		:	ZSM
	Language		:	TRANSACT-SQL
	Last updated	:	01-Oct-2011
	Reviewed By		:
	Reviewed On		:
	==================================================================================
																		   Usage Notes
	----------------------------------------------------------------------------------
		This script shows data issues in sms database that needs to be fixed.

	==================================================================================
																	  Revision History
	----------------------------------------------------------------------------------
	v0.02 MS	* 01-Oct-2011
				* Listing following issues
					- Illegal CountryCode, StateCode, DistrictCode, CityCode
					- Addresses with CityCode with Status = 'D' (Kamptee) -- Not migrated the sewadars_adresses
	v0.01 MS	* 24-Sep-2011
				* Initial version listing following issues
					- initiation_dt, inititaion_place, initiated_by missing
					- Names with multiple middle names
					- Names with MiddleName as NULL
					- DoB > '1996-01-01' OR Age < 16
					- New Type / No Detail Address Proof
					- Health Problems with no details
					- Occoupations not matching with ZSM
	==================================================================================*/

DECLARE 
	@cnt1				INT;

-- ====================================================================================================
--	Initiation Date, Place, Ititiated By missing
-- ====================================================================================================
SELECT GrNo, I_Dt, I_Place, I_SatGuru FROM Sewadars WHERE I_SatGuru IS NULL AND COALESCE(I_SatGuru, I_Place, CONVERT(VARCHAR, I_Dt)) IS NOT NULL;

SELECT GrNo, I_Dt, I_Place, I_SatGuru FROM Sewadars WHERE I_Place IS NULL AND COALESCE(I_SatGuru, I_Place, CONVERT(VARCHAR, I_Dt)) IS NOT NULL;

SELECT GrNo, I_Dt, I_Place, I_SatGuru FROM Sewadars WHERE I_Dt IS NULL AND COALESCE(I_SatGuru, I_Place, CONVERT(VARCHAR, I_Dt)) IS NOT NULL;

-- ====================================================================================================
-- 	Names with multiple middle names
-- ====================================================================================================
SELECT GrNo, Name, MiddleName, zsm_first_nm, zsm_middle_nm, zsm_last_nm FROM
(SELECT GrNo, Name, MiddleName, 
	LEFT(LTRIM(Name),LEN(Name) - CHARINDEX(' ',REVERSE(Name))) [zsm_first_nm], 
	COALESCE(LTRIM(RTRIM(MiddleName)), 'GetMiddleName') [zsm_middle_nm],
	RIGHT(RTRIM(Name),CHARINDEX(' ',REVERSE(RTRIM(Name))) - 1) [zsm_last_nm],
	LEN(REPLACE(REPLACE(REPLACE(Name,' ','{}'),'}{',''),'{}',' ')) - LEN(REPLACE(REPLACE(REPLACE(REPLACE(Name,' ','{}'),'}{',''),'{}',' '), ' ','')) [spaces] FROM Sewadars) tbl
WHERE spaces <> 1;

-- ====================================================================================================
-- 	Names with MiddleName as NULL
-- ====================================================================================================
SELECT * FROM Sewadars WHERE MiddleName IS NULL

-- ====================================================================================================
-- 	Entries with DoB > '1996-01-01' OR Age < 16
-- ====================================================================================================
SELECT * FROM Sewadars WHERE Age < 16 OR DoB > '1996-01-01';

-- ====================================================================================================
-- 	New Type / No Detail Address Proof
-- ====================================================================================================
SELECT * FROM Sewadar_AddProof s JOIN AddProofMast a ON a.Code = s.DocNo WHERE s.DocNo NOT IN (1, 5) OR DocNo = 5 AND Details NOT LIKE '%Voter%';

-- ====================================================================================================
-- 	Health Problems with no details.
-- ====================================================================================================
SELECT * FROM Sewadar_Health WHERE ParameterCode = 5 AND Comments NOT IN ('Hypertension', 'Handicap', 'Asthama');

-- ====================================================================================================
-- 	Occoupations not matching with ZSM
-- ====================================================================================================
SELECT DISTINCT Occupation FROM Sewadars WHERE Occupation NOT IN (SELECT occupation FROM ZSM..occupations)

-- ====================================================================================================
-- 	Illegal CountryCode
-- ====================================================================================================
SELECT * FROM Sewadars where CountryCode = 0

-- ====================================================================================================
-- 	Illegal StateCode
-- ====================================================================================================
SELECT * FROM Sewadars where StateCode = 0

-- ====================================================================================================
-- 	Illegal DisttCode
-- ====================================================================================================
SELECT * FROM Sewadars where DisttCode = 0

-- ====================================================================================================
-- 	Illegal CityCode
-- ====================================================================================================
SELECT * FROM Sewadars where CityCode = 0

-- ====================================================================================================
-- 	Addresses with CityCode with Status = 'D' (Kamptee) -- Not migrated the sewadars_adresses
-- ====================================================================================================
SELECT * FROM Sewadars where CityCode = 5

