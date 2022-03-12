
/* ==================================================================================
    	Source File		:	setup_kazakhstan_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	12-10-2014
	Module ID		:	CDB
	Last updated		:	12-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Kazakhstan are set-up
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
WHERE	country_nm	=	'Kazakhstan';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Kazakhstan not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Region',
		level_2_address_component	=	'Rayon',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('East Kazakhstan'            ,	     'Abayskiy',	'EK',	'AB');
INSERT INTO @tbl VALUES ('North Kazakhstan'            ,	     'Akkayynskiy',	'NK',	'AK');
INSERT INTO @tbl VALUES ('Aqmola'            ,	     'Akkol`skiy',	'AM',	'AK');
INSERT INTO @tbl VALUES ('Pavlodar'            ,	     'Aksu',	'PA',	'AS');
INSERT INTO @tbl VALUES ('Almaty'            ,	     'Aksuskiy',	'AA',	'AK');
INSERT INTO @tbl VALUES ('Pavlodar'            ,	     'Aktogayskiy',	'PA',	'AT');
INSERT INTO @tbl VALUES ('West Kazakhstan'            ,	     'Akzhaikskiy',	'WK',	'AK');
INSERT INTO @tbl VALUES ('North Kazakhstan'            ,	     'Akzharskiy',	'NK',	'AZ');
INSERT INTO @tbl VALUES ('Almaty'            ,	     'Alakolskiy',	'AA',	'AL');
INSERT INTO @tbl VALUES ('Aqtobe'            ,	     'Alginskiy',	'AT',	'AL');
INSERT INTO @tbl VALUES ('Almaty [City]'            ,	     'Almalinskiy',	'AC',	'AL');
INSERT INTO @tbl VALUES ('Qostanay'            ,	     'Altynsarinskiy',	'QS',	'AL');
INSERT INTO @tbl VALUES ('Qostanay'            ,	     'Amangel`dinskiy',	'QS',	'AM');
INSERT INTO @tbl VALUES ('Mangghystau'            ,	     'Aqtau',	'MG',	'AQ');
INSERT INTO @tbl VALUES ('Aqtobe'            ,	     'Aqtobe',	'AT',	'AQ');
INSERT INTO @tbl VALUES ('Qyzylorda'            ,	     'Aral`skiy',	'QO',	'AR');
INSERT INTO @tbl VALUES ('Qostanay'            ,	     'Arkalyk',	'QS',	'AR');
INSERT INTO @tbl VALUES ('Aqmola'            ,	     'Arshalynskiy',	'AM',	'AR');
INSERT INTO @tbl VALUES ('South Kazakhstan'            ,	     'Arysskiy',	'SK',	'AR');
INSERT INTO @tbl VALUES ('Astana'            ,	     'Astana',	'AS',	'AS');
INSERT INTO @tbl VALUES ('Aqmola'            ,	     'Astrakhansiy',	'AM',	'AS');
INSERT INTO @tbl VALUES ('Aqmola'            ,	     'Atbasarskiy',	'AM',	'AT');
INSERT INTO @tbl VALUES ('Atyrau'            ,	     'Atyrau',	'AR',	'AT');
INSERT INTO @tbl VALUES ('Almaty [City]'            ,	     'Auezovskiy',	'AC',	'AU');
INSERT INTO @tbl VALUES ('Qostanay'            ,	     'Auliekol`skiy',	'QS',	'AU');
INSERT INTO @tbl VALUES ('East Kazakhstan'            ,	     'Ayagozskiy',	'EK',	'AY');
INSERT INTO @tbl VALUES ('Aqtobe'            ,	     'Aytekebiyskiy',	'AT',	'AY');
INSERT INTO @tbl VALUES ('North Kazakhstan'            ,	     'Ayyrtauskiy',	'NK',	'AY');
INSERT INTO @tbl VALUES ('Qaraghandy'            ,	     'Balkhash',	'QG',	'BA');
INSERT INTO @tbl VALUES ('Almaty'            ,	     'Balkhashskiy',	'AA',	'BA');
INSERT INTO @tbl VALUES ('Pavlodar'            ,	     'Bayanaul`skiy',	'PA',	'BA');
INSERT INTO @tbl VALUES ('South Kazakhstan'            ,	     'Baydibekskiy',	'SK',	'BA');
INSERT INTO @tbl VALUES ('Aqtobe'            ,	     'Bayganinskiy',	'AT',	'BA');
INSERT INTO @tbl VALUES ('Zhambyl'            ,	     'Bayzakskiy',	'ZM',	'BA');
INSERT INTO @tbl VALUES ('East Kazakhstan'            ,	     'Beskaragayskiy',	'EK',	'BE');
INSERT INTO @tbl VALUES ('Mangghystau'            ,	     'Beyneuskiy',	'MG',	'BE');
INSERT INTO @tbl VALUES ('East Kazakhstan'            ,	     'Borodulikhinskiy',	'EK',	'BO');
INSERT INTO @tbl VALUES ('Almaty [City]'            ,	     'Bostandykskiy',	'AC',	'BO');
INSERT INTO @tbl VALUES ('Qaraghandy'            ,	     'Bukhar-Zhyrauskiy',	'QG',	'BZ');
INSERT INTO @tbl VALUES ('North Kazakhstan'            ,	     'Bulaevskiy',	'NK',	'BU');
INSERT INTO @tbl VALUES ('Aqmola'            ,	     'Bulandynskiy',	'AM',	'BU');
INSERT INTO @tbl VALUES ('West Kazakhstan'            ,	     'Burlinskiy',	'WK',	'BU');
INSERT INTO @tbl VALUES ('South Kazakhstan'            ,	     'Chardarinskiy',	'SK',	'CH');
INSERT INTO @tbl VALUES ('Qyzylorda'            ,	     'Chiiliyskiy',	'QO',	'CH');
INSERT INTO @tbl VALUES ('West Kazakhstan'            ,	     'Chingirlauskiy',	'WK',	'CH');
INSERT INTO @tbl VALUES ('Qostanay'            ,	     'Denisovskiy',	'QS',	'DE');
INSERT INTO @tbl VALUES ('West Kazakhstan'            ,	     'Dzhangalinskiy',	'WK',	'DG');
INSERT INTO @tbl VALUES ('Qostanay'            ,	     'Dzhangil`dinskiy',	'QS',	'DZ');
INSERT INTO @tbl VALUES ('West Kazakhstan'            ,	     'Dzhanybekskiy',	'WK',	'DB');
INSERT INTO @tbl VALUES ('Aqmola'            ,	     'Egindykol`skiy',	'AM',	'EG');
INSERT INTO @tbl VALUES ('Pavlodar'            ,	     'Ekibastuz',	'PA',	'EK');
INSERT INTO @tbl VALUES ('Almaty'            ,	     'Enbekshikazakhskiy',	'AA',	'EN');
INSERT INTO @tbl VALUES ('Aqmola'            ,	     'Enbekshil`derskiy',	'AM',	'EN');
INSERT INTO @tbl VALUES ('Aqmola'            ,	     'Ereymengauskiy',	'AM',	'ER');
INSERT INTO @tbl VALUES ('Aqmola'            ,	     'Esil`skiy',	'AM',	'ES');
INSERT INTO @tbl VALUES ('Almaty'            ,	     'Eskal''dinskiy',	'AA',	'ES');
INSERT INTO @tbl VALUES ('Qostanay'            ,	     'Fyodorovskiy',	'QS',	'FY');
INSERT INTO @tbl VALUES ('East Kazakhstan'            ,	     'Glubokovskiy',	'EK',	'GL');
INSERT INTO @tbl VALUES ('Almaty'            ,	     'Iliyskiy',	'AA',	'IL');
INSERT INTO @tbl VALUES ('Atyrau'            ,	     'Inderskiy',	'AR',	'IN');
INSERT INTO @tbl VALUES ('Aqtobe'            ,	     'Irgizskiy',	'AT',	'IR');
INSERT INTO @tbl VALUES ('Pavlodar'            ,	     'Irtyshskiy',	'PA',	'IR');
INSERT INTO @tbl VALUES ('Atyrau'            ,	     'Isatayskiy',	'AR',	'IS');
INSERT INTO @tbl VALUES ('Pavlodar'            ,	     'Kachirskiy',	'PA',	'KA');
INSERT INTO @tbl VALUES ('Qostanay'            ,	     'Kamystinskiy',	'QS',	'KA');
INSERT INTO @tbl VALUES ('Almaty'            ,	     'Kapchagay',	'AA',	'KP');
INSERT INTO @tbl VALUES ('Qostanay'            ,	     'Karabalykskiy',	'QS',	'KB');
INSERT INTO @tbl VALUES ('Mangghystau'            ,	     'Karakiyanskiy',	'MG',	'KA');
INSERT INTO @tbl VALUES ('Almaty'            ,	     'Karasayskiy',	'AA',	'KS');
INSERT INTO @tbl VALUES ('Qostanay'            ,	     'Karasuskiy',	'QS',	'KS');
INSERT INTO @tbl VALUES ('Almaty'            ,	     'Karatal`skiy',	'AA',	'KT');
INSERT INTO @tbl VALUES ('West Kazakhstan'            ,	     'Karatobinskiy',	'WK',	'KR');
INSERT INTO @tbl VALUES ('Qaraghandy'            ,	     'Karazhal',	'QG',	'KZ');
INSERT INTO @tbl VALUES ('Aqtobe'            ,	     'Kargalinskiy',	'AT',	'KA');
INSERT INTO @tbl VALUES ('Qaraghandy'            ,	     'Karkaralinskiy',	'QG',	'KK');
INSERT INTO @tbl VALUES ('Qyzylorda'            ,	     'Karmakchinskiy',	'QO',	'KR');
INSERT INTO @tbl VALUES ('East Kazakhstan'            ,	     'Katon-Karagayskiy',	'EK',	'KK');
INSERT INTO @tbl VALUES ('Qyzylorda'            ,	     'Kazalinskiy',	'QO',	'KZ');
INSERT INTO @tbl VALUES ('West Kazakhstan'            ,	     'Kaztalovskiy',	'WK',	'KZ');
INSERT INTO @tbl VALUES ('South Kazakhstan'            ,	     'Kazygurtskiy',	'SK',	'KA');
INSERT INTO @tbl VALUES ('South Kazakhstan'            ,	     'Kentau',	'SK',	'KE');
INSERT INTO @tbl VALUES ('Almaty'            ,	     'Kerbulakskiy',	'AA',	'KE');
INSERT INTO @tbl VALUES ('Aqtobe'            ,	     'Khobdinskiy',	'AT',	'KB');
INSERT INTO @tbl VALUES ('Aqtobe'            ,	     'Khromtauskiy',	'AT',	'KT');
INSERT INTO @tbl VALUES ('East Kazakhstan'            ,	     'Kokpektinskiy',	'EK',	'KO');
INSERT INTO @tbl VALUES ('Aqmola'            ,	     'Kokshetay',	'AM',	'KK');
INSERT INTO @tbl VALUES ('Almaty'            ,	     'Koksuskiy',	'AA',	'KO');
INSERT INTO @tbl VALUES ('Zhambyl'            ,	     'Kordayskiy',	'ZM',	'KO');
INSERT INTO @tbl VALUES ('Aqmola'            ,	     'Korgalzhynskiy',	'AM',	'KR');
INSERT INTO @tbl VALUES ('Qostanay'            ,	     'Kostanayskiy',	'QS',	'KO');
INSERT INTO @tbl VALUES ('East Kazakhstan'            ,	     'Kurchumskiy',	'EK',	'KU');
INSERT INTO @tbl VALUES ('Atyrau'            ,	     'Kurmangazinskiy',	'AR',	'KU');
INSERT INTO @tbl VALUES ('North Kazakhstan'            ,	     'Kyzylzharskiy',	'NK',	'KY');
INSERT INTO @tbl VALUES ('Atyrau'            ,	     'Kzylkoginskiy',	'AR',	'KZ');
INSERT INTO @tbl VALUES ('Pavlodar'            ,	     'Lebyazhinskiy',	'PA',	'LE');
INSERT INTO @tbl VALUES ('East Kazakhstan'            ,	     'Leninogorsk',	'EK',	'LE');
INSERT INTO @tbl VALUES ('Qostanay'            ,	     'Lisakovsk',	'QS',	'LI');
INSERT INTO @tbl VALUES ('Zhambyl'            ,	     'Lugovskoy',	'ZM',	'LU');
INSERT INTO @tbl VALUES ('Atyrau'            ,	     'Makatskiy',	'AR',	'MK');
INSERT INTO @tbl VALUES ('Atyrau'            ,	     'Makhambetskiy',	'AR',	'MB');
INSERT INTO @tbl VALUES ('South Kazakhstan'            ,	     'Maktaaral`skiy',	'SK',	'MA');
INSERT INTO @tbl VALUES ('North Kazakhstan'            ,	     'Mamlyutskiy',	'NK',	'MA');
INSERT INTO @tbl VALUES ('Mangghystau'            ,	     'Manghystauskiy',	'MG',	'MA');
INSERT INTO @tbl VALUES ('Aqtobe'            ,	     'Martukskiy',	'AT',	'MA');
INSERT INTO @tbl VALUES ('Pavlodar'            ,	     'Mayskiy',	'PA',	'MA');
INSERT INTO @tbl VALUES ('Almaty [City]'            ,	     'Medeuskiy',	'AC',	'ME');
INSERT INTO @tbl VALUES ('Qostanay'            ,	     'Mendykarinskiy',	'QS',	'ME');
INSERT INTO @tbl VALUES ('Zhambyl'            ,	     'Merkenskiy',	'ZM',	'ME');
INSERT INTO @tbl VALUES ('Zhambyl'            ,	     'Moyynkumskiy',	'ZM',	'MO');
INSERT INTO @tbl VALUES ('Aqtobe'            ,	     'Mugalzharskiy',	'AT',	'MU');
INSERT INTO @tbl VALUES ('Qostanay'            ,	     'Naurzumskiy',	'QS',	'NA');
INSERT INTO @tbl VALUES ('Qaraghandy'            ,	     'Nurinskiy',	'QG',	'NU');
INSERT INTO @tbl VALUES ('South Kazakhstan'            ,	     'Ordabasynskiy',	'SK',	'OR');
INSERT INTO @tbl VALUES ('Qaraghandy'            ,	     'Osakarovskiy',	'QG',	'OS');
INSERT INTO @tbl VALUES ('East Kazakhstan'            ,	     'Oskemen',	'EK',	'OS');
INSERT INTO @tbl VALUES ('South Kazakhstan'            ,	     'Otrarskiy',	'SK',	'OT');
INSERT INTO @tbl VALUES ('Almaty'            ,	     'Panfilovskiy',	'AA',	'PA');
INSERT INTO @tbl VALUES ('Pavlodar'            ,	     'Pavlodar',	'PA',	'PA');
INSERT INTO @tbl VALUES ('Pavlodar'            ,	     'Pavlodarskiy',	'PA',	'PS');
INSERT INTO @tbl VALUES ('North Kazakhstan'            ,	     'Petropavlovsk',	'NK',	'PE');
INSERT INTO @tbl VALUES ('Qaraghandy'            ,	     'Qaraghandy',	'QG',	'QA');
INSERT INTO @tbl VALUES ('Qostanay'            ,	     'Qostanay',	'QS',	'QO');
INSERT INTO @tbl VALUES ('Qyzylorda'            ,	     'Qyzylorda',	'QO',	'QY');
INSERT INTO @tbl VALUES ('Almaty'            ,	     'Raiymbekskiy',	'AA',	'RA');
INSERT INTO @tbl VALUES ('Qostanay'            ,	     'Rudniy',	'QS',	'RU');
INSERT INTO @tbl VALUES ('Aqmola'            ,	     'Sandyktauskiy',	'AM',	'SA');
INSERT INTO @tbl VALUES ('Qaraghandy'            ,	     'Saran`',	'QG',	'SA');
INSERT INTO @tbl VALUES ('Almaty'            ,	     'Sarkandskiy',	'AA',	'SA');
INSERT INTO @tbl VALUES ('South Kazakhstan'            ,	     'Saryagashskiy',	'SK',	'SG');
INSERT INTO @tbl VALUES ('Qostanay'            ,	     'Sarykol`skiy',	'QS',	'SA');
INSERT INTO @tbl VALUES ('Zhambyl'            ,	     'Sarysuskiy',	'ZM',	'SA');
INSERT INTO @tbl VALUES ('South Kazakhstan'            ,	     'Sayramskiy',	'SK',	'SR');
INSERT INTO @tbl VALUES ('East Kazakhstan'            ,	     'Semey',	'EK',	'SE');
INSERT INTO @tbl VALUES ('Qaraghandy'            ,	     'Shakhtinsk',	'QG',	'SK');
INSERT INTO @tbl VALUES ('North Kazakhstan'            ,	     'Shal Akyna',	'NK',	'SA');
INSERT INTO @tbl VALUES ('Aqtobe'            ,	     'Shalkarskiy',	'AT',	'SH');
INSERT INTO @tbl VALUES ('East Kazakhstan'            ,	     'Shemonaikhinskiy',	'EK',	'SH');
INSERT INTO @tbl VALUES ('Pavlodar'            ,	     'Sherbaktinskiy',	'PA',	'SH');
INSERT INTO @tbl VALUES ('Qaraghandy'            ,	     'Shetskiy',	'QG',	'ST');
INSERT INTO @tbl VALUES ('Aqmola'            ,	     'Shortandinskiy',	'AM',	'SD');
INSERT INTO @tbl VALUES ('Aqmola'            ,	     'Shuchinskiy',	'AM',	'SC');
INSERT INTO @tbl VALUES ('Zhambyl'            ,	     'Shuskiy',	'ZM',	'SH');
INSERT INTO @tbl VALUES ('South Kazakhstan'            ,	     'Shymkent',	'SK',	'SH');
INSERT INTO @tbl VALUES ('Aqmola'            ,	     'Stepnogorsk',	'AM',	'ST');
INSERT INTO @tbl VALUES ('South Kazakhstan'            ,	     'Suzakskiy',	'SK',	'SU');
INSERT INTO @tbl VALUES ('Qyzylorda'            ,	     'Syrdar`inskiy',	'QO',	'SY');
INSERT INTO @tbl VALUES ('West Kazakhstan'            ,	     'Syrymskiy',	'WK',	'SY');
INSERT INTO @tbl VALUES ('North Kazakhstan'            ,	     'Taiynshinskiy',	'NK',	'TA');
INSERT INTO @tbl VALUES ('Zhambyl'            ,	     'Talasskiy',	'ZM',	'TL');
INSERT INTO @tbl VALUES ('Almaty'            ,	     'Taldyqorghan',	'AA',	'TQ');
INSERT INTO @tbl VALUES ('Almaty'            ,	     'Talgarskiy',	'AA',	'TG');
INSERT INTO @tbl VALUES ('Qostanay'            ,	     'Taranovskiy',	'QS',	'TA');
INSERT INTO @tbl VALUES ('Zhambyl'            ,	     'Taraz',	'ZM',	'TR');
INSERT INTO @tbl VALUES ('East Kazakhstan'            ,	     'Tarbagatayskiy',	'EK',	'TA');
INSERT INTO @tbl VALUES ('West Kazakhstan'            ,	     'Taskalinskiy',	'WK',	'TA');
INSERT INTO @tbl VALUES ('Almaty'            ,	     'Tekeli',	'AA',	'TE');
INSERT INTO @tbl VALUES ('Aqtobe'            ,	     'Temirskiy',	'AT',	'TE');
INSERT INTO @tbl VALUES ('Qaraghandy'            ,	     'Temirtau',	'QG',	'TE');
INSERT INTO @tbl VALUES ('West Kazakhstan'            ,	     'Terektinskiy',	'WK',	'TE');
INSERT INTO @tbl VALUES ('North Kazakhstan'            ,	     'Timiryazevskiy',	'NK',	'TI');
INSERT INTO @tbl VALUES ('South Kazakhstan'            ,	     'Tolebiyskiy',	'SK',	'TO');
INSERT INTO @tbl VALUES ('North Kazakhstan'            ,	     'Tselinniy',	'NK',	'TS');
INSERT INTO @tbl VALUES ('Aqmola'            ,	     'Tselinogradskiy',	'AM',	'TS');
INSERT INTO @tbl VALUES ('Mangghystau'            ,	     'Tupkaraganskiy',	'MG',	'TU');
INSERT INTO @tbl VALUES ('South Kazakhstan'            ,	     'Turkestan',	'SK',	'TU');
INSERT INTO @tbl VALUES ('Almaty [City]'            ,	     'Turksibskiy',	'AC',	'TU');
INSERT INTO @tbl VALUES ('South Kazakhstan'            ,	     'Tyul`kubaskiy',	'SK',	'TY');
INSERT INTO @tbl VALUES ('North Kazakhstan'            ,	     'Ualikhanovskiy',	'NK',	'UA');
INSERT INTO @tbl VALUES ('Aqtobe'            ,	     'Uilskiy',	'AT',	'UI');
INSERT INTO @tbl VALUES ('East Kazakhstan'            ,	     'Ulanskiy',	'EK',	'UL');
INSERT INTO @tbl VALUES ('Qaraghandy'            ,	     'Ulytauskiy',	'QG',	'UL');
INSERT INTO @tbl VALUES ('West Kazakhstan'            ,	     'Ural`sk',	'WK',	'UL');
INSERT INTO @tbl VALUES ('West Kazakhstan'            ,	     'Urdinskiy',	'WK',	'UD');
INSERT INTO @tbl VALUES ('East Kazakhstan'            ,	     'Urdzharskiy',	'EK',	'UR');
INSERT INTO @tbl VALUES ('Pavlodar'            ,	     'Uspenskiy',	'PA',	'US');
INSERT INTO @tbl VALUES ('Almaty'            ,	     'Uygurskiy',	'AA',	'UY');
INSERT INTO @tbl VALUES ('Qostanay'            ,	     'Uzunkol`skiy',	'QS',	'UZ');
INSERT INTO @tbl VALUES ('East Kazakhstan'            ,	     'Zaysanskiy',	'EK',	'ZA');
INSERT INTO @tbl VALUES ('West Kazakhstan'            ,	     'Zelenovskiy',	'WK',	'ZE');
INSERT INTO @tbl VALUES ('Aqmola'            ,	     'Zerendinskiy',	'AM',	'ZE');
INSERT INTO @tbl VALUES ('Aqmola'            ,	     'Zhaksynskiy',	'AM',	'ZS');
INSERT INTO @tbl VALUES ('Qyzylorda'            ,	     'Zhalagashskiy',	'QO',	'ZL');
INSERT INTO @tbl VALUES ('Almaty'            ,	     'Zhambylskiy',	'AA',	'ZH');
INSERT INTO @tbl VALUES ('Qaraghandy'            ,	     'Zhanaarkinskiy',	'QG',	'ZA');
INSERT INTO @tbl VALUES ('Qyzylorda'            ,	     'Zhanakorganskiy',	'QO',	'ZN');
INSERT INTO @tbl VALUES ('Mangghystau'            ,	     'Zhanaozen',	'MG',	'ZH');
INSERT INTO @tbl VALUES ('Aqmola'            ,	     'Zharkainskiy',	'AM',	'ZR');
INSERT INTO @tbl VALUES ('East Kazakhstan'            ,	     'Zharminskiy',	'EK',	'ZH');
INSERT INTO @tbl VALUES ('Pavlodar'            ,	     'Zhelezinskiy',	'PA',	'ZH');
INSERT INTO @tbl VALUES ('Almaty [City]'            ,	     'Zhetysuskiy',	'AC',	'ZH');
INSERT INTO @tbl VALUES ('Qaraghandy'            ,	     'Zhezkazgan',	'QG',	'ZZ');
INSERT INTO @tbl VALUES ('Qostanay'            ,	     'Zhitikarinskiy',	'QS',	'ZH');
INSERT INTO @tbl VALUES ('Zhambyl'            ,	     'Zhualynskiy',	'ZM',	'ZL');
INSERT INTO @tbl VALUES ('Atyrau'            ,	     'Zhylyoyskiy',	'AR',	'ZH');
INSERT INTO @tbl VALUES ('East Kazakhstan'            ,	     'Zyryanovsk',	'EK',	'ZY');

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

