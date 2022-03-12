
/* ==================================================================================
    	Source File		:	setup_timor-leste_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Timor-Leste are set-up
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
WHERE	country_nm	=	'Timor-Leste';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Timor-Leste not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Territory',
		level_2_address_component	=	'Authority',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Aileu'            ,	     'Aileu',	'AL',	'AI');
INSERT INTO @tbl VALUES ('Ainaro'            ,	     'Ainaro',	'AN',	'AI');
INSERT INTO @tbl VALUES ('Manufahi'            ,	     'Alas',	'MF',	'AL');
INSERT INTO @tbl VALUES ('Bobonaro'            ,	     'Atabae',	'BB',	'AT');
INSERT INTO @tbl VALUES ('Dili'            ,	     'Atauro',	'DL',	'AT');
INSERT INTO @tbl VALUES ('Ermera'            ,	     'Atsabe',	'ER',	'AT');
INSERT INTO @tbl VALUES ('Baucau'            ,	     'Baguia',	'BC',	'BG');
INSERT INTO @tbl VALUES ('Bobonaro'            ,	     'Balibo',	'BB',	'BA');
INSERT INTO @tbl VALUES ('Manatuto'            ,	     'Barique-Natarbora',	'MT',	'BN');
INSERT INTO @tbl VALUES ('Baucau'            ,	     'Baucau',	'BC',	'BC');
INSERT INTO @tbl VALUES ('Liquica'            ,	     'Bazartete',	'LQ',	'BA');
INSERT INTO @tbl VALUES ('Bobonaro'            ,	     'Bobonaro',	'BB',	'BO');
INSERT INTO @tbl VALUES ('Bobonaro'            ,	     'Cailaco',	'BB',	'CA');
INSERT INTO @tbl VALUES ('Dili'            ,	     'Cristo Rei',	'DL',	'CR');
INSERT INTO @tbl VALUES ('Dili'            ,	     'Dom Aleixo',	'DL',	'DA');
INSERT INTO @tbl VALUES ('Ermera'            ,	     'Ermera',	'ER',	'ER');
INSERT INTO @tbl VALUES ('Manufahi'            ,	     'Fatuberliu',	'MF',	'FA');
INSERT INTO @tbl VALUES ('Cova Lima'            ,	     'Fatululic',	'CL',	'FL');
INSERT INTO @tbl VALUES ('Cova Lima'            ,	     'Fatumean',	'CL',	'FM');
INSERT INTO @tbl VALUES ('Cova Lima'            ,	     'Fohoren',	'CL',	'FO');
INSERT INTO @tbl VALUES ('Ermera'            ,	     'Hatolia',	'ER',	'HA');
INSERT INTO @tbl VALUES ('Ainaro'            ,	     'Hatu Builico',	'AN',	'HB');
INSERT INTO @tbl VALUES ('Ainaro'            ,	     'Hatu Udo',	'AN',	'HU');
INSERT INTO @tbl VALUES ('Lautem'            ,	     'Iliomar',	'BT',	'IL');
INSERT INTO @tbl VALUES ('Manatuto'            ,	     'Laclo',	'MT',	'LO');
INSERT INTO @tbl VALUES ('Manatuto'            ,	     'Laclubar',	'MT',	'LB');
INSERT INTO @tbl VALUES ('Viqueque'            ,	     'Lacluta',	'VQ',	'LA');
INSERT INTO @tbl VALUES ('Baucau'            ,	     'Laga',	'BC',	'LA');
INSERT INTO @tbl VALUES ('Manatuto'            ,	     'Laleia',	'MT',	'LL');
INSERT INTO @tbl VALUES ('Aileu'            ,	     'Laulara',	'AL',	'LA');
INSERT INTO @tbl VALUES ('Lautem'            ,	     'Lautem',	'BT',	'LA');
INSERT INTO @tbl VALUES ('Aileu'            ,	     'Lequidoe',	'AL',	'LE');
INSERT INTO @tbl VALUES ('Ermera'            ,	     'Letefoho',	'ER',	'LE');
INSERT INTO @tbl VALUES ('Liquica'            ,	     'Liquica',	'LQ',	'LI');
INSERT INTO @tbl VALUES ('Bobonaro'            ,	     'Lolotoe',	'BB',	'LO');
INSERT INTO @tbl VALUES ('Lautem'            ,	     'Lospalos',	'BT',	'LO');
INSERT INTO @tbl VALUES ('Lautem'            ,	     'Luro',	'BT',	'LU');
INSERT INTO @tbl VALUES ('Bobonaro'            ,	     'Maliana',	'BB',	'MA');
INSERT INTO @tbl VALUES ('Manatuto'            ,	     'Manatuto',	'MT',	'MA');
INSERT INTO @tbl VALUES ('Cova Lima'            ,	     'Mape-Zumalai',	'CL',	'MZ');
INSERT INTO @tbl VALUES ('Liquica'            ,	     'Maubara',	'LQ',	'MA');
INSERT INTO @tbl VALUES ('Ainaro'            ,	     'Maubisse',	'AN',	'MA');
INSERT INTO @tbl VALUES ('Cova Lima'            ,	     'Maucatar',	'CL',	'MA');
INSERT INTO @tbl VALUES ('Dili'            ,	     'Metinaro',	'DL',	'ME');
INSERT INTO @tbl VALUES ('Dili'            ,	     'Nain Feto',	'DL',	'NF');
INSERT INTO @tbl VALUES ('Ambeno'            ,	     'Nitibe',	'AM',	'NI');
INSERT INTO @tbl VALUES ('Ambeno'            ,	     'Oesilo',	'AM',	'OE');
INSERT INTO @tbl VALUES ('Viqueque'            ,	     'Ossu',	'VQ',	'OS');
INSERT INTO @tbl VALUES ('Ambeno'            ,	     'Pante Macassar',	'AM',	'PM');
INSERT INTO @tbl VALUES ('Ambeno'            ,	     'Passabe',	'AM',	'PA');
INSERT INTO @tbl VALUES ('Baucau'            ,	     'Quelicai',	'BC',	'QU');
INSERT INTO @tbl VALUES ('Ermera'            ,	     'Railaco',	'ER',	'RA');
INSERT INTO @tbl VALUES ('Aileu'            ,	     'Remexio',	'AL',	'RE');
INSERT INTO @tbl VALUES ('Manufahi'            ,	     'Same',	'MF',	'SA');
INSERT INTO @tbl VALUES ('Manatuto'            ,	     'Soibada',	'MT',	'SO');
INSERT INTO @tbl VALUES ('Cova Lima'            ,	     'Suai',	'CL',	'SU');
INSERT INTO @tbl VALUES ('Cova Lima'            ,	     'Tilomar',	'CL',	'TI');
INSERT INTO @tbl VALUES ('Manufahi'            ,	     'Turiscai',	'MF',	'TU');
INSERT INTO @tbl VALUES ('Lautem'            ,	     'Tutuala',	'BT',	'TU');
INSERT INTO @tbl VALUES ('Viqueque'            ,	     'Uatucarbau',	'VQ',	'UC');
INSERT INTO @tbl VALUES ('Viqueque'            ,	     'Uatulari',	'VQ',	'UL');
INSERT INTO @tbl VALUES ('Baucau'            ,	     'Vemasse',	'BC',	'VM');
INSERT INTO @tbl VALUES ('Baucau'            ,	     'Venilale',	'BC',	'VL');
INSERT INTO @tbl VALUES ('Dili'            ,	     'Vera Cruz',	'DL',	'VC');
INSERT INTO @tbl VALUES ('Viqueque'            ,	     'Viqueque',	'VQ',	'VI');

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

