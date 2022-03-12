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
WHERE	level_1_address_component_nm = 'West Bengal';

INSERT INTO	audit_logs
		(	[session_id], [application_id], [user_no], [user_role_id], [operation], [screen_id], [object_id], [operation_dts], [is_consumed]	)
	VALUES
		(	0, 'Script', 1, 'System', 'I', 'rev074', 'West Bengal-Address Components', GETDATE(), 0	);
	SET @al	=	SCOPE_IDENTITY ();

--	==================================================
--	Corrections	- Level 2
--	==================================================

INSERT	INTO	@l2_renames		VALUES	(	668,	'SOUTH DINAJPUR',		'DAKSHIN DINAJPUR'					),
										(	665,	'NORTH DINAJPUR',		'UTTAR DINAJPUR'					),
										(	51469,	'Purab Bardhaman',		'Purba Bardhaman'					),
										(	51473,	'Purab Medinipur',		'Purba Medinipur'					),
										(	51472,	'Paschim Medinipur',	'Paschim Medinipur (not in use)'	);
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

INSERT	INTO	@l2_renames		VALUES	(	670,	'West Midnapore',	'Paschim Medinipur'	);
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
	RAISERROR ('Row counts of Level 2 RENAMES mis-match (2); should be %d, but update only %d', 16, 1, @cnt1, @cnt2);
	RETURN;
END

--	==================================================
--	Ineffective Districts
--	==================================================

INSERT	INTO	@ineffective_districts		VALUES	(	669,	'West Dinajpur'						),
													(	51472,	'Paschim Medinipur (not in use)'	);
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

--	=================================================


SELECT	*
FROM	level_2_address_components
WHERE	audit_log_id	=	@al
ORDER	BY	8, 3;

SELECT	*
FROM	level_3_address_components
WHERE	audit_log_id	=	@al
ORDER	BY	8, 4, 3;
