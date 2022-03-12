
/* ==================================================================================
    	Source File		:	setup_grenada_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Grenada are set-up
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
WHERE	country_nm	=	'Grenada';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Grenada not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Parish',
		level_2_address_component	=	NULL,
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50) PRIMARY KEY, level_1_cd varchar (5) UNIQUE);

INSERT INTO @tbl VALUES ('Carriacou'            ,	     'CA');
INSERT INTO @tbl VALUES ('Saint Andrew'            ,	     'AN');
INSERT INTO @tbl VALUES ('Saint David'            ,	     'DA');
INSERT INTO @tbl VALUES ('Saint George'            ,	     'GE');
INSERT INTO @tbl VALUES ('Saint John'            ,	     'JO');
INSERT INTO @tbl VALUES ('Saint Mark'            ,	     'MA');
INSERT INTO @tbl VALUES ('Saint Patrick'            ,	     'PA');


INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) 
	SELECT	@country_id, level_1_nm, level_1_cd
	FROM	@tbl;

-- ======================================================================

UPDATE	level_1_address_components
	SET	is_authentic	=	1
WHERE	country_id	=	@country_id;

-- ======================================================================
