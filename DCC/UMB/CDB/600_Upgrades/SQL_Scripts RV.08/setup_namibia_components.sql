
/* ==================================================================================
    	Source File		:	setup_namibia_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	10-10-2014
	Module ID		:	CDB
	Last updated		:	10-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Namibia are set-up
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
WHERE	country_nm	=	'Namibia';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Namibia not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Region',
		level_2_address_component	=	'Constituency',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Omaheke'            ,	     'Aminius',	'OH',	'AM');
INSERT INTO @tbl VALUES ('Omusati'            ,	     'Anamulenge',	'OS',	'AN');
INSERT INTO @tbl VALUES ('Erongo'            ,	     'Arandis',	'ER',	'AR');
INSERT INTO @tbl VALUES ('Hardap'            ,	     'Aranos',	'HA',	'AR');
INSERT INTO @tbl VALUES ('Karas'            ,	     'Berseba',	'KA',	'BE');
INSERT INTO @tbl VALUES ('Erongo'            ,	     'Daures',	'ER',	'DA');
INSERT INTO @tbl VALUES ('Hardap'            ,	     'Daweb',	'HA',	'DA');
INSERT INTO @tbl VALUES ('Oshikoto'            ,	     'Eengodi',	'OT',	'EG');
INSERT INTO @tbl VALUES ('Ohangwena'            ,	     'Eenhana',	'OW',	'EH');
INSERT INTO @tbl VALUES ('Omusati'            ,	     'Elim',	'OS',	'EL');
INSERT INTO @tbl VALUES ('Ohangwena'            ,	     'Endola',	'OW',	'ED');
INSERT INTO @tbl VALUES ('Ohangwena'            ,	     'Engela',	'OW',	'EG');
INSERT INTO @tbl VALUES ('Ohangwena'            ,	     'Epembe',	'OW',	'EP');
INSERT INTO @tbl VALUES ('Omaheke'            ,	     'Epukiro',	'OH',	'EP');
INSERT INTO @tbl VALUES ('Kunene'            ,	     'Epupa',	'KU',	'EP');
INSERT INTO @tbl VALUES ('Omusati'            ,	     'Etayi',	'OS',	'ET');
INSERT INTO @tbl VALUES ('Hardap'            ,	     'Gibeon',	'HA',	'GB');
INSERT INTO @tbl VALUES ('Omaheke'            ,	     'Gobabis',	'OH',	'GO');
INSERT INTO @tbl VALUES ('Otjozondjupa'            ,	     'Grootfontein',	'OD',	'GR');
INSERT INTO @tbl VALUES ('Oshikoto'            ,	     'Guinas',	'OT',	'GN');
INSERT INTO @tbl VALUES ('Khomas'            ,	     'John Pandeni',	'KH',	'JP');
INSERT INTO @tbl VALUES ('Zambezi'            ,	     'Judea Lyamboloma',	'CA',	'JL');
INSERT INTO @tbl VALUES ('Zambezi'            ,	     'Kabbe North',	'CA',	'KN');
INSERT INTO @tbl VALUES ('Zambezi'            ,	     'Kabbe South',	'CA',	'KS');
INSERT INTO @tbl VALUES ('Omaheke'            ,	     'Kalahari',	'OH',	'KA');
INSERT INTO @tbl VALUES ('Kunene'            ,	     'Kamanjab',	'KU',	'KA');
INSERT INTO @tbl VALUES ('Kavango West'            ,	     'Kapako',	'KW',	'KK');
INSERT INTO @tbl VALUES ('Karas'            ,	     'Karasburg East',	'KA',	'KE');
INSERT INTO @tbl VALUES ('Karas'            ,	     'Karasburg West',	'KA',	'KW');
INSERT INTO @tbl VALUES ('Erongo'            ,	     'Karibib',	'ER',	'KA');
INSERT INTO @tbl VALUES ('Zambezi'            ,	     'Katima Mulilo Rural',	'CA',	'KR');
INSERT INTO @tbl VALUES ('Zambezi'            ,	     'Katima Mulilo Urban',	'CA',	'KU');
INSERT INTO @tbl VALUES ('Khomas'            ,	     'Katutura Central',	'KH',	'KC');
INSERT INTO @tbl VALUES ('Khomas'            ,	     'Katutura East',	'KH',	'KE');
INSERT INTO @tbl VALUES ('Karas'            ,	     'Keetmanshoop Rural',	'KA',	'KR');
INSERT INTO @tbl VALUES ('Karas'            ,	     'Keetmanshoop Urban',	'KA',	'KU');
INSERT INTO @tbl VALUES ('Khomas'            ,	     'Khomasdal',	'KH',	'KN');
INSERT INTO @tbl VALUES ('Kunene'            ,	     'Khorixas',	'KU',	'KH');
INSERT INTO @tbl VALUES ('Zambezi'            ,	     'Kongola',	'CA',	'KG');
INSERT INTO @tbl VALUES ('Zambezi'            ,	     'Linyanti',	'CA',	'LY');
INSERT INTO @tbl VALUES ('Kavango West'            ,	     'Mankumpi',	'KW',	'MK');
INSERT INTO @tbl VALUES ('Hardap'            ,	     'Mariental Rural',	'HA',	'ML');
INSERT INTO @tbl VALUES ('Hardap'            ,	     'Mariental Urban',	'HA',	'MU');
INSERT INTO @tbl VALUES ('Kavango East'            ,	     'Mashare',	'KE',	'MR');
INSERT INTO @tbl VALUES ('Khomas'            ,	     'Moses ||Garoeb',	'KH',	'MG');
INSERT INTO @tbl VALUES ('Kavango West'            ,	     'Mpungu',	'KW',	'MG');
INSERT INTO @tbl VALUES ('Kavango East'            ,	     'Mukwe',	'KE',	'MU');
INSERT INTO @tbl VALUES ('Kavango West'            ,	     'Musese',	'KW',	'MS');
INSERT INTO @tbl VALUES ('Karas'            ,	     '!Nami|=Nus',	'KA',	'LU');
INSERT INTO @tbl VALUES ('Kavango West'            ,	     'Ncamagoro',	'KW',	'NG');
INSERT INTO @tbl VALUES ('Kavango West'            ,	     'Ncuncuni',	'KW',	'NC');
INSERT INTO @tbl VALUES ('Kavango East'            ,	     'Ndiyona',	'KE',	'NY');
INSERT INTO @tbl VALUES ('Kavango East'            ,	     'Ndonga Linena',	'KE',	'NL');
INSERT INTO @tbl VALUES ('Oshikoto'            ,	     'Nehale LyaMpingana',	'OT',	'NL');
INSERT INTO @tbl VALUES ('Kavango West'            ,	     'Nkurenkuru',	'KW',	'NK');
INSERT INTO @tbl VALUES ('Omusati'            ,	     'Ogongo',	'OS',	'OG');
INSERT INTO @tbl VALUES ('Ohangwena'            ,	     'Ohangwena',	'OW',	'OW');
INSERT INTO @tbl VALUES ('Otjozondjupa'            ,	     'Okahandja',	'OD',	'OD');
INSERT INTO @tbl VALUES ('Omusati'            ,	     'Okahao',	'OS',	'OK');
INSERT INTO @tbl VALUES ('Otjozondjupa'            ,	     'Okakarara',	'OD',	'OR');
INSERT INTO @tbl VALUES ('Oshana'            ,	     'Okaku',	'ON',	'OK');
INSERT INTO @tbl VALUES ('Omusati'            ,	     'Okalongo',	'OS',	'OL');
INSERT INTO @tbl VALUES ('Oshikoto'            ,	     'Okankolo',	'OT',	'OO');
INSERT INTO @tbl VALUES ('Oshana'            ,	     'Okatana',	'ON',	'OT');
INSERT INTO @tbl VALUES ('Oshana'            ,	     'Okatyali',	'ON',	'OJ');
INSERT INTO @tbl VALUES ('Ohangwena'            ,	     'Okongo',	'OW',	'OO');
INSERT INTO @tbl VALUES ('Omaheke'            ,	     'Okorukambe',	'OH',	'OK');
INSERT INTO @tbl VALUES ('Oshikoto'            ,	     'Olukonda',	'OT',	'OL');
INSERT INTO @tbl VALUES ('Erongo'            ,	     'Omaruru',	'ER',	'OM');
INSERT INTO @tbl VALUES ('Otjozondjupa'            ,	     'Omatako',	'OD',	'OM');
INSERT INTO @tbl VALUES ('Oshana'            ,	     'Ompundja',	'ON',	'OM');
INSERT INTO @tbl VALUES ('Ohangwena'            ,	     'Omulonga',	'OW',	'OL');
INSERT INTO @tbl VALUES ('Ohangwena'            ,	     'Omundaungilo',	'OW',	'ON');
INSERT INTO @tbl VALUES ('Oshikoto'            ,	     'Omuntele',	'OT',	'OT');
INSERT INTO @tbl VALUES ('Oshikoto'            ,	     'Omuthiyagwiipundi',	'OT',	'OG');
INSERT INTO @tbl VALUES ('Oshikoto'            ,	     'Onayena',	'OT',	'ON');
INSERT INTO @tbl VALUES ('Oshana'            ,	     'Ondangwa Rural',	'ON',	'OR');
INSERT INTO @tbl VALUES ('Oshana'            ,	     'Ondangwa Urban',	'ON',	'OU');
INSERT INTO @tbl VALUES ('Ohangwena'            ,	     'Ondobe',	'OW',	'OD');
INSERT INTO @tbl VALUES ('Omusati'            ,	     'Onesi',	'OS',	'ON');
INSERT INTO @tbl VALUES ('Ohangwena'            ,	     'Ongenga',	'OW',	'OG');
INSERT INTO @tbl VALUES ('Oshana'            ,	     'Ongwediva',	'ON',	'OG');
INSERT INTO @tbl VALUES ('Oshikoto'            ,	     'Oniipa',	'OT',	'OP');
INSERT INTO @tbl VALUES ('Oshikoto'            ,	     'Onyaanya',	'OT',	'OY');
INSERT INTO @tbl VALUES ('Kunene'            ,	     'Opuwo Rural',	'KU',	'OR');
INSERT INTO @tbl VALUES ('Kunene'            ,	     'Opuwo Urban',	'KU',	'OB');
INSERT INTO @tbl VALUES ('Karas'            ,	     'Oranjemund',	'KA',	'OR');
INSERT INTO @tbl VALUES ('Oshana'            ,	     'Oshakati East',	'ON',	'OE');
INSERT INTO @tbl VALUES ('Oshana'            ,	     'Oshakati West',	'ON',	'OW');
INSERT INTO @tbl VALUES ('Ohangwena'            ,	     'Oshikango',	'OW',	'OS');
INSERT INTO @tbl VALUES ('Omusati'            ,	     'Oshikuku',	'OS',	'OS');
INSERT INTO @tbl VALUES ('Ohangwena'            ,	     'Oshikunde',	'OW',	'OI');
INSERT INTO @tbl VALUES ('Omusati'            ,	     'Otamanzi',	'OS',	'OT');
INSERT INTO @tbl VALUES ('Otjozondjupa'            ,	     'Otavi',	'OD',	'OV');
INSERT INTO @tbl VALUES ('Omaheke'            ,	     'Otjinene',	'OH',	'OJ');
INSERT INTO @tbl VALUES ('Otjozondjupa'            ,	     'Otjiwarongo',	'OD',	'OW');
INSERT INTO @tbl VALUES ('Omaheke'            ,	     'Otjombinde',	'OH',	'OB');
INSERT INTO @tbl VALUES ('Omusati'            ,	     'Outapi',	'OS',	'OU');
INSERT INTO @tbl VALUES ('Kunene'            ,	     'Outjo',	'KU',	'OU');
INSERT INTO @tbl VALUES ('Hardap'            ,	     'Rehoboth Rural',	'HA',	'RR');
INSERT INTO @tbl VALUES ('Hardap'            ,	     'Rehoboth Urban East',	'HA',	'RE');
INSERT INTO @tbl VALUES ('Hardap'            ,	     'Rehoboth Urban West',	'HA',	'RW');
INSERT INTO @tbl VALUES ('Omusati'            ,	     'Ruacana',	'OS',	'RA');
INSERT INTO @tbl VALUES ('Kavango East'            ,	     'Rundu Rural',	'KE',	'RE');
INSERT INTO @tbl VALUES ('Kavango East'            ,	     'Rundu Urban',	'KE',	'RU');
INSERT INTO @tbl VALUES ('Khomas'            ,	     'Samora Machel',	'KH',	'SM');
INSERT INTO @tbl VALUES ('Kunene'            ,	     'Sesfontein',	'KU',	'SE');
INSERT INTO @tbl VALUES ('Zambezi'            ,	     'Sibbinda',	'CA',	'SI');
INSERT INTO @tbl VALUES ('Erongo'            ,	     'Swakopmund',	'ER',	'SW');
INSERT INTO @tbl VALUES ('Khomas'            ,	     'Tobias Hainyeko',	'KH',	'TH');
INSERT INTO @tbl VALUES ('Kavango West'            ,	     'Tondoro',	'KW',	'TO');
INSERT INTO @tbl VALUES ('Omusati'            ,	     'Tsandi',	'OS',	'TS');
INSERT INTO @tbl VALUES ('Oshikoto'            ,	     'Tsumeb',	'OT',	'TS');
INSERT INTO @tbl VALUES ('Otjozondjupa'            ,	     'Tsumkwe',	'OD',	'TS');
INSERT INTO @tbl VALUES ('Oshana'            ,	     'Uukwiyu',	'ON',	'UK');
INSERT INTO @tbl VALUES ('Oshana'            ,	     'Uuvudhiya',	'ON',	'UV');
INSERT INTO @tbl VALUES ('Erongo'            ,	     'Walvis Bay Rural',	'ER',	'WR');
INSERT INTO @tbl VALUES ('Erongo'            ,	     'Walvis Bay Urban',	'ER',	'WU');
INSERT INTO @tbl VALUES ('Khomas'            ,	     'Windhoek East',	'KH',	'WE');
INSERT INTO @tbl VALUES ('Khomas'            ,	     'Windhoek Rural',	'KH',	'WR');
INSERT INTO @tbl VALUES ('Khomas'            ,	     'Windhoek West',	'KH',	'WW');

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

