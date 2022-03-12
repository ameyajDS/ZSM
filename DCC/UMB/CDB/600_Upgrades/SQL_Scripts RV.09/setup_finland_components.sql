
/* ==================================================================================
    	Source File		:	setup_finland_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Finland are set-up
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
WHERE	country_nm	=	'Finland';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Finland not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Region',
		level_2_address_component	=	'Sub-region',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Central Finland'            ,	     'Aanekoski',	'CF',	'AA');
INSERT INTO @tbl VALUES ('Southwest Finland'            ,	     'Aboland-Turunmaa',	'SF',	'AT');
INSERT INTO @tbl VALUES ('North Karelia'            ,	     'Central Karelia',	'NK',	'CK');
INSERT INTO @tbl VALUES ('Ostrobothnia'            ,	     'Coastal Suupohja',	'OS',	'SR');
INSERT INTO @tbl VALUES ('Lapland'            ,	     'Eastern Lapland',	'LA',	'IL');
INSERT INTO @tbl VALUES ('Kanta-Hame'            ,	     'Forssa',	'KH',	'FO');
INSERT INTO @tbl VALUES ('Kanta-Hame'            ,	     'Hameenlinna',	'KH',	'HA');
INSERT INTO @tbl VALUES ('Paijat-Hame'            ,	     'Heinola',	'PH',	'HN');
INSERT INTO @tbl VALUES ('Uusimaa'            ,	     'Helsinki',	'US',	'HL');
INSERT INTO @tbl VALUES ('South Karelia'            ,	     'Imatra',	'SK',	'IM');
INSERT INTO @tbl VALUES ('North Savo'            ,	     'Inner Savonia',	'NS',	'SS');
INSERT INTO @tbl VALUES ('Central Finland'            ,	     'Jamsa',	'CF',	'JM');
INSERT INTO @tbl VALUES ('South Ostrobothnia'            ,	     'Jarviseutu',	'SO',	'JR');
INSERT INTO @tbl VALUES ('North Karelia'            ,	     'Joensuu',	'NK',	'JN');
INSERT INTO @tbl VALUES ('Central Finland'            ,	     'Joutsa',	'CF',	'JT');
INSERT INTO @tbl VALUES ('Central Finland'            ,	     'Jyvaskyla',	'CF',	'JY');
INSERT INTO @tbl VALUES ('Kainuu'            ,	     'Kajaani',	'KA',	'KJ');
INSERT INTO @tbl VALUES ('Central Ostrobothnia'            ,	     'Kaustinen',	'CO',	'KA');
INSERT INTO @tbl VALUES ('Kainuu'            ,	     'Kehys-Kainuu',	'KA',	'KK');
INSERT INTO @tbl VALUES ('Lapland'            ,	     'Kemi-Tornio',	'LA',	'KT');
INSERT INTO @tbl VALUES ('Central Finland'            ,	     'Keuruu',	'CF',	'KE');
INSERT INTO @tbl VALUES ('North Ostrobothnia'            ,	     'Koillismaa',	'NO',	'KM');
INSERT INTO @tbl VALUES ('Central Ostrobothnia'            ,	     'Kokkola',	'CO',	'KO');
INSERT INTO @tbl VALUES ('Kymenlaakso'            ,	     'Kotka-Hamina',	'KY',	'KH');
INSERT INTO @tbl VALUES ('Kymenlaakso'            ,	     'Kouvola',	'KY',	'KV');
INSERT INTO @tbl VALUES ('North Savo'            ,	     'Kuopio',	'NS',	'KP');
INSERT INTO @tbl VALUES ('South Ostrobothnia'            ,	     'Kuusiokunnat',	'SO',	'KU');
INSERT INTO @tbl VALUES ('Ostrobothnia'            ,	     'Kyronmaa',	'OS',	'KY');
INSERT INTO @tbl VALUES ('Paijat-Hame'            ,	     'Lahti',	'PH',	'LT');
INSERT INTO @tbl VALUES ('South Karelia'            ,	     'Lappeenranta',	'SK',	'LR');
INSERT INTO @tbl VALUES ('Uusimaa'            ,	     'Lohja',	'US',	'RB');
INSERT INTO @tbl VALUES ('Southwest Finland'            ,	     'Loimaa',	'SF',	'LM');
INSERT INTO @tbl VALUES ('Uusimaa'            ,	     'Loviisa',	'US',	'LV');
INSERT INTO @tbl VALUES ('South Savo'            ,	     'Mikkeli',	'SS',	'MI');
INSERT INTO @tbl VALUES ('North Ostrobothnia'            ,	     'Nivala-Haapajarvi',	'NO',	'NH');
INSERT INTO @tbl VALUES ('North Savo'            ,	     'North Eastern Savonia',	'NS',	'NS');
INSERT INTO @tbl VALUES ('Tampere Region'            ,	     'North Western Pirkanmaa',	'TR',	'NP');
INSERT INTO @tbl VALUES ('Lapland'            ,	     'Northern Lapland',	'LA',	'PL');
INSERT INTO @tbl VALUES ('Satakunta'            ,	     'Northern Satakunta',	'SA',	'PS');
INSERT INTO @tbl VALUES ('North Ostrobothnia'            ,	     'Oulu',	'NO',	'OU');
INSERT INTO @tbl VALUES ('North Ostrobothnia'            ,	     'Oulu Arc',	'NO',	'OK');
INSERT INTO @tbl VALUES ('South Savo'            ,	     'Pieksamaki',	'SS',	'PI');
INSERT INTO @tbl VALUES ('North Karelia'            ,	     'Pielinen Karelia',	'NK',	'PK');
INSERT INTO @tbl VALUES ('Ostrobothnia'            ,	     'Pietarsaari',	'OS',	'JK');
INSERT INTO @tbl VALUES ('Satakunta'            ,	     'Pori',	'SA',	'PR');
INSERT INTO @tbl VALUES ('Uusimaa'            ,	     'Porvoo',	'US',	'PV');
INSERT INTO @tbl VALUES ('North Ostrobothnia'            ,	     'Raahe',	'NO',	'RH');
INSERT INTO @tbl VALUES ('Satakunta'            ,	     'Rauma',	'SA',	'RM');
INSERT INTO @tbl VALUES ('Kanta-Hame'            ,	     'Riihimaki',	'KH',	'RI');
INSERT INTO @tbl VALUES ('Lapland'            ,	     'Rovaniemi',	'LA',	'RV');
INSERT INTO @tbl VALUES ('Central Finland'            ,	     'Saarijarvi-Viitasaari',	'CF',	'SV');
INSERT INTO @tbl VALUES ('Southwest Finland'            ,	     'Salo',	'SF',	'SL');
INSERT INTO @tbl VALUES ('South Savo'            ,	     'Savonlinna',	'SS',	'SA');
INSERT INTO @tbl VALUES ('South Ostrobothnia'            ,	     'Seinajoki',	'SO',	'SE');
INSERT INTO @tbl VALUES ('North Ostrobothnia'            ,	     'Siikalatva',	'NO',	'SI');
INSERT INTO @tbl VALUES ('Tampere Region'            ,	     'South Eastern Pirkanmaa',	'TR',	'SP');
INSERT INTO @tbl VALUES ('Tampere Region'            ,	     'South Western Pirkanmaa',	'TR',	'LP');
INSERT INTO @tbl VALUES ('Tampere Region'            ,	     'Southern Pirkanmaa',	'TR',	'EP');
INSERT INTO @tbl VALUES ('South Ostrobothnia'            ,	     'Suupohja',	'SO',	'SU');
INSERT INTO @tbl VALUES ('Tampere Region'            ,	     'Tampere',	'TR',	'TA');
INSERT INTO @tbl VALUES ('Lapland'            ,	     'Torne Valley',	'LA',	'TO');
INSERT INTO @tbl VALUES ('Lapland'            ,	     'Tunturi Lapland',	'LA',	'TL');
INSERT INTO @tbl VALUES ('Southwest Finland'            ,	     'Turku',	'SF',	'TU');
INSERT INTO @tbl VALUES ('Tampere Region'            ,	     'Upper Pirkanmaa',	'TR',	'YP');
INSERT INTO @tbl VALUES ('North Savo'            ,	     'Upper Savonia',	'NS',	'YS');
INSERT INTO @tbl VALUES ('Ostrobothnia'            ,	     'Vaasa',	'OS',	'VA');
INSERT INTO @tbl VALUES ('Southwest Finland'            ,	     'Vakka-Suomi',	'SF',	'VS');
INSERT INTO @tbl VALUES ('North Savo'            ,	     'Varkaus',	'NS',	'VK');
INSERT INTO @tbl VALUES ('North Ostrobothnia'            ,	     'Ylivieska',	'NO',	'YL');

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

