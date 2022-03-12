
/* ==================================================================================
    	Source File		:	setup_germany_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	12-10-2014
	Module ID		:	CDB
	Last updated		:	12-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Germany are set-up
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
WHERE	country_nm	=	'Germany';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Germany not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'State',
		level_2_address_component	=	'District',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('North Rhine-Westphalia'            ,	     'Aachen',	'NW',	'AC');
INSERT INTO @tbl VALUES ('Rhineland-Palatinate'            ,	     'Ahrweiler',	'RP',	'AR');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Aichach-Friedberg',	'BY',	'AF');
INSERT INTO @tbl VALUES ('Baden-Wurttemberg'            ,	     'Alb-Donau-Kreis',	'BW',	'AD');
INSERT INTO @tbl VALUES ('Thuringia'            ,	     'Altenburger Land',	'TH',	'AL');
INSERT INTO @tbl VALUES ('Rhineland-Palatinate'            ,	     'Altenkirchen (Westerwald)',	'RP',	'AT');
INSERT INTO @tbl VALUES ('Saxony-Anhalt'            ,	     'Altmarkkreis Salzwedel',	'ST',	'AS');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Altotting',	'BY',	'AT');
INSERT INTO @tbl VALUES ('Rhineland-Palatinate'            ,	     'Alzey-Worms',	'RP',	'AW');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Amberg',	'BY',	'AM');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Amberg-Sulzbach',	'BY',	'AS');
INSERT INTO @tbl VALUES ('Lower Saxony'            ,	     'Ammerland',	'NI',	'AM');
INSERT INTO @tbl VALUES ('Saxony-Anhalt'            ,	     'Anhalt-Bitterfeld',	'ST',	'AB');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Ansbach',	'BY',	'AN');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Aschaffenburg',	'BY',	'AC');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Augsburg',	'BY',	'AU');
INSERT INTO @tbl VALUES ('Lower Saxony'            ,	     'Aurich',	'NI',	'AR');
INSERT INTO @tbl VALUES ('Rhineland-Palatinate'            ,	     'Bad Durkheim',	'RP',	'BD');
INSERT INTO @tbl VALUES ('Baden-Wurttemberg'            ,	     'Baden-Baden',	'BW',	'BB');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Bad Kissingen',	'BY',	'BK');
INSERT INTO @tbl VALUES ('Rhineland-Palatinate'            ,	     'Bad Kreuznach',	'RP',	'BK');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Bad Tolz-Wolfratshausen',	'BY',	'BW');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Bamberg',	'BY',	'BM');
INSERT INTO @tbl VALUES ('Brandenburg'            ,	     'Barnim',	'BB',	'BR');
INSERT INTO @tbl VALUES ('Saxony'            ,	     'Bautzen',	'SN',	'BU');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Bayreuth',	'BY',	'BY');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Berchtesgadener Land',	'BY',	'BL');
INSERT INTO @tbl VALUES ('Hesse'            ,	     'Bergstrasse',	'HE',	'BR');
INSERT INTO @tbl VALUES ('Berlin'            ,	     'Berlin',	'BE',	'BR');
INSERT INTO @tbl VALUES ('Rhineland-Palatinate'            ,	     'Bernkastel-Wittlich',	'RP',	'BW');
INSERT INTO @tbl VALUES ('Baden-Wurttemberg'            ,	     'Biberach',	'BW',	'BR');
INSERT INTO @tbl VALUES ('North Rhine-Westphalia'            ,	     'Bielefeld',	'NW',	'BE');
INSERT INTO @tbl VALUES ('Rhineland-Palatinate'            ,	     'Birkenfeld',	'RP',	'BR');
INSERT INTO @tbl VALUES ('Baden-Wurttemberg'            ,	     'Boblingen',	'BW',	'BL');
INSERT INTO @tbl VALUES ('North Rhine-Westphalia'            ,	     'Bochum',	'NW',	'BC');
INSERT INTO @tbl VALUES ('Baden-Wurttemberg'            ,	     'Bodenseekreis',	'BW',	'BD');
INSERT INTO @tbl VALUES ('North Rhine-Westphalia'            ,	     'Bonn',	'NW',	'BN');
INSERT INTO @tbl VALUES ('Saxony-Anhalt'            ,	     'Borde',	'ST',	'BR');
INSERT INTO @tbl VALUES ('North Rhine-Westphalia'            ,	     'Borken',	'NW',	'BR');
INSERT INTO @tbl VALUES ('North Rhine-Westphalia'            ,	     'Bottrop',	'NW',	'BT');
INSERT INTO @tbl VALUES ('Brandenburg'            ,	     'Brandenburg an der Havel',	'BB',	'BH');
INSERT INTO @tbl VALUES ('Lower Saxony'            ,	     'Braunschweig',	'NI',	'BA');
INSERT INTO @tbl VALUES ('Baden-Wurttemberg'            ,	     'Breisgau-Hochschwarzwald',	'BW',	'BH');
INSERT INTO @tbl VALUES ('Bremen'            ,	     'Bremen',	'HB',	'BR');
INSERT INTO @tbl VALUES ('Bremen'            ,	     'Bremerhaven',	'HB',	'BH');
INSERT INTO @tbl VALUES ('Saxony-Anhalt'            ,	     'Burgenlandkreis',	'ST',	'BG');
INSERT INTO @tbl VALUES ('Baden-Wurttemberg'            ,	     'Calw',	'BW',	'CL');
INSERT INTO @tbl VALUES ('Lower Saxony'            ,	     'Celle',	'NI',	'CL');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Cham',	'BY',	'CA');
INSERT INTO @tbl VALUES ('Saxony'            ,	     'Chemnitz',	'SN',	'CE');
INSERT INTO @tbl VALUES ('Lower Saxony'            ,	     'Cloppenburg',	'NI',	'CO');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Coburg',	'BY',	'CL');
INSERT INTO @tbl VALUES ('Rhineland-Palatinate'            ,	     'Cochem-Zell',	'RP',	'CZ');
INSERT INTO @tbl VALUES ('North Rhine-Westphalia'            ,	     'Coesfeld',	'NW',	'CE');
INSERT INTO @tbl VALUES ('Brandenburg'            ,	     'Cottbus',	'BB',	'CT');
INSERT INTO @tbl VALUES ('Lower Saxony'            ,	     'Cuxhaven',	'NI',	'CX');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Dachau',	'BY',	'DC');
INSERT INTO @tbl VALUES ('Brandenburg'            ,	     'Dahme-Spreewald',	'BB',	'DS');
INSERT INTO @tbl VALUES ('Hesse'            ,	     'Darmstadt',	'HE',	'DR');
INSERT INTO @tbl VALUES ('Hesse'            ,	     'Darmstadt-Dieburg',	'HE',	'DD');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Deggendorf',	'BY',	'DG');
INSERT INTO @tbl VALUES ('Lower Saxony'            ,	     'Delmenhorst',	'NI',	'DL');
INSERT INTO @tbl VALUES ('Saxony-Anhalt'            ,	     'Dessau-Rosslau',	'ST',	'DR');
INSERT INTO @tbl VALUES ('Lower Saxony'            ,	     'Diepholz',	'NI',	'DE');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Dillingen an der Donau',	'BY',	'DD');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Dingolfing-Landau',	'BY',	'DL');
INSERT INTO @tbl VALUES ('Schleswig-Holstein'            ,	     'Dithmarschen',	'SH',	'DT');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Donau-Ries',	'BY',	'DR');
INSERT INTO @tbl VALUES ('Rhineland-Palatinate'            ,	     'Donnersbergkreis',	'RP',	'DN');
INSERT INTO @tbl VALUES ('North Rhine-Westphalia'            ,	     'Dortmund',	'NW',	'DD');
INSERT INTO @tbl VALUES ('Saxony'            ,	     'Dresden',	'SN',	'DE');
INSERT INTO @tbl VALUES ('North Rhine-Westphalia'            ,	     'Duisburg',	'NW',	'DI');
INSERT INTO @tbl VALUES ('North Rhine-Westphalia'            ,	     'Duren',	'NW',	'DR');
INSERT INTO @tbl VALUES ('North Rhine-Westphalia'            ,	     'Dusseldorf',	'NW',	'DS');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Ebersberg',	'BY',	'EE');
INSERT INTO @tbl VALUES ('Thuringia'            ,	     'Eichsfeld',	'TH',	'EC');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Eichstatt',	'BY',	'EC');
INSERT INTO @tbl VALUES ('Rhineland-Palatinate'            ,	     'Eifelkreis Bitburg-Prum',	'RP',	'EB');
INSERT INTO @tbl VALUES ('Thuringia'            ,	     'Eisenach',	'TH',	'ES');
INSERT INTO @tbl VALUES ('Brandenburg'            ,	     'Elbe-Elster',	'BB',	'EE');
INSERT INTO @tbl VALUES ('Lower Saxony'            ,	     'Emden',	'NI',	'ED');
INSERT INTO @tbl VALUES ('Baden-Wurttemberg'            ,	     'Emmendingen',	'BW',	'EM');
INSERT INTO @tbl VALUES ('Lower Saxony'            ,	     'Emsland',	'NI',	'ES');
INSERT INTO @tbl VALUES ('North Rhine-Westphalia'            ,	     'Ennepe-Ruhr-Kreis',	'NW',	'ER');
INSERT INTO @tbl VALUES ('Baden-Wurttemberg'            ,	     'Enzkreis',	'BW',	'EZ');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Erding',	'BY',	'ED');
INSERT INTO @tbl VALUES ('Thuringia'            ,	     'Erfurt',	'TH',	'EF');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Erlangen',	'BY',	'EL');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Erlangen-Hochstadt',	'BY',	'EH');
INSERT INTO @tbl VALUES ('Saxony'            ,	     'Erzgebirgskreis',	'SN',	'EZ');
INSERT INTO @tbl VALUES ('North Rhine-Westphalia'            ,	     'Essen',	'NW',	'ES');
INSERT INTO @tbl VALUES ('Baden-Wurttemberg'            ,	     'Esslingen',	'BW',	'ES');
INSERT INTO @tbl VALUES ('North Rhine-Westphalia'            ,	     'Euskirchen',	'NW',	'EK');
INSERT INTO @tbl VALUES ('Schleswig-Holstein'            ,	     'Flensburg',	'SH',	'FE');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Forchheim',	'BY',	'FR');
INSERT INTO @tbl VALUES ('Rhineland-Palatinate'            ,	     'Frankenthal (Pfalz)',	'RP',	'FA');
INSERT INTO @tbl VALUES ('Hesse'            ,	     'Frankfurt am Main',	'HE',	'FM');
INSERT INTO @tbl VALUES ('Brandenburg'            ,	     'Frankfurt (Oder)',	'BB',	'FA');
INSERT INTO @tbl VALUES ('Baden-Wurttemberg'            ,	     'Freiburg im Breisgau',	'BW',	'FB');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Freising',	'BY',	'FE');
INSERT INTO @tbl VALUES ('Baden-Wurttemberg'            ,	     'Freudenstadt',	'BW',	'FE');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Freyung-Grafenau',	'BY',	'FG');
INSERT INTO @tbl VALUES ('Lower Saxony'            ,	     'Friesland',	'NI',	'FI');
INSERT INTO @tbl VALUES ('Hesse'            ,	     'Fulda',	'HE',	'FL');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Furstenfeldbruck',	'BY',	'FF');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Furth',	'BY',	'FS');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Garmisch-Partenkirchen',	'BY',	'GP');
INSERT INTO @tbl VALUES ('North Rhine-Westphalia'            ,	     'Gelsenkirchen',	'NW',	'GL');
INSERT INTO @tbl VALUES ('Thuringia'            ,	     'Gera',	'TH',	'GR');
INSERT INTO @tbl VALUES ('Rhineland-Palatinate'            ,	     'Germersheim',	'RP',	'GR');
INSERT INTO @tbl VALUES ('Hesse'            ,	     'Giessen',	'HE',	'GE');
INSERT INTO @tbl VALUES ('Lower Saxony'            ,	     'Gifhorn',	'NI',	'GF');
INSERT INTO @tbl VALUES ('Baden-Wurttemberg'            ,	     'Goppingen',	'BW',	'GP');
INSERT INTO @tbl VALUES ('Saxony'            ,	     'Gorlitz',	'SN',	'GR');
INSERT INTO @tbl VALUES ('Lower Saxony'            ,	     'Goslar',	'NI',	'GS');
INSERT INTO @tbl VALUES ('Thuringia'            ,	     'Gotha',	'TH',	'GT');
INSERT INTO @tbl VALUES ('Lower Saxony'            ,	     'Gottingen',	'NI',	'GT');
INSERT INTO @tbl VALUES ('Lower Saxony'            ,	     'Grafschaft Bentheim',	'NI',	'GB');
INSERT INTO @tbl VALUES ('Thuringia'            ,	     'Greiz',	'TH',	'GE');
INSERT INTO @tbl VALUES ('Hesse'            ,	     'Gross-Gerau',	'HE',	'GG');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Gunzburg',	'BY',	'GN');
INSERT INTO @tbl VALUES ('North Rhine-Westphalia'            ,	     'Gutersloh',	'NW',	'GT');
INSERT INTO @tbl VALUES ('North Rhine-Westphalia'            ,	     'Hagen',	'NW',	'HG');
INSERT INTO @tbl VALUES ('Saxony-Anhalt'            ,	     'Halle (Saale)',	'ST',	'HA');
INSERT INTO @tbl VALUES ('Hamburg'            ,	     'Hamburg',	'HH',	'HM');
INSERT INTO @tbl VALUES ('Lower Saxony'            ,	     'Hameln-Pyrmont',	'NI',	'HP');
INSERT INTO @tbl VALUES ('North Rhine-Westphalia'            ,	     'Hamm',	'NW',	'HM');
INSERT INTO @tbl VALUES ('Lower Saxony'            ,	     'Hannover',	'NI',	'HA');
INSERT INTO @tbl VALUES ('Lower Saxony'            ,	     'Harburg',	'NI',	'HR');
INSERT INTO @tbl VALUES ('Saxony-Anhalt'            ,	     'Harz',	'ST',	'HR');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Hassberge',	'BY',	'HB');
INSERT INTO @tbl VALUES ('Brandenburg'            ,	     'Havelland',	'BB',	'HV');
INSERT INTO @tbl VALUES ('Lower Saxony'            ,	     'Heidekreis',	'NI',	'HD');
INSERT INTO @tbl VALUES ('Baden-Wurttemberg'            ,	     'Heidelberg',	'BW',	'HD');
INSERT INTO @tbl VALUES ('Baden-Wurttemberg'            ,	     'Heidenheim',	'BW',	'HH');
INSERT INTO @tbl VALUES ('Baden-Wurttemberg'            ,	     'Heilbronn',	'BW',	'HB');
INSERT INTO @tbl VALUES ('North Rhine-Westphalia'            ,	     'Heinsberg',	'NW',	'HI');
INSERT INTO @tbl VALUES ('Lower Saxony'            ,	     'Helmstedt',	'NI',	'HL');
INSERT INTO @tbl VALUES ('North Rhine-Westphalia'            ,	     'Herford',	'NW',	'HF');
INSERT INTO @tbl VALUES ('North Rhine-Westphalia'            ,	     'Herne',	'NW',	'HR');
INSERT INTO @tbl VALUES ('Hesse'            ,	     'Hersfeld-Rotenburg',	'HE',	'HR');
INSERT INTO @tbl VALUES ('Schleswig-Holstein'            ,	     'Herzogtum Lauenburg',	'SH',	'HL');
INSERT INTO @tbl VALUES ('Thuringia'            ,	     'Hildburghausen',	'TH',	'HL');
INSERT INTO @tbl VALUES ('Lower Saxony'            ,	     'Hildesheim',	'NI',	'HH');
INSERT INTO @tbl VALUES ('North Rhine-Westphalia'            ,	     'Hochsauerlandkreis',	'NW',	'HC');
INSERT INTO @tbl VALUES ('Hesse'            ,	     'Hochtaunuskreis',	'HE',	'HC');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Hof',	'BY',	'HL');
INSERT INTO @tbl VALUES ('Baden-Wurttemberg'            ,	     'Hohenlohekreis',	'BW',	'HL');
INSERT INTO @tbl VALUES ('Lower Saxony'            ,	     'Holzminden',	'NI',	'HZ');
INSERT INTO @tbl VALUES ('North Rhine-Westphalia'            ,	     'Hoxter',	'NW',	'HX');
INSERT INTO @tbl VALUES ('Thuringia'            ,	     'Ilm-Kreis',	'TH',	'IK');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Ingolstadt',	'BY',	'IG');
INSERT INTO @tbl VALUES ('Thuringia'            ,	     'Jena',	'TH',	'JN');
INSERT INTO @tbl VALUES ('Saxony-Anhalt'            ,	     'Jerichower Land',	'ST',	'JL');
INSERT INTO @tbl VALUES ('Rhineland-Palatinate'            ,	     'Kaiserslautern',	'RP',	'KS');
INSERT INTO @tbl VALUES ('Baden-Wurttemberg'            ,	     'Karlsruhe',	'BW',	'KL');
INSERT INTO @tbl VALUES ('Hesse'            ,	     'Kassel',	'HE',	'KA');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Kaufbeuren',	'BY',	'KU');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Kelheim',	'BY',	'KE');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Kempten (Allgau)',	'BY',	'KM');
INSERT INTO @tbl VALUES ('Schleswig-Holstein'            ,	     'Kiel',	'SH',	'KE');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Kitzingen',	'BY',	'KT');
INSERT INTO @tbl VALUES ('North Rhine-Westphalia'            ,	     'Kleve',	'NW',	'KV');
INSERT INTO @tbl VALUES ('Rhineland-Palatinate'            ,	     'Koblenz',	'RP',	'KO');
INSERT INTO @tbl VALUES ('North Rhine-Westphalia'            ,	     'Koln',	'NW',	'KO');
INSERT INTO @tbl VALUES ('Baden-Wurttemberg'            ,	     'Konstanz',	'BW',	'KN');
INSERT INTO @tbl VALUES ('North Rhine-Westphalia'            ,	     'Krefeld',	'NW',	'KF');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Kronach',	'BY',	'KO');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Kulmbach',	'BY',	'KB');
INSERT INTO @tbl VALUES ('Rhineland-Palatinate'            ,	     'Kusel',	'RP',	'KU');
INSERT INTO @tbl VALUES ('Thuringia'            ,	     'Kyffhauserkreis',	'TH',	'KF');
INSERT INTO @tbl VALUES ('Hesse'            ,	     'Lahn-Dill-Kreis',	'HE',	'LD');
INSERT INTO @tbl VALUES ('Rhineland-Palatinate'            ,	     'Landau in der Pfalz',	'RP',	'LP');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Landsberg am Lech',	'BY',	'LL');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Landshut',	'BY',	'LS');
INSERT INTO @tbl VALUES ('Lower Saxony'            ,	     'Leer',	'NI',	'LE');
INSERT INTO @tbl VALUES ('Saxony'            ,	     'Leipzig',	'SN',	'LS');
INSERT INTO @tbl VALUES ('North Rhine-Westphalia'            ,	     'Leverkusen',	'NW',	'LV');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Lichtenfels',	'BY',	'LC');
INSERT INTO @tbl VALUES ('Hesse'            ,	     'Limburg-Weilburg',	'HE',	'LW');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Lindau (Bodensee)',	'BY',	'LN');
INSERT INTO @tbl VALUES ('North Rhine-Westphalia'            ,	     'Lippe',	'NW',	'LP');
INSERT INTO @tbl VALUES ('Baden-Wurttemberg'            ,	     'Lorrach',	'BW',	'LR');
INSERT INTO @tbl VALUES ('Schleswig-Holstein'            ,	     'Lubeck',	'SH',	'LB');
INSERT INTO @tbl VALUES ('Lower Saxony'            ,	     'Luchow-Dannenberg',	'NI',	'LD');
INSERT INTO @tbl VALUES ('Baden-Wurttemberg'            ,	     'Ludwigsburg',	'BW',	'LD');
INSERT INTO @tbl VALUES ('Rhineland-Palatinate'            ,	     'Ludwigshafen am Rhein',	'RP',	'LR');
INSERT INTO @tbl VALUES ('Mecklenburg-West Pomerania'            ,	     'Ludwigslust-Parchim',	'MV',	'LP');
INSERT INTO @tbl VALUES ('Lower Saxony'            ,	     'Luneburg',	'NI',	'LN');
INSERT INTO @tbl VALUES ('Saxony-Anhalt'            ,	     'Magdeburg',	'ST',	'MG');
INSERT INTO @tbl VALUES ('Hesse'            ,	     'Main-Kinzig-Kreis',	'HE',	'MK');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Main-Spessart',	'BY',	'MS');
INSERT INTO @tbl VALUES ('Hesse'            ,	     'Main-Taunus-Kreis',	'HE',	'MT');
INSERT INTO @tbl VALUES ('Rhineland-Palatinate'            ,	     'Mainz',	'RP',	'MI');
INSERT INTO @tbl VALUES ('Rhineland-Palatinate'            ,	     'Mainz-Bingen',	'RP',	'MB');
INSERT INTO @tbl VALUES ('Baden-Wurttemberg'            ,	     'Mannheim',	'BW',	'MN');
INSERT INTO @tbl VALUES ('Saxony-Anhalt'            ,	     'Mansfeld-Sudharz',	'ST',	'MS');
INSERT INTO @tbl VALUES ('Hesse'            ,	     'Marburg-Biedenkopf',	'HE',	'MB');
INSERT INTO @tbl VALUES ('North Rhine-Westphalia'            ,	     'Markischer Kreis',	'NW',	'MK');
INSERT INTO @tbl VALUES ('Brandenburg'            ,	     'Markisch-Oderland',	'BB',	'MO');
INSERT INTO @tbl VALUES ('Rhineland-Palatinate'            ,	     'Mayen-Koblenz',	'RP',	'MK');
INSERT INTO @tbl VALUES ('Mecklenburg-West Pomerania'            ,	     'Mecklenburgische Seenplatte',	'MV',	'MS');
INSERT INTO @tbl VALUES ('Saxony'            ,	     'Meissen',	'SN',	'MI');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Memmingen',	'BY',	'MM');
INSERT INTO @tbl VALUES ('Saarland'            ,	     'Merzig-Wadern',	'SL',	'MW');
INSERT INTO @tbl VALUES ('North Rhine-Westphalia'            ,	     'Mettmann',	'NW',	'MT');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Miesbach',	'BY',	'ME');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Miltenberg',	'BY',	'ML');
INSERT INTO @tbl VALUES ('North Rhine-Westphalia'            ,	     'Minden-Lubbecke',	'NW',	'ML');
INSERT INTO @tbl VALUES ('Saxony'            ,	     'Mittelsachsen',	'SN',	'MT');
INSERT INTO @tbl VALUES ('North Rhine-Westphalia'            ,	     'Monchengladbach',	'NW',	'MG');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Muhldorf am Inn',	'BY',	'MI');
INSERT INTO @tbl VALUES ('North Rhine-Westphalia'            ,	     'Mulheim an der Ruhr',	'NW',	'MR');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Munchen',	'BY',	'MU');
INSERT INTO @tbl VALUES ('North Rhine-Westphalia'            ,	     'Munster',	'NW',	'MN');
INSERT INTO @tbl VALUES ('Baden-Wurttemberg'            ,	     'Neckar-Odenwald-Kreis',	'BW',	'NO');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Neuburg-Schrobenhausen',	'BY',	'NS');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Neumarkt in der Oberpfalz',	'BY',	'NO');
INSERT INTO @tbl VALUES ('Schleswig-Holstein'            ,	     'Neumunster',	'SH',	'NU');
INSERT INTO @tbl VALUES ('Saarland'            ,	     'Neunkirchen',	'SL',	'NU');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Neustadt an der Aisch-Bad Windsheim',	'BY',	'NA');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Neustadt an der Waldnaab',	'BY',	'NW');
INSERT INTO @tbl VALUES ('Rhineland-Palatinate'            ,	     'Neustadt an der Weinstrasse',	'RP',	'NW');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Neu-Ulm',	'BY',	'NU');
INSERT INTO @tbl VALUES ('Rhineland-Palatinate'            ,	     'Neuwied',	'RP',	'NU');
INSERT INTO @tbl VALUES ('Lower Saxony'            ,	     'Nienburg/Weser',	'NI',	'NE');
INSERT INTO @tbl VALUES ('Schleswig-Holstein'            ,	     'Nordfriesland',	'SH',	'NR');
INSERT INTO @tbl VALUES ('Thuringia'            ,	     'Nordhausen',	'TH',	'NR');
INSERT INTO @tbl VALUES ('Saxony'            ,	     'Nordsachsen',	'SN',	'NR');
INSERT INTO @tbl VALUES ('Mecklenburg-West Pomerania'            ,	     'Nordwestmecklenburg',	'MV',	'NR');
INSERT INTO @tbl VALUES ('Lower Saxony'            ,	     'Northeim',	'NI',	'NR');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Nurnberg',	'BY',	'NR');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Nurnberger Land',	'BY',	'NL');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Oberallgau',	'BY',	'OE');
INSERT INTO @tbl VALUES ('North Rhine-Westphalia'            ,	     'Oberbergischer Kreis',	'NW',	'OK');
INSERT INTO @tbl VALUES ('North Rhine-Westphalia'            ,	     'Oberhausen',	'NW',	'OE');
INSERT INTO @tbl VALUES ('Brandenburg'            ,	     'Oberhavel',	'BB',	'OE');
INSERT INTO @tbl VALUES ('Brandenburg'            ,	     'Oberspreewald-Lausitz',	'BB',	'OL');
INSERT INTO @tbl VALUES ('Hesse'            ,	     'Odenwaldkreis',	'HE',	'OE');
INSERT INTO @tbl VALUES ('Brandenburg'            ,	     'Oder-Spree',	'BB',	'OS');
INSERT INTO @tbl VALUES ('Hesse'            ,	     'Offenbach',	'HE',	'OF');
INSERT INTO @tbl VALUES ('Hesse'            ,	     'Offenbach am Main',	'HE',	'OM');
INSERT INTO @tbl VALUES ('Lower Saxony'            ,	     'Oldenburg',	'NI',	'OS');
INSERT INTO @tbl VALUES ('North Rhine-Westphalia'            ,	     'Olpe',	'NW',	'OP');
INSERT INTO @tbl VALUES ('Baden-Wurttemberg'            ,	     'Ortenaukreis',	'BW',	'OR');
INSERT INTO @tbl VALUES ('Lower Saxony'            ,	     'Osnabruck',	'NI',	'ON');
INSERT INTO @tbl VALUES ('Baden-Wurttemberg'            ,	     'Ostalbkreis',	'BW',	'OA');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Ostallgau',	'BY',	'OT');
INSERT INTO @tbl VALUES ('Lower Saxony'            ,	     'Osterholz',	'NI',	'OT');
INSERT INTO @tbl VALUES ('Lower Saxony'            ,	     'Osterode am Harz',	'NI',	'OH');
INSERT INTO @tbl VALUES ('Schleswig-Holstein'            ,	     'Ostholstein',	'SH',	'OT');
INSERT INTO @tbl VALUES ('Brandenburg'            ,	     'Ostprignitz-Ruppin',	'BB',	'OR');
INSERT INTO @tbl VALUES ('North Rhine-Westphalia'            ,	     'Paderborn',	'NW',	'PD');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Passau',	'BY',	'PL');
INSERT INTO @tbl VALUES ('Lower Saxony'            ,	     'Peine',	'NI',	'PI');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Pfaffenhofen an der Ilm',	'BY',	'PI');
INSERT INTO @tbl VALUES ('Baden-Wurttemberg'            ,	     'Pforzheim',	'BW',	'PO');
INSERT INTO @tbl VALUES ('Schleswig-Holstein'            ,	     'Pinneberg',	'SH',	'PN');
INSERT INTO @tbl VALUES ('Rhineland-Palatinate'            ,	     'Pirmasens',	'RP',	'PR');
INSERT INTO @tbl VALUES ('Schleswig-Holstein'            ,	     'Plon',	'SH',	'PO');
INSERT INTO @tbl VALUES ('Brandenburg'            ,	     'Potsdam',	'BB',	'PT');
INSERT INTO @tbl VALUES ('Brandenburg'            ,	     'Potsdam-Mittelmark',	'BB',	'PM');
INSERT INTO @tbl VALUES ('Brandenburg'            ,	     'Prignitz',	'BB',	'PI');
INSERT INTO @tbl VALUES ('Baden-Wurttemberg'            ,	     'Rastatt',	'BW',	'RS');
INSERT INTO @tbl VALUES ('Baden-Wurttemberg'            ,	     'Ravensburg',	'BW',	'RV');
INSERT INTO @tbl VALUES ('North Rhine-Westphalia'            ,	     'Recklinghausen',	'NW',	'RC');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Regen',	'BY',	'RE');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Regensburg',	'BY',	'RB');
INSERT INTO @tbl VALUES ('North Rhine-Westphalia'            ,	     'Remscheid',	'NW',	'RM');
INSERT INTO @tbl VALUES ('Baden-Wurttemberg'            ,	     'Rems-Murr-Kreis',	'BW',	'RM');
INSERT INTO @tbl VALUES ('Schleswig-Holstein'            ,	     'Rendsburg-Eckernforde',	'SH',	'RE');
INSERT INTO @tbl VALUES ('Baden-Wurttemberg'            ,	     'Reutlingen',	'BW',	'RU');
INSERT INTO @tbl VALUES ('North Rhine-Westphalia'            ,	     'Rhein-Erft-Kreis',	'NW',	'RE');
INSERT INTO @tbl VALUES ('Hesse'            ,	     'Rheingau-Taunus-Kreis',	'HE',	'RT');
INSERT INTO @tbl VALUES ('Rhineland-Palatinate'            ,	     'Rhein-Hunsruck-Kreis',	'RP',	'RH');
INSERT INTO @tbl VALUES ('North Rhine-Westphalia'            ,	     'Rheinisch-Bergischer Kreis',	'NW',	'RB');
INSERT INTO @tbl VALUES ('North Rhine-Westphalia'            ,	     'Rhein-Kreis Neuss',	'NW',	'RN');
INSERT INTO @tbl VALUES ('Rhineland-Palatinate'            ,	     'Rhein-Lahn-Kreis',	'RP',	'RN');
INSERT INTO @tbl VALUES ('Baden-Wurttemberg'            ,	     'Rhein-Neckar-Kreis',	'BW',	'RN');
INSERT INTO @tbl VALUES ('Rhineland-Palatinate'            ,	     'Rhein-Pfalz-Kreis',	'RP',	'RZ');
INSERT INTO @tbl VALUES ('North Rhine-Westphalia'            ,	     'Rhein-Sieg-Kreis',	'NW',	'RS');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Rhon-Grabfeld',	'BY',	'RG');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Rosenheim',	'BY',	'RS');
INSERT INTO @tbl VALUES ('Mecklenburg-West Pomerania'            ,	     'Rostock',	'MV',	'RS');
INSERT INTO @tbl VALUES ('Lower Saxony'            ,	     'Rotenburg (Wumme)',	'NI',	'RT');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Roth',	'BY',	'RT');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Rottal-Inn',	'BY',	'RI');
INSERT INTO @tbl VALUES ('Baden-Wurttemberg'            ,	     'Rottweil',	'BW',	'RT');
INSERT INTO @tbl VALUES ('Thuringia'            ,	     'Saale-Holzland-Kreis',	'TH',	'SH');
INSERT INTO @tbl VALUES ('Saxony-Anhalt'            ,	     'Saalekreis',	'ST',	'SL');
INSERT INTO @tbl VALUES ('Thuringia'            ,	     'Saale-Orla-Kreis',	'TH',	'SO');
INSERT INTO @tbl VALUES ('Thuringia'            ,	     'Saalfeld-Rudolstadt',	'TH',	'SR');
INSERT INTO @tbl VALUES ('Saarland'            ,	     'Saarbrucken',	'SL',	'SB');
INSERT INTO @tbl VALUES ('Saarland'            ,	     'Saarlouis',	'SL',	'SA');
INSERT INTO @tbl VALUES ('Saarland'            ,	     'Saarpfalz-Kreis',	'SL',	'SP');
INSERT INTO @tbl VALUES ('Saxony'            ,	     'Sachsische Schweiz-Osterzgebirge',	'SN',	'SS');
INSERT INTO @tbl VALUES ('Lower Saxony'            ,	     'Salzgitter',	'NI',	'SL');
INSERT INTO @tbl VALUES ('Saxony-Anhalt'            ,	     'Salzlandkreis',	'ST',	'SZ');
INSERT INTO @tbl VALUES ('Saarland'            ,	     'St. Wendel',	'SL',	'SW');
INSERT INTO @tbl VALUES ('Lower Saxony'            ,	     'Schaumburg',	'NI',	'SH');
INSERT INTO @tbl VALUES ('Schleswig-Holstein'            ,	     'Schleswig-Flensburg',	'SH',	'SF');
INSERT INTO @tbl VALUES ('Thuringia'            ,	     'Schmalkalden-Meiningen',	'TH',	'SM');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Schwabach',	'BY',	'SH');
INSERT INTO @tbl VALUES ('Baden-Wurttemberg'            ,	     'Schwabisch Hall',	'BW',	'SH');
INSERT INTO @tbl VALUES ('Hesse'            ,	     'Schwalm-Eder-Kreis',	'HE',	'SE');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Schwandorf',	'BY',	'SD');
INSERT INTO @tbl VALUES ('Baden-Wurttemberg'            ,	     'Schwarzwald-Baar-Kreis',	'BW',	'SB');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Schweinfurt',	'BY',	'SS');
INSERT INTO @tbl VALUES ('Mecklenburg-West Pomerania'            ,	     'Schwerin',	'MV',	'SH');
INSERT INTO @tbl VALUES ('Schleswig-Holstein'            ,	     'Segeberg',	'SH',	'SG');
INSERT INTO @tbl VALUES ('North Rhine-Westphalia'            ,	     'Siegen-Wittgenstein',	'NW',	'SW');
INSERT INTO @tbl VALUES ('Baden-Wurttemberg'            ,	     'Sigmaringen',	'BW',	'SG');
INSERT INTO @tbl VALUES ('North Rhine-Westphalia'            ,	     'Soest',	'NW',	'SO');
INSERT INTO @tbl VALUES ('North Rhine-Westphalia'            ,	     'Solingen',	'NW',	'SL');
INSERT INTO @tbl VALUES ('Thuringia'            ,	     'Sommerda',	'TH',	'SD');
INSERT INTO @tbl VALUES ('Thuringia'            ,	     'Sonneberg',	'TH',	'SN');
INSERT INTO @tbl VALUES ('Rhineland-Palatinate'            ,	     'Speyer',	'RP',	'SE');
INSERT INTO @tbl VALUES ('Brandenburg'            ,	     'Spree-Neisse',	'BB',	'SN');
INSERT INTO @tbl VALUES ('Lower Saxony'            ,	     'Stade',	'NI',	'SA');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Starnberg',	'BY',	'SA');
INSERT INTO @tbl VALUES ('Schleswig-Holstein'            ,	     'Steinburg',	'SH',	'SE');
INSERT INTO @tbl VALUES ('North Rhine-Westphalia'            ,	     'Steinfurt',	'NW',	'SF');
INSERT INTO @tbl VALUES ('Saxony-Anhalt'            ,	     'Stendal',	'ST',	'SE');
INSERT INTO @tbl VALUES ('Schleswig-Holstein'            ,	     'Stormarn',	'SH',	'SO');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Straubing',	'BY',	'ST');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Straubing-Bogen',	'BY',	'SB');
INSERT INTO @tbl VALUES ('Baden-Wurttemberg'            ,	     'Stuttgart',	'BW',	'SU');
INSERT INTO @tbl VALUES ('Rhineland-Palatinate'            ,	     'Sudliche Weinstrasse',	'RP',	'SW');
INSERT INTO @tbl VALUES ('Rhineland-Palatinate'            ,	     'Sudwestpfalz',	'RP',	'SD');
INSERT INTO @tbl VALUES ('Thuringia'            ,	     'Suhl',	'TH',	'SU');
INSERT INTO @tbl VALUES ('Brandenburg'            ,	     'Teltow-Flaming',	'BB',	'TF');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Tirschenreuth',	'BY',	'TR');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Traunstein',	'BY',	'TA');
INSERT INTO @tbl VALUES ('Rhineland-Palatinate'            ,	     'Trier',	'RP',	'TI');
INSERT INTO @tbl VALUES ('Rhineland-Palatinate'            ,	     'Trier-Saarburg',	'RP',	'TS');
INSERT INTO @tbl VALUES ('Baden-Wurttemberg'            ,	     'Tubingen',	'BW',	'TB');
INSERT INTO @tbl VALUES ('Baden-Wurttemberg'            ,	     'Tuttlingen',	'BW',	'TT');
INSERT INTO @tbl VALUES ('Brandenburg'            ,	     'Uckermark',	'BB',	'UK');
INSERT INTO @tbl VALUES ('Lower Saxony'            ,	     'Uelzen',	'NI',	'UL');
INSERT INTO @tbl VALUES ('Baden-Wurttemberg'            ,	     'Ulm',	'BW',	'UM');
INSERT INTO @tbl VALUES ('North Rhine-Westphalia'            ,	     'Unna',	'NW',	'UN');
INSERT INTO @tbl VALUES ('Thuringia'            ,	     'Unstrut-Hainich-Kreis',	'TH',	'UH');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Unterallgau',	'BY',	'UT');
INSERT INTO @tbl VALUES ('Lower Saxony'            ,	     'Vechta',	'NI',	'VC');
INSERT INTO @tbl VALUES ('Lower Saxony'            ,	     'Verden',	'NI',	'VR');
INSERT INTO @tbl VALUES ('North Rhine-Westphalia'            ,	     'Viersen',	'NW',	'VE');
INSERT INTO @tbl VALUES ('Hesse'            ,	     'Vogelsbergkreis',	'HE',	'VG');
INSERT INTO @tbl VALUES ('Saxony'            ,	     'Vogtlandkreis',	'SN',	'VG');
INSERT INTO @tbl VALUES ('Mecklenburg-West Pomerania'            ,	     'Vorpommern-Greifswald',	'MV',	'VG');
INSERT INTO @tbl VALUES ('Mecklenburg-West Pomerania'            ,	     'Vorpommern-Rugen',	'MV',	'VR');
INSERT INTO @tbl VALUES ('Rhineland-Palatinate'            ,	     'Vulkaneifel',	'RP',	'VL');
INSERT INTO @tbl VALUES ('Hesse'            ,	     'Waldeck-Frankenberg',	'HE',	'WF');
INSERT INTO @tbl VALUES ('Baden-Wurttemberg'            ,	     'Waldshut',	'BW',	'WL');
INSERT INTO @tbl VALUES ('North Rhine-Westphalia'            ,	     'Warendorf',	'NW',	'WR');
INSERT INTO @tbl VALUES ('Thuringia'            ,	     'Wartburgkreis',	'TH',	'WR');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Weiden in der Oberpfalz',	'BY',	'WO');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Weilheim-Schongau',	'BY',	'WS');
INSERT INTO @tbl VALUES ('Thuringia'            ,	     'Weimar',	'TH',	'WI');
INSERT INTO @tbl VALUES ('Thuringia'            ,	     'Weimarer Land',	'TH',	'WL');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Weissenburg-Gunzenhausen',	'BY',	'WG');
INSERT INTO @tbl VALUES ('Hesse'            ,	     'Werra-Meissner-Kreis',	'HE',	'WM');
INSERT INTO @tbl VALUES ('North Rhine-Westphalia'            ,	     'Wesel',	'NW',	'WS');
INSERT INTO @tbl VALUES ('Lower Saxony'            ,	     'Wesermarsch',	'NI',	'WS');
INSERT INTO @tbl VALUES ('Rhineland-Palatinate'            ,	     'Westerwaldkreis',	'RP',	'WS');
INSERT INTO @tbl VALUES ('Hesse'            ,	     'Wetteraukreis',	'HE',	'WT');
INSERT INTO @tbl VALUES ('Hesse'            ,	     'Wiesbaden',	'HE',	'WE');
INSERT INTO @tbl VALUES ('Lower Saxony'            ,	     'Wilhelmshaven',	'NI',	'WH');
INSERT INTO @tbl VALUES ('Saxony-Anhalt'            ,	     'Wittenberg',	'ST',	'WT');
INSERT INTO @tbl VALUES ('Lower Saxony'            ,	     'Wittmund',	'NI',	'WT');
INSERT INTO @tbl VALUES ('Lower Saxony'            ,	     'Wolfenbuttel',	'NI',	'WB');
INSERT INTO @tbl VALUES ('Lower Saxony'            ,	     'Wolfsburg',	'NI',	'WL');
INSERT INTO @tbl VALUES ('Rhineland-Palatinate'            ,	     'Worms',	'RP',	'WR');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Wunsiedel im Fichtelgebirge',	'BY',	'WF');
INSERT INTO @tbl VALUES ('North Rhine-Westphalia'            ,	     'Wuppertal',	'NW',	'WP');
INSERT INTO @tbl VALUES ('Bavaria'            ,	     'Wurzburg',	'BY',	'WZ');
INSERT INTO @tbl VALUES ('Baden-Wurttemberg'            ,	     'Zollernalbkreis',	'BW',	'ZL');
INSERT INTO @tbl VALUES ('Rhineland-Palatinate'            ,	     'Zweibrucken',	'RP',	'ZE');
INSERT INTO @tbl VALUES ('Saxony'            ,	     'Zwickau',	'SN',	'ZI');

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

