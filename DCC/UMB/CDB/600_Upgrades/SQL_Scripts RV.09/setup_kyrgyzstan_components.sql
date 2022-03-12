
/* ==================================================================================
    	Source File		:	setup_kyrgyzstan_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Kyrgyzstan are set-up
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
WHERE	country_nm	=	'Kyrgyzstan';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Kyrgyzstan not found', 16, 1);
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

INSERT INTO @tbl VALUES ('Ysyk-Kol'            ,	     'Ak-Suu',	'YK',	'AS');
INSERT INTO @tbl VALUES ('Jalal-Abad'            ,	     'Aksyi',	'DA',	'AK');
INSERT INTO @tbl VALUES ('Naryn'            ,	     'Ak-Talaa',	'NA',	'AT');
INSERT INTO @tbl VALUES ('Jalal-Abad'            ,	     'Ala-Buka',	'DA',	'AB');
INSERT INTO @tbl VALUES ('Osh'            ,	     'Alai',	'OS',	'AL');
INSERT INTO @tbl VALUES ('Chuy'            ,	     'Alamudun',	'CU',	'AM');
INSERT INTO @tbl VALUES ('Osh'            ,	     'Aravan',	'OS',	'AR');
INSERT INTO @tbl VALUES ('Naryn'            ,	     'At-Bashi',	'NA',	'AH');
INSERT INTO @tbl VALUES ('Talas'            ,	     'Bakai-Ata',	'TL',	'BA');
INSERT INTO @tbl VALUES ('Ysyk-Kol'            ,	     'Balykcy',	'YK',	'BA');
INSERT INTO @tbl VALUES ('Batken'            ,	     'Batken',	'BA',	'BT');
INSERT INTO @tbl VALUES ('Jalal-Abad'            ,	     'Bazar-Korgon',	'DA',	'BK');
INSERT INTO @tbl VALUES ('Bishkek'            ,	     'Biskek',	'GB',	'GB');
INSERT INTO @tbl VALUES ('Jalal-Abad'            ,	     'Chatkal',	'DA',	'CK');
INSERT INTO @tbl VALUES ('Osh'            ,	     'Chong-Alay',	'OS',	'CA');
INSERT INTO @tbl VALUES ('Chuy'            ,	     'Chui',	'CU',	'CH');
INSERT INTO @tbl VALUES ('Ysyk-Kol'            ,	     'Djety-Oguz',	'YK',	'DO');
INSERT INTO @tbl VALUES ('Chuy'            ,	     'Jaiyl',	'CU',	'JA');
INSERT INTO @tbl VALUES ('Naryn'            ,	     'Jumgal',	'NA',	'JU');
INSERT INTO @tbl VALUES ('Batken'            ,	     'Kadamjai',	'BA',	'KA');
INSERT INTO @tbl VALUES ('Talas'            ,	     'Kara-Buura',	'TL',	'KB');
INSERT INTO @tbl VALUES ('Jalal-Abad'            ,	     'Kara-Kol',	'DA',	'KA');
INSERT INTO @tbl VALUES ('Ysyk-Kol'            ,	     'Karakol',	'YK',	'KA');
INSERT INTO @tbl VALUES ('Osh'            ,	     'Kara-Kuldja',	'OS',	'KK');
INSERT INTO @tbl VALUES ('Osh'            ,	     'Kara-Suu',	'OS',	'KS');
INSERT INTO @tbl VALUES ('Chuy'            ,	     'Kemin',	'CU',	'KE');
INSERT INTO @tbl VALUES ('Naryn'            ,	     'Kochkor',	'NA',	'KO');
INSERT INTO @tbl VALUES ('Jalal-Abad'            ,	     'Kok-ZaNGgak',	'DA',	'KO');
INSERT INTO @tbl VALUES ('Osh'            ,	     'Kyzyl-Kyja',	'OS',	'KY');
INSERT INTO @tbl VALUES ('Batken'            ,	     'Lailak',	'BA',	'LA');
INSERT INTO @tbl VALUES ('Jalal-Abad'            ,	     'Majluu-Suu',	'DA',	'MA');
INSERT INTO @tbl VALUES ('Talas'            ,	     'Manas',	'TL',	'MA');
INSERT INTO @tbl VALUES ('Chuy'            ,	     'Moskovsky',	'CU',	'MO');
INSERT INTO @tbl VALUES ('Naryn'            ,	     'Naryn',	'NA',	'NA');
INSERT INTO @tbl VALUES ('Osh'            ,	     'Nookat',	'OS',	'NT');
INSERT INTO @tbl VALUES ('Jalal-Abad'            ,	     'Nooken',	'DA',	'NN');
INSERT INTO @tbl VALUES ('Osh'            ,	     'Osh',	'OS',	'OS');
INSERT INTO @tbl VALUES ('Chuy'            ,	     'Panfilov',	'CU',	'PA');
INSERT INTO @tbl VALUES ('Chuy'            ,	     'Sokuluk',	'CU',	'SO');
INSERT INTO @tbl VALUES ('Batken'            ,	     'Suluktu',	'BA',	'SU');
INSERT INTO @tbl VALUES ('Jalal-Abad'            ,	     'Suzak',	'DA',	'SU');
INSERT INTO @tbl VALUES ('Talas'            ,	     'Talas',	'TL',	'TC');
INSERT INTO @tbl VALUES ('Jalal-Abad'            ,	     'Tas-Komur',	'DA',	'TA');
INSERT INTO @tbl VALUES ('Naryn'            ,	     'Tien-Shan',	'NA',	'TS');
INSERT INTO @tbl VALUES ('Jalal-Abad'            ,	     'Togus-Toro',	'DA',	'TT');
INSERT INTO @tbl VALUES ('Chuy'            ,	     'Tokmok',	'CU',	'TO');
INSERT INTO @tbl VALUES ('Jalal-Abad'            ,	     'Toktogul',	'DA',	'TG');
INSERT INTO @tbl VALUES ('Ysyk-Kol'            ,	     'Ton',	'YK',	'TN');
INSERT INTO @tbl VALUES ('Ysyk-Kol'            ,	     'Tup',	'YK',	'TU');
INSERT INTO @tbl VALUES ('Osh'            ,	     'Uzgen',	'OS',	'UZ');
INSERT INTO @tbl VALUES ('Chuy'            ,	     'Ysyk-Ata',	'CU',	'YA');
INSERT INTO @tbl VALUES ('Ysyk-Kol'            ,	     'Ysyk-Kol',	'YK',	'YK');
INSERT INTO @tbl VALUES ('Jalal-Abad'            ,	     'Zalal-Abad',	'DA',	'ZA');

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

