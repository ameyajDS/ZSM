
/* ==================================================================================
    	Source File		:	setup_guyana_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Guyana are set-up
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
WHERE	country_nm	=	'Guyana';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Guyana not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Region',
		level_2_address_component	=	'Council',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (40), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Mahaica-Berbice'            ,	     'Abary / Mahaicony',	'MA',	'AM');
INSERT INTO @tbl VALUES ('Cuyuni-Mazaruni'            ,	     'Agatash',	'CU',	'AG');
INSERT INTO @tbl VALUES ('Upper Takutu-Upper Essequibo'            ,	     'Aishalton - Karaudanawa, Achiwib',	'UT',	'AK');
INSERT INTO @tbl VALUES ('Essequibo Island-W Demerara'            ,	     'Amsterdam (Dem River) / Vriesland',	'ES',	'AD');
INSERT INTO @tbl VALUES ('Pomeroon-Supenaam'            ,	     'Anna Regina Municipality',	'PM',	'AR');
INSERT INTO @tbl VALUES ('Cuyuni-Mazaruni'            ,	     'Arau',	'CU',	'AR');
INSERT INTO @tbl VALUES ('Barima-Waini'            ,	     'Barima / Amakura',	'BA',	'BA');
INSERT INTO @tbl VALUES ('Cuyuni-Mazaruni'            ,	     'Bartica',	'CU',	'BA');
INSERT INTO @tbl VALUES ('Mahaica-Berbice'            ,	     'Bel Air / Woodlands',	'MA',	'BA');
INSERT INTO @tbl VALUES ('Upper Demerara-Berbice'            ,	     'Berbice River Settlement',	'UD',	'BR');
INSERT INTO @tbl VALUES ('East Berbice-Corentyne'            ,	     'Black bush Polder Land Dev Scheme',	'EB',	'BP');
INSERT INTO @tbl VALUES ('Essequibo Island-W Demerara'            ,	     'Blankenburg / Hague',	'ES',	'BH');
INSERT INTO @tbl VALUES ('East Berbice-Corentyne'            ,	     'Borlam (No. 37) / Kintyre',	'EB',	'BN');
INSERT INTO @tbl VALUES ('East Berbice-Corentyne'            ,	     'Bush Lot / Adventure',	'EB',	'BL');
INSERT INTO @tbl VALUES ('Essequibo Island-W Demerara'            ,	     'Canal No. 2 (part) + Belle + Little All',	'ES',	'CN');
INSERT INTO @tbl VALUES ('Essequibo Island-W Demerara'            ,	     'Canals Polder',	'ES',	'CP');
INSERT INTO @tbl VALUES ('East Berbice-Corentyne'            ,	     'Cane Field / Enterprise',	'EB',	'CF');
INSERT INTO @tbl VALUES ('Demerara-Mahaica'            ,	     'Cane Grove Land Dev. Scheme',	'DE',	'CG');
INSERT INTO @tbl VALUES ('East Berbice-Corentyne'            ,	     'Canje River',	'EB',	'CJ');
INSERT INTO @tbl VALUES ('Mahaica-Berbice'            ,	     'Chance / Hamlet',	'MA',	'CH');
INSERT INTO @tbl VALUES ('Pomeroon-Supenaam'            ,	     'Charity / Urasara',	'PM',	'CU');
INSERT INTO @tbl VALUES ('Potaro-Siparuni'            ,	     'Chenapau River',	'PT',	'CR');
INSERT INTO @tbl VALUES ('Demerara-Mahaica'            ,	     'City of Georgetown Municipality',	'DE',	'GM');
INSERT INTO @tbl VALUES ('Upper Demerara-Berbice'            ,	     'Coomaka Lands',	'UD',	'CL');
INSERT INTO @tbl VALUES ('East Berbice-Corentyne'            ,	     'Corentyne River',	'EB',	'CT');
INSERT INTO @tbl VALUES ('Essequibo Island-W Demerara'            ,	     'Cornelia Ida / Stewartville',	'ES',	'CI');
INSERT INTO @tbl VALUES ('East Berbice-Corentyne'            ,	     'Corriverton Municipality',	'EB',	'CM');
INSERT INTO @tbl VALUES ('Demerara-Mahaica'            ,	     'Diamond / Golden Grove',	'DE',	'DG');
INSERT INTO @tbl VALUES ('East Berbice-Corentyne'            ,	     'East bank Berbice',	'EB',	'EB');
INSERT INTO @tbl VALUES ('Demerara-Mahaica'            ,	     'Eccles / Ramsburg',	'DE',	'ER');
INSERT INTO @tbl VALUES ('East Berbice-Corentyne'            ,	     'Enfield / New Doe Park',	'EB',	'EN');
INSERT INTO @tbl VALUES ('Demerara-Mahaica'            ,	     'Enmore / Hope',	'DE',	'EH');
INSERT INTO @tbl VALUES ('Mahaica-Berbice'            ,	     'Farm / Woodlands',	'MA',	'FW');
INSERT INTO @tbl VALUES ('Demerara-Mahaica'            ,	     'Foulis / Buxton',	'DE',	'FB');
INSERT INTO @tbl VALUES ('East Berbice-Corentyne'            ,	     'Fyrish / Gibraltar',	'EB',	'FG');
INSERT INTO @tbl VALUES ('Mahaica-Berbice'            ,	     'Gelderland / No. 3',	'MA',	'GN');
INSERT INTO @tbl VALUES ('Essequibo Island-W Demerara'            ,	     'Good Hope / Hydronie',	'ES',	'GH');
INSERT INTO @tbl VALUES ('Pomeroon-Supenaam'            ,	     'Good Hope / Pomona',	'PM',	'GH');
INSERT INTO @tbl VALUES ('Demerara-Mahaica'            ,	     'Good Success / Caledonia',	'DE',	'GS');
INSERT INTO @tbl VALUES ('Demerara-Mahaica'            ,	     'Grove / Haslington',	'DE',	'GH');
INSERT INTO @tbl VALUES ('East Berbice-Corentyne'            ,	     'Hamsphire / Kilcoy',	'EB',	'HK');
INSERT INTO @tbl VALUES ('Demerara-Mahaica'            ,	     'Herstelling / Little Diamond',	'DE',	'HL');
INSERT INTO @tbl VALUES ('East Berbice-Corentyne'            ,	     'Hogstye / Lancaster',	'EB',	'HL');
INSERT INTO @tbl VALUES ('Upper Takutu-Upper Essequibo'            ,	     'Ireng / Sawariwau Incl St. Ignatius',	'UT',	'IS');
INSERT INTO @tbl VALUES ('Upper Demerara-Berbice'            ,	     'Ituni',	'UD',	'IT');
INSERT INTO @tbl VALUES ('East Berbice-Corentyne'            ,	     'Jackson Creek / Crabwood Creek',	'EB',	'JC');
INSERT INTO @tbl VALUES ('Cuyuni-Mazaruni'            ,	     'Jawalla, Kubenang River',	'CU',	'JK');
INSERT INTO @tbl VALUES ('East Berbice-Corentyne'            ,	     'John / Port Mourant',	'EB',	'JP');
INSERT INTO @tbl VALUES ('East Berbice-Corentyne'            ,	     'Joppa / Macedonia',	'EB',	'JM');
INSERT INTO @tbl VALUES ('Potaro-Siparuni'            ,	     'Kaibarupai',	'PT',	'KA');
INSERT INTO @tbl VALUES ('Cuyuni-Mazaruni'            ,	     'Kamarang',	'CU',	'KA');
INSERT INTO @tbl VALUES ('Cuyuni-Mazaruni'            ,	     'Karambaru to Kukui River/Phillipi',	'CU',	'KK');
INSERT INTO @tbl VALUES ('Essequibo Island-W Demerara'            ,	     'Klein Pouderoyen / Best',	'ES',	'KP');
INSERT INTO @tbl VALUES ('Potaro-Siparuni'            ,	     'Kopanang, Waipa, Kenepai',	'PT',	'KW');
INSERT INTO @tbl VALUES ('Upper Demerara-Berbice'            ,	     'Kwakwani',	'UD',	'KW');
INSERT INTO @tbl VALUES ('Demerara-Mahaica'            ,	     'La Bonne Intention / Better Hope',	'DE',	'LB');
INSERT INTO @tbl VALUES ('Demerara-Mahaica'            ,	     'La Reconnaissance / Mon Repos',	'DE',	'LR');
INSERT INTO @tbl VALUES ('Essequibo Island-W Demerara'            ,	     'Leguan (Essequibo Is.)',	'ES',	'LE');
INSERT INTO @tbl VALUES ('Upper Demerara-Berbice'            ,	     'Linden Municipality',	'UD',	'LM');
INSERT INTO @tbl VALUES ('Barima-Waini'            ,	     'Mabaruma / Kumaka / Hosororo',	'BA',	'MK');
INSERT INTO @tbl VALUES ('Upper Demerara-Berbice'            ,	     'Mabura Hills',	'UD',	'MH');
INSERT INTO @tbl VALUES ('Potaro-Siparuni'            ,	     'Madhia + Kuribrong River + Mona Falls',	'PT',	'MK');
INSERT INTO @tbl VALUES ('Upper Demerara-Berbice'            ,	     'Makouria River',	'UD',	'MR');
INSERT INTO @tbl VALUES ('Potaro-Siparuni'            ,	     'Maripari River + Kurukabaru',	'PT',	'MR');
INSERT INTO @tbl VALUES ('Upper Takutu-Upper Essequibo'            ,	     'Marudi',	'UT',	'MA');
INSERT INTO @tbl VALUES ('Barima-Waini'            ,	     'Matthews Ridge/Arakaka/Port Kaituma',	'BA',	'MR');
INSERT INTO @tbl VALUES ('Essequibo Island-W Demerara'            ,	     'Meer Zorgen / Malgre Tout',	'ES',	'MZ');
INSERT INTO @tbl VALUES ('Demerara-Mahaica'            ,	     'Mocha / Arcadia',	'DE',	'MA');
INSERT INTO @tbl VALUES ('Potaro-Siparuni'            ,	     'Monkey Mountain',	'PT',	'MM');
INSERT INTO @tbl VALUES ('Upper Demerara-Berbice'            ,	     'Mora Creek (Aorima), Hururu',	'UD',	'MC');
INSERT INTO @tbl VALUES ('Mahaica-Berbice'            ,	     'Naarstigheid / Union',	'MA',	'NU');
INSERT INTO @tbl VALUES ('East Berbice-Corentyne'            ,	     'New Amsterdam Municipality',	'EB',	'NA');
INSERT INTO @tbl VALUES ('Essequibo Island-W Demerara'            ,	     'Nismes / La Grange',	'ES',	'NL');
INSERT INTO @tbl VALUES ('East Berbice-Corentyne'            ,	     'No. 38 / Ordnance Fortlands',	'EB',	'NO');
INSERT INTO @tbl VALUES ('East Berbice-Corentyne'            ,	     'No. 51 village / Good Hope',	'EB',	'NG');
INSERT INTO @tbl VALUES ('East Berbice-Corentyne'            ,	     'No. 74 Village / No. 52 Village',	'EB',	'NV');
INSERT INTO @tbl VALUES ('Essequibo Island-W Demerara'            ,	     'Nouvelle Flanders / La Jalousie',	'ES',	'NF');
INSERT INTO @tbl VALUES ('Pomeroon-Supenaam'            ,	     'Paradise/Evergreen(Incl Somerset&Berks)',	'PM',	'PE');
INSERT INTO @tbl VALUES ('Potaro-Siparuni'            ,	     'Paramakatoi',	'PT',	'PA');
INSERT INTO @tbl VALUES ('Essequibo Island-W Demerara'            ,	     'Parika / Mora',	'ES',	'PM');
INSERT INTO @tbl VALUES ('Cuyuni-Mazaruni'            ,	     'Paruima',	'CU',	'PA');
INSERT INTO @tbl VALUES ('Essequibo Island-W Demerara'            ,	     'Patentia / Toevlugt',	'ES',	'PT');
INSERT INTO @tbl VALUES ('Demerara-Mahaica'            ,	     'Plaisance / Industry',	'DE',	'PI');
INSERT INTO @tbl VALUES ('Mahaica-Berbice'            ,	     'Rising Sun / Profit',	'MA',	'RS');
INSERT INTO @tbl VALUES ('Pomeroon-Supenaam'            ,	     'Riverstown / Annandale',	'PM',	'RA');
INSERT INTO @tbl VALUES ('East Berbice-Corentyne'            ,	     'Rose Hall Municipality',	'EB',	'RH');
INSERT INTO @tbl VALUES ('Mahaica-Berbice'            ,	     'Rosignol / Zeelust',	'MA',	'RZ');
INSERT INTO @tbl VALUES ('Demerara-Mahaica'            ,	     'St. Cuthberts/Orange Nassau',	'DE',	'SC');
INSERT INTO @tbl VALUES ('Mahaica-Berbice'            ,	     'St. Francis Mission',	'MA',	'SF');
INSERT INTO @tbl VALUES ('Upper Takutu-Upper Essequibo'            ,	     'Sand Creek - Dadanawa, Catuna., Sawar.',	'UT',	'SC');
INSERT INTO @tbl VALUES ('Demerara-Mahaica'            ,	     'Soesdyke-Linden Highway incl. Timehri',	'DE',	'SL');
INSERT INTO @tbl VALUES ('Essequibo Island-W Demerara'            ,	     'Sparta/Bonasika + Rest of Essequebo Is.',	'ES',	'SB');
INSERT INTO @tbl VALUES ('Demerara-Mahaica'            ,	     'Suburbs of Georgetown',	'DE',	'SG');
INSERT INTO @tbl VALUES ('Pomeroon-Supenaam'            ,	     'Supernaam, Bethany and Mashabo Villages',	'PM',	'SB');
INSERT INTO @tbl VALUES ('East Berbice-Corentyne'            ,	     'Tarlogie / Maida',	'EB',	'TM');
INSERT INTO @tbl VALUES ('Demerara-Mahaica'            ,	     'Te Huist Coverden / Soesdyke',	'DE',	'TH');
INSERT INTO @tbl VALUES ('Mahaica-Berbice'            ,	     'Tempe / Seefield',	'MA',	'TS');
INSERT INTO @tbl VALUES ('Upper Takutu-Upper Essequibo'            ,	     'Toka - Jakaretinga',	'UT',	'TJ');
INSERT INTO @tbl VALUES ('Demerara-Mahaica'            ,	     'Triumph / BV',	'DE',	'TB');
INSERT INTO @tbl VALUES ('Essequibo Island-W Demerara'            ,	     'Uitvlugt / Tuschen',	'ES',	'UT');
INSERT INTO @tbl VALUES ('Barima-Waini'            ,	     'Unorganized',	'BA',	'UN');
INSERT INTO @tbl VALUES ('Cuyuni-Mazaruni'            ,	     'Unorganized',	'CU',	'UN');
INSERT INTO @tbl VALUES ('Mahaica-Berbice'            ,	     'Unorganized',	'MA',	'UN');
INSERT INTO @tbl VALUES ('Potaro-Siparuni'            ,	     'Unorganized',	'PT',	'UN');
INSERT INTO @tbl VALUES ('Upper Demerara-Berbice'            ,	     'Unorganized',	'UD',	'UN');
INSERT INTO @tbl VALUES ('Upper Takutu-Upper Essequibo'            ,	     'Unorganized',	'UT',	'UN');
INSERT INTO @tbl VALUES ('Demerara-Mahaica'            ,	     'Vereeniging / Unity',	'DE',	'VU');
INSERT INTO @tbl VALUES ('Essequibo Island-W Demerara'            ,	     'Vergenoegen / Greenwich Park',	'ES',	'VG');
INSERT INTO @tbl VALUES ('Barima-Waini'            ,	     'Waini',	'BA',	'WA');
INSERT INTO @tbl VALUES ('Essequibo Island-W Demerara'            ,	     'Wakenaam (Essequibo Is.)',	'ES',	'WE');
INSERT INTO @tbl VALUES ('Cuyuni-Mazaruni'            ,	     'Waramadan',	'CU',	'WA');
INSERT INTO @tbl VALUES ('Mahaica-Berbice'            ,	     'West Bank Berbice',	'MA',	'WB');
INSERT INTO @tbl VALUES ('East Berbice-Corentyne'            ,	     'Whim / Bloomfield',	'EB',	'WB');
INSERT INTO @tbl VALUES ('Mahaica-Berbice'            ,	     'Woodley Park / Bath',	'MA',	'WP');
INSERT INTO @tbl VALUES ('Upper Takutu-Upper Essequibo'            ,	     'Yakarinta - Wowetta, Surama',	'UT',	'YW');
INSERT INTO @tbl VALUES ('Upper Takutu-Upper Essequibo'            ,	     'Yarong Paru - Good Hope',	'UT',	'YP');
INSERT INTO @tbl VALUES ('Pomeroon-Supenaam'            ,	     'Zorg-En-Vlygt / Aberdeen',	'PM',	'ZE');

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

