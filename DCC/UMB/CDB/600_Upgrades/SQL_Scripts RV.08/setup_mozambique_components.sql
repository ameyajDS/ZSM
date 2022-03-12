
/* ==================================================================================
    	Source File		:	setup_mozambique_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	10-10-2014
	Module ID		:	CDB
	Last updated		:	10-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Mozambique are set-up
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
WHERE	country_nm	=	'Mozambique';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Mozambique not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Province',
		level_2_address_component	=	'District',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Zambezia'            ,	     'Alto Molocue',	'ZA',	'AM');
INSERT INTO @tbl VALUES ('Cabo Delgado'            ,	     'Ancuabe',	'CD',	'AN');
INSERT INTO @tbl VALUES ('Nampula'            ,	     'Angoche',	'NM',	'AN');
INSERT INTO @tbl VALUES ('Tete'            ,	     'Angonia',	'TE',	'AN');
INSERT INTO @tbl VALUES ('Cabo Delgado'            ,	     'Balama',	'CD',	'BA');
INSERT INTO @tbl VALUES ('Manica'            ,	     'Barue',	'MN',	'BA');
INSERT INTO @tbl VALUES ('Gaza'            ,	     'Bilene-Macia',	'GA',	'BM');
INSERT INTO @tbl VALUES ('Maputo'            ,	     'Boane',	'MP',	'BO');
INSERT INTO @tbl VALUES ('Sofala'            ,	     'Buzi',	'SO',	'BU');
INSERT INTO @tbl VALUES ('Tete'            ,	     'Cahora-Bassa',	'TE',	'CB');
INSERT INTO @tbl VALUES ('Sofala'            ,	     'Caia',	'SO',	'CA');
INSERT INTO @tbl VALUES ('Tete'            ,	     'Changara',	'TE',	'CG');
INSERT INTO @tbl VALUES ('Sofala'            ,	     'Chemba',	'SO',	'CM');
INSERT INTO @tbl VALUES ('Sofala'            ,	     'Cheringoma',	'SO',	'CR');
INSERT INTO @tbl VALUES ('Sofala'            ,	     'Chibabava',	'SO',	'CB');
INSERT INTO @tbl VALUES ('Gaza'            ,	     'Chibuto',	'GA',	'CB');
INSERT INTO @tbl VALUES ('Gaza'            ,	     'Chicualacuala',	'GA',	'CC');
INSERT INTO @tbl VALUES ('Tete'            ,	     'Chifunde',	'TE',	'CF');
INSERT INTO @tbl VALUES ('Gaza'            ,	     'Chigubo',	'GA',	'CG');
INSERT INTO @tbl VALUES ('Zambezia'            ,	     'Chinde',	'ZA',	'CH');
INSERT INTO @tbl VALUES ('Cabo Delgado'            ,	     'Chiure',	'CD',	'CH');
INSERT INTO @tbl VALUES ('Tete'            ,	     'Chiuta',	'TE',	'CT');
INSERT INTO @tbl VALUES ('Gaza'            ,	     'Chokwe',	'GA',	'CK');
INSERT INTO @tbl VALUES ('Maputo'            ,	     'Cidade da Matola',	'MP',	'MC');
INSERT INTO @tbl VALUES ('Sofala'            ,	     'Cidade de Beira',	'SO',	'BC');
INSERT INTO @tbl VALUES ('Manica'            ,	     'Cidade de Chimoio',	'MN',	'CC');
INSERT INTO @tbl VALUES ('Inhambane'            ,	     'Cidade de Inhambane',	'IN',	'IC');
INSERT INTO @tbl VALUES ('Niassa'            ,	     'Cidade de Lichinga',	'NS',	'LC');
INSERT INTO @tbl VALUES ('Inhambane'            ,	     'Cidade de Maxixe',	'IN',	'MC');
INSERT INTO @tbl VALUES ('Nampula'            ,	     'Cidade de Nacala-Porto',	'NM',	'NP');
INSERT INTO @tbl VALUES ('Nampula'            ,	     'Cidade de Nampula',	'NM',	'NC');
INSERT INTO @tbl VALUES ('Cabo Delgado'            ,	     'Cidade de Pemba',	'CD',	'PC');
INSERT INTO @tbl VALUES ('Zambezia'            ,	     'Cidade de Quelimane',	'ZA',	'QC');
INSERT INTO @tbl VALUES ('Tete'            ,	     'Cidade de Tete',	'TE',	'TC');
INSERT INTO @tbl VALUES ('Gaza'            ,	     'Cidade de Xai-Xai',	'GA',	'XC');
INSERT INTO @tbl VALUES ('Niassa'            ,	     'Cuamba',	'NS',	'CU');
INSERT INTO @tbl VALUES ('Maputo [city]'            ,	     'Distrito Urbano No 1',	'MC',	'DU');
INSERT INTO @tbl VALUES ('Maputo [city]'            ,	     'Distrito Urbano No 2',	'MC',	'DD');
INSERT INTO @tbl VALUES ('Maputo [city]'            ,	     'Distrito Urbano No 3',	'MC',	'DT');
INSERT INTO @tbl VALUES ('Maputo [city]'            ,	     'Distrito Urbano No 4',	'MC',	'DQ');
INSERT INTO @tbl VALUES ('Maputo [city]'            ,	     'Distrito Urbano No 5',	'MC',	'DC');
INSERT INTO @tbl VALUES ('Sofala'            ,	     'Dondo',	'SO',	'DO');
INSERT INTO @tbl VALUES ('Inhambane'            ,	     'Funhalouro',	'IN',	'FU');
INSERT INTO @tbl VALUES ('Zambezia'            ,	     'Gile',	'ZA',	'GI');
INSERT INTO @tbl VALUES ('Manica'            ,	     'Gondola',	'MN',	'GO');
INSERT INTO @tbl VALUES ('Sofala'            ,	     'Gorongosa',	'SO',	'GO');
INSERT INTO @tbl VALUES ('Inhambane'            ,	     'Govuro',	'IN',	'GO');
INSERT INTO @tbl VALUES ('Gaza'            ,	     'Guija',	'GA',	'GU');
INSERT INTO @tbl VALUES ('Manica'            ,	     'Guro',	'MN',	'GU');
INSERT INTO @tbl VALUES ('Zambezia'            ,	     'Gurue',	'ZA',	'GU');
INSERT INTO @tbl VALUES ('Inhambane'            ,	     'Homoine',	'IN',	'HO');
INSERT INTO @tbl VALUES ('Cabo Delgado'            ,	     'Ibo',	'CD',	'IB');
INSERT INTO @tbl VALUES ('Zambezia'            ,	     'Ile',	'ZA',	'IL');
INSERT INTO @tbl VALUES ('Nampula'            ,	     'Ilha de Mocambique',	'NM',	'IM');
INSERT INTO @tbl VALUES ('Inhambane'            ,	     'Inharrime',	'IN',	'IR');
INSERT INTO @tbl VALUES ('Inhambane'            ,	     'Inhassoro',	'IN',	'IS');
INSERT INTO @tbl VALUES ('Zambezia'            ,	     'Inhassunge',	'ZA',	'IN');
INSERT INTO @tbl VALUES ('Inhambane'            ,	     'Jangamo',	'IN',	'JA');
INSERT INTO @tbl VALUES ('Niassa'            ,	     'Lago',	'NS',	'LA');
INSERT INTO @tbl VALUES ('Nampula'            ,	     'Lalaua',	'NM',	'LA');
INSERT INTO @tbl VALUES ('Niassa'            ,	     'Lichinga',	'NS',	'LI');
INSERT INTO @tbl VALUES ('Zambezia'            ,	     'Lugela',	'ZA',	'LU');
INSERT INTO @tbl VALUES ('Gaza'            ,	     'Mabalane',	'GA',	'MB');
INSERT INTO @tbl VALUES ('Inhambane'            ,	     'Mabote',	'IN',	'MB');
INSERT INTO @tbl VALUES ('Tete'            ,	     'Macanga',	'TE',	'MC');
INSERT INTO @tbl VALUES ('Sofala'            ,	     'Machanga',	'SO',	'MC');
INSERT INTO @tbl VALUES ('Manica'            ,	     'Machaze',	'MN',	'MZ');
INSERT INTO @tbl VALUES ('Cabo Delgado'            ,	     'Macomia',	'CD',	'MA');
INSERT INTO @tbl VALUES ('Manica'            ,	     'Macossa',	'MN',	'MS');
INSERT INTO @tbl VALUES ('Zambezia'            ,	     'Maganja da Costa',	'ZA',	'MC');
INSERT INTO @tbl VALUES ('Tete'            ,	     'Magoe',	'TE',	'MG');
INSERT INTO @tbl VALUES ('Maputo'            ,	     'Magude',	'MP',	'MG');
INSERT INTO @tbl VALUES ('Niassa'            ,	     'Majune',	'NS',	'MJ');
INSERT INTO @tbl VALUES ('Nampula'            ,	     'Malema',	'NM',	'MA');
INSERT INTO @tbl VALUES ('Niassa'            ,	     'Mandimba',	'NS',	'MN');
INSERT INTO @tbl VALUES ('Maputo'            ,	     'Manhica',	'MP',	'MN');
INSERT INTO @tbl VALUES ('Manica'            ,	     'Manica',	'MN',	'MN');
INSERT INTO @tbl VALUES ('Gaza'            ,	     'Manjacaze',	'GA',	'MJ');
INSERT INTO @tbl VALUES ('Tete'            ,	     'Maravia',	'TE',	'MR');
INSERT INTO @tbl VALUES ('Sofala'            ,	     'Maringue',	'SO',	'MG');
INSERT INTO @tbl VALUES ('Maputo'            ,	     'Marracuene',	'MP',	'MR');
INSERT INTO @tbl VALUES ('Sofala'            ,	     'Marromeu',	'SO',	'MM');
INSERT INTO @tbl VALUES ('Niassa'            ,	     'Marrupa',	'NS',	'MR');
INSERT INTO @tbl VALUES ('Gaza'            ,	     'Massangena',	'GA',	'MS');
INSERT INTO @tbl VALUES ('Inhambane'            ,	     'Massinga',	'IN',	'MS');
INSERT INTO @tbl VALUES ('Gaza'            ,	     'Massingir',	'GA',	'MG');
INSERT INTO @tbl VALUES ('Maputo'            ,	     'Matutuine',	'MP',	'MT');
INSERT INTO @tbl VALUES ('Niassa'            ,	     'Maua',	'NS',	'MU');
INSERT INTO @tbl VALUES ('Niassa'            ,	     'Mavago',	'NS',	'MV');
INSERT INTO @tbl VALUES ('Niassa'            ,	     'Mecanhelas',	'NS',	'MS');
INSERT INTO @tbl VALUES ('Nampula'            ,	     'Meconta',	'NM',	'MC');
INSERT INTO @tbl VALUES ('Nampula'            ,	     'Mecuburi',	'NM',	'MB');
INSERT INTO @tbl VALUES ('Cabo Delgado'            ,	     'Mecufi',	'CD',	'MC');
INSERT INTO @tbl VALUES ('Niassa'            ,	     'Mecula',	'NS',	'MC');
INSERT INTO @tbl VALUES ('Cabo Delgado'            ,	     'Meluco',	'CD',	'ML');
INSERT INTO @tbl VALUES ('Nampula'            ,	     'Memba',	'NM',	'MM');
INSERT INTO @tbl VALUES ('Niassa'            ,	     'Metarica',	'NS',	'MT');
INSERT INTO @tbl VALUES ('Zambezia'            ,	     'Milange',	'ZA',	'ML');
INSERT INTO @tbl VALUES ('Maputo'            ,	     'Moamba',	'MP',	'MO');
INSERT INTO @tbl VALUES ('Tete'            ,	     'Moatize',	'TE',	'MT');
INSERT INTO @tbl VALUES ('Cabo Delgado'            ,	     'Mocimboa da Praia',	'CD',	'MP');
INSERT INTO @tbl VALUES ('Zambezia'            ,	     'Mocuba',	'ZA',	'MB');
INSERT INTO @tbl VALUES ('Nampula'            ,	     'Mogincual',	'NM',	'MG');
INSERT INTO @tbl VALUES ('Nampula'            ,	     'Mogovolas',	'NM',	'MV');
INSERT INTO @tbl VALUES ('Nampula'            ,	     'Moma',	'NM',	'MO');
INSERT INTO @tbl VALUES ('Nampula'            ,	     'Monapo',	'NM',	'MN');
INSERT INTO @tbl VALUES ('Cabo Delgado'            ,	     'Montepuez',	'CD',	'MN');
INSERT INTO @tbl VALUES ('Zambezia'            ,	     'Mopeia',	'ZA',	'MP');
INSERT INTO @tbl VALUES ('Zambezia'            ,	     'Morrumbala',	'ZA',	'MR');
INSERT INTO @tbl VALUES ('Inhambane'            ,	     'Morrumbene',	'IN',	'MO');
INSERT INTO @tbl VALUES ('Nampula'            ,	     'Mossuril',	'NM',	'MS');
INSERT INTO @tbl VALUES ('Manica'            ,	     'Mossurize',	'MN',	'MO');
INSERT INTO @tbl VALUES ('Sofala'            ,	     'Muanza',	'SO',	'MU');
INSERT INTO @tbl VALUES ('Nampula'            ,	     'Muecate',	'NM',	'MU');
INSERT INTO @tbl VALUES ('Cabo Delgado'            ,	     'Mueda',	'CD',	'MD');
INSERT INTO @tbl VALUES ('Niassa'            ,	     'Muembe',	'NS',	'MM');
INSERT INTO @tbl VALUES ('Cabo Delgado'            ,	     'Muidumbe',	'CD',	'MB');
INSERT INTO @tbl VALUES ('Nampula'            ,	     'Murrupula',	'NM',	'MR');
INSERT INTO @tbl VALUES ('Tete'            ,	     'Mutarara',	'TE',	'MU');
INSERT INTO @tbl VALUES ('Nampula'            ,	     'Nacala-Velha',	'NM',	'NV');
INSERT INTO @tbl VALUES ('Nampula'            ,	     'Nacaroa',	'NM',	'NR');
INSERT INTO @tbl VALUES ('Maputo'            ,	     'Namaacha',	'MP',	'NA');
INSERT INTO @tbl VALUES ('Zambezia'            ,	     'Namacurra',	'ZA',	'NC');
INSERT INTO @tbl VALUES ('Nampula'            ,	     'Namapa-Erati',	'NM',	'NE');
INSERT INTO @tbl VALUES ('Zambezia'            ,	     'Namaroi',	'ZA',	'NR');
INSERT INTO @tbl VALUES ('Cabo Delgado'            ,	     'Namuno',	'CD',	'NM');
INSERT INTO @tbl VALUES ('Cabo Delgado'            ,	     'Nangade',	'CD',	'NG');
INSERT INTO @tbl VALUES ('Niassa'            ,	     'N''gauma',	'NS',	'NG');
INSERT INTO @tbl VALUES ('Sofala'            ,	     'Nhamatanda',	'SO',	'NH');
INSERT INTO @tbl VALUES ('Zambezia'            ,	     'Nicoadala',	'ZA',	'NI');
INSERT INTO @tbl VALUES ('Niassa'            ,	     'Nipepe',	'NS',	'NI');
INSERT INTO @tbl VALUES ('Cabo Delgado'            ,	     'Palma',	'CD',	'PA');
INSERT INTO @tbl VALUES ('Inhambane'            ,	     'Panda',	'IN',	'PA');
INSERT INTO @tbl VALUES ('Zambezia'            ,	     'Pebane',	'ZA',	'PE');
INSERT INTO @tbl VALUES ('Cabo Delgado'            ,	     'Pemba-Metuge',	'CD',	'PM');
INSERT INTO @tbl VALUES ('Cabo Delgado'            ,	     'Quissanga',	'CD',	'QU');
INSERT INTO @tbl VALUES ('Nampula'            ,	     'Rapale-Nampula',	'NM',	'RN');
INSERT INTO @tbl VALUES ('Nampula'            ,	     'Ribaue',	'NM',	'RI');
INSERT INTO @tbl VALUES ('Niassa'            ,	     'Sanga',	'NS',	'SA');
INSERT INTO @tbl VALUES ('Manica'            ,	     'Sussundenga',	'MN',	'SU');
INSERT INTO @tbl VALUES ('Manica'            ,	     'Tambara',	'MN',	'TA');
INSERT INTO @tbl VALUES ('Tete'            ,	     'Tsangano',	'TE',	'TS');
INSERT INTO @tbl VALUES ('Inhambane'            ,	     'Vilankulo',	'IN',	'VI');
INSERT INTO @tbl VALUES ('Gaza'            ,	     'Xai-Xai',	'GA',	'XX');
INSERT INTO @tbl VALUES ('Inhambane'            ,	     'Zavala',	'IN',	'ZA');
INSERT INTO @tbl VALUES ('Tete'            ,	     'Zumbo',	'TE',	'ZU');

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

