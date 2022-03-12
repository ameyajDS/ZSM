
/* ==================================================================================
    	Source File		:	setup_norway_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Norway are set-up
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
WHERE	country_nm	=	'Norway';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Norway not found', 16, 1);
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

INSERT INTO @tbl VALUES ('Sor-Trondelag'            ,	     'Afjord',	'ST',	'AF');
INSERT INTO @tbl VALUES ('Sor-Trondelag'            ,	     'Agdenes',	'ST',	'AG');
INSERT INTO @tbl VALUES ('Buskerud'            ,	     'Al',	'BU',	'AL');
INSERT INTO @tbl VALUES ('More og Romsdal'            ,	     'Alesund',	'MR',	'AL');
INSERT INTO @tbl VALUES ('Nordland'            ,	     'Alstahaug',	'NO',	'AL');
INSERT INTO @tbl VALUES ('Finnmark'            ,	     'Alta',	'FI',	'AL');
INSERT INTO @tbl VALUES ('Hedmark'            ,	     'Alvdal',	'HE',	'AL');
INSERT INTO @tbl VALUES ('Aust-Agder'            ,	     'Amli',	'AA',	'AM');
INSERT INTO @tbl VALUES ('Hedmark'            ,	     'Amot',	'HE',	'AM');
INSERT INTO @tbl VALUES ('Vestfold'            ,	     'Andebu',	'VF',	'AN');
INSERT INTO @tbl VALUES ('Nordland'            ,	     'Andoy',	'NO',	'AN');
INSERT INTO @tbl VALUES ('Sogn og Fjordane'            ,	     'Ardal',	'SF',	'AR');
INSERT INTO @tbl VALUES ('Ostfold'            ,	     'Aremark',	'OF',	'AR');
INSERT INTO @tbl VALUES ('Aust-Agder'            ,	     'Arendal',	'AA',	'AR');
INSERT INTO @tbl VALUES ('Akershus'            ,	     'As',	'AK',	'AS');
INSERT INTO @tbl VALUES ('Vest-Agder'            ,	     'Aseral',	'VA',	'AS');
INSERT INTO @tbl VALUES ('Akershus'            ,	     'Asker',	'AK',	'AK');
INSERT INTO @tbl VALUES ('Ostfold'            ,	     'Askim',	'OF',	'AS');
INSERT INTO @tbl VALUES ('Hordaland'            ,	     'Askoy',	'HO',	'AS');
INSERT INTO @tbl VALUES ('Sogn og Fjordane'            ,	     'Askvoll',	'SF',	'AS');
INSERT INTO @tbl VALUES ('Hedmark'            ,	     'Asnes',	'HE',	'AS');
INSERT INTO @tbl VALUES ('Vest-Agder'            ,	     'Audnedal',	'VA',	'AU');
INSERT INTO @tbl VALUES ('More og Romsdal'            ,	     'Aukra',	'MR',	'AK');
INSERT INTO @tbl VALUES ('More og Romsdal'            ,	     'Aure',	'MR',	'AU');
INSERT INTO @tbl VALUES ('Sogn og Fjordane'            ,	     'Aurland',	'SF',	'AU');
INSERT INTO @tbl VALUES ('Akershus'            ,	     'Aurskog-Holand',	'AK',	'AH');
INSERT INTO @tbl VALUES ('Hordaland'            ,	     'Austevoll',	'HO',	'AV');
INSERT INTO @tbl VALUES ('Hordaland'            ,	     'Austrheim',	'HO',	'AH');
INSERT INTO @tbl VALUES ('More og Romsdal'            ,	     'Averoy',	'MR',	'AV');
INSERT INTO @tbl VALUES ('Akershus'            ,	     'Baerum',	'AK',	'BA');
INSERT INTO @tbl VALUES ('Sogn og Fjordane'            ,	     'Balestrand',	'SF',	'BA');
INSERT INTO @tbl VALUES ('Nordland'            ,	     'Ballangen',	'NO',	'BA');
INSERT INTO @tbl VALUES ('Troms'            ,	     'Balsfjord',	'TR',	'BF');
INSERT INTO @tbl VALUES ('Telemark'            ,	     'Bamble',	'TE',	'BA');
INSERT INTO @tbl VALUES ('Troms'            ,	     'Bardu',	'TR',	'BD');
INSERT INTO @tbl VALUES ('Finnmark'            ,	     'Batsfjord',	'FI',	'BA');
INSERT INTO @tbl VALUES ('Nordland'            ,	     'Beiarn',	'NO',	'BE');
INSERT INTO @tbl VALUES ('Troms'            ,	     'Berg',	'TR',	'BE');
INSERT INTO @tbl VALUES ('Hordaland'            ,	     'Bergen',	'HO',	'BE');
INSERT INTO @tbl VALUES ('Finnmark'            ,	     'Berlevag',	'FI',	'BE');
INSERT INTO @tbl VALUES ('Nordland'            ,	     'Bindal',	'NO',	'BI');
INSERT INTO @tbl VALUES ('Aust-Agder'            ,	     'Birkenes',	'AA',	'BI');
INSERT INTO @tbl VALUES ('Troms'            ,	     'Bjarkoy',	'TR',	'BJ');
INSERT INTO @tbl VALUES ('Rogaland'            ,	     'Bjerkreim',	'RO',	'BJ');
INSERT INTO @tbl VALUES ('Sor-Trondelag'            ,	     'Bjugn',	'ST',	'BJ');
INSERT INTO @tbl VALUES ('Telemark'            ,	     'Bo',	'TE',	'BO');
INSERT INTO @tbl VALUES ('Nordland'            ,	     'Bo',	'NO',	'BO');
INSERT INTO @tbl VALUES ('Nordland'            ,	     'Bodo',	'NO',	'BB');
INSERT INTO @tbl VALUES ('Rogaland'            ,	     'Bokn',	'RO',	'BO');
INSERT INTO @tbl VALUES ('Hordaland'            ,	     'Bomlo',	'HO',	'BO');
INSERT INTO @tbl VALUES ('Sogn og Fjordane'            ,	     'Bremanger',	'SF',	'BR');
INSERT INTO @tbl VALUES ('Nordland'            ,	     'Bronnoy',	'NO',	'BR');
INSERT INTO @tbl VALUES ('Aust-Agder'            ,	     'Bygland',	'AA',	'BG');
INSERT INTO @tbl VALUES ('Aust-Agder'            ,	     'Bykle',	'AA',	'BK');
INSERT INTO @tbl VALUES ('Nordland'            ,	     'Donna',	'NO',	'DO');
INSERT INTO @tbl VALUES ('Oppland'            ,	     'Dovre',	'OP',	'DO');
INSERT INTO @tbl VALUES ('Buskerud'            ,	     'Drammen',	'BU',	'DR');
INSERT INTO @tbl VALUES ('Telemark'            ,	     'Drangedal',	'TE',	'DR');
INSERT INTO @tbl VALUES ('Troms'            ,	     'Dyroy',	'TR',	'DY');
INSERT INTO @tbl VALUES ('Sogn og Fjordane'            ,	     'Eid',	'SF',	'EI');
INSERT INTO @tbl VALUES ('More og Romsdal'            ,	     'Eide',	'MR',	'EI');
INSERT INTO @tbl VALUES ('Hordaland'            ,	     'Eidfjord',	'HO',	'EI');
INSERT INTO @tbl VALUES ('Ostfold'            ,	     'Eidsberg',	'OF',	'EI');
INSERT INTO @tbl VALUES ('Hedmark'            ,	     'Eidskog',	'HE',	'EI');
INSERT INTO @tbl VALUES ('Akershus'            ,	     'Eidsvoll',	'AK',	'EI');
INSERT INTO @tbl VALUES ('Rogaland'            ,	     'Eigersund',	'RO',	'EI');
INSERT INTO @tbl VALUES ('Hedmark'            ,	     'Elverum',	'HE',	'EL');
INSERT INTO @tbl VALUES ('Akershus'            ,	     'Enebakk',	'AK',	'EN');
INSERT INTO @tbl VALUES ('Hedmark'            ,	     'Engerdal',	'HE',	'EN');
INSERT INTO @tbl VALUES ('Hordaland'            ,	     'Etne',	'HO',	'ET');
INSERT INTO @tbl VALUES ('Oppland'            ,	     'Etnedal',	'OP',	'ET');
INSERT INTO @tbl VALUES ('Nordland'            ,	     'Evenes',	'NO',	'EV');
INSERT INTO @tbl VALUES ('Aust-Agder'            ,	     'Evje og Hornnes',	'AA',	'EH');
INSERT INTO @tbl VALUES ('Vest-Agder'            ,	     'Farsund',	'VA',	'FA');
INSERT INTO @tbl VALUES ('Nordland'            ,	     'Fauske',	'NO',	'FA');
INSERT INTO @tbl VALUES ('Hordaland'            ,	     'Fedje',	'HO',	'FE');
INSERT INTO @tbl VALUES ('Akershus'            ,	     'Fet',	'AK',	'FE');
INSERT INTO @tbl VALUES ('Rogaland'            ,	     'Finnoy',	'RO',	'FI');
INSERT INTO @tbl VALUES ('Hordaland'            ,	     'Fitjar',	'HO',	'FI');
INSERT INTO @tbl VALUES ('Sogn og Fjordane'            ,	     'Fjaler',	'SF',	'FJ');
INSERT INTO @tbl VALUES ('Hordaland'            ,	     'Fjell',	'HO',	'FJ');
INSERT INTO @tbl VALUES ('Buskerud'            ,	     'Fla',	'BU',	'FL');
INSERT INTO @tbl VALUES ('Nordland'            ,	     'Flakstad',	'NO',	'FL');
INSERT INTO @tbl VALUES ('Nord-Trondelag'            ,	     'Flatanger',	'NT',	'FL');
INSERT INTO @tbl VALUES ('Vest-Agder'            ,	     'Flekkefjord',	'VA',	'FL');
INSERT INTO @tbl VALUES ('Buskerud'            ,	     'Flesberg',	'BU',	'FB');
INSERT INTO @tbl VALUES ('Sogn og Fjordane'            ,	     'Flora',	'SF',	'FL');
INSERT INTO @tbl VALUES ('Hedmark'            ,	     'Folldal',	'HE',	'FO');
INSERT INTO @tbl VALUES ('Sogn og Fjordane'            ,	     'Forde',	'SF',	'FO');
INSERT INTO @tbl VALUES ('Rogaland'            ,	     'Forsand',	'RO',	'FO');
INSERT INTO @tbl VALUES ('Nord-Trondelag'            ,	     'Fosnes',	'NT',	'FO');
INSERT INTO @tbl VALUES ('More og Romsdal'            ,	     'Fraena',	'MR',	'FN');
INSERT INTO @tbl VALUES ('Ostfold'            ,	     'Fredrikstad',	'OF',	'FR');
INSERT INTO @tbl VALUES ('More og Romsdal'            ,	     'Frei',	'MR',	'FR');
INSERT INTO @tbl VALUES ('Akershus'            ,	     'Frogn',	'AK',	'FR');
INSERT INTO @tbl VALUES ('Aust-Agder'            ,	     'Froland',	'AA',	'FR');
INSERT INTO @tbl VALUES ('Nord-Trondelag'            ,	     'Frosta',	'NT',	'FR');
INSERT INTO @tbl VALUES ('Sor-Trondelag'            ,	     'Froya',	'ST',	'FR');
INSERT INTO @tbl VALUES ('Hordaland'            ,	     'Fusa',	'HO',	'FU');
INSERT INTO @tbl VALUES ('Telemark'            ,	     'Fyresdal',	'TE',	'FY');
INSERT INTO @tbl VALUES ('Finnmark'            ,	     'Gamvik',	'FI',	'GA');
INSERT INTO @tbl VALUES ('Sogn og Fjordane'            ,	     'Gaular',	'SF',	'GA');
INSERT INTO @tbl VALUES ('Oppland'            ,	     'Gausdal',	'OP',	'GA');
INSERT INTO @tbl VALUES ('Nordland'            ,	     'Gildeskal',	'NO',	'GI');
INSERT INTO @tbl VALUES ('More og Romsdal'            ,	     'Giske',	'MR',	'GI');
INSERT INTO @tbl VALUES ('More og Romsdal'            ,	     'Gjemnes',	'MR',	'GJ');
INSERT INTO @tbl VALUES ('Akershus'            ,	     'Gjerdrum',	'AK',	'GJ');
INSERT INTO @tbl VALUES ('Aust-Agder'            ,	     'Gjerstad',	'AA',	'GJ');
INSERT INTO @tbl VALUES ('Rogaland'            ,	     'Gjesdal',	'RO',	'GJ');
INSERT INTO @tbl VALUES ('Oppland'            ,	     'Gjovik',	'OP',	'GJ');
INSERT INTO @tbl VALUES ('Sogn og Fjordane'            ,	     'Gloppen',	'SF',	'GL');
INSERT INTO @tbl VALUES ('Buskerud'            ,	     'Gol',	'BU',	'GO');
INSERT INTO @tbl VALUES ('Oppland'            ,	     'Gran',	'OP',	'GR');
INSERT INTO @tbl VALUES ('Nordland'            ,	     'Grane',	'NO',	'GR');
INSERT INTO @tbl VALUES ('Hordaland'            ,	     'Granvin',	'HO',	'GR');
INSERT INTO @tbl VALUES ('Troms'            ,	     'Gratangen',	'TR',	'GR');
INSERT INTO @tbl VALUES ('Aust-Agder'            ,	     'Grimstad',	'AA',	'GR');
INSERT INTO @tbl VALUES ('Nord-Trondelag'            ,	     'Grong',	'NT',	'GR');
INSERT INTO @tbl VALUES ('Hedmark'            ,	     'Grue',	'HE',	'GR');
INSERT INTO @tbl VALUES ('Sogn og Fjordane'            ,	     'Gulen',	'SF',	'GU');
INSERT INTO @tbl VALUES ('Rogaland'            ,	     'Ha',	'RO',	'HA');
INSERT INTO @tbl VALUES ('Nordland'            ,	     'Hadsel',	'NO',	'HD');
INSERT INTO @tbl VALUES ('Vest-Agder'            ,	     'Haegebostad',	'VA',	'HA');
INSERT INTO @tbl VALUES ('Ostfold'            ,	     'Halden',	'OF',	'HA');
INSERT INTO @tbl VALUES ('More og Romsdal'            ,	     'Halsa',	'MR',	'HL');
INSERT INTO @tbl VALUES ('Hedmark'            ,	     'Hamar',	'HE',	'HA');
INSERT INTO @tbl VALUES ('Nordland'            ,	     'Hamaroy',	'NO',	'HA');
INSERT INTO @tbl VALUES ('Finnmark'            ,	     'Hammerfest',	'FI',	'HF');
INSERT INTO @tbl VALUES ('More og Romsdal'            ,	     'Haram',	'MR',	'HM');
INSERT INTO @tbl VALUES ('More og Romsdal'            ,	     'Hareid',	'MR',	'HD');
INSERT INTO @tbl VALUES ('Troms'            ,	     'Harstad',	'TR',	'HA');
INSERT INTO @tbl VALUES ('Finnmark'            ,	     'Hasvik',	'FI',	'HV');
INSERT INTO @tbl VALUES ('Nordland'            ,	     'Hattfjelldal',	'NO',	'HF');
INSERT INTO @tbl VALUES ('Rogaland'            ,	     'Haugesund',	'RO',	'HG');
INSERT INTO @tbl VALUES ('Sor-Trondelag'            ,	     'Hemne',	'ST',	'HE');
INSERT INTO @tbl VALUES ('Nordland'            ,	     'Hemnes',	'NO',	'HM');
INSERT INTO @tbl VALUES ('Buskerud'            ,	     'Hemsedal',	'BU',	'HD');
INSERT INTO @tbl VALUES ('More og Romsdal'            ,	     'Heroy',	'MR',	'HE');
INSERT INTO @tbl VALUES ('Nordland'            ,	     'Heroy',	'NO',	'HR');
INSERT INTO @tbl VALUES ('Sor-Trondelag'            ,	     'Hitra',	'ST',	'HI');
INSERT INTO @tbl VALUES ('Telemark'            ,	     'Hjartdal',	'TE',	'HJ');
INSERT INTO @tbl VALUES ('Rogaland'            ,	     'Hjelmeland',	'RO',	'HJ');
INSERT INTO @tbl VALUES ('Ostfold'            ,	     'Hobol',	'OF',	'HO');
INSERT INTO @tbl VALUES ('Vestfold'            ,	     'Hof',	'VF',	'HF');
INSERT INTO @tbl VALUES ('Buskerud'            ,	     'Hol',	'BU',	'HL');
INSERT INTO @tbl VALUES ('Buskerud'            ,	     'Hole',	'BU',	'HE');
INSERT INTO @tbl VALUES ('Vestfold'            ,	     'Holmestrand',	'VF',	'HS');
INSERT INTO @tbl VALUES ('Sor-Trondelag'            ,	     'Holtalen',	'ST',	'HO');
INSERT INTO @tbl VALUES ('Sogn og Fjordane'            ,	     'Hornindal',	'SF',	'HR');
INSERT INTO @tbl VALUES ('Vestfold'            ,	     'Horten',	'VF',	'BO');
INSERT INTO @tbl VALUES ('Sogn og Fjordane'            ,	     'Hoyanger',	'SF',	'HG');
INSERT INTO @tbl VALUES ('Nord-Trondelag'            ,	     'Hoylandet',	'NT',	'HO');
INSERT INTO @tbl VALUES ('Akershus'            ,	     'Hurdal',	'AK',	'HU');
INSERT INTO @tbl VALUES ('Buskerud'            ,	     'Hurum',	'BU',	'HU');
INSERT INTO @tbl VALUES ('Ostfold'            ,	     'Hvaler',	'OF',	'HV');
INSERT INTO @tbl VALUES ('Sogn og Fjordane'            ,	     'Hyllestad',	'SF',	'HY');
INSERT INTO @tbl VALUES ('Troms'            ,	     'Ibestad',	'TR',	'IB');
INSERT INTO @tbl VALUES ('Nord-Trondelag'            ,	     'Inderoy',	'NT',	'IN');
INSERT INTO @tbl VALUES ('Aust-Agder'            ,	     'Iveland',	'AA',	'IV');
INSERT INTO @tbl VALUES ('Oppland'            ,	     'Jevnaker',	'OP',	'JE');
INSERT INTO @tbl VALUES ('Sogn og Fjordane'            ,	     'Jolster',	'SF',	'JO');
INSERT INTO @tbl VALUES ('Hordaland'            ,	     'Jondal',	'HO',	'JO');
INSERT INTO @tbl VALUES ('Troms'            ,	     'Kafjord',	'TR',	'KF');
INSERT INTO @tbl VALUES ('Finnmark'            ,	     'Karasjok',	'FI',	'KS');
INSERT INTO @tbl VALUES ('Troms'            ,	     'Karlsoy',	'TR',	'KR');
INSERT INTO @tbl VALUES ('Rogaland'            ,	     'Karmoy',	'RO',	'KA');
INSERT INTO @tbl VALUES ('Finnmark'            ,	     'Kautokeino',	'FI',	'KK');
INSERT INTO @tbl VALUES ('Sor-Trondelag'            ,	     'Klaebu',	'ST',	'KL');
INSERT INTO @tbl VALUES ('Rogaland'            ,	     'Klepp',	'RO',	'KL');
INSERT INTO @tbl VALUES ('Buskerud'            ,	     'Kongsberg',	'BU',	'KO');
INSERT INTO @tbl VALUES ('Hedmark'            ,	     'Kongsvinger',	'HE',	'KO');
INSERT INTO @tbl VALUES ('Telemark'            ,	     'Kragero',	'TE',	'KR');
INSERT INTO @tbl VALUES ('Vest-Agder'            ,	     'Kristiansand',	'VA',	'KR');
INSERT INTO @tbl VALUES ('More og Romsdal'            ,	     'Kristiansund',	'MR',	'KR');
INSERT INTO @tbl VALUES ('Buskerud'            ,	     'Krodsherad',	'BU',	'KR');
INSERT INTO @tbl VALUES ('Troms'            ,	     'Kvaefjord',	'TR',	'KV');
INSERT INTO @tbl VALUES ('Troms'            ,	     'Kvaenangen',	'TR',	'KN');
INSERT INTO @tbl VALUES ('Finnmark'            ,	     'Kvalsund',	'FI',	'KV');
INSERT INTO @tbl VALUES ('Hordaland'            ,	     'Kvam',	'HO',	'KM');
INSERT INTO @tbl VALUES ('Vest-Agder'            ,	     'Kvinesdal',	'VA',	'KV');
INSERT INTO @tbl VALUES ('Hordaland'            ,	     'Kvinnherad',	'HO',	'KN');
INSERT INTO @tbl VALUES ('Telemark'            ,	     'Kviteseid',	'TE',	'KV');
INSERT INTO @tbl VALUES ('Rogaland'            ,	     'Kvitsoy',	'RO',	'KV');
INSERT INTO @tbl VALUES ('Sogn og Fjordane'            ,	     'Laerdal',	'SF',	'LA');
INSERT INTO @tbl VALUES ('Vestfold'            ,	     'Lardal',	'VF',	'LD');
INSERT INTO @tbl VALUES ('Vestfold'            ,	     'Larvik',	'VF',	'LV');
INSERT INTO @tbl VALUES ('Troms'            ,	     'Lavangen',	'TR',	'LA');
INSERT INTO @tbl VALUES ('Finnmark'            ,	     'Lebesby',	'FI',	'LE');
INSERT INTO @tbl VALUES ('Sogn og Fjordane'            ,	     'Leikanger',	'SF',	'LE');
INSERT INTO @tbl VALUES ('Nordland'            ,	     'Leirfjord',	'NO',	'LE');
INSERT INTO @tbl VALUES ('Nord-Trondelag'            ,	     'Leka',	'NT',	'LE');
INSERT INTO @tbl VALUES ('Nord-Trondelag'            ,	     'Leksvik',	'NT',	'LK');
INSERT INTO @tbl VALUES ('Troms'            ,	     'Lenvik',	'TR',	'LE');
INSERT INTO @tbl VALUES ('Oppland'            ,	     'Lesja',	'OP',	'LE');
INSERT INTO @tbl VALUES ('Nord-Trondelag'            ,	     'Levanger',	'NT',	'LV');
INSERT INTO @tbl VALUES ('Buskerud'            ,	     'Lier',	'BU',	'LI');
INSERT INTO @tbl VALUES ('Nord-Trondelag'            ,	     'Lierne',	'NT',	'LI');
INSERT INTO @tbl VALUES ('Oppland'            ,	     'Lillehammer',	'OP',	'LI');
INSERT INTO @tbl VALUES ('Aust-Agder'            ,	     'Lillesand',	'AA',	'LI');
INSERT INTO @tbl VALUES ('Hordaland'            ,	     'Lindas',	'HO',	'LI');
INSERT INTO @tbl VALUES ('Vest-Agder'            ,	     'Lindesnes',	'VA',	'LI');
INSERT INTO @tbl VALUES ('Nordland'            ,	     'Lodingen',	'NO',	'LO');
INSERT INTO @tbl VALUES ('Oppland'            ,	     'Lom',	'OP',	'LO');
INSERT INTO @tbl VALUES ('Finnmark'            ,	     'Loppa',	'FI',	'LO');
INSERT INTO @tbl VALUES ('Akershus'            ,	     'Lorenskog',	'AK',	'LO');
INSERT INTO @tbl VALUES ('Hedmark'            ,	     'Loten',	'HE',	'LO');
INSERT INTO @tbl VALUES ('Rogaland'            ,	     'Lund',	'RO',	'LU');
INSERT INTO @tbl VALUES ('Oppland'            ,	     'Lunner',	'OP',	'LU');
INSERT INTO @tbl VALUES ('Nordland'            ,	     'Luroy',	'NO',	'LU');
INSERT INTO @tbl VALUES ('Sogn og Fjordane'            ,	     'Luster',	'SF',	'LU');
INSERT INTO @tbl VALUES ('Vest-Agder'            ,	     'Lyngdal',	'VA',	'LY');
INSERT INTO @tbl VALUES ('Troms'            ,	     'Lyngen',	'TR',	'LY');
INSERT INTO @tbl VALUES ('Troms'            ,	     'Malselv',	'TR',	'MA');
INSERT INTO @tbl VALUES ('Sor-Trondelag'            ,	     'Malvik',	'ST',	'MA');
INSERT INTO @tbl VALUES ('Vest-Agder'            ,	     'Mandal',	'VA',	'MN');
INSERT INTO @tbl VALUES ('Ostfold'            ,	     'Marker',	'OF',	'MA');
INSERT INTO @tbl VALUES ('Vest-Agder'            ,	     'Marnardal',	'VA',	'MR');
INSERT INTO @tbl VALUES ('Hordaland'            ,	     'Masfjorden',	'HO',	'MA');
INSERT INTO @tbl VALUES ('Finnmark'            ,	     'Masoy',	'FI',	'MA');
INSERT INTO @tbl VALUES ('Hordaland'            ,	     'Meland',	'HO',	'ME');
INSERT INTO @tbl VALUES ('Sor-Trondelag'            ,	     'Meldal',	'ST',	'MD');
INSERT INTO @tbl VALUES ('Sor-Trondelag'            ,	     'Melhus',	'ST',	'MH');
INSERT INTO @tbl VALUES ('Nordland'            ,	     'Meloy',	'NO',	'ME');
INSERT INTO @tbl VALUES ('Nord-Trondelag'            ,	     'Meraker',	'NT',	'ME');
INSERT INTO @tbl VALUES ('More og Romsdal'            ,	     'Midsund',	'MR',	'MI');
INSERT INTO @tbl VALUES ('Sor-Trondelag'            ,	     'Midtre Gauldal',	'ST',	'MG');
INSERT INTO @tbl VALUES ('Hordaland'            ,	     'Modalen',	'HO',	'MO');
INSERT INTO @tbl VALUES ('Buskerud'            ,	     'Modum',	'BU',	'MO');
INSERT INTO @tbl VALUES ('More og Romsdal'            ,	     'Molde',	'MR',	'MO');
INSERT INTO @tbl VALUES ('Nordland'            ,	     'Moskenes',	'NO',	'MO');
INSERT INTO @tbl VALUES ('Ostfold'            ,	     'Moss',	'OF',	'MO');
INSERT INTO @tbl VALUES ('Nord-Trondelag'            ,	     'Mosvik',	'NT',	'MO');
INSERT INTO @tbl VALUES ('Nord-Trondelag'            ,	     'Naeroy',	'NT',	'NR');
INSERT INTO @tbl VALUES ('Nord-Trondelag'            ,	     'Namdalseid',	'NT',	'ND');
INSERT INTO @tbl VALUES ('Nord-Trondelag'            ,	     'Namsos',	'NT',	'NM');
INSERT INTO @tbl VALUES ('Nord-Trondelag'            ,	     'Namsskogan',	'NT',	'NS');
INSERT INTO @tbl VALUES ('Akershus'            ,	     'Nannestad',	'AK',	'NA');
INSERT INTO @tbl VALUES ('Nordland'            ,	     'Narvik',	'NO',	'NA');
INSERT INTO @tbl VALUES ('Sogn og Fjordane'            ,	     'Naustdal',	'SF',	'NA');
INSERT INTO @tbl VALUES ('Buskerud'            ,	     'Nedre Eiker',	'BU',	'NE');
INSERT INTO @tbl VALUES ('Akershus'            ,	     'Nes',	'AK',	'NE');
INSERT INTO @tbl VALUES ('Buskerud'            ,	     'Nes',	'BU',	'NS');
INSERT INTO @tbl VALUES ('Nordland'            ,	     'Nesna',	'NO',	'NE');
INSERT INTO @tbl VALUES ('Akershus'            ,	     'Nesodden',	'AK',	'NS');
INSERT INTO @tbl VALUES ('Finnmark'            ,	     'Nesseby',	'FI',	'NE');
INSERT INTO @tbl VALUES ('More og Romsdal'            ,	     'Nesset',	'MR',	'NE');
INSERT INTO @tbl VALUES ('Telemark'            ,	     'Nissedal',	'TE',	'NI');
INSERT INTO @tbl VALUES ('Akershus'            ,	     'Nittedal',	'AK',	'NI');
INSERT INTO @tbl VALUES ('Telemark'            ,	     'Nome',	'TE',	'NM');
INSERT INTO @tbl VALUES ('Oppland'            ,	     'Nord-Aurdal',	'OP',	'NA');
INSERT INTO @tbl VALUES ('More og Romsdal'            ,	     'Norddal',	'MR',	'NO');
INSERT INTO @tbl VALUES ('Oppland'            ,	     'Nord-Fron',	'OP',	'NF');
INSERT INTO @tbl VALUES ('Finnmark'            ,	     'Nordkapp',	'FI',	'NO');
INSERT INTO @tbl VALUES ('Hedmark'            ,	     'Nord-Odal',	'HE',	'NO');
INSERT INTO @tbl VALUES ('Troms'            ,	     'Nordreisa',	'TR',	'NO');
INSERT INTO @tbl VALUES ('Oppland'            ,	     'Nordre Land',	'OP',	'NL');
INSERT INTO @tbl VALUES ('Buskerud'            ,	     'Nore og Uvdal',	'BU',	'NU');
INSERT INTO @tbl VALUES ('Telemark'            ,	     'Notodden',	'TE',	'NT');
INSERT INTO @tbl VALUES ('Vestfold'            ,	     'Notteroy',	'VF',	'NO');
INSERT INTO @tbl VALUES ('Hordaland'            ,	     'Odda',	'HO',	'OD');
INSERT INTO @tbl VALUES ('Nordland'            ,	     'Oksnes',	'NO',	'OK');
INSERT INTO @tbl VALUES ('Sor-Trondelag'            ,	     'Oppdal',	'ST',	'OP');
INSERT INTO @tbl VALUES ('Akershus'            ,	     'Oppegard',	'AK',	'OP');
INSERT INTO @tbl VALUES ('Sor-Trondelag'            ,	     'Orkdal',	'ST',	'OK');
INSERT INTO @tbl VALUES ('Sor-Trondelag'            ,	     'Orland',	'ST',	'OL');
INSERT INTO @tbl VALUES ('More og Romsdal'            ,	     'Orskog',	'MR',	'OK');
INSERT INTO @tbl VALUES ('More og Romsdal'            ,	     'Orsta',	'MR',	'OT');
INSERT INTO @tbl VALUES ('Hedmark'            ,	     'Os',	'HE',	'OS');
INSERT INTO @tbl VALUES ('Hordaland'            ,	     'Os',	'HO',	'OS');
INSERT INTO @tbl VALUES ('Sor-Trondelag'            ,	     'Osen',	'ST',	'OS');
INSERT INTO @tbl VALUES ('Oslo'            ,	     'Oslo',	'OS',	'OS');
INSERT INTO @tbl VALUES ('Hordaland'            ,	     'Osteroy',	'HO',	'OT');
INSERT INTO @tbl VALUES ('Oppland'            ,	     'Ostre Toten',	'OP',	'OT');
INSERT INTO @tbl VALUES ('Nord-Trondelag'            ,	     'Overhalla',	'NT',	'OV');
INSERT INTO @tbl VALUES ('Buskerud'            ,	     'Ovre Eiker',	'BU',	'OE');
INSERT INTO @tbl VALUES ('Oppland'            ,	     'Oyer',	'OP',	'OY');
INSERT INTO @tbl VALUES ('Hordaland'            ,	     'Oygarden',	'HO',	'OY');
INSERT INTO @tbl VALUES ('Oppland'            ,	     'Oystre Slidre',	'OP',	'OS');
INSERT INTO @tbl VALUES ('Finnmark'            ,	     'Porsanger',	'FI',	'PO');
INSERT INTO @tbl VALUES ('Telemark'            ,	     'Porsgrunn',	'TE',	'PO');
INSERT INTO @tbl VALUES ('Ostfold'            ,	     'Rade',	'OF',	'RD');
INSERT INTO @tbl VALUES ('Hordaland'            ,	     'Radoy',	'HO',	'RA');
INSERT INTO @tbl VALUES ('Akershus'            ,	     'Raelingen',	'AK',	'RA');
INSERT INTO @tbl VALUES ('Ostfold'            ,	     'Rakkestad',	'OF',	'RK');
INSERT INTO @tbl VALUES ('Nordland'            ,	     'Rana',	'NO',	'RA');
INSERT INTO @tbl VALUES ('Rogaland'            ,	     'Randaberg',	'RO',	'RA');
INSERT INTO @tbl VALUES ('More og Romsdal'            ,	     'Rauma',	'MR',	'RA');
INSERT INTO @tbl VALUES ('Vestfold'            ,	     'Re',	'VF',	'RE');
INSERT INTO @tbl VALUES ('Hedmark'            ,	     'Rendalen',	'HE',	'RE');
INSERT INTO @tbl VALUES ('Sor-Trondelag'            ,	     'Rennebu',	'ST',	'RE');
INSERT INTO @tbl VALUES ('Rogaland'            ,	     'Rennesoy',	'RO',	'RE');
INSERT INTO @tbl VALUES ('More og Romsdal'            ,	     'Rindal',	'MR',	'RI');
INSERT INTO @tbl VALUES ('Oppland'            ,	     'Ringebu',	'OP',	'RI');
INSERT INTO @tbl VALUES ('Buskerud'            ,	     'Ringerike',	'BU',	'RI');
INSERT INTO @tbl VALUES ('Hedmark'            ,	     'Ringsaker',	'HE',	'RI');
INSERT INTO @tbl VALUES ('Aust-Agder'            ,	     'Risor',	'AA',	'RI');
INSERT INTO @tbl VALUES ('Sor-Trondelag'            ,	     'Rissa',	'ST',	'RI');
INSERT INTO @tbl VALUES ('Sor-Trondelag'            ,	     'Roan',	'ST',	'RO');
INSERT INTO @tbl VALUES ('Nordland'            ,	     'Rodoy',	'NO',	'RD');
INSERT INTO @tbl VALUES ('Buskerud'            ,	     'Rollag',	'BU',	'RL');
INSERT INTO @tbl VALUES ('Ostfold'            ,	     'Romskog',	'OF',	'RO');
INSERT INTO @tbl VALUES ('Sor-Trondelag'            ,	     'Roros',	'ST',	'RR');
INSERT INTO @tbl VALUES ('Nordland'            ,	     'Rost',	'NO',	'RS');
INSERT INTO @tbl VALUES ('Buskerud'            ,	     'Royken',	'BU',	'RK');
INSERT INTO @tbl VALUES ('Nord-Trondelag'            ,	     'Royrvik',	'NT',	'RO');
INSERT INTO @tbl VALUES ('Ostfold'            ,	     'Rygge',	'OF',	'RY');
INSERT INTO @tbl VALUES ('Troms'            ,	     'Salangen',	'TR',	'SA');
INSERT INTO @tbl VALUES ('Nordland'            ,	     'Saltdal',	'NO',	'SA');
INSERT INTO @tbl VALUES ('Hordaland'            ,	     'Samnanger',	'HO',	'SA');
INSERT INTO @tbl VALUES ('Vestfold'            ,	     'Sande',	'VF',	'SA');
INSERT INTO @tbl VALUES ('More og Romsdal'            ,	     'Sande',	'MR',	'SA');
INSERT INTO @tbl VALUES ('Vestfold'            ,	     'Sandefjord',	'VF',	'SF');
INSERT INTO @tbl VALUES ('Rogaland'            ,	     'Sandnes',	'RO',	'SN');
INSERT INTO @tbl VALUES ('More og Romsdal'            ,	     'Sandoy',	'MR',	'SN');
INSERT INTO @tbl VALUES ('Ostfold'            ,	     'Sarpsborg',	'OF',	'SA');
INSERT INTO @tbl VALUES ('Rogaland'            ,	     'Sauda',	'RO',	'SA');
INSERT INTO @tbl VALUES ('Telemark'            ,	     'Sauherad',	'TE',	'SA');
INSERT INTO @tbl VALUES ('Oppland'            ,	     'Sel',	'OP',	'SE');
INSERT INTO @tbl VALUES ('Sor-Trondelag'            ,	     'Selbu',	'ST',	'SE');
INSERT INTO @tbl VALUES ('Sogn og Fjordane'            ,	     'Selje',	'SF',	'SE');
INSERT INTO @tbl VALUES ('Telemark'            ,	     'Seljord',	'TE',	'SE');
INSERT INTO @tbl VALUES ('Buskerud'            ,	     'Sigdal',	'BU',	'SI');
INSERT INTO @tbl VALUES ('Telemark'            ,	     'Siljan',	'TE',	'SI');
INSERT INTO @tbl VALUES ('Vest-Agder'            ,	     'Sirdal',	'VA',	'SI');
INSERT INTO @tbl VALUES ('Troms'            ,	     'Skanland',	'TR',	'SL');
INSERT INTO @tbl VALUES ('Sor-Trondelag'            ,	     'Skaun',	'ST',	'SK');
INSERT INTO @tbl VALUES ('Akershus'            ,	     'Skedsmo',	'AK',	'SM');
INSERT INTO @tbl VALUES ('Akershus'            ,	     'Ski',	'AK',	'SK');
INSERT INTO @tbl VALUES ('Telemark'            ,	     'Skien',	'TE',	'SK');
INSERT INTO @tbl VALUES ('Ostfold'            ,	     'Skiptvet',	'OF',	'SK');
INSERT INTO @tbl VALUES ('Oppland'            ,	     'Skjak',	'OP',	'SK');
INSERT INTO @tbl VALUES ('Troms'            ,	     'Skjervoy',	'TR',	'SK');
INSERT INTO @tbl VALUES ('More og Romsdal'            ,	     'Skodje',	'MR',	'SK');
INSERT INTO @tbl VALUES ('More og Romsdal'            ,	     'Smola',	'MR',	'SM');
INSERT INTO @tbl VALUES ('Nord-Trondelag'            ,	     'Snasa',	'NT',	'SN');
INSERT INTO @tbl VALUES ('Sor-Trondelag'            ,	     'Snillfjord',	'ST',	'SN');
INSERT INTO @tbl VALUES ('Sogn og Fjordane'            ,	     'Sogndal',	'SF',	'SG');
INSERT INTO @tbl VALUES ('Vest-Agder'            ,	     'Sogne',	'VA',	'SG');
INSERT INTO @tbl VALUES ('Rogaland'            ,	     'Sokndal',	'RO',	'SK');
INSERT INTO @tbl VALUES ('Rogaland'            ,	     'Sola',	'RO',	'SL');
INSERT INTO @tbl VALUES ('Sogn og Fjordane'            ,	     'Solund',	'SF',	'SL');
INSERT INTO @tbl VALUES ('Nordland'            ,	     'Somna',	'NO',	'SM');
INSERT INTO @tbl VALUES ('Oppland'            ,	     'Sondre Land',	'OP',	'SL');
INSERT INTO @tbl VALUES ('Vest-Agder'            ,	     'Songdalen',	'VA',	'SD');
INSERT INTO @tbl VALUES ('Oppland'            ,	     'Sor-Aurdal',	'OP',	'SA');
INSERT INTO @tbl VALUES ('Nordland'            ,	     'Sorfold',	'NO',	'SR');
INSERT INTO @tbl VALUES ('Oppland'            ,	     'Sor-Fron',	'OP',	'SF');
INSERT INTO @tbl VALUES ('Hedmark'            ,	     'Sor-Odal',	'HE',	'SO');
INSERT INTO @tbl VALUES ('Troms'            ,	     'Sorreisa',	'TR',	'SO');
INSERT INTO @tbl VALUES ('Nordland'            ,	     'Sortland',	'NO',	'SO');
INSERT INTO @tbl VALUES ('Akershus'            ,	     'Sorum',	'AK',	'SO');
INSERT INTO @tbl VALUES ('Finnmark'            ,	     'Sor-Varanger',	'FI',	'SV');
INSERT INTO @tbl VALUES ('Ostfold'            ,	     'Spydeberg',	'OF',	'SP');
INSERT INTO @tbl VALUES ('Hedmark'            ,	     'Stange',	'HE',	'ST');
INSERT INTO @tbl VALUES ('Rogaland'            ,	     'Stavanger',	'RO',	'ST');
INSERT INTO @tbl VALUES ('Nordland'            ,	     'Steigen',	'NO',	'ST');
INSERT INTO @tbl VALUES ('Nord-Trondelag'            ,	     'Steinkjer',	'NT',	'ST');
INSERT INTO @tbl VALUES ('Nord-Trondelag'            ,	     'Stjordal',	'NT',	'SD');
INSERT INTO @tbl VALUES ('Vestfold'            ,	     'Stokke',	'VF',	'ST');
INSERT INTO @tbl VALUES ('Hordaland'            ,	     'Stord',	'HO',	'ST');
INSERT INTO @tbl VALUES ('More og Romsdal'            ,	     'Stordal',	'MR',	'SD');
INSERT INTO @tbl VALUES ('Hedmark'            ,	     'Stor-Elvdal',	'HE',	'SE');
INSERT INTO @tbl VALUES ('Troms'            ,	     'Storfjord',	'TR',	'ST');
INSERT INTO @tbl VALUES ('Rogaland'            ,	     'Strand',	'RO',	'SD');
INSERT INTO @tbl VALUES ('More og Romsdal'            ,	     'Stranda',	'MR',	'ST');
INSERT INTO @tbl VALUES ('Sogn og Fjordane'            ,	     'Stryn',	'SF',	'ST');
INSERT INTO @tbl VALUES ('More og Romsdal'            ,	     'Sula',	'MR',	'SU');
INSERT INTO @tbl VALUES ('Rogaland'            ,	     'Suldal',	'RO',	'SU');
INSERT INTO @tbl VALUES ('Hordaland'            ,	     'Sund',	'HO',	'SU');
INSERT INTO @tbl VALUES ('More og Romsdal'            ,	     'Sunndal',	'MR',	'SL');
INSERT INTO @tbl VALUES ('More og Romsdal'            ,	     'Surnadal',	'MR',	'SR');
INSERT INTO @tbl VALUES ('Hordaland'            ,	     'Sveio',	'HO',	'SV');
INSERT INTO @tbl VALUES ('Vestfold'            ,	     'Svelvik',	'VF',	'SV');
INSERT INTO @tbl VALUES ('More og Romsdal'            ,	     'Sykkylven',	'MR',	'SY');
INSERT INTO @tbl VALUES ('Finnmark'            ,	     'Tana',	'FI',	'TA');
INSERT INTO @tbl VALUES ('Rogaland'            ,	     'Time',	'RO',	'TI');
INSERT INTO @tbl VALUES ('More og Romsdal'            ,	     'Tingvoll',	'MR',	'TI');
INSERT INTO @tbl VALUES ('Telemark'            ,	     'Tinn',	'TE',	'TI');
INSERT INTO @tbl VALUES ('Nordland'            ,	     'Tjeldsund',	'NO',	'TJ');
INSERT INTO @tbl VALUES ('Vestfold'            ,	     'Tjome',	'VF',	'TJ');
INSERT INTO @tbl VALUES ('Telemark'            ,	     'Tokke',	'TE',	'TO');
INSERT INTO @tbl VALUES ('Hedmark'            ,	     'Tolga',	'HE',	'TO');
INSERT INTO @tbl VALUES ('Vestfold'            ,	     'Tonsberg',	'VF',	'TO');
INSERT INTO @tbl VALUES ('Troms'            ,	     'Torsken',	'TR',	'TO');
INSERT INTO @tbl VALUES ('Nordland'            ,	     'Traena',	'NO',	'TR');
INSERT INTO @tbl VALUES ('Troms'            ,	     'Tranoy',	'TR',	'TN');
INSERT INTO @tbl VALUES ('Ostfold'            ,	     'Trogstad',	'OF',	'TR');
INSERT INTO @tbl VALUES ('Troms'            ,	     'Tromso',	'TR',	'TR');
INSERT INTO @tbl VALUES ('Sor-Trondelag'            ,	     'Trondheim',	'ST',	'TR');
INSERT INTO @tbl VALUES ('Hedmark'            ,	     'Trysil',	'HE',	'TR');
INSERT INTO @tbl VALUES ('Aust-Agder'            ,	     'Tvedestrand',	'AA',	'TV');
INSERT INTO @tbl VALUES ('Sor-Trondelag'            ,	     'Tydal',	'ST',	'TY');
INSERT INTO @tbl VALUES ('Hedmark'            ,	     'Tynset',	'HE',	'TY');
INSERT INTO @tbl VALUES ('Nordland'            ,	     'Tysfjord',	'NO',	'TY');
INSERT INTO @tbl VALUES ('Hordaland'            ,	     'Tysnes',	'HO',	'TY');
INSERT INTO @tbl VALUES ('Rogaland'            ,	     'Tysvaer',	'RO',	'TY');
INSERT INTO @tbl VALUES ('Akershus'            ,	     'Ullensaker',	'AK',	'UL');
INSERT INTO @tbl VALUES ('Hordaland'            ,	     'Ullensvang',	'HO',	'UL');
INSERT INTO @tbl VALUES ('More og Romsdal'            ,	     'Ulstein',	'MR',	'UL');
INSERT INTO @tbl VALUES ('Hordaland'            ,	     'Ulvik',	'HO',	'UV');
INSERT INTO @tbl VALUES ('Rogaland'            ,	     'Utsira',	'RO',	'UT');
INSERT INTO @tbl VALUES ('Finnmark'            ,	     'Vadso',	'FI',	'VS');
INSERT INTO @tbl VALUES ('Nordland'            ,	     'Vaeroy',	'NO',	'VR');
INSERT INTO @tbl VALUES ('Oppland'            ,	     'Vaga',	'OP',	'VG');
INSERT INTO @tbl VALUES ('Nordland'            ,	     'Vagan',	'NO',	'VA');
INSERT INTO @tbl VALUES ('Sogn og Fjordane'            ,	     'Vagsoy',	'SF',	'VA');
INSERT INTO @tbl VALUES ('Hordaland'            ,	     'Vaksdal',	'HO',	'VA');
INSERT INTO @tbl VALUES ('Ostfold'            ,	     'Valer',	'OF',	'VA');
INSERT INTO @tbl VALUES ('Hedmark'            ,	     'Valer',	'HE',	'VA');
INSERT INTO @tbl VALUES ('Aust-Agder'            ,	     'Valle',	'AA',	'VA');
INSERT INTO @tbl VALUES ('Oppland'            ,	     'Vang',	'OP',	'VN');
INSERT INTO @tbl VALUES ('More og Romsdal'            ,	     'Vanylven',	'MR',	'VA');
INSERT INTO @tbl VALUES ('Finnmark'            ,	     'Vardo',	'FI',	'VR');
INSERT INTO @tbl VALUES ('Nordland'            ,	     'Vefsn',	'NO',	'VF');
INSERT INTO @tbl VALUES ('Nordland'            ,	     'Vega',	'NO',	'VG');
INSERT INTO @tbl VALUES ('Aust-Agder'            ,	     'Vegarshei',	'AA',	'VE');
INSERT INTO @tbl VALUES ('Vest-Agder'            ,	     'Vennesla',	'VA',	'VE');
INSERT INTO @tbl VALUES ('Nord-Trondelag'            ,	     'Verdal',	'NT',	'VD');
INSERT INTO @tbl VALUES ('Nord-Trondelag'            ,	     'Verran',	'NT',	'VR');
INSERT INTO @tbl VALUES ('Akershus'            ,	     'Vestby',	'AK',	'VE');
INSERT INTO @tbl VALUES ('More og Romsdal'            ,	     'Vestnes',	'MR',	'VE');
INSERT INTO @tbl VALUES ('Oppland'            ,	     'Vestre Slidre',	'OP',	'VS');
INSERT INTO @tbl VALUES ('Oppland'            ,	     'Vestre Toten',	'OP',	'VT');
INSERT INTO @tbl VALUES ('Nordland'            ,	     'Vestvagoy',	'NO',	'VV');
INSERT INTO @tbl VALUES ('Nordland'            ,	     'Vevelstad',	'NO',	'VS');
INSERT INTO @tbl VALUES ('Sogn og Fjordane'            ,	     'Vik',	'SF',	'VI');
INSERT INTO @tbl VALUES ('Nord-Trondelag'            ,	     'Vikna',	'NT',	'VI');
INSERT INTO @tbl VALUES ('Rogaland'            ,	     'Vindafjord',	'RO',	'VF');
INSERT INTO @tbl VALUES ('Telemark'            ,	     'Vinje',	'TE',	'VI');
INSERT INTO @tbl VALUES ('More og Romsdal'            ,	     'Volda',	'MR',	'VO');
INSERT INTO @tbl VALUES ('Hordaland'            ,	     'Voss',	'HO',	'VO');

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

