
/* ==================================================================================
    	Source File		:	setup_taiwan_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	12-10-2014
	Module ID		:	CDB
	Last updated		:	12-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Taiwan are set-up
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
WHERE	country_nm	=	'Taiwan';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Taiwan not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Province',
		level_2_address_component	=	'County',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Taiwan'            ,	     'Changhwa',	'TA',	'CG');
INSERT INTO @tbl VALUES ('Taiwan'            ,	     'Chiayi',	'TA',	'CH');
INSERT INTO @tbl VALUES ('Taiwan'            ,	     'Chiayi City',	'TA',	'CS');
INSERT INTO @tbl VALUES ('Taiwan'            ,	     'Hsinchu',	'TA',	'HH');
INSERT INTO @tbl VALUES ('Taiwan'            ,	     'Hsinchu City',	'TA',	'HS');
INSERT INTO @tbl VALUES ('Taiwan'            ,	     'Hualien',	'TA',	'HL');
INSERT INTO @tbl VALUES ('Taiwan'            ,	     'Ilan',	'TA',	'IL');
INSERT INTO @tbl VALUES ('Kaohsiung'            ,	     'Kaohsiung City',	'KH',	'KS');
INSERT INTO @tbl VALUES ('Taiwan'            ,	     'Keelung City',	'TA',	'CL');
INSERT INTO @tbl VALUES ('Fukien'            ,	     'Kinmen',	'FK',	'KM');
INSERT INTO @tbl VALUES ('Fukien'            ,	     'Lienkiang',	'FK',	'LK');
INSERT INTO @tbl VALUES ('Taiwan'            ,	     'Miaoli',	'TA',	'ML');
INSERT INTO @tbl VALUES ('Taiwan'            ,	     'Nantou',	'TA',	'NT');
INSERT INTO @tbl VALUES ('New Taipei'            ,	     'New Taipei City',	'NT',	'TP');
INSERT INTO @tbl VALUES ('Taiwan'            ,	     'Penghu',	'TA',	'PH');
INSERT INTO @tbl VALUES ('Taiwan'            ,	     'Pingtung',	'TA',	'PT');
INSERT INTO @tbl VALUES ('Taichung'            ,	     'Taichung City',	'TG',	'TU');
INSERT INTO @tbl VALUES ('Tainan'            ,	     'Tainan City',	'TN',	'TI');
INSERT INTO @tbl VALUES ('Taipei'            ,	     'Taipei City',	'TP',	'TC');
INSERT INTO @tbl VALUES ('Taiwan'            ,	     'Taitung',	'TA',	'TT');
INSERT INTO @tbl VALUES ('Taiwan'            ,	     'Taoyuan',	'TA',	'TY');
INSERT INTO @tbl VALUES ('Taiwan'            ,	     'Yunlin',	'TA',	'YL');

SET NOCOUNT OFF

INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) 
	SELECT	DISTINCT @country_id, level_1_nm, level_1_cd
	FROM	@tbl;

-- ======================================================================


INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	level_2_nm, level_2_cd, level_1_address_component_id
	FROM	@tbl	t
		LEFT JOIN	level_1_address_components	l1
			ON	(	l1.level_1_address_component_nm	=	t.level_1_nm
				AND	l1.country_id					=	@country_id
				)

-- ======================================================================

UPDATE	l2
	SET	is_authentic	=	1
FROM	level_2_address_components	l2
	JOIN	level_1_address_components	l1
		ON	(	l1.level_1_address_component_id	=	l2.level_1_address_component_id
			AND	l1.country_id	=	@country_id
			);


UPDATE	level_1_address_components
	SET	is_authentic	=	1
WHERE	country_id	=	@country_id;

-- ======================================================================

