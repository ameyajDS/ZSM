
/* ==================================================================================
    	Source File		:	setup_bahamas_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Bahamas are set-up
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
WHERE	country_nm	=	'Bahamas';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Bahamas not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'District',
		level_2_address_component	=	NULL,
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50) PRIMARY KEY, level_1_cd varchar (5) UNIQUE);

INSERT INTO @tbl VALUES ('Acklins'            ,	     'AK');
INSERT INTO @tbl VALUES ('Berry Islands'            ,	     'BR');
INSERT INTO @tbl VALUES ('Bimini'            ,	     'BI');
INSERT INTO @tbl VALUES ('Black Point'            ,	     'BP');
INSERT INTO @tbl VALUES ('Cat Island'            ,	     'CI');
INSERT INTO @tbl VALUES ('Central Abaco'            ,	     'CB');
INSERT INTO @tbl VALUES ('Central Andros'            ,	     'CN');
INSERT INTO @tbl VALUES ('Central Eleuthera'            ,	     'CE');
INSERT INTO @tbl VALUES ('City of Freeport'            ,	     'FP');
INSERT INTO @tbl VALUES ('Crooked Island'            ,	     'CK');
INSERT INTO @tbl VALUES ('East Grand Bahama'            ,	     'EB');
INSERT INTO @tbl VALUES ('Exuma'            ,	     'EM');
INSERT INTO @tbl VALUES ('Grand Cay'            ,	     'GC');
INSERT INTO @tbl VALUES ('Green Turtle Cay'            ,	     'GT');
INSERT INTO @tbl VALUES ('Harbour Island'            ,	     'HB');
INSERT INTO @tbl VALUES ('Hope Town'            ,	     'HT');
INSERT INTO @tbl VALUES ('Inagua'            ,	     'IN');
INSERT INTO @tbl VALUES ('Long Island'            ,	     'LI');
INSERT INTO @tbl VALUES ('Mangrove Cay'            ,	     'MC');
INSERT INTO @tbl VALUES ('Mayaguana'            ,	     'MG');
INSERT INTO @tbl VALUES ('Moore''s Island'            ,	     'MI');
INSERT INTO @tbl VALUES ('New Providence'            ,	     'NW');
INSERT INTO @tbl VALUES ('North Abaco'            ,	     'NA');
INSERT INTO @tbl VALUES ('North Andros'            ,	     'NN');
INSERT INTO @tbl VALUES ('North Eleuthera'            ,	     'NE');
INSERT INTO @tbl VALUES ('Ragged Island'            ,	     'RI');
INSERT INTO @tbl VALUES ('Rum Cay'            ,	     'RC');
INSERT INTO @tbl VALUES ('San Salvador'            ,	     'SS');
INSERT INTO @tbl VALUES ('South Abaco'            ,	     'SB');
INSERT INTO @tbl VALUES ('South Andros'            ,	     'SN');
INSERT INTO @tbl VALUES ('South Eleuthera'            ,	     'SE');
INSERT INTO @tbl VALUES ('Spanish Wells'            ,	     'SW');
INSERT INTO @tbl VALUES ('West Grand Bahama'            ,	     'WB');


INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) 
	SELECT	@country_id, level_1_nm, level_1_cd
	FROM	@tbl;

-- ======================================================================

UPDATE	level_1_address_components
	SET	is_authentic	=	1
WHERE	country_id	=	@country_id;

-- ======================================================================
