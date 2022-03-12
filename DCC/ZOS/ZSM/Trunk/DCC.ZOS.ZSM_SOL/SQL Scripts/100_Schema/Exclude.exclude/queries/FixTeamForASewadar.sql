-- ====================================================================================================
--		Script that changes the team ID for a sewadar whose Team is incorrectly added, and
--		the Department (and Sub-department, if applicable) is OK (which does NOT require department transfer).
--		WARNING...1. be VERY careful in specifying the new_team_id as the script does not check the department.
--				  2. If there are two or more entries for the Sewadar in the team, this script WILL not take care.
--				  3. Satsang Centre ID is NOT considered, and it is assumed that a Team has Sewadars from one Centre only.
-- ====================================================================================================

Declare				---- Input Parameters
	@sewadar_grno		sewadar_grno,				--- GR No. whose team is to be changed
	@old_sewa_team_id	sewa_team_id,				--- Old Team ID (GR No. must exist in this)
	@new_sewa_team_id	sewa_team_id				--- New Team ID (should be for same Sewa as the Old Team ID)

SET	@sewadar_grno		=	'??????',				--- GR No. whose team is to be changed
SET	@old_sewa_team_id	=	????,				--- Old Team ID (GR No. must exist in this)
SET	@new_sewa_team_id	=	????				--- New Team ID (should be for same Sewa as the Old Team ID)

DECLARE
	@new_serial_id		sewa_team_serial_id,
	@satsang_centre_id	satsang_centre_id,
	@sewa_id			sewa_id;

SELECT  *
FROM	sewa_team_wise_sewadars stw
	JOIN sewa_teams st
		ON	(	st.sewa_team_id 	=	stw.sewa_team_id
			AND st.serial_id		=	stw.serial_id
			AND stw.sewadar_grno	=	'G08535'
--			AND	st.sewa_team_id		=	@old_sewa_team_id
			)
WHERE	NOT EXISTS	(	SELECT	1
						FROM	team_wise_daily_attendance tda
						WHERE	tda.sewa_team_id	=	stw.sewa_team_id
						AND		tda.serial_id		=	stw.serial_id
					)

IF (@@ROWCOUNT = 1)
BEGIN
	SELECT * FROM adt_sewa_team_wise_sewadars
	SELECT @new_serial_id = MAX(Serial_id) + 1
	FROM sewa_team_wise_sewadars
	WHERE sewa_team_id = @new_sewa_team_id

--DELETE RECORD FROM adt_sewa_team_wise_sewadars
SELECT @satsang_centre_id = satsang_centre_id
FROM sewa_team_wise_sewadars
WHERE sewa_team_id = @old_sewa_team_id
 AND sewadar_grno = @sewadar_grno
DELETE sewa_team_wise_sewadars
WHERE sewa_team_id = @old_sewa_team_id
 AND sewadar_grno = @sewadar_grno
 
INSERT INTO sewa_team_wise_sewadars
(sewa_team_id, serial_id, satsang_centre_id, sewadar_grno)
VALUES (@new_sewa_team_id, @new_serial_id, @satsang_centre_id, @sewadar_grno)
--INSERT INTO adt_sewa_team_wise_sewadars
END
ELSE
BEGIN
PRINT 'Attendance records found'
END
END

BEGIN TRAN
EXEC SewaTeamFix 'G08535', , 10447,

EXEC SewaTeamFix 'G08526', , 10447, 
