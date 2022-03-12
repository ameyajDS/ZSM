
/* ==================================================================================
    	Source File		:	setup_sudan_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Sudan are set-up
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
WHERE	country_nm	=	'Sudan';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Sudan not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'State',
		level_2_address_component	=	'District',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('River Nile'            ,	     'Abu Hamed',	'RN',	'AH');
INSERT INTO @tbl VALUES ('Sennar'            ,	     'Abu Hugar',	'SI',	'AH');
INSERT INTO @tbl VALUES ('South Kordofan'            ,	     'Abu Jibieha',	'KS',	'AJ');
INSERT INTO @tbl VALUES ('North Kordofan'            ,	     'Abu Zabad',	'KN',	'AZ');
INSERT INTO @tbl VALUES ('South Kordofan'            ,	     'Ab Yei',	'KS',	'AY');
INSERT INTO @tbl VALUES ('South Darfur'            ,	     'Adiela',	'SD',	'AD');
INSERT INTO @tbl VALUES ('Red Sea'            ,	     'Agieg',	'RS',	'AG');
INSERT INTO @tbl VALUES ('Northern'            ,	     'Al Borgaig',	'NO',	'BO');
INSERT INTO @tbl VALUES ('Northern'            ,	     'Aldaba',	'NO',	'AD');
INSERT INTO @tbl VALUES ('Gedarif'            ,	     'Al Fao',	'GD',	'FA');
INSERT INTO @tbl VALUES ('Gedarif'            ,	     'Al Galabat Al Garbia',	'GD',	'GG');
INSERT INTO @tbl VALUES ('Gedarif'            ,	     'Al Gedarif City',	'GD',	'GC');
INSERT INTO @tbl VALUES ('Northern'            ,	     'Algolid',	'NO',	'AG');
INSERT INTO @tbl VALUES ('North Darfur'            ,	     'Alkoma',	'ND',	'AK');
INSERT INTO @tbl VALUES ('South Kordofan'            ,	     'Alrshad',	'KS',	'AL');
INSERT INTO @tbl VALUES ('South Darfur'            ,	     'Alsalam',	'SD',	'AL');
INSERT INTO @tbl VALUES ('White Nile'            ,	     'Al Salam',	'WN',	'SA');
INSERT INTO @tbl VALUES ('North Darfur'            ,	     'Alseraf',	'ND',	'AS');
INSERT INTO @tbl VALUES ('Sennar'            ,	     'Alsoky',	'SI',	'AL');
INSERT INTO @tbl VALUES ('Blue Nile'            ,	     'Al Tdamon',	'BN',	'TD');
INSERT INTO @tbl VALUES ('North Darfur'            ,	     'Altewash/Alleet',	'ND',	'AT');
INSERT INTO @tbl VALUES ('North Darfur'            ,	     'Alwaha',	'ND',	'AW');
INSERT INTO @tbl VALUES ('Kassala'            ,	     'Aroma Rural',	'KA',	'AR');
INSERT INTO @tbl VALUES ('River Nile'            ,	     'Atbara',	'RN',	'AT');
INSERT INTO @tbl VALUES ('West Darfur'            ,	     'Azoom',	'WD',	'AZ');
INSERT INTO @tbl VALUES ('South Darfur'            ,	     'Bahr Al Arab',	'SD',	'BA');
INSERT INTO @tbl VALUES ('Khartoum'            ,	     'Bahri',	'KH',	'BA');
INSERT INTO @tbl VALUES ('North Kordofan'            ,	     'Bara',	'KN',	'BA');
INSERT INTO @tbl VALUES ('Blue Nile'            ,	     'Bau',	'BN',	'BA');
INSERT INTO @tbl VALUES ('West Darfur'            ,	     'Bayda',	'WD',	'BA');
INSERT INTO @tbl VALUES ('River Nile'            ,	     'Berber',	'RN',	'BE');
INSERT INTO @tbl VALUES ('South Darfur'            ,	     'Buram',	'SD',	'BU');
INSERT INTO @tbl VALUES ('Gedarif'            ,	     'Central Al Gedarif',	'GD',	'CG');
INSERT INTO @tbl VALUES ('Northern'            ,	     'Dalgo',	'NO',	'DA');
INSERT INTO @tbl VALUES ('Northern'            ,	     'Dongola',	'NO',	'DO');
INSERT INTO @tbl VALUES ('South Darfur'            ,	     'East Jabal Mara',	'SD',	'EM');
INSERT INTO @tbl VALUES ('Sennar'            ,	     'East Sinnar',	'SI',	'ES');
INSERT INTO @tbl VALUES ('South Darfur'            ,	     'Ed Al Fursan',	'SD',	'EF');
INSERT INTO @tbl VALUES ('South Darfur'            ,	     'Ed Daein',	'SD',	'ED');
INSERT INTO @tbl VALUES ('Gedarif'            ,	     'El Botana',	'GD',	'EB');
INSERT INTO @tbl VALUES ('South Kordofan'            ,	     'El Dalanj',	'KS',	'ED');
INSERT INTO @tbl VALUES ('Sennar'            ,	     'Eldali',	'SI',	'EL');
INSERT INTO @tbl VALUES ('River Nile'            ,	     'El Damar',	'RN',	'ED');
INSERT INTO @tbl VALUES ('Blue Nile'            ,	     'Eldamazin',	'BN',	'ED');
INSERT INTO @tbl VALUES ('Sennar'            ,	     'Eldindir',	'SI',	'ED');
INSERT INTO @tbl VALUES ('White Nile'            ,	     'Eldiwiem',	'WN',	'EL');
INSERT INTO @tbl VALUES ('Gedarif'            ,	     'El Fashaga',	'GD',	'EF');
INSERT INTO @tbl VALUES ('North Darfur'            ,	     'El Fasher',	'ND',	'EF');
INSERT INTO @tbl VALUES ('Gedarif'            ,	     'El Galabat Sharquia',	'GD',	'ES');
INSERT INTO @tbl VALUES ('West Darfur'            ,	     'El Geneina',	'WD',	'EG');
INSERT INTO @tbl VALUES ('White Nile'            ,	     'El Geteina',	'WN',	'EG');
INSERT INTO @tbl VALUES ('Gezira'            ,	     'El Gezira East',	'GZ',	'EE');
INSERT INTO @tbl VALUES ('Gedarif'            ,	     'Elghoreisha',	'GD',	'EL');
INSERT INTO @tbl VALUES ('Red Sea'            ,	     'Elgunab',	'RS',	'EL');
INSERT INTO @tbl VALUES ('Gezira'            ,	     'El Hasaheisa',	'GZ',	'EH');
INSERT INTO @tbl VALUES ('White Nile'            ,	     'El Jebelein',	'WN',	'EJ');
INSERT INTO @tbl VALUES ('Gezira'            ,	     'El Kamlin',	'GZ',	'EK');
INSERT INTO @tbl VALUES ('Blue Nile'            ,	     'Elkurmuk',	'BN',	'EK');
INSERT INTO @tbl VALUES ('North Darfur'            ,	     'El Malha',	'ND',	'EM');
INSERT INTO @tbl VALUES ('Gezira'            ,	     'El Managil',	'GZ',	'EM');
INSERT INTO @tbl VALUES ('River Nile'            ,	     'El Matama',	'RN',	'EM');
INSERT INTO @tbl VALUES ('North Kordofan'            ,	     'El Nohood',	'KN',	'EN');
INSERT INTO @tbl VALUES ('Gedarif'            ,	     'El Rahad',	'GD',	'ER');
INSERT INTO @tbl VALUES ('Blue Nile'            ,	     'Elrosieris',	'BN',	'ER');
INSERT INTO @tbl VALUES ('South Kordofan'            ,	     'El Salam',	'KS',	'ES');
INSERT INTO @tbl VALUES ('North Kordofan'            ,	     'Gabrat Elshiekh',	'KN',	'GE');
INSERT INTO @tbl VALUES ('North Kordofan'            ,	     'Gebeish',	'KN',	'GB');
INSERT INTO @tbl VALUES ('Blue Nile'            ,	     'Giesan',	'BN',	'GI');
INSERT INTO @tbl VALUES ('West Darfur'            ,	     'Habiela',	'WD',	'HA');
INSERT INTO @tbl VALUES ('Red Sea'            ,	     'Halayib',	'RS',	'HA');
INSERT INTO @tbl VALUES ('Northern'            ,	     'Halfa',	'NO',	'HA');
INSERT INTO @tbl VALUES ('Kassala'            ,	     'Halfa Al Gedida',	'KA',	'HG');
INSERT INTO @tbl VALUES ('Kassala'            ,	     'Hamashkoreeb',	'KA',	'HA');
INSERT INTO @tbl VALUES ('Red Sea'            ,	     'Ha Yia',	'RS',	'HY');
INSERT INTO @tbl VALUES ('Khartoum'            ,	     'Jabel Awliya',	'KH',	'JA');
INSERT INTO @tbl VALUES ('South Kordofan'            ,	     'Kadogli',	'KS',	'KA');
INSERT INTO @tbl VALUES ('North Darfur'            ,	     'Kalmando',	'ND',	'KA');
INSERT INTO @tbl VALUES ('Khartoum'            ,	     'Karrari',	'KH',	'KA');
INSERT INTO @tbl VALUES ('South Darfur'            ,	     'Kass',	'SD',	'KA');
INSERT INTO @tbl VALUES ('Kassala'            ,	     'Kassala City',	'KA',	'KC');
INSERT INTO @tbl VALUES ('Kassala'            ,	     'Kassala Rural',	'KA',	'KR');
INSERT INTO @tbl VALUES ('North Darfur'            ,	     'Kebkabiya',	'ND',	'KE');
INSERT INTO @tbl VALUES ('Khartoum'            ,	     'Khartoum',	'KH',	'KH');
INSERT INTO @tbl VALUES ('South Kordofan'            ,	     'Kielak',	'KS',	'KI');
INSERT INTO @tbl VALUES ('West Darfur'            ,	     'Kirenik',	'WD',	'KI');
INSERT INTO @tbl VALUES ('White Nile'            ,	     'Kosti',	'WN',	'KO');
INSERT INTO @tbl VALUES ('West Darfur'            ,	     'Kulbus',	'WD',	'KU');
INSERT INTO @tbl VALUES ('North Darfur'            ,	     'Kutum',	'ND',	'KU');
INSERT INTO @tbl VALUES ('South Kordofan'            ,	     'Lagawa',	'KS',	'LA');
INSERT INTO @tbl VALUES ('Northern'            ,	     'Marwai',	'NO',	'MA');
INSERT INTO @tbl VALUES ('North Darfur'            ,	     'Mellit',	'ND',	'ME');
INSERT INTO @tbl VALUES ('West Darfur'            ,	     'Mukjar',	'WD',	'MU');
INSERT INTO @tbl VALUES ('Kassala'            ,	     'Nahr Atbara',	'KA',	'NB');
INSERT INTO @tbl VALUES ('West Darfur'            ,	     'Nertiti',	'WD',	'NE');
INSERT INTO @tbl VALUES ('Kassala'            ,	     'North Aldalta',	'KA',	'NA');
INSERT INTO @tbl VALUES ('South Darfur'            ,	     'Nyala',	'SD',	'NY');
INSERT INTO @tbl VALUES ('Khartoum'            ,	     'Oum Bada',	'KH',	'OB');
INSERT INTO @tbl VALUES ('Khartoum'            ,	     'Oum Durman',	'KH',	'OD');
INSERT INTO @tbl VALUES ('Red Sea'            ,	     'Port Sudan',	'RS',	'PS');
INSERT INTO @tbl VALUES ('Gedarif'            ,	     'Qalaa El Nahal',	'GD',	'QN');
INSERT INTO @tbl VALUES ('White Nile'            ,	     'Rabak',	'WN',	'RA');
INSERT INTO @tbl VALUES ('South Darfur'            ,	     'Rihied El Birdi',	'SD',	'RB');
INSERT INTO @tbl VALUES ('North Darfur'            ,	     'Sarf Omra',	'ND',	'SO');
INSERT INTO @tbl VALUES ('Red Sea'            ,	     'Sawakin',	'RS',	'SA');
INSERT INTO @tbl VALUES ('Red Sea'            ,	     'Senkat',	'RS',	'SE');
INSERT INTO @tbl VALUES ('Kassala'            ,	     'Setit',	'KA',	'SE');
INSERT INTO @tbl VALUES ('South Darfur'            ,	     'Sheiria',	'SD',	'SH');
INSERT INTO @tbl VALUES ('North Kordofan'            ,	     'Shekan',	'KN',	'SH');
INSERT INTO @tbl VALUES ('River Nile'            ,	     'Shendi',	'RN',	'SH');
INSERT INTO @tbl VALUES ('Khartoum'            ,	     'Shrg Alneel',	'KH',	'SA');
INSERT INTO @tbl VALUES ('Sennar'            ,	     'Sinja',	'SI',	'SJ');
INSERT INTO @tbl VALUES ('Sennar'            ,	     'Sinnar',	'SI',	'SI');
INSERT INTO @tbl VALUES ('West Darfur'            ,	     'Sirba',	'WD',	'SI');
INSERT INTO @tbl VALUES ('North Kordofan'            ,	     'Sodri',	'KN',	'SO');
INSERT INTO @tbl VALUES ('Gezira'            ,	     'South Al Jazeera',	'GZ',	'SJ');
INSERT INTO @tbl VALUES ('Kassala'            ,	     'Talkook',	'KA',	'TA');
INSERT INTO @tbl VALUES ('South Kordofan'            ,	     'Talody',	'KS',	'TA');
INSERT INTO @tbl VALUES ('White Nile'            ,	     'Tandalti',	'WN',	'TA');
INSERT INTO @tbl VALUES ('Red Sea'            ,	     'Toker',	'RS',	'TO');
INSERT INTO @tbl VALUES ('South Darfur'            ,	     'Tullus',	'SD',	'TU');
INSERT INTO @tbl VALUES ('Gezira'            ,	     'Um Algora',	'GZ',	'UA');
INSERT INTO @tbl VALUES ('West Darfur'            ,	     'Um Dukhun',	'WD',	'UD');
INSERT INTO @tbl VALUES ('North Darfur'            ,	     'Um Kedada',	'ND',	'UK');
INSERT INTO @tbl VALUES ('White Nile'            ,	     'Um Rimta',	'WN',	'UR');
INSERT INTO @tbl VALUES ('North Kordofan'            ,	     'Um Rwaba',	'KN',	'UR');
INSERT INTO @tbl VALUES ('North Kordofan'            ,	     'Wad Banda',	'KN',	'WB');
INSERT INTO @tbl VALUES ('Kassala'            ,	     'Wad El Hilaiw',	'KA',	'WH');
INSERT INTO @tbl VALUES ('West Darfur'            ,	     'Wadi Salih',	'WD',	'WS');
INSERT INTO @tbl VALUES ('Gezira'            ,	     'Wad Madni Alk Obra',	'GZ',	'WO');
INSERT INTO @tbl VALUES ('Kassala'            ,	     'West Kassala',	'KA',	'WK');
INSERT INTO @tbl VALUES ('West Darfur'            ,	     'Zalingei',	'WD',	'ZA');

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

