
/* ==================================================================================
    	Source File		:	setup_saint kitts and nevis_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Saint Kitts Nevis are set-up
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
WHERE	country_nm	=	'Saint Kitts and Nevis';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Saint Kitts and Nevis not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Parish',
		level_2_address_component	=	NULL,
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50) PRIMARY KEY, level_1_cd varchar (5) UNIQUE);

INSERT INTO @tbl VALUES ('hrist Church Nichola Town'            ,	     'CC');
INSERT INTO @tbl VALUES ('Saint Anne Sandy Point'            ,	     'AS');
INSERT INTO @tbl VALUES ('Saint George Basseterre'            ,	     'GB');
INSERT INTO @tbl VALUES ('Saint George Gingerland'            ,	     'GG');
INSERT INTO @tbl VALUES ('Saint James Windward'            ,	     'JW');
INSERT INTO @tbl VALUES ('Saint John Capisterre'            ,	     'JC');
INSERT INTO @tbl VALUES ('Saint John Figtree'            ,	     'JF');
INSERT INTO @tbl VALUES ('Saint Mary Cayon'            ,	     'MC');
INSERT INTO @tbl VALUES ('Saint Paul Capisterre'            ,	     'PP');
INSERT INTO @tbl VALUES ('Saint Paul Charlestown'            ,	     'PL');
INSERT INTO @tbl VALUES ('Saint Peter Basseterre'            ,	     'PB');
INSERT INTO @tbl VALUES ('Saint Thomas Lowland'            ,	     'TL');
INSERT INTO @tbl VALUES ('Saint Thomas Middle Island'            ,	     'TM');
INSERT INTO @tbl VALUES ('Trinity Palmetto Point'            ,	     'TP');


INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) 
	SELECT	@country_id, level_1_nm, level_1_cd
	FROM	@tbl;

-- ======================================================================

UPDATE	level_1_address_components
	SET	is_authentic	=	1
WHERE	country_id	=	@country_id;

-- ======================================================================
