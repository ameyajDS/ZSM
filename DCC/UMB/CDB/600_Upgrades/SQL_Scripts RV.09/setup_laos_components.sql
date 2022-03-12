
/* ==================================================================================
    	Source File		:	setup_laos_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Laos are set-up
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
WHERE	country_nm	=	'Laos';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Laos not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Province',
		level_2_address_component	=	'District',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Savannakhet'            ,	     'Atsaphangthong',	'SV',	'AT');
INSERT INTO @tbl VALUES ('Savannakhet'            ,	     'Atsaphone',	'SV',	'AP');
INSERT INTO @tbl VALUES ('Champasak'            ,	     'Bachiangchaleunsook',	'CH',	'BA');
INSERT INTO @tbl VALUES ('Oudomxai'            ,	     'Beng',	'OU',	'BE');
INSERT INTO @tbl VALUES ('Bolikhamxai'            ,	     'Bolikhanh',	'BL',	'BO');
INSERT INTO @tbl VALUES ('Phongsali'            ,	     'Boon Neua',	'PH',	'BN');
INSERT INTO @tbl VALUES ('Phongsali'            ,	     'Boontai',	'PH',	'BT');
INSERT INTO @tbl VALUES ('Xaignabouri'            ,	     'Botene',	'XA',	'BO');
INSERT INTO @tbl VALUES ('Khammouan'            ,	     'Bualapha',	'KH',	'BU');
INSERT INTO @tbl VALUES ('Champasak'            ,	     'Champassack',	'CH',	'CH');
INSERT INTO @tbl VALUES ('Savannakhet'            ,	     'Champhone',	'SV',	'CH');
INSERT INTO @tbl VALUES ('Vientiane [prefecture]'            ,	     'Chanthabuly',	'VT',	'CH');
INSERT INTO @tbl VALUES ('Louangphrabang'            ,	     'Chomphet',	'LP',	'CH');
INSERT INTO @tbl VALUES ('Xekong'            ,	     'Dakcheung',	'XE',	'DA');
INSERT INTO @tbl VALUES ('Vientiane'            ,	     'Feuang',	'VN',	'FE');
INSERT INTO @tbl VALUES ('Vientiane [prefecture]'            ,	     'Hadxaifong',	'VT',	'HA');
INSERT INTO @tbl VALUES ('Khammouan'            ,	     'Hinboon',	'KH',	'HI');
INSERT INTO @tbl VALUES ('Vientiane'            ,	     'Hinhurp',	'VN',	'HI');
INSERT INTO @tbl VALUES ('Vientiane'            ,	     'Hom',	'VN',	'HO');
INSERT INTO @tbl VALUES ('Oudomxai'            ,	     'Hoon',	'OU',	'HO');
INSERT INTO @tbl VALUES ('Xaignabouri'            ,	     'Hongsa',	'XA',	'HO');
INSERT INTO @tbl VALUES ('Bokeo'            ,	     'Houixai',	'BK',	'HO');
INSERT INTO @tbl VALUES ('Houaphan'            ,	     'Huameuang',	'HO',	'HU');
INSERT INTO @tbl VALUES ('Xekong'            ,	     'Kaleum',	'XE',	'KA');
INSERT INTO @tbl VALUES ('Vientiane'            ,	     'Kasy',	'VN',	'KA');
INSERT INTO @tbl VALUES ('Xaignabouri'            ,	     'Kenethao',	'XA',	'KE');
INSERT INTO @tbl VALUES ('Vientiane'            ,	     'Keo Oudom',	'VN',	'KE');
INSERT INTO @tbl VALUES ('Xiangkhoang'            ,	     'Kham',	'XK',	'KM');
INSERT INTO @tbl VALUES ('Bolikhamxai'            ,	     'Khamkheuth',	'BL',	'KH');
INSERT INTO @tbl VALUES ('Savannakhet'            ,	     'Khanthabouly',	'SV',	'KH');
INSERT INTO @tbl VALUES ('Champasak'            ,	     'Khong',	'CH',	'KH');
INSERT INTO @tbl VALUES ('Saravan'            ,	     'Khongxedone',	'SL',	'KH');
INSERT INTO @tbl VALUES ('Xaignabouri'            ,	     'Khop',	'XA',	'KH');
INSERT INTO @tbl VALUES ('Xiangkhoang'            ,	     'Khoune',	'XK',	'KN');
INSERT INTO @tbl VALUES ('Phongsali'            ,	     'Khua',	'PH',	'KH');
INSERT INTO @tbl VALUES ('Oudomxai'            ,	     'La',	'OU',	'LA');
INSERT INTO @tbl VALUES ('Saravan'            ,	     'Lakhonepheng',	'SL',	'LK');
INSERT INTO @tbl VALUES ('Xekong'            ,	     'Lamarm',	'XE',	'LA');
INSERT INTO @tbl VALUES ('Saravan'            ,	     'Lao Ngarm',	'SL',	'LN');
INSERT INTO @tbl VALUES ('Louang Namtha'            ,	     'Long',	'LM',	'LO');
INSERT INTO @tbl VALUES ('Louangphrabang'            ,	     'Louangphrabang',	'LP',	'LO');
INSERT INTO @tbl VALUES ('Vientiane'            ,	     'Mad',	'VN',	'MA');
INSERT INTO @tbl VALUES ('Khammouan'            ,	     'Mahaxay',	'KH',	'MA');
INSERT INTO @tbl VALUES ('Phongsali'            ,	     'May',	'PH',	'MA');
INSERT INTO @tbl VALUES ('Vientiane [prefecture]'            ,	     'Mayparkngum',	'VT',	'MA');
INSERT INTO @tbl VALUES ('Bokeo'            ,	     'Meung',	'BK',	'ME');
INSERT INTO @tbl VALUES ('Champasak'            ,	     'Moonlapamok',	'CH',	'MO');
INSERT INTO @tbl VALUES ('Xiangkhoang'            ,	     'Morkmay',	'XK',	'MO');
INSERT INTO @tbl VALUES ('Houaphan'            ,	     'Muang Et',	'HO',	'MU');
INSERT INTO @tbl VALUES ('Khammouan'            ,	     'Nakai',	'KH',	'NA');
INSERT INTO @tbl VALUES ('Louang Namtha'            ,	     'Nalae',	'LM',	'NL');
INSERT INTO @tbl VALUES ('Bokeo'            ,	     'Nam You',	'BK',	'NA');
INSERT INTO @tbl VALUES ('Louangphrabang'            ,	     'Nambak',	'LP',	'NM');
INSERT INTO @tbl VALUES ('Oudomxai'            ,	     'Namor',	'OU',	'NA');
INSERT INTO @tbl VALUES ('Louang Namtha'            ,	     'Namtha',	'LM',	'NT');
INSERT INTO @tbl VALUES ('Louangphrabang'            ,	     'Nan',	'LP',	'NN');
INSERT INTO @tbl VALUES ('Vientiane [prefecture]'            ,	     'Naxaithong',	'VT',	'NA');
INSERT INTO @tbl VALUES ('Oudomxai'            ,	     'Nga',	'OU',	'NG');
INSERT INTO @tbl VALUES ('Xaignabouri'            ,	     'Ngeun',	'XA',	'NG');
INSERT INTO @tbl VALUES ('Louangphrabang'            ,	     'Ngoi',	'LP',	'NG');
INSERT INTO @tbl VALUES ('Khammouan'            ,	     'Nhommalath',	'KH',	'NH');
INSERT INTO @tbl VALUES ('Phongsali'            ,	     'Nhot Ou',	'PH',	'NH');
INSERT INTO @tbl VALUES ('Savannakhet'            ,	     'Nong',	'SV',	'NO');
INSERT INTO @tbl VALUES ('Khammouan'            ,	     'Nongbok',	'KH',	'NO');
INSERT INTO @tbl VALUES ('Xiangkhoang'            ,	     'Nonghed',	'XK',	'NO');
INSERT INTO @tbl VALUES ('Savannakhet'            ,	     'Outhoomphone',	'SV',	'OU');
INSERT INTO @tbl VALUES ('Oudomxai'            ,	     'Pakbeng',	'OU',	'PA');
INSERT INTO @tbl VALUES ('Bolikhamxai'            ,	     'Pakkading',	'BL',	'PD');
INSERT INTO @tbl VALUES ('Bolikhamxai'            ,	     'Paksane',	'BL',	'PS');
INSERT INTO @tbl VALUES ('Champasak'            ,	     'Pakse',	'CH',	'PE');
INSERT INTO @tbl VALUES ('Champasak'            ,	     'Paksong',	'CH',	'PG');
INSERT INTO @tbl VALUES ('Bokeo'            ,	     'Paktha',	'BK',	'PA');
INSERT INTO @tbl VALUES ('Louangphrabang'            ,	     'Pak Xeng',	'LP',	'PX');
INSERT INTO @tbl VALUES ('Xaignabouri'            ,	     'Parklai',	'XA',	'PA');
INSERT INTO @tbl VALUES ('Louangphrabang'            ,	     'Park Ou',	'LP',	'PO');
INSERT INTO @tbl VALUES ('Champasak'            ,	     'Pathoomphone',	'CH',	'PT');
INSERT INTO @tbl VALUES ('Xiangkhoang'            ,	     'Pek',	'XK',	'PE');
INSERT INTO @tbl VALUES ('Bokeo'            ,	     'Pha Oudom',	'BK',	'PH');
INSERT INTO @tbl VALUES ('Xiangkhoang'            ,	     'Phaxay',	'XK',	'PX');
INSERT INTO @tbl VALUES ('Xaignabouri'            ,	     'Phiang',	'XA',	'PH');
INSERT INTO @tbl VALUES ('Savannakhet'            ,	     'Phine',	'SV',	'PH');
INSERT INTO @tbl VALUES ('Phongsali'            ,	     'Phongsaly',	'PH',	'PH');
INSERT INTO @tbl VALUES ('Vientiane'            ,	     'Phonhong',	'VN',	'PH');
INSERT INTO @tbl VALUES ('Champasak'            ,	     'Phonthong',	'CH',	'PH');
INSERT INTO @tbl VALUES ('Louangphrabang'            ,	     'Phonxay',	'LP',	'PH');
INSERT INTO @tbl VALUES ('Xiangkhoang'            ,	     'Phookood',	'XK',	'PK');
INSERT INTO @tbl VALUES ('Louangphrabang'            ,	     'Phoukhoune',	'LP',	'PK');
INSERT INTO @tbl VALUES ('Attapu'            ,	     'Phouvong',	'AT',	'PH');
INSERT INTO @tbl VALUES ('Vientiane'            ,	     'Phun',	'VN',	'PN');
INSERT INTO @tbl VALUES ('Attapu'            ,	     'Samakkhixay',	'AT',	'SK');
INSERT INTO @tbl VALUES ('Phongsali'            ,	     'Samphanh',	'PH',	'SA');
INSERT INTO @tbl VALUES ('Saravan'            ,	     'Samuoi',	'SL',	'SM');
INSERT INTO @tbl VALUES ('Attapu'            ,	     'Sanamxay',	'AT',	'SN');
INSERT INTO @tbl VALUES ('Champasak'            ,	     'Sanasomboon',	'CH',	'SA');
INSERT INTO @tbl VALUES ('Vientiane [prefecture]'            ,	     'Sangthong',	'VT',	'SA');
INSERT INTO @tbl VALUES ('Attapu'            ,	     'Sanxay',	'AT',	'SX');
INSERT INTO @tbl VALUES ('Saravan'            ,	     'Saravane',	'SL',	'SV');
INSERT INTO @tbl VALUES ('Savannakhet'            ,	     'Sepone',	'SV',	'SE');
INSERT INTO @tbl VALUES ('Vientiane [prefecture]'            ,	     'Sikhottabong',	'VT',	'SK');
INSERT INTO @tbl VALUES ('Louang Namtha'            ,	     'Sing',	'LM',	'SI');
INSERT INTO @tbl VALUES ('Vientiane [prefecture]'            ,	     'Sisattanak',	'VT',	'SS');
INSERT INTO @tbl VALUES ('Savannakhet'            ,	     'Songkhone',	'SV',	'SO');
INSERT INTO @tbl VALUES ('Houaphan'            ,	     'Sop Bao',	'HO',	'SO');
INSERT INTO @tbl VALUES ('Champasak'            ,	     'Sukhuma',	'CH',	'SU');
INSERT INTO @tbl VALUES ('Saravan'            ,	     'Ta Oi',	'SL',	'TA');
INSERT INTO @tbl VALUES ('Khammouan'            ,	     'Thakhek',	'KH',	'TH');
INSERT INTO @tbl VALUES ('Savannakhet'            ,	     'Thapangthong',	'SV',	'TT');
INSERT INTO @tbl VALUES ('Bolikhamxai'            ,	     'Thaphabath',	'BL',	'TH');
INSERT INTO @tbl VALUES ('Savannakhet'            ,	     'Thaphalanxay',	'SV',	'TX');
INSERT INTO @tbl VALUES ('Xekong'            ,	     'Thateng',	'XE',	'TH');
INSERT INTO @tbl VALUES ('Xiangkhoang'            ,	     'Thathom',	'XK',	'TH');
INSERT INTO @tbl VALUES ('Xaignabouri'            ,	     'Thongmyxay',	'XA',	'TH');
INSERT INTO @tbl VALUES ('Vientiane'            ,	     'Thoulakhom',	'VN',	'TH');
INSERT INTO @tbl VALUES ('Bokeo'            ,	     'Tonpheung',	'BK',	'TO');
INSERT INTO @tbl VALUES ('Saravan'            ,	     'Toomlarn',	'SL',	'TO');
INSERT INTO @tbl VALUES ('Vientiane'            ,	     'Vangvieng',	'VN',	'VA');
INSERT INTO @tbl VALUES ('Saravan'            ,	     'Vapy',	'SL',	'VA');
INSERT INTO @tbl VALUES ('Louangphrabang'            ,	     'Viengkham',	'LP',	'VI');
INSERT INTO @tbl VALUES ('Vientiane'            ,	     'Viengkham',	'VN',	'VI');
INSERT INTO @tbl VALUES ('Louang Namtha'            ,	     'Viengphoukha',	'LM',	'VI');
INSERT INTO @tbl VALUES ('Houaphan'            ,	     'Viengthong',	'HO',	'VT');
INSERT INTO @tbl VALUES ('Bolikhamxai'            ,	     'Viengthong',	'BL',	'VI');
INSERT INTO @tbl VALUES ('Houaphan'            ,	     'Viengxay',	'HO',	'VX');
INSERT INTO @tbl VALUES ('Savannakhet'            ,	     'Vilabuly',	'SV',	'VI');
INSERT INTO @tbl VALUES ('Houaphan'            ,	     'Xamneua',	'HO',	'XN');
INSERT INTO @tbl VALUES ('Houaphan'            ,	     'Xamtay',	'HO',	'XT');
INSERT INTO @tbl VALUES ('Vientiane'            ,	     'Xanakharm',	'VN',	'XA');
INSERT INTO @tbl VALUES ('Oudomxai'            ,	     'Xay',	'OU',	'XA');
INSERT INTO @tbl VALUES ('Xaignabouri'            ,	     'Xayabury',	'XA',	'XA');
INSERT INTO @tbl VALUES ('Khammouan'            ,	     'Xaybuathong',	'KH',	'XA');
INSERT INTO @tbl VALUES ('Savannakhet'            ,	     'Xaybuly',	'SV',	'XB');
INSERT INTO @tbl VALUES ('Bolikhamxai'            ,	     'Xaychamphone',	'BL',	'XC');
INSERT INTO @tbl VALUES ('Savannakhet'            ,	     'Xayphoothong',	'SV',	'XP');
INSERT INTO @tbl VALUES ('Vientiane [prefecture]'            ,	     'Xaysetha',	'VT',	'XS');
INSERT INTO @tbl VALUES ('Attapu'            ,	     'Xaysetha',	'AT',	'XA');
INSERT INTO @tbl VALUES ('Vientiane'            ,	     'Xaysomboun',	'VN',	'XS');
INSERT INTO @tbl VALUES ('Vientiane [prefecture]'            ,	     'Xaythany',	'VT',	'XT');
INSERT INTO @tbl VALUES ('Khammouan'            ,	     'Xebangfay',	'KH',	'XE');
INSERT INTO @tbl VALUES ('Xaignabouri'            ,	     'Xienghone',	'XA',	'XI');
INSERT INTO @tbl VALUES ('Houaphan'            ,	     'Xiengkhor',	'HO',	'XI');
INSERT INTO @tbl VALUES ('Louangphrabang'            ,	     'Xieng Ngeun',	'LP',	'XI');
INSERT INTO @tbl VALUES ('Savannakhet'            ,	     'Xonbuly',	'SV',	'XO');

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

