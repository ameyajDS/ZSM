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
WHERE	level_1_address_component_nm = 'JAMMU & KASHMIR';

INSERT INTO	audit_logs
		(	[session_id], [application_id], [user_no], [user_role_id], [operation], [screen_id], [object_id], [operation_dts], [is_consumed]	)
	VALUES
		(	0, 'Script', 1, 'System', 'I', 'rev048', 'Address Components', GETDATE(), 0	);
	SET @al	=	SCOPE_IDENTITY ();

--	==================================================
--	New Districts and their Level 3 components
--	==================================================

SET @d_cd = 'BP';		-- Bandipora


INSERT	INTO	@l3_components	(	d_cd, l3_nm	) VALUES
								(	@d_cd,	'Sumbal Sonawari'	),
								(	@d_cd,	'Ajas'				),
								(	@d_cd,	'Hajin'				),
								(	@d_cd,	'Aloosa'			),
								(	@d_cd,	'Gurez'				),
								(	@d_cd,	'Tulail'			);

SET @cnt2 = @@ROWCOUNT;

--	==================================================

SET @d_cd = 'GB';		--	Ganderbal

INSERT	INTO	@l3_components	(	d_cd, l3_nm	) VALUES
								(	@d_cd,	'Kangan'		),
								(	@d_cd,	'Tullamulla'	),
								(	@d_cd,	'Wakoora'		),
								(	@d_cd,	'Lar'			),
								(	@d_cd,	'Gund'			);

SET @cnt2 = @cnt2 + @@ROWCOUNT;

--	==================================================

SET @d_cd = 'KG';		--	Kulgam

INSERT	INTO	@l3_components	(	d_cd, l3_nm	) VALUES
								(	@d_cd,	'Damhal Hanjipora'	),
								(	@d_cd,	'Devsar'	),
								(	@d_cd,	'Frisal'	),
								(	@d_cd,	'Yaripora'	),
								(	@d_cd,	'Qaimoh'	),
								(	@d_cd,	'Pahloo'	);

SET @cnt2 = @cnt2 + @@ROWCOUNT;

--	==================================================

SET @d_cd = 'RB';		--	Ramban

INSERT	INTO	@l3_components	(	d_cd, l3_nm	) VALUES
								(	@d_cd,	'Banihal'	),
								(	@d_cd,	'Khari'		),
								(	@d_cd,	'Ukhral'	),
								(	@d_cd,	'Batote'	),
								(	@d_cd,	'Rajgarh'	),
								(	@d_cd,	'Gool'		),
								(	@d_cd,	'Ramsoo'	);

SET @cnt2 = @cnt2 + @@ROWCOUNT;

--	==================================================

SET @d_cd = 'SP';		--	Shopian

INSERT	INTO	@l3_components	(	d_cd, l3_nm	) VALUES
								(	@d_cd,	'Barbugh'	),
								(	@d_cd,	'Hermain'	),
								(	@d_cd,	'Keegam'	),
								(	@d_cd,	'Chitragam'	),
								(	@d_cd,	'Zainpora'	),
								(	@d_cd,	'Keller'	);

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
