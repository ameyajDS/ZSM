/* ==================================================================================
    Source File		:	setup_new_zealand_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	Sat Oct 06 12:05 2014
	Module ID		:	CDB
	Last updated	:	Oct 0, 2014
	==================================================================================
																		   Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of New Zealand are set-up
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
WHERE	country_nm	=	'New Zealand';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country New Zealand not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Region',
		level_2_address_component	=	'District'
WHERE	country_id	=	@country_id;

/*	 These statements should NOT be uncommented; and should be used with extreme caution
DELETE	l3
FROM	level_3_address_components	l3
	JOIN	level_2_address_components	l2
		ON	(	l2.level_2_address_component_id	=	l3.level_2_address_component_id
			)
	JOIN	level_1_address_components	l1
		ON	(	l1.level_1_address_component_id	=	l2.level_1_address_component_id
			AND	l1.country_id	=	@country_id
			);

DELETE	l2
FROM	level_2_address_components	l2
	JOIN	level_1_address_components	l1
		ON	(	l1.level_1_address_component_id	=	l2.level_1_address_component_id
			AND	l1.country_id	=	@country_id
			);


DELETE	level_1_address_components
WHERE	country_id	=	@country_id;
*/

-- ======================================================================

DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50) PRIMARY KEY, level_1_cd varchar (5) UNIqUE);


INSERT INTO @tbl VALUES ('Auckland',	'AU');
INSERT INTO @tbl VALUES ('Bay of Plenty',	'BP');
INSERT INTO @tbl VALUES ('Canterbury',	'CA');
INSERT INTO @tbl VALUES ('Chatham Islands',	'CI');
INSERT INTO @tbl VALUES ('Gisborne',	'GI');
INSERT INTO @tbl VALUES ('Hawke''s Bay',	'HB');
INSERT INTO @tbl VALUES ('Manawatu-Wanganui',	'MW');
INSERT INTO @tbl VALUES ('Marlborough',	'MA');
INSERT INTO @tbl VALUES ('Nelson',	'NE');
INSERT INTO @tbl VALUES ('Northland',	'NO');
INSERT INTO @tbl VALUES ('Otago',	'OT');
INSERT INTO @tbl VALUES ('Southland',	'SO');
INSERT INTO @tbl VALUES ('Taranaki',	'TK');
INSERT INTO @tbl VALUES ('Tasman',	'TS');
INSERT INTO @tbl VALUES ('Waikato',	'WK');
INSERT INTO @tbl VALUES ('Wellington',	'WG');
INSERT INTO @tbl VALUES ('West Coast',	'WC');

INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) 
	SELECT	@country_id, level_1_nm, level_1_cd
	FROM	@tbl;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl2	TABLE	(	level_2_nm	VARCHAR (50), level_1_nm varchar (50), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_nm, level_2_cd));


INSERT INTO @tbl2 VALUES ('Ashburton',	'Canterbury',	'AB');
INSERT INTO @tbl2 VALUES ('Auckland',	'Auckland',	'AL');
INSERT INTO @tbl2 VALUES ('Banks Peninsula',	'Canterbury',	'BK');
INSERT INTO @tbl2 VALUES ('Buller',	'West Coast',	'BU');
INSERT INTO @tbl2 VALUES ('Carterton',	'Wellington',	'CR');
INSERT INTO @tbl2 VALUES ('Central Hawke''s Bay',	'Hawke''s Bay',	'CH');
INSERT INTO @tbl2 VALUES ('Central Otago',	'Otago',	'CO');
INSERT INTO @tbl2 VALUES ('Chatham Islands',	'Chatham Islands',	'CT');
INSERT INTO @tbl2 VALUES ('Christchurch',	'Canterbury',	'CC');
INSERT INTO @tbl2 VALUES ('Clutha',	'Otago',	'CL');
INSERT INTO @tbl2 VALUES ('Dunedin',	'Otago',	'DU');
INSERT INTO @tbl2 VALUES ('Far North',	'Northland',	'FN');
INSERT INTO @tbl2 VALUES ('Franklin',	'Waikato',	'FK');
INSERT INTO @tbl2 VALUES ('Gisborne',	'Gisborne',	'GB');
INSERT INTO @tbl2 VALUES ('Gore',	'Southland',	'GO');
INSERT INTO @tbl2 VALUES ('Grey',	'West Coast',	'GR');
INSERT INTO @tbl2 VALUES ('Hamilton',	'Waikato',	'HM');
INSERT INTO @tbl2 VALUES ('Hastings',	'Hawke''s Bay',	'HS');
INSERT INTO @tbl2 VALUES ('Hauraki',	'Waikato',	'HK');
INSERT INTO @tbl2 VALUES ('Horowhenua',	'Manawatu-Wanganui',	'HW');
INSERT INTO @tbl2 VALUES ('Hurunui',	'Canterbury',	'HN');
INSERT INTO @tbl2 VALUES ('Invercargill',	'Southland',	'IC');
INSERT INTO @tbl2 VALUES ('Kaikoura',	'Canterbury',	'KK');
INSERT INTO @tbl2 VALUES ('Kaipara',	'Northland',	'KP');
INSERT INTO @tbl2 VALUES ('Kapiti Coast',	'Wellington',	'KC');
INSERT INTO @tbl2 VALUES ('Kawerau',	'Bay of Plenty',	'KW');
INSERT INTO @tbl2 VALUES ('Lower Hutt',	'Wellington',	'LH');
INSERT INTO @tbl2 VALUES ('Mackenzie',	'Canterbury',	'MZ');
INSERT INTO @tbl2 VALUES ('Manawatu',	'Manawatu-Wanganui',	'MN');
INSERT INTO @tbl2 VALUES ('Manukau',	'Auckland',	'MK');
INSERT INTO @tbl2 VALUES ('Marlborough',	'Marlborough',	'MB');
INSERT INTO @tbl2 VALUES ('Masterton',	'Wellington',	'MT');
INSERT INTO @tbl2 VALUES ('Matamata-Piako',	'Waikato',	'MP');
INSERT INTO @tbl2 VALUES ('Napier',	'Hawke''s Bay',	'NR');
INSERT INTO @tbl2 VALUES ('Nelson',	'Nelson',	'NL');
INSERT INTO @tbl2 VALUES ('New Plymouth',	'Taranaki',	'NP');
INSERT INTO @tbl2 VALUES ('North Shore',	'Auckland',	'NS');
INSERT INTO @tbl2 VALUES ('Opotiki',	'Bay of Plenty',	'OP');
INSERT INTO @tbl2 VALUES ('Otorohanga',	'Waikato',	'OH');
INSERT INTO @tbl2 VALUES ('Palmerston North',	'Manawatu-Wanganui',	'PN');
INSERT INTO @tbl2 VALUES ('Papakura',	'Auckland',	'PP');
INSERT INTO @tbl2 VALUES ('Porirua',	'Wellington',	'PR');
INSERT INTO @tbl2 VALUES ('Queenstown-Lakes',	'Otago',	'QL');
INSERT INTO @tbl2 VALUES ('Rangitikei',	'Manawatu-Wanganui',	'RT');
INSERT INTO @tbl2 VALUES ('Rodney',	'Auckland',	'RD');
INSERT INTO @tbl2 VALUES ('Rotorua',	'Waikato',	'RR');
INSERT INTO @tbl2 VALUES ('Ruapehu',	'Manawatu-Wanganui',	'RP');
INSERT INTO @tbl2 VALUES ('Selwyn',	'Canterbury',	'SY');
INSERT INTO @tbl2 VALUES ('Southland',	'Southland',	'SL');
INSERT INTO @tbl2 VALUES ('South Taranaki',	'Taranaki',	'ST');
INSERT INTO @tbl2 VALUES ('South Waikato',	'Waikato',	'SW');
INSERT INTO @tbl2 VALUES ('South Wairarapa',	'Wellington',	'SP');
INSERT INTO @tbl2 VALUES ('Stratford',	'Manawatu-Wanganui',	'SF');
INSERT INTO @tbl2 VALUES ('Tararua',	'Wellington',	'TR');
INSERT INTO @tbl2 VALUES ('Tasman',	'Tasman',	'TM');
INSERT INTO @tbl2 VALUES ('Taupo',	'Waikato',	'TP');
INSERT INTO @tbl2 VALUES ('Tauranga',	'Bay of Plenty',	'TG');
INSERT INTO @tbl2 VALUES ('Thames-Coromandel',	'Waikato',	'TC');
INSERT INTO @tbl2 VALUES ('Timaru',	'Canterbury',	'TU');
INSERT INTO @tbl2 VALUES ('Upper Hutt',	'Wellington',	'UH');
INSERT INTO @tbl2 VALUES ('Waikato',	'Waikato',	'WT');
INSERT INTO @tbl2 VALUES ('Waimakariri',	'Canterbury',	'WR');
INSERT INTO @tbl2 VALUES ('Waimate',	'Canterbury',	'WM');
INSERT INTO @tbl2 VALUES ('Waipa',	'Waikato',	'WP');
INSERT INTO @tbl2 VALUES ('Wairoa',	'Hawke''s Bay',	'WW');
INSERT INTO @tbl2 VALUES ('Waitakere',	'Auckland',	'WA');
INSERT INTO @tbl2 VALUES ('Waitaki',	'Otago',	'WI');
INSERT INTO @tbl2 VALUES ('Waitomo',	'Waikato',	'WO');
INSERT INTO @tbl2 VALUES ('Wanganui',	'Manawatu-Wanganui',	'WU');
INSERT INTO @tbl2 VALUES ('Wellington',	'Wellington',	'WE');
INSERT INTO @tbl2 VALUES ('Western Bay of Plenty',	'Bay of Plenty',	'WB');
INSERT INTO @tbl2 VALUES ('Westland',	'West Coast',	'WL');
INSERT INTO @tbl2 VALUES ('Whakatane',	'Bay of Plenty',	'WH');
INSERT INTO @tbl2 VALUES ('Whangarei',	'Northland',	'WN');

SET NOCOUNT OFF

INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	level_2_nm, level_2_cd, level_1_address_component_id
	FROM	@tbl2	t
		LEFT JOIN	level_1_address_components	l1
			ON	(	l1.level_1_address_component_nm	=	t.level_1_nm
				AND	l1.country_id					=	@country_id
				)
--		where level_1_address_component_id is null


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


