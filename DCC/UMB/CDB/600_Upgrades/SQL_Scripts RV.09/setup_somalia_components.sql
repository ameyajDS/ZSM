
/* ==================================================================================
    	Source File		:	setup_somalia_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Somalia are set-up
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
WHERE	country_nm	=	'Somalia';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Somalia not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Region',
		level_2_address_component	=	'District',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Banaadir'            ,	     'Abdi Asis',	'BN',	'AA');
INSERT INTO @tbl VALUES ('Shabeellaha Dhexe'            ,	     'Adan Yabal',	'SD',	'AY');
INSERT INTO @tbl VALUES ('Jubbada Hoose'            ,	     'Afmadow',	'JH',	'AF');
INSERT INTO @tbl VALUES ('Bari'            ,	     'Alula',	'BR',	'AL');
INSERT INTO @tbl VALUES ('Jubbada Hoose'            ,	     'Badhadhe',	'JH',	'BA');
INSERT INTO @tbl VALUES ('Sanaag'            ,	     'Badhan',	'SA',	'BA');
INSERT INTO @tbl VALUES ('Awdal'            ,	     'Baki',	'AW',	'BA');
INSERT INTO @tbl VALUES ('Shabeellaha Dhexe'            ,	     'Ballcad',	'SD',	'BA');
INSERT INTO @tbl VALUES ('Gedo'            ,	     'Bardhere',	'GE',	'BA');
INSERT INTO @tbl VALUES ('Bay'            ,	     'Baydhaba',	'BY',	'BA');
INSERT INTO @tbl VALUES ('Hiiraan'            ,	     'Beletweyne',	'HI',	'BW');
INSERT INTO @tbl VALUES ('Gedo'            ,	     'Beletxawa',	'GE',	'BE');
INSERT INTO @tbl VALUES ('Bari'            ,	     'Bender Bayla',	'BR',	'BB');
INSERT INTO @tbl VALUES ('Woqooyi Galbeed'            ,	     'Berbera',	'WO',	'BE');
INSERT INTO @tbl VALUES ('Banaadir'            ,	     'Bondhere',	'BN',	'BO');
INSERT INTO @tbl VALUES ('Awdal'            ,	     'Boramo',	'AW',	'BO');
INSERT INTO @tbl VALUES ('Bari'            ,	     'Bosaso',	'BR',	'BO');
INSERT INTO @tbl VALUES ('Shabeellaha Hoose'            ,	     'Braawe',	'SH',	'BR');
INSERT INTO @tbl VALUES ('Jubbada Dhexe'            ,	     'Buale',	'JD',	'BU');
INSERT INTO @tbl VALUES ('Hiiraan'            ,	     'Bulo-Burte',	'HI',	'BB');
INSERT INTO @tbl VALUES ('Togdheer'            ,	     'Burco',	'TO',	'BR');
INSERT INTO @tbl VALUES ('Bay'            ,	     'Burhakaba',	'BY',	'BU');
INSERT INTO @tbl VALUES ('Nugaal'            ,	     'Burtinle',	'NU',	'BU');
INSERT INTO @tbl VALUES ('Togdheer'            ,	     'Buuhodle',	'TO',	'BH');
INSERT INTO @tbl VALUES ('Shabeellaha Dhexe'            ,	     'Caadale',	'SD',	'CA');
INSERT INTO @tbl VALUES ('Galguduud'            ,	     'Cabudwaaq',	'GA',	'CB');
INSERT INTO @tbl VALUES ('Galguduud'            ,	     'Cadaado',	'GA',	'CD');
INSERT INTO @tbl VALUES ('Sool'            ,	     'Caynabo',	'SO',	'CA');
INSERT INTO @tbl VALUES ('Sanaag'            ,	     'Ceelafyeyn',	'SA',	'CL');
INSERT INTO @tbl VALUES ('Bakool'            ,	     'Ceel Barde',	'BK',	'CB');
INSERT INTO @tbl VALUES ('Galguduud'            ,	     'Ceelbur',	'GA',	'CE');
INSERT INTO @tbl VALUES ('Galguduud'            ,	     'Ceeldeer',	'GA',	'CR');
INSERT INTO @tbl VALUES ('Gedo'            ,	     'Ceelwaaq',	'GE',	'CE');
INSERT INTO @tbl VALUES ('Sanaag'            ,	     'Ceerigabo',	'SA',	'CR');
INSERT INTO @tbl VALUES ('Nugaal'            ,	     'Dangoryo',	'NU',	'DA');
INSERT INTO @tbl VALUES ('Banaadir'            ,	     'Darkeynle',	'BN',	'DA');
INSERT INTO @tbl VALUES ('Sanaag'            ,	     'Dhahar',	'SA',	'DH');
INSERT INTO @tbl VALUES ('Galguduud'            ,	     'Dhusa-Mareb',	'GA',	'DM');
INSERT INTO @tbl VALUES ('Bay'            ,	     'Dinsor',	'BY',	'DI');
INSERT INTO @tbl VALUES ('Gedo'            ,	     'Dolow',	'GE',	'DO');
INSERT INTO @tbl VALUES ('Nugaal'            ,	     'Eyl',	'NU',	'EY');
INSERT INTO @tbl VALUES ('Galguduud'            ,	     'Galhareeri',	'GA',	'GA');
INSERT INTO @tbl VALUES ('Mudug'            ,	     'Galkacyo',	'MU',	'GA');
INSERT INTO @tbl VALUES ('Gedo'            ,	     'Garbaharey',	'GE',	'GA');
INSERT INTO @tbl VALUES ('Nugaal'            ,	     'Garowe',	'NU',	'GA');
INSERT INTO @tbl VALUES ('Woqooyi Galbeed'            ,	     'Gebiley',	'WO',	'GE');
INSERT INTO @tbl VALUES ('Mudug'            ,	     'Goldogob',	'MU',	'GO');
INSERT INTO @tbl VALUES ('Banaadir'            ,	     'Hamar Weyne',	'BN',	'HA');
INSERT INTO @tbl VALUES ('Mudug'            ,	     'Haradhere',	'MU',	'HA');
INSERT INTO @tbl VALUES ('Banaadir'            ,	     'Hara Jabjab',	'BN',	'HJ');
INSERT INTO @tbl VALUES ('Woqooyi Galbeed'            ,	     'Hargeysa',	'WO',	'HA');
INSERT INTO @tbl VALUES ('Banaadir'            ,	     'Hawle Wadaag',	'BN',	'HW');
INSERT INTO @tbl VALUES ('Banaadir'            ,	     'Heliwa',	'BN',	'HE');
INSERT INTO @tbl VALUES ('Mudug'            ,	     'Hobyo',	'MU',	'HO');
INSERT INTO @tbl VALUES ('Banaadir'            ,	     'Hodan',	'BN',	'HO');
INSERT INTO @tbl VALUES ('Bakool'            ,	     'Hudur',	'BK',	'HU');
INSERT INTO @tbl VALUES ('Bari'            ,	     'Iskhushuban',	'BR',	'IS');
INSERT INTO @tbl VALUES ('Hiiraan'            ,	     'Jalalaqsi',	'HI',	'JQ');
INSERT INTO @tbl VALUES ('Jubbada Hoose'            ,	     'Jamame',	'JH',	'JA');
INSERT INTO @tbl VALUES ('Mudug'            ,	     'Jeriban',	'MU',	'JE');
INSERT INTO @tbl VALUES ('Jubbada Dhexe'            ,	     'Jilib',	'JD',	'JI');
INSERT INTO @tbl VALUES ('Shabeellaha Dhexe'            ,	     'Jowhar',	'SD',	'JO');
INSERT INTO @tbl VALUES ('Banaadir'            ,	     'Karaan',	'BN',	'KA');
INSERT INTO @tbl VALUES ('Jubbada Hoose'            ,	     'Kismayo',	'JH',	'KI');
INSERT INTO @tbl VALUES ('Shabeellaha Hoose'            ,	     'Kurtunwaarey',	'SH',	'KU');
INSERT INTO @tbl VALUES ('Sool'            ,	     'Lascaanood',	'SO',	'LA');
INSERT INTO @tbl VALUES ('Sanaag'            ,	     'Las Qorey',	'SA',	'LQ');
INSERT INTO @tbl VALUES ('Awdal'            ,	     'Lughaya',	'AW',	'LU');
INSERT INTO @tbl VALUES ('Gedo'            ,	     'Luuq',	'GE',	'LU');
INSERT INTO @tbl VALUES ('Shabeellaha Hoose'            ,	     'Mark Afgooye',	'SH',	'MA');
INSERT INTO @tbl VALUES ('Togdheer'            ,	     'Odwenyen',	'TO',	'OD');
INSERT INTO @tbl VALUES ('Bari'            ,	     'Qandala',	'BR',	'QA');
INSERT INTO @tbl VALUES ('Bay'            ,	     'Qansadhere',	'BY',	'QA');
INSERT INTO @tbl VALUES ('Bari'            ,	     'Qardho',	'BR',	'QR');
INSERT INTO @tbl VALUES ('Shabeellaha Hoose'            ,	     'Qoryoyley',	'SH',	'QO');
INSERT INTO @tbl VALUES ('Shabeellaha Hoose'            ,	     'Sablaale',	'SH',	'SA');
INSERT INTO @tbl VALUES ('Jubbada Dhexe'            ,	     'Sakow',	'JD',	'SA');
INSERT INTO @tbl VALUES ('Banaadir'            ,	     'Shangani',	'BN',	'SH');
INSERT INTO @tbl VALUES ('Togdheer'            ,	     'Sheik',	'TO',	'SH');
INSERT INTO @tbl VALUES ('Banaadir'            ,	     'Shibis Waberi',	'BN',	'SW');
INSERT INTO @tbl VALUES ('Sool'            ,	     'Telex',	'SO',	'TE');
INSERT INTO @tbl VALUES ('Bakool'            ,	     'Tiyeglow',	'BK',	'TI');
INSERT INTO @tbl VALUES ('Banaadir'            ,	     'Wadajir',	'BN',	'WA');
INSERT INTO @tbl VALUES ('Bakool'            ,	     'Wajid',	'BK',	'WA');
INSERT INTO @tbl VALUES ('Shabeellaha Hoose'            ,	     'Wanlaweyne',	'SH',	'WA');
INSERT INTO @tbl VALUES ('Banaadir'            ,	     'Wardhiglye',	'BN',	'WD');
INSERT INTO @tbl VALUES ('Sool'            ,	     'Xudun',	'SO',	'XU');
INSERT INTO @tbl VALUES ('Banaadir'            ,	     'Yaqship',	'BN',	'YA');
INSERT INTO @tbl VALUES ('Bakool'            ,	     'Yeed',	'BK',	'YE');
INSERT INTO @tbl VALUES ('Awdal'            ,	     'Zeylac',	'AW',	'ZE');

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

