
/* ==================================================================================
    	Source File		:	setup_lebanon_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Lebanon are set-up
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
WHERE	country_nm	=	'Lebanon';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Lebanon not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Province',
		level_2_address_component	=	'County',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Aakkar'            ,	     'Akkar',	'AA',	'AK');
INSERT INTO @tbl VALUES ('Mount Lebanon'            ,	     'Aley',	'JL',	'AL');
INSERT INTO @tbl VALUES ('Mount Lebanon'            ,	     'Baabda',	'JL',	'BD');
INSERT INTO @tbl VALUES ('Baalbek-Hermel'            ,	     'Baalbek',	'BH',	'BB');
INSERT INTO @tbl VALUES ('North Lebanon'            ,	     'Batroun',	'NL',	'BT');
INSERT INTO @tbl VALUES ('North Lebanon'            ,	     'Bcharre',	'NL',	'BC');
INSERT INTO @tbl VALUES ('Beirut'            ,	     'Beirut',	'BA',	'BA');
INSERT INTO @tbl VALUES ('Beqaa'            ,	     'Bekaa-West',	'BQ',	'BW');
INSERT INTO @tbl VALUES ('An Nabatiyah'            ,	     'Bent Jbayl',	'NA',	'BJ');
INSERT INTO @tbl VALUES ('Mount Lebanon'            ,	     'Chouf',	'JL',	'CH');
INSERT INTO @tbl VALUES ('An Nabatiyah'            ,	     'Hasbaya',	'NA',	'HA');
INSERT INTO @tbl VALUES ('Baalbek-Hermel'            ,	     'Hermel',	'BH',	'HE');
INSERT INTO @tbl VALUES ('Mount Lebanon'            ,	     'Jbayl',	'JL',	'JB');
INSERT INTO @tbl VALUES ('South Lebanon'            ,	     'Jezzine',	'JA',	'JE');
INSERT INTO @tbl VALUES ('Mount Lebanon'            ,	     'Kesrouan',	'JL',	'KE');
INSERT INTO @tbl VALUES ('North Lebanon'            ,	     'Koura',	'NL',	'KO');
INSERT INTO @tbl VALUES ('An Nabatiyah'            ,	     'Marjayoun',	'NA',	'MJ');
INSERT INTO @tbl VALUES ('Mount Lebanon'            ,	     'Matn',	'JL',	'MT');
INSERT INTO @tbl VALUES ('North Lebanon'            ,	     'Minie-Danniyeh',	'NL',	'MD');
INSERT INTO @tbl VALUES ('An Nabatiyah'            ,	     'Nabatiyeh',	'NA',	'NA');
INSERT INTO @tbl VALUES ('Beqaa'            ,	     'Rachaya',	'BQ',	'RA');
INSERT INTO @tbl VALUES ('South Lebanon'            ,	     'Saida',	'JA',	'SA');
INSERT INTO @tbl VALUES ('South Lebanon'            ,	     'Sour',	'JA',	'SU');
INSERT INTO @tbl VALUES ('North Lebanon'            ,	     'Tripoli',	'NL',	'TR');
INSERT INTO @tbl VALUES ('Beqaa'            ,	     'Zahle',	'BQ',	'ZA');
INSERT INTO @tbl VALUES ('North Lebanon'            ,	     'Zgharta',	'NL',	'ZG');

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

