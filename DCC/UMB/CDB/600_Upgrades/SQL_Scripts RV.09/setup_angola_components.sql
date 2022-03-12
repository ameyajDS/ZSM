
/* ==================================================================================
    	Source File		:	setup_angola_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Angola are set-up
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
WHERE	country_nm	=	'Angola';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Angola not found', 16, 1);
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

INSERT INTO @tbl VALUES ('Uige'            ,	     'Alto Cauale',	'UI',	'AC');
INSERT INTO @tbl VALUES ('Moxico'            ,	     'Alto Zambeze',	'MX',	'AZ');
INSERT INTO @tbl VALUES ('Kwanza-Norte'            ,	     'Ambaca',	'CN',	'AM');
INSERT INTO @tbl VALUES ('Kwanza-Sul'            ,	     'Amboim',	'CS',	'AM');
INSERT INTO @tbl VALUES ('Bengo'            ,	     'Ambriz',	'BO',	'AM');
INSERT INTO @tbl VALUES ('Uige'            ,	     'Ambuila',	'UI',	'AM');
INSERT INTO @tbl VALUES ('Bie'            ,	     'Andulo',	'BI',	'AN');
INSERT INTO @tbl VALUES ('Benguela'            ,	     'Baia Farta',	'BG',	'BF');
INSERT INTO @tbl VALUES ('Huambo'            ,	     'Bailundo',	'HM',	'BA');
INSERT INTO @tbl VALUES ('Benguela'            ,	     'Balombo',	'BG',	'BA');
INSERT INTO @tbl VALUES ('Kwanza-Norte'            ,	     'Banga',	'CN',	'BN');
INSERT INTO @tbl VALUES ('Cabinda'            ,	     'Belize',	'CB',	'BE');
INSERT INTO @tbl VALUES ('Uige'            ,	     'Bembe',	'UI',	'BE');
INSERT INTO @tbl VALUES ('Benguela'            ,	     'Benguela',	'BG',	'BE');
INSERT INTO @tbl VALUES ('Namibe'            ,	     'Bibala',	'NA',	'BI');
INSERT INTO @tbl VALUES ('Benguela'            ,	     'Bocoio',	'BG',	'BO');
INSERT INTO @tbl VALUES ('Kwanza-Norte'            ,	     'Bolongongo',	'CN',	'BO');
INSERT INTO @tbl VALUES ('Cabinda'            ,	     'Buco-Zau',	'CB',	'BZ');
INSERT INTO @tbl VALUES ('Uige'            ,	     'Buengas',	'UI',	'BU');
INSERT INTO @tbl VALUES ('Bengo'            ,	     'Bula Atumba',	'BO',	'BA');
INSERT INTO @tbl VALUES ('Moxico'            ,	     'Bundas',	'MX',	'BU');
INSERT INTO @tbl VALUES ('Huambo'            ,	     'Caala',	'HM',	'CA');
INSERT INTO @tbl VALUES ('Cabinda'            ,	     'Cabinda',	'CB',	'CB');
INSERT INTO @tbl VALUES ('Lunda-Sul'            ,	     'Cacolo',	'LS',	'CA');
INSERT INTO @tbl VALUES ('Huila'            ,	     'Caconda',	'HL',	'CC');
INSERT INTO @tbl VALUES ('Cabinda'            ,	     'Cacongo',	'CB',	'CC');
INSERT INTO @tbl VALUES ('Luanda'            ,	     'Cacuaco',	'LU',	'CC');
INSERT INTO @tbl VALUES ('Malanje'            ,	     'Cacuzo',	'ML',	'CR');
INSERT INTO @tbl VALUES ('Cunene'            ,	     'Cahama',	'CU',	'CA');
INSERT INTO @tbl VALUES ('Benguela'            ,	     'Caiambambo',	'BG',	'CA');
INSERT INTO @tbl VALUES ('Kuando Kubango'            ,	     'Calai',	'CC',	'CA');
INSERT INTO @tbl VALUES ('Malanje'            ,	     'Calandula',	'ML',	'CL');
INSERT INTO @tbl VALUES ('Huila'            ,	     'Caluquembe',	'HL',	'CQ');
INSERT INTO @tbl VALUES ('Namibe'            ,	     'Camacuio',	'NA',	'CA');
INSERT INTO @tbl VALUES ('Bie'            ,	     'Camacupa',	'BI',	'CP');
INSERT INTO @tbl VALUES ('Moxico'            ,	     'Camanongue',	'MX',	'CN');
INSERT INTO @tbl VALUES ('Kwanza-Norte'            ,	     'Cambambe',	'CN',	'CN');
INSERT INTO @tbl VALUES ('Lunda-Norte'            ,	     'Cambulo',	'LN',	'CB');
INSERT INTO @tbl VALUES ('Malanje'            ,	     'Cambundi-Catembo',	'ML',	'CC');
INSERT INTO @tbl VALUES ('Moxico'            ,	     'Cameia',	'MX',	'CA');
INSERT INTO @tbl VALUES ('Lunda-Norte'            ,	     'Camulemba',	'LN',	'CM');
INSERT INTO @tbl VALUES ('Malanje'            ,	     'Cangandala',	'ML',	'CG');
INSERT INTO @tbl VALUES ('Malanje'            ,	     'Caombo',	'ML',	'CO');
INSERT INTO @tbl VALUES ('Lunda-Norte'            ,	     'Capenda',	'LN',	'CP');
INSERT INTO @tbl VALUES ('Kwanza-Sul'            ,	     'Cassongue',	'CS',	'CA');
INSERT INTO @tbl VALUES ('Bie'            ,	     'Catabola',	'BI',	'CB');
INSERT INTO @tbl VALUES ('Huambo'            ,	     'Catchiungo',	'HM',	'CT');
INSERT INTO @tbl VALUES ('Lunda-Norte'            ,	     'Caungula',	'LN',	'CU');
INSERT INTO @tbl VALUES ('Luanda'            ,	     'Cazenga',	'LU',	'CZ');
INSERT INTO @tbl VALUES ('Kwanza-Norte'            ,	     'Cazengo',	'CN',	'CZ');
INSERT INTO @tbl VALUES ('Huila'            ,	     'Chiange',	'HL',	'CG');
INSERT INTO @tbl VALUES ('Huila'            ,	     'Chibia',	'HL',	'CB');
INSERT INTO @tbl VALUES ('Huila'            ,	     'Chicomba',	'HL',	'CH');
INSERT INTO @tbl VALUES ('Bie'            ,	     'Chinguar',	'BI',	'CG');
INSERT INTO @tbl VALUES ('Huila'            ,	     'Chipindo',	'HL',	'CP');
INSERT INTO @tbl VALUES ('Lunda-Norte'            ,	     'Chitato',	'LN',	'CH');
INSERT INTO @tbl VALUES ('Bie'            ,	     'Chitembo',	'BI',	'CH');
INSERT INTO @tbl VALUES ('Benguela'            ,	     'Chongoroi',	'BG',	'CH');
INSERT INTO @tbl VALUES ('Kwanza-Sul'            ,	     'Conda',	'CS',	'CO');
INSERT INTO @tbl VALUES ('Malanje'            ,	     'Cuaba Nzogo',	'ML',	'CN');
INSERT INTO @tbl VALUES ('Kuando Kubango'            ,	     'Cuangar',	'CC',	'CN');
INSERT INTO @tbl VALUES ('Lunda-Norte'            ,	     'Cuango',	'LN',	'CN');
INSERT INTO @tbl VALUES ('Cunene'            ,	     'Cuanhama',	'CU',	'CN');
INSERT INTO @tbl VALUES ('Benguela'            ,	     'Cubal',	'BG',	'CU');
INSERT INTO @tbl VALUES ('Kuando Kubango'            ,	     'Cuchi',	'CC',	'CH');
INSERT INTO @tbl VALUES ('Bie'            ,	     'Cuemba',	'BI',	'CM');
INSERT INTO @tbl VALUES ('Lunda-Norte'            ,	     'Cuilo',	'LN',	'CL');
INSERT INTO @tbl VALUES ('Zaire'            ,	     'Cuimba',	'ZA',	'CU');
INSERT INTO @tbl VALUES ('Kuando Kubango'            ,	     'Cuito Cuanavale',	'CC',	'CC');
INSERT INTO @tbl VALUES ('Malanje'            ,	     'Cunda-dia-Baza',	'ML',	'CD');
INSERT INTO @tbl VALUES ('Bie'            ,	     'Cunhinga',	'BI',	'CN');
INSERT INTO @tbl VALUES ('Cunene'            ,	     'Curoca',	'CU',	'CR');
INSERT INTO @tbl VALUES ('Cunene'            ,	     'Cuvelai',	'CU',	'CV');
INSERT INTO @tbl VALUES ('Lunda-Sul'            ,	     'Dala',	'LS',	'DA');
INSERT INTO @tbl VALUES ('Uige'            ,	     'Damba',	'UI',	'DA');
INSERT INTO @tbl VALUES ('Bengo'            ,	     'Dande',	'BO',	'DA');
INSERT INTO @tbl VALUES ('Kwanza-Norte'            ,	     'Dembos',	'CN',	'DE');
INSERT INTO @tbl VALUES ('Kuando Kubango'            ,	     'Dirico',	'CC',	'DI');
INSERT INTO @tbl VALUES ('Kwanza-Sul'            ,	     'Ebo',	'CS',	'EB');
INSERT INTO @tbl VALUES ('Huambo'            ,	     'Ekunha',	'HM',	'EK');
INSERT INTO @tbl VALUES ('Benguela'            ,	     'Ganda',	'BG',	'GA');
INSERT INTO @tbl VALUES ('Kwanza-Norte'            ,	     'Golungo Alto',	'CN',	'GA');
INSERT INTO @tbl VALUES ('Kwanza-Norte'            ,	     'Gonguembo',	'CN',	'GO');
INSERT INTO @tbl VALUES ('Huambo'            ,	     'Huambo',	'HM',	'HU');
INSERT INTO @tbl VALUES ('Huila'            ,	     'Humpata',	'HL',	'HU');
INSERT INTO @tbl VALUES ('Bengo'            ,	     'Icolo e Bengo',	'BO',	'IB');
INSERT INTO @tbl VALUES ('Luanda'            ,	     'Ingombota',	'LU',	'IN');
INSERT INTO @tbl VALUES ('Huila'            ,	     'Jamba',	'HL',	'JA');
INSERT INTO @tbl VALUES ('Luanda'            ,	     'Kilamba Kiaxi',	'LU',	'KK');
INSERT INTO @tbl VALUES ('Bie'            ,	     'Kuito',	'BI',	'KU');
INSERT INTO @tbl VALUES ('Huila'            ,	     'Kuvango',	'HL',	'KU');
INSERT INTO @tbl VALUES ('Moxico'            ,	     'Leua',	'MX',	'LE');
INSERT INTO @tbl VALUES ('Kwanza-Sul'            ,	     'Libolo',	'CS',	'LI');
INSERT INTO @tbl VALUES ('Benguela'            ,	     'Lobito',	'BG',	'LO');
INSERT INTO @tbl VALUES ('Huambo'            ,	     'Londuimbale',	'HM',	'LD');
INSERT INTO @tbl VALUES ('Kuando Kubango'            ,	     'Longa',	'CC',	'LO');
INSERT INTO @tbl VALUES ('Huambo'            ,	     'Longonjo',	'HM',	'LG');
INSERT INTO @tbl VALUES ('Moxico'            ,	     'Luau',	'MX',	'LU');
INSERT INTO @tbl VALUES ('Lunda-Norte'            ,	     'Lubalo',	'LN',	'LU');
INSERT INTO @tbl VALUES ('Huila'            ,	     'Lubango',	'HL',	'LU');
INSERT INTO @tbl VALUES ('Kwanza-Norte'            ,	     'Lucala',	'CN',	'LU');
INSERT INTO @tbl VALUES ('Moxico'            ,	     'Lucano',	'MX',	'LN');
INSERT INTO @tbl VALUES ('Moxico'            ,	     'Luchazes',	'MX',	'LZ');
INSERT INTO @tbl VALUES ('Malanje'            ,	     'Luquembo',	'ML',	'LU');
INSERT INTO @tbl VALUES ('Uige'            ,	     'Macocola',	'UI',	'MA');
INSERT INTO @tbl VALUES ('Luanda'            ,	     'Maianga',	'LU',	'MA');
INSERT INTO @tbl VALUES ('Malanje'            ,	     'Malanje',	'ML',	'ML');
INSERT INTO @tbl VALUES ('Malanje'            ,	     'Marimba',	'ML',	'MR');
INSERT INTO @tbl VALUES ('Malanje'            ,	     'Massango',	'ML',	'MS');
INSERT INTO @tbl VALUES ('Huila'            ,	     'Matala',	'HL',	'MA');
INSERT INTO @tbl VALUES ('Kuando Kubango'            ,	     'Mavinga',	'CC',	'MA');
INSERT INTO @tbl VALUES ('Zaire'            ,	     'M''Banza Congo',	'ZA',	'MK');
INSERT INTO @tbl VALUES ('Kuando Kubango'            ,	     'Menongue',	'CC',	'ME');
INSERT INTO @tbl VALUES ('Moxico'            ,	     'Moxico',	'MX',	'MO');
INSERT INTO @tbl VALUES ('Uige'            ,	     'Mucaba',	'UI',	'MU');
INSERT INTO @tbl VALUES ('Malanje'            ,	     'Mucari',	'ML',	'MU');
INSERT INTO @tbl VALUES ('Lunda-Sul'            ,	     'Muconda',	'LS',	'MU');
INSERT INTO @tbl VALUES ('Huambo'            ,	     'Mungo',	'HM',	'MU');
INSERT INTO @tbl VALUES ('Kwanza-Sul'            ,	     'Mussende',	'CS',	'MU');
INSERT INTO @tbl VALUES ('Bengo'            ,	     'Muxima',	'BO',	'MU');
INSERT INTO @tbl VALUES ('Cunene'            ,	     'Namacunde',	'CU',	'NA');
INSERT INTO @tbl VALUES ('Bengo'            ,	     'Nambuangongo',	'BO',	'NA');
INSERT INTO @tbl VALUES ('Namibe'            ,	     'Namibe',	'NA',	'NA');
INSERT INTO @tbl VALUES ('Uige'            ,	     'Negage',	'UI',	'NE');
INSERT INTO @tbl VALUES ('Bie'            ,	     'Nharea',	'BI',	'NH');
INSERT INTO @tbl VALUES ('Zaire'            ,	     'Noqui',	'ZA',	'NO');
INSERT INTO @tbl VALUES ('Zaire'            ,	     'N''Zeto',	'ZA',	'NZ');
INSERT INTO @tbl VALUES ('Cunene'            ,	     'Ombadja',	'CU',	'OM');
INSERT INTO @tbl VALUES ('Bengo'            ,	     'Pango Aluquem',	'BO',	'PA');
INSERT INTO @tbl VALUES ('Kwanza-Sul'            ,	     'Porto Amboim',	'CS',	'PA');
INSERT INTO @tbl VALUES ('Uige'            ,	     'Puri',	'UI',	'PU');
INSERT INTO @tbl VALUES ('Malanje'            ,	     'Quela',	'ML',	'QL');
INSERT INTO @tbl VALUES ('Kwanza-Sul'            ,	     'Quibala',	'CS',	'QB');
INSERT INTO @tbl VALUES ('Kwanza-Norte'            ,	     'Quiculungo',	'CN',	'QU');
INSERT INTO @tbl VALUES ('Kwanza-Sul'            ,	     'Quilenda',	'CS',	'QL');
INSERT INTO @tbl VALUES ('Huila'            ,	     'Quilengues',	'HL',	'QL');
INSERT INTO @tbl VALUES ('Uige'            ,	     'Quimbele',	'UI',	'QM');
INSERT INTO @tbl VALUES ('Huila'            ,	     'Quipungo',	'HL',	'QP');
INSERT INTO @tbl VALUES ('Malanje'            ,	     'Quirima',	'ML',	'QR');
INSERT INTO @tbl VALUES ('Uige'            ,	     'Quitexe',	'UI',	'QT');
INSERT INTO @tbl VALUES ('Luanda'            ,	     'Rangel',	'LU',	'RA');
INSERT INTO @tbl VALUES ('Kuando Kubango'            ,	     'Rivungo',	'CC',	'RI');
INSERT INTO @tbl VALUES ('Luanda'            ,	     'Samba',	'LU',	'SA');
INSERT INTO @tbl VALUES ('Kwanza-Norte'            ,	     'Samba Caju',	'CN',	'SC');
INSERT INTO @tbl VALUES ('Luanda'            ,	     'Sambizanga',	'LU',	'SZ');
INSERT INTO @tbl VALUES ('Uige'            ,	     'Sanza Pombo',	'UI',	'SP');
INSERT INTO @tbl VALUES ('Lunda-Sul'            ,	     'Saurimo',	'LS',	'SA');
INSERT INTO @tbl VALUES ('Kwanza-Sul'            ,	     'Seles',	'CS',	'SE');
INSERT INTO @tbl VALUES ('Uige'            ,	     'Songo',	'UI',	'SO');
INSERT INTO @tbl VALUES ('Zaire'            ,	     'Soyo',	'ZA',	'SO');
INSERT INTO @tbl VALUES ('Kwanza-Sul'            ,	     'Sumbe',	'CS',	'SU');
INSERT INTO @tbl VALUES ('Huambo'            ,	     'Tchicala-Tcholoanga',	'HM',	'TT');
INSERT INTO @tbl VALUES ('Huambo'            ,	     'Tchindjenje',	'HM',	'TJ');
INSERT INTO @tbl VALUES ('Lunda-Norte'            ,	     'Tchitato',	'LN',	'TC');
INSERT INTO @tbl VALUES ('Zaire'            ,	     'Tomboco',	'ZA',	'TO');
INSERT INTO @tbl VALUES ('Namibe'            ,	     'Tombwa',	'NA',	'TO');
INSERT INTO @tbl VALUES ('Huambo'            ,	     'Ucuma',	'HM',	'UC');
INSERT INTO @tbl VALUES ('Uige'            ,	     'Uige',	'UI',	'UI');
INSERT INTO @tbl VALUES ('Luanda'            ,	     'Viana',	'LU',	'VI');
INSERT INTO @tbl VALUES ('Namibe'            ,	     'Virei',	'NA',	'VI');
INSERT INTO @tbl VALUES ('Kwanza-Sul'            ,	     'Waku Kungo',	'CS',	'WK');
INSERT INTO @tbl VALUES ('Lunda-Norte'            ,	     'Xa Muteba',	'LN',	'XM');
INSERT INTO @tbl VALUES ('Uige'            ,	     'Zombo',	'UI',	'ZO');

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

