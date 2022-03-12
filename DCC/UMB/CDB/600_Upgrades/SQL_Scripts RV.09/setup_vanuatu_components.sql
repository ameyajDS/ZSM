
/* ==================================================================================
    	Source File		:	setup_vanuatu_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Vanuatu are set-up
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
WHERE	country_nm	=	'Vanuatu';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Vanuatu not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Province',
		level_2_address_component	=	'Council',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Tafea'            ,	     'Aneityum',	'TF',	'AM');
INSERT INTO @tbl VALUES ('Tafea'            ,	     'Aniwa',	'TF',	'AW');
INSERT INTO @tbl VALUES ('Penama'            ,	     'Bangan-Vanua',	'PM',	'BV');
INSERT INTO @tbl VALUES ('Sanma'            ,	     'Canal-Fanafo',	'SN',	'CF');
INSERT INTO @tbl VALUES ('Malampa'            ,	     'Central Malekula',	'ML',	'CM');
INSERT INTO @tbl VALUES ('Penama'            ,	     'Central Pentecost 1',	'PM',	'CP');
INSERT INTO @tbl VALUES ('Penama'            ,	     'Central Pentecost 2',	'PM',	'CC');
INSERT INTO @tbl VALUES ('Torba'            ,	     'Central Torba',	'TR',	'CT');
INSERT INTO @tbl VALUES ('Sanma'            ,	     'East Malo',	'SN',	'EM');
INSERT INTO @tbl VALUES ('Sanma'            ,	     'East Santo',	'SN',	'ES');
INSERT INTO @tbl VALUES ('Shefa'            ,	     'Emau',	'SE',	'EM');
INSERT INTO @tbl VALUES ('Shefa'            ,	     'Erakor',	'SE',	'EK');
INSERT INTO @tbl VALUES ('Shefa'            ,	     'Eratap',	'SE',	'EP');
INSERT INTO @tbl VALUES ('Shefa'            ,	     'Eton',	'SE',	'ET');
INSERT INTO @tbl VALUES ('Tafea'            ,	     'Futuna',	'TF',	'FU');
INSERT INTO @tbl VALUES ('Shefa'            ,	     'Ifira',	'SE',	'IF');
INSERT INTO @tbl VALUES ('Sanma'            ,	     'Luganville',	'SN',	'LU');
INSERT INTO @tbl VALUES ('Penama'            ,	     'Lungei-Tagaro',	'PM',	'LT');
INSERT INTO @tbl VALUES ('Shefa'            ,	     'Makimae',	'SE',	'MK');
INSERT INTO @tbl VALUES ('Shefa'            ,	     'Malorua',	'SE',	'MR');
INSERT INTO @tbl VALUES ('Shefa'            ,	     'Mele',	'SE',	'ML');
INSERT INTO @tbl VALUES ('Tafea'            ,	     'Middle Bush Tanna',	'TF',	'MT');
INSERT INTO @tbl VALUES ('Shefa'            ,	     'Nguna',	'SE',	'NG');
INSERT INTO @tbl VALUES ('Penama'            ,	     'North Ambae',	'PM',	'NA');
INSERT INTO @tbl VALUES ('Malampa'            ,	     'North Ambrym',	'ML',	'NA');
INSERT INTO @tbl VALUES ('Malampa'            ,	     'North East Malekula',	'ML',	'NE');
INSERT INTO @tbl VALUES ('Shefa'            ,	     'North Efate',	'SE',	'NE');
INSERT INTO @tbl VALUES ('Tafea'            ,	     'North Erromango',	'TF',	'NE');
INSERT INTO @tbl VALUES ('Penama'            ,	     'North Pentecost',	'PM',	'NP');
INSERT INTO @tbl VALUES ('Sanma'            ,	     'North Santo',	'SN',	'NS');
INSERT INTO @tbl VALUES ('Tafea'            ,	     'North Tanna',	'TF',	'NT');
INSERT INTO @tbl VALUES ('Shefa'            ,	     'North Tongoa',	'SE',	'NT');
INSERT INTO @tbl VALUES ('Malampa'            ,	     'North West Malekula',	'ML',	'NW');
INSERT INTO @tbl VALUES ('Sanma'            ,	     'North West Santo',	'SN',	'NW');
INSERT INTO @tbl VALUES ('Torba'            ,	     'Northern Torba',	'TR',	'NT');
INSERT INTO @tbl VALUES ('Malampa'            ,	     'Paama',	'ML',	'PA');
INSERT INTO @tbl VALUES ('Shefa'            ,	     'Pango',	'SE',	'PA');
INSERT INTO @tbl VALUES ('Shefa'            ,	     'Port Vila',	'SE',	'PV');
INSERT INTO @tbl VALUES ('Penama'            ,	     'South Ambae',	'PM',	'SA');
INSERT INTO @tbl VALUES ('Malampa'            ,	     'South East Ambrym',	'ML',	'SA');
INSERT INTO @tbl VALUES ('Malampa'            ,	     'South East Malekula',	'ML',	'SE');
INSERT INTO @tbl VALUES ('Sanma'            ,	     'South East Santo',	'SN',	'SE');
INSERT INTO @tbl VALUES ('Tafea'            ,	     'South Erromango',	'TF',	'SE');
INSERT INTO @tbl VALUES ('Penama'            ,	     'South Maewo',	'PM',	'SM');
INSERT INTO @tbl VALUES ('Malampa'            ,	     'South Malekula',	'ML',	'SM');
INSERT INTO @tbl VALUES ('Penama'            ,	     'South Pentecost',	'PM',	'SP');
INSERT INTO @tbl VALUES ('Sanma'            ,	     'South Santo',	'SN',	'SS');
INSERT INTO @tbl VALUES ('Tafea'            ,	     'South Tanna',	'TF',	'ST');
INSERT INTO @tbl VALUES ('Malampa'            ,	     'South West Malekula',	'ML',	'SW');
INSERT INTO @tbl VALUES ('Tafea'            ,	     'South West Tanna',	'TF',	'SW');
INSERT INTO @tbl VALUES ('Torba'            ,	     'Southern Torba',	'TR',	'ST');
INSERT INTO @tbl VALUES ('Shefa'            ,	     'Tongariki',	'SE',	'TO');
INSERT INTO @tbl VALUES ('Shefa'            ,	     'Varisu',	'SE',	'VS');
INSERT INTO @tbl VALUES ('Shefa'            ,	     'Vermali',	'SE',	'VM');
INSERT INTO @tbl VALUES ('Shefa'            ,	     'Vermaul',	'SE',	'VL');
INSERT INTO @tbl VALUES ('Penama'            ,	     'West Ambae',	'PM',	'WA');
INSERT INTO @tbl VALUES ('Malampa'            ,	     'West Ambrym',	'ML',	'WA');
INSERT INTO @tbl VALUES ('Sanma'            ,	     'West Malo',	'SN',	'WM');
INSERT INTO @tbl VALUES ('Sanma'            ,	     'West Santo',	'SN',	'WS');
INSERT INTO @tbl VALUES ('Tafea'            ,	     'West Tanna',	'TF',	'WT');
INSERT INTO @tbl VALUES ('Tafea'            ,	     'Whitesands Tanna',	'TF',	'WS');
INSERT INTO @tbl VALUES ('Shefa'            ,	     'Yarsu',	'SE',	'YA');

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

