
/* ==================================================================================
    	Source File		:	setup_south_africa_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	12-10-2014
	Module ID		:	CDB
	Last updated		:	12-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of South_Africa are set-up
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
WHERE	country_nm	=	'South Africa';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country South_Africa not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Province',
		level_2_address_component	=	'Municipality',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Eastern Cape'            ,	     'Alfred Nzo',	'EC',	'AN');
INSERT INTO @tbl VALUES ('KwaZulu-Natal'            ,	     'Amajuba',	'NL',	'AJ');
INSERT INTO @tbl VALUES ('Eastern Cape'            ,	     'Amathole',	'EC',	'AT');
INSERT INTO @tbl VALUES ('North-West'            ,	     'Bojanala Platinum',	'NW',	'BP');
INSERT INTO @tbl VALUES ('Eastern Cape'            ,	     'Cacadu',	'EC',	'CC');
INSERT INTO @tbl VALUES ('Western Cape'            ,	     'Cape Winelands',	'WC',	'CW');
INSERT INTO @tbl VALUES ('Limpopo'            ,	     'Capricorn',	'NP',	'CP');
INSERT INTO @tbl VALUES ('Western Cape'            ,	     'Central Karoo',	'WC',	'CK');
INSERT INTO @tbl VALUES ('Eastern Cape'            ,	     'Chris Hani',	'EC',	'CH');
INSERT INTO @tbl VALUES ('Western Cape'            ,	     'City of Cape Town',	'WC',	'CT');
INSERT INTO @tbl VALUES ('Gauteng'            ,	     'City of Johannesburg',	'GT',	'JO');
INSERT INTO @tbl VALUES ('Gauteng'            ,	     'City of Tshwane',	'GT',	'TS');
INSERT INTO @tbl VALUES ('North-West'            ,	     'Dr Kenneth Kaunda',	'NW',	'KK');
INSERT INTO @tbl VALUES ('North-West'            ,	     'Dr Ruth Segomotsi Mompati',	'NW',	'RM');
INSERT INTO @tbl VALUES ('Western Cape'            ,	     'Eden',	'WC',	'ED');
INSERT INTO @tbl VALUES ('Mpumalanga'            ,	     'Ehlanzeni',	'MP',	'EH');
INSERT INTO @tbl VALUES ('Gauteng'            ,	     'Ekurhuleni',	'GT',	'EK');
INSERT INTO @tbl VALUES ('KwaZulu-Natal'            ,	     'eThekwini',	'NL',	'ET');
INSERT INTO @tbl VALUES ('Free State'            ,	     'Fezile Dabi',	'FS',	'FD');
INSERT INTO @tbl VALUES ('Northern Cape'            ,	     'Frances Baard',	'NC',	'FB');
INSERT INTO @tbl VALUES ('Mpumalanga'            ,	     'Gert Sibande',	'MP',	'GS');
INSERT INTO @tbl VALUES ('Mpumalanga'            ,	     'Greater Sekhukhune',	'MP',	'SK');
INSERT INTO @tbl VALUES ('KwaZulu-Natal'            ,	     'iLembe',	'NL',	'IL');
INSERT INTO @tbl VALUES ('Northern Cape'            ,	     'Kgalagadi',	'NC',	'KG');
INSERT INTO @tbl VALUES ('Free State'            ,	     'Lejweleputswa',	'FS',	'LE');
INSERT INTO @tbl VALUES ('Gauteng'            ,	     'Metsweding',	'GT',	'ME');
INSERT INTO @tbl VALUES ('Limpopo'            ,	     'Mopani',	'NP',	'MP');
INSERT INTO @tbl VALUES ('Free State'            ,	     'Motheo',	'FS',	'MT');
INSERT INTO @tbl VALUES ('Northern Cape'            ,	     'Namakwa',	'NC',	'NA');
INSERT INTO @tbl VALUES ('Eastern Cape'            ,	     'Nelson Mandela Bay',	'EC',	'NM');
INSERT INTO @tbl VALUES ('North-West'            ,	     'Ngaka Modiri Molema',	'NW',	'MM');
INSERT INTO @tbl VALUES ('Mpumalanga'            ,	     'Nkangala',	'MP',	'NK');
INSERT INTO @tbl VALUES ('Eastern Cape'            ,	     'O.R.Tambo',	'EC',	'TA');
INSERT INTO @tbl VALUES ('Western Cape'            ,	     'Overberg',	'WC',	'OV');
INSERT INTO @tbl VALUES ('Northern Cape'            ,	     'Pixley Ka Seme',	'NC',	'PS');
INSERT INTO @tbl VALUES ('Gauteng'            ,	     'Sedibeng',	'GT',	'SE');
INSERT INTO @tbl VALUES ('KwaZulu-Natal'            ,	     'Sisonke',	'NL',	'SS');
INSERT INTO @tbl VALUES ('Northern Cape'            ,	     'Siyanda',	'NC',	'SY');
INSERT INTO @tbl VALUES ('Free State'            ,	     'Thabo Mofutsanyane',	'FS',	'TM');
INSERT INTO @tbl VALUES ('KwaZulu-Natal'            ,	     'Ugu',	'NL',	'UG');
INSERT INTO @tbl VALUES ('Eastern Cape'            ,	     'Ukhahlamba',	'EC',	'UH');
INSERT INTO @tbl VALUES ('KwaZulu-Natal'            ,	     'uMgungundlovu',	'NL',	'UV');
INSERT INTO @tbl VALUES ('KwaZulu-Natal'            ,	     'Umkhanyakude',	'NL',	'UY');
INSERT INTO @tbl VALUES ('KwaZulu-Natal'            ,	     'Umzinyathi',	'NL',	'UZ');
INSERT INTO @tbl VALUES ('KwaZulu-Natal'            ,	     'Uthukela',	'NL',	'UL');
INSERT INTO @tbl VALUES ('KwaZulu-Natal'            ,	     'uThungulu',	'NL',	'UT');
INSERT INTO @tbl VALUES ('Limpopo'            ,	     'Vhembe',	'NP',	'VH');
INSERT INTO @tbl VALUES ('Limpopo'            ,	     'Waterberg',	'NP',	'WA');
INSERT INTO @tbl VALUES ('Western Cape'            ,	     'West Coast',	'WC',	'WC');
INSERT INTO @tbl VALUES ('Gauteng'            ,	     'West Rand',	'GT',	'WR');
INSERT INTO @tbl VALUES ('Free State'            ,	     'Xhariep',	'FS',	'XH');
INSERT INTO @tbl VALUES ('KwaZulu-Natal'            ,	     'Zululand',	'NL',	'ZU');

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

