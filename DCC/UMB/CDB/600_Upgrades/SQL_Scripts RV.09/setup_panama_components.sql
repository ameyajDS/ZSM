
/* ==================================================================================
    	Source File		:	setup_panama_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	12-10-2014
	Module ID		:	CDB
	Last updated		:	12-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Panama are set-up
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
WHERE	country_nm	=	'Panama';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Panama not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Province',
		level_2_address_component	=	'District',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Cocle'            ,	     'Aguadulce',	'CC',	'AG');
INSERT INTO @tbl VALUES ('Chiriqui'            ,	     'Alanje',	'CH',	'AL');
INSERT INTO @tbl VALUES ('Cocle'            ,	     'Anton',	'CC',	'AN');
INSERT INTO @tbl VALUES ('Panama Oeste'            ,	     'Arraijan',	'PO',	'AR');
INSERT INTO @tbl VALUES ('Veraguas'            ,	     'Atalaya',	'VR',	'AT');
INSERT INTO @tbl VALUES ('Panama'            ,	     'Balboa',	'PM',	'BB');
INSERT INTO @tbl VALUES ('Chiriqui'            ,	     'Baru',	'CH',	'BR');
INSERT INTO @tbl VALUES ('Ngabe Bugle'            ,	     'Besiko',	'NB',	'BK');
INSERT INTO @tbl VALUES ('Bocas del Toro'            ,	     'Bocas del Toro',	'BC',	'BT');
INSERT INTO @tbl VALUES ('Chiriqui'            ,	     'Boqueron',	'CH',	'BN');
INSERT INTO @tbl VALUES ('Chiriqui'            ,	     'Boquete',	'CH',	'BQ');
INSERT INTO @tbl VALUES ('Chiriqui'            ,	     'Bugaba',	'CH',	'BG');
INSERT INTO @tbl VALUES ('Veraguas'            ,	     'Calobre',	'VR',	'CB');
INSERT INTO @tbl VALUES ('Veraguas'            ,	     'Canazas',	'VR',	'CZ');
INSERT INTO @tbl VALUES ('Panama Oeste'            ,	     'Capira',	'PO',	'CA');
INSERT INTO @tbl VALUES ('Embera'            ,	     'Cemaco',	'EM',	'CE');
INSERT INTO @tbl VALUES ('Colon'            ,	     'Chagres',	'CL',	'CR');
INSERT INTO @tbl VALUES ('Panama Oeste'            ,	     'Chame',	'PO',	'CM');
INSERT INTO @tbl VALUES ('Bocas del Toro'            ,	     'Changuinola',	'BC',	'CH');
INSERT INTO @tbl VALUES ('Darien'            ,	     'Chepigana',	'DA',	'CP');
INSERT INTO @tbl VALUES ('Panama'            ,	     'Chepo',	'PM',	'CO');
INSERT INTO @tbl VALUES ('Panama'            ,	     'Chiman',	'PM',	'CN');
INSERT INTO @tbl VALUES ('Bocas del Toro'            ,	     'Chiriqui Grande',	'BC',	'CG');
INSERT INTO @tbl VALUES ('Herrera'            ,	     'Chitre',	'HE',	'CT');
INSERT INTO @tbl VALUES ('Colon'            ,	     'Colon',	'CL',	'CL');
INSERT INTO @tbl VALUES ('Chiriqui'            ,	     'David',	'CH',	'DA');
INSERT INTO @tbl VALUES ('Chiriqui'            ,	     'Dolega',	'CH',	'DL');
INSERT INTO @tbl VALUES ('Colon'            ,	     'Donoso',	'CL',	'DN');
INSERT INTO @tbl VALUES ('Chiriqui'            ,	     'Gualaca',	'CH',	'GL');
INSERT INTO @tbl VALUES ('Los Santos'            ,	     'Guarare',	'LS',	'GR');
INSERT INTO @tbl VALUES ('Ngabe Bugle'            ,	     'Kankintu',	'NB',	'KK');
INSERT INTO @tbl VALUES ('Kuna Yala'            ,	     'Kuna Yala',	'SB',	'KY');
INSERT INTO @tbl VALUES ('Ngabe Bugle'            ,	     'Kusapin',	'NB',	'KS');
INSERT INTO @tbl VALUES ('Panama Oeste'            ,	     'La Chorrera',	'PO',	'LC');
INSERT INTO @tbl VALUES ('Veraguas'            ,	     'La Mesa',	'VR',	'LM');
INSERT INTO @tbl VALUES ('Cocle'            ,	     'La Pintada',	'CC',	'LP');
INSERT INTO @tbl VALUES ('Herrera'            ,	     'Las Minas',	'HE',	'LN');
INSERT INTO @tbl VALUES ('Veraguas'            ,	     'Las Palmas',	'VR',	'LA');
INSERT INTO @tbl VALUES ('Los Santos'            ,	     'Las Tablas',	'LS',	'LT');
INSERT INTO @tbl VALUES ('Herrera'            ,	     'Los Pozos',	'HE',	'LZ');
INSERT INTO @tbl VALUES ('Los Santos'            ,	     'Los Santos',	'LS',	'LS');
INSERT INTO @tbl VALUES ('Los Santos'            ,	     'Macaracas',	'LS',	'MC');
INSERT INTO @tbl VALUES ('Veraguas'            ,	     'Mariato',	'VR',	'MA');
INSERT INTO @tbl VALUES ('Ngabe Bugle'            ,	     'Mirono',	'NB',	'MR');
INSERT INTO @tbl VALUES ('Veraguas'            ,	     'Montijo',	'VR',	'MJ');
INSERT INTO @tbl VALUES ('Ngabe Bugle'            ,	     'Muna',	'NB',	'MU');
INSERT INTO @tbl VALUES ('Cocle'            ,	     'Nata',	'CC',	'NT');
INSERT INTO @tbl VALUES ('Ngabe Bugle'            ,	     'Nole Duima',	'NB',	'ND');
INSERT INTO @tbl VALUES ('Ngabe Bugle'            ,	     'Nurum',	'NB',	'NR');
INSERT INTO @tbl VALUES ('Herrera'            ,	     'Ocu',	'HE',	'OC');
INSERT INTO @tbl VALUES ('Cocle'            ,	     'Ola',	'CC',	'OL');
INSERT INTO @tbl VALUES ('Panama'            ,	     'Panama',	'PM',	'PA');
INSERT INTO @tbl VALUES ('Herrera'            ,	     'Parita',	'HE',	'PR');
INSERT INTO @tbl VALUES ('Los Santos'            ,	     'Pedasi',	'LS',	'PD');
INSERT INTO @tbl VALUES ('Cocle'            ,	     'Penonome',	'CC',	'PN');
INSERT INTO @tbl VALUES ('Herrera'            ,	     'Pese',	'HE',	'PS');
INSERT INTO @tbl VALUES ('Darien'            ,	     'Pinogana',	'DA',	'PG');
INSERT INTO @tbl VALUES ('Los Santos'            ,	     'Pocri',	'LS',	'PC');
INSERT INTO @tbl VALUES ('Colon'            ,	     'Portobelo',	'CL',	'PB');
INSERT INTO @tbl VALUES ('Chiriqui'            ,	     'Remedios',	'CH',	'RM');
INSERT INTO @tbl VALUES ('Chiriqui'            ,	     'Renacimiento',	'CH',	'RN');
INSERT INTO @tbl VALUES ('Veraguas'            ,	     'Rio de Jesus',	'VR',	'RJ');
INSERT INTO @tbl VALUES ('Embera'            ,	     'Sambu',	'EM',	'SB');
INSERT INTO @tbl VALUES ('Panama Oeste'            ,	     'San Carlos',	'PO',	'SC');
INSERT INTO @tbl VALUES ('Chiriqui'            ,	     'San Felix',	'CH',	'SX');
INSERT INTO @tbl VALUES ('Veraguas'            ,	     'San Francisco',	'VR',	'SF');
INSERT INTO @tbl VALUES ('Chiriqui'            ,	     'San Lorenzo',	'CH',	'SL');
INSERT INTO @tbl VALUES ('Panama'            ,	     'San Miguelito',	'PM',	'SM');
INSERT INTO @tbl VALUES ('Veraguas'            ,	     'Santa Fe',	'VR',	'SE');
INSERT INTO @tbl VALUES ('Colon'            ,	     'Santa Isabel',	'CL',	'SI');
INSERT INTO @tbl VALUES ('Herrera'            ,	     'Santa Maria',	'HE',	'ST');
INSERT INTO @tbl VALUES ('Veraguas'            ,	     'Santiago',	'VR',	'SG');
INSERT INTO @tbl VALUES ('Veraguas'            ,	     'Sona',	'VR',	'SO');
INSERT INTO @tbl VALUES ('Panama'            ,	     'Taboga',	'PM',	'TB');
INSERT INTO @tbl VALUES ('Chiriqui'            ,	     'Tole',	'CH',	'TL');
INSERT INTO @tbl VALUES ('Los Santos'            ,	     'Tonosi',	'LS',	'TN');

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

