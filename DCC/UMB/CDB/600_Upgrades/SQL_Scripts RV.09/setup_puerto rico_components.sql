
/* ==================================================================================
    	Source File		:	setup_puerto rico_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Puerto Rico are set-up
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
WHERE	country_nm	=	'Puerto Rico';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Puerto Rico not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Municipality',
		level_2_address_component	=	NULL,
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50) PRIMARY KEY, level_1_cd varchar (5) UNIQUE);

INSERT INTO @tbl VALUES ('Adjuntas'            ,	     'AJ');
INSERT INTO @tbl VALUES ('Aguada'            ,	     'AD');
INSERT INTO @tbl VALUES ('Aguadilla'            ,	     'AL');
INSERT INTO @tbl VALUES ('Aguas Buenas'            ,	     'AB');
INSERT INTO @tbl VALUES ('Aibonito'            ,	     'AI');
INSERT INTO @tbl VALUES ('Anasco'            ,	     'AN');
INSERT INTO @tbl VALUES ('Arecibo'            ,	     'AC');
INSERT INTO @tbl VALUES ('Arroyo'            ,	     'AR');
INSERT INTO @tbl VALUES ('Barceloneta'            ,	     'BC');
INSERT INTO @tbl VALUES ('Barranquitas'            ,	     'BQ');
INSERT INTO @tbl VALUES ('Bayamon'            ,	     'BY');
INSERT INTO @tbl VALUES ('Cabo Rojo'            ,	     'CR');
INSERT INTO @tbl VALUES ('Caguas'            ,	     'CG');
INSERT INTO @tbl VALUES ('Camuy'            ,	     'CA');
INSERT INTO @tbl VALUES ('Canovanas'            ,	     'CV');
INSERT INTO @tbl VALUES ('Carolina'            ,	     'CN');
INSERT INTO @tbl VALUES ('Catano'            ,	     'CT');
INSERT INTO @tbl VALUES ('Cayey'            ,	     'CY');
INSERT INTO @tbl VALUES ('Ceiba'            ,	     'CB');
INSERT INTO @tbl VALUES ('Ciales'            ,	     'CL');
INSERT INTO @tbl VALUES ('Cidra'            ,	     'CD');
INSERT INTO @tbl VALUES ('Coamo'            ,	     'CO');
INSERT INTO @tbl VALUES ('Comerio'            ,	     'CM');
INSERT INTO @tbl VALUES ('Corozal'            ,	     'CZ');
INSERT INTO @tbl VALUES ('Culebra'            ,	     'CU');
INSERT INTO @tbl VALUES ('Dorado'            ,	     'DO');
INSERT INTO @tbl VALUES ('Fajardo'            ,	     'FJ');
INSERT INTO @tbl VALUES ('Florida'            ,	     'FL');
INSERT INTO @tbl VALUES ('Guanica'            ,	     'GC');
INSERT INTO @tbl VALUES ('Guayama'            ,	     'GM');
INSERT INTO @tbl VALUES ('Guayanilla'            ,	     'GL');
INSERT INTO @tbl VALUES ('Guaynabo'            ,	     'GB');
INSERT INTO @tbl VALUES ('Gurabo'            ,	     'GR');
INSERT INTO @tbl VALUES ('Hatillo'            ,	     'HA');
INSERT INTO @tbl VALUES ('Hormigueros'            ,	     'HO');
INSERT INTO @tbl VALUES ('Humacao'            ,	     'HU');
INSERT INTO @tbl VALUES ('Isabela'            ,	     'IS');
INSERT INTO @tbl VALUES ('Jayuya'            ,	     'JY');
INSERT INTO @tbl VALUES ('Juana Diaz'            ,	     'JD');
INSERT INTO @tbl VALUES ('Juncos'            ,	     'JC');
INSERT INTO @tbl VALUES ('Lajas'            ,	     'LJ');
INSERT INTO @tbl VALUES ('Lares'            ,	     'LR');
INSERT INTO @tbl VALUES ('Las Marias'            ,	     'LM');
INSERT INTO @tbl VALUES ('Las Piedras'            ,	     'LP');
INSERT INTO @tbl VALUES ('Loiza'            ,	     'LZ');
INSERT INTO @tbl VALUES ('Luquillo'            ,	     'LQ');
INSERT INTO @tbl VALUES ('Manati'            ,	     'MT');
INSERT INTO @tbl VALUES ('Maricao'            ,	     'MR');
INSERT INTO @tbl VALUES ('Maunabo'            ,	     'MB');
INSERT INTO @tbl VALUES ('Mayaguez'            ,	     'MG');
INSERT INTO @tbl VALUES ('Moca'            ,	     'MC');
INSERT INTO @tbl VALUES ('Morovis'            ,	     'MV');
INSERT INTO @tbl VALUES ('Naguabo'            ,	     'NG');
INSERT INTO @tbl VALUES ('Naranjito'            ,	     'NR');
INSERT INTO @tbl VALUES ('Orocovis'            ,	     'OR');
INSERT INTO @tbl VALUES ('Patillas'            ,	     'PT');
INSERT INTO @tbl VALUES ('Penuelas'            ,	     'PN');
INSERT INTO @tbl VALUES ('Ponce'            ,	     'PO');
INSERT INTO @tbl VALUES ('Quebradillas'            ,	     'QB');
INSERT INTO @tbl VALUES ('Rincon'            ,	     'RC');
INSERT INTO @tbl VALUES ('Rio Grande'            ,	     'RG');
INSERT INTO @tbl VALUES ('Sabana Grande'            ,	     'SB');
INSERT INTO @tbl VALUES ('Salinas'            ,	     'SA');
INSERT INTO @tbl VALUES ('San German'            ,	     'SG');
INSERT INTO @tbl VALUES ('San Juan'            ,	     'SJ');
INSERT INTO @tbl VALUES ('San Lorenzo'            ,	     'SL');
INSERT INTO @tbl VALUES ('San Sebastian'            ,	     'SS');
INSERT INTO @tbl VALUES ('Santa Isabel'            ,	     'SI');
INSERT INTO @tbl VALUES ('Toa Alta'            ,	     'TA');
INSERT INTO @tbl VALUES ('Toa Baja'            ,	     'TB');
INSERT INTO @tbl VALUES ('Trujillo Alto'            ,	     'TJ');
INSERT INTO @tbl VALUES ('Utuado'            ,	     'UT');
INSERT INTO @tbl VALUES ('Vega Alta'            ,	     'VA');
INSERT INTO @tbl VALUES ('Vega Baja'            ,	     'VB');
INSERT INTO @tbl VALUES ('Vieques'            ,	     'VQ');
INSERT INTO @tbl VALUES ('Villalba'            ,	     'VL');
INSERT INTO @tbl VALUES ('Yabucoa'            ,	     'YB');
INSERT INTO @tbl VALUES ('Yauco'            ,	     'YU');


INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) 
	SELECT	@country_id, level_1_nm, level_1_cd
	FROM	@tbl;

-- ======================================================================

UPDATE	level_1_address_components
	SET	is_authentic	=	1
WHERE	country_id	=	@country_id;

-- ======================================================================
