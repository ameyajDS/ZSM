
/* ==================================================================================
    	Source File		:	setup_albania_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Albania are set-up
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
WHERE	country_nm	=	'Albania';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Albania not found', 16, 1);
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

INSERT INTO @tbl VALUES ('Vlore'            ,	     'Aliko',	'VR',	'AL');
INSERT INTO @tbl VALUES ('Fier'            ,	     'Allkaj',	'FI',	'AL');
INSERT INTO @tbl VALUES ('Shkoder'            ,	     'Ana e Malit',	'SD',	'AM');
INSERT INTO @tbl VALUES ('Gjirokaster'            ,	     'Antigone',	'GK',	'AN');
INSERT INTO @tbl VALUES ('Fier'            ,	     'Aranitas',	'FI',	'AR');
INSERT INTO @tbl VALUES ('Vlore'            ,	     'Armen',	'VR',	'AR');
INSERT INTO @tbl VALUES ('Diber'            ,	     'Arras',	'DB',	'AR');
INSERT INTO @tbl VALUES ('Kukes'            ,	     'Arren',	'KK',	'AR');
INSERT INTO @tbl VALUES ('Kukes'            ,	     'Bajram Curri',	'KK',	'BC');
INSERT INTO @tbl VALUES ('Tirane'            ,	     'Baldushk',	'TI',	'BA');
INSERT INTO @tbl VALUES ('Gjirokaster'            ,	     'Ballaban',	'GK',	'BA');
INSERT INTO @tbl VALUES ('Fier'            ,	     'Ballagat',	'FI',	'BG');
INSERT INTO @tbl VALUES ('Lezhe'            ,	     'Balldren i Ri',	'LZ',	'BA');
INSERT INTO @tbl VALUES ('Fier'            ,	     'Ballsh',	'FI',	'BS');
INSERT INTO @tbl VALUES ('Shkoder'            ,	     'Barbullush',	'SD',	'BA');
INSERT INTO @tbl VALUES ('Korce'            ,	     'Barmash',	'KE',	'BA');
INSERT INTO @tbl VALUES ('Diber'            ,	     'Baz',	'DB',	'BA');
INSERT INTO @tbl VALUES ('Elbasan'            ,	     'Belsh',	'EB',	'BE');
INSERT INTO @tbl VALUES ('Berat'            ,	     'Berat',	'BE',	'BE');
INSERT INTO @tbl VALUES ('Shkoder'            ,	     'Berdice',	'SD',	'BE');
INSERT INTO @tbl VALUES ('Tirane'            ,	     'Berxulle',	'TI',	'BX');
INSERT INTO @tbl VALUES ('Tirane'            ,	     'Berzhite',	'TI',	'BZ');
INSERT INTO @tbl VALUES ('Kukes'            ,	     'Bicaj',	'KK',	'BI');
INSERT INTO @tbl VALUES ('Korce'            ,	     'Bilisht',	'KE',	'BI');
INSERT INTO @tbl VALUES ('Shkoder'            ,	     'Blerim',	'SD',	'BL');
INSERT INTO @tbl VALUES ('Lezhe'            ,	     'Blinisht',	'LZ',	'BL');
INSERT INTO @tbl VALUES ('Berat'            ,	     'Bogove',	'BE',	'BO');
INSERT INTO @tbl VALUES ('Elbasan'            ,	     'Bradashesh',	'EB',	'BR');
INSERT INTO @tbl VALUES ('Vlore'            ,	     'Brataj',	'VR',	'BR');
INSERT INTO @tbl VALUES ('Durres'            ,	     'Bubq',	'DU',	'BU');
INSERT INTO @tbl VALUES ('Fier'            ,	     'Bubullime',	'FI',	'BU');
INSERT INTO @tbl VALUES ('Korce'            ,	     'Bucimas',	'KE',	'BU');
INSERT INTO @tbl VALUES ('Kukes'            ,	     'Bujan',	'KK',	'BJ');
INSERT INTO @tbl VALUES ('Diber'            ,	     'Bulqize',	'DB',	'BQ');
INSERT INTO @tbl VALUES ('Diber'            ,	     'Burrel',	'DB',	'BR');
INSERT INTO @tbl VALUES ('Shkoder'            ,	     'Bushat',	'SD',	'BU');
INSERT INTO @tbl VALUES ('Kukes'            ,	     'Bushtrice',	'KK',	'BT');
INSERT INTO @tbl VALUES ('Gjirokaster'            ,	     'Buz',	'GK',	'BU');
INSERT INTO @tbl VALUES ('Kukes'            ,	     'Bytyc',	'KK',	'BY');
INSERT INTO @tbl VALUES ('Fier'            ,	     'Cakran',	'FI',	'CA');
INSERT INTO @tbl VALUES ('Gjirokaster'            ,	     'Carshove',	'GK',	'CA');
INSERT INTO @tbl VALUES ('Berat'            ,	     'Cepan',	'BE',	'CE');
INSERT INTO @tbl VALUES ('Gjirokaster'            ,	     'Cepo',	'GK',	'CE');
INSERT INTO @tbl VALUES ('Korce'            ,	     'Cerrave',	'KE',	'CE');
INSERT INTO @tbl VALUES ('Elbasan'            ,	     'Cerrik',	'EB',	'CE');
INSERT INTO @tbl VALUES ('Korce'            ,	     'Clirim',	'KE',	'CL');
INSERT INTO @tbl VALUES ('Berat'            ,	     'Corovode',	'BE',	'CO');
INSERT INTO @tbl VALUES ('Durres'            ,	     'Cudhi',	'DU',	'CU');
INSERT INTO @tbl VALUES ('Berat'            ,	     'Cukalat',	'BE',	'CU');
INSERT INTO @tbl VALUES ('Lezhe'            ,	     'Dajc (Lezhe)',	'LZ',	'DA');
INSERT INTO @tbl VALUES ('Shkoder'            ,	     'Dajc (Shkoder)',	'SD',	'DA');
INSERT INTO @tbl VALUES ('Tirane'            ,	     'Dajt',	'TI',	'DA');
INSERT INTO @tbl VALUES ('Korce'            ,	     'Dardhas',	'KE',	'DA');
INSERT INTO @tbl VALUES ('Vlore'            ,	     'Delvine',	'VR',	'DE');
INSERT INTO @tbl VALUES ('Diber'            ,	     'Derjan',	'DB',	'DE');
INSERT INTO @tbl VALUES ('Fier'            ,	     'Dermenas',	'FI',	'DE');
INSERT INTO @tbl VALUES ('Vlore'            ,	     'Dhiver',	'VR',	'DH');
INSERT INTO @tbl VALUES ('Gjirokaster'            ,	     'Dishnice',	'GK',	'DI');
INSERT INTO @tbl VALUES ('Fier'            ,	     'Divjake',	'FI',	'DI');
INSERT INTO @tbl VALUES ('Korce'            ,	     'Drenove',	'KE',	'DR');
INSERT INTO @tbl VALUES ('Gjirokaster'            ,	     'Dropull i Poshtem',	'GK',	'DP');
INSERT INTO @tbl VALUES ('Gjirokaster'            ,	     'Dropull i Siperm',	'GK',	'DS');
INSERT INTO @tbl VALUES ('Durres'            ,	     'Durres',	'DU',	'DU');
INSERT INTO @tbl VALUES ('Fier'            ,	     'Dushk',	'FI',	'DU');
INSERT INTO @tbl VALUES ('Elbasan'            ,	     'Elbasan',	'EB',	'EL');
INSERT INTO @tbl VALUES ('Korce'            ,	     'Erseke',	'KE',	'ER');
INSERT INTO @tbl VALUES ('Kukes'            ,	     'Fajza',	'KK',	'FA');
INSERT INTO @tbl VALUES ('Lezhe'            ,	     'Fan',	'LZ',	'FA');
INSERT INTO @tbl VALUES ('Tirane'            ,	     'Farke',	'TI',	'SA');
INSERT INTO @tbl VALUES ('Fier'            ,	     'Fier',	'FI',	'FI');
INSERT INTO @tbl VALUES ('Fier'            ,	     'Fier Shegan',	'FI',	'FS');
INSERT INTO @tbl VALUES ('Elbasan'            ,	     'Fierze (Elbasan)',	'EB',	'FI');
INSERT INTO @tbl VALUES ('Shkoder'            ,	     'Fierze (Puke)',	'SD',	'FI');
INSERT INTO @tbl VALUES ('Kukes'            ,	     'Fierze (Tropoje)',	'KK',	'FI');
INSERT INTO @tbl VALUES ('Vlore'            ,	     'Finiq',	'VR',	'FI');
INSERT INTO @tbl VALUES ('Fier'            ,	     'Frakull',	'FI',	'FK');
INSERT INTO @tbl VALUES ('Gjirokaster'            ,	     'Frasher',	'GK',	'FR');
INSERT INTO @tbl VALUES ('Fier'            ,	     'Fratar',	'FI',	'FT');
INSERT INTO @tbl VALUES ('Kukes'            ,	     'Fshat Tropoje',	'KK',	'TR');
INSERT INTO @tbl VALUES ('Elbasan'            ,	     'Funare',	'EB',	'FU');
INSERT INTO @tbl VALUES ('Shkoder'            ,	     'Fushe Arrez',	'SD',	'FA');
INSERT INTO @tbl VALUES ('Diber'            ,	     'Fushe Bulqize',	'DB',	'FB');
INSERT INTO @tbl VALUES ('Diber'            ,	     'Fushe Cidhen',	'DB',	'FC');
INSERT INTO @tbl VALUES ('Durres'            ,	     'Fushe Kruje',	'DU',	'FK');
INSERT INTO @tbl VALUES ('Lezhe'            ,	     'Fushe Kuqe',	'LZ',	'FK');
INSERT INTO @tbl VALUES ('Shkoder'            ,	     'Gjegjan',	'SD',	'GJ');
INSERT INTO @tbl VALUES ('Durres'            ,	     'Gjepalaj',	'DU',	'GJ');
INSERT INTO @tbl VALUES ('Berat'            ,	     'Gjerbes',	'BE',	'GJ');
INSERT INTO @tbl VALUES ('Elbasan'            ,	     'Gjergjan',	'EB',	'GG');
INSERT INTO @tbl VALUES ('Kukes'            ,	     'Gjinaj',	'KK',	'GJ');
INSERT INTO @tbl VALUES ('Elbasan'            ,	     'Gjinar',	'EB',	'GN');
INSERT INTO @tbl VALUES ('Gjirokaster'            ,	     'Gjirokaster',	'GK',	'GJ');
INSERT INTO @tbl VALUES ('Elbasan'            ,	     'Gjocaj',	'EB',	'GJ');
INSERT INTO @tbl VALUES ('Diber'            ,	     'Gjorice',	'DB',	'GJ');
INSERT INTO @tbl VALUES ('Kukes'            ,	     'Golaj',	'KK',	'GO');
INSERT INTO @tbl VALUES ('Tirane'            ,	     'Golem (Kavaje)',	'TI',	'GL');
INSERT INTO @tbl VALUES ('Fier'            ,	     'Golem (Lushnje)',	'FI',	'GO');
INSERT INTO @tbl VALUES ('Korce'            ,	     'Gore',	'KE',	'GO');
INSERT INTO @tbl VALUES ('Tirane'            ,	     'Gose',	'TI',	'GS');
INSERT INTO @tbl VALUES ('Elbasan'            ,	     'Gostime',	'EB',	'GS');
INSERT INTO @tbl VALUES ('Fier'            ,	     'Grabian',	'FI',	'GB');
INSERT INTO @tbl VALUES ('Elbasan'            ,	     'Gracen',	'EB',	'GR');
INSERT INTO @tbl VALUES ('Fier'            ,	     'Gradishte',	'FI',	'GD');
INSERT INTO @tbl VALUES ('Elbasan'            ,	     'Gramsh',	'EB',	'GM');
INSERT INTO @tbl VALUES ('Elbasan'            ,	     'Grekan',	'EB',	'GK');
INSERT INTO @tbl VALUES ('Fier'            ,	     'Greshice',	'FI',	'GC');
INSERT INTO @tbl VALUES ('Shkoder'            ,	     'Gruemire',	'SD',	'GR');
INSERT INTO @tbl VALUES ('Kukes'            ,	     'Gryke-Caje',	'KK',	'GC');
INSERT INTO @tbl VALUES ('Shkoder'            ,	     'Gur i Zi',	'SD',	'GZ');
INSERT INTO @tbl VALUES ('Diber'            ,	     'Gurre',	'DB',	'GU');
INSERT INTO @tbl VALUES ('Shkoder'            ,	     'Hajmel',	'SD',	'HA');
INSERT INTO @tbl VALUES ('Fier'            ,	     'Hekal',	'FI',	'HE');
INSERT INTO @tbl VALUES ('Tirane'            ,	     'Helmes',	'TI',	'HE');
INSERT INTO @tbl VALUES ('Vlore'            ,	     'Himare',	'VR',	'HI');
INSERT INTO @tbl VALUES ('Korce'            ,	     'Hocisht',	'KE',	'HO');
INSERT INTO @tbl VALUES ('Vlore'            ,	     'Hore Vranisht',	'VR',	'HV');
INSERT INTO @tbl VALUES ('Elbasan'            ,	     'Hotolisht',	'EB',	'HO');
INSERT INTO @tbl VALUES ('Fier'            ,	     'Hysgjokaj',	'FI',	'HY');
INSERT INTO @tbl VALUES ('Shkoder'            ,	     'Iballe',	'SD',	'IB');
INSERT INTO @tbl VALUES ('Durres'            ,	     'Ishem',	'DU',	'IS');
INSERT INTO @tbl VALUES ('Lezhe'            ,	     'Kacinar',	'LZ',	'KR');
INSERT INTO @tbl VALUES ('Elbasan'            ,	     'Kajan',	'EB',	'KJ');
INSERT INTO @tbl VALUES ('Diber'            ,	     'Kala e Dodes',	'DB',	'KD');
INSERT INTO @tbl VALUES ('Kukes'            ,	     'Kalis',	'KK',	'KA');
INSERT INTO @tbl VALUES ('Lezhe'            ,	     'Kallmet',	'LZ',	'KL');
INSERT INTO @tbl VALUES ('Tirane'            ,	     'Kamez',	'TI',	'KZ');
INSERT INTO @tbl VALUES ('Fier'            ,	     'Karbunare',	'FI',	'KA');
INSERT INTO @tbl VALUES ('Elbasan'            ,	     'Karine',	'EB',	'KR');
INSERT INTO @tbl VALUES ('Tirane'            ,	     'Kashar',	'TI',	'KS');
INSERT INTO @tbl VALUES ('Shkoder'            ,	     'Kastrat',	'SD',	'KA');
INSERT INTO @tbl VALUES ('Diber'            ,	     'Kastriot',	'DB',	'KA');
INSERT INTO @tbl VALUES ('Durres'            ,	     'Katund i Ri',	'DU',	'KR');
INSERT INTO @tbl VALUES ('Tirane'            ,	     'Kavaje',	'TI',	'KV');
INSERT INTO @tbl VALUES ('Gjirokaster'            ,	     'Kelcyre',	'GK',	'KE');
INSERT INTO @tbl VALUES ('Shkoder'            ,	     'Kelmend',	'SD',	'KE');
INSERT INTO @tbl VALUES ('Diber'            ,	     'Klos (Diber)',	'DB',	'KL');
INSERT INTO @tbl VALUES ('Elbasan'            ,	     'Klos (Elbasan)',	'EB',	'KL');
INSERT INTO @tbl VALUES ('Durres'            ,	     'Koder Thumane',	'DU',	'TH');
INSERT INTO @tbl VALUES ('Elbasan'            ,	     'Kodovjat',	'EB',	'KD');
INSERT INTO @tbl VALUES ('Fier'            ,	     'Kolonje',	'FI',	'KO');
INSERT INTO @tbl VALUES ('Kukes'            ,	     'Kolsh (Kukes)',	'KK',	'KO');
INSERT INTO @tbl VALUES ('Lezhe'            ,	     'Kolsh (Lezhe)',	'LZ',	'KO');
INSERT INTO @tbl VALUES ('Diber'            ,	     'Komsi',	'DB',	'KO');
INSERT INTO @tbl VALUES ('Vlore'            ,	     'Konispol',	'VR',	'KP');
INSERT INTO @tbl VALUES ('Shkoder'            ,	     'Koplik',	'SD',	'KO');
INSERT INTO @tbl VALUES ('Korce'            ,	     'Korce',	'KE',	'KO');
INSERT INTO @tbl VALUES ('Vlore'            ,	     'Kote',	'VR',	'KT');
INSERT INTO @tbl VALUES ('Berat'            ,	     'Kozare',	'BE',	'KZ');
INSERT INTO @tbl VALUES ('Gjirokaster'            ,	     'Krahes',	'GK',	'KR');
INSERT INTO @tbl VALUES ('Tirane'            ,	     'Krrabe',	'TI',	'KB');
INSERT INTO @tbl VALUES ('Durres'            ,	     'Kruje',	'DU',	'KJ');
INSERT INTO @tbl VALUES ('Kukes'            ,	     'Krume',	'KK',	'KR');
INSERT INTO @tbl VALUES ('Fier'            ,	     'Krutje',	'FI',	'KR');
INSERT INTO @tbl VALUES ('Tirane'            ,	     'Kryevidh',	'TI',	'KR');
INSERT INTO @tbl VALUES ('Vlore'            ,	     'Ksamil',	'VR',	'KS');
INSERT INTO @tbl VALUES ('Lezhe'            ,	     'Kthelle',	'LZ',	'KT');
INSERT INTO @tbl VALUES ('Berat'            ,	     'Kucove',	'BE',	'KC');
INSERT INTO @tbl VALUES ('Kukes'            ,	     'Kukes',	'KK',	'KU');
INSERT INTO @tbl VALUES ('Elbasan'            ,	     'Kukur',	'EB',	'KK');
INSERT INTO @tbl VALUES ('Fier'            ,	     'Kuman',	'FI',	'KM');
INSERT INTO @tbl VALUES ('Fier'            ,	     'Kurjan',	'FI',	'KJ');
INSERT INTO @tbl VALUES ('Gjirokaster'            ,	     'Kurvelesh',	'GK',	'KU');
INSERT INTO @tbl VALUES ('Elbasan'            ,	     'Kushove',	'EB',	'KS');
INSERT INTO @tbl VALUES ('Berat'            ,	     'Kutalli',	'BE',	'KT');
INSERT INTO @tbl VALUES ('Fier'            ,	     'Kute',	'FI',	'KT');
INSERT INTO @tbl VALUES ('Elbasan'            ,	     'Labinot Fushe',	'EB',	'LF');
INSERT INTO @tbl VALUES ('Elbasan'            ,	     'Labinot Mal',	'EB',	'LM');
INSERT INTO @tbl VALUES ('Lezhe'            ,	     'Lac',	'LZ',	'LA');
INSERT INTO @tbl VALUES ('Gjirokaster'            ,	     'Lazarat',	'GK',	'LZ');
INSERT INTO @tbl VALUES ('Tirane'            ,	     'Lekaj',	'TI',	'LE');
INSERT INTO @tbl VALUES ('Korce'            ,	     'Lekas',	'KE',	'LE');
INSERT INTO @tbl VALUES ('Kukes'            ,	     'Lekbibaj',	'KK',	'LE');
INSERT INTO @tbl VALUES ('Elbasan'            ,	     'Lenie',	'EB',	'LE');
INSERT INTO @tbl VALUES ('Berat'            ,	     'Leshnje',	'BE',	'LE');
INSERT INTO @tbl VALUES ('Korce'            ,	     'Leskovik',	'KE',	'LB');
INSERT INTO @tbl VALUES ('Fier'            ,	     'Levan',	'FI',	'LE');
INSERT INTO @tbl VALUES ('Lezhe'            ,	     'Lezhe',	'LZ',	'LE');
INSERT INTO @tbl VALUES ('Fier'            ,	     'Libofshe',	'FI',	'LI');
INSERT INTO @tbl VALUES ('Gjirokaster'            ,	     'Libohove',	'GK',	'LB');
INSERT INTO @tbl VALUES ('Korce'            ,	     'Libonik',	'KE',	'LN');
INSERT INTO @tbl VALUES ('Elbasan'            ,	     'Librazhd',	'EB',	'LI');
INSERT INTO @tbl VALUES ('Korce'            ,	     'Liqenas',	'KE',	'LQ');
INSERT INTO @tbl VALUES ('Diber'            ,	     'Lis',	'DB',	'LS');
INSERT INTO @tbl VALUES ('Vlore'            ,	     'Livadhja',	'VR',	'LI');
INSERT INTO @tbl VALUES ('Kukes'            ,	     'Llugaj',	'KK',	'LL');
INSERT INTO @tbl VALUES ('Gjirokaster'            ,	     'Lopes',	'GK',	'LP');
INSERT INTO @tbl VALUES ('Gjirokaster'            ,	     'Luftinje',	'GK',	'LF');
INSERT INTO @tbl VALUES ('Vlore'            ,	     'Lukove',	'VR',	'LU');
INSERT INTO @tbl VALUES ('Berat'            ,	     'Lumas',	'BE',	'LU');
INSERT INTO @tbl VALUES ('Elbasan'            ,	     'Lunik',	'EB',	'LU');
INSERT INTO @tbl VALUES ('Gjirokaster'            ,	     'Lunxheri',	'GK',	'LX');
INSERT INTO @tbl VALUES ('Diber'            ,	     'Lure',	'DB',	'LR');
INSERT INTO @tbl VALUES ('Fier'            ,	     'Lushnje',	'FI',	'LU');
INSERT INTO @tbl VALUES ('Tirane'            ,	     'Luz i Vogel',	'TI',	'LV');
INSERT INTO @tbl VALUES ('Diber'            ,	     'Luzni',	'DB',	'LZ');
INSERT INTO @tbl VALUES ('Diber'            ,	     'Macukull',	'DB',	'MC');
INSERT INTO @tbl VALUES ('Korce'            ,	     'Maliq',	'KE',	'MA');
INSERT INTO @tbl VALUES ('Kukes'            ,	     'Malzi',	'KK',	'MZ');
INSERT INTO @tbl VALUES ('Durres'            ,	     'Maminas',	'DU',	'MM');
INSERT INTO @tbl VALUES ('Lezhe'            ,	     'Mamurras',	'LZ',	'MA');
INSERT INTO @tbl VALUES ('Durres'            ,	     'Manez',	'DU',	'MZ');
INSERT INTO @tbl VALUES ('Diber'            ,	     'Maqellare',	'DB',	'MQ');
INSERT INTO @tbl VALUES ('Kukes'            ,	     'Margegaj',	'KK',	'MG');
INSERT INTO @tbl VALUES ('Vlore'            ,	     'Markat',	'VR',	'MA');
INSERT INTO @tbl VALUES ('Diber'            ,	     'Martanesh',	'DB',	'MT');
INSERT INTO @tbl VALUES ('Fier'            ,	     'Mbrostar Ura',	'FI',	'MU');
INSERT INTO @tbl VALUES ('Diber'            ,	     'Melan',	'DB',	'ME');
INSERT INTO @tbl VALUES ('Gjirokaster'            ,	     'Memaliaj',	'GK',	'MB');
INSERT INTO @tbl VALUES ('Gjirokaster'            ,	     'Memaliaj Fshat',	'GK',	'MK');
INSERT INTO @tbl VALUES ('Vlore'            ,	     'Mesopotam',	'VR',	'ME');
INSERT INTO @tbl VALUES ('Lezhe'            ,	     'Milot',	'LZ',	'MI');
INSERT INTO @tbl VALUES ('Korce'            ,	     'Miras',	'KE',	'MI');
INSERT INTO @tbl VALUES ('Korce'            ,	     'Moglice',	'KE',	'MG');
INSERT INTO @tbl VALUES ('Korce'            ,	     'Mollaj',	'KE',	'MJ');
INSERT INTO @tbl VALUES ('Elbasan'            ,	     'Mollas (Elbasan)',	'EB',	'MO');
INSERT INTO @tbl VALUES ('Korce'            ,	     'Mollas (Kolonje)',	'KE',	'MS');
INSERT INTO @tbl VALUES ('Diber'            ,	     'Muhurr',	'DB',	'MU');
INSERT INTO @tbl VALUES ('Tirane'            ,	     'Ndroq',	'TI',	'ND');
INSERT INTO @tbl VALUES ('Fier'            ,	     'Ngracan',	'FI',	'NG');
INSERT INTO @tbl VALUES ('Durres'            ,	     'Nikel',	'DU',	'NI');
INSERT INTO @tbl VALUES ('Korce'            ,	     'Novosele (Kolonje)',	'KE',	'NO');
INSERT INTO @tbl VALUES ('Vlore'            ,	     'Novosele (Vlore)',	'VR',	'NO');
INSERT INTO @tbl VALUES ('Gjirokaster'            ,	     'Odrie',	'GK',	'OD');
INSERT INTO @tbl VALUES ('Elbasan'            ,	     'Orenje',	'EB',	'OR');
INSERT INTO @tbl VALUES ('Vlore'            ,	     'Orikum',	'VR',	'OR');
INSERT INTO @tbl VALUES ('Lezhe'            ,	     'Orosh',	'LZ',	'OR');
INSERT INTO @tbl VALUES ('Diber'            ,	     'Ostren',	'DB',	'OS');
INSERT INTO @tbl VALUES ('Berat'            ,	     'Otllak',	'BE',	'OT');
INSERT INTO @tbl VALUES ('Elbasan'            ,	     'Pajove',	'EB',	'PJ');
INSERT INTO @tbl VALUES ('Elbasan'            ,	     'Paper',	'EB',	'PP');
INSERT INTO @tbl VALUES ('Tirane'            ,	     'Paskuqan',	'TI',	'PA');
INSERT INTO @tbl VALUES ('Fier'            ,	     'Patos',	'FI',	'PA');
INSERT INTO @tbl VALUES ('Elbasan'            ,	     'Peqin',	'EB',	'PQ');
INSERT INTO @tbl VALUES ('Gjirokaster'            ,	     'Permet',	'GK',	'PM');
INSERT INTO @tbl VALUES ('Berat'            ,	     'Perondi',	'BE',	'PE');
INSERT INTO @tbl VALUES ('Elbasan'            ,	     'Perparim',	'EB',	'PR');
INSERT INTO @tbl VALUES ('Elbasan'            ,	     'Perrenjas',	'EB',	'PE');
INSERT INTO @tbl VALUES ('Diber'            ,	     'Peshkopi',	'DB',	'PE');
INSERT INTO @tbl VALUES ('Gjirokaster'            ,	     'Petran',	'GK',	'PT');
INSERT INTO @tbl VALUES ('Tirane'            ,	     'Petrele',	'TI',	'PT');
INSERT INTO @tbl VALUES ('Tirane'            ,	     'Peze',	'TI',	'PE');
INSERT INTO @tbl VALUES ('Gjirokaster'            ,	     'Picar',	'GK',	'PC');
INSERT INTO @tbl VALUES ('Korce'            ,	     'Pirg',	'KE',	'PI');
INSERT INTO @tbl VALUES ('Elbasan'            ,	     'Pishaj',	'EB',	'PI');
INSERT INTO @tbl VALUES ('Gjirokaster'            ,	     'Pogon',	'GK',	'PG');
INSERT INTO @tbl VALUES ('Korce'            ,	     'Pogradec',	'KE',	'PD');
INSERT INTO @tbl VALUES ('Korce'            ,	     'Pojan',	'KE',	'PJ');
INSERT INTO @tbl VALUES ('Berat'            ,	     'Polican',	'BE',	'PL');
INSERT INTO @tbl VALUES ('Elbasan'            ,	     'Polis',	'EB',	'PL');
INSERT INTO @tbl VALUES ('Elbasan'            ,	     'Porocan',	'EB',	'PC');
INSERT INTO @tbl VALUES ('Fier'            ,	     'Portez',	'FI',	'PO');
INSERT INTO @tbl VALUES ('Berat'            ,	     'Poshnje',	'BE',	'PS');
INSERT INTO @tbl VALUES ('Shkoder'            ,	     'Postribe',	'SD',	'PO');
INSERT INTO @tbl VALUES ('Berat'            ,	     'Potom',	'BE',	'PT');
INSERT INTO @tbl VALUES ('Tirane'            ,	     'Preze',	'TI',	'PR');
INSERT INTO @tbl VALUES ('Korce'            ,	     'Proger',	'KE',	'PR');
INSERT INTO @tbl VALUES ('Korce'            ,	     'Proptisht',	'KE',	'PT');
INSERT INTO @tbl VALUES ('Shkoder'            ,	     'Puke',	'SD',	'PK');
INSERT INTO @tbl VALUES ('Shkoder'            ,	     'Pult',	'SD',	'PL');
INSERT INTO @tbl VALUES ('Shkoder'            ,	     'Qafe Mali',	'SD',	'QM');
INSERT INTO @tbl VALUES ('Shkoder'            ,	     'Qelez',	'SD',	'QZ');
INSERT INTO @tbl VALUES ('Berat'            ,	     'Qender (Berat)',	'BE',	'QE');
INSERT INTO @tbl VALUES ('Korce'            ,	     'Qender Bilisht',	'KE',	'BQ');
INSERT INTO @tbl VALUES ('Korce'            ,	     'Qender Bulgarec',	'KE',	'QK');
INSERT INTO @tbl VALUES ('Korce'            ,	     'Qender Erseke',	'KE',	'QE');
INSERT INTO @tbl VALUES ('Fier'            ,	     'Qender (Fier)',	'FI',	'QF');
INSERT INTO @tbl VALUES ('Gjirokaster'            ,	     'Qender (Gjirokaster)',	'GK',	'QG');
INSERT INTO @tbl VALUES ('Shkoder'            ,	     'Qender Koplik',	'SD',	'QD');
INSERT INTO @tbl VALUES ('Korce'            ,	     'Qender Leskovik',	'KE',	'LK');
INSERT INTO @tbl VALUES ('Elbasan'            ,	     'Qender Librazhd',	'EB',	'QE');
INSERT INTO @tbl VALUES ('Fier'            ,	     'Qender (Mallakaster)',	'FI',	'QM');
INSERT INTO @tbl VALUES ('Gjirokaster'            ,	     'Qender Piskove',	'GK',	'QP');
INSERT INTO @tbl VALUES ('Gjirokaster'            ,	     'Qender Tepelene',	'GK',	'QT');
INSERT INTO @tbl VALUES ('Diber'            ,	     'Qender Tomin',	'DB',	'TO');
INSERT INTO @tbl VALUES ('Vlore'            ,	     'Qender (Vlore)',	'VR',	'QE');
INSERT INTO @tbl VALUES ('Shkoder'            ,	     'Qerret',	'SD',	'QT');
INSERT INTO @tbl VALUES ('Gjirokaster'            ,	     'Qesarat',	'GK',	'QS');
INSERT INTO @tbl VALUES ('Elbasan'            ,	     'Qukes',	'EB',	'QU');
INSERT INTO @tbl VALUES ('Fier'            ,	     'Remas',	'FI',	'RE');
INSERT INTO @tbl VALUES ('Berat'            ,	     'Roshnik',	'BE',	'RO');
INSERT INTO @tbl VALUES ('Fier'            ,	     'Roskovec',	'FI',	'RO');
INSERT INTO @tbl VALUES ('Elbasan'            ,	     'Rrajce',	'EB',	'RJ');
INSERT INTO @tbl VALUES ('Shkoder'            ,	     'Rrape',	'SD',	'RP');
INSERT INTO @tbl VALUES ('Elbasan'            ,	     'Rrase',	'EB',	'RS');
INSERT INTO @tbl VALUES ('Durres'            ,	     'Rrashbull',	'DU',	'RR');
INSERT INTO @tbl VALUES ('Lezhe'            ,	     'Rreshen',	'LZ',	'RR');
INSERT INTO @tbl VALUES ('Shkoder'            ,	     'Rrethina',	'SD',	'RT');
INSERT INTO @tbl VALUES ('Tirane'            ,	     'Rrogozhine',	'TI',	'RR');
INSERT INTO @tbl VALUES ('Lezhe'            ,	     'Rubik',	'LZ',	'RU');
INSERT INTO @tbl VALUES ('Diber'            ,	     'Rukaj',	'DB',	'RU');
INSERT INTO @tbl VALUES ('Fier'            ,	     'Ruzhdie',	'FI',	'RU');
INSERT INTO @tbl VALUES ('Vlore'            ,	     'Sarande',	'VR',	'SA');
INSERT INTO @tbl VALUES ('Vlore'            ,	     'Selenice',	'VR',	'SL');
INSERT INTO @tbl VALUES ('Diber'            ,	     'Selishte',	'DB',	'SE');
INSERT INTO @tbl VALUES ('Fier'            ,	     'Selite (Mallakaster)',	'FI',	'SE');
INSERT INTO @tbl VALUES ('Lezhe'            ,	     'Selite (Mirdite)',	'LZ',	'SE');
INSERT INTO @tbl VALUES ('Vlore'            ,	     'Sevaster',	'VR',	'SV');
INSERT INTO @tbl VALUES ('Shkoder'            ,	     'Shale',	'SD',	'SL');
INSERT INTO @tbl VALUES ('Elbasan'            ,	     'Shales',	'EB',	'SL');
INSERT INTO @tbl VALUES ('Tirane'            ,	     'Shengjergj',	'TI',	'SH');
INSERT INTO @tbl VALUES ('Lezhe'            ,	     'Shengjin',	'LZ',	'SJ');
INSERT INTO @tbl VALUES ('Lezhe'            ,	     'Shenkoll',	'LZ',	'SK');
INSERT INTO @tbl VALUES ('Elbasan'            ,	     'Sheze',	'EB',	'SZ');
INSERT INTO @tbl VALUES ('Durres'            ,	     'Shijak',	'DU',	'SH');
INSERT INTO @tbl VALUES ('Elbasan'            ,	     'Shirgjan',	'EB',	'SG');
INSERT INTO @tbl VALUES ('Kukes'            ,	     'Shishtavec',	'KK',	'SH');
INSERT INTO @tbl VALUES ('Shkoder'            ,	     'Shkoder',	'SD',	'SD');
INSERT INTO @tbl VALUES ('Shkoder'            ,	     'Shkrel',	'SD',	'SR');
INSERT INTO @tbl VALUES ('Shkoder'            ,	     'Shllak',	'SD',	'SK');
INSERT INTO @tbl VALUES ('Shkoder'            ,	     'Shosh',	'SD',	'SH');
INSERT INTO @tbl VALUES ('Kukes'            ,	     'Shtiqen',	'KK',	'SQ');
INSERT INTO @tbl VALUES ('Diber'            ,	     'Shupenze',	'DB',	'SH');
INSERT INTO @tbl VALUES ('Elbasan'            ,	     'Shushice (Elbasan)',	'EB',	'SH');
INSERT INTO @tbl VALUES ('Vlore'            ,	     'Shushice (Vlore)',	'VR',	'SH');
INSERT INTO @tbl VALUES ('Tirane'            ,	     'Sinaballaj',	'TI',	'SI');
INSERT INTO @tbl VALUES ('Berat'            ,	     'Sinje',	'BE',	'SI');
INSERT INTO @tbl VALUES ('Elbasan'            ,	     'Skenderbegas',	'EB',	'SK');
INSERT INTO @tbl VALUES ('Diber'            ,	     'Sllove',	'DB',	'SL');
INSERT INTO @tbl VALUES ('Elbasan'            ,	     'Stebleve',	'EB',	'SB');
INSERT INTO @tbl VALUES ('Elbasan'            ,	     'Stravaj',	'EB',	'SV');
INSERT INTO @tbl VALUES ('Fier'            ,	     'Strum',	'FI',	'ST');
INSERT INTO @tbl VALUES ('Diber'            ,	     'Suc',	'DB',	'SU');
INSERT INTO @tbl VALUES ('Gjirokaster'            ,	     'Suke',	'GK',	'SU');
INSERT INTO @tbl VALUES ('Durres'            ,	     'Sukth',	'DU',	'SU');
INSERT INTO @tbl VALUES ('Elbasan'            ,	     'Sult',	'EB',	'SU');
INSERT INTO @tbl VALUES ('Kukes'            ,	     'Surroj',	'KK',	'SR');
INSERT INTO @tbl VALUES ('Tirane'            ,	     'Synej',	'TI',	'SY');
INSERT INTO @tbl VALUES ('Shkoder'            ,	     'Temal',	'SD',	'TE');
INSERT INTO @tbl VALUES ('Gjirokaster'            ,	     'Tepelene',	'GK',	'TE');
INSERT INTO @tbl VALUES ('Fier'            ,	     'Terbuf',	'FI',	'TE');
INSERT INTO @tbl VALUES ('Berat'            ,	     'Terpan',	'BE',	'TE');
INSERT INTO @tbl VALUES ('Kukes'            ,	     'Terthore',	'KK',	'TE');
INSERT INTO @tbl VALUES ('Tirane'            ,	     'Tirane',	'TI',	'TI');
INSERT INTO @tbl VALUES ('Kukes'            ,	     'Topojan',	'KK',	'TO');
INSERT INTO @tbl VALUES ('Fier'            ,	     'Topoje',	'FI',	'TO');
INSERT INTO @tbl VALUES ('Korce'            ,	     'Trebinje',	'KE',	'TR');
INSERT INTO @tbl VALUES ('Diber'            ,	     'Trebisht',	'DB',	'TR');
INSERT INTO @tbl VALUES ('Elbasan'            ,	     'Tregan',	'EB',	'TR');
INSERT INTO @tbl VALUES ('Elbasan'            ,	     'Tunje',	'EB',	'TU');
INSERT INTO @tbl VALUES ('Korce'            ,	     'Udenisht',	'KE',	'UD');
INSERT INTO @tbl VALUES ('Kukes'            ,	     'Ujmisht',	'KK',	'UJ');
INSERT INTO @tbl VALUES ('Diber'            ,	     'Ulez',	'DB',	'UL');
INSERT INTO @tbl VALUES ('Lezhe'            ,	     'Ungrej',	'LZ',	'UN');
INSERT INTO @tbl VALUES ('Berat'            ,	     'Ura Vajgurore',	'BE',	'UV');
INSERT INTO @tbl VALUES ('Tirane'            ,	     'Vaqarr',	'TI',	'VA');
INSERT INTO @tbl VALUES ('Shkoder'            ,	     'Vau i Dejes',	'SD',	'VD');
INSERT INTO @tbl VALUES ('Berat'            ,	     'Velabisht',	'BE',	'VB');
INSERT INTO @tbl VALUES ('Korce'            ,	     'Velcan',	'KE',	'VC');
INSERT INTO @tbl VALUES ('Shkoder'            ,	     'Velipoje',	'SD',	'VE');
INSERT INTO @tbl VALUES ('Berat'            ,	     'Vendreshe',	'BE',	'VN');
INSERT INTO @tbl VALUES ('Vlore'            ,	     'Vergo',	'VR',	'VE');
INSERT INTO @tbl VALUES ('Berat'            ,	     'Vertop',	'BE',	'VT');
INSERT INTO @tbl VALUES ('Shkoder'            ,	     'Vig Mnele',	'SD',	'VM');
INSERT INTO @tbl VALUES ('Korce'            ,	     'Vithkuq',	'KE',	'VQ');
INSERT INTO @tbl VALUES ('Vlore'            ,	     'Vllahine',	'VR',	'VH');
INSERT INTO @tbl VALUES ('Vlore'            ,	     'Vlore',	'VR',	'VR');
INSERT INTO @tbl VALUES ('Tirane'            ,	     'Vore',	'TI',	'VO');
INSERT INTO @tbl VALUES ('Korce'            ,	     'Voskop',	'KE',	'VO');
INSERT INTO @tbl VALUES ('Korce'            ,	     'Voskopoje',	'KE',	'VJ');
INSERT INTO @tbl VALUES ('Korce'            ,	     'Vreshtas',	'KE',	'VR');
INSERT INTO @tbl VALUES ('Vlore'            ,	     'Xarre',	'VR',	'XA');
INSERT INTO @tbl VALUES ('Durres'            ,	     'Xhafzotaj',	'DU',	'XZ');
INSERT INTO @tbl VALUES ('Diber'            ,	     'Xiber',	'DB',	'XI');
INSERT INTO @tbl VALUES ('Gjirokaster'            ,	     'Zagori',	'GK',	'ZA');
INSERT INTO @tbl VALUES ('Tirane'            ,	     'Zall Bastar',	'TI',	'ZB');
INSERT INTO @tbl VALUES ('Diber'            ,	     'Zall Dardhe',	'DB',	'ZD');
INSERT INTO @tbl VALUES ('Tirane'            ,	     'Zall Herr',	'TI',	'ZH');
INSERT INTO @tbl VALUES ('Diber'            ,	     'Zall Rec',	'DB',	'ZR');
INSERT INTO @tbl VALUES ('Kukes'            ,	     'Zapod',	'KK',	'ZA');
INSERT INTO @tbl VALUES ('Elbasan'            ,	     'Zavaline',	'EB',	'ZA');
INSERT INTO @tbl VALUES ('Lezhe'            ,	     'Zejmen',	'LZ',	'ZE');
INSERT INTO @tbl VALUES ('Diber'            ,	     'Zerqan',	'DB',	'ZE');
INSERT INTO @tbl VALUES ('Fier'            ,	     'Zharrez',	'FI',	'ZH');
INSERT INTO @tbl VALUES ('Berat'            ,	     'Zhepe',	'BE',	'ZH');

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

