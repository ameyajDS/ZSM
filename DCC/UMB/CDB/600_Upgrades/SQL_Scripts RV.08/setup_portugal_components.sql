
/* ==================================================================================
    	Source File		:	setup_portugal_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Portugal are set-up
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
WHERE	country_nm	=	'Portugal';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Portugal not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'District',
		level_2_address_component	=	'Municipality',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Santarem'            ,	     'Abrantes',	'SA',	'AB');
INSERT INTO @tbl VALUES ('Aveiro'            ,	     'Agueda',	'AV',	'AG');
INSERT INTO @tbl VALUES ('Guarda'            ,	     'Aguiar da Beira',	'GU',	'AB');
INSERT INTO @tbl VALUES ('Evora'            ,	     'Alandroal',	'EV',	'AL');
INSERT INTO @tbl VALUES ('Aveiro'            ,	     'Albergaria-a-Velha',	'AV',	'AL');
INSERT INTO @tbl VALUES ('Faro'            ,	     'Albufeira',	'FA',	'AB');
INSERT INTO @tbl VALUES ('Setubal'            ,	     'Alcacer do Sal',	'SE',	'AS');
INSERT INTO @tbl VALUES ('Santarem'            ,	     'Alcanena',	'SA',	'AC');
INSERT INTO @tbl VALUES ('Leiria'            ,	     'Alcobaca',	'LE',	'AC');
INSERT INTO @tbl VALUES ('Setubal'            ,	     'Alcochete',	'SE',	'AC');
INSERT INTO @tbl VALUES ('Faro'            ,	     'Alcoutim',	'FA',	'AC');
INSERT INTO @tbl VALUES ('Lisboa'            ,	     'Alenquer',	'LI',	'AL');
INSERT INTO @tbl VALUES ('Braganca'            ,	     'Alfandega da Fe',	'BA',	'AF');
INSERT INTO @tbl VALUES ('Vila Real'            ,	     'Alijo',	'VR',	'AL');
INSERT INTO @tbl VALUES ('Faro'            ,	     'Aljezur',	'FA',	'AJ');
INSERT INTO @tbl VALUES ('Beja'            ,	     'Aljustrel',	'BE',	'AJ');
INSERT INTO @tbl VALUES ('Setubal'            ,	     'Almada',	'SE',	'AM');
INSERT INTO @tbl VALUES ('Guarda'            ,	     'Almeida',	'GU',	'AL');
INSERT INTO @tbl VALUES ('Santarem'            ,	     'Almeirim',	'SA',	'AM');
INSERT INTO @tbl VALUES ('Beja'            ,	     'Almodovar',	'BE',	'AM');
INSERT INTO @tbl VALUES ('Santarem'            ,	     'Alpiarca',	'SA',	'AP');
INSERT INTO @tbl VALUES ('Portalegre'            ,	     'Alter do Chao',	'PA',	'AC');
INSERT INTO @tbl VALUES ('Leiria'            ,	     'Alvaiazere',	'LE',	'AV');
INSERT INTO @tbl VALUES ('Beja'            ,	     'Alvito',	'BE',	'AV');
INSERT INTO @tbl VALUES ('Lisboa'            ,	     'Amadora',	'LI',	'AM');
INSERT INTO @tbl VALUES ('Porto'            ,	     'Amarante',	'PO',	'AM');
INSERT INTO @tbl VALUES ('Braga'            ,	     'Amares',	'BR',	'AM');
INSERT INTO @tbl VALUES ('Aveiro'            ,	     'Anadia',	'AV',	'AN');
INSERT INTO @tbl VALUES ('Azores'            ,	     'Angra do Heroismo',	'AC',	'AH');
INSERT INTO @tbl VALUES ('Leiria'            ,	     'Ansiao',	'LE',	'AN');
INSERT INTO @tbl VALUES ('Viana do Castelo'            ,	     'Arcos de Valdevez',	'VC',	'AV');
INSERT INTO @tbl VALUES ('Coimbra'            ,	     'Arganil',	'CO',	'AR');
INSERT INTO @tbl VALUES ('Viseu'            ,	     'Armamar',	'VI',	'AR');
INSERT INTO @tbl VALUES ('Aveiro'            ,	     'Arouca',	'AV',	'AR');
INSERT INTO @tbl VALUES ('Evora'            ,	     'Arraiolos',	'EV',	'AR');
INSERT INTO @tbl VALUES ('Portalegre'            ,	     'Arronches',	'PA',	'AR');
INSERT INTO @tbl VALUES ('Lisboa'            ,	     'Arruda dos Vinhos',	'LI',	'AV');
INSERT INTO @tbl VALUES ('Aveiro'            ,	     'Aveiro',	'AV',	'AV');
INSERT INTO @tbl VALUES ('Portalegre'            ,	     'Avis',	'PA',	'AV');
INSERT INTO @tbl VALUES ('Lisboa'            ,	     'Azambuja',	'LI',	'AZ');
INSERT INTO @tbl VALUES ('Porto'            ,	     'Baiao',	'PO',	'BA');
INSERT INTO @tbl VALUES ('Braga'            ,	     'Barcelos',	'BR',	'BA');
INSERT INTO @tbl VALUES ('Beja'            ,	     'Barrancos',	'BE',	'BA');
INSERT INTO @tbl VALUES ('Setubal'            ,	     'Barreiro',	'SE',	'BA');
INSERT INTO @tbl VALUES ('Leiria'            ,	     'Batalha',	'LE',	'BA');
INSERT INTO @tbl VALUES ('Beja'            ,	     'Beja',	'BE',	'BE');
INSERT INTO @tbl VALUES ('Castelo Branco'            ,	     'Belmonte',	'CB',	'BE');
INSERT INTO @tbl VALUES ('Santarem'            ,	     'Benavente',	'SA',	'BE');
INSERT INTO @tbl VALUES ('Leiria'            ,	     'Bombarral',	'LE',	'BO');
INSERT INTO @tbl VALUES ('Evora'            ,	     'Borba',	'EV',	'BO');
INSERT INTO @tbl VALUES ('Vila Real'            ,	     'Boticas',	'VR',	'BO');
INSERT INTO @tbl VALUES ('Braga'            ,	     'Braga',	'BR',	'BR');
INSERT INTO @tbl VALUES ('Braganca'            ,	     'Braganca',	'BA',	'BR');
INSERT INTO @tbl VALUES ('Braga'            ,	     'Cabeceiras de Basto',	'BR',	'CB');
INSERT INTO @tbl VALUES ('Lisboa'            ,	     'Cadaval',	'LI',	'CD');
INSERT INTO @tbl VALUES ('Leiria'            ,	     'Caldas da Rainha',	'LE',	'CR');
INSERT INTO @tbl VALUES ('Azores'            ,	     'Calheta',	'AC',	'CA');
INSERT INTO @tbl VALUES ('Madeira'            ,	     'Calheta',	'MA',	'CT');
INSERT INTO @tbl VALUES ('Madeira'            ,	     'Camara de Lobos',	'MA',	'CL');
INSERT INTO @tbl VALUES ('Viana do Castelo'            ,	     'Caminha',	'VC',	'CA');
INSERT INTO @tbl VALUES ('Portalegre'            ,	     'Campo Maior',	'PA',	'CM');
INSERT INTO @tbl VALUES ('Coimbra'            ,	     'Cantanhede',	'CO',	'CA');
INSERT INTO @tbl VALUES ('Braganca'            ,	     'Carrazeda de Ansiaes',	'BA',	'CA');
INSERT INTO @tbl VALUES ('Viseu'            ,	     'Carregal do Sal',	'VI',	'CS');
INSERT INTO @tbl VALUES ('Santarem'            ,	     'Cartaxo',	'SA',	'CA');
INSERT INTO @tbl VALUES ('Lisboa'            ,	     'Cascais',	'LI',	'CS');
INSERT INTO @tbl VALUES ('Leiria'            ,	     'Castanheira de Pera',	'LE',	'CP');
INSERT INTO @tbl VALUES ('Castelo Branco'            ,	     'Castelo Branco',	'CB',	'CB');
INSERT INTO @tbl VALUES ('Aveiro'            ,	     'Castelo de Paiva',	'AV',	'CP');
INSERT INTO @tbl VALUES ('Portalegre'            ,	     'Castelo de Vide',	'PA',	'CV');
INSERT INTO @tbl VALUES ('Viseu'            ,	     'Castro Daire',	'VI',	'CD');
INSERT INTO @tbl VALUES ('Faro'            ,	     'Castro Marim',	'FA',	'CM');
INSERT INTO @tbl VALUES ('Beja'            ,	     'Castro Verde',	'BE',	'CV');
INSERT INTO @tbl VALUES ('Guarda'            ,	     'Celorico da Beira',	'GU',	'CB');
INSERT INTO @tbl VALUES ('Braga'            ,	     'Celorico de Basto',	'BR',	'CL');
INSERT INTO @tbl VALUES ('Santarem'            ,	     'Chamusca',	'SA',	'CH');
INSERT INTO @tbl VALUES ('Vila Real'            ,	     'Chaves',	'VR',	'CH');
INSERT INTO @tbl VALUES ('Viseu'            ,	     'Cinfaes',	'VI',	'CI');
INSERT INTO @tbl VALUES ('Coimbra'            ,	     'Coimbra',	'CO',	'CO');
INSERT INTO @tbl VALUES ('Coimbra'            ,	     'Condeixa-a-Nova',	'CO',	'CN');
INSERT INTO @tbl VALUES ('Santarem'            ,	     'Constancia',	'SA',	'CN');
INSERT INTO @tbl VALUES ('Santarem'            ,	     'Coruche',	'SA',	'CR');
INSERT INTO @tbl VALUES ('Azores'            ,	     'Corvo',	'AC',	'CO');
INSERT INTO @tbl VALUES ('Castelo Branco'            ,	     'Covilha',	'CB',	'CO');
INSERT INTO @tbl VALUES ('Portalegre'            ,	     'Crato',	'PA',	'CR');
INSERT INTO @tbl VALUES ('Beja'            ,	     'Cuba',	'BE',	'CU');
INSERT INTO @tbl VALUES ('Portalegre'            ,	     'Elvas',	'PA',	'EL');
INSERT INTO @tbl VALUES ('Santarem'            ,	     'Entroncamento',	'SA',	'EN');
INSERT INTO @tbl VALUES ('Aveiro'            ,	     'Espinho',	'AV',	'EN');
INSERT INTO @tbl VALUES ('Braga'            ,	     'Esposende',	'BR',	'ES');
INSERT INTO @tbl VALUES ('Aveiro'            ,	     'Estarreja',	'AV',	'ER');
INSERT INTO @tbl VALUES ('Evora'            ,	     'Estremoz',	'EV',	'ES');
INSERT INTO @tbl VALUES ('Evora'            ,	     'Evora',	'EV',	'EV');
INSERT INTO @tbl VALUES ('Braga'            ,	     'Fafe',	'BR',	'FA');
INSERT INTO @tbl VALUES ('Faro'            ,	     'Faro',	'FA',	'FA');
INSERT INTO @tbl VALUES ('Porto'            ,	     'Felgueiras',	'PO',	'FE');
INSERT INTO @tbl VALUES ('Beja'            ,	     'Ferreira do Alentejo',	'BE',	'FA');
INSERT INTO @tbl VALUES ('Santarem'            ,	     'Ferreira do Zezere',	'SA',	'FZ');
INSERT INTO @tbl VALUES ('Coimbra'            ,	     'Figueira da Foz',	'CO',	'FF');
INSERT INTO @tbl VALUES ('Guarda'            ,	     'Figueira de Castelo Rodrigo',	'GU',	'FC');
INSERT INTO @tbl VALUES ('Leiria'            ,	     'Figueiro dos Vinhos',	'LE',	'FV');
INSERT INTO @tbl VALUES ('Guarda'            ,	     'Fornos de Algodres',	'GU',	'FA');
INSERT INTO @tbl VALUES ('Braganca'            ,	     'Freixo de Espada a Cinta',	'BA',	'FE');
INSERT INTO @tbl VALUES ('Portalegre'            ,	     'Fronteira',	'PA',	'FR');
INSERT INTO @tbl VALUES ('Madeira'            ,	     'Funchal',	'MA',	'FU');
INSERT INTO @tbl VALUES ('Castelo Branco'            ,	     'Fundao',	'CB',	'FU');
INSERT INTO @tbl VALUES ('Portalegre'            ,	     'Gaviao',	'PA',	'GA');
INSERT INTO @tbl VALUES ('Coimbra'            ,	     'Gois',	'CO',	'GO');
INSERT INTO @tbl VALUES ('Santarem'            ,	     'Golega',	'SA',	'GO');
INSERT INTO @tbl VALUES ('Porto'            ,	     'Gondomar',	'PO',	'GO');
INSERT INTO @tbl VALUES ('Guarda'            ,	     'Gouveia',	'GU',	'GO');
INSERT INTO @tbl VALUES ('Setubal'            ,	     'Grandola',	'SE',	'GR');
INSERT INTO @tbl VALUES ('Guarda'            ,	     'Guarda',	'GU',	'GU');
INSERT INTO @tbl VALUES ('Braga'            ,	     'Guimaraes',	'BR',	'GU');
INSERT INTO @tbl VALUES ('Azores'            ,	     'Horta',	'AC',	'HO');
INSERT INTO @tbl VALUES ('Castelo Branco'            ,	     'Idanha-a-Nova',	'CB',	'IN');
INSERT INTO @tbl VALUES ('Aveiro'            ,	     'Ilhavo',	'AV',	'IL');
INSERT INTO @tbl VALUES ('Faro'            ,	     'Lagoa',	'FA',	'LA');
INSERT INTO @tbl VALUES ('Azores'            ,	     'Lagoa',	'AC',	'LG');
INSERT INTO @tbl VALUES ('Faro'            ,	     'Lagos',	'FA',	'LS');
INSERT INTO @tbl VALUES ('Azores'            ,	     'Lajes das Flores',	'AC',	'LF');
INSERT INTO @tbl VALUES ('Azores'            ,	     'Lajes do Pico',	'AC',	'LP');
INSERT INTO @tbl VALUES ('Viseu'            ,	     'Lamego',	'VI',	'LA');
INSERT INTO @tbl VALUES ('Leiria'            ,	     'Leiria',	'LE',	'LE');
INSERT INTO @tbl VALUES ('Lisboa'            ,	     'Lisboa',	'LI',	'LI');
INSERT INTO @tbl VALUES ('Faro'            ,	     'Loule',	'FA',	'LO');
INSERT INTO @tbl VALUES ('Lisboa'            ,	     'Loures',	'LI',	'LS');
INSERT INTO @tbl VALUES ('Lisboa'            ,	     'Lourinha',	'LI',	'LN');
INSERT INTO @tbl VALUES ('Coimbra'            ,	     'Lousa',	'CO',	'LO');
INSERT INTO @tbl VALUES ('Porto'            ,	     'Lousada',	'PO',	'LO');
INSERT INTO @tbl VALUES ('Santarem'            ,	     'Macao',	'SA',	'MA');
INSERT INTO @tbl VALUES ('Braganca'            ,	     'Macedo de Cavaleiros',	'BA',	'MC');
INSERT INTO @tbl VALUES ('Madeira'            ,	     'Machico',	'MA',	'MA');
INSERT INTO @tbl VALUES ('Azores'            ,	     'Madalena',	'AC',	'MA');
INSERT INTO @tbl VALUES ('Lisboa'            ,	     'Mafra',	'LI',	'MA');
INSERT INTO @tbl VALUES ('Porto'            ,	     'Maia',	'PO',	'MI');
INSERT INTO @tbl VALUES ('Viseu'            ,	     'Mangualde',	'VI',	'MA');
INSERT INTO @tbl VALUES ('Guarda'            ,	     'Manteigas',	'GU',	'MA');
INSERT INTO @tbl VALUES ('Porto'            ,	     'Marco de Canaveses',	'PO',	'MC');
INSERT INTO @tbl VALUES ('Leiria'            ,	     'Marinha Grande',	'LE',	'MG');
INSERT INTO @tbl VALUES ('Portalegre'            ,	     'Marvao',	'PA',	'MA');
INSERT INTO @tbl VALUES ('Porto'            ,	     'Matosinhos',	'PO',	'MT');
INSERT INTO @tbl VALUES ('Aveiro'            ,	     'Mealhada',	'AV',	'ME');
INSERT INTO @tbl VALUES ('Guarda'            ,	     'Meda',	'GU',	'ME');
INSERT INTO @tbl VALUES ('Viana do Castelo'            ,	     'Melgaco',	'VC',	'ME');
INSERT INTO @tbl VALUES ('Beja'            ,	     'Mertola',	'BE',	'ME');
INSERT INTO @tbl VALUES ('Vila Real'            ,	     'Mesao Frio',	'VR',	'MF');
INSERT INTO @tbl VALUES ('Coimbra'            ,	     'Mira',	'CO',	'MI');
INSERT INTO @tbl VALUES ('Coimbra'            ,	     'Miranda do Corvo',	'CO',	'MC');
INSERT INTO @tbl VALUES ('Braganca'            ,	     'Miranda do Douro',	'BA',	'MD');
INSERT INTO @tbl VALUES ('Braganca'            ,	     'Mirandela',	'BA',	'MI');
INSERT INTO @tbl VALUES ('Braganca'            ,	     'Mogadouro',	'BA',	'MO');
INSERT INTO @tbl VALUES ('Viseu'            ,	     'Moimenta da Beira',	'VI',	'MB');
INSERT INTO @tbl VALUES ('Setubal'            ,	     'Moita',	'SE',	'MT');
INSERT INTO @tbl VALUES ('Viana do Castelo'            ,	     'Moncao',	'VC',	'MO');
INSERT INTO @tbl VALUES ('Faro'            ,	     'Monchique',	'FA',	'MO');
INSERT INTO @tbl VALUES ('Vila Real'            ,	     'Mondim de Basto',	'VR',	'MB');
INSERT INTO @tbl VALUES ('Portalegre'            ,	     'Monforte',	'PA',	'MO');
INSERT INTO @tbl VALUES ('Vila Real'            ,	     'Montalegre',	'VR',	'MT');
INSERT INTO @tbl VALUES ('Evora'            ,	     'Montemor-o-Novo',	'EV',	'MN');
INSERT INTO @tbl VALUES ('Coimbra'            ,	     'Montemor-o-Velho',	'CO',	'MV');
INSERT INTO @tbl VALUES ('Setubal'            ,	     'Montijo',	'SE',	'MN');
INSERT INTO @tbl VALUES ('Evora'            ,	     'Mora',	'EV',	'MR');
INSERT INTO @tbl VALUES ('Viseu'            ,	     'Mortagua',	'VI',	'MR');
INSERT INTO @tbl VALUES ('Beja'            ,	     'Moura',	'BE',	'MO');
INSERT INTO @tbl VALUES ('Evora'            ,	     'Mourao',	'EV',	'MO');
INSERT INTO @tbl VALUES ('Vila Real'            ,	     'Murca',	'VR',	'MU');
INSERT INTO @tbl VALUES ('Aveiro'            ,	     'Murtosa',	'AV',	'MU');
INSERT INTO @tbl VALUES ('Leiria'            ,	     'Nazare',	'LE',	'NA');
INSERT INTO @tbl VALUES ('Viseu'            ,	     'Nelas',	'VI',	'NE');
INSERT INTO @tbl VALUES ('Portalegre'            ,	     'Nisa',	'PA',	'NI');
INSERT INTO @tbl VALUES ('Azores'            ,	     'Nordeste',	'AC',	'NO');
INSERT INTO @tbl VALUES ('Leiria'            ,	     'Obidos',	'LE',	'OB');
INSERT INTO @tbl VALUES ('Beja'            ,	     'Odemira',	'BE',	'OD');
INSERT INTO @tbl VALUES ('Lisboa'            ,	     'Odivelas',	'LI',	'OD');
INSERT INTO @tbl VALUES ('Lisboa'            ,	     'Oeiras',	'LI',	'OE');
INSERT INTO @tbl VALUES ('Castelo Branco'            ,	     'Oleiros',	'CB',	'OL');
INSERT INTO @tbl VALUES ('Faro'            ,	     'Olhao',	'FA',	'OL');
INSERT INTO @tbl VALUES ('Aveiro'            ,	     'Oliveira de Azemeis',	'AV',	'OA');
INSERT INTO @tbl VALUES ('Viseu'            ,	     'Oliveira de Frades',	'VI',	'OF');
INSERT INTO @tbl VALUES ('Aveiro'            ,	     'Oliveira do Bairro',	'AV',	'OB');
INSERT INTO @tbl VALUES ('Coimbra'            ,	     'Oliveira do Hospital',	'CO',	'OH');
INSERT INTO @tbl VALUES ('Santarem'            ,	     'Ourem',	'SA',	'OU');
INSERT INTO @tbl VALUES ('Beja'            ,	     'Ourique',	'BE',	'OU');
INSERT INTO @tbl VALUES ('Aveiro'            ,	     'Ovar',	'AV',	'OV');
INSERT INTO @tbl VALUES ('Porto'            ,	     'Pacos de Ferreira',	'PO',	'PF');
INSERT INTO @tbl VALUES ('Setubal'            ,	     'Palmela',	'SE',	'PA');
INSERT INTO @tbl VALUES ('Coimbra'            ,	     'Pampilhosa da Serra',	'CO',	'PS');
INSERT INTO @tbl VALUES ('Porto'            ,	     'Paredes',	'PO',	'PA');
INSERT INTO @tbl VALUES ('Viana do Castelo'            ,	     'Paredes de Coura',	'VC',	'PC');
INSERT INTO @tbl VALUES ('Leiria'            ,	     'Pedrogao Grande',	'LE',	'PG');
INSERT INTO @tbl VALUES ('Coimbra'            ,	     'Penacova',	'CO',	'PC');
INSERT INTO @tbl VALUES ('Porto'            ,	     'Penafiel',	'PO',	'PE');
INSERT INTO @tbl VALUES ('Viseu'            ,	     'Penalva do Castelo',	'VI',	'PC');
INSERT INTO @tbl VALUES ('Castelo Branco'            ,	     'Penamacor',	'CB',	'PE');
INSERT INTO @tbl VALUES ('Viseu'            ,	     'Penedono',	'VI',	'PE');
INSERT INTO @tbl VALUES ('Coimbra'            ,	     'Penela',	'CO',	'PL');
INSERT INTO @tbl VALUES ('Leiria'            ,	     'Peniche',	'LE',	'PN');
INSERT INTO @tbl VALUES ('Vila Real'            ,	     'Peso da Regua',	'VR',	'PR');
INSERT INTO @tbl VALUES ('Guarda'            ,	     'Pinhel',	'GU',	'PI');
INSERT INTO @tbl VALUES ('Leiria'            ,	     'Pombal',	'LE',	'PB');
INSERT INTO @tbl VALUES ('Azores'            ,	     'Ponta Delgada',	'AC',	'PD');
INSERT INTO @tbl VALUES ('Madeira'            ,	     'Ponta do Sol',	'MA',	'PD');
INSERT INTO @tbl VALUES ('Viana do Castelo'            ,	     'Ponte da Barca',	'VC',	'PB');
INSERT INTO @tbl VALUES ('Viana do Castelo'            ,	     'Ponte de Lima',	'VC',	'PL');
INSERT INTO @tbl VALUES ('Portalegre'            ,	     'Ponte de Sor',	'PA',	'PS');
INSERT INTO @tbl VALUES ('Portalegre'            ,	     'Portalegre',	'PA',	'PA');
INSERT INTO @tbl VALUES ('Evora'            ,	     'Portel',	'EV',	'PO');
INSERT INTO @tbl VALUES ('Faro'            ,	     'Portimao',	'FA',	'PO');
INSERT INTO @tbl VALUES ('Porto'            ,	     'Porto',	'PO',	'PO');
INSERT INTO @tbl VALUES ('Leiria'            ,	     'Porto de Mos',	'LE',	'PM');
INSERT INTO @tbl VALUES ('Madeira'            ,	     'Porto Moniz',	'MA',	'PM');
INSERT INTO @tbl VALUES ('Madeira'            ,	     'Porto Santo',	'MA',	'PS');
INSERT INTO @tbl VALUES ('Azores'            ,	     'Povoacao',	'AC',	'PC');
INSERT INTO @tbl VALUES ('Braga'            ,	     'Povoa de Lanhoso',	'BR',	'PL');
INSERT INTO @tbl VALUES ('Porto'            ,	     'Povoa de Varzim',	'PO',	'PV');
INSERT INTO @tbl VALUES ('Azores'            ,	     'Praia da Vitoria',	'AC',	'PV');
INSERT INTO @tbl VALUES ('Castelo Branco'            ,	     'Proenca-a-Nova',	'CB',	'PN');
INSERT INTO @tbl VALUES ('Evora'            ,	     'Redondo',	'EV',	'RD');
INSERT INTO @tbl VALUES ('Evora'            ,	     'Reguengos de Monsaraz',	'EV',	'RM');
INSERT INTO @tbl VALUES ('Viseu'            ,	     'Resende',	'VI',	'RE');
INSERT INTO @tbl VALUES ('Madeira'            ,	     'Ribeira Brava',	'MA',	'RB');
INSERT INTO @tbl VALUES ('Vila Real'            ,	     'Ribeira de Pena',	'VR',	'RP');
INSERT INTO @tbl VALUES ('Azores'            ,	     'Ribeira Grande',	'AC',	'RG');
INSERT INTO @tbl VALUES ('Santarem'            ,	     'Rio Maior',	'SA',	'RM');
INSERT INTO @tbl VALUES ('Vila Real'            ,	     'Sabrosa',	'VR',	'SA');
INSERT INTO @tbl VALUES ('Guarda'            ,	     'Sabugal',	'GU',	'SA');
INSERT INTO @tbl VALUES ('Santarem'            ,	     'Salvaterra de Magos',	'SA',	'SM');
INSERT INTO @tbl VALUES ('Viseu'            ,	     'Santa Comba Dao',	'VI',	'SC');
INSERT INTO @tbl VALUES ('Madeira'            ,	     'Santa Cruz',	'MA',	'SC');
INSERT INTO @tbl VALUES ('Azores'            ,	     'Santa Cruz da Graciosa',	'AC',	'SG');
INSERT INTO @tbl VALUES ('Azores'            ,	     'Santa Cruz das Flores',	'AC',	'SF');
INSERT INTO @tbl VALUES ('Aveiro'            ,	     'Santa Maria da Feira',	'AV',	'SM');
INSERT INTO @tbl VALUES ('Vila Real'            ,	     'Santa Marta de Penaguiao',	'VR',	'SM');
INSERT INTO @tbl VALUES ('Madeira'            ,	     'Santana',	'MA',	'SA');
INSERT INTO @tbl VALUES ('Santarem'            ,	     'Santarem',	'SA',	'SA');
INSERT INTO @tbl VALUES ('Setubal'            ,	     'Santiago do Cacem',	'SE',	'SC');
INSERT INTO @tbl VALUES ('Porto'            ,	     'Santo Tirso',	'PO',	'ST');
INSERT INTO @tbl VALUES ('Faro'            ,	     'Sao Bras de Alportel',	'FA',	'SB');
INSERT INTO @tbl VALUES ('Aveiro'            ,	     'Sao Joao da Madeira',	'AV',	'SJ');
INSERT INTO @tbl VALUES ('Viseu'            ,	     'Sao Joao da Pesqueira',	'VI',	'SJ');
INSERT INTO @tbl VALUES ('Viseu'            ,	     'Sao Pedro do Sul',	'VI',	'SP');
INSERT INTO @tbl VALUES ('Azores'            ,	     'Sao Roque do Pico',	'AC',	'SP');
INSERT INTO @tbl VALUES ('Madeira'            ,	     'Sao Vicente',	'MA',	'SV');
INSERT INTO @tbl VALUES ('Santarem'            ,	     'Sardoal',	'SA',	'SD');
INSERT INTO @tbl VALUES ('Viseu'            ,	     'Satao',	'VI',	'ST');
INSERT INTO @tbl VALUES ('Guarda'            ,	     'Seia',	'GU',	'SE');
INSERT INTO @tbl VALUES ('Setubal'            ,	     'Seixal',	'SE',	'SX');
INSERT INTO @tbl VALUES ('Viseu'            ,	     'Sernancelhe',	'VI',	'SE');
INSERT INTO @tbl VALUES ('Beja'            ,	     'Serpa',	'BE',	'SE');
INSERT INTO @tbl VALUES ('Castelo Branco'            ,	     'Serta',	'CB',	'SE');
INSERT INTO @tbl VALUES ('Setubal'            ,	     'Sesimbra',	'SE',	'SS');
INSERT INTO @tbl VALUES ('Setubal'            ,	     'Setubal',	'SE',	'SE');
INSERT INTO @tbl VALUES ('Aveiro'            ,	     'Sever do Vouga',	'AV',	'SV');
INSERT INTO @tbl VALUES ('Faro'            ,	     'Silves',	'FA',	'SI');
INSERT INTO @tbl VALUES ('Setubal'            ,	     'Sines',	'SE',	'SI');
INSERT INTO @tbl VALUES ('Lisboa'            ,	     'Sintra',	'LI',	'SI');
INSERT INTO @tbl VALUES ('Lisboa'            ,	     'Sobral de Monte Agraco',	'LI',	'SM');
INSERT INTO @tbl VALUES ('Coimbra'            ,	     'Soure',	'CO',	'SO');
INSERT INTO @tbl VALUES ('Portalegre'            ,	     'Sousel',	'PA',	'SO');
INSERT INTO @tbl VALUES ('Coimbra'            ,	     'Tabua',	'CO',	'TA');
INSERT INTO @tbl VALUES ('Viseu'            ,	     'Tabuaco',	'VI',	'TB');
INSERT INTO @tbl VALUES ('Viseu'            ,	     'Tarouca',	'VI',	'TR');
INSERT INTO @tbl VALUES ('Faro'            ,	     'Tavira',	'FA',	'TA');
INSERT INTO @tbl VALUES ('Braga'            ,	     'Terras de Bouro',	'BR',	'TB');
INSERT INTO @tbl VALUES ('Santarem'            ,	     'Tomar',	'SA',	'TM');
INSERT INTO @tbl VALUES ('Viseu'            ,	     'Tondela',	'VI',	'TO');
INSERT INTO @tbl VALUES ('Braganca'            ,	     'Torre de Moncorvo',	'BA',	'TM');
INSERT INTO @tbl VALUES ('Santarem'            ,	     'Torres Novas',	'SA',	'TN');
INSERT INTO @tbl VALUES ('Lisboa'            ,	     'Torres Vedras',	'LI',	'TV');
INSERT INTO @tbl VALUES ('Guarda'            ,	     'Trancoso',	'GU',	'TR');
INSERT INTO @tbl VALUES ('Porto'            ,	     'Trofa',	'PO',	'TR');
INSERT INTO @tbl VALUES ('Aveiro'            ,	     'Vagos',	'AV',	'VG');
INSERT INTO @tbl VALUES ('Aveiro'            ,	     'Vale de Cambra',	'AV',	'VC');
INSERT INTO @tbl VALUES ('Viana do Castelo'            ,	     'Valenca',	'VC',	'VA');
INSERT INTO @tbl VALUES ('Porto'            ,	     'Valongo',	'PO',	'VA');
INSERT INTO @tbl VALUES ('Vila Real'            ,	     'Valpacos',	'VR',	'VA');
INSERT INTO @tbl VALUES ('Azores'            ,	     'Velas',	'AC',	'VE');
INSERT INTO @tbl VALUES ('Evora'            ,	     'Vendas Novas',	'EV',	'VN');
INSERT INTO @tbl VALUES ('Evora'            ,	     'Viana do Alentejo',	'EV',	'VA');
INSERT INTO @tbl VALUES ('Viana do Castelo'            ,	     'Viana do Castelo',	'VC',	'VC');
INSERT INTO @tbl VALUES ('Beja'            ,	     'Vidigueira',	'BE',	'VI');
INSERT INTO @tbl VALUES ('Braga'            ,	     'Vieira do Minho',	'BR',	'VM');
INSERT INTO @tbl VALUES ('Castelo Branco'            ,	     'Vila de Rei',	'CB',	'VR');
INSERT INTO @tbl VALUES ('Faro'            ,	     'Vila do Bispo',	'FA',	'VB');
INSERT INTO @tbl VALUES ('Porto'            ,	     'Vila do Conde',	'PO',	'VC');
INSERT INTO @tbl VALUES ('Azores'            ,	     'Vila do Porto',	'AC',	'VP');
INSERT INTO @tbl VALUES ('Braganca'            ,	     'Vila Flor',	'BA',	'VF');
INSERT INTO @tbl VALUES ('Lisboa'            ,	     'Vila Franca de Xira',	'LI',	'VX');
INSERT INTO @tbl VALUES ('Azores'            ,	     'Vila Franca do Campo',	'AC',	'VC');
INSERT INTO @tbl VALUES ('Santarem'            ,	     'Vila Nova da Barquinha',	'SA',	'VB');
INSERT INTO @tbl VALUES ('Viana do Castelo'            ,	     'Vila Nova de Cerveira',	'VC',	'VN');
INSERT INTO @tbl VALUES ('Braga'            ,	     'Vila Nova de Famalicao',	'BR',	'VF');
INSERT INTO @tbl VALUES ('Guarda'            ,	     'Vila Nova de Foz Coa',	'GU',	'VF');
INSERT INTO @tbl VALUES ('Porto'            ,	     'Vila Nova de Gaia',	'PO',	'VG');
INSERT INTO @tbl VALUES ('Viseu'            ,	     'Vila Nova de Paiva',	'VI',	'VP');
INSERT INTO @tbl VALUES ('Coimbra'            ,	     'Vila Nova de Poiares',	'CO',	'VP');
INSERT INTO @tbl VALUES ('Vila Real'            ,	     'Vila Pouca de Aguiar',	'VR',	'VP');
INSERT INTO @tbl VALUES ('Vila Real'            ,	     'Vila Real',	'VR',	'VR');
INSERT INTO @tbl VALUES ('Faro'            ,	     'Vila Real de Santo Antonio',	'FA',	'VS');
INSERT INTO @tbl VALUES ('Castelo Branco'            ,	     'Vila Velha de Rodao',	'CB',	'VV');
INSERT INTO @tbl VALUES ('Braga'            ,	     'Vila Verde',	'BR',	'VV');
INSERT INTO @tbl VALUES ('Evora'            ,	     'Vila Vicosa',	'EV',	'VV');
INSERT INTO @tbl VALUES ('Braganca'            ,	     'Vimioso',	'BA',	'VM');
INSERT INTO @tbl VALUES ('Braganca'            ,	     'Vinhais',	'BA',	'VN');
INSERT INTO @tbl VALUES ('Viseu'            ,	     'Viseu',	'VI',	'VS');
INSERT INTO @tbl VALUES ('Braga'            ,	     'Vizela',	'BR',	'VZ');
INSERT INTO @tbl VALUES ('Viseu'            ,	     'Vouzela',	'VI',	'VO');

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

