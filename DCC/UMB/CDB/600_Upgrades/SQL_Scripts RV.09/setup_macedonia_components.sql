
/* ==================================================================================
    	Source File		:	setup_macedonia_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Macedonia are set-up
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
WHERE	country_nm	=	'Macedonia';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Macedonia not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Municipality',
		level_2_address_component	=	NULL,
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50) PRIMARY KEY, level_1_cd varchar (5) UNIQUE);

INSERT INTO @tbl VALUES ('Aerodrom *'            ,	     'AD');
INSERT INTO @tbl VALUES ('Aracinovo'            ,	     'AR');
INSERT INTO @tbl VALUES ('Berovo'            ,	     'BR');
INSERT INTO @tbl VALUES ('Bitola'            ,	     'TL');
INSERT INTO @tbl VALUES ('Bogdanci'            ,	     'BG');
INSERT INTO @tbl VALUES ('Bogovinje'            ,	     'VJ');
INSERT INTO @tbl VALUES ('Bosilovo'            ,	     'BS');
INSERT INTO @tbl VALUES ('Brvenica'            ,	     'BN');
INSERT INTO @tbl VALUES ('Butel *'            ,	     'BU');
INSERT INTO @tbl VALUES ('Centar *'            ,	     'CE');
INSERT INTO @tbl VALUES ('Centar Zupa'            ,	     'CZ');
INSERT INTO @tbl VALUES ('Cair *'            ,	     'CI');
INSERT INTO @tbl VALUES ('Caska'            ,	     'CA');
INSERT INTO @tbl VALUES ('Cesinovo-Oblesevo'            ,	     'CH');
INSERT INTO @tbl VALUES ('Cucer Sandevo'            ,	     'CS');
INSERT INTO @tbl VALUES ('Debar'            ,	     'DB');
INSERT INTO @tbl VALUES ('Debartsa'            ,	     'DA');
INSERT INTO @tbl VALUES ('Delcevo'            ,	     'DL');
INSERT INTO @tbl VALUES ('Demir Hisar'            ,	     'DM');
INSERT INTO @tbl VALUES ('Demir Kapija'            ,	     'DK');
INSERT INTO @tbl VALUES ('Dojran'            ,	     'SD');
INSERT INTO @tbl VALUES ('Dolneni'            ,	     'DE');
INSERT INTO @tbl VALUES ('Drugovo'            ,	     'DR');
INSERT INTO @tbl VALUES ('Gazi Baba *'            ,	     'GB');
INSERT INTO @tbl VALUES ('Gevgelija'            ,	     'GV');
INSERT INTO @tbl VALUES ('Gjorce Petrov *'            ,	     'GP');
INSERT INTO @tbl VALUES ('Gostivar'            ,	     'GT');
INSERT INTO @tbl VALUES ('Gradsko'            ,	     'GR');
INSERT INTO @tbl VALUES ('Ilinden'            ,	     'IL');
INSERT INTO @tbl VALUES ('Jegunovtse'            ,	     'JG');
INSERT INTO @tbl VALUES ('Karbinci'            ,	     'KB');
INSERT INTO @tbl VALUES ('Karpos *'            ,	     'KX');
INSERT INTO @tbl VALUES ('Kavadartsi'            ,	     'AV');
INSERT INTO @tbl VALUES ('Kicevo'            ,	     'KH');
INSERT INTO @tbl VALUES ('Kisela Voda *'            ,	     'VD');
INSERT INTO @tbl VALUES ('Kocani'            ,	     'OC');
INSERT INTO @tbl VALUES ('Konce'            ,	     'KN');
INSERT INTO @tbl VALUES ('Kratovo'            ,	     'KY');
INSERT INTO @tbl VALUES ('Kriva Palanka'            ,	     'KZ');
INSERT INTO @tbl VALUES ('Krivogastani'            ,	     'KG');
INSERT INTO @tbl VALUES ('Krusevo'            ,	     'KS');
INSERT INTO @tbl VALUES ('Kumanovo'            ,	     'UM');
INSERT INTO @tbl VALUES ('Lipkovo'            ,	     'LI');
INSERT INTO @tbl VALUES ('Lozovo'            ,	     'LO');
INSERT INTO @tbl VALUES ('Makedonska Kamenica'            ,	     'MK');
INSERT INTO @tbl VALUES ('Makedonski Brod'            ,	     'MD');
INSERT INTO @tbl VALUES ('Mavrovo and Rostusa'            ,	     'MR');
INSERT INTO @tbl VALUES ('Mogila'            ,	     'MG');
INSERT INTO @tbl VALUES ('Negotino'            ,	     'NG');
INSERT INTO @tbl VALUES ('Novatsi'            ,	     'NV');
INSERT INTO @tbl VALUES ('Novo Selo'            ,	     'NS');
INSERT INTO @tbl VALUES ('Ohrid'            ,	     'OD');
INSERT INTO @tbl VALUES ('Oslomej'            ,	     'OS');
INSERT INTO @tbl VALUES ('Pehcevo'            ,	     'PH');
INSERT INTO @tbl VALUES ('Petrovec'            ,	     'PE');
INSERT INTO @tbl VALUES ('Plasnica'            ,	     'PN');
INSERT INTO @tbl VALUES ('Prilep'            ,	     'PP');
INSERT INTO @tbl VALUES ('Probistip'            ,	     'PT');
INSERT INTO @tbl VALUES ('Radovis'            ,	     'RV');
INSERT INTO @tbl VALUES ('Rankovce'            ,	     'RN');
INSERT INTO @tbl VALUES ('Resen'            ,	     'RE');
INSERT INTO @tbl VALUES ('Rosoman'            ,	     'RM');
INSERT INTO @tbl VALUES ('Saraj *'            ,	     'AJ');
INSERT INTO @tbl VALUES ('Stip'            ,	     'ST');
INSERT INTO @tbl VALUES ('Suto Orizari *'            ,	     'SO');
INSERT INTO @tbl VALUES ('Sopiste'            ,	     'SS');
INSERT INTO @tbl VALUES ('Staro Nagoricane'            ,	     'NA');
INSERT INTO @tbl VALUES ('Struga'            ,	     'UG');
INSERT INTO @tbl VALUES ('Strumitsa'            ,	     'RU');
INSERT INTO @tbl VALUES ('Studenicani'            ,	     'SU');
INSERT INTO @tbl VALUES ('Sveti Nikole'            ,	     'SL');
INSERT INTO @tbl VALUES ('Tearce'            ,	     'TR');
INSERT INTO @tbl VALUES ('Tetovo'            ,	     'ET');
INSERT INTO @tbl VALUES ('Valandovo'            ,	     'VA');
INSERT INTO @tbl VALUES ('Vasilevo'            ,	     'VL');
INSERT INTO @tbl VALUES ('Veles'            ,	     'VE');
INSERT INTO @tbl VALUES ('Vevcani'            ,	     'VV');
INSERT INTO @tbl VALUES ('Vinitsa'            ,	     'NI');
INSERT INTO @tbl VALUES ('Vranestica'            ,	     'VC');
INSERT INTO @tbl VALUES ('Vrapciste'            ,	     'VH');
INSERT INTO @tbl VALUES ('Zajas'            ,	     'ZA');
INSERT INTO @tbl VALUES ('Zelenikovo'            ,	     'ZK');
INSERT INTO @tbl VALUES ('Zelino'            ,	     'ZE');
INSERT INTO @tbl VALUES ('Zrnovci'            ,	     'ZR');


INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) 
	SELECT	@country_id, level_1_nm, level_1_cd
	FROM	@tbl;

-- ======================================================================

UPDATE	level_1_address_components
	SET	is_authentic	=	1
WHERE	country_id	=	@country_id;

-- ======================================================================
