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
	@fdt	DATE	=	GETDATE(),
	@tdt	DATE	=	'31 Dec 9999',
	@al		INTEGER,	--	audit_log_id
	@cnt1	INTEGER,
	@cnt2	INTEGER,
	@cnt3	INTEGER;

SET @eftdt = DATEADD (d, -1, @eftdt);

DECLARE	@l2_renames	TABLE
	(	l2_id	INTEGER			NOT	NULL	PRIMARY	KEY,
		l2_nm	VARCHAR (40)	NOT	NULL,
		new_nm	VARCHAR (40)	NOT	NULL
	);

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

DECLARE	@l3_components	TABLE
	(	l2_id	VARCHAR (10)	NOT	NULL,
		l2_nm	VARCHAR (40)	NOT	NULL,
		l3_cd	VARCHAR (10)		NULL,
		l3_nm	VARCHAR (40)	NOT	NULL,
--			PRIMARY	KEY	(	d_cd, l3_cd	),
			UNIQUE		(	l2_id, l3_nm	)
	);

INSERT INTO	audit_logs
		(	[session_id], [application_id], [user_no], [user_role_id], [operation], [screen_id], [object_id], [operation_dts], [is_consumed]	)
	VALUES
		(	0, 'Script', 1, 'System', 'I', 'rev085', 'Address Components and Alternates', GETDATE(), 0	);
	SET @al	=	SCOPE_IDENTITY ();




--	==================================================
--	Corrections -- Level 2 Address Components
--	==================================================

INSERT	INTO	@l2_renames		VALUES	(	5630,	'Mirpurkhas',		'Mirpur Khas'	),
										(	45431,	'uMgungundlovu',	'umGungundlovu'	);

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
--	Alternate Level 1 Names
--	==================================================

INSERT	INTO	@l1_alternates		VALUES	(	1311,	'Ar Riyad',			'Riyadh'			),
											(	1164,	'Lisboa',			'Lisbon'			);

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


--	==================================================
--	Alternate Level 2 Names
--	==================================================

INSERT	INTO	@l2_alternates		VALUES	(	25008,	'Ar-Riyad',			'Riyadh'			),
											(	45431,	'umGungundlovu',	'Pietermaritzburg'	),
											(	19294,	'Lisboa',			'Lisbon'			);

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

--	===========================================================
--	Level 3 Components
--	===========================================================


INSERT	INTO	@l3_components	(	l2_id, l2_nm, l3_nm	)	VALUES
										(	4684,	'Telford and Wrekin',	'Coalbrookdale'	),
										(	4684,	'Telford and Wrekin',	'Crudgington'	),
										(	4684,	'Telford and Wrekin',	'Edgmond'		),
										(	4684,	'Telford and Wrekin',	'High Ercall'	),
										(	4684,	'Telford and Wrekin',	'Ironbridge'	),
										(	4684,	'Telford and Wrekin',	'Jackfield'		),
										(	4684,	'Telford and Wrekin',	'Newport'		),
										(	4684,	'Telford and Wrekin',	'Roden'			),
										(	4684,	'Telford and Wrekin',	'Telford'		),
										(	4684,	'Telford and Wrekin',	'Tibberton'		),
										(	4684,	'Telford and Wrekin',	'Wrockwardine'	),

										(	4586,	'Bracknell Forest',			'Bracknell'		),
										(	4586,	'Bracknell Forest',			'Sandhurst'		),
										(	4688,	'West Berkshire',			'Newbury'		),
										(	4688,	'West Berkshire',			'Thatcham'		),
										(	4687,	'Windsor and Maidenhead',	'Windsor'		),
										(	4687,	'Windsor and Maidenhead',	'Maidenhead'	),
										(	4693,	'Wokingham',				'Twyford'		),
										(	4622,	'Hampshire',				'Basingstoke'	),
										(	4695,	'Warwickshire',				'Leamington Spa'),
										(	4595,	'Buckinghamshire',			'Iver'			);

SET @cnt2 = @@ROWCOUNT;

--	===========================================================
--	Check whether Level 3 Code has been provided, and is UNIQUE
--	===========================================================

UPDATE	@l3_components
	SET	l3_cd	=	SUBSTRING (l3_nm, 1, 1)
WHERE	l3_cd	IS	NULL;

WITH dups AS (
	SELECT	l2_id, l3_cd, COUNT (*) cnt
	FROM	@l3_components
	GROUP BY l2_id, l3_cd
		HAVING 	COUNT (*)	>	1
),
uniq AS	(
	SELECT	d.l3_cd + CONVERT (VARCHAR, ROW_NUMBER () OVER (PARTITION BY d.l2_id, d.l3_cd ORDER BY l3.l3_nm)) l3_cd, d.l2_id, l3.l3_nm
	FROM	dups	d
		JOIN	@l3_components	l3
			ON	(	d.l2_id	=	l3.l2_id
				AND	d.l3_cd	=	l3.l3_cd
				)
)
UPDATE	l3
	SET	l3_cd	=	d.l3_cd
FROM	uniq	d
	JOIN	@l3_components	l3
		ON	(	d.l2_id	=	l3.l2_id
			AND	d.l3_nm	=	l3.l3_nm
			);

WITH dups AS (
	SELECT	l2_id, l3_cd, COUNT (*) cnt
	FROM	@l3_components
	GROUP BY l2_id, l3_cd
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
--	==================================================


INSERT INTO level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	SELECT	l3_cd, l3_nm, l2.level_2_address_component_id, 1, @fdt, @tdt, @al
	FROM	@l3_components	l3
		JOIN	level_2_address_components	l2
			ON	(	l2.level_2_address_component_id	=	l3.l2_id
				AND	l2.level_2_address_component_nm	=	l3.l2_nm
				);
SET @cnt3 = @@ROWCOUNT;
IF (@cnt2 != @cnt3)
BEGIN
	RAISERROR ('Row counts of New Level 3 Address Components mis-match; should be %d, but added only %d', 16, 1, @cnt2, @cnt3);
	ROLLBACK;
	RETURN;
END

--	==================================================
--	==================================================
--	===========================================================
--	Level 3 Ineffective
--	===========================================================

DECLARE	@l3_ineffective	TABLE
	(	l3_id	INTEGER			NOT	NULL	PRIMARY	KEY,
		l3_nm	VARCHAR (40)	NOT	NULL
	);

INSERT	INTO	@l3_ineffective	(	l3_id, l3_nm	)	VALUES
										(	215715,	'Bracknell Forest'			),
										(	216022,	'Windsor and Maidenhead'	),
										(	215827,	'Basingstoke and Deane'		),
										(	216012,	'West Berkshire'			);

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

--	===========================================================

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

