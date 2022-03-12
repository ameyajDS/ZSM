
/* ==================================================================================
    	Source File		:	setup_faroe_islands_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Faroe_Islands are set-up
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
WHERE	country_nm	=	'Faroe Islands';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Faroe Islands not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Region',
		level_2_address_component	=	'Commune',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Ostero'            ,	     'Eidi',	'OS',	'EI');
INSERT INTO @tbl VALUES ('Sudero'            ,	     'Famjin',	'SU',	'FA');
INSERT INTO @tbl VALUES ('Ostero'            ,	     'Fuglafjordur',	'OS',	'FF');
INSERT INTO @tbl VALUES ('Norderoerne'            ,	     'Fugloy',	'NO',	'FU');
INSERT INTO @tbl VALUES ('Ostero'            ,	     'Funningur',	'OS',	'FD');
INSERT INTO @tbl VALUES ('Ostero'            ,	     'Gota',	'OS',	'GO');
INSERT INTO @tbl VALUES ('Sudero'            ,	     'Hov',	'SU',	'HO');
INSERT INTO @tbl VALUES ('Norderoerne'            ,	     'Husar',	'NO',	'HU');
INSERT INTO @tbl VALUES ('Sando'            ,	     'Husavik',	'SA',	'HU');
INSERT INTO @tbl VALUES ('Sudero'            ,	     'Hvalbour',	'SU',	'HV');
INSERT INTO @tbl VALUES ('Norderoerne'            ,	     'Hvannasund',	'NO',	'HV');
INSERT INTO @tbl VALUES ('Norderoerne'            ,	     'Klaksvik',	'NO',	'KK');
INSERT INTO @tbl VALUES ('Norderoerne'            ,	     'Kunoy',	'NO',	'KU');
INSERT INTO @tbl VALUES ('Stromo'            ,	     'Kvivik',	'ST',	'KV');
INSERT INTO @tbl VALUES ('Ostero'            ,	     'Leirvik',	'OS',	'LE');
INSERT INTO @tbl VALUES ('Vago'            ,	     'Midvagur',	'VG',	'MI');
INSERT INTO @tbl VALUES ('Ostero'            ,	     'Nes',	'OS',	'NE');
INSERT INTO @tbl VALUES ('Sudero'            ,	     'Porkeri',	'SU',	'PO');
INSERT INTO @tbl VALUES ('Ostero'            ,	     'Runavik',	'OS',	'RN');
INSERT INTO @tbl VALUES ('Vago'            ,	     'Sandavagur',	'VG',	'SA');
INSERT INTO @tbl VALUES ('Sando'            ,	     'Sandur',	'SA',	'SA');
INSERT INTO @tbl VALUES ('Ostero'            ,	     'Sjogv',	'OS',	'SJ');
INSERT INTO @tbl VALUES ('Sando'            ,	     'Skalavik',	'SA',	'SV');
INSERT INTO @tbl VALUES ('Sando'            ,	     'Skopun',	'SA',	'SP');
INSERT INTO @tbl VALUES ('Sando'            ,	     'Skuvoy',	'SA',	'SU');
INSERT INTO @tbl VALUES ('Vago'            ,	     'Sorvagur',	'VG',	'SR');
INSERT INTO @tbl VALUES ('Ostero'            ,	     'Sund',	'OS',	'SD');
INSERT INTO @tbl VALUES ('Sudero'            ,	     'Sunnbour',	'SU',	'SU');
INSERT INTO @tbl VALUES ('Norderoerne'            ,	     'Svinoy',	'NO',	'SV');
INSERT INTO @tbl VALUES ('Stromo'            ,	     'Torshavn',	'ST',	'TR');
INSERT INTO @tbl VALUES ('Sudero'            ,	     'Tvoroyri',	'SU',	'FR');
INSERT INTO @tbl VALUES ('Sudero'            ,	     'Vagur',	'SU',	'VA');
INSERT INTO @tbl VALUES ('Stromo'            ,	     'Vestmanna',	'ST',	'VE');
INSERT INTO @tbl VALUES ('Norderoerne'            ,	     'Vidareidi',	'NO',	'VI');

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

