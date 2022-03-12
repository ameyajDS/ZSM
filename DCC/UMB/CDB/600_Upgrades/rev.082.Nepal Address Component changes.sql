BEGIN TRAN;
--ROLLBACK;
--COMMIT;

DECLARE
	@fdt	DATE	=	GETDATE(),
	@tdt	DATE	=	'31 Dec 9999',
	@eftdt	DATE	=	GETDATE(),
	@al		INTEGER,	--	audit_log_id
	@cid	INTEGER,	--	Country ID
	@cnt1	INTEGER,
	@cnt2	INTEGER,
	@cnt3	INTEGER;

SET @eftdt = DATEADD (d, -1, @eftdt);

SELECT	@cid = country_id
FROM	countries
WHERE	country_nm = 'Nepal';

INSERT INTO	audit_logs
		(	[session_id], [application_id], [user_no], [user_role_id], [operation], [screen_id], [object_id], [operation_dts], [is_consumed]	)
	VALUES
		(	0, 'Script', 1, 'System', 'I', 'rev082', 'Nepal-Address Components', GETDATE(), 0	);
	SET @al	=	SCOPE_IDENTITY ();

UPDATE	countries
	SET	level_1_address_component	=	'Province',
		level_3_address_component	=	'City/Town/Village',
		audit_log_id				=	@al
WHERE	country_id	=	@cid;

IF (@@ROWCOUNT != 1)
BEGIN
	ROLLBACK;
	RAISERROR ('Setting Address Component 1 & 3 for Nepal failed', 16, 1);
	RETURN;
END

--	==================================================
--	Level 1
--	==================================================

--	Set ineffective, which are not valid

UPDATE	level_1_address_components
	SET	effective_till	=	@eftdt,
		audit_log_id	=	@al
WHERE	country_id	=	@cid
AND		level_1_address_component_nm	NOT	IN	(	'Bagmati', 'Gandaki', 'Karnali', 'Lumbini'	);

IF (@@ROWCOUNT != 11)
BEGIN
	ROLLBACK;
	RAISERROR ('Setting Level 1 Address Components to be ineffective failed', 16, 1);
	RETURN;
END

DECLARE	@l1_components	TABLE
	(	l1_nm	VARCHAR (40)	NOT	NULL,
		l1_cd	VARCHAR (10)	NOT	NULL
	);


INSERT	INTO	@l1_components	VALUES	(	'Province No. 1',	'P1'	),
										(	'Province No. 2',	'P2'	),
										(	'Sudurpashchim',	'SP'	);

SET @cnt1 = @@ROWCOUNT;

INSERT INTO level_1_address_components
		(	level_1_address_component_cd, level_1_address_component_nm, country_id, is_authentic, effective_from, effective_till, frro_level1_nm, audit_log_id	)
	SELECT	l1_cd, l1_nm, @cid, 1, @fdt, @tdt, l1_nm, @al
	FROM	@l1_components;

SET @cnt3 = @@ROWCOUNT;
IF (@cnt1 != @cnt3)
BEGIN
	RAISERROR ('Row counts of New Level 1 components mis-match; should be %d, but added only %d', 16, 1, @cnt1, @cnt3);
	ROLLBACK;
	RETURN;
END

PRINT 'Level 1 INSERTs ' + CONVERT (VARCHAR, @cnt1);

--	==================================================
--	Level 2
--	==================================================

DECLARE	@l2_ineffective	TABLE
	(	l2_id	INTEGER			NOT	NULL	PRIMARY	KEY,
		l2_nm	VARCHAR (40)	NOT	NULL
	);


INSERT	INTO	@l2_ineffective	VALUES	(	765,	'Dailekh (Narayan)'			),
										(	766,	'Jajarkot (Khalanga)'		),
										(	743,	'Nawalparasi (Parasi)'		),
										(	51338,	'Rampur'					),
										(	755,	'Rukum (Musikot)'			),
										(	756,	'Salyan (Salyan Khalanga)'	),
										(	51351,	'Surkhet'					);

SET @cnt1 = @@ROWCOUNT;

UPDATE	l2
	SET		effective_till	=	@eftdt,
			audit_log_id	=	@al,
			level_2_address_component_nm	=	CASE WHEN t.l2_nm = 'Surkhet' THEN t.l2_nm + ' (not in use)'
													ELSE	level_2_address_component_nm
												END
FROM	level_2_address_components	l2
	JOIN	@l2_ineffective	t
		ON	(	l2.level_2_address_component_id	=	t.l2_id
			AND	l2.level_2_address_component_nm	=	t.l2_nm
			);

SET @cnt2 = @@ROWCOUNT;
IF (@cnt1 != @cnt2)
BEGIN
	ROLLBACK;
	RAISERROR ('Row counts of Level 2 INEFFECTIVE mis-match; should be %d, but update only %d', 16, 1, @cnt1, @cnt2);
	RETURN;
END

PRINT 'Level 2 Ineffective ' + CONVERT (VARCHAR, @cnt1);

--	==================================================

DECLARE	@l2_renames	TABLE
	(	l2_id	INTEGER			NOT	NULL	PRIMARY	KEY,
		l2_nm	VARCHAR (40)	NOT	NULL,
		new_nm	VARCHAR (40)	NOT	NULL,
		l1_cd	VARCHAR (10)	NOT NULL,
		l2_cd	VARCHAR (10)	NOT NULL
	);

INSERT	INTO	@l2_renames		VALUES	(	768,	'Achham (Mangalsen)',				'Achham',			'SP',	'AC'	),
										(	745,	'Arghakhanchi (Sandhikharka)',		'Arghakhanchi',		'L'	,	'AK'	),
										(	770,	'Bajhang (Chainpur)',				'Bajhang',			'SP',	'BJ'	),
										(	771,	'Bajura (Martadi)',					'Bajura',			'SP',	'BR'	),
										(	762,	'Banke (Nepalganj)',				'Banke',			'L'	,	'BK'	),
										(	731,	'Bara (Kalaiya)',					'Bara',				'P2',	'BR'	),
										(	763,	'Bardiya (Gulariya)',				'Bardiya',			'L'	,	'BD'	),
										(	734,	'Chitwan (Bharatpur)',				'Chitwan',			'BM',	'CW'	),
										(	752,	'Dang Deukhuri (Tribuvannagar)',	'Dang',				'L'	,	'DG'	),
										(	724,	'Dhading (Dhading Besi)',			'Dhading',			'BM',	'DD'	),
										(	717,	'Dhanusa (Janakpur)',				'Dhanusha',			'P2',	'DH'	),
										(	722,	'Dolakha (Charikot)',				'Dolakha',			'BM',	'DL'	),
										(	757,	'Dolpa (Dunai)',					'Dolpa',			'KN',	'DP'	),
										(	769,	'Doti (Dipayal)',					'Doti',				'SP',	'DT'	),
										(	746,	'Gulmi (Tamghas)',					'Gulmi',			'L'	,	'GL'	),
										(	758,	'Humla (Simikot)',					'Humla',			'KN',	'HL'	),
										(	759,	'Jumla (Jumla Khalanga)',			'Jumla',			'KN',	'JL'	),
										(	767,	'Kailali (Dhangadhi)',				'Kailali',			'SP',	'KL'	),
										(	760,	'Kalikot (Manma)',					'Kalikot',			'KN',	'KK'	),
										(	772,	'Kanchanpur (Bhim Datta)',			'Kanchanpur',		'SP',	'KC'	),
										(	737,	'Kaski (Pokhara)',					'Kaski',			'G'	,	'KK'	),
										(	726,	'Kavrepalanchok (Dhulikhel)',		'Kavrepalanchok',	'BM',	'KP'	),
										(	714,	'Khotang (Diktel)',					'Khotang',			'P1',	'KT'	),
										(	738,	'Lamjung (Besisahar)',				'Lamjung',			'G'	,	'LJ'	),
										(	718,	'Mahottari (Jaleswar)',				'Mahottari',		'P2',	'MT'	),
										(	735,	'Makwanpur (Hetauda)',				'Makwanpur',		'BM',	'MP'	),
										(	741,	'Manang (Chame)',					'Manang',			'G'	,	'MG'	),
										(	705,	'Morang (Biratnagar)',				'Morang',			'P1',	'MR'	),
										(	761,	'Mugu (Gamgadhi)',					'Mugu',				'KN',	'MG'	),
										(	751,	'Mustang (Jomsom)',					'Mustang',			'G'	,	'MT'	),
										(	749,	'Myagdi (Beni)',					'Myagdi',			'G'	,	'MD'	),
										(	728,	'Nuwakot (Bidur)',					'Nuwakot',			'BM',	'NK'	),
										(	747,	'Palpa (Tansen)',					'Palpa',			'L'	,	'PP'	),
										(	703,	'Panchthar (Phidim)',				'Panchthar',		'P1',	'PC'	),
										(	750,	'Parbat (Kusma)',					'Parbat',			'G'	,	'PB'	),
										(	732,	'Parsa (Birganj)',					'Parsa',			'P2',	'PR'	),
										(	753,	'Pyuthan (Pyuthan Khalanga)',		'Pyuthan',			'L'	,	'PT'	),
										(	721,	'Ramechhap (Manthali)',				'Ramechhap',		'BM',	'RC'	),
										(	729,	'Rasuwa (Dhunche)',					'Rasuwa',			'BM',	'RW'	),
										(	733,	'Rautahat (Gaur)',					'Rautahat',			'P2',	'RT'	),
										(	754,	'Rolpa (Liwang)',					'Rolpa',			'L'	,	'RP'	),
										(	744,	'Rupandehi (Siddharthanagar)',		'Rupandehi',		'L'	,	'RD'	),
										(	710,	'Sankhuwasabha (Khandbari)',		'Sankhuwasabha',	'P1',	'SW'	),
										(	711,	'Saptari (Rajbiraj)',				'Saptari',			'P2',	'SP'	),
										(	719,	'Sarlahi (Malangwa)',				'Sarlahi',			'P2',	'SL'	),
										(	720,	'Sindhuli (Kamalamai)',				'Sindhuli',			'BM',	'SD'	),
										(	730,	'Sindhupalchok (Chautara)',			'Sindhupalchok',	'BM',	'SP'	),
										(	716,	'Solukhumbu (Salleri)',				'Solukhumbu',		'P1',	'SK'	),
										(	706,	'Sunsari (Inaruwa)',				'Sunsari',			'P1',	'SS'	),
										(	764,	'Surkhet (Birendranagar)',			'Surkhet',			'KN',	'SK'	),
										(	740,	'Tanahu (Byas)',					'Tanahun',			'G'	,	'TH'	),
										(	709,	'Terhathum (Myanglung)',			'Tehrathum',		'P1',	'TT'	),
										(	713,	'Udayapur (Triyuga)',				'Udayapur',			'P1',	'UP'	);


SET @cnt1 = @@ROWCOUNT;

UPDATE	l2
	SET		level_2_address_component_nm	=	d.new_nm,
			level_2_address_component_cd	=	d.l2_cd,
			frro_level2_nm					=	d.new_nm,
			level_1_address_component_id	=	l1.level_1_address_component_id,
			audit_log_id	=	@al
FROM	level_2_address_components	l2
	JOIN	@l2_renames	d
		ON	(	l2.level_2_address_component_id	=	d.l2_id
			AND	l2.level_2_address_component_nm	=	d.l2_nm
			)
	JOIN	level_1_address_components	l1
		ON	(	l1.country_id					=	@cid
			AND	l1.level_1_address_component_cd	=	d.l1_cd
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
		LEFT JOIN	level_1_address_components	l1
			ON	(	l1.country_id					=	@cid
				AND	l1.level_1_address_component_cd	=	d.l1_cd
				)
	WHERE	l2.level_2_address_component_id	IS	NULL
	OR		l1.level_1_address_component_id	IS	NULL;
	RAISERROR ('Row counts of Level 2 RENAMES mis-match; should be %d, but update only %d', 16, 1, @cnt1, @cnt2);
	RETURN;
END

--	==================================================

DECLARE	@l2_level1s	TABLE
	(	l1_cd	VARCHAR (10)	NOT NULL,
		l2_id	INTEGER			NOT	NULL	PRIMARY	KEY,
		l2_nm	VARCHAR (40)	NOT	NULL
	);

INSERT	INTO	@l2_level1s		VALUES	(	'G',	748,	'Baglung'		),
										(	'SP',	774,	'Baitadi'		),
										(	'P1',	707,	'Bhojpur'		),
										(	'SP',	773,	'Dadeldhura'	),
										(	'KN',	51352,	'Dailekh'		),
										(	'SP',	775,	'Darchula'		),
										(	'P1',	708,	'Dhankuta'		),
										(	'G',	736,	'Gorkha'		),
										(	'P1',	702,	'Ilam'			),
										(	'KN',	51353,	'Jajarkot'		),
										(	'P1',	701,	'Jhapa'			),
										(	'P1',	715,	'Okhaldhunga'	),
										(	'KN',	51354,	'Salyan'		),
										(	'P2',	712,	'Siraha'		),
										(	'P1',	704,	'Taplejung'		),
										(	'KN',	51355,	'Western Rukum'	);

SET @cnt1 = @@ROWCOUNT;

UPDATE	l2
	SET		level_1_address_component_id	=	l1.level_1_address_component_id,
			audit_log_id	=	@al
FROM	level_2_address_components	l2
	JOIN	@l2_level1s	d
		ON	(	l2.level_2_address_component_id	=	d.l2_id
			AND	l2.level_2_address_component_nm	=	d.l2_nm
			)
	JOIN	level_1_address_components	l1
		ON	(	l1.country_id					=	@cid
			AND	l1.level_1_address_component_cd	=	d.l1_cd
			);

SET @cnt2 = @@ROWCOUNT;
IF (@cnt1 != @cnt2)
BEGIN
	ROLLBACK;
	SELECT	d.*
	FROM	@l2_level1s	d
		LEFT JOIN	level_2_address_components	l2
			ON	(	l2.level_2_address_component_id	=	d.l2_id
				AND	l2.level_2_address_component_nm	=	d.l2_nm
				)
		LEFT JOIN	level_1_address_components	l1
			ON	(	l1.country_id					=	@cid
				AND	l1.level_1_address_component_cd	=	d.l1_cd
				)
	WHERE	l2.level_2_address_component_id	IS	NULL
	OR		l1.level_1_address_component_id	IS	NULL;
	RAISERROR ('Row counts of Level 2 Address Commponents for correcting Level 1 mis-match; should be %d, but update only %d', 16, 1, @cnt1, @cnt2);
	RETURN;
END

--	==================================================

DECLARE	@l2_components	TABLE
	(	l1_cd	VARCHAR (10)	NOT	NULL,
		l2_cd	VARCHAR (10)	NOT	NULL,
		l2_nm	VARCHAR (40)	NOT	NULL,
			PRIMARY	KEY	(	l1_cd, l2_cd	),
			UNIQUE		(	l1_cd, l2_nm	)
	);

INSERT	INTO	@l2_components	VALUES	(	'L',	'ER',	'Eastern Rukum'	),
										(	'G',	'NP',	'Nawalpur'		),
										(	'L',	'PS',	'Parasi'		);
SET @cnt1 = @@ROWCOUNT;
	
INSERT INTO level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic, effective_from, effective_till, frro_level2_nm, audit_log_id	)
	SELECT	l2.l2_cd, l2.l2_nm, l1.level_1_address_component_id, 1, @fdt, @tdt, l2.l2_nm, @al
	FROM	@l2_components	l2
		JOIN	level_1_address_components	l1
			ON	(	l1.country_id					=	@cid
				AND	l1.level_1_address_component_cd	=	l2.l1_cd
				);
SET @cnt2 = @@ROWCOUNT;

IF (@cnt1 != @cnt2)
BEGIN
	ROLLBACK;
	SELECT	d.*
	FROM	@l2_components	d
		LEFT JOIN	level_2_address_components	l2
			ON	(	l2.level_2_address_component_cd	=	d.l2_cd
				AND	l2.level_2_address_component_nm	=	d.l2_nm
				)
		LEFT JOIN	level_1_address_components	l1
			ON	(	l1.country_id					=	@cid
				AND	l1.level_1_address_component_cd	=	d.l1_cd
				)
	WHERE	l2.level_2_address_component_id	IS	NULL
	OR		l1.level_1_address_component_id	IS	NULL;
	RAISERROR ('Row counts of Level 2 RENAMES mis-match; should be %d, but update only %d', 16, 1, @cnt1, @cnt2);
	RETURN;
END

--	==================================================
--	Level 3
--	==================================================

DECLARE	@l3_ineffective	TABLE
	(	l3_id	INTEGER			NOT	NULL	PRIMARY	KEY,
		l3_nm	VARCHAR (40)	NOT	NULL
	);


INSERT	INTO	@l3_ineffective	VALUES	(	226200,	'Jajarkot'						),
										(	211843,	'Dolakha (Charikot)'			),
										(	211864,	'Nawalparasi (Parasi)'			),
										(	211836,	'Okhaldhunga'			),
										(	226201,	'Salyan'				),
										(	226198,	'Surkhet'				),
										(	226202,	'Western Rukum'			);

SET @cnt1 = @@ROWCOUNT;

UPDATE	l3
	SET		effective_till	=	@eftdt,
			audit_log_id	=	@al
FROM	level_3_address_components	l3
	JOIN	@l3_ineffective	t
		ON	(	l3.level_3_address_component_id	=	t.l3_id
			AND	l3.level_3_address_component_nm	=	t.l3_nm
			);

SET @cnt2 = @@ROWCOUNT;
IF (@cnt1 != @cnt2)
BEGIN
	ROLLBACK;
	RAISERROR ('Row counts of Level 3 INEFFECTIVE mis-match; should be %d, but update only %d', 16, 1, @cnt1, @cnt2);
	RETURN;
END

PRINT 'Level 3 Ineffective ' + CONVERT (VARCHAR, @cnt1);

--	==================================================

DECLARE	@l3_renames	TABLE
	(	l2_nm	VARCHAR (40)	NOT	NULL,
		new_nm	VARCHAR (40)	NOT	NULL,
		l1_cd	VARCHAR (10)	NOT NULL,
		l3_id	INTEGER			NOT	NULL	PRIMARY	KEY,
		l3_nm	VARCHAR (40)	NOT	NULL,
		l3_cd	VARCHAR (10)	NOT NULL
	);

INSERT	INTO	@l3_renames		VALUES	(	'Achham',			'Mangalsen',		'SP',	211889,	'Achham (Mangalsen)',			'MS'	),
										(	'Arghakhanchi',		'Sandhikharka',		'L',	211866,	'Arghakhanchi (Sandhikharka)',	'SD'	),
										(	'Sankhuwasabha',	'Chainpur',			'P1',	211891,	'Bajhang (Chainpur)',			'CP'	),
										(	'Bajura',			'Martadi',			'SP',	211892,	'Bajura (Martadi)',				'MR'	),
										(	'Banke',			'Nepalganj',		'L',	211883,	'Banke (Nepalganj)',			'NG'	),
										(	'Bara',				'Kalaiya',			'P2',	211852,	'Bara (Kalaiya)',				'KL'	),
										(	'Bardiya',			'Gulariya',			'L',	211884,	'Bardiya (Gulariya)',			'GL'	),
										(	'Chitwan',			'Bharatpur',		'BM',	211855,	'Chitwan (Bharatpur)',			'BP'	),
										(	'Dailekh',			'Narayan',			'KN',	211886,	'Dailekh (Narayan)',			'NR'	),
										(	'Dhading',			'Dhading Besi',		'BM',	211845,	'Dhading (Dhading Besi)',		'DB'	),
										(	'Dang',				'Ghorahi',			'L',	211873,	'Dang Deukhuri (Tribuvannagar)','GR'	),
										(	'Dhanusha',			'Janakpur',			'P2',	211838,	'Dhanusa (Janakpur)',			'JP'	),
										(	'Dolpa',			'Dunai',			'KN',	211878,	'Dolpa (Dunai)',				'DN'	),
										(	'Doti',				'Dipayal Silgadhi',	'SP',	211890,	'Doti (Dipayal)',				'DS'	),
										(	'Gulmi',			'Tamghas',			'L',	211867,	'Gulmi (Tamghas)',				'TG'	),
										(	'Humla',			'Simikot',			'KN',	211879,	'Humla (Simikot)',				'SM'	),
										(	'Jajarkot',			'Khalanga',			'KN',	211887,	'Jajarkot (Khalanga)',			'KH'	),
										(	'Jumla',			'Jumla',			'KN',	211880,	'Jumla (Jumla Khalanga)',		'JM'	),
										(	'Kailali',			'Dhangadhi',		'SP',	211888,	'Kailali (Dhangadhi)',			'DG'	),
										(	'Kalikot',			'Manma',			'KN',	211881,	'Kalikot (Manma)',				'MM'	),
										(	'Kanchanpur',		'Bheemdatta',		'SP',	211893,	'Kanchanpur (Bhim Datta)',		'BM'	),
										(	'Kaski',			'Pokhara',			'G',	211858,	'Kaski (Pokhara)',				'PK'	),
										(	'Kavrepalanchok',	'Dhulikhel',		'BM',	211847,	'Kavrepalanchok (Dhulikhel)',	'DL'	),
										(	'Khotang',			'Diktel',			'P1',	211835,	'Khotang (Diktel)',				'DK'	),
										(	'Lamjung',			'Besisahar',		'G',	211859,	'Lamjung (Besisahar)',			'BS'	),
										(	'Kanchanpur',		'Mahendranagar',	'SP',	226197,	'Mahendranagar',				'MN'	),
										(	'Mahottari',		'Jaleshwar',		'P2',	211839,	'Mahottari (Jaleswar)',			'JW'	),
										(	'Makwanpur',		'Hetauda',			'BM',	211856,	'Makwanpur (Hetauda)',			'HT'	),
										(	'Manang',			'Chame',			'G',	211862,	'Manang (Chame)',				'CM'	),
										(	'Morang',			'Biratnagar',		'P1',	211826,	'Morang (Biratnagar)',			'BT'	),
										(	'Mugu',				'Gamgadhi',			'KN',	211882,	'Mugu (Gamgadhi)',				'GG'	),
										(	'Mustang',			'Jomsom',			'G',	211872,	'Mustang (Jomsom)',				'JS'	),
										(	'Myagdi',			'Beni',				'G',	211870,	'Myagdi (Beni)',				'BN'	),
										(	'Nuwakot',			'Bidur',			'BM',	211849,	'Nuwakot (Bidur)',				'BD'	),
										(	'Palpa',			'Tansen',			'L',	211868,	'Palpa (Tansen)',				'TS'	),
										(	'Panchthar',		'Phidim',			'P1',	211824,	'Panchthar (Phidim)',			'PD'	),
										(	'Parbat',			'Kusma',			'G',	211871,	'Parbat (Kusma)',				'KS'	),
										(	'Parsa',			'Birgunj',			'P2',	211853,	'Parsa (Birganj)',				'BG'	),
										(	'Pyuthan',			'Pyuthan',			'L',	211874,	'Pyuthan (Pyuthan Khalanga)',	'PT'	),
										(	'Ramechhap',		'Manthali',			'BM',	211842,	'Ramechhap (Manthali)',			'MT'	),
										(	'Palpa',			'Rampur',			'L',	225509,	'RAMPUR',						'RP'	),
										(	'Rasuwa',			'Dhunche',			'BM',	211850,	'Rasuwa (Dhunche)',				'DC'	),
										(	'Rautahat',			'Gaur',				'P2',	211854,	'Rautahat (Gaur)',				'GR'	),
										(	'Rolpa',			'Liwang',			'L',	211875,	'Rolpa (Liwang)',				'LW'	),
										(	'Western Rukum',	'Musikot',			'KN',	211876,	'Rukum (Musikot)',				'MK'	),
										(	'Rupandehi',		'Siddharthanagar',	'L',	211865,	'Rupandehi (Siddharthanagar)',	'SN'	),
										(	'Salyan',			'Salyan Khalanga',	'KN',	211877,	'Salyan (Salyan Khalanga)',		'SK'	),
										(	'Sankhuwasabha',	'Khandbari',		'P1',	211831,	'Sankhuwasabha (Khandbari)',	'KB'	),
										(	'Saptari',			'Rajbiraj',			'P2',	211832,	'Saptari (Rajbiraj)',			'RB'	),
										(	'Sarlahi',			'Malangwa',			'P2',	211840,	'Sarlahi (Malangwa)',			'MG'	),
										(	'Sindhuli',			'Kamalamai',		'BM',	211841,	'Sindhuli (Kamalamai)',			'KM'	),
										(	'Sindhupalchok',	'Chautara',			'BM',	211851,	'Sindhupalchok (Chautara)',		'CT'	),
										(	'Solukhumbu',		'Salleri',			'P1',	211837,	'Solukhumbu (Salleri)',			'SL'	),
										(	'Sunsari',			'Inaruwa',			'P1',	211827,	'Sunsari (Inaruwa)',			'IR'	),
										(	'Surkhet',			'Birendranagar',	'KN',	211885,	'Surkhet (Birendranagar)',		'BR'	),
										(	'Syangja',			'Syangja Bazar',	'G',	211860,	'Syangja',						'SB'	),
										(	'Darchula',			'Byas',				'SP',	211861,	'Tanahu (Byas)',				'BY'	),
										(	'Tehrathum',		'Myanglung',		'P1',	211830,	'Terhathum (Myanglung)',		'ML'	),
										(	'Udayapur',			'Triyuga',			'P1',	211834,	'Udayapur (Triyuga)',			'TY'	);


SET @cnt1 = @@ROWCOUNT;

UPDATE	l3
	SET		level_3_address_component_nm	=	d.new_nm,
			level_3_address_component_cd	=	d.l3_cd,
			frro_level3_nm					=	d.new_nm,
			level_2_address_component_id	=	l2.level_2_address_component_id,
			audit_log_id	=	@al
FROM	level_3_address_components	l3
	JOIN	@l3_renames	d
		ON	(	l3.level_3_address_component_id	=	d.l3_id
			AND	l3.level_3_address_component_nm	=	d.l3_nm
			)
	JOIN	level_1_address_components	l1
		ON	(	l1.country_id					=	@cid
			AND	l1.level_1_address_component_cd	=	d.l1_cd
			)
	JOIN	level_2_address_components	l2
		ON	(	l2.level_2_address_component_nm	=	d.l2_nm
			AND	l2.level_1_address_component_id	=	l1.level_1_address_component_id
			);

SET @cnt3 = @@ROWCOUNT;
IF (@cnt1 != @cnt3)
BEGIN
	ROLLBACK;
	SELECT	*
	FROM	@l3_renames	d
		LEFT JOIN	level_3_address_components	l3
			ON	(	l3.level_3_address_component_id	=	d.l3_id
				AND	l3.level_3_address_component_nm	=	d.l3_nm
				)
		LEFT JOIN	level_1_address_components	l1
			ON	(	l1.country_id					=	@cid
				AND	l1.level_1_address_component_cd	=	d.l1_cd
				)
		LEFT JOIN	level_2_address_components	l2
			ON	(	l2.level_2_address_component_nm	=	d.l2_nm
				AND	l2.level_1_address_component_id	=	l1.level_1_address_component_id
				)
	WHERE	l3.level_3_address_component_id	IS	NULL
	OR		l2.level_2_address_component_id	IS	NULL
	OR		l1.level_1_address_component_id	IS	NULL;
	RAISERROR ('Row counts of Level 3 RENAMES mis-match; should be %d, but update only %d', 16, 1, @cnt1, @cnt2);
	RETURN;
END

--	==================================================

DECLARE	@l3_components	TABLE
	(	l1_cd	VARCHAR (10)	NOT	NULL,
		l3_cd	VARCHAR (10)	NOT	NULL,
		l2_nm	VARCHAR (40)	NOT	NULL,
		l3_nm	VARCHAR (40)	NOT	NULL,
			PRIMARY	KEY	(	l1_cd, l2_nm, l3_cd	),
			UNIQUE		(	l1_cd, l2_nm, l3_nm	)
	);

INSERT	INTO	@l3_components	VALUES	(	'SP',	'DC',	'Baitadi',			'Dasharathchand'	),
										(	'SP',	'JP',	'Bajhang',			'Jayaprithvi'		),
										(	'SP',	'AG',	'Dadeldhura',		'Amargadhi'			),
										(	'L',	'DK',	'Dang',				'Deukhuri'			),
										(	'BM',	'NK',	'Dhading',			'Nilkantha'			),
										(	'BM',	'BW',	'Dolakha',			'Bhimeshwar'		),
										(	'L',	'RK',	'Eastern Rukum',	'Rukumkot'			),
										(	'KN',	'CN',	'Jumla',			'Chandannath'		),
										(	'SP',	'GW',	'Kailali',			'Godawari'			),
										(	'L',	'TH',	'Kapilvastu',		'Taulihawa'			),
										(	'G',	'KS',	'Nawalpur',			'Kawasoti'			),
										(	'P1',	'SC',	'Okhaldhunga',		'Siddhicharan'		),
										(	'L',	'RG',	'Parasi',			'Ramgram'			),
										(	'G',	'DL',	'Tanahun',			'Damauli'			),
										(	'L',	'BW',	'Rupandehi',		'Butwal'			),
--										(	'G',	'SJ',	'Syangja',			'Syangja Bazar'		),
--										(	'SP',	'SY',	'Darchula',			'Byas'				);
										(	'P1',	'GG',	'Udayapur',			'Gaighat'			);
--										(	'KN',	'MT',	'Western Rukum',	'Musikot'			);

SET @cnt1 = @@ROWCOUNT;
	
INSERT INTO level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, frro_level3_nm, audit_log_id	)
	SELECT	l3.l3_cd, l3.l3_nm, l2.level_2_address_component_id, 1, @fdt, @tdt, l3.l3_nm, @al
	FROM	@l3_components	l3
		JOIN	level_1_address_components	l1
			ON	(	l1.country_id					=	@cid
				AND	l1.level_1_address_component_cd	=	l3.l1_cd
				)
		JOIN	level_2_address_components	l2
			ON	(	l2.level_2_address_component_nm	=	l3.l2_nm
				AND	l2.level_1_address_component_id	=	l1.level_1_address_component_id
				);
SET @cnt2 = @@ROWCOUNT;

IF (@cnt1 != @cnt2)
BEGIN
	ROLLBACK;
	SELECT	*
	FROM	@l3_components	d
		LEFT JOIN	level_3_address_components	l3
			ON	(	l3.level_3_address_component_cd	=	d.l3_cd
				AND	l3.level_3_address_component_nm	=	d.l3_nm
				)
		LEFT JOIN	level_1_address_components	l1
			ON	(	l1.country_id					=	@cid
				AND	l1.level_1_address_component_cd	=	d.l1_cd
				)
		LEFT JOIN	level_2_address_components	l2
			ON	(	l2.level_2_address_component_nm	=	d.l2_nm
				AND	l2.level_1_address_component_id	=	l1.level_1_address_component_id
				)
	WHERE	l3.level_3_address_component_id	IS	NULL
	OR		l1.level_1_address_component_id	IS	NULL;
	RAISERROR ('Row counts of Level 3 INSERTs mis-match; should be %d, but update only %d', 16, 1, @cnt1, @cnt2);
	RETURN;
END

--	=================================================
--	Level 3 Alternate Names
--	=================================================


DECLARE	@l3_alternates	TABLE
	(	l2_nm	VARCHAR (40)	NOT	NULL,
		l1_cd	VARCHAR (10)	NOT	NULL,
		l3_nm	VARCHAR (40)	NOT	NULL,
		alt_nm	VARCHAR (40)	NOT	NULL
	);

INSERT INTO	@l3_alternates	VALUES	(	'Dang',			'L',	'Ghorahi',		'Tribuvannagar'	),
									(	'Dolakha',		'BM',	'Bhimeshwar',	'Charikot'		),
									(	'Jumla',		'KN',	'Jumla',		'Kartik Swami'	),
									(	'Kapilvastu',	'L',	'Kapilvastu',	'Taulihawa'		),
									(	'Darchula',		'SP',	'Byas',			'Vyans'			);

SET @cnt1 = @@ROWCOUNT;

INSERT	INTO	alternate_address_component_names
		(	level_3_address_component_id, alternate_address_component_nm, audit_log_id	)
	SELECT	l3.level_2_address_component_id, a.alt_nm, @al
	FROM	@l3_alternates	a
		JOIN	level_1_address_components	l1
			ON	(	l1.country_id					=	@cid
				AND	l1.level_1_address_component_cd	=	a.l1_cd
				)
		JOIN	level_2_address_components	l2
			ON	(	l2.level_2_address_component_nm	=	a.l2_nm
				AND	l2.level_1_address_component_id	=	l1.level_1_address_component_id
				)
		JOIN	level_3_address_components	l3
			ON	(	l3.level_2_address_component_id	=	l2.level_2_address_component_id
				AND	l3.level_3_address_component_nm	=	a.l3_nm
				);
SET @cnt2 = @@ROWCOUNT;
IF (@cnt1 != @cnt2)
BEGIN
	RAISERROR ('Row counts of Alternate Level 3 Address Components mis-match; should be %d, but inserted only %d', 16, 1, @cnt1, @cnt2);
	ROLLBACK;
	RETURN;
END

--	=================================================
--	
--	=================================================

SELECT	*
FROM	countries
WHERE	audit_log_id	=	@al;

SELECT	*
FROM	level_1_address_components
WHERE	audit_log_id	=	@al
ORDER	BY	8, 3;

SELECT	*
FROM	level_2_address_components
WHERE	audit_log_id	=	@al
ORDER	BY	8, 3;

SELECT	*
FROM	level_3_address_components
WHERE	audit_log_id	=	@al
ORDER	BY	8, 4, 3;


SELECT	level_1_address_component_id_display, level_2_address_component_nm
FROM	view_level_2_address_components
WHERE	country_id	=	@cid
AND		GetDate()	BETWEEN	effective_from	AND	effective_till
ORDER BY 1, 2;


SELECT	level_1_address_component_id_display, level_2_address_component_id_display, level_3_address_component_nm
FROM	view_level_3_address_components
WHERE	country_id	=	@cid
AND		GetDate()	BETWEEN	effective_from	AND	effective_till
ORDER BY 1, 2, 3;

