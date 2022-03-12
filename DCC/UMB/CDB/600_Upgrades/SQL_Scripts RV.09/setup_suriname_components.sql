
/* ==================================================================================
    	Source File		:	setup_suriname_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Suriname are set-up
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
WHERE	country_nm	=	'Suriname';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Suriname not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'District',
		level_2_address_component	=	'Ressort',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Marowijne'            ,	     'Albina',	'MA',	'AB');
INSERT INTO @tbl VALUES ('Commewijne'            ,	     'Alkmaar',	'CM',	'AM');
INSERT INTO @tbl VALUES ('Commewijne'            ,	     'Bakkie',	'CM',	'BK');
INSERT INTO @tbl VALUES ('Paramaribo'            ,	     'Beekhuizen',	'PM',	'BH');
INSERT INTO @tbl VALUES ('Para'            ,	     'Bigi Poika',	'PR',	'BP');
INSERT INTO @tbl VALUES ('Paramaribo'            ,	     'Blauwgrond',	'PM',	'BG');
INSERT INTO @tbl VALUES ('Sipaliwini'            ,	     'Boven Coppename',	'SI',	'BC');
INSERT INTO @tbl VALUES ('Sipaliwini'            ,	     'Boven Saramacca',	'SI',	'BV');
INSERT INTO @tbl VALUES ('Sipaliwini'            ,	     'Boven Suriname',	'SI',	'BS');
INSERT INTO @tbl VALUES ('Brokopondo'            ,	     'Brownsweg',	'BR',	'BW');
INSERT INTO @tbl VALUES ('Saramacca'            ,	     'Calcutta',	'SA',	'CL');
INSERT INTO @tbl VALUES ('Para'            ,	     'Carolina',	'PR',	'CR');
INSERT INTO @tbl VALUES ('Brokopondo'            ,	     'Centrum',	'BR',	'CB');
INSERT INTO @tbl VALUES ('Paramaribo'            ,	     'Centrum',	'PM',	'CP');
INSERT INTO @tbl VALUES ('Sipaliwini'            ,	     'Coeroeni',	'SI',	'CO');
INSERT INTO @tbl VALUES ('Wanica'            ,	     'De Nieuwe Grond',	'WA',	'NG');
INSERT INTO @tbl VALUES ('Wanica'            ,	     'Domburg',	'WA',	'DO');
INSERT INTO @tbl VALUES ('Paramaribo'            ,	     'Flora',	'PM',	'FL');
INSERT INTO @tbl VALUES ('Marowijne'            ,	     'Galibi',	'MA',	'GB');
INSERT INTO @tbl VALUES ('Saramacca'            ,	     'Groningen',	'SA',	'GG');
INSERT INTO @tbl VALUES ('Nickerie'            ,	     'Groot Henar',	'NI',	'GH');
INSERT INTO @tbl VALUES ('Wanica'            ,	     'Houttuin',	'WA',	'HO');
INSERT INTO @tbl VALUES ('Saramacca'            ,	     'Jarikaba',	'SA',	'JK');
INSERT INTO @tbl VALUES ('Coronie'            ,	     'Johanna Maria',	'CR',	'JM');
INSERT INTO @tbl VALUES ('Sipaliwini'            ,	     'Kabalebo',	'SI',	'KA');
INSERT INTO @tbl VALUES ('Saramacca'            ,	     'Kampong Baroe',	'SA',	'KB');
INSERT INTO @tbl VALUES ('Brokopondo'            ,	     'Klaaskreek',	'BR',	'KK');
INSERT INTO @tbl VALUES ('Wanica'            ,	     'Koewarasan',	'WA',	'KO');
INSERT INTO @tbl VALUES ('Brokopondo'            ,	     'Kwakoegron',	'BR',	'KW');
INSERT INTO @tbl VALUES ('Wanica'            ,	     'Kwatta',	'WA',	'KT');
INSERT INTO @tbl VALUES ('Paramaribo'            ,	     'Latour',	'PM',	'LT');
INSERT INTO @tbl VALUES ('Wanica'            ,	     'Lelydorp',	'WA',	'LD');
INSERT INTO @tbl VALUES ('Paramaribo'            ,	     'Livorno',	'PM',	'LV');
INSERT INTO @tbl VALUES ('Commewijne'            ,	     'Margaretha',	'CM',	'MG');
INSERT INTO @tbl VALUES ('Brokopondo'            ,	     'Marshallkreek',	'BR',	'MK');
INSERT INTO @tbl VALUES ('Commewijne'            ,	     'Meerzorg',	'CM',	'MZ');
INSERT INTO @tbl VALUES ('Marowijne'            ,	     'Moengo',	'MA',	'MO');
INSERT INTO @tbl VALUES ('Marowijne'            ,	     'Moengotapoe',	'MA',	'MT');
INSERT INTO @tbl VALUES ('Paramaribo'            ,	     'Munder',	'PM',	'MU');
INSERT INTO @tbl VALUES ('Commewijne'            ,	     'Nieuw Amsterdam',	'CM',	'NA');
INSERT INTO @tbl VALUES ('Nickerie'            ,	     'Nieuw Nickerie',	'NI',	'NN');
INSERT INTO @tbl VALUES ('Para'            ,	     'Noord',	'PR',	'ND');
INSERT INTO @tbl VALUES ('Para'            ,	     'Oost',	'PR',	'OS');
INSERT INTO @tbl VALUES ('Nickerie'            ,	     'Oostelijke Polders',	'NI',	'OP');
INSERT INTO @tbl VALUES ('Marowijne'            ,	     'Patamacca',	'MA',	'PM');
INSERT INTO @tbl VALUES ('Paramaribo'            ,	     'Pontbuiten',	'PM',	'PB');
INSERT INTO @tbl VALUES ('Paramaribo'            ,	     'Rainville',	'PM',	'RA');
INSERT INTO @tbl VALUES ('Brokopondo'            ,	     'Sarakreek',	'BR',	'SK');
INSERT INTO @tbl VALUES ('Wanica'            ,	     'Saramacca Polder',	'WA',	'SP');
INSERT INTO @tbl VALUES ('Commewijne'            ,	     'Tamanredjo',	'CM',	'TR');
INSERT INTO @tbl VALUES ('Paramaribo'            ,	     'Tammenga',	'PM',	'TG');
INSERT INTO @tbl VALUES ('Sipaliwini'            ,	     'Tapanahony',	'SI',	'TP');
INSERT INTO @tbl VALUES ('Saramacca'            ,	     'Tijgerkreek',	'SA',	'TK');
INSERT INTO @tbl VALUES ('Coronie'            ,	     'Totness',	'CR',	'TN');
INSERT INTO @tbl VALUES ('Nickerie'            ,	     'Wageningen',	'NI',	'WN');
INSERT INTO @tbl VALUES ('Marowijne'            ,	     'Wanhatti',	'MA',	'WH');
INSERT INTO @tbl VALUES ('Saramacca'            ,	     'Wayamboweg',	'SA',	'WY');
INSERT INTO @tbl VALUES ('Paramaribo'            ,	     'Weg naar See',	'PM',	'WS');
INSERT INTO @tbl VALUES ('Coronie'            ,	     'Welgelegen',	'CR',	'WL');
INSERT INTO @tbl VALUES ('Paramaribo'            ,	     'Welgelegen',	'PM',	'WG');
INSERT INTO @tbl VALUES ('Nickerie'            ,	     'Westelijke Polders',	'NI',	'WP');
INSERT INTO @tbl VALUES ('Para'            ,	     'Zuid',	'PR',	'ZD');

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

