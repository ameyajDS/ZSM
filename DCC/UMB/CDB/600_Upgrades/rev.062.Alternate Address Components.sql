BEGIN TRAN;
--ROLLBACK;
--COMMIT;

DECLARE
	@fdt	DATE	=	GETDATE(),
	@tdt	DATE	=	'31 Dec 9999',
	@al		INTEGER,	--	audit_log_id
	@cnt1	INTEGER,
	@cnt2	INTEGER,
	@cnt3	INTEGER;

INSERT INTO	audit_logs
		(	[session_id], [application_id], [user_no], [user_role_id], [operation], [screen_id], [object_id], [operation_dts], [is_consumed]	)
	VALUES
		(	0, 'Script', 1, 'System', 'I', 'rev062', 'Alternate Address Components', GETDATE(), 0	);
	SET @al	=	SCOPE_IDENTITY ();

DECLARE	@l1_alternates	TABLE
	(	l1_id	INTEGER			NOT	NULL,
		l1_nm	VARCHAR (40)	NOT	NULL,
		alt_nm	VARCHAR (40)	NOT	NULL,
			PRIMARY	KEY	(	l1_id, alt_nm	),
			UNIQUE		(	l1_nm, alt_nm	)
	);

DECLARE	@l2_alternates	TABLE
	(	l2_id	INTEGER			NOT	NULL,
		l2_nm	VARCHAR (40)	NOT	NULL,
		alt_nm	VARCHAR (40)	NOT	NULL,
			PRIMARY	KEY	(	l2_id, alt_nm	),
			UNIQUE		(	l2_nm, alt_nm	)
	);

DECLARE	@l3_alternates	TABLE
	(	l3_id	INTEGER			NOT	NULL,
		l3_nm	VARCHAR (40)	NOT	NULL,
		alt_nm	VARCHAR (40)	NOT	NULL,
			PRIMARY	KEY	(	l3_id, alt_nm	),
			UNIQUE		(	l3_nm, alt_nm	)
	);

--	==================================================
--	Alternate Level 1 Names
--	==================================================

INSERT	INTO	@l1_alternates		VALUES	(	3012,	'Noord-Holland',							'North Holland'				),
											(	3011,	'Noord-Brabant',							'North Brabant'				),
											(	3016,	'Zuid-Holland',								'South Holland'				),
											(	22,		'Odisha',									'Orissa'					),
											(	4153,	'Dadra and Nagar Haveli and Daman and Diu',	'Dadra and Nagar Haveli'	),
											(	4153,	'Dadra and Nagar Haveli and Daman and Diu',	'Daman and Diu'				);

SET @cnt1 = @@ROWCOUNT;

INSERT	INTO	alternate_address_component_names
		(	level_1_address_component_id, alternate_address_component_nm	)
	SELECT	a.l1_id, a.alt_nm
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


--	==================================================
--	Alternate Level 2 Names
--	==================================================

INSERT	INTO	@l2_alternates		VALUES	(	113,	'WEST CHAMPARAN',		'Pashchim Chamapran'			),
											(	100,	'EAST CHAMPARAN',		'Purvi Chamapran'				),
											(	201,	'Shimla',				'Simla'							),
											(	494,	'SRI GANGANAGAR',		'SRIGANGANAGAR'					),
											(	494,	'SRI GANGANAGAR',		'GANGANAGAR'					),
											(	239,	'PASCHIMI SINGHBHUM',	'WEST SINGHBHUM'				),
											(	240,	'PURBI SINGHBHUM',		'EAST SINGHBHUM'				),
											(	62,		'Dima Hasao',			'North Cachar Hills'			),
											(	2,		'Anantapuramu',			'Anantapur'						),
											(	15,		'SPS Nellore',			'Sri Potti Sriramulu Nellore'	),
											(	15,		'SPS Nellore',			'Nellore'						),
											(	22,		'VISAKHAPATNAM',		'Vizagapatam'					),
											(	20,		'VIZIANAGARAM',			'VIJAYANAGARAM'					),
											(	4,		'YSR',					'Kadapa'						),
											(	4,		'YSR',					'Cuddapah'						),
											(	63,		'SIVASAGAR',			'Sibsagar'						),
											(	52532,	'Udalguri',				'Odalguri'						),
											(	105,	'SARAN',				'Chapra'						),
											(	105,	'SARAN',				'Chhapra'						),
											(	51483,	'Balrampur',			'Balrampur-Ramanujganj'			),
											(	51484,	'Bijapur',				'Birjapur'						),
											(	121,	'DANTEWADA',			'DANTEWARA'						),
											(	121,	'DANTEWADA',			'DAKSHIN BASTAR'				),
											(	132,	'KORIYA',				'KOREA'							),
											(	147,	'ANAND',				'CHAROTAR'						),
											(	150,	'BHAVNAGAR',			'Gohilwar'						),
											(	51499,	'Chhota Udaipur',		'Chhota Udepur'					),
											(	176,	'Gurugram',				'GURGAON'						),
											(	216,	'Poonch',				'Punch'							),
											(	51504,	'Shopian',				'Shupiyan'						),
											(	51504,	'Shopian',				'Shupyan'						),
											(	51500,	'Bandipora',			'Bandipore'						),
											(	207,	'BARAMULLA',			'Varmul'						),
											(	243,	'SAHIBGANJ',			'SAHEBGANJ'						),

													-- Karnataka
											(	246,	'Bengaluru',			'BANGALORE'						),
											(	247,	'Bengaluru Rural',		'BANGALORE RURAL'				),
											(	248,	'Belagavi',				'BELGAUM'						),
											(	249,	'Ballari',				'BELLARY'						),
											(	251,	'Vijayapura',			'BIJAPUR'						),
											(	253,	'Chikkamagaluru',		'CHIKMAGALUR'					),
											(	254,	'Chikkaballapura',		'CHIKBALLAPUR'					),
											(	260,	'Kalaburagi',			'GULBARGA'						),
											(	267,	'Mysuru',				'MYSORE'						),
											(	270,	'Shivamogga',			'SHIMOGA'						),
											(	271,	'Tumakuru',				'TUMKUR'						),
											(	52541,	'Bagalkot',				'Bagalkote'						),
											(	52543,	'Yadagiri',				'Yadgiri'						),
											(	52543,	'Yadagiri',				'Yadgir'						),

													-- Kerala
											(	274,	'ALAPPUZHA',			'ALLEPPEY'		),
											(	284,	'KOZHIKODE',			'Calicut'		),
											(	280,	'KANNUR',				'CANNANORE'		),
											(	286,	'PALAKKAD',				'PALGHAT'		),
											(	291,	'THRISSUR',				'TRICHUR'		),
											(	290,	'THIRUVANANTHAPURAM',	'TRIVANDRUM'	),
											(	282,	'KOLLAM',				'QUILLON'		),

													-- MP
											(	311,	'DINDORI',			'RAMGARH'		),
											(	315,	'Narmadapuram',		'HOSHANGABAD'	),
											(	344,	'Tikamgarh',		'Tehri'			),

													-- Maharashtra
											(	384,	'Yavatmal',			'Yeotmal'		),

													-- Odisha
											(	425,	'Balasore',			'Baleshwar'		),
											(	425,	'Balasore',			'Baleswar'		),
											(	437,	'Jajpur',			'Jajapur'		),
											(	445,	'Khordha',			'Khurda'		),
											(	443,	'KENDUJHAR',		'KEONJHAR'		),
											(	449,	'NABARANGPUR',		'NABARANGAPUR'	),
											(	449,	'NABARANGPUR',		'Nawarangpur'	),
											(	456,	'SUBARNAPUR',		'SONAPUR'		);

SET @cnt1 = @@ROWCOUNT;

INSERT	INTO	alternate_address_component_names
		(	level_2_address_component_id, alternate_address_component_nm	)
	SELECT	a.l2_id, a.alt_nm
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


--	==================================================
--	Alternate Level 3 Address Component Names
--	==================================================

INSERT	INTO	@l3_alternates		VALUES	(	229641,	'Erki',				'Arki'			),
													--	Andhra Pradesh
											(	18935,	'VISAKHAPATNAM',	'Vizagapatam'	),
											(	18935,	'VISAKHAPATNAM',	'Vizag'			),
											(	18935,	'VISAKHAPATNAM',	'Visakha'		),
											(	18935,	'VISAKHAPATNAM',	'Waltair'		),
											(	8950,	'VIJAYWADA',		'Bezawada'		),
											(	18054,	'VIZIANAGARAM',		'VIJAYANAGARAM'	),

													--	Karnataka
											(	3167,	'Kadapa',			'CUDDAPAH'		),
											(	229768,	'Bagalkot',			'Bagalkote'		),
											(	229805,	'Yadagiri',			'Yadgiri'		),
											(	229805,	'Yadagiri',			'Yadgir'		),
											(	229787,	'Hosapete',			'Hospet'		),
											(	229797,	'Koodligi',			'Kudligi'		),
											(	229789,	'Huvina Hadagali',	'Hoovina Hadagali'	),
											(	229791,	'Kottur',			'Kotturu'		),
											(	229809,	'Gurmitkal',		'Gurumathkal'		),
											(	229811,	'Hunasagi',			'Hunasigi'		),
											(	229817,	'Shahpura',			'Shahpur'		),
											(	229818,	'Shorapura',		'Shorapur'		),
											(	229819,	'Wadgera',			'Vadagera'		),

													--	Kerala
											(	85136,	'ALAPPUZHA',			'ALLEPPEY'		),
											(	88258,	'KOZHIKODE',			'Calicut'		),
											(	225402,	'KANNUR',				'CANNANORE'		),
											(	225402,	'KANNUR',				'Cananor'		),
											(	225402,	'KANNUR',				'Kannanur'		),
											(	89396,	'PALAKKAD',				'PALGHAT'		),
											(	91628,	'THRISSUR',				'TRICHUR'		),
											(	225404,	'THIRUVANANTHAPURAM',	'TRIVANDRUM'	),
											(	87277,	'KOLLAM',				'QUILON'		),
											(	87277,	'KOLLAM',				'Koolam'		),
											(	87277,	'KOLLAM',				'Coulao'		),
											(	87277,	'KOLLAM',				'Desinganadu'	),
											(	85700,	'KOCHI',				'Cochin'		),

													-- MP
											(	92853,	'BARWANI',			'BADWANI'			),
											(	95312,	'DINDORI',			'RAMGARH'			),
											(	103121,	'Tikamgarh',		'Tehri'				),
											(	103122,	'Tikamgarh City',	'Tehri City'		),
											(	96021,	'Narmadapuram',		'HOSHANGABAD'		),
											(	96022,	'Narmadapuram CITY','HOSHANGABAD City'	),

													-- Maharashtra
											(	119444,	'Yavatmal',			'Yeotmal'			),
											(	110432,	'Mumbai',			'Bombay'			),

													-- Odisha
											(	225432,	'Jajpur',			'Jajapur'		),
											(	126908,	'Khordha',			'Khurda'		),
											(	225440,	'NABARANGPUR',		'NABARANGAPUR'	),
											(	225440,	'NABARANGPUR',		'Nawarangpur'	),
											(	126667,	'KENDUJHAR',		'Kendujhargarh'	),
											(	126667,	'KENDUJHAR',		'KEONJHAR'		),
											(	225443,	'SUBARNAPUR',		'SONAPUR'		);

SET @cnt1 = @@ROWCOUNT;

INSERT	INTO	alternate_address_component_names
		(	level_3_address_component_id, alternate_address_component_nm	)
	SELECT	a.l3_id, a.alt_nm
FROM	level_3_address_components	l3
	JOIN	@l3_alternates	a
		ON	(	l3.level_3_address_component_id	=	a.l3_id
			AND	l3.level_3_address_component_nm	=	a.l3_nm
			);
SET @cnt2 = @@ROWCOUNT;
IF (@cnt1 != @cnt2)
BEGIN
	SELECT	a.*
	FROM	@l3_alternates	a
		LEFT JOIN	level_3_address_components	l3
			ON	(	l3.level_3_address_component_id	=	a.l3_id
				AND	l3.level_3_address_component_nm	=	a.l3_nm
				)
	WHERE	l3.level_3_address_component_id	IS	NULL;
	RAISERROR ('Row counts of Alternate Level 3 Address Components mis-match; should be %d, but added only %d', 16, 1, @cnt1, @cnt2);
	ROLLBACK;
	RETURN;
END

--	==================================================

SELECT	*
FROM	view_alternate_address_component_names
ORDER	BY	1 DESC;

