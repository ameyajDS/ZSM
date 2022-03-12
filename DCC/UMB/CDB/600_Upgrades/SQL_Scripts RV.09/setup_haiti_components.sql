
/* ==================================================================================
    	Source File		:	setup_haiti_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Haiti are set-up
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
WHERE	country_nm	=	'Haiti';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Haiti not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Department',
		level_2_address_component	=	'Arrondissement',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Nord'            ,	     'l''Acul-du-Nord',	'ND',	'AN');
INSERT INTO @tbl VALUES ('Nippes'            ,	     'l''Anse-a-Veau',	'NI',	'AV');
INSERT INTO @tbl VALUES ('Grand'' Anse'            ,	     'Anse d''Hainault',	'GR',	'AH');
INSERT INTO @tbl VALUES ('Sud'            ,	     'Aquin',	'SD',	'AQ');
INSERT INTO @tbl VALUES ('Ouest'            ,	     'l''Arcahaie',	'OU',	'AR');
INSERT INTO @tbl VALUES ('Sud-Est'            ,	     'Bainet',	'SE',	'BT');
INSERT INTO @tbl VALUES ('Nippes'            ,	     'Baraderes',	'NI',	'BR');
INSERT INTO @tbl VALUES ('Sud-Est'            ,	     'Belle-Anse',	'SE',	'BA');
INSERT INTO @tbl VALUES ('Nord'            ,	     'Borgne',	'ND',	'BG');
INSERT INTO @tbl VALUES ('Nord'            ,	     'le Cap-Haitien',	'ND',	'CH');
INSERT INTO @tbl VALUES ('Sud'            ,	     'les Cayes',	'SD',	'CY');
INSERT INTO @tbl VALUES ('Centre'            ,	     'Cerca la Source',	'CE',	'CS');
INSERT INTO @tbl VALUES ('Sud'            ,	     'les Chardonnieres',	'SD',	'CR');
INSERT INTO @tbl VALUES ('Grand'' Anse'            ,	     'Corail',	'GR',	'CL');
INSERT INTO @tbl VALUES ('Sud'            ,	     'les Coteaux',	'SD',	'CX');
INSERT INTO @tbl VALUES ('Ouest'            ,	     'Croix-des-Bouquets',	'OU',	'CB');
INSERT INTO @tbl VALUES ('L''Artibonite'            ,	     'Dessalines',	'AR',	'DS');
INSERT INTO @tbl VALUES ('Nord-Est'            ,	     'Fort-Liberte',	'NE',	'FL');
INSERT INTO @tbl VALUES ('L''Artibonite'            ,	     'les Gonaives',	'AR',	'GV');
INSERT INTO @tbl VALUES ('Nord'            ,	     'Grande-Riviere du Nord',	'ND',	'GR');
INSERT INTO @tbl VALUES ('L''Artibonite'            ,	     'Gros-Morne',	'AR',	'GM');
INSERT INTO @tbl VALUES ('Centre'            ,	     'Hinche',	'CE',	'HI');
INSERT INTO @tbl VALUES ('Sud-Est'            ,	     'Jacmel',	'SE',	'JC');
INSERT INTO @tbl VALUES ('Grand'' Anse'            ,	     'Jeremie',	'GR',	'JR');
INSERT INTO @tbl VALUES ('Ouest'            ,	     'La Gonave',	'OU',	'LG');
INSERT INTO @tbl VALUES ('Centre'            ,	     'Lascahobas',	'CE',	'LC');
INSERT INTO @tbl VALUES ('Ouest'            ,	     'Leogane',	'OU',	'LN');
INSERT INTO @tbl VALUES ('Nord'            ,	     'le Limbe',	'ND',	'LL');
INSERT INTO @tbl VALUES ('L''Artibonite'            ,	     'Marmelade',	'AR',	'MM');
INSERT INTO @tbl VALUES ('Nippes'            ,	     'Miragoane',	'NI',	'MG');
INSERT INTO @tbl VALUES ('Centre'            ,	     'Mirebalais',	'CE',	'MB');
INSERT INTO @tbl VALUES ('Nord-Ouest'            ,	     'Mole Saint-Nicolas',	'NO',	'MS');
INSERT INTO @tbl VALUES ('Nord-Est'            ,	     'Ouanaminthe',	'NE',	'OU');
INSERT INTO @tbl VALUES ('Nord'            ,	     'Plaisance',	'ND',	'PL');
INSERT INTO @tbl VALUES ('Ouest'            ,	     'Port-au-Prince',	'OU',	'PP');
INSERT INTO @tbl VALUES ('Nord-Ouest'            ,	     'Port-de-Paix',	'NO',	'PD');
INSERT INTO @tbl VALUES ('Sud'            ,	     'Port-Salut',	'SD',	'PS');
INSERT INTO @tbl VALUES ('Nord-Ouest'            ,	     'Saint-Louis du Nord',	'NO',	'SL');
INSERT INTO @tbl VALUES ('L''Artibonite'            ,	     'Saint-Marc',	'AR',	'SM');
INSERT INTO @tbl VALUES ('Nord'            ,	     'Saint-Raphael',	'ND',	'SR');
INSERT INTO @tbl VALUES ('Nord-Est'            ,	     'le Trou-du-Nord',	'NE',	'TN');
INSERT INTO @tbl VALUES ('Nord-Est'            ,	     'Vallieres',	'NE',	'VR');

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

