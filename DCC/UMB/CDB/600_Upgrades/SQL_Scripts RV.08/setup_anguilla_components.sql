
/* ==================================================================================
    	Source File		:	setup_anguilla_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	10-10-2014
	Module ID		:	CDB
	Last updated		:	10-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Anguilla are set-up
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
WHERE	country_nm	=	'Anguilla';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Anguilla not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'District',
		level_2_address_component	=	NULL,
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50) PRIMARY KEY, level_1_cd varchar (5) UNIQUE);

INSERT INTO @tbl VALUES ('Blowing Point'            ,	     'BP');
INSERT INTO @tbl VALUES ('East End'            ,	     'EE');
INSERT INTO @tbl VALUES ('George Hill'            ,	     'GH');
INSERT INTO @tbl VALUES ('Island Harbour'            ,	     'IH');
INSERT INTO @tbl VALUES ('North Hill'            ,	     'NH');
INSERT INTO @tbl VALUES ('North Side'            ,	     'NS');
INSERT INTO @tbl VALUES ('Sandy Ground'            ,	     'SG');
INSERT INTO @tbl VALUES ('Sandy Hill'            ,	     'SH');
INSERT INTO @tbl VALUES ('South Hill'            ,	     'SO');
INSERT INTO @tbl VALUES ('Stoney Ground'            ,	     'ST');
INSERT INTO @tbl VALUES ('The Farrington'            ,	     'TF');
INSERT INTO @tbl VALUES ('The Quarter (including Rey Hill)'            ,	     'TQ');
INSERT INTO @tbl VALUES ('The Valley (incl Upper & South Valley)'            ,	     'TV');
INSERT INTO @tbl VALUES ('West End (including Long Bay)'            ,	     'WE');


INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) 
	SELECT	@country_id, level_1_nm, level_1_cd
	FROM	@tbl;

-- ======================================================================
