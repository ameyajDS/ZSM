
/* ==================================================================================
    	Source File		:	setup_rwanda_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Rwanda are set-up
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
WHERE	country_nm	=	'Rwanda';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Rwanda not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Province',
		level_2_address_component	=	'District',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Eastern'            ,	     'Bugesera',	'ES',	'BG');
INSERT INTO @tbl VALUES ('Northern'            ,	     'Burera',	'NO',	'BR');
INSERT INTO @tbl VALUES ('Northern'            ,	     'Gakenke',	'NO',	'GK');
INSERT INTO @tbl VALUES ('Kigali City'            ,	     'Gasabo',	'KV',	'GB');
INSERT INTO @tbl VALUES ('Eastern'            ,	     'Gatsibo',	'ES',	'GT');
INSERT INTO @tbl VALUES ('Northern'            ,	     'Gicumbi',	'NO',	'GC');
INSERT INTO @tbl VALUES ('Southern'            ,	     'Gisagara',	'SU',	'GG');
INSERT INTO @tbl VALUES ('Southern'            ,	     'Huye',	'SU',	'HU');
INSERT INTO @tbl VALUES ('Southern'            ,	     'Kamonyi',	'SU',	'KM');
INSERT INTO @tbl VALUES ('Western'            ,	     'Karongi',	'OU',	'KG');
INSERT INTO @tbl VALUES ('Eastern'            ,	     'Kayonza',	'ES',	'KZ');
INSERT INTO @tbl VALUES ('Kigali City'            ,	     'Kicukiro',	'KV',	'KK');
INSERT INTO @tbl VALUES ('Eastern'            ,	     'Kirehe',	'ES',	'KH');
INSERT INTO @tbl VALUES ('Southern'            ,	     'Muhanga',	'SU',	'MH');
INSERT INTO @tbl VALUES ('Northern'            ,	     'Musanze',	'NO',	'MS');
INSERT INTO @tbl VALUES ('Eastern'            ,	     'Ngoma',	'ES',	'NM');
INSERT INTO @tbl VALUES ('Western'            ,	     'Ngororero',	'OU',	'NR');
INSERT INTO @tbl VALUES ('Western'            ,	     'Nyabihu',	'OU',	'NB');
INSERT INTO @tbl VALUES ('Eastern'            ,	     'Nyagatare',	'ES',	'NT');
INSERT INTO @tbl VALUES ('Southern'            ,	     'Nyamagabe',	'SU',	'NY');
INSERT INTO @tbl VALUES ('Western'            ,	     'Nyamasheke',	'OU',	'NS');
INSERT INTO @tbl VALUES ('Southern'            ,	     'Nyanza',	'SU',	'NZ');
INSERT INTO @tbl VALUES ('Kigali City'            ,	     'Nyarugenge',	'KV',	'NG');
INSERT INTO @tbl VALUES ('Southern'            ,	     'Nyaruguru',	'SU',	'NU');
INSERT INTO @tbl VALUES ('Western'            ,	     'Rubavu',	'OU',	'RB');
INSERT INTO @tbl VALUES ('Southern'            ,	     'Ruhango',	'SU',	'RH');
INSERT INTO @tbl VALUES ('Northern'            ,	     'Rulindo',	'NO',	'RL');
INSERT INTO @tbl VALUES ('Western'            ,	     'Rusizi',	'OU',	'RS');
INSERT INTO @tbl VALUES ('Western'            ,	     'Rutsiro',	'OU',	'RT');
INSERT INTO @tbl VALUES ('Eastern'            ,	     'Rwamagana',	'ES',	'RM');

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

