
/* ==================================================================================
    	Source File		:	setup_mongolia_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	10-10-2014
	Module ID		:	CDB
	Last updated		:	10-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Mongolia are set-up
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
WHERE	country_nm	=	'Mongolia';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Mongolia not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Province',
		level_2_address_component	=	'Soum',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Dundgovi'            ,	     'Adaatsag',	'DU',	'AD');
INSERT INTO @tbl VALUES ('Dornogovi'            ,	     'Airag',	'DG',	'AI');
INSERT INTO @tbl VALUES ('Hovsgol'            ,	     'Alag-Erdene',	'HG',	'AL');
INSERT INTO @tbl VALUES ('Dzavhan'            ,	     'Aldarhaan',	'DZ',	'AL');
INSERT INTO @tbl VALUES ('Bayan-Olgiy'            ,	     'Altai',	'BO',	'AI');
INSERT INTO @tbl VALUES ('Govi-Altay'            ,	     'Altai',	'GA',	'AL');
INSERT INTO @tbl VALUES ('Hovd'            ,	     'Altai',	'HD',	'AL');
INSERT INTO @tbl VALUES ('Selenge'            ,	     'Altanbulag',	'SL',	'AL');
INSERT INTO @tbl VALUES ('Tov'            ,	     'Altanbulag',	'TO',	'AL');
INSERT INTO @tbl VALUES ('Dornogovi'            ,	     'Altanshiree',	'DG',	'AL');
INSERT INTO @tbl VALUES ('Bayan-Olgiy'            ,	     'Altansogts',	'BO',	'AN');
INSERT INTO @tbl VALUES ('Hovsgol'            ,	     'Arbulag',	'HG',	'AR');
INSERT INTO @tbl VALUES ('Tov'            ,	     'Argalant',	'TO',	'AG');
INSERT INTO @tbl VALUES ('Tov'            ,	     'Arhust',	'TO',	'AH');
INSERT INTO @tbl VALUES ('Ovorhangay'            ,	     'Arvaiheer',	'OH',	'AR');
INSERT INTO @tbl VALUES ('Bayan-Olgiy'            ,	     'Asgat',	'BO',	'AG');
INSERT INTO @tbl VALUES ('Dzavhan'            ,	     'Asgat',	'DZ',	'AS');
INSERT INTO @tbl VALUES ('Suhbaatar'            ,	     'Asgat',	'SB',	'AS');
INSERT INTO @tbl VALUES ('Bayanhongor'            ,	     'Baatsagaan',	'BH',	'BA');
INSERT INTO @tbl VALUES ('Ulaanbaatar'            ,	     'Baga-Hangai',	'UB',	'BK');
INSERT INTO @tbl VALUES ('Ulaanbaatar'            ,	     'Baga-Nuur',	'UB',	'BN');
INSERT INTO @tbl VALUES ('Suhbaatar'            ,	     'Baruun-Urt',	'SB',	'BA');
INSERT INTO @tbl VALUES ('Ovorhangay'            ,	     'Baruunbayan-Ulaan',	'OH',	'BU');
INSERT INTO @tbl VALUES ('Selenge'            ,	     'Baruunburen',	'SL',	'BA');
INSERT INTO @tbl VALUES ('Uvs'            ,	     'Baruunturuun',	'UV',	'BA');
INSERT INTO @tbl VALUES ('Ovorhangay'            ,	     'Bat-Olzii',	'OH',	'BZ');
INSERT INTO @tbl VALUES ('Hentiy'            ,	     'Batnorov',	'HN',	'BN');
INSERT INTO @tbl VALUES ('Hentiy'            ,	     'Batshireet',	'HN',	'BS');
INSERT INTO @tbl VALUES ('Tov'            ,	     'Batsumber',	'TO',	'BS');
INSERT INTO @tbl VALUES ('Arhangay'            ,	     'Battsengel',	'AR',	'BA');
INSERT INTO @tbl VALUES ('Orhon'            ,	     'Bayan',	'ER',	'BA');
INSERT INTO @tbl VALUES ('Tov'            ,	     'Bayan',	'TO',	'BA');
INSERT INTO @tbl VALUES ('Hentiy'            ,	     'Bayan-Adraga',	'HN',	'BA');
INSERT INTO @tbl VALUES ('Bulgan'            ,	     'Bayan-Agt',	'BU',	'BA');
INSERT INTO @tbl VALUES ('Bayanhongor'            ,	     'Bayan-Ondor',	'BH',	'BN');
INSERT INTO @tbl VALUES ('Ovorhangay'            ,	     'Bayan-Ondor',	'OH',	'BO');
INSERT INTO @tbl VALUES ('Tov'            ,	     'Bayan-Onjuul',	'TO',	'BO');
INSERT INTO @tbl VALUES ('Bayanhongor'            ,	     'Bayan-Ovoo',	'BH',	'BV');
INSERT INTO @tbl VALUES ('Hentiy'            ,	     'Bayan-Ovoo',	'HN',	'BO');
INSERT INTO @tbl VALUES ('Omnogovi'            ,	     'Bayan-Ovoo',	'OG',	'BO');
INSERT INTO @tbl VALUES ('Dzavhan'            ,	     'Bayan-Tes',	'DZ',	'BT');
INSERT INTO @tbl VALUES ('Orhon'            ,	     'Bayan-Under',	'ER',	'BU');
INSERT INTO @tbl VALUES ('Dornod'            ,	     'Bayan-Uul',	'DD',	'BU');
INSERT INTO @tbl VALUES ('Govi-Altay'            ,	     'Bayan-Uul',	'GA',	'BU');
INSERT INTO @tbl VALUES ('Ulaanbaatar'            ,	     'Bayan-Zurh',	'UB',	'BZ');
INSERT INTO @tbl VALUES ('Bayanhongor'            ,	     'Bayanbulag',	'BH',	'BB');
INSERT INTO @tbl VALUES ('Tov'            ,	     'Bayanchandmani',	'TO',	'BC');
INSERT INTO @tbl VALUES ('Omnogovi'            ,	     'Bayandalai',	'OG',	'BD');
INSERT INTO @tbl VALUES ('Suhbaatar'            ,	     'Bayandelger',	'SB',	'BD');
INSERT INTO @tbl VALUES ('Tov'            ,	     'Bayandelger',	'TO',	'BD');
INSERT INTO @tbl VALUES ('Dornod'            ,	     'Bayandun',	'DD',	'BD');
INSERT INTO @tbl VALUES ('Ovorhangay'            ,	     'Bayangol',	'OH',	'BG');
INSERT INTO @tbl VALUES ('Selenge'            ,	     'Bayangol',	'SL',	'BG');
INSERT INTO @tbl VALUES ('Ulaanbaatar'            ,	     'Bayangol',	'UB',	'BG');
INSERT INTO @tbl VALUES ('Bayanhongor'            ,	     'Bayangovi',	'BH',	'BG');
INSERT INTO @tbl VALUES ('Tov'            ,	     'Bayanhangai',	'TO',	'BH');
INSERT INTO @tbl VALUES ('Bayanhongor'            ,	     'Bayanhongor',	'BH',	'BH');
INSERT INTO @tbl VALUES ('Hentiy'            ,	     'Bayanhutag',	'HN',	'BH');
INSERT INTO @tbl VALUES ('Dundgovi'            ,	     'Bayanjargalan',	'DU',	'BJ');
INSERT INTO @tbl VALUES ('Tov'            ,	     'Bayanjargalan',	'TO',	'BJ');
INSERT INTO @tbl VALUES ('Bayanhongor'            ,	     'Bayanlig',	'BH',	'BL');
INSERT INTO @tbl VALUES ('Hentiy'            ,	     'Bayanmonh',	'HN',	'BM');
INSERT INTO @tbl VALUES ('Bayan-Olgiy'            ,	     'Bayannuur',	'BO',	'BN');
INSERT INTO @tbl VALUES ('Bulgan'            ,	     'Bayannuur',	'BU',	'BN');
INSERT INTO @tbl VALUES ('Bayanhongor'            ,	     'Bayansagaan',	'BH',	'BS');
INSERT INTO @tbl VALUES ('Govisumber'            ,	     'Bayantal',	'GS',	'BT');
INSERT INTO @tbl VALUES ('Tov'            ,	     'Bayantsagaan',	'TO',	'BT');
INSERT INTO @tbl VALUES ('Tov'            ,	     'Bayantsogt',	'TO',	'BG');
INSERT INTO @tbl VALUES ('Dornod'            ,	     'Bayantumen',	'DD',	'BT');
INSERT INTO @tbl VALUES ('Hovsgol'            ,	     'Bayanzurh',	'HG',	'BZ');
INSERT INTO @tbl VALUES ('Hentiy'            ,	     'Berh',	'HN',	'BE');
INSERT INTO @tbl VALUES ('Govi-Altay'            ,	     'Biger',	'GA',	'BI');
INSERT INTO @tbl VALUES ('Hentiy'            ,	     'Binder',	'HN',	'BI');
INSERT INTO @tbl VALUES ('Bayanhongor'            ,	     'Bogd',	'BH',	'BO');
INSERT INTO @tbl VALUES ('Ovorhangay'            ,	     'Bogd',	'OH',	'BD');
INSERT INTO @tbl VALUES ('Uvs'            ,	     'Bohmoron',	'UV',	'BO');
INSERT INTO @tbl VALUES ('Bayanhongor'            ,	     'Bombogor',	'BH',	'BM');
INSERT INTO @tbl VALUES ('Hentiy'            ,	     'Bor-Ondor',	'HN',	'BR');
INSERT INTO @tbl VALUES ('Tov'            ,	     'Bornuur',	'TO',	'BR');
INSERT INTO @tbl VALUES ('Bayan-Olgiy'            ,	     'Bugat',	'BO',	'BG');
INSERT INTO @tbl VALUES ('Bulgan'            ,	     'Bugat',	'BU',	'BG');
INSERT INTO @tbl VALUES ('Govi-Altay'            ,	     'Bugat',	'GA',	'BG');
INSERT INTO @tbl VALUES ('Orhon'            ,	     'Bulagzeel',	'ER',	'BZ');
INSERT INTO @tbl VALUES ('Arhangay'            ,	     'Bulgan',	'AR',	'BU');
INSERT INTO @tbl VALUES ('Bayan-Olgiy'            ,	     'Bulgan',	'BO',	'BU');
INSERT INTO @tbl VALUES ('Bulgan'            ,	     'Bulgan',	'BU',	'BU');
INSERT INTO @tbl VALUES ('Dornod'            ,	     'Bulgan',	'DD',	'BG');
INSERT INTO @tbl VALUES ('Hovd'            ,	     'Bulgan',	'HD',	'BU');
INSERT INTO @tbl VALUES ('Omnogovi'            ,	     'Bulgan',	'OG',	'BU');
INSERT INTO @tbl VALUES ('Dzavhan'            ,	     'Bulnai',	'DZ',	'BU');
INSERT INTO @tbl VALUES ('Ovorhangay'            ,	     'Burd',	'OH',	'BR');
INSERT INTO @tbl VALUES ('Bulgan'            ,	     'Bureghangai',	'BU',	'BR');
INSERT INTO @tbl VALUES ('Tov'            ,	     'Buren',	'TO',	'BU');
INSERT INTO @tbl VALUES ('Hovsgol'            ,	     'Burentogtoh',	'HG',	'BU');
INSERT INTO @tbl VALUES ('Bayanhongor'            ,	     'Buutsagaan',	'BH',	'BU');
INSERT INTO @tbl VALUES ('Bayan-Olgiy'            ,	     'Buyant',	'BO',	'BY');
INSERT INTO @tbl VALUES ('Hovd'            ,	     'Buyant',	'HD',	'BY');
INSERT INTO @tbl VALUES ('Dzavhan'            ,	     'Byanhairhan',	'DZ',	'BY');
INSERT INTO @tbl VALUES ('Govi-Altay'            ,	     'Chandmani',	'GA',	'CH');
INSERT INTO @tbl VALUES ('Hovd'            ,	     'Chandmani',	'HD',	'CH');
INSERT INTO @tbl VALUES ('Hovsgol'            ,	     'Chandmani-Ondor',	'HG',	'CO');
INSERT INTO @tbl VALUES ('Ulaanbaatar'            ,	     'Chingeltei',	'UB',	'CH');
INSERT INTO @tbl VALUES ('Dornod'            ,	     'Choibalsan',	'DD',	'CB');
INSERT INTO @tbl VALUES ('Dornod'            ,	     'Chuluunhoroot',	'DD',	'CH');
INSERT INTO @tbl VALUES ('Arhangay'            ,	     'Chuluut',	'AR',	'CH');
INSERT INTO @tbl VALUES ('Hentiy'            ,	     'Dadal',	'HN',	'DD');
INSERT INTO @tbl VALUES ('Dornogovi'            ,	     'Dalanjargalan',	'DG',	'DA');
INSERT INTO @tbl VALUES ('Omnogovi'            ,	     'Dalanzadgad',	'OG',	'DA');
INSERT INTO @tbl VALUES ('Darhan-Uul'            ,	     'Darhan',	'DA',	'DA');
INSERT INTO @tbl VALUES ('Hentiy'            ,	     'Darhan',	'HN',	'DH');
INSERT INTO @tbl VALUES ('Suhbaatar'            ,	     'Dariganga',	'SB',	'DA');
INSERT INTO @tbl VALUES ('Govi-Altay'            ,	     'Dariv',	'GA',	'DA');
INSERT INTO @tbl VALUES ('Hovd'            ,	     'Dariv',	'HD',	'DA');
INSERT INTO @tbl VALUES ('Dornod'            ,	     'Dashbalbar',	'DD',	'DA');
INSERT INTO @tbl VALUES ('Bulgan'            ,	     'Dashinchilen',	'BU',	'DA');
INSERT INTO @tbl VALUES ('Uvs'            ,	     'Davst',	'UV',	'DA');
INSERT INTO @tbl VALUES ('Govi-Altay'            ,	     'Delger',	'GA',	'DE');
INSERT INTO @tbl VALUES ('Dornod'            ,	     'Delgereh',	'DD',	'DE');
INSERT INTO @tbl VALUES ('Dornogovi'            ,	     'Delgereh',	'DG',	'DE');
INSERT INTO @tbl VALUES ('Hentiy'            ,	     'Delgerhaan',	'HN',	'DE');
INSERT INTO @tbl VALUES ('Tov'            ,	     'Delgerhaan',	'TO',	'DE');
INSERT INTO @tbl VALUES ('Dundgovi'            ,	     'Delgerhangai',	'DU',	'DH');
INSERT INTO @tbl VALUES ('Dundgovi'            ,	     'Delgertsogt',	'DU',	'DT');
INSERT INTO @tbl VALUES ('Bayan-Olgiy'            ,	     'Deluun',	'BO',	'DE');
INSERT INTO @tbl VALUES ('Orhon'            ,	     'Denj',	'ER',	'DE');
INSERT INTO @tbl VALUES ('Dundgovi'            ,	     'Deren',	'DU',	'DR');
INSERT INTO @tbl VALUES ('Hovd'            ,	     'Dorgon',	'HD',	'DO');
INSERT INTO @tbl VALUES ('Dzavhan'            ,	     'Dorvoljin',	'DZ',	'DO');
INSERT INTO @tbl VALUES ('Selenge'            ,	     'Dulaanhaan',	'SL',	'DU');
INSERT INTO @tbl VALUES ('Hovd'            ,	     'Duut',	'HD',	'DU');
INSERT INTO @tbl VALUES ('Tov'            ,	     'Dzuun-Mod',	'TO',	'DZ');
INSERT INTO @tbl VALUES ('Arhangay'            ,	     'Erdeenemandal',	'AR',	'EM');
INSERT INTO @tbl VALUES ('Dornogovi'            ,	     'Erdene',	'DG',	'ER');
INSERT INTO @tbl VALUES ('Govi-Altay'            ,	     'Erdene',	'GA',	'ER');
INSERT INTO @tbl VALUES ('Tov'            ,	     'Erdene',	'TO',	'ER');
INSERT INTO @tbl VALUES ('Arhangay'            ,	     'Erdene-Bulgan',	'AR',	'EB');
INSERT INTO @tbl VALUES ('Hovsgol'            ,	     'Erdenebulgan',	'HG',	'ER');
INSERT INTO @tbl VALUES ('Hovd'            ,	     'Erdeneburen',	'HD',	'ER');
INSERT INTO @tbl VALUES ('Dundgovi'            ,	     'Erdenedalai',	'DU',	'ER');
INSERT INTO @tbl VALUES ('Dzavhan'            ,	     'Erdenehairhan',	'DZ',	'ER');
INSERT INTO @tbl VALUES ('Tov'            ,	     'Erdenesant',	'TO',	'ES');
INSERT INTO @tbl VALUES ('Suhbaatar'            ,	     'Erdenetsagaan',	'SB',	'ER');
INSERT INTO @tbl VALUES ('Bayanhongor'            ,	     'Erdenetsogt',	'BH',	'ER');
INSERT INTO @tbl VALUES ('Dornod'            ,	     'Ereen',	'DD',	'ER');
INSERT INTO @tbl VALUES ('Ovorhangay'            ,	     'Eson-Zuil',	'OH',	'EZ');
INSERT INTO @tbl VALUES ('Govi-Altay'            ,	     'Esonbulag',	'GA',	'ES');
INSERT INTO @tbl VALUES ('Hentiy'            ,	     'Galshir',	'HN',	'GA');
INSERT INTO @tbl VALUES ('Hovsgol'            ,	     'Galt',	'HG',	'GA');
INSERT INTO @tbl VALUES ('Bayanhongor'            ,	     'Galuut',	'BH',	'GA');
INSERT INTO @tbl VALUES ('Orhon'            ,	     'Gobil',	'ER',	'GO');
INSERT INTO @tbl VALUES ('Dundgovi'            ,	     'Govi-Ugtaal',	'DU',	'GU');
INSERT INTO @tbl VALUES ('Ovorhangay'            ,	     'Guchin-Us',	'OH',	'GU');
INSERT INTO @tbl VALUES ('Orhon'            ,	     'Guravmekr',	'ER',	'GU');
INSERT INTO @tbl VALUES ('Hentiy'            ,	     'Gurvanbayan',	'HN',	'GU');
INSERT INTO @tbl VALUES ('Bayanhongor'            ,	     'Gurvanbulag',	'BH',	'GU');
INSERT INTO @tbl VALUES ('Bulgan'            ,	     'Gurvanbulag',	'BU',	'GU');
INSERT INTO @tbl VALUES ('Dundgovi'            ,	     'Gurvansaihan',	'DU',	'GS');
INSERT INTO @tbl VALUES ('Omnogovi'            ,	     'Gurvantes',	'OG',	'GU');
INSERT INTO @tbl VALUES ('Dornod'            ,	     'Gurvanzagal',	'DD',	'GU');
INSERT INTO @tbl VALUES ('Govi-Altay'            ,	     'Guulin',	'GA',	'GU');
INSERT INTO @tbl VALUES ('Ulaanbaatar'            ,	     'Ha-Uul',	'UB',	'KH');
INSERT INTO @tbl VALUES ('Arhangay'            ,	     'Hairhan',	'AR',	'HH');
INSERT INTO @tbl VALUES ('Ovorhangay'            ,	     'Hairhandulaan',	'OH',	'HD');
INSERT INTO @tbl VALUES ('Dornod'            ,	     'Halhgol',	'DD',	'HA');
INSERT INTO @tbl VALUES ('Govi-Altay'            ,	     'Haliun',	'GA',	'HA');
INSERT INTO @tbl VALUES ('Suhbaatar'            ,	     'Halzan',	'SB',	'HA');
INSERT INTO @tbl VALUES ('Omnogovi'            ,	     'Hanbogd',	'OG',	'HB');
INSERT INTO @tbl VALUES ('Arhangay'            ,	     'Hangai',	'AR',	'HG');
INSERT INTO @tbl VALUES ('Bulgan'            ,	     'Hangai',	'BU',	'HI');
INSERT INTO @tbl VALUES ('Bulgan'            ,	     'Hangal',	'BU',	'HL');
INSERT INTO @tbl VALUES ('Hovsgol'            ,	     'Hanh',	'HG',	'HA');
INSERT INTO @tbl VALUES ('Omnogovi'            ,	     'Hanhongor',	'OG',	'HH');
INSERT INTO @tbl VALUES ('Uvs'            ,	     'Harhiraa',	'UV',	'HA');
INSERT INTO @tbl VALUES ('Ovorhangay'            ,	     'Harhorin',	'OH',	'HR');
INSERT INTO @tbl VALUES ('Arhangay'            ,	     'Hashaat',	'AR',	'HS');
INSERT INTO @tbl VALUES ('Dornogovi'            ,	     'Hatanbulag',	'DG',	'HA');
INSERT INTO @tbl VALUES ('Hovsgol'            ,	     'Hatgal',	'HG',	'KH');
INSERT INTO @tbl VALUES ('Dornod'            ,	     'Herlen',	'DD',	'HE');
INSERT INTO @tbl VALUES ('Hentiy'            ,	     'Herlen',	'HN',	'HE');
INSERT INTO @tbl VALUES ('Bulgan'            ,	     'Hishig-Ondor',	'BU',	'HO');
INSERT INTO @tbl VALUES ('Govi-Altay'            ,	     'Hohmorit',	'GA',	'HO');
INSERT INTO @tbl VALUES ('Dornod'            ,	     'Holonbuir',	'DD',	'HO');
INSERT INTO @tbl VALUES ('Darhan-Uul'            ,	     'Hongor',	'DA',	'HO');
INSERT INTO @tbl VALUES ('Arhangay'            ,	     'Hotont',	'AR',	'HO');
INSERT INTO @tbl VALUES ('Hovd'            ,	     'Hovd',	'HD',	'HO');
INSERT INTO @tbl VALUES ('Uvs'            ,	     'Hovd',	'UV',	'HO');
INSERT INTO @tbl VALUES ('Dornogovi'            ,	     'Hovsgol',	'DG',	'HO');
INSERT INTO @tbl VALUES ('Selenge'            ,	     'Huder',	'SL',	'HD');
INSERT INTO @tbl VALUES ('Ovorhangay'            ,	     'Hujirt',	'OH',	'HU');
INSERT INTO @tbl VALUES ('Dundgovi'            ,	     'Huld',	'DU',	'HU');
INSERT INTO @tbl VALUES ('Bayanhongor'            ,	     'Hureemaral',	'BH',	'HU');
INSERT INTO @tbl VALUES ('Orhon'            ,	     'Hurenbulag',	'ER',	'HU');
INSERT INTO @tbl VALUES ('Omnogovi'            ,	     'Hurmen',	'OG',	'HU');
INSERT INTO @tbl VALUES ('Bulgan'            ,	     'Hutag',	'BU',	'HU');
INSERT INTO @tbl VALUES ('Selenge'            ,	     'Huzhaat',	'SL',	'HZ');
INSERT INTO @tbl VALUES ('Bulgan'            ,	     'Hyalganat',	'BU',	'KH');
INSERT INTO @tbl VALUES ('Uvs'            ,	     'Hyargas',	'UV',	'HY');
INSERT INTO @tbl VALUES ('Dzavhan'            ,	     'Ider',	'DZ',	'ID');
INSERT INTO @tbl VALUES ('Arhangay'            ,	     'Ih-Tamir',	'AR',	'IT');
INSERT INTO @tbl VALUES ('Dzavhan'            ,	     'Ih-Uul',	'DZ',	'IU');
INSERT INTO @tbl VALUES ('Hovsgol'            ,	     'Ih-Uul',	'HG',	'IU');
INSERT INTO @tbl VALUES ('Dornogovi'            ,	     'Ihhet',	'DG',	'IH');
INSERT INTO @tbl VALUES ('Govi-Altay'            ,	     'Jargalan',	'GA',	'JA');
INSERT INTO @tbl VALUES ('Arhangay'            ,	     'Jargalant',	'AR',	'JA');
INSERT INTO @tbl VALUES ('Bayanhongor'            ,	     'Jargalant',	'BH',	'JA');
INSERT INTO @tbl VALUES ('Orhon'            ,	     'Jargalant',	'ER',	'JA');
INSERT INTO @tbl VALUES ('Hovd'            ,	     'Jargalant',	'HD',	'JA');
INSERT INTO @tbl VALUES ('Hovsgol'            ,	     'Jargalant',	'HG',	'JA');
INSERT INTO @tbl VALUES ('Tov'            ,	     'Jargalant',	'TO',	'JA');
INSERT INTO @tbl VALUES ('Hentiy'            ,	     'Jargalthaan',	'HN',	'JA');
INSERT INTO @tbl VALUES ('Selenge'            ,	     'Javhlant',	'SL',	'JA');
INSERT INTO @tbl VALUES ('Bayanhongor'            ,	     'Jinst',	'BH',	'JI');
INSERT INTO @tbl VALUES ('Tov'            ,	     'Lun',	'TO',	'LU');
INSERT INTO @tbl VALUES ('Dundgovi'            ,	     'Luus',	'DU',	'LU');
INSERT INTO @tbl VALUES ('Hovsgol'            ,	     'Malchin',	'HG',	'MA');
INSERT INTO @tbl VALUES ('Uvs'            ,	     'Malchin',	'UV',	'MA');
INSERT INTO @tbl VALUES ('Dornogovi'            ,	     'Mandah',	'DG',	'MA');
INSERT INTO @tbl VALUES ('Selenge'            ,	     'Mandal',	'SL',	'MA');
INSERT INTO @tbl VALUES ('Omnogovi'            ,	     'Mandal-Ovoo',	'OG',	'MO');
INSERT INTO @tbl VALUES ('Dundgovi'            ,	     'Mandalgovi',	'DU',	'MA');
INSERT INTO @tbl VALUES ('Hovd'            ,	     'Manhan',	'HD',	'MA');
INSERT INTO @tbl VALUES ('Omnogovi'            ,	     'Manlai',	'OG',	'MA');
INSERT INTO @tbl VALUES ('Dornod'            ,	     'Matad',	'DD',	'MA');
INSERT INTO @tbl VALUES ('Bulgan'            ,	     'Mogod',	'BU',	'MO');
INSERT INTO @tbl VALUES ('Tov'            ,	     'Mongonmorit',	'TO',	'MO');
INSERT INTO @tbl VALUES ('Suhbaatar'            ,	     'Monhhaan',	'SB',	'MO');
INSERT INTO @tbl VALUES ('Hovd'            ,	     'Monhhairhan',	'HD',	'MH');
INSERT INTO @tbl VALUES ('Hovsgol'            ,	     'Moron',	'HG',	'MO');
INSERT INTO @tbl VALUES ('Hentiy'            ,	     'Moron',	'HN',	'MO');
INSERT INTO @tbl VALUES ('Hovd'            ,	     'Most',	'HD',	'MS');
INSERT INTO @tbl VALUES ('Hovd'            ,	     'Myangad',	'HD',	'MY');
INSERT INTO @tbl VALUES ('Ulaanbaatar'            ,	     'Nalaih',	'UB',	'NA');
INSERT INTO @tbl VALUES ('Suhbaatar'            ,	     'Naran',	'SB',	'NA');
INSERT INTO @tbl VALUES ('Uvs'            ,	     'Naranbulag',	'UV',	'NA');
INSERT INTO @tbl VALUES ('Ovorhangay'            ,	     'Nariinteel',	'OH',	'NA');
INSERT INTO @tbl VALUES ('Bayan-Olgiy'            ,	     'Nogoonnuur',	'BO',	'NO');
INSERT INTO @tbl VALUES ('Omnogovi'            ,	     'Nomgon',	'OG',	'NG');
INSERT INTO @tbl VALUES ('Dzavhan'            ,	     'Nomrog',	'DZ',	'NO');
INSERT INTO @tbl VALUES ('Hentiy'            ,	     'Norovlin',	'HN',	'NO');
INSERT INTO @tbl VALUES ('Omnogovi'            ,	     'Noyon',	'OG',	'NY');
INSERT INTO @tbl VALUES ('Bayan-Olgiy'            ,	     'Olgii',	'BO',	'OL');
INSERT INTO @tbl VALUES ('Uvs'            ,	     'Olgii',	'UV',	'OL');
INSERT INTO @tbl VALUES ('Bayanhongor'            ,	     'Olziit',	'BH',	'OL');
INSERT INTO @tbl VALUES ('Bulgan'            ,	     'Olziit',	'BU',	'OL');
INSERT INTO @tbl VALUES ('Dundgovi'            ,	     'Olziit',	'DU',	'OL');
INSERT INTO @tbl VALUES ('Hentiy'            ,	     'Olziit',	'HN',	'OL');
INSERT INTO @tbl VALUES ('Ovorhangay'            ,	     'Olziit',	'OH',	'OL');
INSERT INTO @tbl VALUES ('Hentiy'            ,	     'Omnodelger',	'HN',	'OM');
INSERT INTO @tbl VALUES ('Uvs'            ,	     'Omnogovi',	'UV',	'OM');
INSERT INTO @tbl VALUES ('Arhangay'            ,	     'Ondor-Ulaan',	'AR',	'OU');
INSERT INTO @tbl VALUES ('Hentiy'            ,	     'Ondorhaan',	'HN',	'ON');
INSERT INTO @tbl VALUES ('Uvs'            ,	     'Ondorhangai',	'UV',	'ON');
INSERT INTO @tbl VALUES ('Dundgovi'            ,	     'Ondorshil',	'DU',	'ON');
INSERT INTO @tbl VALUES ('Tov'            ,	     'Ondorshireet',	'TO',	'ON');
INSERT INTO @tbl VALUES ('Suhbaatar'            ,	     'Ongon',	'SB',	'ON');
INSERT INTO @tbl VALUES ('Dornogovi'            ,	     'Orgon',	'DG',	'OR');
INSERT INTO @tbl VALUES ('Bulgan'            ,	     'Orhon',	'BU',	'OR');
INSERT INTO @tbl VALUES ('Darhan-Uul'            ,	     'Orhon',	'DA',	'OR');
INSERT INTO @tbl VALUES ('Orhon'            ,	     'Orhon',	'ER',	'OR');
INSERT INTO @tbl VALUES ('Selenge'            ,	     'Orhon',	'SL',	'OR');
INSERT INTO @tbl VALUES ('Selenge'            ,	     'Orhontuul',	'SL',	'OT');
INSERT INTO @tbl VALUES ('Dzavhan'            ,	     'Otgon',	'DZ',	'OT');
INSERT INTO @tbl VALUES ('Orhon'            ,	     'Oyutzadgai',	'ER',	'OY');
INSERT INTO @tbl VALUES ('Bulgan'            ,	     'Rashaant',	'BU',	'RA');
INSERT INTO @tbl VALUES ('Hovsgol'            ,	     'Rashaant',	'HG',	'RA');
INSERT INTO @tbl VALUES ('Hovsgol'            ,	     'Renchinlhumbe',	'HG',	'RE');
INSERT INTO @tbl VALUES ('Uvs'            ,	     'Sagil',	'UV',	'SA');
INSERT INTO @tbl VALUES ('Bayan-Olgiy'            ,	     'Sagsai',	'BO',	'SA');
INSERT INTO @tbl VALUES ('Bulgan'            ,	     'Saihan',	'BU',	'SA');
INSERT INTO @tbl VALUES ('Selenge'            ,	     'Saihan',	'SL',	'SH');
INSERT INTO @tbl VALUES ('Dundgovi'            ,	     'Saihan-Ovoo',	'DU',	'SO');
INSERT INTO @tbl VALUES ('Dornogovi'            ,	     'Saihandulaan',	'DG',	'SD');
INSERT INTO @tbl VALUES ('Dundgovi'            ,	     'Saintsagaan',	'DU',	'SA');
INSERT INTO @tbl VALUES ('Ovorhangay'            ,	     'Sant',	'OH',	'SA');
INSERT INTO @tbl VALUES ('Selenge'            ,	     'Sant',	'SL',	'ST');
INSERT INTO @tbl VALUES ('Dzavhan'            ,	     'Santmargats',	'DZ',	'SA');
INSERT INTO @tbl VALUES ('Dornogovi'            ,	     'Saynshand',	'DG',	'SZ');
INSERT INTO @tbl VALUES ('Bulgan'            ,	     'Selenge',	'BU',	'SE');
INSERT INTO @tbl VALUES ('Dornod'            ,	     'Sergelen',	'DD',	'SE');
INSERT INTO @tbl VALUES ('Tov'            ,	     'Sergelen',	'TO',	'SE');
INSERT INTO @tbl VALUES ('Omnogovi'            ,	     'Sevrei',	'OG',	'SE');
INSERT INTO @tbl VALUES ('Selenge'            ,	     'Shaamar',	'SL',	'SM');
INSERT INTO @tbl VALUES ('Orhon'            ,	     'Shand',	'ER',	'SH');
INSERT INTO @tbl VALUES ('Govi-Altay'            ,	     'Sharga',	'GA',	'SH');
INSERT INTO @tbl VALUES ('Bayanhongor'            ,	     'Shargaljuut',	'BH',	'SG');
INSERT INTO @tbl VALUES ('Darhan-Uul'            ,	     'Shariingol',	'DA',	'SH');
INSERT INTO @tbl VALUES ('Dzavhan'            ,	     'Shiluustei',	'DZ',	'SH');
INSERT INTO @tbl VALUES ('Hovsgol'            ,	     'Shine-Ider',	'HG',	'SI');
INSERT INTO @tbl VALUES ('Bayanhongor'            ,	     'Shinejinst',	'BH',	'SN');
INSERT INTO @tbl VALUES ('Govisumber'            ,	     'Shiveegovi',	'GS',	'SH');
INSERT INTO @tbl VALUES ('Orhon'            ,	     'Sogoot',	'ER',	'SO');
INSERT INTO @tbl VALUES ('Dzavhan'            ,	     'Songino',	'DZ',	'SO');
INSERT INTO @tbl VALUES ('Ulaanbaatar'            ,	     'Songino',	'UB',	'SO');
INSERT INTO @tbl VALUES ('Suhbaatar'            ,	     'Suhbaatar',	'SB',	'SU');
INSERT INTO @tbl VALUES ('Selenge'            ,	     'Suhbaatar',	'SL',	'SB');
INSERT INTO @tbl VALUES ('Ulaanbaatar'            ,	     'Suhbaatar',	'UB',	'SU');
INSERT INTO @tbl VALUES ('Dornogovi'            ,	     'Sumber',	'DG',	'SU');
INSERT INTO @tbl VALUES ('Govisumber'            ,	     'Sumber',	'GS',	'SU');
INSERT INTO @tbl VALUES ('Tov'            ,	     'Sumber',	'TO',	'SU');
INSERT INTO @tbl VALUES ('Govi-Altay'            ,	     'Taishir',	'GA',	'TA');
INSERT INTO @tbl VALUES ('Ovorhangay'            ,	     'Taragt',	'OH',	'TA');
INSERT INTO @tbl VALUES ('Hovsgol'            ,	     'Tarialan',	'HG',	'TA');
INSERT INTO @tbl VALUES ('Uvs'            ,	     'Tarialin',	'UV',	'TA');
INSERT INTO @tbl VALUES ('Arhangay'            ,	     'Tariat',	'AR',	'TA');
INSERT INTO @tbl VALUES ('Dzavhan'            ,	     'Telmen',	'DZ',	'TM');
INSERT INTO @tbl VALUES ('Dzavhan'            ,	     'Tes',	'DZ',	'TS');
INSERT INTO @tbl VALUES ('Uvs'            ,	     'Tes',	'UV',	'TE');
INSERT INTO @tbl VALUES ('Bulgan'            ,	     'Teshig',	'BU',	'TE');
INSERT INTO @tbl VALUES ('Govi-Altay'            ,	     'Togrog',	'GA',	'TG');
INSERT INTO @tbl VALUES ('Ovorhangay'            ,	     'Togrog',	'OH',	'TO');
INSERT INTO @tbl VALUES ('Bayan-Olgiy'            ,	     'Tolbo',	'BO',	'TO');
INSERT INTO @tbl VALUES ('Hovsgol'            ,	     'Tomorbulag',	'HG',	'TM');
INSERT INTO @tbl VALUES ('Govi-Altay'            ,	     'Tonhil',	'GA',	'TH');
INSERT INTO @tbl VALUES ('Hovsgol'            ,	     'Tosontsengel',	'HG',	'TS');
INSERT INTO @tbl VALUES ('Dornod'            ,	     'Tsagaan-Ovoo',	'DD',	'TO');
INSERT INTO @tbl VALUES ('Hovsgol'            ,	     'Tsagaan-Uul',	'HG',	'TL');
INSERT INTO @tbl VALUES ('Hovsgol'            ,	     'Tsagaan-Uur',	'HG',	'TR');
INSERT INTO @tbl VALUES ('Dzavhan'            ,	     'Tsagaanchuluut',	'DZ',	'TC');
INSERT INTO @tbl VALUES ('Orhon'            ,	     'Tsagaanchuluut',	'ER',	'TC');
INSERT INTO @tbl VALUES ('Dundgovi'            ,	     'Tsagaandelger',	'DU',	'TD');
INSERT INTO @tbl VALUES ('Dzavhan'            ,	     'Tsagaanhairhan',	'DZ',	'TH');
INSERT INTO @tbl VALUES ('Uvs'            ,	     'Tsagaanhairhan',	'UV',	'TH');
INSERT INTO @tbl VALUES ('Bayan-Olgiy'            ,	     'Tsagaannuur',	'BO',	'TN');
INSERT INTO @tbl VALUES ('Hovsgol'            ,	     'Tsagaannuur',	'HG',	'TN');
INSERT INTO @tbl VALUES ('Selenge'            ,	     'Tsagaannuur',	'SL',	'TN');
INSERT INTO @tbl VALUES ('Arhangay'            ,	     'Tsahir',	'AR',	'TK');
INSERT INTO @tbl VALUES ('Govi-Altay'            ,	     'Tseel',	'GA',	'TL');
INSERT INTO @tbl VALUES ('Tov'            ,	     'Tseel',	'TO',	'TS');
INSERT INTO @tbl VALUES ('Bayan-Olgiy'            ,	     'Tsengel',	'BO',	'TS');
INSERT INTO @tbl VALUES ('Arhangay'            ,	     'Tsenher',	'AR',	'TN');
INSERT INTO @tbl VALUES ('Hentiy'            ,	     'Tsenhermandal',	'HN',	'TS');
INSERT INTO @tbl VALUES ('Hovd'            ,	     'Tsetseg',	'HD',	'TS');
INSERT INTO @tbl VALUES ('Dzavhan'            ,	     'Tsetsen-Uul',	'DZ',	'TU');
INSERT INTO @tbl VALUES ('Arhangay'            ,	     'Tsetserleg',	'AR',	'TT');
INSERT INTO @tbl VALUES ('Hovsgol'            ,	     'Tsetserleg',	'HG',	'TT');
INSERT INTO @tbl VALUES ('Govi-Altay'            ,	     'Tsogt',	'GA',	'TS');
INSERT INTO @tbl VALUES ('Omnogovi'            ,	     'Tsogt-Ovoo',	'OG',	'TO');
INSERT INTO @tbl VALUES ('Omnogovi'            ,	     'Tsogttsetsii',	'OG',	'TT');
INSERT INTO @tbl VALUES ('Dzavhan'            ,	     'Tudevtei',	'DZ',	'TT');
INSERT INTO @tbl VALUES ('Suhbaatar'            ,	     'Tumentsogt',	'SB',	'TT');
INSERT INTO @tbl VALUES ('Hovsgol'            ,	     'Tunel',	'HG',	'TU');
INSERT INTO @tbl VALUES ('Selenge'            ,	     'Tunhel',	'SL',	'TK');
INSERT INTO @tbl VALUES ('Uvs'            ,	     'Turgen',	'UV',	'TU');
INSERT INTO @tbl VALUES ('Selenge'            ,	     'Tushig',	'SL',	'TU');
INSERT INTO @tbl VALUES ('Suhbaatar'            ,	     'Tuvshinshiree',	'SB',	'TS');
INSERT INTO @tbl VALUES ('Arhangay'            ,	     'Tuvshruuleh',	'AR',	'TU');
INSERT INTO @tbl VALUES ('Arhangay'            ,	     'Ugiinuur',	'AR',	'UG');
INSERT INTO @tbl VALUES ('Tov'            ,	     'Ugtaal',	'TO',	'UG');
INSERT INTO @tbl VALUES ('Hovsgol'            ,	     'Ulaan-Uul',	'HG',	'UU');
INSERT INTO @tbl VALUES ('Dornogovi'            ,	     'Ulaanbadrah',	'DG',	'UB');
INSERT INTO @tbl VALUES ('Uvs'            ,	     'Ulaangom',	'UV',	'UG');
INSERT INTO @tbl VALUES ('Bayan-Olgiy'            ,	     'Ulaanhus',	'BO',	'UH');
INSERT INTO @tbl VALUES ('Dzavhan'            ,	     'Uliastai',	'DZ',	'UL');
INSERT INTO @tbl VALUES ('Arhangay'            ,	     'Ulziit',	'AR',	'UL');
INSERT INTO @tbl VALUES ('Dzavhan'            ,	     'Urgamal',	'DZ',	'UR');
INSERT INTO @tbl VALUES ('Suhbaatar'            ,	     'Uulbayan',	'SB',	'UU');
INSERT INTO @tbl VALUES ('Orhon'            ,	     'Uurhaichin',	'ER',	'UU');
INSERT INTO @tbl VALUES ('Ovorhangay'            ,	     'Uyanga',	'OH',	'UY');
INSERT INTO @tbl VALUES ('Hovd'            ,	     'Uyench',	'HD',	'UE');
INSERT INTO @tbl VALUES ('Dzavhan'            ,	     'Yaruu',	'DZ',	'YA');
INSERT INTO @tbl VALUES ('Selenge'            ,	     'Yeroo',	'SL',	'YE');
INSERT INTO @tbl VALUES ('Tov'            ,	     'Zaamar',	'TO',	'ZA');
INSERT INTO @tbl VALUES ('Bayanhongor'            ,	     'Zag',	'BH',	'ZA');
INSERT INTO @tbl VALUES ('Dornogovi'            ,	     'Zammyn-uud',	'DG',	'ZA');
INSERT INTO @tbl VALUES ('Uvs'            ,	     'Zavhan',	'UV',	'ZV');
INSERT INTO @tbl VALUES ('Dzavhan'            ,	     'Zavhanmandal',	'DZ',	'ZA');
INSERT INTO @tbl VALUES ('Hovd'            ,	     'Zereg',	'HD',	'ZE');
INSERT INTO @tbl VALUES ('Orhon'            ,	     'Zest',	'ER',	'ZE');
INSERT INTO @tbl VALUES ('Ovorhangay'            ,	     'Zuunbayan-Ulaan',	'OH',	'ZU');
INSERT INTO @tbl VALUES ('Selenge'            ,	     'Zuunburen',	'SL',	'ZU');
INSERT INTO @tbl VALUES ('Uvs'            ,	     'Zuungovi',	'UV',	'ZG');
INSERT INTO @tbl VALUES ('Uvs'            ,	     'Zuunhangai',	'UV',	'ZH');

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

