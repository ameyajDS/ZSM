
/* ==================================================================================
    	Source File		:	setup_benin_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Benin are set-up
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
WHERE	country_nm	=	'Benin';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Benin not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Department',
		level_2_address_component	=	'Commune',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Zou'            ,	     'Abomey',	'ZO',	'AB');
INSERT INTO @tbl VALUES ('Atlantique'            ,	     'Abomey-Calavi',	'AQ',	'AC');
INSERT INTO @tbl VALUES ('Plateau'            ,	     'Adja-Ouere',	'PL',	'AO');
INSERT INTO @tbl VALUES ('Oueme'            ,	     'Adjarra',	'OU',	'AA');
INSERT INTO @tbl VALUES ('Oueme'            ,	     'Adjohoun',	'OU',	'AH');
INSERT INTO @tbl VALUES ('Zou'            ,	     'Agbangnizoun',	'ZO',	'AG');
INSERT INTO @tbl VALUES ('Oueme'            ,	     'Aguegues',	'OU',	'AG');
INSERT INTO @tbl VALUES ('Oueme'            ,	     'Akpro-Misserete',	'OU',	'AM');
INSERT INTO @tbl VALUES ('Atlantique'            ,	     'Allada',	'AQ',	'AL');
INSERT INTO @tbl VALUES ('Couffo'            ,	     'Aplahoue',	'CF',	'AP');
INSERT INTO @tbl VALUES ('Mono'            ,	     'Athieme',	'MO',	'AT');
INSERT INTO @tbl VALUES ('Oueme'            ,	     'Avrankou',	'OU',	'AV');
INSERT INTO @tbl VALUES ('Alibori'            ,	     'Banikoara',	'AL',	'BA');
INSERT INTO @tbl VALUES ('Collines'            ,	     'Bante',	'CL',	'BA');
INSERT INTO @tbl VALUES ('Donga'            ,	     'Bassila',	'DO',	'BA');
INSERT INTO @tbl VALUES ('Borgou'            ,	     'Bembereke',	'BO',	'BE');
INSERT INTO @tbl VALUES ('Zou'            ,	     'Bohicon',	'ZO',	'BO');
INSERT INTO @tbl VALUES ('Oueme'            ,	     'Bonou',	'OU',	'BO');
INSERT INTO @tbl VALUES ('Mono'            ,	     'Bopa',	'MO',	'BO');
INSERT INTO @tbl VALUES ('Atacora'            ,	     'Boukoumbe',	'AK',	'BO');
INSERT INTO @tbl VALUES ('Atacora'            ,	     'Cobly',	'AK',	'CB');
INSERT INTO @tbl VALUES ('Mono'            ,	     'Come',	'MO',	'CO');
INSERT INTO @tbl VALUES ('Donga'            ,	     'Copargo',	'DO',	'CP');
INSERT INTO @tbl VALUES ('Littoral'            ,	     'Cotonou',	'LI',	'CO');
INSERT INTO @tbl VALUES ('Zou'            ,	     'Cove',	'ZO',	'CO');
INSERT INTO @tbl VALUES ('Oueme'            ,	     'Dangbo',	'OU',	'DA');
INSERT INTO @tbl VALUES ('Collines'            ,	     'Dassa-Zoume',	'CL',	'DZ');
INSERT INTO @tbl VALUES ('Couffo'            ,	     'Djakotomey',	'CF',	'DJ');
INSERT INTO @tbl VALUES ('Zou'            ,	     'Djidja',	'ZO',	'DJ');
INSERT INTO @tbl VALUES ('Donga'            ,	     'Djougou',	'DO',	'DJ');
INSERT INTO @tbl VALUES ('Couffo'            ,	     'Dogbo',	'CF',	'DO');
INSERT INTO @tbl VALUES ('Collines'            ,	     'Glazoue',	'CL',	'GL');
INSERT INTO @tbl VALUES ('Alibori'            ,	     'Gogounou',	'AL',	'GO');
INSERT INTO @tbl VALUES ('Mono'            ,	     'Grand-Popo',	'MO',	'GP');
INSERT INTO @tbl VALUES ('Mono'            ,	     'Houeyogbe',	'MO',	'HO');
INSERT INTO @tbl VALUES ('Plateau'            ,	     'Ifangni',	'PL',	'IF');
INSERT INTO @tbl VALUES ('Borgou'            ,	     'Kalale',	'BO',	'KL');
INSERT INTO @tbl VALUES ('Alibori'            ,	     'Kandi',	'AL',	'KN');
INSERT INTO @tbl VALUES ('Alibori'            ,	     'Karimama',	'AL',	'KR');
INSERT INTO @tbl VALUES ('Atacora'            ,	     'Kerou',	'AK',	'KE');
INSERT INTO @tbl VALUES ('Plateau'            ,	     'Ketou',	'PL',	'KE');
INSERT INTO @tbl VALUES ('Couffo'            ,	     'Klouekanme',	'CF',	'KL');
INSERT INTO @tbl VALUES ('Atacora'            ,	     'Kouande',	'AK',	'KO');
INSERT INTO @tbl VALUES ('Atlantique'            ,	     'Kpomasse',	'AQ',	'KP');
INSERT INTO @tbl VALUES ('Couffo'            ,	     'Lalo',	'CF',	'LA');
INSERT INTO @tbl VALUES ('Mono'            ,	     'Lokossa',	'MO',	'LO');
INSERT INTO @tbl VALUES ('Alibori'            ,	     'Malanville',	'AL',	'MA');
INSERT INTO @tbl VALUES ('Atacora'            ,	     'Materi',	'AK',	'MA');
INSERT INTO @tbl VALUES ('Atacora'            ,	     'Natitingou',	'AK',	'NA');
INSERT INTO @tbl VALUES ('Borgou'            ,	     'N''Dali',	'BO',	'ND');
INSERT INTO @tbl VALUES ('Borgou'            ,	     'Nikki',	'BO',	'NI');
INSERT INTO @tbl VALUES ('Donga'            ,	     'Ouake',	'DO',	'OU');
INSERT INTO @tbl VALUES ('Collines'            ,	     'Ouesse',	'CL',	'OS');
INSERT INTO @tbl VALUES ('Atlantique'            ,	     'Ouidah',	'AQ',	'OU');
INSERT INTO @tbl VALUES ('Zou'            ,	     'Ouinhi',	'ZO',	'ON');
INSERT INTO @tbl VALUES ('Borgou'            ,	     'Parakou',	'BO',	'PA');
INSERT INTO @tbl VALUES ('Atacora'            ,	     'Pehunco',	'AK',	'PE');
INSERT INTO @tbl VALUES ('Borgou'            ,	     'Perere',	'BO',	'PE');
INSERT INTO @tbl VALUES ('Plateau'            ,	     'Pobe',	'PL',	'PB');
INSERT INTO @tbl VALUES ('Oueme'            ,	     'Porto-Novo',	'OU',	'PN');
INSERT INTO @tbl VALUES ('Plateau'            ,	     'Sakete',	'PL',	'SA');
INSERT INTO @tbl VALUES ('Collines'            ,	     'Savalou',	'CL',	'SL');
INSERT INTO @tbl VALUES ('Collines'            ,	     'Save',	'CL',	'SE');
INSERT INTO @tbl VALUES ('Alibori'            ,	     'Segbana',	'AL',	'SE');
INSERT INTO @tbl VALUES ('Oueme'            ,	     'Seme-Kpodji',	'OU',	'SK');
INSERT INTO @tbl VALUES ('Borgou'            ,	     'Sinende',	'BO',	'SI');
INSERT INTO @tbl VALUES ('Atlantique'            ,	     'So-Ava',	'AQ',	'SA');
INSERT INTO @tbl VALUES ('Atacora'            ,	     'Tanguieta',	'AK',	'TA');
INSERT INTO @tbl VALUES ('Borgou'            ,	     'Tchaourou',	'BO',	'TC');
INSERT INTO @tbl VALUES ('Atlantique'            ,	     'Toffo',	'AQ',	'TF');
INSERT INTO @tbl VALUES ('Atlantique'            ,	     'Tori-Bossito',	'AQ',	'TB');
INSERT INTO @tbl VALUES ('Atacora'            ,	     'Toucountouna',	'AK',	'TO');
INSERT INTO @tbl VALUES ('Couffo'            ,	     'Toviklin',	'CF',	'TO');
INSERT INTO @tbl VALUES ('Zou'            ,	     'Zagnanado',	'ZO',	'ZN');
INSERT INTO @tbl VALUES ('Zou'            ,	     'Za-Kpota',	'ZO',	'ZK');
INSERT INTO @tbl VALUES ('Atlantique'            ,	     'Ze',	'AQ',	'ZE');
INSERT INTO @tbl VALUES ('Zou'            ,	     'Zogbodomey',	'ZO',	'ZB');

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

