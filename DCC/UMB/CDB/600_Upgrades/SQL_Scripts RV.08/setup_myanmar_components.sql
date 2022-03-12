
/* ==================================================================================
    	Source File		:	setup_myanmar_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	10-10-2014
	Module ID		:	CDB
	Last updated		:	10-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Myanmar are set-up
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
WHERE	country_nm	=	'Myanmar';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Myanmar not found', 16, 1);
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

INSERT INTO @tbl VALUES ('Bago'            ,	     'Bago',	'BA',	'BG');
INSERT INTO @tbl VALUES ('Kayah'            ,	     'Bawlakhe',	'KH',	'BW');
INSERT INTO @tbl VALUES ('Kachin'            ,	     'Bhamo',	'KC',	'BM');
INSERT INTO @tbl VALUES ('Tanintharyi'            ,	     'Dawei',	'TN',	'DW');
INSERT INTO @tbl VALUES ('Chin'            ,	     'Falam',	'CH',	'FL');
INSERT INTO @tbl VALUES ('Magway'            ,	     'Gangaw',	'MG',	'GG');
INSERT INTO @tbl VALUES ('Ayeyarwady'            ,	     'Hinthada',	'AY',	'HD');
INSERT INTO @tbl VALUES ('Sagaing'            ,	     'Hkamti',	'SA',	'HK');
INSERT INTO @tbl VALUES ('Kayin'            ,	     'Hpa-an',	'KN',	'HP');
INSERT INTO @tbl VALUES ('Sagaing'            ,	     'Kalemyo',	'SA',	'KM');
INSERT INTO @tbl VALUES ('Sagaing'            ,	     'Katha',	'SA',	'KA');
INSERT INTO @tbl VALUES ('Kayin'            ,	     'Kawkareik',	'KN',	'KK');
INSERT INTO @tbl VALUES ('Tanintharyi'            ,	     'Kawthoung',	'TN',	'KG');
INSERT INTO @tbl VALUES ('Shan'            ,	     'Kengtung',	'SH',	'KT');
INSERT INTO @tbl VALUES ('Shan'            ,	     'Kunlong',	'SH',	'KL');
INSERT INTO @tbl VALUES ('Shan'            ,	     'Kyaukme',	'SH',	'KY');
INSERT INTO @tbl VALUES ('Mandalay'            ,	     'Kyaukse',	'MD',	'KS');
INSERT INTO @tbl VALUES ('Rakhine'            ,	     'Kyaunkpyu',	'RA',	'KP');
INSERT INTO @tbl VALUES ('Shan'            ,	     'Lashio',	'SH',	'LS');
INSERT INTO @tbl VALUES ('Shan'            ,	     'Laukkaing',	'SH',	'LU');
INSERT INTO @tbl VALUES ('Kayah'            ,	     'Loikaw',	'KH',	'LK');
INSERT INTO @tbl VALUES ('Shan'            ,	     'Loilen',	'SH',	'LL');
INSERT INTO @tbl VALUES ('Magway'            ,	     'Magway',	'MG',	'MG');
INSERT INTO @tbl VALUES ('Mandalay'            ,	     'Mandalay',	'MD',	'MA');
INSERT INTO @tbl VALUES ('Ayeyarwady'            ,	     'Maubin',	'AY',	'MU');
INSERT INTO @tbl VALUES ('Rakhine'            ,	     'Maungdaw',	'RA',	'MX');
INSERT INTO @tbl VALUES ('Sagaing'            ,	     'Mawlaik',	'SA',	'MW');
INSERT INTO @tbl VALUES ('Mon'            ,	     'Mawlamyine',	'MO',	'ML');
INSERT INTO @tbl VALUES ('Mandalay'            ,	     'Meiktila',	'MD',	'ME');
INSERT INTO @tbl VALUES ('Magway'            ,	     'Minbu',	'MG',	'MB');
INSERT INTO @tbl VALUES ('Chin'            ,	     'Mindat',	'CH',	'MI');
INSERT INTO @tbl VALUES ('Shan'            ,	     'Mong-Hpayak',	'SH',	'MP');
INSERT INTO @tbl VALUES ('Shan'            ,	     'Mong Hsat',	'SH',	'MH');
INSERT INTO @tbl VALUES ('Sagaing'            ,	     'Monywa',	'SA',	'MO');
INSERT INTO @tbl VALUES ('Shan'            ,	     'Muse',	'SH',	'MS');
INSERT INTO @tbl VALUES ('Ayeyarwady'            ,	     'Myaungmya',	'AY',	'MM');
INSERT INTO @tbl VALUES ('Kayin'            ,	     'Myawadi',	'KN',	'MY');
INSERT INTO @tbl VALUES ('Tanintharyi'            ,	     'Myeik',	'TN',	'MK');
INSERT INTO @tbl VALUES ('Mandalay'            ,	     'Myingyan',	'MD',	'MN');
INSERT INTO @tbl VALUES ('Kachin'            ,	     'Myitkyina',	'KC',	'MT');
INSERT INTO @tbl VALUES ('Mandalay'            ,	     'Nyaung-u',	'MD',	'NY');
INSERT INTO @tbl VALUES ('Magway'            ,	     'Pakokku',	'MG',	'PK');
INSERT INTO @tbl VALUES ('Ayeyarwady'            ,	     'Pathein',	'AY',	'PT');
INSERT INTO @tbl VALUES ('Kachin'            ,	     'Putao',	'KC',	'PU');
INSERT INTO @tbl VALUES ('Ayeyarwady'            ,	     'Pyapon',	'AY',	'PP');
INSERT INTO @tbl VALUES ('Bago'            ,	     'Pyay',	'BA',	'PY');
INSERT INTO @tbl VALUES ('Mandalay'            ,	     'Pyin-Oo-Lwin',	'MD',	'PL');
INSERT INTO @tbl VALUES ('Sagaing'            ,	     'Sagaing',	'SA',	'SA');
INSERT INTO @tbl VALUES ('Sagaing'            ,	     'Shwebo',	'SA',	'SH');
INSERT INTO @tbl VALUES ('Rakhine'            ,	     'Sittwe',	'RA',	'SI');
INSERT INTO @tbl VALUES ('Shan'            ,	     'Tachileik',	'SH',	'TC');
INSERT INTO @tbl VALUES ('Sagaing'            ,	     'Tamu',	'SA',	'TM');
INSERT INTO @tbl VALUES ('Shan'            ,	     'Taunggyi',	'SH',	'TG');
INSERT INTO @tbl VALUES ('Bago'            ,	     'Taungoo',	'BA',	'TA');
INSERT INTO @tbl VALUES ('Rakhine'            ,	     'Thandwe',	'RA',	'TD');
INSERT INTO @tbl VALUES ('Mon'            ,	     'Thaton',	'MO',	'TT');
INSERT INTO @tbl VALUES ('Bago'            ,	     'Thayarwady',	'BA',	'TW');
INSERT INTO @tbl VALUES ('Magway'            ,	     'Thayetmyo',	'MG',	'TY');
INSERT INTO @tbl VALUES ('Mandalay'            ,	     'Yamethin',	'MD',	'YM');
INSERT INTO @tbl VALUES ('Yangon'            ,	     'Yangon East',	'YA',	'YE');
INSERT INTO @tbl VALUES ('Yangon'            ,	     'Yangon North',	'YA',	'YN');
INSERT INTO @tbl VALUES ('Yangon'            ,	     'Yangon South',	'YA',	'YS');
INSERT INTO @tbl VALUES ('Yangon'            ,	     'Yangon West',	'YA',	'YW');

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

