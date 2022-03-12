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
	@is_err	BIT		=	0,
	@al		INTEGER,	--	audit_log_id
	@cnt1	INTEGER,
	@cnt2	INTEGER,
	@cnt3	INTEGER;

SET @eftdt = DATEADD (d, -1, @eftdt);


INSERT INTO	audit_logs
		(	[session_id], [application_id], [user_no], [user_role_id], [operation], [screen_id], [object_id], [operation_dts], [is_consumed]	)
	VALUES
		(	0, 'Script', 1, 'System', 'I', 'rev086', 'U.S. Level 2 Address Components', GETDATE(), 0	);
	SET @al	=	SCOPE_IDENTITY ();

--	==================================================
--	Get the Base Data
--	==================================================

DROP	TABLE	IF EXISTS	rev086_input;

CREATE	TABLE	rev086_input	(	l1_nm	VARCHAR (50)	NOT	NULL,
									l2_nm	VARCHAR (50)	NOT	NULL,
										PRIMARY	KEY	(	l1_nm, l2_nm	)
								);


DROP	TABLE	IF EXISTS	rev086_base;

CREATE	TABLE	rev086_base		(	cn_cd	VARCHAR (10)	NOT	NULL,
									l1_nm	VARCHAR (50)	NOT	NULL,
									l1_cd	VARCHAR (10)	NOT	NULL,
									l2_nm	VARCHAR (50)	NOT	NULL,
									l2_cd	VARCHAR (10)		NULL,

										PRIMARY	KEY	(	l1_nm, l2_nm	)
								);

BULK INSERT	rev086_input
	FROM	'c:\jiten\rev.086.US_AddressComponents.csv'
		WITH	(	FIELDTERMINATOR	=	',',
					ROWTERMINATOR	=	'\n'
				);
IF (@@ROWCOUNT > 0)
BEGIN
	WITH b	AS	(
		SELECT	DISTINCT	SUBSTRING (l1_nm, 1, CHARINDEX ('(', l1_nm) - 1)	l1_nm,
							SUBSTRING (l1_nm, CHARINDEX ('(', l1_nm) + 1, 2)	l1_cd,
							l1_nm AS l1_full_nm
		FROM	rev086_input
	)
	INSERT INTO	rev086_base
		SELECT	COALESCE (c.country_cd, 'US'), b.l1_nm, b.l1_cd, t.l2_nm, NULL
		FROM	b
			LEFT	JOIN	countries	c
				ON	(	c.country_cd	=	b.l1_cd
					AND	b.l1_cd	IN	(	'AS', 'FM', 'GU', 'MH', 'MP', 'PW', 'PR', 'VI'	)
					)
			JOIN	rev086_input	t
				ON	(	t.l1_nm	=	b.l1_full_nm	);
	SET @cnt1 = @@ROWCOUNT;
	
	/*
	SELECT	DISTINCT	c.*
	FROM	rev086_base	b
		JOIN	countries	c
			ON	(	c.country_cd 	=	b.cn_cd
				AND	b.cn_cd			!=	'US'
				);
				*/

		--	Level 1 address components
	WITH b AS
	(	SELECT	DISTINCT	cn_cd, l1_nm, l1_cd
		FROM	rev086_base
		WHERE	cn_cd	=	'US'
	),
	l1 AS
	(	SELECT	*
		FROM	v_level_1_address_components
		WHERE	country_cd	=	'US'
	)
		SELECT	*
		FROM	b
			FULL OUTER JOIN	l1
				ON	(	l1.level_1_address_component_cd	=	b.l1_cd
					OR	l1.level_1_address_component_nm	=	b.l1_nm	
					)
		WHERE	b.l1_cd			IS	NULL
		OR		l1.country_cd	IS	NULL;
	IF (@@ROWCOUNT > 0)
	BEGIN
		SET @is_err	=	1;
		RAISERROR ('Level 1 Address Names mis-match; these are yet to be handled', 16, 1);
	END;

	DELETE
	FROM	rev086_base
	WHERE	cn_cd	!=	'US';

		--	Level 2 address components
		/*
	WITH b AS
	(	SELECT	*
		FROM	rev086_base
		WHERE	cn_cd	=	'US'
	),
	l2 AS
	(	SELECT	*
		FROM	v_level_2_address_components
		WHERE	country_cd	=	'US'
	)
		SELECT	*
		FROM	b
			FULL JOIN	l2
				ON	(	l2.level_1_address_component_cd	=	b.l1_cd
					AND	l2.level_2_address_component_nm	=	b.l2_nm	
					)
		WHERE	b.l1_cd			IS	NULL
		OR		l2.country_cd	IS	NULL;
		*/

	--	===========================================================
	--	Check whether Level 2 Code has been provided, and is UNIQUE
	--	===========================================================

	UPDATE	rev086_base
		SET	l2_cd	=	SUBSTRING (l2_nm, 1, 1)
	WHERE	l2_cd	IS	NULL;

	WITH dups AS (
		SELECT	l1_cd, l2_cd, COUNT (*) cnt
		FROM	rev086_base
		GROUP BY l1_cd, l2_cd
			HAVING 	COUNT (*)	>	1
	),
	uniq AS	(
		SELECT	d.l2_cd + CONVERT (VARCHAR, ROW_NUMBER () OVER (PARTITION BY d.l1_cd, d.l2_cd ORDER BY l2.l2_nm)) l2_cd, d.l1_cd, l2.l2_nm
		FROM	dups	d
			JOIN	rev086_base	l2
				ON	(	d.l1_cd	=	l2.l1_cd
					AND	d.l2_cd	=	l2.l2_cd
					)
	)
	UPDATE	l2
		SET	l2_cd	=	d.l2_cd
	FROM	uniq	d
		JOIN	rev086_base	l2
			ON	(	d.l1_cd	=	l2.l1_cd
				AND	d.l2_nm	=	l2.l2_nm
				);

	WITH dups AS (
		SELECT	l1_cd, l2_cd, COUNT (*) cnt
		FROM	rev086_base
		GROUP BY l1_cd, l2_cd
			HAVING 	COUNT (*)	>	1
	)
	SELECT	*
	FROM	dups;
	IF (@@ROWCOUNT > 0)
	BEGIN
		RAISERROR ('Codes of Level 2 within Level 2 are NOT unique', 16, 1, @cnt1, @cnt3);
		ROLLBACK;
		RETURN;
	END

	--	===========================================================
	--	Level 2 Ineffective
	--	===========================================================

	UPDATE	l2
		SET		effective_till	=	@eftdt,
				audit_log_id	=	@al
	FROM	level_2_address_components	l2
		JOIN	level_1_address_components	l1
			ON	(	l2.level_1_address_component_id	=	l1.level_1_address_component_id
				AND	l1.country_id					=	86				--	U.S.A.
				)
		LEFT JOIN	rev086_base	t
			ON	(	l1.level_1_address_component_cd	=	t.l1_cd
				AND	l2.level_2_address_component_nm	=	t.l2_nm
				)
		WHERE	t.l2_nm	IS	NULL;

	SET @cnt2 = @@ROWCOUNT;

	PRINT 'Level 2 Ineffective ' + CONVERT (VARCHAR, @cnt2);

--	===========================================================
	--	==================================================
	--	New Level 2 Components
	--	===========================================================


	INSERT INTO level_2_address_components
			(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
		SELECT	l2_cd, l2_nm, l1.level_1_address_component_id, 1, @fdt, @tdt, @al
		FROM	rev086_base	b
			JOIN	level_1_address_components	l1
				ON	(	l1.level_1_address_component_cd	=	b.l1_cd
					AND	l1.level_1_address_component_nm	=	b.l1_nm
					AND	l1.country_id					=	86				--	U.S.A.
					)
			LEFT JOIN	level_2_address_components	l2
				ON	(	l2.level_1_address_component_id	=	l1.level_1_address_component_id
					AND	l2.level_2_address_component_nm	=	l2_nm
					)
		WHERE	l2.level_2_address_component_nm	IS	NULL;

	SET @cnt2 = @@ROWCOUNT;

	PRINT 'Level 2 Added ' + CONVERT (VARCHAR, @cnt2);

END

DROP	TABLE	rev086_input;
DROP	TABLE	rev086_base;

