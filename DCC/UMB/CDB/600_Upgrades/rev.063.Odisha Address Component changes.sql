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
WHERE	level_1_address_component_nm = 'Odisha';

INSERT INTO	audit_logs
		(	[session_id], [application_id], [user_no], [user_role_id], [operation], [screen_id], [object_id], [operation_dts], [is_consumed]	)
	VALUES
		(	0, 'Script', 1, 'System', 'I', 'rev063', 'Odisha-Address Components', GETDATE(), 0	);
	SET @al	=	SCOPE_IDENTITY ();


--	==================================================
--	New Level 3 components of Rayagada, Odisha
--	==================================================


SET @d_cd = '879';

INSERT	INTO	@l3_components	(	d_cd, l3_nm	)	VALUES
										(	@d_cd,	'Bissam Cuttack'	),
										(	@d_cd,	'Chandili'      	),
										(	@d_cd,	'Chatikona'     	),
										(	@d_cd,	'Chandrapur'    	),
										(	@d_cd,	'Durgi'         	),
										(	@d_cd,	'Gudari'        	),
										(	@d_cd,	'Gunupur'       	),
										(	@d_cd,	'Jaykaypur'     	),
										(	@d_cd,	'Kalyansingpur' 	),
										(	@d_cd,	'Kasipur'       	),
										(	@d_cd,	'Kolnara'       	),
										(	@d_cd,	'Kujendri'      	),
										(	@d_cd,	'Kumudabali'    	),
										(	@d_cd,	'Muniguda'      	),
										(	@d_cd,	'Padmapur'      	),
										(	@d_cd,	'Ramanaguda'    	),
										(	@d_cd,	'Therubali'     	);

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
