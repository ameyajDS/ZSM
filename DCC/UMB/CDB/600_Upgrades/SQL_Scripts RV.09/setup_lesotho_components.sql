
/* ==================================================================================
    	Source File		:	setup_lesotho_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Lesotho are set-up
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
WHERE	country_nm	=	'Lesotho';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Lesotho not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'District',
		level_2_address_component	=	'Council',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Thaba-Tseka'            ,	     'Bobete',	'TT',	'BO');
INSERT INTO @tbl VALUES ('Leribe'            ,	     'Fenyane',	'LE',	'FE');
INSERT INTO @tbl VALUES ('Leribe'            ,	     'Hleoheng',	'LE',	'HL');
INSERT INTO @tbl VALUES ('Berea'            ,	     'Kanana',	'BE',	'KA');
INSERT INTO @tbl VALUES ('Butha-Buthe'            ,	     'Kao',	'BB',	'KA');
INSERT INTO @tbl VALUES ('Mokhotlong'            ,	     'Khalahali',	'MK',	'KL');
INSERT INTO @tbl VALUES ('Mohale''s Hoek'            ,	     'Khoelenya',	'MH',	'KH');
INSERT INTO @tbl VALUES ('Leribe'            ,	     'Khomokhoana',	'LE',	'KH');
INSERT INTO @tbl VALUES ('Qacha''s Nek'            ,	     'Khomo-Phatsoa',	'QN',	'KP');
INSERT INTO @tbl VALUES ('Mokhotlong'            ,	     'Khubelu',	'MK',	'KB');
INSERT INTO @tbl VALUES ('Mafeteng'            ,	     'Koti-Se-Phola',	'MF',	'KP');
INSERT INTO @tbl VALUES ('Berea'            ,	     'Kueneng',	'BE',	'KU');
INSERT INTO @tbl VALUES ('Thaba-Tseka'            ,	     'Lesobeng',	'TT',	'LE');
INSERT INTO @tbl VALUES ('Qacha''s Nek'            ,	     'Letloepe',	'QN',	'LE');
INSERT INTO @tbl VALUES ('Maseru'            ,	     'Likalaneng',	'MS',	'LK');
INSERT INTO @tbl VALUES ('Quthing'            ,	     'Likhohlong',	'QT',	'LK');
INSERT INTO @tbl VALUES ('Mohale''s Hoek'            ,	     'Likhutloaneng',	'MH',	'LI');
INSERT INTO @tbl VALUES ('Butha-Buthe'            ,	     'Likila',	'BB',	'LK');
INSERT INTO @tbl VALUES ('Maseru'            ,	     'Lilala',	'MS',	'LL');
INSERT INTO @tbl VALUES ('Leribe'            ,	     'Limamarela',	'LE',	'LM');
INSERT INTO @tbl VALUES ('Mokhotlong'            ,	     'Linakaneng',	'MK',	'LN');
INSERT INTO @tbl VALUES ('Butha-Buthe'            ,	     'Linakeng',	'BB',	'LN');
INSERT INTO @tbl VALUES ('Leribe'            ,	     'Linare',	'LE',	'LN');
INSERT INTO @tbl VALUES ('Butha-Buthe'            ,	     'Lipelaneng',	'BB',	'LP');
INSERT INTO @tbl VALUES ('Quthing'            ,	     'Liphakoe',	'QT',	'LP');
INSERT INTO @tbl VALUES ('Mokhotlong'            ,	     'Liphamola',	'MK',	'LI');
INSERT INTO @tbl VALUES ('Butha-Buthe'            ,	     'Liqobong',	'BB',	'LQ');
INSERT INTO @tbl VALUES ('Leribe'            ,	     'Litjotjela',	'LE',	'LT');
INSERT INTO @tbl VALUES ('Leribe'            ,	     'Maisa-Phoka',	'LE',	'MP');
INSERT INTO @tbl VALUES ('Mafeteng'            ,	     'Makaota',	'MF',	'MA');
INSERT INTO @tbl VALUES ('Berea'            ,	     'Makeoana',	'BE',	'MK');
INSERT INTO @tbl VALUES ('Maseru'            ,	     'Makhaleng',	'MS',	'MG');
INSERT INTO @tbl VALUES ('Maseru'            ,	     'Makheka',	'MS',	'MK');
INSERT INTO @tbl VALUES ('Thaba-Tseka'            ,	     'Makheka',	'TT',	'MK');
INSERT INTO @tbl VALUES ('Maseru'            ,	     'Makhoarane',	'MS',	'MR');
INSERT INTO @tbl VALUES ('Mafeteng'            ,	     '''Makholane',	'MF',	'MK');
INSERT INTO @tbl VALUES ('Butha-Buthe'            ,	     'Makhunoane',	'BB',	'MA');
INSERT INTO @tbl VALUES ('Maseru'            ,	     'Makolopetsane',	'MS',	'MP');
INSERT INTO @tbl VALUES ('Mafeteng'            ,	     '''Malakeng',	'MF',	'ML');
INSERT INTO @tbl VALUES ('Leribe'            ,	     'Malaoaneng',	'LE',	'ML');
INSERT INTO @tbl VALUES ('Thaba-Tseka'            ,	     'Malehloana',	'TT',	'MH');
INSERT INTO @tbl VALUES ('Berea'            ,	     'Maluba-Lube',	'BE',	'ML');
INSERT INTO @tbl VALUES ('Mafeteng'            ,	     'Malumeng',	'MF',	'MG');
INSERT INTO @tbl VALUES ('Mafeteng'            ,	     '''Mamants''O',	'MF',	'MO');
INSERT INTO @tbl VALUES ('Leribe'            ,	     'Manka',	'LE',	'MN');
INSERT INTO @tbl VALUES ('Maseru'            ,	     'Manonyane',	'MS',	'MY');
INSERT INTO @tbl VALUES ('Mokhotlong'            ,	     'Mapholaneng',	'MK',	'MP');
INSERT INTO @tbl VALUES ('Berea'            ,	     'Mapoteng',	'BE',	'MP');
INSERT INTO @tbl VALUES ('Mokhotlong'            ,	     'Marung',	'MK',	'MR');
INSERT INTO @tbl VALUES ('Qacha''s Nek'            ,	     'Maseepho',	'QN',	'MP');
INSERT INTO @tbl VALUES ('Maseru'            ,	     'Maseru',	'MS',	'MS');
INSERT INTO @tbl VALUES ('Mohale''s Hoek'            ,	     'Mashaleng',	'MH',	'MA');
INSERT INTO @tbl VALUES ('Mokhotlong'            ,	     'Mateanong',	'MK',	'MT');
INSERT INTO @tbl VALUES ('Qacha''s Nek'            ,	     'Matebeng',	'QN',	'MB');
INSERT INTO @tbl VALUES ('Mafeteng'            ,	     'Mathula',	'MF',	'MT');
INSERT INTO @tbl VALUES ('Leribe'            ,	     'Matlameng',	'LE',	'MT');
INSERT INTO @tbl VALUES ('Quthing'            ,	     'Matsatseng',	'QT',	'MA');
INSERT INTO @tbl VALUES ('Mokhotlong'            ,	     'Matsoku',	'MK',	'MK');
INSERT INTO @tbl VALUES ('Thaba-Tseka'            ,	     'Matsooana',	'TT',	'MT');
INSERT INTO @tbl VALUES ('Maseru'            ,	     'Mazenod',	'MS',	'MZ');
INSERT INTO @tbl VALUES ('Leribe'            ,	     'Menkhoaneng',	'LE',	'ME');
INSERT INTO @tbl VALUES ('Mafeteng'            ,	     'Metsi-Maholo',	'MF',	'MM');
INSERT INTO @tbl VALUES ('Quthing'            ,	     'Mkh''Ono',	'QT',	'MO');
INSERT INTO @tbl VALUES ('Maseru'            ,	     'Mohlakeng',	'MS',	'MO');
INSERT INTO @tbl VALUES ('Thaba-Tseka'            ,	     'Mohlanapeng',	'TT',	'MP');
INSERT INTO @tbl VALUES ('Quthing'            ,	     'Mokotjomela',	'QT',	'MK');
INSERT INTO @tbl VALUES ('Mokhotlong'            ,	     'Molika-Liko',	'MK',	'ML');
INSERT INTO @tbl VALUES ('Mafeteng'            ,	     'Monyake',	'MF',	'MY');
INSERT INTO @tbl VALUES ('Thaba-Tseka'            ,	     'Monyetleng',	'TT',	'MN');
INSERT INTO @tbl VALUES ('Mohale''s Hoek'            ,	     'Mootsinyane',	'MH',	'MY');
INSERT INTO @tbl VALUES ('Mokhotlong'            ,	     'Moremoholo',	'MK',	'MO');
INSERT INTO @tbl VALUES ('Qacha''s Nek'            ,	     'Mosenekeng',	'QN',	'MO');
INSERT INTO @tbl VALUES ('Thaba-Tseka'            ,	     'Mosetoa',	'TT',	'MS');
INSERT INTO @tbl VALUES ('Berea'            ,	     'Motanasela',	'BE',	'MT');
INSERT INTO @tbl VALUES ('Leribe'            ,	     'Motati',	'LE',	'MO');
INSERT INTO @tbl VALUES ('Butha-Buthe'            ,	     '''Moteng',	'BB',	'MO');
INSERT INTO @tbl VALUES ('Mohale''s Hoek'            ,	     'Motlejoeng',	'MH',	'MJ');
INSERT INTO @tbl VALUES ('Quthing'            ,	     'Mphaki',	'QT',	'MP');
INSERT INTO @tbl VALUES ('Thaba-Tseka'            ,	     'Mphe-Lebeko',	'TT',	'ML');
INSERT INTO @tbl VALUES ('Leribe'            ,	     'Mphorosane',	'LE',	'MS');
INSERT INTO @tbl VALUES ('Mohale''s Hoek'            ,	     'Nkau',	'MH',	'NK');
INSERT INTO @tbl VALUES ('Quthing'            ,	     'Nkoebe',	'QT',	'NK');
INSERT INTO @tbl VALUES ('Butha-Buthe'            ,	     'Ntelle',	'BB',	'NT');
INSERT INTO @tbl VALUES ('Maseru'            ,	     'Nyakosoba',	'MS',	'NY');
INSERT INTO @tbl VALUES ('Mokhotlong'            ,	     'Pae-La-Itlhatsoa',	'MK',	'PL');
INSERT INTO @tbl VALUES ('Qacha''s Nek'            ,	     'Patlong',	'QN',	'PA');
INSERT INTO @tbl VALUES ('Mohale''s Hoek'            ,	     'Phamong',	'MH',	'PH');
INSERT INTO @tbl VALUES ('Berea'            ,	     'Phuthiatsana',	'BE',	'PH');
INSERT INTO @tbl VALUES ('Leribe'            ,	     'Pitseng',	'LE',	'PI');
INSERT INTO @tbl VALUES ('Mokhotlong'            ,	     'Popa',	'MK',	'PO');
INSERT INTO @tbl VALUES ('Mohale''s Hoek'            ,	     'Qabane',	'MH',	'QA');
INSERT INTO @tbl VALUES ('Mohale''s Hoek'            ,	     'Qhobeng',	'MH',	'QH');
INSERT INTO @tbl VALUES ('Mafeteng'            ,	     'Qibing',	'MF',	'QI');
INSERT INTO @tbl VALUES ('Maseru'            ,	     'Qiloane',	'MS',	'QI');
INSERT INTO @tbl VALUES ('Mohale''s Hoek'            ,	     'Qobong',	'MH',	'QO');
INSERT INTO @tbl VALUES ('Quthing'            ,	     'Qomoqomong',	'QT',	'QO');
INSERT INTO @tbl VALUES ('Mokhotlong'            ,	     'Rafolatsane',	'MK',	'RA');
INSERT INTO @tbl VALUES ('Qacha''s Nek'            ,	     'Ramatseliso',	'QN',	'RM');
INSERT INTO @tbl VALUES ('Mafeteng'            ,	     'Ramoetsana',	'MF',	'RA');
INSERT INTO @tbl VALUES ('Maseru'            ,	     'Ratau',	'MS',	'RA');
INSERT INTO @tbl VALUES ('Qacha''s Nek'            ,	     'Ratsoleli',	'QN',	'RL');
INSERT INTO @tbl VALUES ('Maseru'            ,	     'Ribaneng',	'MS',	'RI');
INSERT INTO @tbl VALUES ('Mokhotlong'            ,	     'Sakeng',	'MK',	'SA');
INSERT INTO @tbl VALUES ('Quthing'            ,	     'Seforong',	'QT',	'SE');
INSERT INTO @tbl VALUES ('Thaba-Tseka'            ,	     'Sehong-Hong',	'TT',	'SH');
INSERT INTO @tbl VALUES ('Butha-Buthe'            ,	     'Sekhobe',	'BB',	'SE');
INSERT INTO @tbl VALUES ('Maseru'            ,	     'Semonkong',	'MS',	'SE');
INSERT INTO @tbl VALUES ('Berea'            ,	     'Senekane',	'BE',	'SE');
INSERT INTO @tbl VALUES ('Thaba-Tseka'            ,	     'Senontong',	'TT',	'SE');
INSERT INTO @tbl VALUES ('Leribe'            ,	     'Sephokong',	'LE',	'SP');
INSERT INTO @tbl VALUES ('Mohale''s Hoek'            ,	     'Seroto',	'MH',	'SE');
INSERT INTO @tbl VALUES ('Leribe'            ,	     'Serupane',	'LE',	'SR');
INSERT INTO @tbl VALUES ('Leribe'            ,	     'Seshote',	'LE',	'SS');
INSERT INTO @tbl VALUES ('Mohale''s Hoek'            ,	     'Siloe',	'MH',	'SI');
INSERT INTO @tbl VALUES ('Mafeteng'            ,	     'Tajane',	'MF',	'TA');
INSERT INTO @tbl VALUES ('Berea'            ,	     'Tebe-Tebe',	'BE',	'TT');
INSERT INTO @tbl VALUES ('Mohale''s Hoek'            ,	     'Teke',	'MH',	'TE');
INSERT INTO @tbl VALUES ('Mokhotlong'            ,	     'Tekeseleng',	'MK',	'TE');
INSERT INTO @tbl VALUES ('Maseru'            ,	     'Telle',	'MS',	'TE');
INSERT INTO @tbl VALUES ('Mohale''s Hoek'            ,	     'Thaba Mokhele',	'MH',	'TH');
INSERT INTO @tbl VALUES ('Thaba-Tseka'            ,	     'Thaba-Chitja',	'TT',	'TC');
INSERT INTO @tbl VALUES ('Thaba-Tseka'            ,	     'Thaba-Kholo',	'TT',	'TK');
INSERT INTO @tbl VALUES ('Qacha''s Nek'            ,	     'Thaba-Khubelu',	'QN',	'TK');
INSERT INTO @tbl VALUES ('Qacha''s Nek'            ,	     'Thaba-Litsoene',	'QN',	'TL');
INSERT INTO @tbl VALUES ('Berea'            ,	     'Thuathe',	'BE',	'TH');
INSERT INTO @tbl VALUES ('Butha-Buthe'            ,	     'Ts''A-Le-Moleka',	'BB',	'TA');
INSERT INTO @tbl VALUES ('Quthing'            ,	     'Tsatsane',	'QT',	'TS');
INSERT INTO @tbl VALUES ('Leribe'            ,	     'Tsoilitsoili',	'LE',	'TS');
INSERT INTO @tbl VALUES ('Qacha''s Nek'            ,	     'Whitehill',	'QN',	'WH');

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

