-- Data Integrity Checks
-- If any records are returned; it's a data-issue and data is not consistent

DECLARE @current_db VARCHAR(10)
SELECT @current_db = DB_NAME();

-- Flag all sewas with is_default_sewa='Yes' if there are more than 1 default sewas

PRINT 'Sewadars with Current Satsang Centre OR Current GR No not set'

SELECT * from sewadars where current_satsang_centre_id IS NULL OR current_sewadar_grno IS NULL


PRINT 'Sewadars with no Sewadars Information'
SELECT * from sewadars s
LEFT OUTER JOIN sewadars_registrations sr ON s.current_satsang_centre_id = sr.satsang_centre_id AND s.current_sewadar_grno = sr.sewadar_grno
WHERE sr.satsang_centre_id IS NULL

-- Flag all sewas with is_default_sewa='Yes' if there are more than 1 default sewas
PRINT 'Sewas with more than 1 default sewa'
SELECT	*
FROM	sewas	s
WHERE	EXISTS	(	SELECT	1
					FROM	(	SELECT	satsang_centre_id, count(*) as CNT
								FROM	sewas 
								WHERE	is_default_sewa = 'Yes'
								GROUP BY	satsang_centre_id
								HAVING COUNT (*) > 1
							)	x
					WHERE	x.satsang_centre_id		=	s.satsang_centre_id
				)
AND		is_default_sewa	=	'Yes';
/*
PRINT 'Satsang Centres Seeds used range exceeds 80% of available range'
SELECT * , diff = seed_value - min_value, max_diff =max_value- min_value  FROM ZSM..satsang_centres_seeds
WHERE  10* (seed_value - min_value) > 8* (max_value- min_value)
*/
--  Arbitrary Daily Presences
PRINT 'Arbitrary Daily Presences that do not have corresponding Transaction Timestamps for Screen ID ATT_02'
SELECT * FROM arbitrary_daily_presences  ad
WHERE	NOT EXISTS	(	SELECT	1
						FROM	sewadars_txn_ts stt
						WHERE	stt.satsang_centre_id = ad.satsang_centre_id
						AND		stt.sewadar_grno = ad.sewadar_grno
						AND		ad.sewa_id = stt.sewa_id
						AND		stt.screen_id = 'ATT_02'
					)
PRINT 'Transaction Timestamps for Screen ID ATT_02 that do not have corresponding Arbitrary Daily Presences'
SELECT * FROM sewadars_txn_ts stt
WHERE	NOT EXISTS	(	SELECT	1
						FROM	arbitrary_daily_presences  ad
						WHERE	stt.satsang_centre_id = ad.satsang_centre_id
						AND		stt.sewadar_grno = ad.sewadar_grno
						AND		ad.sewa_id = stt.sewa_id
					)
AND		stt.screen_id = 'ATT_02'

--  Arbitrary Shift Presences
PRINT 'Arbitrary Shift Presences that do not have corresponding Transaction Timestamps for Screen ID ATT_06'
SELECT * FROM arbitrary_shift_presences  ad
WHERE	NOT EXISTS	(	SELECT	1
						FROM	sewadars_txn_ts stt
						WHERE	stt.satsang_centre_id = ad.satsang_centre_id
						AND		stt.sewadar_grno = ad.sewadar_grno
						AND		ad.sewa_id = stt.sewa_id
						AND		stt.screen_id = 'ATT_06'
					)
/* ----- 
  SQL Statement that fixes the above abnormality 

INSERT INTO  sewadars_txn_ts ( satsang_centre_id, sewadar_grno, sewa_id, screen_id)
	SELECT DISTINCT satsang_centre_id, sewadar_grno, sewa_id, 'ATT_06'
	from arbitrary_shift_presences stt
	WHERE	not EXISTS	(	SELECT	1
							FROM	sewadars_txn_ts  ad
							WHERE	stt.satsang_centre_id = ad.satsang_centre_id
							AND		stt.sewadar_grno = ad.sewadar_grno
							AND		ad.sewa_id = stt.sewa_id
							AND		ad.screen_id = 'ATT_06'
						)
*/


PRINT 'Transaction Timestamps for Screen ID ATT_06 that do not have corresponding Arbitrary Shift Presences'
SELECT * FROM sewadars_txn_ts stt
WHERE	NOT EXISTS	(	SELECT	1
						FROM	arbitrary_shift_presences  ad
						WHERE	stt.satsang_centre_id = ad.satsang_centre_id
						AND		stt.sewadar_grno = ad.sewadar_grno
						AND		ad.sewa_id = stt.sewa_id
					)
AND		stt.screen_id = 'ATT_06'

/* ----- 
  SQL Statement that fixes the above abnormality 

DELETE stt
FROM sewadars_txn_ts stt
WHERE	NOT EXISTS	(	SELECT	1
						FROM	arbitrary_shift_presences  ad
						WHERE	stt.satsang_centre_id = ad.satsang_centre_id
						AND		stt.sewadar_grno = ad.sewadar_grno
						AND		ad.sewa_id = stt.sewa_id
					)
AND		stt.screen_id = 'ATT_06'
*/


--  Arbitrary Summarised Exemptions

PRINT 'Arbitrary Summarised Exemptions that do not have corresponding Transaction Timestamps for Screen ID ATT_03'
SELECT * FROM arbitrary_summarised_exemptions  ad
WHERE	NOT EXISTS	(	SELECT	1
						FROM	sewadars_txn_ts stt
						WHERE	stt.satsang_centre_id = ad.satsang_centre_id
						AND		stt.sewadar_grno = ad.sewadar_grno
						AND		ad.sewa_id = stt.sewa_id
						AND		stt.screen_id = 'ATT_03'
					)
/*
... below Statement fixes above issue

INSERT INTO sewadars_txn_ts 
		(	satsang_centre_id, sewadar_grno, sewa_id, screen_id	)
	SELECT satsang_centre_id, sewadar_grno, sewa_id, 'ATT_03' FROM arbitrary_summarised_exemptions  ad
	WHERE	NOT EXISTS	(	SELECT	1
							FROM	sewadars_txn_ts stt
							WHERE	stt.satsang_centre_id = ad.satsang_centre_id
							AND		stt.sewadar_grno = ad.sewadar_grno
							AND		ad.sewa_id = stt.sewa_id
							AND		stt.screen_id = 'ATT_03'
						)
*/

PRINT 'Transaction Timestamps for Screen ID ATT_03 that do not have corresponding Arbitrary Summarised Exemptions'
SELECT * FROM sewadars_txn_ts stt
WHERE	NOT EXISTS	(	SELECT	1
						FROM	arbitrary_summarised_exemptions  ad
						WHERE	stt.satsang_centre_id = ad.satsang_centre_id
						AND		stt.sewadar_grno = ad.sewadar_grno
						AND		ad.sewa_id = stt.sewa_id
					)
AND		stt.screen_id = 'ATT_03'
/*
... below Statement fixes above issue
delete stt
FROM sewadars_txn_ts stt
WHERE	NOT EXISTS	(	SELECT	1
						FROM	arbitrary_summarised_exemptions  ad
						WHERE	stt.satsang_centre_id = ad.satsang_centre_id
						AND		stt.sewadar_grno = ad.sewadar_grno
						AND		ad.sewa_id = stt.sewa_id
					)
AND		stt.screen_id = 'ATT_03'


*/
--  Sewadar-wise Sewa Summaries
PRINT 'Transaction Timestamps for Screen ID ATT_01 for Sewas with Attendance-marking other than Summary'
SELECT * FROM sewadars_txn_ts stt
	JOIN	sewas	x
		ON	(	x.sewa_id = stt.sewa_id )
WHERE	stt.screen_id = 'ATT_01'
AND		x.attendance_marking <> 'Summary'

/* ----- 
  SQL Statement that fixes the above abnormality 

		DELETE stt
		FROM sewadars_txn_ts stt
			JOIN	sewas	x
				ON	(	x.sewa_id = stt.sewa_id )
		WHERE	stt.screen_id = 'ATT_01'
		AND		x.attendance_marking <> 'Summary'

*/

PRINT 'Sewadar-wise Sewa Summaries for Attendance-marking Sewas that do not have corresponding Transaction Timestamps for Screen ID ATT_01'
SELECT *
FROM sewadar_wise_sewa_summaries  ad
	JOIN	sewas	x
		ON	(	x.sewa_id = ad.sewa_id
			AND	x.attendance_marking = 'Summary'
			)
WHERE	NOT EXISTS	(	SELECT	1
						FROM	sewadars_txn_ts stt
						WHERE	stt.satsang_centre_id = ad.satsang_centre_id
						AND		stt.sewadar_grno = ad.sewadar_grno
						AND		ad.sewa_id = stt.sewa_id
						AND		stt.screen_id = 'ATT_01'
					)

/*
... below Statement fixes above issue

INSERT INTO sewadars_txn_ts 
		(	satsang_centre_id, sewadar_grno, sewa_id, screen_id	)
	SELECT ad.satsang_centre_id, sewadar_grno, x.sewa_id, 'ATT_01'
	FROM sewadar_wise_sewa_summaries  ad
		JOIN	sewas	x
			ON	(	x.sewa_id = ad.sewa_id
				AND	x.attendance_marking = 'Summary'
				)
	WHERE	NOT EXISTS	(	SELECT	1
							FROM	sewadars_txn_ts stt
							WHERE	stt.satsang_centre_id = ad.satsang_centre_id
							AND		stt.sewadar_grno = ad.sewadar_grno
							AND		ad.sewa_id = stt.sewa_id
							AND		stt.screen_id = 'ATT_01'
						)
*/

PRINT 'Transaction Timestamps for Screen ID ATT_01 that do not have corresponding Sewadar-wise Sewa Summaries for Attendance-marking Sewas'
SELECT * FROM sewadars_txn_ts stt
	JOIN	sewas	x
		ON	(	x.sewa_id = stt.sewa_id )
WHERE	NOT EXISTS	(	SELECT	1
						FROM	sewadar_wise_sewa_summaries  ad
						WHERE	stt.satsang_centre_id = ad.satsang_centre_id
						AND		stt.sewadar_grno = ad.sewadar_grno
						AND		ad.sewa_id = stt.sewa_id
					)
AND		stt.screen_id = 'ATT_01'
/* ----- 
  SQL Statement that fixes the above abnormality 

		DELETE stt
		FROM sewadars_txn_ts stt
			JOIN	sewas	x
				ON	(	x.sewa_id = stt.sewa_id )
		WHERE	NOT EXISTS	(	SELECT	1
								FROM	sewadar_wise_sewa_summaries  ad
								WHERE	stt.satsang_centre_id = ad.satsang_centre_id
								AND		stt.sewadar_grno = ad.sewadar_grno
								AND		ad.sewa_id = stt.sewa_id
							)
		AND		stt.screen_id = 'ATT_01'
		*/



PRINT  'Sewadars Transaction Time-stamps that do not have Team-wise Daily Attendance (Sewadar-Wise)'

SELECT	*
FROM	sewadars_txn_ts stt
WHERE	NOT EXISTS	(	SELECT	1
						FROM	team_wise_daily_attendance  ad
							JOIN	sewa_team_wise_sewadars stws
								ON	(	stws.serial_id = ad.serial_id
									AND	stws.sewa_team_id = ad.sewa_team_id
									AND	stt.satsang_centre_id = stws.satsang_centre_id
									AND	stt.sewadar_grno = stws.sewadar_grno
									)
							JOIN	sewa_teams sewateams
								ON	(	sewateams.sewa_team_id = ad.sewa_team_id	)
							JOIN	sewas sewa
								ON	(	sewa.sewa_id = sewateams.sewa_id
									AND	sewa.sewa_id = stt.sewa_id
									)
					)
AND	stt.screen_id = 'ATT_05'
/* ----- 
  SQL Statement that fixes the above abnormality 

		DELETE stt
		FROM	sewadars_txn_ts stt
		WHERE	NOT EXISTS	(	SELECT	1
								FROM	team_wise_daily_attendance  ad
									JOIN	sewa_team_wise_sewadars stws
										ON	(	stws.serial_id = ad.serial_id
											AND	stws.sewa_team_id = ad.sewa_team_id
											AND	stt.satsang_centre_id = stws.satsang_centre_id
											AND	stt.sewadar_grno = stws.sewadar_grno
											)
									JOIN	sewa_teams sewateams
										ON	(	sewateams.sewa_team_id = ad.sewa_team_id	)
									JOIN	sewas sewa
										ON	(	sewa.sewa_id = sewateams.sewa_id
											AND	sewa.sewa_id = stt.sewa_id
											)
							)
		AND	stt.screen_id = 'ATT_05'
		*/

--====================================================================================

PRINT 'Sewadars Transaction Time-stamps present for Team-wise Daily Attendance (Day-Wise)'

SELECT	*
FROM	sewadars_txn_ts stt
WHERE	stt.screen_id = 'ATT_04'
--====================================================================================

PRINT 'Sewa Teams Transaction Time Stamps that do not have Team-wise Daiy Attendance (comes from Day-Wise)'

SELECT	*
FROM	sewa_teams_txn_ts stt
WHERE	NOT EXISTS	(	SELECT	1
						FROM	team_wise_daily_attendance  ad
							JOIN	sewa_team_wise_sewadars stws
								ON	(	stws.serial_id = ad.serial_id
									AND	stws.sewa_team_id = ad.sewa_team_id
									AND	ad.sewa_team_id = stt.sewa_team_id
									AND	ad.attendance_dt = stt.attendance_dt
									)
							JOIN	sewa_teams sewateams
								ON	(	sewateams.sewa_team_id = ad.sewa_team_id	)
					);

/* ----- 
  SQL Statement that fixes the above abnormality 

		DELETE stt
		FROM	sewa_teams_txn_ts stt
		WHERE	NOT EXISTS	(	SELECT	1
								FROM	team_wise_daily_attendance  ad
									JOIN	sewa_team_wise_sewadars stws
										ON	(	stws.serial_id = ad.serial_id
											AND	stws.sewa_team_id = ad.sewa_team_id
											AND	ad.sewa_team_id = stt.sewa_team_id
											AND	ad.attendance_dt = stt.attendance_dt
											)
									JOIN	sewa_teams sewateams
										ON	(	sewateams.sewa_team_id = ad.sewa_team_id	)
							)
		*/


--====================================================================================

-- Flag all cases where entry does not exist sewadars_attributes in for an entry in sewadars_particulars

SELECT	'Entry exists in sewadars_attributes for Boolean attributes with value as No', *
FROM	sewadars_attributes
WHERE	boolean_value	=	'No';

SELECT	'Entry exists in sewadars_particulars but not in sewadars_attributes', *
FROM	sewadars_particulars  p
WHERE	NOT EXISTS	(	SELECT	1
						FROM	sewadars_attributes a
						WHERE	a.satsang_centre_id = p.satsang_centre_id
						AND		a.sewadar_grno		= p.sewadar_grno
					);

SELECT	'Entry exists in sewadars_attributes but not in sewadars_particulars', *
FROM	sewadars_attributes  p
WHERE	NOT EXISTS	(	SELECT	1
						FROM	sewadars_particulars a
						WHERE	a.satsang_centre_id = p.satsang_centre_id
						AND		a.sewadar_grno		= p.sewadar_grno
					);
--====================================================================================

IF EXISTS (SELECT 1 FROM master..sysdatabases WHERE name = @current_db + '_PHOTOS')
BEGIN
	PRINT 'sewadar_id in Sewadars Photos (in ' + @current_db + '_PHOTOS) that do not have corresponding sewadars (in ' + @current_db + '..sewadars)'

	DECLARE @query VARCHAR (2000)

	SET @query = 'SELECT sewadar_id FROM ' + @current_db + '_PHOTOS..sewadars_photos p
	WHERE NOT EXISTS	(SELECT 1 FROM sewadars s WHERE s.sewadar_id = p.sewadar_id)'

	EXEC (@query)
	PRINT '(' + CONVERT (VARCHAR, @@ROWCOUNT) + 'row(s) affected)'
END
/* ----- 
  SQL Statement that fixes the above abnormality 
		DECLARE @query VARCHAR (2000)
		SET @query = 	'DELETE p FROM ' + (SELECT DB_NAME()) + '_PHOTOS..sewadars_photos p 
						 WHERE NOT EXISTS (SELECT 1 FROM sewadars s WHERE s.sewadar_id = p.sewadar_id)'
		EXEC (@query)
		*/

----====================================================================================

SELECT		'Multiple entries for Remarks', sewadar_id, remarks_type, COUNT(*)
FROM		sewadars_remarks
WHERE 		remarks_type IN ('Old G.R.No.', 'Reference') 
GROUP BY	sewadar_id, remarks_type
HAVING		COUNT(*) > 1
ORDER BY	2, 3

----====================================================================================
