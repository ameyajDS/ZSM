
/* ==================================================================================
    	Source File		:	setup_central_african_republic_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Central_African_Republic are set-up
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
WHERE	country_nm	=	'Central African Republic';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Central African Republic not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Prefecture',
		level_2_address_component	=	'Sub-Prefecture',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Nana-Mambere'            ,	     'Abba',	'NM',	'AB');
INSERT INTO @tbl VALUES ('Basse-Kotto'            ,	     'Alindao',	'BK',	'AL');
INSERT INTO @tbl VALUES ('Mambere-Kadei'            ,	     'Amada-Gaza',	'HS',	'AG');
INSERT INTO @tbl VALUES ('Nana-Mambere'            ,	     'Baboua',	'NM',	'BB');
INSERT INTO @tbl VALUES ('Ouaka'            ,	     'Bakala',	'UK',	'BK');
INSERT INTO @tbl VALUES ('Mbomou'            ,	     'Bakouma',	'MB',	'BK');
INSERT INTO @tbl VALUES ('Ouaka'            ,	     'Bambari',	'UK',	'BM');
INSERT INTO @tbl VALUES ('Sangha-Mbaere'            ,	     'Bambio',	'SE',	'BA');
INSERT INTO @tbl VALUES ('Haut-Mbomou'            ,	     'Bambouti',	'HM',	'MB');
INSERT INTO @tbl VALUES ('Bamingui-Bangoran'            ,	     'Bamingui',	'BB',	'BA');
INSERT INTO @tbl VALUES ('Mbomou'            ,	     'Bangassou',	'MB',	'BN');
INSERT INTO @tbl VALUES ('Bangui'            ,	     'Bangui',	'BG',	'BG');
INSERT INTO @tbl VALUES ('Nana-Mambere'            ,	     'Baoro',	'NM',	'BR');
INSERT INTO @tbl VALUES ('Ouham'            ,	     'Batangafo',	'AC',	'BA');
INSERT INTO @tbl VALUES ('Sangha-Mbaere'            ,	     'Bayanga',	'SE',	'BY');
INSERT INTO @tbl VALUES ('Mambere-Kadei'            ,	     'Berberati',	'HS',	'BE');
INSERT INTO @tbl VALUES ('Ombella-M''Poko'            ,	     'Bimbo',	'MP',	'BI');
INSERT INTO @tbl VALUES ('Vakaga'            ,	     'Birao',	'VK',	'BI');
INSERT INTO @tbl VALUES ('Ombella-M''Poko'            ,	     'Boali',	'MP',	'BL');
INSERT INTO @tbl VALUES ('Ouham-Pende'            ,	     'Bocaranga',	'OP',	'BC');
INSERT INTO @tbl VALUES ('Lobaye'            ,	     'Boda',	'LB',	'BO');
INSERT INTO @tbl VALUES ('Lobaye'            ,	     'Boganangone',	'LB',	'BG');
INSERT INTO @tbl VALUES ('Lobaye'            ,	     'Boganda',	'LB',	'BD');
INSERT INTO @tbl VALUES ('Ombella-M''Poko'            ,	     'Bogangolo',	'MP',	'BG');
INSERT INTO @tbl VALUES ('Ouham'            ,	     'Bossangoa',	'AC',	'BS');
INSERT INTO @tbl VALUES ('Ombella-M''Poko'            ,	     'Bossembele',	'MP',	'BS');
INSERT INTO @tbl VALUES ('Ouham-Pende'            ,	     'Bossemptele',	'OP',	'BT');
INSERT INTO @tbl VALUES ('Nana-Mambere'            ,	     'Bouar',	'NM',	'BO');
INSERT INTO @tbl VALUES ('Ouham'            ,	     'Bouca',	'AC',	'BC');
INSERT INTO @tbl VALUES ('Ouham-Pende'            ,	     'Bozoum',	'OP',	'BU');
INSERT INTO @tbl VALUES ('Haute-Kotto'            ,	     'Bria',	'HK',	'BR');
INSERT INTO @tbl VALUES ('Mambere-Kadei'            ,	     'Carnot',	'HS',	'CA');
INSERT INTO @tbl VALUES ('Ombella-M''Poko'            ,	     'Damara',	'MP',	'DA');
INSERT INTO @tbl VALUES ('Mambere-Kadei'            ,	     'Dede-Mokouba',	'HS',	'DM');
INSERT INTO @tbl VALUES ('Kemo'            ,	     'Dekoa',	'KG',	'DE');
INSERT INTO @tbl VALUES ('Haut-Mbomou'            ,	     'Djemah',	'HM',	'DJ');
INSERT INTO @tbl VALUES ('Mambere-Kadei'            ,	     'Gadzi',	'HS',	'GZ');
INSERT INTO @tbl VALUES ('Mbomou'            ,	     'Gambo',	'MB',	'GA');
INSERT INTO @tbl VALUES ('Mambere-Kadei'            ,	     'Gamboula',	'HS',	'GA');
INSERT INTO @tbl VALUES ('Ouaka'            ,	     'Grimari',	'UK',	'GR');
INSERT INTO @tbl VALUES ('Ouaka'            ,	     'Ippy',	'UK',	'IP');
INSERT INTO @tbl VALUES ('Ouham'            ,	     'Kabo',	'AC',	'KA');
INSERT INTO @tbl VALUES ('Nana-Grebizi'            ,	     'Kaga-Bandoro',	'KB',	'KB');
INSERT INTO @tbl VALUES ('Basse-Kotto'            ,	     'Kembe',	'BK',	'KE');
INSERT INTO @tbl VALUES ('Ouaka'            ,	     'Kouango',	'UK',	'KO');
INSERT INTO @tbl VALUES ('Ouham-Pende'            ,	     'Koui',	'OP',	'KI');
INSERT INTO @tbl VALUES ('Kemo'            ,	     'Mala',	'KG',	'MA');
INSERT INTO @tbl VALUES ('Ouham'            ,	     'Markounda',	'AC',	'MA');
INSERT INTO @tbl VALUES ('Lobaye'            ,	     'M''Baiki',	'LB',	'MB');
INSERT INTO @tbl VALUES ('Nana-Grebizi'            ,	     'Mbres',	'KB',	'MB');
INSERT INTO @tbl VALUES ('Basse-Kotto'            ,	     'Mingala',	'BK',	'MI');
INSERT INTO @tbl VALUES ('Basse-Kotto'            ,	     'Mobaye',	'BK',	'MO');
INSERT INTO @tbl VALUES ('Lobaye'            ,	     'Mongoumba',	'LB',	'MO');
INSERT INTO @tbl VALUES ('Ouham'            ,	     'Nana-Bakassa',	'AC',	'NK');
INSERT INTO @tbl VALUES ('Ouham'            ,	     'Nanga-Boguila',	'AC',	'NG');
INSERT INTO @tbl VALUES ('Bamingui-Bangoran'            ,	     'Ndele',	'BB',	'ND');
INSERT INTO @tbl VALUES ('Kemo'            ,	     'Ndjoukou',	'KG',	'ND');
INSERT INTO @tbl VALUES ('Ouham-Pende'            ,	     'Ngaoundaye',	'OP',	'NG');
INSERT INTO @tbl VALUES ('Sangha-Mbaere'            ,	     'Nola',	'SE',	'NO');
INSERT INTO @tbl VALUES ('Haut-Mbomou'            ,	     'Obo',	'HM',	'OB');
INSERT INTO @tbl VALUES ('Haute-Kotto'            ,	     'Ouadda',	'HK',	'OU');
INSERT INTO @tbl VALUES ('Vakaga'            ,	     'Ouanda Djalle',	'VK',	'OU');
INSERT INTO @tbl VALUES ('Mbomou'            ,	     'Ouango',	'MB',	'OU');
INSERT INTO @tbl VALUES ('Ouham-Pende'            ,	     'Paoua',	'OP',	'PA');
INSERT INTO @tbl VALUES ('Mbomou'            ,	     'Rafai',	'MB',	'RA');
INSERT INTO @tbl VALUES ('Basse-Kotto'            ,	     'Satema',	'BK',	'SA');
INSERT INTO @tbl VALUES ('Kemo'            ,	     'Sibut',	'KG',	'SI');
INSERT INTO @tbl VALUES ('Mambere-Kadei'            ,	     'Sosso-Nakombo',	'HS',	'SN');
INSERT INTO @tbl VALUES ('Haute-Kotto'            ,	     'Yalinga',	'HK',	'YA');
INSERT INTO @tbl VALUES ('Ombella-M''Poko'            ,	     'Yaloke',	'MP',	'YA');
INSERT INTO @tbl VALUES ('Basse-Kotto'            ,	     'Zangba',	'BK',	'ZA');
INSERT INTO @tbl VALUES ('Haut-Mbomou'            ,	     'Zemio',	'HM',	'ZE');

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

