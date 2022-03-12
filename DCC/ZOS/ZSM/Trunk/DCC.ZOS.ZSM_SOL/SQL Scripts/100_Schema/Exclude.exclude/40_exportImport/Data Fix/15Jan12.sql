-- This script needs to run in ZONE ZSM db on 15 Jan 2012
-- ZSM_OLD is the Zone db before Exporting Data to NGP on 3 Jan 2012 


BEGIN TRAN

DECLARE @tmp_sewa_teams TABLE(sewa_team_id INT, new_sewa_team_id INT, sewa_id INT, sewa_team_nm VARCHAR (100));
DECLARE	@ngp_centre_id	INT,
		@mum_centre_id	INT;
		
SET @ngp_centre_id = 6056;
SET @mum_centre_id = 6015;

INSERT INTO @tmp_sewa_teams ( sewa_team_id, sewa_id, sewa_team_nm)
	SELECT 	a.sewa_team_id, b.sewa_id, b.sewa_team_nm
	FROM sewa_teams a
	JOIN ZSM_OLD..sewa_teams b ON 
		(	b.sewa_team_id	=	a.sewa_team_id	AND
			b.sewa_id		<>	a.sewa_id
		)
	JOIN sewas s_m ON (	s_m.sewa_id				= b.sewa_id AND 
						s_m.satsang_centre_id	= @mum_centre_id	)
	JOIN sewas s_n ON (	s_n.sewa_id				= a.sewa_id AND
						s_n.satsang_centre_id	= @ngp_centre_id	)
						
INSERT INTO sewa_teams
	(	sewa_team_nm, team_description, sewa_id, acceptance_ts	)
	SELECT 
		s.sewa_team_nm, team_description, s.sewa_id, acceptance_ts
	FROM ZSM_OLD..sewa_teams s
	JOIN @tmp_sewa_teams t ON t.sewa_team_id = s.sewa_team_id
	
UPDATE	x
	SET	new_sewa_team_id	=	y.sewa_team_id
FROM	@tmp_sewa_teams x
	JOIN	sewa_teams y ON	(x.sewa_id = y.sewa_id AND x.sewa_team_nm = y.sewa_team_nm)
	
INSERT INTO sewa_team_wise_sewadars
	(	sewa_team_id, serial_id, satsang_centre_id, sewadar_grno, transfer_in_dt, transfer_out_dt)
	SELECT
		t.new_sewa_team_id, serial_id, satsang_centre_id, sewadar_grno, transfer_in_dt, transfer_out_dt
	FROM ZSM_OLD..sewa_team_wise_sewadars s
	JOIN @tmp_sewa_teams t ON t.sewa_team_id = s.sewa_team_id
	
INSERT INTO team_wise_daily_attendance
	(	sewa_team_id, serial_id, attendance_dt, attendance, sewa_exemption_id, is_scanned)
	SELECT
		t.new_sewa_team_id, serial_id, attendance_dt, attendance, sewa_exemption_id, is_scanned
	FROM ZSM_OLD..team_wise_daily_attendance a
	JOIN @tmp_sewa_teams t ON t.sewa_team_id = a.sewa_team_id

ROLLBACK
--COMMIT
