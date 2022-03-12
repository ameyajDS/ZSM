
/* ==================================================================================
    	Source File		:	setup_egypt_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	10-10-2014
	Module ID		:	CDB
	Last updated		:	10-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Egypt are set-up
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
WHERE	country_nm	=	'Egypt';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Egypt not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Governorate',
		level_2_address_component	=	NULL,
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50) PRIMARY KEY, level_1_cd varchar (5) UNIQUE);

INSERT INTO @tbl VALUES ('Ad Daqahliyah'            ,	     'DQ');
INSERT INTO @tbl VALUES ('Al Bahr al Ahmar'            ,	     'BA');
INSERT INTO @tbl VALUES ('Al Buhayrah'            ,	     'BH');
INSERT INTO @tbl VALUES ('Al Fayyum'            ,	     'FY');
INSERT INTO @tbl VALUES ('Al Gharbiyah'            ,	     'GH');
INSERT INTO @tbl VALUES ('Al Iskandariyah'            ,	     'IK');
INSERT INTO @tbl VALUES ('Al Isma`iliyah'            ,	     'IS');
INSERT INTO @tbl VALUES ('Al Jizah'            ,	     'JZ');
INSERT INTO @tbl VALUES ('Al Minufiyah'            ,	     'MF');
INSERT INTO @tbl VALUES ('Al Minya'            ,	     'MN');
INSERT INTO @tbl VALUES ('Al Qahirah'            ,	     'QH');
INSERT INTO @tbl VALUES ('Al Qalyubiyah'            ,	     'QL');
INSERT INTO @tbl VALUES ('Al Uqsur'            ,	     'UQ');
INSERT INTO @tbl VALUES ('Al Wadi al Jadid'            ,	     'WJ');
INSERT INTO @tbl VALUES ('Ash Sharqiyah'            ,	     'SQ');
INSERT INTO @tbl VALUES ('As Suways'            ,	     'SW');
INSERT INTO @tbl VALUES ('Aswan'            ,	     'AN');
INSERT INTO @tbl VALUES ('Asyut'            ,	     'AT');
INSERT INTO @tbl VALUES ('Bani Suwayf'            ,	     'BN');
INSERT INTO @tbl VALUES ('Bur Sa`id'            ,	     'BS');
INSERT INTO @tbl VALUES ('Dumyat'            ,	     'DT');
INSERT INTO @tbl VALUES ('Janub Sina'''            ,	     'JS');
INSERT INTO @tbl VALUES ('Kafr ash Shaykh'            ,	     'KS');
INSERT INTO @tbl VALUES ('Matruh'            ,	     'MT');
INSERT INTO @tbl VALUES ('Qina'            ,	     'QN');
INSERT INTO @tbl VALUES ('Shamal Sina'''            ,	     'SS');
INSERT INTO @tbl VALUES ('Suhaj'            ,	     'SJ');


INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) 
	SELECT	@country_id, level_1_nm, level_1_cd
	FROM	@tbl;

-- ======================================================================
