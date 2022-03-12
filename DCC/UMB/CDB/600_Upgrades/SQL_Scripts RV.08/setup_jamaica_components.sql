
/* ==================================================================================
    	Source File		:	setup_jamaica_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	10-10-2014
	Module ID		:	CDB
	Last updated		:	10-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Jamaica are set-up
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
WHERE	country_nm	=	'Jamaica';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Jamaica not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Parish',
		level_2_address_component	=	NULL,
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50) PRIMARY KEY, level_1_cd varchar (5) UNIQUE);

INSERT INTO @tbl VALUES ('Clarendon'            ,	     'CL');
INSERT INTO @tbl VALUES ('Hanover'            ,	     'HA');
INSERT INTO @tbl VALUES ('Kingston'            ,	     'KI');
INSERT INTO @tbl VALUES ('Manchester'            ,	     'MA');
INSERT INTO @tbl VALUES ('Portland'            ,	     'PO');
INSERT INTO @tbl VALUES ('Saint Andrew'            ,	     'SD');
INSERT INTO @tbl VALUES ('Saint Ann'            ,	     'SN');
INSERT INTO @tbl VALUES ('Saint Catherine'            ,	     'SC');
INSERT INTO @tbl VALUES ('Saint Elizabeth'            ,	     'SE');
INSERT INTO @tbl VALUES ('Saint James'            ,	     'SJ');
INSERT INTO @tbl VALUES ('Saint Mary'            ,	     'SM');
INSERT INTO @tbl VALUES ('Saint Thomas'            ,	     'ST');
INSERT INTO @tbl VALUES ('Trelawny'            ,	     'TR');
INSERT INTO @tbl VALUES ('Westmoreland'            ,	     'WE');


INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) 
	SELECT	@country_id, level_1_nm, level_1_cd
	FROM	@tbl;

-- ======================================================================
