
/* ==================================================================================
    	Source File		:	setup_guadeloupe_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Guadeloupe are set-up
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
WHERE	country_nm	=	'Guadeloupe';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Guadeloupe not found', 16, 1);
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

INSERT INTO @tbl VALUES ('Pointe-a-Pitre'            ,	     'Anse-Bertrand',	'PP',	'AB');
INSERT INTO @tbl VALUES ('Basse-Terre'            ,	     'Baie-Mahault',	'BT',	'BM');
INSERT INTO @tbl VALUES ('Basse-Terre'            ,	     'Baillif',	'BT',	'BA');
INSERT INTO @tbl VALUES ('Basse-Terre'            ,	     'Basse-Terre',	'BT',	'BT');
INSERT INTO @tbl VALUES ('Basse-Terre'            ,	     'Bouillante',	'BT',	'BO');
INSERT INTO @tbl VALUES ('Basse-Terre'            ,	     'Capesterre-Belle-Eau',	'BT',	'CB');
INSERT INTO @tbl VALUES ('Pointe-a-Pitre'            ,	     'Capesterre-de-Marie-Galante',	'PP',	'CM');
INSERT INTO @tbl VALUES ('Basse-Terre'            ,	     'Deshaies',	'BT',	'DE');
INSERT INTO @tbl VALUES ('Basse-Terre'            ,	     'Gourbeyre',	'BT',	'GR');
INSERT INTO @tbl VALUES ('Basse-Terre'            ,	     'Goyave',	'BT',	'GY');
INSERT INTO @tbl VALUES ('Pointe-a-Pitre'            ,	     'Grand-Bourg',	'PP',	'GB');
INSERT INTO @tbl VALUES ('Pointe-a-Pitre'            ,	     'La Desirade',	'PP',	'LD');
INSERT INTO @tbl VALUES ('Basse-Terre'            ,	     'Lamentin',	'BT',	'LT');
INSERT INTO @tbl VALUES ('Pointe-a-Pitre'            ,	     'Le Gosier',	'PP',	'LG');
INSERT INTO @tbl VALUES ('Pointe-a-Pitre'            ,	     'Le Moule',	'PP',	'LM');
INSERT INTO @tbl VALUES ('Pointe-a-Pitre'            ,	     'Les Abymes',	'PP',	'LA');
INSERT INTO @tbl VALUES ('Pointe-a-Pitre'            ,	     'Morne-a-l''Eau',	'PP',	'MO');
INSERT INTO @tbl VALUES ('Basse-Terre'            ,	     'Petit-Bourg',	'BT',	'PB');
INSERT INTO @tbl VALUES ('Pointe-a-Pitre'            ,	     'Petit-Canal',	'PP',	'PC');
INSERT INTO @tbl VALUES ('Pointe-a-Pitre'            ,	     'Pointe-a-Pitre',	'PP',	'PP');
INSERT INTO @tbl VALUES ('Basse-Terre'            ,	     'Pointe-Noire',	'BT',	'PN');
INSERT INTO @tbl VALUES ('Pointe-a-Pitre'            ,	     'Port-Louis',	'PP',	'PL');
INSERT INTO @tbl VALUES ('Basse-Terre'            ,	     'Saint-Claude',	'BT',	'SC');
INSERT INTO @tbl VALUES ('Pointe-a-Pitre'            ,	     'Sainte-Anne',	'PP',	'SA');
INSERT INTO @tbl VALUES ('Basse-Terre'            ,	     'Sainte-Rose',	'BT',	'SR');
INSERT INTO @tbl VALUES ('Pointe-a-Pitre'            ,	     'Saint-Francois',	'PP',	'SF');
INSERT INTO @tbl VALUES ('Pointe-a-Pitre'            ,	     'Saint-Louis',	'PP',	'SL');
INSERT INTO @tbl VALUES ('Basse-Terre'            ,	     'Terre-de-Bas',	'BT',	'TB');
INSERT INTO @tbl VALUES ('Basse-Terre'            ,	     'Terre-de-Haut',	'BT',	'TH');
INSERT INTO @tbl VALUES ('Basse-Terre'            ,	     'Trois-Rivieres',	'BT',	'TR');
INSERT INTO @tbl VALUES ('Basse-Terre'            ,	     'Vieux-Fort',	'BT',	'VF');
INSERT INTO @tbl VALUES ('Basse-Terre'            ,	     'Vieux-Habitants',	'BT',	'VH');

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

