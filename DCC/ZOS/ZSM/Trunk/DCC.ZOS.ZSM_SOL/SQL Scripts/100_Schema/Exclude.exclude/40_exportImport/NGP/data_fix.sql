-- For Data Exported on 26 December 2011
-- LATER : JL ... we will not use tmp_* tables; only a memory table will be sufficient
--========================================================================================================
-- Sewa ID 64 to be stored as 63
--========================================================================================================

SET IDENTITY_INSERT sewas ON ;

DECLARE
	@sewa_nm VARCHAR (100),
	@sewa_cd VARCHAR (100);

SELECT	@sewa_nm	=	sewa_nm,
		@sewa_cd	=	sewa_cd
FROM	sewas
WHERE	sewa_id = 64;

INSERT INTO sewas
		(	sewa_id, satsang_centre_id, sewa_cd, sewa_nm, start_dt, finish_dt, is_satsang_programme,
			is_scanner_used, is_leave_allowed, is_exemption_allowed, is_default_sewa, 
			attendance_marking, min_sewa_duration, max_sewa_duration, sewa_frequency,
			attendance_ts, summary_ts, deleted_ts, locked_dtm, attendance_unit
		)
	SELECT	63, satsang_centre_id, 'xxx', 'xxx', start_dt, finish_dt, is_satsang_programme,
			is_scanner_used, is_leave_allowed, is_exemption_allowed, 'No', 
			attendance_marking, min_sewa_duration, max_sewa_duration, sewa_frequency,
			attendance_ts, summary_ts, deleted_ts, locked_dtm, attendance_unit
	FROM	sewas
	WHERE	sewa_id = 64

UPDATE	sewa_teams
	SET	sewa_id = 63
WHERE	sewa_id = 64;

DELETE
FROM	sewadar_wise_sewa_summaries
WHERE	sewa_id = 64;

DELETE
FROM	sewas
WHERE	sewa_id = 64;

UPDATE	sewas
	SET	sewa_nm	=	@sewa_nm,
		sewa_cd	=	@sewa_cd
WHERE	sewa_id = 63;

SET IDENTITY_INSERT sewas OFF ;

--========================================================================================================
--Table generic_sewadar_lists and
--			generic_sewadar_lists_sewadars, adt_generic_sewadar_lists, adt_generic_sewadar_lists_sewadars
--========================================================================================================
DECLARE @centre_id INTEGER;
SET @centre_id = 6056;

SELECT * INTO tmp_generic_sewadar_lists FROM generic_sewadar_lists;
SELECT * INTO tmp_generic_sewadar_lists_sewadars FROM generic_sewadar_lists_sewadars;

DELETE FROM generic_sewadar_lists_sewadars;
DELETE FROM generic_sewadar_lists;

DBCC CHECKIDENT ('generic_sewadar_lists', RESEED, 100000000) WITH NO_INFOMSGS;

INSERT INTO generic_sewadar_lists
(
		satsang_centre_id, sewadar_list_nm, sewadar_list_use, sewadar_list_other_use, other_satsang_centre_sewadars, 
		is_other_satsang_centre, is_editing_allowed, remarks, generated_dtm, report_nm, session_id
)
	SELECT
		satsang_centre_id, sewadar_list_nm, sewadar_list_use, sewadar_list_other_use, other_satsang_centre_sewadars, 
		is_other_satsang_centre, is_editing_allowed, remarks, generated_dtm, report_nm, session_id
	FROM tmp_generic_sewadar_lists

DELETE FROM ZSM..centres_tables_id_changes
WHERE satsang_centre_id = @centre_id AND object_id = 'generic_sewadar_lists'
	AND changed_on > '2011-Dec-20';

INSERT INTO ZSM..centres_tables_id_changes 
(
		satsang_centre_id, object_id, imported_id, exported_id
)
	SELECT 	
		@centre_id, 'generic_sewadar_lists', t.sewadar_list_id, g.sewadar_list_id
	FROM tmp_generic_sewadar_lists 	t
	JOIN generic_sewadar_lists 		g ON (	g.satsang_centre_id = t.satsang_centre_id AND 
											g.sewadar_list_nm 	= t.sewadar_list_nm	)

INSERT INTO generic_sewadar_lists_sewadars
(
		sewadar_list_id, satsang_centre_id, sewadar_grno
)
	SELECT
		c.exported_id, s.satsang_centre_id, s.sewadar_grno
	FROM tmp_generic_sewadar_lists_sewadars s
	JOIN ZSM..centres_tables_id_changes c ON (	c.imported_id 		= s.sewadar_list_id AND 
												c.satsang_centre_id = @centre_id	AND
												c.object_id			= 'generic_sewadar_lists'	);

UPDATE a
	SET sewadar_list_id = c.exported_id
FROM adt_generic_sewadar_lists a
JOIN ZSM..centres_tables_id_changes c ON (	c.imported_id 	= a.sewadar_list_id AND c.satsang_centre_id = @centre_id
										AND c.object_id		= 'generic_sewadar_lists'	);
	
UPDATE a
	SET sewadar_list_id = c.exported_id
FROM adt_generic_sewadar_lists_sewadars a
JOIN ZSM..centres_tables_id_changes c ON (	c.imported_id 	= a.sewadar_list_id AND c.satsang_centre_id = @centre_id
										AND c.object_id		= 'generic_sewadar_lists'	);

DROP TABLE tmp_generic_sewadar_lists;
DROP TABLE tmp_generic_sewadar_lists_sewadars;
--========================================================================================================

/* ..... these are not needed as these are dropped in the script upgrade_v5.31.exclude ....

SELECT * INTO tmp_generic_report_synopsis 	FROM generic_report_synopsis;
SELECT * INTO tmp_generic_report_summaries 	FROM generic_report_summaries;
SELECT * INTO tmp_generic_report_details	FROM generic_report_details;
SELECT * INTO tmp_generic_report_headers	FROM generic_report_headers ORDER BY session_id;

DELETE FROM generic_report_synopsis;
DELETE FROM generic_report_summaries;
DELETE FROM generic_report_details;
DELETE FROM generic_report_headers;

DBCC CHECKIDENT ('generic_report_headers', RESEED, 100000000) WITH NO_INFOMSGS;

INSERT INTO generic_report_headers
(
		report_header, extra_information_header, major_information_header, prepare_dtm
)
	SELECT
		report_header, extra_information_header, major_information_header, prepare_dtm
	FROM tmp_generic_report_headers
	ORDER BY session_id;

DECLARE  @tmp_change_ids TABLE
(
	old_id	INTEGER,
	new_id	INTEGER IDENTITY (100000001,1)
);

INSERT INTO @tmp_change_ids (old_id) SELECT session_id FROM tmp_generic_report_headers 	ORDER BY session_id;

DELETE FROM ZSM..centres_tables_id_changes
WHERE satsang_centre_id = @centre_id AND object_id = 'generic_report_headers'
	AND changed_on > '2011-Dec-20';

INSERT INTO ZSM..centres_tables_id_changes 
(
		satsang_centre_id, object_id, imported_id, exported_id
)
	SELECT 	
		@centre_id, 'generic_report_headers', t.old_id, t.new_id
	FROM @tmp_change_ids t ORDER BY t.new_id

INSERT INTO generic_report_details
(
		session_id, satsang_centre_id, sewadar_grno, extra_information
)
	SELECT
		c.exported_id, t.satsang_centre_id, t.sewadar_grno, t.extra_information
	FROM tmp_generic_report_details t
	JOIN ZSM..centres_tables_id_changes c ON (	c.imported_id 		= t.session_id 	AND 
												c.satsang_centre_id = @centre_id	AND
												c.object_id			= 'generic_report_headers'	);

SET IDENTITY_INSERT generic_report_summaries ON

INSERT INTO generic_report_summaries
(
		session_id, serial_id, major_information, minor_information, gents_cnt, ladies_cnt
)
	SELECT
		c.exported_id, t.serial_id, t.major_information, t.minor_information, t.gents_cnt, t.ladies_cnt
	FROM tmp_generic_report_summaries t
	JOIN ZSM..centres_tables_id_changes c ON (	c.imported_id 		= t.session_id 	AND 
												c.satsang_centre_id = @centre_id	AND
												c.object_id			= 'generic_report_headers'	);

SET IDENTITY_INSERT generic_report_summaries OFF

SET IDENTITY_INSERT generic_report_synopsis ON

INSERT INTO generic_report_synopsis
(
		session_id, serial_id, major_information, minor_information, extra_information
)
	SELECT
		c.exported_id, t.serial_id, t.major_information, t.minor_information, t.extra_information
	FROM tmp_generic_report_synopsis t
	JOIN ZSM..centres_tables_id_changes c ON (	c.imported_id 		= t.session_id 	AND 
												c.satsang_centre_id = @centre_id	AND
												c.object_id			= 'generic_report_headers'	);

SET IDENTITY_INSERT generic_report_synopsis OFF

DROP TABLE tmp_generic_report_synopsis;
DROP TABLE tmp_generic_report_summaries;
DROP TABLE tmp_generic_report_details;
DROP TABLE tmp_generic_report_headers;

*/


