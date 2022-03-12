
/* ==================================================================================
    	Source File		:	setup_dominican_republic_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Dominican_Republic are set-up
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
WHERE	country_nm	=	'Dominican Republic';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Dominican_Republic not found', 16, 1);
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

INSERT INTO @tbl VALUES ('Puerto Plata'            ,	     'Altamira',	'PP',	'AL');
INSERT INTO @tbl VALUES ('Duarte'            ,	     'Arenoso',	'DU',	'AR');
INSERT INTO @tbl VALUES ('Azua'            ,	     'Azua',	'AZ',	'AC');
INSERT INTO @tbl VALUES ('San Cristobal'            ,	     'Bajos de Haina',	'CR',	'BH');
INSERT INTO @tbl VALUES ('Peravia'            ,	     'Bani',	'PV',	'BN');
INSERT INTO @tbl VALUES ('Barahona'            ,	     'Barahona',	'BH',	'SC');
INSERT INTO @tbl VALUES ('Monte Plata'            ,	     'Bayaguana',	'MP',	'BA');
INSERT INTO @tbl VALUES ('Elias Pina'            ,	     'Banica',	'EP',	'BA');
INSERT INTO @tbl VALUES ('Santiago'            ,	     'Bisono',	'ST',	'VB');
INSERT INTO @tbl VALUES ('Santo Domingo'            ,	     'Boca Chica',	'SD',	'BC');
INSERT INTO @tbl VALUES ('San Juan'            ,	     'Bohechio',	'JU',	'BO');
INSERT INTO @tbl VALUES ('Monsenor Nouel'            ,	     'Bonao',	'MN',	'BO');
INSERT INTO @tbl VALUES ('Barahona'            ,	     'Cabral',	'BH',	'CA');
INSERT INTO @tbl VALUES ('Maria Trinidad Sanchez'            ,	     'Cabrera',	'MT',	'CA');
INSERT INTO @tbl VALUES ('San Cristobal'            ,	     'Cambita Garabitos',	'CR',	'CG');
INSERT INTO @tbl VALUES ('Monte Cristi'            ,	     'Castanuelas',	'MC',	'CA');
INSERT INTO @tbl VALUES ('Duarte'            ,	     'Castillo',	'DU',	'CA');
INSERT INTO @tbl VALUES ('Espaillat'            ,	     'Cayetano Germosen',	'ES',	'CG');
INSERT INTO @tbl VALUES ('Sanchez Ramirez'            ,	     'Cevicos',	'SZ',	'CV');
INSERT INTO @tbl VALUES ('Elias Pina'            ,	     'Comendador',	'EP',	'CO');
INSERT INTO @tbl VALUES ('La Vega'            ,	     'Constanza',	'VE',	'CO');
INSERT INTO @tbl VALUES ('San Pedro de Macoris'            ,	     'Consuelo',	'PM',	'CO');
INSERT INTO @tbl VALUES ('Sanchez Ramirez'            ,	     'Cotui',	'SZ',	'CO');
INSERT INTO @tbl VALUES ('Independencia'            ,	     'Cristobal',	'IN',	'CR');
INSERT INTO @tbl VALUES ('Dajabon'            ,	     'Dajabon',	'DA',	'DA');
INSERT INTO @tbl VALUES ('Independencia'            ,	     'Duverge',	'IN',	'DU');
INSERT INTO @tbl VALUES ('San Juan'            ,	     'El Cercado',	'JU',	'EC');
INSERT INTO @tbl VALUES ('Maria Trinidad Sanchez'            ,	     'El Factor',	'MT',	'EF');
INSERT INTO @tbl VALUES ('Elias Pina'            ,	     'El Llano',	'EP',	'EL');
INSERT INTO @tbl VALUES ('Barahona'            ,	     'El Penon',	'BH',	'EP');
INSERT INTO @tbl VALUES ('Dajabon'            ,	     'El Pino',	'DA',	'EP');
INSERT INTO @tbl VALUES ('El Seibo'            ,	     'El Seibo',	'SE',	'SC');
INSERT INTO @tbl VALUES ('Hato Mayor'            ,	     'El Valle',	'HM',	'EV');
INSERT INTO @tbl VALUES ('Barahona'            ,	     'Enriquillo',	'BH',	'EN');
INSERT INTO @tbl VALUES ('Valverde'            ,	     'Esperanza',	'VA',	'ES');
INSERT INTO @tbl VALUES ('Azua'            ,	     'Estebania',	'AZ',	'ES');
INSERT INTO @tbl VALUES ('Duarte'            ,	     'Eugenio Maria de Hostos',	'DU',	'HO');
INSERT INTO @tbl VALUES ('Sanchez Ramirez'            ,	     'Fantino',	'SZ',	'FA');
INSERT INTO @tbl VALUES ('Barahona'            ,	     'Fundacion',	'BH',	'FU');
INSERT INTO @tbl VALUES ('Bahoruco'            ,	     'Galvan',	'BR',	'GA');
INSERT INTO @tbl VALUES ('Espaillat'            ,	     'Gaspar Hernandez',	'ES',	'GH');
INSERT INTO @tbl VALUES ('Puerto Plata'            ,	     'Guananico',	'PP',	'GU');
INSERT INTO @tbl VALUES ('Azua'            ,	     'Guayabal',	'AZ',	'GU');
INSERT INTO @tbl VALUES ('San Pedro de Macoris'            ,	     'Guayacanes',	'PM',	'GY');
INSERT INTO @tbl VALUES ('La Romana'            ,	     'Guaymate',	'RO',	'GU');
INSERT INTO @tbl VALUES ('Monte Cristi'            ,	     'Guayubin',	'MC',	'GU');
INSERT INTO @tbl VALUES ('Hato Mayor'            ,	     'Hato Mayor',	'HM',	'HM');
INSERT INTO @tbl VALUES ('La Altagracia'            ,	     'Higuey',	'AL',	'HI');
INSERT INTO @tbl VALUES ('Elias Pina'            ,	     'Hondo Valle',	'EP',	'HV');
INSERT INTO @tbl VALUES ('Puerto Plata'            ,	     'Imbert',	'PP',	'IM');
INSERT INTO @tbl VALUES ('Espaillat'            ,	     'Jamao al Norte',	'ES',	'JN');
INSERT INTO @tbl VALUES ('Barahona'            ,	     'Jaquimeyes',	'BH',	'JQ');
INSERT INTO @tbl VALUES ('La Vega'            ,	     'Jarabacoa',	'VE',	'JB');
INSERT INTO @tbl VALUES ('Santiago'            ,	     'Janico',	'ST',	'JA');
INSERT INTO @tbl VALUES ('La Vega'            ,	     'Jima Abajo',	'VE',	'JA');
INSERT INTO @tbl VALUES ('Independencia'            ,	     'Jimani',	'IN',	'JI');
INSERT INTO @tbl VALUES ('San Juan'            ,	     'Juan de Herrera',	'JU',	'JH');
INSERT INTO @tbl VALUES ('Elias Pina'            ,	     'Juan Santiago',	'EP',	'JS');
INSERT INTO @tbl VALUES ('Barahona'            ,	     'La Cienaga',	'BH',	'LC');
INSERT INTO @tbl VALUES ('Independencia'            ,	     'La Descubierta',	'IN',	'LD');
INSERT INTO @tbl VALUES ('Sanchez Ramirez'            ,	     'La Mata',	'SZ',	'LM');
INSERT INTO @tbl VALUES ('La Romana'            ,	     'La Romana',	'RO',	'LR');
INSERT INTO @tbl VALUES ('La Vega'            ,	     'La Vega',	'VE',	'CV');
INSERT INTO @tbl VALUES ('Valverde'            ,	     'Laguna Salada',	'VA',	'LS');
INSERT INTO @tbl VALUES ('Azua'            ,	     'Las Charcas',	'AZ',	'LC');
INSERT INTO @tbl VALUES ('Duarte'            ,	     'Las Guaranas',	'DU',	'LG');
INSERT INTO @tbl VALUES ('San Juan'            ,	     'Las Matas de Farfan',	'JU',	'LM');
INSERT INTO @tbl VALUES ('Monte Cristi'            ,	     'Las Matas de Santa Cruz',	'MC',	'LM');
INSERT INTO @tbl VALUES ('Barahona'            ,	     'Las Salinas',	'BH',	'LS');
INSERT INTO @tbl VALUES ('Samana'            ,	     'Las Terrenas',	'SM',	'LT');
INSERT INTO @tbl VALUES ('Azua'            ,	     'Las Yayas de Viajama',	'AZ',	'YV');
INSERT INTO @tbl VALUES ('Santiago'            ,	     'Licey al Medio',	'ST',	'LM');
INSERT INTO @tbl VALUES ('Dajabon'            ,	     'Loma de Cabrera',	'DA',	'LC');
INSERT INTO @tbl VALUES ('Santo Domingo'            ,	     'Los Alcarrizos',	'SD',	'LA');
INSERT INTO @tbl VALUES ('San Cristobal'            ,	     'Los Cacaos',	'CR',	'LC');
INSERT INTO @tbl VALUES ('Puerto Plata'            ,	     'Los Hidalgos',	'PP',	'LH');
INSERT INTO @tbl VALUES ('San Pedro de Macoris'            ,	     'Los Llanos',	'PM',	'LL');
INSERT INTO @tbl VALUES ('Bahoruco'            ,	     'Los Rios',	'BR',	'LR');
INSERT INTO @tbl VALUES ('Puerto Plata'            ,	     'Luperon',	'PP',	'LU');
INSERT INTO @tbl VALUES ('Monsenor Nouel'            ,	     'Maimon',	'MN',	'MA');
INSERT INTO @tbl VALUES ('Valverde'            ,	     'Mao',	'VA',	'MA');
INSERT INTO @tbl VALUES ('Independencia'            ,	     'Mella',	'IN',	'ME');
INSERT INTO @tbl VALUES ('El Seibo'            ,	     'Miches',	'SE',	'MI');
INSERT INTO @tbl VALUES ('Espaillat'            ,	     'Moca',	'ES',	'MC');
INSERT INTO @tbl VALUES ('Santiago Rodriguez'            ,	     'Moncion',	'SR',	'MO');
INSERT INTO @tbl VALUES ('Monte Cristi'            ,	     'Monte Cristi',	'MC',	'SF');
INSERT INTO @tbl VALUES ('Monte Plata'            ,	     'Monte Plata',	'MP',	'MT');
INSERT INTO @tbl VALUES ('Maria Trinidad Sanchez'            ,	     'Nagua',	'MT',	'NA');
INSERT INTO @tbl VALUES ('Bahoruco'            ,	     'Neiba',	'BR',	'NE');
INSERT INTO @tbl VALUES ('Peravia'            ,	     'Nizao',	'PV',	'NI');
INSERT INTO @tbl VALUES ('Pedernales'            ,	     'Oviedo',	'PN',	'OV');
INSERT INTO @tbl VALUES ('Azua'            ,	     'Padre las Casas',	'AZ',	'PL');
INSERT INTO @tbl VALUES ('Barahona'            ,	     'Paraiso',	'BH',	'PA');
INSERT INTO @tbl VALUES ('Dajabon'            ,	     'Partido',	'DA',	'PA');
INSERT INTO @tbl VALUES ('Pedernales'            ,	     'Pedernales',	'PN',	'PE');
INSERT INTO @tbl VALUES ('Santo Domingo'            ,	     'Pedro Brand',	'SD',	'PB');
INSERT INTO @tbl VALUES ('Elias Pina'            ,	     'Pedro Santana',	'EP',	'PS');
INSERT INTO @tbl VALUES ('Monte Cristi'            ,	     'Pepillo Salcedo',	'MC',	'PS');
INSERT INTO @tbl VALUES ('Azua'            ,	     'Peralta',	'AZ',	'PR');
INSERT INTO @tbl VALUES ('Monte Plata'            ,	     'Peralvillo',	'MP',	'ES');
INSERT INTO @tbl VALUES ('Monsenor Nouel'            ,	     'Piedra Blanca',	'MN',	'PB');
INSERT INTO @tbl VALUES ('Duarte'            ,	     'Pimentel',	'DU',	'PI');
INSERT INTO @tbl VALUES ('Barahona'            ,	     'Polo',	'BH',	'PO');
INSERT INTO @tbl VALUES ('Independencia'            ,	     'Postrer Rio',	'IN',	'PR');
INSERT INTO @tbl VALUES ('Azua'            ,	     'Pueblo Viejo',	'AZ',	'PV');
INSERT INTO @tbl VALUES ('Puerto Plata'            ,	     'Puerto Plata',	'PP',	'SF');
INSERT INTO @tbl VALUES ('Santiago'            ,	     'Punal',	'ST',	'PU');
INSERT INTO @tbl VALUES ('San Pedro de Macoris'            ,	     'Quisqueya',	'PM',	'QQ');
INSERT INTO @tbl VALUES ('San Pedro de Macoris'            ,	     'Ramon Santana',	'PM',	'RS');
INSERT INTO @tbl VALUES ('San Jose de Ocoa'            ,	     'Rancho Arriba',	'JO',	'RA');
INSERT INTO @tbl VALUES ('Dajabon'            ,	     'Restauracion',	'DA',	'RE');
INSERT INTO @tbl VALUES ('Maria Trinidad Sanchez'            ,	     'Rio San Juan',	'MT',	'RS');
INSERT INTO @tbl VALUES ('Hato Mayor'            ,	     'Sabana de la Mar',	'HM',	'SM');
INSERT INTO @tbl VALUES ('Monte Plata'            ,	     'Sabana Grande de Boya',	'MP',	'SG');
INSERT INTO @tbl VALUES ('San Cristobal'            ,	     'Sabana Grande de Palenque',	'CR',	'SP');
INSERT INTO @tbl VALUES ('Santiago'            ,	     'Sabana Iglesia',	'ST',	'SI');
INSERT INTO @tbl VALUES ('San Jose de Ocoa'            ,	     'Sabana Larga',	'JO',	'SL');
INSERT INTO @tbl VALUES ('Azua'            ,	     'Sabana Yegua',	'AZ',	'SY');
INSERT INTO @tbl VALUES ('Hermanas Mirabal'            ,	     'Salcedo',	'SC',	'SA');
INSERT INTO @tbl VALUES ('Samana'            ,	     'Samana',	'SM',	'SB');
INSERT INTO @tbl VALUES ('Santo Domingo'            ,	     'San Antonio de Guerra',	'SD',	'GU');
INSERT INTO @tbl VALUES ('San Cristobal'            ,	     'San Cristobal',	'CR',	'SC');
INSERT INTO @tbl VALUES ('Duarte'            ,	     'San Francisco de Macoris',	'DU',	'SF');
INSERT INTO @tbl VALUES ('San Cristobal'            ,	     'San Gregorio de Nigua',	'CR',	'NI');
INSERT INTO @tbl VALUES ('Santiago Rodriguez'            ,	     'San Ignacio de Sabaneta',	'SR',	'SI');
INSERT INTO @tbl VALUES ('Santiago'            ,	     'San Jose de las Matas',	'ST',	'SJ');
INSERT INTO @tbl VALUES ('San Jose de Ocoa'            ,	     'San Jose de Ocoa',	'JO',	'SJ');
INSERT INTO @tbl VALUES ('San Juan'            ,	     'San Juan',	'JU',	'SJ');
INSERT INTO @tbl VALUES ('San Pedro de Macoris'            ,	     'San Pedro de Macoris',	'PM',	'SP');
INSERT INTO @tbl VALUES ('La Altagracia'            ,	     'San Rafael del Yuma',	'AL',	'SR');
INSERT INTO @tbl VALUES ('Santiago'            ,	     'Santiago',	'ST',	'SG');
INSERT INTO @tbl VALUES ('Distrito Nacional'            ,	     'Santo Domingo de Guzman',	'NC',	'DN');
INSERT INTO @tbl VALUES ('Santo Domingo'            ,	     'Santo Domingo Este',	'SD',	'ES');
INSERT INTO @tbl VALUES ('Santo Domingo'            ,	     'Santo Domingo Norte',	'SD',	'DN');
INSERT INTO @tbl VALUES ('Santo Domingo'            ,	     'Santo Domingo Oeste',	'SD',	'OE');
INSERT INTO @tbl VALUES ('Samana'            ,	     'Sanchez',	'SM',	'SA');
INSERT INTO @tbl VALUES ('Puerto Plata'            ,	     'Sosua',	'PP',	'SO');
INSERT INTO @tbl VALUES ('Bahoruco'            ,	     'Tamayo',	'BR',	'TM');
INSERT INTO @tbl VALUES ('Santiago'            ,	     'Tamboril',	'ST',	'TA');
INSERT INTO @tbl VALUES ('Azua'            ,	     'Tabara Arriba',	'AZ',	'VT');
INSERT INTO @tbl VALUES ('Hermanas Mirabal'            ,	     'Tenares',	'SC',	'TE');
INSERT INTO @tbl VALUES ('San Juan'            ,	     'Vallejuelo',	'JU',	'VA');
INSERT INTO @tbl VALUES ('Barahona'            ,	     'Vicente Noble',	'BH',	'VN');
INSERT INTO @tbl VALUES ('San Cristobal'            ,	     'Villa Altagracia',	'CR',	'VA');
INSERT INTO @tbl VALUES ('Santiago'            ,	     'Villa Gonzalez',	'ST',	'VG');
INSERT INTO @tbl VALUES ('La Romana'            ,	     'Villa Hermosa',	'RO',	'VH');
INSERT INTO @tbl VALUES ('Puerto Plata'            ,	     'Villa Isabela',	'PP',	'LI');
INSERT INTO @tbl VALUES ('Bahoruco'            ,	     'Villa Jaragua',	'BR',	'VJ');
INSERT INTO @tbl VALUES ('Santiago Rodriguez'            ,	     'Villa los Almacigos',	'SR',	'LA');
INSERT INTO @tbl VALUES ('Puerto Plata'            ,	     'Villa Montellano',	'PP',	'VM');
INSERT INTO @tbl VALUES ('Duarte'            ,	     'Villa Riva',	'DU',	'VR');
INSERT INTO @tbl VALUES ('Hermanas Mirabal'            ,	     'Villa Tapia',	'SC',	'VT');
INSERT INTO @tbl VALUES ('Monte Cristi'            ,	     'Villa Vasquez',	'MC',	'VV');
INSERT INTO @tbl VALUES ('San Cristobal'            ,	     'Yaguate',	'CR',	'SG');
INSERT INTO @tbl VALUES ('Monte Plata'            ,	     'Yamasa',	'MP',	'YA');

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

