
/* ==================================================================================
    	Source File		:	setup_nauru_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Nauru are set-up
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
WHERE	country_nm	=	'Nauru';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Nauru not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'District',
		level_2_address_component	=	NULL,
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50) PRIMARY KEY, level_1_cd varchar (5) UNIQUE);

INSERT INTO @tbl VALUES ('Aiwo'            ,	     'AI');
INSERT INTO @tbl VALUES ('Anabar'            ,	     'AB');
INSERT INTO @tbl VALUES ('Anetan'            ,	     'AT');
INSERT INTO @tbl VALUES ('Anibare'            ,	     'AR');
INSERT INTO @tbl VALUES ('Baiti'            ,	     'BA');
INSERT INTO @tbl VALUES ('Boe'            ,	     'BO');
INSERT INTO @tbl VALUES ('Buada'            ,	     'BU');
INSERT INTO @tbl VALUES ('Denigomodu'            ,	     'DE');
INSERT INTO @tbl VALUES ('Ewa'            ,	     'EW');
INSERT INTO @tbl VALUES ('Ijuw'            ,	     'IJ');
INSERT INTO @tbl VALUES ('Meneng'            ,	     'ME');
INSERT INTO @tbl VALUES ('Nibok'            ,	     'NI');
INSERT INTO @tbl VALUES ('Uaboe'            ,	     'UA');
INSERT INTO @tbl VALUES ('Yaren'            ,	     'YA');


INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) 
	SELECT	@country_id, level_1_nm, level_1_cd
	FROM	@tbl;

-- ======================================================================

UPDATE	level_1_address_components
	SET	is_authentic	=	1
WHERE	country_id	=	@country_id;

-- ======================================================================
