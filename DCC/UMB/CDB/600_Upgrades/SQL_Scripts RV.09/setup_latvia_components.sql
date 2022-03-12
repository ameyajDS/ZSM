
/* ==================================================================================
    	Source File		:	setup_latvia_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Latvia are set-up
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
WHERE	country_nm	=	'Latvia';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Latvia not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Municipality',
		level_2_address_component	=	NULL,
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50) PRIMARY KEY, level_1_cd varchar (5) UNIQUE);

INSERT INTO @tbl VALUES ('Adazi'            ,	     'AD');
INSERT INTO @tbl VALUES ('Aglona'            ,	     'AG');
INSERT INTO @tbl VALUES ('Aizkraukle'            ,	     'AK');
INSERT INTO @tbl VALUES ('Aizpute'            ,	     'AZ');
INSERT INTO @tbl VALUES ('Akniste'            ,	     'AN');
INSERT INTO @tbl VALUES ('Aloja'            ,	     'AJ');
INSERT INTO @tbl VALUES ('Alsunga'            ,	     'AS');
INSERT INTO @tbl VALUES ('Aluksne'            ,	     'AE');
INSERT INTO @tbl VALUES ('Amata'            ,	     'AM');
INSERT INTO @tbl VALUES ('Ape'            ,	     'AP');
INSERT INTO @tbl VALUES ('Auce'            ,	     'AU');
INSERT INTO @tbl VALUES ('Babite'            ,	     'BB');
INSERT INTO @tbl VALUES ('Baldone'            ,	     'BD');
INSERT INTO @tbl VALUES ('Baltinava'            ,	     'BA');
INSERT INTO @tbl VALUES ('Balvi'            ,	     'BV');
INSERT INTO @tbl VALUES ('Bauska'            ,	     'BK');
INSERT INTO @tbl VALUES ('Beverina'            ,	     'BE');
INSERT INTO @tbl VALUES ('Broceni'            ,	     'BR');
INSERT INTO @tbl VALUES ('Burtnieki'            ,	     'BT');
INSERT INTO @tbl VALUES ('Carnikava'            ,	     'CR');
INSERT INTO @tbl VALUES ('Cesis'            ,	     'CS');
INSERT INTO @tbl VALUES ('Cesvaine'            ,	     'CV');
INSERT INTO @tbl VALUES ('Cibla'            ,	     'CI');
INSERT INTO @tbl VALUES ('Dagda'            ,	     'DD');
INSERT INTO @tbl VALUES ('Daugavpils'            ,	     'DP');
INSERT INTO @tbl VALUES ('Dobele'            ,	     'DB');
INSERT INTO @tbl VALUES ('Dundaga'            ,	     'DN');
INSERT INTO @tbl VALUES ('Durbe'            ,	     'DR');
INSERT INTO @tbl VALUES ('Engure'            ,	     'EN');
INSERT INTO @tbl VALUES ('Ergli'            ,	     'ER');
INSERT INTO @tbl VALUES ('Garkalne'            ,	     'GA');
INSERT INTO @tbl VALUES ('Grobina'            ,	     'GR');
INSERT INTO @tbl VALUES ('Gulbene'            ,	     'GU');
INSERT INTO @tbl VALUES ('Iecava'            ,	     'IE');
INSERT INTO @tbl VALUES ('Ikskile'            ,	     'IK');
INSERT INTO @tbl VALUES ('Ilukste'            ,	     'IL');
INSERT INTO @tbl VALUES ('Incukalns'            ,	     'IN');
INSERT INTO @tbl VALUES ('Jaunjelgava'            ,	     'JJ');
INSERT INTO @tbl VALUES ('Jaunpiebalga'            ,	     'JA');
INSERT INTO @tbl VALUES ('Jaunpils'            ,	     'JU');
INSERT INTO @tbl VALUES ('Jekabpils'            ,	     'JB');
INSERT INTO @tbl VALUES ('Jelgava'            ,	     'JL');
INSERT INTO @tbl VALUES ('Jurmala'            ,	     'JM');
INSERT INTO @tbl VALUES ('Kandava'            ,	     'KN');
INSERT INTO @tbl VALUES ('Karsava'            ,	     'KA');
INSERT INTO @tbl VALUES ('Kegums'            ,	     'KG');
INSERT INTO @tbl VALUES ('Kekava'            ,	     'KK');
INSERT INTO @tbl VALUES ('Kocenu'            ,	     'VR');
INSERT INTO @tbl VALUES ('Koknese'            ,	     'KO');
INSERT INTO @tbl VALUES ('Kraslava'            ,	     'KS');
INSERT INTO @tbl VALUES ('Krimulda'            ,	     'KM');
INSERT INTO @tbl VALUES ('Krustpils'            ,	     'KT');
INSERT INTO @tbl VALUES ('Kuldiga'            ,	     'KD');
INSERT INTO @tbl VALUES ('Lielvarde'            ,	     'LL');
INSERT INTO @tbl VALUES ('Liepaja'            ,	     'LJ');
INSERT INTO @tbl VALUES ('Ligatne'            ,	     'LG');
INSERT INTO @tbl VALUES ('Limbazi'            ,	     'LI');
INSERT INTO @tbl VALUES ('Livani'            ,	     'LV');
INSERT INTO @tbl VALUES ('Lubana'            ,	     'LB');
INSERT INTO @tbl VALUES ('Ludza'            ,	     'LZ');
INSERT INTO @tbl VALUES ('Madona'            ,	     'MD');
INSERT INTO @tbl VALUES ('Malpils'            ,	     'ML');
INSERT INTO @tbl VALUES ('Marupe'            ,	     'MR');
INSERT INTO @tbl VALUES ('Mazsalaca'            ,	     'MZ');
INSERT INTO @tbl VALUES ('Mersraga'            ,	     'ME');
INSERT INTO @tbl VALUES ('Naukseni'            ,	     'NA');
INSERT INTO @tbl VALUES ('Nereta'            ,	     'NE');
INSERT INTO @tbl VALUES ('Nica'            ,	     'NI');
INSERT INTO @tbl VALUES ('Ogre'            ,	     'OR');
INSERT INTO @tbl VALUES ('Olaine'            ,	     'OL');
INSERT INTO @tbl VALUES ('Ozolnieki'            ,	     'OZ');
INSERT INTO @tbl VALUES ('Pargauja'            ,	     'PG');
INSERT INTO @tbl VALUES ('Pavilosta'            ,	     'PT');
INSERT INTO @tbl VALUES ('Plavinas'            ,	     'PL');
INSERT INTO @tbl VALUES ('Preili'            ,	     'PI');
INSERT INTO @tbl VALUES ('Priekule'            ,	     'PK');
INSERT INTO @tbl VALUES ('Priekuli'            ,	     'PU');
INSERT INTO @tbl VALUES ('Rauna'            ,	     'RN');
INSERT INTO @tbl VALUES ('Rezekne'            ,	     'RE');
INSERT INTO @tbl VALUES ('Riebini'            ,	     'RB');
INSERT INTO @tbl VALUES ('Riga'            ,	     'RA');
INSERT INTO @tbl VALUES ('Roja'            ,	     'RR');
INSERT INTO @tbl VALUES ('Ropazi'            ,	     'RP');
INSERT INTO @tbl VALUES ('Rucava'            ,	     'RC');
INSERT INTO @tbl VALUES ('Rugaji'            ,	     'RJ');
INSERT INTO @tbl VALUES ('Rujiena'            ,	     'RU');
INSERT INTO @tbl VALUES ('Rundale'            ,	     'RD');
INSERT INTO @tbl VALUES ('Sala'            ,	     'SL');
INSERT INTO @tbl VALUES ('Salacgriva'            ,	     'SC');
INSERT INTO @tbl VALUES ('Salaspils'            ,	     'SS');
INSERT INTO @tbl VALUES ('Saldus'            ,	     'SD');
INSERT INTO @tbl VALUES ('Saulkrasti'            ,	     'SU');
INSERT INTO @tbl VALUES ('Seja'            ,	     'SE');
INSERT INTO @tbl VALUES ('Sigulda'            ,	     'SI');
INSERT INTO @tbl VALUES ('Skriveri'            ,	     'SR');
INSERT INTO @tbl VALUES ('Skrunda'            ,	     'SK');
INSERT INTO @tbl VALUES ('Smiltene'            ,	     'SM');
INSERT INTO @tbl VALUES ('Stopini'            ,	     'SP');
INSERT INTO @tbl VALUES ('Strenci'            ,	     'ST');
INSERT INTO @tbl VALUES ('Talsi'            ,	     'TL');
INSERT INTO @tbl VALUES ('Tervete'            ,	     'TE');
INSERT INTO @tbl VALUES ('Tukums'            ,	     'TK');
INSERT INTO @tbl VALUES ('Vainode'            ,	     'VD');
INSERT INTO @tbl VALUES ('Valka'            ,	     'VA');
INSERT INTO @tbl VALUES ('Valmiera'            ,	     'VE');
INSERT INTO @tbl VALUES ('Varaklani'            ,	     'VX');
INSERT INTO @tbl VALUES ('Varkava'            ,	     'VV');
INSERT INTO @tbl VALUES ('Vecpiebalga'            ,	     'VB');
INSERT INTO @tbl VALUES ('Vecumnieki'            ,	     'VC');
INSERT INTO @tbl VALUES ('Ventspils'            ,	     'VN');
INSERT INTO @tbl VALUES ('Viesite'            ,	     'VT');
INSERT INTO @tbl VALUES ('Vilaka'            ,	     'VL');
INSERT INTO @tbl VALUES ('Vilani'            ,	     'VI');
INSERT INTO @tbl VALUES ('Zilupe'            ,	     'ZI');


INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) 
	SELECT	@country_id, level_1_nm, level_1_cd
	FROM	@tbl;

-- ======================================================================

UPDATE	level_1_address_components
	SET	is_authentic	=	1
WHERE	country_id	=	@country_id;

-- ======================================================================
