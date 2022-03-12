
/* ==================================================================================
    	Source File		:	setup_niue_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Niue are set-up
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
WHERE	country_nm	=	'Niue';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Niue not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Village',
		level_2_address_component	=	NULL,
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50) PRIMARY KEY, level_1_cd varchar (5) UNIQUE);

INSERT INTO @tbl VALUES ('Alofi North'            ,	     'AN');
INSERT INTO @tbl VALUES ('Alofi South'            ,	     'AS');
INSERT INTO @tbl VALUES ('Avatele'            ,	     'AV');
INSERT INTO @tbl VALUES ('Hakupu'            ,	     'HP');
INSERT INTO @tbl VALUES ('Hikutavake'            ,	     'HV');
INSERT INTO @tbl VALUES ('Lakepa'            ,	     'LP');
INSERT INTO @tbl VALUES ('Liku'            ,	     'LI');
INSERT INTO @tbl VALUES ('Makefu'            ,	     'MF');
INSERT INTO @tbl VALUES ('Mutalau'            ,	     'MT');
INSERT INTO @tbl VALUES ('Namukulu'            ,	     'NM');
INSERT INTO @tbl VALUES ('Tamakautoga'            ,	     'TM');
INSERT INTO @tbl VALUES ('Toi'            ,	     'TO');
INSERT INTO @tbl VALUES ('Tuapa'            ,	     'TP');
INSERT INTO @tbl VALUES ('Vaiea'            ,	     'VA');
INSERT INTO @tbl VALUES ('Total'            ,	     '');


INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) 
	SELECT	@country_id, level_1_nm, level_1_cd
	FROM	@tbl;

-- ======================================================================

UPDATE	level_1_address_components
	SET	is_authentic	=	1
WHERE	country_id	=	@country_id;

-- ======================================================================
