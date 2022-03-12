BEGIN TRAN;
--ROLLBACK;
--COMMIT;

-- Fixes in Address components

DECLARE
	@dt	DATETIME	=	'12 Jun 2021',
	@al	INTEGER,	--	audit_log_id
	@id	INTEGER;

INSERT INTO	audit_logs
		(	[session_id], [application_id], [user_no], [user_role_id], [operation], [screen_id], [object_id], [operation_dts], [is_consumed]	)
	VALUES
		(	0, 'Script', 1, 'System', 'I', 'Script', 'Address Components', GetDate(), 0	);
	SET @al	=	SCOPE_IDENTITY ();

	--	===========================================
PRINT	'Invalidating Address Components'
	--	===========================================

UPDATE	level_1_address_components
	SET	effective_till	=	@dt,
		audit_log_id	=	@al
WHERE	level_1_address_component_id	IN	(	4152, 29	)
AND		level_1_address_component_nm	IN	(	'Daman and Diu', 'Union Territory'	);

IF (@@ROWCOUNT != 2)
BEGIN
	RAISERROR ('Update 1 (2) failed', 16, 1);
	RETURN;
END


UPDATE	level_2_address_components
	SET	effective_till	=	@dt,
		audit_log_id	=	@al
WHERE	level_2_address_component_id	IN	(	140, 214, 125, 115,		114, 653, 661, 520, 522,
												560, 561, 564, 565,
												528, 537, 539, 544,		548, 553
											)
AND		level_2_address_component_nm	IN	(
												'Delhi', 'Ladakh', 'Jagdalpur', 'BAIKUNTHPUR',		'Ambikapur', 'Burdwan', 'MIDNAPORE', 'CHENGAI-MGR', 'CHIDAMBARANAR',
												'Andaman & Nicobar Islands', 'Chandigarh', 'Lakshadweep', 'Pondicherry',
												'KAMARAJAR', 'PASUMPON THEVAR THIRUMAGAN', 'PERIYAR', 'SOUTH ARCOT',		'THIRUVANNAMALAI SAMBUVARAYAR', 'TUTICORIN'
	);

IF (@@ROWCOUNT != 19)
BEGIN
	RAISERROR ('Update 2 (19) failed', 16, 1);
	RETURN;
END
		--	Incorrect spelling in Level 3 components which differ from the same name of Level 2 Component Name
		--	and some have been invalidated which have similar spellings to another Level 3 Component Name under the same Level 2 Component

UPDATE	level_3_address_components
	SET	effective_till	=	@dt,
		audit_log_id	=	@al
WHERE	level_3_address_component_id	IN
				(	118586, 118589, 118588, 118587,		211799, 46735, 114319, 171335,				225366, 44840, 42375, 225371,
					225373, 225375, 225376
				)
AND		level_3_address_component_nm	IN	(
					'ULHASNAGAR-1', 'ULHASNAGAR-5', 'ULHASNAGAR-4', 'ULHASNAGAR-2', 			'APO', 'Delhi', 'PUNE CANTT.EAST', 'CHANDIGARH',	'Bastar', 'Kawardha', 'BAIKUNTHPUR', 'KORIYA',
					'SURGUJA', 'Banaskantha', 'Dangs'
				);

IF (@@ROWCOUNT != 15)
BEGIN
	RAISERROR ('Update 3 (15) failed', 16, 1);
	RETURN;
END


UPDATE	level_3_address_components
	SET	effective_till	=	@dt,
		audit_log_id	=	@al
WHERE	level_2_address_component_id	IN	(	560, 565, 114	);


	--	===========================================
PRINT	'Realiging Address Components'
	--	===========================================

UPDATE	level_2_address_components
	SET	level_1_address_component_id	=	4196,						--	Ladakh,
		audit_log_id	=	@al
WHERE	level_2_address_component_id	IN	(	210, 215	)			--	Kargil, Leh
AND		level_1_address_component_id	=	12							--	J&K
AND		level_2_address_component_nm	IN	(	'Kargil', 'Leh'	);


UPDATE	level_3_address_components
	SET	level_2_address_component_id	=	118				--	Bastar
WHERE	level_3_address_component_id	=	44016			--	Jagdalpur


UPDATE	level_3_address_components
	SET	level_2_address_component_id	=	51356,
		audit_log_id	=	@al
WHERE	level_2_address_component_id	=	561			--	Chandigarh
AND		GetDate () BETWEEN	effective_from	AND	effective_till;


PRINT	'-	Lakshadweep'

INSERT	INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, frro_level2_nm, level_1_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'LD',	'LAKSHADWEEP',	'LAKSHADWEEP',	4154,  1, GetDate(), '31-Dec-9999', @al	);
	SET @id	=	SCOPE_IDENTITY ();

UPDATE	level_3_address_components
	SET	level_2_address_component_id	=	@id,
		audit_log_id	=	@al
WHERE	level_2_address_component_id	=	564			--	Lakshadweep
AND		GetDate () BETWEEN	effective_from	AND	effective_till


PRINT	'-	Aravalli, Gujarat'

INSERT	INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, frro_level2_nm, level_1_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'AV',	'Aravalli',	'Aravalli',	9,  1, GetDate(), '31-Dec-9999', @al	);
	SET @id	=	SCOPE_IDENTITY ();

UPDATE	level_3_address_components
	SET	level_2_address_component_id	=	@id,
		audit_log_id	=	@al
WHERE	level_3_address_component_id	IN
				(	55934, 55935, 55926, 55927, 55907,	55707, 55613, 55614, 55587, 55588	)
AND		level_3_address_component_nm	IN
				(	'Modasa', 'Modasa Bazar', 'Meghraj', 'Megharaj', 'Malpur', 'Dhansura', 'Bhiloda', 'Bhiloda Bazar', 'Bayad', 'Bayad Town'	);

IF (@@ROWCOUNT != 10)
BEGIN
	RAISERROR ('Update 3 (10) failed', 16, 1);
	RETURN;
END

	--	===========================================
PRINT		'Level 2 and 3 Address Components Additions'
	--	===========================================

PRINT	'-	Devbhumi Dwarka, Gujarat'

INSERT	INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, frro_level2_nm, level_1_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'DD',	'Devbhumi Dwarka', 'Devbhumi Dwarka',	9,  1, GetDate(), '31-Dec-9999', @al	);
	SET @id	=	SCOPE_IDENTITY ();

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'DW', 'Dwarka',				'Dwarka',			@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'BV', 'Bhanvad',			'Bhanvad',			@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'KP', 'Kalyanpur',			'Kalyanpur',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'KB', 'Khambhalia',			'Khambhalia',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'JKB', 'Jamkhambhaliya',	'Jamkhambhaliya',	@id, 1, GetDate(), '31-Dec-9999', @al);


PRINT	'-	Gir Somnath, Gujarat'

INSERT	INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, frro_level2_nm, level_1_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'GS',	'Gir Somnath', 'Gir Somnath',	9,  1, GetDate(), '31-Dec-9999', @al	);
	SET @id	=	SCOPE_IDENTITY ();

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'V', 'Veraval',			'Veraval',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'T', 'Talala',			'Talala',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	's', 'Sutrapada',		'Sutrapada',	@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'K', 'Kodinar',			'Kodinar',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'U', 'Una',				'Una',			@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'GG', 'Gir-Gadhada',	'Gir-Gadhada',	@id, 1, GetDate(), '31-Dec-9999', @al);


PRINT	'-	Mahisagar, Gujarat'

INSERT	INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, frro_level2_nm, level_1_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'MS',	'Mahisagar',	'Mahisagar',	9,  1, GetDate(), '31-Dec-9999', @al	);
	SET @id	=	SCOPE_IDENTITY ();

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'L', 'Lunavada',	'Lunavada',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'B', 'Balasinor',	'Balasinor',	@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'KD', 'Kadana',		'Kadana',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'V', 'Virpur',		'Virpur',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'S', 'Santrampur',	'Santrampur',	@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'KP', 'Khanpur',	'Khanpur',		@id, 1, GetDate(), '31-Dec-9999', @al);



PRINT	'-	Morbi, Gujarat'

INSERT	INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, frro_level2_nm, level_1_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'MB',	'Morbi',	'Morbi',	9,  1, GetDate(), '31-Dec-9999', @al	);
	SET @id	=	SCOPE_IDENTITY ();

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'HL', 'Halvad',		'Halvad',	@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'ML', 'Maliya',		'Maliya',	@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'MB', 'Morbi',		'Morbi',	@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'TK', 'Tankara',	'Tankara',	@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'WK', 'Wankaner',	'Wankaner',	@id, 1, GetDate(), '31-Dec-9999', @al);


PRINT	'-	Alipurduar, West Bengal'

INSERT	INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, frro_level2_nm, level_1_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'AP',	'Alipurduar',	'Alipurduar',	32,  1, GetDate(), '31-Dec-9999', @al	);
	SET @id	=	SCOPE_IDENTITY ();

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'AP', 'Alipurduar',						'Alipurduar',					@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'PJ', 'Paschim Jitpur',					'Paschim Jitpur',				@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'CK', 'Chechakhata',					'Chechakhata',					@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'ARJ', 'Alipurduar Railway Junction',	'Alipurduar Railway Junction',	@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'BD', 'Bholar Dabri',					'Bholar Dabri',					@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'SG', 'Sobhaganj',						'Sobhaganj',					@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'FK', 'Falakata',						'Falakata',						@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'JG', 'Jaygaon',						'Jaygaon',						@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'UL', 'Uttar Latabari',					'Uttar Latabari',				@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'UK', 'Uttar Kamakhyaguri',				'Uttar Kamakhyaguri',			@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'KG', 'Kumargram',						'Kumargram',					@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'KC', 'Kalchini', 						'Kalchini', 					@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'MH', 'Madarihat',						'Madarihat',					@id, 1, GetDate(), '31-Dec-9999', @al);


PRINT	'-	Paschim Bardhaman, West Bengal'

INSERT	INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, frro_level2_nm, level_1_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'PCB',	'Paschim Bardhaman', 'Paschim Bardhaman',	32,  1, GetDate(), '31-Dec-9999', @al	);
	SET @id	=	SCOPE_IDENTITY ();

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'AS', 'Asansol',		'Asansol',			@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'KT', 'Kulti',			'Kulti',			@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'BW', 'Bhanowara',		'Bhanowara',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'JMA', 'Jamuria',		'Jamuria',			@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'JMI', 'Jemari',		'Jemari',			@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'RG', 'Raniganj',		'Raniganj',			@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'AK', 'Amkula',			'Amkula',			@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'MR', 'Murgathaul',		'Murgathaul',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'RN', 'Raghunathchak',	'Raghunathchak',	@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'BP', 'Ballavpur',		'Ballavpur',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'DP', 'Durgapur', 		'Durgapur', 		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'AR', 'Arrah',			'Arrah',			@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'BN', 'Bamunara',		'Bamunara',			@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'AJ', 'Amlajora',		'Amlajora',			@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'KK', 'Kanksa',			'Kanksa',			@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'PG', 'Panagarh',		'Panagarh',			@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'MK', 'Mankar',			'Mankar',			@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'SP', 'Shibpur',		'Shibpur',			@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'AD', 'Andal',			'Andal',			@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'UK', 'Ukhra',			'Ukhra',			@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'KJ', 'Kajora',			'Kajora',			@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'PW', 'Pandabeswar',	'Pandabeswar',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'IP', 'Ichhapur',		'Ichhapur',			@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'MG', 'Madhaiganj',		'Madhaiganj',		@id, 1, GetDate(), '31-Dec-9999', @al);


PRINT	'-	Purab Bardhaman, West Bengal'

INSERT	INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, frro_level2_nm, level_1_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'PRB',	'Purab Bardhaman', 'Purab Bardhaman',	32,  1, GetDate(), '31-Dec-9999', @al	);
	SET @id	=	SCOPE_IDENTITY ();

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'RN', 'Raina',			'Raina',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'JP', 'Jamalpur',		'Jamalpur',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'KN', 'Kalna',			'Kalna',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'MR', 'Memari',			'Memari',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'PS', 'Purbasthali',	'Purbasthali',	@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'KT', 'Katwa',			'Katwa',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'BM', 'Bardhaman',		'Bardhaman',	@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'MT', 'Monteswar',		'Monteswar',	@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'BT', 'Bhatar',			'Bhatar',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'KG', 'Ketugram',		'Ketugram',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'MK', 'Mangalkot',		'Mangalkot',	@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'AG', 'Ausgram',		'Ausgram',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'KD', 'Khandaghosh',	'Khandaghosh',	@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'MW', 'Manteswar',		'Manteswar',	@id, 1, GetDate(), '31-Dec-9999', @al);


PRINT	'-	Jhargram, West Bengal'

INSERT	INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, frro_level2_nm, level_1_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'JG',	'Jhargram',	'Jhargram',	32,  1, GetDate(), '31-Dec-9999', @al	);
	SET @id	=	SCOPE_IDENTITY ();

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'JG', 'Jhargram',		'Jhargram',			@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'LS', 'Lodhashuli',		'Lodhashuli',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'SD', 'Silda',			'Silda',			@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'BP', 'Belpahari',		'Belpahari',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'GB', 'Gopiballavpur',	'Gopiballavpur',	@id, 1, GetDate(), '31-Dec-9999', @al);


PRINT	'-	Kalimpong, West Bengal'

INSERT	INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, frro_level2_nm, level_1_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'KP',	'Kalimpong',	'Kalimpong',	32,  1, GetDate(), '31-Dec-9999', @al	);
	SET @id	=	SCOPE_IDENTITY ();

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'KP', 'Kalimpong',			'Kalimpong',			@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'AH', 'Aahaley',			'Aahaley',				@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'AG', 'Algarah',			'Algarah',				@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'BL', 'Bhalukhop',			'Bhalukhop',			@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'B', 'Bong',				'Bong',					@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'DC', 'Dalapchand',			'Dalapchand',			@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'DL', 'Dalim',				'Dalim',				@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'DGH', 'Dr. Grahams Homes',	'Dr. Grahams Homes',	@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'DH', 'Dungra',				'Dungra',				@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'F', 'Fagu',				'Fagu',					@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'GD', 'Gitdabling',			'Gitdabling',			@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'G1', 'Gorubathan–I',		'Gorubathan–I',			@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'G2', 'Gorubathan–II',		'Gorubathan–II',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'KK', 'Kafer Kanke Bong',	'Kafer Kanke Bong',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'KG', 'Kagay',				'Kagay',				@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'KY', 'Kashyong',			'Kashyong',				@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'KM', 'Kumai',				'Kumai',				@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'LG', 'Lava-Gitbeong',		'Lava-Gitbeong',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'LS', 'Lingse',				'Lingse',				@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'LY', 'Lingseykha',			'Lingseykha',			@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'LL', 'Lolay',				'Lolay',				@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'LE', 'Lower Echhay',		'Lower Echhay',			@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'NB', 'Neembong',			'Neembong',				@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'N', 'Nim',					'Nim',					@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'PR', 'Pabringtar',			'Pabringtar',			@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'PT', 'Patengodak',			'Patengodak',			@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'PY', 'Payong',				'Payong',				@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'PG', 'Pedong',				'Pedong',				@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'PB', 'Pokhreybong',		'Pokhreybong',			@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'PD', 'Pudung',				'Pudung',				@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'R', 'Rongo',				'Rongo',				@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'SB', 'Samalbong',			'Samalbong',			@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'SS', 'Samsing',			'Samsing',				@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'SM', 'Samthar',			'Samthar',				@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'SK', 'Seokbir',			'Seokbir',				@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'SG', 'Shangse',			'Shangse',				@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'ST', 'Shantook',			'Shantook',				@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'SD', 'Sindebong',			'Sindebong',			@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'SY', 'Syakiyong',			'Syakiyong',			@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'TD', 'Tashiding',			'Tashiding',			@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'T', 'Tista',				'Tista',				@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'TT', 'Todey Tangta',		'Todey Tangta',			@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'UE', 'Upper Echhay',		'Upper Echhay',			@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'YM', 'Yangmakum',			'Yangmakum',			@id, 1, GetDate(), '31-Dec-9999', @al);


PRINT	'-	Paschim Medinipur, West Bengal'

INSERT	INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, frro_level2_nm, level_1_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'PCM',	'Paschim Medinipur',	'Paschim Medinipur',	32,  1, GetDate(), '31-Dec-9999', @al	);
	SET @id	=	SCOPE_IDENTITY ();

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'BC', 'Balichak',		'Balichak',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'BD', 'Belda',			'Belda',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'CD', 'Chandrakona',	'Chandrakona',	@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'DT', 'Dantan',			'Dantan',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'DP', 'Daspur',			'Daspur',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'GB', 'Garbeta',		'Garbeta',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'KS', 'Keshiari',		'Keshiari',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'KP', 'Keshpur',		'Keshpur',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'KG', 'Kharagpur',		'Kharagpur',	@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'M', 'Midnapore',		'Midnapore',	@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'MP', 'Mohanpur',		'Mohanpur',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'N', 'Narayangarh',		'Narayangarh',	@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'R', 'Ramjibanpur',		'Ramjibanpur',	@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'S', 'Sabang',			'Sabang',		@id, 1, GetDate(), '31-Dec-9999', @al);


PRINT	'-	Purab Medinipur, West Bengal'

INSERT	INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, frro_level2_nm, level_1_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'PRM',	'Purab Medinipur',	'Purab Medinipur',	32,  1, GetDate(), '31-Dec-9999', @al	);
	SET @id	=	SCOPE_IDENTITY ();

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'C', 'Contai',		'Contai',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'D', 'Digha',		'Digha',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'E', 'Egra',		'Egra',			@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'H', 'Haldia',		'Haldia',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'KJ', 'Khejuri',	'Khejuri',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'KG', 'Kolaghat',	'Kolaghat',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'MS', 'Mahishadal',	'Mahishadal',	@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'MM', 'Mandarmani',	'Mandarmani',	@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'MC', 'Mecheda',	'Mecheda',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'NK', 'Nandakumar',	'Nandakumar',	@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'NG', 'Nandigram',	'Nandigram',	@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'PS', 'Panskura',	'Panskura',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'PP', 'Patashpur',	'Patashpur',	@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'R', 'Ramnagar',	'Ramnagar',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'T', 'Tamluk',		'Tamluk',		@id, 1, GetDate(), '31-Dec-9999', @al);


PRINT	'-	Ariyalur, Tamil Nadu'

INSERT	INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, frro_level2_nm, level_1_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'AL',	'Ariyalur',	'Ariyalur',	27,  1, GetDate(), '31-Dec-9999', @al	);
	SET @id	=	SCOPE_IDENTITY ();

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'AL', 'Ariyalur',		'Ariyalur',			@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'AM', 'Andimadam',		'Andimadam',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'U', 'Udayarpalayam',	'Udayarpalayam',	@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'S', 'Sendurai',		'Sendurai',			@id, 1, GetDate(), '31-Dec-9999', @al);


PRINT	'-	Chengalpattu, Tamil Nadu'

INSERT	INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, frro_level2_nm, level_1_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'CP',	'Chengalpattu',	'Chengalpattu',	27,  1, GetDate(), '31-Dec-9999', @al	);
	SET @id	=	SCOPE_IDENTITY ();

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'CP', 'Chengalpattu',		'Chengalpattu',			@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'CY', 'Cheyyur',			'Cheyyur',				@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'M', 'Madurantakam',		'Madurantakam',			@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'P', 'Pallavaram',			'Pallavaram',			@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'TN', 'Tambaram',			'Tambaram',				@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'TP', 'Thiruporur',			'Thiruporur',			@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'TZ', 'Thirukazhukundram',	'Thirukazhukundram',	@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'V', 'Vandalur',			'Vandalur',				@id, 1, GetDate(), '31-Dec-9999', @al);


PRINT	'-	Kallakurichi, Tamil Nadu'

INSERT	INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, frro_level2_nm, level_1_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'KK',	'Kallakurichi',	'Kallakurichi',	27,  1, GetDate(), '31-Dec-9999', @al	);
	SET @id	=	SCOPE_IDENTITY ();

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'KK', 'Kallakurichi',		'Kallakurichi',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'C', 'Chinnasalem',			'Chinnasalem',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'KH', 'Kalvarayan Hills',	'Kalvarayan Hills',	@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'S', 'Sankarapuram',		'Sankarapuram',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'T', 'Thirukoilur',			'Thirukoilur',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'U', 'Ulundurpet',			'Ulundurpet',		@id, 1, GetDate(), '31-Dec-9999', @al);


PRINT	'-	Mayiladuthurai, Tamil Nadu'

INSERT	INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, frro_level2_nm, level_1_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'MD',	'Mayiladuthurai',	'Mayiladuthurai',	27,  1, GetDate(), '31-Dec-9999', @al	);
	SET @id	=	SCOPE_IDENTITY ();

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'MD', 'Mayiladuthurai',	'Mayiladuthurai',	@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'K', 'Kuthalam',		'Kuthalam',			@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'S', 'Sirkazhi',		'Sirkazhi',			@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'T', 'Tharangambad',	'Tharangambad',		@id, 1, GetDate(), '31-Dec-9999', @al);



PRINT	'-	Ranipet, Tamil Nadu'

INSERT	INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, frro_level2_nm, level_1_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'RP',	'Ranipet',	'Ranipet',	27,  1, GetDate(), '31-Dec-9999', @al	);
	SET @id	=	SCOPE_IDENTITY ();

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'RP', 'Ranipet',	'Ranipet',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'AK', 'Arakkonam',	'Arakkonam',	@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'AC', 'Arcot',		'Arcot',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'K', 'Kalavai',		'Kalavai',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'N', 'Nemili',		'Nemili',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'S', 'Sholingur',	'Sholingur',	@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'W', 'Walajapet',	'Walajapet',	@id, 1, GetDate(), '31-Dec-9999', @al);


PRINT	'-	Tenkasi, Tamil Nadu'

INSERT	INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, frro_level2_nm, level_1_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'TK',	'Tenkasi',	'Tenkasi',	27,  1, GetDate(), '31-Dec-9999', @al	);
	SET @id	=	SCOPE_IDENTITY ();

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'TK', 'Tenkasi',			'Tenkasi',				@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'A', 'Alangulam',			'Alangulam',			@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'K', 'Kadayanallur',		'Kadayanallur',			@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'SK', 'Sankarankoil',		'Sankarankoil',			@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'ST', 'Shenkottai',			'Shenkottai',			@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'SG', 'Sivagiri',			'Sivagiri',				@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'T', 'Thiruvengadam',		'Thiruvengadam',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'V', 'Veerakeralampudur',	'Veerakeralampudur',	@id, 1, GetDate(), '31-Dec-9999', @al);


PRINT	'-	Thoothukudi, Tamil Nadu'

INSERT	INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, frro_level2_nm, level_1_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'TKD',	'Thoothukudi',	'Thoothukudi',	27,  1, GetDate(), '31-Dec-9999', @al	);
	SET @id	=	SCOPE_IDENTITY ();

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'TKD', 'Thoothukudi',	'Thoothukudi',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'ER', 'Eral',			'Eral',				@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'EP', 'Ettayapuram',	'Ettayapuram',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'KT', 'Kayathar',		'Kayathar',			@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'KP', 'Kovilpatti',		'Kovilpatti',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'O', 'Ottapidaram',		'Ottapidaram',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'S', 'Sathankulam',		'Sathankulam',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'TV', 'Thiruvaikundam',	'Thiruvaikundam',	@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'TC', 'Tiruchendur',	'Tiruchendur',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'V', 'Vilathikulam',	'Vilathikulam',		@id, 1, GetDate(), '31-Dec-9999', @al);


PRINT	'-	Tirupattur, Tamil Nadu'

INSERT	INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, frro_level2_nm, level_1_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'TP',	'Tirupattur',	'Tirupattur',	27,  1, GetDate(), '31-Dec-9999', @al	);
	SET @id	=	SCOPE_IDENTITY ();

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'TP', 'Tirupattur',	'Tirupattur',	@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'A', 'Ambur',		'Ambur',		@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'N', 'Natrampalli',	'Natrampalli',	@id, 1, GetDate(), '31-Dec-9999', @al),
		(	'V', 'Vaniyambadi',	'Vaniyambadi',	@id, 1, GetDate(), '31-Dec-9999', @al);



UPDATE	level_3_address_components
	SET	level_2_address_component_id	=	118,				--	Bastar
		audit_log_id	=	@al
WHERE	level_3_address_component_id	=	44016
AND		level_3_address_component_nm	=	'Jagdalpur';

UPDATE	level_3_address_components
	SET	level_2_address_component_id	=	129,				--	Kawardha
		level_3_address_component_nm	=	'Kabirdham',
		audit_log_id	=	@al
WHERE	level_3_address_component_id	=	225369
AND		level_3_address_component_nm	=	'Kabir Dham';

	
	--	===========================================
PRINT		'Level 1 Address Components Name corrections'
	--	===========================================

UPDATE	level_1_address_components
	SET	level_1_address_component_nm	=	'LAKSHADWEEP'
WHERE	level_1_address_component_id	=	4154
AND		level_1_address_component_nm	=	'Lakshwadeep';

UPDATE	level_1_address_components
	SET	level_1_address_component_nm	=	'PUDUCHERRY'
WHERE	level_1_address_component_id	=	23
AND		level_1_address_component_nm	=	'PONDICHERRY';

UPDATE	level_1_address_components
	SET	level_1_address_component_nm	=	'Bangkok'
WHERE	level_1_address_component_id	=	3535
AND		level_1_address_component_nm	=	'Bangkok Metropolis';

UPDATE	level_1_address_components
	SET	level_1_address_component_nm	=	'JAKARTA'
WHERE	level_1_address_component_id	=	2221
AND		level_1_address_component_nm	=	'JAKARTA RAYA';

	--	===========================================
PRINT		'Level 2 Address Components Name corrections'
	--	===========================================

UPDATE	level_2_address_components
	SET	level_2_address_component_nm	=	'TIRUNELVELI'
WHERE	level_2_address_component_id	=	549
AND		level_2_address_component_nm	=	'TIRUNELVELI KATTABOMMAN';

UPDATE	level_2_address_components
	SET	level_2_address_component_nm	=	'Sahibzada Ajit Singh Nagar (MOHALI)'
WHERE	level_2_address_component_id	=	472
AND		level_2_address_component_nm	=	'MOHALI';

UPDATE	level_2_address_components
	SET	level_2_address_component_nm	=	'PANCHMAHAL'
WHERE	level_2_address_component_id	=	162
AND		level_2_address_component_nm	=	'PANCHMAHALS';

UPDATE	level_2_address_components
	SET	level_2_address_component_nm	=	'NAVSARI'
WHERE	level_2_address_component_id	=	161
AND		level_2_address_component_nm	=	'SONIPAT';

UPDATE	level_2_address_components
	SET	level_2_address_component_nm	=	'SONIPAT'
WHERE	level_2_address_component_id	=	191
AND		level_2_address_component_nm	=	'SONEPAT';

UPDATE	level_2_address_components
	SET	level_2_address_component_nm	=	'DANG'
WHERE	level_2_address_component_id	=	152
AND		level_2_address_component_nm	=	'DANGS';

UPDATE	level_2_address_components
	SET	level_2_address_component_nm	=	'GARIABAND'
WHERE	level_2_address_component_id	=	124
AND		level_2_address_component_nm	=	'GARIYABANDH';

UPDATE	level_2_address_components
	SET	level_2_address_component_nm	=	'Johannesburg'
WHERE	level_2_address_component_id	=	45419
AND		level_2_address_component_nm	=	'City of Johannesburg';

UPDATE	level_2_address_components
	SET	level_2_address_component_nm	=	'Cape Town'
WHERE	level_2_address_component_id	=	45453
AND		level_2_address_component_nm	=	'City of Cape Town';

UPDATE	level_2_address_components
	SET	level_2_address_component_nm	=	'Makati'
WHERE	level_2_address_component_id	=	43900
AND		level_2_address_component_nm	=	'Makati, City of';

UPDATE	level_2_address_components
	SET	level_2_address_component_nm	=	'Budgam'
WHERE	level_2_address_component_id	=	206
AND		level_2_address_component_nm	=	'Badgam';

UPDATE	level_2_address_components
	SET	level_2_address_component_nm	=	'Janjgir-Champa'
WHERE	level_2_address_component_id	=	126
AND		level_2_address_component_nm	=	'Janjgir';

UPDATE	level_2_address_components
	SET	level_2_address_component_nm	=	'NAGAPATTINAM'
WHERE	level_2_address_component_id	=	534
AND		level_2_address_component_nm	=	'NAGAPATTINAM QUAID E MILLAT';

	--	===========================================
PRINT		'Level 3 Address Components Name corrections'
	--	===========================================

UPDATE	level_3_address_components
	SET	level_3_address_component_nm	=	'GARIABAND'
WHERE	level_3_address_component_id	=	225368
AND		level_3_address_component_nm	=	'GARIYABANDH';

UPDATE	level_3_address_components
	SET	level_3_address_component_nm	=	'AHWA'
WHERE	level_3_address_component_id	=	49936
AND		level_3_address_component_nm	=	'AHWADANGS';


	--	===========================================
PRINT		'Level 3 Address Components Additions'
	--	===========================================

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'DC', 'Delhi Cantonment',	'Delhi Cantonment', 141, 1, GetDate(), '31-Dec-9999', @al);

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'56', '56 APO',	'56 APO', 25, 1, GetDate(), '31-Dec-9999', @al);

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'C56', 'C/O 56 APO',	'C/O 56 APO', 25, 1, GetDate(), '31-Dec-9999', @al);

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'99', '99 APO',	'99 APO', 25, 1, GetDate(), '31-Dec-9999', @al);

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'C99', 'C/O 99 APO',	'C/O 99 APO', 25, 1, GetDate(), '31-Dec-9999', @al);

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'UN', 'ULHASNAGAR',	'ULHASNAGAR', 381, 1, GetDate(), '31-Dec-9999', @al);

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'ND', 'NANI DAMAN',	'NANI DAMAN', 563, 1, GetDate(), '31-Dec-9999', @al);

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'UM', 'USTA MOHAMMAD',	'USTA MOHAMMAD', 5510, 1, GetDate(), '31-Dec-9999', @al);

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'SA', 'SOUTHALL',	'SOUTHALL', 4621, 1, GetDate(), '31-Dec-9999', @al);

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'TN', 'Tenerife',	'Tenerife', 45554, 1, GetDate(), '31-Dec-9999', @al);

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'NS', 'NAWABSHAH',	'NAWABSHAH', 5633, 1, GetDate(), '31-Dec-9999', @al);

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'D', 'DURBAN',	'DURBAN', 45425, 1, GetDate(), '31-Dec-9999', @al);

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'IL', 'ILFORD',	'ILFORD', 4621, 1, GetDate(), '31-Dec-9999', @al);

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'MP', 'MILPITAS',	'MILPITAS', 1005, 1, GetDate(), '31-Dec-9999', @al);

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'SJ', 'San Jose',	'San Jose', 1005, 1, GetDate(), '31-Dec-9999', @al);

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'SV', 'SUNNYVALE',	'SUNNYVALE', 1005, 1, GetDate(), '31-Dec-9999', @al);

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'FR', 'Fremont',	'Fremont', 962, 1, GetDate(), '31-Dec-9999', @al);

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'HW', 'Hayward',	'Hayward', 962, 1, GetDate(), '31-Dec-9999', @al);

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'UC', 'Union City',	'Union City', 962, 1, GetDate(), '31-Dec-9999', @al);

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'YC', 'Yuba City',	'Yuba City', 1011, 1, GetDate(), '31-Dec-9999', @al);

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'MT', 'MANTECA',	'MANTECA', 1003, 1, GetDate(), '31-Dec-9999', @al);

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'ST', 'STOCKTON',	'STOCKTON', 1003, 1, GetDate(), '31-Dec-9999', @al);

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'TC', 'Tracy',	'Tracy', 1003, 1, GetDate(), '31-Dec-9999', @al);

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'PB', 'PITTSBURG',	'PITTSBURG', 968, 1, GetDate(), '31-Dec-9999', @al);

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'SR', 'SAN RAMON',	'SAN RAMON', 968, 1, GetDate(), '31-Dec-9999', @al);

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'IR', 'IRVINE',	'IRVINE', 991, 1, GetDate(), '31-Dec-9999', @al);

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'EG', 'ELK GROVE',	'ELK GROVE', 997, 1, GetDate(), '31-Dec-9999', @al);

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'BF', 'BAKERSFIELD',	'BAKERSFIELD', 976, 1, GetDate(), '31-Dec-9999', @al);

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'PL', 'PETALUMA',	'PETALUMA', 1008, 1, GetDate(), '31-Dec-9999', @al);

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'JC', 'JERSEY CITY',	'JERSEY CITY', 2694, 1, GetDate(), '31-Dec-9999', @al);

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'RH', 'RICHMOND HILL',	'RICHMOND HILL', 2787, 1, GetDate(), '31-Dec-9999', @al);

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'OB', 'OYSTER BAY',	'OYSTER BAY', 2786, 1, GetDate(), '31-Dec-9999', @al);

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'HS', 'HEMPSTED',	'HEMPSTED', 2786, 1, GetDate(), '31-Dec-9999', @al);

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'RP', 'REGO PARK',	'REGO PARK', 2797, 1, GetDate(), '31-Dec-9999', @al);

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'SA', 'SAN ANTONIO',	'SAN ANTONIO', 3326, 1, GetDate(), '31-Dec-9999', @al);

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'CL', 'CHARLOTTE',	'CHARLOTTE', 2485, 1, GetDate(), '31-Dec-9999', @al);

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'IV', 'IRVING',	'IRVING', 3356, 1, GetDate(), '31-Dec-9999', @al);

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'PL', 'PLANO',	'PLANO', 3336, 1, GetDate(), '31-Dec-9999', @al);

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'FR', 'FRISCO',	'FRISCO', 3336, 1, GetDate(), '31-Dec-9999', @al);

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'K', 'KENT',	'KENT', 3746, 1, GetDate(), '31-Dec-9999', @al);

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'FV', 'FAYETTEVILLE',	'FAYETTEVILLE', 2453, 1, GetDate(), '31-Dec-9999', @al);

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'AX', 'APEX',	'APEX', 2523, 1, GetDate(), '31-Dec-9999', @al);

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'KR', 'Kamareddy',	'Kamareddy', 51337, 1, GetDate(), '31-Dec-9999', @al);


	--	===========================================
PRINT		'Level 3 Address Components Additions : All levels'
	--	===========================================



INSERT	INTO	level_1_address_components
		(	level_1_address_component_cd, level_1_address_component_nm, frro_level1_nm, country_id, is_authentic, effective_from, effective_till, audit_log_id	)
	VALUES
		(	'DH', 'DOHA',	'DOHA', 99, 1, GetDate(), '31-Dec-9999', @al);



	--	===========================================

	--	===========================================
PRINT		'Level 3 Address Components Additions along with Level 2'
	--	===========================================

DECLARE	@tbl	TABLE	(	l2_cd		VARCHAR (10),
							l2_nm		VARCHAR (40),
							l3_cd		VARCHAR (10),
							l3_nm		VARCHAR (40),
							l1_id		INTEGER,
								PRIMARY KEY (	l1_id, l2_cd),
								UNIQUE		(	l1_id, l2_nm)
						);

INSERT INTO	@tbl
		(	l2_cd, l2_nm, l1_id	)
	VALUES	(	'CD',	'Central Delhi',	7	),
			(	'ED',	'East Delhi',		7	),
			(	'ND',	'North Delhi',		7	),
			(	'NED',	'North East Delhi',	7	),
			(	'NWD',	'North West Delhi',	7	),
			(	'SH',	'Shahdara',			7	),
			(	'SD',	'South Delhi',		7	),
			(	'SED',	'South East Delhi',	7	),
			(	'SWD',	'South West Delhi',	7	),
			(	'WD',	'West Delhi',		7	),

						--	Telangana
			(	'JT',	'Jagitial',		4107	),
			(	'JN',	'Jangaon',		4107	),
			(	'MB',	'Mahabubabad',	4107	),
			(	'MR',	'Mancherial',	4107	),
			(	'MU',	'Mulugu',		4107	),
			(	'NK',	'Nagarkurnool',	4107	),
			(	'NP',	'Narayanpet',	4107	),
			(	'N',	'Nirmal',		4107	),
			(	'PP',	'Peddapalli',	4107	),
			(	'SR',	'Sangareddy',	4107	),
			(	'SP',	'Siddipet',		4107	),
			(	'SU',	'Suryapet',		4107	),
			(	'VK',	'Vikarabad',	4107	),
			(	'WP',	'Wanaparthy',	4107	),

						--	PUDUCHERRY
			(	'PC',	'PUDUCHERRY',	23	),
			(	'KK',	'KARAIKAL',		23	),
			(	'M',	'MAHE',			23	),
			(	'Y',	'YANAM',		23	),

						-- J & K
			(	'BP',	'Bandipora',	12	),
			(	'GB',	'Ganderbal',	12	),
			(	'RB',	'Ramban',		12	),
			(	'KG',	'Kulgam',		12	),
			(	'SP',	'Shopian',		12	),

						-- Chhattisgarh
			(	'BL',	'Balrampur',	6	),
			(	'BJ',	'Bijapur',		6	),
			(	'SK',	'Sukma',		6	),
			(	'SP',	'Surajpur',		6	),

						-- Gujarat
			(	'B',	'Botad',			9	),
			(	'CU',	'Chhota Udaipur',	9	);

INSERT INTO	@tbl
						--	Telangana
	VALUES	(	'BK',	'Bhadradri Kothagudem',		'KG',	'Kothagudem',	4107	),
			(	'JB',	'Jayashankar Bhupalpally',	'BP',	'Bhupalpally',	4107	),
			(	'JG',	'Jogulamba Gadwal',			'GW',	'Gadwal',		4107	),
			(	'KB',	'Kumuram Bheem',			'AB',	'Asifabad',		4107	),
			(	'MM',	'Medchal–Malkajgiri',		'SP',	'Shamirpet',	4107	),
			(	'RS',	'Rajanna Sircilla',			'SC',	'Sircilla',		4107	),
			(	'YB',	'Yadadri Bhuvanagiri',		'BG',	'Bhongir',		4107	),

						--	Andaman and Nicobar
			(	'NM',	'North and Middle Andaman',		'MB',	'Mayabunder',	4155	),
			(	'SA',	'South Andaman',				'PB',	'Port Blair',	4155	),
			(	'N',	'Nicobar',						'CN',	'Car Nicobar',	4155	),

						-- Chhattisgarh
			(	'GPM',	'Gaurella-Pendra-Marwahi',		'GR',	'Gaurella',		6	);


INSERT	INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, frro_level2_nm, level_1_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	SELECT	l2_cd, l2_nm, l2_nm, l1_id,  1, GetDate(), '31-Dec-9999', @al
	FROM	@tbl;

INSERT	INTO	level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, frro_level3_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	SELECT	COALESCE (t.l3_cd, t.l2_cd), COALESCE (t.l3_nm, t.l2_nm), COALESCE (t.l3_nm, t.l2_nm), c.level_2_address_component_id,  1, GetDate(), '31-Dec-9999', @al
	FROM	@tbl	t
		JOIN	level_2_address_components	c
			ON	(	c.level_1_address_component_id	=	t.l1_id
				AND	c.level_2_address_component_cd	=	t.l2_cd
				);

	--	===========================================

