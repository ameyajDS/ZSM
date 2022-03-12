
/* ==================================================================================
    	Source File		:	setup_greece_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	12-10-2014
	Module ID		:	CDB
	Last updated		:	12-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Greece are set-up
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
WHERE	country_nm	=	'Greece';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Greece not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Administration',
		level_2_address_component	=	'Municipality',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Abelokipi-Menemeni',	'MH',	'AM');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Acharnes',	'AT',	'AC');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Aegaleo',	'AT',	'AE');
INSERT INTO @tbl VALUES ('Peloponnese, W.Greece & Ionian Islands'            ,	     'Aegialia',	'PW',	'AE');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Aegina',	'AT',	'AN');
INSERT INTO @tbl VALUES ('Aegean'            ,	     'Agathonissi',	'AI',	'AG');
INSERT INTO @tbl VALUES ('Thessaly and Central Greece'            ,	     'Aghia',	'TC',	'AG');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Aghia Paraskevi',	'AT',	'AP');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Aghia Varvara',	'AT',	'AV');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Aghii Anargyri-Kamatero',	'AT',	'AA');
INSERT INTO @tbl VALUES ('Mount Athos'            ,	     'Aghio Oros',	'MA',	'MA');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Aghios Dimitrios',	'AT',	'AD');
INSERT INTO @tbl VALUES ('Aegean'            ,	     'Aghios Efstratios',	'AI',	'AE');
INSERT INTO @tbl VALUES ('Crete'            ,	     'Aghios Nikolaos',	'CR',	'AN');
INSERT INTO @tbl VALUES ('Crete'            ,	     'Aghios Vassilios',	'CR',	'AV');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Agistri',	'AT',	'AG');
INSERT INTO @tbl VALUES ('Thessaly and Central Greece'            ,	     'Agrafa',	'TC',	'AF');
INSERT INTO @tbl VALUES ('Peloponnese, W.Greece & Ionian Islands'            ,	     'Agrinio',	'PW',	'AG');
INSERT INTO @tbl VALUES ('Peloponnese, W.Greece & Ionian Islands'            ,	     'Aktios-Vonitsa',	'PW',	'AV');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Alexandria',	'MH',	'AX');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Alexandroupoli',	'MH',	'AP');
INSERT INTO @tbl VALUES ('Thessaly and Central Greece'            ,	     'Aliartos',	'TC',	'AL');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Alimos',	'AT',	'AL');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Almopia',	'MH',	'AL');
INSERT INTO @tbl VALUES ('Thessaly and Central Greece'            ,	     'Almyros',	'TC',	'AM');
INSERT INTO @tbl VALUES ('Thessaly and Central Greece'            ,	     'Alonissos',	'TC',	'AN');
INSERT INTO @tbl VALUES ('Crete'            ,	     'Amarios',	'CR',	'AM');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Amaroussio',	'AT',	'AM');
INSERT INTO @tbl VALUES ('Thessaly and Central Greece'            ,	     'Amfiklia-Elatia',	'TC',	'AE');
INSERT INTO @tbl VALUES ('Peloponnese, W.Greece & Ionian Islands'            ,	     'Amfilochia',	'PW',	'AL');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Amfipoli',	'MH',	'AF');
INSERT INTO @tbl VALUES ('Aegean'            ,	     'Amorgos',	'AI',	'AM');
INSERT INTO @tbl VALUES ('Epirus and Western Macedonia'            ,	     'Amynteo',	'EM',	'AM');
INSERT INTO @tbl VALUES ('Aegean'            ,	     'Anafi',	'AI',	'AF');
INSERT INTO @tbl VALUES ('Peloponnese, W.Greece & Ionian Islands'            ,	     'Anatoliki Mani',	'PW',	'AI');
INSERT INTO @tbl VALUES ('Peloponnese, W.Greece & Ionian Islands'            ,	     'Andravida-Kyllini',	'PW',	'AD');
INSERT INTO @tbl VALUES ('Peloponnese, W.Greece & Ionian Islands'            ,	     'Andritsena-Krestenes',	'PW',	'AK');
INSERT INTO @tbl VALUES ('Aegean'            ,	     'Andros',	'AI',	'AN');
INSERT INTO @tbl VALUES ('Crete'            ,	     'Anogia',	'CR',	'AG');
INSERT INTO @tbl VALUES ('Aegean'            ,	     'Antiparos',	'AI',	'AP');
INSERT INTO @tbl VALUES ('Crete'            ,	     'Apokoronos',	'CR',	'AP');
INSERT INTO @tbl VALUES ('Crete'            ,	     'Archanes-Asteroussies',	'CR',	'AA');
INSERT INTO @tbl VALUES ('Peloponnese, W.Greece & Ionian Islands'            ,	     'Archea Olympia',	'PW',	'AO');
INSERT INTO @tbl VALUES ('Thessaly and Central Greece'            ,	     'Argithea',	'TC',	'AR');
INSERT INTO @tbl VALUES ('Peloponnese, W.Greece & Ionian Islands'            ,	     'Argos-Mykines',	'PW',	'AM');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Aristotelis',	'MH',	'AS');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Arriana',	'MH',	'AR');
INSERT INTO @tbl VALUES ('Epirus and Western Macedonia'            ,	     'Arta',	'EM',	'AR');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Aspropyrgos',	'AT',	'AS');
INSERT INTO @tbl VALUES ('Aegean'            ,	     'Astypalea',	'AI',	'AS');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Athens',	'AT',	'AT');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Avdira',	'MH',	'AV');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Chaidari',	'AT',	'XI');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Chalandri',	'AT',	'XL');
INSERT INTO @tbl VALUES ('Aegean'            ,	     'Chalki',	'AI',	'XK');
INSERT INTO @tbl VALUES ('Thessaly and Central Greece'            ,	     'Chalkida',	'TC',	'CH');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Chalkidona',	'MH',	'CH');
INSERT INTO @tbl VALUES ('Crete'            ,	     'Chania',	'CR',	'XN');
INSERT INTO @tbl VALUES ('Crete'            ,	     'Chersonissos',	'CR',	'XR');
INSERT INTO @tbl VALUES ('Aegean'            ,	     'Chios',	'AI',	'XS');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Dafni-Ymittos',	'AT',	'DY');
INSERT INTO @tbl VALUES ('Thessaly and Central Greece'            ,	     'Delphi',	'TC',	'DE');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Deltas',	'MH',	'DE');
INSERT INTO @tbl VALUES ('Epirus and Western Macedonia'            ,	     'Deskati',	'EM',	'DE');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Didymoticho',	'MH',	'DI');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Dion-Olympos',	'MH',	'DO');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Dionyssos',	'AT',	'DI');
INSERT INTO @tbl VALUES ('Thessaly and Central Greece'            ,	     'Dirfys-Messapia',	'TC',	'DM');
INSERT INTO @tbl VALUES ('Thessaly and Central Greece'            ,	     'Distomo-Arachova-Antikyra',	'TC',	'DA');
INSERT INTO @tbl VALUES ('Epirus and Western Macedonia'            ,	     'Dodoni',	'EM',	'DO');
INSERT INTO @tbl VALUES ('Thessaly and Central Greece'            ,	     'Domokos',	'TC',	'DK');
INSERT INTO @tbl VALUES ('Thessaly and Central Greece'            ,	     'Dorida',	'TC',	'DR');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Doxato',	'MH',	'DX');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Drama',	'MH',	'DR');
INSERT INTO @tbl VALUES ('Peloponnese, W.Greece & Ionian Islands'            ,	     'Dytiki Achaia',	'PW',	'DA');
INSERT INTO @tbl VALUES ('Peloponnese, W.Greece & Ionian Islands'            ,	     'Dytiki Mani',	'PW',	'DM');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Edessa',	'MH',	'ED');
INSERT INTO @tbl VALUES ('Peloponnese, W.Greece & Ionian Islands'            ,	     'Elafonissos',	'PW',	'EL');
INSERT INTO @tbl VALUES ('Thessaly and Central Greece'            ,	     'Elassona',	'TC',	'EL');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Elefsina',	'AT',	'EL');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Elliniko-Argyroupoli',	'AT',	'EA');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Emmanuel Pappas',	'MH',	'EP');
INSERT INTO @tbl VALUES ('Epirus and Western Macedonia'            ,	     'Eordaia',	'EM',	'EO');
INSERT INTO @tbl VALUES ('Peloponnese, W.Greece & Ionian Islands'            ,	     'Epidavros',	'PW',	'EP');
INSERT INTO @tbl VALUES ('Thessaly and Central Greece'            ,	     'Eretria',	'TC',	'ER');
INSERT INTO @tbl VALUES ('Peloponnese, W.Greece & Ionian Islands'            ,	     'Ermionida',	'PW',	'ER');
INSERT INTO @tbl VALUES ('Peloponnese, W.Greece & Ionian Islands'            ,	     'Erymanthos',	'PW',	'EM');
INSERT INTO @tbl VALUES ('Peloponnese, W.Greece & Ionian Islands'            ,	     'Evrotas',	'PW',	'EV');
INSERT INTO @tbl VALUES ('Crete'            ,	     'Faistos',	'CR',	'FA');
INSERT INTO @tbl VALUES ('Thessaly and Central Greece'            ,	     'Farkadona',	'TC',	'FK');
INSERT INTO @tbl VALUES ('Thessaly and Central Greece'            ,	     'Farsala',	'TC',	'FS');
INSERT INTO @tbl VALUES ('Epirus and Western Macedonia'            ,	     'Filiates',	'EM',	'FI');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Filothei-Psychiko',	'AT',	'FP');
INSERT INTO @tbl VALUES ('Epirus and Western Macedonia'            ,	     'Florina',	'EM',	'FL');
INSERT INTO @tbl VALUES ('Aegean'            ,	     'Folegandros',	'AI',	'FO');
INSERT INTO @tbl VALUES ('Aegean'            ,	     'Fourni Korseon',	'AI',	'FK');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Fyli',	'AT',	'FY');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Galatsi',	'AT',	'GA');
INSERT INTO @tbl VALUES ('Crete'            ,	     'Gavdos',	'CR',	'GA');
INSERT INTO @tbl VALUES ('Epirus and Western Macedonia'            ,	     'Georgios Karaiskakis',	'EM',	'GK');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Glyfada',	'AT',	'GL');
INSERT INTO @tbl VALUES ('Crete'            ,	     'Gortyna',	'CR',	'GO');
INSERT INTO @tbl VALUES ('Peloponnese, W.Greece & Ionian Islands'            ,	     'Gortynia',	'PW',	'GO');
INSERT INTO @tbl VALUES ('Epirus and Western Macedonia'            ,	     'Grevena',	'EM',	'GR');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Iasmos',	'MH',	'IA');
INSERT INTO @tbl VALUES ('Peloponnese, W.Greece & Ionian Islands'            ,	     'Ichalia',	'PW',	'IC');
INSERT INTO @tbl VALUES ('Crete'            ,	     'Ierapetra',	'CR',	'IE');
INSERT INTO @tbl VALUES ('Peloponnese, W.Greece & Ionian Islands'            ,	     'Iera Polis Messologhiou',	'PW',	'IP');
INSERT INTO @tbl VALUES ('Epirus and Western Macedonia'            ,	     'Igoumenitsa',	'EM',	'IG');
INSERT INTO @tbl VALUES ('Aegean'            ,	     'Ikaria',	'AI',	'IK');
INSERT INTO @tbl VALUES ('Peloponnese, W.Greece & Ionian Islands'            ,	     'Ilida',	'PW',	'IL');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Ilio',	'AT',	'IL');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Ilioupoli',	'AT',	'IP');
INSERT INTO @tbl VALUES ('Aegean'            ,	     'Inousses',	'AI',	'IN');
INSERT INTO @tbl VALUES ('Epirus and Western Macedonia'            ,	     'Ioannina',	'EM',	'IO');
INSERT INTO @tbl VALUES ('Aegean'            ,	     'Ios',	'AI',	'IO');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Iraklia',	'MH',	'IR');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Iraklio',	'AT',	'IR');
INSERT INTO @tbl VALUES ('Crete'            ,	     'Iraklio',	'CR',	'IR');
INSERT INTO @tbl VALUES ('Thessaly and Central Greece'            ,	     'Istiea-Aedipsos',	'TC',	'IA');
INSERT INTO @tbl VALUES ('Peloponnese, W.Greece & Ionian Islands'            ,	     'Ithaki',	'PW',	'IT');
INSERT INTO @tbl VALUES ('Thessaly and Central Greece'            ,	     'Kalabaka',	'TC',	'KB');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Kalamaria',	'MH',	'KM');
INSERT INTO @tbl VALUES ('Peloponnese, W.Greece & Ionian Islands'            ,	     'Kalamata',	'PW',	'KM');
INSERT INTO @tbl VALUES ('Peloponnese, W.Greece & Ionian Islands'            ,	     'Kalavryta',	'PW',	'KV');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Kallithea',	'AT',	'KA');
INSERT INTO @tbl VALUES ('Aegean'            ,	     'Kalymnos',	'AI',	'KM');
INSERT INTO @tbl VALUES ('Crete'            ,	     'Kandanos-Selinos',	'CR',	'KS');
INSERT INTO @tbl VALUES ('Thessaly and Central Greece'            ,	     'Karditsa',	'TC',	'KD');
INSERT INTO @tbl VALUES ('Aegean'            ,	     'Karpathos',	'AI',	'KR');
INSERT INTO @tbl VALUES ('Thessaly and Central Greece'            ,	     'Karpenissi',	'TC',	'KP');
INSERT INTO @tbl VALUES ('Thessaly and Central Greece'            ,	     'Karystos',	'TC',	'KR');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Kassandra',	'MH',	'KS');
INSERT INTO @tbl VALUES ('Aegean'            ,	     'Kassos',	'AI',	'KS');
INSERT INTO @tbl VALUES ('Epirus and Western Macedonia'            ,	     'Kastoria',	'EM',	'KA');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Katerini',	'MH',	'KT');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Kato Nevrokopi',	'MH',	'KN');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Kavala',	'MH',	'KV');
INSERT INTO @tbl VALUES ('Aegean'            ,	     'Kea',	'AI',	'KE');
INSERT INTO @tbl VALUES ('Peloponnese, W.Greece & Ionian Islands'            ,	     'Kefalonia',	'PW',	'KF');
INSERT INTO @tbl VALUES ('Epirus and Western Macedonia'            ,	     'Kentrika Tzoumerka',	'EM',	'KT');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Keratsini-Drapetsona',	'AT',	'KD');
INSERT INTO @tbl VALUES ('Peloponnese, W.Greece & Ionian Islands'            ,	     'Kerkyra',	'PW',	'KK');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Kessariani',	'AT',	'KE');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Kifissia',	'AT',	'KI');
INSERT INTO @tbl VALUES ('Thessaly and Central Greece'            ,	     'Kileler',	'TC',	'KL');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Kilkis',	'MH',	'KI');
INSERT INTO @tbl VALUES ('Aegean'            ,	     'Kimolos',	'AI',	'KI');
INSERT INTO @tbl VALUES ('Crete'            ,	     'Kissamos',	'CR',	'KI');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Komotini',	'MH',	'KO');
INSERT INTO @tbl VALUES ('Epirus and Western Macedonia'            ,	     'Konitsa',	'EM',	'KN');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Kordelio-Evosmo',	'MH',	'KE');
INSERT INTO @tbl VALUES ('Peloponnese, W.Greece & Ionian Islands'            ,	     'Korinthos',	'PW',	'KO');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Koropi',	'AT',	'KP');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Korydallos',	'AT',	'KR');
INSERT INTO @tbl VALUES ('Aegean'            ,	     'Kos',	'AI',	'KO');
INSERT INTO @tbl VALUES ('Epirus and Western Macedonia'            ,	     'Kozani',	'EM',	'KZ');
INSERT INTO @tbl VALUES ('Thessaly and Central Greece'            ,	     'Kymi-Aliveri',	'TC',	'KA');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Kythira',	'AT',	'KY');
INSERT INTO @tbl VALUES ('Aegean'            ,	     'Kythnos',	'AI',	'KY');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Lagadas',	'MH',	'LA');
INSERT INTO @tbl VALUES ('Thessaly and Central Greece'            ,	     'Lamia',	'TC',	'LM');
INSERT INTO @tbl VALUES ('Thessaly and Central Greece'            ,	     'Larissa',	'TC',	'LR');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Lavrio',	'AT',	'LA');
INSERT INTO @tbl VALUES ('Peloponnese, W.Greece & Ionian Islands'            ,	     'Lefkada',	'PW',	'LE');
INSERT INTO @tbl VALUES ('Aegean'            ,	     'Leros',	'AI',	'LR');
INSERT INTO @tbl VALUES ('Aegean'            ,	     'Lesvos',	'AI',	'LV');
INSERT INTO @tbl VALUES ('Thessaly and Central Greece'            ,	     'Levadia',	'TC',	'LE');
INSERT INTO @tbl VALUES ('Thessaly and Central Greece'            ,	     'Limni Plastiras',	'TC',	'LP');
INSERT INTO @tbl VALUES ('Aegean'            ,	     'Limnos',	'AI',	'LM');
INSERT INTO @tbl VALUES ('Aegean'            ,	     'Lipsi',	'AI',	'LP');
INSERT INTO @tbl VALUES ('Thessaly and Central Greece'            ,	     'Lokroi',	'TC',	'LO');
INSERT INTO @tbl VALUES ('Peloponnese, W.Greece & Ionian Islands'            ,	     'Loutraki-Aghii Theodori',	'PW',	'LA');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Lykovryssi-Pefki',	'AT',	'LP');
INSERT INTO @tbl VALUES ('Thessaly and Central Greece'            ,	     'Makrakomi',	'TC',	'MK');
INSERT INTO @tbl VALUES ('Crete'            ,	     'Malevizio',	'CR',	'MA');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Mandra-Idyllia',	'AT',	'MI');
INSERT INTO @tbl VALUES ('Thessaly and Central Greece'            ,	     'Mantoudios-Limni-Aghia Anna',	'TC',	'ML');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Marathon',	'AT',	'MA');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Markopoulo Messogheas',	'AT',	'MM');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Maronia-Sapes',	'MH',	'MS');
INSERT INTO @tbl VALUES ('Peloponnese, W.Greece & Ionian Islands'            ,	     'Megalopoli',	'PW',	'MP');
INSERT INTO @tbl VALUES ('Peloponnese, W.Greece & Ionian Islands'            ,	     'Meganissi',	'PW',	'MN');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Megara',	'AT',	'MG');
INSERT INTO @tbl VALUES ('Aegean'            ,	     'Megisti',	'AI',	'ME');
INSERT INTO @tbl VALUES ('Peloponnese, W.Greece & Ionian Islands'            ,	     'Messini',	'PW',	'ME');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Metamorfossi',	'AT',	'MF');
INSERT INTO @tbl VALUES ('Epirus and Western Macedonia'            ,	     'Metsovo',	'EM',	'ME');
INSERT INTO @tbl VALUES ('Aegean'            ,	     'Milos',	'AI',	'MI');
INSERT INTO @tbl VALUES ('Crete'            ,	     'Minoas Pediada',	'CR',	'MP');
INSERT INTO @tbl VALUES ('Thessaly and Central Greece'            ,	     'Molos-Aghios Konstantinos',	'TC',	'MA');
INSERT INTO @tbl VALUES ('Peloponnese, W.Greece & Ionian Islands'            ,	     'Monemvassia',	'PW',	'MO');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Moschato-Tavros',	'AT',	'MT');
INSERT INTO @tbl VALUES ('Thessaly and Central Greece'            ,	     'Mouzaki',	'TC',	'MO');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Myki',	'MH',	'MY');
INSERT INTO @tbl VALUES ('Aegean'            ,	     'Mykonos',	'AI',	'MY');
INSERT INTO @tbl VALUES ('Crete'            ,	     'Mylopotamos',	'CR',	'MY');
INSERT INTO @tbl VALUES ('Peloponnese, W.Greece & Ionian Islands'            ,	     'Nafpaktia',	'PW',	'NT');
INSERT INTO @tbl VALUES ('Peloponnese, W.Greece & Ionian Islands'            ,	     'Nafplio',	'PW',	'NP');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Naoussa',	'MH',	'NA');
INSERT INTO @tbl VALUES ('Aegean'            ,	     'Naxos and Mikres Kyklades',	'AI',	'NM');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Nea Ionia',	'AT',	'NI');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Neapoli-Sykees',	'MH',	'NS');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Nea Propontida',	'MH',	'NP');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Nea Smyrni',	'AT',	'NS');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Nea Zichni',	'MH',	'NZ');
INSERT INTO @tbl VALUES ('Peloponnese, W.Greece & Ionian Islands'            ,	     'Nemea',	'PW',	'NE');
INSERT INTO @tbl VALUES ('Epirus and Western Macedonia'            ,	     'Nestorio',	'EM',	'NE');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Nestos',	'MH',	'NE');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Nikea-Aghios Ioannis Rentis',	'AT',	'NA');
INSERT INTO @tbl VALUES ('Epirus and Western Macedonia'            ,	     'Nikolaos Skoufas',	'EM',	'NS');
INSERT INTO @tbl VALUES ('Aegean'            ,	     'Nissyros',	'AI',	'NI');
INSERT INTO @tbl VALUES ('Peloponnese, W.Greece & Ionian Islands'            ,	     'Notia Kynouria',	'PW',	'NK');
INSERT INTO @tbl VALUES ('Thessaly and Central Greece'            ,	     'Notios Pilios',	'TC',	'NP');
INSERT INTO @tbl VALUES ('Thessaly and Central Greece'            ,	     'Orchomenos',	'TC',	'OR');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Oreokastro',	'MH',	'OK');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Orestiada',	'MH',	'OD');
INSERT INTO @tbl VALUES ('Epirus and Western Macedonia'            ,	     'Orestida',	'EM',	'OR');
INSERT INTO @tbl VALUES ('Crete'            ,	     'Oropedio Lassithiou',	'CR',	'OL');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Oropos',	'AT',	'OR');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Pagheo',	'MH',	'PG');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Paionia',	'MH',	'PA');
INSERT INTO @tbl VALUES ('Thessaly and Central Greece'            ,	     'Palamas',	'TC',	'PA');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Paleo Faliro',	'AT',	'PF');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Pallini',	'AT',	'PA');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Papagos-Cholargos',	'AT',	'PX');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Paranesti',	'MH',	'PN');
INSERT INTO @tbl VALUES ('Epirus and Western Macedonia'            ,	     'Parga',	'EM',	'PA');
INSERT INTO @tbl VALUES ('Aegean'            ,	     'Paros',	'AI',	'PR');
INSERT INTO @tbl VALUES ('Aegean'            ,	     'Patmos',	'AI',	'PM');
INSERT INTO @tbl VALUES ('Peloponnese, W.Greece & Ionian Islands'            ,	     'Patras',	'PW',	'PA');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Pavlos Melas',	'MH',	'PM');
INSERT INTO @tbl VALUES ('Peloponnese, W.Greece & Ionian Islands'            ,	     'Paxi',	'PW',	'PX');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Peania',	'AT',	'PE');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Pella',	'MH',	'PE');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Penteli',	'AT',	'PT');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Perama',	'AT',	'PM');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Peristeri',	'AT',	'PR');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Petroupoli',	'AT',	'PP');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Philadelfia-Chalkidona',	'AT',	'FC');
INSERT INTO @tbl VALUES ('Peloponnese, W.Greece & Ionian Islands'            ,	     'Pinio',	'PW',	'PI');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Pireas',	'AT',	'PI');
INSERT INTO @tbl VALUES ('Crete'            ,	     'Platanias',	'CR',	'PL');
INSERT INTO @tbl VALUES ('Epirus and Western Macedonia'            ,	     'Pogonio',	'EM',	'PO');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Polygyros',	'MH',	'PO');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Poros',	'AT',	'PO');
INSERT INTO @tbl VALUES ('Epirus and Western Macedonia'            ,	     'Prespes',	'EM',	'PP');
INSERT INTO @tbl VALUES ('Epirus and Western Macedonia'            ,	     'Preveza',	'EM',	'PV');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Prossotsani',	'MH',	'PR');
INSERT INTO @tbl VALUES ('Aegean'            ,	     'Psara',	'AI',	'PS');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Pydna-Kolindros',	'MH',	'PK');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Pylea-Chortiatis',	'MH',	'PC');
INSERT INTO @tbl VALUES ('Thessaly and Central Greece'            ,	     'Pyli',	'TC',	'PY');
INSERT INTO @tbl VALUES ('Peloponnese, W.Greece & Ionian Islands'            ,	     'Pylos-Nestoras',	'PW',	'PN');
INSERT INTO @tbl VALUES ('Peloponnese, W.Greece & Ionian Islands'            ,	     'Pyrgos',	'PW',	'PY');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Rafina-Pikermi',	'AT',	'RP');
INSERT INTO @tbl VALUES ('Crete'            ,	     'Rethymno',	'CR',	'RE');
INSERT INTO @tbl VALUES ('Aegean'            ,	     'Rhodes',	'AI',	'RH');
INSERT INTO @tbl VALUES ('Thessaly and Central Greece'            ,	     'Rigas Feraios',	'TC',	'RF');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Salamina',	'AT',	'SM');
INSERT INTO @tbl VALUES ('Aegean'            ,	     'Samos',	'AI',	'SA');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Samothraki',	'MH',	'SA');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Saronikos',	'AT',	'SK');
INSERT INTO @tbl VALUES ('Aegean'            ,	     'Serifos',	'AI',	'SR');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Serres',	'MH',	'SE');
INSERT INTO @tbl VALUES ('Epirus and Western Macedonia'            ,	     'Servia-Velventos',	'EM',	'SV');
INSERT INTO @tbl VALUES ('Crete'            ,	     'Sfakia',	'CR',	'SF');
INSERT INTO @tbl VALUES ('Aegean'            ,	     'Sifnos',	'AI',	'SF');
INSERT INTO @tbl VALUES ('Aegean'            ,	     'Sikinos',	'AI',	'SK');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Sintiki',	'MH',	'SN');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Sithonia',	'MH',	'ST');
INSERT INTO @tbl VALUES ('Crete'            ,	     'Sitia',	'CR',	'SI');
INSERT INTO @tbl VALUES ('Thessaly and Central Greece'            ,	     'Skiathos',	'TC',	'SK');
INSERT INTO @tbl VALUES ('Thessaly and Central Greece'            ,	     'Skopelos',	'TC',	'SP');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Skydra',	'MH',	'SK');
INSERT INTO @tbl VALUES ('Thessaly and Central Greece'            ,	     'Skyros',	'TC',	'SR');
INSERT INTO @tbl VALUES ('Thessaly and Central Greece'            ,	     'Sofades',	'TC',	'SO');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Soufli',	'MH',	'SO');
INSERT INTO @tbl VALUES ('Epirus and Western Macedonia'            ,	     'Souli',	'EM',	'SO');
INSERT INTO @tbl VALUES ('Peloponnese, W.Greece & Ionian Islands'            ,	     'Sparta',	'PW',	'SP');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Spata-Artemis',	'AT',	'SA');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Spetses',	'AT',	'SP');
INSERT INTO @tbl VALUES ('Thessaly and Central Greece'            ,	     'Stylida',	'TC',	'ST');
INSERT INTO @tbl VALUES ('Peloponnese, W.Greece & Ionian Islands'            ,	     'Sykiones',	'PW',	'SY');
INSERT INTO @tbl VALUES ('Aegean'            ,	     'Symi',	'AI',	'SY');
INSERT INTO @tbl VALUES ('Aegean'            ,	     'Syros-Ermoupoli',	'AI',	'SE');
INSERT INTO @tbl VALUES ('Thessaly and Central Greece'            ,	     'Tanagra',	'TC',	'TA');
INSERT INTO @tbl VALUES ('Thessaly and Central Greece'            ,	     'Tempes',	'TC',	'TE');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Thassos',	'MH',	'TS');
INSERT INTO @tbl VALUES ('Thessaly and Central Greece'            ,	     'Thebes',	'TC',	'TH');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Thermaikos',	'MH',	'TR');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Thermi',	'MH',	'TH');
INSERT INTO @tbl VALUES ('Peloponnese, W.Greece & Ionian Islands'            ,	     'Thermo',	'PW',	'TH');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Thessaloniki',	'MH',	'TL');
INSERT INTO @tbl VALUES ('Aegean'            ,	     'Thira',	'AI',	'TH');
INSERT INTO @tbl VALUES ('Aegean'            ,	     'Tilos',	'AI',	'TL');
INSERT INTO @tbl VALUES ('Aegean'            ,	     'Tinos',	'AI',	'TN');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Topiros',	'MH',	'TO');
INSERT INTO @tbl VALUES ('Peloponnese, W.Greece & Ionian Islands'            ,	     'Trifylia',	'PW',	'TF');
INSERT INTO @tbl VALUES ('Thessaly and Central Greece'            ,	     'Trikala',	'TC',	'TR');
INSERT INTO @tbl VALUES ('Peloponnese, W.Greece & Ionian Islands'            ,	     'Tripoli',	'PW',	'TP');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Trizina',	'AT',	'TR');
INSERT INTO @tbl VALUES ('Thessaly and Central Greece'            ,	     'Tyrnavos',	'TC',	'TY');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Vari-Voula-Vouliagmeni',	'AT',	'VV');
INSERT INTO @tbl VALUES ('Peloponnese, W.Greece & Ionian Islands'            ,	     'Velo-Vocha',	'PW',	'VV');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Veria',	'MH',	'VE');
INSERT INTO @tbl VALUES ('Crete'            ,	     'Viannos',	'CR',	'VI');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Vissaltia',	'MH',	'VI');
INSERT INTO @tbl VALUES ('Epirus and Western Macedonia'            ,	     'Voios',	'EM',	'VO');
INSERT INTO @tbl VALUES ('Thessaly and Central Greece'            ,	     'Volos',	'TC',	'VO');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Volvi',	'MH',	'VO');
INSERT INTO @tbl VALUES ('Epirus and Western Macedonia'            ,	     'Voreia Tzoumerka',	'EM',	'VT');
INSERT INTO @tbl VALUES ('Peloponnese, W.Greece & Ionian Islands'            ,	     'Voria Kynouria',	'PW',	'VK');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Vrilissia',	'AT',	'VR');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Vyron',	'AT',	'VY');
INSERT INTO @tbl VALUES ('Macedonia and Thrace'            ,	     'Xanthi',	'MH',	'XA');
INSERT INTO @tbl VALUES ('Peloponnese, W.Greece & Ionian Islands'            ,	     'Xiromeros',	'PW',	'XI');
INSERT INTO @tbl VALUES ('Peloponnese, W.Greece & Ionian Islands'            ,	     'Xylokastro-Evrostina',	'PW',	'XE');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Ydra',	'AT',	'YD');
INSERT INTO @tbl VALUES ('Peloponnese, W.Greece & Ionian Islands'            ,	     'Zacharo',	'PW',	'ZA');
INSERT INTO @tbl VALUES ('Thessaly and Central Greece'            ,	     'Zagora-Mouressio',	'TC',	'ZM');
INSERT INTO @tbl VALUES ('Epirus and Western Macedonia'            ,	     'Zagori',	'EM',	'ZA');
INSERT INTO @tbl VALUES ('Peloponnese, W.Greece & Ionian Islands'            ,	     'Zakynthos',	'PW',	'ZK');
INSERT INTO @tbl VALUES ('Epirus and Western Macedonia'            ,	     'Ziros',	'EM',	'ZR');
INSERT INTO @tbl VALUES ('Epirus and Western Macedonia'            ,	     'Zitsa',	'EM',	'ZT');
INSERT INTO @tbl VALUES ('Attica'            ,	     'Zografos',	'AT',	'ZO');

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

