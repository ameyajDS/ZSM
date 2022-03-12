
/* ==================================================================================
    	Source File		:	setup_senegal_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Senegal are set-up
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
WHERE	country_nm	=	'Senegal';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Senegal not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Region',
		level_2_address_component	=	'Department',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Tambacounda'            ,	     'Bakel',	'TB',	'BK');
INSERT INTO @tbl VALUES ('Diourbel'            ,	     'Bambey',	'DB',	'BB');
INSERT INTO @tbl VALUES ('Ziguinchor'            ,	     'Bignona',	'ZG',	'BG');
INSERT INTO @tbl VALUES ('Kaffrine'            ,	     'Birkilane',	'KF',	'BR');
INSERT INTO @tbl VALUES ('Sedhiou'            ,	     'Bounkiling',	'SD',	'BL');
INSERT INTO @tbl VALUES ('Saint-Louis'            ,	     'Dagana',	'ST',	'DG');
INSERT INTO @tbl VALUES ('Dakar'            ,	     'Dakar',	'DK',	'DK');
INSERT INTO @tbl VALUES ('Diourbel'            ,	     'Diourbel',	'DB',	'DB');
INSERT INTO @tbl VALUES ('Fatick'            ,	     'Fatick',	'FK',	'FK');
INSERT INTO @tbl VALUES ('Fatick'            ,	     'Foundiougne',	'FK',	'FD');
INSERT INTO @tbl VALUES ('Fatick'            ,	     'Gossas',	'FK',	'GS');
INSERT INTO @tbl VALUES ('Tambacounda'            ,	     'Goudiry',	'TB',	'GY');
INSERT INTO @tbl VALUES ('Sedhiou'            ,	     'Goudomp',	'SD',	'GP');
INSERT INTO @tbl VALUES ('Dakar'            ,	     'Guediawaye',	'DK',	'GD');
INSERT INTO @tbl VALUES ('Kaolack'            ,	     'Guinguineo',	'KC',	'GG');
INSERT INTO @tbl VALUES ('Kaffrine'            ,	     'Kaffrine',	'KF',	'KF');
INSERT INTO @tbl VALUES ('Matam'            ,	     'Kanel',	'MT',	'KN');
INSERT INTO @tbl VALUES ('Kaolack'            ,	     'Kaolack',	'KC',	'KL');
INSERT INTO @tbl VALUES ('Louga'            ,	     'Kebemer',	'LG',	'KB');
INSERT INTO @tbl VALUES ('Kedougou'            ,	     'Kedougou',	'KG',	'KG');
INSERT INTO @tbl VALUES ('Kolda'            ,	     'Kolda',	'KO',	'KD');
INSERT INTO @tbl VALUES ('Tambacounda'            ,	     'Koumpentoum',	'TB',	'KP');
INSERT INTO @tbl VALUES ('Kaolack'            ,	     'Koungheul',	'KC',	'KU');
INSERT INTO @tbl VALUES ('Louga'            ,	     'Linguere',	'LG',	'LN');
INSERT INTO @tbl VALUES ('Louga'            ,	     'Louga',	'LG',	'LG');
INSERT INTO @tbl VALUES ('Kaffrine'            ,	     'Maleme Hodar',	'KF',	'MH');
INSERT INTO @tbl VALUES ('Matam'            ,	     'Matam',	'MT',	'MT');
INSERT INTO @tbl VALUES ('Diourbel'            ,	     'Mbacke',	'DB',	'MK');
INSERT INTO @tbl VALUES ('Thies'            ,	     'Mbour',	'TH',	'MR');
INSERT INTO @tbl VALUES ('Kolda'            ,	     'Medina Yoro Foula',	'KO',	'YF');
INSERT INTO @tbl VALUES ('Kaolack'            ,	     'Nioro du Rip',	'KC',	'NR');
INSERT INTO @tbl VALUES ('Ziguinchor'            ,	     'Oussouye',	'ZG',	'OU');
INSERT INTO @tbl VALUES ('Dakar'            ,	     'Pikine',	'DK',	'PK');
INSERT INTO @tbl VALUES ('Saint-Louis'            ,	     'Podor',	'ST',	'PD');
INSERT INTO @tbl VALUES ('Matam'            ,	     'Ranerou Ferlo',	'MT',	'RN');
INSERT INTO @tbl VALUES ('Dakar'            ,	     'Rufisque',	'DK',	'RF');
INSERT INTO @tbl VALUES ('Saint-Louis'            ,	     'Saint-Louis',	'ST',	'SL');
INSERT INTO @tbl VALUES ('Kedougou'            ,	     'Salemata',	'KG',	'SM');
INSERT INTO @tbl VALUES ('Kedougou'            ,	     'Saraya',	'KG',	'SY');
INSERT INTO @tbl VALUES ('Sedhiou'            ,	     'Sedhiou',	'SD',	'SD');
INSERT INTO @tbl VALUES ('Tambacounda'            ,	     'Tambacounda',	'TB',	'TC');
INSERT INTO @tbl VALUES ('Thies'            ,	     'Thies',	'TH',	'TH');
INSERT INTO @tbl VALUES ('Thies'            ,	     'Tivaouane',	'TH',	'TV');
INSERT INTO @tbl VALUES ('Kolda'            ,	     'Velingara',	'KO',	'VL');
INSERT INTO @tbl VALUES ('Ziguinchor'            ,	     'Ziguinchor',	'ZG',	'ZG');

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

