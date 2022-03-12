
/* ==================================================================================
    	Source File		:	setup_bhutan_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	09-10-2014
	Module ID		:	CDB
	Last updated		:	09-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Bhutan are set-up
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
WHERE	country_nm	=	'Bhutan';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Bhutan not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'District',
		level_2_address_component	=	'Subdistrict',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_nm));

INSERT INTO @tbl VALUES ('Wangdi Phodrang'            ,	     'Athang',	'WP',	'AT');
INSERT INTO @tbl VALUES ('Lhuntshi'            ,	     'Autsho',	'LH',	'AU');
INSERT INTO @tbl VALUES ('Mongar'            ,	     'Balam',	'MO',	'BL');
INSERT INTO @tbl VALUES ('Samchi'            ,	     'Bara',	'SM',	'BA');
INSERT INTO @tbl VALUES ('Shemgang'            ,	     'Bardo',	'SG',	'BD');
INSERT INTO @tbl VALUES ('Thimphu'            ,	     'Barp',	'TM',	'BP');
INSERT INTO @tbl VALUES ('Chirang'            ,	     'Barshong',	'CR',	'BR');
INSERT INTO @tbl VALUES ('Tashigang'            ,	     'Bartsam',	'TA',	'BS');
INSERT INTO @tbl VALUES ('Bumthang'            ,	     'Batbalathang',	'BU',	'BB');
INSERT INTO @tbl VALUES ('Chirang'            ,	     'Beteni',	'CR',	'BT');
INSERT INTO @tbl VALUES ('Chhukha'            ,	     'Bhalujhora',	'CK',	'BL');
INSERT INTO @tbl VALUES ('Geylegphug'            ,	     'Bhur',	'GE',	'BH');
INSERT INTO @tbl VALUES ('Tashigang'            ,	     'Bidung',	'TA',	'BD');
INSERT INTO @tbl VALUES ('Samchi'            ,	     'Biru',	'SM',	'BI');
INSERT INTO @tbl VALUES ('Chhukha'            ,	     'Bjachho',	'CK',	'BC');
INSERT INTO @tbl VALUES ('Ha'            ,	     'Bjee',	'HA',	'BJ');
INSERT INTO @tbl VALUES ('Wangdi Phodrang'            ,	     'Bjena',	'WP',	'BJ');
INSERT INTO @tbl VALUES ('Shemgang'            ,	     'Bjoka',	'SG',	'BJ');
INSERT INTO @tbl VALUES ('Paro'            ,	     'Bondey',	'PR',	'BD');
INSERT INTO @tbl VALUES ('Chhukha'            ,	     'Bongo',	'CK',	'BO');
INSERT INTO @tbl VALUES ('Tashi Yangtse'            ,	     'Bumdeling',	'TY',	'BD');
INSERT INTO @tbl VALUES ('Mongar'            ,	     'Chali',	'MO',	'CL');
INSERT INTO @tbl VALUES ('Bumthang'            ,	     'Chamkhar',	'BU',	'CM');
INSERT INTO @tbl VALUES ('Thimphu'            ,	     'Chang',	'TM',	'CH');
INSERT INTO @tbl VALUES ('Chhukha'            ,	     'Chapcha',	'CK',	'CP');
INSERT INTO @tbl VALUES ('Samchi'            ,	     'Charghary',	'SM',	'CR');
INSERT INTO @tbl VALUES ('Mongar'            ,	     'Chaskhar',	'MO',	'CK');
INSERT INTO @tbl VALUES ('Samchi'            ,	     'Chengmari',	'SM',	'CM');
INSERT INTO @tbl VALUES ('Bumthang'            ,	     'Chhoekor',	'BU',	'CK');
INSERT INTO @tbl VALUES ('Chhukha'            ,	     'Chhukha',	'CK',	'CK');
INSERT INTO @tbl VALUES ('Pemagatsel'            ,	     'Chimong',	'PM',	'CM');
INSERT INTO @tbl VALUES ('Pemagatsel'            ,	     'Chongshing',	'PM',	'CS');
INSERT INTO @tbl VALUES ('Punakha'            ,	     'Chuba',	'PN',	'CH');
INSERT INTO @tbl VALUES ('Bumthang'            ,	     'Chumey',	'BU',	'CU');
INSERT INTO @tbl VALUES ('Geylegphug'            ,	     'Chuzargang',	'GE',	'CZ');
INSERT INTO @tbl VALUES ('Wangdi Phodrang'            ,	     'Daga',	'WP',	'DG');
INSERT INTO @tbl VALUES ('Daga'            ,	     'Daga',	'DA',	'DA');
INSERT INTO @tbl VALUES ('Thimphu'            ,	     'Dagala',	'TM',	'DG');
INSERT INTO @tbl VALUES ('Daga'            ,	     'Dagapela',	'DA',	'DP');
INSERT INTO @tbl VALUES ('Chhukha'            ,	     'Dala',	'CK',	'DG');
INSERT INTO @tbl VALUES ('Chirang'            ,	     'Damphu',	'CR',	'DM');
INSERT INTO @tbl VALUES ('Wangdi Phodrang'            ,	     'Dangchu',	'WP',	'DC');
INSERT INTO @tbl VALUES ('Samdrup Jongkhar'            ,	     'Dechheling',	'SJ',	'DH');
INSERT INTO @tbl VALUES ('Geylegphug'            ,	     'Dekiling',	'GE',	'DK');
INSERT INTO @tbl VALUES ('Bumthang'            ,	     'Dekiling',	'BU',	'DK');
INSERT INTO @tbl VALUES ('Samchi'            ,	     'Denchukha',	'SM',	'DC');
INSERT INTO @tbl VALUES ('Geylegphug'            ,	     'Deorali',	'GE',	'DR');
INSERT INTO @tbl VALUES ('Samdrup Jongkhar'            ,	     'Deothang',	'SJ',	'DT');
INSERT INTO @tbl VALUES ('Paro'            ,	     'Dogar',	'PR',	'DG');
INSERT INTO @tbl VALUES ('Samchi'            ,	     'Dorokha',	'SM',	'DK');
INSERT INTO @tbl VALUES ('Daga'            ,	     'Dorona',	'DA',	'DO');
INSERT INTO @tbl VALUES ('Paro'            ,	     'Doteng',	'PR',	'DT');
INSERT INTO @tbl VALUES ('Geylegphug'            ,	     'Dovan',	'GE',	'DV');
INSERT INTO @tbl VALUES ('Tongsa'            ,	     'Drakteng',	'TO',	'DT');
INSERT INTO @tbl VALUES ('Mongar'            ,	     'Dramitse',	'MO',	'DG');
INSERT INTO @tbl VALUES ('Mongar'            ,	     'Drepong',	'MO',	'DP');
INSERT INTO @tbl VALUES ('Daga'            ,	     'Drujegang',	'DA',	'DJ');
INSERT INTO @tbl VALUES ('Tashi Yangtse'            ,	     'Duksum',	'TY',	'DS');
INSERT INTO @tbl VALUES ('Samchi'            ,	     'Dumtoe',	'SM',	'DT');
INSERT INTO @tbl VALUES ('Chirang'            ,	     'Dunglagang',	'CR',	'DG');
INSERT INTO @tbl VALUES ('Pemagatsel'            ,	     'Dungmin',	'PM',	'DM');
INSERT INTO @tbl VALUES ('Chhukha'            ,	     'Dungna',	'CK',	'DU');
INSERT INTO @tbl VALUES ('Punakha'            ,	     'Dzomi',	'PN',	'DZ');
INSERT INTO @tbl VALUES ('Ha'            ,	     'Eusu',	'HA',	'EU');
INSERT INTO @tbl VALUES ('Wangdi Phodrang'            ,	     'Gangtey',	'WP',	'GT');
INSERT INTO @tbl VALUES ('Lhuntshi'            ,	     'Gangzur',	'LH',	'GZ');
INSERT INTO @tbl VALUES ('Gasa'            ,	     'Gasa',	'GA',	'GA');
INSERT INTO @tbl VALUES ('Wangdi Phodrang'            ,	     'Gasetsho Gom',	'WP',	'GG');
INSERT INTO @tbl VALUES ('Wangdi Phodrang'            ,	     'Gasetsho Wom',	'WP',	'GW');
INSERT INTO @tbl VALUES ('Chhukha'            ,	     'Gedu',	'CK',	'GD');
INSERT INTO @tbl VALUES ('Geylegphug'            ,	     'Gelephu',	'GE',	'GG');
INSERT INTO @tbl VALUES ('Chhukha'            ,	     'Geling',	'CK',	'GL');
INSERT INTO @tbl VALUES ('Thimphu'            ,	     'Geney',	'TM',	'GN');
INSERT INTO @tbl VALUES ('Punakha'            ,	     'Geonshari',	'PN',	'GE');
INSERT INTO @tbl VALUES ('Daga'            ,	     'Gesarling',	'DA',	'GS');
INSERT INTO @tbl VALUES ('Chhukha'            ,	     'Getena',	'CK',	'GT');
INSERT INTO @tbl VALUES ('Samchi'            ,	     'Ghumaunay',	'SM',	'GH');
INSERT INTO @tbl VALUES ('Samdrup Jongkhar'            ,	     'Gomdhar',	'SJ',	'GD');
INSERT INTO @tbl VALUES ('Samchi'            ,	     'Gomtu',	'SM',	'GT');
INSERT INTO @tbl VALUES ('Mongar'            ,	     'Gongdue',	'MO',	'GD');
INSERT INTO @tbl VALUES ('Chirang'            ,	     'Gosarling',	'CR',	'GS');
INSERT INTO @tbl VALUES ('Shemgang'            ,	     'Goshing',	'SG',	'GS');
INSERT INTO @tbl VALUES ('Daga'            ,	     'Gozhi',	'DA',	'GZ');
INSERT INTO @tbl VALUES ('Punakha'            ,	     'Guma',	'PN',	'GU');
INSERT INTO @tbl VALUES ('Mongar'            ,	     'Gyelpozhing',	'MO',	'GP');
INSERT INTO @tbl VALUES ('Ha'            ,	     'Ha',	'HA',	'HH');
INSERT INTO @tbl VALUES ('Geylegphug'            ,	     'Hilley',	'GE',	'HL');
INSERT INTO @tbl VALUES ('Paro'            ,	     'Hungrel',	'PR',	'HR');
INSERT INTO @tbl VALUES ('Bumthang'            ,	     'Jakar',	'BU',	'JK');
INSERT INTO @tbl VALUES ('Bumthang'            ,	     'Jalkhar',	'BU',	'JL');
INSERT INTO @tbl VALUES ('Tashi Yangtse'            ,	     'Jamkhar',	'TY',	'JK');
INSERT INTO @tbl VALUES ('Lhuntshi'            ,	     'Jarey',	'LH',	'JR');
INSERT INTO @tbl VALUES ('Geylegphug'            ,	     'Jigmechoeling',	'GE',	'JM');
INSERT INTO @tbl VALUES ('Samdrup Jongkhar'            ,	     'Jomotsangkha',	'SJ',	'JM');
INSERT INTO @tbl VALUES ('Mongar'            ,	     'Jurmey',	'MO',	'JM');
INSERT INTO @tbl VALUES ('Punakha'            ,	     'Kabji',	'PN',	'KA');
INSERT INTO @tbl VALUES ('Daga'            ,	     'Kana',	'DA',	'KN');
INSERT INTO @tbl VALUES ('Tashigang'            ,	     'Kanglung',	'TA',	'KG');
INSERT INTO @tbl VALUES ('Tashigang'            ,	     'Kangpara',	'TA',	'KP');
INSERT INTO @tbl VALUES ('Ha'            ,	     'Katsho',	'HA',	'KS');
INSERT INTO @tbl VALUES ('Thimphu'            ,	     'Kawang',	'TM',	'KW');
INSERT INTO @tbl VALUES ('Pemagatsel'            ,	     'Kaynadang',	'PM',	'KN');
INSERT INTO @tbl VALUES ('Wangdi Phodrang'            ,	     'Kazhi',	'WP',	'KZ');
INSERT INTO @tbl VALUES ('Tashigang'            ,	     'Khaling',	'TA',	'KH');
INSERT INTO @tbl VALUES ('Tashi Yangtse'            ,	     'Khamdang',	'TY',	'KD');
INSERT INTO @tbl VALUES ('Gasa'            ,	     'Khamey',	'GA',	'KM');
INSERT INTO @tbl VALUES ('Pemagatsel'            ,	     'Khar',	'PM',	'KR');
INSERT INTO @tbl VALUES ('Gasa'            ,	     'Khatoe',	'GA',	'KT');
INSERT INTO @tbl VALUES ('Daga'            ,	     'Khebisa',	'DA',	'KB');
INSERT INTO @tbl VALUES ('Mongar'            ,	     'Khengkhar',	'MO',	'KK');
INSERT INTO @tbl VALUES ('Pemagatsel'            ,	     'Kherigonpa',	'PM',	'KG');
INSERT INTO @tbl VALUES ('Lhuntshi'            ,	     'Khoma',	'LH',	'KM');
INSERT INTO @tbl VALUES ('Pemagatsel'            ,	     'Khothakpa',	'PM',	'KT');
INSERT INTO @tbl VALUES ('Punakha'            ,	     'Khuru',	'PN',	'KH');
INSERT INTO @tbl VALUES ('Chirang'            ,	     'Kikhorthang',	'CR',	'KK');
INSERT INTO @tbl VALUES ('Tongsa'            ,	     'Korphu',	'TO',	'KP');
INSERT INTO @tbl VALUES ('Lhuntshi'            ,	     'Kurtoe',	'LH',	'KT');
INSERT INTO @tbl VALUES ('Samchi'            ,	     'Lahereni',	'SM',	'LH');
INSERT INTO @tbl VALUES ('Daga'            ,	     'Lajab',	'DA',	'LJ');
INSERT INTO @tbl VALUES ('Samdrup Jongkhar'            ,	     'Langchenphu',	'SJ',	'LC');
INSERT INTO @tbl VALUES ('Paro'            ,	     'Lango',	'PR',	'LA');
INSERT INTO @tbl VALUES ('Tongsa'            ,	     'Langthel',	'TO',	'LT');
INSERT INTO @tbl VALUES ('Samdrup Jongkhar'            ,	     'Lauri',	'SJ',	'LR');
INSERT INTO @tbl VALUES ('Gasa'            ,	     'Laya',	'GA',	'LY');
INSERT INTO @tbl VALUES ('Geylegphug'            ,	     'Lhamoizingkha',	'GE',	'LG');
INSERT INTO @tbl VALUES ('Lhuntshi'            ,	     'Lhuentse',	'LH',	'LH');
INSERT INTO @tbl VALUES ('Punakha'            ,	     'Limbu',	'PN',	'LI');
INSERT INTO @tbl VALUES ('Mongar'            ,	     'Lingmethang',	'MO',	'LM');
INSERT INTO @tbl VALUES ('Thimphu'            ,	     'Lingzhi',	'TM',	'LZ');
INSERT INTO @tbl VALUES ('Chhukha'            ,	     'Logchina',	'CK',	'LO');
INSERT INTO @tbl VALUES ('Tashigang'            ,	     'Lumang',	'TA',	'LM');
INSERT INTO @tbl VALUES ('Gasa'            ,	     'Lunana',	'GA',	'LN');
INSERT INTO @tbl VALUES ('Paro'            ,	     'Lungney',	'PR',	'LU');
INSERT INTO @tbl VALUES ('Samdrup Jongkhar'            ,	     'Martshala',	'SJ',	'MS');
INSERT INTO @tbl VALUES ('Samchi'            ,	     'Mayona',	'SM',	'MY');
INSERT INTO @tbl VALUES ('Lhuntshi'            ,	     'Menbi',	'LH',	'MB');
INSERT INTO @tbl VALUES ('Chirang'            ,	     'Mendrelgang',	'CR',	'MG');
INSERT INTO @tbl VALUES ('Lhuntshi'            ,	     'Menji',	'LH',	'MJ');
INSERT INTO @tbl VALUES ('Tashigang'            ,	     'Merak',	'TA',	'MR');
INSERT INTO @tbl VALUES ('Chhukha'            ,	     'Metakha',	'CK',	'MT');
INSERT INTO @tbl VALUES ('Lhuntshi'            ,	     'Metsho',	'LH',	'MT');
INSERT INTO @tbl VALUES ('Thimphu'            ,	     'Mewang',	'TM',	'MW');
INSERT INTO @tbl VALUES ('Mongar'            ,	     'Monggar',	'MO',	'MG');
INSERT INTO @tbl VALUES ('Pemagatsel'            ,	     'Mongling',	'PM',	'ML');
INSERT INTO @tbl VALUES ('Wangdi Phodrang'            ,	     'Nahi',	'WP',	'NH');
INSERT INTO @tbl VALUES ('Samchi'            ,	     'Nainital',	'SM',	'NN');
INSERT INTO @tbl VALUES ('Paro'            ,	     'Naja',	'PR',	'NJ');
INSERT INTO @tbl VALUES ('Shemgang'            ,	     'Nangkor',	'SG',	'NK');
INSERT INTO @tbl VALUES ('Pemagatsel'            ,	     'Nangkor',	'PM',	'NK');
INSERT INTO @tbl VALUES ('Samdrup Jongkhar'            ,	     'Nanglam',	'SJ',	'NL');
INSERT INTO @tbl VALUES ('Tashigang'            ,	     'Nanong',	'TA',	'NN');
INSERT INTO @tbl VALUES ('Thimphu'            ,	     'Naro',	'TM',	'NR');
INSERT INTO @tbl VALUES ('Shemgang'            ,	     'Ngangla',	'SG',	'NG');
INSERT INTO @tbl VALUES ('Mongar'            ,	     'Ngatshang',	'MO',	'NG');
INSERT INTO @tbl VALUES ('Geylegphug'            ,	     'Nichula',	'GE',	'NI');
INSERT INTO @tbl VALUES ('Wangdi Phodrang'            ,	     'Nobding',	'WP',	'ND');
INSERT INTO @tbl VALUES ('Samdrup Jongkhar'            ,	     'Norbugang',	'SJ',	'NB');
INSERT INTO @tbl VALUES ('Tongsa'            ,	     'Nubi',	'TO',	'NB');
INSERT INTO @tbl VALUES ('Wangdi Phodrang'            ,	     'Nysho',	'WP',	'NS');
INSERT INTO @tbl VALUES ('Samdrup Jongkhar'            ,	     'Orong',	'SJ',	'OR');
INSERT INTO @tbl VALUES ('Shemgang'            ,	     'Panbang',	'SG',	'PN');
INSERT INTO @tbl VALUES ('Chirang'            ,	     'Patala',	'CR',	'PT');
INSERT INTO @tbl VALUES ('Pemagatsel'            ,	     'Pemagatsel',	'PM',	'PM');
INSERT INTO @tbl VALUES ('Samdrup Jongkhar'            ,	     'Pemathang',	'SJ',	'PM');
INSERT INTO @tbl VALUES ('Shemgang'            ,	     'Phangkhar',	'SG',	'PK');
INSERT INTO @tbl VALUES ('Wangdi Phodrang'            ,	     'Phangyul',	'WP',	'PY');
INSERT INTO @tbl VALUES ('Wangdi Phodrang'            ,	     'Phobji',	'WP',	'PJ');
INSERT INTO @tbl VALUES ('Tashigang'            ,	     'Phongmey',	'TA',	'PM');
INSERT INTO @tbl VALUES ('Chhukha'            ,	     'Phuentsholing',	'CK',	'PT');
INSERT INTO @tbl VALUES ('Samdrup Jongkhar'            ,	     'Phuentshothang',	'SJ',	'PS');
INSERT INTO @tbl VALUES ('Chirang'            ,	     'Phuntenchu',	'CR',	'PH');
INSERT INTO @tbl VALUES ('Samchi'            ,	     'Pugli',	'SM',	'PG');
INSERT INTO @tbl VALUES ('Tashigang'            ,	     'Radhi',	'TA',	'RD');
INSERT INTO @tbl VALUES ('Tashi Yangtse'            ,	     'Ramjar',	'TY',	'RJ');
INSERT INTO @tbl VALUES ('Tashigang'            ,	     'Rangjung',	'TA',	'RJ');
INSERT INTO @tbl VALUES ('Chirang'            ,	     'Rangthangling',	'CR',	'RT');
INSERT INTO @tbl VALUES ('Tashigang'            ,	     'Reserboo',	'TA',	'RB');
INSERT INTO @tbl VALUES ('Wangdi Phodrang'            ,	     'Ruebisa',	'WP',	'RB');
INSERT INTO @tbl VALUES ('Wangdi Phodrang'            ,	     'Rurichu',	'WP',	'RR');
INSERT INTO @tbl VALUES ('Tashigang'            ,	     'Sakteng',	'TA',	'SK');
INSERT INTO @tbl VALUES ('Mongar'            ,	     'Saling',	'MO',	'SL');
INSERT INTO @tbl VALUES ('Ha'            ,	     'Samar',	'HA',	'SR');
INSERT INTO @tbl VALUES ('Samdrup Jongkhar'            ,	     'Samdrupchoeling',	'SJ',	'SC');
INSERT INTO @tbl VALUES ('Samdrup Jongkhar'            ,	     'Samdrupjongkhar',	'SJ',	'SD');
INSERT INTO @tbl VALUES ('Tashigang'            ,	     'Samkhar',	'TA',	'SM');
INSERT INTO @tbl VALUES ('Samdrup Jongkhar'            ,	     'Samrang',	'SJ',	'SM');
INSERT INTO @tbl VALUES ('Samchi'            ,	     'Samtse',	'SM',	'ST');
INSERT INTO @tbl VALUES ('Geylegphug'            ,	     'Sarpang',	'GE',	'SP');
INSERT INTO @tbl VALUES ('Chirang'            ,	     'Semjong',	'CR',	'SJ');
INSERT INTO @tbl VALUES ('Wangdi Phodrang'            ,	     'Sephu',	'WP',	'SP');
INSERT INTO @tbl VALUES ('Geylegphug'            ,	     'Sershong',	'GE',	'SS');
INSERT INTO @tbl VALUES ('Samdrup Jongkhar'            ,	     'Serthi',	'SJ',	'ST');
INSERT INTO @tbl VALUES ('Paro'            ,	     'Shaba',	'PR',	'SB');
INSERT INTO @tbl VALUES ('Paro'            ,	     'Shari',	'PR',	'SR');
INSERT INTO @tbl VALUES ('Punakha'            ,	     'Shenga Bjemi',	'PN',	'SH');
INSERT INTO @tbl VALUES ('Mongar'            ,	     'Sherimung',	'MO',	'SR');
INSERT INTO @tbl VALUES ('Shemgang'            ,	     'Shingkhar',	'SG',	'SK');
INSERT INTO @tbl VALUES ('Geylegphug'            ,	     'Shompangkha',	'GE',	'SM');
INSERT INTO @tbl VALUES ('Tashigang'            ,	     'Shongphu',	'TA',	'SP');
INSERT INTO @tbl VALUES ('Pemagatsel'            ,	     'Shumar',	'PM',	'SM');
INSERT INTO @tbl VALUES ('Mongar'            ,	     'Silambi',	'MO',	'SB');
INSERT INTO @tbl VALUES ('Geylegphug'            ,	     'Singhi',	'GE',	'SN');
INSERT INTO @tbl VALUES ('Samchi'            ,	     'Sipsu',	'SM',	'SS');
INSERT INTO @tbl VALUES ('Thimphu'            ,	     'Soe',	'TM',	'SO');
INSERT INTO @tbl VALUES ('Ha'            ,	     'Sombaykha',	'HA',	'SB');
INSERT INTO @tbl VALUES ('Daga'            ,	     'Sunkosh',	'DA',	'SK');
INSERT INTO @tbl VALUES ('Samchi'            ,	     'Tading',	'SM',	'TD');
INSERT INTO @tbl VALUES ('Geylegphug'            ,	     'Taklai',	'GE',	'TK');
INSERT INTO @tbl VALUES ('Punakha'            ,	     'Talo',	'PN',	'TA');
INSERT INTO @tbl VALUES ('Bumthang'            ,	     'Tang',	'BU',	'TA');
INSERT INTO @tbl VALUES ('Tongsa'            ,	     'Tangsibji',	'TO',	'TJ');
INSERT INTO @tbl VALUES ('Daga'            ,	     'Tashiding',	'DA',	'TD');
INSERT INTO @tbl VALUES ('Samchi'            ,	     'Tendu',	'SM',	'TN');
INSERT INTO @tbl VALUES ('Mongar'            ,	     'Thangrong',	'MO',	'TR');
INSERT INTO @tbl VALUES ('Wangdi Phodrang'            ,	     'Thedtsho',	'WP',	'TD');
INSERT INTO @tbl VALUES ('Tashi Yangtse'            ,	     'Thetsho',	'TY',	'TS');
INSERT INTO @tbl VALUES ('Thimphu'            ,	     'Thimphu',	'TM',	'TH');
INSERT INTO @tbl VALUES ('Tashigang'            ,	     'Thrimshing',	'TA',	'TM');
INSERT INTO @tbl VALUES ('Shemgang'            ,	     'Tingtibi',	'SG',	'TT');
INSERT INTO @tbl VALUES ('Thimphu'            ,	     'Toep',	'TM',	'TP');
INSERT INTO @tbl VALUES ('Punakha'            ,	     'Toewang',	'PN',	'TO');
INSERT INTO @tbl VALUES ('Tashi Yangtse'            ,	     'Tongzhang',	'TY',	'TZ');
INSERT INTO @tbl VALUES ('Tashigang'            ,	     'Trashigang',	'TA',	'TR');
INSERT INTO @tbl VALUES ('Shemgang'            ,	     'Trong',	'SG',	'TR');
INSERT INTO @tbl VALUES ('Tongsa'            ,	     'Trongsa',	'TO',	'TS');
INSERT INTO @tbl VALUES ('Mongar'            ,	     'Tsakaling',	'MO',	'TK');
INSERT INTO @tbl VALUES ('Mongar'            ,	     'Tsamang',	'MO',	'TM');
INSERT INTO @tbl VALUES ('Daga'            ,	     'Tsangkha',	'DA',	'TK');
INSERT INTO @tbl VALUES ('Daga'            ,	     'Tsendagang',	'DA',	'TG');
INSERT INTO @tbl VALUES ('Lhuntshi'            ,	     'Tsengkhar',	'LH',	'TS');
INSERT INTO @tbl VALUES ('Paro'            ,	     'Tsento',	'PR',	'TT');
INSERT INTO @tbl VALUES ('Daga'            ,	     'Tsheza',	'DA',	'TZ');
INSERT INTO @tbl VALUES ('Chirang'            ,	     'Tsholingkhar',	'CR',	'TL');
INSERT INTO @tbl VALUES ('Paro'            ,	     'Tshongdue',	'PR',	'TD');
INSERT INTO @tbl VALUES ('Chhukha'            ,	     'Tsimalakha',	'CK',	'TL');
INSERT INTO @tbl VALUES ('Chhukha'            ,	     'Tsimasham',	'CK',	'TS');
INSERT INTO @tbl VALUES ('Chirang'            ,	     'Tsirangtoe',	'CR',	'TR');
INSERT INTO @tbl VALUES ('Geylegphug'            ,	     'Umling',	'GE',	'UM');
INSERT INTO @tbl VALUES ('Bumthang'            ,	     'Ura',	'BU',	'UR');
INSERT INTO @tbl VALUES ('Tashigang'            ,	     'Uzorong',	'TA',	'UZ');
INSERT INTO @tbl VALUES ('Tashigang'            ,	     'Wamrong',	'TA',	'WM');
INSERT INTO @tbl VALUES ('Paro'            ,	     'Wangchang',	'PR',	'WC');
INSERT INTO @tbl VALUES ('Wangdi Phodrang'            ,	     'Wangdue',	'WP',	'WD');
INSERT INTO @tbl VALUES ('Tashi Yangtse'            ,	     'Yalang',	'TY',	'YL');
INSERT INTO @tbl VALUES ('Pemagatsel'            ,	     'Yalang',	'PM',	'YL');
INSERT INTO @tbl VALUES ('Tashigang'            ,	     'Yangnyer',	'TA',	'YN');
INSERT INTO @tbl VALUES ('Tashi Yangtse'            ,	     'Yangtse',	'TY',	'YT');
INSERT INTO @tbl VALUES ('Pemagatsel'            ,	     'Yurung',	'PM',	'YR');
INSERT INTO @tbl VALUES ('Shemgang'            ,	     'Zhemgang',	'SG',	'ZH');
INSERT INTO @tbl VALUES ('Pemagatsel'            ,	     'Zobel',	'PM',	'ZB');
INSERT INTO @tbl VALUES ('Samdrup Jongkhar'            ,	     'Bhangtar',	'SJ',	'BH');
INSERT INTO @tbl VALUES ('Bumthang'            ,	     'Bumthang',	'BU',	'BM');
INSERT INTO @tbl VALUES ('Chhukha'            ,	     'Chhukha (rest)',	'CK',	'CH');
INSERT INTO @tbl VALUES ('Daga'            ,	     'Dagana',	'DA',	'DG');
INSERT INTO @tbl VALUES ('Samdrup Jongkhar'            ,	     'Daifam',	'SJ',	'DF');



INSERT INTO @tbl VALUES ('Ha'            ,	     'Haa',	'HA',	'HA');
INSERT INTO @tbl VALUES ('Geylegphug'            ,	     'Lhamoi Zingkha',	'GE',	'LZ');
INSERT INTO @tbl VALUES ('Thimphu'            ,	     'Lingshi Dungkhag',	'TM',	'LD');
INSERT INTO @tbl VALUES ('Mongar'            ,	     'Mongar',	'MO',	'MO');
INSERT INTO @tbl VALUES ('Samdrup Jongkhar'            ,	     'Nganglam',	'SJ',	'NG');
INSERT INTO @tbl VALUES ('Paro'            ,	     'Paro',	'PR',	'PR');
INSERT INTO @tbl VALUES ('Pemagatsel'            ,	     'Pema Gatshel',	'PM',	'PG');
INSERT INTO @tbl VALUES ('Chhukha'            ,	     'Phuentsholing Dungkhag ',	'CK',	'PD');
INSERT INTO @tbl VALUES ('Punakha'            ,	     'Punakha',	'PN',	'PK');
INSERT INTO @tbl VALUES ('Samdrup Jongkhar'            ,	     'Samdrup Jongkhar (rest)',	'SJ',	'SJ');
INSERT INTO @tbl VALUES ('Samchi'            ,	     'Samtse (rest)',	'SM',	'SM');
INSERT INTO @tbl VALUES ('Thimphu'            ,	     'Thimphu (rest)',	'TM',	'TM');
INSERT INTO @tbl VALUES ('Tashi Yangtse'            ,	     'Trashi Yangtse',	'TY',	'TY');
INSERT INTO @tbl VALUES ('Tashigang'            ,	     'Trashigang (rest)',	'TA',	'TG');
INSERT INTO @tbl VALUES ('Chirang'            ,	     'Tsirang',	'CR',	'TS');
INSERT INTO @tbl VALUES ('Wangdi Phodrang'            ,	     'Wangdue Phodrang',	'WP',	'WP');
INSERT INTO @tbl VALUES ('Shemgang'            ,	     'Zhemgang (rest)',	'SG',	'ZG');

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

