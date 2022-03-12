
/* ==================================================================================
    	Source File		:	setup_niger_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Niger are set-up
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
WHERE	country_nm	=	'Niger';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Niger not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Region',
		level_2_address_component	=	'Department',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Tahoua'            ,	     'Abalak',	'TH',	'AB');
INSERT INTO @tbl VALUES ('Maradi'            ,	     'Aguie',	'MA',	'AG');
INSERT INTO @tbl VALUES ('Agadez'            ,	     'Arlit',	'AG',	'AR');
INSERT INTO @tbl VALUES ('Agadez'            ,	     'Bilma',	'AG',	'BL');
INSERT INTO @tbl VALUES ('Tahoua'            ,	     'Birni-N''Konni',	'TH',	'BK');
INSERT INTO @tbl VALUES ('Dosso'            ,	     'Boboye',	'DS',	'BG');
INSERT INTO @tbl VALUES ('Tahoua'            ,	     'Bouza',	'TH',	'BZ');
INSERT INTO @tbl VALUES ('Maradi'            ,	     'Dakoro',	'MA',	'DK');
INSERT INTO @tbl VALUES ('Diffa'            ,	     'Diffa',	'DF',	'DF');
INSERT INTO @tbl VALUES ('Dosso'            ,	     'Dogondoutchi',	'DS',	'DD');
INSERT INTO @tbl VALUES ('Dosso'            ,	     'Dosso',	'DS',	'DS');
INSERT INTO @tbl VALUES ('Tillaberi'            ,	     'Filingue',	'TL',	'FI');
INSERT INTO @tbl VALUES ('Dosso'            ,	     'Gaya',	'DS',	'GA');
INSERT INTO @tbl VALUES ('Zinder'            ,	     'Goure',	'ZI',	'GO');
INSERT INTO @tbl VALUES ('Maradi'            ,	     'Guidan-Roumdji',	'MA',	'GR');
INSERT INTO @tbl VALUES ('Tahoua'            ,	     'Illela',	'TH',	'IL');
INSERT INTO @tbl VALUES ('Zinder'            ,	     'Kantche',	'ZI',	'MT');
INSERT INTO @tbl VALUES ('Tahoua'            ,	     'Keita',	'TH',	'KE');
INSERT INTO @tbl VALUES ('Tillaberi'            ,	     'Kollo',	'TL',	'KO');
INSERT INTO @tbl VALUES ('Dosso'            ,	     'Loga',	'DS',	'LO');
INSERT INTO @tbl VALUES ('Tahoua'            ,	     'Madaoua',	'TH',	'MD');
INSERT INTO @tbl VALUES ('Maradi'            ,	     'Madarounfa',	'MA',	'MF');
INSERT INTO @tbl VALUES ('Zinder'            ,	     'Magaria',	'ZI',	'MG');
INSERT INTO @tbl VALUES ('Diffa'            ,	     'Maine-Soroa',	'DF',	'MS');
INSERT INTO @tbl VALUES ('Maradi'            ,	     'Mayahi',	'MA',	'MY');
INSERT INTO @tbl VALUES ('Zinder'            ,	     'Mirriah',	'ZI',	'MR');
INSERT INTO @tbl VALUES ('Diffa'            ,	     'N''Guigmi',	'DF',	'NG');
INSERT INTO @tbl VALUES ('Niamey'            ,	     'Niamey',	'NI',	'NI');
INSERT INTO @tbl VALUES ('Tillaberi'            ,	     'Ouallam',	'TL',	'OU');
INSERT INTO @tbl VALUES ('Tillaberi'            ,	     'Say',	'TL',	'SA');
INSERT INTO @tbl VALUES ('Tahoua'            ,	     'Tahoua',	'TH',	'TH');
INSERT INTO @tbl VALUES ('Zinder'            ,	     'Tanout',	'ZI',	'TN');
INSERT INTO @tbl VALUES ('Tahoua'            ,	     'Tchin-Tabaraden',	'TH',	'TC');
INSERT INTO @tbl VALUES ('Agadez'            ,	     'Tchirozerine',	'AG',	'AD');
INSERT INTO @tbl VALUES ('Tillaberi'            ,	     'Tera',	'TL',	'TR');
INSERT INTO @tbl VALUES ('Maradi'            ,	     'Tessaoua',	'MA',	'TS');
INSERT INTO @tbl VALUES ('Tillaberi'            ,	     'Tillaberi',	'TL',	'TL');

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

