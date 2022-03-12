
/* ==================================================================================
    	Source File		:	setup_yemen_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Yemen are set-up
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
WHERE	country_nm	=	'Yemen';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Yemen not found', 16, 1);
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

INSERT INTO @tbl VALUES ('Hajjah'            ,	     'Abs',	'HJ',	'AB');
INSERT INTO @tbl VALUES ('Al Hudaydah'            ,	     'Ad Dahi',	'HU',	'DA');
INSERT INTO @tbl VALUES ('Al Dali'''            ,	     'Ad Dhale''e',	'DL',	'DH');
INSERT INTO @tbl VALUES ('Hadramawt'            ,	     'Ad Dis',	'HD',	'DI');
INSERT INTO @tbl VALUES ('Al Hudaydah'            ,	     'Ad Durayhimi',	'HU',	'DU');
INSERT INTO @tbl VALUES ('Hadramawt'            ,	     'Adh Dhlia''ah',	'HD',	'DH');
INSERT INTO @tbl VALUES ('Hajjah'            ,	     'Aflah Al Yaman',	'HJ',	'AY');
INSERT INTO @tbl VALUES ('Hajjah'            ,	     'Aflah Ash Shawm',	'HJ',	'AS');
INSERT INTO @tbl VALUES ('Abyan'            ,	     'Ahwar',	'AB',	'AH');
INSERT INTO @tbl VALUES ('Shabwah'            ,	     'Ain',	'SH',	'AI');
INSERT INTO @tbl VALUES ('Ma''rib'            ,	     'Al Abdiyah',	'MA',	'AB');
INSERT INTO @tbl VALUES ('Hadramawt'            ,	     'Al Abr',	'HD',	'AB');
INSERT INTO @tbl VALUES ('Al Bayda'''            ,	     'Al A''rsh',	'BA',	'AR');
INSERT INTO @tbl VALUES ('Amran'            ,	     'Al Ashah',	'AM',	'AS');
INSERT INTO @tbl VALUES ('Al Dali'''            ,	     'Al Azariq',	'DL',	'AZ');
INSERT INTO @tbl VALUES ('Al Bayda'''            ,	     'Al Bayda',	'BA',	'BA');
INSERT INTO @tbl VALUES ('Al Bayda'''            ,	     'Al Bayda City',	'BA',	'BC');
INSERT INTO @tbl VALUES ('`Adan'            ,	     'Al Buraiqeh',	'AD',	'BU');
INSERT INTO @tbl VALUES ('Sa`dah'            ,	     'Al Dhaher',	'SD',	'DH');
INSERT INTO @tbl VALUES ('Ibb'            ,	     'Al Dhihar',	'IB',	'DH');
INSERT INTO @tbl VALUES ('Al Hudaydah'            ,	     'Al Garrahi',	'HU',	'GA');
INSERT INTO @tbl VALUES ('Al Mahrah'            ,	     'Al Ghaydah',	'MR',	'GH');
INSERT INTO @tbl VALUES ('Al Jawf'            ,	     'Al Ghayl',	'JA',	'GH');
INSERT INTO @tbl VALUES ('Lahij'            ,	     'Al Had',	'LA',	'HD');
INSERT INTO @tbl VALUES ('Dhamar'            ,	     'Al Hada',	'DH',	'HA');
INSERT INTO @tbl VALUES ('Al Hudaydah'            ,	     'Al Hajjaylah',	'HU',	'HJ');
INSERT INTO @tbl VALUES ('Al Hudaydah'            ,	     'Al Hali',	'HU',	'HL');
INSERT INTO @tbl VALUES ('Sa`dah'            ,	     'Al Hashwah',	'SD',	'HW');
INSERT INTO @tbl VALUES ('Al Hudaydah'            ,	     'Al Hawak',	'HU',	'HW');
INSERT INTO @tbl VALUES ('Lahij'            ,	     'Al Hawtah',	'LA',	'HT');
INSERT INTO @tbl VALUES ('San`a'''            ,	     'Al Haymah Ad Dakhiliyah',	'NA',	'HD');
INSERT INTO @tbl VALUES ('San`a'''            ,	     'Al Haymah Al Kharijiyah',	'NA',	'HK');
INSERT INTO @tbl VALUES ('Al Jawf'            ,	     'Al Hazm',	'JA',	'HA');
INSERT INTO @tbl VALUES ('Al Jawf'            ,	     'Al Humaydat',	'JA',	'HU');
INSERT INTO @tbl VALUES ('Al Dali'''            ,	     'Al Husha',	'DL',	'HU');
INSERT INTO @tbl VALUES ('San`a'''            ,	     'Al Husn',	'NA',	'HU');
INSERT INTO @tbl VALUES ('Al Dali'''            ,	     'Al Hussein',	'DL',	'HN');
INSERT INTO @tbl VALUES ('Raymah'            ,	     'Al Jabin',	'RM',	'JB');
INSERT INTO @tbl VALUES ('Raymah'            ,	     'Al Jafariyah',	'RM',	'JF');
INSERT INTO @tbl VALUES ('Hajjah'            ,	     'Al Jamimah',	'HJ',	'JA');
INSERT INTO @tbl VALUES ('Ma''rib'            ,	     'Al Jubah',	'MA',	'JU');
INSERT INTO @tbl VALUES ('Al Mahwit'            ,	     'Al Khabt',	'MW',	'KH');
INSERT INTO @tbl VALUES ('Al Jawf'            ,	     'Al Khalq',	'JA',	'KH');
INSERT INTO @tbl VALUES ('Al Hudaydah'            ,	     'Al Khawkhah',	'HU',	'KH');
INSERT INTO @tbl VALUES ('Al Hudaydah'            ,	     'Alluheyah',	'HU',	'AL');
INSERT INTO @tbl VALUES ('Ta`izz'            ,	     'Al Ma''afer',	'TA',	'MF');
INSERT INTO @tbl VALUES ('Amran'            ,	     'Al Madan',	'AM',	'MD');
INSERT INTO @tbl VALUES ('Lahij'            ,	     'Al Madaribah Wa Al Arah',	'LA',	'MA');
INSERT INTO @tbl VALUES ('Lahij'            ,	     'Al Maflahy',	'LA',	'MF');
INSERT INTO @tbl VALUES ('Hajjah'            ,	     'Al Maghrabah',	'HJ',	'MG');
INSERT INTO @tbl VALUES ('Hajjah'            ,	     'Al Mahabishah',	'HJ',	'MH');
INSERT INTO @tbl VALUES ('Abyan'            ,	     'Al Mahfad',	'AB',	'MA');
INSERT INTO @tbl VALUES ('Al Mahwit'            ,	     'Al Mahwait',	'MW',	'MA');
INSERT INTO @tbl VALUES ('Al Mahwit'            ,	     'Al Mahwait City',	'MW',	'MC');
INSERT INTO @tbl VALUES ('Ibb'            ,	     'Al Makhadir',	'IB',	'MK');
INSERT INTO @tbl VALUES ('Al Bayda'''            ,	     'Al Malagim',	'BA',	'ML');
INSERT INTO @tbl VALUES ('Dhamar'            ,	     'Al Manar',	'DH',	'MN');
INSERT INTO @tbl VALUES ('`Adan'            ,	     'Al Mansura',	'AD',	'MA');
INSERT INTO @tbl VALUES ('Al Hudaydah'            ,	     'Al Mansuriyah',	'HU',	'MS');
INSERT INTO @tbl VALUES ('Lahij'            ,	     'Al Maqatirah',	'LA',	'MQ');
INSERT INTO @tbl VALUES ('Al Hudaydah'            ,	     'Al Marawi''ah',	'HU',	'MR');
INSERT INTO @tbl VALUES ('Ibb'            ,	     'Al Mashannah',	'IB',	'MN');
INSERT INTO @tbl VALUES ('Al Mahrah'            ,	     'Al Masilah',	'MR',	'MS');
INSERT INTO @tbl VALUES ('Al Jawf'            ,	     'Al Maslub',	'JA',	'MS');
INSERT INTO @tbl VALUES ('Al Jawf'            ,	     'Al Matammah',	'JA',	'MM');
INSERT INTO @tbl VALUES ('Al Jawf'            ,	     'Al Maton',	'JA',	'MN');
INSERT INTO @tbl VALUES ('Ta`izz'            ,	     'Al Mawasit',	'TA',	'MT');
INSERT INTO @tbl VALUES ('Hajjah'            ,	     'Al Miftah',	'HJ',	'MF');
INSERT INTO @tbl VALUES ('Al Hudaydah'            ,	     'Al Mighlaf',	'HU',	'MG');
INSERT INTO @tbl VALUES ('Lahij'            ,	     'Al Milah',	'LA',	'MI');
INSERT INTO @tbl VALUES ('Al Hudaydah'            ,	     'Al Mina',	'HU',	'MI');
INSERT INTO @tbl VALUES ('Ta`izz'            ,	     'Al Misrakh',	'TA',	'MI');
INSERT INTO @tbl VALUES ('`Adan'            ,	     'Al Mualla',	'AD',	'MU');
INSERT INTO @tbl VALUES ('Ta`izz'            ,	     'Al Mudhaffar',	'TA',	'MU');
INSERT INTO @tbl VALUES ('Hadramawt'            ,	     'Al Mukalla',	'HD',	'MU');
INSERT INTO @tbl VALUES ('Hadramawt'            ,	     'Al Mukalla City',	'HD',	'MC');
INSERT INTO @tbl VALUES ('Ta`izz'            ,	     'Al Mukha',	'TA',	'MK');
INSERT INTO @tbl VALUES ('Al Hudaydah'            ,	     'Al Munirah',	'HU',	'MU');
INSERT INTO @tbl VALUES ('Lahij'            ,	     'Al Musaymir',	'LA',	'MU');
INSERT INTO @tbl VALUES ('Lahij'            ,	     'Al Qabbaytah',	'LA',	'QA');
INSERT INTO @tbl VALUES ('Hadramawt'            ,	     'Al Qaf',	'HD',	'QF');
INSERT INTO @tbl VALUES ('Amran'            ,	     'Al Qaflah',	'AM',	'QA');
INSERT INTO @tbl VALUES ('Ibb'            ,	     'Al Qafr',	'IB',	'QA');
INSERT INTO @tbl VALUES ('Ta`izz'            ,	     'Al Qahirah',	'TA',	'QA');
INSERT INTO @tbl VALUES ('Al Hudaydah'            ,	     'Al Qanawis',	'HU',	'QA');
INSERT INTO @tbl VALUES ('Hadramawt'            ,	     'Al Qatn',	'HD',	'QT');
INSERT INTO @tbl VALUES ('Al Bayda'''            ,	     'Al Quraishyah',	'BA',	'QU');
INSERT INTO @tbl VALUES ('Shabwah'            ,	     'Al Talh',	'SH',	'TA');
INSERT INTO @tbl VALUES ('Ibb'            ,	     'Al Udayn',	'IB',	'UD');
INSERT INTO @tbl VALUES ('Abyan'            ,	     'Al Wade''a',	'AB',	'WA');
INSERT INTO @tbl VALUES ('San`a'' [City]'            ,	     'Al Wahdah',	'SA',	'WA');
INSERT INTO @tbl VALUES ('Ta`izz'            ,	     'Al Wazi''iyah',	'TA',	'WA');
INSERT INTO @tbl VALUES ('Hadramawt'            ,	     'Amd',	'HD',	'AM');
INSERT INTO @tbl VALUES ('Amran'            ,	     'Amran',	'AM',	'AM');
INSERT INTO @tbl VALUES ('Ibb'            ,	     'An Nadirah',	'IB',	'NA');
INSERT INTO @tbl VALUES ('Dhamar'            ,	     'Anss',	'DH',	'AN');
INSERT INTO @tbl VALUES ('San`a'''            ,	     'Arhab',	'NA',	'AR');
INSERT INTO @tbl VALUES ('Shabwah'            ,	     'Arma',	'SH',	'AR');
INSERT INTO @tbl VALUES ('Ibb'            ,	     'Ar Radmah',	'IB',	'RA');
INSERT INTO @tbl VALUES ('Shabwah'            ,	     'Ar Rawdah',	'SH',	'RA');
INSERT INTO @tbl VALUES ('Hadramawt'            ,	     'Ar Raydah Wa Qusayar',	'HD',	'RQ');
INSERT INTO @tbl VALUES ('Al Mahwit'            ,	     'Ar Rujum',	'MW',	'RU');
INSERT INTO @tbl VALUES ('Al Bayda'''            ,	     'Ar Ryashyyah',	'BA',	'RY');
INSERT INTO @tbl VALUES ('Hajjah'            ,	     'Ash Shaghadirah',	'HJ',	'SG');
INSERT INTO @tbl VALUES ('Hajjah'            ,	     'Ash Shahil',	'HJ',	'SH');
INSERT INTO @tbl VALUES ('`Adan'            ,	     'Ash Shaikh Outhman',	'AD',	'SO');
INSERT INTO @tbl VALUES ('Ibb'            ,	     'Ash Sha''ir',	'IB',	'SH');
INSERT INTO @tbl VALUES ('Ta`izz'            ,	     'Ash Shamayatayn',	'TA',	'SH');
INSERT INTO @tbl VALUES ('Al Bayda'''            ,	     'Ash Sharyah',	'BA',	'SH');
INSERT INTO @tbl VALUES ('Hadramawt'            ,	     'Ash Shihr',	'HD',	'SH');
INSERT INTO @tbl VALUES ('Al Dali'''            ,	     'Ash Shu''ayb',	'DL',	'SH');
INSERT INTO @tbl VALUES ('Hajjah'            ,	     'Aslem',	'HJ',	'AL');
INSERT INTO @tbl VALUES ('San`a'' [City]'            ,	     'As Sabain',	'SA',	'SA');
INSERT INTO @tbl VALUES ('Ibb'            ,	     'As Sabrah',	'IB',	'SB');
INSERT INTO @tbl VALUES ('Ibb'            ,	     'As Saddah',	'IB',	'SD');
INSERT INTO @tbl VALUES ('San`a'' [City]'            ,	     'Assafi''yah',	'SA',	'AS');
INSERT INTO @tbl VALUES ('Sa`dah'            ,	     'As Safra',	'SD',	'SF');
INSERT INTO @tbl VALUES ('Shabwah'            ,	     'As Said',	'SH',	'SA');
INSERT INTO @tbl VALUES ('Raymah'            ,	     'As Salafiyah',	'RM',	'SA');
INSERT INTO @tbl VALUES ('Al Hudaydah'            ,	     'As Salif',	'HU',	'SA');
INSERT INTO @tbl VALUES ('Al Bayda'''            ,	     'As Sawadiyah',	'BA',	'SD');
INSERT INTO @tbl VALUES ('Amran'            ,	     'As Sawd',	'AM',	'SA');
INSERT INTO @tbl VALUES ('Hadramawt'            ,	     'As Sawm',	'HD',	'SM');
INSERT INTO @tbl VALUES ('Al Bayda'''            ,	     'As Sawma''ah',	'BA',	'SM');
INSERT INTO @tbl VALUES ('Ibb'            ,	     'As Sayyani',	'IB',	'SY');
INSERT INTO @tbl VALUES ('Ta`izz'            ,	     'As Silw',	'TA',	'SI');
INSERT INTO @tbl VALUES ('Amran'            ,	     'As Sudah',	'AM',	'SU');
INSERT INTO @tbl VALUES ('Al Hudaydah'            ,	     'As Sukhnah',	'HU',	'SU');
INSERT INTO @tbl VALUES ('Shabwah'            ,	     'Ataq',	'SH',	'AT');
INSERT INTO @tbl VALUES ('San`a'' [City]'            ,	     'Ath''thaorah',	'SA',	'AT');
INSERT INTO @tbl VALUES ('Al Bayda'''            ,	     'At Taffah',	'BA',	'TA');
INSERT INTO @tbl VALUES ('San`a'' [City]'            ,	     'At Tahrir',	'SA',	'TA');
INSERT INTO @tbl VALUES ('Ta`izz'            ,	     'At Ta''iziyah',	'TA',	'TA');
INSERT INTO @tbl VALUES ('`Adan'            ,	     'Attawahi',	'AD',	'AT');
INSERT INTO @tbl VALUES ('Al Mahwit'            ,	     'At Tawilah',	'MW',	'TA');
INSERT INTO @tbl VALUES ('Al Hudaydah'            ,	     'At Tuhayat',	'HU',	'TU');
INSERT INTO @tbl VALUES ('San`a'''            ,	     'Attyal',	'NA',	'AT');
INSERT INTO @tbl VALUES ('Al Bayda'''            ,	     'Az Zahir',	'BA',	'ZA');
INSERT INTO @tbl VALUES ('Al Jawf'            ,	     'Az Zahir',	'JA',	'ZA');
INSERT INTO @tbl VALUES ('San`a'' [City]'            ,	     'Az''zal',	'SA',	'AZ');
INSERT INTO @tbl VALUES ('Al Hudaydah'            ,	     'Az Zaydiyah',	'HU',	'ZD');
INSERT INTO @tbl VALUES ('Al Hudaydah'            ,	     'Az Zuhrah',	'HU',	'ZU');
INSERT INTO @tbl VALUES ('Ibb'            ,	     'Ba''dan',	'IB',	'BA');
INSERT INTO @tbl VALUES ('Al Hudaydah'            ,	     'Bajil',	'HU',	'BA');
INSERT INTO @tbl VALUES ('Hajjah'            ,	     'Bakil Al Mir',	'HJ',	'BM');
INSERT INTO @tbl VALUES ('Hajjah'            ,	     'Bani Al Awam',	'HJ',	'BA');
INSERT INTO @tbl VALUES ('San`a'' [City]'            ,	     'Bani Al Harith',	'SA',	'BH');
INSERT INTO @tbl VALUES ('San`a'''            ,	     'Bani Dhabyan',	'NA',	'BD');
INSERT INTO @tbl VALUES ('San`a'''            ,	     'Bani Hushaysh',	'NA',	'BH');
INSERT INTO @tbl VALUES ('San`a'''            ,	     'Bani Matar',	'NA',	'BM');
INSERT INTO @tbl VALUES ('Hajjah'            ,	     'Bani Qa''is',	'HJ',	'BQ');
INSERT INTO @tbl VALUES ('Al Mahwit'            ,	     'Bani Sa''d',	'MW',	'BS');
INSERT INTO @tbl VALUES ('Amran'            ,	     'Bani Suraim',	'AM',	'BS');
INSERT INTO @tbl VALUES ('Sa`dah'            ,	     'Baqim',	'SD',	'BA');
INSERT INTO @tbl VALUES ('Al Jawf'            ,	     'Bart Al Anan',	'JA',	'BA');
INSERT INTO @tbl VALUES ('Shabwah'            ,	     'Bayhan',	'SH',	'BA');
INSERT INTO @tbl VALUES ('Al Hudaydah'            ,	     'Bayt Al Faqiah',	'HU',	'BF');
INSERT INTO @tbl VALUES ('Ma''rib'            ,	     'Bidbadah',	'MA',	'BI');
INSERT INTO @tbl VALUES ('San`a'''            ,	     'Bilad Ar Rus',	'NA',	'BR');
INSERT INTO @tbl VALUES ('Raymah'            ,	     'Bilad At Ta''am',	'RM',	'BA');
INSERT INTO @tbl VALUES ('Hadramawt'            ,	     'Brom Mayfa',	'HD',	'BM');
INSERT INTO @tbl VALUES ('Al Hudaydah'            ,	     'Bura',	'HU',	'BU');
INSERT INTO @tbl VALUES ('`Adan'            ,	     'Craiter',	'AD',	'CR');
INSERT INTO @tbl VALUES ('Al Dali'''            ,	     'Damt',	'DL',	'DA');
INSERT INTO @tbl VALUES ('`Adan'            ,	     'Dar Sad',	'AD',	'DS');
INSERT INTO @tbl VALUES ('Hadramawt'            ,	     'Daw''an',	'HD',	'DA');
INSERT INTO @tbl VALUES ('Dhamar'            ,	     'Dawran Aness',	'DH',	'DA');
INSERT INTO @tbl VALUES ('Dhamar'            ,	     'Dhamar City',	'DH',	'DH');
INSERT INTO @tbl VALUES ('Shabwah'            ,	     'Dhar',	'SH',	'DH');
INSERT INTO @tbl VALUES ('Ibb'            ,	     'Dhi As Sufal',	'IB',	'DS');
INSERT INTO @tbl VALUES ('Amran'            ,	     'Dhi Bin',	'AM',	'DB');
INSERT INTO @tbl VALUES ('Al Bayda'''            ,	     'Dhi Na''im',	'BA',	'DN');
INSERT INTO @tbl VALUES ('Ta`izz'            ,	     'Dhubab',	'TA',	'DH');
INSERT INTO @tbl VALUES ('Ta`izz'            ,	     'Dimnat Khadir',	'TA',	'DK');
INSERT INTO @tbl VALUES ('Ibb'            ,	     'Far Al Udayn',	'IB',	'FU');
INSERT INTO @tbl VALUES ('Sa`dah'            ,	     'Ghamr',	'SD',	'GH');
INSERT INTO @tbl VALUES ('Hadramawt'            ,	     'Ghayl Ba Wazir',	'HD',	'GW');
INSERT INTO @tbl VALUES ('Hadramawt'            ,	     'Ghayl Bin Yamin',	'HD',	'GY');
INSERT INTO @tbl VALUES ('Shabwah'            ,	     'Habban',	'SH',	'HN');
INSERT INTO @tbl VALUES ('Lahij'            ,	     'Habil Jabr',	'LA',	'HJ');
INSERT INTO @tbl VALUES ('Amran'            ,	     'Habur Zulaymah',	'AM',	'HZ');
INSERT INTO @tbl VALUES ('Hadramawt'            ,	     'Hagr As Sai''ar',	'HD',	'HS');
INSERT INTO @tbl VALUES ('Hajjah'            ,	     'Hajjah',	'HJ',	'HJ');
INSERT INTO @tbl VALUES ('Hajjah'            ,	     'Hajjah City',	'HJ',	'HC');
INSERT INTO @tbl VALUES ('Hadramawt'            ,	     'Hajr',	'HD',	'HA');
INSERT INTO @tbl VALUES ('Lahij'            ,	     'Halimayn',	'LA',	'HL');
INSERT INTO @tbl VALUES ('San`a'''            ,	     'Hamdan',	'NA',	'HA');
INSERT INTO @tbl VALUES ('Hajjah'            ,	     'Harad',	'HJ',	'HD');
INSERT INTO @tbl VALUES ('Amran'            ,	     'Harf Sufyan',	'AM',	'HS');
INSERT INTO @tbl VALUES ('Ma''rib'            ,	     'Harib',	'MA',	'HA');
INSERT INTO @tbl VALUES ('Ma''rib'            ,	     'Harib Al Qaramish',	'MA',	'HQ');
INSERT INTO @tbl VALUES ('Al Mahrah'            ,	     'Hat',	'MR',	'HT');
INSERT INTO @tbl VALUES ('Shabwah'            ,	     'Hatib',	'SH',	'HT');
INSERT INTO @tbl VALUES ('Al Mahrah'            ,	     'Hawf',	'MR',	'HF');
INSERT INTO @tbl VALUES ('Sa`dah'            ,	     'Haydan',	'SD',	'HD');
INSERT INTO @tbl VALUES ('Ta`izz'            ,	     'Hayfan',	'TA',	'HA');
INSERT INTO @tbl VALUES ('Hajjah'            ,	     'Hayran',	'HJ',	'HR');
INSERT INTO @tbl VALUES ('Al Hudaydah'            ,	     'Hays',	'HU',	'HS');
INSERT INTO @tbl VALUES ('Ibb'            ,	     'Hazm Al Udayn',	'IB',	'HU');
INSERT INTO @tbl VALUES ('Hadramawt'            ,	     'Hidaybu',	'HD',	'HI');
INSERT INTO @tbl VALUES ('Ibb'            ,	     'Hubaysh',	'IB',	'HB');
INSERT INTO @tbl VALUES ('Al Mahwit'            ,	     'Hufash',	'MW',	'HU');
INSERT INTO @tbl VALUES ('Hadramawt'            ,	     'Huraidhah',	'HD',	'HU');
INSERT INTO @tbl VALUES ('Al Mahrah'            ,	     'Huswain',	'MR',	'HU');
INSERT INTO @tbl VALUES ('Amran'            ,	     'Huth',	'AM',	'HU');
INSERT INTO @tbl VALUES ('Ibb'            ,	     'Ibb',	'IB',	'IB');
INSERT INTO @tbl VALUES ('Amran'            ,	     'Iyal Surayh',	'AM',	'IS');
INSERT INTO @tbl VALUES ('Dhamar'            ,	     'Jabal Ash Sharq',	'DH',	'JS');
INSERT INTO @tbl VALUES ('Ta`izz'            ,	     'Jabal Habashy',	'TA',	'JH');
INSERT INTO @tbl VALUES ('Amran'            ,	     'Jabal Iyal Yazid',	'AM',	'JI');
INSERT INTO @tbl VALUES ('Ma''rib'            ,	     'Jabal Murad',	'MA',	'JM');
INSERT INTO @tbl VALUES ('Al Hudaydah'            ,	     'Jabal Ra''s',	'HU',	'JR');
INSERT INTO @tbl VALUES ('Al Dali'''            ,	     'Jahaf',	'DL',	'JA');
INSERT INTO @tbl VALUES ('Dhamar'            ,	     'Jahran',	'DH',	'JA');
INSERT INTO @tbl VALUES ('Shabwah'            ,	     'Jardan',	'SH',	'JA');
INSERT INTO @tbl VALUES ('Abyan'            ,	     'Jayshan',	'AB',	'JA');
INSERT INTO @tbl VALUES ('Ibb'            ,	     'Jiblah',	'IB',	'JI');
INSERT INTO @tbl VALUES ('San`a'''            ,	     'Jihanah',	'NA',	'JI');
INSERT INTO @tbl VALUES ('Al Dali'''            ,	     'Juban',	'DL',	'JU');
INSERT INTO @tbl VALUES ('Al Hudaydah'            ,	     'Kamaran',	'HU',	'KA');
INSERT INTO @tbl VALUES ('Al Jawf'            ,	     'Khabb wa ash Sha''af',	'JA',	'KS');
INSERT INTO @tbl VALUES ('Amran'            ,	     'Khamir',	'AM',	'KM');
INSERT INTO @tbl VALUES ('Abyan'            ,	     'Khanfir',	'AB',	'KH');
INSERT INTO @tbl VALUES ('Al Jawf'            ,	     'Kharab Al Marashi',	'JA',	'KM');
INSERT INTO @tbl VALUES ('Amran'            ,	     'Kharif',	'AM',	'KF');
INSERT INTO @tbl VALUES ('Hajjah'            ,	     'Khayran Al Muharraq',	'HJ',	'KM');
INSERT INTO @tbl VALUES ('`Adan'            ,	     'Khur Maksar',	'AD',	'KM');
INSERT INTO @tbl VALUES ('San`a'''            ,	     'Khwlan',	'NA',	'KH');
INSERT INTO @tbl VALUES ('Sa`dah'            ,	     'Kitaf wa Al Boqe''e',	'SD',	'KB');
INSERT INTO @tbl VALUES ('Hajjah'            ,	     'Ku''aydinah',	'HJ',	'KD');
INSERT INTO @tbl VALUES ('Hajjah'            ,	     'Kuhlan Affar',	'HJ',	'KA');
INSERT INTO @tbl VALUES ('Hajjah'            ,	     'Kuhlan Ash Sharaf',	'HJ',	'KS');
INSERT INTO @tbl VALUES ('Hajjah'            ,	     'Kushar',	'HJ',	'KU');
INSERT INTO @tbl VALUES ('Raymah'            ,	     'Kusmah',	'RM',	'KU');
INSERT INTO @tbl VALUES ('Abyan'            ,	     'Lawdar',	'AB',	'LA');
INSERT INTO @tbl VALUES ('San`a'' [City]'            ,	     'Ma''ain',	'SA',	'MA');
INSERT INTO @tbl VALUES ('Hajjah'            ,	     'Mabyan',	'HJ',	'MB');
INSERT INTO @tbl VALUES ('Dhamar'            ,	     'Maghirib Ans',	'DH',	'MA');
INSERT INTO @tbl VALUES ('Ma''rib'            ,	     'Mahliyah',	'MA',	'ML');
INSERT INTO @tbl VALUES ('Sa`dah'            ,	     'Majz',	'SD',	'MA');
INSERT INTO @tbl VALUES ('Ma''rib'            ,	     'Majzar',	'MA',	'MJ');
INSERT INTO @tbl VALUES ('San`a'''            ,	     'Manakhah',	'NA',	'MA');
INSERT INTO @tbl VALUES ('Al Mahrah'            ,	     'Man''ar',	'MR',	'MN');
INSERT INTO @tbl VALUES ('Ta`izz'            ,	     'Maqbanah',	'TA',	'MQ');
INSERT INTO @tbl VALUES ('Ma''rib'            ,	     'Marib',	'MA',	'MB');
INSERT INTO @tbl VALUES ('Ma''rib'            ,	     'Marib City',	'MA',	'MC');
INSERT INTO @tbl VALUES ('Ta`izz'            ,	     'Mashra''a Wa Hadnan',	'TA',	'MH');
INSERT INTO @tbl VALUES ('Amran'            ,	     'Maswar',	'AM',	'MW');
INSERT INTO @tbl VALUES ('Al Bayda'''            ,	     'Maswarah',	'BA',	'MS');
INSERT INTO @tbl VALUES ('Ta`izz'            ,	     'Mawiyah',	'TA',	'MW');
INSERT INTO @tbl VALUES ('Ta`izz'            ,	     'Mawza',	'TA',	'MZ');
INSERT INTO @tbl VALUES ('Shabwah'            ,	     'Mayfa''a',	'SH',	'MA');
INSERT INTO @tbl VALUES ('Dhamar'            ,	     'Mayfa''at Anss',	'DH',	'MF');
INSERT INTO @tbl VALUES ('Raymah'            ,	     'Mazhar',	'RM',	'MA');
INSERT INTO @tbl VALUES ('Ma''rib'            ,	     'Medghal',	'MA',	'ME');
INSERT INTO @tbl VALUES ('Shabwah'            ,	     'Merkhah Al Ulya',	'SH',	'MU');
INSERT INTO @tbl VALUES ('Shabwah'            ,	     'Merkhah As Sufla',	'SH',	'MS');
INSERT INTO @tbl VALUES ('Hajjah'            ,	     'Midi',	'HJ',	'MD');
INSERT INTO @tbl VALUES ('Al Mahwit'            ,	     'Milhan',	'MW',	'MI');
INSERT INTO @tbl VALUES ('Sa`dah'            ,	     'Monabbih',	'SD',	'MO');
INSERT INTO @tbl VALUES ('Ibb'            ,	     'Mudhaykhirah',	'IB',	'MU');
INSERT INTO @tbl VALUES ('Abyan'            ,	     'Mudiyah',	'AB',	'MU');
INSERT INTO @tbl VALUES ('Al Bayda'''            ,	     'Mukayras',	'BA',	'MK');
INSERT INTO @tbl VALUES ('Hajjah'            ,	     'Mustaba',	'HJ',	'MU');
INSERT INTO @tbl VALUES ('Hajjah'            ,	     'Najrah',	'HJ',	'NA');
INSERT INTO @tbl VALUES ('Al Bayda'''            ,	     'Na''man',	'BA',	'NM');
INSERT INTO @tbl VALUES ('Al Bayda'''            ,	     'Nati''',	'BA',	'NT');
INSERT INTO @tbl VALUES ('San`a'''            ,	     'Nihm',	'NA',	'NI');
INSERT INTO @tbl VALUES ('Shabwah'            ,	     'Nisab',	'SH',	'NI');
INSERT INTO @tbl VALUES ('San`a'' [City]'            ,	     'Old City',	'SA',	'OC');
INSERT INTO @tbl VALUES ('Al Dali'''            ,	     'Qa''atabah',	'DL',	'QA');
INSERT INTO @tbl VALUES ('Hajjah'            ,	     'Qafl Shamer',	'HJ',	'QS');
INSERT INTO @tbl VALUES ('Hajjah'            ,	     'Qarah',	'HJ',	'QA');
INSERT INTO @tbl VALUES ('Sa`dah'            ,	     'Qatabir',	'SD',	'QA');
INSERT INTO @tbl VALUES ('Al Mahrah'            ,	     'Qishn',	'MR',	'QI');
INSERT INTO @tbl VALUES ('Hadramawt'            ,	     'Qulensya Wa Abd Al Kuri',	'HD',	'QK');
INSERT INTO @tbl VALUES ('Al Bayda'''            ,	     'Rada''',	'BA',	'RD');
INSERT INTO @tbl VALUES ('Lahij'            ,	     'Radfan',	'LA',	'RA');
INSERT INTO @tbl VALUES ('Al Bayda'''            ,	     'Radman Al Awad',	'BA',	'RA');
INSERT INTO @tbl VALUES ('Ma''rib'            ,	     'Raghwan',	'MA',	'RG');
INSERT INTO @tbl VALUES ('Ma''rib'            ,	     'Rahabah',	'MA',	'RB');
INSERT INTO @tbl VALUES ('Al Jawf'            ,	     'Rajuzah',	'JA',	'RA');
INSERT INTO @tbl VALUES ('Hadramawt'            ,	     'Rakhyah',	'HD',	'RA');
INSERT INTO @tbl VALUES ('Abyan'            ,	     'Rasad',	'AB',	'RA');
INSERT INTO @tbl VALUES ('Amran'            ,	     'Raydah',	'AM',	'RA');
INSERT INTO @tbl VALUES ('Sa`dah'            ,	     'Razih',	'SD',	'RA');
INSERT INTO @tbl VALUES ('Shabwah'            ,	     'Rudum',	'SH',	'RU');
INSERT INTO @tbl VALUES ('Hadramawt'            ,	     'Rumah',	'HD',	'RU');
INSERT INTO @tbl VALUES ('Sa`dah'            ,	     'Sa''adah',	'SD',	'SD');
INSERT INTO @tbl VALUES ('Al Bayda'''            ,	     'Sabah',	'BA',	'SB');
INSERT INTO @tbl VALUES ('Ta`izz'            ,	     'Sabir Al Mawadim',	'TA',	'SM');
INSERT INTO @tbl VALUES ('San`a'''            ,	     'Sa''fan',	'NA',	'SF');
INSERT INTO @tbl VALUES ('Hadramawt'            ,	     'Sah',	'HD',	'SA');
INSERT INTO @tbl VALUES ('Sa`dah'            ,	     'Sahar',	'SD',	'SR');
INSERT INTO @tbl VALUES ('Ta`izz'            ,	     'Salh',	'TA',	'SL');
INSERT INTO @tbl VALUES ('Ta`izz'            ,	     'Sama',	'TA',	'SA');
INSERT INTO @tbl VALUES ('San`a'''            ,	     'Sanhan',	'NA',	'SN');
INSERT INTO @tbl VALUES ('Sa`dah'            ,	     'Saqayn',	'SD',	'SQ');
INSERT INTO @tbl VALUES ('Abyan'            ,	     'Sarar',	'AB',	'SA');
INSERT INTO @tbl VALUES ('Al Mahrah'            ,	     'Sayhut',	'MR',	'SA');
INSERT INTO @tbl VALUES ('Hadramawt'            ,	     'Sayun',	'HD',	'SY');
INSERT INTO @tbl VALUES ('Sa`dah'            ,	     'Shada''a',	'SD',	'SH');
INSERT INTO @tbl VALUES ('Al Mahrah'            ,	     'Shahan',	'MR',	'SH');
INSERT INTO @tbl VALUES ('Amran'            ,	     'Shaharah',	'AM',	'SH');
INSERT INTO @tbl VALUES ('Ta`izz'            ,	     'Shara''b Ar Rawnah',	'TA',	'SR');
INSERT INTO @tbl VALUES ('Ta`izz'            ,	     'Shara''b As Salam',	'TA',	'SS');
INSERT INTO @tbl VALUES ('Hajjah'            ,	     'Sharas',	'HJ',	'SR');
INSERT INTO @tbl VALUES ('Hadramawt'            ,	     'Shibam',	'HD',	'SB');
INSERT INTO @tbl VALUES ('Al Mahwit'            ,	     'Shibam Kawkaban',	'MW',	'SK');
INSERT INTO @tbl VALUES ('San`a'' [City]'            ,	     'Shu''aub',	'SA',	'SH');
INSERT INTO @tbl VALUES ('Abyan'            ,	     'Sibah',	'AB',	'SI');
INSERT INTO @tbl VALUES ('Ma''rib'            ,	     'Sirwah',	'MA',	'SI');
INSERT INTO @tbl VALUES ('Amran'            ,	     'Suwayr',	'AM',	'SR');
INSERT INTO @tbl VALUES ('Hadramawt'            ,	     'Tarim',	'HD',	'TA');
INSERT INTO @tbl VALUES ('Hadramawt'            ,	     'Thamud',	'HD',	'TH');
INSERT INTO @tbl VALUES ('Amran'            ,	     'Thula',	'AM',	'TH');
INSERT INTO @tbl VALUES ('Lahij'            ,	     'Tuban',	'LA',	'TU');
INSERT INTO @tbl VALUES ('Lahij'            ,	     'Tur Al Bahah',	'LA',	'TB');
INSERT INTO @tbl VALUES ('Shabwah'            ,	     'Usaylan',	'SH',	'US');
INSERT INTO @tbl VALUES ('Dhamar'            ,	     'Utmah',	'DH',	'UT');
INSERT INTO @tbl VALUES ('Hajjah'            ,	     'Wadhrah',	'HJ',	'WD');
INSERT INTO @tbl VALUES ('Hadramawt'            ,	     'Wadi Al Ayn',	'HD',	'WA');
INSERT INTO @tbl VALUES ('Al Bayda'''            ,	     'Wald Rabi''',	'BA',	'WR');
INSERT INTO @tbl VALUES ('Hajjah'            ,	     'Washhah',	'HJ',	'WH');
INSERT INTO @tbl VALUES ('Dhamar'            ,	     'Wusab Al Ali',	'DH',	'WA');
INSERT INTO @tbl VALUES ('Dhamar'            ,	     'Wusab As Safil',	'DH',	'WS');
INSERT INTO @tbl VALUES ('Hadramawt'            ,	     'Yabuth',	'HD',	'YA');
INSERT INTO @tbl VALUES ('Lahij'            ,	     'Yafa''a',	'LA',	'YF');
INSERT INTO @tbl VALUES ('Lahij'            ,	     'Yahr',	'LA',	'YR');
INSERT INTO @tbl VALUES ('Ibb'            ,	     'Yarim',	'IB',	'YA');
INSERT INTO @tbl VALUES ('Al Hudaydah'            ,	     'Zabid',	'HU',	'ZB');
INSERT INTO @tbl VALUES ('Hadramawt'            ,	     'Zamakh wa Manwakh',	'HD',	'ZM');
INSERT INTO @tbl VALUES ('Abyan'            ,	     'Zingibar',	'AB',	'ZI');

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

