-- =============================================================================
CREATE TABLE	tmp_all_sewadars
(
	sewadar_id					sewadar_id			NOT NULL	PRIMARY KEY	NONCLUSTERED,
	sewadar_nm 					VARCHAR (200)		NOT NULL,
	sewadar_grno				sewadar_grno		NOT NULL	UNIQUE	NONCLUSTERED,
	is_outstation_sewadar		Boolean				NOT NULL,
	department_id				department_id		NOT NULL,
	sub_department_id			department_id			NULL,
	gender 						CHAR (1)			NOT NULL
)

CREATE TABLE	tmp_teams
(
	is_outstation_sewadar		Boolean				NOT NULL,
	department_id				department_id		NOT NULL,
	sub_department_id			department_id			NULL,
	gender 						CHAR (1)			NOT NULL
)

CREATE TABLE	tmp_team_sewadars
(
	serial_id					INT					NOT NULL	IDENTITY (1, 1)		PRIMARY KEY NONCLUSTERED,
	sewadar_grno				sewadar_grno		NOT NULL,
)


DECLARE
	@centre_id				satsang_centre_id,
	@sewa_id				sewa_id,
	@sewa_team_id			sewa_team_id,
	@is_outstation_sewadar	Boolean,
	@department_id			INT,
	@department_nm			VARCHAR (50),
	@sub_department_id		INT,
	@sub_department_nm		VARCHAR (50),
	@gender					CHAR (1);

SET	@centre_id	=	6015;		--- Mumbai

/*
INSERT INTO sewas
		(	satsang_centre_id, sewa_cd, sewa_nm, start_dt, finish_dt, is_satsang_programme, is_scanner_used, is_leave_allowed,
			is_exemption_allowed, is_default_sewa, sewa_frequency, attendance_unit, attendance_marking
		)
	VALUES
		(	@centre_id, '2011 ANN', 'Nagpur Satsang Program 2011', '14-Nov-2011', '22-Nov-2011', 'Yes', 'No', 'Yes',
			'Yes', 'Yes', 'Daily', 'Day', 'Team-wise'
		)

SET	@sewa_id	=	SCOPE_IDENTITY();			--- Nagpur Satsang Program 2011
*/

SET	@sewa_id	=	85;				--- Mumbai January Satsang Program 2013

INSERT INTO	tmp_all_sewadars
	SELECT	s.sewadar_id, RTRIM (LTRIM (first_nm)) + COALESCE (' ' + SUBSTRING (middle_nm, 1, 1) + '.', '') + RTRIM (LTRIM (last_nm)),
			r.sewadar_grno, is_outstation_sewadar, department_id, sub_department_id, CASE gender WHEN 'Male' THEN 'G' WHEN 'Female' THEN 'L' END
	FROM	sewadars	s
		JOIN	sewadars_registrations	r
			ON	(	s.sewadar_id	=	r.sewadar_id	
				AND	s.global_sewadar_status_cd	IS	NULL
				AND	r.sewadar_status_cd			IN	(	'Perm', 'Temp'	)
				AND	r.satsang_centre_id			=	@centre_id
				)
			/* ..... used only for March, 2012 Mumbai
	WHERE	NOT EXISTS	(	SELECT	1
							FROM	generic_sewadar_lists_sewadars	x
							WHERE	x.satsang_centre_id	=	r.satsang_centre_id
							AND		X.sewadar_grno		=	r.sewadar_grno
							AND		sewadar_list_id		IN	(	98, 99	)
						)
						*/

INSERT INTO	tmp_teams
	SELECT	DISTINCT	is_outstation_sewadar, department_id, sub_department_id, gender
	FROM	tmp_all_sewadars;

DECLARE	crsr	CURSOR	FOR
	SELECT	is_outstation_sewadar, a.department_id, department_nm, a.sub_department_id, sub_department_nm, gender
	FROM	tmp_teams	a
		JOIN	departments	d
			ON	(	a.department_id	=	d.department_id	)
		LEFT JOIN	sub_departments	s
			ON	(	a.sub_department_id	=	s.sub_department_id	)

OPEN crsr;

FETCH	crsr
	INTO	@is_outstation_sewadar, @department_id, @department_nm, @sub_department_id, @sub_department_nm, @gender;

WHILE (@@FETCH_STATUS = 0)
BEGIN
	print		@department_nm + COALESCE (' (' + @sub_department_nm + ')', '') + '-' + @gender + '-' + @is_outstation_sewadar
	INSERT INTO	sewa_teams 	(	sewa_team_nm, sewa_id	)		--	, acceptance_ts	)
		VALUES	(	@department_nm + COALESCE (' (' + @sub_department_nm + ')', '') + '-' + @gender + '-'
						+ CASE @is_outstation_sewadar	WHEN	'Yes'	THEN	'Outstation'
														WHEN	'No'	THEN	'Local'
							END,
					@sewa_id									--	, GetDate()
				)
	SET @sewa_team_id	=	SCOPE_IDENTITY();

	INSERT	INTO	tmp_team_sewadars	(sewadar_grno)
		SELECT	sewadar_grno
		FROM	tmp_all_sewadars
		WHERE	department_id			=	@department_id
		AND		is_outstation_sewadar	=	@is_outstation_sewadar
		AND		gender					=	@gender
		AND		(	(	@sub_department_id	IS NULL		AND	sub_department_id	IS NULL					)
				OR	(	@sub_department_id	IS NOT NULL	AND	sub_department_id	=	@sub_department_id	)
				)
		ORDER BY sewadar_nm;

		INSERT INTO	sewa_team_wise_sewadars ( sewa_team_id, serial_id, satsang_centre_id, sewadar_grno )
			SELECT	@sewa_team_id, serial_id, @centre_id, a.sewadar_grno
			FROM	tmp_team_sewadars	a
				JOIN	tmp_all_sewadars	b
					ON	(	a.sewadar_grno	=	b.sewadar_grno)
			ORDER BY a.serial_id;

		TRUNCATE	TABLE tmp_team_sewadars;

	FETCH	crsr
		INTO	@is_outstation_sewadar, @department_id, @department_nm, @sub_department_id, @sub_department_nm, @gender;
END

CLOSE crsr;

DEALLOCATE crsr;

DROP TABLE	tmp_team_sewadars;
DROP TABLE	tmp_teams;
DROP TABLE	tmp_all_sewadars;


-- vim:ts=4 ht=8 sw=4
