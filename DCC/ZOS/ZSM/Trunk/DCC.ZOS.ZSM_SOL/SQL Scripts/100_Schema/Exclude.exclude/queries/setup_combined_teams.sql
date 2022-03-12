/* ==================================================================================
    Source File		:	setup_combined_teams.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Mon Jan 30 17:23 IST 2012
    Version			:	1.00
    Last updated	:	Jan 30, 2012
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		This script does the following:
			1. Creates a Sewa for a Satsang Centre (put the ID for Satsang Centre correctly)
			2. Creates "accepted" Sewa Teams for the sewa using Sewadars from a Sewadar List
				(put the ID for Sewadar List correctly)
		Note that the Sewa Teams are created for each Deparment/Sub-department.
		Note further that there are NO separate teams for Local and Outstation Sewadars.
    ==================================================================================
								      								  Revision History
    ----------------------------------------------------------------------------------

   ==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

USE ZSM
GO


-- =============================================================================

CREATE TABLE	tmp_all_sewadars
(
	sewadar_id					sewadar_id			NOT NULL	PRIMARY KEY	NONCLUSTERED,
	sewadar_nm 					VARCHAR (200)		NOT NULL,
	sewadar_grno				sewadar_grno		NOT NULL	UNIQUE	NONCLUSTERED,
	department_id				department_id		NOT NULL,
	sub_department_id			department_id			NULL,
	gender 						CHAR (1)			NOT NULL
)

CREATE TABLE	tmp_teams
(
	department_id				department_id		NOT NULL,
	sub_department_id			department_id			NULL,
	gender 						CHAR (1)			NOT NULL
)

CREATE TABLE	tmp_team_sewadars
(
	serial_id					INT					NOT NULL	IDENTITY (1, 1)		PRIMARY KEY NONCLUSTERED,
	sewadar_grno				sewadar_grno		NOT NULL,
)


BEGIN TRAN

DECLARE
	@centre_id				satsang_centre_id,
	@sewa_id				sewa_id,
	@sewa_team_id			sewa_team_id,
	@sewadar_list_id	sewa_team_id,
	@department_id			INT,
	@department_nm			VARCHAR (50),
	@sub_department_id		INT,
	@sub_department_nm		VARCHAR (50),
	@gender					CHAR (1);

SET	@centre_id	=	6056;		--- Nagpur
SET @sewadar_list_id	=	100000039;

INSERT INTO sewas
		(	satsang_centre_id, sewa_cd, sewa_nm, start_dt, finish_dt, is_satsang_programme, is_scanner_used, is_leave_allowed,
			is_exemption_allowed, is_default_sewa, sewa_frequency, attendance_unit, attendance_marking
		)
	VALUES
		(	@centre_id, '2012Raipur', 'Raipur Satsang Program 2012', '01-Feb-2012', '06-Feb-2012', 'Yes', 'No', 'Yes',
			'Yes', 'No', 'Daily', 'Day', 'Team-wise'
		)

SET	@sewa_id	=	SCOPE_IDENTITY();			--- Raipur Satsang Program 2012

INSERT INTO sewas_periods
		(	sewa_id, start_dt, finish_dt	)
	VALUES
		(	@sewa_id, '01-Feb-2012', '06-Feb-2012'	);

INSERT INTO sewas_satsang_centres
		(	sewa_id, satsang_centre_id	)
	VALUES
		(	@sewa_id, @centre_id	);

INSERT INTO	tmp_all_sewadars
	SELECT	s.sewadar_id, RTRIM (LTRIM (first_nm)) + COALESCE (' ' + SUBSTRING (middle_nm, 1, 1) + '.', '') + RTRIM (LTRIM (last_nm)),
			r.sewadar_grno, department_id, sub_department_id, CASE gender WHEN 'Male' THEN 'G' WHEN 'Female' THEN 'L' END
	FROM	sewadars	s
		JOIN	sewadars_registrations	r
			ON	(	s.sewadar_id	=	r.sewadar_id	
				AND	s.global_sewadar_status_cd	IS	NULL
				AND	r.sewadar_status_cd			IN	(	'Perm', 'Temp'	)
				AND	r.satsang_centre_id			=	@centre_id
				)
		JOIN	generic_sewadar_lists_sewadars	x
			ON	(	r.satsang_centre_id	=	x.satsang_centre_id
				AND	r.sewadar_grno		=	x.sewadar_grno
				AND	x.sewadar_list_id	=	@sewadar_list_id
				)

INSERT INTO	tmp_teams
	SELECT	DISTINCT	department_id, sub_department_id, gender
	FROM	tmp_all_sewadars;

DECLARE	crsr	CURSOR	FOR
	SELECT	a.department_id, department_nm, a.sub_department_id, sub_department_nm, gender
	FROM	tmp_teams	a
		JOIN	departments	d
			ON	(	a.department_id	=	d.department_id	)
		LEFT JOIN	sub_departments	s
			ON	(	a.sub_department_id	=	s.sub_department_id	)

OPEN crsr;

FETCH	crsr
	INTO	@department_id, @department_nm, @sub_department_id, @sub_department_nm, @gender;

WHILE (@@FETCH_STATUS = 0)
BEGIN
	print		@department_nm + COALESCE (' (' + @sub_department_nm + ')', '') + '-' + @gender
	INSERT INTO	sewa_teams 	(	sewa_team_nm, sewa_id, acceptance_ts	)
		VALUES	(	@department_nm + COALESCE (' (' + @sub_department_nm + ')', '') + '-' + @gender,
					@sewa_id, GetDate()
				)
	SET @sewa_team_id	=	SCOPE_IDENTITY();

	INSERT	INTO	tmp_team_sewadars	(sewadar_grno)
		SELECT	sewadar_grno
		FROM	tmp_all_sewadars
		WHERE	department_id			=	@department_id
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
		INTO	@department_id, @department_nm, @sub_department_id, @sub_department_nm, @gender;
END

CLOSE crsr;

DEALLOCATE crsr;

ROLLBACK;
-- COMMIT TRAN

DROP TABLE	tmp_team_sewadars;
DROP TABLE	tmp_teams;
DROP TABLE	tmp_all_sewadars;


-- vim:ts=4 ht=8 sw=4
