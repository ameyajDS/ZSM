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
WHERE	level_1_address_component_nm = 'Delhi';

INSERT INTO	audit_logs
		(	[session_id], [application_id], [user_no], [user_role_id], [operation], [screen_id], [object_id], [operation_dts], [is_consumed]	)
	VALUES
		(	0, 'Script', 1, 'System', 'I', 'rev044', 'Address Components', GETDATE(), 0	);
	SET @al	=	SCOPE_IDENTITY ();


--	==================================================
--	New Districts and their Level 3 components
--	==================================================

SET @d_cd = 'CD';

INSERT	INTO	@l3_components	(	d_cd, l3_nm	) VALUES
								(	@d_cd,	'Civil Lines'	),
								(	@d_cd,	'Karol Bagh'	),
								(	@d_cd,	'Daryaganj'		),
								(	@d_cd,	'Kotwali'		);

SET @cnt2 = @cnt2 + @@ROWCOUNT;

--	==================================================

SET @d_cd = 'ED';

INSERT	INTO	@l3_components	(	d_cd, l3_nm	) VALUES
								(	@d_cd,	'Shastri Nagar'	),
								(	@d_cd,	'Gandhi Nagar'	),
								(	@d_cd,	'Mayur Vihar'   ),
								(	@d_cd,	'Preet Vihar'   );

SET @cnt2 = @cnt2 + @@ROWCOUNT;

--	==================================================

SET @d_cd = '693';

INSERT	INTO	@l3_components	(	d_cd, l3_nm	) VALUES
								(	@d_cd,	'Chanakyapuri'	),
								(	@d_cd,	'Vasant Vihar'	);

SET @cnt2 = @cnt2 + @@ROWCOUNT;

--	==================================================

SET @d_cd = 'ND';

INSERT	INTO	@l3_components	(	d_cd, l3_nm	) VALUES
								(	@d_cd,	'Alipur'		),
								(	@d_cd,	'Model Town'	),
								(	@d_cd,	'Narela'		);

SET @cnt2 = @cnt2 + @@ROWCOUNT;

--	==================================================

SET @d_cd = 'NED';

INSERT	INTO	@l3_components	(	d_cd, l3_nm	) VALUES
								(	@d_cd,	'Karawal Nagar'	),
								(	@d_cd,	'Seelampur'		),
								(	@d_cd,	'Yamuna Vihar'	);

SET @cnt2 = @cnt2 + @@ROWCOUNT;

--	==================================================

SET @d_cd = 'NWD';

INSERT	INTO	@l3_components	(	d_cd, l3_nm	) VALUES
								(	@d_cd,	'Kanjhawala'		),
								(	@d_cd,	'Rohini'			),
								(	@d_cd,	'Saraswati Vihar'	);

SET @cnt2 = @cnt2 + @@ROWCOUNT;


--	==================================================

SET @d_cd = 'SH';

INSERT	INTO	@l3_components	(	d_cd, l3_nm	) VALUES
								(	@d_cd,	'Seemapuri'		),
								(	@d_cd,	'Vivek Vihar'	);

SET @cnt2 = @cnt2 + @@ROWCOUNT;


--	==================================================

SET @d_cd = 'SD';

INSERT	INTO	@l3_components	(	d_cd, l3_nm	) VALUES
								(	@d_cd,	'Saket'		),
								(	@d_cd,	'Hauz Khas'	),
								(	@d_cd,	'Meharauli'	);

SET @cnt2 = @cnt2 + @@ROWCOUNT;


--	==================================================

SET @d_cd = 'SED';

INSERT	INTO	@l3_components	(	d_cd, l3_nm	) VALUES
								(	@d_cd,	'Defence Colony'	),
								(	@d_cd,	'Kalkaji'			),
								(	@d_cd,	'Sarita Vihar'		);

SET @cnt2 = @cnt2 + @@ROWCOUNT;


--	==================================================

SET @d_cd = 'SWD';

INSERT	INTO	@l3_components	(	d_cd, l3_nm	) VALUES
								(	@d_cd,	'Dwarka'	),
								(	@d_cd,	'Kapashera'	),
								(	@d_cd,	'Najafgarh'	);

SET @cnt2 = @cnt2 + @@ROWCOUNT;


--	==================================================

SET @d_cd = 'WD';

INSERT	INTO	@l3_components	(	d_cd, l3_nm	) VALUES
								(	@d_cd,	'Patel Nagar'		),
								(	@d_cd,	'Punjabi Bagh'		),
								(	@d_cd,	'Rajouri Garden'	);

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
FROM	level_3_address_components
WHERE	audit_log_id	=	@al
ORDER	BY	8, 4, 3;
