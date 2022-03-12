BEGIN TRAN;
--ROLLBACK;
--COMMIT;

IF (DB_NAME() != 'CDB')
BEGIN
	ROLLBACK;
	RAISERROR ('Datbase should be CDB', 16, 1);
	RETURN;
END

DECLARE
	@eftdt	DATE	=	GETDATE(),
	@tdt	DATE	=	'31 Dec 9999',
	@al		INTEGER,	--	audit_log_id
	@cnt1	INTEGER,
	@cnt2	INTEGER,
	@cnt3	INTEGER;

SET @eftdt = DATEADD (d, -1, @eftdt);

DECLARE	@l1_renames	TABLE
	(	l1_id	INTEGER			NOT	NULL	PRIMARY	KEY,
		l1_nm	VARCHAR (40)	NOT	NULL,
		new_nm	VARCHAR (40)	NOT	NULL
	);

DECLARE	@l2_renames	TABLE
	(	l2_id	INTEGER			NOT	NULL	PRIMARY	KEY,
		l2_nm	VARCHAR (40)	NOT	NULL,
		new_nm	VARCHAR (40)	NOT	NULL
	);

DECLARE	@c_alternates	TABLE
	(	c_id	INTEGER			NOT	NULL,
		c_nm	VARCHAR (40)	NOT	NULL,
		alt_nm	VARCHAR (40)	NOT	NULL,
			PRIMARY	KEY	(	c_id, alt_nm	),
			UNIQUE		(	c_nm, alt_nm	)
	);

DECLARE	@l1_alternates	TABLE
	(	l1_id	INTEGER			NOT	NULL,
		l1_nm	VARCHAR (40)	NOT	NULL,
		new_nm	VARCHAR (40)	NOT	NULL,
		alt_nm	VARCHAR (40)	NOT	NULL,
			PRIMARY	KEY	(	l1_id, alt_nm	),
			UNIQUE		(	l1_nm, alt_nm	)
	);

DECLARE	@l2_alternates	TABLE
	(	l2_id	INTEGER			NOT	NULL,
		l2_nm	VARCHAR (40)	NOT	NULL,
		new_nm	VARCHAR (40)	NOT	NULL,
		alt_nm	VARCHAR (40)	NOT	NULL,
			PRIMARY	KEY	(	l2_id, alt_nm	),
			UNIQUE		(	l2_nm, alt_nm	)
	);

INSERT INTO	audit_logs
		(	[session_id], [application_id], [user_no], [user_role_id], [operation], [screen_id], [object_id], [operation_dts], [is_consumed]	)
	VALUES
		(	0, 'Script', 1, 'System', 'I', 'rev080', 'Address Components and Alternates', GETDATE(), 0	);
	SET @al	=	SCOPE_IDENTITY ();




--	=================================================================================================================
--	Drop triggers that automatically put Level 1, 2 and 3 Components when these components are NOT used for a Country
--	=================================================================================================================

DROP TRIGGER countries_a_i_DML;
DROP TRIGGER countries_b_u_DML;
DROP TRIGGER level_1_address_components_a_i_DML;
DROP TRIGGER level_1_address_components_b_u_DML;
DROP TRIGGER level_2_address_components_a_i_DML;
DROP TRIGGER level_2_address_components_b_u_DML;


--	=================================================================================================================
--	Set FRRO Name to be same as Level 2 Component Name where the names have been corrected in recent past
--	=================================================================================================================

UPDATE	level_2_address_components
	SET	frro_level2_nm	=	level_2_address_component_nm
WHERE	level_2_address_component_id	IN	(	2,		4,		15,		20,		62,		63,		176,	207,	246,	247,	248,	249,	251,
												253,	254,	260,	267,	270,	271,	290,	315,	437,	443,	445,	449,	456,
												472,	473,	474,	477,	555,	568,	588,	593,	601,	609,	610,	621,	628,
												630,	649,	665,	668,	670,	696,	697,	698,	699,	51469,	51473,	52564
											);
IF (@@ROWCOUNT != 51)
BEGIN
	ROLLBACK;
	RAISERROR ('Setting FRRO Name for Level 2 Address Components failed', 16, 1);
	RETURN;
END


--	=========================================================================================================================================
--	Remore Alternate Names for Level 2 Address Components which are not correct and got creaetd through triggers when correcting Level 2 Name
--	=========================================================================================================================================

DELETE
FROM	alternate_address_component_names
WHERE	alternate_address_component_id IN	(	139, 140, 142, 145, 147	);
IF (@@ROWCOUNT != 5)
BEGIN
	ROLLBACK;
	RAISERROR ('Deleing Alternate Names for Level 2 Address Components failed', 16, 1);
	RETURN;
END

--	========================================================
--	Correcting Alternate Name for Level 2 Address Components
--	========================================================

UPDATE	alternate_address_component_names
SET	alternate_address_component_nm	=	'Bhim Nagar'
WHERE	alternate_address_component_id =	141;
IF (@@ROWCOUNT != 1)
BEGIN
	ROLLBACK;
	RAISERROR ('Correcting Alternate Name for Level 2 Address Components failed', 16, 1);
	RETURN;
END



--	=================================================================================================================
--	Set FRRO Name to be same as Level 3 Component Name where the names have been corrected in recent past
--	=================================================================================================================

UPDATE	level_3_address_components
	SET	frro_level3_nm	=	level_3_address_component_nm
WHERE	level_3_address_component_id	IN	(	1375,	14191,	16878,	17514,	130401,	137848,	139259,	141621,	141650,	
												225496,	170818,	170819,	170253,	134299,	135047,	225404,	225443,	
												126908,	126667,	225432,	96022,	96021,	3167,	225445,	172567
											);
IF (@@ROWCOUNT != 25)
BEGIN
	ROLLBACK;
	RAISERROR ('Setting FRRO Name for Level 3 Address Components failed', 16, 1);
	RETURN;
END


--	=========================================================================================================================================
--	Remore Alternate Names for Level 3 Address Components which are not correct and got creaetd through triggers when correcting Level 3 Name
--	=========================================================================================================================================

DELETE
FROM	alternate_address_component_names
WHERE	alternate_address_component_id BETWEEN	582	AND	590
OR		alternate_address_component_id	IN	(	158, 498	);
IF (@@ROWCOUNT != 11)
BEGIN
	ROLLBACK;
	RAISERROR ('Deleing Alternate Names for Level 3 Address Components failed', 16, 1);
	RETURN;
END

--	========================================================
--	Correcting Alternate Name for Level 3 Address Components
--	========================================================

UPDATE	alternate_address_component_names
SET	alternate_address_component_nm	=	'Bhim Nagar'
WHERE	alternate_address_component_id =	153;
IF (@@ROWCOUNT != 1)
BEGIN
	ROLLBACK;
	RAISERROR ('Correcting Alternate Name for Level 3 Address Components failed', 16, 1);
	RETURN;
END


UPDATE	alternate_address_component_names
SET	alternate_address_component_nm	=	'KANSHIRAM NAGAR'
WHERE	alternate_address_component_id =	154;
IF (@@ROWCOUNT != 1)
BEGIN
	ROLLBACK;
	RAISERROR ('Correcting Alternate Name for Level 3 Address Components failed', 16, 1);
	RETURN;
END


UPDATE	alternate_address_component_names
SET	alternate_address_component_nm	=	'CHHATRAPATI SHAHUJI MAHARAJ NAGAR'
WHERE	alternate_address_component_id =	156;
IF (@@ROWCOUNT != 1)
BEGIN
	ROLLBACK;
	RAISERROR ('Correcting Alternate Name for Level 3 Address Components failed', 16, 1);
	RETURN;
END



--	==================================================
--	Ineffective -- Level 2 Address Component
--	==================================================


UPDATE	level_2_address_components
	SET		effective_till	=	@eftdt,
			audit_log_id	=	@al
WHERE	level_2_address_component_id	=	51169
AND		level_2_address_component_nm	=	'Arusha City';
IF (@@ROWCOUNT != 1)
BEGIN
	ROLLBACK;
	RAISERROR ('Ineffective Level 2 Address Component failed', 16, 1);
	RETURN;
END

UPDATE	level_2_address_components
	SET		effective_till	=	@eftdt,
			audit_log_id	=	@al
WHERE	level_2_address_component_id	=	9673
AND		level_2_address_component_nm	=	'Chhukha (rest)';
IF (@@ROWCOUNT != 1)
BEGIN
	ROLLBACK;
	RAISERROR ('Ineffective Level 2 Address Component failed', 16, 1);
	RETURN;
END

UPDATE	level_2_address_components
	SET		effective_till	=	@eftdt,
			audit_log_id	=	@al
WHERE	level_2_address_component_id	=	9858
AND		level_2_address_component_nm	=	'Samtse (rest)';
IF (@@ROWCOUNT != 1)
BEGIN
	ROLLBACK;
	RAISERROR ('Ineffective Level 2 Address Component failed', 16, 1);
	RETURN;
END

UPDATE	level_2_address_components
	SET		effective_till	=	@eftdt,
			audit_log_id	=	@al
WHERE	level_2_address_component_id	=	9895
AND		level_2_address_component_nm	=	'Thimphu (rest)';
IF (@@ROWCOUNT != 1)
BEGIN
	ROLLBACK;
	RAISERROR ('Ineffective Level 2 Address Component failed', 16, 1);
	RETURN;
END

UPDATE	level_2_address_components
	SET		effective_till	=	@eftdt,
			audit_log_id	=	@al
WHERE	level_2_address_component_id	=	9878
AND		level_2_address_component_nm	=	'Trashigang (rest)';
IF (@@ROWCOUNT != 1)
BEGIN
	ROLLBACK;
	RAISERROR ('Ineffective Level 2 Address Component failed', 16, 1);
	RETURN;
END

UPDATE	level_2_address_components
	SET		effective_till	=	@eftdt,
			audit_log_id	=	@al
WHERE	level_2_address_component_id	=	9823
AND		level_2_address_component_nm	=	'Zhemgang (rest)';
IF (@@ROWCOUNT != 1)
BEGIN
	ROLLBACK;
	RAISERROR ('Ineffective Level 2 Address Component failed', 16, 1);
	RETURN;
END

--	==================================================
--	Corrections -- Level 1 Address Components
--	==================================================

INSERT	INTO	@l1_renames		VALUES	(	1959,	'Gambela Peoples',	'Gambela'	),
										(	1960,	'Harari People',	'Harari'	);

SET @cnt1 = @@ROWCOUNT;

UPDATE	l1
	SET		level_1_address_component_nm	=	d.new_nm,
			audit_log_id	=	@al
FROM	level_1_address_components	l1
	JOIN	@l1_renames	d
		ON	(	l1.level_1_address_component_id	=	d.l1_id
			AND	l1.level_1_address_component_nm	=	d.l1_nm
			);

SET @cnt2 = @@ROWCOUNT;
IF (@cnt1 != @cnt2)
BEGIN
	ROLLBACK;
	SELECT	d.*
	FROM	@l1_renames	d
		LEFT JOIN	level_1_address_components	l1
			ON	(	l1.level_1_address_component_id	=	d.l1_id
				AND	l1.level_1_address_component_nm	=	d.l1_nm
				)
	WHERE	l1.level_1_address_component_id	IS	NULL;
	RAISERROR ('Row counts of Level 1 RENAMES mis-match; should be %d, but update only %d', 16, 1, @cnt1, @cnt2);
	RETURN;
END


--	==================================================
--	Corrections -- Level 2 Address Components
--	==================================================

INSERT	INTO	@l2_renames		VALUES	(	9012,	'Capital (Catamarca)',				'Catamarca'				),
										(	9064,	'Capital (Cordoba)',                'Cordoba'				),
										(	9092,	'Capital (Corrientes)',             'Corrientes'			),
										(	9173,	'Capital (Santa Rosa)',             'Santa Rosa'			),
										(	9191,	'Capital (La Rioja)',               'La Rioja'				),
										(	9206,	'Capital (Mendoza)',                'Mendoza'				),
										(	9226,	'Capital (Posadas)',                'Posadas'				),
										(	9280,	'Capital (Salta)',                  'Salta'					),
										(	9295,	'Capital (San Juan)',               'San Juan'				),
										(	9359,	'Capital (Santiago del Estero)',    'Santiago del Estero'	),
										(	9379,	'Capital (Tucuman)',                'Tucuman'				),
										(	9842,	'Samdrup Jongkhar (rest)',			'Samdrup Jongkhar'		),
										(	10465,	'Antioquia [, Santa Fe de]',		'Santa Fe de Antioquia'	),
										(	10796,	'San Jose [de Caldas]',				'San Jose de Caldas'	),
										(	30287,	'Beyla-Centre',						'Beyla'					),
										(	30301,	'Boffa-Centre',						'Boffa'					),
										(	30310,	'Boke-Centre',						'Boke'					),
										(	30324,	'Coyah-Centre',						'Coyah'					),
										(	30331,	'Dabola-Centre',					'Dabola'				),
										(	30339,	'Dalaba-Centre',					'Dalaba'				),
										(	30348,	'Dinguiraye-Centre',				'Dinguiraye'			),
										(	30356,	'Dubreka-Centre',					'Dubreka'				),
										(	30364,	'Faranah-Centre',					'Faranah'				),
										(	30376,	'Forecariah-Centre',				'Forecariah'			),
										(	30385,	'Fria-Centre',						'Fria'					),
										(	30388,	'Gaoual-Centre',					'Gaoual'				),
										(	30398,	'Gueckedou-Centre',					'Gueckedou'				),
										(	30409,	'Kankan-Centre',					'Kankan'				),
										(	30420,	'Kerouane-Centre',					'Kerouane'				),
										(	30429,	'Kindia-Centre',					'Kindia'				),
										(	30444,	'Kissidougou-Centre',				'Kissidougou'			),
										(	30451,	'Koubia-Centre',					'Koubia'				),
										(	30457,	'Koundara-Centre',					'Koundara'				),
										(	30472,	'Kouroussa-Centre',					'Kouroussa'				),
										(	30482,	'Labe-Centre',						'Labe'					),
										(	30492,	'Lelouma-Centre',					'Lelouma'				),
										(	30504,	'Lola-Centre',						'Lola'					),
										(	30514,	'Macenta-Centre',					'Macenta'				),
										(	30529,	'Mali-Centre',						'Mali'					),
										(	30540,	'Mamou-Centre',						'Mamou'					),
										(	30556,	'Mandiana-Centre',					'Mandiana'				),
										(	30579,	'Pita-Centre',						'Pita'					),
										(	30594,	'Siguiri-Centre',					'Siguiri'				),
										(	30608,	'Telimele-Centre',					'Telimele'				),
										(	30619,	'Tougue-Centre',					'Tougue'				),
										(	30626,	'Yomou-Centre',						'Yomou'					),
										(	14400,	'Rabat (Gozo)',						'Rabat'					),
										(	14405,	'Zebbug (Gozo)',					'Zebbug'				),
										(	14415,	'Rabat (Malta)',					'Rabat'					),
										(	14445,	'Zebbug (Malta)',					'Zebbug'				),
										(	5514,	'Kech (Turbat)',					'Kech'					),
										(	45712,	'Kaohsiung City',					'Kaohsiung'				),
										(	45713,	'New Taipei City',					'New Taipei'			),
										(	45714,	'Taichung City',					'Taichung'				),
										(	45715,	'Tainan City',						'Tainan'				),
										(	45716,	'Taipei City',						'Taipei'				);
--										(	5513,	'Kachi (Bolan)',					'Kachhi'				);


SET @cnt1 = @@ROWCOUNT;

SELECT	*
FROM	level_2_address_components	l2
	JOIN	@l2_renames	d
		ON	(	l2.level_2_address_component_id	=	d.l2_id
			AND	l2.level_2_address_component_nm	=	d.new_nm
			);
IF (@@ROWCOUNT > 0)
BEGIN
	ROLLBACK;
	RAISERROR ('Level 2 NEW NAMES already exist; cannot rename', 16, 1, @cnt1, @cnt2);
	RETURN;
END


UPDATE	l2
	SET		level_2_address_component_nm	=	d.new_nm,
			audit_log_id	=	@al
FROM	level_2_address_components	l2
	JOIN	@l2_renames	d
		ON	(	l2.level_2_address_component_id	=	d.l2_id
			AND	l2.level_2_address_component_nm	=	d.l2_nm
			);

SET @cnt2 = @@ROWCOUNT;
IF (@cnt1 != @cnt2)
BEGIN
	ROLLBACK;
	SELECT	d.*
	FROM	@l2_renames	d
		LEFT JOIN	level_2_address_components	l2
			ON	(	l2.level_2_address_component_id	=	d.l2_id
				AND	l2.level_2_address_component_nm	=	d.l2_nm
				)
	WHERE	l2.level_2_address_component_id	IS	NULL;
	RAISERROR ('Row counts of Level 2 RENAMES mis-match; should be %d, but update only %d', 16, 1, @cnt1, @cnt2);
	RETURN;
END

--	==================================================
--	Alternate Country Names
--	==================================================

INSERT	INTO	@c_alternates		VALUES	(	129,	'Cocos (Keeling) Islands',		'Cocos Islands'							),
											(	129,	'Cocos (Keeling) Islands',		'Keeling Islands'						),
											(	129,	'Cocos (Keeling) Islands',		'Territory of Cocos (Keeling) Islands'	);

SET @cnt1 = @@ROWCOUNT;

INSERT	INTO	alternate_address_component_names
		(	country_id, alternate_address_component_nm, audit_log_id	)
	SELECT	a.c_id, a.alt_nm, @al
FROM	countries	c
	JOIN	@c_alternates	a
		ON	(	c.country_id	=	a.c_id
			AND	c.country_nm	=	a.c_nm
			);
SET @cnt2 = @@ROWCOUNT;
IF (@cnt1 != @cnt2)
BEGIN
	SELECT	a.*
	FROM	@c_alternates	a
		LEFT JOIN	countries	c
			ON	(	c.country_id	=	a.c_id
				AND	c.country_nm	=	a.c_nm
				)
	WHERE	c.country_id	IS	NULL;
	RAISERROR ('Row counts of Countries mis-match; should be %d, but inserted only %d', 16, 1, @cnt1, @cnt2);
	ROLLBACK;
	RETURN;
END


--	==================================================
--	Alternate Level 1 Names
--	==================================================

INSERT	INTO	@l1_alternates		VALUES	(	4125,	'Pemba North (Kaskazini Pemba)',			'Pemba North',				'Kaskazini Pemba'	),
											(	4126,	'Pemba South (Kusini Pemba)',				'Pemba South',				'Kusini Pemba'		),
											(	4135,	'Zanzibar North (Kaskazini Unguja)',		'Zanzibar North',			'Kaskazini Unguja'	),
											(	4136,	'Zanzibar South & Central (Kusini Unguja)',	'Zanzibar South & Central',	'Kusini Unguja'		),
											(	4137,	'Zanzibar Urban West (Mjini Magharibi)',	'Zanzibar Urban West',		'Mjini Magharibi'	);

SET @cnt1 = @@ROWCOUNT;

INSERT	INTO	alternate_address_component_names
		(	level_1_address_component_id, alternate_address_component_nm, audit_log_id	)
	SELECT	a.l1_id, a.alt_nm, @al
FROM	level_1_address_components	l1
	JOIN	@l1_alternates	a
		ON	(	l1.level_1_address_component_id	=	a.l1_id
			AND	l1.level_1_address_component_nm	=	a.l1_nm
			);
SET @cnt2 = @@ROWCOUNT;
IF (@cnt1 != @cnt2)
BEGIN
	SELECT	a.*
	FROM	@l1_alternates	a
		LEFT JOIN	level_1_address_components	l1
			ON	(	l1.level_1_address_component_id	=	a.l1_id
				AND	l1.level_1_address_component_nm	=	a.l1_nm
				)
	WHERE	l1.level_1_address_component_id	IS	NULL;
	RAISERROR ('Row counts of Alternate Level 1 Address Components mis-match; should be %d, but inserted only %d', 16, 1, @cnt1, @cnt2);
	ROLLBACK;
	RETURN;
END


UPDATE	l1
	SET		level_1_address_component_nm	=	d.new_nm,
			audit_log_id	=	@al
FROM	level_1_address_components	l1
	JOIN	@l1_alternates	d
		ON	(	l1.level_1_address_component_id	=	d.l1_id
			AND	l1.level_1_address_component_nm	=	d.l1_nm
			);

SET @cnt2 = @@ROWCOUNT;
IF (@cnt1 != @cnt2)
BEGIN
	SELECT	d.*
	FROM	@l1_alternates	d
		LEFT JOIN	level_1_address_components	l1
			ON	(	l1.level_1_address_component_id	=	d.l1_id
				AND	l1.level_1_address_component_nm	=	d.l1_nm
				)
	WHERE	l1.level_1_address_component_id	IS	NULL;
	ROLLBACK;
	RAISERROR ('Row counts of Level 1 RENAMES mis-match; should be %d, but update only %d', 16, 1, @cnt1, @cnt2);
	RETURN;
END


--	==================================================
--	Alternate Level 2 Names
--	==================================================

INSERT	INTO	@l2_alternates
				VALUES	(	 7492,	'Azil Abdelkader (Metkouak)',		'Azil Abdelkader',	'Metkouak'			),
						(	 7629,	'Besbes (Ouled Harkat)',			'Besbes',			'Ouled Harkat'		),
						(	 7634,	'Chouaiba (Ouled Rahma)',			'Chouaiba',			'Ouled Rahma'		),
						(	 7654,	'Ras Miaad (Ouled Sassi)',			'Ras Miaad',		'Ouled Sassi'		),
						(	 7742,	'El Mokrani (El Madjen)',			'El Mokrani',		'El Madjen'			),
						(	 7762,	'Zbarbar (El Isseri)',				'Zbarbar',			'El Isseri'			),
						(	 7832,	'Ben Badis (El Horia)',				'Ben Badis',		'El Horia'			),
						(	 8232,	'Hassaine (Beni Yahi)',				'Hassaine',			'Beni Yahi'			),
						(	 8282,	'Menaa (Ouled Atia)',				'Menaa',			'Ouled Atia'		),
						(	 6386,	'Antwerpen (Anvers)',				'Antwerpen',		'Anvers'			),
						(	 6387,	'Mechelen (Malines)',				'Mechelen',			'Malines'			),
						(	 6389,	'Brussel (Bruxelles)',				'Brussel',			'Bruxelles'			),
						(	 6390,	'Aalst (Alost)',					'Aalst',			'Alost'				),
						(	 6391,	'Dendermonde (Termonde)',			'Dendermonde',		'Termonde'			),
						(	 6393,	'Gent (Gand)',						'Gent',				'Gand'				),
						(	 6394,	'Oudenaarde (Audenarde)',			'Oudenaarde',		'Audenarde'			),
						(	 6395,	'Sint-Niklaas (Saint-Nicolas)',		'Sint-Niklaas',		'Saint-Nicolas'		),
						(	 6396,	'Halle-Vilvoorde (Hal-Vilvorde)',	'Halle-Vilvoorde',	'Hal-Vilvorde'		),
						(	 6397,	'Leuven (Louvain)',					'Leuven',			'Louvain'			),
						(	 6398,	'Aat (Ath)',						'Aat',				'Ath'				),
						(	 6401,	'Bergen (Mons)',					'Bergen',			'Mons'				),
						(	 6404,	'Doornik (Tournai)',				'Doornik',			'Tournai'			),
						(	 6400,	'Moeskroen (Mouscron)',				'Moeskroen',		'Mouscron'			),
						(	 6402,	'Zinnik (Soignies)',				'Zinnik',			'Soignies'			),
						(	 6408,	'Borgworm (Waremme)',				'Borgworm',			'Waremme'			),
						(	 6405,	'Hoei (Huy)',						'Hoei',				'Huy'				),
						(	 6406,	'Luik (Liege)',						'Luik',				'Liege'				),
						(	 6411,	'Tongeren (Tongres)',				'Tongeren',			'Tongres'			),
						(	 6412,	'Aarlen (Arlon)',					'Aarlen',			'Arlon'				),
						(	 6413,	'Bastenaken (Bastogne)',			'Bastenaken',		'Bastogne'			),
						(	 6418,	'Namen (Namur)',					'Namen',			'Namur'				),
						(	 6420,	'Nijvel (Nivelles)',				'Nijvel',			'Nivelles'			),
						(	 6421,	'Brugge (Bruges)',					'Brugge',			'Bruges'			),
						(	 6422,	'Diksmuide (Dixmude)',				'Diksmuide',		'Dixmude'			),
						(	 6423,	'Ieper (Ypres)',					'Ieper',			'Ypres'				),
						(	 6424,	'Kortrijk (Courtrai)',				'Kortrijk',			'Courtrai'			),
						(	 6425,	'Oostende (Ostende)',				'Oostende',			'Ostende'			),
						(	 6426,	'Roeselare (Roulers)',				'Roeselare',		'Roulers'			),
						(	 6428,	'Veurne (Furnes)',					'Veurne',			'Furnes'			),
						(	51983,	'L''Ile-Des-Soeurs (Nuns'' Island)','L''Ile-Des-Soeurs','Nuns'' Island'		),
						(	10891,	'Manaure [Balcon del Cesar]',		'Manaure',			'Balcon del Cesar'	),
						(	40117,	'La Me (Massan)',					'La Me',			'Massan'			),
						(	 5513,	'Kachi (Bolan)',					'Kachhi',			'Bolan'				);


SET @cnt1 = @@ROWCOUNT;

INSERT	INTO	alternate_address_component_names
		(	level_2_address_component_id, alternate_address_component_nm, audit_log_id	)
	SELECT	a.l2_id, a.alt_nm, @al
	FROM	level_2_address_components	l2
		JOIN	@l2_alternates	a
			ON	(	l2.level_2_address_component_id	=	a.l2_id
				AND	l2.level_2_address_component_nm	=	a.l2_nm
				);
SET @cnt2 = @@ROWCOUNT;
IF (@cnt1 != @cnt2)
BEGIN
	SELECT	a.*
	FROM	@l2_alternates	a
		LEFT JOIN	level_2_address_components	l2
			ON	(	l2.level_2_address_component_id	=	a.l2_id
				AND	l2.level_2_address_component_nm	=	a.l2_nm
				)
	WHERE	l2.level_2_address_component_id	IS	NULL;
	RAISERROR ('Row counts of Alternate Level 2 Address Components mis-match; should be %d, but inserted only %d', 16, 1, @cnt1, @cnt2);
	ROLLBACK;
	RETURN;
END


UPDATE	l2
	SET		level_2_address_component_nm	=	d.new_nm,
			audit_log_id	=	@al
FROM	level_2_address_components	l2
	JOIN	@l2_alternates	d
		ON	(	l2.level_2_address_component_id	=	d.l2_id
			AND	l2.level_2_address_component_nm	=	d.l2_nm
			);

SET @cnt2 = @@ROWCOUNT;
IF (@cnt1 != @cnt2)
BEGIN
	SELECT	d.*
	FROM	@l2_alternates	d
		LEFT JOIN	level_2_address_components	l2
			ON	(	l2.level_2_address_component_id	=	d.l2_id
				AND	l2.level_2_address_component_nm	=	d.l2_nm
				)
	WHERE	l2.level_2_address_component_id	IS	NULL;
	RAISERROR ('Row counts of Level 2 RENAMES mis-match; should be %d, but update only %d', 16, 1, @cnt1, @cnt2);
	ROLLBACK;
	RETURN;
END



--	===============================================================================================================================
--	When Alternate has been provided, invalidating (making ineffective) the SIBLING entry where the Name matches the Alternate Name
--	===============================================================================================================================

UPDATE	ll2
	SET		effective_till	=	@eftdt,
			audit_log_id	=	@al
--	SELECT	l2.level_2_address_component_nm, a.alternate_address_component_nm, l2.level_1_address_component_id, ll2.level_2_address_component_nm, ll2.effective_from, ll2.effective_till, ll2.audit_log_id, l2.effective_from, l2.effective_till
FROM	alternate_address_component_names a
	JOIN	level_2_address_components	l2
		ON	(	l2.level_2_address_component_id	=	a.level_2_address_component_id	)
	JOIN	level_2_address_components	ll2
		ON	(	l2.level_1_address_component_id	=	ll2.level_1_address_component_id
			AND	ll2.level_2_address_component_nm	=	a.alternate_address_component_nm
			AND	GETDATE() BETWEEN ll2.effective_from AND ll2.effective_till
			);


UPDATE	ll1
	SET		effective_till	=	@eftdt,
			audit_log_id	=	@al
--	SELECT	l1.level_1_address_component_nm, a.alternate_address_component_nm, l1.country_id, ll1.level_1_address_component_nm, ll1.effective_from, ll1.effective_till, ll1.audit_log_id, l1.effective_from, l1.effective_till
FROM	alternate_address_component_names a
	JOIN	level_1_address_components	l1
		ON	(	l1.level_1_address_component_id	=	a.level_1_address_component_id	)
	JOIN	level_1_address_components	ll1
		ON	(	l1.country_id	=	ll1.country_id
			AND	ll1.level_1_address_component_nm	=	a.alternate_address_component_nm
			AND	GETDATE() BETWEEN ll1.effective_from AND ll1.effective_till
			);


UPDATE	c
	SET		effective_till	=	@eftdt,
			audit_log_id	=	@al
--	SELECT	a.alternate_address_component_nm, c.country_nm, c.effective_from, c.effective_till, c.audit_log_id
FROM	alternate_address_component_names a
	JOIN	countries	c
		ON	(	c.country_nm	=	a.alternate_address_component_nm
			AND	GETDATE() BETWEEN c.effective_from AND c.effective_till
			AND	a.country_id	IS	NOT	NULL
			);


--	==================================================

SELECT	*
FROM	view_alternate_address_component_names
ORDER	BY	1 DESC;

SELECT	*
FROM	level_3_address_components
WHERE	audit_log_id	=	@al
ORDER	BY	8, 4, 3;

SELECT	*
FROM	level_2_address_components
WHERE	audit_log_id	=	@al
ORDER	BY	8, 4, 3;

SELECT	*
FROM	level_1_address_components
WHERE	audit_log_id	=	@al
ORDER	BY	8, 4, 3;

SELECT	*
FROM	countries
WHERE	audit_log_id	=	@al
ORDER	BY	3;

