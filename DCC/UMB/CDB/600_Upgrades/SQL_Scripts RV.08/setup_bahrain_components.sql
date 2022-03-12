
/* ==================================================================================
    	Source File		:	setup_bahrain_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	10-10-2014
	Module ID		:	CDB
	Last updated		:	10-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Bahrain are set-up
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
WHERE	country_nm	=	'Bahrain';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Bahrain not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Governorate',
		level_2_address_component	=	NULL,
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50) PRIMARY KEY, level_1_cd varchar (5) UNIQUE);

INSERT INTO @tbl VALUES ('Capital'            ,	     'CA');
INSERT INTO @tbl VALUES ('Central'            ,	     'CE');
INSERT INTO @tbl VALUES ('Muharraq'            ,	     'MU');
INSERT INTO @tbl VALUES ('Northern'            ,	     'NO');
INSERT INTO @tbl VALUES ('Southern'            ,	     'SO');


INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) 
	SELECT	@country_id, level_1_nm, level_1_cd
	FROM	@tbl;

-- ======================================================================
