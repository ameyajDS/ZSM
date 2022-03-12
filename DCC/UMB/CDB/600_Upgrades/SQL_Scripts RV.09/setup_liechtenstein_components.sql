
/* ==================================================================================
    	Source File		:	setup_liechtenstein_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Liechtenstein are set-up
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
WHERE	country_nm	=	'Liechtenstein';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Liechtenstein not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Commune',
		level_2_address_component	=	NULL,
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50) PRIMARY KEY, level_1_cd varchar (5) UNIQUE);

INSERT INTO @tbl VALUES ('Balzers'            ,	     'BA');
INSERT INTO @tbl VALUES ('Eschen'            ,	     'ES');
INSERT INTO @tbl VALUES ('Gamprin'            ,	     'GA');
INSERT INTO @tbl VALUES ('Mauren'            ,	     'MA');
INSERT INTO @tbl VALUES ('Planken'            ,	     'PL');
INSERT INTO @tbl VALUES ('Ruggell'            ,	     'RU');
INSERT INTO @tbl VALUES ('Schaan'            ,	     'SN');
INSERT INTO @tbl VALUES ('Schellenberg'            ,	     'SB');
INSERT INTO @tbl VALUES ('Triesen'            ,	     'TN');
INSERT INTO @tbl VALUES ('Triesenberg'            ,	     'TB');
INSERT INTO @tbl VALUES ('Vaduz'            ,	     'VA');


INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) 
	SELECT	@country_id, level_1_nm, level_1_cd
	FROM	@tbl;

-- ======================================================================

UPDATE	level_1_address_components
	SET	is_authentic	=	1
WHERE	country_id	=	@country_id;

-- ======================================================================
