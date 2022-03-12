
/* ==================================================================================
    	Source File		:	setup_france_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	10-10-2014
	Module ID		:	CDB
	Last updated		:	10-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of France are set-up
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
WHERE	country_nm	=	'France';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country France not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Department',
		level_2_address_component	=	'Arrondissement',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Somme'            ,	     'Abbeville',	'SO',	'AB');
INSERT INTO @tbl VALUES ('Lot-et-Garonne'            ,	     'Agen ',	'LG',	'AG');
INSERT INTO @tbl VALUES ('Bouches-du-Rhone'            ,	     'Aix-en-Provence',	'BD',	'AX');
INSERT INTO @tbl VALUES ('Corse-du-Sud'            ,	     'Ajaccio ',	'CS',	'AJ');
INSERT INTO @tbl VALUES ('Savoie'            ,	     'Albertville',	'SV',	'AV');
INSERT INTO @tbl VALUES ('Tarn'            ,	     'Albi ',	'TA',	'AB');
INSERT INTO @tbl VALUES ('Orne'            ,	     'Alencon ',	'OR',	'AL');
INSERT INTO @tbl VALUES ('Gard'            ,	     'Ales',	'GA',	'AL');
INSERT INTO @tbl VALUES ('Haut-Rhin'            ,	     'Altkirch',	'HR',	'AK');
INSERT INTO @tbl VALUES ('Puy-de-Dome'            ,	     'Ambert',	'PD',	'AB');
INSERT INTO @tbl VALUES ('Somme'            ,	     'Amiens ',	'SO',	'AM');
INSERT INTO @tbl VALUES ('Loire-Atlantique'            ,	     'Ancenis',	'LA',	'AC');
INSERT INTO @tbl VALUES ('Maine-et-Loire'            ,	     'Angers ',	'ML',	'AG');
INSERT INTO @tbl VALUES ('Charente'            ,	     'Angouleme ',	'CT',	'AG');
INSERT INTO @tbl VALUES ('Haute-Savoie'            ,	     'Annecy ',	'HS',	'AN');
INSERT INTO @tbl VALUES ('Hauts-de-Seine'            ,	     'Antony',	'HD',	'AT');
INSERT INTO @tbl VALUES ('Vaucluse'            ,	     'Apt',	'VC',	'AP');
INSERT INTO @tbl VALUES ('Gironde'            ,	     'Arcachon',	'GI',	'AR');
INSERT INTO @tbl VALUES ('Hautes-Pyrenees'            ,	     'Argeles-Gazost',	'HP',	'AG');
INSERT INTO @tbl VALUES ('Orne'            ,	     'Argentan',	'OR',	'AR');
INSERT INTO @tbl VALUES ('Val-d''Oise'            ,	     'Argenteuil',	'VO',	'AG');
INSERT INTO @tbl VALUES ('Bouches-du-Rhone'            ,	     'Arles',	'BD',	'AL');
INSERT INTO @tbl VALUES ('Pas-de-Calais'            ,	     'Arras ',	'PC',	'AR');
INSERT INTO @tbl VALUES ('Creuse'            ,	     'Aubusson',	'CR',	'AB');
INSERT INTO @tbl VALUES ('Gers'            ,	     'Auch ',	'GE',	'AC');
INSERT INTO @tbl VALUES ('Cantal'            ,	     'Aurillac ',	'CL',	'AR');
INSERT INTO @tbl VALUES ('Saone-et-Loire'            ,	     'Autun',	'SL',	'AT');
INSERT INTO @tbl VALUES ('Yonne'            ,	     'Auxerre ',	'YO',	'AX');
INSERT INTO @tbl VALUES ('Yonne'            ,	     'Avallon',	'YO',	'AV');
INSERT INTO @tbl VALUES ('Nord'            ,	     'Avesnes-sur-Helpe',	'NO',	'AH');
INSERT INTO @tbl VALUES ('Vaucluse'            ,	     'Avignon ',	'VC',	'AV');
INSERT INTO @tbl VALUES ('Manche'            ,	     'Avranches',	'MH',	'AV');
INSERT INTO @tbl VALUES ('Hautes-Pyrenees'            ,	     'Bagneres-de-Bigorre',	'HP',	'BB');
INSERT INTO @tbl VALUES ('Alpes-de-Haute-Provence'            ,	     'Barcelonnette',	'AP',	'BC');
INSERT INTO @tbl VALUES ('Meuse'            ,	     'Bar-le-Duc ',	'MS',	'BD');
INSERT INTO @tbl VALUES ('Aube'            ,	     'Bar-sur-Aube',	'AB',	'BA');
INSERT INTO @tbl VALUES ('Haute-Corse'            ,	     'Bastia ',	'HC',	'BS');
INSERT INTO @tbl VALUES ('Calvados'            ,	     'Bayeux',	'CV',	'BY');
INSERT INTO @tbl VALUES ('Pyrenees-Atlantiques'            ,	     'Bayonne',	'PA',	'BY');
INSERT INTO @tbl VALUES ('Cote-d''Or'            ,	     'Beaune',	'CO',	'BN');
INSERT INTO @tbl VALUES ('Oise'            ,	     'Beauvais ',	'OI',	'BV');
INSERT INTO @tbl VALUES ('Territoire de Belfort'            ,	     'Belfort ',	'TB',	'BF');
INSERT INTO @tbl VALUES ('Haute-Vienne'            ,	     'Bellac',	'HV',	'BL');
INSERT INTO @tbl VALUES ('Ain'            ,	     'Belley',	'AI',	'BL');
INSERT INTO @tbl VALUES ('Dordogne'            ,	     'Bergerac',	'DD',	'BG');
INSERT INTO @tbl VALUES ('Eure'            ,	     'Bernay',	'EU',	'BN');
INSERT INTO @tbl VALUES ('Doubs'            ,	     'Besancon ',	'DB',	'BS');
INSERT INTO @tbl VALUES ('Pas-de-Calais'            ,	     'Bethune',	'PC',	'BT');
INSERT INTO @tbl VALUES ('Herault'            ,	     'Beziers',	'HE',	'BZ');
INSERT INTO @tbl VALUES ('Gironde'            ,	     'Blaye',	'GI',	'BL');
INSERT INTO @tbl VALUES ('Loir-et-Cher'            ,	     'Blois ',	'LC',	'BL');
INSERT INTO @tbl VALUES ('Seine-Saint-Denis'            ,	     'Bobigny ',	'SS',	'BG');
INSERT INTO @tbl VALUES ('Haute-Savoie'            ,	     'Bonneville',	'HS',	'BN');
INSERT INTO @tbl VALUES ('Gironde'            ,	     'Bordeaux ',	'GI',	'BD');
INSERT INTO @tbl VALUES ('Moselle'            ,	     'Boulay-Moselle',	'MO',	'BM');
INSERT INTO @tbl VALUES ('Hauts-de-Seine'            ,	     'Boulogne-Billancourt',	'HD',	'BB');
INSERT INTO @tbl VALUES ('Pas-de-Calais'            ,	     'Boulogne-sur-Mer',	'PC',	'BM');
INSERT INTO @tbl VALUES ('Ain'            ,	     'Bourg-en-Bresse ',	'AI',	'BB');
INSERT INTO @tbl VALUES ('Cher'            ,	     'Bourges ',	'CH',	'BG');
INSERT INTO @tbl VALUES ('Deux-Sevres'            ,	     'Bressuire',	'DS',	'BR');
INSERT INTO @tbl VALUES ('Finistere'            ,	     'Brest',	'FI',	'BR');
INSERT INTO @tbl VALUES ('Hautes-Alpes'            ,	     'Briancon',	'HA',	'BN');
INSERT INTO @tbl VALUES ('Meurthe-et-Moselle'            ,	     'Briey',	'MM',	'BR');
INSERT INTO @tbl VALUES ('Var'            ,	     'Brignoles',	'VR',	'BR');
INSERT INTO @tbl VALUES ('Haute-Loire'            ,	     'Brioude',	'HL',	'BR');
INSERT INTO @tbl VALUES ('Correze'            ,	     'Brive-la-Gaillarde',	'CZ',	'BG');
INSERT INTO @tbl VALUES ('Calvados'            ,	     'Caen ',	'CV',	'CN');
INSERT INTO @tbl VALUES ('Lot'            ,	     'Cahors ',	'LO',	'CH');
INSERT INTO @tbl VALUES ('Pas-de-Calais'            ,	     'Calais',	'PC',	'CL');
INSERT INTO @tbl VALUES ('Haute-Corse'            ,	     'Calvi',	'HC',	'CV');
INSERT INTO @tbl VALUES ('Nord'            ,	     'Cambrai',	'NO',	'CB');
INSERT INTO @tbl VALUES ('Aude'            ,	     'Carcassonne ',	'AD',	'CC');
INSERT INTO @tbl VALUES ('Vaucluse'            ,	     'Carpentras',	'VC',	'CP');
INSERT INTO @tbl VALUES ('Alpes-de-Haute-Provence'            ,	     'Castellane',	'AP',	'CS');
INSERT INTO @tbl VALUES ('Tarn-et-Garonne'            ,	     'Castelsarrasin',	'TG',	'CS');
INSERT INTO @tbl VALUES ('Tarn'            ,	     'Castres',	'TA',	'CT');
INSERT INTO @tbl VALUES ('Pyrenees-Orientales'            ,	     'Ceret',	'PO',	'CR');
INSERT INTO @tbl VALUES ('Marne'            ,	     'Chalons-en-Champagne ',	'MR',	'CC');
INSERT INTO @tbl VALUES ('Saone-et-Loire'            ,	     'Chalon-sur-Saone',	'SL',	'CS');
INSERT INTO @tbl VALUES ('Savoie'            ,	     'Chambery ',	'SV',	'CB');
INSERT INTO @tbl VALUES ('Ardennes'            ,	     'Charleville-Mezieres ',	'AN',	'CV');
INSERT INTO @tbl VALUES ('Saone-et-Loire'            ,	     'Charolles',	'SL',	'CR');
INSERT INTO @tbl VALUES ('Eure-et-Loir'            ,	     'Chartres ',	'EL',	'CH');
INSERT INTO @tbl VALUES ('Loire-Atlantique'            ,	     'Chateaubriant',	'LA',	'CB');
INSERT INTO @tbl VALUES ('Nievre'            ,	     'Chateau-Chinon (Ville)',	'NI',	'CC');
INSERT INTO @tbl VALUES ('Eure-et-Loir'            ,	     'Chateaudun',	'EL',	'CD');
INSERT INTO @tbl VALUES ('Mayenne'            ,	     'Chateau-Gontier',	'MY',	'CG');
INSERT INTO @tbl VALUES ('Finistere'            ,	     'Chateaulin',	'FI',	'CL');
INSERT INTO @tbl VALUES ('Indre'            ,	     'Chateauroux ',	'IN',	'CR');
INSERT INTO @tbl VALUES ('Moselle'            ,	     'Chateau-Salins',	'MO',	'CS');
INSERT INTO @tbl VALUES ('Aisne'            ,	     'Chateau-Thierry',	'AS',	'CT');
INSERT INTO @tbl VALUES ('Vienne'            ,	     'Chatellerault',	'VN',	'CR');
INSERT INTO @tbl VALUES ('Haute-Marne'            ,	     'Chaumont ',	'HM',	'CM');
INSERT INTO @tbl VALUES ('Manche'            ,	     'Cherbourg-Octeville',	'MH',	'CB');
INSERT INTO @tbl VALUES ('Indre-et-Loire'            ,	     'Chinon',	'IL',	'CN');
INSERT INTO @tbl VALUES ('Maine-et-Loire'            ,	     'Cholet',	'ML',	'CL');
INSERT INTO @tbl VALUES ('Nievre'            ,	     'Clamecy',	'NI',	'CM');
INSERT INTO @tbl VALUES ('Oise'            ,	     'Clermont',	'OI',	'CL');
INSERT INTO @tbl VALUES ('Puy-de-Dome'            ,	     'Clermont-Ferrand ',	'PD',	'CF');
INSERT INTO @tbl VALUES ('Charente'            ,	     'Cognac',	'CT',	'CG');
INSERT INTO @tbl VALUES ('Haut-Rhin'            ,	     'Colmar ',	'HR',	'CM');
INSERT INTO @tbl VALUES ('Meuse'            ,	     'Commercy',	'MS',	'CM');
INSERT INTO @tbl VALUES ('Oise'            ,	     'Compiegne',	'OI',	'CP');
INSERT INTO @tbl VALUES ('Gers'            ,	     'Condom',	'GE',	'CD');
INSERT INTO @tbl VALUES ('Charente'            ,	     'Confolens',	'CT',	'CF');
INSERT INTO @tbl VALUES ('Haute-Corse'            ,	     'Corte',	'HC',	'CT');
INSERT INTO @tbl VALUES ('Nievre'            ,	     'Cosne-Cours-sur-Loire',	'NI',	'CL');
INSERT INTO @tbl VALUES ('Manche'            ,	     'Coutances',	'MH',	'CT');
INSERT INTO @tbl VALUES ('Val-de-Marne'            ,	     'Creteil ',	'VM',	'CT');
INSERT INTO @tbl VALUES ('Landes'            ,	     'Dax',	'LD',	'DX');
INSERT INTO @tbl VALUES ('Drome'            ,	     'Die',	'DM',	'DI');
INSERT INTO @tbl VALUES ('Seine-Maritime'            ,	     'Dieppe',	'SM',	'DP');
INSERT INTO @tbl VALUES ('Alpes-de-Haute-Provence'            ,	     'Digne-les-Bains ',	'AP',	'DB');
INSERT INTO @tbl VALUES ('Cote-d''Or'            ,	     'Dijon ',	'CO',	'DJ');
INSERT INTO @tbl VALUES ('Cotes-d''Armor'            ,	     'Dinan',	'CA',	'DN');
INSERT INTO @tbl VALUES ('Jura'            ,	     'Dole',	'JU',	'DL');
INSERT INTO @tbl VALUES ('Nord'            ,	     'Douai',	'NO',	'DO');
INSERT INTO @tbl VALUES ('Var'            ,	     'Draguignan',	'VR',	'DG');
INSERT INTO @tbl VALUES ('Eure-et-Loir'            ,	     'Dreux',	'EL',	'DR');
INSERT INTO @tbl VALUES ('Nord'            ,	     'Dunkerque',	'NO',	'DK');
INSERT INTO @tbl VALUES ('Marne'            ,	     'Epernay',	'MR',	'EP');
INSERT INTO @tbl VALUES ('Vosges'            ,	     'Epinal ',	'VG',	'EP');
INSERT INTO @tbl VALUES ('Essonne'            ,	     'Etampes',	'ES',	'ET');
INSERT INTO @tbl VALUES ('Eure'            ,	     'Evreux ',	'EU',	'EV');
INSERT INTO @tbl VALUES ('Essonne'            ,	     'Evry ',	'ES',	'EV');
INSERT INTO @tbl VALUES ('Lot'            ,	     'Figeac',	'LO',	'FG');
INSERT INTO @tbl VALUES ('Lozere'            ,	     'Florac',	'LZ',	'FR');
INSERT INTO @tbl VALUES ('Ariege'            ,	     'Foix ',	'AG',	'FX');
INSERT INTO @tbl VALUES ('Seine-et-Marne'            ,	     'Fontainebleau',	'SE',	'FB');
INSERT INTO @tbl VALUES ('Vendee'            ,	     'Fontenay-le-Comte',	'VD',	'FC');
INSERT INTO @tbl VALUES ('Moselle'            ,	     'Forbach',	'MO',	'FB');
INSERT INTO @tbl VALUES ('Alpes-de-Haute-Provence'            ,	     'Forcalquier',	'AP',	'FC');
INSERT INTO @tbl VALUES ('Ille-et-Vilaine'            ,	     'Fougeres-Vitre',	'IV',	'FG');
INSERT INTO @tbl VALUES ('Hautes-Alpes'            ,	     'Gap ',	'HA',	'GP');
INSERT INTO @tbl VALUES ('Ain'            ,	     'Gex',	'AI',	'GX');
INSERT INTO @tbl VALUES ('Lot'            ,	     'Gourdon',	'LO',	'GD');
INSERT INTO @tbl VALUES ('Alpes-Maritimes'            ,	     'Grasse',	'AM',	'GR');
INSERT INTO @tbl VALUES ('Isere'            ,	     'Grenoble ',	'IS',	'GR');
INSERT INTO @tbl VALUES ('Haut-Rhin'            ,	     'Guebwiller',	'HR',	'GW');
INSERT INTO @tbl VALUES ('Creuse'            ,	     'Gueret ',	'CR',	'GR');
INSERT INTO @tbl VALUES ('Cotes-d''Armor'            ,	     'Guingamp',	'CA',	'GG');
INSERT INTO @tbl VALUES ('Bas-Rhin'            ,	     'Haguenau',	'BR',	'HG');
INSERT INTO @tbl VALUES ('Puy-de-Dome'            ,	     'Issoire',	'PD',	'IS');
INSERT INTO @tbl VALUES ('Indre'            ,	     'Issoudun',	'IN',	'IS');
INSERT INTO @tbl VALUES ('Bouches-du-Rhone'            ,	     'Istres',	'BD',	'IS');
INSERT INTO @tbl VALUES ('Charente-Maritime'            ,	     'Jonzac',	'CM',	'JZ');
INSERT INTO @tbl VALUES ('Indre'            ,	     'La Chatre',	'IN',	'CT');
INSERT INTO @tbl VALUES ('Sarthe'            ,	     'La Fleche',	'ST',	'FL');
INSERT INTO @tbl VALUES ('Gironde'            ,	     'Langon',	'GI',	'LG');
INSERT INTO @tbl VALUES ('Haute-Marne'            ,	     'Langres',	'HM',	'LG');
INSERT INTO @tbl VALUES ('Cotes-d''Armor'            ,	     'Lannion',	'CA',	'LN');
INSERT INTO @tbl VALUES ('Aisne'            ,	     'Laon ',	'AS',	'LN');
INSERT INTO @tbl VALUES ('Ardeche'            ,	     'Largentiere',	'AH',	'LG');
INSERT INTO @tbl VALUES ('Charente-Maritime'            ,	     'La Rochelle ',	'CM',	'RL');
INSERT INTO @tbl VALUES ('Vendee'            ,	     'La Roche-sur-Yon ',	'VD',	'RY');
INSERT INTO @tbl VALUES ('Isere'            ,	     'La Tour-du-Pin',	'IS',	'TP');
INSERT INTO @tbl VALUES ('Mayenne'            ,	     'Laval ',	'MY',	'LV');
INSERT INTO @tbl VALUES ('Indre'            ,	     'Le Blanc',	'IN',	'LB');
INSERT INTO @tbl VALUES ('Seine-Maritime'            ,	     'Le Havre',	'SM',	'HV');
INSERT INTO @tbl VALUES ('Sarthe'            ,	     'Le Mans ',	'ST',	'MN');
INSERT INTO @tbl VALUES ('Pas-de-Calais'            ,	     'Lens',	'PC',	'LN');
INSERT INTO @tbl VALUES ('Haute-Loire'            ,	     'Le Puy-en-Velay ',	'HL',	'PV');
INSERT INTO @tbl VALUES ('Seine-Saint-Denis'            ,	     'Le Raincy',	'SS',	'RC');
INSERT INTO @tbl VALUES ('Eure'            ,	     'Les Andelys',	'EU',	'AD');
INSERT INTO @tbl VALUES ('Gironde'            ,	     'Lesparre-Medoc',	'GI',	'LM');
INSERT INTO @tbl VALUES ('Vendee'            ,	     'Les Sables-d''Olonne',	'VD',	'SO');
INSERT INTO @tbl VALUES ('Gard'            ,	     'Le Vigan',	'GA',	'VG');
INSERT INTO @tbl VALUES ('Val-de-Marne'            ,	     'L''Hay-les-Roses',	'VM',	'HR');
INSERT INTO @tbl VALUES ('Gironde'            ,	     'Libourne',	'GI',	'LB');
INSERT INTO @tbl VALUES ('Nord'            ,	     'Lille ',	'NO',	'LL');
INSERT INTO @tbl VALUES ('Haute-Vienne'            ,	     'Limoges ',	'HV',	'LM');
INSERT INTO @tbl VALUES ('Aude'            ,	     'Limoux',	'AD',	'LM');
INSERT INTO @tbl VALUES ('Calvados'            ,	     'Lisieux',	'CV',	'LS');
INSERT INTO @tbl VALUES ('Indre-et-Loire'            ,	     'Loches',	'IL',	'LC');
INSERT INTO @tbl VALUES ('Herault'            ,	     'Lodeve',	'HE',	'LD');
INSERT INTO @tbl VALUES ('Jura'            ,	     'Lons-le-Saunier ',	'JU',	'LS');
INSERT INTO @tbl VALUES ('Morbihan'            ,	     'Lorient',	'MB',	'LR');
INSERT INTO @tbl VALUES ('Saone-et-Loire'            ,	     'Louhans',	'SL',	'LH');
INSERT INTO @tbl VALUES ('Meurthe-et-Moselle'            ,	     'Luneville',	'MM',	'LV');
INSERT INTO @tbl VALUES ('Haute-Saone'            ,	     'Lure',	'HN',	'LR');
INSERT INTO @tbl VALUES ('Rhone'            ,	     'Lyon ',	'RH',	'LY');
INSERT INTO @tbl VALUES ('Saone-et-Loire'            ,	     'Macon ',	'SL',	'MC');
INSERT INTO @tbl VALUES ('Sarthe'            ,	     'Mamers',	'ST',	'MM');
INSERT INTO @tbl VALUES ('Yvelines'            ,	     'Mantes-la-Jolie',	'YV',	'MJ');
INSERT INTO @tbl VALUES ('Lot-et-Garonne'            ,	     'Marmande',	'LG',	'MM');
INSERT INTO @tbl VALUES ('Bouches-du-Rhone'            ,	     'Marseille ',	'BD',	'MS');
INSERT INTO @tbl VALUES ('Cantal'            ,	     'Mauriac',	'CL',	'MR');
INSERT INTO @tbl VALUES ('Mayenne'            ,	     'Mayenne',	'MY',	'MY');
INSERT INTO @tbl VALUES ('Seine-et-Marne'            ,	     'Meaux',	'SE',	'MX');
INSERT INTO @tbl VALUES ('Seine-et-Marne'            ,	     'Melun ',	'SE',	'ML');
INSERT INTO @tbl VALUES ('Lozere'            ,	     'Mende ',	'LZ',	'MD');
INSERT INTO @tbl VALUES ('Moselle'            ,	     'Metz-Campagne',	'MO',	'MC');
INSERT INTO @tbl VALUES ('Moselle'            ,	     'Metz-Ville ',	'MO',	'MV');
INSERT INTO @tbl VALUES ('Aveyron'            ,	     'Millau',	'AV',	'ML');
INSERT INTO @tbl VALUES ('Gers'            ,	     'Mirande',	'GE',	'MD');
INSERT INTO @tbl VALUES ('Bas-Rhin'            ,	     'Molsheim',	'BR',	'MM');
INSERT INTO @tbl VALUES ('Loiret'            ,	     'Montargis',	'LT',	'MA');
INSERT INTO @tbl VALUES ('Tarn-et-Garonne'            ,	     'Montauban ',	'TG',	'MA');
INSERT INTO @tbl VALUES ('Cote-d''Or'            ,	     'Montbard',	'CO',	'MB');
INSERT INTO @tbl VALUES ('Doubs'            ,	     'Montbeliard',	'DB',	'MB');
INSERT INTO @tbl VALUES ('Loire'            ,	     'Montbrison',	'LR',	'MB');
INSERT INTO @tbl VALUES ('Landes'            ,	     'Mont-de-Marsan ',	'LD',	'MT');
INSERT INTO @tbl VALUES ('Somme'            ,	     'Montdidier',	'SO',	'MD');
INSERT INTO @tbl VALUES ('Allier'            ,	     'Montlucon',	'AL',	'MC');
INSERT INTO @tbl VALUES ('Vienne'            ,	     'Montmorillon',	'VN',	'MM');
INSERT INTO @tbl VALUES ('Herault'            ,	     'Montpellier ',	'HE',	'MP');
INSERT INTO @tbl VALUES ('Pas-de-Calais'            ,	     'Montreuil',	'PC',	'MR');
INSERT INTO @tbl VALUES ('Finistere'            ,	     'Morlaix',	'FI',	'ML');
INSERT INTO @tbl VALUES ('Orne'            ,	     'Mortagne-au-Perche',	'OR',	'MP');
INSERT INTO @tbl VALUES ('Allier'            ,	     'Moulins ',	'AL',	'MS');
INSERT INTO @tbl VALUES ('Haut-Rhin'            ,	     'Mulhouse',	'HR',	'MH');
INSERT INTO @tbl VALUES ('Haute-Garonne'            ,	     'Muret',	'HG',	'MR');
INSERT INTO @tbl VALUES ('Meurthe-et-Moselle'            ,	     'Nancy ',	'MM',	'NN');
INSERT INTO @tbl VALUES ('Hauts-de-Seine'            ,	     'Nanterre ',	'HD',	'NT');
INSERT INTO @tbl VALUES ('Loire-Atlantique'            ,	     'Nantes ',	'LA',	'NT');
INSERT INTO @tbl VALUES ('Ain'            ,	     'Nantua',	'AI',	'NT');
INSERT INTO @tbl VALUES ('Aude'            ,	     'Narbonne',	'AD',	'NB');
INSERT INTO @tbl VALUES ('Lot-et-Garonne'            ,	     'Nerac',	'LG',	'NR');
INSERT INTO @tbl VALUES ('Vosges'            ,	     'Neufchateau',	'VG',	'NC');
INSERT INTO @tbl VALUES ('Nievre'            ,	     'Nevers ',	'NI',	'NV');
INSERT INTO @tbl VALUES ('Alpes-Maritimes'            ,	     'Nice ',	'AM',	'NC');
INSERT INTO @tbl VALUES ('Gard'            ,	     'Nimes ',	'GA',	'NM');
INSERT INTO @tbl VALUES ('Deux-Sevres'            ,	     'Niort ',	'DS',	'NR');
INSERT INTO @tbl VALUES ('Eure-et-Loir'            ,	     'Nogent-le-Rotrou',	'EL',	'NR');
INSERT INTO @tbl VALUES ('Val-de-Marne'            ,	     'Nogent-sur-Marne',	'VM',	'NM');
INSERT INTO @tbl VALUES ('Aube'            ,	     'Nogent-sur-Seine',	'AB',	'NS');
INSERT INTO @tbl VALUES ('Dordogne'            ,	     'Nontron',	'DD',	'NN');
INSERT INTO @tbl VALUES ('Drome'            ,	     'Nyons',	'DM',	'NY');
INSERT INTO @tbl VALUES ('Pyrenees-Atlantiques'            ,	     'Oloron-Sainte-Marie',	'PA',	'OS');
INSERT INTO @tbl VALUES ('Loiret'            ,	     'Orleans ',	'LT',	'OR');
INSERT INTO @tbl VALUES ('Essonne'            ,	     'Palaiseau',	'ES',	'PA');
INSERT INTO @tbl VALUES ('Ariege'            ,	     'Pamiers',	'AG',	'PM');
INSERT INTO @tbl VALUES ('Ville de Paris'            ,	     'Paris ',	'VP',	'PR');
INSERT INTO @tbl VALUES ('Deux-Sevres'            ,	     'Parthenay',	'DS',	'PR');
INSERT INTO @tbl VALUES ('Pyrenees-Atlantiques'            ,	     'Pau ',	'PA',	'PA');
INSERT INTO @tbl VALUES ('Dordogne'            ,	     'Perigueux ',	'DD',	'PG');
INSERT INTO @tbl VALUES ('Somme'            ,	     'Peronne',	'SO',	'PR');
INSERT INTO @tbl VALUES ('Pyrenees-Orientales'            ,	     'Perpignan ',	'PO',	'PP');
INSERT INTO @tbl VALUES ('Loiret'            ,	     'Pithiviers',	'LT',	'PT');
INSERT INTO @tbl VALUES ('Vienne'            ,	     'Poitiers ',	'VN',	'PT');
INSERT INTO @tbl VALUES ('Doubs'            ,	     'Pontarlier',	'DB',	'PA');
INSERT INTO @tbl VALUES ('Morbihan'            ,	     'Pontivy',	'MB',	'PT');
INSERT INTO @tbl VALUES ('Val-d''Oise'            ,	     'Pontoise ',	'VO',	'PS');
INSERT INTO @tbl VALUES ('Pyrenees-Orientales'            ,	     'Prades',	'PO',	'PD');
INSERT INTO @tbl VALUES ('Ardeche'            ,	     'Privas ',	'AH',	'PR');
INSERT INTO @tbl VALUES ('Seine-et-Marne'            ,	     'Provins',	'SE',	'PV');
INSERT INTO @tbl VALUES ('Finistere'            ,	     'Quimper ',	'FI',	'QP');
INSERT INTO @tbl VALUES ('Yvelines'            ,	     'Rambouillet',	'YV',	'RB');
INSERT INTO @tbl VALUES ('Ille-et-Vilaine'            ,	     'Redon',	'IV',	'RD');
INSERT INTO @tbl VALUES ('Marne'            ,	     'Reims',	'MR',	'RS');
INSERT INTO @tbl VALUES ('Ille-et-Vilaine'            ,	     'Rennes ',	'IV',	'RS');
INSERT INTO @tbl VALUES ('Ardennes'            ,	     'Rethel',	'AN',	'RT');
INSERT INTO @tbl VALUES ('Haut-Rhin'            ,	     'Ribeauville',	'HR',	'RB');
INSERT INTO @tbl VALUES ('Puy-de-Dome'            ,	     'Riom',	'PD',	'RM');
INSERT INTO @tbl VALUES ('Loire'            ,	     'Roanne',	'LR',	'RN');
INSERT INTO @tbl VALUES ('Haute-Vienne'            ,	     'Rochechouart',	'HV',	'RC');
INSERT INTO @tbl VALUES ('Charente-Maritime'            ,	     'Rochefort',	'CM',	'RF');
INSERT INTO @tbl VALUES ('Aveyron'            ,	     'Rodez ',	'AV',	'RD');
INSERT INTO @tbl VALUES ('Loir-et-Cher'            ,	     'Romorantin-Lanthenay',	'LC',	'RL');
INSERT INTO @tbl VALUES ('Seine-Maritime'            ,	     'Rouen ',	'SM',	'RN');
INSERT INTO @tbl VALUES ('Cher'            ,	     'Saint-Amand-Montrond',	'CH',	'SA');
INSERT INTO @tbl VALUES ('Cotes-d''Armor'            ,	     'Saint-Brieuc ',	'CA',	'SB');
INSERT INTO @tbl VALUES ('Jura'            ,	     'Saint-Claude',	'JU',	'SC');
INSERT INTO @tbl VALUES ('Seine-Saint-Denis'            ,	     'Saint-Denis',	'SS',	'ST');
INSERT INTO @tbl VALUES ('Vosges'            ,	     'Saint-Die-des-Vosges',	'VG',	'SD');
INSERT INTO @tbl VALUES ('Haute-Marne'            ,	     'Saint-Dizier',	'HM',	'SD');
INSERT INTO @tbl VALUES ('Marne'            ,	     'Sainte-Menehould',	'MR',	'SM');
INSERT INTO @tbl VALUES ('Charente-Maritime'            ,	     'Saintes',	'CM',	'SS');
INSERT INTO @tbl VALUES ('Loire'            ,	     'Saint-Etienne ',	'LR',	'SE');
INSERT INTO @tbl VALUES ('Cantal'            ,	     'Saint-Flour',	'CL',	'SF');
INSERT INTO @tbl VALUES ('Haute-Garonne'            ,	     'Saint-Gaudens',	'HG',	'SG');
INSERT INTO @tbl VALUES ('Yvelines'            ,	     'Saint-Germain-en-Laye',	'YV',	'SG');
INSERT INTO @tbl VALUES ('Ariege'            ,	     'Saint-Girons',	'AG',	'SR');
INSERT INTO @tbl VALUES ('Charente-Maritime'            ,	     'Saint-Jean-d''Angely',	'CM',	'SJ');
INSERT INTO @tbl VALUES ('Savoie'            ,	     'Saint-Jean-de-Maurienne',	'SV',	'SJ');
INSERT INTO @tbl VALUES ('Haute-Savoie'            ,	     'Saint-Julien-en-Genevois',	'HS',	'SG');
INSERT INTO @tbl VALUES ('Manche'            ,	     'Saint-Lo ',	'MH',	'SL');
INSERT INTO @tbl VALUES ('Ille-et-Vilaine'            ,	     'Saint-Malo',	'IV',	'SM');
INSERT INTO @tbl VALUES ('Loire-Atlantique'            ,	     'Saint-Nazaire',	'LA',	'SN');
INSERT INTO @tbl VALUES ('Pas-de-Calais'            ,	     'Saint-Omer',	'PC',	'SO');
INSERT INTO @tbl VALUES ('Aisne'            ,	     'Saint-Quentin',	'AS',	'SQ');
INSERT INTO @tbl VALUES ('Val-d''Oise'            ,	     'Sarcelles',	'VO',	'MM');
INSERT INTO @tbl VALUES ('Dordogne'            ,	     'Sarlat-la-Caneda',	'DD',	'SC');
INSERT INTO @tbl VALUES ('Moselle'            ,	     'Sarrebourg',	'MO',	'SB');
INSERT INTO @tbl VALUES ('Moselle'            ,	     'Sarreguemines',	'MO',	'SG');
INSERT INTO @tbl VALUES ('Corse-du-Sud'            ,	     'Sartene',	'CS',	'ST');
INSERT INTO @tbl VALUES ('Maine-et-Loire'            ,	     'Saumur',	'ML',	'SM');
INSERT INTO @tbl VALUES ('Bas-Rhin'            ,	     'Saverne',	'BR',	'SN');
INSERT INTO @tbl VALUES ('Ardennes'            ,	     'Sedan',	'AN',	'SE');
INSERT INTO @tbl VALUES ('Maine-et-Loire'            ,	     'Segre',	'ML',	'SG');
INSERT INTO @tbl VALUES ('Bas-Rhin'            ,	     'Selestat-Erstein',	'BR',	'SE');
INSERT INTO @tbl VALUES ('Oise'            ,	     'Senlis',	'OI',	'SL');
INSERT INTO @tbl VALUES ('Yonne'            ,	     'Sens',	'YO',	'SS');
INSERT INTO @tbl VALUES ('Aisne'            ,	     'Soissons',	'AS',	'SS');
INSERT INTO @tbl VALUES ('Bas-Rhin'            ,	     'Strasbourg-Campagne',	'BR',	'SC');
INSERT INTO @tbl VALUES ('Bas-Rhin'            ,	     'Strasbourg-Ville ',	'BR',	'SV');
INSERT INTO @tbl VALUES ('Hautes-Pyrenees'            ,	     'Tarbes ',	'HP',	'TB');
INSERT INTO @tbl VALUES ('Haut-Rhin'            ,	     'Thann',	'HR',	'TH');
INSERT INTO @tbl VALUES ('Puy-de-Dome'            ,	     'Thiers',	'PD',	'TR');
INSERT INTO @tbl VALUES ('Moselle'            ,	     'Thionville-Est',	'MO',	'TE');
INSERT INTO @tbl VALUES ('Moselle'            ,	     'Thionville-Ouest',	'MO',	'TO');
INSERT INTO @tbl VALUES ('Haute-Savoie'            ,	     'Thonon-les-Bains',	'HS',	'TB');
INSERT INTO @tbl VALUES ('Seine-et-Marne'            ,	     'Torcy',	'SE',	'TC');
INSERT INTO @tbl VALUES ('Meurthe-et-Moselle'            ,	     'Toul',	'MM',	'TL');
INSERT INTO @tbl VALUES ('Var'            ,	     'Toulon ',	'VR',	'TL');
INSERT INTO @tbl VALUES ('Haute-Garonne'            ,	     'Toulouse ',	'HG',	'TL');
INSERT INTO @tbl VALUES ('Ardeche'            ,	     'Tournon-sur-Rhone',	'AH',	'TR');
INSERT INTO @tbl VALUES ('Indre-et-Loire'            ,	     'Tours ',	'IL',	'TR');
INSERT INTO @tbl VALUES ('Aube'            ,	     'Troyes ',	'AB',	'TR');
INSERT INTO @tbl VALUES ('Correze'            ,	     'Tulle ',	'CZ',	'TL');
INSERT INTO @tbl VALUES ('Correze'            ,	     'Ussel',	'CZ',	'US');
INSERT INTO @tbl VALUES ('Drome'            ,	     'Valence ',	'DM',	'VL');
INSERT INTO @tbl VALUES ('Nord'            ,	     'Valenciennes',	'NO',	'VL');
INSERT INTO @tbl VALUES ('Morbihan'            ,	     'Vannes ',	'MB',	'VN');
INSERT INTO @tbl VALUES ('Loir-et-Cher'            ,	     'Vendome',	'LC',	'VD');
INSERT INTO @tbl VALUES ('Meuse'            ,	     'Verdun',	'MS',	'VD');
INSERT INTO @tbl VALUES ('Yvelines'            ,	     'Versailles ',	'YV',	'VS');
INSERT INTO @tbl VALUES ('Aisne'            ,	     'Vervins',	'AS',	'VV');
INSERT INTO @tbl VALUES ('Haute-Saone'            ,	     'Vesoul ',	'HN',	'VS');
INSERT INTO @tbl VALUES ('Allier'            ,	     'Vichy',	'AL',	'VC');
INSERT INTO @tbl VALUES ('Isere'            ,	     'Vienne',	'IS',	'VN');
INSERT INTO @tbl VALUES ('Cher'            ,	     'Vierzon',	'CH',	'VZ');
INSERT INTO @tbl VALUES ('Aveyron'            ,	     'Villefranche-de-Rouergue',	'AV',	'VR');
INSERT INTO @tbl VALUES ('Rhone'            ,	     'Villefranche-sur-Saone',	'RH',	'VS');
INSERT INTO @tbl VALUES ('Lot-et-Garonne'            ,	     'Villeneuve-sur-Lot',	'LG',	'VL');
INSERT INTO @tbl VALUES ('Calvados'            ,	     'Vire',	'CV',	'VR');
INSERT INTO @tbl VALUES ('Marne'            ,	     'Vitry-le-Francois',	'MR',	'VF');
INSERT INTO @tbl VALUES ('Ardennes'            ,	     'Vouziers',	'AN',	'VZ');
INSERT INTO @tbl VALUES ('Bas-Rhin'            ,	     'Wissembourg',	'BR',	'WB');
INSERT INTO @tbl VALUES ('Haute-Loire'            ,	     'Yssingeaux',	'HL',	'YS');

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

