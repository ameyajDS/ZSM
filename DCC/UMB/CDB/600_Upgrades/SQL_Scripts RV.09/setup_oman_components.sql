
/* ==================================================================================
    	Source File		:	setup_oman_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	12-10-2014
	Module ID		:	CDB
	Last updated		:	12-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Oman are set-up
	==================================================================================
		Revision History
	----------------------------------------------------------------------------------

	==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

-- ======================================================================

DECLARE
	@country_id		INT;

-- ======================================================================
SELECT	@country_id	=	country_id
FROM	countries
WHERE	country_nm	=	'Oman';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Oman not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Governorate',
		level_2_address_component	=	'District',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Ad Dakhliyah'            ,	     'Adam',	'DA',	'AD');
INSERT INTO @tbl VALUES ('Al Wusta'            ,	     'Ad Duqm',	'WU',	'DU');
INSERT INTO @tbl VALUES ('Muscat'            ,	     'Al Amrat',	'MA',	'AM');
INSERT INTO @tbl VALUES ('Al Batinah South'            ,	     'Al Awabi',	'BS',	'AW');
INSERT INTO @tbl VALUES ('Al Buraymi'            ,	     'Al Buraymi',	'BU',	'BU');
INSERT INTO @tbl VALUES ('Ad Dakhliyah'            ,	     'Al Hamra',	'DA',	'HA');
INSERT INTO @tbl VALUES ('Al Wusta'            ,	     'Al Jazer',	'WU',	'JA');
INSERT INTO @tbl VALUES ('Ash Sharqiyah South'            ,	     'Al Kamil Wa Al Wafi',	'SS',	'KW');
INSERT INTO @tbl VALUES ('Al Batinah North'            ,	     'Al Khaburah',	'BN',	'KH');
INSERT INTO @tbl VALUES ('Dhofar'            ,	     'Al Mazyunah',	'JA',	'MZ');
INSERT INTO @tbl VALUES ('Ash Sharqiyah North'            ,	     'Al Mudaybi',	'SN',	'MU');
INSERT INTO @tbl VALUES ('Al Batinah South'            ,	     'Al Musanaah',	'BS',	'MU');
INSERT INTO @tbl VALUES ('Ash Sharqiyah North'            ,	     'Al Qabil',	'SN',	'QA');
INSERT INTO @tbl VALUES ('Al Batinah South'            ,	     'Ar Rustaq',	'BS',	'RU');
INSERT INTO @tbl VALUES ('Muscat'            ,	     'As Seeb',	'MA',	'SE');
INSERT INTO @tbl VALUES ('Al Buraymi'            ,	     'As Sunaynah',	'BU',	'SN');
INSERT INTO @tbl VALUES ('Al Batinah North'            ,	     'As Suwayq',	'BN',	'SU');
INSERT INTO @tbl VALUES ('Ad Dakhliyah'            ,	     'Bahla',	'DA',	'BA');
INSERT INTO @tbl VALUES ('Al Batinah South'            ,	     'Barka',	'BS',	'BA');
INSERT INTO @tbl VALUES ('Muscat'            ,	     'Bawshar',	'MA',	'BA');
INSERT INTO @tbl VALUES ('Ad Dakhliyah'            ,	     'Bid Bid',	'DA',	'BB');
INSERT INTO @tbl VALUES ('Ash Sharqiyah North'            ,	     'Bidiyah',	'SN',	'BI');
INSERT INTO @tbl VALUES ('Musandam'            ,	     'Bukha',	'MU',	'BU');
INSERT INTO @tbl VALUES ('Musandam'            ,	     'Daba',	'MU',	'DA');
INSERT INTO @tbl VALUES ('Dhofar'            ,	     'Dalkut',	'JA',	'DA');
INSERT INTO @tbl VALUES ('Ash Sharqiyah North'            ,	     'Dama Wa At Taiyyin',	'SN',	'DA');
INSERT INTO @tbl VALUES ('Adh Dhahirah'            ,	     'Dank',	'DH',	'DA');
INSERT INTO @tbl VALUES ('Al Wusta'            ,	     'Hayma',	'WU',	'HA');
INSERT INTO @tbl VALUES ('Ash Sharqiyah North'            ,	     'Ibra',	'SN',	'IB');
INSERT INTO @tbl VALUES ('Adh Dhahirah'            ,	     'Ibri',	'DH',	'IB');
INSERT INTO @tbl VALUES ('Ad Dakhliyah'            ,	     'Izki',	'DA',	'IZ');
INSERT INTO @tbl VALUES ('Ash Sharqiyah South'            ,	     'Jaalan Bani Bu Ali',	'SS',	'JA');
INSERT INTO @tbl VALUES ('Ash Sharqiyah South'            ,	     'Jaalan Bani Bu Hasan',	'SS',	'JH');
INSERT INTO @tbl VALUES ('Musandam'            ,	     'Khasab',	'MU',	'KH');
INSERT INTO @tbl VALUES ('Al Batinah North'            ,	     'Liwa',	'BN',	'LI');
INSERT INTO @tbl VALUES ('Musandam'            ,	     'Madha',	'MU',	'MA');
INSERT INTO @tbl VALUES ('Al Buraymi'            ,	     'Mahadah',	'BU',	'MA');
INSERT INTO @tbl VALUES ('Al Wusta'            ,	     'Mahawt',	'WU',	'MU');
INSERT INTO @tbl VALUES ('Ad Dakhliyah'            ,	     'Manah',	'DA',	'MA');
INSERT INTO @tbl VALUES ('Ash Sharqiyah South'            ,	     'Masirah',	'SS',	'MA');
INSERT INTO @tbl VALUES ('Dhofar'            ,	     'Mirbat',	'JA',	'MI');
INSERT INTO @tbl VALUES ('Dhofar'            ,	     'Muqshin',	'JA',	'MU');
INSERT INTO @tbl VALUES ('Muscat'            ,	     'Muscat',	'MA',	'MS');
INSERT INTO @tbl VALUES ('Muscat'            ,	     'Mutrah',	'MA',	'MT');
INSERT INTO @tbl VALUES ('Al Batinah South'            ,	     'Nakhal',	'BS',	'NA');
INSERT INTO @tbl VALUES ('Ad Dakhliyah'            ,	     'Nizwa',	'DA',	'NI');
INSERT INTO @tbl VALUES ('Muscat'            ,	     'Qurayyat',	'MA',	'QU');
INSERT INTO @tbl VALUES ('Dhofar'            ,	     'Rakhyut',	'JA',	'RA');
INSERT INTO @tbl VALUES ('Dhofar'            ,	     'Sadah',	'JA',	'SD');
INSERT INTO @tbl VALUES ('Al Batinah North'            ,	     'Saham',	'BN',	'SA');
INSERT INTO @tbl VALUES ('Dhofar'            ,	     'Salalah',	'JA',	'SL');
INSERT INTO @tbl VALUES ('Ad Dakhliyah'            ,	     'Samail',	'DA',	'SA');
INSERT INTO @tbl VALUES ('Dhofar'            ,	     'Shalim Wa Juzur Al Hallaniyat',	'JA',	'SJ');
INSERT INTO @tbl VALUES ('Al Batinah North'            ,	     'Shinas',	'BN',	'SH');
INSERT INTO @tbl VALUES ('Al Batinah North'            ,	     'Sohar',	'BN',	'SO');
INSERT INTO @tbl VALUES ('Ash Sharqiyah South'            ,	     'Sur',	'SS',	'SU');
INSERT INTO @tbl VALUES ('Dhofar'            ,	     'Taqah',	'JA',	'TA');
INSERT INTO @tbl VALUES ('Dhofar'            ,	     'Thumrayt',	'JA',	'TH');
INSERT INTO @tbl VALUES ('Al Batinah South'            ,	     'Wadi Al Maawil',	'BS',	'WA');
INSERT INTO @tbl VALUES ('Ash Sharqiyah North'            ,	     'Wadi Bani Khalid',	'SN',	'WK');
INSERT INTO @tbl VALUES ('Adh Dhahirah'            ,	     'Yanqul',	'DH',	'YA');

SET NOCOUNT OFF

INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) 
	SELECT	DISTINCT @country_id, level_1_nm, level_1_cd
	FROM	@tbl;

-- ======================================================================


INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	level_2_nm, level_2_cd, level_1_address_component_id
	FROM	@tbl	t
		LEFT JOIN	level_1_address_components	l1
			ON	(	l1.level_1_address_component_nm	=	t.level_1_nm
				AND	l1.country_id					=	@country_id
				)

-- ======================================================================

UPDATE	l2
	SET	is_authentic	=	1
FROM	level_2_address_components	l2
	JOIN	level_1_address_components	l1
		ON	(	l1.level_1_address_component_id	=	l2.level_1_address_component_id
			AND	l1.country_id	=	@country_id
			);


UPDATE	level_1_address_components
	SET	is_authentic	=	1
WHERE	country_id	=	@country_id;

-- ======================================================================

