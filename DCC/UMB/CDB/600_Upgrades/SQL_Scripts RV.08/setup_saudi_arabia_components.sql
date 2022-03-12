
/* ==================================================================================
    	Source File		:	setup_saudi_arabia_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Saudi Arabia are set-up
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
WHERE	country_nm	=	'Saudi Arabia';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Saudi Arabia not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Region',
		level_2_address_component	=	'Governorate',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('`Asir'            ,	     'Abha',	'AS',	'AB');
INSERT INTO @tbl VALUES ('Jizan'            ,	     'Abu Arish',	'JZ',	'AA');
INSERT INTO @tbl VALUES ('Ar Riyad'            ,	     'Afif',	'RI',	'AF');
INSERT INTO @tbl VALUES ('Ar Riyad'            ,	     'Al-Aflaj',	'RI',	'AJ');
INSERT INTO @tbl VALUES ('Jizan'            ,	     'Ahad al-Musarihah',	'JZ',	'AM');
INSERT INTO @tbl VALUES ('`Asir'            ,	     'Ahd Rifaydah',	'AS',	'AR');
INSERT INTO @tbl VALUES ('Ash Sharqiyah'            ,	     'Al-Ahsa',	'SH',	'AH');
INSERT INTO @tbl VALUES ('Al Madinah'            ,	     'Alula',	'MD',	'AL');
INSERT INTO @tbl VALUES ('Al Bahah'            ,	     'Al-Aqiq',	'BA',	'AQ');
INSERT INTO @tbl VALUES ('Al Hudud ash Shamaliyah'            ,	     'Ar''ar',	'HS',	'AR');
INSERT INTO @tbl VALUES ('Jizan'            ,	     'Al-Aridah',	'JZ',	'AR');
INSERT INTO @tbl VALUES ('Al Qasim'            ,	     'Al-Asyah',	'QS',	'AS');
INSERT INTO @tbl VALUES ('Al Qasim'            ,	     'Al-Badai',	'QS',	'BA');
INSERT INTO @tbl VALUES ('Al Madinah'            ,	     'Badr',	'MD',	'BA');
INSERT INTO @tbl VALUES ('Najran'            ,	     'Badr al-Janub',	'NJ',	'BJ');
INSERT INTO @tbl VALUES ('Al Bahah'            ,	     'Al-Bahah',	'BA',	'BA');
INSERT INTO @tbl VALUES ('`Asir'            ,	     'Balqarn',	'AS',	'BA');
INSERT INTO @tbl VALUES ('Ha''il'            ,	     'Baqa',	'HA',	'BA');
INSERT INTO @tbl VALUES ('Jizan'            ,	     'Baysh',	'JZ',	'BA');
INSERT INTO @tbl VALUES ('Al Bahah'            ,	     'Biljurashi',	'BA',	'BI');
INSERT INTO @tbl VALUES ('`Asir'            ,	     'Bishah',	'AS',	'BI');
INSERT INTO @tbl VALUES ('Al Qasim'            ,	     'Al-Bukayriyah',	'QS',	'BK');
INSERT INTO @tbl VALUES ('Ash Sharqiyah'            ,	     'Buqayq',	'SH',	'BU');
INSERT INTO @tbl VALUES ('Al Qasim'            ,	     'Buraydah',	'QS',	'BR');
INSERT INTO @tbl VALUES ('Jizan'            ,	     'Ad-Dair',	'JZ',	'DI');
INSERT INTO @tbl VALUES ('Jizan'            ,	     'Damad',	'JZ',	'DM');
INSERT INTO @tbl VALUES ('Ash Sharqiyah'            ,	     'Ad-Dammam',	'SH',	'DA');
INSERT INTO @tbl VALUES ('Jizan'            ,	     'Al-Darb',	'JZ',	'DB');
INSERT INTO @tbl VALUES ('Al Jawf'            ,	     'Dawamat al-Jandal',	'JF',	'DJ');
INSERT INTO @tbl VALUES ('Ar Riyad'            ,	     'Ad-Diriyah',	'RI',	'DI');
INSERT INTO @tbl VALUES ('Tabuk'            ,	     'Duba',	'TB',	'DU');
INSERT INTO @tbl VALUES ('Ar Riyad'            ,	     'Duruma',	'RI',	'DR');
INSERT INTO @tbl VALUES ('Ar Riyad'            ,	     'Ad-Duwadimi',	'RI',	'DW');
INSERT INTO @tbl VALUES ('Jizan'            ,	     'Farasan',	'JZ',	'FA');
INSERT INTO @tbl VALUES ('Ar Riyad'            ,	     'Al-Ghat',	'RI',	'GH');
INSERT INTO @tbl VALUES ('Ha''il'            ,	     'Al-Ghazalah',	'HA',	'GH');
INSERT INTO @tbl VALUES ('Ash Sharqiyah'            ,	     'Hafar al-Batin',	'SH',	'HB');
INSERT INTO @tbl VALUES ('Ha''il'            ,	     'Ha''il',	'HA',	'HA');
INSERT INTO @tbl VALUES ('Tabuk'            ,	     'Haqil',	'TB',	'HA');
INSERT INTO @tbl VALUES ('Ar Riyad'            ,	     'Al-Hariq',	'RI',	'HA');
INSERT INTO @tbl VALUES ('Jizan'            ,	     'Al-Harth',	'JZ',	'HA');
INSERT INTO @tbl VALUES ('Ar Riyad'            ,	     'Hawtat Bani Tamim',	'RI',	'HB');
INSERT INTO @tbl VALUES ('Al Madinah'            ,	     'Al-Hinakiyah',	'MD',	'HI');
INSERT INTO @tbl VALUES ('Najran'            ,	     'Hubuna',	'NJ',	'HU');
INSERT INTO @tbl VALUES ('Ar Riyad'            ,	     'Huraymila',	'RI',	'HU');
INSERT INTO @tbl VALUES ('Jizan'            ,	     'Al-Idabi',	'JZ',	'ID');
INSERT INTO @tbl VALUES ('Makkah'            ,	     'Jiddah',	'MK',	'JI');
INSERT INTO @tbl VALUES ('Jizan'            ,	     'Jizan',	'JZ',	'JI');
INSERT INTO @tbl VALUES ('Ash Sharqiyah'            ,	     'Al-Jubayl',	'SH',	'JU');
INSERT INTO @tbl VALUES ('Makkah'            ,	     'Al-Jumum',	'MK',	'JU');
INSERT INTO @tbl VALUES ('Makkah'            ,	     'Al-Kamil',	'MK',	'KA');
INSERT INTO @tbl VALUES ('Ash Sharqiyah'            ,	     'Al-Khafji',	'SH',	'KF');
INSERT INTO @tbl VALUES ('`Asir'            ,	     'Khamis Mushayt',	'AS',	'KM');
INSERT INTO @tbl VALUES ('Ar Riyad'            ,	     'Al-Kharj',	'RI',	'KH');
INSERT INTO @tbl VALUES ('Najran'            ,	     'Al-Kharkhir',	'NJ',	'KK');
INSERT INTO @tbl VALUES ('Al Madinah'            ,	     'Khaybar',	'MD',	'KH');
INSERT INTO @tbl VALUES ('Ash Sharqiyah'            ,	     'Al-Khubar',	'SH',	'KB');
INSERT INTO @tbl VALUES ('Najran'            ,	     'Khubash',	'NJ',	'KB');
INSERT INTO @tbl VALUES ('Makkah'            ,	     'Khulays',	'MK',	'KL');
INSERT INTO @tbl VALUES ('Makkah'            ,	     'Al-Khurmah',	'MK',	'KR');
INSERT INTO @tbl VALUES ('Makkah'            ,	     'Al-Lith',	'MK',	'LI');
INSERT INTO @tbl VALUES ('Al Madinah'            ,	     'Al-Madinah',	'MD',	'MD');
INSERT INTO @tbl VALUES ('Al Madinah'            ,	     'Al-Mahd',	'MD',	'MH');
INSERT INTO @tbl VALUES ('`Asir'            ,	     'Al-Majardah',	'AS',	'MA');
INSERT INTO @tbl VALUES ('Ar Riyad'            ,	     'Al-Majmaah',	'RI',	'MA');
INSERT INTO @tbl VALUES ('Makkah'            ,	     'Makka',	'MK',	'MA');
INSERT INTO @tbl VALUES ('Al Bahah'            ,	     'Al-Mandaq',	'BA',	'MA');
INSERT INTO @tbl VALUES ('Al Qasim'            ,	     'Al-Midhnab',	'QS',	'MI');
INSERT INTO @tbl VALUES ('`Asir'            ,	     'Muhayil',	'AS',	'MU');
INSERT INTO @tbl VALUES ('Al Bahah'            ,	     'Al-Mukhwah',	'BA',	'MU');
INSERT INTO @tbl VALUES ('Ar Riyad'            ,	     'Al-Muzahimiya',	'RI',	'MU');
INSERT INTO @tbl VALUES ('Al Qasim'            ,	     'An-Nabhaniyah',	'QS',	'NA');
INSERT INTO @tbl VALUES ('Najran'            ,	     'Najran',	'NJ',	'NA');
INSERT INTO @tbl VALUES ('`Asir'            ,	     'An-Namas',	'AS',	'NA');
INSERT INTO @tbl VALUES ('Ash Sharqiyah'            ,	     'Al-Nuayriyah',	'SH',	'NU');
INSERT INTO @tbl VALUES ('Al Bahah'            ,	     'Al-Qari',	'BA',	'QA');
INSERT INTO @tbl VALUES ('Ash Sharqiyah'            ,	     'Qaryah al-Ulya',	'SH',	'QU');
INSERT INTO @tbl VALUES ('Ash Sharqiyah'            ,	     'Al-Qatif',	'SH',	'QA');
INSERT INTO @tbl VALUES ('Al Bahah'            ,	     'Qilwah',	'BA',	'QI');
INSERT INTO @tbl VALUES ('Makkah'            ,	     'Al-Qunfidhah',	'MK',	'QU');
INSERT INTO @tbl VALUES ('Al Jawf'            ,	     'Al-Qurayyat',	'JF',	'QU');
INSERT INTO @tbl VALUES ('Ar Riyad'            ,	     'Al-Quwayiyah',	'RI',	'QU');
INSERT INTO @tbl VALUES ('Makkah'            ,	     'Rabigh',	'MK',	'RB');
INSERT INTO @tbl VALUES ('Al Hudud ash Shamaliyah'            ,	     'Rafha',	'HS',	'RA');
INSERT INTO @tbl VALUES ('Makkah'            ,	     'Ranyah',	'MK',	'RN');
INSERT INTO @tbl VALUES ('Al Qasim'            ,	     'Ar-Rass',	'QS',	'RA');
INSERT INTO @tbl VALUES ('Ash Sharqiyah'            ,	     'Ras Tannurah',	'SH',	'RT');
INSERT INTO @tbl VALUES ('Jizan'            ,	     'Ar-Rayth',	'JZ',	'RA');
INSERT INTO @tbl VALUES ('`Asir'            ,	     'Rijal alma',	'AS',	'RA');
INSERT INTO @tbl VALUES ('Ar Riyad'            ,	     'Ar-Riyad',	'RI',	'RI');
INSERT INTO @tbl VALUES ('Al Qasim'            ,	     'Riyadh al-Khabra',	'QS',	'RK');
INSERT INTO @tbl VALUES ('Ar Riyad'            ,	     'Rumah',	'RI',	'RU');
INSERT INTO @tbl VALUES ('Jizan'            ,	     'Sabya',	'JZ',	'SB');
INSERT INTO @tbl VALUES ('Al Jawf'            ,	     'Sakaka',	'JF',	'SA');
INSERT INTO @tbl VALUES ('Jizan'            ,	     'Samtah',	'JZ',	'SM');
INSERT INTO @tbl VALUES ('`Asir'            ,	     'Sarat Abidah',	'AS',	'SA');
INSERT INTO @tbl VALUES ('Ar Riyad'            ,	     'Shaqra',	'RI',	'SH');
INSERT INTO @tbl VALUES ('Najran'            ,	     'Sharurah',	'NJ',	'SH');
INSERT INTO @tbl VALUES ('Al Qasim'            ,	     'Ash-Shimasiyah',	'QS',	'SH');
INSERT INTO @tbl VALUES ('Ha''il'            ,	     'As-Shinan',	'HA',	'SH');
INSERT INTO @tbl VALUES ('Ar Riyad'            ,	     'As-Sulayyil',	'RI',	'SU');
INSERT INTO @tbl VALUES ('Tabuk'            ,	     'Tabuk',	'TB',	'TB');
INSERT INTO @tbl VALUES ('Makkah'            ,	     'Al-Taif',	'MK',	'TA');
INSERT INTO @tbl VALUES ('`Asir'            ,	     'Tathlith',	'AS',	'TA');
INSERT INTO @tbl VALUES ('Tabuk'            ,	     'Tayma',	'TB',	'TY');
INSERT INTO @tbl VALUES ('Ar Riyad'            ,	     'Thadiq',	'RI',	'TH');
INSERT INTO @tbl VALUES ('Najran'            ,	     'Thar',	'NJ',	'TH');
INSERT INTO @tbl VALUES ('Al Hudud ash Shamaliyah'            ,	     'Turayf',	'HS',	'TU');
INSERT INTO @tbl VALUES ('Makkah'            ,	     'Turubah',	'MK',	'TU');
INSERT INTO @tbl VALUES ('Tabuk'            ,	     'Umluj',	'TB',	'UM');
INSERT INTO @tbl VALUES ('Al Qasim'            ,	     'Unayzah',	'QS',	'UN');
INSERT INTO @tbl VALUES ('Al Qasim'            ,	     'Uyun al-Jiwa',	'QS',	'UJ');
INSERT INTO @tbl VALUES ('Ar Riyad'            ,	     'Wadi ad-Dwasir',	'RI',	'WD');
INSERT INTO @tbl VALUES ('Tabuk'            ,	     'Al-Wajh',	'TB',	'WA');
INSERT INTO @tbl VALUES ('Najran'            ,	     'Yadamah',	'NJ',	'YA');
INSERT INTO @tbl VALUES ('Al Madinah'            ,	     'Yanbu al-Bahr',	'MD',	'YB');
INSERT INTO @tbl VALUES ('`Asir'            ,	     'Zahran al-Janub',	'AS',	'ZJ');
INSERT INTO @tbl VALUES ('Ar Riyad'            ,	     'Az-Zulfi',	'RI',	'ZU');

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

