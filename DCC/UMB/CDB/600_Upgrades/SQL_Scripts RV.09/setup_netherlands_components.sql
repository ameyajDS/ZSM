
/* ==================================================================================
    	Source File		:	setup_netherlands_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	12-10-2014
	Module ID		:	CDB
	Last updated		:	12-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Netherlands are set-up
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
WHERE	country_nm	=	'Netherlands';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Netherlands not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Province',
		level_2_address_component	=	'Municipality',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Drenthe'            ,	     'Aa en Hunze',	'DR',	'AH');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Aalburg',	'NB',	'AA');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Aalsmeer',	'NH',	'AA');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Aalten',	'GE',	'AA');
INSERT INTO @tbl VALUES ('Utrecht'            ,	     'Abcoude',	'UT',	'AB');
INSERT INTO @tbl VALUES ('Friesland'            ,	     'Achtkarspelen',	'FR',	'AC');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Akersloot',	'NH',	'AK');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Alblasserdam',	'ZH',	'AS');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Albrandswaard',	'ZH',	'AW');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Alkemade',	'ZH',	'AK');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Alkmaar',	'NH',	'AL');
INSERT INTO @tbl VALUES ('Overijssel'            ,	     'Almelo',	'OV',	'AL');
INSERT INTO @tbl VALUES ('Flevoland'            ,	     'Almere',	'FL',	'AL');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Alphen aan den Rijn',	'ZH',	'AR');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Alphen-Chaam',	'NB',	'AC');
INSERT INTO @tbl VALUES ('Limburg'            ,	     'Ambt Montfort',	'LI',	'AM');
INSERT INTO @tbl VALUES ('Friesland'            ,	     'Ameland',	'FR',	'AM');
INSERT INTO @tbl VALUES ('Utrecht'            ,	     'Amerongen',	'UT',	'AN');
INSERT INTO @tbl VALUES ('Utrecht'            ,	     'Amersfoort',	'UT',	'AF');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Amstelveen',	'NH',	'AV');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Amsterdam',	'NH',	'AD');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Andijk',	'NH',	'AN');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Angerlo',	'GE',	'AN');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Anna Paulowna',	'NH',	'AP');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Apeldoorn',	'GE',	'AP');
INSERT INTO @tbl VALUES ('Groningen'            ,	     'Appingedam',	'GR',	'AP');
INSERT INTO @tbl VALUES ('Limburg'            ,	     'Arcen en Velden',	'LI',	'AV');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Arnhem',	'GE',	'AR');
INSERT INTO @tbl VALUES ('Drenthe'            ,	     'Assen',	'DR',	'AS');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Asten',	'NB',	'AS');
INSERT INTO @tbl VALUES ('Zeeland'            ,	     'Axel',	'ZE',	'AX');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Baarle-Nassau',	'NB',	'BN');
INSERT INTO @tbl VALUES ('Utrecht'            ,	     'Baarn',	'UT',	'BA');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Barendrecht',	'ZH',	'BA');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Barneveld',	'GE',	'BA');
INSERT INTO @tbl VALUES ('Overijssel'            ,	     'Bathmen',	'OV',	'BA');
INSERT INTO @tbl VALUES ('Groningen'            ,	     'Bedum',	'GR',	'BD');
INSERT INTO @tbl VALUES ('Limburg'            ,	     'Beek',	'LI',	'BK');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Beemster',	'NH',	'BM');
INSERT INTO @tbl VALUES ('Limburg'            ,	     'Beesel',	'LI',	'BS');
INSERT INTO @tbl VALUES ('Groningen'            ,	     'Bellingwedde',	'GR',	'BL');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Bemmel',	'GE',	'BM');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Bennebroek',	'NH',	'BB');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Bergambacht',	'ZH',	'BB');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Bergeijk',	'NB',	'BG');
INSERT INTO @tbl VALUES ('Limburg'            ,	     'Bergen',	'LI',	'BG');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Bergen',	'NH',	'BG');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Bergen op Zoom',	'NB',	'BZ');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Bergh',	'GE',	'BG');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Bergschenhoek',	'ZH',	'BH');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Berkel en Rodenrijs',	'ZH',	'BR');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Bernheze',	'NB',	'BH');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Bernisse',	'ZH',	'BE');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Best',	'NB',	'BS');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Beuningen',	'GE',	'BE');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Beverwijk',	'NH',	'BV');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Binnenmaas',	'ZH',	'BI');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Bladel',	'NB',	'BL');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Blaricum',	'NH',	'BC');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Bleiswijk',	'ZH',	'BW');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Bloemendaal',	'NH',	'BL');
INSERT INTO @tbl VALUES ('Friesland'            ,	     'Boarnsterhim',	'FR',	'BR');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Bodegraven',	'ZH',	'BG');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Boekel',	'NB',	'BO');
INSERT INTO @tbl VALUES ('Friesland'            ,	     'Bolsward',	'FR',	'BL');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Borculo',	'GE',	'BO');
INSERT INTO @tbl VALUES ('Drenthe'            ,	     'Borger-Odoorn',	'DR',	'BO');
INSERT INTO @tbl VALUES ('Overijssel'            ,	     'Borne',	'OV',	'BO');
INSERT INTO @tbl VALUES ('Zeeland'            ,	     'Borsele',	'ZE',	'BO');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Boskoop',	'ZH',	'BK');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Boxmeer',	'NB',	'BM');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Boxtel',	'NB',	'BT');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Breda',	'NB',	'BR');
INSERT INTO @tbl VALUES ('Utrecht'            ,	     'Breukelen',	'UT',	'BR');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Brielle',	'ZH',	'BL');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Brummen',	'GE',	'BR');
INSERT INTO @tbl VALUES ('Limburg'            ,	     'Brunssum',	'LI',	'BR');
INSERT INTO @tbl VALUES ('Utrecht'            ,	     'Bunnik',	'UT',	'BK');
INSERT INTO @tbl VALUES ('Utrecht'            ,	     'Bunschoten',	'UT',	'BS');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Buren',	'GE',	'BU');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Bussum',	'NH',	'BU');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Capelle aan den IJssel',	'ZH',	'CI');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Castricum',	'NH',	'CA');
INSERT INTO @tbl VALUES ('Drenthe'            ,	     'Coevorden',	'DR',	'CO');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Cranendonck',	'NB',	'CR');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Cromstrijen',	'ZH',	'CR');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Cuijk',	'NB',	'CU');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Culemborg',	'GE',	'CU');
INSERT INTO @tbl VALUES ('Overijssel'            ,	     'Dalfsen',	'OV',	'DA');
INSERT INTO @tbl VALUES ('Friesland'            ,	     'Dantumadeel',	'FR',	'DA');
INSERT INTO @tbl VALUES ('Utrecht'            ,	     'De Bilt',	'UT',	'DB');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Delft',	'ZH',	'DE');
INSERT INTO @tbl VALUES ('Groningen'            ,	     'Delfzijl',	'GR',	'DE');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'De Lier',	'ZH',	'DL');
INSERT INTO @tbl VALUES ('Groningen'            ,	     'De Marne',	'GR',	'DM');
INSERT INTO @tbl VALUES ('Overijssel'            ,	     'Denekamp',	'OV',	'DN');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Den Haag',	'ZH',	'DH');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Den Helder',	'NH',	'DH');
INSERT INTO @tbl VALUES ('Utrecht'            ,	     'De Ronde Venen',	'UT',	'DV');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Deurne',	'NB',	'DE');
INSERT INTO @tbl VALUES ('Overijssel'            ,	     'Deventer',	'OV',	'DV');
INSERT INTO @tbl VALUES ('Drenthe'            ,	     'De Wolden',	'DR',	'DW');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Didam',	'GE',	'DD');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Diemen',	'NH',	'DI');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Dinxperlo',	'GE',	'DX');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Dirksland',	'ZH',	'DI');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Dodewaard',	'GE',	'DW');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Doesburg',	'GE',	'DB');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Doetinchem',	'GE',	'DT');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Dongen',	'NB',	'DO');
INSERT INTO @tbl VALUES ('Friesland'            ,	     'Dongeradeel',	'FR',	'DO');
INSERT INTO @tbl VALUES ('Utrecht'            ,	     'Doorn',	'UT',	'DO');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Dordrecht',	'ZH',	'DO');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Drechterland',	'NH',	'DR');
INSERT INTO @tbl VALUES ('Utrecht'            ,	     'Driebergen-Rijsenburg',	'UT',	'DR');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Drimmelen',	'NB',	'DR');
INSERT INTO @tbl VALUES ('Flevoland'            ,	     'Dronten',	'FL',	'DR');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Druten',	'GE',	'DR');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Duiven',	'GE',	'DU');
INSERT INTO @tbl VALUES ('Limburg'            ,	     'Echt',	'LI',	'EC');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Echteld',	'GE',	'EC');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Edam-Volendam',	'NH',	'EV');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Ede',	'GE',	'ED');
INSERT INTO @tbl VALUES ('Utrecht'            ,	     'Eemnes',	'UT',	'EE');
INSERT INTO @tbl VALUES ('Groningen'            ,	     'Eemsmond',	'GR',	'EE');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Eersel',	'NB',	'EE');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Eibergen',	'GE',	'EI');
INSERT INTO @tbl VALUES ('Limburg'            ,	     'Eijsden',	'LI',	'EI');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Eindhoven',	'NB',	'EI');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Elburg',	'GE',	'EL');
INSERT INTO @tbl VALUES ('Drenthe'            ,	     'Emmen',	'DR',	'EM');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Enkhuizen',	'NH',	'EN');
INSERT INTO @tbl VALUES ('Overijssel'            ,	     'Enschede',	'OV',	'EN');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Epe',	'GE',	'EP');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Ermelo',	'GE',	'ER');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Etten-Leur',	'NB',	'EL');
INSERT INTO @tbl VALUES ('Friesland'            ,	     'Ferwerderadiel',	'FR',	'FE');
INSERT INTO @tbl VALUES ('Friesland'            ,	     'Franekeradeel',	'FR',	'FR');
INSERT INTO @tbl VALUES ('Friesland'            ,	     'Gaasterlan-Sleat',	'FR',	'GS');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Geertruidenberg',	'NB',	'GE');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Geldermalsen',	'GE',	'GM');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Geldrop',	'NB',	'GD');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Gemert-Bakel',	'NB',	'GB');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Gendringen',	'GE',	'GN');
INSERT INTO @tbl VALUES ('Limburg'            ,	     'Gennep',	'LI',	'GE');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Giessenlanden',	'ZH',	'GI');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Gilze en Rijen',	'NB',	'GR');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Goedereede',	'ZH',	'GD');
INSERT INTO @tbl VALUES ('Zeeland'            ,	     'Goes',	'ZE',	'GO');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Goirle',	'NB',	'GO');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Gorinchem',	'ZH',	'GC');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Gorssel',	'GE',	'GO');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Gouda',	'ZH',	'GO');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Graafstroom',	'ZH',	'GR');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Graft-De Rijp',	'NH',	'GD');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Grave',	'NB',	'GV');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Groenlo',	'GE',	'GR');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Groesbeek',	'GE',	'GB');
INSERT INTO @tbl VALUES ('Groningen'            ,	     'Groningen',	'GR',	'GR');
INSERT INTO @tbl VALUES ('Groningen'            ,	     'Grootegast',	'GR',	'GT');
INSERT INTO @tbl VALUES ('Limburg'            ,	     'Gulpen-Wittem',	'LI',	'GW');
INSERT INTO @tbl VALUES ('Overijssel'            ,	     'Haaksbergen',	'OV',	'HK');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Haaren',	'NB',	'HR');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Haarlem',	'NH',	'HA');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Haarlemmerliede en Spaarnwoude',	'NH',	'HS');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Haarlemmermeer',	'NH',	'HM');
INSERT INTO @tbl VALUES ('Limburg'            ,	     'Haelen',	'LI',	'HA');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Halderberge',	'NB',	'HB');
INSERT INTO @tbl VALUES ('Overijssel'            ,	     'Hardenberg',	'OV',	'HD');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Harderwijk',	'GE',	'HW');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Hardinxveld-Giessendam',	'ZH',	'HG');
INSERT INTO @tbl VALUES ('Groningen'            ,	     'Haren',	'GR',	'HA');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Harenkarspel',	'NH',	'HP');
INSERT INTO @tbl VALUES ('Friesland'            ,	     'Harlingen',	'FR',	'HA');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Hattem',	'GE',	'HT');
INSERT INTO @tbl VALUES ('Limburg'            ,	     'Heel',	'LI',	'HL');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Heemskerk',	'NH',	'HK');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Heemstede',	'NH',	'HE');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Heerde',	'GE',	'HR');
INSERT INTO @tbl VALUES ('Friesland'            ,	     'Heerenveen',	'FR',	'HE');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Heerhugowaard',	'NH',	'HH');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Heerjansdam',	'ZH',	'HJ');
INSERT INTO @tbl VALUES ('Limburg'            ,	     'Heerlen',	'LI',	'HR');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Heeze-Leende',	'NB',	'HL');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Heiloo',	'NH',	'HL');
INSERT INTO @tbl VALUES ('Limburg'            ,	     'Helden',	'LI',	'HD');
INSERT INTO @tbl VALUES ('Overijssel'            ,	     'Hellendoorn',	'OV',	'HL');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Hellevoetsluis',	'ZH',	'HV');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Helmond',	'NB',	'HM');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Hendrik-Ido-Ambacht',	'ZH',	'HI');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Hengelo',	'GE',	'HG');
INSERT INTO @tbl VALUES ('Overijssel'            ,	     'Hengelo',	'OV',	'HN');
INSERT INTO @tbl VALUES ('Friesland'            ,	     'Het Bildt',	'FR',	'HB');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Heumen',	'GE',	'HM');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Heusden',	'NB',	'HS');
INSERT INTO @tbl VALUES ('Limburg'            ,	     'Heythuysen',	'LI',	'HT');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Hillegom',	'ZH',	'HL');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Hilvarenbeek',	'NB',	'HI');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Hilversum',	'NH',	'HI');
INSERT INTO @tbl VALUES ('Overijssel'            ,	     'Hof van Twente',	'OV',	'HT');
INSERT INTO @tbl VALUES ('Zeeland'            ,	     'Hontenisse',	'ZE',	'HO');
INSERT INTO @tbl VALUES ('Drenthe'            ,	     'Hoogeveen',	'DR',	'HO');
INSERT INTO @tbl VALUES ('Groningen'            ,	     'Hoogezand-Sappemeer',	'GR',	'HS');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Hoorn',	'NH',	'HO');
INSERT INTO @tbl VALUES ('Limburg'            ,	     'Horst aan de Maas',	'LI',	'HM');
INSERT INTO @tbl VALUES ('Utrecht'            ,	     'Houten',	'UT',	'HO');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Huizen',	'NH',	'HU');
INSERT INTO @tbl VALUES ('Zeeland'            ,	     'Hulst',	'ZE',	'HU');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Hummelo en Keppel',	'GE',	'HK');
INSERT INTO @tbl VALUES ('Limburg'            ,	     'Hunsel',	'LI',	'HU');
INSERT INTO @tbl VALUES ('Utrecht'            ,	     'IJsselstein',	'UT',	'IJ');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Jacobswoude',	'ZH',	'JA');
INSERT INTO @tbl VALUES ('Overijssel'            ,	     'Kampen',	'OV',	'KA');
INSERT INTO @tbl VALUES ('Zeeland'            ,	     'Kapelle',	'ZE',	'KA');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Katwijk',	'ZH',	'KA');
INSERT INTO @tbl VALUES ('Limburg'            ,	     'Kerkrade',	'LI',	'KR');
INSERT INTO @tbl VALUES ('Limburg'            ,	     'Kessel',	'LI',	'KS');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Kesteren',	'GE',	'KE');
INSERT INTO @tbl VALUES ('Friesland'            ,	     'Kollumerland en Nieuwkruisland',	'FR',	'KN');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Korendijk',	'ZH',	'KO');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Krimpen aan den IJssel',	'ZH',	'KI');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Laarbeek',	'NB',	'LB');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Landerd',	'NB',	'LN');
INSERT INTO @tbl VALUES ('Limburg'            ,	     'Landgraaf',	'LI',	'LA');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Landsmeer',	'NH',	'LM');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Langedijk',	'NH',	'LD');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Laren',	'NH',	'LR');
INSERT INTO @tbl VALUES ('Groningen'            ,	     'Leek',	'GR',	'LE');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Leerdam',	'ZH',	'LR');
INSERT INTO @tbl VALUES ('Utrecht'            ,	     'Leersum',	'UT',	'LR');
INSERT INTO @tbl VALUES ('Friesland'            ,	     'Leeuwarden',	'FR',	'LW');
INSERT INTO @tbl VALUES ('Friesland'            ,	     'Leeuwarderadeel',	'FR',	'LD');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Leiden',	'ZH',	'LD');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Leiderdorp',	'ZH',	'LP');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Leidschendam',	'ZH',	'LE');
INSERT INTO @tbl VALUES ('Flevoland'            ,	     'Lelystad',	'FL',	'LE');
INSERT INTO @tbl VALUES ('Friesland'            ,	     'Lemsterland',	'FR',	'LL');
INSERT INTO @tbl VALUES ('Utrecht'            ,	     'Leusden',	'UT',	'LD');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Lichtenvoorde',	'GE',	'LV');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Liemeer',	'ZH',	'LM');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Liesveld',	'ZH',	'LV');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Limmen',	'NH',	'LI');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Lingewaal',	'GE',	'LW');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Lisse',	'ZH',	'LS');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Lith',	'NB',	'LI');
INSERT INTO @tbl VALUES ('Friesland'            ,	     'Littenseradiel',	'FR',	'LI');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Lochem',	'GE',	'LO');
INSERT INTO @tbl VALUES ('Utrecht'            ,	     'Loenen',	'UT',	'LN');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Loon op Zand',	'NB',	'LZ');
INSERT INTO @tbl VALUES ('Utrecht'            ,	     'Loosdrecht',	'UT',	'LO');
INSERT INTO @tbl VALUES ('Utrecht'            ,	     'Lopik',	'UT',	'LP');
INSERT INTO @tbl VALUES ('Groningen'            ,	     'Loppersum',	'GR',	'LO');
INSERT INTO @tbl VALUES ('Overijssel'            ,	     'Losser',	'OV',	'LO');
INSERT INTO @tbl VALUES ('Utrecht'            ,	     'Maarn',	'UT',	'MN');
INSERT INTO @tbl VALUES ('Utrecht'            ,	     'Maarssen',	'UT',	'MS');
INSERT INTO @tbl VALUES ('Limburg'            ,	     'Maasbracht',	'LI',	'MT');
INSERT INTO @tbl VALUES ('Limburg'            ,	     'Maasbree',	'LI',	'MB');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Maasdonk',	'NB',	'MA');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Maasdriel',	'GE',	'MA');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Maasland',	'ZH',	'ML');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Maassluis',	'ZH',	'MS');
INSERT INTO @tbl VALUES ('Limburg'            ,	     'Maastricht',	'LI',	'MA');
INSERT INTO @tbl VALUES ('Limburg'            ,	     'Margraten',	'LI',	'MG');
INSERT INTO @tbl VALUES ('Groningen'            ,	     'Marum',	'GR',	'MA');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Medemblik',	'NH',	'ME');
INSERT INTO @tbl VALUES ('Limburg'            ,	     'Meerlo-Wanssum',	'LI',	'MW');
INSERT INTO @tbl VALUES ('Limburg'            ,	     'Meerssen',	'LI',	'MS');
INSERT INTO @tbl VALUES ('Limburg'            ,	     'Meijel',	'LI',	'MJ');
INSERT INTO @tbl VALUES ('Friesland'            ,	     'Menaldumadeel',	'FR',	'ME');
INSERT INTO @tbl VALUES ('Groningen'            ,	     'Menterwolde',	'GR',	'ME');
INSERT INTO @tbl VALUES ('Drenthe'            ,	     'Meppel',	'DR',	'ME');
INSERT INTO @tbl VALUES ('Zeeland'            ,	     'Middelburg',	'ZE',	'MI');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Middelharnis',	'ZH',	'MI');
INSERT INTO @tbl VALUES ('Drenthe'            ,	     'Midden-Drenthe',	'DR',	'MD');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Mierlo',	'NB',	'MI');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Mill en Sint Hubert',	'NB',	'MS');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Millingen aan de Rijn',	'GE',	'MR');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Moerdijk',	'NB',	'MO');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Monster',	'ZH',	'MN');
INSERT INTO @tbl VALUES ('Utrecht'            ,	     'Montfoort',	'UT',	'MO');
INSERT INTO @tbl VALUES ('Limburg'            ,	     'Mook en Middelaar',	'LI',	'MM');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Moordrecht',	'ZH',	'MR');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Muiden',	'NH',	'MU');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Naaldwijk',	'ZH',	'NA');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Naarden',	'NH',	'NA');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Nederhorst den Berg',	'NH',	'NB');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Nederlek',	'ZH',	'NE');
INSERT INTO @tbl VALUES ('Limburg'            ,	     'Nederweert',	'LI',	'NE');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Neede',	'GE',	'ND');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Neerijnen',	'GE',	'NR');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Niedorp',	'NH',	'NI');
INSERT INTO @tbl VALUES ('Utrecht'            ,	     'Nieuwegein',	'UT',	'NI');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Nieuwerkerk aan den IJssel',	'ZH',	'NI');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Nieuwkoop',	'ZH',	'NK');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Nieuw-Lekkerland',	'ZH',	'NL');
INSERT INTO @tbl VALUES ('Friesland'            ,	     'Nijefurd',	'FR',	'NI');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Nijkerk',	'GE',	'NK');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Nijmegen',	'GE',	'NM');
INSERT INTO @tbl VALUES ('Zeeland'            ,	     'Noord-Beveland',	'ZE',	'NB');
INSERT INTO @tbl VALUES ('Drenthe'            ,	     'Noordenveld',	'DR',	'NO');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Noorder-Koggenland',	'NH',	'NK');
INSERT INTO @tbl VALUES ('Flevoland'            ,	     'Noordoostpolder',	'FL',	'NO');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Noordwijk',	'ZH',	'NW');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Noordwijkerhout',	'ZH',	'NH');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Nootdorp',	'ZH',	'ND');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Nuenen, Gerwen en Nederwetten',	'NB',	'NG');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Nunspeet',	'GE',	'NU');
INSERT INTO @tbl VALUES ('Limburg'            ,	     'Nuth',	'LI',	'NU');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Obdam',	'NH',	'OB');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Oegstgeest',	'ZH',	'OE');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Oirschot',	'NB',	'OR');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Oisterwijk',	'NB',	'OW');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Oldebroek',	'GE',	'OL');
INSERT INTO @tbl VALUES ('Overijssel'            ,	     'Oldenzaal',	'OV',	'OZ');
INSERT INTO @tbl VALUES ('Overijssel'            ,	     'Olst',	'OV',	'OT');
INSERT INTO @tbl VALUES ('Overijssel'            ,	     'Ommen',	'OV',	'OM');
INSERT INTO @tbl VALUES ('Limburg'            ,	     'Onderbanken',	'LI',	'ON');
INSERT INTO @tbl VALUES ('Zeeland'            ,	     'Oostburg',	'ZE',	'OO');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Oosterhout',	'NB',	'OO');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Oostflakkee',	'ZH',	'OO');
INSERT INTO @tbl VALUES ('Friesland'            ,	     'Ooststellingwerf',	'FR',	'OO');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Oostzaan',	'NH',	'OO');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Opmeer',	'NH',	'OP');
INSERT INTO @tbl VALUES ('Friesland'            ,	     'Opsterland',	'FR',	'OP');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Oss',	'NB',	'OS');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Oud-Beijerland',	'ZH',	'OB');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Ouder-Amstel',	'NH',	'OA');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Ouderkerk',	'ZH',	'OU');
INSERT INTO @tbl VALUES ('Utrecht'            ,	     'Oudewater',	'UT',	'OU');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Overbetuwe',	'GE',	'OV');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Papendrecht',	'ZH',	'PA');
INSERT INTO @tbl VALUES ('Groningen'            ,	     'Pekela',	'GR',	'PE');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Pijnacker',	'ZH',	'PI');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Purmerend',	'NH',	'PU');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Putten',	'GE',	'PU');
INSERT INTO @tbl VALUES ('Overijssel'            ,	     'Raalte',	'OV',	'RA');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Ravenstein',	'NB',	'RA');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Reeuwijk',	'ZH',	'RE');
INSERT INTO @tbl VALUES ('Groningen'            ,	     'Reiderland',	'GR',	'RE');
INSERT INTO @tbl VALUES ('Zeeland'            ,	     'Reimerswaal',	'ZE',	'RE');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Renkum',	'GE',	'RE');
INSERT INTO @tbl VALUES ('Utrecht'            ,	     'Renswoude',	'UT',	'RE');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Reusel-De Mierden',	'NB',	'RD');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Rheden',	'GE',	'RH');
INSERT INTO @tbl VALUES ('Utrecht'            ,	     'Rhenen',	'UT',	'RH');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Ridderkerk',	'ZH',	'RK');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Rijnsburg',	'ZH',	'RB');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Rijnwaarden',	'GE',	'RI');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Rijnwoude',	'ZH',	'RW');
INSERT INTO @tbl VALUES ('Overijssel'            ,	     'Rijssen',	'OV',	'RI');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Rijswijk',	'ZH',	'RJ');
INSERT INTO @tbl VALUES ('Limburg'            ,	     'Roerdalen',	'LI',	'RD');
INSERT INTO @tbl VALUES ('Limburg'            ,	     'Roermond',	'LI',	'RM');
INSERT INTO @tbl VALUES ('Limburg'            ,	     'Roggel en Neer',	'LI',	'RN');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Roosendaal',	'NB',	'RO');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Rotterdam',	'ZH',	'RT');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Rozenburg',	'ZH',	'RZ');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Rozendaal',	'GE',	'RO');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Rucphen',	'NB',	'RU');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Ruurlo',	'GE',	'RU');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Sassenheim',	'ZH',	'SS');
INSERT INTO @tbl VALUES ('Zeeland'            ,	     'Sas van Gent',	'ZE',	'SG');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Schagen',	'NH',	'SN');
INSERT INTO @tbl VALUES ('Groningen'            ,	     'Scheemda',	'GR',	'SC');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Schermer',	'NH',	'SR');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Scherpenzeel',	'GE',	'SC');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Schiedam',	'ZH',	'SM');
INSERT INTO @tbl VALUES ('Friesland'            ,	     'Schiermonnikoog',	'FR',	'SC');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Schijndel',	'NB',	'SC');
INSERT INTO @tbl VALUES ('Limburg'            ,	     'Schinnen',	'LI',	'SC');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Schipluiden',	'ZH',	'SC');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Schoonhoven',	'ZH',	'SH');
INSERT INTO @tbl VALUES ('Zeeland'            ,	     'Schouwen-Duiveland',	'ZE',	'SD');
INSERT INTO @tbl VALUES ('Limburg'            ,	     'Sevenum',	'LI',	'SE');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     '''s-Graveland',	'NH',	'SG');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     '''s-Gravendeel',	'ZH',	'SD');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     '''s-Gravenzande',	'ZH',	'SZ');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     '''s-Hertogenbosch',	'NB',	'SH');
INSERT INTO @tbl VALUES ('Limburg'            ,	     'Simpelveld',	'LI',	'SI');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Sint Anthonis',	'NB',	'SA');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Sint-Michielsgestel',	'NB',	'SM');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Sint-Oedenrode',	'NB',	'SO');
INSERT INTO @tbl VALUES ('Limburg'            ,	     'Sittard-Geleen',	'LI',	'SG');
INSERT INTO @tbl VALUES ('Friesland'            ,	     'Skarsterlan',	'FR',	'SK');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Sliedrecht',	'ZH',	'SL');
INSERT INTO @tbl VALUES ('Groningen'            ,	     'Slochteren',	'GR',	'SL');
INSERT INTO @tbl VALUES ('Zeeland'            ,	     'Sluis-Aardenburg',	'ZE',	'SA');
INSERT INTO @tbl VALUES ('Friesland'            ,	     'Smallingerland',	'FR',	'SM');
INSERT INTO @tbl VALUES ('Friesland'            ,	     'Sneek',	'FR',	'SN');
INSERT INTO @tbl VALUES ('Utrecht'            ,	     'Soest',	'UT',	'SO');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Someren',	'NB',	'SR');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Son en Breugel',	'NB',	'SB');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Spijkenisse',	'ZH',	'SP');
INSERT INTO @tbl VALUES ('Groningen'            ,	     'Stadskanaal',	'GR',	'ST');
INSERT INTO @tbl VALUES ('Overijssel'            ,	     'Staphorst',	'OV',	'SH');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Stede Broec',	'NH',	'SB');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Steenbergen',	'NB',	'ST');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Steenderen',	'GE',	'ST');
INSERT INTO @tbl VALUES ('Overijssel'            ,	     'Steenwijk',	'OV',	'SW');
INSERT INTO @tbl VALUES ('Limburg'            ,	     'Stein',	'LI',	'ST');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Strijen',	'ZH',	'ST');
INSERT INTO @tbl VALUES ('Limburg'            ,	     'Susteren',	'LI',	'SU');
INSERT INTO @tbl VALUES ('Limburg'            ,	     'Swalmen',	'LI',	'SW');
INSERT INTO @tbl VALUES ('Groningen'            ,	     'Ten Boer',	'GR',	'TB');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Ter Aar',	'ZH',	'TA');
INSERT INTO @tbl VALUES ('Zeeland'            ,	     'Terneuzen',	'ZE',	'TE');
INSERT INTO @tbl VALUES ('Friesland'            ,	     'Terschelling',	'FR',	'TE');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Texel',	'NH',	'TE');
INSERT INTO @tbl VALUES ('Zeeland'            ,	     'Tholen',	'ZE',	'TH');
INSERT INTO @tbl VALUES ('Limburg'            ,	     'Thorn',	'LI',	'TH');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Tiel',	'GE',	'TI');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Tilburg',	'NB',	'TI');
INSERT INTO @tbl VALUES ('Overijssel'            ,	     'Tubbergen',	'OV',	'TU');
INSERT INTO @tbl VALUES ('Drenthe'            ,	     'Tynaarlo',	'DR',	'TY');
INSERT INTO @tbl VALUES ('Friesland'            ,	     'Tytsjerksteradiel',	'FR',	'TY');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Ubbergen',	'GE',	'UB');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Uden',	'NB',	'UD');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Uitgeest',	'NH',	'UG');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Uithoorn',	'NH',	'UH');
INSERT INTO @tbl VALUES ('Flevoland'            ,	     'Urk',	'FL',	'UR');
INSERT INTO @tbl VALUES ('Utrecht'            ,	     'Utrecht',	'UT',	'UT');
INSERT INTO @tbl VALUES ('Limburg'            ,	     'Vaals',	'LI',	'VA');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Valkenburg',	'ZH',	'VA');
INSERT INTO @tbl VALUES ('Limburg'            ,	     'Valkenburg aan de Geul',	'LI',	'VG');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Valkenswaard',	'NB',	'VA');
INSERT INTO @tbl VALUES ('Groningen'            ,	     'Veendam',	'GR',	'VE');
INSERT INTO @tbl VALUES ('Utrecht'            ,	     'Veenendaal',	'UT',	'VE');
INSERT INTO @tbl VALUES ('Zeeland'            ,	     'Veere',	'ZE',	'VE');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Veghel',	'NB',	'VG');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Veldhoven',	'NB',	'VH');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Velsen',	'NH',	'VL');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Venhuizen',	'NH',	'VN');
INSERT INTO @tbl VALUES ('Limburg'            ,	     'Venlo',	'LI',	'VL');
INSERT INTO @tbl VALUES ('Limburg'            ,	     'Venray',	'LI',	'VR');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Vianen',	'ZH',	'VI');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Vlaardingen',	'ZH',	'VD');
INSERT INTO @tbl VALUES ('Groningen'            ,	     'Vlagtwedde',	'GR',	'VL');
INSERT INTO @tbl VALUES ('Friesland'            ,	     'Vlieland',	'FR',	'VL');
INSERT INTO @tbl VALUES ('Zeeland'            ,	     'Vlissingen',	'ZE',	'VL');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Vlist',	'ZH',	'VT');
INSERT INTO @tbl VALUES ('Limburg'            ,	     'Voerendaal',	'LI',	'VO');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Voorburg',	'ZH',	'VB');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Voorhout',	'ZH',	'VH');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Voorschoten',	'ZH',	'VS');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Voorst',	'GE',	'VS');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Vorden',	'GE',	'VD');
INSERT INTO @tbl VALUES ('Overijssel'            ,	     'Vriezenveen',	'OV',	'VR');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Vught',	'NB',	'VU');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Waalre',	'NB',	'WR');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Waalwijk',	'NB',	'WW');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Waddinxveen',	'ZH',	'WX');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Wageningen',	'GE',	'WG');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Warmond',	'ZH',	'WM');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Warnsveld',	'GE',	'WR');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Wassenaar',	'ZH',	'WS');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Wateringen',	'ZH',	'WT');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Waterland',	'NH',	'WA');
INSERT INTO @tbl VALUES ('Limburg'            ,	     'Weert',	'LI',	'WE');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Weesp',	'NH',	'WS');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Wehl',	'GE',	'WL');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Werkendam',	'NB',	'WE');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Wervershoof',	'NH',	'WV');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Wester-Koggenland',	'NH',	'WK');
INSERT INTO @tbl VALUES ('Drenthe'            ,	     'Westerveld',	'DR',	'WE');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Westervoort',	'GE',	'WV');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'West Maas en Waal',	'GE',	'WM');
INSERT INTO @tbl VALUES ('Friesland'            ,	     'Weststellingwerf',	'FR',	'WE');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Westvoorne',	'ZH',	'WE');
INSERT INTO @tbl VALUES ('Overijssel'            ,	     'Wierden',	'OV',	'WI');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Wieringen',	'NH',	'WR');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Wieringermeer',	'NH',	'WM');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Wijchen',	'GE',	'WC');
INSERT INTO @tbl VALUES ('Utrecht'            ,	     'Wijk bij Duurstede',	'UT',	'WD');
INSERT INTO @tbl VALUES ('Groningen'            ,	     'Winschoten',	'GR',	'WT');
INSERT INTO @tbl VALUES ('Groningen'            ,	     'Winsum',	'GR',	'WM');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Winterswijk',	'GE',	'WW');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Wisch',	'GE',	'WS');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Woensdrecht',	'NB',	'WD');
INSERT INTO @tbl VALUES ('Utrecht'            ,	     'Woerden',	'UT',	'WR');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Wognum',	'NH',	'WG');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Wormerland',	'NH',	'WO');
INSERT INTO @tbl VALUES ('Utrecht'            ,	     'Woudenberg',	'UT',	'WB');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Woudrichem',	'NB',	'WO');
INSERT INTO @tbl VALUES ('Friesland'            ,	     'Wunseradiel',	'FR',	'WU');
INSERT INTO @tbl VALUES ('Friesland'            ,	     'Wymbritseradiel',	'FR',	'WY');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Zaanstad',	'NH',	'ZS');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Zaltbommel',	'GE',	'ZA');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Zandvoort',	'NH',	'ZD');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Zederik',	'ZH',	'ZE');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Zeevang',	'NH',	'ZE');
INSERT INTO @tbl VALUES ('Flevoland'            ,	     'Zeewolde',	'FL',	'ZE');
INSERT INTO @tbl VALUES ('Utrecht'            ,	     'Zeist',	'UT',	'ZE');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Zelhem',	'GE',	'ZL');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Zevenaar',	'GE',	'ZV');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Zevenhuizen-Moerkapelle',	'ZH',	'ZM');
INSERT INTO @tbl VALUES ('Noord-Holland'            ,	     'Zijpe',	'NH',	'ZI');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Zoetermeer',	'ZH',	'ZR');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Zoeterwoude',	'ZH',	'ZD');
INSERT INTO @tbl VALUES ('Groningen'            ,	     'Zuidhorn',	'GR',	'ZU');
INSERT INTO @tbl VALUES ('Noord-Brabant'            ,	     'Zundert',	'NB',	'ZU');
INSERT INTO @tbl VALUES ('Gelderland'            ,	     'Zutphen',	'GE',	'ZU');
INSERT INTO @tbl VALUES ('Overijssel'            ,	     'Zwartewaterland',	'OV',	'ZW');
INSERT INTO @tbl VALUES ('Zuid-Holland'            ,	     'Zwijndrecht',	'ZH',	'ZW');
INSERT INTO @tbl VALUES ('Overijssel'            ,	     'Zwolle',	'OV',	'ZL');

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

