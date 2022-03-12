
/* ==================================================================================
    	Source File		:	setup_lithuania_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Lithuania are set-up
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
WHERE	country_nm	=	'Lithuania';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Lithuania not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'County',
		level_2_address_component	=	'Municipality',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Siauliu Apskritis'            ,	     'Akmene',	'SH',	'AK');
INSERT INTO @tbl VALUES ('Alytaus Apskritis'            ,	     'Alytus',	'AS',	'AL');
INSERT INTO @tbl VALUES ('Alytaus Apskritis'            ,	     'Alytus [town]',	'AS',	'AT');
INSERT INTO @tbl VALUES ('Utenos Apskritis'            ,	     'Anyksciai',	'UN',	'AN');
INSERT INTO @tbl VALUES ('Kauno Apskritis'            ,	     'Birstonas',	'KS',	'BS');
INSERT INTO @tbl VALUES ('Panevezio Apskritis'            ,	     'Birzai',	'PA',	'BZ');
INSERT INTO @tbl VALUES ('Alytaus Apskritis'            ,	     'Druskininkai',	'AS',	'DR');
INSERT INTO @tbl VALUES ('Vilniaus Apskritis'            ,	     'Elektrenai',	'VI',	'EL');
INSERT INTO @tbl VALUES ('Utenos Apskritis'            ,	     'Ignalina',	'UN',	'IG');
INSERT INTO @tbl VALUES ('Kauno Apskritis'            ,	     'Jonava',	'KS',	'JV');
INSERT INTO @tbl VALUES ('Siauliu Apskritis'            ,	     'Joniskis',	'SH',	'JS');
INSERT INTO @tbl VALUES ('Taurages Apskritis'            ,	     'Jurbarkas',	'TG',	'JR');
INSERT INTO @tbl VALUES ('Kauno Apskritis'            ,	     'Kaisiadorys',	'KS',	'KA');
INSERT INTO @tbl VALUES ('Marijampoles Apskritis'            ,	     'Kalvarija',	'MA',	'KV');
INSERT INTO @tbl VALUES ('Kauno Apskritis'            ,	     'Kaunas',	'KS',	'KU');
INSERT INTO @tbl VALUES ('Kauno Apskritis'            ,	     'Kaunas [town]',	'KS',	'KN');
INSERT INTO @tbl VALUES ('Marijampoles Apskritis'            ,	     'Kazlu Ruda',	'MA',	'KR');
INSERT INTO @tbl VALUES ('Kauno Apskritis'            ,	     'Kedainiai',	'KS',	'KD');
INSERT INTO @tbl VALUES ('Siauliu Apskritis'            ,	     'Kelme',	'SH',	'KM');
INSERT INTO @tbl VALUES ('Klaipedos Apskritis'            ,	     'Klaipeda',	'KP',	'KL');
INSERT INTO @tbl VALUES ('Klaipedos Apskritis'            ,	     'Klaipeda [town]',	'KP',	'KC');
INSERT INTO @tbl VALUES ('Klaipedos Apskritis'            ,	     'Kretinga',	'KP',	'KG');
INSERT INTO @tbl VALUES ('Panevezio Apskritis'            ,	     'Kupiskis',	'PA',	'KK');
INSERT INTO @tbl VALUES ('Alytaus Apskritis'            ,	     'Lazdijai',	'AS',	'LA');
INSERT INTO @tbl VALUES ('Marijampoles Apskritis'            ,	     'Marijampole',	'MA',	'MM');
INSERT INTO @tbl VALUES ('Telsiu Apskritis'            ,	     'Mazeikiai',	'TL',	'MZ');
INSERT INTO @tbl VALUES ('Utenos Apskritis'            ,	     'Moletai',	'UN',	'ML');
INSERT INTO @tbl VALUES ('Klaipedos Apskritis'            ,	     'Neringa',	'KP',	'NE');
INSERT INTO @tbl VALUES ('Taurages Apskritis'            ,	     'Pagegiai',	'TG',	'PE');
INSERT INTO @tbl VALUES ('Siauliu Apskritis'            ,	     'Pakruojis',	'SH',	'PK');
INSERT INTO @tbl VALUES ('Klaipedos Apskritis'            ,	     'Palanga',	'KP',	'PG');
INSERT INTO @tbl VALUES ('Panevezio Apskritis'            ,	     'Panevezys',	'PA',	'PN');
INSERT INTO @tbl VALUES ('Panevezio Apskritis'            ,	     'Panevezys [town]',	'PA',	'PV');
INSERT INTO @tbl VALUES ('Panevezio Apskritis'            ,	     'Pasvalys',	'PA',	'PS');
INSERT INTO @tbl VALUES ('Telsiu Apskritis'            ,	     'Plunge',	'TL',	'PU');
INSERT INTO @tbl VALUES ('Kauno Apskritis'            ,	     'Prienai',	'KS',	'PR');
INSERT INTO @tbl VALUES ('Siauliu Apskritis'            ,	     'Radviliskis',	'SH',	'RD');
INSERT INTO @tbl VALUES ('Kauno Apskritis'            ,	     'Raseiniai',	'KS',	'RN');
INSERT INTO @tbl VALUES ('Telsiu Apskritis'            ,	     'Rietavas',	'TL',	'RT');
INSERT INTO @tbl VALUES ('Panevezio Apskritis'            ,	     'Rokiskis',	'PA',	'RK');
INSERT INTO @tbl VALUES ('Marijampoles Apskritis'            ,	     'Sakiai',	'MA',	'SK');
INSERT INTO @tbl VALUES ('Vilniaus Apskritis'            ,	     'Salcininkai',	'VI',	'SC');
INSERT INTO @tbl VALUES ('Siauliu Apskritis'            ,	     'Siauliai',	'SH',	'SA');
INSERT INTO @tbl VALUES ('Siauliu Apskritis'            ,	     'Siauliai [town]',	'SH',	'SL');
INSERT INTO @tbl VALUES ('Taurages Apskritis'            ,	     'Silale',	'TG',	'SI');
INSERT INTO @tbl VALUES ('Klaipedos Apskritis'            ,	     'Silute',	'KP',	'SE');
INSERT INTO @tbl VALUES ('Vilniaus Apskritis'            ,	     'Sirvintos',	'VI',	'ST');
INSERT INTO @tbl VALUES ('Klaipedos Apskritis'            ,	     'Skuodas',	'KP',	'SD');
INSERT INTO @tbl VALUES ('Vilniaus Apskritis'            ,	     'Svencionys',	'VI',	'SV');
INSERT INTO @tbl VALUES ('Taurages Apskritis'            ,	     'Taurage',	'TG',	'TA');
INSERT INTO @tbl VALUES ('Telsiu Apskritis'            ,	     'Telsiai',	'TL',	'TE');
INSERT INTO @tbl VALUES ('Vilniaus Apskritis'            ,	     'Trakai',	'VI',	'TK');
INSERT INTO @tbl VALUES ('Vilniaus Apskritis'            ,	     'Ukmerge',	'VI',	'UK');
INSERT INTO @tbl VALUES ('Utenos Apskritis'            ,	     'Utena',	'UN',	'UT');
INSERT INTO @tbl VALUES ('Alytaus Apskritis'            ,	     'Varena',	'AS',	'VR');
INSERT INTO @tbl VALUES ('Marijampoles Apskritis'            ,	     'Vilkaviskis',	'MA',	'VK');
INSERT INTO @tbl VALUES ('Vilniaus Apskritis'            ,	     'Vilnius',	'VI',	'VL');
INSERT INTO @tbl VALUES ('Vilniaus Apskritis'            ,	     'Vilnius [town]',	'VI',	'VN');
INSERT INTO @tbl VALUES ('Utenos Apskritis'            ,	     'Visaginas',	'UN',	'VG');
INSERT INTO @tbl VALUES ('Utenos Apskritis'            ,	     'Zarasai',	'UN',	'ZA');

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

