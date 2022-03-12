/* ==================================================================================
	Source File		:	post_office_or_city_2.sql
	Author(s)		:	Manish Saluja / Jitendra Loyal
	Started On		:	
	Version			:	
	Module ID		:	ZSM (Indore)
	Language		:	TRANSACT-SQL
	Last updated	:	9 Jun 2012
	Reviewed By		:	
	Reviewed On		:	
	==================================================================================
														 				   Usage Notes
	==================================================================================
																	  Revision History
	==================================================================================*/

CREATE TABLE #processed 
(
	NAME			VARCHAR (200),
	PinCode			VARCHAR (200),
	PostOffice		VARCHAR (200)
)
GO

EXEC sp_configure 'show advanced options', 1
GO
RECONFIGURE
GO
EXEC sp_configure 'Ad Hoc Distributed Queries', 1
GO
RECONFIGURE
GO

INSERT INTO #processed
	(
		NAME, PinCode, PostOffice
	)
	SELECT 
		NAME, PinCode, PostOffice
	FROM OPENROWSET('Microsoft.Jet.OLEDB.4.0', 'Excel 8.0;Database=C:\TEMP\INDORE PINCODES.xls', 'SELECT * FROM [Sheet1$]');
  
GO

CREATE TABLE mgr_tmp_district_pincodes
(
	NAME			VARCHAR (100),
	PinCode			CHAR (6),
	PostOffice		VARCHAR (100),
	District		VARCHAR (50)
)
GO

INSERT INTO mgr_tmp_district_pincodes
	(
		NAME, PinCode, PostOffice, District
	)
	SELECT 
		NAME, PinCode, PostOffice, 'Indore'
	FROM #processed;

GO

DROP TABLE #processed
GO

CREATE TABLE #processed 
(
	NAME			VARCHAR (200),
	PinCode			VARCHAR (200),
	PostOffice		VARCHAR (200)
)
GO

INSERT INTO #processed
	(
		NAME, PinCode, PostOffice
	)
	SELECT 
		NAME, PinCode, PostOffice
	FROM OPENROWSET('Microsoft.Jet.OLEDB.4.0', 'Excel 8.0;Database=C:\TEMP\UJJAIN PIN.xls', 'SELECT * FROM [Sheet1$]');
  
GO

INSERT INTO mgr_tmp_district_pincodes
	(
		NAME, PinCode, PostOffice, District
	)
	SELECT 
		NAME, PinCode, PostOffice, 'Ujjain'
	FROM #processed;
GO

DROP TABLE #processed
GO

CREATE TABLE #processed 
(
	NAME			VARCHAR (200),
	PinCode			VARCHAR (200),
	PostOffice		VARCHAR (200)
)
GO

INSERT INTO #processed
	(
		NAME, PinCode, PostOffice
	)
	SELECT 
		NAME, PinCode, PostOffice
	FROM OPENROWSET('Microsoft.Jet.OLEDB.4.0', 'Excel 8.0;Database=C:\TEMP\shajapur pin.xls', 'SELECT * FROM [Sheet1$]');
  
GO

INSERT INTO mgr_tmp_district_pincodes
	(
		NAME, PinCode, PostOffice, District
	)
	SELECT 
		NAME, PinCode, PostOffice, 'Shajapur'
	FROM #processed;
GO

DROP TABLE #processed
GO

-- PostOffice matches
UPDATE c
	SET c.post_office_or_city_id = p.post_office_or_city_id
	FROM mgr_centre_sewadars c
	JOIN (SELECT DISTINCT District, PostOffice FROM mgr_tmp_district_pincodes t1) t ON t.PostOffice = c.post_office_or_city_nm AND t.District = c.district_nm
	JOIN CDB..districts_or_cities d ON d.district_nm = t.District
	JOIN post_offices_or_cities p ON p.district_id = d.district_or_city_id AND p.post_office_or_city_nm = t.PostOffice
	WHERE c.district_nm <> '' AND c.post_office_or_city_nm <> '' AND c.post_office_or_city_nm <> 'Same'
	AND c.post_office_or_city_id IS NULL
	AND c.is_migrated = 'N';

-- Name matched and PostOffice do not match and address_line_1 <> ''

UPDATE c
	SET c.post_office_or_city_id	= p.post_office_or_city_id,
		c.address_line_2			= CASE WHEN (c.address_line_2 = '') THEN c.post_office_or_city_nm ELSE c.address_line_2 + ', ' + c.post_office_or_city_nm END
	FROM mgr_centre_sewadars c
	JOIN mgr_tmp_district_pincodes t ON t.Name = c.post_office_or_city_nm AND t.District = c.district_nm AND t.PostOffice <> c.post_office_or_city_nm
	JOIN CDB..districts_or_cities d ON d.district_nm = t.District
	JOIN post_offices_or_cities p ON p.district_id = d.district_or_city_id AND p.post_office_or_city_nm = t.PostOffice
	WHERE c.district_nm <> '' AND c.post_office_or_city_nm <> '' AND c.post_office_or_city_nm <> 'Same'
	AND c.post_office_or_city_id IS NULL
	AND c.address_line_1 <> ''
	AND c.is_migrated = 'N';

-- Name matched and PostOffice do not match and address_line_1 = '' (hence updating the Name in address_line_1 instead of address_line_2)
UPDATE c
	SET c.post_office_or_city_id	= p.post_office_or_city_id,
		c.address_line_1			= c.post_office_or_city_nm
	FROM mgr_centre_sewadars c
	JOIN mgr_tmp_district_pincodes t ON t.Name = c.post_office_or_city_nm AND t.District = c.district_nm AND t.PostOffice <> c.post_office_or_city_nm
	JOIN CDB..districts_or_cities d ON d.district_nm = t.District
	JOIN post_offices_or_cities p ON p.district_id = d.district_or_city_id AND p.post_office_or_city_nm = t.PostOffice
	WHERE c.district_nm <> '' AND c.post_office_or_city_nm <> '' AND c.post_office_or_city_nm <> 'Same'
	AND c.post_office_or_city_id IS NULL
	AND c.address_line_1 = ''
	AND c.is_migrated = 'N';
GO

DROP TABLE mgr_tmp_district_pincodes
GO
