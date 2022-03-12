
/* ==================================================================================
    	Source File		:	setup_syria_arab_republic_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Syrian Arab Republic are set-up
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
WHERE	country_nm	=	'Syrian Arab Republic';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Syrian Arab Republic not found', 16, 1);
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

INSERT INTO @tbl VALUES ('Dayr az Zawr'            ,	     'Abu-Kamal',	'DY',	'AK');
INSERT INTO @tbl VALUES ('Aleppo'            ,	     'Afrin',	'HL',	'AF');
INSERT INTO @tbl VALUES ('Aleppo'            ,	     'Al-Bab',	'HL',	'BB');
INSERT INTO @tbl VALUES ('Latakia'            ,	     'Al-Haffah',	'LA',	'HF');
INSERT INTO @tbl VALUES ('Al Hasakah'            ,	     'Al-Malikiyah',	'HA',	'ML');
INSERT INTO @tbl VALUES ('Hims'            ,	     'Al-Mukharram',	'HI',	'MK');
INSERT INTO @tbl VALUES ('Al Hasakah'            ,	     'Al-Qamishli',	'HA',	'QM');
INSERT INTO @tbl VALUES ('Hims'            ,	     'Al-Qusayr',	'HI',	'QS');
INSERT INTO @tbl VALUES ('Rif Dimashq'            ,	     'Al-Qutayfah',	'RD',	'QF');
INSERT INTO @tbl VALUES ('Rif Dimashq'            ,	     'An-Nabk',	'RD',	'NB');
INSERT INTO @tbl VALUES ('Idlib'            ,	     'Ariha',	'ID',	'AR');
INSERT INTO @tbl VALUES ('Hims'            ,	     'Ar-Rastan',	'HI',	'RS');
INSERT INTO @tbl VALUES ('Tartus'            ,	     'Ash-Shaykh Badr',	'TA',	'SB');
INSERT INTO @tbl VALUES ('Aleppo'            ,	     'As-Safirah',	'HL',	'SR');
INSERT INTO @tbl VALUES ('Dar`a'            ,	     'As-Sanamayn',	'DR',	'SN');
INSERT INTO @tbl VALUES ('Hama'            ,	     'As-Saqlabiyah',	'HM',	'SQ');
INSERT INTO @tbl VALUES ('Ar Raqqah'            ,	     'Ath-Thawrah',	'RA',	'AT');
INSERT INTO @tbl VALUES ('Rif Dimashq'            ,	     'At-Tall',	'RD',	'TL');
INSERT INTO @tbl VALUES ('Aleppo'            ,	     'Ayn al-''Arab',	'HL',	'AA');
INSERT INTO @tbl VALUES ('Aleppo'            ,	     'A''zaz',	'HL',	'AZ');
INSERT INTO @tbl VALUES ('Rif Dimashq'            ,	     'Az-Zabadani',	'RD',	'ZB');
INSERT INTO @tbl VALUES ('Tartus'            ,	     'Baniyas',	'TA',	'BN');
INSERT INTO @tbl VALUES ('Rif Dimashq'            ,	     'Darayya',	'RD',	'DA');
INSERT INTO @tbl VALUES ('Rif Dimashq'            ,	     'Duma',	'RD',	'DM');
INSERT INTO @tbl VALUES ('Tartus'            ,	     'Duraykish',	'TA',	'DK');
INSERT INTO @tbl VALUES ('Quneitra'            ,	     'Fiq Zawiyah',	'QU',	'FZ');
INSERT INTO @tbl VALUES ('Idlib'            ,	     'Harim',	'ID',	'HR');
INSERT INTO @tbl VALUES ('Dar`a'            ,	     'Izra''',	'DR',	'IZ');
INSERT INTO @tbl VALUES ('Aleppo'            ,	     'Jabal Sam''an',	'HL',	'JS');
INSERT INTO @tbl VALUES ('Latakia'            ,	     'Jablah',	'LA',	'JB');
INSERT INTO @tbl VALUES ('Aleppo'            ,	     'Jarabulus',	'HL',	'JR');
INSERT INTO @tbl VALUES ('Idlib'            ,	     'Jisr ash-Shughur',	'ID',	'JA');
INSERT INTO @tbl VALUES ('Idlib'            ,	     'Ma''arrat an-Nu''man',	'ID',	'MN');
INSERT INTO @tbl VALUES ('Damascus'            ,	     'Madinah Dimashq',	'DI',	'DI');
INSERT INTO @tbl VALUES ('Aleppo'            ,	     'Manbij',	'HL',	'MB');
INSERT INTO @tbl VALUES ('Al Hasakah'            ,	     'Markaz Al-Hasakah',	'HA',	'HA');
INSERT INTO @tbl VALUES ('Latakia'            ,	     'Markaz Al-Ladhiqiyah',	'LA',	'LA');
INSERT INTO @tbl VALUES ('Quneitra'            ,	     'Markaz Al-Qunaytrah',	'QU',	'QU');
INSERT INTO @tbl VALUES ('Ar Raqqah'            ,	     'Markaz Ar-Raqqah',	'RA',	'RA');
INSERT INTO @tbl VALUES ('As Suwayda'''            ,	     'Markaz As-Suwayda',	'SU',	'SU');
INSERT INTO @tbl VALUES ('Dar`a'            ,	     'Markaz Dar''a',	'DR',	'DR');
INSERT INTO @tbl VALUES ('Dayr az Zawr'            ,	     'Markaz Dayr az-Zawr',	'DY',	'DY');
INSERT INTO @tbl VALUES ('Hama'            ,	     'Markaz Hamah',	'HM',	'HM');
INSERT INTO @tbl VALUES ('Hims'            ,	     'Markaz Hims',	'HI',	'HI');
INSERT INTO @tbl VALUES ('Idlib'            ,	     'Markaz Idlib',	'ID',	'ID');
INSERT INTO @tbl VALUES ('Rif Dimashq'            ,	     'Markaz Rif Dimashq',	'RD',	'RD');
INSERT INTO @tbl VALUES ('Tartus'            ,	     'Markaz Tartus',	'TA',	'TA');
INSERT INTO @tbl VALUES ('Hama'            ,	     'Masyaf',	'HM',	'MF');
INSERT INTO @tbl VALUES ('Dayr az Zawr'            ,	     'Mayadin',	'DY',	'MY');
INSERT INTO @tbl VALUES ('Hama'            ,	     'Muhradah',	'HM',	'MH');
INSERT INTO @tbl VALUES ('Latakia'            ,	     'Qardahah',	'LA',	'QR');
INSERT INTO @tbl VALUES ('Rif Dimashq'            ,	     'Qatana',	'RD',	'QT');
INSERT INTO @tbl VALUES ('Al Hasakah'            ,	     'Ra''s-al-Ayn',	'HA',	'RN');
INSERT INTO @tbl VALUES ('Tartus'            ,	     'Safita',	'TA',	'ST');
INSERT INTO @tbl VALUES ('Hama'            ,	     'Salamiyah',	'HM',	'SL');
INSERT INTO @tbl VALUES ('As Suwayda'''            ,	     'Salkhad',	'SU',	'SK');
INSERT INTO @tbl VALUES ('As Suwayda'''            ,	     'Shahba''',	'SU',	'SH');
INSERT INTO @tbl VALUES ('Hims'            ,	     'Tadmur',	'HI',	'TD');
INSERT INTO @tbl VALUES ('Ar Raqqah'            ,	     'Tall Abyad',	'RA',	'TB');
INSERT INTO @tbl VALUES ('Hims'            ,	     'Tall Kalakh',	'HI',	'TK');
INSERT INTO @tbl VALUES ('Rif Dimashq'            ,	     'Yabrud',	'RD',	'YB');

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

