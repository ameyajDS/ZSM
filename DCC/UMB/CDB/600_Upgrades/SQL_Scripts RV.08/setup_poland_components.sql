
/* ==================================================================================
    	Source File		:	setup_poland_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Poland are set-up
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
WHERE	country_nm	=	'Poland';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Poland not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Voivodship',
		level_2_address_component	=	'County',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Kujawsko-pomorskie'            ,	     'Aleksandrowski',	'KP',	'AL');
INSERT INTO @tbl VALUES ('Podlaskie'            ,	     'Augustowski',	'PD',	'AU');
INSERT INTO @tbl VALUES ('Warminsko-mazurskie'            ,	     'Bartoszycki',	'WN',	'BA');
INSERT INTO @tbl VALUES ('Slaskie'            ,	     'Bedzinski',	'SL',	'BE');
INSERT INTO @tbl VALUES ('Lodzkie'            ,	     'Belchatowski',	'LD',	'BE');
INSERT INTO @tbl VALUES ('Lubelskie'            ,	     'Biala Podlaska',	'LU',	'BM');
INSERT INTO @tbl VALUES ('Mazowieckie'            ,	     'Bialobrzeski',	'MZ',	'BI');
INSERT INTO @tbl VALUES ('Zachodniopomorskie'            ,	     'Bialogardzki',	'ZP',	'BI');
INSERT INTO @tbl VALUES ('Podlaskie'            ,	     'Bialostocki',	'PD',	'BI');
INSERT INTO @tbl VALUES ('Lubelskie'            ,	     'Bialski',	'LU',	'BP');
INSERT INTO @tbl VALUES ('Podlaskie'            ,	     'Bialystok',	'PD',	'BM');
INSERT INTO @tbl VALUES ('Podlaskie'            ,	     'Bielski',	'PD',	'BP');
INSERT INTO @tbl VALUES ('Slaskie'            ,	     'Bielski',	'SL',	'BI');
INSERT INTO @tbl VALUES ('Slaskie'            ,	     'Bielsko-Biala',	'SL',	'BM');
INSERT INTO @tbl VALUES ('Slaskie'            ,	     'Bierunsko-ledzinski',	'SL',	'TY');
INSERT INTO @tbl VALUES ('Podkarpackie'            ,	     'Bieszczadzki',	'PK',	'BD');
INSERT INTO @tbl VALUES ('Lubelskie'            ,	     'Bilgorajski',	'LU',	'BI');
INSERT INTO @tbl VALUES ('Malopolskie'            ,	     'Bochenski',	'MA',	'BO');
INSERT INTO @tbl VALUES ('Dolnoslaskie'            ,	     'Boleslawiecki',	'DS',	'BO');
INSERT INTO @tbl VALUES ('Warminsko-mazurskie'            ,	     'Braniewski',	'WN',	'BR');
INSERT INTO @tbl VALUES ('Kujawsko-pomorskie'            ,	     'Brodnicki',	'KP',	'BR');
INSERT INTO @tbl VALUES ('Opolskie'            ,	     'Brzeski',	'OP',	'BR');
INSERT INTO @tbl VALUES ('Malopolskie'            ,	     'Brzeski',	'MA',	'BR');
INSERT INTO @tbl VALUES ('Lodzkie'            ,	     'Brzezinski',	'LD',	'BZ');
INSERT INTO @tbl VALUES ('Podkarpackie'            ,	     'Brzozowski',	'PK',	'BR');
INSERT INTO @tbl VALUES ('Swietokrzyskie'            ,	     'Buski',	'SK',	'BU');
INSERT INTO @tbl VALUES ('Kujawsko-pomorskie'            ,	     'Bydgoski',	'KP',	'BY');
INSERT INTO @tbl VALUES ('Kujawsko-pomorskie'            ,	     'Bydgoszcz',	'KP',	'BM');
INSERT INTO @tbl VALUES ('Slaskie'            ,	     'Bytom',	'SL',	'BY');
INSERT INTO @tbl VALUES ('Pomorskie'            ,	     'Bytowski',	'PM',	'BY');
INSERT INTO @tbl VALUES ('Lubelskie'            ,	     'Chelm',	'LU',	'CM');
INSERT INTO @tbl VALUES ('Kujawsko-pomorskie'            ,	     'Chelminski',	'KP',	'CH');
INSERT INTO @tbl VALUES ('Lubelskie'            ,	     'Chelmski',	'LU',	'CH');
INSERT INTO @tbl VALUES ('Wielkopolskie'            ,	     'Chodzieski',	'WP',	'CH');
INSERT INTO @tbl VALUES ('Pomorskie'            ,	     'Chojnicki',	'PM',	'CH');
INSERT INTO @tbl VALUES ('Slaskie'            ,	     'Chorzow',	'SL',	'CH');
INSERT INTO @tbl VALUES ('Zachodniopomorskie'            ,	     'Choszczenski',	'ZP',	'CH');
INSERT INTO @tbl VALUES ('Malopolskie'            ,	     'Chrzanowski',	'MA',	'CH');
INSERT INTO @tbl VALUES ('Mazowieckie'            ,	     'Ciechanowski',	'MZ',	'CI');
INSERT INTO @tbl VALUES ('Slaskie'            ,	     'Cieszynski',	'SL',	'CI');
INSERT INTO @tbl VALUES ('Wielkopolskie'            ,	     'Czarnkowsko-trzcianecki',	'WP',	'CZ');
INSERT INTO @tbl VALUES ('Slaskie'            ,	     'Czestochowa',	'SL',	'CM');
INSERT INTO @tbl VALUES ('Slaskie'            ,	     'Czestochowski',	'SL',	'CZ');
INSERT INTO @tbl VALUES ('Pomorskie'            ,	     'Czluchowski',	'PM',	'CZ');
INSERT INTO @tbl VALUES ('Slaskie'            ,	     'Dabrowa Gornicza',	'SL',	'DA');
INSERT INTO @tbl VALUES ('Malopolskie'            ,	     'Dabrowski',	'MA',	'DA');
INSERT INTO @tbl VALUES ('Podkarpackie'            ,	     'Debicki',	'PK',	'DE');
INSERT INTO @tbl VALUES ('Zachodniopomorskie'            ,	     'Drawski',	'ZP',	'DR');
INSERT INTO @tbl VALUES ('Warminsko-mazurskie'            ,	     'Dzialdowski',	'WN',	'DZ');
INSERT INTO @tbl VALUES ('Dolnoslaskie'            ,	     'Dzierzoniowski',	'DS',	'DZ');
INSERT INTO @tbl VALUES ('Warminsko-mazurskie'            ,	     'Elblag',	'WN',	'EM');
INSERT INTO @tbl VALUES ('Warminsko-mazurskie'            ,	     'Elblaski',	'WN',	'EL');
INSERT INTO @tbl VALUES ('Warminsko-mazurskie'            ,	     'Elcki',	'WN',	'EK');
INSERT INTO @tbl VALUES ('Mazowieckie'            ,	     'Garwolinski',	'MZ',	'GA');
INSERT INTO @tbl VALUES ('Pomorskie'            ,	     'Gdansk',	'PM',	'GM');
INSERT INTO @tbl VALUES ('Pomorskie'            ,	     'Gdanski',	'PM',	'GD');
INSERT INTO @tbl VALUES ('Pomorskie'            ,	     'Gdynia',	'PM',	'GY');
INSERT INTO @tbl VALUES ('Warminsko-mazurskie'            ,	     'Gizycki',	'WN',	'GZ');
INSERT INTO @tbl VALUES ('Slaskie'            ,	     'Gliwice',	'SL',	'GM');
INSERT INTO @tbl VALUES ('Slaskie'            ,	     'Gliwicki',	'SL',	'GL');
INSERT INTO @tbl VALUES ('Dolnoslaskie'            ,	     'Glogowski',	'DS',	'GL');
INSERT INTO @tbl VALUES ('Opolskie'            ,	     'Glubczycki',	'OP',	'GL');
INSERT INTO @tbl VALUES ('Wielkopolskie'            ,	     'Gnieznienski',	'WP',	'GN');
INSERT INTO @tbl VALUES ('Warminsko-mazurskie'            ,	     'Goldapski',	'WN',	'GO');
INSERT INTO @tbl VALUES ('Zachodniopomorskie'            ,	     'Goleniowski',	'ZP',	'GL');
INSERT INTO @tbl VALUES ('Kujawsko-pomorskie'            ,	     'Golubsko-dobrzynski',	'KP',	'GO');
INSERT INTO @tbl VALUES ('Malopolskie'            ,	     'Gorlicki',	'MA',	'GO');
INSERT INTO @tbl VALUES ('Dolnoslaskie'            ,	     'Gorowski',	'DS',	'GO');
INSERT INTO @tbl VALUES ('Lubuskie'            ,	     'Gorzowski',	'LB',	'GW');
INSERT INTO @tbl VALUES ('Lubuskie'            ,	     'Gorzow Wielkopolski',	'LB',	'GM');
INSERT INTO @tbl VALUES ('Mazowieckie'            ,	     'Gostyninski',	'MZ',	'GO');
INSERT INTO @tbl VALUES ('Wielkopolskie'            ,	     'Gostynski',	'WP',	'GO');
INSERT INTO @tbl VALUES ('Podlaskie'            ,	     'Grajewski',	'PD',	'GR');
INSERT INTO @tbl VALUES ('Mazowieckie'            ,	     'Grodziski',	'MZ',	'GD');
INSERT INTO @tbl VALUES ('Wielkopolskie'            ,	     'Grodziski',	'WP',	'GR');
INSERT INTO @tbl VALUES ('Mazowieckie'            ,	     'Grojecki',	'MZ',	'GJ');
INSERT INTO @tbl VALUES ('Kujawsko-pomorskie'            ,	     'Grudziadz',	'KP',	'GM');
INSERT INTO @tbl VALUES ('Kujawsko-pomorskie'            ,	     'Grudziadzki',	'KP',	'GR');
INSERT INTO @tbl VALUES ('Zachodniopomorskie'            ,	     'Gryficki',	'ZP',	'GF');
INSERT INTO @tbl VALUES ('Zachodniopomorskie'            ,	     'Gryfinski',	'ZP',	'GN');
INSERT INTO @tbl VALUES ('Podlaskie'            ,	     'Hajnowski',	'PD',	'HA');
INSERT INTO @tbl VALUES ('Lubelskie'            ,	     'Hrubieszowski',	'LU',	'HR');
INSERT INTO @tbl VALUES ('Warminsko-mazurskie'            ,	     'Ilawski',	'WN',	'IL');
INSERT INTO @tbl VALUES ('Kujawsko-pomorskie'            ,	     'Inowroclawski',	'KP',	'IN');
INSERT INTO @tbl VALUES ('Lubelskie'            ,	     'Janowski',	'LU',	'JA');
INSERT INTO @tbl VALUES ('Wielkopolskie'            ,	     'Jarocinski',	'WP',	'JA');
INSERT INTO @tbl VALUES ('Podkarpackie'            ,	     'Jaroslawski',	'PK',	'JA');
INSERT INTO @tbl VALUES ('Podkarpackie'            ,	     'Jasielski',	'PK',	'JS');
INSERT INTO @tbl VALUES ('Slaskie'            ,	     'Jastrzebie-Zdroj',	'SL',	'JZ');
INSERT INTO @tbl VALUES ('Dolnoslaskie'            ,	     'Jaworski',	'DS',	'JA');
INSERT INTO @tbl VALUES ('Slaskie'            ,	     'Jaworzno',	'SL',	'JW');
INSERT INTO @tbl VALUES ('Swietokrzyskie'            ,	     'Jedrzejowski',	'SK',	'JE');
INSERT INTO @tbl VALUES ('Dolnoslaskie'            ,	     'Jelenia Gora',	'DS',	'JM');
INSERT INTO @tbl VALUES ('Dolnoslaskie'            ,	     'Jeleniogorski',	'DS',	'JG');
INSERT INTO @tbl VALUES ('Wielkopolskie'            ,	     'Kaliski',	'WP',	'KA');
INSERT INTO @tbl VALUES ('Wielkopolskie'            ,	     'Kalisz',	'WP',	'KM');
INSERT INTO @tbl VALUES ('Dolnoslaskie'            ,	     'Kamiennogorski',	'DS',	'KA');
INSERT INTO @tbl VALUES ('Zachodniopomorskie'            ,	     'Kamienski',	'ZP',	'KA');
INSERT INTO @tbl VALUES ('Pomorskie'            ,	     'Kartuski',	'PM',	'KA');
INSERT INTO @tbl VALUES ('Slaskie'            ,	     'Katowice',	'SL',	'KA');
INSERT INTO @tbl VALUES ('Swietokrzyskie'            ,	     'Kazimierski',	'SK',	'KA');
INSERT INTO @tbl VALUES ('Opolskie'            ,	     'Kedzierzynsko-kozielski',	'OP',	'KE');
INSERT INTO @tbl VALUES ('Wielkopolskie'            ,	     'Kepinski',	'WP',	'KE');
INSERT INTO @tbl VALUES ('Warminsko-mazurskie'            ,	     'Ketrzynski',	'WN',	'KE');
INSERT INTO @tbl VALUES ('Swietokrzyskie'            ,	     'Kielce',	'SK',	'KM');
INSERT INTO @tbl VALUES ('Swietokrzyskie'            ,	     'Kielecki',	'SK',	'KI');
INSERT INTO @tbl VALUES ('Slaskie'            ,	     'Klobucki',	'SL',	'KL');
INSERT INTO @tbl VALUES ('Dolnoslaskie'            ,	     'Klodzki',	'DS',	'KL');
INSERT INTO @tbl VALUES ('Opolskie'            ,	     'Kluczborski',	'OP',	'KL');
INSERT INTO @tbl VALUES ('Podkarpackie'            ,	     'Kolbuszowski',	'PK',	'KO');
INSERT INTO @tbl VALUES ('Podlaskie'            ,	     'Kolnenski',	'PD',	'KO');
INSERT INTO @tbl VALUES ('Zachodniopomorskie'            ,	     'Kolobrzeski',	'ZP',	'KB');
INSERT INTO @tbl VALUES ('Wielkopolskie'            ,	     'Kolski',	'WP',	'KL');
INSERT INTO @tbl VALUES ('Swietokrzyskie'            ,	     'Konecki',	'SK',	'KO');
INSERT INTO @tbl VALUES ('Wielkopolskie'            ,	     'Konin',	'WP',	'KO');
INSERT INTO @tbl VALUES ('Wielkopolskie'            ,	     'Koninski',	'WP',	'KN');
INSERT INTO @tbl VALUES ('Wielkopolskie'            ,	     'Koscianski',	'WP',	'KS');
INSERT INTO @tbl VALUES ('Pomorskie'            ,	     'Koscierski',	'PM',	'KO');
INSERT INTO @tbl VALUES ('Zachodniopomorskie'            ,	     'Koszalin',	'ZP',	'KM');
INSERT INTO @tbl VALUES ('Zachodniopomorskie'            ,	     'Koszalinski',	'ZP',	'KO');
INSERT INTO @tbl VALUES ('Mazowieckie'            ,	     'Kozienicki',	'MZ',	'KO');
INSERT INTO @tbl VALUES ('Malopolskie'            ,	     'Krakow',	'MA',	'KM');
INSERT INTO @tbl VALUES ('Malopolskie'            ,	     'Krakowski',	'MA',	'KR');
INSERT INTO @tbl VALUES ('Opolskie'            ,	     'Krapkowicki',	'OP',	'KR');
INSERT INTO @tbl VALUES ('Lubelskie'            ,	     'Krasnicki',	'LU',	'KK');
INSERT INTO @tbl VALUES ('Lubelskie'            ,	     'Krasnostawski',	'LU',	'KW');
INSERT INTO @tbl VALUES ('Podkarpackie'            ,	     'Krosnienski',	'PK',	'KR');
INSERT INTO @tbl VALUES ('Lubuskie'            ,	     'Krosnienski',	'LB',	'KR');
INSERT INTO @tbl VALUES ('Podkarpackie'            ,	     'Krosno',	'PK',	'KM');
INSERT INTO @tbl VALUES ('Wielkopolskie'            ,	     'Krotoszynski',	'WP',	'KR');
INSERT INTO @tbl VALUES ('Lodzkie'            ,	     'Kutnowski',	'LD',	'KU');
INSERT INTO @tbl VALUES ('Pomorskie'            ,	     'Kwidzynski',	'PM',	'KW');
INSERT INTO @tbl VALUES ('Podkarpackie'            ,	     'Lancucki',	'PK',	'LA');
INSERT INTO @tbl VALUES ('Lodzkie'            ,	     'Laski',	'LD',	'LA');
INSERT INTO @tbl VALUES ('Pomorskie'            ,	     'Leborski',	'PM',	'LE');
INSERT INTO @tbl VALUES ('Lodzkie'            ,	     'Leczycki',	'LD',	'LE');
INSERT INTO @tbl VALUES ('Lubelskie'            ,	     'Leczynski',	'LU',	'LE');
INSERT INTO @tbl VALUES ('Mazowieckie'            ,	     'Legionowski',	'MZ',	'LE');
INSERT INTO @tbl VALUES ('Dolnoslaskie'            ,	     'Legnica',	'DS',	'LM');
INSERT INTO @tbl VALUES ('Dolnoslaskie'            ,	     'Legnicki',	'DS',	'LG');
INSERT INTO @tbl VALUES ('Podkarpackie'            ,	     'Leski',	'PK',	'LS');
INSERT INTO @tbl VALUES ('Wielkopolskie'            ,	     'Leszczynski',	'WP',	'LC');
INSERT INTO @tbl VALUES ('Wielkopolskie'            ,	     'Leszno',	'WP',	'LE');
INSERT INTO @tbl VALUES ('Podkarpackie'            ,	     'Lezajski',	'PK',	'LE');
INSERT INTO @tbl VALUES ('Warminsko-mazurskie'            ,	     'Lidzbarski',	'WN',	'LI');
INSERT INTO @tbl VALUES ('Malopolskie'            ,	     'Limanowski',	'MA',	'LI');
INSERT INTO @tbl VALUES ('Kujawsko-pomorskie'            ,	     'Lipnowski',	'KP',	'LI');
INSERT INTO @tbl VALUES ('Mazowieckie'            ,	     'Lipski',	'MZ',	'LI');
INSERT INTO @tbl VALUES ('Zachodniopomorskie'            ,	     'Lobeski',	'ZP',	'LO');
INSERT INTO @tbl VALUES ('Lodzkie'            ,	     'Lodz',	'LD',	'LO');
INSERT INTO @tbl VALUES ('Lodzkie'            ,	     'Lodzki Wschodni',	'LD',	'LD');
INSERT INTO @tbl VALUES ('Podlaskie'            ,	     'Lomza',	'PD',	'LM');
INSERT INTO @tbl VALUES ('Podlaskie'            ,	     'Lomzynski',	'PD',	'LO');
INSERT INTO @tbl VALUES ('Mazowieckie'            ,	     'Losicki',	'MZ',	'LO');
INSERT INTO @tbl VALUES ('Lodzkie'            ,	     'Lowicki',	'LD',	'LC');
INSERT INTO @tbl VALUES ('Podkarpackie'            ,	     'Lubaczowski',	'PK',	'LU');
INSERT INTO @tbl VALUES ('Dolnoslaskie'            ,	     'Lubanski',	'DS',	'LA');
INSERT INTO @tbl VALUES ('Lubelskie'            ,	     'Lubartowski',	'LU',	'LT');
INSERT INTO @tbl VALUES ('Lubelskie'            ,	     'Lubelski',	'LU',	'LU');
INSERT INTO @tbl VALUES ('Dolnoslaskie'            ,	     'Lubinski',	'DS',	'LI');
INSERT INTO @tbl VALUES ('Lubelskie'            ,	     'Lublin',	'LU',	'LM');
INSERT INTO @tbl VALUES ('Slaskie'            ,	     'Lubliniecki',	'SL',	'LU');
INSERT INTO @tbl VALUES ('Lubelskie'            ,	     'Lukowski',	'LU',	'LK');
INSERT INTO @tbl VALUES ('Dolnoslaskie'            ,	     'Lwowecki',	'DS',	'LW');
INSERT INTO @tbl VALUES ('Mazowieckie'            ,	     'Makowski',	'MZ',	'MA');
INSERT INTO @tbl VALUES ('Pomorskie'            ,	     'Malborski',	'PM',	'MB');
INSERT INTO @tbl VALUES ('Malopolskie'            ,	     'Miechowski',	'MA',	'MI');
INSERT INTO @tbl VALUES ('Wielkopolskie'            ,	     'Miedzychodzki',	'WP',	'MI');
INSERT INTO @tbl VALUES ('Lubuskie'            ,	     'Miedzyrzecki',	'LB',	'MI');
INSERT INTO @tbl VALUES ('Podkarpackie'            ,	     'Mielecki',	'PK',	'MI');
INSERT INTO @tbl VALUES ('Slaskie'            ,	     'Mikolowski',	'SL',	'MI');
INSERT INTO @tbl VALUES ('Dolnoslaskie'            ,	     'Milicki',	'DS',	'MI');
INSERT INTO @tbl VALUES ('Mazowieckie'            ,	     'Minski',	'MZ',	'MI');
INSERT INTO @tbl VALUES ('Mazowieckie'            ,	     'Mlawski',	'MZ',	'ML');
INSERT INTO @tbl VALUES ('Kujawsko-pomorskie'            ,	     'Mogilenski',	'KP',	'MO');
INSERT INTO @tbl VALUES ('Podlaskie'            ,	     'Moniecki',	'PD',	'MO');
INSERT INTO @tbl VALUES ('Warminsko-mazurskie'            ,	     'Mragowski',	'WN',	'MR');
INSERT INTO @tbl VALUES ('Malopolskie'            ,	     'Myslenicki',	'MA',	'MY');
INSERT INTO @tbl VALUES ('Zachodniopomorskie'            ,	     'Mysliborski',	'ZP',	'MY');
INSERT INTO @tbl VALUES ('Slaskie'            ,	     'Myslowice',	'SL',	'ML');
INSERT INTO @tbl VALUES ('Slaskie'            ,	     'Myszkowski',	'SL',	'MK');
INSERT INTO @tbl VALUES ('Kujawsko-pomorskie'            ,	     'Nakielski',	'KP',	'NA');
INSERT INTO @tbl VALUES ('Opolskie'            ,	     'Namyslowski',	'OP',	'NA');
INSERT INTO @tbl VALUES ('Warminsko-mazurskie'            ,	     'Nidzicki',	'WN',	'NI');
INSERT INTO @tbl VALUES ('Podkarpackie'            ,	     'Nizanski',	'PK',	'NI');
INSERT INTO @tbl VALUES ('Pomorskie'            ,	     'Nowodworski',	'PM',	'NO');
INSERT INTO @tbl VALUES ('Mazowieckie'            ,	     'Nowodworski',	'MZ',	'NO');
INSERT INTO @tbl VALUES ('Warminsko-mazurskie'            ,	     'Nowomiejski',	'WN',	'NO');
INSERT INTO @tbl VALUES ('Malopolskie'            ,	     'Nowosadecki',	'MA',	'NS');
INSERT INTO @tbl VALUES ('Lubuskie'            ,	     'Nowosolski',	'LB',	'NS');
INSERT INTO @tbl VALUES ('Malopolskie'            ,	     'Nowotarski',	'MA',	'NT');
INSERT INTO @tbl VALUES ('Wielkopolskie'            ,	     'Nowotomyski',	'WP',	'NO');
INSERT INTO @tbl VALUES ('Malopolskie'            ,	     'Nowy Sacz',	'MA',	'NM');
INSERT INTO @tbl VALUES ('Opolskie'            ,	     'Nyski',	'OP',	'NY');
INSERT INTO @tbl VALUES ('Wielkopolskie'            ,	     'Obornicki',	'WP',	'OB');
INSERT INTO @tbl VALUES ('Dolnoslaskie'            ,	     'Olawski',	'DS',	'OW');
INSERT INTO @tbl VALUES ('Warminsko-mazurskie'            ,	     'Olecki',	'WN',	'OC');
INSERT INTO @tbl VALUES ('Opolskie'            ,	     'Oleski',	'OP',	'OL');
INSERT INTO @tbl VALUES ('Dolnoslaskie'            ,	     'Olesnicki',	'DS',	'OS');
INSERT INTO @tbl VALUES ('Malopolskie'            ,	     'Olkuski',	'MA',	'OL');
INSERT INTO @tbl VALUES ('Warminsko-mazurskie'            ,	     'Olsztyn',	'WN',	'OM');
INSERT INTO @tbl VALUES ('Warminsko-mazurskie'            ,	     'Olsztynski',	'WN',	'OL');
INSERT INTO @tbl VALUES ('Swietokrzyskie'            ,	     'Opatowski',	'SK',	'OP');
INSERT INTO @tbl VALUES ('Lodzkie'            ,	     'Opoczynski',	'LD',	'OP');
INSERT INTO @tbl VALUES ('Opolskie'            ,	     'Opole',	'OP',	'OM');
INSERT INTO @tbl VALUES ('Opolskie'            ,	     'Opolski',	'OP',	'OP');
INSERT INTO @tbl VALUES ('Lubelskie'            ,	     'Opolski',	'LU',	'OP');
INSERT INTO @tbl VALUES ('Warminsko-mazurskie'            ,	     'Ostrodzki',	'WN',	'OS');
INSERT INTO @tbl VALUES ('Mazowieckie'            ,	     'Ostrolecki',	'MZ',	'OL');
INSERT INTO @tbl VALUES ('Mazowieckie'            ,	     'Ostroleka',	'MZ',	'OM');
INSERT INTO @tbl VALUES ('Swietokrzyskie'            ,	     'Ostrowiecki',	'SK',	'OS');
INSERT INTO @tbl VALUES ('Mazowieckie'            ,	     'Ostrowski',	'MZ',	'OS');
INSERT INTO @tbl VALUES ('Wielkopolskie'            ,	     'Ostrowski',	'WP',	'OW');
INSERT INTO @tbl VALUES ('Wielkopolskie'            ,	     'Ostrzeszowski',	'WP',	'OS');
INSERT INTO @tbl VALUES ('Malopolskie'            ,	     'Oswiecimski',	'MA',	'OS');
INSERT INTO @tbl VALUES ('Mazowieckie'            ,	     'Otwocki',	'MZ',	'OT');
INSERT INTO @tbl VALUES ('Lodzkie'            ,	     'Pabianicki',	'LD',	'PB');
INSERT INTO @tbl VALUES ('Lodzkie'            ,	     'Pajeczanski',	'LD',	'PJ');
INSERT INTO @tbl VALUES ('Lubelskie'            ,	     'Parczewski',	'LU',	'PA');
INSERT INTO @tbl VALUES ('Mazowieckie'            ,	     'Piaseczynski',	'MZ',	'PI');
INSERT INTO @tbl VALUES ('Slaskie'            ,	     'Piekary Slaskie',	'SL',	'PI');
INSERT INTO @tbl VALUES ('Wielkopolskie'            ,	     'Pilski',	'WP',	'PI');
INSERT INTO @tbl VALUES ('Swietokrzyskie'            ,	     'Pinczowski',	'SK',	'PI');
INSERT INTO @tbl VALUES ('Lodzkie'            ,	     'Piotrkowski',	'LD',	'PT');
INSERT INTO @tbl VALUES ('Lodzkie'            ,	     'Piotrkow Trybunalski',	'LD',	'PM');
INSERT INTO @tbl VALUES ('Warminsko-mazurskie'            ,	     'Piski',	'WN',	'PI');
INSERT INTO @tbl VALUES ('Wielkopolskie'            ,	     'Pleszewski',	'WP',	'PL');
INSERT INTO @tbl VALUES ('Mazowieckie'            ,	     'Plock',	'MZ',	'PM');
INSERT INTO @tbl VALUES ('Mazowieckie'            ,	     'Plocki',	'MZ',	'PL');
INSERT INTO @tbl VALUES ('Mazowieckie'            ,	     'Plonski',	'MZ',	'PN');
INSERT INTO @tbl VALUES ('Lodzkie'            ,	     'Poddebicki',	'LD',	'PO');
INSERT INTO @tbl VALUES ('Zachodniopomorskie'            ,	     'Policki',	'ZP',	'PO');
INSERT INTO @tbl VALUES ('Dolnoslaskie'            ,	     'Polkowicki',	'DS',	'PO');
INSERT INTO @tbl VALUES ('Wielkopolskie'            ,	     'Poznan',	'WP',	'PM');
INSERT INTO @tbl VALUES ('Wielkopolskie'            ,	     'Poznanski',	'WP',	'PO');
INSERT INTO @tbl VALUES ('Malopolskie'            ,	     'Proszowicki',	'MA',	'PR');
INSERT INTO @tbl VALUES ('Opolskie'            ,	     'Prudnicki',	'OP',	'PR');
INSERT INTO @tbl VALUES ('Mazowieckie'            ,	     'Pruszkowski',	'MZ',	'PK');
INSERT INTO @tbl VALUES ('Mazowieckie'            ,	     'Przasnyski',	'MZ',	'PZ');
INSERT INTO @tbl VALUES ('Podkarpackie'            ,	     'Przemyski',	'PK',	'PR');
INSERT INTO @tbl VALUES ('Podkarpackie'            ,	     'Przemysl',	'PK',	'PM');
INSERT INTO @tbl VALUES ('Podkarpackie'            ,	     'Przeworski',	'PK',	'PW');
INSERT INTO @tbl VALUES ('Mazowieckie'            ,	     'Przysuski',	'MZ',	'PY');
INSERT INTO @tbl VALUES ('Slaskie'            ,	     'Pszczynski',	'SL',	'PS');
INSERT INTO @tbl VALUES ('Pomorskie'            ,	     'Pucki',	'PM',	'PU');
INSERT INTO @tbl VALUES ('Lubelskie'            ,	     'Pulawski',	'LU',	'PU');
INSERT INTO @tbl VALUES ('Mazowieckie'            ,	     'Pultuski',	'MZ',	'PU');
INSERT INTO @tbl VALUES ('Zachodniopomorskie'            ,	     'Pyrzycki',	'ZP',	'PY');
INSERT INTO @tbl VALUES ('Slaskie'            ,	     'Raciborski',	'SL',	'RA');
INSERT INTO @tbl VALUES ('Mazowieckie'            ,	     'Radom',	'MZ',	'RM');
INSERT INTO @tbl VALUES ('Mazowieckie'            ,	     'Radomski',	'MZ',	'RA');
INSERT INTO @tbl VALUES ('Lodzkie'            ,	     'Radomszczanski',	'LD',	'RD');
INSERT INTO @tbl VALUES ('Kujawsko-pomorskie'            ,	     'Radziejowski',	'KP',	'RA');
INSERT INTO @tbl VALUES ('Lubelskie'            ,	     'Radzynski',	'LU',	'RA');
INSERT INTO @tbl VALUES ('Wielkopolskie'            ,	     'Rawicki',	'WP',	'RA');
INSERT INTO @tbl VALUES ('Lodzkie'            ,	     'Rawski',	'LD',	'RW');
INSERT INTO @tbl VALUES ('Podkarpackie'            ,	     'Ropczycko-sedziszowski',	'PK',	'RO');
INSERT INTO @tbl VALUES ('Slaskie'            ,	     'Ruda Slaska',	'SL',	'RU');
INSERT INTO @tbl VALUES ('Slaskie'            ,	     'Rybnicki',	'SL',	'RY');
INSERT INTO @tbl VALUES ('Slaskie'            ,	     'Rybnik',	'SL',	'RM');
INSERT INTO @tbl VALUES ('Lubelskie'            ,	     'Rycki',	'LU',	'RY');
INSERT INTO @tbl VALUES ('Kujawsko-pomorskie'            ,	     'Rypinski',	'KP',	'RY');
INSERT INTO @tbl VALUES ('Podkarpackie'            ,	     'Rzeszow',	'PK',	'RM');
INSERT INTO @tbl VALUES ('Podkarpackie'            ,	     'Rzeszowski',	'PK',	'RZ');
INSERT INTO @tbl VALUES ('Swietokrzyskie'            ,	     'Sandomierski',	'SK',	'SA');
INSERT INTO @tbl VALUES ('Podkarpackie'            ,	     'Sanocki',	'PK',	'SA');
INSERT INTO @tbl VALUES ('Podlaskie'            ,	     'Sejnenski',	'PD',	'SE');
INSERT INTO @tbl VALUES ('Kujawsko-pomorskie'            ,	     'Sepolenski',	'KP',	'SE');
INSERT INTO @tbl VALUES ('Mazowieckie'            ,	     'Siedlce',	'MZ',	'SM');
INSERT INTO @tbl VALUES ('Mazowieckie'            ,	     'Siedlecki',	'MZ',	'SI');
INSERT INTO @tbl VALUES ('Slaskie'            ,	     'Siemianowice Slaskie',	'SL',	'SI');
INSERT INTO @tbl VALUES ('Podlaskie'            ,	     'Siemiatycki',	'PD',	'SI');
INSERT INTO @tbl VALUES ('Lodzkie'            ,	     'Sieradzki',	'LD',	'SI');
INSERT INTO @tbl VALUES ('Mazowieckie'            ,	     'Sierpecki',	'MZ',	'SP');
INSERT INTO @tbl VALUES ('Swietokrzyskie'            ,	     'Skarzyski',	'SK',	'SK');
INSERT INTO @tbl VALUES ('Lodzkie'            ,	     'Skierniewice',	'LD',	'SM');
INSERT INTO @tbl VALUES ('Lodzkie'            ,	     'Skierniewicki',	'LD',	'SK');
INSERT INTO @tbl VALUES ('Zachodniopomorskie'            ,	     'Slawienski',	'ZP',	'SL');
INSERT INTO @tbl VALUES ('Lubuskie'            ,	     'Slubicki',	'LB',	'SL');
INSERT INTO @tbl VALUES ('Wielkopolskie'            ,	     'Slupecki',	'WP',	'SL');
INSERT INTO @tbl VALUES ('Pomorskie'            ,	     'Slupsk',	'PM',	'SM');
INSERT INTO @tbl VALUES ('Pomorskie'            ,	     'Slupski',	'PM',	'SL');
INSERT INTO @tbl VALUES ('Mazowieckie'            ,	     'Sochaczewski',	'MZ',	'SO');
INSERT INTO @tbl VALUES ('Mazowieckie'            ,	     'Sokolowski',	'MZ',	'SK');
INSERT INTO @tbl VALUES ('Podlaskie'            ,	     'Sokolski',	'PD',	'SO');
INSERT INTO @tbl VALUES ('Pomorskie'            ,	     'Sopot',	'PM',	'SO');
INSERT INTO @tbl VALUES ('Slaskie'            ,	     'Sosnowiec',	'SL',	'SO');
INSERT INTO @tbl VALUES ('Dolnoslaskie'            ,	     'Sredzki',	'DS',	'SR');
INSERT INTO @tbl VALUES ('Wielkopolskie'            ,	     'Sredzki',	'WP',	'SD');
INSERT INTO @tbl VALUES ('Wielkopolskie'            ,	     'Sremski',	'WP',	'SR');
INSERT INTO @tbl VALUES ('Podkarpackie'            ,	     'Stalowowolski',	'PK',	'SW');
INSERT INTO @tbl VALUES ('Swietokrzyskie'            ,	     'Starachowicki',	'SK',	'ST');
INSERT INTO @tbl VALUES ('Zachodniopomorskie'            ,	     'Stargardzki',	'ZP',	'SG');
INSERT INTO @tbl VALUES ('Pomorskie'            ,	     'Starogardzki',	'PM',	'ST');
INSERT INTO @tbl VALUES ('Swietokrzyskie'            ,	     'Staszowski',	'SK',	'SS');
INSERT INTO @tbl VALUES ('Opolskie'            ,	     'Strzelecki',	'OP',	'ST');
INSERT INTO @tbl VALUES ('Lubuskie'            ,	     'Strzelecko-drezdenecki',	'LB',	'ST');
INSERT INTO @tbl VALUES ('Dolnoslaskie'            ,	     'Strzelinski',	'DS',	'ST');
INSERT INTO @tbl VALUES ('Podkarpackie'            ,	     'Strzyzowski',	'PK',	'ST');
INSERT INTO @tbl VALUES ('Lubuskie'            ,	     'Sulecinski',	'LB',	'SU');
INSERT INTO @tbl VALUES ('Malopolskie'            ,	     'Suski',	'MA',	'SU');
INSERT INTO @tbl VALUES ('Podlaskie'            ,	     'Suwalki',	'PD',	'SM');
INSERT INTO @tbl VALUES ('Podlaskie'            ,	     'Suwalski',	'PD',	'SU');
INSERT INTO @tbl VALUES ('Dolnoslaskie'            ,	     'Swidnicki',	'DS',	'SW');
INSERT INTO @tbl VALUES ('Lubelskie'            ,	     'Swidnicki',	'LU',	'SW');
INSERT INTO @tbl VALUES ('Zachodniopomorskie'            ,	     'Swidwinski',	'ZP',	'SW');
INSERT INTO @tbl VALUES ('Lubuskie'            ,	     'Swiebodzinski',	'LB',	'SW');
INSERT INTO @tbl VALUES ('Kujawsko-pomorskie'            ,	     'Swiecki',	'KP',	'SW');
INSERT INTO @tbl VALUES ('Slaskie'            ,	     'Swietochlowice',	'SL',	'SW');
INSERT INTO @tbl VALUES ('Zachodniopomorskie'            ,	     'Swinoujscie',	'ZP',	'SJ');
INSERT INTO @tbl VALUES ('Wielkopolskie'            ,	     'Szamotulski',	'WP',	'SZ');
INSERT INTO @tbl VALUES ('Zachodniopomorskie'            ,	     'Szczecin',	'ZP',	'SM');
INSERT INTO @tbl VALUES ('Zachodniopomorskie'            ,	     'Szczecinecki',	'ZP',	'SZ');
INSERT INTO @tbl VALUES ('Warminsko-mazurskie'            ,	     'Szczycienski',	'WN',	'SZ');
INSERT INTO @tbl VALUES ('Pomorskie'            ,	     'Sztumski',	'PM',	'SZ');
INSERT INTO @tbl VALUES ('Mazowieckie'            ,	     'Szydlowiecki',	'MZ',	'SZ');
INSERT INTO @tbl VALUES ('Podkarpackie'            ,	     'Tarnobrzeg',	'PK',	'TM');
INSERT INTO @tbl VALUES ('Podkarpackie'            ,	     'Tarnobrzeski',	'PK',	'TA');
INSERT INTO @tbl VALUES ('Slaskie'            ,	     'Tarnogorski',	'SL',	'TA');
INSERT INTO @tbl VALUES ('Malopolskie'            ,	     'Tarnow',	'MA',	'TM');
INSERT INTO @tbl VALUES ('Malopolskie'            ,	     'Tarnowski',	'MA',	'TA');
INSERT INTO @tbl VALUES ('Malopolskie'            ,	     'Tatrzanski',	'MA',	'TT');
INSERT INTO @tbl VALUES ('Pomorskie'            ,	     'Tczewski',	'PM',	'TC');
INSERT INTO @tbl VALUES ('Lubelskie'            ,	     'Tomaszowski',	'LU',	'TO');
INSERT INTO @tbl VALUES ('Lodzkie'            ,	     'Tomaszowski',	'LD',	'TO');
INSERT INTO @tbl VALUES ('Kujawsko-pomorskie'            ,	     'Torun',	'KP',	'TM');
INSERT INTO @tbl VALUES ('Kujawsko-pomorskie'            ,	     'Torunski',	'KP',	'TO');
INSERT INTO @tbl VALUES ('Dolnoslaskie'            ,	     'Trzebnicki',	'DS',	'TR');
INSERT INTO @tbl VALUES ('Kujawsko-pomorskie'            ,	     'Tucholski',	'KP',	'TU');
INSERT INTO @tbl VALUES ('Wielkopolskie'            ,	     'Turecki',	'WP',	'TU');
INSERT INTO @tbl VALUES ('Slaskie'            ,	     'Tychy',	'SL',	'TM');
INSERT INTO @tbl VALUES ('Kujawsko-pomorskie'            ,	     'Wabrzeski',	'KP',	'WA');
INSERT INTO @tbl VALUES ('Malopolskie'            ,	     'Wadowicki',	'MA',	'WA');
INSERT INTO @tbl VALUES ('Wielkopolskie'            ,	     'Wagrowiecki',	'WP',	'WA');
INSERT INTO @tbl VALUES ('Dolnoslaskie'            ,	     'Walbrzyski',	'DS',	'WB');
INSERT INTO @tbl VALUES ('Zachodniopomorskie'            ,	     'Walecki',	'ZP',	'WA');
INSERT INTO @tbl VALUES ('Mazowieckie'            ,	     'Warszawa',	'MZ',	'WA');
INSERT INTO @tbl VALUES ('Mazowieckie'            ,	     'Warszawski Zachodni',	'MZ',	'WZ');
INSERT INTO @tbl VALUES ('Warminsko-mazurskie'            ,	     'Wegorzewski',	'WN',	'WG');
INSERT INTO @tbl VALUES ('Mazowieckie'            ,	     'Wegrowski',	'MZ',	'WE');
INSERT INTO @tbl VALUES ('Pomorskie'            ,	     'Wejherowski',	'PM',	'WE');
INSERT INTO @tbl VALUES ('Malopolskie'            ,	     'Wielicki',	'MA',	'WI');
INSERT INTO @tbl VALUES ('Lodzkie'            ,	     'Wielunski',	'LD',	'WL');
INSERT INTO @tbl VALUES ('Lodzkie'            ,	     'Wieruszowski',	'LD',	'WR');
INSERT INTO @tbl VALUES ('Kujawsko-pomorskie'            ,	     'Wloclawek',	'KP',	'WM');
INSERT INTO @tbl VALUES ('Kujawsko-pomorskie'            ,	     'Wloclawski',	'KP',	'WL');
INSERT INTO @tbl VALUES ('Lubelskie'            ,	     'Wlodawski',	'LU',	'WL');
INSERT INTO @tbl VALUES ('Swietokrzyskie'            ,	     'Wloszczowski',	'SK',	'WL');
INSERT INTO @tbl VALUES ('Slaskie'            ,	     'Wodzislawski',	'SL',	'WO');
INSERT INTO @tbl VALUES ('Mazowieckie'            ,	     'Wolominski',	'MZ',	'WO');
INSERT INTO @tbl VALUES ('Dolnoslaskie'            ,	     'Wolowski',	'DS',	'WO');
INSERT INTO @tbl VALUES ('Wielkopolskie'            ,	     'Wolsztynski',	'WP',	'WO');
INSERT INTO @tbl VALUES ('Dolnoslaskie'            ,	     'Wroclaw',	'DS',	'WR');
INSERT INTO @tbl VALUES ('Dolnoslaskie'            ,	     'Wroclawski',	'DS',	'WC');
INSERT INTO @tbl VALUES ('Wielkopolskie'            ,	     'Wrzesinski',	'WP',	'WR');
INSERT INTO @tbl VALUES ('Lubuskie'            ,	     'Wschowski',	'LB',	'WS');
INSERT INTO @tbl VALUES ('Podlaskie'            ,	     'Wysokomazowiecki',	'PD',	'WY');
INSERT INTO @tbl VALUES ('Mazowieckie'            ,	     'Wyszkowski',	'MZ',	'WY');
INSERT INTO @tbl VALUES ('Dolnoslaskie'            ,	     'Zabkowicki',	'DS',	'ZA');
INSERT INTO @tbl VALUES ('Slaskie'            ,	     'Zabrze',	'SL',	'ZM');
INSERT INTO @tbl VALUES ('Lubuskie'            ,	     'Zaganski',	'LB',	'ZA');
INSERT INTO @tbl VALUES ('Podlaskie'            ,	     'Zambrowski',	'PD',	'ZA');
INSERT INTO @tbl VALUES ('Lubelskie'            ,	     'Zamojski',	'LU',	'ZA');
INSERT INTO @tbl VALUES ('Lubelskie'            ,	     'Zamosc',	'LU',	'ZM');
INSERT INTO @tbl VALUES ('Lubuskie'            ,	     'Zarski',	'LB',	'ZR');
INSERT INTO @tbl VALUES ('Slaskie'            ,	     'Zawiercianski',	'SL',	'ZA');
INSERT INTO @tbl VALUES ('Lodzkie'            ,	     'Zdunskowolski',	'LD',	'ZD');
INSERT INTO @tbl VALUES ('Lodzkie'            ,	     'Zgierski',	'LD',	'ZG');
INSERT INTO @tbl VALUES ('Dolnoslaskie'            ,	     'Zgorzelecki',	'DS',	'ZG');
INSERT INTO @tbl VALUES ('Lubuskie'            ,	     'Zielona Gora',	'LB',	'ZM');
INSERT INTO @tbl VALUES ('Lubuskie'            ,	     'Zielonogorski',	'LB',	'ZG');
INSERT INTO @tbl VALUES ('Dolnoslaskie'            ,	     'Zlotoryjski',	'DS',	'ZL');
INSERT INTO @tbl VALUES ('Wielkopolskie'            ,	     'Zlotowski',	'WP',	'ZL');
INSERT INTO @tbl VALUES ('Kujawsko-pomorskie'            ,	     'Zninski',	'KP',	'ZN');
INSERT INTO @tbl VALUES ('Slaskie'            ,	     'Zory',	'SL',	'ZO');
INSERT INTO @tbl VALUES ('Mazowieckie'            ,	     'Zurominski',	'MZ',	'ZU');
INSERT INTO @tbl VALUES ('Mazowieckie'            ,	     'Zwolenski',	'MZ',	'ZW');
INSERT INTO @tbl VALUES ('Mazowieckie'            ,	     'Zyrardowski',	'MZ',	'ZY');
INSERT INTO @tbl VALUES ('Slaskie'            ,	     'Zywiecki',	'SL',	'ZY');

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

