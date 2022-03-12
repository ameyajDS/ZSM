
/* ==================================================================================
    	Source File		:	setup_georgia_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Georgia are set-up
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
WHERE	country_nm	=	'Georgia';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Georgia not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Region',
		level_2_address_component	=	'District',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Samegrelo-Zemo Svaneti'            ,	     'Abasha',	'SZ',	'AS');
INSERT INTO @tbl VALUES ('Samtskhe-Javakheti'            ,	     'Adigeni',	'SJ',	'AD');
INSERT INTO @tbl VALUES ('Mtskheta-Mtianeti'            ,	     'Akhalgori',	'MM',	'AG');
INSERT INTO @tbl VALUES ('Samtskhe-Javakheti'            ,	     'Akhalkalaki',	'SJ',	'AK');
INSERT INTO @tbl VALUES ('Samtskhe-Javakheti'            ,	     'Akhaltsikhe',	'SJ',	'AT');
INSERT INTO @tbl VALUES ('Kakheti'            ,	     'Akhmeta',	'KA',	'AM');
INSERT INTO @tbl VALUES ('Racha-Lochkhumi-Kvemo Svaneti'            ,	     'Ambrolauri',	'RK',	'AL');
INSERT INTO @tbl VALUES ('Samtskhe-Javakheti'            ,	     'Aspindza',	'SJ',	'AZ');
INSERT INTO @tbl VALUES ('Imereti'            ,	     'Bagdati',	'IM',	'BG');
INSERT INTO @tbl VALUES ('Ajaria'            ,	     'Batumi',	'AJ',	'BT');
INSERT INTO @tbl VALUES ('Kvemo Kartli'            ,	     'Bolnisi',	'KK',	'BL');
INSERT INTO @tbl VALUES ('Samtskhe-Javakheti'            ,	     'Borjomi',	'SJ',	'BR');
INSERT INTO @tbl VALUES ('Imereti'            ,	     'Chiatura',	'IM',	'CT');
INSERT INTO @tbl VALUES ('Samegrelo-Zemo Svaneti'            ,	     'Chkhorotsku',	'SZ',	'CQ');
INSERT INTO @tbl VALUES ('Guria'            ,	     'Chokhatauri',	'GU',	'CK');
INSERT INTO @tbl VALUES ('Kakheti'            ,	     'Dedoplis Tskaro',	'KA',	'DD');
INSERT INTO @tbl VALUES ('Kvemo Kartli'            ,	     'Dmanisi',	'KK',	'DM');
INSERT INTO @tbl VALUES ('Mtskheta-Mtianeti'            ,	     'Dusheti',	'MM',	'DU');
INSERT INTO @tbl VALUES ('Abkhazia'            ,	     'Gagra',	'AB',	'GG');
INSERT INTO @tbl VALUES ('Abkhazia'            ,	     'Gali',	'AB',	'GL');
INSERT INTO @tbl VALUES ('Kvemo Kartli'            ,	     'Gardabani',	'KK',	'GD');
INSERT INTO @tbl VALUES ('Shida Kartli'            ,	     'Gori',	'SD',	'GO');
INSERT INTO @tbl VALUES ('Abkhazia'            ,	     'Gudauta',	'AB',	'GT');
INSERT INTO @tbl VALUES ('Abkhazia'            ,	     'Gulripshi',	'AB',	'GP');
INSERT INTO @tbl VALUES ('Kakheti'            ,	     'Gurjaani',	'KA',	'GJ');
INSERT INTO @tbl VALUES ('Shida Kartli'            ,	     'Java',	'SD',	'JV');
INSERT INTO @tbl VALUES ('Shida Kartli'            ,	     'Kareli',	'SD',	'KR');
INSERT INTO @tbl VALUES ('Shida Kartli'            ,	     'Kaspi',	'SD',	'KP');
INSERT INTO @tbl VALUES ('Mtskheta-Mtianeti'            ,	     'Kazbegi',	'MM',	'QZ');
INSERT INTO @tbl VALUES ('Ajaria'            ,	     'Keda',	'AJ',	'KD');
INSERT INTO @tbl VALUES ('Imereti'            ,	     'Kharagauli',	'IM',	'KG');
INSERT INTO @tbl VALUES ('Shida Kartli'            ,	     'Khashuri',	'SD',	'KS');
INSERT INTO @tbl VALUES ('Ajaria'            ,	     'Khelvachauri',	'AJ',	'KV');
INSERT INTO @tbl VALUES ('Samegrelo-Zemo Svaneti'            ,	     'Khobi',	'SZ',	'KH');
INSERT INTO @tbl VALUES ('Imereti'            ,	     'Khoni',	'IM',	'KN');
INSERT INTO @tbl VALUES ('Ajaria'            ,	     'Khulo',	'AJ',	'KL');
INSERT INTO @tbl VALUES ('Ajaria'            ,	     'Kobuleti',	'AJ',	'KB');
INSERT INTO @tbl VALUES ('Imereti'            ,	     'Kutaisi',	'IM',	'KT');
INSERT INTO @tbl VALUES ('Kakheti'            ,	     'Kvareli',	'KA',	'QV');
INSERT INTO @tbl VALUES ('Kakheti'            ,	     'Lagodekhi',	'KA',	'LG');
INSERT INTO @tbl VALUES ('Guria'            ,	     'Lanchkhuti',	'GU',	'LK');
INSERT INTO @tbl VALUES ('Racha-Lochkhumi-Kvemo Svaneti'            ,	     'Lentekhi',	'RK',	'LE');
INSERT INTO @tbl VALUES ('Kvemo Kartli'            ,	     'Marneuli',	'KK',	'MN');
INSERT INTO @tbl VALUES ('Samegrelo-Zemo Svaneti'            ,	     'Martvili',	'SZ',	'MV');
INSERT INTO @tbl VALUES ('Samegrelo-Zemo Svaneti'            ,	     'Mestia',	'SZ',	'MS');
INSERT INTO @tbl VALUES ('Mtskheta-Mtianeti'            ,	     'Mtskheta',	'MM',	'MK');
INSERT INTO @tbl VALUES ('Samtskhe-Javakheti'            ,	     'Ninotsminda',	'SJ',	'NI');
INSERT INTO @tbl VALUES ('Abkhazia'            ,	     'Ochamchire',	'AB',	'OC');
INSERT INTO @tbl VALUES ('Racha-Lochkhumi-Kvemo Svaneti'            ,	     'Oni',	'RK',	'ON');
INSERT INTO @tbl VALUES ('Guria'            ,	     'Ozurgeti',	'GU',	'OZ');
INSERT INTO @tbl VALUES ('Samegrelo-Zemo Svaneti'            ,	     'Poti',	'SZ',	'PO');
INSERT INTO @tbl VALUES ('Kvemo Kartli'            ,	     'Rustavi',	'KK',	'RU');
INSERT INTO @tbl VALUES ('Imereti'            ,	     'Sachkhere',	'IM',	'SC');
INSERT INTO @tbl VALUES ('Kakheti'            ,	     'Sagarejo',	'KA',	'SG');
INSERT INTO @tbl VALUES ('Imereti'            ,	     'Samtredia',	'IM',	'SM');
INSERT INTO @tbl VALUES ('Samegrelo-Zemo Svaneti'            ,	     'Senaki',	'SZ',	'SN');
INSERT INTO @tbl VALUES ('Ajaria'            ,	     'Shuakhevi',	'AJ',	'SH');
INSERT INTO @tbl VALUES ('Kakheti'            ,	     'Signagi',	'KA',	'SI');
INSERT INTO @tbl VALUES ('Abkhazia'            ,	     'Sokhumi',	'AB',	'SK');
INSERT INTO @tbl VALUES ('Tbilisi'            ,	     'Tbilisi',	'TB',	'TB');
INSERT INTO @tbl VALUES ('Kakheti'            ,	     'Telavi',	'KA',	'TE');
INSERT INTO @tbl VALUES ('Imereti'            ,	     'Terjola',	'IM',	'TJ');
INSERT INTO @tbl VALUES ('Kvemo Kartli'            ,	     'Tetri Tskaro',	'KK',	'TR');
INSERT INTO @tbl VALUES ('Mtskheta-Mtianeti'            ,	     'Tianeti',	'MM',	'TI');
INSERT INTO @tbl VALUES ('Imereti'            ,	     'Tkibuli',	'IM',	'TQ');
INSERT INTO @tbl VALUES ('Abkhazia'            ,	     'Tkvarcheli',	'AB',	'TV');
INSERT INTO @tbl VALUES ('Racha-Lochkhumi-Kvemo Svaneti'            ,	     'Tsageri',	'RK',	'TG');
INSERT INTO @tbl VALUES ('Samegrelo-Zemo Svaneti'            ,	     'Tsalenjikha',	'SZ',	'TL');
INSERT INTO @tbl VALUES ('Kvemo Kartli'            ,	     'Tsalka',	'KK',	'TK');
INSERT INTO @tbl VALUES ('Imereti'            ,	     'Tskaltubo',	'IM',	'TS');
INSERT INTO @tbl VALUES ('Shida Kartli'            ,	     'Tskhinvali',	'SD',	'TN');
INSERT INTO @tbl VALUES ('Imereti'            ,	     'Vani',	'IM',	'VA');
INSERT INTO @tbl VALUES ('Imereti'            ,	     'Zestaponi',	'IM',	'ZP');
INSERT INTO @tbl VALUES ('Samegrelo-Zemo Svaneti'            ,	     'Zugdidi',	'SZ',	'ZD');

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

