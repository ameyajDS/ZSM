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

INSERT	INTO	@l1_alternates		VALUES	(	23,	'Puducherry',		'Pondicherry'		);

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

			--	 Commented entries below are being created through triggers

INSERT	INTO	@l2_alternates		VALUES	(	51507,	'Puducherry',	'Pondicherry'	),
													-- Punjab
											(	458,	'Amritsar',						'Ambarsar'		),
											(	464,	'Firozpur',						'Ferozepur'		),
											(	464,	'Firozpur',						'Firozepur'		),
											(	473,	'Sri Muktsar Sahib',			'Muktsar'		),
											(	477,	'Rupnagar',						'Ropar'			),
											(	472,	'Sahibzada Ajit Singh Nagar',	'Mohali'		),
											(	472,	'Sahibzada Ajit Singh Nagar',	'SAS Nagar'		),
											(	474,	'SHAHEED BHAGAT SINGH NAGAR',	'NAWANSHAHR'	),
											(	474,	'SHAHEED BHAGAT SINGH NAGAR',	'NAWANSHAHAR'	),
													-- Rajasthan
											(	489,	'CHITTORGARH',	'CHITTAURGARH'	),
													-- Tamil Nadu
											(	521,	'Chennai',			'Madras'		),
											(	529,	'KANCHIPURAM',		'KANCHEEPURAM'	),
											(	540,	'PUDUKKOTTAI',		'Pudhugai'		),
											(	541,	'RAMANATHAPURAM',	'Ramnad'		),
											(	543,	'SIVAGANGA',		'SIVAGANGAI'	),
											(	51481,	'Tirupattur',		'Tirupathur'	),
											(	695,	'TIRUPPUR',			'TIRUPUR'		),
											(	550,	'TIRUVALLUR',		'THIRUVALLUR'	),
											(	551,	'TIRUVANNAMALAI',	'Central Arcot'	),
											(	551,	'TIRUVANNAMALAI',	'Tiruvannamalai Sambhuvarayar'	),
											(	552,	'TIRUVARUR',		'THIRUVARUR'	),
							--				(	555,	'VILUPPURAM',		'VILLUPURAM'	),
											(	555,	'VILUPPURAM',		'VIZHUPPURAM'	),
													-- Telangana
											(	23,		'Warangal',			'Warangal Rural'	),
											(	52564,	'Hanamkonda',		'Warangal Urban'	),
											(	18,		'RANGA REDDY',		'Cyberabad'			),
											(	18,		'RANGA REDDY',		'Hyberabad Rural'	),
													--	UP
							--				(	568,	'Prayagraj',		'ALLAHABAD'						),
											(	696,	'AMETHI',			'CHHATRAPATI SHAHUJI MAHARAJ'	),
											(	601,	'AMROHA',			'J P NAGAR'						),
											(	601,	'AMROHA',			'Jyotiba Phule NAGAR'			),
							--				(	606,	'Kanpur Nagar',		'Kanpur'						),
											(	606,	'Kanpur Nagar',		'Kanpur Urban'					),
											(	697,	'KASGANJ',			'KANSHIRAM NAGAR'				),
											(	698,	'SHAMLI',			'PRABUDH NAGAR'					),
											(	628,	'BHADOHI',			'SANT RAVIDAS NAGAR'			),
						--					(	609,	'LAKHIMPUR KHERI',	'KHERI'							),
											(	633,	'SONBHADRA',		'SONEBHADRA'					),
											(	637,	'Varanasi',			'Kashi'							),
													--	Uttarakhand
											(	649,	'UDHAM SINGH NAGAR',	'U S Nagar'		),
													--	West Bengal
											(	654,	'COOCH BEHAR',			'Cooch Bihar'		),
						--					(	665,	'UTTAR DINAJPUR',		'NORTH DINAJPUR'	),
						--					(	668,	'DAKSHIN DINAJPUR',		'SOUTH DINAJPUR'	),
											(	660,	'Malda',				'Maldah'			),
											(	660,	'Malda',				'Maldaha'			),
											(	51469,	'Purba Bardhaman',		'Purba Burdwan'		),
											(	51469,	'Purba Bardhaman',		'East Burdwan'		),
											(	51469,	'Purba Bardhaman',		'East Bardhaman'	),
											(	51468,	'Paschim Bardhaman',	'Paschim Burdwan'	),
											(	51468,	'Paschim Bardhaman',	'West Burdwan'		),
											(	51468,	'Paschim Bardhaman',	'West Bardhaman'	),
											(	51473,	'Purba Medinipur',		'Purba Midnapore'	),
											(	51473,	'Purba Medinipur',		'East Midnapore'	),
											(	670,	'Paschim Medinipur',	'Paschim Midnapore'	),
						--					(	670,	'Paschim Medinipur',	'West Midnapore'	),
											(	656,	'Hooghly',				'Hoogli'			),
											(	656,	'Hooghly',				'Hugli'				),
											(	659,	'Kolkata',				'Calcutta'			),
											(	664,	'North 24 Parganas',	'24 PGS (N)'		),
											(	664,	'North 24 Parganas',	'North Twenty Four Parganas'	),
											(	664,	'North 24 Parganas',	'Uttar 24 Parganas'	),
											(	667,	'South 24 Parganas',	'24 PGS (S)'		),
											(	667,	'South 24 Parganas',	'South Twenty Four Parganas'	),
											(	667,	'South 24 Parganas',	'Dakshin 24 Parganas'	);


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

													-- Odisha
INSERT	INTO	@l3_alternates		VALUES	(	230926,	'Kasipur',		'Kashipur'		),
											(	230946,	'Uzhavarkarai',	'Ozhukarai'    	),
											(	226485,	'Puducherry',	'Pondicherry'	),
													-- Punjab
											(	130249,	'Amritsar',						'Ambarsar'    	),
											(	131505,	'Firozpur',						'Ferozepur'    	),
											(	131505,	'Firozpur',						'Firozepur'    	),
											(	131351,	'Fazilka',						'Bangla'    	),
											(	134299,	'Sri Muktsar Sahib',			'Muktsar'    	),
											(	135047,	'Rupnagar',						'Ropar'		   	),
											(	134134,	'Sahibzada Ajit Singh Nagar',	'Mohali'		),
											(	134134,	'Sahibzada Ajit Singh Nagar',	'SAS Nagar'		),
											(	134134,	'Sahibzada Ajit Singh Nagar',	'Ajitgarh'		),
											(	225445,	'SHAHEED BHAGAT SINGH NAGAR',	'NAWANSHAHR'	),
											(	225445,	'SHAHEED BHAGAT SINGH NAGAR',	'NAWANSHAHAR'	),
													-- Rajasthan
											(	139592,	'CHITTORGARH',	'CHITTAURGARH'	),
													-- Tamil Nadu
											(	226368,	'Chengalpattu',		'Chinglepet'		),
											(	151091,	'Chennai',			'Madras'			),
											(	151446,	'COIMBATORE',		'Kovai'				),
											(	151446,	'COIMBATORE',		'Covai'				),
											(	154541,	'KANCHIPURAM',		'KANCHEEPURAM'		),
											(	154541,	'KANCHIPURAM',		'KANCHI'			),
											(	226382,	'Mayiladuthurai',	'Mayavaram'			),
											(	226382,	'Mayiladuthurai',	'Mayuram'			),
											(	157404,	'NAGAPATTINAM',		'Nagapatnam'		),
											(	157404,	'NAGAPATTINAM',		'Negapatam'			),
											(	158139,	'UDAGAMANDALAM',	'UDHAGAMANDALAM'	),
											(	158139,	'UDAGAMANDALAM',	'Ootacamund'		),
											(	158139,	'UDAGAMANDALAM',	'Udhagai'			),
											(	158139,	'UDAGAMANDALAM',	'Ooty'				),
											(	159640,	'PUDUKKOTTAI',		'Pudhugai'			),
											(	160130,	'RAMANATHAPURAM',	'Ramnad'			),
											(	164123,	'THANJAVUR',		'Tanjore'			),
											(	226401,	'Thoothukudi',		'Tuticorin'			),
											(	165808,	'TIRUCHIRAPPALLI',	'Trichinopoly'		),
											(	165808,	'TIRUCHIRAPPALLI',	'Trichy'			),
											(	165808,	'TIRUCHIRAPPALLI',	'Tiruchi'			),
											(	167138,	'TIRUNELVELI',		'Tinnevelly'		),
											(	167138,	'TIRUNELVELI',		'Nellai'			),
											(	226411,	'Tirupattur',		'Tirupathur'		),
											(	225471,	'TIRUPPUR',			'TIRUPUR'			),
											(	225472,	'TIRUVALLUR',		'THIRUVALLUR'		),
											(	225473,	'TIRUVANNAMALAI',	'Thiruvannamalai'	),
											(	225473,	'TIRUVANNAMALAI',	'Trinomali'			),
											(	225473,	'TIRUVANNAMALAI',	'Trinomalee'		),
											(	168108,	'TIRUVARUR',		'THIRUVARUR'		),
					--						(	170253,	'VILUPPURAM',		'VILLUPURAM'		),
											(	170253,	'VILUPPURAM',		'VIZHUPPURAM'		),
											(	232026,	'Avinashi',			'Avanashi'			),
													-- Telangana
											(	231628,		'Dundigal Gandimaisamma',	'Dundigal'			),
											(	7729,		'KHAMMAM',					'KHAMMAMETT'		),
											(	10575,		'MAHABUBNAGAR',				'Palamooru'			),
											(	10575,		'MAHABUBNAGAR',				'Rukmammapeta'		),
											(	11591,		'MEDAK',					'Methukudurgam'		),
											(	11591,		'MEDAK',					'Methuku'			),
											(	226503,		'SANGAREDDY',				'Sangareddy Peta'	),
											(	226504,		'Suryapet',					'Bhanupuri'			),
											(	226507,		'Bhongir',					'Bhuvanagiri'		),
													-- Tripura
											(	232104,	'Udaipur',	'Rangamati'	),
													--	UP
											(	172567,	'Prayagraj',		'ILAHABAD'			),
											(	225496,	'SHAMLI',			'PRABUDH NAGAR'		),
											(	186694,	'Kanpur',			'Cawnpore'			),
											(	177801,	'Budaun',			'Badayu'			),
											(	225483,	'Chitrakoot',		'Chitrakoot Dham'	),
											(	182029,	'NOIDA',			'New Okhla IndustrialDevelopmentAuthority'	),
											(	189501,	'Mau',				'Maunath Bhanjan'	),
											(	193636,	'SIDHARTH NAGAR',	'Naugarh'			),
											(	194291,	'ROBERTSGANJ',		'Sonbhadra'			),
											(	194291,	'ROBERTSGANJ',		'Sonebhadra'		),
											(	195856,	'Varanasi',			'Banaras'			),
											(	195856,	'Varanasi',			'Benares'			),
													--	West Bengal
											(	226278,	'Bardhaman',	'Burdwan'			),
											(	200812,	'Suri',			'Siuri'				),
											(	201941,	'Cooch Behar',	'Koch Bihar'		),
											(	202840,	'Hooghly',		'Hoogli'			),
											(	202840,	'Hooghly',		'Hugli'				),
											(	202722,	'CHINSURAH',	'Hooghly-Chinsurah'	),
											(	202722,	'CHINSURAH',	'Hugli-Chuchura'	),
											(	202722,	'CHINSURAH',	'Chuchura'			),
											(	203395,	'Howrah',		'Hoara'				),
											(	204307,	'Kolkata',		'Calcutta'			),
											(	226291,	'Kalimpong',	'Dalingkot'			),
											(	204709,	'Malda',		'English Bazar'		),
											(	207516,	'KRISHNANAGAR',	'Krishnagar'		);


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

--	===============================================================================================================================
--	When Alternate has been provided, invalidating (making ineffective) the SIBLING entry where the Name matches the Alternate Name
--	===============================================================================================================================

UPDATE	ll3
	SET		effective_till	=	@fdt,
			audit_log_id	=	@al
--	SELECT	l3.level_3_address_component_nm, a.alternate_address_component_nm, l3.level_2_address_component_id, ll3.level_3_address_component_nm, ll3.effective_from, ll3.effective_till, ll3.audit_log_id, l3.effective_from, l3.effective_till
FROM	alternate_address_component_names a
	JOIN	level_3_address_components	l3
		ON	(	l3.level_3_address_component_id	=	a.level_3_address_component_id	)
	JOIN	level_3_address_components	ll3
		ON	(	l3.level_2_address_component_id	=	ll3.level_2_address_component_id
			AND	ll3.level_3_address_component_nm	=	a.alternate_address_component_nm
			AND	GETDATE() BETWEEN ll3.effective_from AND ll3.effective_till
			);
			
UPDATE	ll2
	SET		effective_till	=	@fdt,
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
	SET		effective_till	=	@fdt,
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
	SET		effective_till	=	@fdt,
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

