
/* ==================================================================================
    	Source File		:	setup_seychelles_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Seychelles are set-up
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
WHERE	country_nm	=	'Seychelles';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Seychelles not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'District',
		level_2_address_component	=	NULL,
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50) PRIMARY KEY, level_1_cd varchar (5) UNIQUE);

INSERT INTO @tbl VALUES ('Anse aux Pins'            ,	     'PI');
INSERT INTO @tbl VALUES ('Anse Boileau'            ,	     'AB');
INSERT INTO @tbl VALUES ('Anse Etoile'            ,	     'ET');
INSERT INTO @tbl VALUES ('Anse Royale'            ,	     'RO');
INSERT INTO @tbl VALUES ('Au Cap'            ,	     'LO');
INSERT INTO @tbl VALUES ('Baie Lazare'            ,	     'BL');
INSERT INTO @tbl VALUES ('Baie Sainte Anne'            ,	     'BS');
INSERT INTO @tbl VALUES ('Beau Vallon'            ,	     'BV');
INSERT INTO @tbl VALUES ('Bel Air'            ,	     'BA');
INSERT INTO @tbl VALUES ('Belombre'            ,	     'BO');
INSERT INTO @tbl VALUES ('Cascade'            ,	     'CA');
INSERT INTO @tbl VALUES ('English River'            ,	     'RA');
INSERT INTO @tbl VALUES ('Glacis'            ,	     'GL');
INSERT INTO @tbl VALUES ('Grand'' Anse (Mahe)'            ,	     'GM');
INSERT INTO @tbl VALUES ('Grand'' Anse (Praslin)'            ,	     'GP');
INSERT INTO @tbl VALUES ('La Digue and Inner Islands'            ,	     'DI');
INSERT INTO @tbl VALUES ('Les Mamelles'            ,	     'LM');
INSERT INTO @tbl VALUES ('Mont Buxton'            ,	     'MB');
INSERT INTO @tbl VALUES ('Mont Fleuri'            ,	     'MF');
INSERT INTO @tbl VALUES ('Outer Islands'            ,	     'OI');
INSERT INTO @tbl VALUES ('Plaisance'            ,	     'PL');
INSERT INTO @tbl VALUES ('Pointe La Rue'            ,	     'PR');
INSERT INTO @tbl VALUES ('Port Glaud'            ,	     'PG');
INSERT INTO @tbl VALUES ('Roche Caiman'            ,	     'RC');
INSERT INTO @tbl VALUES ('Saint Louis'            ,	     'SL');
INSERT INTO @tbl VALUES ('Takamaka'            ,	     'TA');


INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) 
	SELECT	@country_id, level_1_nm, level_1_cd
	FROM	@tbl;

-- ======================================================================

UPDATE	level_1_address_components
	SET	is_authentic	=	1
WHERE	country_id	=	@country_id;

-- ======================================================================
