
/* ==================================================================================
    	Source File		:	setup_reunion_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Reunion are set-up
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
WHERE	country_nm	=	'Reunion';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Reunion not found', 16, 1);
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

INSERT INTO @tbl VALUES ('Saint-Benoit'            ,	     'Bras-Panon',	'BN',	'BP');
INSERT INTO @tbl VALUES ('Saint-Pierre'            ,	     'Cilaos',	'PI',	'CI');
INSERT INTO @tbl VALUES ('Saint-Benoit'            ,	     'La Plaine-des-Palmistes',	'BN',	'PP');
INSERT INTO @tbl VALUES ('Saint-Paul'            ,	     'La Possession',	'PA',	'PS');
INSERT INTO @tbl VALUES ('Saint-Pierre'            ,	     'L''Entre-Deux',	'PI',	'ED');
INSERT INTO @tbl VALUES ('Saint-Paul'            ,	     'Le Port',	'PA',	'PO');
INSERT INTO @tbl VALUES ('Saint-Pierre'            ,	     'Les Avirons',	'PI',	'AV');
INSERT INTO @tbl VALUES ('Saint-Paul'            ,	     'Les Trois-Bassins',	'PA',	'TB');
INSERT INTO @tbl VALUES ('Saint-Pierre'            ,	     'Le Tampon',	'PI',	'TA');
INSERT INTO @tbl VALUES ('Saint-Pierre'            ,	     'L''Etang-Sale',	'PI',	'ES');
INSERT INTO @tbl VALUES ('Saint-Pierre'            ,	     'Petite-Ile',	'PI',	'PI');
INSERT INTO @tbl VALUES ('Saint-Benoit'            ,	     'Saint-Andre',	'BN',	'AN');
INSERT INTO @tbl VALUES ('Saint-Benoit'            ,	     'Saint-Benoit',	'BN',	'BN');
INSERT INTO @tbl VALUES ('Saint-Denis'            ,	     'Saint-Denis',	'DE',	'DN');
INSERT INTO @tbl VALUES ('Saint-Denis'            ,	     'Sainte-Marie',	'DE',	'MA');
INSERT INTO @tbl VALUES ('Saint-Benoit'            ,	     'Sainte-Rose',	'BN',	'RO');
INSERT INTO @tbl VALUES ('Saint-Denis'            ,	     'Sainte-Suzanne',	'DE',	'SU');
INSERT INTO @tbl VALUES ('Saint-Pierre'            ,	     'Saint-Joseph',	'PI',	'JO');
INSERT INTO @tbl VALUES ('Saint-Paul'            ,	     'Saint-Leu',	'PA',	'LE');
INSERT INTO @tbl VALUES ('Saint-Pierre'            ,	     'Saint-Louis',	'PI',	'LO');
INSERT INTO @tbl VALUES ('Saint-Paul'            ,	     'Saint-Paul',	'PA',	'PL');
INSERT INTO @tbl VALUES ('Saint-Pierre'            ,	     'Saint-Philippe',	'PI',	'PH');
INSERT INTO @tbl VALUES ('Saint-Pierre'            ,	     'Saint-Pierre',	'PI',	'PR');
INSERT INTO @tbl VALUES ('Saint-Benoit'            ,	     'Salazie',	'BN',	'SA');

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

