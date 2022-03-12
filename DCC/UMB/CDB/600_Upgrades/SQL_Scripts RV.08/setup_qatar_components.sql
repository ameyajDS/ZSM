
/* ==================================================================================
    	Source File		:	setup_qatar_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Qatar are set-up
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
WHERE	country_nm	=	'Qatar';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Qatar not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Municipality',
		level_2_address_component	=	NULL,
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50) PRIMARY KEY, level_1_cd varchar (5) UNIQUE);

INSERT INTO @tbl VALUES ('Ad Dawhah'            ,	     'DA');
INSERT INTO @tbl VALUES ('Al Daayen'            ,	     'DY');
INSERT INTO @tbl VALUES ('Al Khawr'            ,	     'KR');
INSERT INTO @tbl VALUES ('Al Wakrah'            ,	     'WA');
INSERT INTO @tbl VALUES ('Ar Rayyan'            ,	     'RY');
INSERT INTO @tbl VALUES ('Madinat ach Shamal'            ,	     'MS');
INSERT INTO @tbl VALUES ('Umm Salal'            ,	     'SL');


INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) 
	SELECT	@country_id, level_1_nm, level_1_cd
	FROM	@tbl;

-- ======================================================================
