
/* ==================================================================================
    	Source File		:	setup_isle_of_man_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Isle_of_Man are set-up
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
WHERE	country_nm	=	'Isle of Man';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Isle of Man not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Sheading',
		level_2_address_component	=	'Parish',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Ayre'            ,	     'Andreas',	'AY',	'AN');
INSERT INTO @tbl VALUES ('Rushen'            ,	     'Arbory',	'RU',	'AB');
INSERT INTO @tbl VALUES ('Michael'            ,	     'Ballaugh',	'MC',	'BL');
INSERT INTO @tbl VALUES ('Middle'            ,	     'Braddan',	'MD',	'BN');
INSERT INTO @tbl VALUES ('Ayre'            ,	     'Bride',	'AY',	'BE');
INSERT INTO @tbl VALUES ('Rushen'            ,	     'Castletown',	'RU',	'CA');
INSERT INTO @tbl VALUES ('Middle'            ,	     'Douglas',	'MD',	'DO');
INSERT INTO @tbl VALUES ('Glenfaba'            ,	     'German',	'GB',	'GE');
INSERT INTO @tbl VALUES ('Michael'            ,	     'Jurby',	'MC',	'JU');
INSERT INTO @tbl VALUES ('Garff'            ,	     'Laxey',	'GR',	'LX');
INSERT INTO @tbl VALUES ('Ayre'            ,	     'Lezayre',	'AY',	'LZ');
INSERT INTO @tbl VALUES ('Garff'            ,	     'Lonan',	'GR',	'LN');
INSERT INTO @tbl VALUES ('Rushen'            ,	     'Malew',	'RU',	'ML');
INSERT INTO @tbl VALUES ('Middle'            ,	     'Marown',	'MD',	'MR');
INSERT INTO @tbl VALUES ('Garff'            ,	     'Maughold',	'GR',	'MG');
INSERT INTO @tbl VALUES ('Michael'            ,	     'Michael',	'MC',	'MC');
INSERT INTO @tbl VALUES ('Middle'            ,	     'Onchan',	'MD',	'ON');
INSERT INTO @tbl VALUES ('Glenfaba'            ,	     'Patrick',	'GB',	'PT');
INSERT INTO @tbl VALUES ('Glenfaba'            ,	     'Peel',	'GB',	'PL');
INSERT INTO @tbl VALUES ('Rushen'            ,	     'Port Erin',	'RU',	'PE');
INSERT INTO @tbl VALUES ('Rushen'            ,	     'Port Saint Mary',	'RU',	'PS');
INSERT INTO @tbl VALUES ('Ayre'            ,	     'Ramsey',	'AY',	'RA');
INSERT INTO @tbl VALUES ('Rushen'            ,	     'Rushen',	'RU',	'RU');
INSERT INTO @tbl VALUES ('Middle'            ,	     'Santon',	'MD',	'SA');

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

