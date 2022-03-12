/* ==================================================================================
    Source File		:	setup_bulgaria_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	Sat Oct 06 17:05 2014
	Module ID		:	CDB
	Last updated	:	Oct 06, 2014
	==================================================================================
																		   Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Bulgaria are set-up
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
WHERE	country_nm	=	'Bulgaria';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Bulgaria not found', 16, 1);
	RETURN;
END

/*	 These statements should NOT be uncommented; and should be used with extreme caution
DELETE	l3
FROM	level_3_address_components	l3
	JOIN	level_2_address_components	l2
		ON	(	l2.level_2_address_component_id	=	l3.level_2_address_component_id
			)
	JOIN	level_1_address_components	l1
		ON	(	l1.level_1_address_component_id	=	l2.level_1_address_component_id
			AND	l1.country_id	=	@country_id
			);

DELETE	l2
FROM	level_2_address_components	l2
	JOIN	level_1_address_components	l1
		ON	(	l1.level_1_address_component_id	=	l2.level_1_address_component_id
			AND	l1.country_id	=	@country_id
			);


DELETE	level_1_address_components
WHERE	country_id	=	@country_id;
*/

-- ======================================================================

DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50) PRIMARY KEY, level_1_cd varchar (5) UNIqUE);

INSERT INTO @tbl VALUES ('Blagoevgrad',	'BL');
INSERT INTO @tbl VALUES ('Burgas',	'BR');
INSERT INTO @tbl VALUES ('Dobrich',	'DO');
INSERT INTO @tbl VALUES ('Gabrovo',	'GB');
INSERT INTO @tbl VALUES ('Grad Sofiya',	'SG');
INSERT INTO @tbl VALUES ('Khaskovo',	'KK');
INSERT INTO @tbl VALUES ('Kurdzhali',	'KZ');
INSERT INTO @tbl VALUES ('Kyustendil',	'KY');
INSERT INTO @tbl VALUES ('Lovech',	'LV');
INSERT INTO @tbl VALUES ('Montana',	'MT');
INSERT INTO @tbl VALUES ('Pazardzhik',	'PZ');
INSERT INTO @tbl VALUES ('Pernik',	'PN');
INSERT INTO @tbl VALUES ('Pleven',	'PV');
INSERT INTO @tbl VALUES ('Plovdiv',	'PD');
INSERT INTO @tbl VALUES ('Razgrad',	'RG');
INSERT INTO @tbl VALUES ('Ruse',	'RS');
INSERT INTO @tbl VALUES ('Shumen',	'SH');
INSERT INTO @tbl VALUES ('Silistra',	'SI');
INSERT INTO @tbl VALUES ('Sliven',	'SL');
INSERT INTO @tbl VALUES ('Smolyan',	'SM');
INSERT INTO @tbl VALUES ('Sofiya',	'SF');
INSERT INTO @tbl VALUES ('Stara Zagora',	'SZ');
INSERT INTO @tbl VALUES ('Turgovishte',	'TU');
INSERT INTO @tbl VALUES ('Varna',	'VN');
INSERT INTO @tbl VALUES ('Veliko Turnovo',	'VT');
INSERT INTO @tbl VALUES ('Vidin',	'VD');
INSERT INTO @tbl VALUES ('Vratsa',	'VR');
INSERT INTO @tbl VALUES ('Yambol',	'YA');


INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) 
	SELECT	@country_id, level_1_nm, level_1_cd
	FROM	@tbl;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl2	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_nm, level_2_cd));


INSERT INTO @tbl2 VALUES ('Blagoevgrad',	'Bansko',	'BA');
INSERT INTO @tbl2 VALUES ('Blagoevgrad',	'Belitsa',	'BE');
INSERT INTO @tbl2 VALUES ('Blagoevgrad',	'Blagoevgrad',	'BL');
INSERT INTO @tbl2 VALUES ('Blagoevgrad',	'Garmen',	'GA');
INSERT INTO @tbl2 VALUES ('Blagoevgrad',	'Gotse Delchev',	'GD');
INSERT INTO @tbl2 VALUES ('Blagoevgrad',	'Hadzhidimovo',	'HA');
INSERT INTO @tbl2 VALUES ('Blagoevgrad',	'Kresna',	'KR');
INSERT INTO @tbl2 VALUES ('Blagoevgrad',	'Petrich',	'PE');
INSERT INTO @tbl2 VALUES ('Blagoevgrad',	'Razlog',	'RA');
INSERT INTO @tbl2 VALUES ('Blagoevgrad',	'Sandanski',	'SN');
INSERT INTO @tbl2 VALUES ('Blagoevgrad',	'Satovcha',	'SV');
INSERT INTO @tbl2 VALUES ('Blagoevgrad',	'Simitli',	'SM');
INSERT INTO @tbl2 VALUES ('Blagoevgrad',	'Strumyani',	'SY');
INSERT INTO @tbl2 VALUES ('Blagoevgrad',	'Yakoruda',	'YA');
INSERT INTO @tbl2 VALUES ('Burgas',	'Aytos',	'AI');
INSERT INTO @tbl2 VALUES ('Burgas',	'Burgas',	'BU');
INSERT INTO @tbl2 VALUES ('Burgas',	'Kameno',	'KM');
INSERT INTO @tbl2 VALUES ('Burgas',	'Karnobat',	'KR');
INSERT INTO @tbl2 VALUES ('Burgas',	'Malko Tarnovo',	'MT');
INSERT INTO @tbl2 VALUES ('Burgas',	'Nesebar',	'NE');
INSERT INTO @tbl2 VALUES ('Burgas',	'Pomorie',	'PO');
INSERT INTO @tbl2 VALUES ('Burgas',	'Primorsko',	'PR');
INSERT INTO @tbl2 VALUES ('Burgas',	'Ruen',	'RU');
INSERT INTO @tbl2 VALUES ('Burgas',	'Sozopol',	'SO');
INSERT INTO @tbl2 VALUES ('Burgas',	'Sredets',	'SR');
INSERT INTO @tbl2 VALUES ('Burgas',	'Sungurlare',	'SU');
INSERT INTO @tbl2 VALUES ('Burgas',	'Tsarevo',	'CA');
INSERT INTO @tbl2 VALUES ('Dobrich',	'Balchik',	'BA');
INSERT INTO @tbl2 VALUES ('Dobrich',	'Dobrich',	'DO');
INSERT INTO @tbl2 VALUES ('Dobrich',	'Dobrich Town',	'DS');
INSERT INTO @tbl2 VALUES ('Dobrich',	'General Toshevo',	'GT');
INSERT INTO @tbl2 VALUES ('Dobrich',	'Kavarna',	'KA');
INSERT INTO @tbl2 VALUES ('Dobrich',	'Krushari',	'KR');
INSERT INTO @tbl2 VALUES ('Dobrich',	'Shabla',	'SH');
INSERT INTO @tbl2 VALUES ('Dobrich',	'Tervel',	'TE');
INSERT INTO @tbl2 VALUES ('Gabrovo',	'Dryanovo',	'DR');
INSERT INTO @tbl2 VALUES ('Gabrovo',	'Gabrovo',	'GA');
INSERT INTO @tbl2 VALUES ('Gabrovo',	'Sevlievo',	'SE');
INSERT INTO @tbl2 VALUES ('Gabrovo',	'Tryavna',	'TR');
INSERT INTO @tbl2 VALUES ('Grad Sofiya',	'Stolichna',	'ST');
INSERT INTO @tbl2 VALUES ('Khaskovo',	'Dimitrovgrad',	'DI');
INSERT INTO @tbl2 VALUES ('Khaskovo',	'Harmanli',	'HM');
INSERT INTO @tbl2 VALUES ('Khaskovo',	'Haskovo',	'HS');
INSERT INTO @tbl2 VALUES ('Khaskovo',	'Ivaylovgrad',	'IV');
INSERT INTO @tbl2 VALUES ('Khaskovo',	'Lyubimets',	'LU');
INSERT INTO @tbl2 VALUES ('Khaskovo',	'Madzharovo',	'MA');
INSERT INTO @tbl2 VALUES ('Khaskovo',	'Mineralni Bani',	'MB');
INSERT INTO @tbl2 VALUES ('Khaskovo',	'Simeonovgrad',	'SI');
INSERT INTO @tbl2 VALUES ('Khaskovo',	'Stambolovo',	'ST');
INSERT INTO @tbl2 VALUES ('Khaskovo',	'Svilengrad',	'SV');
INSERT INTO @tbl2 VALUES ('Khaskovo',	'Topolovgrad',	'TO');
INSERT INTO @tbl2 VALUES ('Kurdzhali',	'Ardino',	'AR');
INSERT INTO @tbl2 VALUES ('Kurdzhali',	'Chernoochene',	'CH');
INSERT INTO @tbl2 VALUES ('Kurdzhali',	'Dzhebel',	'DZ');
INSERT INTO @tbl2 VALUES ('Kurdzhali',	'Kardzhali',	'KA');
INSERT INTO @tbl2 VALUES ('Kurdzhali',	'Kirkovo',	'KI');
INSERT INTO @tbl2 VALUES ('Kurdzhali',	'Krumovgrad',	'KR');
INSERT INTO @tbl2 VALUES ('Kurdzhali',	'Momchilgrad',	'MO');
INSERT INTO @tbl2 VALUES ('Kyustendil',	'Boboshevo',	'BS');
INSERT INTO @tbl2 VALUES ('Kyustendil',	'Bobovdol',	'BD');
INSERT INTO @tbl2 VALUES ('Kyustendil',	'Dupnitsa',	'DU');
INSERT INTO @tbl2 VALUES ('Kyustendil',	'Kocherinovo',	'KO');
INSERT INTO @tbl2 VALUES ('Kyustendil',	'Kyustendil',	'KU');
INSERT INTO @tbl2 VALUES ('Kyustendil',	'Nevestino',	'NE');
INSERT INTO @tbl2 VALUES ('Kyustendil',	'Rila',	'RI');
INSERT INTO @tbl2 VALUES ('Kyustendil',	'Sapareva Banya',	'SB');
INSERT INTO @tbl2 VALUES ('Kyustendil',	'Treklyano',	'TR');
INSERT INTO @tbl2 VALUES ('Lovech',	'Apriltsi',	'AP');
INSERT INTO @tbl2 VALUES ('Lovech',	'Letnitsa',	'LE');
INSERT INTO @tbl2 VALUES ('Lovech',	'Lovech',	'LO');
INSERT INTO @tbl2 VALUES ('Lovech',	'Lukovit',	'LU');
INSERT INTO @tbl2 VALUES ('Lovech',	'Teteven',	'TE');
INSERT INTO @tbl2 VALUES ('Lovech',	'Troyan',	'TR');
INSERT INTO @tbl2 VALUES ('Lovech',	'Ugarchin',	'UG');
INSERT INTO @tbl2 VALUES ('Lovech',	'Yablanitsa',	'YA');
INSERT INTO @tbl2 VALUES ('Montana',	'Berkovitsa',	'BE');
INSERT INTO @tbl2 VALUES ('Montana',	'Boychinovtsi',	'BO');
INSERT INTO @tbl2 VALUES ('Montana',	'Brusartsi',	'BR');
INSERT INTO @tbl2 VALUES ('Montana',	'Chiprovtsi',	'CH');
INSERT INTO @tbl2 VALUES ('Montana',	'Georgi Damyanovo',	'GD');
INSERT INTO @tbl2 VALUES ('Montana',	'Lom',	'LO');
INSERT INTO @tbl2 VALUES ('Montana',	'Medkovets',	'ME');
INSERT INTO @tbl2 VALUES ('Montana',	'Montana',	'MO');
INSERT INTO @tbl2 VALUES ('Montana',	'Valchedram',	'VD');
INSERT INTO @tbl2 VALUES ('Montana',	'Varshets',	'VR');
INSERT INTO @tbl2 VALUES ('Montana',	'Yakimovo',	'YA');
INSERT INTO @tbl2 VALUES ('Pazardzhik',	'Batak',	'BA');
INSERT INTO @tbl2 VALUES ('Pazardzhik',	'Belovo',	'BE');
INSERT INTO @tbl2 VALUES ('Pazardzhik',	'Bratsigovo',	'BR');
INSERT INTO @tbl2 VALUES ('Pazardzhik',	'Lesichovo',	'LE');
INSERT INTO @tbl2 VALUES ('Pazardzhik',	'Panagyurishte',	'PN');
INSERT INTO @tbl2 VALUES ('Pazardzhik',	'Pazardzhik',	'PZ');
INSERT INTO @tbl2 VALUES ('Pazardzhik',	'Peshtera',	'PE');
INSERT INTO @tbl2 VALUES ('Pazardzhik',	'Rakitovo',	'RA');
INSERT INTO @tbl2 VALUES ('Pazardzhik',	'Septemvri',	'SE');
INSERT INTO @tbl2 VALUES ('Pazardzhik',	'Strelcha',	'ST');
INSERT INTO @tbl2 VALUES ('Pazardzhik',	'Velingrad',	'VE');
INSERT INTO @tbl2 VALUES ('Pernik',	'Breznik',	'BR');
INSERT INTO @tbl2 VALUES ('Pernik',	'Kovachevtsi',	'KO');
INSERT INTO @tbl2 VALUES ('Pernik',	'Pernik',	'PE');
INSERT INTO @tbl2 VALUES ('Pernik',	'Radomir',	'RA');
INSERT INTO @tbl2 VALUES ('Pernik',	'Tran',	'TR');
INSERT INTO @tbl2 VALUES ('Pernik',	'Zemen',	'ZE');
INSERT INTO @tbl2 VALUES ('Pleven',	'Belene',	'BE');
INSERT INTO @tbl2 VALUES ('Pleven',	'Cherven Bryag',	'CB');
INSERT INTO @tbl2 VALUES ('Pleven',	'Dolna Mitropolia',	'DM');
INSERT INTO @tbl2 VALUES ('Pleven',	'Dolni Dabnik',	'DD');
INSERT INTO @tbl2 VALUES ('Pleven',	'Gulyantsi',	'GU');
INSERT INTO @tbl2 VALUES ('Pleven',	'Iskar',	'IS');
INSERT INTO @tbl2 VALUES ('Pleven',	'Knezha',	'KN');
INSERT INTO @tbl2 VALUES ('Pleven',	'Levski',	'LE');
INSERT INTO @tbl2 VALUES ('Pleven',	'Nikopol',	'NI');
INSERT INTO @tbl2 VALUES ('Pleven',	'Pleven',	'PL');
INSERT INTO @tbl2 VALUES ('Pleven',	'Pordim',	'PO');
INSERT INTO @tbl2 VALUES ('Plovdiv',	'Asenovgrad',	'AS');
INSERT INTO @tbl2 VALUES ('Plovdiv',	'Brezovo',	'BR');
INSERT INTO @tbl2 VALUES ('Plovdiv',	'Hisarya',	'HI');
INSERT INTO @tbl2 VALUES ('Plovdiv',	'Kaloyanovo',	'KY');
INSERT INTO @tbl2 VALUES ('Plovdiv',	'Karlovo',	'KR');
INSERT INTO @tbl2 VALUES ('Plovdiv',	'Krichim',	'KC');
INSERT INTO @tbl2 VALUES ('Plovdiv',	'Kuklen',	'KK');
INSERT INTO @tbl2 VALUES ('Plovdiv',	'Laki',	'LA');
INSERT INTO @tbl2 VALUES ('Plovdiv',	'Maritsa',	'MA');
INSERT INTO @tbl2 VALUES ('Plovdiv',	'Parvomay',	'PA');
INSERT INTO @tbl2 VALUES ('Plovdiv',	'Perushtitsa',	'PE');
INSERT INTO @tbl2 VALUES ('Plovdiv',	'Plovdiv',	'PL');
INSERT INTO @tbl2 VALUES ('Plovdiv',	'Rakovski',	'RA');
INSERT INTO @tbl2 VALUES ('Plovdiv',	'Rodopi',	'RO');
INSERT INTO @tbl2 VALUES ('Plovdiv',	'Sadovo',	'SV');
INSERT INTO @tbl2 VALUES ('Plovdiv',	'Saedinenie',	'SN');
INSERT INTO @tbl2 VALUES ('Plovdiv',	'Sopot',	'SP');
INSERT INTO @tbl2 VALUES ('Plovdiv',	'Stamboliyski',	'ST');
INSERT INTO @tbl2 VALUES ('Razgrad',	'Isperih',	'IS');
INSERT INTO @tbl2 VALUES ('Razgrad',	'Kubrat',	'KU');
INSERT INTO @tbl2 VALUES ('Razgrad',	'Loznitsa',	'LO');
INSERT INTO @tbl2 VALUES ('Razgrad',	'Razgrad',	'RA');
INSERT INTO @tbl2 VALUES ('Razgrad',	'Samuil',	'SA');
INSERT INTO @tbl2 VALUES ('Razgrad',	'Tsar Kaloyan',	'CK');
INSERT INTO @tbl2 VALUES ('Razgrad',	'Zavet',	'ZA');
INSERT INTO @tbl2 VALUES ('Ruse',	'Borovo',	'BO');
INSERT INTO @tbl2 VALUES ('Ruse',	'Byala',	'BY');
INSERT INTO @tbl2 VALUES ('Ruse',	'Dve Mogili',	'DM');
INSERT INTO @tbl2 VALUES ('Ruse',	'Ivanovo',	'IV');
INSERT INTO @tbl2 VALUES ('Ruse',	'Ruse',	'RU');
INSERT INTO @tbl2 VALUES ('Ruse',	'Slivo Pole',	'SP');
INSERT INTO @tbl2 VALUES ('Ruse',	'Tsenovo',	'CE');
INSERT INTO @tbl2 VALUES ('Ruse',	'Vetovo',	'VE');
INSERT INTO @tbl2 VALUES ('Shumen',	'Hitrino',	'HI');
INSERT INTO @tbl2 VALUES ('Shumen',	'Kaolinovo',	'KL');
INSERT INTO @tbl2 VALUES ('Shumen',	'Kaspichan',	'KS');
INSERT INTO @tbl2 VALUES ('Shumen',	'Nikola Kozlevo',	'NK');
INSERT INTO @tbl2 VALUES ('Shumen',	'Novi Pazar',	'NP');
INSERT INTO @tbl2 VALUES ('Shumen',	'Shumen',	'SH');
INSERT INTO @tbl2 VALUES ('Shumen',	'Smyadovo',	'SM');
INSERT INTO @tbl2 VALUES ('Shumen',	'Varbitsa',	'VA');
INSERT INTO @tbl2 VALUES ('Shumen',	'Veliki Preslav',	'VP');
INSERT INTO @tbl2 VALUES ('Shumen',	'Venets',	'VE');
INSERT INTO @tbl2 VALUES ('Silistra',	'Alfatar',	'AL');
INSERT INTO @tbl2 VALUES ('Silistra',	'Dulovo',	'DU');
INSERT INTO @tbl2 VALUES ('Silistra',	'Glavinitsa',	'GL');
INSERT INTO @tbl2 VALUES ('Silistra',	'Kaynardzha',	'KA');
INSERT INTO @tbl2 VALUES ('Silistra',	'Silistra',	'SL');
INSERT INTO @tbl2 VALUES ('Silistra',	'Sitovo',	'SV');
INSERT INTO @tbl2 VALUES ('Silistra',	'Tutrakan',	'TU');
INSERT INTO @tbl2 VALUES ('Sliven',	'Kotel',	'KO');
INSERT INTO @tbl2 VALUES ('Sliven',	'Nova Zagora',	'NZ');
INSERT INTO @tbl2 VALUES ('Sliven',	'Sliven',	'SL');
INSERT INTO @tbl2 VALUES ('Sliven',	'Tvarditsa',	'TV');
INSERT INTO @tbl2 VALUES ('Smolyan',	'Banite',	'BA');
INSERT INTO @tbl2 VALUES ('Smolyan',	'Borino',	'BO');
INSERT INTO @tbl2 VALUES ('Smolyan',	'Chepelare',	'CH');
INSERT INTO @tbl2 VALUES ('Smolyan',	'Devin',	'DE');
INSERT INTO @tbl2 VALUES ('Smolyan',	'Dospat',	'DO');
INSERT INTO @tbl2 VALUES ('Smolyan',	'Madan',	'MA');
INSERT INTO @tbl2 VALUES ('Smolyan',	'Nedelino',	'NE');
INSERT INTO @tbl2 VALUES ('Smolyan',	'Rudozem',	'RU');
INSERT INTO @tbl2 VALUES ('Smolyan',	'Smolyan',	'SM');
INSERT INTO @tbl2 VALUES ('Smolyan',	'Zlatograd',	'ZL');
INSERT INTO @tbl2 VALUES ('Sofiya',	'Anton',	'AN');
INSERT INTO @tbl2 VALUES ('Sofiya',	'Botevgrad',	'BG');
INSERT INTO @tbl2 VALUES ('Sofiya',	'Bozhurishte',	'BZ');
INSERT INTO @tbl2 VALUES ('Sofiya',	'Chavdar',	'CV');
INSERT INTO @tbl2 VALUES ('Sofiya',	'Chelopech',	'CL');
INSERT INTO @tbl2 VALUES ('Sofiya',	'Dolna Banya',	'DB');
INSERT INTO @tbl2 VALUES ('Sofiya',	'Dragoman',	'DR');
INSERT INTO @tbl2 VALUES ('Sofiya',	'Elin Pelin',	'EP');
INSERT INTO @tbl2 VALUES ('Sofiya',	'Etropole',	'ET');
INSERT INTO @tbl2 VALUES ('Sofiya',	'Godech',	'GO');
INSERT INTO @tbl2 VALUES ('Sofiya',	'Gorna Malina',	'GM');
INSERT INTO @tbl2 VALUES ('Sofiya',	'Ihtiman',	'IH');
INSERT INTO @tbl2 VALUES ('Sofiya',	'Koprivshtitsa',	'KP');
INSERT INTO @tbl2 VALUES ('Sofiya',	'Kostenets',	'KN');
INSERT INTO @tbl2 VALUES ('Sofiya',	'Kostinbrod',	'KB');
INSERT INTO @tbl2 VALUES ('Sofiya',	'Mirkovo',	'MI');
INSERT INTO @tbl2 VALUES ('Sofiya',	'Pirdop',	'PI');
INSERT INTO @tbl2 VALUES ('Sofiya',	'Pravets',	'PR');
INSERT INTO @tbl2 VALUES ('Sofiya',	'Samokov',	'SA');
INSERT INTO @tbl2 VALUES ('Sofiya',	'Slivnitsa',	'SL');
INSERT INTO @tbl2 VALUES ('Sofiya',	'Svoge',	'SV');
INSERT INTO @tbl2 VALUES ('Sofiya',	'Zlatitsa',	'ZL');
INSERT INTO @tbl2 VALUES ('Stara Zagora',	'Bratya Daskalovi',	'BD');
INSERT INTO @tbl2 VALUES ('Stara Zagora',	'Chirpan',	'CH');
INSERT INTO @tbl2 VALUES ('Stara Zagora',	'Galabovo',	'GA');
INSERT INTO @tbl2 VALUES ('Stara Zagora',	'Gurkovo',	'GU');
INSERT INTO @tbl2 VALUES ('Stara Zagora',	'Kazanlak',	'KA');
INSERT INTO @tbl2 VALUES ('Stara Zagora',	'Maglizh',	'MA');
INSERT INTO @tbl2 VALUES ('Stara Zagora',	'Nikolaevo',	'NI');
INSERT INTO @tbl2 VALUES ('Stara Zagora',	'Opan',	'OP');
INSERT INTO @tbl2 VALUES ('Stara Zagora',	'Pavel Banya',	'PB');
INSERT INTO @tbl2 VALUES ('Stara Zagora',	'Radnevo',	'RA');
INSERT INTO @tbl2 VALUES ('Stara Zagora',	'Stara Zagora',	'SZ');
INSERT INTO @tbl2 VALUES ('Turgovishte',	'Antonovo',	'AN');
INSERT INTO @tbl2 VALUES ('Turgovishte',	'Omurtag',	'OM');
INSERT INTO @tbl2 VALUES ('Turgovishte',	'Opaka',	'OP');
INSERT INTO @tbl2 VALUES ('Turgovishte',	'Popovo',	'PO');
INSERT INTO @tbl2 VALUES ('Turgovishte',	'Targovishte',	'TA');
INSERT INTO @tbl2 VALUES ('Varna',	'Aksakovo',	'AK');
INSERT INTO @tbl2 VALUES ('Varna',	'Avren',	'AV');
INSERT INTO @tbl2 VALUES ('Varna',	'Beloslav',	'BE');
INSERT INTO @tbl2 VALUES ('Varna',	'Byala',	'BY');
INSERT INTO @tbl2 VALUES ('Varna',	'Dalgopol',	'DA');
INSERT INTO @tbl2 VALUES ('Varna',	'Devnya',	'DE');
INSERT INTO @tbl2 VALUES ('Varna',	'Dolni Chiflik',	'DC');
INSERT INTO @tbl2 VALUES ('Varna',	'Provadia',	'PR');
INSERT INTO @tbl2 VALUES ('Varna',	'Suvorovo',	'SU');
INSERT INTO @tbl2 VALUES ('Varna',	'Valchi Dol',	'VD');
INSERT INTO @tbl2 VALUES ('Varna',	'Varna',	'VA');
INSERT INTO @tbl2 VALUES ('Varna',	'Vetrino',	'VE');
INSERT INTO @tbl2 VALUES ('Veliko Turnovo',	'Elena',	'EL');
INSERT INTO @tbl2 VALUES ('Veliko Turnovo',	'Gorna Oryahovitsa',	'GO');
INSERT INTO @tbl2 VALUES ('Veliko Turnovo',	'Lyaskovets',	'LY');
INSERT INTO @tbl2 VALUES ('Veliko Turnovo',	'Pavlikeni',	'PA');
INSERT INTO @tbl2 VALUES ('Veliko Turnovo',	'Polski Trambesh',	'PT');
INSERT INTO @tbl2 VALUES ('Veliko Turnovo',	'Strazhitsa',	'ST');
INSERT INTO @tbl2 VALUES ('Veliko Turnovo',	'Suhindol',	'SU');
INSERT INTO @tbl2 VALUES ('Veliko Turnovo',	'Svishtov',	'SV');
INSERT INTO @tbl2 VALUES ('Veliko Turnovo',	'Veliko Tarnovo',	'VT');
INSERT INTO @tbl2 VALUES ('Veliko Turnovo',	'Zlataritsa',	'ZL');
INSERT INTO @tbl2 VALUES ('Vidin',	'Belogradchik',	'BE');
INSERT INTO @tbl2 VALUES ('Vidin',	'Boynitsa',	'BO');
INSERT INTO @tbl2 VALUES ('Vidin',	'Bregovo',	'BR');
INSERT INTO @tbl2 VALUES ('Vidin',	'Chuprene',	'CH');
INSERT INTO @tbl2 VALUES ('Vidin',	'Dimovo',	'DI');
INSERT INTO @tbl2 VALUES ('Vidin',	'Gramada',	'GR');
INSERT INTO @tbl2 VALUES ('Vidin',	'Kula',	'KU');
INSERT INTO @tbl2 VALUES ('Vidin',	'Makresh',	'MA');
INSERT INTO @tbl2 VALUES ('Vidin',	'Novo Selo',	'NS');
INSERT INTO @tbl2 VALUES ('Vidin',	'Ruzhintsi',	'RU');
INSERT INTO @tbl2 VALUES ('Vidin',	'Vidin',	'VI');
INSERT INTO @tbl2 VALUES ('Vratsa',	'Borovan',	'BO');
INSERT INTO @tbl2 VALUES ('Vratsa',	'Byala Slatina',	'BS');
INSERT INTO @tbl2 VALUES ('Vratsa',	'Hayredin',	'HA');
INSERT INTO @tbl2 VALUES ('Vratsa',	'Kozloduy',	'KO');
INSERT INTO @tbl2 VALUES ('Vratsa',	'Krivodol',	'KR');
INSERT INTO @tbl2 VALUES ('Vratsa',	'Mezdra',	'ME');
INSERT INTO @tbl2 VALUES ('Vratsa',	'Mizia',	'MI');
INSERT INTO @tbl2 VALUES ('Vratsa',	'Oryahovo',	'OR');
INSERT INTO @tbl2 VALUES ('Vratsa',	'Roman',	'RO');
INSERT INTO @tbl2 VALUES ('Vratsa',	'Vratsa',	'VR');
INSERT INTO @tbl2 VALUES ('Yambol',	'Bolyarovo',	'BO');
INSERT INTO @tbl2 VALUES ('Yambol',	'Elhovo',	'EL');
INSERT INTO @tbl2 VALUES ('Yambol',	'Straldzha',	'ST');
INSERT INTO @tbl2 VALUES ('Yambol',	'Tundzha',	'TU');
INSERT INTO @tbl2 VALUES ('Yambol',	'Yambol',	'YA');


SET NOCOUNT OFF

INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	level_2_nm, level_2_cd, level_1_address_component_id
	FROM	@tbl2	t
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


