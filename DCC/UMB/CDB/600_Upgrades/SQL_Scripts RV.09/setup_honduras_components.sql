
/* ==================================================================================
    	Source File		:	setup_honduras_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Honduras are set-up
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
WHERE	country_nm	=	'Honduras';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Honduras not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Department',
		level_2_address_component	=	'Municipality',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('La Paz'            ,	     'Aguaqueterique',	'LP',	'AG');
INSERT INTO @tbl VALUES ('Gracias a Dios'            ,	     'Ahuas',	'GD',	'AH');
INSERT INTO @tbl VALUES ('Comayagua'            ,	     'Ajuterique',	'CM',	'AJ');
INSERT INTO @tbl VALUES ('El Paraiso'            ,	     'Alauca',	'EP',	'AL');
INSERT INTO @tbl VALUES ('Valle'            ,	     'Alianza',	'VA',	'AL');
INSERT INTO @tbl VALUES ('Francisco Morazan'            ,	     'Alubaren',	'FM',	'AL');
INSERT INTO @tbl VALUES ('Valle'            ,	     'Amapala',	'VA',	'AM');
INSERT INTO @tbl VALUES ('Choluteca'            ,	     'Apacilagua',	'CH',	'AP');
INSERT INTO @tbl VALUES ('Santa Barbara'            ,	     'Arada',	'SB',	'AR');
INSERT INTO @tbl VALUES ('Valle'            ,	     'Aramecina',	'VA',	'AR');
INSERT INTO @tbl VALUES ('Yoro'            ,	     'Arenal',	'YO',	'AR');
INSERT INTO @tbl VALUES ('Atlantida'            ,	     'Arizona',	'AT',	'AR');
INSERT INTO @tbl VALUES ('Santa Barbara'            ,	     'Atima',	'SB',	'AT');
INSERT INTO @tbl VALUES ('Santa Barbara'            ,	     'Azacualpa',	'SB',	'AZ');
INSERT INTO @tbl VALUES ('Colon'            ,	     'Balfate',	'CL',	'BA');
INSERT INTO @tbl VALUES ('Lempira'            ,	     'Belen',	'LE',	'BE');
INSERT INTO @tbl VALUES ('Ocotepeque'            ,	     'Belen Gualcho',	'OC',	'BG');
INSERT INTO @tbl VALUES ('Colon'            ,	     'Bonito Oriental',	'CL',	'BO');
INSERT INTO @tbl VALUES ('Gracias a Dios'            ,	     'Brus Laguna',	'GD',	'BL');
INSERT INTO @tbl VALUES ('Copan'            ,	     'Cabanas',	'CP',	'CA');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'Cabanas',	'LP',	'CB');
INSERT INTO @tbl VALUES ('Intibuca'            ,	     'Camasca',	'IN',	'CA');
INSERT INTO @tbl VALUES ('Olancho'            ,	     'Campamento',	'OL',	'CP');
INSERT INTO @tbl VALUES ('Lempira'            ,	     'Candelaria',	'LE',	'CA');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'Cane',	'LP',	'CN');
INSERT INTO @tbl VALUES ('Valle'            ,	     'Caridad',	'VA',	'CA');
INSERT INTO @tbl VALUES ('Olancho'            ,	     'Catacamas',	'OL',	'CT');
INSERT INTO @tbl VALUES ('Francisco Morazan'            ,	     'Cedros',	'FM',	'CE');
INSERT INTO @tbl VALUES ('Santa Barbara'            ,	     'Ceguaca',	'SB',	'CE');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'Chinacla',	'LP',	'CH');
INSERT INTO @tbl VALUES ('Santa Barbara'            ,	     'Chinda',	'SB',	'CH');
INSERT INTO @tbl VALUES ('Cortes'            ,	     'Choloma',	'CR',	'CH');
INSERT INTO @tbl VALUES ('Choluteca'            ,	     'Choluteca',	'CH',	'CH');
INSERT INTO @tbl VALUES ('Lempira'            ,	     'Cololaca',	'LE',	'CO');
INSERT INTO @tbl VALUES ('Intibuca'            ,	     'Colomoncagua',	'IN',	'CL');
INSERT INTO @tbl VALUES ('Comayagua'            ,	     'Comayagua',	'CM',	'CO');
INSERT INTO @tbl VALUES ('Copan'            ,	     'Concepcion',	'CP',	'CN');
INSERT INTO @tbl VALUES ('Intibuca'            ,	     'Concepcion',	'IN',	'CN');
INSERT INTO @tbl VALUES ('Ocotepeque'            ,	     'Concepcion',	'OC',	'CO');
INSERT INTO @tbl VALUES ('Santa Barbara'            ,	     'Concepcion del Norte',	'SB',	'CN');
INSERT INTO @tbl VALUES ('Santa Barbara'            ,	     'Concepcion del Sur',	'SB',	'CS');
INSERT INTO @tbl VALUES ('Choluteca'            ,	     'Concepcion de Maria',	'CH',	'CM');
INSERT INTO @tbl VALUES ('Olancho'            ,	     'Concordia',	'OL',	'CO');
INSERT INTO @tbl VALUES ('Copan'            ,	     'Copan Ruinas',	'CP',	'CR');
INSERT INTO @tbl VALUES ('Copan'            ,	     'Corquin',	'CP',	'CQ');
INSERT INTO @tbl VALUES ('Copan'            ,	     'Cucuyagua',	'CP',	'CU');
INSERT INTO @tbl VALUES ('Francisco Morazan'            ,	     'Curaren',	'FM',	'CU');
INSERT INTO @tbl VALUES ('El Paraiso'            ,	     'Danli',	'EP',	'DA');
INSERT INTO @tbl VALUES ('Francisco Morazan'            ,	     'Distrito Central',	'FM',	'DC');
INSERT INTO @tbl VALUES ('Copan'            ,	     'Dolores',	'CP',	'DO');
INSERT INTO @tbl VALUES ('Intibuca'            ,	     'Dolores',	'IN',	'DO');
INSERT INTO @tbl VALUES ('Ocotepeque'            ,	     'Dolores Merendon',	'OC',	'DM');
INSERT INTO @tbl VALUES ('Copan'            ,	     'Dulce Nombre',	'CP',	'DN');
INSERT INTO @tbl VALUES ('Olancho'            ,	     'Dulce Nombre de Culmi',	'OL',	'DN');
INSERT INTO @tbl VALUES ('Choluteca'            ,	     'Duyure',	'CH',	'DU');
INSERT INTO @tbl VALUES ('Choluteca'            ,	     'El Corpus',	'CH',	'EC');
INSERT INTO @tbl VALUES ('Yoro'            ,	     'El Negrito',	'YO',	'EN');
INSERT INTO @tbl VALUES ('Santa Barbara'            ,	     'El Nispero',	'SB',	'EN');
INSERT INTO @tbl VALUES ('Copan'            ,	     'El Paraiso',	'CP',	'EP');
INSERT INTO @tbl VALUES ('El Paraiso'            ,	     'El Paraiso',	'EP',	'EP');
INSERT INTO @tbl VALUES ('Atlantida'            ,	     'El Porvenir',	'AT',	'EP');
INSERT INTO @tbl VALUES ('Francisco Morazan'            ,	     'El Porvenir',	'FM',	'EP');
INSERT INTO @tbl VALUES ('Yoro'            ,	     'El Progreso',	'YO',	'EP');
INSERT INTO @tbl VALUES ('Comayagua'            ,	     'El Rosario',	'CM',	'ER');
INSERT INTO @tbl VALUES ('Olancho'            ,	     'El Rosario',	'OL',	'ER');
INSERT INTO @tbl VALUES ('Choluteca'            ,	     'El Triunfo',	'CH',	'ET');
INSERT INTO @tbl VALUES ('Lempira'            ,	     'Erandique',	'LE',	'ER');
INSERT INTO @tbl VALUES ('Atlantida'            ,	     'Esparta',	'AT',	'ES');
INSERT INTO @tbl VALUES ('Comayagua'            ,	     'Esquias',	'CM',	'ES');
INSERT INTO @tbl VALUES ('Olancho'            ,	     'Esquipulas del Norte',	'OL',	'EN');
INSERT INTO @tbl VALUES ('Copan'            ,	     'Florida',	'CP',	'FL');
INSERT INTO @tbl VALUES ('Ocotepeque'            ,	     'Fraternidad',	'OC',	'FR');
INSERT INTO @tbl VALUES ('Valle'            ,	     'Goascoran',	'VA',	'GO');
INSERT INTO @tbl VALUES ('Lempira'            ,	     'Gracias',	'LE',	'GR');
INSERT INTO @tbl VALUES ('Francisco Morazan'            ,	     'Guaimaca',	'FM',	'GU');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'Guajiquiro',	'LP',	'GU');
INSERT INTO @tbl VALUES ('Olancho'            ,	     'Gualaco',	'OL',	'GL');
INSERT INTO @tbl VALUES ('Santa Barbara'            ,	     'Gualala',	'SB',	'GU');
INSERT INTO @tbl VALUES ('Lempira'            ,	     'Gualcince',	'LE',	'GC');
INSERT INTO @tbl VALUES ('Islas de la Bahia'            ,	     'Guanaja',	'IB',	'GU');
INSERT INTO @tbl VALUES ('Lempira'            ,	     'Guarita',	'LE',	'GT');
INSERT INTO @tbl VALUES ('Olancho'            ,	     'Guarizama',	'OL',	'GR');
INSERT INTO @tbl VALUES ('Olancho'            ,	     'Guata',	'OL',	'GT');
INSERT INTO @tbl VALUES ('Olancho'            ,	     'Guayape',	'OL',	'GY');
INSERT INTO @tbl VALUES ('El Paraiso'            ,	     'Guinope',	'EP',	'GU');
INSERT INTO @tbl VALUES ('Comayagua'            ,	     'Humuya',	'CM',	'HU');
INSERT INTO @tbl VALUES ('Santa Barbara'            ,	     'Ilama',	'SB',	'IL');
INSERT INTO @tbl VALUES ('Intibuca'            ,	     'Intibuca',	'IN',	'IN');
INSERT INTO @tbl VALUES ('Colon'            ,	     'Iriona',	'CL',	'IR');
INSERT INTO @tbl VALUES ('El Paraiso'            ,	     'Jacaleapa',	'EP',	'JA');
INSERT INTO @tbl VALUES ('Olancho'            ,	     'Jano',	'OL',	'JA');
INSERT INTO @tbl VALUES ('Intibuca'            ,	     'Jesus de Otoro',	'IN',	'JO');
INSERT INTO @tbl VALUES ('Yoro'            ,	     'Jocon',	'YO',	'JO');
INSERT INTO @tbl VALUES ('Islas de la Bahia'            ,	     'Jose Santos Guardiola',	'IB',	'JS');
INSERT INTO @tbl VALUES ('Gracias a Dios'            ,	     'Juan Francisco Bulnes',	'GD',	'JF');
INSERT INTO @tbl VALUES ('Atlantida'            ,	     'Jutiapa',	'AT',	'JU');
INSERT INTO @tbl VALUES ('Olancho'            ,	     'Juticalpa',	'OL',	'JU');
INSERT INTO @tbl VALUES ('Lempira'            ,	     'La Campa',	'LE',	'LC');
INSERT INTO @tbl VALUES ('Atlantida'            ,	     'La Ceiba',	'AT',	'LC');
INSERT INTO @tbl VALUES ('Ocotepeque'            ,	     'La Encarnacion',	'OC',	'LE');
INSERT INTO @tbl VALUES ('Intibuca'            ,	     'La Esperanza',	'IN',	'LE');
INSERT INTO @tbl VALUES ('Lempira'            ,	     'La Iguala',	'LE',	'LI');
INSERT INTO @tbl VALUES ('Copan'            ,	     'La Jigua',	'CP',	'LJ');
INSERT INTO @tbl VALUES ('Ocotepeque'            ,	     'La Labor',	'OC',	'LL');
INSERT INTO @tbl VALUES ('Comayagua'            ,	     'La Libertad',	'CM',	'LB');
INSERT INTO @tbl VALUES ('Francisco Morazan'            ,	     'La Libertad',	'FM',	'LL');
INSERT INTO @tbl VALUES ('Cortes'            ,	     'La Lima',	'CR',	'LL');
INSERT INTO @tbl VALUES ('Comayagua'            ,	     'Lamani',	'CM',	'LA');
INSERT INTO @tbl VALUES ('Atlantida'            ,	     'La Masica',	'AT',	'LM');
INSERT INTO @tbl VALUES ('Valle'            ,	     'Langue',	'VA',	'LA');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'La Paz',	'LP',	'LP');
INSERT INTO @tbl VALUES ('Lempira'            ,	     'Las Flores',	'LE',	'LF');
INSERT INTO @tbl VALUES ('Comayagua'            ,	     'Las Lajas',	'CM',	'LJ');
INSERT INTO @tbl VALUES ('Santa Barbara'            ,	     'Las Vegas',	'SB',	'LV');
INSERT INTO @tbl VALUES ('Comayagua'            ,	     'La Trinidad',	'CM',	'LT');
INSERT INTO @tbl VALUES ('Copan'            ,	     'La Union',	'CP',	'LU');
INSERT INTO @tbl VALUES ('Lempira'            ,	     'La Union',	'LE',	'LU');
INSERT INTO @tbl VALUES ('Olancho'            ,	     'La Union',	'OL',	'LU');
INSERT INTO @tbl VALUES ('Francisco Morazan'            ,	     'La Venta',	'FM',	'LV');
INSERT INTO @tbl VALUES ('Lempira'            ,	     'La Virtud',	'LE',	'LV');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'Lauterique',	'LP',	'LA');
INSERT INTO @tbl VALUES ('Comayagua'            ,	     'Lejamani',	'CM',	'LE');
INSERT INTO @tbl VALUES ('Lempira'            ,	     'Lepaera',	'LE',	'LE');
INSERT INTO @tbl VALUES ('Francisco Morazan'            ,	     'Lepaterique',	'FM',	'LE');
INSERT INTO @tbl VALUES ('Colon'            ,	     'Limon',	'CL',	'LI');
INSERT INTO @tbl VALUES ('El Paraiso'            ,	     'Liure',	'EP',	'LI');
INSERT INTO @tbl VALUES ('Ocotepeque'            ,	     'Lucerna',	'OC',	'LU');
INSERT INTO @tbl VALUES ('Santa Barbara'            ,	     'Macuelizo',	'SB',	'MA');
INSERT INTO @tbl VALUES ('Intibuca'            ,	     'Magdalena',	'IN',	'MD');
INSERT INTO @tbl VALUES ('Olancho'            ,	     'Mangulile',	'OL',	'MG');
INSERT INTO @tbl VALUES ('Olancho'            ,	     'Manto',	'OL',	'MT');
INSERT INTO @tbl VALUES ('Lempira'            ,	     'Mapulaca',	'LE',	'MA');
INSERT INTO @tbl VALUES ('Francisco Morazan'            ,	     'Maraita',	'FM',	'MT');
INSERT INTO @tbl VALUES ('Francisco Morazan'            ,	     'Marale',	'FM',	'ML');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'Marcala',	'LP',	'MA');
INSERT INTO @tbl VALUES ('Choluteca'            ,	     'Marcovia',	'CH',	'MA');
INSERT INTO @tbl VALUES ('Intibuca'            ,	     'Masaguara',	'IN',	'MS');
INSERT INTO @tbl VALUES ('Comayagua'            ,	     'Meambar',	'CM',	'ME');
INSERT INTO @tbl VALUES ('Ocotepeque'            ,	     'Mercedes',	'OC',	'ME');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'Mercedes de Oriente',	'LP',	'MO');
INSERT INTO @tbl VALUES ('Comayagua'            ,	     'Minas de Oro',	'CM',	'MO');
INSERT INTO @tbl VALUES ('Yoro'            ,	     'Morazan',	'YO',	'MO');
INSERT INTO @tbl VALUES ('El Paraiso'            ,	     'Moroceli',	'EP',	'MO');
INSERT INTO @tbl VALUES ('Choluteca'            ,	     'Morolica',	'CH',	'MO');
INSERT INTO @tbl VALUES ('Valle'            ,	     'Nacaome',	'VA',	'NA');
INSERT INTO @tbl VALUES ('Choluteca'            ,	     'Namasigue',	'CH',	'NA');
INSERT INTO @tbl VALUES ('Santa Barbara'            ,	     'Naranjito',	'SB',	'NA');
INSERT INTO @tbl VALUES ('Copan'            ,	     'Nueva Arcadia',	'CP',	'NA');
INSERT INTO @tbl VALUES ('Francisco Morazan'            ,	     'Nueva Armenia',	'FM',	'NA');
INSERT INTO @tbl VALUES ('Santa Barbara'            ,	     'Nueva Frontera',	'SB',	'NF');
INSERT INTO @tbl VALUES ('Santa Barbara'            ,	     'Nuevo Celilac',	'SB',	'NC');
INSERT INTO @tbl VALUES ('Ocotepeque'            ,	     'Ocotepeque',	'OC',	'OC');
INSERT INTO @tbl VALUES ('Comayagua'            ,	     'Ojo de Agua',	'CM',	'OA');
INSERT INTO @tbl VALUES ('Francisco Morazan'            ,	     'Ojojona',	'FM',	'OJ');
INSERT INTO @tbl VALUES ('Yoro'            ,	     'Olanchito',	'YO',	'OL');
INSERT INTO @tbl VALUES ('Cortes'            ,	     'Omoa',	'CR',	'OM');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'Opatoro',	'LP',	'OP');
INSERT INTO @tbl VALUES ('Francisco Morazan'            ,	     'Orica',	'FM',	'OR');
INSERT INTO @tbl VALUES ('Choluteca'            ,	     'Orocuina',	'CH',	'OR');
INSERT INTO @tbl VALUES ('El Paraiso'            ,	     'Oropoli',	'EP',	'OR');
INSERT INTO @tbl VALUES ('Olancho'            ,	     'Patuca',	'OL',	'PA');
INSERT INTO @tbl VALUES ('Choluteca'            ,	     'Pespire',	'CH',	'PE');
INSERT INTO @tbl VALUES ('Santa Barbara'            ,	     'Petoa',	'SB',	'PE');
INSERT INTO @tbl VALUES ('Cortes'            ,	     'Pimienta',	'CR',	'PI');
INSERT INTO @tbl VALUES ('Lempira'            ,	     'Piraera',	'LE',	'PI');
INSERT INTO @tbl VALUES ('Cortes'            ,	     'Potrerillos',	'CR',	'PO');
INSERT INTO @tbl VALUES ('El Paraiso'            ,	     'Potrerillos',	'EP',	'PO');
INSERT INTO @tbl VALUES ('Santa Barbara'            ,	     'Proteccion',	'SB',	'PR');
INSERT INTO @tbl VALUES ('Cortes'            ,	     'Puerto Cortes',	'CR',	'PC');
INSERT INTO @tbl VALUES ('Gracias a Dios'            ,	     'Puerto Lempira',	'GD',	'PL');
INSERT INTO @tbl VALUES ('Santa Barbara'            ,	     'Quimistan',	'SB',	'QU');
INSERT INTO @tbl VALUES ('Gracias a Dios'            ,	     'Ramon Villeda Morales',	'GD',	'RV');
INSERT INTO @tbl VALUES ('Francisco Morazan'            ,	     'Reitoca',	'FM',	'RE');
INSERT INTO @tbl VALUES ('Islas de la Bahia'            ,	     'Roatan',	'IB',	'RO');
INSERT INTO @tbl VALUES ('Colon'            ,	     'Saba',	'CL',	'SA');
INSERT INTO @tbl VALUES ('Francisco Morazan'            ,	     'Sabanagrande',	'FM',	'SG');
INSERT INTO @tbl VALUES ('Olancho'            ,	     'Salama',	'OL',	'SA');
INSERT INTO @tbl VALUES ('Copan'            ,	     'San Agustin',	'CP',	'SG');
INSERT INTO @tbl VALUES ('Lempira'            ,	     'San Andres',	'LE',	'SA');
INSERT INTO @tbl VALUES ('Copan'            ,	     'San Antonio',	'CP',	'SA');
INSERT INTO @tbl VALUES ('Intibuca'            ,	     'San Antonio',	'IN',	'SA');
INSERT INTO @tbl VALUES ('Cortes'            ,	     'San Antonio de Cortes',	'CR',	'SA');
INSERT INTO @tbl VALUES ('Choluteca'            ,	     'San Antonio de Flores',	'CH',	'SF');
INSERT INTO @tbl VALUES ('El Paraiso'            ,	     'San Antonio de Flores',	'EP',	'SA');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'San Antonio del Norte',	'LP',	'SN');
INSERT INTO @tbl VALUES ('Francisco Morazan'            ,	     'San Antonio de Oriente',	'FM',	'SO');
INSERT INTO @tbl VALUES ('Francisco Morazan'            ,	     'San Buenaventura',	'FM',	'SB');
INSERT INTO @tbl VALUES ('Olancho'            ,	     'San Esteban',	'OL',	'SE');
INSERT INTO @tbl VALUES ('Ocotepeque'            ,	     'San Fernando',	'OC',	'SF');
INSERT INTO @tbl VALUES ('Atlantida'            ,	     'San Francisco',	'AT',	'SF');
INSERT INTO @tbl VALUES ('Lempira'            ,	     'San Francisco',	'LE',	'SF');
INSERT INTO @tbl VALUES ('Olancho'            ,	     'San Francisco de Becerra',	'OL',	'SB');
INSERT INTO @tbl VALUES ('Valle'            ,	     'San Francisco de Coray',	'VA',	'SF');
INSERT INTO @tbl VALUES ('Olancho'            ,	     'San Francisco de la Paz',	'OL',	'SP');
INSERT INTO @tbl VALUES ('Ocotepeque'            ,	     'San Francisco del Valle',	'OC',	'SV');
INSERT INTO @tbl VALUES ('Santa Barbara'            ,	     'San Francisco de Ojuera',	'SB',	'SF');
INSERT INTO @tbl VALUES ('Intibuca'            ,	     'San Francisco de Opalaca',	'IN',	'SF');
INSERT INTO @tbl VALUES ('Cortes'            ,	     'San Francisco de Yojoa',	'CR',	'SF');
INSERT INTO @tbl VALUES ('Francisco Morazan'            ,	     'San Ignacio',	'FM',	'SI');
INSERT INTO @tbl VALUES ('Choluteca'            ,	     'San Isidro',	'CH',	'SI');
INSERT INTO @tbl VALUES ('Intibuca'            ,	     'San Isidro',	'IN',	'SI');
INSERT INTO @tbl VALUES ('Comayagua'            ,	     'San Jeronimo',	'CM',	'SJ');
INSERT INTO @tbl VALUES ('Copan'            ,	     'San Jeronimo',	'CP',	'SM');
INSERT INTO @tbl VALUES ('Ocotepeque'            ,	     'San Jorge',	'OC',	'SJ');
INSERT INTO @tbl VALUES ('Choluteca'            ,	     'San Jose',	'CH',	'SJ');
INSERT INTO @tbl VALUES ('Copan'            ,	     'San Jose',	'CP',	'SJ');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'San Jose',	'LP',	'SJ');
INSERT INTO @tbl VALUES ('Santa Barbara'            ,	     'San Jose de Colinas',	'SB',	'SJ');
INSERT INTO @tbl VALUES ('Comayagua'            ,	     'San Jose de Comayagua',	'CM',	'SC');
INSERT INTO @tbl VALUES ('Comayagua'            ,	     'San Jose del Potrero',	'CM',	'SP');
INSERT INTO @tbl VALUES ('Intibuca'            ,	     'San Juan',	'IN',	'SJ');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'San Juan',	'LP',	'SU');
INSERT INTO @tbl VALUES ('Francisco Morazan'            ,	     'San Juan de Flores',	'FM',	'SJ');
INSERT INTO @tbl VALUES ('Copan'            ,	     'San Juan de Opoa',	'CP',	'SO');
INSERT INTO @tbl VALUES ('Lempira'            ,	     'San Juan Guarita',	'LE',	'SJ');
INSERT INTO @tbl VALUES ('Valle'            ,	     'San Lorenzo',	'VA',	'SL');
INSERT INTO @tbl VALUES ('El Paraiso'            ,	     'San Lucas',	'EP',	'SL');
INSERT INTO @tbl VALUES ('Comayagua'            ,	     'San Luis',	'CM',	'SL');
INSERT INTO @tbl VALUES ('Santa Barbara'            ,	     'San Luis',	'SB',	'SL');
INSERT INTO @tbl VALUES ('Cortes'            ,	     'San Manuel',	'CR',	'SM');
INSERT INTO @tbl VALUES ('Lempira'            ,	     'San Manuel Colohete',	'LE',	'SH');
INSERT INTO @tbl VALUES ('Intibuca'            ,	     'San Marcos de la Sierra',	'IN',	'SS');
INSERT INTO @tbl VALUES ('Ocotepeque'            ,	     'San Marcos',	'OC',	'SM');
INSERT INTO @tbl VALUES ('Santa Barbara'            ,	     'San Marcos',	'SB',	'SM');
INSERT INTO @tbl VALUES ('Lempira'            ,	     'San Marcos de Caiquin',	'LE',	'SM');
INSERT INTO @tbl VALUES ('Choluteca'            ,	     'San Marcos de Colon',	'CH',	'SM');
INSERT INTO @tbl VALUES ('El Paraiso'            ,	     'San Matias',	'EP',	'SM');
INSERT INTO @tbl VALUES ('Francisco Morazan'            ,	     'San Miguelito',	'FM',	'SM');
INSERT INTO @tbl VALUES ('Intibuca'            ,	     'San Miguelito',	'IN',	'SM');
INSERT INTO @tbl VALUES ('Copan'            ,	     'San Nicolas',	'CP',	'SN');
INSERT INTO @tbl VALUES ('Santa Barbara'            ,	     'San Nicolas',	'SB',	'SN');
INSERT INTO @tbl VALUES ('Copan'            ,	     'San Pedro',	'CP',	'SP');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'San Pedro de Tutule',	'LP',	'ST');
INSERT INTO @tbl VALUES ('Cortes'            ,	     'San Pedro Sula',	'CR',	'SP');
INSERT INTO @tbl VALUES ('Santa Barbara'            ,	     'San Pedro Zacapa',	'SB',	'SP');
INSERT INTO @tbl VALUES ('Lempira'            ,	     'San Rafael',	'LE',	'SR');
INSERT INTO @tbl VALUES ('Lempira'            ,	     'San Sebastian',	'LE',	'SS');
INSERT INTO @tbl VALUES ('Comayagua'            ,	     'San Sebastian',	'CM',	'SS');
INSERT INTO @tbl VALUES ('Francisco Morazan'            ,	     'Santa Ana',	'FM',	'SA');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'Santa Ana',	'LP',	'SA');
INSERT INTO @tbl VALUES ('Choluteca'            ,	     'Santa Ana de Yusguare',	'CH',	'SY');
INSERT INTO @tbl VALUES ('Santa Barbara'            ,	     'Santa Barbara',	'SB',	'SB');
INSERT INTO @tbl VALUES ('Lempira'            ,	     'Santa Cruz',	'LE',	'SC');
INSERT INTO @tbl VALUES ('Cortes'            ,	     'Santa Cruz de Yojoa',	'CR',	'SC');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'Santa Elena',	'LP',	'SE');
INSERT INTO @tbl VALUES ('Colon'            ,	     'Santa Fe',	'CL',	'SF');
INSERT INTO @tbl VALUES ('Ocotepeque'            ,	     'Santa Fe',	'OC',	'ST');
INSERT INTO @tbl VALUES ('Francisco Morazan'            ,	     'Santa Lucia',	'FM',	'SL');
INSERT INTO @tbl VALUES ('Intibuca'            ,	     'Santa Lucia',	'IN',	'SL');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'Santa Maria',	'LP',	'SM');
INSERT INTO @tbl VALUES ('Olancho'            ,	     'Santa Maria del Real',	'OL',	'SM');
INSERT INTO @tbl VALUES ('Copan'            ,	     'Santa Rita',	'CP',	'SR');
INSERT INTO @tbl VALUES ('Santa Barbara'            ,	     'Santa Rita',	'SB',	'SR');
INSERT INTO @tbl VALUES ('Yoro'            ,	     'Santa Rita',	'YO',	'SR');
INSERT INTO @tbl VALUES ('Colon'            ,	     'Santa Rosa de Aguan',	'CL',	'SR');
INSERT INTO @tbl VALUES ('Copan'            ,	     'Santa Rosa de Copan',	'CP',	'SC');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'Santiago de Puringla',	'LP',	'SP');
INSERT INTO @tbl VALUES ('Santa Barbara'            ,	     'San Vicente Centenario',	'SB',	'SV');
INSERT INTO @tbl VALUES ('Ocotepeque'            ,	     'Sensenti',	'OC',	'SE');
INSERT INTO @tbl VALUES ('Comayagua'            ,	     'Siguatepeque',	'CM',	'SI');
INSERT INTO @tbl VALUES ('Olancho'            ,	     'Silca',	'OL',	'SI');
INSERT INTO @tbl VALUES ('Ocotepeque'            ,	     'Sinuapa',	'OC',	'SI');
INSERT INTO @tbl VALUES ('El Paraiso'            ,	     'Soledad',	'EP',	'SO');
INSERT INTO @tbl VALUES ('Colon'            ,	     'Sonaguera',	'CL',	'SO');
INSERT INTO @tbl VALUES ('Yoro'            ,	     'Sulaco',	'YO',	'SU');
INSERT INTO @tbl VALUES ('Francisco Morazan'            ,	     'Talanga',	'FM',	'TL');
INSERT INTO @tbl VALUES ('Lempira'            ,	     'Talgua',	'LE',	'TG');
INSERT INTO @tbl VALUES ('Lempira'            ,	     'Tambla',	'LE',	'TB');
INSERT INTO @tbl VALUES ('Francisco Morazan'            ,	     'Tatumbla',	'FM',	'TT');
INSERT INTO @tbl VALUES ('Comayagua'            ,	     'Taulabe',	'CM',	'TA');
INSERT INTO @tbl VALUES ('Atlantida'            ,	     'Tela',	'AT',	'TE');
INSERT INTO @tbl VALUES ('El Paraiso'            ,	     'Teupasenti',	'EP',	'TP');
INSERT INTO @tbl VALUES ('El Paraiso'            ,	     'Texiguat',	'EP',	'TX');
INSERT INTO @tbl VALUES ('Colon'            ,	     'Tocoa',	'CL',	'TO');
INSERT INTO @tbl VALUES ('Lempira'            ,	     'Tomala',	'LE',	'TO');
INSERT INTO @tbl VALUES ('Santa Barbara'            ,	     'Trinidad',	'SB',	'TR');
INSERT INTO @tbl VALUES ('Copan'            ,	     'Trinidad de Copan',	'CP',	'TC');
INSERT INTO @tbl VALUES ('El Paraiso'            ,	     'Trojes',	'EP',	'TR');
INSERT INTO @tbl VALUES ('Colon'            ,	     'Trujillo',	'CL',	'TR');
INSERT INTO @tbl VALUES ('Islas de la Bahia'            ,	     'Utila',	'IB',	'UT');
INSERT INTO @tbl VALUES ('El Paraiso'            ,	     'Vado Ancho',	'EP',	'VA');
INSERT INTO @tbl VALUES ('Lempira'            ,	     'Valladolid',	'LE',	'VA');
INSERT INTO @tbl VALUES ('Francisco Morazan'            ,	     'Valle de Angeles',	'FM',	'VA');
INSERT INTO @tbl VALUES ('Francisco Morazan'            ,	     'Vallecillo',	'FM',	'VC');
INSERT INTO @tbl VALUES ('Copan'            ,	     'Veracruz',	'CP',	'VE');
INSERT INTO @tbl VALUES ('Yoro'            ,	     'Victoria',	'YO',	'VI');
INSERT INTO @tbl VALUES ('Comayagua'            ,	     'Villa de San Antonio',	'CM',	'VS');
INSERT INTO @tbl VALUES ('Francisco Morazan'            ,	     'Villa de San Francisco',	'FM',	'VS');
INSERT INTO @tbl VALUES ('Cortes'            ,	     'Villanueva',	'CR',	'VI');
INSERT INTO @tbl VALUES ('Lempira'            ,	     'Virginia',	'LE',	'VI');
INSERT INTO @tbl VALUES ('Gracias a Dios'            ,	     'Wampusirpi',	'GD',	'WA');
INSERT INTO @tbl VALUES ('Intibuca'            ,	     'Yamaranguila',	'IN',	'YA');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'Yarula',	'LP',	'YA');
INSERT INTO @tbl VALUES ('El Paraiso'            ,	     'Yauyupe',	'EP',	'YA');
INSERT INTO @tbl VALUES ('Olancho'            ,	     'Yocon',	'OL',	'YO');
INSERT INTO @tbl VALUES ('Yoro'            ,	     'Yorito',	'YO',	'YT');
INSERT INTO @tbl VALUES ('Yoro'            ,	     'Yoro',	'YO',	'YO');
INSERT INTO @tbl VALUES ('El Paraiso'            ,	     'Yuscaran',	'EP',	'YU');

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

