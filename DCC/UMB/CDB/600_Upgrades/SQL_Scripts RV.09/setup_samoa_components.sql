
/* ==================================================================================
    	Source File		:	setup_samoa_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Samoa are set-up
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
WHERE	country_nm	=	'Samoa';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Samoa not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'District',
		level_2_address_component	=	NULL,
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50) PRIMARY KEY, level_1_cd varchar (5) UNIQUE);

INSERT INTO @tbl VALUES ('A`ana'            ,	     'AA');
INSERT INTO @tbl VALUES ('Aiga-i-le-Tai'            ,	     'AL');
INSERT INTO @tbl VALUES ('Atua'            ,	     'AT');
INSERT INTO @tbl VALUES ('Fa`asaleleaga'            ,	     'FA');
INSERT INTO @tbl VALUES ('Gaga`emauga'            ,	     'GE');
INSERT INTO @tbl VALUES ('Gagaifomauga'            ,	     'GI');
INSERT INTO @tbl VALUES ('Palauli'            ,	     'PA');
INSERT INTO @tbl VALUES ('Satupa`itea'            ,	     'SA');
INSERT INTO @tbl VALUES ('Tuamasaga'            ,	     'TU');
INSERT INTO @tbl VALUES ('Va`a-o-Fonoti'            ,	     'VF');
INSERT INTO @tbl VALUES ('Vaisigano'            ,	     'VS');


INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) 
	SELECT	@country_id, level_1_nm, level_1_cd
	FROM	@tbl;

-- ======================================================================

UPDATE	level_1_address_components
	SET	is_authentic	=	1
WHERE	country_id	=	@country_id;

-- ======================================================================
