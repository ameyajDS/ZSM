BEGIN TRAN;
--ROLLBACK;
--COMMIT;

DECLARE
	@fdt	DATE	=	GETDATE(),
	@tdt	DATE	=	'31 Dec 9999',
	@al		INTEGER,	--	audit_log_id
	@sid	INTEGER,	--	State ID
	@d_cd	VARCHAR (10),	--	Code for the new district
	@cnt1	INTEGER,
	@cnt2	INTEGER,
	@cnt3	INTEGER;

DECLARE	@l2_renames	TABLE
	(	l2_id	INTEGER			NOT	NULL	PRIMARY	KEY,
		l2_nm	VARCHAR (40)	NOT	NULL,
		new_nm	VARCHAR (40)	NOT	NULL
	);

DECLARE	@l3_renames	TABLE
	(	l3_id	INTEGER			NOT	NULL	PRIMARY	KEY,
		l3_nm	VARCHAR (40)	NOT	NULL,
		new_nm	VARCHAR (40)	NOT	NULL
	);

DECLARE	@effective_districts	TABLE
	(	d_id	INTEGER			PRIMARY	KEY,
		d_nm	VARCHAR (40)	UNIQUE
	);

DECLARE	@ineffective_districts	TABLE
	(	d_id	INTEGER			PRIMARY	KEY,
		d_nm	VARCHAR (40)	UNIQUE
	);

DECLARE	@ineffective_l3_components	TABLE
	(	l3_id	INTEGER			PRIMARY	KEY,
		l3_nm	VARCHAR (40)	UNIQUE
	);

DECLARE	@districts	TABLE
	(	d_cd	VARCHAR (10)	PRIMARY	KEY,
		d_nm	VARCHAR (40)	UNIQUE
	);

DECLARE	@l3_components	TABLE
	(	d_cd	VARCHAR (10)	NOT	NULL,
		l3_cd	VARCHAR (10)		NULL,
		l3_nm	VARCHAR (40)	NOT	NULL,
--			PRIMARY	KEY	(	d_cd, l3_cd	),
			UNIQUE		(	d_cd, l3_nm	)
	);

SELECT	@sid = level_1_address_component_id
FROM	level_1_address_components
WHERE	level_1_address_component_nm = 'KARNATAKA';

INSERT INTO	audit_logs
		(	[session_id], [application_id], [user_no], [user_role_id], [operation], [screen_id], [object_id], [operation_dts], [is_consumed]	)
	VALUES
		(	0, 'Script', 1, 'System', 'I', 'rev053', 'Karnataka (& Misc.) Address Components', GETDATE(), 0	);
	SET @al	=	SCOPE_IDENTITY ();

--	==================================================
--	Other States corrections	- Level 2
--	==================================================

INSERT	INTO	@l2_renames		VALUES	(	2,		'ANANTHAPURAM',			'Anantapuramu'		),
										(	3,		'CHITTOR',				'CHITTOOR'			),
										(	4,		'YSR Kadapa',			'YSR'				),
										(	52516,	'KRA Daadi',			'Kra Daadi'			),
										(	35,		'Papumpare',			'Papum Pare'		),
										(	52519,	'Shiyomi',				'Shi-Yomi'			),
										(	52525,	'Dima Hasao',			'Dima  Hasao'		),	-- 	Ineffective and NOT to be used; next line is for use
										(	176,	'GURGAON',				'Gurugram'			),
										(	177,	'HISSAR',				'HISAR'				),
												-- Karnataka 
										(	246,	'BANGALORE',			'Bengaluru'			),
										(	247,	'BANGALORE RURAL',		'Bengaluru Rural'	),
										(	248,	'BELGAUM',				'Belagavi'			),
										(	249,	'BELLARY',				'Ballari'			),
										(	251,	'BIJAPUR',				'Vijayapura'		),
										(	252,	'CHAMRAJNAGAR',			'Chamarajanagar'	),
										(	253,	'CHIKMAGALUR',			'Chikkamagaluru'	),
										(	254,	'CHIKBALLAPUR',			'Chikkaballapura'	),
										(	257,	'DAVANGERE',			'Davanagere'		),
										(	260,	'GULBARGA',				'Kalaburagi'		),
										(	267,	'MYSORE',				'Mysuru'			),
										(	270,	'SHIMOGA',				'Shivamogga'		),
										(	271,	'TUMKUR',				'Tumakuru'			);

SET @cnt1 = @@ROWCOUNT;

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

DELETE
FROM	@l2_renames;

INSERT	INTO	@l2_renames		VALUES	(	62,		'North Cachar Hills',	'Dima Hasao'		);

SET @cnt1 = @@ROWCOUNT;

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
	RAISERROR ('Row counts of Level 2 RENAMES mis-match; should be %d, but update only %d', 16, 1, @cnt1, @cnt2);
	ROLLBACK;
	RETURN;
END


--	==================================================
--	Renames	- Level 3
--	==================================================

INSERT	INTO	@l3_renames		VALUES	(	3167,	'CUDDAPAH',	'Kadapa'		);

SET @cnt1 = @@ROWCOUNT;

UPDATE	l3
	SET		level_3_address_component_nm	=	d.new_nm,
			audit_log_id	=	@al
FROM	level_3_address_components	l3
	JOIN	@l3_renames	d
		ON	(	l3.level_3_address_component_id	=	d.l3_id
			AND	l3.level_3_address_component_nm	=	d.l3_nm
			);

SET @cnt2 = @@ROWCOUNT;
IF (@cnt1 != @cnt2)
BEGIN
	RAISERROR ('Row counts of Level 3 RENAMES mis-match; should be %d, but update only %d', 16, 1, @cnt1, @cnt2);
	ROLLBACK;
	RETURN;
END


--	==================================================
--	Effective Districts
--	==================================================

INSERT	INTO	@effective_districts		VALUES	(	62,	'Dima Hasao'	);			--	Assam

SET @cnt1 = @@ROWCOUNT;

UPDATE	l2
	SET		effective_till	=	@tdt,
			audit_log_id	=	@al
FROM	level_2_address_components	l2
	JOIN	@effective_districts	d
		ON	(	l2.level_2_address_component_id	=	d.d_id
			AND	l2.level_2_address_component_nm	=	d.d_nm
			);
SET @cnt2 = @@ROWCOUNT;
IF (@cnt1 != @cnt2)
BEGIN
	RAISERROR ('Row counts of Effective Districts mis-match; should be %d, but update only %d', 16, 1, @cnt1, @cnt2);
	ROLLBACK;
	RETURN;
END

UPDATE	l3
	SET		effective_till	=	@tdt,
			audit_log_id	=	@al
FROM	level_2_address_components	l2
	JOIN	@ineffective_districts	d
		ON	(	l2.level_2_address_component_id	=	d.d_id
			AND	l2.level_2_address_component_nm	=	d.d_nm
			)
	JOIN	level_3_address_components	l3
		ON	(	l3.level_2_address_component_id	=	l2.level_2_address_component_id	);


--	==================================================
--	Ineffective Districts
--	==================================================

INSERT	INTO	@ineffective_districts		VALUES	(	52525,	'Dima  Hasao'			);		--	Assam

SET @cnt1 = @@ROWCOUNT;

UPDATE	l2
	SET		effective_till	=	@fdt,
			audit_log_id	=	@al
FROM	level_2_address_components	l2
	JOIN	@ineffective_districts	d
		ON	(	l2.level_2_address_component_id	=	d.d_id
			AND	l2.level_2_address_component_nm	=	d.d_nm
			);
SET @cnt2 = @@ROWCOUNT;
IF (@cnt1 != @cnt2)
BEGIN
	RAISERROR ('Row counts of Ineffective Districts mis-match; should be %d, but update only %d', 16, 1, @cnt1, @cnt2);
	ROLLBACK;
	RETURN;
END

UPDATE	l3
	SET		effective_till	=	@fdt,
			audit_log_id	=	@al
FROM	level_2_address_components	l2
	JOIN	@ineffective_districts	d
		ON	(	l2.level_2_address_component_id	=	d.d_id
			AND	l2.level_2_address_component_nm	=	d.d_nm
			)
	JOIN	level_3_address_components	l3
		ON	(	l3.level_2_address_component_id	=	l2.level_2_address_component_id	);


--	==================================================
--	Ineffective Level 3 Components
--	==================================================

INSERT	INTO	@ineffective_l3_components		VALUES	(	225389,	'PASCHIMI SINGHBHUM'	),		--	Jharkhand
														(	225390,	'PURBI SINGHBHUM'		),		--	Jharkhand
														(	18934,	'VISAKHA PATNAM'		),		--	Andhra P.
														(	18056,	'VIZIANAGRAM'			),		--	Andhra P.
														(	21254,	'BORGULI'				),		--	Arunachal P.
														(	21007,	'DEDING'				),		--	Arunachal P.
														(	225337,	'EAST SIANG'			),		--	Arunachal P.
														(	21258,	'GELING'				),		--	Arunachal P.
														(	21010,	'HILLTOP'				),		--	Arunachal P.
														(	21262,	'KAYING'				),		--	Arunachal P.
														(	21011,	'KEBANG'				),		--	Arunachal P.
														(	21267,	'LOGUM ZENNINB'			),		--	Arunachal P.
														(	21268,	'MEBO'					),		--	Arunachal P.
														(	21270,	'MIGGING'				),		--	Arunachal P.
														(	21272,	'NAMSING'				),		--	Arunachal P.
														(	21273,	'NGOPAK'				),		--	Arunachal P.
														(	21020,	'PANGIN'				),		--	Arunachal P.
														(	21276,	'PAYUM'					),		--	Arunachal P.
														(	21277,	'PAYUNG'				),		--	Arunachal P.
														(	21279,	'RIGA'					),		--	Arunachal P.
														(	21280,	'RUMGONG'				),		--	Arunachal P.
														(	21281,	'SHIMONG'				),		--	Arunachal P.
														(	21282,	'SILLUK'				),		--	Arunachal P.
														(	21285,	'TUTING'				),		--	Arunachal P.
														(	225344,	'Upper Siang'			),		--	Arunachal P.
														(	21287,	'Viveknagar'			),		--	Arunachal P.
														(	225347,	'West Siang'			),		--	Arunachal P.
														(	21288,	'YINGKIONG'				);		--	Arunachal P.

SET @cnt1 = @@ROWCOUNT;

UPDATE	l3
	SET		effective_till	=	@fdt,
			audit_log_id	=	@al
FROM	level_3_address_components	l3
	JOIN	@ineffective_l3_components	d
		ON	(	l3.level_3_address_component_id	=	d.l3_id
			AND	l3.level_3_address_component_nm	=	d.l3_nm
			);
SET @cnt2 = @@ROWCOUNT;
IF (@cnt1 != @cnt2)
BEGIN
	SELECT	d.*
	FROM	level_3_address_components	l3
		RIGHT JOIN	@ineffective_l3_components	d
			ON	(	l3.level_3_address_component_id	=	d.l3_id
				AND	l3.level_3_address_component_nm	=	d.l3_nm
				)
	WHERE	l3.level_3_address_component_id	IS	NULL;
	RAISERROR ('Row counts of Ineffective Level 3 Components mis-match; should be %d, but update only %d', 16, 1, @cnt1, @cnt2);
	ROLLBACK;
	RETURN;
END


DELETE
FROM	@ineffective_l3_components;

INSERT	INTO	@ineffective_l3_components		VALUES	(	21275,	'PANGIN'	),		--	Arunachal P.
														(	21024,	'RIGA'		);		--	Arunachal P.

SET @cnt1 = @@ROWCOUNT;

UPDATE	l3
	SET		effective_till	=	@fdt,
			audit_log_id	=	@al
FROM	level_3_address_components	l3
	JOIN	@ineffective_l3_components	d
		ON	(	l3.level_3_address_component_id	=	d.l3_id
			AND	l3.level_3_address_component_nm	=	d.l3_nm
			);
SET @cnt2 = @@ROWCOUNT;
IF (@cnt1 != @cnt2)
BEGIN
	RAISERROR ('Row counts of Ineffective Level 3 Components mis-match; should be %d, but update only %d', 16, 1, @cnt1, @cnt2);
	ROLLBACK;
	RETURN;
END


--	==================================================
--	New Districts and their Level 3 components
--	==================================================

SET @d_cd = 'BK';

INSERT	INTO	@districts		VALUES	(	@d_cd,	'Bagalkot'	);
SET @cnt1 = @@ROWCOUNT;

INSERT	INTO	@l3_components	(	d_cd, l3_nm	) VALUES
								(	@d_cd,	'Bagalkot'			),
								(	@d_cd,	'Badami'			),
								(	@d_cd,	'Kaladgi'			),
								(	@d_cd,	'Sitimani'			),
								(	@d_cd,	'Bilagi'			),
								(	@d_cd,	'Savalgi'			),
								(	@d_cd,	'Ilkal'				),
								(	@d_cd,	'Lokapur'			),
								(	@d_cd,	'Hunagunda'			),
								(	@d_cd,	'Kerur'				),
								(	@d_cd,	'Rabkavi Banhatti'	),
								(	@d_cd,	'Kulgeri'			),
								(	@d_cd,	'Terdal'			),
								(	@d_cd,	'Anagawadi'			),
								(	@d_cd,	'Guledgudda'		),
								(	@d_cd,	'Amingad'			),
								(	@d_cd,	'Jamkhandi'			),
								(	@d_cd,	'Kardi'				),
								(	@d_cd,	'Mudhol'			);

SET @cnt2 = @@ROWCOUNT;

--	==================================================

SET @d_cd = 'VN';

INSERT	INTO	@districts		VALUES	(	@d_cd,	'Vijayanagara'	);
SET @cnt1 = @cnt1 + @@ROWCOUNT;

INSERT	INTO	@l3_components	(	d_cd, l3_nm	) VALUES
								(	@d_cd,	'Hosapete'				),
								(	@d_cd,	'Harapanahalli'			),
								(	@d_cd,	'Huvina Hadagali'		),
								(	@d_cd,	'Hagaribommanahalli'	),
								(	@d_cd,	'Kottur'				),
								(	@d_cd,	'Kamlapur'				),
								(	@d_cd,	'Mariyammanahalli'		),
								(	@d_cd,	'Haḍagali'				),
								(	@d_cd,	'Ittigi'				),
								(	@d_cd,	'Hirehadagali'			),
								(	@d_cd,	'Koodligi'				),
								(	@d_cd,	'Gudekote'				),
								(	@d_cd,	'Hosahalli'				),
								(	@d_cd,	'Kogali'				),
								(	@d_cd,	'Arasikeri'				),
								(	@d_cd,	'Cigateri'				),
								(	@d_cd,	'Kasaba'				),
								(	@d_cd,	'Telagi'				);

SET @cnt2 = @cnt2 + @@ROWCOUNT;

--	==================================================

SET @d_cd = 'YG';

INSERT	INTO	@districts		VALUES	(	@d_cd,	'Yadagiri'	);
SET @cnt1 = @cnt1 + @@ROWCOUNT;

INSERT	INTO	@l3_components	(	d_cd, l3_nm	) VALUES
								(	@d_cd,	'Yadagiri'     ),
								(	@d_cd,	'Balichakra'   ),
								(	@d_cd,	'Doranalli'    ),
								(	@d_cd,	'Gogi'         ),
								(	@d_cd,	'Gurmitkal'    ),
								(	@d_cd,	'Hattikuni'    ),
								(	@d_cd,	'Hunasagi'     ),
								(	@d_cd,	'Kakkera'      ),
								(	@d_cd,	'Kembhavi'     ),
								(	@d_cd,	'Kodekeel'     ),
								(	@d_cd,	'Konkala'      ),
								(	@d_cd,	'Saidapora'    ),
								(	@d_cd,	'Shahpura'     ),
								(	@d_cd,	'Shorapura'    ),
								(	@d_cd,	'Wadgera'      );

SET @cnt2 = @cnt2 + @@ROWCOUNT;


--	===========================================================
--	Check whether Level 3 Code has been provided, and is UNIQUE
--	===========================================================

UPDATE	@l3_components
	SET	l3_cd	=	SUBSTRING (l3_nm, 1, 1)
WHERE	l3_cd	IS	NULL;

WITH dups AS (
	SELECT	d_cd, l3_cd, COUNT (*) cnt
	FROM	@l3_components
	GROUP BY d_cd, l3_cd
		HAVING 	COUNT (*)	>	1
),
uniq AS	(
	SELECT	d.l3_cd + CONVERT (VARCHAR, ROW_NUMBER () OVER (PARTITION BY d.d_cd, d.l3_cd ORDER BY l3.l3_nm)) l3_cd, d.d_cd, l3.l3_nm
	FROM	dups	d
		JOIN	@l3_components	l3
			ON	(	d.d_cd	=	l3.d_cd
				AND	d.l3_cd	=	l3.l3_cd
				)
)
UPDATE	l3
	SET	l3_cd	=	d.l3_cd
FROM	uniq	d
	JOIN	@l3_components	l3
		ON	(	d.d_cd	=	l3.d_cd
			AND	d.l3_nm	=	l3.l3_nm
			);

WITH dups AS (
	SELECT	d_cd, l3_cd, COUNT (*) cnt
	FROM	@l3_components
	GROUP BY d_cd, l3_cd
		HAVING 	COUNT (*)	>	1
)
SELECT	*
FROM	dups;
IF (@@ROWCOUNT > 0)
BEGIN
	RAISERROR ('Codes of Level 3 within Level 2 are NOT unique', 16, 1, @cnt1, @cnt3);
	ROLLBACK;
	RETURN;
END
--	=================================================
--	We now INSERT into Level 2 & 3 Address Components
--	=================================================

INSERT INTO level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic, effective_from, effective_till, frro_level2_nm, audit_log_id	)
	SELECT	d_cd, d_nm, @sid, 1, @fdt, @tdt, d_nm, @al
	FROM	@districts;
SET @cnt3 = @@ROWCOUNT;
IF (@cnt1 != @cnt3)
BEGIN
	RAISERROR ('Row counts of New Districts mis-match; should be %d, but added only %d', 16, 1, @cnt1, @cnt3);
	ROLLBACK;
	RETURN;
END

INSERT INTO level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, frro_level3_nm, audit_log_id	)
	SELECT	l3_cd, l3_nm, l2.level_2_address_component_id, 1, @fdt, @tdt, l3_nm, @al
	FROM	@l3_components	l3
		JOIN	level_2_address_components	l2
			ON	(	l2.level_1_address_component_id	=	@sid
				AND	l2.level_2_address_component_cd	=	l3.d_cd
				);
SET @cnt3 = @@ROWCOUNT;
IF (@cnt2 != @cnt3)
BEGIN
	RAISERROR ('Row counts of New Level 3 Address Components mis-match; should be %d, but added only %d', 16, 1, @cnt2, @cnt3);
	ROLLBACK;
	RETURN;
END


SELECT	*
FROM	level_2_address_components
WHERE	audit_log_id	=	@al
ORDER	BY	8, 3;

SELECT	*
FROM	level_3_address_components
WHERE	audit_log_id	=	@al
ORDER	BY	8, 4, 3;

