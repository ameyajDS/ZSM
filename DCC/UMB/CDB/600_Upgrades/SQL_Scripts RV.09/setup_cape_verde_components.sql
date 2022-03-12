
/* ==================================================================================
    	Source File		:	setup_cape_verde_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Cape_Verde are set-up
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
WHERE	country_nm	=	'Cape Verde';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Cape Verde not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'County',
		level_2_address_component	=	'Parish',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Mosteiros'            ,	     'Nossa Senhora da Ajuda',	'MO',	'AJ');
INSERT INTO @tbl VALUES ('Sao Filipe'            ,	     'Nossa Senhora da Conceicao',	'FP',	'CC');
INSERT INTO @tbl VALUES ('Praia'            ,	     'Nossa Senhora da Graca',	'PC',	'GR');
INSERT INTO @tbl VALUES ('Ribeira Brava'            ,	     'Nossa Senhora da Lapa',	'RB',	'LP');
INSERT INTO @tbl VALUES ('Sao Domingos'            ,	     'Nossa Senhora da Luz',	'SD',	'LD');
INSERT INTO @tbl VALUES ('Maio'            ,	     'Nossa Senhora da Luz',	'MA',	'LM');
INSERT INTO @tbl VALUES ('Sao Vicente'            ,	     'Nossa Senhora da Luz',	'SV',	'LV');
INSERT INTO @tbl VALUES ('Sal'            ,	     'Nossa Senhora das Dores',	'SL',	'DR');
INSERT INTO @tbl VALUES ('Ribeira Grande'            ,	     'Nossa Senhora do Livramento',	'RG',	'LT');
INSERT INTO @tbl VALUES ('Brava'            ,	     'Nossa Senhora do Monte',	'BR',	'MO');
INSERT INTO @tbl VALUES ('Ribeira Brava'            ,	     'Nossa Senhora do Rosario',	'RB',	'RN');
INSERT INTO @tbl VALUES ('Ribeira Grande'            ,	     'Nossa Senhora do Rosario',	'RG',	'RR');
INSERT INTO @tbl VALUES ('Sao Filipe'            ,	     'Santa Catarina',	'FP',	'CF');
INSERT INTO @tbl VALUES ('Santa Catarina'            ,	     'Santa Catarina',	'CT',	'CT');
INSERT INTO @tbl VALUES ('Boa Vista'            ,	     'Santa Isabel',	'BV',	'IS');
INSERT INTO @tbl VALUES ('Santa Cruz'            ,	     'Santiago Maior',	'CZ',	'IA');
INSERT INTO @tbl VALUES ('Ribeira Grande de Santiago'            ,	     'Santissimo Nome de Jesus',	'RS',	'NJ');
INSERT INTO @tbl VALUES ('Tarrafal'            ,	     'Santo Amaro Abade',	'TF',	'AA');
INSERT INTO @tbl VALUES ('Porto Novo'            ,	     'Santo Andre',	'PN',	'AN');
INSERT INTO @tbl VALUES ('Paul'            ,	     'Santo Antonio das Pombas',	'PA',	'AP');
INSERT INTO @tbl VALUES ('Ribeira Grande'            ,	     'Santo Crucifixo',	'RG',	'CX');
INSERT INTO @tbl VALUES ('Tarrafal de Sao Nicolau'            ,	     'Sao Francisco',	'TS',	'SF');
INSERT INTO @tbl VALUES ('Ribeira Grande de Santiago'            ,	     'Sao Joao Baptista',	'RS',	'BI');
INSERT INTO @tbl VALUES ('Porto Novo'            ,	     'Sao Joao Baptista',	'PN',	'BN');
INSERT INTO @tbl VALUES ('Brava'            ,	     'Sao Joao Baptista',	'BR',	'BR');
INSERT INTO @tbl VALUES ('Boa Vista'            ,	     'Sao Joao Baptista',	'BV',	'BV');
INSERT INTO @tbl VALUES ('Sao Filipe'            ,	     'Sao Lourenco',	'FP',	'LR');
INSERT INTO @tbl VALUES ('Sao Lourenco dos Orgaos'            ,	     'Sao Lourenco dos Orgaos',	'LO',	'LO');
INSERT INTO @tbl VALUES ('Sao Miguel'            ,	     'Sao Miguel Arcanjo',	'SM',	'MA');
INSERT INTO @tbl VALUES ('Sao Domingos'            ,	     'Sao Nicolau Tolentino',	'SD',	'NT');
INSERT INTO @tbl VALUES ('Ribeira Grande'            ,	     'Sao Pedro Apostolo',	'RG',	'PA');
INSERT INTO @tbl VALUES ('Sao Salvador do Mundo'            ,	     'Sao Salvador do Mundo',	'SS',	'SM');

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

