
/* ==================================================================================
    	Source File		:	setup_croatia_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	10-10-2014
	Module ID		:	CDB
	Last updated		:	10-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Croatia are set-up
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
WHERE	country_nm	=	'Croatia';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Croatia not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'County',
		level_2_address_component	=	'Commune',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Vukovarsko-Srijemska'            ,	     'Andrijasevci',	'VS',	'AN');
INSERT INTO @tbl VALUES ('Osjecko-Baranjska'            ,	     'Antunovac',	'OB',	'AN');
INSERT INTO @tbl VALUES ('Vukovarsko-Srijemska'            ,	     'Babina Greda',	'VS',	'BG');
INSERT INTO @tbl VALUES ('Primorsko-Goranska'            ,	     'Bakar',	'PG',	'BR');
INSERT INTO @tbl VALUES ('Istarska'            ,	     'Bale',	'IS',	'BL');
INSERT INTO @tbl VALUES ('Istarska'            ,	     'Barban',	'IS',	'BA');
INSERT INTO @tbl VALUES ('Karlovacka'            ,	     'Barilovici',	'KA',	'BA');
INSERT INTO @tbl VALUES ('Primorsko-Goranska'            ,	     'Baska',	'PG',	'BA');
INSERT INTO @tbl VALUES ('Splitsko-Dalmatinska'            ,	     'Baska Voda',	'SD',	'BV');
INSERT INTO @tbl VALUES ('Brodsko-Posavska'            ,	     'Bebrina',	'SP',	'BE');
INSERT INTO @tbl VALUES ('Krapinsko-Zagorska'            ,	     'Bedekovcina',	'KZ',	'BE');
INSERT INTO @tbl VALUES ('Zagrebacka'            ,	     'Bedenica',	'ZG',	'BE');
INSERT INTO @tbl VALUES ('Varazdinska'            ,	     'Bednja',	'VA',	'BD');
INSERT INTO @tbl VALUES ('Medimurska'            ,	     'Belica',	'ME',	'BE');
INSERT INTO @tbl VALUES ('Osjecko-Baranjska'            ,	     'Beli Manastir',	'OB',	'BM');
INSERT INTO @tbl VALUES ('Osjecko-Baranjska'            ,	     'Belisce',	'OB',	'BE');
INSERT INTO @tbl VALUES ('Zadarska'            ,	     'Benkovac',	'ZD',	'BE');
INSERT INTO @tbl VALUES ('Bjelovarska-Bilogorska'            ,	     'Berek',	'BB',	'BE');
INSERT INTO @tbl VALUES ('Varazdinska'            ,	     'Beretinec',	'VA',	'BT');
INSERT INTO @tbl VALUES ('Zadarska'            ,	     'Bibinje',	'ZD',	'BI');
INSERT INTO @tbl VALUES ('Sibensko-Kninska'            ,	     'Bilice',	'SB',	'BL');
INSERT INTO @tbl VALUES ('Osjecko-Baranjska'            ,	     'Bilje',	'OB',	'BJ');
INSERT INTO @tbl VALUES ('Zadarska'            ,	     'Biograd na Moru',	'ZD',	'BN');
INSERT INTO @tbl VALUES ('Sibensko-Kninska'            ,	     'Biskupija',	'SB',	'BP');
INSERT INTO @tbl VALUES ('Zagrebacka'            ,	     'Bistra',	'ZG',	'BI');
INSERT INTO @tbl VALUES ('Osjecko-Baranjska'            ,	     'Bizovac',	'OB',	'BZ');
INSERT INTO @tbl VALUES ('Bjelovarska-Bilogorska'            ,	     'Bjelovar',	'BB',	'BJ');
INSERT INTO @tbl VALUES ('Dubrovacko-Neretvanska'            ,	     'Blato',	'DN',	'BL');
INSERT INTO @tbl VALUES ('Vukovarsko-Srijemska'            ,	     'Bogdanovci',	'VS',	'BD');
INSERT INTO @tbl VALUES ('Splitsko-Dalmatinska'            ,	     'Bol',	'SD',	'BO');
INSERT INTO @tbl VALUES ('Vukovarsko-Srijemska'            ,	     'Borovo',	'VS',	'BR');
INSERT INTO @tbl VALUES ('Karlovacka'            ,	     'Bosiljevo',	'KA',	'BO');
INSERT INTO @tbl VALUES ('Vukovarsko-Srijemska'            ,	     'Bosnjaci',	'VS',	'BS');
INSERT INTO @tbl VALUES ('Zagrebacka'            ,	     'Brckovljani',	'ZG',	'BL');
INSERT INTO @tbl VALUES ('Zagrebacka'            ,	     'Brdovec',	'ZG',	'BR');
INSERT INTO @tbl VALUES ('Splitsko-Dalmatinska'            ,	     'Brela',	'SD',	'BR');
INSERT INTO @tbl VALUES ('Pozesko-Slavonska'            ,	     'Brestovac',	'PS',	'BR');
INSERT INTO @tbl VALUES ('Varazdinska'            ,	     'Breznica',	'VA',	'BR');
INSERT INTO @tbl VALUES ('Varazdinska'            ,	     'Breznicki Hum',	'VA',	'BH');
INSERT INTO @tbl VALUES ('Licko-Senjska'            ,	     'Brinje',	'LS',	'BR');
INSERT INTO @tbl VALUES ('Primorsko-Goranska'            ,	     'Brod Moravice',	'PG',	'BM');
INSERT INTO @tbl VALUES ('Brodsko-Posavska'            ,	     'Brodski Stupnik',	'SP',	'BS');
INSERT INTO @tbl VALUES ('Istarska'            ,	     'Brtonigla',	'IS',	'BR');
INSERT INTO @tbl VALUES ('Krapinsko-Zagorska'            ,	     'Budinscina',	'KZ',	'BU');
INSERT INTO @tbl VALUES ('Istarska'            ,	     'Buje',	'IS',	'BJ');
INSERT INTO @tbl VALUES ('Brodsko-Posavska'            ,	     'Bukovlje',	'SP',	'BU');
INSERT INTO @tbl VALUES ('Istarska'            ,	     'Buzet',	'IS',	'BZ');
INSERT INTO @tbl VALUES ('Primorsko-Goranska'            ,	     'Cabar',	'PG',	'CB');
INSERT INTO @tbl VALUES ('Viroviticko-Podravska'            ,	     'Cacinci',	'VP',	'CC');
INSERT INTO @tbl VALUES ('Viroviticko-Podravska'            ,	     'Cadavica',	'VP',	'CV');
INSERT INTO @tbl VALUES ('Pozesko-Slavonska'            ,	     'Caglin',	'PS',	'CA');
INSERT INTO @tbl VALUES ('Medimurska'            ,	     'Cakovec',	'ME',	'CA');
INSERT INTO @tbl VALUES ('Primorsko-Goranska'            ,	     'Cavle',	'PG',	'CV');
INSERT INTO @tbl VALUES ('Bjelovarska-Bilogorska'            ,	     'Cazma',	'BB',	'CA');
INSERT INTO @tbl VALUES ('Osjecko-Baranjska'            ,	     'Ceminac',	'OB',	'CM');
INSERT INTO @tbl VALUES ('Osjecko-Baranjska'            ,	     'Cepin',	'OB',	'CP');
INSERT INTO @tbl VALUES ('Vukovarsko-Srijemska'            ,	     'Cerna',	'VS',	'CE');
INSERT INTO @tbl VALUES ('Brodsko-Posavska'            ,	     'Cernik',	'SP',	'CE');
INSERT INTO @tbl VALUES ('Istarska'            ,	     'Cerovlje',	'IS',	'CE');
INSERT INTO @tbl VALUES ('Varazdinska'            ,	     'Cestica',	'VA',	'CE');
INSERT INTO @tbl VALUES ('Karlovacka'            ,	     'Cetingrad',	'KA',	'CE');
INSERT INTO @tbl VALUES ('Splitsko-Dalmatinska'            ,	     'Cista Provo',	'SD',	'CP');
INSERT INTO @tbl VALUES ('Sibensko-Kninska'            ,	     'Civljane',	'SB',	'CI');
INSERT INTO @tbl VALUES ('Primorsko-Goranska'            ,	     'Cres',	'PG',	'CR');
INSERT INTO @tbl VALUES ('Primorsko-Goranska'            ,	     'Crikvenica',	'PG',	'CK');
INSERT INTO @tbl VALUES ('Viroviticko-Podravska'            ,	     'Crnac',	'VP',	'CR');
INSERT INTO @tbl VALUES ('Osjecko-Baranjska'            ,	     'Dakovo',	'OB',	'DK');
INSERT INTO @tbl VALUES ('Osjecko-Baranjska'            ,	     'Darda',	'OB',	'DD');
INSERT INTO @tbl VALUES ('Bjelovarska-Bilogorska'            ,	     'Daruvar',	'BB',	'DA');
INSERT INTO @tbl VALUES ('Brodsko-Posavska'            ,	     'Davor',	'SP',	'DV');
INSERT INTO @tbl VALUES ('Medimurska'            ,	     'Dekanovec',	'ME',	'DE');
INSERT INTO @tbl VALUES ('Koprivnicko-Krizevacka'            ,	     'Delekovec',	'KK',	'DE');
INSERT INTO @tbl VALUES ('Primorsko-Goranska'            ,	     'Delnice',	'PG',	'DE');
INSERT INTO @tbl VALUES ('Krapinsko-Zagorska'            ,	     'Desinic',	'KZ',	'DE');
INSERT INTO @tbl VALUES ('Bjelovarska-Bilogorska'            ,	     'Dezanovac',	'BB',	'DE');
INSERT INTO @tbl VALUES ('Splitsko-Dalmatinska'            ,	     'Dicmo',	'SD',	'DI');
INSERT INTO @tbl VALUES ('Primorsko-Goranska'            ,	     'Dobrinj',	'PG',	'DO');
INSERT INTO @tbl VALUES ('Medimurska'            ,	     'Domasinec',	'ME',	'DO');
INSERT INTO @tbl VALUES ('Medimurska'            ,	     'Donja Dubrava',	'ME',	'DD');
INSERT INTO @tbl VALUES ('Osjecko-Baranjska'            ,	     'Donja Moticina',	'OB',	'DM');
INSERT INTO @tbl VALUES ('Krapinsko-Zagorska'            ,	     'Donja Stubica',	'KZ',	'DS');
INSERT INTO @tbl VALUES ('Varazdinska'            ,	     'Donja Voca',	'VA',	'DV');
INSERT INTO @tbl VALUES ('Brodsko-Posavska'            ,	     'Donji Andrijevci',	'SP',	'DA');
INSERT INTO @tbl VALUES ('Medimurska'            ,	     'Donji Kraljevec',	'ME',	'DK');
INSERT INTO @tbl VALUES ('Sisacko-Moslavacka'            ,	     'Donji Kukuruzari',	'SM',	'DK');
INSERT INTO @tbl VALUES ('Licko-Senjska'            ,	     'Donji Lapac',	'LS',	'DL');
INSERT INTO @tbl VALUES ('Osjecko-Baranjska'            ,	     'Donji Miholjac',	'OB',	'DJ');
INSERT INTO @tbl VALUES ('Medimurska'            ,	     'Donji Vidovec',	'ME',	'DV');
INSERT INTO @tbl VALUES ('Brodsko-Posavska'            ,	     'Dragalic',	'SP',	'DR');
INSERT INTO @tbl VALUES ('Karlovacka'            ,	     'Draganic',	'KA',	'DG');
INSERT INTO @tbl VALUES ('Osjecko-Baranjska'            ,	     'Draz',	'OB',	'DZ');
INSERT INTO @tbl VALUES ('Osjecko-Baranjska'            ,	     'Drenje',	'OB',	'DR');
INSERT INTO @tbl VALUES ('Vukovarsko-Srijemska'            ,	     'Drenovci',	'VS',	'DR');
INSERT INTO @tbl VALUES ('Sibensko-Kninska'            ,	     'Drnis',	'SB',	'DR');
INSERT INTO @tbl VALUES ('Koprivnicko-Krizevacka'            ,	     'Drnje',	'KK',	'DR');
INSERT INTO @tbl VALUES ('Zagrebacka'            ,	     'Dubrava',	'ZG',	'DU');
INSERT INTO @tbl VALUES ('Zagrebacka'            ,	     'Dubravica',	'ZG',	'DC');
INSERT INTO @tbl VALUES ('Dubrovacko-Neretvanska'            ,	     'Dubrovacko primorje',	'DN',	'DP');
INSERT INTO @tbl VALUES ('Dubrovacko-Neretvanska'            ,	     'Dubrovnik',	'DN',	'DU');
INSERT INTO @tbl VALUES ('Karlovacka'            ,	     'Duga Resa',	'KA',	'DR');
INSERT INTO @tbl VALUES ('Splitsko-Dalmatinska'            ,	     'Dugi Rat',	'SD',	'DR');
INSERT INTO @tbl VALUES ('Splitsko-Dalmatinska'            ,	     'Dugopolje',	'SD',	'DU');
INSERT INTO @tbl VALUES ('Zagrebacka'            ,	     'Dugo Selo',	'ZG',	'DS');
INSERT INTO @tbl VALUES ('Bjelovarska-Bilogorska'            ,	     'Dulovac',	'BB',	'DU');
INSERT INTO @tbl VALUES ('Osjecko-Baranjska'            ,	     'Durdenovac',	'OB',	'DU');
INSERT INTO @tbl VALUES ('Koprivnicko-Krizevacka'            ,	     'Durdevac',	'KK',	'DU');
INSERT INTO @tbl VALUES ('Krapinsko-Zagorska'            ,	     'Durmanec',	'KZ',	'DU');
INSERT INTO @tbl VALUES ('Sisacko-Moslavacka'            ,	     'Dvor',	'SM',	'DV');
INSERT INTO @tbl VALUES ('Osjecko-Baranjska'            ,	     'Erdut',	'OB',	'ED');
INSERT INTO @tbl VALUES ('Osjecko-Baranjska'            ,	     'Ernestinovo',	'OB',	'EN');
INSERT INTO @tbl VALUES ('Sibensko-Kninska'            ,	     'Ervenik',	'SB',	'ER');
INSERT INTO @tbl VALUES ('Zagrebacka'            ,	     'Farkasevac',	'ZG',	'FA');
INSERT INTO @tbl VALUES ('Istarska'            ,	     'Fazana',	'IS',	'FS');
INSERT INTO @tbl VALUES ('Koprivnicko-Krizevacka'            ,	     'Ferdinandovac',	'KK',	'FE');
INSERT INTO @tbl VALUES ('Osjecko-Baranjska'            ,	     'Fericanci',	'OB',	'FE');
INSERT INTO @tbl VALUES ('Istarska'            ,	     'Funtana',	'IS',	'FT');
INSERT INTO @tbl VALUES ('Primorsko-Goranska'            ,	     'Fuzine',	'PG',	'FU');
INSERT INTO @tbl VALUES ('Zadarska'            ,	     'Galovac',	'ZD',	'GA');
INSERT INTO @tbl VALUES ('Brodsko-Posavska'            ,	     'Garcin',	'SP',	'GA');
INSERT INTO @tbl VALUES ('Bjelovarska-Bilogorska'            ,	     'Garesnica',	'BB',	'GA');
INSERT INTO @tbl VALUES ('Karlovacka'            ,	     'Generalski Stol',	'KA',	'GS');
INSERT INTO @tbl VALUES ('Sisacko-Moslavacka'            ,	     'Glina',	'SM',	'GL');
INSERT INTO @tbl VALUES ('Koprivnicko-Krizevacka'            ,	     'Gola',	'KK',	'GO');
INSERT INTO @tbl VALUES ('Medimurska'            ,	     'Gorican',	'ME',	'GO');
INSERT INTO @tbl VALUES ('Osjecko-Baranjska'            ,	     'Gorjani',	'OB',	'GO');
INSERT INTO @tbl VALUES ('Koprivnicko-Krizevacka'            ,	     'Gornja Rijeka',	'KK',	'GR');
INSERT INTO @tbl VALUES ('Krapinsko-Zagorska'            ,	     'Gornja Stubica',	'KZ',	'GS');
INSERT INTO @tbl VALUES ('Brodsko-Posavska'            ,	     'Gornja Vrba',	'SP',	'GV');
INSERT INTO @tbl VALUES ('Brodsko-Posavska'            ,	     'Gornji Bogicevci',	'SP',	'GB');
INSERT INTO @tbl VALUES ('Varazdinska'            ,	     'Gornji Kneginec',	'VA',	'GK');
INSERT INTO @tbl VALUES ('Medimurska'            ,	     'Gornji Mihaljevec',	'ME',	'GM');
INSERT INTO @tbl VALUES ('Licko-Senjska'            ,	     'Gospic',	'LS',	'GO');
INSERT INTO @tbl VALUES ('Zadarska'            ,	     'Gracac',	'ZD',	'GR');
INSERT INTO @tbl VALUES ('Istarska'            ,	     'Gracisce',	'IS',	'GR');
INSERT INTO @tbl VALUES ('Splitsko-Dalmatinska'            ,	     'Gradac',	'SD',	'GR');
INSERT INTO @tbl VALUES ('Zagrebacka'            ,	     'Gradec',	'ZG',	'GR');
INSERT INTO @tbl VALUES ('Viroviticko-Podravska'            ,	     'Gradina',	'VP',	'GR');
INSERT INTO @tbl VALUES ('Vukovarsko-Srijemska'            ,	     'Gradiste',	'VS',	'GR');
INSERT INTO @tbl VALUES ('Istarska'            ,	     'Groznjan',	'IS',	'GN');
INSERT INTO @tbl VALUES ('Bjelovarska-Bilogorska'            ,	     'Grubisno Polje',	'BB',	'GP');
INSERT INTO @tbl VALUES ('Brodsko-Posavska'            ,	     'Gundinci',	'SP',	'GU');
INSERT INTO @tbl VALUES ('Vukovarsko-Srijemska'            ,	     'Gunja',	'VS',	'GU');
INSERT INTO @tbl VALUES ('Sisacko-Moslavacka'            ,	     'Gvozd',	'SM',	'GV');
INSERT INTO @tbl VALUES ('Bjelovarska-Bilogorska'            ,	     'Hercegovac',	'BB',	'HE');
INSERT INTO @tbl VALUES ('Koprivnicko-Krizevacka'            ,	     'Hlebine',	'KK',	'HL');
INSERT INTO @tbl VALUES ('Krapinsko-Zagorska'            ,	     'Hrascina',	'KZ',	'HR');
INSERT INTO @tbl VALUES ('Splitsko-Dalmatinska'            ,	     'Hrvace',	'SD',	'HR');
INSERT INTO @tbl VALUES ('Sisacko-Moslavacka'            ,	     'Hrvatska Dubica',	'SM',	'HD');
INSERT INTO @tbl VALUES ('Sisacko-Moslavacka'            ,	     'Hrvatska Kostajnica',	'SM',	'HK');
INSERT INTO @tbl VALUES ('Krapinsko-Zagorska'            ,	     'Hum na Sutli',	'KZ',	'HN');
INSERT INTO @tbl VALUES ('Splitsko-Dalmatinska'            ,	     'Hvar',	'SD',	'HV');
INSERT INTO @tbl VALUES ('Vukovarsko-Srijemska'            ,	     'Ilok',	'VS',	'IL');
INSERT INTO @tbl VALUES ('Splitsko-Dalmatinska'            ,	     'Imotski',	'SD',	'IM');
INSERT INTO @tbl VALUES ('Varazdinska'            ,	     'Ivanec',	'VA',	'IV');
INSERT INTO @tbl VALUES ('Zagrebacka'            ,	     'Ivanic-Grad',	'ZG',	'IG');
INSERT INTO @tbl VALUES ('Vukovarsko-Srijemska'            ,	     'Ivankovo',	'VS',	'IV');
INSERT INTO @tbl VALUES ('Bjelovarska-Bilogorska'            ,	     'Ivanska',	'BB',	'IV');
INSERT INTO @tbl VALUES ('Osjecko-Baranjska'            ,	     'Jagodnjak',	'OB',	'JA');
INSERT INTO @tbl VALUES ('Zagrebacka'            ,	     'Jakovlje',	'ZG',	'JK');
INSERT INTO @tbl VALUES ('Pozesko-Slavonska'            ,	     'Jaksic',	'PS',	'JA');
INSERT INTO @tbl VALUES ('Varazdinska'            ,	     'Jalzabet',	'VA',	'JA');
INSERT INTO @tbl VALUES ('Dubrovacko-Neretvanska'            ,	     'Janjina',	'DN',	'JA');
INSERT INTO @tbl VALUES ('Vukovarsko-Srijemska'            ,	     'Jarmina',	'VS',	'JA');
INSERT INTO @tbl VALUES ('Zadarska'            ,	     'Jasenice',	'ZD',	'JA');
INSERT INTO @tbl VALUES ('Sisacko-Moslavacka'            ,	     'Jasenovac',	'SM',	'JA');
INSERT INTO @tbl VALUES ('Zagrebacka'            ,	     'Jastrebarsko',	'ZG',	'JS');
INSERT INTO @tbl VALUES ('Primorsko-Goranska'            ,	     'Jelenje',	'PG',	'JE');
INSERT INTO @tbl VALUES ('Splitsko-Dalmatinska'            ,	     'Jelsa',	'SD',	'JE');
INSERT INTO @tbl VALUES ('Krapinsko-Zagorska'            ,	     'Jesenje',	'KZ',	'JE');
INSERT INTO @tbl VALUES ('Karlovacka'            ,	     'Josipdol',	'KA',	'JO');
INSERT INTO @tbl VALUES ('Zadarska'            ,	     'Kali',	'ZD',	'KA');
INSERT INTO @tbl VALUES ('Koprivnicko-Krizevacka'            ,	     'Kalinovac',	'KK',	'KV');
INSERT INTO @tbl VALUES ('Koprivnicko-Krizevacka'            ,	     'Kalnik',	'KK',	'KK');
INSERT INTO @tbl VALUES ('Karlovacka'            ,	     'Kamanje',	'KA',	'KM');
INSERT INTO @tbl VALUES ('Istarska'            ,	     'Kanfanar',	'IS',	'KF');
INSERT INTO @tbl VALUES ('Bjelovarska-Bilogorska'            ,	     'Kapela',	'BB',	'KA');
INSERT INTO @tbl VALUES ('Pozesko-Slavonska'            ,	     'Kaptol',	'PS',	'KA');
INSERT INTO @tbl VALUES ('Licko-Senjska'            ,	     'Karlobag',	'LS',	'KA');
INSERT INTO @tbl VALUES ('Karlovacka'            ,	     'Karlovac',	'KA',	'KV');
INSERT INTO @tbl VALUES ('Istarska'            ,	     'Karojba',	'IS',	'KB');
INSERT INTO @tbl VALUES ('Primorsko-Goranska'            ,	     'Kastav',	'PG',	'KA');
INSERT INTO @tbl VALUES ('Splitsko-Dalmatinska'            ,	     'Kastela',	'SD',	'KA');
INSERT INTO @tbl VALUES ('Istarska'            ,	     'Kastelir-Labinci',	'IS',	'KL');
INSERT INTO @tbl VALUES ('Sibensko-Kninska'            ,	     'Kijevo',	'SB',	'KV');
INSERT INTO @tbl VALUES ('Sibensko-Kninska'            ,	     'Kistanje',	'SB',	'KS');
INSERT INTO @tbl VALUES ('Brodsko-Posavska'            ,	     'Klakar',	'SP',	'KL');
INSERT INTO @tbl VALUES ('Primorsko-Goranska'            ,	     'Klana',	'PG',	'KL');
INSERT INTO @tbl VALUES ('Krapinsko-Zagorska'            ,	     'Klanjec',	'KZ',	'KL');
INSERT INTO @tbl VALUES ('Varazdinska'            ,	     'Klenovnik',	'VA',	'KL');
INSERT INTO @tbl VALUES ('Zagrebacka'            ,	     'Klinca Sela',	'ZG',	'KS');
INSERT INTO @tbl VALUES ('Splitsko-Dalmatinska'            ,	     'Klis',	'SD',	'KL');
INSERT INTO @tbl VALUES ('Zagrebacka'            ,	     'Klostar Ivanic',	'ZG',	'KI');
INSERT INTO @tbl VALUES ('Koprivnicko-Krizevacka'            ,	     'Klostar Podravski',	'KK',	'KP');
INSERT INTO @tbl VALUES ('Osjecko-Baranjska'            ,	     'Knezevi Vinogradi',	'OB',	'KV');
INSERT INTO @tbl VALUES ('Sibensko-Kninska'            ,	     'Knin',	'SB',	'KN');
INSERT INTO @tbl VALUES ('Zadarska'            ,	     'Kolan',	'ZD',	'KO');
INSERT INTO @tbl VALUES ('Splitsko-Dalmatinska'            ,	     'Komiza',	'SD',	'KO');
INSERT INTO @tbl VALUES ('Dubrovacko-Neretvanska'            ,	     'Konavle',	'DN',	'KV');
INSERT INTO @tbl VALUES ('Bjelovarska-Bilogorska'            ,	     'Koncanica',	'BB',	'KO');
INSERT INTO @tbl VALUES ('Krapinsko-Zagorska'            ,	     'Konjscina',	'KZ',	'KO');
INSERT INTO @tbl VALUES ('Koprivnicko-Krizevacka'            ,	     'Koprivnica',	'KK',	'KO');
INSERT INTO @tbl VALUES ('Koprivnicko-Krizevacka'            ,	     'Koprivnicki Bregi',	'KK',	'KB');
INSERT INTO @tbl VALUES ('Koprivnicko-Krizevacka'            ,	     'Koprivnicki Ivanec',	'KK',	'KI');
INSERT INTO @tbl VALUES ('Dubrovacko-Neretvanska'            ,	     'Korcula',	'DN',	'KC');
INSERT INTO @tbl VALUES ('Osjecko-Baranjska'            ,	     'Koska',	'OB',	'KO');
INSERT INTO @tbl VALUES ('Primorsko-Goranska'            ,	     'Kostrena',	'PG',	'KO');
INSERT INTO @tbl VALUES ('Medimurska'            ,	     'Kotoriba',	'ME',	'KO');
INSERT INTO @tbl VALUES ('Krapinsko-Zagorska'            ,	     'Kraljevec na Sutli',	'KZ',	'KN');
INSERT INTO @tbl VALUES ('Primorsko-Goranska'            ,	     'Kraljevica',	'PG',	'KJ');
INSERT INTO @tbl VALUES ('Krapinsko-Zagorska'            ,	     'Krapina',	'KZ',	'KR');
INSERT INTO @tbl VALUES ('Krapinsko-Zagorska'            ,	     'Krapinske Toplice',	'KZ',	'KT');
INSERT INTO @tbl VALUES ('Zagrebacka'            ,	     'Krasic',	'ZG',	'KR');
INSERT INTO @tbl VALUES ('Zagrebacka'            ,	     'Kravarsko',	'ZG',	'KV');
INSERT INTO @tbl VALUES ('Zagrebacka'            ,	     'Kriz',	'ZG',	'KZ');
INSERT INTO @tbl VALUES ('Koprivnicko-Krizevacka'            ,	     'Krizevci',	'KK',	'KR');
INSERT INTO @tbl VALUES ('Primorsko-Goranska'            ,	     'Krk',	'PG',	'KK');
INSERT INTO @tbl VALUES ('Karlovacka'            ,	     'Krnjak',	'KA',	'KR');
INSERT INTO @tbl VALUES ('Istarska'            ,	     'Krsan',	'IS',	'KR');
INSERT INTO @tbl VALUES ('Zadarska'            ,	     'Kukljica',	'ZD',	'KU');
INSERT INTO @tbl VALUES ('Dubrovacko-Neretvanska'            ,	     'Kula Norinska',	'DN',	'KN');
INSERT INTO @tbl VALUES ('Krapinsko-Zagorska'            ,	     'Kumrovec',	'KZ',	'KU');
INSERT INTO @tbl VALUES ('Sisacko-Moslavacka'            ,	     'Kutina',	'SM',	'KU');
INSERT INTO @tbl VALUES ('Pozesko-Slavonska'            ,	     'Kutjevo',	'PS',	'KU');
INSERT INTO @tbl VALUES ('Istarska'            ,	     'Labin',	'IS',	'LB');
INSERT INTO @tbl VALUES ('Istarska'            ,	     'Lanisce',	'IS',	'LS');
INSERT INTO @tbl VALUES ('Karlovacka'            ,	     'Lasinja',	'KA',	'LA');
INSERT INTO @tbl VALUES ('Dubrovacko-Neretvanska'            ,	     'Lastovo',	'DN',	'LA');
INSERT INTO @tbl VALUES ('Splitsko-Dalmatinska'            ,	     'Lecevica',	'SD',	'LE');
INSERT INTO @tbl VALUES ('Koprivnicko-Krizevacka'            ,	     'Legrad',	'KK',	'LE');
INSERT INTO @tbl VALUES ('Sisacko-Moslavacka'            ,	     'Lekenik',	'SM',	'LE');
INSERT INTO @tbl VALUES ('Varazdinska'            ,	     'Lepoglava',	'VA',	'LE');
INSERT INTO @tbl VALUES ('Osjecko-Baranjska'            ,	     'Levanjska Varos',	'OB',	'LV');
INSERT INTO @tbl VALUES ('Pozesko-Slavonska'            ,	     'Lipik',	'PS',	'LI');
INSERT INTO @tbl VALUES ('Sisacko-Moslavacka'            ,	     'Lipovljani',	'SM',	'LI');
INSERT INTO @tbl VALUES ('Zadarska'            ,	     'Lisane Ostrovicke',	'ZD',	'LO');
INSERT INTO @tbl VALUES ('Istarska'            ,	     'Liznjan',	'IS',	'LN');
INSERT INTO @tbl VALUES ('Varazdinska'            ,	     'Ljubescica',	'VA',	'LJ');
INSERT INTO @tbl VALUES ('Krapinsko-Zagorska'            ,	     'Lobor',	'KZ',	'LO');
INSERT INTO @tbl VALUES ('Primorsko-Goranska'            ,	     'Lokve',	'PG',	'LK');
INSERT INTO @tbl VALUES ('Splitsko-Dalmatinska'            ,	     'Lokvicici',	'SD',	'LK');
INSERT INTO @tbl VALUES ('Primorsko-Goranska'            ,	     'Lopar',	'PG',	'LP');
INSERT INTO @tbl VALUES ('Vukovarsko-Srijemska'            ,	     'Lovas',	'VS',	'LO');
INSERT INTO @tbl VALUES ('Licko-Senjska'            ,	     'Lovinac',	'LS',	'LO');
INSERT INTO @tbl VALUES ('Primorsko-Goranska'            ,	     'Lovran',	'PG',	'LV');
INSERT INTO @tbl VALUES ('Splitsko-Dalmatinska'            ,	     'Lovrec',	'SD',	'LR');
INSERT INTO @tbl VALUES ('Varazdinska'            ,	     'Ludbreg',	'VA',	'LU');
INSERT INTO @tbl VALUES ('Zagrebacka'            ,	     'Luka',	'ZG',	'LU');
INSERT INTO @tbl VALUES ('Viroviticko-Podravska'            ,	     'Lukac',	'VP',	'LU');
INSERT INTO @tbl VALUES ('Dubrovacko-Neretvanska'            ,	     'Lumbarda',	'DN',	'LU');
INSERT INTO @tbl VALUES ('Istarska'            ,	     'Lupoglav',	'IS',	'LU');
INSERT INTO @tbl VALUES ('Krapinsko-Zagorska'            ,	     'Mace',	'KZ',	'MA');
INSERT INTO @tbl VALUES ('Osjecko-Baranjska'            ,	     'Magadenovac',	'OB',	'MG');
INSERT INTO @tbl VALUES ('Sisacko-Moslavacka'            ,	     'Majur',	'SM',	'MA');
INSERT INTO @tbl VALUES ('Splitsko-Dalmatinska'            ,	     'Makarska',	'SD',	'MK');
INSERT INTO @tbl VALUES ('Medimurska'            ,	     'Mala Subotica',	'ME',	'ML');
INSERT INTO @tbl VALUES ('Varazdinska'            ,	     'Mali Bukovec',	'VA',	'MB');
INSERT INTO @tbl VALUES ('Primorsko-Goranska'            ,	     'Mali Losinj',	'PG',	'ML');
INSERT INTO @tbl VALUES ('Primorsko-Goranska'            ,	     'Malinska-Dubasnica',	'PG',	'MD');
INSERT INTO @tbl VALUES ('Istarska'            ,	     'Marcana',	'IS',	'MA');
INSERT INTO @tbl VALUES ('Krapinsko-Zagorska'            ,	     'Marija Bistrica',	'KZ',	'MB');
INSERT INTO @tbl VALUES ('Zagrebacka'            ,	     'Marija Gorica',	'ZG',	'MG');
INSERT INTO @tbl VALUES ('Osjecko-Baranjska'            ,	     'Marijanci',	'OB',	'MR');
INSERT INTO @tbl VALUES ('Splitsko-Dalmatinska'            ,	     'Marina',	'SD',	'MN');
INSERT INTO @tbl VALUES ('Vukovarsko-Srijemska'            ,	     'Markusica',	'VS',	'MA');
INSERT INTO @tbl VALUES ('Varazdinska'            ,	     'Martijanec',	'VA',	'MT');
INSERT INTO @tbl VALUES ('Sisacko-Moslavacka'            ,	     'Martinska Ves',	'SM',	'MV');
INSERT INTO @tbl VALUES ('Varazdinska'            ,	     'Marusevec',	'VA',	'MS');
INSERT INTO @tbl VALUES ('Primorsko-Goranska'            ,	     'Matulji',	'PG',	'MA');
INSERT INTO @tbl VALUES ('Istarska'            ,	     'Medulin',	'IS',	'ME');
INSERT INTO @tbl VALUES ('Dubrovacko-Neretvanska'            ,	     'Metkovic',	'DN',	'ME');
INSERT INTO @tbl VALUES ('Krapinsko-Zagorska'            ,	     'Mihovljan',	'KZ',	'MI');
INSERT INTO @tbl VALUES ('Viroviticko-Podravska'            ,	     'Mikleus',	'VP',	'MI');
INSERT INTO @tbl VALUES ('Splitsko-Dalmatinska'            ,	     'Milna',	'SD',	'MI');
INSERT INTO @tbl VALUES ('Dubrovacko-Neretvanska'            ,	     'Mljet',	'DN',	'ML');
INSERT INTO @tbl VALUES ('Koprivnicko-Krizevacka'            ,	     'Molve',	'KK',	'MO');
INSERT INTO @tbl VALUES ('Primorsko-Goranska'            ,	     'Moscenicka Draga',	'PG',	'MO');
INSERT INTO @tbl VALUES ('Istarska'            ,	     'Motovun',	'IS',	'MM');
INSERT INTO @tbl VALUES ('Primorsko-Goranska'            ,	     'Mrkopalj',	'PG',	'MR');
INSERT INTO @tbl VALUES ('Splitsko-Dalmatinska'            ,	     'Muc',	'SD',	'MU');
INSERT INTO @tbl VALUES ('Medimurska'            ,	     'Mursko Sredisce',	'ME',	'MS');
INSERT INTO @tbl VALUES ('Sibensko-Kninska'            ,	     'Murter-Kornati',	'SB',	'MK');
INSERT INTO @tbl VALUES ('Osjecko-Baranjska'            ,	     'Nasice',	'OB',	'NA');
INSERT INTO @tbl VALUES ('Medimurska'            ,	     'Nedelisce',	'ME',	'NE');
INSERT INTO @tbl VALUES ('Vukovarsko-Srijemska'            ,	     'Negoslavci',	'VS',	'NE');
INSERT INTO @tbl VALUES ('Splitsko-Dalmatinska'            ,	     'Nerezisca',	'SD',	'NE');
INSERT INTO @tbl VALUES ('Karlovacka'            ,	     'Netretic',	'KA',	'NE');
INSERT INTO @tbl VALUES ('Vukovarsko-Srijemska'            ,	     'Nijemci',	'VS',	'NI');
INSERT INTO @tbl VALUES ('Zadarska'            ,	     'Nin',	'ZD',	'NI');
INSERT INTO @tbl VALUES ('Viroviticko-Podravska'            ,	     'Nova Bukovica',	'VP',	'NB');
INSERT INTO @tbl VALUES ('Brodsko-Posavska'            ,	     'Nova Gradiska',	'SP',	'NG');
INSERT INTO @tbl VALUES ('Brodsko-Posavska'            ,	     'Nova Kapela',	'SP',	'NK');
INSERT INTO @tbl VALUES ('Licko-Senjska'            ,	     'Novalja',	'LS',	'NO');
INSERT INTO @tbl VALUES ('Bjelovarska-Bilogorska'            ,	     'Nova Raca',	'BB',	'NR');
INSERT INTO @tbl VALUES ('Krapinsko-Zagorska'            ,	     'Novi Golubovec',	'KZ',	'NG');
INSERT INTO @tbl VALUES ('Zadarska'            ,	     'Novigrad',	'ZD',	'NO');
INSERT INTO @tbl VALUES ('Istarska'            ,	     'Novigrad',	'IS',	'NC');
INSERT INTO @tbl VALUES ('Koprivnicko-Krizevacka'            ,	     'Novigrad Podravski',	'KK',	'NP');
INSERT INTO @tbl VALUES ('Varazdinska'            ,	     'Novi Marof',	'VA',	'NM');
INSERT INTO @tbl VALUES ('Primorsko-Goranska'            ,	     'Novi Vinodolski',	'PG',	'NV');
INSERT INTO @tbl VALUES ('Koprivnicko-Krizevacka'            ,	     'Novo Virje',	'KK',	'NV');
INSERT INTO @tbl VALUES ('Sisacko-Moslavacka'            ,	     'Novska',	'SM',	'NO');
INSERT INTO @tbl VALUES ('Vukovarsko-Srijemska'            ,	     'Nustar',	'VS',	'NU');
INSERT INTO @tbl VALUES ('Zadarska'            ,	     'Obrovac',	'ZD',	'OB');
INSERT INTO @tbl VALUES ('Karlovacka'            ,	     'Ogulin',	'KA',	'OG');
INSERT INTO @tbl VALUES ('Splitsko-Dalmatinska'            ,	     'Okrug',	'SD',	'OK');
INSERT INTO @tbl VALUES ('Brodsko-Posavska'            ,	     'Okucani',	'SP',	'OK');
INSERT INTO @tbl VALUES ('Splitsko-Dalmatinska'            ,	     'Omis',	'SD',	'OM');
INSERT INTO @tbl VALUES ('Primorsko-Goranska'            ,	     'Omisalj',	'PG',	'OM');
INSERT INTO @tbl VALUES ('Primorsko-Goranska'            ,	     'Opatija',	'PG',	'OP');
INSERT INTO @tbl VALUES ('Brodsko-Posavska'            ,	     'Oprisavci',	'SP',	'OP');
INSERT INTO @tbl VALUES ('Istarska'            ,	     'Oprtalj',	'IS',	'OP');
INSERT INTO @tbl VALUES ('Dubrovacko-Neretvanska'            ,	     'Opuzen',	'DN',	'OP');
INSERT INTO @tbl VALUES ('Viroviticko-Podravska'            ,	     'Orahovica',	'VP',	'OR');
INSERT INTO @tbl VALUES ('Dubrovacko-Neretvanska'            ,	     'Orebic',	'DN',	'OR');
INSERT INTO @tbl VALUES ('Medimurska'            ,	     'Orehovica',	'ME',	'OR');
INSERT INTO @tbl VALUES ('Brodsko-Posavska'            ,	     'Oriovac',	'SP',	'OR');
INSERT INTO @tbl VALUES ('Zagrebacka'            ,	     'Orle',	'ZG',	'OR');
INSERT INTO @tbl VALUES ('Krapinsko-Zagorska'            ,	     'Oroslavje',	'KZ',	'OR');
INSERT INTO @tbl VALUES ('Osjecko-Baranjska'            ,	     'Osijek',	'OB',	'OS');
INSERT INTO @tbl VALUES ('Licko-Senjska'            ,	     'Otocac',	'LS',	'OT');
INSERT INTO @tbl VALUES ('Vukovarsko-Srijemska'            ,	     'Otok',	'VS',	'OT');
INSERT INTO @tbl VALUES ('Splitsko-Dalmatinska'            ,	     'Otok',	'SD',	'OT');
INSERT INTO @tbl VALUES ('Karlovacka'            ,	     'Ozalj',	'KA',	'OZ');
INSERT INTO @tbl VALUES ('Zadarska'            ,	     'Pag',	'ZD',	'PG');
INSERT INTO @tbl VALUES ('Zadarska'            ,	     'Pakostane',	'ZD',	'PT');
INSERT INTO @tbl VALUES ('Pozesko-Slavonska'            ,	     'Pakrac',	'PS',	'PA');
INSERT INTO @tbl VALUES ('Zadarska'            ,	     'Pasman',	'ZD',	'PM');
INSERT INTO @tbl VALUES ('Istarska'            ,	     'Pazin',	'IS',	'PA');
INSERT INTO @tbl VALUES ('Licko-Senjska'            ,	     'Perusic',	'LS',	'PE');
INSERT INTO @tbl VALUES ('Koprivnicko-Krizevacka'            ,	     'Peteranec',	'KK',	'PE');
INSERT INTO @tbl VALUES ('Osjecko-Baranjska'            ,	     'Petlovac',	'OB',	'PL');
INSERT INTO @tbl VALUES ('Varazdinska'            ,	     'Petrijanec',	'VA',	'PE');
INSERT INTO @tbl VALUES ('Osjecko-Baranjska'            ,	     'Petrijevci',	'OB',	'PJ');
INSERT INTO @tbl VALUES ('Sisacko-Moslavacka'            ,	     'Petrinja',	'SM',	'PE');
INSERT INTO @tbl VALUES ('Krapinsko-Zagorska'            ,	     'Petrovsko',	'KZ',	'PE');
INSERT INTO @tbl VALUES ('Istarska'            ,	     'Pican',	'IS',	'PI');
INSERT INTO @tbl VALUES ('Sibensko-Kninska'            ,	     'Pirovac',	'SB',	'PV');
INSERT INTO @tbl VALUES ('Zagrebacka'            ,	     'Pisarovina',	'ZG',	'PI');
INSERT INTO @tbl VALUES ('Viroviticko-Podravska'            ,	     'Pitomaca',	'VP',	'PI');
INSERT INTO @tbl VALUES ('Karlovacka'            ,	     'Plaski',	'KA',	'PL');
INSERT INTO @tbl VALUES ('Pozesko-Slavonska'            ,	     'Pleternica',	'PS',	'PL');
INSERT INTO @tbl VALUES ('Licko-Senjska'            ,	     'Plitvicka jezera',	'LS',	'PJ');
INSERT INTO @tbl VALUES ('Dubrovacko-Neretvanska'            ,	     'Ploce',	'DN',	'PL');
INSERT INTO @tbl VALUES ('Splitsko-Dalmatinska'            ,	     'Podbablje',	'SD',	'PB');
INSERT INTO @tbl VALUES ('Brodsko-Posavska'            ,	     'Podcrkavlje',	'SP',	'PO');
INSERT INTO @tbl VALUES ('Splitsko-Dalmatinska'            ,	     'Podgora',	'SD',	'PG');
INSERT INTO @tbl VALUES ('Osjecko-Baranjska'            ,	     'Podgorac',	'OB',	'PG');
INSERT INTO @tbl VALUES ('Osjecko-Baranjska'            ,	     'Podravska Moslavina',	'OB',	'PM');
INSERT INTO @tbl VALUES ('Koprivnicko-Krizevacka'            ,	     'Podravske Sesvete',	'KK',	'PS');
INSERT INTO @tbl VALUES ('Splitsko-Dalmatinska'            ,	     'Podstrana',	'SD',	'PS');
INSERT INTO @tbl VALUES ('Medimurska'            ,	     'Podturen',	'ME',	'PT');
INSERT INTO @tbl VALUES ('Dubrovacko-Neretvanska'            ,	     'Pojezerje',	'DN',	'PO');
INSERT INTO @tbl VALUES ('Zagrebacka'            ,	     'Pokupsko',	'ZG',	'PO');
INSERT INTO @tbl VALUES ('Zadarska'            ,	     'Polaca',	'ZD',	'PA');
INSERT INTO @tbl VALUES ('Zadarska'            ,	     'Policnik',	'ZD',	'PL');
INSERT INTO @tbl VALUES ('Osjecko-Baranjska'            ,	     'Popovac',	'OB',	'PP');
INSERT INTO @tbl VALUES ('Sisacko-Moslavacka'            ,	     'Popovaca',	'SM',	'PO');
INSERT INTO @tbl VALUES ('Istarska'            ,	     'Porec',	'IS',	'PR');
INSERT INTO @tbl VALUES ('Zadarska'            ,	     'Posedarje',	'ZD',	'PD');
INSERT INTO @tbl VALUES ('Splitsko-Dalmatinska'            ,	     'Postira',	'SD',	'PT');
INSERT INTO @tbl VALUES ('Zadarska'            ,	     'Povljana',	'ZD',	'PJ');
INSERT INTO @tbl VALUES ('Pozesko-Slavonska'            ,	     'Pozega',	'PS',	'PO');
INSERT INTO @tbl VALUES ('Krapinsko-Zagorska'            ,	     'Pregrada',	'KZ',	'PR');
INSERT INTO @tbl VALUES ('Zadarska'            ,	     'Preko',	'ZD',	'PR');
INSERT INTO @tbl VALUES ('Medimurska'            ,	     'Prelog',	'ME',	'PL');
INSERT INTO @tbl VALUES ('Zagrebacka'            ,	     'Preseka',	'ZG',	'PR');
INSERT INTO @tbl VALUES ('Splitsko-Dalmatinska'            ,	     'Prgomet',	'SD',	'PM');
INSERT INTO @tbl VALUES ('Medimurska'            ,	     'Pribislavec',	'ME',	'PB');
INSERT INTO @tbl VALUES ('Splitsko-Dalmatinska'            ,	     'Primorski Dolac',	'SD',	'PD');
INSERT INTO @tbl VALUES ('Sibensko-Kninska'            ,	     'Primosten',	'SB',	'PT');
INSERT INTO @tbl VALUES ('Vukovarsko-Srijemska'            ,	     'Privlaka',	'VS',	'PR');
INSERT INTO @tbl VALUES ('Zadarska'            ,	     'Privlaka',	'ZD',	'PV');
INSERT INTO @tbl VALUES ('Splitsko-Dalmatinska'            ,	     'Prolozac',	'SD',	'PR');
INSERT INTO @tbl VALUES ('Sibensko-Kninska'            ,	     'Promina',	'SB',	'PR');
INSERT INTO @tbl VALUES ('Splitsko-Dalmatinska'            ,	     'Pucisca',	'SD',	'PU');
INSERT INTO @tbl VALUES ('Istarska'            ,	     'Pula',	'IS',	'PL');
INSERT INTO @tbl VALUES ('Primorsko-Goranska'            ,	     'Punat',	'PG',	'PU');
INSERT INTO @tbl VALUES ('Osjecko-Baranjska'            ,	     'Punitovci',	'OB',	'PU');
INSERT INTO @tbl VALUES ('Zagrebacka'            ,	     'Pusca',	'ZG',	'PU');
INSERT INTO @tbl VALUES ('Primorsko-Goranska'            ,	     'Rab',	'PG',	'RA');
INSERT INTO @tbl VALUES ('Krapinsko-Zagorska'            ,	     'Radoboj',	'KZ',	'RA');
INSERT INTO @tbl VALUES ('Zagrebacka'            ,	     'Rakovec',	'ZG',	'RA');
INSERT INTO @tbl VALUES ('Karlovacka'            ,	     'Rakovica',	'KA',	'RA');
INSERT INTO @tbl VALUES ('Istarska'            ,	     'Rasa',	'IS',	'RA');
INSERT INTO @tbl VALUES ('Koprivnicko-Krizevacka'            ,	     'Rasinja',	'KK',	'RA');
INSERT INTO @tbl VALUES ('Primorsko-Goranska'            ,	     'Ravna Gora',	'PG',	'RG');
INSERT INTO @tbl VALUES ('Zadarska'            ,	     'Razanac',	'ZD',	'RA');
INSERT INTO @tbl VALUES ('Brodsko-Posavska'            ,	     'Resetari',	'SP',	'RE');
INSERT INTO @tbl VALUES ('Karlovacka'            ,	     'Ribnik',	'KA',	'RI');
INSERT INTO @tbl VALUES ('Primorsko-Goranska'            ,	     'Rijeka',	'PG',	'RI');
INSERT INTO @tbl VALUES ('Sibensko-Kninska'            ,	     'Rogoznica',	'SB',	'RO');
INSERT INTO @tbl VALUES ('Istarska'            ,	     'Rovinj',	'IS',	'RR');
INSERT INTO @tbl VALUES ('Bjelovarska-Bilogorska'            ,	     'Rovisce',	'BB',	'RO');
INSERT INTO @tbl VALUES ('Zagrebacka'            ,	     'Rugvica',	'ZG',	'RU');
INSERT INTO @tbl VALUES ('Splitsko-Dalmatinska'            ,	     'Runovici',	'SD',	'RU');
INSERT INTO @tbl VALUES ('Sibensko-Kninska'            ,	     'Ruzic',	'SB',	'RU');
INSERT INTO @tbl VALUES ('Karlovacka'            ,	     'Saborsko',	'KA',	'SA');
INSERT INTO @tbl VALUES ('Zadarska'            ,	     'Sali',	'ZD',	'SA');
INSERT INTO @tbl VALUES ('Zagrebacka'            ,	     'Samobor',	'ZG',	'SA');
INSERT INTO @tbl VALUES ('Bjelovarska-Bilogorska'            ,	     'Sandrovac',	'BB',	'SA');
INSERT INTO @tbl VALUES ('Osjecko-Baranjska'            ,	     'Satnica Dakovacka',	'OB',	'SD');
INSERT INTO @tbl VALUES ('Splitsko-Dalmatinska'            ,	     'Seget',	'SD',	'SE');
INSERT INTO @tbl VALUES ('Splitsko-Dalmatinska'            ,	     'Selca',	'SD',	'SC');
INSERT INTO @tbl VALUES ('Medimurska'            ,	     'Selnica',	'ME',	'SE');
INSERT INTO @tbl VALUES ('Osjecko-Baranjska'            ,	     'Semeljci',	'OB',	'SE');
INSERT INTO @tbl VALUES ('Licko-Senjska'            ,	     'Senj',	'LS',	'SE');
INSERT INTO @tbl VALUES ('Medimurska'            ,	     'Senkovec',	'ME',	'SK');
INSERT INTO @tbl VALUES ('Splitsko-Dalmatinska'            ,	     'Sestanovac',	'SD',	'SS');
INSERT INTO @tbl VALUES ('Bjelovarska-Bilogorska'            ,	     'Severin',	'BB',	'SE');
INSERT INTO @tbl VALUES ('Sibensko-Kninska'            ,	     'Sibenik',	'SB',	'SI');
INSERT INTO @tbl VALUES ('Brodsko-Posavska'            ,	     'Sibinj',	'SP',	'SN');
INSERT INTO @tbl VALUES ('Brodsko-Posavska'            ,	     'Sikirevci',	'SP',	'SK');
INSERT INTO @tbl VALUES ('Splitsko-Dalmatinska'            ,	     'Sinj',	'SD',	'SJ');
INSERT INTO @tbl VALUES ('Bjelovarska-Bilogorska'            ,	     'Sirac',	'BB',	'SI');
INSERT INTO @tbl VALUES ('Sisacko-Moslavacka'            ,	     'Sisak',	'SM',	'SI');
INSERT INTO @tbl VALUES ('Zadarska'            ,	     'Skabrnja',	'ZD',	'SK');
INSERT INTO @tbl VALUES ('Primorsko-Goranska'            ,	     'Skrad',	'PG',	'SK');
INSERT INTO @tbl VALUES ('Sibensko-Kninska'            ,	     'Skradin',	'SB',	'SK');
INSERT INTO @tbl VALUES ('Viroviticko-Podravska'            ,	     'Slatina',	'VP',	'SL');
INSERT INTO @tbl VALUES ('Brodsko-Posavska'            ,	     'Slavonski Brod',	'SP',	'SB');
INSERT INTO @tbl VALUES ('Brodsko-Posavska'            ,	     'Slavonski Samac',	'SP',	'SS');
INSERT INTO @tbl VALUES ('Dubrovacko-Neretvanska'            ,	     'Slivno',	'DN',	'SL');
INSERT INTO @tbl VALUES ('Karlovacka'            ,	     'Slunj',	'KA',	'SL');
INSERT INTO @tbl VALUES ('Dubrovacko-Neretvanska'            ,	     'Smokvica',	'DN',	'SM');
INSERT INTO @tbl VALUES ('Osjecko-Baranjska'            ,	     'Sodolovci',	'OB',	'SO');
INSERT INTO @tbl VALUES ('Koprivnicko-Krizevacka'            ,	     'Sokolovac',	'KK',	'SO');
INSERT INTO @tbl VALUES ('Splitsko-Dalmatinska'            ,	     'Solin',	'SD',	'SL');
INSERT INTO @tbl VALUES ('Splitsko-Dalmatinska'            ,	     'Solta',	'SD',	'SO');
INSERT INTO @tbl VALUES ('Viroviticko-Podravska'            ,	     'Sopje',	'VP',	'SO');
INSERT INTO @tbl VALUES ('Viroviticko-Podravska'            ,	     'Spisic Bukovica',	'VP',	'SB');
INSERT INTO @tbl VALUES ('Splitsko-Dalmatinska'            ,	     'Split',	'SD',	'SP');
INSERT INTO @tbl VALUES ('Varazdinska'            ,	     'Sracinec',	'VA',	'SR');
INSERT INTO @tbl VALUES ('Zadarska'            ,	     'Stankovci',	'ZD',	'SN');
INSERT INTO @tbl VALUES ('Brodsko-Posavska'            ,	     'Stara Gradiska',	'SP',	'SG');
INSERT INTO @tbl VALUES ('Splitsko-Dalmatinska'            ,	     'Stari Grad',	'SD',	'SG');
INSERT INTO @tbl VALUES ('Zadarska'            ,	     'Starigrad',	'ZD',	'SG');
INSERT INTO @tbl VALUES ('Vukovarsko-Srijemska'            ,	     'Stari Jankovci',	'VS',	'SJ');
INSERT INTO @tbl VALUES ('Vukovarsko-Srijemska'            ,	     'Stari Mikanovci',	'VS',	'SM');
INSERT INTO @tbl VALUES ('Brodsko-Posavska'            ,	     'Staro Petrovo Selo',	'SP',	'SP');
INSERT INTO @tbl VALUES ('Bjelovarska-Bilogorska'            ,	     'Stefanje',	'BB',	'ST');
INSERT INTO @tbl VALUES ('Vukovarsko-Srijemska'            ,	     'Stitar',	'VS',	'ST');
INSERT INTO @tbl VALUES ('Dubrovacko-Neretvanska'            ,	     'Ston',	'DN',	'ST');
INSERT INTO @tbl VALUES ('Medimurska'            ,	     'Strahoninec',	'ME',	'SH');
INSERT INTO @tbl VALUES ('Medimurska'            ,	     'Strigova',	'ME',	'ST');
INSERT INTO @tbl VALUES ('Osjecko-Baranjska'            ,	     'Strizivojna',	'OB',	'ST');
INSERT INTO @tbl VALUES ('Krapinsko-Zagorska'            ,	     'Stubicke Toplice',	'KZ',	'ST');
INSERT INTO @tbl VALUES ('Zagrebacka'            ,	     'Stupnik',	'ZG',	'ST');
INSERT INTO @tbl VALUES ('Splitsko-Dalmatinska'            ,	     'Sucuraj',	'SD',	'SU');
INSERT INTO @tbl VALUES ('Viroviticko-Podravska'            ,	     'Suhopolje',	'VP',	'SU');
INSERT INTO @tbl VALUES ('Zadarska'            ,	     'Sukosan',	'ZD',	'SU');
INSERT INTO @tbl VALUES ('Sisacko-Moslavacka'            ,	     'Sunja',	'SM',	'SU');
INSERT INTO @tbl VALUES ('Splitsko-Dalmatinska'            ,	     'Supetar',	'SD',	'ST');
INSERT INTO @tbl VALUES ('Splitsko-Dalmatinska'            ,	     'Sutivan',	'SD',	'SV');
INSERT INTO @tbl VALUES ('Medimurska'            ,	     'Sveta Marija',	'ME',	'SA');
INSERT INTO @tbl VALUES ('Zagrebacka'            ,	     'Sveta Nedelja',	'ZG',	'SN');
INSERT INTO @tbl VALUES ('Istarska'            ,	     'Sveta Nedelja',	'IS',	'SN');
INSERT INTO @tbl VALUES ('Varazdinska'            ,	     'Sveti Durd',	'VA',	'SD');
INSERT INTO @tbl VALUES ('Zadarska'            ,	     'Sveti Filip i Jakov',	'ZD',	'SF');
INSERT INTO @tbl VALUES ('Varazdinska'            ,	     'Sveti Ilija',	'VA',	'SI');
INSERT INTO @tbl VALUES ('Koprivnicko-Krizevacka'            ,	     'Sveti Ivan Zabno',	'KK',	'SI');
INSERT INTO @tbl VALUES ('Zagrebacka'            ,	     'Sveti Ivan Zelina',	'ZG',	'SI');
INSERT INTO @tbl VALUES ('Medimurska'            ,	     'Sveti Juraj na Bregu',	'ME',	'SJ');
INSERT INTO @tbl VALUES ('Krapinsko-Zagorska'            ,	     'Sveti Kriz Zacretje',	'KZ',	'SK');
INSERT INTO @tbl VALUES ('Istarska'            ,	     'Sveti Lovrec',	'IS',	'SL');
INSERT INTO @tbl VALUES ('Medimurska'            ,	     'Sveti Martin na Muri',	'ME',	'SM');
INSERT INTO @tbl VALUES ('Koprivnicko-Krizevacka'            ,	     'Sveti Petar Orehovec',	'KK',	'SP');
INSERT INTO @tbl VALUES ('Istarska'            ,	     'Sveti Petar u Sumi',	'IS',	'SP');
INSERT INTO @tbl VALUES ('Istarska'            ,	     'Svetvincenat',	'IS',	'SV');
INSERT INTO @tbl VALUES ('Istarska'            ,	     'Tar-Vabriga',	'IS',	'TV');
INSERT INTO @tbl VALUES ('Istarska'            ,	     'Tinjan',	'IS',	'TI');
INSERT INTO @tbl VALUES ('Sibensko-Kninska'            ,	     'Tisno',	'SB',	'TI');
INSERT INTO @tbl VALUES ('Zadarska'            ,	     'Tkon',	'ZD',	'TK');
INSERT INTO @tbl VALUES ('Vukovarsko-Srijemska'            ,	     'Tompojevci',	'VS',	'TM');
INSERT INTO @tbl VALUES ('Sisacko-Moslavacka'            ,	     'Topusko',	'SM',	'TO');
INSERT INTO @tbl VALUES ('Vukovarsko-Srijemska'            ,	     'Tordinci',	'VS',	'TD');
INSERT INTO @tbl VALUES ('Karlovacka'            ,	     'Tounj',	'KA',	'TO');
INSERT INTO @tbl VALUES ('Vukovarsko-Srijemska'            ,	     'Tovarnik',	'VS',	'TK');
INSERT INTO @tbl VALUES ('Sibensko-Kninska'            ,	     'Tribunj',	'SB',	'TR');
INSERT INTO @tbl VALUES ('Splitsko-Dalmatinska'            ,	     'Trilj',	'SD',	'TL');
INSERT INTO @tbl VALUES ('Osjecko-Baranjska'            ,	     'Trnava',	'OB',	'TR');
INSERT INTO @tbl VALUES ('Varazdinska'            ,	     'Trnovec Bartolovecki',	'VA',	'TB');
INSERT INTO @tbl VALUES ('Splitsko-Dalmatinska'            ,	     'Trogir',	'SD',	'TG');
INSERT INTO @tbl VALUES ('Dubrovacko-Neretvanska'            ,	     'Trpanj',	'DN',	'TR');
INSERT INTO @tbl VALUES ('Vukovarsko-Srijemska'            ,	     'Trpinja',	'VS',	'TR');
INSERT INTO @tbl VALUES ('Splitsko-Dalmatinska'            ,	     'Tucepi',	'SD',	'TU');
INSERT INTO @tbl VALUES ('Krapinsko-Zagorska'            ,	     'Tuhelj',	'KZ',	'TU');
INSERT INTO @tbl VALUES ('Licko-Senjska'            ,	     'Udbina',	'LS',	'UD');
INSERT INTO @tbl VALUES ('Istarska'            ,	     'Umag',	'IS',	'UU');
INSERT INTO @tbl VALUES ('Sibensko-Kninska'            ,	     'Unesic',	'SB',	'UN');
INSERT INTO @tbl VALUES ('Osjecko-Baranjska'            ,	     'Valpovo',	'OB',	'VP');
INSERT INTO @tbl VALUES ('Varazdinska'            ,	     'Varazdin',	'VA',	'VA');
INSERT INTO @tbl VALUES ('Varazdinska'            ,	     'Varazdinske Toplice',	'VA',	'VT');
INSERT INTO @tbl VALUES ('Dubrovacko-Neretvanska'            ,	     'Vela Luka',	'DN',	'VL');
INSERT INTO @tbl VALUES ('Pozesko-Slavonska'            ,	     'Velika',	'PS',	'VE');
INSERT INTO @tbl VALUES ('Zagrebacka'            ,	     'Velika Gorica',	'ZG',	'VG');
INSERT INTO @tbl VALUES ('Brodsko-Posavska'            ,	     'Velika Kopanica',	'SP',	'VK');
INSERT INTO @tbl VALUES ('Sisacko-Moslavacka'            ,	     'Velika Ludina',	'SM',	'VL');
INSERT INTO @tbl VALUES ('Bjelovarska-Bilogorska'            ,	     'Velika Pisanica',	'BB',	'VP');
INSERT INTO @tbl VALUES ('Bjelovarska-Bilogorska'            ,	     'Velika Trnovitica',	'BB',	'VT');
INSERT INTO @tbl VALUES ('Varazdinska'            ,	     'Veliki Bukovec',	'VA',	'VB');
INSERT INTO @tbl VALUES ('Bjelovarska-Bilogorska'            ,	     'Veliki Grdevac',	'BB',	'VG');
INSERT INTO @tbl VALUES ('Krapinsko-Zagorska'            ,	     'Veliko Trgovisce',	'KZ',	'VT');
INSERT INTO @tbl VALUES ('Bjelovarska-Bilogorska'            ,	     'Veliko Trojstvo',	'BB',	'VO');
INSERT INTO @tbl VALUES ('Varazdinska'            ,	     'Vidovec',	'VA',	'VD');
INSERT INTO @tbl VALUES ('Osjecko-Baranjska'            ,	     'Viljevo',	'OB',	'VJ');
INSERT INTO @tbl VALUES ('Varazdinska'            ,	     'Vinica',	'VA',	'VN');
INSERT INTO @tbl VALUES ('Vukovarsko-Srijemska'            ,	     'Vinkovci',	'VS',	'VI');
INSERT INTO @tbl VALUES ('Primorsko-Goranska'            ,	     'Vinodolska opcina',	'PG',	'VO');
INSERT INTO @tbl VALUES ('Zadarska'            ,	     'Vir',	'ZD',	'VI');
INSERT INTO @tbl VALUES ('Koprivnicko-Krizevacka'            ,	     'Virje',	'KK',	'VI');
INSERT INTO @tbl VALUES ('Viroviticko-Podravska'            ,	     'Virovitica',	'VP',	'VI');
INSERT INTO @tbl VALUES ('Splitsko-Dalmatinska'            ,	     'Vis',	'SD',	'VI');
INSERT INTO @tbl VALUES ('Osjecko-Baranjska'            ,	     'Viskovci',	'OB',	'VK');
INSERT INTO @tbl VALUES ('Primorsko-Goranska'            ,	     'Viskovo',	'PG',	'VI');
INSERT INTO @tbl VALUES ('Istarska'            ,	     'Visnjan',	'IS',	'VN');
INSERT INTO @tbl VALUES ('Varazdinska'            ,	     'Visoko',	'VA',	'VS');
INSERT INTO @tbl VALUES ('Istarska'            ,	     'Vizinada',	'IS',	'VI');
INSERT INTO @tbl VALUES ('Osjecko-Baranjska'            ,	     'Vladislavci',	'OB',	'VL');
INSERT INTO @tbl VALUES ('Viroviticko-Podravska'            ,	     'Vocin',	'VP',	'VO');
INSERT INTO @tbl VALUES ('Sibensko-Kninska'            ,	     'Vodice',	'SB',	'VO');
INSERT INTO @tbl VALUES ('Vukovarsko-Srijemska'            ,	     'Vodinci',	'VS',	'VO');
INSERT INTO @tbl VALUES ('Istarska'            ,	     'Vodnjan',	'IS',	'VD');
INSERT INTO @tbl VALUES ('Karlovacka'            ,	     'Vojnic',	'KA',	'VO');
INSERT INTO @tbl VALUES ('Medimurska'            ,	     'Vratisinec',	'ME',	'VR');
INSERT INTO @tbl VALUES ('Vukovarsko-Srijemska'            ,	     'Vrbanja',	'VS',	'VR');
INSERT INTO @tbl VALUES ('Brodsko-Posavska'            ,	     'Vrbje',	'SP',	'VB');
INSERT INTO @tbl VALUES ('Primorsko-Goranska'            ,	     'Vrbnik',	'PG',	'VN');
INSERT INTO @tbl VALUES ('Zagrebacka'            ,	     'Vrbovec',	'ZG',	'VR');
INSERT INTO @tbl VALUES ('Primorsko-Goranska'            ,	     'Vrbovsko',	'PG',	'VV');
INSERT INTO @tbl VALUES ('Splitsko-Dalmatinska'            ,	     'Vrgorac',	'SD',	'VG');
INSERT INTO @tbl VALUES ('Licko-Senjska'            ,	     'Vrhovine',	'LS',	'VR');
INSERT INTO @tbl VALUES ('Splitsko-Dalmatinska'            ,	     'Vrlika',	'SD',	'VL');
INSERT INTO @tbl VALUES ('Brodsko-Posavska'            ,	     'Vrpolje',	'SP',	'VP');
INSERT INTO @tbl VALUES ('Istarska'            ,	     'Vrsar',	'IS',	'VO');
INSERT INTO @tbl VALUES ('Zadarska'            ,	     'Vrsi',	'ZD',	'VR');
INSERT INTO @tbl VALUES ('Osjecko-Baranjska'            ,	     'Vuka',	'OB',	'VU');
INSERT INTO @tbl VALUES ('Vukovarsko-Srijemska'            ,	     'Vukovar',	'VS',	'VU');
INSERT INTO @tbl VALUES ('Krapinsko-Zagorska'            ,	     'Zabok',	'KZ',	'ZA');
INSERT INTO @tbl VALUES ('Zadarska'            ,	     'Zadar',	'ZD',	'ZA');
INSERT INTO @tbl VALUES ('Splitsko-Dalmatinska'            ,	     'Zadvarje',	'SD',	'ZR');
INSERT INTO @tbl VALUES ('Krapinsko-Zagorska'            ,	     'Zagorska Sela',	'KZ',	'ZS');
INSERT INTO @tbl VALUES ('Grad Zagreb'            ,	     'Zagreb',	'GZ',	'ZA');
INSERT INTO @tbl VALUES ('Splitsko-Dalmatinska'            ,	     'Zagvozd',	'SD',	'ZG');
INSERT INTO @tbl VALUES ('Karlovacka'            ,	     'Zakanje',	'KA',	'ZA');
INSERT INTO @tbl VALUES ('Zagrebacka'            ,	     'Zapresic',	'ZG',	'ZA');
INSERT INTO @tbl VALUES ('Dubrovacko-Neretvanska'            ,	     'Zazablje',	'DN',	'ZA');
INSERT INTO @tbl VALUES ('Viroviticko-Podravska'            ,	     'Zdenci',	'VP',	'ZD');
INSERT INTO @tbl VALUES ('Zadarska'            ,	     'Zemunik Donji',	'ZD',	'ZD');
INSERT INTO @tbl VALUES ('Krapinsko-Zagorska'            ,	     'Zlatar',	'KZ',	'ZL');
INSERT INTO @tbl VALUES ('Krapinsko-Zagorska'            ,	     'Zlatar-Bistrica',	'KZ',	'ZB');
INSERT INTO @tbl VALUES ('Splitsko-Dalmatinska'            ,	     'Zmijavci',	'SD',	'ZM');
INSERT INTO @tbl VALUES ('Istarska'            ,	     'Zminj',	'IS',	'ZM');
INSERT INTO @tbl VALUES ('Bjelovarska-Bilogorska'            ,	     'Zrinski Topolovac',	'BB',	'ZT');
INSERT INTO @tbl VALUES ('Zagrebacka'            ,	     'Zumberak',	'ZG',	'ZU');
INSERT INTO @tbl VALUES ('Dubrovacko-Neretvanska'            ,	     'Zupa dubrovacka',	'DN',	'ZD');
INSERT INTO @tbl VALUES ('Vukovarsko-Srijemska'            ,	     'Zupanja',	'VS',	'ZU');

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

