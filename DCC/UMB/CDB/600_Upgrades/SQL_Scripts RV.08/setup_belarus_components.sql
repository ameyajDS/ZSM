
/* ==================================================================================
    	Source File		:	setup_belarus_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	10-10-2014
	Module ID		:	CDB
	Last updated		:	10-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Belarus are set-up
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
WHERE	country_nm	=	'Belarus';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Belarus not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Region',
		level_2_address_component	=	'District',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Gomel'            ,	     'Aktsyabar',	'HO',	'OK');
INSERT INTO @tbl VALUES ('Vitebsk'            ,	     'Arsha',	'VI',	'OR');
INSERT INTO @tbl VALUES ('Grodno'            ,	     'Ashmyany',	'HR',	'OM');
INSERT INTO @tbl VALUES ('Mogilev'            ,	     'Asipovichy',	'MA',	'OS');
INSERT INTO @tbl VALUES ('Grodno'            ,	     'Astravyets',	'HR',	'OV');
INSERT INTO @tbl VALUES ('Mogilev'            ,	     'Babruysk',	'MA',	'BB');
INSERT INTO @tbl VALUES ('Brest'            ,	     'Baranavichy',	'BR',	'BA');
INSERT INTO @tbl VALUES ('Minsk'            ,	     'Barysaw',	'MI',	'BO');
INSERT INTO @tbl VALUES ('Gomel'            ,	     'Brahin',	'HO',	'BG');
INSERT INTO @tbl VALUES ('Vitebsk'            ,	     'Braslaw',	'VI',	'BV');
INSERT INTO @tbl VALUES ('Brest'            ,	     'Brest',	'BR',	'BR');
INSERT INTO @tbl VALUES ('Gomel'            ,	     'Buda-Kashalyova',	'HO',	'BK');
INSERT INTO @tbl VALUES ('Mogilev'            ,	     'Byalynichy',	'MA',	'BL');
INSERT INTO @tbl VALUES ('Minsk'            ,	     'Byarezan''',	'MI',	'BN');
INSERT INTO @tbl VALUES ('Brest'            ,	     'Byaroza',	'BR',	'BZ');
INSERT INTO @tbl VALUES ('Grodno'            ,	     'Byerastavitsa',	'HR',	'BE');
INSERT INTO @tbl VALUES ('Vitebsk'            ,	     'Byeshankovichy',	'VI',	'BS');
INSERT INTO @tbl VALUES ('Mogilev'            ,	     'Bykhaw',	'MA',	'BY');
INSERT INTO @tbl VALUES ('Gomel'            ,	     'Chachersk',	'HO',	'CC');
INSERT INTO @tbl VALUES ('Vitebsk'            ,	     'Chashniki',	'VI',	'CN');
INSERT INTO @tbl VALUES ('Mogilev'            ,	     'Chavusy',	'MA',	'CS');
INSERT INTO @tbl VALUES ('Minsk'            ,	     'Chervyen''',	'MI',	'CH');
INSERT INTO @tbl VALUES ('Mogilev'            ,	     'Cherykaw',	'MA',	'CR');
INSERT INTO @tbl VALUES ('Gomel'            ,	     'Dobrush',	'HO',	'DB');
INSERT INTO @tbl VALUES ('Vitebsk'            ,	     'Dokshytsy',	'VI',	'DK');
INSERT INTO @tbl VALUES ('Brest'            ,	     'Drahichyn',	'BR',	'DG');
INSERT INTO @tbl VALUES ('Mogilev'            ,	     'Drybin',	'MA',	'DR');
INSERT INTO @tbl VALUES ('Vitebsk'            ,	     'Dubrowna',	'VI',	'DU');
INSERT INTO @tbl VALUES ('Minsk'            ,	     'Dzyarzhynsk',	'MI',	'DZ');
INSERT INTO @tbl VALUES ('Grodno'            ,	     'Dzyatlava',	'HR',	'DY');
INSERT INTO @tbl VALUES ('Brest'            ,	     'Hantsavichy',	'BR',	'GA');
INSERT INTO @tbl VALUES ('Vitebsk'            ,	     'Haradok',	'VI',	'GD');
INSERT INTO @tbl VALUES ('Mogilev'            ,	     'Hlusk',	'MA',	'GL');
INSERT INTO @tbl VALUES ('Vitebsk'            ,	     'Hlybokaye',	'VI',	'GB');
INSERT INTO @tbl VALUES ('Gomel'            ,	     'Homyel''',	'HO',	'HM');
INSERT INTO @tbl VALUES ('Mogilev'            ,	     'Horki',	'MA',	'GO');
INSERT INTO @tbl VALUES ('Grodno'            ,	     'Hrodna',	'HR',	'HR');
INSERT INTO @tbl VALUES ('Brest'            ,	     'Ivanaw',	'BR',	'IN');
INSERT INTO @tbl VALUES ('Brest'            ,	     'Ivatsevichy',	'BR',	'IV');
INSERT INTO @tbl VALUES ('Grodno'            ,	     'Iwye',	'HR',	'IY');
INSERT INTO @tbl VALUES ('Gomel'            ,	     'Kalinkavichy',	'HO',	'KA');
INSERT INTO @tbl VALUES ('Brest'            ,	     'Kamyanyets',	'BR',	'KN');
INSERT INTO @tbl VALUES ('Minsk'            ,	     'Kapyl''',	'MI',	'KY');
INSERT INTO @tbl VALUES ('Grodno'            ,	     'Karelichy',	'HR',	'KL');
INSERT INTO @tbl VALUES ('Gomel'            ,	     'Karma',	'HO',	'KO');
INSERT INTO @tbl VALUES ('Mogilev'            ,	     'Kas''tsyukovichy',	'MA',	'KS');
INSERT INTO @tbl VALUES ('Mogilev'            ,	     'Khotsimsk',	'MA',	'HO');
INSERT INTO @tbl VALUES ('Gomel'            ,	     'Khoyniki',	'HO',	'HN');
INSERT INTO @tbl VALUES ('Mogilev'            ,	     'Kirawsk',	'MA',	'KI');
INSERT INTO @tbl VALUES ('Mogilev'            ,	     'Klichaw',	'MA',	'KC');
INSERT INTO @tbl VALUES ('Mogilev'            ,	     'Klimavichy',	'MA',	'KM');
INSERT INTO @tbl VALUES ('Minsk'            ,	     'Klyetsak',	'MI',	'KT');
INSERT INTO @tbl VALUES ('Brest'            ,	     'Kobryn''',	'BR',	'KB');
INSERT INTO @tbl VALUES ('Mogilev'            ,	     'Krasnapol''lye',	'MA',	'KP');
INSERT INTO @tbl VALUES ('Mogilev'            ,	     'Kruhlaye',	'MA',	'KG');
INSERT INTO @tbl VALUES ('Minsk'            ,	     'Krupki',	'MI',	'KK');
INSERT INTO @tbl VALUES ('Mogilev'            ,	     'Krychaw',	'MA',	'KR');
INSERT INTO @tbl VALUES ('Minsk'            ,	     'Lahoysk',	'MI',	'LG');
INSERT INTO @tbl VALUES ('Grodno'            ,	     'Lida',	'HR',	'LD');
INSERT INTO @tbl VALUES ('Gomel'            ,	     'Loyew',	'HO',	'LO');
INSERT INTO @tbl VALUES ('Brest'            ,	     'Luninets',	'BR',	'LU');
INSERT INTO @tbl VALUES ('Brest'            ,	     'Lyakhavichy',	'BR',	'LH');
INSERT INTO @tbl VALUES ('Gomel'            ,	     'Lyel''chytsy',	'HO',	'LC');
INSERT INTO @tbl VALUES ('Vitebsk'            ,	     'Lyepyel',	'VI',	'LP');
INSERT INTO @tbl VALUES ('Vitebsk'            ,	     'Lyozna',	'VI',	'LZ');
INSERT INTO @tbl VALUES ('Minsk'            ,	     'Lyuban''',	'MI',	'LB');
INSERT INTO @tbl VALUES ('Mogilev'            ,	     'Mahilyow',	'MA',	'MH');
INSERT INTO @tbl VALUES ('Minsk'            ,	     'Maladechna',	'MI',	'MD');
INSERT INTO @tbl VALUES ('Brest'            ,	     'Malaryta',	'BR',	'ML');
INSERT INTO @tbl VALUES ('Grodno'            ,	     'Masty',	'HR',	'MO');
INSERT INTO @tbl VALUES ('Gomel'            ,	     'Mazyr',	'HO',	'MZ');
INSERT INTO @tbl VALUES ('Minsk City'            ,	     'Minsk',	'HM',	'MI');
INSERT INTO @tbl VALUES ('Mogilev'            ,	     'Ms''tsislaw',	'MA',	'MS');
INSERT INTO @tbl VALUES ('Minsk'            ,	     'Myadzyel',	'MI',	'MY');
INSERT INTO @tbl VALUES ('Vitebsk'            ,	     'Myory',	'VI',	'MR');
INSERT INTO @tbl VALUES ('Gomel'            ,	     'Narowlya',	'HO',	'NA');
INSERT INTO @tbl VALUES ('Grodno'            ,	     'Navahradak',	'HR',	'NO');
INSERT INTO @tbl VALUES ('Minsk'            ,	     'Nyas''vizh',	'MI',	'NE');
INSERT INTO @tbl VALUES ('Vitebsk'            ,	     'Pastavy',	'VI',	'PV');
INSERT INTO @tbl VALUES ('Brest'            ,	     'Pinsk',	'BR',	'PI');
INSERT INTO @tbl VALUES ('Vitebsk'            ,	     'Polatsak',	'VI',	'PL');
INSERT INTO @tbl VALUES ('Brest'            ,	     'Pruzhany',	'BR',	'PR');
INSERT INTO @tbl VALUES ('Minsk'            ,	     'Pukhavichy',	'MI',	'PU');
INSERT INTO @tbl VALUES ('Gomel'            ,	     'Pyetrykaw',	'HO',	'PE');
INSERT INTO @tbl VALUES ('Gomel'            ,	     'Rahachow',	'HO',	'RE');
INSERT INTO @tbl VALUES ('Vitebsk'            ,	     'Rasony',	'VI',	'RS');
INSERT INTO @tbl VALUES ('Gomel'            ,	     'Rechytsa',	'HO',	'RG');
INSERT INTO @tbl VALUES ('Minsk'            ,	     'Salihorsk',	'MI',	'SO');
INSERT INTO @tbl VALUES ('Vitebsk'            ,	     'Sharkawshchyna',	'VI',	'SA');
INSERT INTO @tbl VALUES ('Grodno'            ,	     'Shchuchyn',	'HR',	'SC');
INSERT INTO @tbl VALUES ('Mogilev'            ,	     'Shklow',	'MA',	'SH');
INSERT INTO @tbl VALUES ('Vitebsk'            ,	     'Shumilina',	'VI',	'SI');
INSERT INTO @tbl VALUES ('Mogilev'            ,	     'Slawharad',	'MA',	'SG');
INSERT INTO @tbl VALUES ('Grodno'            ,	     'Slonim',	'HR',	'SL');
INSERT INTO @tbl VALUES ('Minsk'            ,	     'Slutsak',	'MI',	'SK');
INSERT INTO @tbl VALUES ('Minsk'            ,	     'Smalyavichy',	'MI',	'SM');
INSERT INTO @tbl VALUES ('Grodno'            ,	     'Smarhon''',	'HR',	'SN');
INSERT INTO @tbl VALUES ('Minsk'            ,	     'Staryya Darohi',	'MI',	'SD');
INSERT INTO @tbl VALUES ('Brest'            ,	     'Stolin',	'BR',	'ST');
INSERT INTO @tbl VALUES ('Minsk'            ,	     'Stowptsy',	'MI',	'SB');
INSERT INTO @tbl VALUES ('Grodno'            ,	     'S''vislach',	'HR',	'SS');
INSERT INTO @tbl VALUES ('Gomel'            ,	     'S''vyetlahorsk',	'HO',	'SV');
INSERT INTO @tbl VALUES ('Vitebsk'            ,	     'Syanno',	'VI',	'SE');
INSERT INTO @tbl VALUES ('Vitebsk'            ,	     'Talachyn',	'VI',	'TO');
INSERT INTO @tbl VALUES ('Vitebsk'            ,	     'Ushat',	'VI',	'US');
INSERT INTO @tbl VALUES ('Minsk'            ,	     'Uzda',	'MI',	'UZ');
INSERT INTO @tbl VALUES ('Minsk'            ,	     'Valozhyn',	'MI',	'VZ');
INSERT INTO @tbl VALUES ('Grodno'            ,	     'Vawkavysk',	'HR',	'VL');
INSERT INTO @tbl VALUES ('Vitebsk'            ,	     'Vitsyebsk',	'VI',	'VB');
INSERT INTO @tbl VALUES ('Grodno'            ,	     'Voranava',	'HR',	'VR');
INSERT INTO @tbl VALUES ('Minsk'            ,	     'Vyalyeyka',	'MI',	'VI');
INSERT INTO @tbl VALUES ('Vitebsk'            ,	     'Vyerkhnyazdvinsk',	'VI',	'VH');
INSERT INTO @tbl VALUES ('Gomel'            ,	     'Vyetka',	'HO',	'VT');
INSERT INTO @tbl VALUES ('Gomel'            ,	     'Yel''sk',	'HO',	'EL');
INSERT INTO @tbl VALUES ('Grodno'            ,	     'Zel''va',	'HR',	'ZE');
INSERT INTO @tbl VALUES ('Brest'            ,	     'Zhabinka',	'BR',	'ZH');
INSERT INTO @tbl VALUES ('Gomel'            ,	     'Zhlobin',	'HO',	'ZB');
INSERT INTO @tbl VALUES ('Gomel'            ,	     'Zhytkavichy',	'HO',	'ZK');

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

