
/* ==================================================================================
    	Source File		:	setup_martinique_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Martinique are set-up
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
WHERE	country_nm	=	'Martinique';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Martinique not found', 16, 1);
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

INSERT INTO @tbl VALUES ('Trinite'            ,	     'Basse-Pointe',	'TR',	'BP');
INSERT INTO @tbl VALUES ('Saint-Pierre'            ,	     'Bellefontaine',	'SP',	'BF');
INSERT INTO @tbl VALUES ('Saint-Pierre'            ,	     'Case-Pilote',	'SP',	'CP');
INSERT INTO @tbl VALUES ('Marin'            ,	     'Ducos',	'MA',	'DU');
INSERT INTO @tbl VALUES ('Saint-Pierre'            ,	     'Fonds-Saint-Denis',	'SP',	'FS');
INSERT INTO @tbl VALUES ('Fort-de-France'            ,	     'Fort-de-France',	'FF',	'FF');
INSERT INTO @tbl VALUES ('Trinite'            ,	     'Grand''Riviere',	'TR',	'GR');
INSERT INTO @tbl VALUES ('Trinite'            ,	     'Gros-Morne',	'TR',	'GM');
INSERT INTO @tbl VALUES ('Trinite'            ,	     'L''Ajoupa-Bouillon',	'TR',	'AB');
INSERT INTO @tbl VALUES ('Trinite'            ,	     'La Trinite',	'TR',	'TR');
INSERT INTO @tbl VALUES ('Saint-Pierre'            ,	     'Le Carbet',	'SP',	'CA');
INSERT INTO @tbl VALUES ('Marin'            ,	     'Le Diamant',	'MA',	'DI');
INSERT INTO @tbl VALUES ('Marin'            ,	     'Le Francois',	'MA',	'FR');
INSERT INTO @tbl VALUES ('Fort-de-France'            ,	     'Le Lamentin',	'FF',	'LA');
INSERT INTO @tbl VALUES ('Trinite'            ,	     'Le Lorrain',	'TR',	'LO');
INSERT INTO @tbl VALUES ('Trinite'            ,	     'Le Marigot',	'TR',	'MG');
INSERT INTO @tbl VALUES ('Marin'            ,	     'Le Marin',	'MA',	'MN');
INSERT INTO @tbl VALUES ('Saint-Pierre'            ,	     'Le Morne-Rouge',	'SP',	'MR');
INSERT INTO @tbl VALUES ('Saint-Pierre'            ,	     'Le Morne-Vert',	'SP',	'MV');
INSERT INTO @tbl VALUES ('Saint-Pierre'            ,	     'Le Precheur',	'SP',	'PR');
INSERT INTO @tbl VALUES ('Trinite'            ,	     'Le Robert',	'TR',	'RO');
INSERT INTO @tbl VALUES ('Marin'            ,	     'Les Anses-d''Arlet',	'MA',	'AA');
INSERT INTO @tbl VALUES ('Marin'            ,	     'Les Trois-Ilets',	'MA',	'TI');
INSERT INTO @tbl VALUES ('Marin'            ,	     'Le Vauclin',	'MA',	'VA');
INSERT INTO @tbl VALUES ('Trinite'            ,	     'Macouba',	'TR',	'MC');
INSERT INTO @tbl VALUES ('Marin'            ,	     'Riviere-Pilote',	'MA',	'RP');
INSERT INTO @tbl VALUES ('Marin'            ,	     'Riviere-Salee',	'MA',	'RS');
INSERT INTO @tbl VALUES ('Marin'            ,	     'Sainte-Anne',	'MA',	'SA');
INSERT INTO @tbl VALUES ('Marin'            ,	     'Sainte-Luce',	'MA',	'SL');
INSERT INTO @tbl VALUES ('Trinite'            ,	     'Sainte-Marie',	'TR',	'SM');
INSERT INTO @tbl VALUES ('Marin'            ,	     'Saint-Esprit',	'MA',	'SE');
INSERT INTO @tbl VALUES ('Fort-de-France'            ,	     'Saint-Joseph',	'FF',	'SJ');
INSERT INTO @tbl VALUES ('Saint-Pierre'            ,	     'Saint-Pierre',	'SP',	'SP');
INSERT INTO @tbl VALUES ('Fort-de-France'            ,	     'Schoelcher',	'FF',	'SC');

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

