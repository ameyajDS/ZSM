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
WHERE	level_1_address_component_nm = 'Maharashtra';

INSERT INTO	audit_logs
		(	[session_id], [application_id], [user_no], [user_role_id], [operation], [screen_id], [object_id], [operation_dts], [is_consumed]	)
	VALUES
		(	0, 'Script', 1, 'System', 'I', 'rev056', 'Maharashtra-Address Components', GETDATE(), 0	);
	SET @al	=	SCOPE_IDENTITY ();


--	==================================================
--	Ineffective Districts
--	==================================================

INSERT	INTO	@ineffective_districts		VALUES	(	349,	'AJANTA'			),
													(	360,	'GREATER BOMBAY'	),
													(	371,	'NASIK'			);
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
--	New Districts and their Level 3 components
--	==================================================

SET @d_cd = 'MS';

INSERT	INTO	@districts		VALUES	(	@d_cd,	'Mumbai Suburban'	);
SET @cnt1 = @@ROWCOUNT;

INSERT	INTO	@l3_components	(	d_cd, l3_nm	)	VALUES
										(	@d_cd,	'Aare'           	),
										(	@d_cd,	'Akshe'          	),
										(	@d_cd,	'Akurli'         	),
										(	@d_cd,	'Ambivali'       	),
										(	@d_cd,	'Andheri'        	),
										(	@d_cd,	'Anik'           	),
										(	@d_cd,	'Asalphe'        	),
										(	@d_cd,	'Bandivali'      	),
										(	@d_cd,	'Bandra'         	),
										(	@d_cd,	'Bapnale'        	),
										(	@d_cd,	'Bhandup'        	),
										(	@d_cd,	'Borivali'       	),
										(	@d_cd,	'Borla'          	),
										(	@d_cd,	'Bramhanvada'    	),
										(	@d_cd,	'Chakala'        	),
										(	@d_cd,	'Chandivali'     	),
										(	@d_cd,	'Charkop'        	),
										(	@d_cd,	'Chembur'        	),
										(	@d_cd,	'Chinchvali'     	),
										(	@d_cd,	'Dahisar'        	),
										(	@d_cd,	'Danda'          	),
										(	@d_cd,	'Darvali'        	),
										(	@d_cd,	'Devnar'         	),
										(	@d_cd,	'Dindoshi'       	),
										(	@d_cd,	'Eksar'          	),
										(	@d_cd,	'Eksar Pahadi'   	),
										(	@d_cd,	'Erangal'        	),
										(	@d_cd,	'Ghatkopar'      	),
										(	@d_cd,	'Gorai'          	),
										(	@d_cd,	'Goregaon'       	),
										(	@d_cd,	'Gundavali'      	),
										(	@d_cd,	'Gundgaon'       	),
										(	@d_cd,	'Hariyali'       	),
										(	@d_cd,	'Ismaliya'       	),
										(	@d_cd,	'Juhu'           	),
										(	@d_cd,	'Kalerabad'      	),
										(	@d_cd,	'Kandivali'      	),
										(	@d_cd,	'Kanheri'        	),
										(	@d_cd,	'Kanjur'         	),
										(	@d_cd,	'Kirol'          	),
										(	@d_cd,	'Kolekalyan'     	),
										(	@d_cd,	'Kondivita'      	),
										(	@d_cd,	'Kopari'         	),
										(	@d_cd,	'Kurar'          	),
										(	@d_cd,	'Kurla'          	),
										(	@d_cd,	'Madh'           	),
										(	@d_cd,	'Magathane'      	),
										(	@d_cd,	'Mahul'          	),
										(	@d_cd,	'Majas'          	),
										(	@d_cd,	'Malad'          	),
										(	@d_cd,	'Malvani'        	),
										(	@d_cd,	'Manbudruk'      	),
										(	@d_cd,	'Mandale'        	),
										(	@d_cd,	'Mandpeshwar'    	),
										(	@d_cd,	'Mankhurd'       	),
										(	@d_cd,	'Manori'         	),
										(	@d_cd,	'Maravali'       	),
										(	@d_cd,	'Marol'          	),
										(	@d_cd,	'Maroshi'        	),
										(	@d_cd,	'Marve'          	),
										(	@d_cd,	'Mogara'         	),
										(	@d_cd,	'Mohili'         	),
										(	@d_cd,	'Mulgaon'        	),
										(	@d_cd,	'Mulund'         	),
										(	@d_cd,	'Nahur'          	),
										(	@d_cd,	'Oshivara'       	),
										(	@d_cd,	'Pahadi Goregaon'	),
										(	@d_cd,	'Parighkhar'     	),
										(	@d_cd,	'Parjapur'       	),
										(	@d_cd,	'Paspoli'        	),
										(	@d_cd,	'Pavai'          	),
										(	@d_cd,	'Poisar'         	),
										(	@d_cd,	'Sahar'          	),
										(	@d_cd,	'Sai'            	),
										(	@d_cd,	'Saki'           	),
										(	@d_cd,	'Shimpavali'     	),
										(	@d_cd,	'Tirandaj'       	),
										(	@d_cd,	'Tulsi'          	),
										(	@d_cd,	'Tungva'         	),
										(	@d_cd,	'Turbhe'         	),
										(	@d_cd,	'Vadhavali'      	),
										(	@d_cd,	'Vadhvan'        	),
										(	@d_cd,	'Valnai'         	),
										(	@d_cd,	'Varsova'        	),
										(	@d_cd,	'Vikroli'        	),
										(	@d_cd,	'Vileparle'      	),
										(	@d_cd,	'Vyaravali'      	);
SET @cnt2 = @@ROWCOUNT;

--	==================================================


SET @d_cd = 'PG';

INSERT	INTO	@districts		VALUES	(	@d_cd,	'Palghar'	);
SET @cnt1 = @cnt1 + @@ROWCOUNT;

INSERT	INTO	@l3_components	(	d_cd, l3_nm	)	VALUES
										(	@d_cd,	'Palghar'  	),
										(	@d_cd,	'Vasai'    	),
										(	@d_cd,	'Dahanu'   	),
										(	@d_cd,	'Talasari' 	),
										(	@d_cd,	'Wada'     	),
										(	@d_cd,	'Vikramgad'	),
										(	@d_cd,	'Jawhar'   	),
										(	@d_cd,	'Mokhada'  	);
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
