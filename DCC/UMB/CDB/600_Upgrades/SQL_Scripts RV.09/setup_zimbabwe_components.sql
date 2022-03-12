
/* ==================================================================================
    	Source File		:	setup_zimbabwe_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Zimbabwe are set-up
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
WHERE	country_nm	=	'Zimbabwe';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Zimbabwe not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Province',
		level_2_address_component	=	'District',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Matabeleland South'            ,	     'Beitbridge',	'MS',	'BB');
INSERT INTO @tbl VALUES ('Masvingo'            ,	     'Bikita',	'MV',	'BK');
INSERT INTO @tbl VALUES ('Mashonaland Central'            ,	     'Bindura',	'MC',	'BD');
INSERT INTO @tbl VALUES ('Matabeleland North'            ,	     'Binga',	'MN',	'BG');
INSERT INTO @tbl VALUES ('Matabeleland North'            ,	     'Bubi',	'MN',	'BU');
INSERT INTO @tbl VALUES ('Manicaland'            ,	     'Buhera',	'MA',	'BH');
INSERT INTO @tbl VALUES ('Bulawayo'            ,	     'Bulawayo',	'BU',	'BL');
INSERT INTO @tbl VALUES ('Matabeleland South'            ,	     'Bulilima (North)',	'MS',	'BM');
INSERT INTO @tbl VALUES ('Mashonaland Central'            ,	     'Centenary',	'MC',	'MZ');
INSERT INTO @tbl VALUES ('Mashonaland West'            ,	     'Chegutu',	'MW',	'CG');
INSERT INTO @tbl VALUES ('Mashonaland East'            ,	     'Chikomba',	'ME',	'CK');
INSERT INTO @tbl VALUES ('Manicaland'            ,	     'Chimanimani',	'MA',	'CM');
INSERT INTO @tbl VALUES ('Manicaland'            ,	     'Chipinge',	'MA',	'CP');
INSERT INTO @tbl VALUES ('Masvingo'            ,	     'Chiredzi',	'MV',	'CR');
INSERT INTO @tbl VALUES ('Midlands'            ,	     'Chirumhanzu',	'MI',	'CH');
INSERT INTO @tbl VALUES ('Harare'            ,	     'Chitungwiza',	'HA',	'CT');
INSERT INTO @tbl VALUES ('Masvingo'            ,	     'Chivi',	'MV',	'CV');
INSERT INTO @tbl VALUES ('Harare'            ,	     'Epworth',	'HA',	'EP');
INSERT INTO @tbl VALUES ('Midlands'            ,	     'Gokwe North',	'MI',	'GN');
INSERT INTO @tbl VALUES ('Midlands'            ,	     'Gokwe South',	'MI',	'GS');
INSERT INTO @tbl VALUES ('Mashonaland East'            ,	     'Goromonzi',	'ME',	'GM');
INSERT INTO @tbl VALUES ('Mashonaland Central'            ,	     'Guruve',	'MC',	'GV');
INSERT INTO @tbl VALUES ('Masvingo'            ,	     'Gutu',	'MV',	'GT');
INSERT INTO @tbl VALUES ('Matabeleland South'            ,	     'Gwanda',	'MS',	'GD');
INSERT INTO @tbl VALUES ('Midlands'            ,	     'Gweru',	'MI',	'GW');
INSERT INTO @tbl VALUES ('Harare'            ,	     'Harare Rural',	'HA',	'HR');
INSERT INTO @tbl VALUES ('Harare'            ,	     'Harare Urban',	'HA',	'HA');
INSERT INTO @tbl VALUES ('Mashonaland West'            ,	     'Hurungwe',	'MW',	'HU');
INSERT INTO @tbl VALUES ('Matabeleland North'            ,	     'Hwange',	'MN',	'HW');
INSERT INTO @tbl VALUES ('Matabeleland South'            ,	     'Insiza',	'MS',	'IN');
INSERT INTO @tbl VALUES ('Mashonaland West'            ,	     'Kadoma',	'MW',	'KD');
INSERT INTO @tbl VALUES ('Mashonaland West'            ,	     'Kariba',	'MW',	'KR');
INSERT INTO @tbl VALUES ('Midlands'            ,	     'Kwekwe',	'MI',	'KW');
INSERT INTO @tbl VALUES ('Matabeleland North'            ,	     'Lupane',	'MN',	'LU');
INSERT INTO @tbl VALUES ('Mashonaland West'            ,	     'Makonde',	'MW',	'MK');
INSERT INTO @tbl VALUES ('Manicaland'            ,	     'Makoni',	'MA',	'MN');
INSERT INTO @tbl VALUES ('Matabeleland South'            ,	     'Mangwe (South)',	'MS',	'MG');
INSERT INTO @tbl VALUES ('Mashonaland East'            ,	     'Marondera',	'ME',	'MA');
INSERT INTO @tbl VALUES ('Masvingo'            ,	     'Masvingo',	'MV',	'MV');
INSERT INTO @tbl VALUES ('Matabeleland South'            ,	     'Matobo',	'MS',	'MT');
INSERT INTO @tbl VALUES ('Mashonaland Central'            ,	     'Mazowe',	'MC',	'ME');
INSERT INTO @tbl VALUES ('Midlands'            ,	     'Mberengwa',	'MI',	'MB');
INSERT INTO @tbl VALUES ('Mashonaland Central'            ,	     'Mount Darwin',	'MC',	'MD');
INSERT INTO @tbl VALUES ('Mashonaland East'            ,	     'Mudzi',	'ME',	'MI');
INSERT INTO @tbl VALUES ('Mashonaland East'            ,	     'Murehwa',	'ME',	'MU');
INSERT INTO @tbl VALUES ('Manicaland'            ,	     'Mutare',	'MA',	'MR');
INSERT INTO @tbl VALUES ('Manicaland'            ,	     'Mutasa',	'MA',	'MS');
INSERT INTO @tbl VALUES ('Mashonaland East'            ,	     'Mutoko',	'ME',	'MO');
INSERT INTO @tbl VALUES ('Masvingo'            ,	     'Mwenezi',	'MV',	'MW');
INSERT INTO @tbl VALUES ('Matabeleland North'            ,	     'Nkayi',	'MN',	'NK');
INSERT INTO @tbl VALUES ('Manicaland'            ,	     'Nyanga',	'MA',	'NY');
INSERT INTO @tbl VALUES ('Mashonaland Central'            ,	     'Rushinga',	'MC',	'RU');
INSERT INTO @tbl VALUES ('Mashonaland East'            ,	     'Seke',	'ME',	'SE');
INSERT INTO @tbl VALUES ('Mashonaland Central'            ,	     'Shamva',	'MC',	'SM');
INSERT INTO @tbl VALUES ('Midlands'            ,	     'Shurugwi',	'MI',	'SR');
INSERT INTO @tbl VALUES ('Matabeleland North'            ,	     'Tsholotsho',	'MN',	'TS');
INSERT INTO @tbl VALUES ('Matabeleland North'            ,	     'Umguza',	'MN',	'UG');
INSERT INTO @tbl VALUES ('Mashonaland East'            ,	     'UMP',	'ME',	'UM');
INSERT INTO @tbl VALUES ('Matabeleland South'            ,	     'Umzingwane',	'MS',	'UZ');
INSERT INTO @tbl VALUES ('Mashonaland East'            ,	     'Wedza',	'ME',	'WE');
INSERT INTO @tbl VALUES ('Masvingo'            ,	     'Zaka',	'MV',	'ZA');
INSERT INTO @tbl VALUES ('Mashonaland West'            ,	     'Zvimba',	'MW',	'ZB');
INSERT INTO @tbl VALUES ('Midlands'            ,	     'Zvishavane',	'MI',	'ZV');

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

