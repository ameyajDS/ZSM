
/* ==================================================================================
    	Source File		:	setup_french_guiana_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of French_Guiana are set-up
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
WHERE	country_nm	=	'French Guiana';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country French Guiana not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Arrondissement',
		level_2_address_component	=	'Commune',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Saint-Laurent-du-Maroni'            ,	     'Apatou',	'SL',	'AP');
INSERT INTO @tbl VALUES ('Saint-Laurent-du-Maroni'            ,	     'Awala-Yalimapo',	'SL',	'AY');
INSERT INTO @tbl VALUES ('Cayenne'            ,	     'Camopi',	'CY',	'CM');
INSERT INTO @tbl VALUES ('Cayenne'            ,	     'Cayenne',	'CY',	'CY');
INSERT INTO @tbl VALUES ('Saint-Laurent-du-Maroni'            ,	     'Grand-Santi',	'SL',	'GS');
INSERT INTO @tbl VALUES ('Cayenne'            ,	     'Iracoubo',	'CY',	'IR');
INSERT INTO @tbl VALUES ('Cayenne'            ,	     'Kourou',	'CY',	'KR');
INSERT INTO @tbl VALUES ('Cayenne'            ,	     'Macouria',	'CY',	'MC');
INSERT INTO @tbl VALUES ('Saint-Laurent-du-Maroni'            ,	     'Mana',	'SL',	'MN');
INSERT INTO @tbl VALUES ('Saint-Laurent-du-Maroni'            ,	     'Maripasoula',	'SL',	'MP');
INSERT INTO @tbl VALUES ('Cayenne'            ,	     'Matoury',	'CY',	'MY');
INSERT INTO @tbl VALUES ('Cayenne'            ,	     'Montsinery-Tonnegrande',	'CY',	'MT');
INSERT INTO @tbl VALUES ('Cayenne'            ,	     'Ouanary',	'CY',	'OU');
INSERT INTO @tbl VALUES ('Saint-Laurent-du-Maroni'            ,	     'Papaichton',	'SL',	'PA');
INSERT INTO @tbl VALUES ('Cayenne'            ,	     'Regina',	'CY',	'RK');
INSERT INTO @tbl VALUES ('Cayenne'            ,	     'Remire-Montjoly',	'CY',	'RM');
INSERT INTO @tbl VALUES ('Cayenne'            ,	     'Roura',	'CY',	'RO');
INSERT INTO @tbl VALUES ('Cayenne'            ,	     'Saint-Elie',	'CY',	'SE');
INSERT INTO @tbl VALUES ('Cayenne'            ,	     'Saint-Georges',	'CY',	'SG');
INSERT INTO @tbl VALUES ('Saint-Laurent-du-Maroni'            ,	     'Saint-Laurent-du-Maroni',	'SL',	'SL');
INSERT INTO @tbl VALUES ('Saint-Laurent-du-Maroni'            ,	     'Saul',	'SL',	'SA');
INSERT INTO @tbl VALUES ('Cayenne'            ,	     'Sinnamary',	'CY',	'SI');

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

