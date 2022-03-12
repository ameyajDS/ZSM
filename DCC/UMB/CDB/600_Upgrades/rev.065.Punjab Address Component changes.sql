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
WHERE	level_1_address_component_nm = 'Punjab';

INSERT INTO	audit_logs
		(	[session_id], [application_id], [user_no], [user_role_id], [operation], [screen_id], [object_id], [operation_dts], [is_consumed]	)
	VALUES
		(	0, 'Script', 1, 'System', 'I', 'rev065', 'Punjab-Address Components', GETDATE(), 0	);
	SET @al	=	SCOPE_IDENTITY ();

--	==================================================
--	Corrections	- Level 2
--	==================================================

INSERT	INTO	@l2_renames		VALUES	(	473,	'Muktsar',									'Sri Muktsar Sahib'				),
										(	477,	'Ropar',									'Rupnagar'		   				),
										(	472,	'Sahibzada Ajit Singh Nagar (MOHALI)',		'Sahibzada Ajit Singh Nagar'	),
										(	474,	'SHAHEED BHAGAT SINGH NAGAR (NAWAN SHAHR)',	'SHAHEED BHAGAT SINGH NAGAR'	);

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

--	==================================================
--	Renames	- Level 3
--	==================================================

INSERT	INTO	@l3_renames		VALUES	(	134299,	'Muktsar',	'Sri Muktsar Sahib'	),
										(	135047,	'Ropar',	'Rupnagar'		   	);

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
--	Ineffective Level 3 Components
--	==================================================

INSERT	INTO	@ineffective_l3_components		VALUES	(	134510,	'NAWANSHAHAR'	),
														(	134511,	'NAWANSHAHR'	);

SET @cnt1 = @@ROWCOUNT;

UPDATE	l3
	SET		effective_till	=	@fdt,
			audit_log_id	=	@al
FROM	@ineffective_l3_components	d
	JOIN	level_3_address_components	l3
		ON	(	l3.level_3_address_component_id	=	d.l3_id
			AND	l3.level_3_address_component_nm	=	d.l3_nm
			)
SET @cnt2 = @@ROWCOUNT;
IF (@cnt1 != @cnt2)
BEGIN
	RAISERROR ('Row counts of Ineffective Level 3 components mis-match; should be %d, but update only %d', 16, 1, @cnt1, @cnt2);
	ROLLBACK;
	RETURN;
END


--	==================================================
--	New Districts and their Level 3 components
--	==================================================

SET @d_cd = 'MK';

INSERT	INTO	@districts		VALUES	(	@d_cd,	'Malerkotla'	);
SET @cnt1 = @@ROWCOUNT;

INSERT	INTO	@l3_components	(	d_cd, l3_nm	)	VALUES
	--									(	@d_cd,	'Malerkotla'	),
										(	@d_cd,	'Ahmedgarh'		),
										(	@d_cd,	'Amargarh'		);
SET @cnt2 = @@ROWCOUNT;

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

