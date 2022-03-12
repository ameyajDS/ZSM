
/* ==================================================================================
    	Source File		:	setup_tuvalu_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Tuvalu are set-up
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
WHERE	country_nm	=	'Tuvalu';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Tuvalu not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Island council',
		level_2_address_component	=	NULL,
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50) PRIMARY KEY, level_1_cd varchar (5) UNIQUE);

INSERT INTO @tbl VALUES ('Funafuti'            ,	     'FN');
INSERT INTO @tbl VALUES ('Nanumanga'            ,	     'NG');
INSERT INTO @tbl VALUES ('Nanumea'            ,	     'NA');
INSERT INTO @tbl VALUES ('Niutao'            ,	     'NT');
INSERT INTO @tbl VALUES ('Nui'            ,	     'NU');
INSERT INTO @tbl VALUES ('Nukufetau'            ,	     'NF');
INSERT INTO @tbl VALUES ('Nukulaelae'            ,	     'NL');
INSERT INTO @tbl VALUES ('Vaitupu'            ,	     'VI');


INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) 
	SELECT	@country_id, level_1_nm, level_1_cd
	FROM	@tbl;

-- ======================================================================

UPDATE	level_1_address_components
	SET	is_authentic	=	1
WHERE	country_id	=	@country_id;

-- ======================================================================
