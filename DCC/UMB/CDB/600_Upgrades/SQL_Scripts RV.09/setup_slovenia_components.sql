
/* ==================================================================================
    	Source File		:	setup_slovenia_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Slovenia are set-up
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
WHERE	country_nm	=	'Slovenia';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Slovenia not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Region',
		level_2_address_component	=	'Commune',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Goriska'            ,	     'Ajdovscina',	'SP',	'AJ');
INSERT INTO @tbl VALUES ('Pomurska'            ,	     'Apace',	'PM',	'AP');
INSERT INTO @tbl VALUES ('Pomurska'            ,	     'Beltinci',	'PM',	'BE');
INSERT INTO @tbl VALUES ('Podravska'            ,	     'Benedikt',	'PD',	'BE');
INSERT INTO @tbl VALUES ('Savinjska'            ,	     'Bistrica ob Sotli',	'SA',	'BS');
INSERT INTO @tbl VALUES ('Gorenjska'            ,	     'Bled',	'GO',	'BD');
INSERT INTO @tbl VALUES ('Notranjsko-kraska'            ,	     'Bloke',	'NO',	'BL');
INSERT INTO @tbl VALUES ('Gorenjska'            ,	     'Bohinj',	'GO',	'BO');
INSERT INTO @tbl VALUES ('Osrednjeslovenska'            ,	     'Borovnica',	'LJ',	'BO');
INSERT INTO @tbl VALUES ('Goriska'            ,	     'Bovec',	'SP',	'BO');
INSERT INTO @tbl VALUES ('Savinjska'            ,	     'Braslovce',	'SA',	'BR');
INSERT INTO @tbl VALUES ('Goriska'            ,	     'Brda',	'SP',	'BR');
INSERT INTO @tbl VALUES ('Osrednjeslovenska'            ,	     'Brezovica',	'LJ',	'BR');
INSERT INTO @tbl VALUES ('Spodnjeposavska'            ,	     'Brezice',	'PS',	'BR');
INSERT INTO @tbl VALUES ('Pomurska'            ,	     'Cankova',	'PM',	'CA');
INSERT INTO @tbl VALUES ('Savinjska'            ,	     'Celje',	'SA',	'CE');
INSERT INTO @tbl VALUES ('Gorenjska'            ,	     'Cerklje na Gorenjskem',	'GO',	'CG');
INSERT INTO @tbl VALUES ('Notranjsko-kraska'            ,	     'Cerknica',	'NO',	'CE');
INSERT INTO @tbl VALUES ('Goriska'            ,	     'Cerkno',	'SP',	'CE');
INSERT INTO @tbl VALUES ('Podravska'            ,	     'Cerkvenjak',	'PD',	'CE');
INSERT INTO @tbl VALUES ('Podravska'            ,	     'Cirkulane',	'PD',	'CL');
INSERT INTO @tbl VALUES ('Pomurska'            ,	     'Crensovci',	'PM',	'CR');
INSERT INTO @tbl VALUES ('Koroska'            ,	     'Crna na Koroskem',	'KO',	'CK');
INSERT INTO @tbl VALUES ('Dolenjska'            ,	     'Crnomelj',	'DO',	'CR');
INSERT INTO @tbl VALUES ('Podravska'            ,	     'Destrnik',	'PD',	'DE');
INSERT INTO @tbl VALUES ('Obalno-kraska'            ,	     'Divaca',	'JP',	'DI');
INSERT INTO @tbl VALUES ('Savinjska'            ,	     'Dobje',	'SA',	'DJ');
INSERT INTO @tbl VALUES ('Osrednjeslovenska'            ,	     'Dobrepolje',	'LJ',	'DB');
INSERT INTO @tbl VALUES ('Savinjska'            ,	     'Dobrna',	'SA',	'DR');
INSERT INTO @tbl VALUES ('Osrednjeslovenska'            ,	     'Dobrova - Polhov Gradec',	'LJ',	'DP');
INSERT INTO @tbl VALUES ('Pomurska'            ,	     'Dobrovnik',	'PM',	'DO');
INSERT INTO @tbl VALUES ('Osrednjeslovenska'            ,	     'Dol pri Ljubljani',	'LJ',	'DL');
INSERT INTO @tbl VALUES ('Dolenjska'            ,	     'Dolenjske Toplice',	'DO',	'DT');
INSERT INTO @tbl VALUES ('Osrednjeslovenska'            ,	     'Domzale',	'LJ',	'DM');
INSERT INTO @tbl VALUES ('Podravska'            ,	     'Dornava',	'PD',	'DO');
INSERT INTO @tbl VALUES ('Koroska'            ,	     'Dravograd',	'KO',	'DR');
INSERT INTO @tbl VALUES ('Podravska'            ,	     'Duplek',	'PD',	'DU');
INSERT INTO @tbl VALUES ('Gorenjska'            ,	     'Gorenja Vas - Poljane',	'GO',	'GV');
INSERT INTO @tbl VALUES ('Podravska'            ,	     'Gorisnica',	'PD',	'GR');
INSERT INTO @tbl VALUES ('Gorenjska'            ,	     'Gorje',	'GO',	'GJ');
INSERT INTO @tbl VALUES ('Pomurska'            ,	     'Gornja Radgona',	'PM',	'GG');
INSERT INTO @tbl VALUES ('Savinjska'            ,	     'Gornji Grad',	'SA',	'GG');
INSERT INTO @tbl VALUES ('Pomurska'            ,	     'Gornji Petrovci',	'PM',	'GP');
INSERT INTO @tbl VALUES ('Pomurska'            ,	     'Grad',	'PM',	'GD');
INSERT INTO @tbl VALUES ('Osrednjeslovenska'            ,	     'Grosuplje',	'LJ',	'GR');
INSERT INTO @tbl VALUES ('Podravska'            ,	     'Hajdina',	'PD',	'HA');
INSERT INTO @tbl VALUES ('Podravska'            ,	     'Hoce - Slivnica',	'PD',	'HS');
INSERT INTO @tbl VALUES ('Pomurska'            ,	     'Hodos',	'PM',	'HO');
INSERT INTO @tbl VALUES ('Osrednjeslovenska'            ,	     'Horjul',	'LJ',	'HO');
INSERT INTO @tbl VALUES ('Zasavska'            ,	     'Hrastnik',	'ZS',	'HR');
INSERT INTO @tbl VALUES ('Obalno-kraska'            ,	     'Hrpelje - Kozina',	'JP',	'HK');
INSERT INTO @tbl VALUES ('Goriska'            ,	     'Idrija',	'SP',	'ID');
INSERT INTO @tbl VALUES ('Osrednjeslovenska'            ,	     'Ig',	'LJ',	'IG');
INSERT INTO @tbl VALUES ('Notranjsko-kraska'            ,	     'Ilirska Bistrica',	'NO',	'IB');
INSERT INTO @tbl VALUES ('Osrednjeslovenska'            ,	     'Ivancna Gorica',	'LJ',	'IV');
INSERT INTO @tbl VALUES ('Obalno-kraska'            ,	     'Izola',	'JP',	'IZ');
INSERT INTO @tbl VALUES ('Gorenjska'            ,	     'Jesenice',	'GO',	'JS');
INSERT INTO @tbl VALUES ('Gorenjska'            ,	     'Jezersko',	'GO',	'JZ');
INSERT INTO @tbl VALUES ('Podravska'            ,	     'Jursinci',	'PD',	'JU');
INSERT INTO @tbl VALUES ('Osrednjeslovenska'            ,	     'Kamnik',	'LJ',	'KA');
INSERT INTO @tbl VALUES ('Goriska'            ,	     'Kanal',	'SP',	'KA');
INSERT INTO @tbl VALUES ('Podravska'            ,	     'Kidricevo',	'PD',	'KI');
INSERT INTO @tbl VALUES ('Goriska'            ,	     'Kobarid',	'SP',	'KO');
INSERT INTO @tbl VALUES ('Pomurska'            ,	     'Kobilje',	'PM',	'KO');
INSERT INTO @tbl VALUES ('Osrednjeslovenska'            ,	     'Kocevje',	'LJ',	'KC');
INSERT INTO @tbl VALUES ('Obalno-kraska'            ,	     'Komen',	'JP',	'KM');
INSERT INTO @tbl VALUES ('Osrednjeslovenska'            ,	     'Komenda',	'LJ',	'KM');
INSERT INTO @tbl VALUES ('Obalno-kraska'            ,	     'Koper',	'JP',	'KP');
INSERT INTO @tbl VALUES ('Spodnjeposavska'            ,	     'Kostanjevica na Krki',	'PS',	'KJ');
INSERT INTO @tbl VALUES ('Osrednjeslovenska'            ,	     'Kostel',	'LJ',	'KS');
INSERT INTO @tbl VALUES ('Savinjska'            ,	     'Kozje',	'SA',	'KO');
INSERT INTO @tbl VALUES ('Gorenjska'            ,	     'Kranj',	'GO',	'KR');
INSERT INTO @tbl VALUES ('Gorenjska'            ,	     'Kranjska Gora',	'GO',	'KG');
INSERT INTO @tbl VALUES ('Pomurska'            ,	     'Krizevci',	'PM',	'KR');
INSERT INTO @tbl VALUES ('Spodnjeposavska'            ,	     'Krsko',	'PS',	'KS');
INSERT INTO @tbl VALUES ('Podravska'            ,	     'Kungota',	'PD',	'KU');
INSERT INTO @tbl VALUES ('Pomurska'            ,	     'Kuzma',	'PM',	'KU');
INSERT INTO @tbl VALUES ('Savinjska'            ,	     'Lasko',	'SA',	'LA');
INSERT INTO @tbl VALUES ('Podravska'            ,	     'Lenart',	'PD',	'LN');
INSERT INTO @tbl VALUES ('Pomurska'            ,	     'Lendava',	'PM',	'LE');
INSERT INTO @tbl VALUES ('Osrednjeslovenska'            ,	     'Litija',	'LJ',	'LI');
INSERT INTO @tbl VALUES ('Osrednjeslovenska'            ,	     'Ljubljana',	'LJ',	'LJ');
INSERT INTO @tbl VALUES ('Savinjska'            ,	     'Ljubno',	'SA',	'LJ');
INSERT INTO @tbl VALUES ('Pomurska'            ,	     'Ljutomer',	'PM',	'LJ');
INSERT INTO @tbl VALUES ('Osrednjeslovenska'            ,	     'Log - Dragomer',	'LJ',	'LD');
INSERT INTO @tbl VALUES ('Osrednjeslovenska'            ,	     'Logatec',	'LJ',	'LO');
INSERT INTO @tbl VALUES ('Notranjsko-kraska'            ,	     'Loska Dolina',	'NO',	'LD');
INSERT INTO @tbl VALUES ('Osrednjeslovenska'            ,	     'Loski Potok',	'LJ',	'LP');
INSERT INTO @tbl VALUES ('Podravska'            ,	     'Lovrenc na Pohorju',	'PD',	'LP');
INSERT INTO @tbl VALUES ('Savinjska'            ,	     'Luce',	'SA',	'LU');
INSERT INTO @tbl VALUES ('Osrednjeslovenska'            ,	     'Lukovica',	'LJ',	'LU');
INSERT INTO @tbl VALUES ('Podravska'            ,	     'Majsperk',	'PD',	'MJ');
INSERT INTO @tbl VALUES ('Podravska'            ,	     'Makole',	'PD',	'ML');
INSERT INTO @tbl VALUES ('Podravska'            ,	     'Maribor',	'PD',	'MB');
INSERT INTO @tbl VALUES ('Podravska'            ,	     'Markovci',	'PD',	'MK');
INSERT INTO @tbl VALUES ('Osrednjeslovenska'            ,	     'Medvode',	'LJ',	'MD');
INSERT INTO @tbl VALUES ('Osrednjeslovenska'            ,	     'Menges',	'LJ',	'MN');
INSERT INTO @tbl VALUES ('Dolenjska'            ,	     'Metlika',	'DO',	'ME');
INSERT INTO @tbl VALUES ('Koroska'            ,	     'Mezica',	'KO',	'ME');
INSERT INTO @tbl VALUES ('Podravska'            ,	     'Miklavz na Dravskem Polju',	'PD',	'MD');
INSERT INTO @tbl VALUES ('Goriska'            ,	     'Miren - Kostanjevica',	'SP',	'MK');
INSERT INTO @tbl VALUES ('Dolenjska'            ,	     'Mirna',	'DO',	'MI');
INSERT INTO @tbl VALUES ('Dolenjska'            ,	     'Mirna Pec',	'DO',	'MP');
INSERT INTO @tbl VALUES ('Koroska'            ,	     'Mislinja',	'KO',	'MI');
INSERT INTO @tbl VALUES ('Dolenjska'            ,	     'Mokronog - Trebelno',	'DO',	'MT');
INSERT INTO @tbl VALUES ('Osrednjeslovenska'            ,	     'Moravce',	'LJ',	'MO');
INSERT INTO @tbl VALUES ('Pomurska'            ,	     'Moravske Toplice',	'PM',	'MT');
INSERT INTO @tbl VALUES ('Savinjska'            ,	     'Mozirje',	'SA',	'MZ');
INSERT INTO @tbl VALUES ('Pomurska'            ,	     'Murska Sobota',	'PM',	'MS');
INSERT INTO @tbl VALUES ('Koroska'            ,	     'Muta',	'KO',	'MU');
INSERT INTO @tbl VALUES ('Gorenjska'            ,	     'Naklo',	'GO',	'NA');
INSERT INTO @tbl VALUES ('Savinjska'            ,	     'Nazarje',	'SA',	'NA');
INSERT INTO @tbl VALUES ('Goriska'            ,	     'Nova Gorica',	'SP',	'NV');
INSERT INTO @tbl VALUES ('Dolenjska'            ,	     'Novo Mesto',	'DO',	'NV');
INSERT INTO @tbl VALUES ('Pomurska'            ,	     'Odranci',	'PM',	'OD');
INSERT INTO @tbl VALUES ('Podravska'            ,	     'Oplotnica',	'PD',	'OP');
INSERT INTO @tbl VALUES ('Podravska'            ,	     'Ormoz',	'PD',	'OM');
INSERT INTO @tbl VALUES ('Osrednjeslovenska'            ,	     'Osilnica',	'LJ',	'OS');
INSERT INTO @tbl VALUES ('Podravska'            ,	     'Pesnica',	'PD',	'PE');
INSERT INTO @tbl VALUES ('Obalno-kraska'            ,	     'Piran',	'JP',	'PI');
INSERT INTO @tbl VALUES ('Goriska'            ,	     'Pivka',	'SP',	'PI');
INSERT INTO @tbl VALUES ('Savinjska'            ,	     'Podcetrtek',	'SA',	'PD');
INSERT INTO @tbl VALUES ('Podravska'            ,	     'Podlehnik',	'PD',	'PO');
INSERT INTO @tbl VALUES ('Koroska'            ,	     'Podvelka',	'KO',	'PO');
INSERT INTO @tbl VALUES ('Podravska'            ,	     'Poljcane',	'PD',	'PJ');
INSERT INTO @tbl VALUES ('Savinjska'            ,	     'Polzela',	'SA',	'PL');
INSERT INTO @tbl VALUES ('Goriska'            ,	     'Postojna',	'SP',	'PO');
INSERT INTO @tbl VALUES ('Savinjska'            ,	     'Prebold',	'SA',	'PR');
INSERT INTO @tbl VALUES ('Gorenjska'            ,	     'Preddvor',	'GO',	'PR');
INSERT INTO @tbl VALUES ('Koroska'            ,	     'Prevalje',	'KO',	'PR');
INSERT INTO @tbl VALUES ('Podravska'            ,	     'Ptuj',	'PD',	'PT');
INSERT INTO @tbl VALUES ('Pomurska'            ,	     'Puconci',	'PM',	'PU');
INSERT INTO @tbl VALUES ('Podravska'            ,	     'Race - Fram',	'PD',	'RF');
INSERT INTO @tbl VALUES ('Savinjska'            ,	     'Radece',	'SA',	'RA');
INSERT INTO @tbl VALUES ('Pomurska'            ,	     'Radenci',	'PM',	'RD');
INSERT INTO @tbl VALUES ('Koroska'            ,	     'Radlje ob Dravi',	'KO',	'RD');
INSERT INTO @tbl VALUES ('Gorenjska'            ,	     'Radovljica',	'GO',	'RA');
INSERT INTO @tbl VALUES ('Koroska'            ,	     'Ravne na Koroskem',	'KO',	'RK');
INSERT INTO @tbl VALUES ('Pomurska'            ,	     'Razkrizje',	'PM',	'RZ');
INSERT INTO @tbl VALUES ('Savinjska'            ,	     'Recica ob Savinji',	'SA',	'RC');
INSERT INTO @tbl VALUES ('Goriska'            ,	     'Rence - Vogrsko',	'SP',	'RV');
INSERT INTO @tbl VALUES ('Osrednjeslovenska'            ,	     'Ribnica',	'LJ',	'RI');
INSERT INTO @tbl VALUES ('Koroska'            ,	     'Ribnica na Pohorju',	'KO',	'RP');
INSERT INTO @tbl VALUES ('Savinjska'            ,	     'Rogaska Slatina',	'SA',	'RS');
INSERT INTO @tbl VALUES ('Pomurska'            ,	     'Rogasovci',	'PM',	'RO');
INSERT INTO @tbl VALUES ('Savinjska'            ,	     'Rogatec',	'SA',	'RO');
INSERT INTO @tbl VALUES ('Podravska'            ,	     'Ruse',	'PD',	'RU');
INSERT INTO @tbl VALUES ('Pomurska'            ,	     'Salovci',	'PM',	'SA');
INSERT INTO @tbl VALUES ('Podravska'            ,	     'Selnica ob Dravi',	'PD',	'SD');
INSERT INTO @tbl VALUES ('Dolenjska'            ,	     'Semic',	'DO',	'SM');
INSERT INTO @tbl VALUES ('Goriska'            ,	     'Sempeter - Vrtojba',	'SP',	'SV');
INSERT INTO @tbl VALUES ('Gorenjska'            ,	     'Sencur',	'GO',	'SE');
INSERT INTO @tbl VALUES ('Podravska'            ,	     'Sentilj',	'PD',	'SE');
INSERT INTO @tbl VALUES ('Dolenjska'            ,	     'Sentjernej',	'DO',	'SN');
INSERT INTO @tbl VALUES ('Savinjska'            ,	     'Sentjur',	'SA',	'SC');
INSERT INTO @tbl VALUES ('Dolenjska'            ,	     'Sentrupert',	'DO',	'SR');
INSERT INTO @tbl VALUES ('Spodnjeposavska'            ,	     'Sevnica',	'PS',	'SE');
INSERT INTO @tbl VALUES ('Obalno-kraska'            ,	     'Sezana',	'JP',	'SE');
INSERT INTO @tbl VALUES ('Dolenjska'            ,	     'Skocjan',	'DO',	'SK');
INSERT INTO @tbl VALUES ('Gorenjska'            ,	     'Skofja Loka',	'GO',	'SL');
INSERT INTO @tbl VALUES ('Osrednjeslovenska'            ,	     'Skofljica',	'LJ',	'SK');
INSERT INTO @tbl VALUES ('Koroska'            ,	     'Slovenj Gradec',	'KO',	'SG');
INSERT INTO @tbl VALUES ('Podravska'            ,	     'Slovenska Bistrica',	'PD',	'SL');
INSERT INTO @tbl VALUES ('Savinjska'            ,	     'Slovenske Konjice',	'SA',	'SK');
INSERT INTO @tbl VALUES ('Savinjska'            ,	     'Smarje pri Jelsah',	'SA',	'SJ');
INSERT INTO @tbl VALUES ('Dolenjska'            ,	     'Smarjeske Toplice',	'DO',	'ST');
INSERT INTO @tbl VALUES ('Savinjska'            ,	     'Smartno ob Paki',	'SA',	'SP');
INSERT INTO @tbl VALUES ('Osrednjeslovenska'            ,	     'Smartno pri Litiji',	'LJ',	'SL');
INSERT INTO @tbl VALUES ('Osrednjeslovenska'            ,	     'Sodrazica',	'LJ',	'SO');
INSERT INTO @tbl VALUES ('Savinjska'            ,	     'Solcava',	'SA',	'SL');
INSERT INTO @tbl VALUES ('Savinjska'            ,	     'Sostanj',	'SA',	'SS');
INSERT INTO @tbl VALUES ('Podravska'            ,	     'Sredisce ob Dravi',	'PD',	'SR');
INSERT INTO @tbl VALUES ('Podravska'            ,	     'Starse',	'PD',	'ST');
INSERT INTO @tbl VALUES ('Savinjska'            ,	     'Store',	'SA',	'ST');
INSERT INTO @tbl VALUES ('Dolenjska'            ,	     'Straza',	'DO',	'SZ');
INSERT INTO @tbl VALUES ('Podravska'            ,	     'Sveta Ana',	'PD',	'SA');
INSERT INTO @tbl VALUES ('Podravska'            ,	     'Sveta Trojica v Slovenskih Goricah',	'PD',	'SV');
INSERT INTO @tbl VALUES ('Podravska'            ,	     'Sveti Andraz v Slovenskih Goricah',	'PD',	'SS');
INSERT INTO @tbl VALUES ('Pomurska'            ,	     'Sveti Jurij',	'PM',	'SJ');
INSERT INTO @tbl VALUES ('Podravska'            ,	     'Sveti Jurij v Slovenskih Goricah',	'PD',	'SJ');
INSERT INTO @tbl VALUES ('Podravska'            ,	     'Sveti Tomaz',	'PD',	'SZ');
INSERT INTO @tbl VALUES ('Savinjska'            ,	     'Tabor',	'SA',	'TA');
INSERT INTO @tbl VALUES ('Pomurska'            ,	     'Tisina',	'PM',	'TI');
INSERT INTO @tbl VALUES ('Goriska'            ,	     'Tolmin',	'SP',	'TO');
INSERT INTO @tbl VALUES ('Zasavska'            ,	     'Trbovlje',	'ZS',	'TR');
INSERT INTO @tbl VALUES ('Dolenjska'            ,	     'Trebnje',	'DO',	'TN');
INSERT INTO @tbl VALUES ('Podravska'            ,	     'Trnovska Vas',	'PD',	'TV');
INSERT INTO @tbl VALUES ('Osrednjeslovenska'            ,	     'Trzin',	'LJ',	'TR');
INSERT INTO @tbl VALUES ('Gorenjska'            ,	     'Trzic',	'GO',	'TR');
INSERT INTO @tbl VALUES ('Pomurska'            ,	     'Turnisce',	'PM',	'TU');
INSERT INTO @tbl VALUES ('Savinjska'            ,	     'Velenje',	'SA',	'VE');
INSERT INTO @tbl VALUES ('Pomurska'            ,	     'Velika Polana',	'PM',	'VP');
INSERT INTO @tbl VALUES ('Osrednjeslovenska'            ,	     'Velike Lasce',	'LJ',	'VL');
INSERT INTO @tbl VALUES ('Pomurska'            ,	     'Verzej',	'PM',	'VE');
INSERT INTO @tbl VALUES ('Podravska'            ,	     'Videm',	'PD',	'VI');
INSERT INTO @tbl VALUES ('Goriska'            ,	     'Vipava',	'SP',	'VI');
INSERT INTO @tbl VALUES ('Savinjska'            ,	     'Vitanje',	'SA',	'VI');
INSERT INTO @tbl VALUES ('Osrednjeslovenska'            ,	     'Vodice',	'LJ',	'VO');
INSERT INTO @tbl VALUES ('Savinjska'            ,	     'Vojnik',	'SA',	'VO');
INSERT INTO @tbl VALUES ('Savinjska'            ,	     'Vransko',	'SA',	'VR');
INSERT INTO @tbl VALUES ('Osrednjeslovenska'            ,	     'Vrhnika',	'LJ',	'VN');
INSERT INTO @tbl VALUES ('Koroska'            ,	     'Vuzenica',	'KO',	'VU');
INSERT INTO @tbl VALUES ('Zasavska'            ,	     'Zagorje ob Savi',	'ZS',	'ZS');
INSERT INTO @tbl VALUES ('Savinjska'            ,	     'Zalec',	'SA',	'ZA');
INSERT INTO @tbl VALUES ('Podravska'            ,	     'Zavrc',	'PD',	'ZA');
INSERT INTO @tbl VALUES ('Gorenjska'            ,	     'Zelezniki',	'GO',	'ZE');
INSERT INTO @tbl VALUES ('Podravska'            ,	     'Zetale',	'PD',	'ZE');
INSERT INTO @tbl VALUES ('Gorenjska'            ,	     'Ziri',	'GO',	'ZI');
INSERT INTO @tbl VALUES ('Gorenjska'            ,	     'Zirovnica',	'GO',	'ZV');
INSERT INTO @tbl VALUES ('Savinjska'            ,	     'Zrece',	'SA',	'ZR');
INSERT INTO @tbl VALUES ('Dolenjska'            ,	     'Zuzemberk',	'DO',	'ZU');

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

