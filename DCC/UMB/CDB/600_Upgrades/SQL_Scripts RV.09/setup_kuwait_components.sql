
/* ==================================================================================
    	Source File		:	setup_kuwait_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	12-10-2014
	Module ID		:	CDB
	Last updated		:	12-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Kuwait are set-up
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
WHERE	country_nm	=	'Kuwait';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Kuwait not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Governorate',
		level_2_address_component	=	NULL,
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50) PRIMARY KEY, level_1_cd varchar (5) UNIQUE);

INSERT INTO @tbl VALUES ('Al Ahmadi'            ,	     'AH');
INSERT INTO @tbl VALUES ('Al Farwaniyah'            ,	     'FA');
INSERT INTO @tbl VALUES ('Al Jahrah'            ,	     'JA');
INSERT INTO @tbl VALUES ('Al Kuwayt'            ,	     'KU');
INSERT INTO @tbl VALUES ('Hawalli'            ,	     'HW');
INSERT INTO @tbl VALUES ('Mubarak Al-Kabir'            ,	     'MU');


INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) 
	SELECT	@country_id, level_1_nm, level_1_cd
	FROM	@tbl;

UPDATE	level_1_address_components
	SET	is_authentic	=	1
WHERE	country_id	=	@country_id;
-- ======================================================================
