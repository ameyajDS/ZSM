
/* ==================================================================================
    	Source File		:	setup_swaziland_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Swaziland are set-up
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
WHERE	country_nm	=	'Swaziland';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Swaziland not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Region',
		level_2_address_component	=	'Constituency',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Lubombo'            ,	     'Dvokodvweni',	'LU',	'DV');
INSERT INTO @tbl VALUES ('Manzini'            ,	     'Ekukhanyeni',	'MA',	'EK');
INSERT INTO @tbl VALUES ('Shiselweni'            ,	     'Gege',	'SH',	'GE');
INSERT INTO @tbl VALUES ('Hhohho'            ,	     'Hhukwini',	'HH',	'HH');
INSERT INTO @tbl VALUES ('Lubombo'            ,	     'Hlane',	'LU',	'HL');
INSERT INTO @tbl VALUES ('Shiselweni'            ,	     'Hosea',	'SH',	'HO');
INSERT INTO @tbl VALUES ('Shiselweni'            ,	     'Kubuta',	'SH',	'KU');
INSERT INTO @tbl VALUES ('Manzini'            ,	     'Kwaluseni',	'MA',	'KW');
INSERT INTO @tbl VALUES ('Manzini'            ,	     'Lamghabi',	'MA',	'LA');
INSERT INTO @tbl VALUES ('Hhohho'            ,	     'Lobamba',	'HH',	'LO');
INSERT INTO @tbl VALUES ('Manzini'            ,	     'Lobamba Lomdzala',	'MA',	'LL');
INSERT INTO @tbl VALUES ('Lubombo'            ,	     'Lomahasha',	'LU',	'LH');
INSERT INTO @tbl VALUES ('Lubombo'            ,	     'Lubuli',	'LU',	'LB');
INSERT INTO @tbl VALUES ('Manzini'            ,	     'Ludzeludze',	'MA',	'LZ');
INSERT INTO @tbl VALUES ('Lubombo'            ,	     'Lugongolweni',	'LU',	'LG');
INSERT INTO @tbl VALUES ('Hhohho'            ,	     'Madlangempisi',	'HH',	'MD');
INSERT INTO @tbl VALUES ('Manzini'            ,	     'Mafutseni',	'MA',	'MF');
INSERT INTO @tbl VALUES ('Manzini'            ,	     'Mahlangatja',	'MA',	'MG');
INSERT INTO @tbl VALUES ('Manzini'            ,	     'Mangcongco',	'MA',	'MC');
INSERT INTO @tbl VALUES ('Manzini'            ,	     'Manzini North',	'MA',	'MZ');
INSERT INTO @tbl VALUES ('Manzini'            ,	     'Manzini South',	'MA',	'MI');
INSERT INTO @tbl VALUES ('Shiselweni'            ,	     'Maseyisini',	'SH',	'MA');
INSERT INTO @tbl VALUES ('Lubombo'            ,	     'Matsanjeni North',	'LU',	'MN');
INSERT INTO @tbl VALUES ('Shiselweni'            ,	     'Matsanjeni South',	'SH',	'MJ');
INSERT INTO @tbl VALUES ('Hhohho'            ,	     'Mayiwane',	'HH',	'MY');
INSERT INTO @tbl VALUES ('Hhohho'            ,	     'Mbabane East',	'HH',	'ME');
INSERT INTO @tbl VALUES ('Hhohho'            ,	     'Mbabane West',	'HH',	'MW');
INSERT INTO @tbl VALUES ('Shiselweni'            ,	     'Mbangweni',	'SH',	'MB');
INSERT INTO @tbl VALUES ('Manzini'            ,	     'Mhlambanyatsi',	'MA',	'MM');
INSERT INTO @tbl VALUES ('Hhohho'            ,	     'Mhlangatane',	'HH',	'MH');
INSERT INTO @tbl VALUES ('Lubombo'            ,	     'Mhlume',	'LU',	'MU');
INSERT INTO @tbl VALUES ('Manzini'            ,	     'Mkhiweni',	'MA',	'MK');
INSERT INTO @tbl VALUES ('Hhohho'            ,	     'Motjane',	'HH',	'MO');
INSERT INTO @tbl VALUES ('Hhohho'            ,	     'Mphalaleni',	'HH',	'ML');
INSERT INTO @tbl VALUES ('Lubombo'            ,	     'Mpholonjeni',	'LU',	'MP');
INSERT INTO @tbl VALUES ('Manzini'            ,	     'Mthongwaneni',	'MA',	'MT');
INSERT INTO @tbl VALUES ('Shiselweni'            ,	     'Mtsambama',	'SH',	'MS');
INSERT INTO @tbl VALUES ('Hhohho'            ,	     'Ndzingeni',	'HH',	'ND');
INSERT INTO @tbl VALUES ('Shiselweni'            ,	     'Ngudzeni',	'SH',	'NG');
INSERT INTO @tbl VALUES ('Manzini'            ,	     'Ngwenpisi',	'MA',	'NP');
INSERT INTO @tbl VALUES ('Manzini'            ,	     'Nhlambeni',	'MA',	'NH');
INSERT INTO @tbl VALUES ('Hhohho'            ,	     'Nkhaba',	'HH',	'NB');
INSERT INTO @tbl VALUES ('Lubombo'            ,	     'Nkilongo',	'LU',	'NK');
INSERT INTO @tbl VALUES ('Shiselweni'            ,	     'Nkwene',	'SH',	'NW');
INSERT INTO @tbl VALUES ('Hhohho'            ,	     'Ntfonjeni',	'HH',	'NT');
INSERT INTO @tbl VALUES ('Manzini'            ,	     'Ntondozi',	'MA',	'NZ');
INSERT INTO @tbl VALUES ('Hhohho'            ,	     'Pigg''s Peak',	'HH',	'PP');
INSERT INTO @tbl VALUES ('Shiselweni'            ,	     'Sandleni',	'SH',	'SA');
INSERT INTO @tbl VALUES ('Shiselweni'            ,	     'Shiselweni',	'SH',	'SH');
INSERT INTO @tbl VALUES ('Shiselweni'            ,	     'Sigwe',	'SH',	'SI');
INSERT INTO @tbl VALUES ('Lubombo'            ,	     'Siphofaneni',	'LU',	'SF');
INSERT INTO @tbl VALUES ('Lubombo'            ,	     'Sithobela',	'LU',	'SB');
INSERT INTO @tbl VALUES ('Shiselweni'            ,	     'Somntongo',	'SH',	'SO');
INSERT INTO @tbl VALUES ('Hhohho'            ,	     'Timpisini',	'HH',	'TI');
INSERT INTO @tbl VALUES ('Shiselweni'            ,	     'Zombodze',	'SH',	'ZO');

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

