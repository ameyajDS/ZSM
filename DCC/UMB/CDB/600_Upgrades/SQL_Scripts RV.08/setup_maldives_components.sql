
/* ==================================================================================
    	Source File		:	setup_maldives_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	10-10-2014
	Module ID		:	CDB
	Last updated		:	10-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Maldives are set-up
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
WHERE	country_nm	=	'Maldives';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Maldives not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Atoll',
		level_2_address_component	=	NULL,
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50) PRIMARY KEY, level_1_cd varchar (5) UNIQUE);

INSERT INTO @tbl VALUES ('Addu'            ,	     'SE');
INSERT INTO @tbl VALUES ('Aliff Aliff'            ,	     'AA');
INSERT INTO @tbl VALUES ('Aliff Daalu'            ,	     'AD');
INSERT INTO @tbl VALUES ('Baa'            ,	     'BA');
INSERT INTO @tbl VALUES ('Daalu'            ,	     'DA');
INSERT INTO @tbl VALUES ('Faafu'            ,	     'FA');
INSERT INTO @tbl VALUES ('Gaafu Aliff'            ,	     'GA');
INSERT INTO @tbl VALUES ('Gaafu Daalu'            ,	     'GD');
INSERT INTO @tbl VALUES ('Haa Aliff'            ,	     'HA');
INSERT INTO @tbl VALUES ('Haa Daalu'            ,	     'HD');
INSERT INTO @tbl VALUES ('Kaafu'            ,	     'KA');
INSERT INTO @tbl VALUES ('Laamu'            ,	     'LM');
INSERT INTO @tbl VALUES ('Laviyani'            ,	     'LV');
INSERT INTO @tbl VALUES ('Male'            ,	     'MA');
INSERT INTO @tbl VALUES ('Meemu'            ,	     'ME');
INSERT INTO @tbl VALUES ('Naviyani'            ,	     'NA');
INSERT INTO @tbl VALUES ('Noonu'            ,	     'NO');
INSERT INTO @tbl VALUES ('Raa'            ,	     'RA');
INSERT INTO @tbl VALUES ('Shaviyani'            ,	     'SH');
INSERT INTO @tbl VALUES ('Thaa'            ,	     'TH');
INSERT INTO @tbl VALUES ('Waavu'            ,	     'WA');


INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) 
	SELECT	@country_id, level_1_nm, level_1_cd
	FROM	@tbl;

-- ======================================================================
