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

DECLARE	@ineffective_districts	TABLE
	(	d_id	INTEGER			PRIMARY	KEY,
		d_nm	VARCHAR (40)	UNIQUE
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
WHERE	level_1_address_component_nm = 'Uttar Pradesh';

INSERT INTO	audit_logs
		(	[session_id], [application_id], [user_no], [user_role_id], [operation], [screen_id], [object_id], [operation_dts], [is_consumed]	)
	VALUES
		(	0, 'Script', 1, 'System', 'I', 'rev073', 'Uttar Pradesh-Address Components', GETDATE(), 0	);
	SET @al	=	SCOPE_IDENTITY ();

--	==================================================
--	Corrections	- Level 2
--	==================================================

INSERT	INTO	@l2_renames		VALUES	(	696,	'AMETHI (CHHATRAPATI SHAHUJI MAH. NAGAR)',	'Amethi'						),
										(	568,	'ALLAHABAD',								'Prayagraj'						),
										(	588,	'Faizabad',									'Ayodhya'						),
										(	601,	'J.P. NAGAR (AMROHA)',						'Amroha'						),
										(	606,	'Kanpur',									'Kanpur Nagar'					),
										(	697,	'KASGANJ (KANSHIRAM NAGAR)',				'Kasganj'						),
										(	700,	'LAKHIMPUR KHERI',							'LAKHIMPUR KHERI (not in use)'	),
										(	610,	'KUSHINAGAR',								'KUSHI NAGAR'					),
										(	630,	'SHRAWASTI',								'SHRAVASTI'						),
										(	621,	'MUZAFFARNAGAR',							'MUZAFFAR NAGAR'				),
										(	698,	'SHAMLI (PRABUDH NAGAR)',					'SHAMLI'						),
										(	699,	'SAMBHAL (BHIM NAGAR)',						'SAMBHAL'						),
										(	628,	'SANT RAVIDAS NAGAR (BHADOHI)',				'BHADOHI'						),
										(	593,	'Gautam Budh Nagar',						'Gautam Buddha Nagar'			);

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

INSERT	INTO	@l2_renames		VALUES	(	609,	'KHERI',	'LAKHIMPUR KHERI'	);
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
	RAISERROR ('Row counts of Level 2 RENAMES mis-match (2); should be %d, but update only %d', 16, 1, @cnt1, @cnt2);
	RETURN;
END

--	==================================================
--	Renames	- Level 3
--	==================================================

															--	Tripura
INSERT	INTO	@l3_renames		VALUES	(	170818,	'BELONIYA',				'BELONIA '			),
										(	170819,	'BELONIYA AERODROME',	'BELONIA AERODROME'	),
															--	UP
										(	225481,	'AMETHI (CHHATRAPATI SHAHUJI MAH. NAGAR)',	'Amethi'	),
										(	225490,	'KASGANJ (KANSHIRAM NAGAR)',				'Kasganj'	),
										(	225496,	'SHAMLI (PRABUDH NAGAR)',					'SHAMLI'	),
										(	225493,	'SAMBHAL (BHIM NAGAR)',						'SAMBHAL'	);

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
--	Ineffective Districts
--	==================================================

INSERT	INTO	@ineffective_districts		VALUES	(	700,	'LAKHIMPUR KHERI (not in use)'	),
													(	635,	'TEHRI'							);

SET @cnt1 = @@ROWCOUNT;

UPDATE	l2
	SET		effective_till	=	@fdt,
			audit_log_id	=	@al
FROM	level_2_address_components	l2
	JOIN	@ineffective_districts	d
		ON	(	l2.level_2_address_component_id	=	d.d_id
			AND	l2.level_2_address_component_nm	=	d.d_nm
			AND	l2.level_1_address_component_id	=	@sid
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
			AND	l2.level_1_address_component_id	=	@sid
			)
	JOIN	level_3_address_components	l3
		ON	(	l3.level_2_address_component_id	=	l2.level_2_address_component_id	);

--	==================================================
--	New Level 3 components
--	==================================================

SET @d_cd = 'AMTH';		--	Amethi

INSERT	INTO	@l3_components	(	d_cd, l3_nm	)	VALUES
										(	@d_cd,	'Gauriganj'		),
										(	@d_cd,	'Musafirkhana'	),
										(	@d_cd,	'Jagdishpur'  	),
										(	@d_cd,	'Bazar Shukul'	),
										(	@d_cd,	'Bhetua'      	),
										(	@d_cd,	'Bhadar'      	),
										(	@d_cd,	'Sangrampur'  	),
										(	@d_cd,	'Shahgarh'    	),
										(	@d_cd,	'Jamo'        	),
										(	@d_cd,	'Singhpur'    	),
										(	@d_cd,	'Bhadurpur'   	),
										(	@d_cd,	'Tiloi'			);
SET @cnt2 = @@ROWCOUNT;

--	==================================================
SET @d_cd = 'KSGNJ';	--	Kasganj

INSERT	INTO	@l3_components	(	d_cd, l3_nm	)	VALUES
										(	@d_cd,	'Patiyali'		),
										(	@d_cd,	'Soron'			),
										(	@d_cd,	'Ganjdundwara'	),
										(	@d_cd,	'Amanpur'		),
										(	@d_cd,	'Sidhpura'		),
										(	@d_cd,	'Mohanpur'		),
										(	@d_cd,	'Bhargain'		),
										(	@d_cd,	'Bilram'		),
										(	@d_cd,	'Sahawar'		);
SET @cnt2 = @cnt2 + @@ROWCOUNT;

--	==================================================
SET @d_cd = 'SMB';		--	Sambhal

INSERT	INTO	@l3_components	(	d_cd, l3_nm	)	VALUES
										(	@d_cd,	'Chandausi'		),
										(	@d_cd,	'Behjol'		),
										(	@d_cd,	'Asmoli'		),
										(	@d_cd,	'Rajpura'		),
										(	@d_cd,	'Baniyakheda'	),
										(	@d_cd,	'Junavi'		),
										(	@d_cd,	'Panwasa'		),	
										(	@d_cd,	'Gunnaur'		);
SET @cnt2 = @cnt2 + @@ROWCOUNT;

--	==================================================
SET @d_cd = 'SML';		--	Shamli

INSERT	INTO	@l3_components	(	d_cd, l3_nm	)	VALUES
										(	@d_cd,	'Kairana'		),
										(	@d_cd,	'Unn'			),
										(	@d_cd,	'Thanabhawan'	),
										(	@d_cd,	'Kandhala'		);
SET @cnt2 = @cnt2 + @@ROWCOUNT;

--	==================================================

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
--	We now INSERT into Level 3 Address Components
--	=================================================

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
