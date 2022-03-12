
/* ==================================================================================
    	Source File		:	setup_mali_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	10-10-2014
	Module ID		:	CDB
	Last updated		:	10-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Mali are set-up
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
WHERE	country_nm	=	'Mali';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Mali not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Region',
		level_2_address_component	=	'Circle',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Kidal'            ,	     'Abeibara',	'KD',	'AB');
INSERT INTO @tbl VALUES ('Gao'            ,	     'Ansongo',	'GA',	'AN');
INSERT INTO @tbl VALUES ('Kayes'            ,	     'Bafoulabe',	'KY',	'BF');
INSERT INTO @tbl VALUES ('Bamako'            ,	     'Bamako',	'BA',	'BM');
INSERT INTO @tbl VALUES ('Koulikoro'            ,	     'Banamba',	'KK',	'BB');
INSERT INTO @tbl VALUES ('Mopti'            ,	     'Bandiagara',	'MO',	'BD');
INSERT INTO @tbl VALUES ('Mopti'            ,	     'Bankass',	'MO',	'BK');
INSERT INTO @tbl VALUES ('Segou'            ,	     'Baroueli',	'SG',	'BR');
INSERT INTO @tbl VALUES ('Segou'            ,	     'Bla',	'SG',	'BL');
INSERT INTO @tbl VALUES ('Sikasso'            ,	     'Bougouni',	'SK',	'BG');
INSERT INTO @tbl VALUES ('Gao'            ,	     'Bourem',	'GA',	'BO');
INSERT INTO @tbl VALUES ('Kayes'            ,	     'Diema',	'KY',	'DM');
INSERT INTO @tbl VALUES ('Koulikoro'            ,	     'Dioila',	'KK',	'DL');
INSERT INTO @tbl VALUES ('Timbuktu'            ,	     'Dire',	'TB',	'DR');
INSERT INTO @tbl VALUES ('Mopti'            ,	     'Djenne',	'MO',	'DJ');
INSERT INTO @tbl VALUES ('Mopti'            ,	     'Douentza',	'MO',	'DZ');
INSERT INTO @tbl VALUES ('Gao'            ,	     'Gao',	'GA',	'GA');
INSERT INTO @tbl VALUES ('Timbuktu'            ,	     'Goundam',	'TB',	'GD');
INSERT INTO @tbl VALUES ('Timbuktu'            ,	     'Gourma-Rharous',	'TB',	'GR');
INSERT INTO @tbl VALUES ('Sikasso'            ,	     'Kadiolo',	'SK',	'KD');
INSERT INTO @tbl VALUES ('Koulikoro'            ,	     'Kangaba',	'KK',	'KG');
INSERT INTO @tbl VALUES ('Koulikoro'            ,	     'Kati',	'KK',	'KT');
INSERT INTO @tbl VALUES ('Kayes'            ,	     'Kayes',	'KY',	'KY');
INSERT INTO @tbl VALUES ('Kayes'            ,	     'Kenieba',	'KY',	'KN');
INSERT INTO @tbl VALUES ('Kidal'            ,	     'Kidal',	'KD',	'KL');
INSERT INTO @tbl VALUES ('Kayes'            ,	     'Kita',	'KY',	'KI');
INSERT INTO @tbl VALUES ('Koulikoro'            ,	     'Kolokani',	'KK',	'KO');
INSERT INTO @tbl VALUES ('Sikasso'            ,	     'Kolondieba',	'SK',	'KB');
INSERT INTO @tbl VALUES ('Mopti'            ,	     'Koro',	'MO',	'KR');
INSERT INTO @tbl VALUES ('Koulikoro'            ,	     'Koulikoro',	'KK',	'KK');
INSERT INTO @tbl VALUES ('Sikasso'            ,	     'Koutiala',	'SK',	'KU');
INSERT INTO @tbl VALUES ('Segou'            ,	     'Macina',	'SG',	'MC');
INSERT INTO @tbl VALUES ('Gao'            ,	     'Menaka',	'GA',	'MN');
INSERT INTO @tbl VALUES ('Mopti'            ,	     'Mopti',	'MO',	'MP');
INSERT INTO @tbl VALUES ('Koulikoro'            ,	     'Nara',	'KK',	'NA');
INSERT INTO @tbl VALUES ('Timbuktu'            ,	     'Niafunke',	'TB',	'NF');
INSERT INTO @tbl VALUES ('Segou'            ,	     'Niono',	'SG',	'NN');
INSERT INTO @tbl VALUES ('Kayes'            ,	     'Nioro',	'KY',	'NR');
INSERT INTO @tbl VALUES ('Segou'            ,	     'San',	'SG',	'SN');
INSERT INTO @tbl VALUES ('Segou'            ,	     'Segou',	'SG',	'SG');
INSERT INTO @tbl VALUES ('Sikasso'            ,	     'Sikasso',	'SK',	'SK');
INSERT INTO @tbl VALUES ('Mopti'            ,	     'Tenenkou',	'MO',	'TN');
INSERT INTO @tbl VALUES ('Kidal'            ,	     'Tessalit',	'KD',	'TS');
INSERT INTO @tbl VALUES ('Kidal'            ,	     'Tin-Essako',	'KD',	'TE');
INSERT INTO @tbl VALUES ('Timbuktu'            ,	     'Tombouctou',	'TB',	'TB');
INSERT INTO @tbl VALUES ('Segou'            ,	     'Tominian',	'SG',	'TM');
INSERT INTO @tbl VALUES ('Sikasso'            ,	     'Yanfolila',	'SK',	'YF');
INSERT INTO @tbl VALUES ('Kayes'            ,	     'Yelimane',	'KY',	'YL');
INSERT INTO @tbl VALUES ('Sikasso'            ,	     'Yorosso',	'SK',	'YR');
INSERT INTO @tbl VALUES ('Mopti'            ,	     'Youwarou',	'MO',	'YW');

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

