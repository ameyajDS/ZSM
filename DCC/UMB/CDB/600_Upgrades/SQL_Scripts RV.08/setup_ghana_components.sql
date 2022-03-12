
/* ==================================================================================
    	Source File		:	setup_ghana_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	10-10-2014
	Module ID		:	CDB
	Last updated		:	10-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Ghana are set-up
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
WHERE	country_nm	=	'Ghana';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Ghana not found', 16, 1);
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

INSERT INTO @tbl VALUES ('Central'            ,	     'Abura-Asebu-Kwamankese',	'CP',	'AB');
INSERT INTO @tbl VALUES ('Greater Accra'            ,	     'Accra',	'AA',	'AC');
INSERT INTO @tbl VALUES ('Ashanti'            ,	     'Adansi East',	'AH',	'AE');
INSERT INTO @tbl VALUES ('Ashanti'            ,	     'Adansi West',	'AH',	'AW');
INSERT INTO @tbl VALUES ('Ashanti'            ,	     'Afigya Sekyere',	'AH',	'AF');
INSERT INTO @tbl VALUES ('Eastern'            ,	     'Afram Plains',	'EP',	'AP');
INSERT INTO @tbl VALUES ('Central'            ,	     'Agona',	'CP',	'AG');
INSERT INTO @tbl VALUES ('Ashanti'            ,	     'Ahafo Ano North',	'AH',	'AN');
INSERT INTO @tbl VALUES ('Ashanti'            ,	     'Ahafo Ano South',	'AH',	'AS');
INSERT INTO @tbl VALUES ('Western'            ,	     'Ahanta West',	'WP',	'AW');
INSERT INTO @tbl VALUES ('Central'            ,	     'Ajumako/Enyan/Esiam',	'CP',	'AJ');
INSERT INTO @tbl VALUES ('Volta'            ,	     'Akatsi',	'TV',	'AK');
INSERT INTO @tbl VALUES ('Eastern'            ,	     'Akwapim North',	'EP',	'AN');
INSERT INTO @tbl VALUES ('Eastern'            ,	     'Akwapim South',	'EP',	'AS');
INSERT INTO @tbl VALUES ('Ashanti'            ,	     'Amansie East',	'AH',	'AM');
INSERT INTO @tbl VALUES ('Ashanti'            ,	     'Amansie West',	'AH',	'AI');
INSERT INTO @tbl VALUES ('Western'            ,	     'Aowin-Suaman',	'WP',	'AS');
INSERT INTO @tbl VALUES ('Ashanti'            ,	     'Asante Akim North',	'AH',	'AR');
INSERT INTO @tbl VALUES ('Ashanti'            ,	     'Asante Akim South',	'AH',	'AU');
INSERT INTO @tbl VALUES ('Central'            ,	     'Asikuma Odoben Brakwa',	'CP',	'AO');
INSERT INTO @tbl VALUES ('Central'            ,	     'Assin',	'CP',	'AS');
INSERT INTO @tbl VALUES ('Brong-Ahafo'            ,	     'Asunafo',	'BA',	'AN');
INSERT INTO @tbl VALUES ('Eastern'            ,	     'Asuogyaman',	'EP',	'AG');
INSERT INTO @tbl VALUES ('Brong-Ahafo'            ,	     'Asutifi',	'BA',	'AT');
INSERT INTO @tbl VALUES ('Brong-Ahafo'            ,	     'Atebubu',	'BA',	'AB');
INSERT INTO @tbl VALUES ('Ashanti'            ,	     'Atwima',	'AH',	'AT');
INSERT INTO @tbl VALUES ('Central'            ,	     'Awutu Efutu Senya',	'CP',	'AE');
INSERT INTO @tbl VALUES ('Upper East'            ,	     'Bawku East',	'UE',	'BE');
INSERT INTO @tbl VALUES ('Upper East'            ,	     'Bawku West',	'UE',	'BW');
INSERT INTO @tbl VALUES ('Brong-Ahafo'            ,	     'Berekum',	'BA',	'BE');
INSERT INTO @tbl VALUES ('Western'            ,	     'Bibiani Anhwiaso Bekwai',	'WP',	'BA');
INSERT INTO @tbl VALUES ('Eastern'            ,	     'Birim North',	'EP',	'BN');
INSERT INTO @tbl VALUES ('Eastern'            ,	     'Birim South',	'EP',	'BS');
INSERT INTO @tbl VALUES ('Northern'            ,	     'Bole',	'NP',	'BO');
INSERT INTO @tbl VALUES ('Upper East'            ,	     'Bolgatanga',	'UE',	'BG');
INSERT INTO @tbl VALUES ('Upper East'            ,	     'Bongo',	'UE',	'BO');
INSERT INTO @tbl VALUES ('Ashanti'            ,	     'Bosomtwe-Kwanwoma',	'AH',	'BK');
INSERT INTO @tbl VALUES ('Upper East'            ,	     'Builsa',	'UE',	'BU');
INSERT INTO @tbl VALUES ('Central'            ,	     'Cape Coast',	'CP',	'CC');
INSERT INTO @tbl VALUES ('Greater Accra'            ,	     'Dangbe East',	'AA',	'DE');
INSERT INTO @tbl VALUES ('Greater Accra'            ,	     'Dangbe West',	'AA',	'DW');
INSERT INTO @tbl VALUES ('Brong-Ahafo'            ,	     'Dormaa',	'BA',	'DO');
INSERT INTO @tbl VALUES ('Eastern'            ,	     'East Akim',	'EP',	'EA');
INSERT INTO @tbl VALUES ('Northern'            ,	     'East Gonja',	'NP',	'EG');
INSERT INTO @tbl VALUES ('Northern'            ,	     'East Mamprusi',	'NP',	'EM');
INSERT INTO @tbl VALUES ('Ashanti'            ,	     'Ejisu-Juabeng',	'AH',	'EJ');
INSERT INTO @tbl VALUES ('Ashanti'            ,	     'Ejura Sekyedumase',	'AH',	'ES');
INSERT INTO @tbl VALUES ('Eastern'            ,	     'Fanteakwa',	'EP',	'FA');
INSERT INTO @tbl VALUES ('Greater Accra'            ,	     'Ga',	'AA',	'GA');
INSERT INTO @tbl VALUES ('Central'            ,	     'Gomoa',	'CP',	'GO');
INSERT INTO @tbl VALUES ('Northern'            ,	     'Gushiegu Karaga',	'NP',	'GK');
INSERT INTO @tbl VALUES ('Volta'            ,	     'Ho',	'TV',	'HO');
INSERT INTO @tbl VALUES ('Volta'            ,	     'Hohoe',	'TV',	'HH');
INSERT INTO @tbl VALUES ('Brong-Ahafo'            ,	     'Jaman',	'BA',	'JA');
INSERT INTO @tbl VALUES ('Volta'            ,	     'Jasikan',	'TV',	'JA');
INSERT INTO @tbl VALUES ('Upper West'            ,	     'Jirapa Lambussie',	'UW',	'JL');
INSERT INTO @tbl VALUES ('Western'            ,	     'Jomoro',	'WP',	'JO');
INSERT INTO @tbl VALUES ('Western'            ,	     'Juabeso Bia',	'WP',	'JB');
INSERT INTO @tbl VALUES ('Volta'            ,	     'Kadjebi',	'TV',	'KJ');
INSERT INTO @tbl VALUES ('Upper East'            ,	     'Kassena Nankana',	'UE',	'KN');
INSERT INTO @tbl VALUES ('Volta'            ,	     'Keta',	'TV',	'KA');
INSERT INTO @tbl VALUES ('Volta'            ,	     'Ketu',	'TV',	'KU');
INSERT INTO @tbl VALUES ('Brong-Ahafo'            ,	     'Kintampo',	'BA',	'KI');
INSERT INTO @tbl VALUES ('Central'            ,	     'Komenda-Edina-Eguafo-Abirem',	'CP',	'KE');
INSERT INTO @tbl VALUES ('Volta'            ,	     'Kpandu',	'TV',	'KP');
INSERT INTO @tbl VALUES ('Volta'            ,	     'Krachi',	'TV',	'KR');
INSERT INTO @tbl VALUES ('Ashanti'            ,	     'Kumasi',	'AH',	'KM');
INSERT INTO @tbl VALUES ('Eastern'            ,	     'Kwabibirem',	'EP',	'KB');
INSERT INTO @tbl VALUES ('Ashanti'            ,	     'Kwabre',	'AH',	'KB');
INSERT INTO @tbl VALUES ('Eastern'            ,	     'Kwahu South',	'EP',	'KS');
INSERT INTO @tbl VALUES ('Upper West'            ,	     'Lawra',	'UW',	'LA');
INSERT INTO @tbl VALUES ('Central'            ,	     'Lower Denkyira',	'CP',	'LD');
INSERT INTO @tbl VALUES ('Eastern'            ,	     'Manya Krobo',	'EP',	'MK');
INSERT INTO @tbl VALUES ('Central'            ,	     'Mfantsiman',	'CP',	'MF');
INSERT INTO @tbl VALUES ('Western'            ,	     'Mpohor Wassa East',	'WP',	'MW');
INSERT INTO @tbl VALUES ('Upper West'            ,	     'Nadowli',	'UW',	'NA');
INSERT INTO @tbl VALUES ('Northern'            ,	     'Nanumba',	'NP',	'NA');
INSERT INTO @tbl VALUES ('Eastern'            ,	     'New Juaben',	'EP',	'NJ');
INSERT INTO @tbl VALUES ('Brong-Ahafo'            ,	     'Nkoranza',	'BA',	'NK');
INSERT INTO @tbl VALUES ('Volta'            ,	     'Nkwanta',	'TV',	'NK');
INSERT INTO @tbl VALUES ('Volta'            ,	     'North Tongu',	'TV',	'NT');
INSERT INTO @tbl VALUES ('Western'            ,	     'Nzema East',	'WP',	'NE');
INSERT INTO @tbl VALUES ('Ashanti'            ,	     'Offinso',	'AH',	'OF');
INSERT INTO @tbl VALUES ('Northern'            ,	     'Saboba Chereponi',	'NP',	'SC');
INSERT INTO @tbl VALUES ('Northern'            ,	     'Savelugu Nanton',	'NP',	'SN');
INSERT INTO @tbl VALUES ('Western'            ,	     'Sefwi Wiawso',	'WP',	'SW');
INSERT INTO @tbl VALUES ('Ashanti'            ,	     'Sekyere East',	'AH',	'SE');
INSERT INTO @tbl VALUES ('Ashanti'            ,	     'Sekyere West',	'AH',	'SW');
INSERT INTO @tbl VALUES ('Brong-Ahafo'            ,	     'Sene',	'BA',	'SE');
INSERT INTO @tbl VALUES ('Western'            ,	     'Shama Ahanta East',	'WP',	'SA');
INSERT INTO @tbl VALUES ('Upper West'            ,	     'Sissala',	'UW',	'SS');
INSERT INTO @tbl VALUES ('Volta'            ,	     'South Tongu',	'TV',	'ST');
INSERT INTO @tbl VALUES ('Eastern'            ,	     'Suhum Kraboa Coaltar',	'EP',	'SK');
INSERT INTO @tbl VALUES ('Brong-Ahafo'            ,	     'Sunyani',	'BA',	'SY');
INSERT INTO @tbl VALUES ('Northern'            ,	     'Tamale',	'NP',	'TA');
INSERT INTO @tbl VALUES ('Brong-Ahafo'            ,	     'Tano',	'BA',	'TA');
INSERT INTO @tbl VALUES ('Brong-Ahafo'            ,	     'Techiman',	'BA',	'TE');
INSERT INTO @tbl VALUES ('Greater Accra'            ,	     'Tema',	'AA',	'TE');
INSERT INTO @tbl VALUES ('Northern'            ,	     'Tolon-Kumbungu',	'NP',	'TK');
INSERT INTO @tbl VALUES ('Central'            ,	     'Upper Denkyira',	'CP',	'UD');
INSERT INTO @tbl VALUES ('Upper West'            ,	     'Wa',	'UW',	'WA');
INSERT INTO @tbl VALUES ('Western'            ,	     'Wassa Amenfi',	'WP',	'WA');
INSERT INTO @tbl VALUES ('Western'            ,	     'Wassa West',	'WP',	'WW');
INSERT INTO @tbl VALUES ('Brong-Ahafo'            ,	     'Wenchi',	'BA',	'WE');
INSERT INTO @tbl VALUES ('Eastern'            ,	     'West Akim',	'EP',	'WA');
INSERT INTO @tbl VALUES ('Northern'            ,	     'West Gonja',	'NP',	'WG');
INSERT INTO @tbl VALUES ('Northern'            ,	     'West Mamprusi',	'NP',	'WM');
INSERT INTO @tbl VALUES ('Northern'            ,	     'Yendi',	'NP',	'YE');
INSERT INTO @tbl VALUES ('Eastern'            ,	     'Yilo Krobo',	'EP',	'YK');
INSERT INTO @tbl VALUES ('Northern'            ,	     'Zabzugu Tatale',	'NP',	'ZT');

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

