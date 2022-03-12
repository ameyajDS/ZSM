
/* ==================================================================================
    	Source File		:	setup_guinea_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Guinea are set-up
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
WHERE	country_nm	=	'Guinea';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Guinea not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Prefecture',
		level_2_address_component	=	'Subprefecture',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Forecariah'            ,	     'Alassoya',	'FO',	'AL');
INSERT INTO @tbl VALUES ('Kissidougou'            ,	     'Albadariah',	'KS',	'AL');
INSERT INTO @tbl VALUES ('Dabola'            ,	     'Arfamoussaya',	'DB',	'AR');
INSERT INTO @tbl VALUES ('Kouroussa'            ,	     'Babila',	'KO',	'BB');
INSERT INTO @tbl VALUES ('Dubreka'            ,	     'Badi',	'DU',	'BA');
INSERT INTO @tbl VALUES ('Fria'            ,	     'Baguinet',	'FR',	'BT');
INSERT INTO @tbl VALUES ('Mali'            ,	     'Balaki',	'ML',	'BA');
INSERT INTO @tbl VALUES ('Kankan'            ,	     'Balandougou',	'KA',	'BA');
INSERT INTO @tbl VALUES ('Mandiana'            ,	     'Balandougouba',	'MD',	'BA');
INSERT INTO @tbl VALUES ('Kouroussa'            ,	     'Balato',	'KO',	'BL');
INSERT INTO @tbl VALUES ('Lelouma'            ,	     'Balaya',	'LE',	'BA');
INSERT INTO @tbl VALUES ('Macenta'            ,	     'Balizia',	'MC',	'BA');
INSERT INTO @tbl VALUES ('Kissidougou'            ,	     'Banama',	'KS',	'BN');
INSERT INTO @tbl VALUES ('Kerouane'            ,	     'Banankoro',	'KE',	'BA');
INSERT INTO @tbl VALUES ('Kouroussa'            ,	     'Banfele',	'KO',	'BN');
INSERT INTO @tbl VALUES ('Kindia'            ,	     'Bangouyah',	'KD',	'BA');
INSERT INTO @tbl VALUES ('Fria'            ,	     'Banguigny',	'FR',	'BY');
INSERT INTO @tbl VALUES ('Faranah'            ,	     'Banian',	'FA',	'BA');
INSERT INTO @tbl VALUES ('Yomou'            ,	     'Banie',	'YO',	'BA');
INSERT INTO @tbl VALUES ('Dabola'            ,	     'Banko',	'DB',	'BA');
INSERT INTO @tbl VALUES ('Siguiri'            ,	     'Bankon',	'SI',	'BA');
INSERT INTO @tbl VALUES ('Dinguiraye'            ,	     'Banora',	'DI',	'BA');
INSERT INTO @tbl VALUES ('Pita'            ,	     'Bantignel',	'PI',	'BA');
INSERT INTO @tbl VALUES ('Kissidougou'            ,	     'Bardou',	'KS',	'BR');
INSERT INTO @tbl VALUES ('Kouroussa'            ,	     'Baro',	'KO',	'BR');
INSERT INTO @tbl VALUES ('Kankan'            ,	     'Bate-Nafadji',	'KA',	'BN');
INSERT INTO @tbl VALUES ('Faranah'            ,	     'Beindou',	'FA',	'BE');
INSERT INTO @tbl VALUES ('Kissidougou'            ,	     'Beindou',	'KS',	'BE');
INSERT INTO @tbl VALUES ('Forecariah'            ,	     'Benty',	'FO',	'BE');
INSERT INTO @tbl VALUES ('Beyla'            ,	     'Beyla-Centre',	'BE',	'BE');
INSERT INTO @tbl VALUES ('Yomou'            ,	     'Bheeta',	'YO',	'BH');
INSERT INTO @tbl VALUES ('Yomou'            ,	     'Bignamou',	'YO',	'BI');
INSERT INTO @tbl VALUES ('Macenta'            ,	     'Binikala',	'MC',	'BI');
INSERT INTO @tbl VALUES ('Boke'            ,	     'Bintimodiya',	'BK',	'BI');
INSERT INTO @tbl VALUES ('Dabola'            ,	     'Bissikrima',	'DB',	'BI');
INSERT INTO @tbl VALUES ('Dalaba'            ,	     'Bodie',	'DL',	'BO');
INSERT INTO @tbl VALUES ('Boffa'            ,	     'Boffa-Centre',	'BF',	'BF');
INSERT INTO @tbl VALUES ('Macenta'            ,	     'Bofossou',	'MC',	'BO');
INSERT INTO @tbl VALUES ('Boke'            ,	     'Boke-Centre',	'BK',	'BK');
INSERT INTO @tbl VALUES ('Gueckedou'            ,	     'Bolodou',	'GU',	'BO');
INSERT INTO @tbl VALUES ('Beyla'            ,	     'Boola',	'BE',	'BO');
INSERT INTO @tbl VALUES ('Lola'            ,	     'Bossou',	'LO',	'BO');
INSERT INTO @tbl VALUES ('Kankan'            ,	     'Boula',	'KA',	'BO');
INSERT INTO @tbl VALUES ('Mamou'            ,	     'Bouliwel',	'MM',	'BO');
INSERT INTO @tbl VALUES ('Nzerekore'            ,	     'Bounouma',	'NZ',	'BO');
INSERT INTO @tbl VALUES ('Telimele'            ,	     'Bourouwal',	'TE',	'BO');
INSERT INTO @tbl VALUES ('Pita'            ,	     'Bourouwal-Tappe',	'PI',	'BT');
INSERT INTO @tbl VALUES ('Yomou'            ,	     'Bowe',	'YO',	'BO');
INSERT INTO @tbl VALUES ('Kouroussa'            ,	     'Cissela',	'KO',	'CI');
INSERT INTO @tbl VALUES ('Boffa'            ,	     'Colia',	'BF',	'CO');
INSERT INTO @tbl VALUES ('Coyah'            ,	     'Coyah-Centre',	'CO',	'CO');
INSERT INTO @tbl VALUES ('Boke'            ,	     'Dabiss',	'BK',	'DA');
INSERT INTO @tbl VALUES ('Dabola'            ,	     'Dabola-Centre',	'DB',	'DB');
INSERT INTO @tbl VALUES ('Dalaba'            ,	     'Dalaba-Centre',	'DL',	'DL');
INSERT INTO @tbl VALUES ('Labe'            ,	     'Dalein',	'LA',	'DL');
INSERT INTO @tbl VALUES ('Kindia'            ,	     'Damankanyah',	'KD',	'DA');
INSERT INTO @tbl VALUES ('Kerouane'            ,	     'Damaro',	'KE',	'DA');
INSERT INTO @tbl VALUES ('Labe'            ,	     'Daralabe',	'LA',	'DB');
INSERT INTO @tbl VALUES ('Telimele'            ,	     'Daramagnaky',	'TE',	'DA');
INSERT INTO @tbl VALUES ('Macenta'            ,	     'Daro',	'MC',	'DA');
INSERT INTO @tbl VALUES ('Dinguiraye'            ,	     'Dialakoro',	'DI',	'DL');
INSERT INTO @tbl VALUES ('Mandiana'            ,	     'Dialakoro',	'MD',	'DI');
INSERT INTO @tbl VALUES ('Beyla'            ,	     'Diaraguerela',	'BE',	'DR');
INSERT INTO @tbl VALUES ('Labe'            ,	     'Diari',	'LA',	'DR');
INSERT INTO @tbl VALUES ('Beyla'            ,	     'Diassodou',	'BE',	'DS');
INSERT INTO @tbl VALUES ('Dinguiraye'            ,	     'Diatifere',	'DI',	'DT');
INSERT INTO @tbl VALUES ('Yomou'            ,	     'Diecke',	'YO',	'DI');
INSERT INTO @tbl VALUES ('Dinguiraye'            ,	     'Dinguiraye-Centre',	'DI',	'DI');
INSERT INTO @tbl VALUES ('Labe'            ,	     'Dionfo',	'LA',	'DF');
INSERT INTO @tbl VALUES ('Lelouma'            ,	     'Diountou',	'LE',	'DJ');
INSERT INTO @tbl VALUES ('Dalaba'            ,	     'Ditinn',	'DL',	'DI');
INSERT INTO @tbl VALUES ('Conakry'            ,	     'Dixinn',	'CK',	'DI');
INSERT INTO @tbl VALUES ('Dabola'            ,	     'Dogomet',	'DB',	'DO');
INSERT INTO @tbl VALUES ('Siguiri'            ,	     'Doko',	'SI',	'DO');
INSERT INTO @tbl VALUES ('Mali'            ,	     'Donghol-Sigon',	'ML',	'DS');
INSERT INTO @tbl VALUES ('Pita'            ,	     'Dongol-Touma',	'PI',	'DT');
INSERT INTO @tbl VALUES ('Kouroussa'            ,	     'Douako',	'KO',	'DK');
INSERT INTO @tbl VALUES ('Mali'            ,	     'Dougountouny',	'ML',	'DO');
INSERT INTO @tbl VALUES ('Mamou'            ,	     'Dounet',	'MM',	'DO');
INSERT INTO @tbl VALUES ('Boffa'            ,	     'Douprou',	'BF',	'DO');
INSERT INTO @tbl VALUES ('Kouroussa'            ,	     'Doura',	'KO',	'DR');
INSERT INTO @tbl VALUES ('Dubreka'            ,	     'Dubreka-Centre',	'DU',	'DU');
INSERT INTO @tbl VALUES ('Koubia'            ,	     'Fafaya',	'KB',	'FA');
INSERT INTO @tbl VALUES ('Dubreka'            ,	     'Falessade',	'DU',	'FA');
INSERT INTO @tbl VALUES ('Gueckedou'            ,	     'Fangamadou',	'GU',	'FA');
INSERT INTO @tbl VALUES ('Mandiana'            ,	     'Faralako',	'MD',	'FA');
INSERT INTO @tbl VALUES ('Faranah'            ,	     'Faranah-Centre',	'FA',	'FA');
INSERT INTO @tbl VALUES ('Forecariah'            ,	     'Farmoriah',	'FO',	'FA');
INSERT INTO @tbl VALUES ('Macenta'            ,	     'Fassankoni',	'MC',	'FA');
INSERT INTO @tbl VALUES ('Tougue'            ,	     'Fatako',	'TO',	'FA');
INSERT INTO @tbl VALUES ('Tougue'            ,	     'Fello-Koundoua',	'TO',	'FK');
INSERT INTO @tbl VALUES ('Kissidougou'            ,	     'Fermessadou-Pombo',	'KS',	'FP');
INSERT INTO @tbl VALUES ('Kissidougou'            ,	     'Firawa',	'KS',	'FI');
INSERT INTO @tbl VALUES ('Forecariah'            ,	     'Forecariah-Centre',	'FO',	'FO');
INSERT INTO @tbl VALUES ('Beyla'            ,	     'Fouala',	'BE',	'FO');
INSERT INTO @tbl VALUES ('Mali'            ,	     'Fougou',	'ML',	'FO');
INSERT INTO @tbl VALUES ('Gaoual'            ,	     'Foulamory',	'GA',	'FO');
INSERT INTO @tbl VALUES ('Lola'            ,	     'Foumbadou',	'LO',	'FO');
INSERT INTO @tbl VALUES ('Siguiri'            ,	     'Franwalia',	'SI',	'FR');
INSERT INTO @tbl VALUES ('Fria'            ,	     'Fria-Centre',	'FR',	'FR');
INSERT INTO @tbl VALUES ('Kindia'            ,	     'Friguiagbe',	'KD',	'FR');
INSERT INTO @tbl VALUES ('Koubia'            ,	     'Gadha-Woundou',	'KB',	'GW');
INSERT INTO @tbl VALUES ('Dinguiraye'            ,	     'Gagnakaly',	'DI',	'GA');
INSERT INTO @tbl VALUES ('Lola'            ,	     'Gama-Berema',	'LO',	'GB');
INSERT INTO @tbl VALUES ('Gaoual'            ,	     'Gaoual-Centre',	'GA',	'GA');
INSERT INTO @tbl VALUES ('Labe'            ,	     'Garambe',	'LA',	'GA');
INSERT INTO @tbl VALUES ('Mali'            ,	     'Gayah',	'ML',	'GA');
INSERT INTO @tbl VALUES ('Beyla'            ,	     'Gbakedou',	'BE',	'GK');
INSERT INTO @tbl VALUES ('Kissidougou'            ,	     'Gbangbadou',	'KS',	'GB');
INSERT INTO @tbl VALUES ('Beyla'            ,	     'Gbessoba',	'BE',	'GS');
INSERT INTO @tbl VALUES ('Kankan'            ,	     'Gberedou-Baranama',	'KA',	'GB');
INSERT INTO @tbl VALUES ('Faranah'            ,	     'Gnaleah',	'FA',	'GN');
INSERT INTO @tbl VALUES ('Pita'            ,	     'Gongore',	'PI',	'GO');
INSERT INTO @tbl VALUES ('Mamou'            ,	     'Gongoret',	'MM',	'GO');
INSERT INTO @tbl VALUES ('Nzerekore'            ,	     'Gouecke',	'NZ',	'GO');
INSERT INTO @tbl VALUES ('Telimele'            ,	     'Gougoudje',	'TE',	'GO');
INSERT INTO @tbl VALUES ('Gueckedou'            ,	     'Guendembou',	'GU',	'GD');
INSERT INTO @tbl VALUES ('Lola'            ,	     'Gueassou',	'LO',	'GU');
INSERT INTO @tbl VALUES ('Gueckedou'            ,	     'Gueckedou-Centre',	'GU',	'GU');
INSERT INTO @tbl VALUES ('Koundara'            ,	     'Guingan',	'KN',	'GU');
INSERT INTO @tbl VALUES ('Labe'            ,	     'Hafia',	'LA',	'HA');
INSERT INTO @tbl VALUES ('Faranah'            ,	     'Heremakonon',	'FA',	'HE');
INSERT INTO @tbl VALUES ('Lelouma'            ,	     'Herico',	'LE',	'HE');
INSERT INTO @tbl VALUES ('Mali'            ,	     'Hidayatou',	'ML',	'HI');
INSERT INTO @tbl VALUES ('Dalaba'            ,	     'Kaala',	'DL',	'KL');
INSERT INTO @tbl VALUES ('Labe'            ,	     'Kaalan',	'LA',	'KA');
INSERT INTO @tbl VALUES ('Forecariah'            ,	     'Kaback',	'FO',	'KB');
INSERT INTO @tbl VALUES ('Gaoual'            ,	     'Kakony',	'GA',	'KA');
INSERT INTO @tbl VALUES ('Forecariah'            ,	     'Kakossa',	'FO',	'KK');
INSERT INTO @tbl VALUES ('Dinguiraye'            ,	     'Kalinko',	'DI',	'KA');
INSERT INTO @tbl VALUES ('Forecariah'            ,	     'Kallia',	'FO',	'KL');
INSERT INTO @tbl VALUES ('Conakry'            ,	     'Kaloum',	'CK',	'KA');
INSERT INTO @tbl VALUES ('Koundara'            ,	     'Kamaby',	'KN',	'KA');
INSERT INTO @tbl VALUES ('Boke'            ,	     'Kamsar',	'BK',	'KM');
INSERT INTO @tbl VALUES ('Kankan'            ,	     'Kanfamoriyah',	'KA',	'KM');
INSERT INTO @tbl VALUES ('Boke'            ,	     'Kanfarande',	'BK',	'KF');
INSERT INTO @tbl VALUES ('Dalaba'            ,	     'Kankalabe',	'DL',	'KN');
INSERT INTO @tbl VALUES ('Dabola'            ,	     'Kankama',	'DB',	'KA');
INSERT INTO @tbl VALUES ('Kankan'            ,	     'Kankan-Centre',	'KA',	'KA');
INSERT INTO @tbl VALUES ('Tougue'            ,	     'Kansangui',	'TO',	'KA');
INSERT INTO @tbl VALUES ('Mandiana'            ,	     'Kantoumanina',	'MD',	'KA');
INSERT INTO @tbl VALUES ('Beyla'            ,	     'Karala',	'BE',	'KA');
INSERT INTO @tbl VALUES ('Gueckedou'            ,	     'Kassadou',	'GU',	'KA');
INSERT INTO @tbl VALUES ('Dalaba'            ,	     'Kebali',	'DL',	'KE');
INSERT INTO @tbl VALUES ('Mamou'            ,	     'Kegneko',	'MM',	'KE');
INSERT INTO @tbl VALUES ('Kerouane'            ,	     'Kerouane-Centre',	'KE',	'KE');
INSERT INTO @tbl VALUES ('Dubreka'            ,	     'Khorira',	'DU',	'KH');
INSERT INTO @tbl VALUES ('Kindia'            ,	     'Kindia-Centre',	'KD',	'KI');
INSERT INTO @tbl VALUES ('Dabola'            ,	     'Kindoye',	'DB',	'KI');
INSERT INTO @tbl VALUES ('Siguiri'            ,	     'Kiniebakoura',	'SI',	'KB');
INSERT INTO @tbl VALUES ('Mandiana'            ,	     'Kinieran',	'MD',	'KI');
INSERT INTO @tbl VALUES ('Kouroussa'            ,	     'Kiniero',	'KO',	'KI');
INSERT INTO @tbl VALUES ('Siguiri'            ,	     'Kintinian',	'SI',	'KT');
INSERT INTO @tbl VALUES ('Kissidougou'            ,	     'Kissidougou-Centre',	'KS',	'KS');
INSERT INTO @tbl VALUES ('Telimele'            ,	     'Koba',	'TE',	'KB');
INSERT INTO @tbl VALUES ('Dalaba'            ,	     'Koba',	'DL',	'KO');
INSERT INTO @tbl VALUES ('Boffa'            ,	     'Koba-Tatema',	'BF',	'KT');
INSERT INTO @tbl VALUES ('Nzerekore'            ,	     'Kobela',	'NZ',	'KB');
INSERT INTO @tbl VALUES ('Faranah'            ,	     'Kobikoro',	'FA',	'KO');
INSERT INTO @tbl VALUES ('Tougue'            ,	     'Koin',	'TO',	'KI');
INSERT INTO @tbl VALUES ('Lola'            ,	     'Kokota',	'LO',	'KO');
INSERT INTO @tbl VALUES ('Boke'            ,	     'Kolaboui',	'BK',	'KO');
INSERT INTO @tbl VALUES ('Tougue'            ,	     'Kolangui',	'TO',	'KG');
INSERT INTO @tbl VALUES ('Kindia'            ,	     'Kolente',	'KD',	'KO');
INSERT INTO @tbl VALUES ('Telimele'            ,	     'Kollet',	'TE',	'KL');
INSERT INTO @tbl VALUES ('Tougue'            ,	     'Kollet',	'TO',	'KL');
INSERT INTO @tbl VALUES ('Kerouane'            ,	     'Komodou',	'KE',	'KM');
INSERT INTO @tbl VALUES ('Kouroussa'            ,	     'Komola-Khoura',	'KO',	'KK');
INSERT INTO @tbl VALUES ('Tougue'            ,	     'Konah',	'TO',	'KN');
INSERT INTO @tbl VALUES ('Kissidougou'            ,	     'Kondiadou',	'KS',	'KO');
INSERT INTO @tbl VALUES ('Dabola'            ,	     'Konindou',	'DB',	'KO');
INSERT INTO @tbl VALUES ('Mamou'            ,	     'Konkoure',	'MM',	'KO');
INSERT INTO @tbl VALUES ('Telimele'            ,	     'Konsotami',	'TE',	'KS');
INSERT INTO @tbl VALUES ('Lelouma'            ,	     'Korbe',	'LE',	'KO');
INSERT INTO @tbl VALUES ('Nzerekore'            ,	     'Koropara',	'NZ',	'KR');
INSERT INTO @tbl VALUES ('Macenta'            ,	     'Kouankan',	'MC',	'KK');
INSERT INTO @tbl VALUES ('Koubia'            ,	     'Koubia-Centre',	'KB',	'KB');
INSERT INTO @tbl VALUES ('Nzerekore'            ,	     'Koule',	'NZ',	'KL');
INSERT INTO @tbl VALUES ('Kouroussa'            ,	     'Koumana',	'KO',	'KM');
INSERT INTO @tbl VALUES ('Beyla'            ,	     'Koumandou',	'BE',	'KO');
INSERT INTO @tbl VALUES ('Kankan'            ,	     'Koumban',	'KA',	'KO');
INSERT INTO @tbl VALUES ('Gaoual'            ,	     'Koumbia',	'GA',	'KM');
INSERT INTO @tbl VALUES ('Koundara'            ,	     'Koundara-Centre',	'KN',	'KD');
INSERT INTO @tbl VALUES ('Mandiana'            ,	     'Koundian',	'MD',	'KD');
INSERT INTO @tbl VALUES ('Mandiana'            ,	     'Koundianakoro',	'MD',	'KK');
INSERT INTO @tbl VALUES ('Gueckedou'            ,	     'Koundou',	'GU',	'KO');
INSERT INTO @tbl VALUES ('Kerouane'            ,	     'Kounsankoro',	'KE',	'KS');
INSERT INTO @tbl VALUES ('Gaoual'            ,	     'Kounsitel',	'GA',	'KN');
INSERT INTO @tbl VALUES ('Labe'            ,	     'Kouramangui',	'LA',	'KO');
INSERT INTO @tbl VALUES ('Tougue'            ,	     'Kouratongo',	'TO',	'KR');
INSERT INTO @tbl VALUES ('Coyah'            ,	     'Kouriah',	'CO',	'KO');
INSERT INTO @tbl VALUES ('Kouroussa'            ,	     'Kouroussa-Centre',	'KO',	'KO');
INSERT INTO @tbl VALUES ('Macenta'            ,	     'Koyamah',	'MC',	'KY');
INSERT INTO @tbl VALUES ('Labe'            ,	     'Labe-Centre',	'LA',	'LA');
INSERT INTO @tbl VALUES ('Lelouma'            ,	     'Lafou',	'LE',	'LA');
INSERT INTO @tbl VALUES ('Lola'            ,	     'Laine',	'LO',	'LA');
INSERT INTO @tbl VALUES ('Dinguiraye'            ,	     'Lansanya',	'DI',	'LA');
INSERT INTO @tbl VALUES ('Pita'            ,	     'Ley-Miro',	'PI',	'LM');
INSERT INTO @tbl VALUES ('Mali'            ,	     'Lebekeren',	'ML',	'LE');
INSERT INTO @tbl VALUES ('Lelouma'            ,	     'Lelouma-Centre',	'LE',	'LE');
INSERT INTO @tbl VALUES ('Kerouane'            ,	     'Linko',	'KE',	'LI');
INSERT INTO @tbl VALUES ('Lelouma'            ,	     'Linsan-Saran',	'LE',	'LS');
INSERT INTO @tbl VALUES ('Boffa'            ,	     'Lisso',	'BF',	'LI');
INSERT INTO @tbl VALUES ('Lola'            ,	     'Lola-Centre',	'LO',	'LO');
INSERT INTO @tbl VALUES ('Macenta'            ,	     'Macenta-Centre',	'MC',	'MC');
INSERT INTO @tbl VALUES ('Pita'            ,	     'Maci',	'PI',	'MA');
INSERT INTO @tbl VALUES ('Kindia'            ,	     'Madina-Oula',	'KD',	'MO');
INSERT INTO @tbl VALUES ('Mali'            ,	     'Madina-Wora',	'ML',	'MW');
INSERT INTO @tbl VALUES ('Dalaba'            ,	     'Mafara',	'DL',	'MA');
INSERT INTO @tbl VALUES ('Forecariah'            ,	     'Maferinya',	'FO',	'MA');
INSERT INTO @tbl VALUES ('Gaoual'            ,	     'Malanta',	'GA',	'MA');
INSERT INTO @tbl VALUES ('Boke'            ,	     'Malapouyah',	'BK',	'MA');
INSERT INTO @tbl VALUES ('Siguiri'            ,	     'Maleah',	'SI',	'MA');
INSERT INTO @tbl VALUES ('Mali'            ,	     'Mali-Centre',	'ML',	'ML');
INSERT INTO @tbl VALUES ('Kindia'            ,	     'Mambia',	'KD',	'MA');
INSERT INTO @tbl VALUES ('Mamou'            ,	     'Mamou-Centre',	'MM',	'MM');
INSERT INTO @tbl VALUES ('Kankan'            ,	     'Mamouroudou',	'KA',	'MA');
INSERT INTO @tbl VALUES ('Lelouma'            ,	     'Manda',	'LE',	'MA');
INSERT INTO @tbl VALUES ('Mandiana'            ,	     'Mandiana-Centre',	'MD',	'MD');
INSERT INTO @tbl VALUES ('Coyah'            ,	     'Maneah',	'CO',	'MA');
INSERT INTO @tbl VALUES ('Kissidougou'            ,	     'Manfran',	'KS',	'MA');
INSERT INTO @tbl VALUES ('Boffa'            ,	     'Mankountan',	'BF',	'MA');
INSERT INTO @tbl VALUES ('Faranah'            ,	     'Marela',	'FA',	'MA');
INSERT INTO @tbl VALUES ('Koubia'            ,	     'Matakaou',	'KB',	'MA');
INSERT INTO @tbl VALUES ('Conakry'            ,	     'Matam',	'CK',	'MM');
INSERT INTO @tbl VALUES ('Conakry'            ,	     'Matoto',	'CK',	'MO');
INSERT INTO @tbl VALUES ('Kankan'            ,	     'Missamana',	'KA',	'MI');
INSERT INTO @tbl VALUES ('Telimele'            ,	     'Missira',	'TE',	'MI');
INSERT INTO @tbl VALUES ('Koubia'            ,	     'Missira',	'KB',	'MI');
INSERT INTO @tbl VALUES ('Dalaba'            ,	     'Mitty',	'DL',	'MI');
INSERT INTO @tbl VALUES ('Kindia'            ,	     'Molota',	'KD',	'ML');
INSERT INTO @tbl VALUES ('Dalaba'            ,	     'Mombeyah',	'DL',	'MO');
INSERT INTO @tbl VALUES ('Kankan'            ,	     'Moribayah',	'KA',	'MO');
INSERT INTO @tbl VALUES ('Mandiana'            ,	     'Morodou',	'MD',	'MO');
INSERT INTO @tbl VALUES ('Beyla'            ,	     'Moussadou',	'BE',	'MO');
INSERT INTO @tbl VALUES ('Forecariah'            ,	     'Moussayah',	'FO',	'MO');
INSERT INTO @tbl VALUES ('Dabola'            ,	     'N''Dema',	'DB',	'ND');
INSERT INTO @tbl VALUES ('Macenta'            ,	     'N''Zebela',	'MC',	'NZ');
INSERT INTO @tbl VALUES ('Nzerekore'            ,	     'N''Zerekore-Centre',	'NZ',	'NZ');
INSERT INTO @tbl VALUES ('Lola'            ,	     'N''Zoo',	'LO',	'NZ');
INSERT INTO @tbl VALUES ('Siguiri'            ,	     'Naboun',	'SI',	'NA');
INSERT INTO @tbl VALUES ('Siguiri'            ,	     'Niagassola',	'SI',	'NG');
INSERT INTO @tbl VALUES ('Siguiri'            ,	     'Niandankoro',	'SI',	'ND');
INSERT INTO @tbl VALUES ('Mandiana'            ,	     'Niantanina',	'MD',	'NI');
INSERT INTO @tbl VALUES ('Pita'            ,	     'Ninguelande',	'PI',	'NI');
INSERT INTO @tbl VALUES ('Beyla'            ,	     'Nionsomoridou',	'BE',	'NI');
INSERT INTO @tbl VALUES ('Gueckedou'            ,	     'Nongoa',	'GU',	'NO');
INSERT INTO @tbl VALUES ('Siguiri'            ,	     'Norassoba',	'SI',	'NO');
INSERT INTO @tbl VALUES ('Labe'            ,	     'Noussy',	'LA',	'NO');
INSERT INTO @tbl VALUES ('Mamou'            ,	     'Nyagara',	'MM',	'NY');
INSERT INTO @tbl VALUES ('Dubreka'            ,	     'Ouassou',	'DU',	'OU');
INSERT INTO @tbl VALUES ('Gueckedou'            ,	     'Ouende-Kenema',	'GU',	'OK');
INSERT INTO @tbl VALUES ('Mamou'            ,	     'Oure-Kaba',	'MM',	'OK');
INSERT INTO @tbl VALUES ('Macenta'            ,	     'Ouremai',	'MC',	'OU');
INSERT INTO @tbl VALUES ('Nzerekore'            ,	     'Pale',	'NZ',	'PA');
INSERT INTO @tbl VALUES ('Macenta'            ,	     'Panziazou',	'MC',	'PA');
INSERT INTO @tbl VALUES ('Lelouma'            ,	     'Parawol',	'LE',	'PA');
INSERT INTO @tbl VALUES ('Faranah'            ,	     'Passayah',	'FA',	'PA');
INSERT INTO @tbl VALUES ('Yomou'            ,	     'Pela',	'YO',	'PE');
INSERT INTO @tbl VALUES ('Koubia'            ,	     'Pilimini',	'KB',	'PI');
INSERT INTO @tbl VALUES ('Pita'            ,	     'Pita-Centre',	'PI',	'PI');
INSERT INTO @tbl VALUES ('Labe'            ,	     'Popodara',	'LA',	'PO');
INSERT INTO @tbl VALUES ('Mamou'            ,	     'Poredaka',	'MM',	'PO');
INSERT INTO @tbl VALUES ('Conakry'            ,	     'Ratoma',	'CK',	'RA');
INSERT INTO @tbl VALUES ('Kankan'            ,	     'Sabadou-Baranama',	'KA',	'SB');
INSERT INTO @tbl VALUES ('Lelouma'            ,	     'Sagale',	'LE',	'SA');
INSERT INTO @tbl VALUES ('Mandiana'            ,	     'Saladou',	'MD',	'SL');
INSERT INTO @tbl VALUES ('Mali'            ,	     'Salambande',	'ML',	'SA');
INSERT INTO @tbl VALUES ('Beyla'            ,	     'Samana',	'BE',	'SA');
INSERT INTO @tbl VALUES ('Kindia'            ,	     'Samayah',	'KD',	'SA');
INSERT INTO @tbl VALUES ('Koundara'            ,	     'Sambailo',	'KN',	'SM');
INSERT INTO @tbl VALUES ('Nzerekore'            ,	     'Samoe',	'NZ',	'SA');
INSERT INTO @tbl VALUES ('Faranah'            ,	     'Sandeniah',	'FA',	'SA');
INSERT INTO @tbl VALUES ('Kissidougou'            ,	     'Sangardo',	'KS',	'SA');
INSERT INTO @tbl VALUES ('Pita'            ,	     'Sangareah',	'PI',	'SA');
INSERT INTO @tbl VALUES ('Boke'            ,	     'Sangaredi',	'BK',	'SG');
INSERT INTO @tbl VALUES ('Kouroussa'            ,	     'Sanguiana',	'KO',	'SA');
INSERT INTO @tbl VALUES ('Labe'            ,	     'Sannou',	'LA',	'SA');
INSERT INTO @tbl VALUES ('Boke'            ,	     'Sansale',	'BK',	'SS');
INSERT INTO @tbl VALUES ('Mandiana'            ,	     'Sansando',	'MD',	'SS');
INSERT INTO @tbl VALUES ('Telimele'            ,	     'Santou',	'TE',	'ST');
INSERT INTO @tbl VALUES ('Mamou'            ,	     'Saramoussayah',	'MM',	'SA');
INSERT INTO @tbl VALUES ('Koundara'            ,	     'Sareboido',	'KN',	'SR');
INSERT INTO @tbl VALUES ('Telimele'            ,	     'Sarekaly',	'TE',	'SR');
INSERT INTO @tbl VALUES ('Macenta'            ,	     'Sengbedou',	'MC',	'SB');
INSERT INTO @tbl VALUES ('Dinguiraye'            ,	     'Selouma',	'DI',	'SE');
INSERT INTO @tbl VALUES ('Macenta'            ,	     'Seredou',	'MC',	'SR');
INSERT INTO @tbl VALUES ('Kerouane'            ,	     'Sibiribaro',	'KE',	'SI');
INSERT INTO @tbl VALUES ('Siguiri'            ,	     'Siguiri-Centre',	'SI',	'SI');
INSERT INTO @tbl VALUES ('Siguiri'            ,	     'Siguirini',	'SI',	'SN');
INSERT INTO @tbl VALUES ('Forecariah'            ,	     'Sikhourou',	'FO',	'SI');
INSERT INTO @tbl VALUES ('Beyla'            ,	     'Sinko',	'BE',	'SI');
INSERT INTO @tbl VALUES ('Telimele'            ,	     'Sinta',	'TE',	'SI');
INSERT INTO @tbl VALUES ('Pita'            ,	     'Sintali',	'PI',	'SI');
INSERT INTO @tbl VALUES ('Telimele'            ,	     'Sogolon',	'TE',	'SO');
INSERT INTO @tbl VALUES ('Beyla'            ,	     'Sokourala',	'BE',	'SO');
INSERT INTO @tbl VALUES ('Faranah'            ,	     'Songoyah',	'FA',	'SO');
INSERT INTO @tbl VALUES ('Kerouane'            ,	     'Soromaya',	'KE',	'SO');
INSERT INTO @tbl VALUES ('Kindia'            ,	     'Sougueta',	'KD',	'SO');
INSERT INTO @tbl VALUES ('Nzerekore'            ,	     'Soulouta',	'NZ',	'SO');
INSERT INTO @tbl VALUES ('Mamou'            ,	     'Soyah',	'MM',	'SO');
INSERT INTO @tbl VALUES ('Boffa'            ,	     'Tamita',	'BF',	'TA');
INSERT INTO @tbl VALUES ('Boke'            ,	     'Tanene',	'BK',	'TA');
INSERT INTO @tbl VALUES ('Dubreka'            ,	     'Tanene',	'DU',	'TA');
INSERT INTO @tbl VALUES ('Tougue'            ,	     'Tangali',	'TO',	'TA');
INSERT INTO @tbl VALUES ('Telimele'            ,	     'Tarihoye',	'TE',	'TA');
INSERT INTO @tbl VALUES ('Gueckedou'            ,	     'Termessadou-Dibo',	'GU',	'TD');
INSERT INTO @tbl VALUES ('Koundara'            ,	     'Termesse',	'KN',	'TE');
INSERT INTO @tbl VALUES ('Mamou'            ,	     'Teguereyah',	'MM',	'TE');
INSERT INTO @tbl VALUES ('Gueckedou'            ,	     'Tekoulo',	'GU',	'TE');
INSERT INTO @tbl VALUES ('Telimele'            ,	     'Telimele-Centre',	'TE',	'TE');
INSERT INTO @tbl VALUES ('Mali'            ,	     'Telire',	'ML',	'TE');
INSERT INTO @tbl VALUES ('Telimele'            ,	     'Thionthian',	'TE',	'TH');
INSERT INTO @tbl VALUES ('Pita'            ,	     'Timbi-Madina',	'PI',	'TM');
INSERT INTO @tbl VALUES ('Pita'            ,	     'Timbi-Touni',	'PI',	'TT');
INSERT INTO @tbl VALUES ('Mamou'            ,	     'Timbo',	'MM',	'TI');
INSERT INTO @tbl VALUES ('Kankan'            ,	     'Tinti-Oulen',	'KA',	'TO');
INSERT INTO @tbl VALUES ('Faranah'            ,	     'Tiro',	'FA',	'TI');
INSERT INTO @tbl VALUES ('Kankan'            ,	     'Tokounou',	'KA',	'TK');
INSERT INTO @tbl VALUES ('Mamou'            ,	     'Tolo',	'MM',	'TO');
INSERT INTO @tbl VALUES ('Dubreka'            ,	     'Tondon',	'DU',	'TO');
INSERT INTO @tbl VALUES ('Fria'            ,	     'Tormelin',	'FR',	'TO');
INSERT INTO @tbl VALUES ('Gaoual'            ,	     'Touba',	'GA',	'TO');
INSERT INTO @tbl VALUES ('Mali'            ,	     'Touba',	'ML',	'TO');
INSERT INTO @tbl VALUES ('Boffa'            ,	     'Tougnifili',	'BF',	'TO');
INSERT INTO @tbl VALUES ('Tougue'            ,	     'Tougue-Centre',	'TO',	'TO');
INSERT INTO @tbl VALUES ('Lola'            ,	     'Tounkarata',	'LO',	'TO');
INSERT INTO @tbl VALUES ('Labe'            ,	     'Tountourou',	'LA',	'TO');
INSERT INTO @tbl VALUES ('Lelouma'            ,	     'Tyanguel-Bori',	'LE',	'TB');
INSERT INTO @tbl VALUES ('Macenta'            ,	     'Vasseredou',	'MC',	'VA');
INSERT INTO @tbl VALUES ('Macenta'            ,	     'Watanka',	'MC',	'WA');
INSERT INTO @tbl VALUES ('Gaoual'            ,	     'Wendou M''Bour',	'GA',	'WM');
INSERT INTO @tbl VALUES ('Nzerekore'            ,	     'Womey',	'NZ',	'WO');
INSERT INTO @tbl VALUES ('Coyah'            ,	     'Wonkifong',	'CO',	'WO');
INSERT INTO @tbl VALUES ('Nzerekore'            ,	     'Yalenzou',	'NZ',	'YA');
INSERT INTO @tbl VALUES ('Kissidougou'            ,	     'Yende-Millimou',	'KS',	'YM');
INSERT INTO @tbl VALUES ('Mali'            ,	     'Yimbering',	'ML',	'YI');
INSERT INTO @tbl VALUES ('Kissidougou'            ,	     'Yombiro',	'KS',	'YO');
INSERT INTO @tbl VALUES ('Yomou'            ,	     'Yomou-Centre',	'YO',	'YO');
INSERT INTO @tbl VALUES ('Koundara'            ,	     'Youkounkoun',	'KN',	'YO');

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

