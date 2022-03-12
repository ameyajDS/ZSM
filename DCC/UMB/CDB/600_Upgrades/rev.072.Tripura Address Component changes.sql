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
WHERE	level_1_address_component_nm = 'Tripura';

INSERT INTO	audit_logs
		(	[session_id], [application_id], [user_no], [user_role_id], [operation], [screen_id], [object_id], [operation_dts], [is_consumed]	)
	VALUES
		(	0, 'Script', 1, 'System', 'I', 'rev072', 'Tripura-Address Components', GETDATE(), 0	);
	SET @al	=	SCOPE_IDENTITY ();

--	==================================================
--	New Districts and their Level 3 components
--	==================================================

SET @d_cd = 'D';		--	Dhalai

INSERT	INTO	@districts		VALUES	(	@d_cd,	'Dhalai'	);
SET @cnt1 = @@ROWCOUNT;

INSERT	INTO	@l3_components	(	d_cd, l3_nm	)	VALUES
										(	@d_cd,	'Ambassa'          		),
										(	@d_cd,	'Gandacherra'      		),
										(	@d_cd,	'Longtharai Valley'		),
										(	@d_cd,	'Kamalpur'         		),
										(	@d_cd,	'Ganganagar'       		),
										(	@d_cd,	'Salema'           		),
										(	@d_cd,	'Durgachowmuhani'  		),
										(	@d_cd,	'Dumburnagar'      		),
										(	@d_cd,	'Raishyabari'      		),
										(	@d_cd,	'Manu'             		),
										(	@d_cd,	'Chawmanu'         		);
SET @cnt2 = @@ROWCOUNT;

--	==================================================

SET @d_cd = 'S';		--	Sipahiljala

INSERT	INTO	@districts		VALUES	(	@d_cd,	'Sipahiljala'	);
SET @cnt1 = @cnt1 + @@ROWCOUNT;

INSERT	INTO	@l3_components	(	d_cd, l3_nm	)	VALUES
										(	@d_cd,	'Bishalgarh'	),
										(	@d_cd,	'Bishramganj' 	),
										(	@d_cd,	'Boxanagar' 	),
										(	@d_cd,	'Charilam'  	),
										(	@d_cd,	'Jampuijala'	),
										(	@d_cd,	'Kathalia'  	),
										(	@d_cd,	'Mohanbhog' 	),
										(	@d_cd,	'Nalchar'   	),
										(	@d_cd,	'Melaghar'  	);
SET @cnt2 = @cnt2 + @@ROWCOUNT;

--	==================================================

SET @d_cd = 'K';		--	Khowai

INSERT	INTO	@districts		VALUES	(	@d_cd,	'Khowai'	);
SET @cnt1 = @cnt1 + @@ROWCOUNT;

INSERT	INTO	@l3_components	(	d_cd, l3_nm	)	VALUES
										(	@d_cd,	'Asharambari'     		),
										(	@d_cd,	'Behalabari'      		),
										(	@d_cd,	'Singhichera'     		),
										(	@d_cd,	'Champahour'      		),
										(	@d_cd,	'Khowai'          		),
										(	@d_cd,	'Padmabil'        		),
										(	@d_cd,	'Laxmi Narayanpur'		),
										(	@d_cd,	'Ramchandraghat'  		),
										(	@d_cd,	'Pramode Nagar'   		),
										(	@d_cd,	'Tulasikhar'	   		),
										(	@d_cd,	'Mungiakami'	   		),
										(	@d_cd,	'Dhalabil'       		),
										(	@d_cd,	'Chebri'         		),
										(	@d_cd,	'Teliamura'      		),
										(	@d_cd,	'Howaibari'      		),
										(	@d_cd,	'Moharchera'     		),
										(	@d_cd,	'Krishnapur'     		),
										(	@d_cd,	'Kalyanpur'      		),
										(	@d_cd,	'Dwarkapur'      		),
										(	@d_cd,	'Maharanipur'    		);
SET @cnt2 = @cnt2 + @@ROWCOUNT;

--	==================================================

SET @d_cd = 'G';		--	Gomati

INSERT	INTO	@districts		VALUES	(	@d_cd,	'Gomati'	);
SET @cnt1 = @cnt1 + @@ROWCOUNT;

INSERT	INTO	@l3_components	(	d_cd, l3_nm	)	VALUES
										(	@d_cd,	'Birganj'          		),
										(	@d_cd,	'Malbasa'          		),
										(	@d_cd,	'Amarpur'          		),
										(	@d_cd,	'Natunbajar'       		),
										(	@d_cd,	'OMPI'             		),
										(	@d_cd,	'Sonachara'        		),
										(	@d_cd,	'Ompi Nagar'       		),
										(	@d_cd,	'Twaidubari'       		),
										(	@d_cd,	'Bampur'           		),
										(	@d_cd,	'UDAIPUR'          		),
										(	@d_cd,	'Radhakishore Pur' 		),
										(	@d_cd,	'Matarbari'        		),
										(	@d_cd,	'Garjee'           		),
										(	@d_cd,	'Dhajanagar'       		),
										(	@d_cd,	'Dakhin Chandrapur'		),
										(	@d_cd,	'Killa'            		),
										(	@d_cd,	'Pitra'            		),
										(	@d_cd,	'Maharani'         		),
										(	@d_cd,	'Bagma'            		),
										(	@d_cd,	'Raiyabari'        		),
										(	@d_cd,	'Khupilong'        		),
										(	@d_cd,	'Jamjuri'          		),
										(	@d_cd,	'Kakraban'         		),
										(	@d_cd,	'Salgarah'         		),
										(	@d_cd,	'Mirja'            		),
										(	@d_cd,	'Dudhpuskuruni'    		),
										(	@d_cd,	'Shilachori'       		),
										(	@d_cd,	'Ghorakappa'       		),
										(	@d_cd,	'Chelagang'        		),
										(	@d_cd,	'Karbook'          		),
										(	@d_cd,	'Jatanbari'        		);
SET @cnt2 = @cnt2 + @@ROWCOUNT;

--	==================================================

SET @d_cd = 'U';		--	Unakoti

INSERT	INTO	@districts		VALUES	(	@d_cd,	'Unakoti'	);
SET @cnt1 = @cnt1 + @@ROWCOUNT;

INSERT	INTO	@l3_components	(	d_cd, l3_nm	)	VALUES
										(	@d_cd,	'Kailashahar'    		),
										(	@d_cd,	'Tillagaon'      		),
										(	@d_cd,	'Gournagar'      		),
										(	@d_cd,	'Shrirampur'     		),
										(	@d_cd,	'Birchandranagar'		),
										(	@d_cd,	'Laxmipur'       		),
										(	@d_cd,	'Fatikroy'       		),
										(	@d_cd,	'Kanchanbari'    		),
										(	@d_cd,	'Kumarghat'      		),
										(	@d_cd,	'Pecharthal'     		),
										(	@d_cd,	'Machmara'       		),
										(	@d_cd,	'Bagai Cherra'   		),
										(	@d_cd,	'Chandipur'      		);
SET @cnt2 = @cnt2 + @@ROWCOUNT;

--	==================================================
--		Invalidate the existing Level 3 Components (which have only 1 occurrence)
--		We are assuming here that the input components are also unique amongst all districts
--	==================================================

WITH in_use AS
(
 	SELECT	a.level_3_address_component_nm, a.level_3_address_component_id
	FROM	level_3_address_components	a
		JOIN	(	SELECT	level_3_address_component_nm
					FROM	level_3_address_components
					WHERE	level_2_address_component_id BETWEEN 557 AND 559		-- North, South and West Tripura
					GROUP BY	level_3_address_component_nm
						HAVING	COUNT(*)	=	1
				)	x
			ON	(	a.level_3_address_component_nm	=	x.level_3_address_component_nm	)
	WHERE	level_2_address_component_id BETWEEN 557 AND 559		-- North, South and West Tripura
	AND		GetDate()	BETWEEN	effective_from	AND	effective_till
)
UPDATE	l3
SET		effective_till	=	@fdt,
		audit_log_id	=	@al
FROM	in_use	i
	JOIN	@l3_components	l
		ON	(	i.level_3_address_component_nm	=	l.l3_nm	)
	JOIN	level_3_address_components	l3
		ON	(	i.level_3_address_component_id	=	l3.level_3_address_component_id	);

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
