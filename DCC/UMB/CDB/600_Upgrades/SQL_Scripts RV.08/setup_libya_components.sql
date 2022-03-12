
/* ==================================================================================
    	Source File		:	setup_libya_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	10-10-2014
	Module ID		:	CDB
	Last updated		:	10-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Libya are set-up
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
WHERE	country_nm	=	'Libya';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Libya not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'District',
		level_2_address_component	=	NULL,
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50) PRIMARY KEY, level_1_cd varchar (5) UNIQUE);

INSERT INTO @tbl VALUES ('Al Butnan'            ,	     'BN');
INSERT INTO @tbl VALUES ('Al Jabal al Akhdar'            ,	     'JK');
INSERT INTO @tbl VALUES ('Al Jabal al Gharbi'            ,	     'JG');
INSERT INTO @tbl VALUES ('Al Jifarah'            ,	     'JR');
INSERT INTO @tbl VALUES ('Al Jufrah'            ,	     'JF');
INSERT INTO @tbl VALUES ('Al Kufrah'            ,	     'KU');
INSERT INTO @tbl VALUES ('Al Marj'            ,	     'MA');
INSERT INTO @tbl VALUES ('Al Marqab'            ,	     'MR');
INSERT INTO @tbl VALUES ('Al Wahat'            ,	     'AW');
INSERT INTO @tbl VALUES ('An Nuqat al Khams'            ,	     'NK');
INSERT INTO @tbl VALUES ('Az Zawiyah'            ,	     'ZW');
INSERT INTO @tbl VALUES ('Benghazi'            ,	     'BG');
INSERT INTO @tbl VALUES ('Darnah'            ,	     'DA');
INSERT INTO @tbl VALUES ('Ghat'            ,	     'GH');
INSERT INTO @tbl VALUES ('Misratah'            ,	     'MS');
INSERT INTO @tbl VALUES ('Murzuq'            ,	     'MU');
INSERT INTO @tbl VALUES ('Nalut'            ,	     'NT');
INSERT INTO @tbl VALUES ('Sabha'            ,	     'SA');
INSERT INTO @tbl VALUES ('Surt'            ,	     'ST');
INSERT INTO @tbl VALUES ('Tripoli'            ,	     'TR');
INSERT INTO @tbl VALUES ('Wadi al Hayat'            ,	     'WH');
INSERT INTO @tbl VALUES ('Wadi ash Shati'''            ,	     'WS');


INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) 
	SELECT	@country_id, level_1_nm, level_1_cd
	FROM	@tbl;

-- ======================================================================
