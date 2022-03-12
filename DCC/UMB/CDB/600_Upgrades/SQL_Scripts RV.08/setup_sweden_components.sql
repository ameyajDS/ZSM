
/* ==================================================================================
    	Source File		:	setup_sweden_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Sweden are set-up
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
WHERE	country_nm	=	'Sweden';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Sweden not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'County',
		level_2_address_component	=	'Municipality',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Vastra Gotaland'            ,	     'Ale',	'VG',	'AE');
INSERT INTO @tbl VALUES ('Vastra Gotaland'            ,	     'Alingsas',	'VG',	'AS');
INSERT INTO @tbl VALUES ('Kronoberg'            ,	     'Almhult',	'KR',	'AH');
INSERT INTO @tbl VALUES ('Dalarna'            ,	     'Alvdalen',	'KO',	'AL');
INSERT INTO @tbl VALUES ('Kronoberg'            ,	     'Alvesta',	'KR',	'AV');
INSERT INTO @tbl VALUES ('Uppsala'            ,	     'Alvkarleby',	'UP',	'AL');
INSERT INTO @tbl VALUES ('Norrbotten'            ,	     'Alvsbyn',	'NB',	'AL');
INSERT INTO @tbl VALUES ('Vastra Gotaland'            ,	     'Amal',	'VG',	'AM');
INSERT INTO @tbl VALUES ('Jonkoping'            ,	     'Aneby',	'JO',	'AN');
INSERT INTO @tbl VALUES ('Vasternorrland'            ,	     'Ange',	'VN',	'AN');
INSERT INTO @tbl VALUES ('Skane'            ,	     'Angelholm',	'SN',	'AN');
INSERT INTO @tbl VALUES ('Vastmanland'            ,	     'Arboga',	'VM',	'AR');
INSERT INTO @tbl VALUES ('Jamtland'            ,	     'Are',	'JA',	'AR');
INSERT INTO @tbl VALUES ('Varmland'            ,	     'Arjang',	'VR',	'AJ');
INSERT INTO @tbl VALUES ('Norrbotten'            ,	     'Arjeplog',	'NB',	'AP');
INSERT INTO @tbl VALUES ('Norrbotten'            ,	     'Arvidsjaur',	'NB',	'AJ');
INSERT INTO @tbl VALUES ('Varmland'            ,	     'Arvika',	'VR',	'AV');
INSERT INTO @tbl VALUES ('Vasterbotten'            ,	     'Asele',	'VB',	'AS');
INSERT INTO @tbl VALUES ('Orebro'            ,	     'Askersund',	'OR',	'AS');
INSERT INTO @tbl VALUES ('Skane'            ,	     'Astorp',	'SN',	'AS');
INSERT INTO @tbl VALUES ('Ostergotland'            ,	     'Atvidaberg',	'OG',	'AT');
INSERT INTO @tbl VALUES ('Dalarna'            ,	     'Avesta',	'KO',	'AV');
INSERT INTO @tbl VALUES ('Skane'            ,	     'Bastad',	'SN',	'BA');
INSERT INTO @tbl VALUES ('Vastra Gotaland'            ,	     'Bengtsfors',	'VG',	'BE');
INSERT INTO @tbl VALUES ('Jamtland'            ,	     'Berg',	'JA',	'BE');
INSERT INTO @tbl VALUES ('Vasterbotten'            ,	     'Bjurholm',	'VB',	'BJ');
INSERT INTO @tbl VALUES ('Skane'            ,	     'Bjuv',	'SN',	'BJ');
INSERT INTO @tbl VALUES ('Norrbotten'            ,	     'Boden',	'NB',	'BO');
INSERT INTO @tbl VALUES ('Vastra Gotaland'            ,	     'Bollebygd',	'VG',	'BL');
INSERT INTO @tbl VALUES ('Gavleborg'            ,	     'Bollnas',	'GV',	'BO');
INSERT INTO @tbl VALUES ('Vastra Gotaland'            ,	     'Boras',	'VG',	'BR');
INSERT INTO @tbl VALUES ('Kalmar'            ,	     'Borgholm',	'KA',	'BO');
INSERT INTO @tbl VALUES ('Dalarna'            ,	     'Borlange',	'KO',	'BO');
INSERT INTO @tbl VALUES ('Stockholm'            ,	     'Botkyrka',	'ST',	'BO');
INSERT INTO @tbl VALUES ('Ostergotland'            ,	     'Boxholm',	'OG',	'BO');
INSERT INTO @tbl VALUES ('Jamtland'            ,	     'Bracke',	'JA',	'BR');
INSERT INTO @tbl VALUES ('Skane'            ,	     'Bromolla',	'SN',	'BR');
INSERT INTO @tbl VALUES ('Skane'            ,	     'Burlov',	'SN',	'BU');
INSERT INTO @tbl VALUES ('Vastra Gotaland'            ,	     'Dals-Ed',	'VG',	'DE');
INSERT INTO @tbl VALUES ('Stockholm'            ,	     'Danderyd',	'ST',	'DA');
INSERT INTO @tbl VALUES ('Orebro'            ,	     'Degerfors',	'OR',	'DE');
INSERT INTO @tbl VALUES ('Vasterbotten'            ,	     'Dorotea',	'VB',	'DO');
INSERT INTO @tbl VALUES ('Varmland'            ,	     'Eda',	'VR',	'ED');
INSERT INTO @tbl VALUES ('Stockholm'            ,	     'Ekero',	'ST',	'EK');
INSERT INTO @tbl VALUES ('Jonkoping'            ,	     'Eksjo',	'JO',	'EK');
INSERT INTO @tbl VALUES ('Kalmar'            ,	     'Emmaboda',	'KA',	'EM');
INSERT INTO @tbl VALUES ('Uppsala'            ,	     'Enkoping',	'UP',	'EN');
INSERT INTO @tbl VALUES ('Sodermanland'            ,	     'Eskilstuna',	'SD',	'ES');
INSERT INTO @tbl VALUES ('Skane'            ,	     'Eslov',	'SN',	'ES');
INSERT INTO @tbl VALUES ('Vastra Gotaland'            ,	     'Essunga',	'VG',	'ES');
INSERT INTO @tbl VALUES ('Vastmanland'            ,	     'Fagersta',	'VM',	'FA');
INSERT INTO @tbl VALUES ('Halland'            ,	     'Falkenberg',	'HA',	'FA');
INSERT INTO @tbl VALUES ('Vastra Gotaland'            ,	     'Falkoping',	'VG',	'FK');
INSERT INTO @tbl VALUES ('Dalarna'            ,	     'Falun',	'KO',	'FA');
INSERT INTO @tbl VALUES ('Vastra Gotaland'            ,	     'Fargelanda',	'VG',	'FG');
INSERT INTO @tbl VALUES ('Varmland'            ,	     'Filipstad',	'VR',	'FI');
INSERT INTO @tbl VALUES ('Ostergotland'            ,	     'Finspang',	'OG',	'FI');
INSERT INTO @tbl VALUES ('Sodermanland'            ,	     'Flen',	'SD',	'FL');
INSERT INTO @tbl VALUES ('Varmland'            ,	     'Forshaga',	'VR',	'FO');
INSERT INTO @tbl VALUES ('Dalarna'            ,	     'Gagnef',	'KO',	'GA');
INSERT INTO @tbl VALUES ('Norrbotten'            ,	     'Gallivare',	'NB',	'GA');
INSERT INTO @tbl VALUES ('Gavleborg'            ,	     'Gavle',	'GV',	'GA');
INSERT INTO @tbl VALUES ('Jonkoping'            ,	     'Gislaved',	'JO',	'GI');
INSERT INTO @tbl VALUES ('Sodermanland'            ,	     'Gnesta',	'SD',	'GN');
INSERT INTO @tbl VALUES ('Jonkoping'            ,	     'Gnosjo',	'JO',	'GN');
INSERT INTO @tbl VALUES ('Vastra Gotaland'            ,	     'Goteborg',	'VG',	'GB');
INSERT INTO @tbl VALUES ('Vastra Gotaland'            ,	     'Gotene',	'VG',	'GN');
INSERT INTO @tbl VALUES ('Gotland'            ,	     'Gotland',	'GT',	'GO');
INSERT INTO @tbl VALUES ('Vastra Gotaland'            ,	     'Grastorp',	'VG',	'GR');
INSERT INTO @tbl VALUES ('Varmland'            ,	     'Grums',	'VR',	'GR');
INSERT INTO @tbl VALUES ('Vastra Gotaland'            ,	     'Gullspang',	'VG',	'GU');
INSERT INTO @tbl VALUES ('Uppsala'            ,	     'Habo',	'UP',	'HA');
INSERT INTO @tbl VALUES ('Jonkoping'            ,	     'Habo',	'JO',	'HA');
INSERT INTO @tbl VALUES ('Varmland'            ,	     'Hagfors',	'VR',	'HG');
INSERT INTO @tbl VALUES ('Orebro'            ,	     'Hallefors',	'OR',	'HF');
INSERT INTO @tbl VALUES ('Orebro'            ,	     'Hallsberg',	'OR',	'HB');
INSERT INTO @tbl VALUES ('Vastmanland'            ,	     'Hallstahammar',	'VM',	'HA');
INSERT INTO @tbl VALUES ('Halland'            ,	     'Halmstad',	'HA',	'HA');
INSERT INTO @tbl VALUES ('Varmland'            ,	     'Hammaro',	'VR',	'HM');
INSERT INTO @tbl VALUES ('Stockholm'            ,	     'Haninge',	'ST',	'HA');
INSERT INTO @tbl VALUES ('Norrbotten'            ,	     'Haparanda',	'NB',	'HA');
INSERT INTO @tbl VALUES ('Jamtland'            ,	     'Harjedalen',	'JA',	'HA');
INSERT INTO @tbl VALUES ('Vasternorrland'            ,	     'Harnosand',	'VN',	'HA');
INSERT INTO @tbl VALUES ('Vastra Gotaland'            ,	     'Harryda',	'VG',	'HA');
INSERT INTO @tbl VALUES ('Skane'            ,	     'Hassleholm',	'SN',	'HA');
INSERT INTO @tbl VALUES ('Vastmanland'            ,	     'Heby',	'VM',	'HE');
INSERT INTO @tbl VALUES ('Dalarna'            ,	     'Hedemora',	'KO',	'HE');
INSERT INTO @tbl VALUES ('Skane'            ,	     'Helsingborg',	'SN',	'HE');
INSERT INTO @tbl VALUES ('Vastra Gotaland'            ,	     'Herrljunga',	'VG',	'HE');
INSERT INTO @tbl VALUES ('Vastra Gotaland'            ,	     'Hjo',	'VG',	'HJ');
INSERT INTO @tbl VALUES ('Gavleborg'            ,	     'Hofors',	'GV',	'HO');
INSERT INTO @tbl VALUES ('Skane'            ,	     'Hoganas',	'SN',	'HG');
INSERT INTO @tbl VALUES ('Kalmar'            ,	     'Hogsby',	'KA',	'HO');
INSERT INTO @tbl VALUES ('Skane'            ,	     'Hoor',	'SN',	'HO');
INSERT INTO @tbl VALUES ('Skane'            ,	     'Horby',	'SN',	'HB');
INSERT INTO @tbl VALUES ('Stockholm'            ,	     'Huddinge',	'ST',	'HU');
INSERT INTO @tbl VALUES ('Gavleborg'            ,	     'Hudiksvall',	'GV',	'HU');
INSERT INTO @tbl VALUES ('Kalmar'            ,	     'Hultsfred',	'KA',	'HU');
INSERT INTO @tbl VALUES ('Halland'            ,	     'Hylte',	'HA',	'HY');
INSERT INTO @tbl VALUES ('Stockholm'            ,	     'Jarfalla',	'ST',	'JA');
INSERT INTO @tbl VALUES ('Norrbotten'            ,	     'Jokkmokk',	'NB',	'JO');
INSERT INTO @tbl VALUES ('Jonkoping'            ,	     'Jonkoping',	'JO',	'JO');
INSERT INTO @tbl VALUES ('Norrbotten'            ,	     'Kalix',	'NB',	'KA');
INSERT INTO @tbl VALUES ('Kalmar'            ,	     'Kalmar',	'KA',	'KA');
INSERT INTO @tbl VALUES ('Vastra Gotaland'            ,	     'Karlsborg',	'VG',	'KA');
INSERT INTO @tbl VALUES ('Blekinge'            ,	     'Karlshamn',	'BL',	'KH');
INSERT INTO @tbl VALUES ('Orebro'            ,	     'Karlskoga',	'OR',	'KA');
INSERT INTO @tbl VALUES ('Blekinge'            ,	     'Karlskrona',	'BL',	'KK');
INSERT INTO @tbl VALUES ('Varmland'            ,	     'Karlstad',	'VR',	'KA');
INSERT INTO @tbl VALUES ('Sodermanland'            ,	     'Katrineholm',	'SD',	'KA');
INSERT INTO @tbl VALUES ('Skane'            ,	     'Kavlinge',	'SN',	'KA');
INSERT INTO @tbl VALUES ('Varmland'            ,	     'Kil',	'VR',	'KI');
INSERT INTO @tbl VALUES ('Ostergotland'            ,	     'Kinda',	'OG',	'KI');
INSERT INTO @tbl VALUES ('Norrbotten'            ,	     'Kiruna',	'NB',	'KI');
INSERT INTO @tbl VALUES ('Skane'            ,	     'Klippan',	'SN',	'KL');
INSERT INTO @tbl VALUES ('Vastmanland'            ,	     'Koping',	'VM',	'KO');
INSERT INTO @tbl VALUES ('Vasternorrland'            ,	     'Kramfors',	'VN',	'KR');
INSERT INTO @tbl VALUES ('Skane'            ,	     'Kristianstad',	'SN',	'KR');
INSERT INTO @tbl VALUES ('Varmland'            ,	     'Kristinehamn',	'VR',	'KR');
INSERT INTO @tbl VALUES ('Jamtland'            ,	     'Krokom',	'JA',	'KR');
INSERT INTO @tbl VALUES ('Orebro'            ,	     'Kumla',	'OR',	'KU');
INSERT INTO @tbl VALUES ('Vastra Gotaland'            ,	     'Kungalv',	'VG',	'KU');
INSERT INTO @tbl VALUES ('Halland'            ,	     'Kungsbacka',	'HA',	'KU');
INSERT INTO @tbl VALUES ('Vastmanland'            ,	     'Kungsor',	'VM',	'KU');
INSERT INTO @tbl VALUES ('Halland'            ,	     'Laholm',	'HA',	'LA');
INSERT INTO @tbl VALUES ('Skane'            ,	     'Landskrona',	'SN',	'LA');
INSERT INTO @tbl VALUES ('Orebro'            ,	     'Laxa',	'OR',	'LA');
INSERT INTO @tbl VALUES ('Orebro'            ,	     'Lekeberg',	'OR',	'LE');
INSERT INTO @tbl VALUES ('Dalarna'            ,	     'Leksand',	'KO',	'LE');
INSERT INTO @tbl VALUES ('Vastra Gotaland'            ,	     'Lerum',	'VG',	'LR');
INSERT INTO @tbl VALUES ('Kronoberg'            ,	     'Lessebo',	'KR',	'LE');
INSERT INTO @tbl VALUES ('Stockholm'            ,	     'Lidingo',	'ST',	'LI');
INSERT INTO @tbl VALUES ('Vastra Gotaland'            ,	     'Lidkoping',	'VG',	'LI');
INSERT INTO @tbl VALUES ('Vastra Gotaland'            ,	     'Lilla Edet',	'VG',	'LE');
INSERT INTO @tbl VALUES ('Orebro'            ,	     'Lindesberg',	'OR',	'LI');
INSERT INTO @tbl VALUES ('Ostergotland'            ,	     'Linkoping',	'OG',	'LI');
INSERT INTO @tbl VALUES ('Kronoberg'            ,	     'Ljungby',	'KR',	'LJ');
INSERT INTO @tbl VALUES ('Gavleborg'            ,	     'Ljusdal',	'GV',	'LJ');
INSERT INTO @tbl VALUES ('Orebro'            ,	     'Ljusnarsberg',	'OR',	'LJ');
INSERT INTO @tbl VALUES ('Skane'            ,	     'Lomma',	'SN',	'LO');
INSERT INTO @tbl VALUES ('Dalarna'            ,	     'Ludvika',	'KO',	'LU');
INSERT INTO @tbl VALUES ('Norrbotten'            ,	     'Lulea',	'NB',	'LU');
INSERT INTO @tbl VALUES ('Skane'            ,	     'Lund',	'SN',	'LU');
INSERT INTO @tbl VALUES ('Vasterbotten'            ,	     'Lycksele',	'VB',	'LY');
INSERT INTO @tbl VALUES ('Vastra Gotaland'            ,	     'Lysekil',	'VG',	'LY');
INSERT INTO @tbl VALUES ('Vasterbotten'            ,	     'Mala',	'VB',	'MA');
INSERT INTO @tbl VALUES ('Skane'            ,	     'Malmo',	'SN',	'MA');
INSERT INTO @tbl VALUES ('Dalarna'            ,	     'Malung',	'KO',	'MA');
INSERT INTO @tbl VALUES ('Vastra Gotaland'            ,	     'Mariestad',	'VG',	'MS');
INSERT INTO @tbl VALUES ('Vastra Gotaland'            ,	     'Mark',	'VG',	'MK');
INSERT INTO @tbl VALUES ('Kronoberg'            ,	     'Markaryd',	'KR',	'MA');
INSERT INTO @tbl VALUES ('Vastra Gotaland'            ,	     'Mellerud',	'VG',	'ME');
INSERT INTO @tbl VALUES ('Ostergotland'            ,	     'Mjolby',	'OG',	'MJ');
INSERT INTO @tbl VALUES ('Vastra Gotaland'            ,	     'Molndal',	'VG',	'MO');
INSERT INTO @tbl VALUES ('Kalmar'            ,	     'Monsteras',	'KA',	'MS');
INSERT INTO @tbl VALUES ('Dalarna'            ,	     'Mora',	'KO',	'MO');
INSERT INTO @tbl VALUES ('Kalmar'            ,	     'Morbylanga',	'KA',	'ML');
INSERT INTO @tbl VALUES ('Ostergotland'            ,	     'Motala',	'OG',	'MO');
INSERT INTO @tbl VALUES ('Jonkoping'            ,	     'Mullsjo',	'JO',	'MU');
INSERT INTO @tbl VALUES ('Vastra Gotaland'            ,	     'Munkedal',	'VG',	'MU');
INSERT INTO @tbl VALUES ('Varmland'            ,	     'Munkfors',	'VR',	'MU');
INSERT INTO @tbl VALUES ('Stockholm'            ,	     'Nacka',	'ST',	'NA');
INSERT INTO @tbl VALUES ('Jonkoping'            ,	     'Nassjo',	'JO',	'NA');
INSERT INTO @tbl VALUES ('Orebro'            ,	     'Nora',	'OR',	'NO');
INSERT INTO @tbl VALUES ('Vastmanland'            ,	     'Norberg',	'VM',	'NO');
INSERT INTO @tbl VALUES ('Gavleborg'            ,	     'Nordanstig',	'GV',	'NO');
INSERT INTO @tbl VALUES ('Vasterbotten'            ,	     'Nordmaling',	'VB',	'NM');
INSERT INTO @tbl VALUES ('Ostergotland'            ,	     'Norrkoping',	'OG',	'NO');
INSERT INTO @tbl VALUES ('Stockholm'            ,	     'Norrtalje',	'ST',	'NO');
INSERT INTO @tbl VALUES ('Vasterbotten'            ,	     'Norsjo',	'VB',	'NS');
INSERT INTO @tbl VALUES ('Kalmar'            ,	     'Nybro',	'KA',	'NY');
INSERT INTO @tbl VALUES ('Sodermanland'            ,	     'Nykoping',	'SD',	'NY');
INSERT INTO @tbl VALUES ('Stockholm'            ,	     'Nykvarn',	'ST',	'NV');
INSERT INTO @tbl VALUES ('Stockholm'            ,	     'Nynashamn',	'ST',	'NH');
INSERT INTO @tbl VALUES ('Gavleborg'            ,	     'Ockelbo',	'GV',	'OC');
INSERT INTO @tbl VALUES ('Vastra Gotaland'            ,	     'Ockero',	'VG',	'OC');
INSERT INTO @tbl VALUES ('Ostergotland'            ,	     'Odeshog',	'OG',	'OD');
INSERT INTO @tbl VALUES ('Blekinge'            ,	     'Olofstrom',	'BL',	'OL');
INSERT INTO @tbl VALUES ('Orebro'            ,	     'Orebro',	'OR',	'OR');
INSERT INTO @tbl VALUES ('Skane'            ,	     'Orkelljunga',	'SN',	'OR');
INSERT INTO @tbl VALUES ('Vasternorrland'            ,	     'Ornskoldsvik',	'VN',	'OR');
INSERT INTO @tbl VALUES ('Dalarna'            ,	     'Orsa',	'KO',	'OR');
INSERT INTO @tbl VALUES ('Vastra Gotaland'            ,	     'Orust',	'VG',	'OR');
INSERT INTO @tbl VALUES ('Skane'            ,	     'Osby',	'SN',	'OS');
INSERT INTO @tbl VALUES ('Kalmar'            ,	     'Oskarshamn',	'KA',	'OS');
INSERT INTO @tbl VALUES ('Stockholm'            ,	     'Osteraker',	'ST',	'OS');
INSERT INTO @tbl VALUES ('Jamtland'            ,	     'Ostersund',	'JA',	'OS');
INSERT INTO @tbl VALUES ('Uppsala'            ,	     'Osthammar',	'UP',	'OS');
INSERT INTO @tbl VALUES ('Skane'            ,	     'Ostra Goinge',	'SN',	'OG');
INSERT INTO @tbl VALUES ('Gavleborg'            ,	     'Ovanaker',	'GV',	'OV');
INSERT INTO @tbl VALUES ('Norrbotten'            ,	     'Overkalix',	'NB',	'OK');
INSERT INTO @tbl VALUES ('Norrbotten'            ,	     'Overtornea',	'NB',	'OT');
INSERT INTO @tbl VALUES ('Sodermanland'            ,	     'Oxelosund',	'SD',	'OX');
INSERT INTO @tbl VALUES ('Norrbotten'            ,	     'Pajala',	'NB',	'PA');
INSERT INTO @tbl VALUES ('Vastra Gotaland'            ,	     'Partille',	'VG',	'PA');
INSERT INTO @tbl VALUES ('Skane'            ,	     'Perstorp',	'SN',	'PE');
INSERT INTO @tbl VALUES ('Norrbotten'            ,	     'Pitea',	'NB',	'PI');
INSERT INTO @tbl VALUES ('Jamtland'            ,	     'Ragunda',	'JA',	'RA');
INSERT INTO @tbl VALUES ('Dalarna'            ,	     'Rattvik',	'KO',	'RA');
INSERT INTO @tbl VALUES ('Vasterbotten'            ,	     'Robertsfors',	'VB',	'RO');
INSERT INTO @tbl VALUES ('Blekinge'            ,	     'Ronneby',	'BL',	'RO');
INSERT INTO @tbl VALUES ('Varmland'            ,	     'Saffle',	'VR',	'SA');
INSERT INTO @tbl VALUES ('Vastmanland'            ,	     'Sala',	'VM',	'SA');
INSERT INTO @tbl VALUES ('Stockholm'            ,	     'Salem',	'ST',	'SA');
INSERT INTO @tbl VALUES ('Gavleborg'            ,	     'Sandviken',	'GV',	'SA');
INSERT INTO @tbl VALUES ('Dalarna'            ,	     'Sater',	'KO',	'SA');
INSERT INTO @tbl VALUES ('Jonkoping'            ,	     'Savsjo',	'JO',	'SA');
INSERT INTO @tbl VALUES ('Stockholm'            ,	     'Sigtuna',	'ST',	'SI');
INSERT INTO @tbl VALUES ('Skane'            ,	     'Simrishamn',	'SN',	'SI');
INSERT INTO @tbl VALUES ('Skane'            ,	     'Sjobo',	'SN',	'SJ');
INSERT INTO @tbl VALUES ('Vastra Gotaland'            ,	     'Skara',	'VG',	'SK');
INSERT INTO @tbl VALUES ('Vasterbotten'            ,	     'Skelleftea',	'VB',	'SK');
INSERT INTO @tbl VALUES ('Vastmanland'            ,	     'Skinnskatteberg',	'VM',	'SK');
INSERT INTO @tbl VALUES ('Vastra Gotaland'            ,	     'Skovde',	'VG',	'SD');
INSERT INTO @tbl VALUES ('Skane'            ,	     'Skurup',	'SN',	'SK');
INSERT INTO @tbl VALUES ('Dalarna'            ,	     'Smedjebacken',	'KO',	'SM');
INSERT INTO @tbl VALUES ('Gavleborg'            ,	     'Soderhamn',	'GV',	'SO');
INSERT INTO @tbl VALUES ('Ostergotland'            ,	     'Soderkoping',	'OG',	'SO');
INSERT INTO @tbl VALUES ('Stockholm'            ,	     'Sodertalje',	'ST',	'SD');
INSERT INTO @tbl VALUES ('Vasternorrland'            ,	     'Solleftea',	'VN',	'SO');
INSERT INTO @tbl VALUES ('Stockholm'            ,	     'Sollentuna',	'ST',	'SL');
INSERT INTO @tbl VALUES ('Stockholm'            ,	     'Solna',	'ST',	'SN');
INSERT INTO @tbl VALUES ('Blekinge'            ,	     'Solvesborg',	'BL',	'SO');
INSERT INTO @tbl VALUES ('Vasterbotten'            ,	     'Sorsele',	'VB',	'SO');
INSERT INTO @tbl VALUES ('Vastra Gotaland'            ,	     'Sotenas',	'VG',	'SO');
INSERT INTO @tbl VALUES ('Skane'            ,	     'Staffanstorp',	'SN',	'ST');
INSERT INTO @tbl VALUES ('Vastra Gotaland'            ,	     'Stenungsund',	'VG',	'SS');
INSERT INTO @tbl VALUES ('Stockholm'            ,	     'Stockholm',	'ST',	'ST');
INSERT INTO @tbl VALUES ('Varmland'            ,	     'Storfors',	'VR',	'ST');
INSERT INTO @tbl VALUES ('Vasterbotten'            ,	     'Storuman',	'VB',	'ST');
INSERT INTO @tbl VALUES ('Sodermanland'            ,	     'Strangnas',	'SD',	'ST');
INSERT INTO @tbl VALUES ('Vastra Gotaland'            ,	     'Stromstad',	'VG',	'ST');
INSERT INTO @tbl VALUES ('Jamtland'            ,	     'Stromsund',	'JA',	'ST');
INSERT INTO @tbl VALUES ('Stockholm'            ,	     'Sundbyberg',	'ST',	'SU');
INSERT INTO @tbl VALUES ('Vasternorrland'            ,	     'Sundsvall',	'VN',	'SU');
INSERT INTO @tbl VALUES ('Varmland'            ,	     'Sunne',	'VR',	'SU');
INSERT INTO @tbl VALUES ('Vastmanland'            ,	     'Surahammar',	'VM',	'SU');
INSERT INTO @tbl VALUES ('Skane'            ,	     'Svalov',	'SN',	'SL');
INSERT INTO @tbl VALUES ('Skane'            ,	     'Svedala',	'SN',	'SD');
INSERT INTO @tbl VALUES ('Vastra Gotaland'            ,	     'Svenljunga',	'VG',	'SV');
INSERT INTO @tbl VALUES ('Stockholm'            ,	     'Taby',	'ST',	'TA');
INSERT INTO @tbl VALUES ('Vastra Gotaland'            ,	     'Tanum',	'VG',	'TA');
INSERT INTO @tbl VALUES ('Vastra Gotaland'            ,	     'Tibro',	'VG',	'TB');
INSERT INTO @tbl VALUES ('Vastra Gotaland'            ,	     'Tidaholm',	'VG',	'TD');
INSERT INTO @tbl VALUES ('Uppsala'            ,	     'Tierp',	'UP',	'TI');
INSERT INTO @tbl VALUES ('Vasternorrland'            ,	     'Timra',	'VN',	'TI');
INSERT INTO @tbl VALUES ('Kronoberg'            ,	     'Tingsryd',	'KR',	'TI');
INSERT INTO @tbl VALUES ('Vastra Gotaland'            ,	     'Tjorn',	'VG',	'TJ');
INSERT INTO @tbl VALUES ('Skane'            ,	     'Tomelilla',	'SN',	'TO');
INSERT INTO @tbl VALUES ('Vastra Gotaland'            ,	     'Toreboda',	'VG',	'TO');
INSERT INTO @tbl VALUES ('Kalmar'            ,	     'Torsas',	'KA',	'TO');
INSERT INTO @tbl VALUES ('Varmland'            ,	     'Torsby',	'VR',	'TO');
INSERT INTO @tbl VALUES ('Jonkoping'            ,	     'Tranas',	'JO',	'TR');
INSERT INTO @tbl VALUES ('Vastra Gotaland'            ,	     'Tranemo',	'VG',	'TM');
INSERT INTO @tbl VALUES ('Skane'            ,	     'Trelleborg',	'SN',	'TR');
INSERT INTO @tbl VALUES ('Vastra Gotaland'            ,	     'Trollhattan',	'VG',	'TR');
INSERT INTO @tbl VALUES ('Sodermanland'            ,	     'Trosa',	'SD',	'TR');
INSERT INTO @tbl VALUES ('Stockholm'            ,	     'Tyreso',	'ST',	'TY');
INSERT INTO @tbl VALUES ('Vastra Gotaland'            ,	     'Uddevalla',	'VG',	'UD');
INSERT INTO @tbl VALUES ('Vastra Gotaland'            ,	     'Ulricehamn',	'VG',	'UL');
INSERT INTO @tbl VALUES ('Vasterbotten'            ,	     'Umea',	'VB',	'UM');
INSERT INTO @tbl VALUES ('Stockholm'            ,	     'Upplands-Bro',	'ST',	'UB');
INSERT INTO @tbl VALUES ('Stockholm'            ,	     'Upplands-Vasby',	'ST',	'UV');
INSERT INTO @tbl VALUES ('Uppsala'            ,	     'Uppsala',	'UP',	'UP');
INSERT INTO @tbl VALUES ('Kronoberg'            ,	     'Uppvidinge',	'KR',	'UP');
INSERT INTO @tbl VALUES ('Ostergotland'            ,	     'Vadstena',	'OG',	'VT');
INSERT INTO @tbl VALUES ('Jonkoping'            ,	     'Vaggeryd',	'JO',	'VG');
INSERT INTO @tbl VALUES ('Ostergotland'            ,	     'Valdemarsvik',	'OG',	'VV');
INSERT INTO @tbl VALUES ('Stockholm'            ,	     'Vallentuna',	'ST',	'VL');
INSERT INTO @tbl VALUES ('Vastra Gotaland'            ,	     'Vanersborg',	'VG',	'VB');
INSERT INTO @tbl VALUES ('Vasterbotten'            ,	     'Vannas',	'VB',	'VA');
INSERT INTO @tbl VALUES ('Dalarna'            ,	     'Vansbro',	'KO',	'VA');
INSERT INTO @tbl VALUES ('Vastra Gotaland'            ,	     'Vara',	'VG',	'VA');
INSERT INTO @tbl VALUES ('Halland'            ,	     'Varberg',	'HA',	'VA');
INSERT INTO @tbl VALUES ('Vastra Gotaland'            ,	     'Vargarda',	'VG',	'VG');
INSERT INTO @tbl VALUES ('Stockholm'            ,	     'Varmdo',	'ST',	'VR');
INSERT INTO @tbl VALUES ('Jonkoping'            ,	     'Varnamo',	'JO',	'VR');
INSERT INTO @tbl VALUES ('Vastmanland'            ,	     'Vasteras',	'VM',	'VA');
INSERT INTO @tbl VALUES ('Kalmar'            ,	     'Vastervik',	'KA',	'VA');
INSERT INTO @tbl VALUES ('Stockholm'            ,	     'Vaxholm',	'ST',	'VX');
INSERT INTO @tbl VALUES ('Kronoberg'            ,	     'Vaxjo',	'KR',	'VA');
INSERT INTO @tbl VALUES ('Skane'            ,	     'Vellinge',	'SN',	'VE');
INSERT INTO @tbl VALUES ('Jonkoping'            ,	     'Vetlanda',	'JO',	'VT');
INSERT INTO @tbl VALUES ('Vasterbotten'            ,	     'Vilhelmina',	'VB',	'VH');
INSERT INTO @tbl VALUES ('Kalmar'            ,	     'Vimmerby',	'KA',	'VI');
INSERT INTO @tbl VALUES ('Vasterbotten'            ,	     'Vindeln',	'VB',	'VD');
INSERT INTO @tbl VALUES ('Sodermanland'            ,	     'Vingaker',	'SD',	'VI');
INSERT INTO @tbl VALUES ('Ostergotland'            ,	     'Ydre',	'OG',	'YD');
INSERT INTO @tbl VALUES ('Skane'            ,	     'Ystad',	'SN',	'YS');

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

