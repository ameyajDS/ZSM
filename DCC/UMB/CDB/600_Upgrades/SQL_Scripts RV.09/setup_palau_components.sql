
/* ==================================================================================
    	Source File		:	setup_palau_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Palau are set-up
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
WHERE	country_nm	=	'Palau';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Palau not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'State',
		level_2_address_component	=	NULL,
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50) PRIMARY KEY, level_1_cd varchar (5) UNIQUE);

INSERT INTO @tbl VALUES ('Aimeliik'            ,	     'AM');
INSERT INTO @tbl VALUES ('Airai'            ,	     'AR');
INSERT INTO @tbl VALUES ('Angaur'            ,	     'AN');
INSERT INTO @tbl VALUES ('Hatohobei'            ,	     'HA');
INSERT INTO @tbl VALUES ('Kayangel'            ,	     'KA');
INSERT INTO @tbl VALUES ('Koror'            ,	     'KO');
INSERT INTO @tbl VALUES ('Melekeok'            ,	     'ME');
INSERT INTO @tbl VALUES ('Ngaraard'            ,	     'ND');
INSERT INTO @tbl VALUES ('Ngarchelong'            ,	     'NC');
INSERT INTO @tbl VALUES ('Ngardmau'            ,	     'NM');
INSERT INTO @tbl VALUES ('Ngatpang'            ,	     'NP');
INSERT INTO @tbl VALUES ('Ngchesar'            ,	     'NS');
INSERT INTO @tbl VALUES ('Ngeremlengui'            ,	     'NL');
INSERT INTO @tbl VALUES ('Ngiwal'            ,	     'NW');
INSERT INTO @tbl VALUES ('Peleliu'            ,	     'PE');
INSERT INTO @tbl VALUES ('Sonsorol'            ,	     'SO');


INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) 
	SELECT	@country_id, level_1_nm, level_1_cd
	FROM	@tbl;

-- ======================================================================

UPDATE	level_1_address_components
	SET	is_authentic	=	1
WHERE	country_id	=	@country_id;

-- ======================================================================
