/* ==================================================================================
    Source File		:	setup_brazil_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	Sat Oct 06 17:05 2014
	Module ID		:	CDB
	Last updated	:	Oct 06, 2014
	==================================================================================
																		   Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Brazil are set-up
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
WHERE	country_nm	=	'Brazil';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Brazil not found', 16, 1);
	RETURN;
END

/*	 These statements should NOT be uncommented; and should be used with extreme caution
DELETE	l3
FROM	level_3_address_components	l3
	JOIN	level_2_address_components	l2
		ON	(	l2.level_2_address_component_id	=	l3.level_2_address_component_id
			)
	JOIN	level_1_address_components	l1
		ON	(	l1.level_1_address_component_id	=	l2.level_1_address_component_id
			AND	l1.country_id	=	@country_id
			);

DELETE	l2
FROM	level_2_address_components	l2
	JOIN	level_1_address_components	l1
		ON	(	l1.level_1_address_component_id	=	l2.level_1_address_component_id
			AND	l1.country_id	=	@country_id
			);


DELETE	level_1_address_components
WHERE	country_id	=	@country_id;
*/

-- ======================================================================

DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50) PRIMARY KEY, level_1_cd varchar (5) UNIqUE);

INSERT INTO @tbl VALUES ('Acre',	'AC');
INSERT INTO @tbl VALUES ('Alagoas',	'AL');
INSERT INTO @tbl VALUES ('Amapa',	'AP');
INSERT INTO @tbl VALUES ('Amazonas',	'AM');
INSERT INTO @tbl VALUES ('Bahia',	'BA');
INSERT INTO @tbl VALUES ('Ceara',	'CE');
INSERT INTO @tbl VALUES ('Distrito Federal',	'DF');
INSERT INTO @tbl VALUES ('Espirito Santo',	'ES');
INSERT INTO @tbl VALUES ('Goias',	'GO');
INSERT INTO @tbl VALUES ('Maranhao',	'MA');
INSERT INTO @tbl VALUES ('Mato Grosso',	'MT');
INSERT INTO @tbl VALUES ('Mato Grosso do Sul',	'MS');
INSERT INTO @tbl VALUES ('Minas Gerais',	'MG');
INSERT INTO @tbl VALUES ('Para',	'PA');
INSERT INTO @tbl VALUES ('Paraiba',	'PB');
INSERT INTO @tbl VALUES ('Parana',	'PR');
INSERT INTO @tbl VALUES ('Pernambuco',	'PE');
INSERT INTO @tbl VALUES ('Piaui',	'PI');
INSERT INTO @tbl VALUES ('Rio de Janeiro',	'RJ');
INSERT INTO @tbl VALUES ('Rio Grande do Norte',	'RN');
INSERT INTO @tbl VALUES ('Rio Grande do Sul',	'RS');
INSERT INTO @tbl VALUES ('Rondonia',	'RO');
INSERT INTO @tbl VALUES ('Roraima',	'RR');
INSERT INTO @tbl VALUES ('Santa Catarina',	'SC');
INSERT INTO @tbl VALUES ('Sao Paulo',	'SP');
INSERT INTO @tbl VALUES ('Sergipe',	'SE');
INSERT INTO @tbl VALUES ('Tocantins',	'TO');


INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) 
	SELECT	@country_id, level_1_nm, level_1_cd
	FROM	@tbl;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl2	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl2 VALUES ('Acre',	'Brasileia',	'BR');
INSERT INTO @tbl2 VALUES ('Acre',	'Cruzeiro do Sul',	'CS');
INSERT INTO @tbl2 VALUES ('Acre',	'Rio Branco',	'RB');
INSERT INTO @tbl2 VALUES ('Acre',	'Sena Madureira',	'SM');
INSERT INTO @tbl2 VALUES ('Acre',	'Tarauaca',	'TA');
INSERT INTO @tbl2 VALUES ('Alagoas',	'Alagoana do Sertao do Sao Francisco',	'AS');
INSERT INTO @tbl2 VALUES ('Alagoas',	'Arapiraca',	'AR');
INSERT INTO @tbl2 VALUES ('Alagoas',	'Batalha',	'BA');
INSERT INTO @tbl2 VALUES ('Alagoas',	'Litoral Norte Alagoano',	'LN');
INSERT INTO @tbl2 VALUES ('Alagoas',	'Maceio',	'MC');
INSERT INTO @tbl2 VALUES ('Alagoas',	'Mata Alagoana',	'MA');
INSERT INTO @tbl2 VALUES ('Alagoas',	'Palmeira dos Indios',	'PI');
INSERT INTO @tbl2 VALUES ('Alagoas',	'Penedo',	'PE');
INSERT INTO @tbl2 VALUES ('Alagoas',	'Santana do Ipanema',	'SI');
INSERT INTO @tbl2 VALUES ('Alagoas',	'Sao Miguel dos Campos',	'SM');
INSERT INTO @tbl2 VALUES ('Alagoas',	'Serrana do Sertao Alagoano',	'SS');
INSERT INTO @tbl2 VALUES ('Alagoas',	'Serrana dos Quilombos',	'SQ');
INSERT INTO @tbl2 VALUES ('Alagoas',	'Traipu',	'TR');
INSERT INTO @tbl2 VALUES ('Amapa',	'Amapa',	'AM');
INSERT INTO @tbl2 VALUES ('Amapa',	'Macapa',	'MC');
INSERT INTO @tbl2 VALUES ('Amapa',	'Mazagao',	'MZ');
INSERT INTO @tbl2 VALUES ('Amapa',	'Oiapoque',	'OI');
INSERT INTO @tbl2 VALUES ('Amazonas',	'Alto Solimoes',	'AS');
INSERT INTO @tbl2 VALUES ('Amazonas',	'Boca do Acre',	'BA');
INSERT INTO @tbl2 VALUES ('Amazonas',	'Coari',	'CO');
INSERT INTO @tbl2 VALUES ('Amazonas',	'Itacoatiara',	'IT');
INSERT INTO @tbl2 VALUES ('Amazonas',	'Japura',	'JA');
INSERT INTO @tbl2 VALUES ('Amazonas',	'Jurua',	'JU');
INSERT INTO @tbl2 VALUES ('Amazonas',	'Madeira',	'MD');
INSERT INTO @tbl2 VALUES ('Amazonas',	'Manaus',	'MN');
INSERT INTO @tbl2 VALUES ('Amazonas',	'Parintins',	'PA');
INSERT INTO @tbl2 VALUES ('Amazonas',	'Purus',	'PU');
INSERT INTO @tbl2 VALUES ('Amazonas',	'Rio Negro',	'RN');
INSERT INTO @tbl2 VALUES ('Amazonas',	'Rio Preto da Eva',	'RP');
INSERT INTO @tbl2 VALUES ('Amazonas',	'Tefe',	'TE');
INSERT INTO @tbl2 VALUES ('Bahia',	'Alagoinhas',	'AL');
INSERT INTO @tbl2 VALUES ('Bahia',	'Barra',	'BA');
INSERT INTO @tbl2 VALUES ('Bahia',	'Barreiras',	'BR');
INSERT INTO @tbl2 VALUES ('Bahia',	'Bom Jesus da Lapa',	'BJ');
INSERT INTO @tbl2 VALUES ('Bahia',	'Boquira',	'BO');
INSERT INTO @tbl2 VALUES ('Bahia',	'Brumado',	'BD');
INSERT INTO @tbl2 VALUES ('Bahia',	'Catu',	'CA');
INSERT INTO @tbl2 VALUES ('Bahia',	'Cotegipe',	'CO');
INSERT INTO @tbl2 VALUES ('Bahia',	'Entre Rios',	'ER');
INSERT INTO @tbl2 VALUES ('Bahia',	'Euclides da Cunha',	'EC');
INSERT INTO @tbl2 VALUES ('Bahia',	'Feira de Santana',	'FS');
INSERT INTO @tbl2 VALUES ('Bahia',	'Guanambi',	'GU');
INSERT INTO @tbl2 VALUES ('Bahia',	'Ilheus-Itabuna',	'II');
INSERT INTO @tbl2 VALUES ('Bahia',	'Irece',	'IR');
INSERT INTO @tbl2 VALUES ('Bahia',	'Itaberaba',	'IB');
INSERT INTO @tbl2 VALUES ('Bahia',	'Itapetinga',	'IT');
INSERT INTO @tbl2 VALUES ('Bahia',	'Jacobina',	'JA');
INSERT INTO @tbl2 VALUES ('Bahia',	'Jequie',	'JQ');
INSERT INTO @tbl2 VALUES ('Bahia',	'Jeremoabo',	'JM');
INSERT INTO @tbl2 VALUES ('Bahia',	'Juazeiro',	'JU');
INSERT INTO @tbl2 VALUES ('Bahia',	'Livramento do Brumado',	'LB');
INSERT INTO @tbl2 VALUES ('Bahia',	'Paulo Afonso',	'PA');
INSERT INTO @tbl2 VALUES ('Bahia',	'Porto Seguro',	'PS');
INSERT INTO @tbl2 VALUES ('Bahia',	'Ribeira do Pombal',	'RP');
INSERT INTO @tbl2 VALUES ('Bahia',	'Salvador',	'SV');
INSERT INTO @tbl2 VALUES ('Bahia',	'Santa Maria da Vitoria',	'SM');
INSERT INTO @tbl2 VALUES ('Bahia',	'Santo Antonio de Jesus',	'SJ');
INSERT INTO @tbl2 VALUES ('Bahia',	'Seabra',	'SE');
INSERT INTO @tbl2 VALUES ('Bahia',	'Senhor do Bonfim',	'SB');
INSERT INTO @tbl2 VALUES ('Bahia',	'Serrinha',	'SR');
INSERT INTO @tbl2 VALUES ('Bahia',	'Valenca',	'VA');
INSERT INTO @tbl2 VALUES ('Bahia',	'Vitoria da Conquista',	'VC');
INSERT INTO @tbl2 VALUES ('Ceara',	'Baixo Curu',	'BC');
INSERT INTO @tbl2 VALUES ('Ceara',	'Baixo Jaguaribe',	'BJ');
INSERT INTO @tbl2 VALUES ('Ceara',	'Barro',	'BR');
INSERT INTO @tbl2 VALUES ('Ceara',	'Baturite',	'BT');
INSERT INTO @tbl2 VALUES ('Ceara',	'Brejo Santo',	'BS');
INSERT INTO @tbl2 VALUES ('Ceara',	'Caninde',	'CN');
INSERT INTO @tbl2 VALUES ('Ceara',	'Cariri',	'CI');
INSERT INTO @tbl2 VALUES ('Ceara',	'Caririacu',	'CR');
INSERT INTO @tbl2 VALUES ('Ceara',	'Cascavel',	'CV');
INSERT INTO @tbl2 VALUES ('Ceara',	'Chapada do Araripe',	'CA');
INSERT INTO @tbl2 VALUES ('Ceara',	'Chorozinho',	'CH');
INSERT INTO @tbl2 VALUES ('Ceara',	'Coreau',	'CO');
INSERT INTO @tbl2 VALUES ('Ceara',	'Fortaleza',	'FO');
INSERT INTO @tbl2 VALUES ('Ceara',	'Ibiapaba',	'IB');
INSERT INTO @tbl2 VALUES ('Ceara',	'Iguatu',	'IG');
INSERT INTO @tbl2 VALUES ('Ceara',	'Ipu',	'IP');
INSERT INTO @tbl2 VALUES ('Ceara',	'Itapipoca',	'IT');
INSERT INTO @tbl2 VALUES ('Ceara',	'Lavras da Mangabeira',	'LM');
INSERT INTO @tbl2 VALUES ('Ceara',	'Litoral de Aracati',	'LA');
INSERT INTO @tbl2 VALUES ('Ceara',	'Litoral de Camocim e Acarau',	'LC');
INSERT INTO @tbl2 VALUES ('Ceara',	'Medio Curu',	'MC');
INSERT INTO @tbl2 VALUES ('Ceara',	'Medio Jaguaribe',	'MJ');
INSERT INTO @tbl2 VALUES ('Ceara',	'Meruoca',	'ME');
INSERT INTO @tbl2 VALUES ('Ceara',	'Pacajus',	'PA');
INSERT INTO @tbl2 VALUES ('Ceara',	'Santa Quiteria',	'SQ');
INSERT INTO @tbl2 VALUES ('Ceara',	'Serra do Pereiro',	'SP');
INSERT INTO @tbl2 VALUES ('Ceara',	'Sertao de Crateus',	'SC');
INSERT INTO @tbl2 VALUES ('Ceara',	'Sertao de Inhamuns',	'SI');
INSERT INTO @tbl2 VALUES ('Ceara',	'Sertao de Quixeramobim',	'SX');
INSERT INTO @tbl2 VALUES ('Ceara',	'Sertao de Senador Pompeu',	'SS');
INSERT INTO @tbl2 VALUES ('Ceara',	'Sobral',	'SO');
INSERT INTO @tbl2 VALUES ('Ceara',	'Uruburetama',	'UR');
INSERT INTO @tbl2 VALUES ('Ceara',	'Varzea Alegre',	'VA');
INSERT INTO @tbl2 VALUES ('Distrito Federal',	'Distrito Federal',	'DF');
INSERT INTO @tbl2 VALUES ('Espirito Santo',	'Afonso Claudio',	'AC');
INSERT INTO @tbl2 VALUES ('Espirito Santo',	'Alegre',	'AL');
INSERT INTO @tbl2 VALUES ('Espirito Santo',	'Barra de Sao Francisco',	'BS');
INSERT INTO @tbl2 VALUES ('Espirito Santo',	'Cachoeiro de Itapemirim',	'CI');
INSERT INTO @tbl2 VALUES ('Espirito Santo',	'Colatina',	'CO');
INSERT INTO @tbl2 VALUES ('Espirito Santo',	'Guarapari',	'GU');
INSERT INTO @tbl2 VALUES ('Espirito Santo',	'Itapemirim',	'IT');
INSERT INTO @tbl2 VALUES ('Espirito Santo',	'Linhares',	'LI');
INSERT INTO @tbl2 VALUES ('Espirito Santo',	'Montanha',	'MO');
INSERT INTO @tbl2 VALUES ('Espirito Santo',	'Nova Venecia',	'NV');
INSERT INTO @tbl2 VALUES ('Espirito Santo',	'Santa Teresa',	'ST');
INSERT INTO @tbl2 VALUES ('Espirito Santo',	'Sao Mateus',	'SM');
INSERT INTO @tbl2 VALUES ('Espirito Santo',	'Vitoria',	'VI');
INSERT INTO @tbl2 VALUES ('Goias',	'Anapolis',	'AP');
INSERT INTO @tbl2 VALUES ('Goias',	'Anicuns',	'AN');
INSERT INTO @tbl2 VALUES ('Goias',	'Aragarcas',	'AR');
INSERT INTO @tbl2 VALUES ('Goias',	'Catalao',	'CA');
INSERT INTO @tbl2 VALUES ('Goias',	'Ceres',	'CE');
INSERT INTO @tbl2 VALUES ('Goias',	'Chapada dos Veadeiros',	'CV');
INSERT INTO @tbl2 VALUES ('Goias',	'Entorno de Brasilia',	'EB');
INSERT INTO @tbl2 VALUES ('Goias',	'Goiania',	'GO');
INSERT INTO @tbl2 VALUES ('Goias',	'Ipora',	'IP');
INSERT INTO @tbl2 VALUES ('Goias',	'Meia Ponte',	'MP');
INSERT INTO @tbl2 VALUES ('Goias',	'Pires do Rio',	'PR');
INSERT INTO @tbl2 VALUES ('Goias',	'Porangatu',	'PO');
INSERT INTO @tbl2 VALUES ('Goias',	'Quirinopolis',	'QU');
INSERT INTO @tbl2 VALUES ('Goias',	'Rio Vermelho',	'RV');
INSERT INTO @tbl2 VALUES ('Goias',	'Sao Miguel do Araguaia',	'SM');
INSERT INTO @tbl2 VALUES ('Goias',	'Sudoeste de Goias',	'SG');
INSERT INTO @tbl2 VALUES ('Goias',	'Vale do Rio dos Bois',	'VR');
INSERT INTO @tbl2 VALUES ('Goias',	'Vao do Parana',	'VP');
INSERT INTO @tbl2 VALUES ('Maranhao',	'Alto Mearim e Grajau',	'AM');
INSERT INTO @tbl2 VALUES ('Maranhao',	'Baixada Maranhense',	'BM');
INSERT INTO @tbl2 VALUES ('Maranhao',	'Baixo Parnaiba Maranhense',	'BP');
INSERT INTO @tbl2 VALUES ('Maranhao',	'Caxias',	'CX');
INSERT INTO @tbl2 VALUES ('Maranhao',	'Chapadas das Mangabeiras',	'CM');
INSERT INTO @tbl2 VALUES ('Maranhao',	'Chapadas do Alto Itapecuru',	'CA');
INSERT INTO @tbl2 VALUES ('Maranhao',	'Chapadinha',	'CH');
INSERT INTO @tbl2 VALUES ('Maranhao',	'Codo',	'CO');
INSERT INTO @tbl2 VALUES ('Maranhao',	'Coelho Neto',	'CN');
INSERT INTO @tbl2 VALUES ('Maranhao',	'Gerais de Balsas',	'GB');
INSERT INTO @tbl2 VALUES ('Maranhao',	'Gurupi',	'GU');
INSERT INTO @tbl2 VALUES ('Maranhao',	'Imperatriz',	'IZ');
INSERT INTO @tbl2 VALUES ('Maranhao',	'Itapecuru Mirim',	'IM');
INSERT INTO @tbl2 VALUES ('Maranhao',	'Lencois Maranhenses',	'LM');
INSERT INTO @tbl2 VALUES ('Maranhao',	'Litoral Ocidental Maranhense',	'LO');
INSERT INTO @tbl2 VALUES ('Maranhao',	'Medio Mearim',	'MM');
INSERT INTO @tbl2 VALUES ('Maranhao',	'Pindare',	'PI');
INSERT INTO @tbl2 VALUES ('Maranhao',	'Porto Franco',	'PF');
INSERT INTO @tbl2 VALUES ('Maranhao',	'Presidente Dutra',	'PD');
INSERT INTO @tbl2 VALUES ('Maranhao',	'Rosario',	'RO');
INSERT INTO @tbl2 VALUES ('Maranhao',	'Sao Luis',	'SL');
INSERT INTO @tbl2 VALUES ('Mato Grosso',	'Alta Floresta',	'AF');
INSERT INTO @tbl2 VALUES ('Mato Grosso',	'Alto Araguaia',	'AA');
INSERT INTO @tbl2 VALUES ('Mato Grosso',	'Alto Guapore',	'AG');
INSERT INTO @tbl2 VALUES ('Mato Grosso',	'Alto Pantanal',	'AN');
INSERT INTO @tbl2 VALUES ('Mato Grosso',	'Alto Paraguai',	'AP');
INSERT INTO @tbl2 VALUES ('Mato Grosso',	'Alto Teles Pires',	'AT');
INSERT INTO @tbl2 VALUES ('Mato Grosso',	'Arinos',	'AS');
INSERT INTO @tbl2 VALUES ('Mato Grosso',	'Aripuana',	'AR');
INSERT INTO @tbl2 VALUES ('Mato Grosso',	'Canarana',	'CA');
INSERT INTO @tbl2 VALUES ('Mato Grosso',	'Colider',	'CO');
INSERT INTO @tbl2 VALUES ('Mato Grosso',	'Cuiaba',	'CU');
INSERT INTO @tbl2 VALUES ('Mato Grosso',	'Jauru',	'JA');
INSERT INTO @tbl2 VALUES ('Mato Grosso',	'Medio Araguaia',	'MA');
INSERT INTO @tbl2 VALUES ('Mato Grosso',	'Norte Araguaia',	'NA');
INSERT INTO @tbl2 VALUES ('Mato Grosso',	'Paranatinga',	'PT');
INSERT INTO @tbl2 VALUES ('Mato Grosso',	'Parecis',	'PC');
INSERT INTO @tbl2 VALUES ('Mato Grosso',	'Primavera do Leste',	'PL');
INSERT INTO @tbl2 VALUES ('Mato Grosso',	'Rondonopolis',	'RP');
INSERT INTO @tbl2 VALUES ('Mato Grosso',	'Rosario Oeste',	'RO');
INSERT INTO @tbl2 VALUES ('Mato Grosso',	'Sinop',	'SI');
INSERT INTO @tbl2 VALUES ('Mato Grosso',	'Tangara da Serra',	'TS');
INSERT INTO @tbl2 VALUES ('Mato Grosso',	'Tesouro',	'TE');
INSERT INTO @tbl2 VALUES ('Mato Grosso do Sul',	'Alto Taquari',	'AT');
INSERT INTO @tbl2 VALUES ('Mato Grosso do Sul',	'Aquidauana',	'AQ');
INSERT INTO @tbl2 VALUES ('Mato Grosso do Sul',	'Baixo Pantanal',	'BP');
INSERT INTO @tbl2 VALUES ('Mato Grosso do Sul',	'Bodoquena',	'BO');
INSERT INTO @tbl2 VALUES ('Mato Grosso do Sul',	'Campo Grande',	'CG');
INSERT INTO @tbl2 VALUES ('Mato Grosso do Sul',	'Cassilandia',	'CA');
INSERT INTO @tbl2 VALUES ('Mato Grosso do Sul',	'Dourados',	'DO');
INSERT INTO @tbl2 VALUES ('Mato Grosso do Sul',	'Iguatemi',	'IG');
INSERT INTO @tbl2 VALUES ('Mato Grosso do Sul',	'Nova Andradina',	'NA');
INSERT INTO @tbl2 VALUES ('Mato Grosso do Sul',	'Paranaiba',	'PA');
INSERT INTO @tbl2 VALUES ('Mato Grosso do Sul',	'Tres Lagoas',	'TL');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Aimores',	'AI');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Alfenas',	'AF');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Almenara',	'AM');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Andrelandia',	'AN');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Aracuai',	'AC');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Araxa',	'AX');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Barbacena',	'BA');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Belo Horizonte',	'BH');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Bocaiuva',	'BO');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Bom Despacho',	'BD');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Campo Belo',	'CB');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Capelinha',	'CP');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Caratinga',	'CT');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Cataguases',	'CG');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Conceicao do Mato Dentro',	'CM');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Conselheiro Lafaiete',	'CL');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Curvelo',	'CU');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Diamantina',	'DM');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Divinopolis',	'DV');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Formiga',	'FO');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Frutal',	'FR');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Governador Valadares',	'GV');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Grao Mogol',	'GM');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Guanhaes',	'GU');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Ipatinga',	'IP');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Itabira',	'IB');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Itaguara',	'IG');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Itajuba',	'IJ');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Ituiutaba',	'IT');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Janauba',	'JB');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Januaria',	'JR');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Juiz de Fora',	'JF');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Lavras',	'LA');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Manhuacu',	'MH');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Mantena',	'MT');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Montes Claros',	'MC');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Muriae',	'MU');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Nanuque',	'NA');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Oliveira',	'OL');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Ouro Preto',	'OP');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Para de Minas',	'PM');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Paracatu',	'PU');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Passos',	'PS');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Patos de Minas',	'PT');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Patrocinio',	'PO');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Pecanha',	'PE');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Pedra Azul',	'PZ');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Pirapora',	'PP');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Piui',	'PI');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Pocos de Caldas',	'PC');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Ponte Nova',	'PN');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Pouso Alegre',	'PA');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Salinas',	'SA');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Santa Rita do Sapucai',	'SR');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Sao Joao del Rei',	'SJ');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Sao Lourenco',	'SL');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Sao Sebastiao do Paraiso',	'SS');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Sete Lagoas',	'ST');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Teofilo Otoni',	'TO');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Tres Marias',	'TM');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Uba',	'UB');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Uberaba',	'UR');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Uberlandia',	'UL');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Unai',	'UN');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Varginha',	'VA');
INSERT INTO @tbl2 VALUES ('Minas Gerais',	'Vicosa',	'VI');
INSERT INTO @tbl2 VALUES ('Para',	'Almeirim',	'AM');
INSERT INTO @tbl2 VALUES ('Para',	'Altamira',	'AT');
INSERT INTO @tbl2 VALUES ('Para',	'Arari',	'AR');
INSERT INTO @tbl2 VALUES ('Para',	'Belem',	'BE');
INSERT INTO @tbl2 VALUES ('Para',	'Bragantina',	'BR');
INSERT INTO @tbl2 VALUES ('Para',	'Cameta',	'CM');
INSERT INTO @tbl2 VALUES ('Para',	'Castanhal',	'CS');
INSERT INTO @tbl2 VALUES ('Para',	'Conceicao do Araguaia',	'CA');
INSERT INTO @tbl2 VALUES ('Para',	'Furos de Breves',	'FB');
INSERT INTO @tbl2 VALUES ('Para',	'Guama',	'GU');
INSERT INTO @tbl2 VALUES ('Para',	'Itaituba',	'IT');
INSERT INTO @tbl2 VALUES ('Para',	'Maraba',	'MA');
INSERT INTO @tbl2 VALUES ('Para',	'Obidos',	'OB');
INSERT INTO @tbl2 VALUES ('Para',	'Paragominas',	'PG');
INSERT INTO @tbl2 VALUES ('Para',	'Parauapebas',	'PP');
INSERT INTO @tbl2 VALUES ('Para',	'Portel',	'PO');
INSERT INTO @tbl2 VALUES ('Para',	'Redencao',	'RE');
INSERT INTO @tbl2 VALUES ('Para',	'Salgado',	'SG');
INSERT INTO @tbl2 VALUES ('Para',	'Santarem',	'ST');
INSERT INTO @tbl2 VALUES ('Para',	'Sao Felix do Xingu',	'SF');
INSERT INTO @tbl2 VALUES ('Para',	'Tome Acu',	'TA');
INSERT INTO @tbl2 VALUES ('Para',	'Tucurui',	'TU');
INSERT INTO @tbl2 VALUES ('Paraiba',	'Brejo Paraibano',	'BP');
INSERT INTO @tbl2 VALUES ('Paraiba',	'Cajazeiras',	'CA');
INSERT INTO @tbl2 VALUES ('Paraiba',	'Campina Grande',	'CG');
INSERT INTO @tbl2 VALUES ('Paraiba',	'Cariri Ocidental',	'CC');
INSERT INTO @tbl2 VALUES ('Paraiba',	'Cariri Oriental',	'CI');
INSERT INTO @tbl2 VALUES ('Paraiba',	'Catole do Rocha',	'CR');
INSERT INTO @tbl2 VALUES ('Paraiba',	'Curimatau Ocidental',	'CM');
INSERT INTO @tbl2 VALUES ('Paraiba',	'Curimatau Oriental',	'CT');
INSERT INTO @tbl2 VALUES ('Paraiba',	'Esperanca',	'ES');
INSERT INTO @tbl2 VALUES ('Paraiba',	'Guarabira',	'GU');
INSERT INTO @tbl2 VALUES ('Paraiba',	'Itabaiana',	'IB');
INSERT INTO @tbl2 VALUES ('Paraiba',	'Itaporanga',	'IP');
INSERT INTO @tbl2 VALUES ('Paraiba',	'Joao Pessoa',	'JP');
INSERT INTO @tbl2 VALUES ('Paraiba',	'Litoral Norte',	'LN');
INSERT INTO @tbl2 VALUES ('Paraiba',	'Litoral Sul',	'LS');
INSERT INTO @tbl2 VALUES ('Paraiba',	'Patos',	'PA');
INSERT INTO @tbl2 VALUES ('Paraiba',	'Pianco',	'PI');
INSERT INTO @tbl2 VALUES ('Paraiba',	'Sape',	'SA');
INSERT INTO @tbl2 VALUES ('Paraiba',	'Serido Ocidental Paraibano',	'SC');
INSERT INTO @tbl2 VALUES ('Paraiba',	'Serido Oriental Paraibano',	'SR');
INSERT INTO @tbl2 VALUES ('Paraiba',	'Serra do Teixeira',	'ST');
INSERT INTO @tbl2 VALUES ('Paraiba',	'Sousa',	'SS');
INSERT INTO @tbl2 VALUES ('Paraiba',	'Umbuzeiro',	'UM');
INSERT INTO @tbl2 VALUES ('Parana',	'Apucarana',	'AP');
INSERT INTO @tbl2 VALUES ('Parana',	'Assai',	'AS');
INSERT INTO @tbl2 VALUES ('Parana',	'Astorga',	'AG');
INSERT INTO @tbl2 VALUES ('Parana',	'Campo Mourao',	'CM');
INSERT INTO @tbl2 VALUES ('Parana',	'Capanema',	'CN');
INSERT INTO @tbl2 VALUES ('Parana',	'Cascavel',	'CV');
INSERT INTO @tbl2 VALUES ('Parana',	'Cerro Azul',	'CA');
INSERT INTO @tbl2 VALUES ('Parana',	'Cianorte',	'CI');
INSERT INTO @tbl2 VALUES ('Parana',	'Cornelio Procopio',	'CP');
INSERT INTO @tbl2 VALUES ('Parana',	'Curitiba',	'CU');
INSERT INTO @tbl2 VALUES ('Parana',	'Faxinal',	'FA');
INSERT INTO @tbl2 VALUES ('Parana',	'Florai',	'FL');
INSERT INTO @tbl2 VALUES ('Parana',	'Foz do Iguacu',	'FI');
INSERT INTO @tbl2 VALUES ('Parana',	'Francisco Beltrao',	'FB');
INSERT INTO @tbl2 VALUES ('Parana',	'Goioere',	'GO');
INSERT INTO @tbl2 VALUES ('Parana',	'Guarapuava',	'GU');
INSERT INTO @tbl2 VALUES ('Parana',	'Ibaiti',	'IB');
INSERT INTO @tbl2 VALUES ('Parana',	'Irati',	'IR');
INSERT INTO @tbl2 VALUES ('Parana',	'Ivaipora',	'IV');
INSERT INTO @tbl2 VALUES ('Parana',	'Jacarezinho',	'JZ');
INSERT INTO @tbl2 VALUES ('Parana',	'Jaguariaiva',	'JG');
INSERT INTO @tbl2 VALUES ('Parana',	'Lapa',	'LA');
INSERT INTO @tbl2 VALUES ('Parana',	'Londrina',	'LO');
INSERT INTO @tbl2 VALUES ('Parana',	'Maringa',	'MA');
INSERT INTO @tbl2 VALUES ('Parana',	'Palmas',	'PM');
INSERT INTO @tbl2 VALUES ('Parana',	'Paranagua',	'PA');
INSERT INTO @tbl2 VALUES ('Parana',	'Paranavai',	'PV');
INSERT INTO @tbl2 VALUES ('Parana',	'Pato Branco',	'PB');
INSERT INTO @tbl2 VALUES ('Parana',	'Pitanga',	'PI');
INSERT INTO @tbl2 VALUES ('Parana',	'Ponta Grossa',	'PG');
INSERT INTO @tbl2 VALUES ('Parana',	'Porecatu',	'PO');
INSERT INTO @tbl2 VALUES ('Parana',	'Prudentopolis',	'PR');
INSERT INTO @tbl2 VALUES ('Parana',	'Rio Negro',	'RN');
INSERT INTO @tbl2 VALUES ('Parana',	'Sao Mateus do Sul',	'SM');
INSERT INTO @tbl2 VALUES ('Parana',	'Telemaco Borba',	'TB');
INSERT INTO @tbl2 VALUES ('Parana',	'Toledo',	'TO');
INSERT INTO @tbl2 VALUES ('Parana',	'Umuarama',	'UM');
INSERT INTO @tbl2 VALUES ('Parana',	'Uniao da Vitoria',	'UV');
INSERT INTO @tbl2 VALUES ('Parana',	'Wenceslau Braz',	'WB');
INSERT INTO @tbl2 VALUES ('Pernambuco',	'Alto Capibaribe',	'AC');
INSERT INTO @tbl2 VALUES ('Pernambuco',	'Araripina',	'AR');
INSERT INTO @tbl2 VALUES ('Pernambuco',	'Brejo Pernambucano',	'BP');
INSERT INTO @tbl2 VALUES ('Pernambuco',	'Fernando de Noronha',	'FN');
INSERT INTO @tbl2 VALUES ('Pernambuco',	'Garanhuns',	'GA');
INSERT INTO @tbl2 VALUES ('Pernambuco',	'Itamaraca',	'IM');
INSERT INTO @tbl2 VALUES ('Pernambuco',	'Itaparica',	'IP');
INSERT INTO @tbl2 VALUES ('Pernambuco',	'Mata Meridional Pernambucana',	'MM');
INSERT INTO @tbl2 VALUES ('Pernambuco',	'Mata Setentrional Pernambucana',	'MS');
INSERT INTO @tbl2 VALUES ('Pernambuco',	'Medio Capibaribe',	'MC');
INSERT INTO @tbl2 VALUES ('Pernambuco',	'Pajeu',	'PA');
INSERT INTO @tbl2 VALUES ('Pernambuco',	'Petrolina',	'PE');
INSERT INTO @tbl2 VALUES ('Pernambuco',	'Recife',	'RE');
INSERT INTO @tbl2 VALUES ('Pernambuco',	'Salgueiro',	'SA');
INSERT INTO @tbl2 VALUES ('Pernambuco',	'Sertao do Moxoto',	'SM');
INSERT INTO @tbl2 VALUES ('Pernambuco',	'Suape',	'SU');
INSERT INTO @tbl2 VALUES ('Pernambuco',	'Vale do Ipanema',	'VM');
INSERT INTO @tbl2 VALUES ('Pernambuco',	'Vale do Ipojuca',	'VJ');
INSERT INTO @tbl2 VALUES ('Pernambuco',	'Vitoria de Santo Antao',	'VS');
INSERT INTO @tbl2 VALUES ('Piaui',	'Alto Medio Caninde',	'AC');
INSERT INTO @tbl2 VALUES ('Piaui',	'Alto Medio Gurgueia',	'AG');
INSERT INTO @tbl2 VALUES ('Piaui',	'Alto Parnaiba Piauiense',	'AP');
INSERT INTO @tbl2 VALUES ('Piaui',	'Baixo Parnaiba Piauiense',	'BP');
INSERT INTO @tbl2 VALUES ('Piaui',	'Bertolinia',	'BE');
INSERT INTO @tbl2 VALUES ('Piaui',	'Campo Maior',	'CM');
INSERT INTO @tbl2 VALUES ('Piaui',	'Chapadas do Extremo Sul Piauiense',	'CE');
INSERT INTO @tbl2 VALUES ('Piaui',	'Floriano',	'FL');
INSERT INTO @tbl2 VALUES ('Piaui',	'Litoral Piauiense',	'LP');
INSERT INTO @tbl2 VALUES ('Piaui',	'Medio Parnaiba Piauiense',	'MP');
INSERT INTO @tbl2 VALUES ('Piaui',	'Picos',	'PC');
INSERT INTO @tbl2 VALUES ('Piaui',	'Pio IX',	'PI');
INSERT INTO @tbl2 VALUES ('Piaui',	'Sao Raimundo Nonato',	'SR');
INSERT INTO @tbl2 VALUES ('Piaui',	'Teresina',	'TE');
INSERT INTO @tbl2 VALUES ('Piaui',	'Valenca do Piaui',	'VP');
INSERT INTO @tbl2 VALUES ('Rio de Janeiro',	'Bacia da Ilha Grande',	'BI');
INSERT INTO @tbl2 VALUES ('Rio de Janeiro',	'Bacia de Sao Joao',	'BS');
INSERT INTO @tbl2 VALUES ('Rio de Janeiro',	'Barra do Pirai',	'BP');
INSERT INTO @tbl2 VALUES ('Rio de Janeiro',	'Campos dos Goytacazes',	'CG');
INSERT INTO @tbl2 VALUES ('Rio de Janeiro',	'Cantagalo-Cordeiro',	'CC');
INSERT INTO @tbl2 VALUES ('Rio de Janeiro',	'Itaguai',	'IG');
INSERT INTO @tbl2 VALUES ('Rio de Janeiro',	'Itaperuna',	'IP');
INSERT INTO @tbl2 VALUES ('Rio de Janeiro',	'Lagos',	'LA');
INSERT INTO @tbl2 VALUES ('Rio de Janeiro',	'Macacu-Caceribu',	'MC');
INSERT INTO @tbl2 VALUES ('Rio de Janeiro',	'Macae',	'MA');
INSERT INTO @tbl2 VALUES ('Rio de Janeiro',	'Nova Friburgo',	'NF');
INSERT INTO @tbl2 VALUES ('Rio de Janeiro',	'Rio de Janeiro',	'RJ');
INSERT INTO @tbl2 VALUES ('Rio de Janeiro',	'Santa Maria Madalena',	'SM');
INSERT INTO @tbl2 VALUES ('Rio de Janeiro',	'Santo Antonio de Padua',	'SA');
INSERT INTO @tbl2 VALUES ('Rio de Janeiro',	'Serrana',	'SE');
INSERT INTO @tbl2 VALUES ('Rio de Janeiro',	'Tres Rios',	'TR');
INSERT INTO @tbl2 VALUES ('Rio de Janeiro',	'Vale do Paraiba Fluminense',	'VP');
INSERT INTO @tbl2 VALUES ('Rio de Janeiro',	'Vassouras',	'VA');
INSERT INTO @tbl2 VALUES ('Rio Grande do Norte',	'Agreste Potiguar',	'AP');
INSERT INTO @tbl2 VALUES ('Rio Grande do Norte',	'Angicos',	'AN');
INSERT INTO @tbl2 VALUES ('Rio Grande do Norte',	'Baixa Verde',	'BV');
INSERT INTO @tbl2 VALUES ('Rio Grande do Norte',	'Borborema Potiguar',	'BP');
INSERT INTO @tbl2 VALUES ('Rio Grande do Norte',	'Chapada do Apodi',	'CA');
INSERT INTO @tbl2 VALUES ('Rio Grande do Norte',	'Litoral Nordeste',	'LN');
INSERT INTO @tbl2 VALUES ('Rio Grande do Norte',	'Litoral Sul',	'LS');
INSERT INTO @tbl2 VALUES ('Rio Grande do Norte',	'Macaiba',	'MB');
INSERT INTO @tbl2 VALUES ('Rio Grande do Norte',	'Macau',	'MU');
INSERT INTO @tbl2 VALUES ('Rio Grande do Norte',	'Medio Oeste',	'MO');
INSERT INTO @tbl2 VALUES ('Rio Grande do Norte',	'Mossoro',	'MS');
INSERT INTO @tbl2 VALUES ('Rio Grande do Norte',	'Natal',	'NA');
INSERT INTO @tbl2 VALUES ('Rio Grande do Norte',	'Pau dos Ferros',	'PF');
INSERT INTO @tbl2 VALUES ('Rio Grande do Norte',	'Serido Ocidental',	'SC');
INSERT INTO @tbl2 VALUES ('Rio Grande do Norte',	'Serido Oriental',	'SR');
INSERT INTO @tbl2 VALUES ('Rio Grande do Norte',	'Serra de Santana',	'SS');
INSERT INTO @tbl2 VALUES ('Rio Grande do Norte',	'Serra de Sao Miguel',	'SM');
INSERT INTO @tbl2 VALUES ('Rio Grande do Norte',	'Umarizal',	'UM');
INSERT INTO @tbl2 VALUES ('Rio Grande do Norte',	'Vale do Acu',	'VA');
INSERT INTO @tbl2 VALUES ('Rio Grande do Sul',	'Cachoeira do Sul',	'CS');
INSERT INTO @tbl2 VALUES ('Rio Grande do Sul',	'Camaqua',	'CQ');
INSERT INTO @tbl2 VALUES ('Rio Grande do Sul',	'Campanha Central',	'CC');
INSERT INTO @tbl2 VALUES ('Rio Grande do Sul',	'Campanha Meridional',	'CM');
INSERT INTO @tbl2 VALUES ('Rio Grande do Sul',	'Campanha Ocidental',	'CO');
INSERT INTO @tbl2 VALUES ('Rio Grande do Sul',	'Carazinho',	'CZ');
INSERT INTO @tbl2 VALUES ('Rio Grande do Sul',	'Caxias do Sul',	'CX');
INSERT INTO @tbl2 VALUES ('Rio Grande do Sul',	'Cerro Largo',	'CL');
INSERT INTO @tbl2 VALUES ('Rio Grande do Sul',	'Cruz Alta',	'CA');
INSERT INTO @tbl2 VALUES ('Rio Grande do Sul',	'Erechim',	'ER');
INSERT INTO @tbl2 VALUES ('Rio Grande do Sul',	'Frederico Westphalen',	'FW');
INSERT INTO @tbl2 VALUES ('Rio Grande do Sul',	'Gramado-Canela',	'GC');
INSERT INTO @tbl2 VALUES ('Rio Grande do Sul',	'Guapore',	'GU');
INSERT INTO @tbl2 VALUES ('Rio Grande do Sul',	'Ijui',	'IJ');
INSERT INTO @tbl2 VALUES ('Rio Grande do Sul',	'Jaguarao',	'JA');
INSERT INTO @tbl2 VALUES ('Rio Grande do Sul',	'Lagoas dos Patos',	'LP');
INSERT INTO @tbl2 VALUES ('Rio Grande do Sul',	'Lajeado-Estrela',	'LE');
INSERT INTO @tbl2 VALUES ('Rio Grande do Sul',	'Litoral Lagunar',	'LL');
INSERT INTO @tbl2 VALUES ('Rio Grande do Sul',	'Mirim',	'MI');
INSERT INTO @tbl2 VALUES ('Rio Grande do Sul',	'Montenegro',	'MO');
INSERT INTO @tbl2 VALUES ('Rio Grande do Sul',	'Nao-Me-Toque',	'NM');
INSERT INTO @tbl2 VALUES ('Rio Grande do Sul',	'Osorio',	'OS');
INSERT INTO @tbl2 VALUES ('Rio Grande do Sul',	'Passo Fundo',	'PF');
INSERT INTO @tbl2 VALUES ('Rio Grande do Sul',	'Pelotas',	'PE');
INSERT INTO @tbl2 VALUES ('Rio Grande do Sul',	'Porto Alegre',	'PA');
INSERT INTO @tbl2 VALUES ('Rio Grande do Sul',	'Restinga Seca',	'RS');
INSERT INTO @tbl2 VALUES ('Rio Grande do Sul',	'Sananduva',	'SV');
INSERT INTO @tbl2 VALUES ('Rio Grande do Sul',	'Santa Cruz do Sul',	'SC');
INSERT INTO @tbl2 VALUES ('Rio Grande do Sul',	'Santa Maria',	'SM');
INSERT INTO @tbl2 VALUES ('Rio Grande do Sul',	'Santa Rosa',	'SR');
INSERT INTO @tbl2 VALUES ('Rio Grande do Sul',	'Santiago',	'SG');
INSERT INTO @tbl2 VALUES ('Rio Grande do Sul',	'Santo Angelo',	'SA');
INSERT INTO @tbl2 VALUES ('Rio Grande do Sul',	'Sao Jeronimo',	'SJ');
INSERT INTO @tbl2 VALUES ('Rio Grande do Sul',	'Serras de Sudeste',	'SS');
INSERT INTO @tbl2 VALUES ('Rio Grande do Sul',	'Soledade',	'SO');
INSERT INTO @tbl2 VALUES ('Rio Grande do Sul',	'Tres Passos',	'TP');
INSERT INTO @tbl2 VALUES ('Rio Grande do Sul',	'Vacaria',	'VA');
INSERT INTO @tbl2 VALUES ('Rondonia',	'Alvorada d''Oeste',	'AO');
INSERT INTO @tbl2 VALUES ('Rondonia',	'Ariquemes',	'AR');
INSERT INTO @tbl2 VALUES ('Rondonia',	'Cacoal',	'CA');
INSERT INTO @tbl2 VALUES ('Rondonia',	'Colorado d''Oeste',	'CO');
INSERT INTO @tbl2 VALUES ('Rondonia',	'Guajara-Mirim',	'GM');
INSERT INTO @tbl2 VALUES ('Rondonia',	'Ji-Parana',	'JP');
INSERT INTO @tbl2 VALUES ('Rondonia',	'Porto Velho',	'PV');
INSERT INTO @tbl2 VALUES ('Rondonia',	'Vilhena',	'VI');
INSERT INTO @tbl2 VALUES ('Roraima',	'Boa Vista',	'BV');
INSERT INTO @tbl2 VALUES ('Roraima',	'Caracarai',	'CA');
INSERT INTO @tbl2 VALUES ('Roraima',	'Nordeste de Roraima',	'NR');
INSERT INTO @tbl2 VALUES ('Roraima',	'Sudeste de Roraima',	'SR');
INSERT INTO @tbl2 VALUES ('Santa Catarina',	'Ararangua',	'AR');
INSERT INTO @tbl2 VALUES ('Santa Catarina',	'Blumenau',	'BL');
INSERT INTO @tbl2 VALUES ('Santa Catarina',	'Campos de Lages',	'CL');
INSERT INTO @tbl2 VALUES ('Santa Catarina',	'Canoinhas',	'CA');
INSERT INTO @tbl2 VALUES ('Santa Catarina',	'Chapeco',	'CH');
INSERT INTO @tbl2 VALUES ('Santa Catarina',	'Concordia',	'CO');
INSERT INTO @tbl2 VALUES ('Santa Catarina',	'Criciuma',	'CR');
INSERT INTO @tbl2 VALUES ('Santa Catarina',	'Curitibanos',	'CU');
INSERT INTO @tbl2 VALUES ('Santa Catarina',	'Florianopolis',	'FL');
INSERT INTO @tbl2 VALUES ('Santa Catarina',	'Itajai',	'IJ');
INSERT INTO @tbl2 VALUES ('Santa Catarina',	'Ituporanga',	'IP');
INSERT INTO @tbl2 VALUES ('Santa Catarina',	'Joacaba',	'JC');
INSERT INTO @tbl2 VALUES ('Santa Catarina',	'Joinville',	'JV');
INSERT INTO @tbl2 VALUES ('Santa Catarina',	'Rio do Sul',	'RS');
INSERT INTO @tbl2 VALUES ('Santa Catarina',	'Sao Bento do Sul',	'SB');
INSERT INTO @tbl2 VALUES ('Santa Catarina',	'Sao Miguel d''Oeste',	'SM');
INSERT INTO @tbl2 VALUES ('Santa Catarina',	'Tabuleiro',	'TA');
INSERT INTO @tbl2 VALUES ('Santa Catarina',	'Tijucas',	'TI');
INSERT INTO @tbl2 VALUES ('Santa Catarina',	'Tubarao',	'TU');
INSERT INTO @tbl2 VALUES ('Santa Catarina',	'Xanxere',	'XA');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Adamantina',	'AD');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Amparo',	'AM');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Andradina',	'AN');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Aracatuba',	'AC');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Araraquara',	'AQ');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Assis',	'AS');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Auriflama',	'AU');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Avare',	'AV');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Bananal',	'BN');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Barretos',	'BT');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Bauru',	'BU');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Birigui',	'BI');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Botucatu',	'BO');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Braganca Paulista',	'BP');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Campinas',	'CA');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Campos do Jordao',	'CJ');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Capao Bonito',	'CB');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Caraguatatuba',	'CG');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Catanduva',	'CV');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Dracena',	'DR');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Fernandopolis',	'FE');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Franca',	'FC');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Franco da Rocha',	'FR');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Guaratingueta',	'GT');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Guarulhos',	'GL');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Itanhaem',	'IH');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Itapecerica da Serra',	'IS');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Itapetininga',	'IT');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Itapeva',	'IP');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Ituverava',	'IV');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Jaboticabal',	'JB');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Jales',	'JL');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Jau',	'JA');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Jundiai',	'JD');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Limeira',	'LM');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Lins',	'LN');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Marilia',	'MA');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Mogi das Cruzes',	'MC');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Mogi Mirim',	'MM');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Nhandeara',	'ND');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Novo Horizonte',	'NH');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Osasco',	'OS');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Ourinhos',	'OU');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Paraibuna-Paraitinga',	'PB');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Piedade',	'PD');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Piracicaba',	'PC');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Pirassununga',	'PS');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Presidente Prudente',	'PP');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Registro',	'RE');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Ribeirao Preto',	'RP');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Rio Claro',	'RC');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Santos',	'SA');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Sao Carlos',	'SC');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Sao Joao da Boa Vista',	'SV');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Sao Joaquim da Barra',	'SB');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Sao Jose do Rio Preto',	'SR');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Sao Jose dos Campos',	'SJ');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Sao Paulo',	'SP');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Sorocaba',	'SO');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Tatui',	'TA');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Tupa',	'TU');
INSERT INTO @tbl2 VALUES ('Sao Paulo',	'Votuporanga',	'VO');
INSERT INTO @tbl2 VALUES ('Sergipe',	'Agreste de Itabaiana',	'AI');
INSERT INTO @tbl2 VALUES ('Sergipe',	'Aracaju',	'AR');
INSERT INTO @tbl2 VALUES ('Sergipe',	'Baixo Cotinguiba',	'BC');
INSERT INTO @tbl2 VALUES ('Sergipe',	'Boquim',	'BO');
INSERT INTO @tbl2 VALUES ('Sergipe',	'Carira',	'CA');
INSERT INTO @tbl2 VALUES ('Sergipe',	'Cotinguiba',	'CO');
INSERT INTO @tbl2 VALUES ('Sergipe',	'Estancia',	'ES');
INSERT INTO @tbl2 VALUES ('Sergipe',	'Japaratuba',	'JA');
INSERT INTO @tbl2 VALUES ('Sergipe',	'Nossa Senhora das Dores',	'NS');
INSERT INTO @tbl2 VALUES ('Sergipe',	'Propria',	'PR');
INSERT INTO @tbl2 VALUES ('Sergipe',	'Sergipana do Sertao do Sao Francisco',	'SS');
INSERT INTO @tbl2 VALUES ('Sergipe',	'Tobias Barreto',	'TB');
INSERT INTO @tbl2 VALUES ('Tocantins',	'Araguaina',	'AR');
INSERT INTO @tbl2 VALUES ('Tocantins',	'Bico do Papagaio',	'BP');
INSERT INTO @tbl2 VALUES ('Tocantins',	'Dianopolis',	'DI');
INSERT INTO @tbl2 VALUES ('Tocantins',	'Gurupi',	'GU');
INSERT INTO @tbl2 VALUES ('Tocantins',	'Jalapao',	'JA');
INSERT INTO @tbl2 VALUES ('Tocantins',	'Miracema do Tocantins',	'MT');
INSERT INTO @tbl2 VALUES ('Tocantins',	'Porto Nacional',	'PN');
INSERT INTO @tbl2 VALUES ('Tocantins',	'Rio Formoso',	'RF');

SET NOCOUNT OFF

INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	level_2_nm, level_2_cd, level_1_address_component_id
	FROM	@tbl2	t
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


