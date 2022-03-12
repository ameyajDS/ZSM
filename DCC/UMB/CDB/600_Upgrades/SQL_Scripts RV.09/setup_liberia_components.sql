
/* ==================================================================================
    	Source File		:	setup_liberia_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Liberia are set-up
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
WHERE	country_nm	=	'Liberia';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Liberia not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'County',
		level_2_address_component	=	'District',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Grand Kru'            ,	     'Barclayville',	'GK',	'BA');
INSERT INTO @tbl VALUES ('Rivercess'            ,	     'Beawor',	'RI',	'BE');
INSERT INTO @tbl VALUES ('Gbarpolu'            ,	     'Belleh',	'GP',	'BE');
INSERT INTO @tbl VALUES ('Grand Gedeh'            ,	     'B''hai',	'GD',	'BH');
INSERT INTO @tbl VALUES ('Grand Kru'            ,	     'Bleebo',	'GK',	'BL');
INSERT INTO @tbl VALUES ('Sinoe'            ,	     'Bodae',	'SI',	'BD');
INSERT INTO @tbl VALUES ('Nimba'            ,	     'Boe & Quilla',	'NI',	'BQ');
INSERT INTO @tbl VALUES ('Bong'            ,	     'Boinsen',	'BG',	'BO');
INSERT INTO @tbl VALUES ('Gbarpolu'            ,	     'Bokomu',	'GP',	'BK');
INSERT INTO @tbl VALUES ('Sinoe'            ,	     'Bokon',	'SI',	'BK');
INSERT INTO @tbl VALUES ('Grand Kru'            ,	     'Bolloh',	'GK',	'BO');
INSERT INTO @tbl VALUES ('Gbarpolu'            ,	     'Bopolu',	'GP',	'BP');
INSERT INTO @tbl VALUES ('Grand Kru'            ,	     'Buah',	'GK',	'BU');
INSERT INTO @tbl VALUES ('Sinoe'            ,	     'Butaw',	'SI',	'BU');
INSERT INTO @tbl VALUES ('Nimba'            ,	     'Buu-Yao',	'NI',	'BY');
INSERT INTO @tbl VALUES ('Montserrado'            ,	     'Careysburg',	'MO',	'CA');
INSERT INTO @tbl VALUES ('Grand Gedeh'            ,	     'Cavala',	'GD',	'CA');
INSERT INTO @tbl VALUES ('Rivercess'            ,	     'Central Rivercess',	'RI',	'CR');
INSERT INTO @tbl VALUES ('River Gee'            ,	     'Chedepo',	'RG',	'CH');
INSERT INTO @tbl VALUES ('Grand Cape Mount'            ,	     'Commonwealth',	'CM',	'CO');
INSERT INTO @tbl VALUES ('Grand Bassa'            ,	     'Commonwealth',	'GB',	'CO');
INSERT INTO @tbl VALUES ('Montserrado'            ,	     'Commonwealth',	'MO',	'CO');
INSERT INTO @tbl VALUES ('Grand Bassa'            ,	     'District #1',	'GB',	'ON');
INSERT INTO @tbl VALUES ('Grand Bassa'            ,	     'District #2',	'GB',	'TW');
INSERT INTO @tbl VALUES ('Grand Bassa'            ,	     'District #3',	'GB',	'TH');
INSERT INTO @tbl VALUES ('Grand Bassa'            ,	     'District #4',	'GB',	'FO');
INSERT INTO @tbl VALUES ('Nimba'            ,	     'Doe',	'NI',	'DO');
INSERT INTO @tbl VALUES ('Rivercess'            ,	     'Doedain',	'RI',	'DO');
INSERT INTO @tbl VALUES ('Grand Kru'            ,	     'Dorbor',	'GK',	'DO');
INSERT INTO @tbl VALUES ('Bomi'            ,	     'Dowein',	'BM',	'DO');
INSERT INTO @tbl VALUES ('Sinoe'            ,	     'Dugbe River',	'SI',	'DR');
INSERT INTO @tbl VALUES ('Grand Kru'            ,	     'Dweh',	'GK',	'DW');
INSERT INTO @tbl VALUES ('Grand Kru'            ,	     'Felo-Jekwi',	'GK',	'FJ');
INSERT INTO @tbl VALUES ('Grand Kru'            ,	     'Fenetoe',	'GK',	'FE');
INSERT INTO @tbl VALUES ('Rivercess'            ,	     'Fen River',	'RI',	'FR');
INSERT INTO @tbl VALUES ('Margibi'            ,	     'Firestone',	'MG',	'FI');
INSERT INTO @tbl VALUES ('Grand Kru'            ,	     'Forpoh',	'GK',	'FO');
INSERT INTO @tbl VALUES ('Lofa'            ,	     'Foya',	'LF',	'FO');
INSERT INTO @tbl VALUES ('Bong'            ,	     'Fuamah',	'BG',	'FU');
INSERT INTO @tbl VALUES ('Grand Kru'            ,	     'Garraway',	'GK',	'GA');
INSERT INTO @tbl VALUES ('Nimba'            ,	     'Garr-Bain',	'NI',	'GB');
INSERT INTO @tbl VALUES ('Grand Cape Mount'            ,	     'Garwula',	'CM',	'GA');
INSERT INTO @tbl VALUES ('Grand Gedeh'            ,	     'Gbao',	'GD',	'GB');
INSERT INTO @tbl VALUES ('Gbarpolu'            ,	     'Gbarma',	'GP',	'GB');
INSERT INTO @tbl VALUES ('River Gee'            ,	     'Gbeapo',	'RG',	'GB');
INSERT INTO @tbl VALUES ('Nimba'            ,	     'Gbehlay-Geh',	'NI',	'GG');
INSERT INTO @tbl VALUES ('Nimba'            ,	     'Gbi & Doru',	'NI',	'GD');
INSERT INTO @tbl VALUES ('Grand Gedeh'            ,	     'Gboe-Ploe',	'GD',	'GP');
INSERT INTO @tbl VALUES ('Nimba'            ,	     'Gbor',	'NI',	'GR');
INSERT INTO @tbl VALUES ('Grand Kru'            ,	     'Gee',	'GK',	'GE');
INSERT INTO @tbl VALUES ('Margibi'            ,	     'Gibi',	'MG',	'GI');
INSERT INTO @tbl VALUES ('River Gee'            ,	     'Glaro',	'RG',	'GL');
INSERT INTO @tbl VALUES ('Grand Gedeh'            ,	     'Glio-Twarbo',	'GD',	'GT');
INSERT INTO @tbl VALUES ('Grand Cape Mount'            ,	     'Golakonneh',	'CM',	'GO');
INSERT INTO @tbl VALUES ('Gbarpolu'            ,	     'Gounwolaila',	'GP',	'GO');
INSERT INTO @tbl VALUES ('Grand Kru'            ,	     'Grand Cess Wedabo',	'GK',	'GW');
INSERT INTO @tbl VALUES ('Montserrado'            ,	     'Greater Monrovia',	'MO',	'MO');
INSERT INTO @tbl VALUES ('Sinoe'            ,	     'Greenville',	'SI',	'GR');
INSERT INTO @tbl VALUES ('Maryland'            ,	     'Gwelekpoken',	'MY',	'GW');
INSERT INTO @tbl VALUES ('Maryland'            ,	     'Harper',	'MY',	'HA');
INSERT INTO @tbl VALUES ('Sinoe'            ,	     'Jaedae',	'SI',	'JA');
INSERT INTO @tbl VALUES ('Sinoe'            ,	     'Jeadepo',	'SI',	'JE');
INSERT INTO @tbl VALUES ('Rivercess'            ,	     'Jo River',	'RI',	'JR');
INSERT INTO @tbl VALUES ('Bong'            ,	     'Jorquelleh',	'BG',	'JO');
INSERT INTO @tbl VALUES ('Sinoe'            ,	     'Juarzon',	'SI',	'JU');
INSERT INTO @tbl VALUES ('Margibi'            ,	     'Kakata',	'MG',	'KA');
INSERT INTO @tbl VALUES ('River Gee'            ,	     'Karforh',	'RG',	'KA');
INSERT INTO @tbl VALUES ('Maryland'            ,	     'Karluway #1',	'MY',	'ON');
INSERT INTO @tbl VALUES ('Maryland'            ,	     'Karluway #2',	'MY',	'TW');
INSERT INTO @tbl VALUES ('Bomi'            ,	     'Klay',	'BM',	'KL');
INSERT INTO @tbl VALUES ('Bong'            ,	     'Kokoyah',	'BG',	'KO');
INSERT INTO @tbl VALUES ('Lofa'            ,	     'Kolahun',	'LF',	'KO');
INSERT INTO @tbl VALUES ('Gbarpolu'            ,	     'Kongba',	'GP',	'KO');
INSERT INTO @tbl VALUES ('Grand Gedeh'            ,	     'Konobo',	'GD',	'KO');
INSERT INTO @tbl VALUES ('Bong'            ,	     'Kpaai',	'BG',	'KP');
INSERT INTO @tbl VALUES ('Nimba'            ,	     'Kparblee',	'NI',	'KP');
INSERT INTO @tbl VALUES ('Sinoe'            ,	     'Kpayan',	'SI',	'KP');
INSERT INTO @tbl VALUES ('Grand Kru'            ,	     'Kpi',	'GK',	'KP');
INSERT INTO @tbl VALUES ('Sinoe'            ,	     'Kulu Shaw Boe',	'SI',	'KS');
INSERT INTO @tbl VALUES ('Nimba'            ,	     'Leewehpea-Mahn',	'NI',	'LE');
INSERT INTO @tbl VALUES ('Grand Kru'            ,	     'Lower Jloh',	'GK',	'LJ');
INSERT INTO @tbl VALUES ('Margibi'            ,	     'Mambah Kaba',	'MG',	'MK');
INSERT INTO @tbl VALUES ('Nimba'            ,	     'Meinpea-Mahn',	'NI',	'MM');
INSERT INTO @tbl VALUES ('River Gee'            ,	     'Nanee',	'RG',	'NA');
INSERT INTO @tbl VALUES ('Grand Bassa'            ,	     'Neekreen',	'GB',	'NE');
INSERT INTO @tbl VALUES ('Rivercess'            ,	     'Norwein',	'RI',	'NO');
INSERT INTO @tbl VALUES ('Grand Kru'            ,	     'Nrokwia-Wesldow',	'GK',	'NW');
INSERT INTO @tbl VALUES ('River Gee'            ,	     'Nyenawliken',	'RG',	'NW');
INSERT INTO @tbl VALUES ('River Gee'            ,	     'Nyenebo',	'RG',	'NB');
INSERT INTO @tbl VALUES ('Maryland'            ,	     'Nyorken',	'MY',	'NY');
INSERT INTO @tbl VALUES ('Grand Bassa'            ,	     'Owensgrove',	'GB',	'OW');
INSERT INTO @tbl VALUES ('Bong'            ,	     'Panta',	'BG',	'PA');
INSERT INTO @tbl VALUES ('Sinoe'            ,	     'Plahn Nyarn',	'SI',	'PN');
INSERT INTO @tbl VALUES ('Maryland'            ,	     'Pleebo/Sodoken',	'MY',	'PS');
INSERT INTO @tbl VALUES ('Grand Cape Mount'            ,	     'Porkpa',	'CM',	'PO');
INSERT INTO @tbl VALUES ('River Gee'            ,	     'Potupo',	'RG',	'PO');
INSERT INTO @tbl VALUES ('Grand Gedeh'            ,	     'Putu',	'GD',	'PU');
INSERT INTO @tbl VALUES ('Sinoe'            ,	     'Pynes Town',	'SI',	'PT');
INSERT INTO @tbl VALUES ('Lofa'            ,	     'Quardu Bondi',	'LF',	'QB');
INSERT INTO @tbl VALUES ('Grand Bassa'            ,	     'St. John River City',	'GB',	'SJ');
INSERT INTO @tbl VALUES ('Montserrado'            ,	     'St. Paul River',	'MO',	'SP');
INSERT INTO @tbl VALUES ('Bong'            ,	     'Salala',	'BG',	'SL');
INSERT INTO @tbl VALUES ('Lofa'            ,	     'Salayea',	'LF',	'SA');
INSERT INTO @tbl VALUES ('Rivercess'            ,	     'Sam Gbalor',	'RI',	'SG');
INSERT INTO @tbl VALUES ('Nimba'            ,	     'Sanniquellie Mahn',	'NI',	'SM');
INSERT INTO @tbl VALUES ('Bong'            ,	     'Sanoyeah',	'BG',	'SY');
INSERT INTO @tbl VALUES ('Sinoe'            ,	     'Sanquin Dist #1',	'SI',	'ON');
INSERT INTO @tbl VALUES ('Sinoe'            ,	     'Sanquin Dist #2',	'SI',	'TW');
INSERT INTO @tbl VALUES ('Sinoe'            ,	     'Sanquin Dist #3',	'SI',	'TH');
INSERT INTO @tbl VALUES ('River Gee'            ,	     'Sarbo',	'RG',	'SA');
INSERT INTO @tbl VALUES ('Sinoe'            ,	     'Seekon',	'SI',	'SE');
INSERT INTO @tbl VALUES ('Bomi'            ,	     'Senjeh',	'BM',	'SE');
INSERT INTO @tbl VALUES ('Bong'            ,	     'Suakoko',	'BG',	'SU');
INSERT INTO @tbl VALUES ('Bomi'            ,	     'Suehn Mecca',	'BM',	'SM');
INSERT INTO @tbl VALUES ('Grand Gedeh'            ,	     'Tchien',	'GD',	'TC');
INSERT INTO @tbl VALUES ('Grand Cape Mount'            ,	     'Tewor',	'CM',	'TE');
INSERT INTO @tbl VALUES ('Montserrado'            ,	     'Todee',	'MO',	'TO');
INSERT INTO @tbl VALUES ('Grand Kru'            ,	     'Trenbo',	'GK',	'TR');
INSERT INTO @tbl VALUES ('Bong'            ,	     'Tukpahblee',	'BG',	'TU');
INSERT INTO @tbl VALUES ('River Gee'            ,	     'Tuobo',	'RG',	'TU');
INSERT INTO @tbl VALUES ('Nimba'            ,	     'Twan River',	'NI',	'TR');
INSERT INTO @tbl VALUES ('Grand Kru'            ,	     'Upper Jloh',	'GK',	'UJ');
INSERT INTO @tbl VALUES ('Lofa'            ,	     'Vahun',	'LF',	'VA');
INSERT INTO @tbl VALUES ('Lofa'            ,	     'Voinjama',	'LF',	'VO');
INSERT INTO @tbl VALUES ('Sinoe'            ,	     'Wedjah',	'SI',	'WE');
INSERT INTO @tbl VALUES ('Nimba'            ,	     'Wee-Gbehy-Mahn',	'NI',	'WG');
INSERT INTO @tbl VALUES ('Maryland'            ,	     'Whojah',	'MY',	'WH');
INSERT INTO @tbl VALUES ('Grand Kru'            ,	     'Wlogba',	'GK',	'WL');
INSERT INTO @tbl VALUES ('Nimba'            ,	     'Yarmein',	'NI',	'YA');
INSERT INTO @tbl VALUES ('Nimba'            ,	     'Yarpea Mahn',	'NI',	'YP');
INSERT INTO @tbl VALUES ('Nimba'            ,	     'Yarwein Mehnsonnoh',	'NI',	'YW');
INSERT INTO @tbl VALUES ('Bong'            ,	     'Yeallequelleh',	'BG',	'YE');
INSERT INTO @tbl VALUES ('Rivercess'            ,	     'Zarflahn',	'RI',	'ZA');
INSERT INTO @tbl VALUES ('Nimba'            ,	     'Zoe Gbao',	'NI',	'ZG');
INSERT INTO @tbl VALUES ('Lofa'            ,	     'Zorzor',	'LF',	'ZO');
INSERT INTO @tbl VALUES ('Bong'            ,	     'Zota',	'BG',	'ZO');

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

