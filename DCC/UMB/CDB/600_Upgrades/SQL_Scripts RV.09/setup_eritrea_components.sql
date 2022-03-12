
/* ==================================================================================
    	Source File		:	setup_eritrea_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Eritrea are set-up
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
WHERE	country_nm	=	'Eritrea';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Eritrea not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Region',
		level_2_address_component	=	'Subregion',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Debub'            ,	     'Adi Keih',	'DU',	'AK');
INSERT INTO @tbl VALUES ('Debub'            ,	     'Adi Qwala',	'DU',	'AQ');
INSERT INTO @tbl VALUES ('Anseba'            ,	     'Adi Teklezan',	'AN',	'AT');
INSERT INTO @tbl VALUES ('Semenawi Keyih Bahri'            ,	     'Adobha',	'SK',	'AD');
INSERT INTO @tbl VALUES ('Semenawi Keyih Bahri'            ,	     'Af''abet',	'SK',	'AF');
INSERT INTO @tbl VALUES ('Gash Barka'            ,	     'Akurdet City',	'GB',	'AC');
INSERT INTO @tbl VALUES ('Debubawi Keyih Bahri'            ,	     'Are''eta',	'DK',	'AR');
INSERT INTO @tbl VALUES ('Debub'            ,	     'Areza',	'DU',	'AR');
INSERT INTO @tbl VALUES ('Anseba'            ,	     'Asmat',	'AN',	'AS');
INSERT INTO @tbl VALUES ('Debubawi Keyih Bahri'            ,	     'Assab City',	'DK',	'AC');
INSERT INTO @tbl VALUES ('Gash Barka'            ,	     'Barentu City',	'GB',	'BC');
INSERT INTO @tbl VALUES ('Maekel'            ,	     'Berikh',	'MA',	'BE');
INSERT INTO @tbl VALUES ('Debubawi Keyih Bahri'            ,	     'Central Southern Red Sea',	'DK',	'CS');
INSERT INTO @tbl VALUES ('Semenawi Keyih Bahri'            ,	     'Dahlak',	'SK',	'DA');
INSERT INTO @tbl VALUES ('Debub'            ,	     'Dbarwa',	'DU',	'DB');
INSERT INTO @tbl VALUES ('Debub'            ,	     'Dekemhare',	'DU',	'DE');
INSERT INTO @tbl VALUES ('Gash Barka'            ,	     'Dghe',	'GB',	'DG');
INSERT INTO @tbl VALUES ('Anseba'            ,	     'Elabered',	'AN',	'EL');
INSERT INTO @tbl VALUES ('Debub'            ,	     'Emni Haili',	'DU',	'EH');
INSERT INTO @tbl VALUES ('Semenawi Keyih Bahri'            ,	     'Foro',	'SK',	'FO');
INSERT INTO @tbl VALUES ('Gash Barka'            ,	     'Forto',	'GB',	'FO');
INSERT INTO @tbl VALUES ('Maekel'            ,	     'Ghala Nefhi',	'MA',	'GN');
INSERT INTO @tbl VALUES ('Semenawi Keyih Bahri'            ,	     'Ghela''elo',	'SK',	'GL');
INSERT INTO @tbl VALUES ('Anseba'            ,	     'Gheleb',	'AN',	'GH');
INSERT INTO @tbl VALUES ('Semenawi Keyih Bahri'            ,	     'Ghinda''e',	'SK',	'GD');
INSERT INTO @tbl VALUES ('Gash Barka'            ,	     'Gogne',	'GB',	'GG');
INSERT INTO @tbl VALUES ('Gash Barka'            ,	     'Goluj',	'GB',	'GL');
INSERT INTO @tbl VALUES ('Anseba'            ,	     'Habero',	'AN',	'HB');
INSERT INTO @tbl VALUES ('Anseba'            ,	     'Hagaz',	'AN',	'HG');
INSERT INTO @tbl VALUES ('Anseba'            ,	     'Halhal',	'AN',	'HH');
INSERT INTO @tbl VALUES ('Anseba'            ,	     'Hamelmalo',	'AN',	'HM');
INSERT INTO @tbl VALUES ('Gash Barka'            ,	     'Haykota',	'GB',	'HA');
INSERT INTO @tbl VALUES ('Semenawi Keyih Bahri'            ,	     'Karura',	'SK',	'KA');
INSERT INTO @tbl VALUES ('Anseba'            ,	     'Keren City',	'AN',	'KC');
INSERT INTO @tbl VALUES ('Anseba'            ,	     'Kerkebet',	'AN',	'KE');
INSERT INTO @tbl VALUES ('Gash Barka'            ,	     'Logo Anseba',	'GB',	'LA');
INSERT INTO @tbl VALUES ('Debub'            ,	     'Mai-Aini',	'DU',	'MI');
INSERT INTO @tbl VALUES ('Debub'            ,	     'Mai-Mne',	'DU',	'MM');
INSERT INTO @tbl VALUES ('Semenawi Keyih Bahri'            ,	     'Massawa',	'SK',	'MA');
INSERT INTO @tbl VALUES ('Debub'            ,	     'Mendefera',	'DU',	'MF');
INSERT INTO @tbl VALUES ('Gash Barka'            ,	     'Mogolo',	'GB',	'MG');
INSERT INTO @tbl VALUES ('Gash Barka'            ,	     'Molqi',	'GB',	'MQ');
INSERT INTO @tbl VALUES ('Semenawi Keyih Bahri'            ,	     'Nakfa',	'SK',	'NA');
INSERT INTO @tbl VALUES ('Maekel'            ,	     'North Eastern Asmara',	'MA',	'NE');
INSERT INTO @tbl VALUES ('Maekel'            ,	     'North Western Asmara',	'MA',	'NW');
INSERT INTO @tbl VALUES ('Debub'            ,	     'Segeneiti',	'DU',	'SG');
INSERT INTO @tbl VALUES ('Anseba'            ,	     'Sel''a',	'AN',	'SE');
INSERT INTO @tbl VALUES ('Debub'            ,	     'Sen''afe',	'DU',	'SF');
INSERT INTO @tbl VALUES ('Maekel'            ,	     'Serejaka',	'MA',	'SJ');
INSERT INTO @tbl VALUES ('Gash Barka'            ,	     'Shambuko',	'GB',	'SH');
INSERT INTO @tbl VALUES ('Semenawi Keyih Bahri'            ,	     'She''eb',	'SK',	'SH');
INSERT INTO @tbl VALUES ('Maekel'            ,	     'South Eastern Asmara',	'MA',	'SE');
INSERT INTO @tbl VALUES ('Debubawi Keyih Bahri'            ,	     'South Southern Red Sea',	'DK',	'SS');
INSERT INTO @tbl VALUES ('Maekel'            ,	     'South Western Asmara',	'MA',	'SW');
INSERT INTO @tbl VALUES ('Gash Barka'            ,	     'Tesseney',	'GB',	'TE');
INSERT INTO @tbl VALUES ('Debub'            ,	     'Tserona',	'DU',	'TS');
INSERT INTO @tbl VALUES ('Gash Barka'            ,	     'Upper Gash',	'GB',	'UG');

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

