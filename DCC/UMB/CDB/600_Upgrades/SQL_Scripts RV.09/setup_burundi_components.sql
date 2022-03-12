
/* ==================================================================================
    	Source File		:	setup_burundi_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Burundi are set-up
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
WHERE	country_nm	=	'Burundi';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Burundi not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Province',
		level_2_address_component	=	'Commune',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Mwaro'            ,	     'Bisoro',	'MW',	'BI');
INSERT INTO @tbl VALUES ('Bubanza'            ,	     'Bubanza',	'BB',	'BU');
INSERT INTO @tbl VALUES ('Kirundo'            ,	     'Bugabira',	'KI',	'BG');
INSERT INTO @tbl VALUES ('Cibitoke'            ,	     'Buganda',	'CI',	'BG');
INSERT INTO @tbl VALUES ('Bujumbura Rural'            ,	     'Bugarama',	'BU',	'BG');
INSERT INTO @tbl VALUES ('Gitega'            ,	     'Bugendana',	'GI',	'BG');
INSERT INTO @tbl VALUES ('Karuzi'            ,	     'Bugenyuzi',	'KR',	'BG');
INSERT INTO @tbl VALUES ('Karuzi'            ,	     'Buhiga',	'KR',	'BH');
INSERT INTO @tbl VALUES ('Muyinga'            ,	     'Buhinyuza',	'MY',	'BH');
INSERT INTO @tbl VALUES ('Rutana'            ,	     'Bukemba',	'RT',	'BU');
INSERT INTO @tbl VALUES ('Muramvya'            ,	     'Bukeye',	'MV',	'BU');
INSERT INTO @tbl VALUES ('Cibitoke'            ,	     'Bukinanyana',	'CI',	'BK');
INSERT INTO @tbl VALUES ('Gitega'            ,	     'Bukirasazi',	'GI',	'BK');
INSERT INTO @tbl VALUES ('Bururi'            ,	     'Burambi',	'BR',	'BM');
INSERT INTO @tbl VALUES ('Gitega'            ,	     'Buraza',	'GI',	'BR');
INSERT INTO @tbl VALUES ('Bururi'            ,	     'Bururi',	'BR',	'BR');
INSERT INTO @tbl VALUES ('Ngozi'            ,	     'Busiga',	'NG',	'BU');
INSERT INTO @tbl VALUES ('Kirundo'            ,	     'Busoni',	'KI',	'BS');
INSERT INTO @tbl VALUES ('Kayanza'            ,	     'Butaganzwa',	'KY',	'BU');
INSERT INTO @tbl VALUES ('Ruyigi'            ,	     'Butaganzwa',	'RY',	'BG');
INSERT INTO @tbl VALUES ('Bujumbura Mairie'            ,	     'Buterere',	'BM',	'BT');
INSERT INTO @tbl VALUES ('Ruyigi'            ,	     'Butezi',	'RY',	'BZ');
INSERT INTO @tbl VALUES ('Muyinga'            ,	     'Butihinda',	'MY',	'BT');
INSERT INTO @tbl VALUES ('Bururi'            ,	     'Buyengero',	'BR',	'BY');
INSERT INTO @tbl VALUES ('Bujumbura Mairie'            ,	     'Buyenzi',	'BM',	'BY');
INSERT INTO @tbl VALUES ('Kirundo'            ,	     'Bwambarangwe',	'KI',	'BW');
INSERT INTO @tbl VALUES ('Ruyigi'            ,	     'Bweru',	'RY',	'BW');
INSERT INTO @tbl VALUES ('Bujumbura Mairie'            ,	     'Bwiza',	'BM',	'BW');
INSERT INTO @tbl VALUES ('Cankuzo'            ,	     'Cankuzo',	'CA',	'CA');
INSERT INTO @tbl VALUES ('Cankuzo'            ,	     'Cendajuru',	'CA',	'CE');
INSERT INTO @tbl VALUES ('Bujumbura Mairie'            ,	     'Cibitoke',	'BM',	'CI');
INSERT INTO @tbl VALUES ('Kayanza'            ,	     'Gahombo',	'KY',	'GH');
INSERT INTO @tbl VALUES ('Ngozi'            ,	     'Gashikanwa',	'NG',	'GA');
INSERT INTO @tbl VALUES ('Muyinga'            ,	     'Gashoho',	'MY',	'GH');
INSERT INTO @tbl VALUES ('Muyinga'            ,	     'Gasorwe',	'MY',	'GW');
INSERT INTO @tbl VALUES ('Kayanza'            ,	     'Gatara',	'KY',	'GT');
INSERT INTO @tbl VALUES ('Bubanza'            ,	     'Gihanga',	'BB',	'GI');
INSERT INTO @tbl VALUES ('Rutana'            ,	     'Giharo',	'RT',	'GH');
INSERT INTO @tbl VALUES ('Gitega'            ,	     'Giheta',	'GI',	'GH');
INSERT INTO @tbl VALUES ('Karuzi'            ,	     'Gihogazi',	'KR',	'GH');
INSERT INTO @tbl VALUES ('Bujumbura Mairie'            ,	     'Gihosha',	'BM',	'GI');
INSERT INTO @tbl VALUES ('Cankuzo'            ,	     'Gisagara',	'CA',	'GI');
INSERT INTO @tbl VALUES ('Gitega'            ,	     'Gishubi',	'GI',	'GB');
INSERT INTO @tbl VALUES ('Mwaro'            ,	     'Gisozi',	'MW',	'GI');
INSERT INTO @tbl VALUES ('Ruyigi'            ,	     'Gisuru',	'RY',	'GI');
INSERT INTO @tbl VALUES ('Rutana'            ,	     'Gitanga',	'RT',	'GT');
INSERT INTO @tbl VALUES ('Karuzi'            ,	     'Gitaramuka',	'KR',	'GT');
INSERT INTO @tbl VALUES ('Gitega'            ,	     'Gitega',	'GI',	'GG');
INSERT INTO @tbl VALUES ('Muyinga'            ,	     'Giteranyi',	'MY',	'GI');
INSERT INTO @tbl VALUES ('Kirundo'            ,	     'Gitobe',	'KI',	'GI');
INSERT INTO @tbl VALUES ('Bujumbura Rural'            ,	     'Isale',	'BU',	'IS');
INSERT INTO @tbl VALUES ('Gitega'            ,	     'Itaba',	'GI',	'IT');
INSERT INTO @tbl VALUES ('Kayanza'            ,	     'Kabarore',	'KY',	'KB');
INSERT INTO @tbl VALUES ('Bujumbura Rural'            ,	     'Kabezi',	'BU',	'KB');
INSERT INTO @tbl VALUES ('Bujumbura Mairie'            ,	     'Kamenge',	'BM',	'KG');
INSERT INTO @tbl VALUES ('Bujumbura Mairie'            ,	     'Kanyosha',	'BM',	'KY');
INSERT INTO @tbl VALUES ('Bujumbura Rural'            ,	     'Kanyosha',	'BU',	'KY');
INSERT INTO @tbl VALUES ('Kayanza'            ,	     'Kayanza',	'KY',	'KY');
INSERT INTO @tbl VALUES ('Makamba'            ,	     'Kayogoro',	'MA',	'KA');
INSERT INTO @tbl VALUES ('Mwaro'            ,	     'Kayokwe',	'MW',	'KA');
INSERT INTO @tbl VALUES ('Makamba'            ,	     'Kibago',	'MA',	'KI');
INSERT INTO @tbl VALUES ('Cankuzo'            ,	     'Kigamba',	'CA',	'KI');
INSERT INTO @tbl VALUES ('Muramvya'            ,	     'Kiganda',	'MV',	'KI');
INSERT INTO @tbl VALUES ('Bujumbura Mairie'            ,	     'Kinama',	'BM',	'KM');
INSERT INTO @tbl VALUES ('Bujumbura Mairie'            ,	     'Kinindo',	'BM',	'KD');
INSERT INTO @tbl VALUES ('Ruyigi'            ,	     'Kinyinya',	'RY',	'KA');
INSERT INTO @tbl VALUES ('Ngozi'            ,	     'Kiremba',	'NG',	'KI');
INSERT INTO @tbl VALUES ('Kirundo'            ,	     'Kirundo',	'KI',	'KI');
INSERT INTO @tbl VALUES ('Makamba'            ,	     'Mabanda',	'MA',	'MB');
INSERT INTO @tbl VALUES ('Cibitoke'            ,	     'Mabayi',	'CI',	'MA');
INSERT INTO @tbl VALUES ('Makamba'            ,	     'Makamba',	'MA',	'MK');
INSERT INTO @tbl VALUES ('Gitega'            ,	     'Makebuko',	'GI',	'MA');
INSERT INTO @tbl VALUES ('Ngozi'            ,	     'Marangara',	'NG',	'MA');
INSERT INTO @tbl VALUES ('Bururi'            ,	     'Matana',	'BR',	'MA');
INSERT INTO @tbl VALUES ('Kayanza'            ,	     'Matongo',	'KY',	'MA');
INSERT INTO @tbl VALUES ('Muramvya'            ,	     'Mbuye',	'MV',	'MB');
INSERT INTO @tbl VALUES ('Cankuzo'            ,	     'Mishiha',	'CA',	'MI');
INSERT INTO @tbl VALUES ('Bubanza'            ,	     'Mpanda',	'BB',	'MP');
INSERT INTO @tbl VALUES ('Rutana'            ,	     'Mpinga',	'RT',	'MP');
INSERT INTO @tbl VALUES ('Bujumbura Rural'            ,	     'Mubimbi',	'BU',	'MB');
INSERT INTO @tbl VALUES ('Bururi'            ,	     'Mugamba',	'BR',	'MU');
INSERT INTO @tbl VALUES ('Cibitoke'            ,	     'Mugina',	'CI',	'MG');
INSERT INTO @tbl VALUES ('Bujumbura Rural'            ,	     'Mugongomanga',	'BU',	'MG');
INSERT INTO @tbl VALUES ('Kayanza'            ,	     'Muhanga',	'KY',	'MH');
INSERT INTO @tbl VALUES ('Bujumbura Rural'            ,	     'Muhuta',	'BU',	'MU');
INSERT INTO @tbl VALUES ('Bujumbura Rural'            ,	     'Mukike',	'BU',	'MK');
INSERT INTO @tbl VALUES ('Muramvya'            ,	     'Muramvya',	'MV',	'MU');
INSERT INTO @tbl VALUES ('Kayanza'            ,	     'Muruta',	'KY',	'MR');
INSERT INTO @tbl VALUES ('Cibitoke'            ,	     'Murwi',	'CI',	'MR');
INSERT INTO @tbl VALUES ('Bujumbura Mairie'            ,	     'Musaga',	'BM',	'MU');
INSERT INTO @tbl VALUES ('Bubanza'            ,	     'Musigati',	'BB',	'MU');
INSERT INTO @tbl VALUES ('Rutana'            ,	     'Musongati',	'RT',	'MU');
INSERT INTO @tbl VALUES ('Gitega'            ,	     'Mutaho',	'GI',	'MU');
INSERT INTO @tbl VALUES ('Bujumbura Rural'            ,	     'Mutambu',	'BU',	'MA');
INSERT INTO @tbl VALUES ('Bujumbura Rural'            ,	     'Mutimbuzi',	'BU',	'MZ');
INSERT INTO @tbl VALUES ('Karuzi'            ,	     'Mutumba',	'KR',	'MU');
INSERT INTO @tbl VALUES ('Muyinga'            ,	     'Muyinga',	'MY',	'MU');
INSERT INTO @tbl VALUES ('Muyinga'            ,	     'Mwakiro',	'MY',	'MW');
INSERT INTO @tbl VALUES ('Ngozi'            ,	     'Mwumba',	'NG',	'MW');
INSERT INTO @tbl VALUES ('Mwaro'            ,	     'Ndava',	'MW',	'ND');
INSERT INTO @tbl VALUES ('Bujumbura Mairie'            ,	     'Ngagara',	'BM',	'NG');
INSERT INTO @tbl VALUES ('Ngozi'            ,	     'Ngozi',	'NG',	'NG');
INSERT INTO @tbl VALUES ('Kirundo'            ,	     'Ntega',	'KI',	'NT');
INSERT INTO @tbl VALUES ('Mwaro'            ,	     'Nyabihanga',	'MW',	'NY');
INSERT INTO @tbl VALUES ('Karuzi'            ,	     'Nyabikere',	'KR',	'NY');
INSERT INTO @tbl VALUES ('Bujumbura Rural'            ,	     'Nyabiraba',	'BU',	'NB');
INSERT INTO @tbl VALUES ('Ruyigi'            ,	     'Nyabitsinda',	'RY',	'NY');
INSERT INTO @tbl VALUES ('Bujumbura Mairie'            ,	     'Nyakabiga',	'BM',	'NY');
INSERT INTO @tbl VALUES ('Ngozi'            ,	     'Nyamurenza',	'NG',	'MU');
INSERT INTO @tbl VALUES ('Makamba'            ,	     'Nyanza Lac',	'MA',	'NL');
INSERT INTO @tbl VALUES ('Gitega'            ,	     'Nyarusange',	'GI',	'NS');
INSERT INTO @tbl VALUES ('Kayanza'            ,	     'Rango',	'KY',	'RA');
INSERT INTO @tbl VALUES ('Bujumbura Mairie'            ,	     'Rohero',	'BM',	'RO');
INSERT INTO @tbl VALUES ('Bubanza'            ,	     'Rugazi',	'BB',	'RU');
INSERT INTO @tbl VALUES ('Cibitoke'            ,	     'Rugombo',	'CI',	'RU');
INSERT INTO @tbl VALUES ('Ngozi'            ,	     'Ruhororo',	'NG',	'RU');
INSERT INTO @tbl VALUES ('Bururi'            ,	     'Rumonge',	'BR',	'RM');
INSERT INTO @tbl VALUES ('Mwaro'            ,	     'Rusaka',	'MW',	'RU');
INSERT INTO @tbl VALUES ('Rutana'            ,	     'Rutana',	'RT',	'RU');
INSERT INTO @tbl VALUES ('Muramvya'            ,	     'Rutegama',	'MV',	'RU');
INSERT INTO @tbl VALUES ('Bururi'            ,	     'Rutovu',	'BR',	'RT');
INSERT INTO @tbl VALUES ('Ruyigi'            ,	     'Ruyigi',	'RY',	'RU');
INSERT INTO @tbl VALUES ('Gitega'            ,	     'Ryansoro',	'GI',	'RY');
INSERT INTO @tbl VALUES ('Karuzi'            ,	     'Shombo',	'KR',	'SH');
INSERT INTO @tbl VALUES ('Bururi'            ,	     'Songa',	'BR',	'SO');
INSERT INTO @tbl VALUES ('Ngozi'            ,	     'Tangara',	'NG',	'TA');
INSERT INTO @tbl VALUES ('Makamba'            ,	     'Vugizo',	'MA',	'VU');
INSERT INTO @tbl VALUES ('Kirundo'            ,	     'Vumbi',	'KI',	'VU');
INSERT INTO @tbl VALUES ('Bururi'            ,	     'Vyanda',	'BR',	'VY');

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

