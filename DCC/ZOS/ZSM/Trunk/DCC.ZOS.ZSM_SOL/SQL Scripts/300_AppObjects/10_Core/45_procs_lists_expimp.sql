/* ==================================================================================
    Source File		:	procs_lists_expimp.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Tue Sep 30 17:36 IST 2014
    Last updated	:	Oct 02, 2014
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		This is re-runnable script and thus is pre-qualified with DROP statements.
    ==================================================================================
								      								  Revision History
    ----------------------------------------------------------------------------------
     JL : 30-Sep, 02-Oct-2014
		*   Initial version
   ==================================================================================*/

-- =============================================================================
-- Procedure ExportSewadarListsToZone
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'ExportSewadarListsToZone' AND xtype = 'P')
	DROP PROCEDURE ExportSewadarListsToZone
GO

CREATE PROCEDURE ExportSewadarListsToZone
(
	@p_satsang_centre_nm 		gnc_nm,
	@p_satsang_centre_alphabet	CHAR (1)
)
WITH ENCRYPTION
AS
	DECLARE
		@cnt	INT,
		@cid	INT
BEGIN
	IF (	@p_satsang_centre_nm IS NULL
		OR	@p_satsang_centre_nm =	''
		OR	@p_satsang_centre_alphabet IS NULL
		OR	@p_satsang_centre_alphabet =	''
	   )
	BEGIN
		RAISERROR ('Satsang Centre Name and Alphabet must be specified; EXPORT terminated', 16, 1);
		RETURN -1;
	END

	SELECT	@cid	=	satsang_centre_id
	FROM	ZSM..satsang_centres_details
	WHERE	centre_nm		=	@p_satsang_centre_nm
	AND		centre_alphabet	=	@p_satsang_centre_alphabet;
	IF (@@ROWCOUNT != 1)
	BEGIN
		RAISERROR ('Satsang Centre Name [%s] and Alphabet [%s] not found; EXPORT terminated', 16, 1);
		RETURN -2;
	END

	DECLARE	@tbl	TABLE	(	id	INT,	cnt	INT	);			--- Table to hold the Sewadar List ID and Number of Sewadars in the List

	INSERT INTO	@tbl
		SELECT	l.sewadar_list_id, COUNT (s.sewadar_list_id)
		FROM	ZSM..generic_sewadar_lists	l
			LEFT JOIN	ZSM..generic_sewadar_lists_sewadars	s
				ON	(	l.sewadar_list_id	=	s.sewadar_list_id
					AND	s.satsang_centre_id	=	@cid
					)
		WHERE	l.satsang_centre_id	=	@cid
		AND		l.is_for_export	=	'Yes'
		AND		l.exported_dtm	IS	NULL
		GROUP BY l.sewadar_list_id;
	SET	@cnt	=	@@ROWCOUNT

	IF (@cnt = 0)
	BEGIN
		RAISERROR ('There are no Sewadar Lists marked to be exported; EXPORT terminated', 16, 1);
		RETURN -1;
	END

	IF EXISTS	(	SELECT	TOP 1 1
					FROM	@tbl
					WHERE	cnt	=	0
				)
	BEGIN
		RAISERROR ('There is at least one Sewadar List marked to be exported, but does not have any Sewadars; EXPORT terminated', 16, 1);
		RETURN -2;
	END

	DELETE	z
	FROM	ZSM_TMP..generic_sewadar_lists	z
		JOIn	@tbl	t
			ON	(	z.sewadar_list_id	=	t.id	);

	DELETE	z
	FROM	ZSM_TMP..generic_sewadar_lists_sewadars	z
		JOIn	@tbl	t
			ON	(	z.sewadar_list_id	=	t.id	);

	SET IDENTITY_INSERT ZSM_TMP..generic_sewadar_lists	ON;

	INSERT INTO	ZSM_TMP..generic_sewadar_lists
			(	sewadar_list_id, satsang_centre_id, sewadar_list_nm, sewadar_list_use, sewadar_list_other_use, other_satsang_centre_sewadars,
				is_other_satsang_centre, is_editing_allowed, is_for_export, exported_dtm, programme_satsang_centre_id,
				remarks,
				generated_dtm, report_nm, session_id
			)
		SELECT	sewadar_list_id, satsang_centre_id, sewadar_list_nm, sewadar_list_use, sewadar_list_other_use, other_satsang_centre_sewadars,
				is_other_satsang_centre, is_editing_allowed, is_for_export, exported_dtm, programme_satsang_centre_id,
				COALESCE (remarks + '; ', '') + 'Exported Sewdar List (ID ' + CONVERT (VARCHAR, sewadar_list_id) + ') from Centre (' + CONVERT (VARCHAR, @cid) + ') on ' + CONVERT (VARCHAR, GetDate(), 106) + ' at ' + CONVERT (VARCHAR, GetDate(), 108),
				generated_dtm, report_nm, session_id
		FROM	ZSM..generic_sewadar_lists	z
			JOIN	@tbl	t
				ON	(	z.sewadar_list_id	=	t.id	);

	SET IDENTITY_INSERT ZSM_TMP..generic_sewadar_lists	OFF;

	INSERT INTO	ZSM_TMP..generic_sewadar_lists_sewadars
			(	sewadar_list_id, satsang_centre_id, sewadar_grno
			)
		SELECT	sewadar_list_id, satsang_centre_id, sewadar_grno
		FROM	ZSM..generic_sewadar_lists_sewadars	z
			JOIn	@tbl	t
				ON	(	z.sewadar_list_id	=	t.id	)
		WHERE	z.satsang_centre_id	=	@cid;
	
	UPDATE	z
		SET	exported_dtm		=	GetDate(),
			is_editing_allowed		=	'No'
	FROM	ZSM..generic_sewadar_lists	z
		JOIn	@tbl	t
			ON	(	z.sewadar_list_id	=	t.id	);
END
GO

-- =============================================================================
-- Procedure ImportSewadarListsToZone
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'ImportSewadarListsToZone' AND xtype = 'P')
	DROP PROCEDURE ImportSewadarListsToZone
GO

CREATE PROCEDURE ImportSewadarListsToZone
WITH ENCRYPTION
AS
	DECLARE
		@cnt	INT,
		@lst_nm	gnc_long_nm,
		@id		INTEGER
BEGIN
	SELECT	TOP 1	@lst_nm	=	l.sewadar_list_nm, @id	=	l.sewadar_list_id
	FROM	ZSM..generic_sewadar_lists	l
		JOIN	ZSM_TMP..generic_sewadar_lists	t
			ON	(	l.sewadar_list_nm	=	t.sewadar_list_nm	);
	IF (@@ROWCOUNT > 0)
	BEGIN
		RAISERROR ('There is at least one Sewadar List whose name matches with the Sewadar List (%s [ID %d]) to be imported; IMPORT terminated', 16, 1, @lst_nm, @id);
		RETURN -1;
	END

	SELECT	@cnt	=	COUNT (*)
	FROM	ZSM_TMP..generic_sewadar_lists;

	IF (@cnt = 0)
	BEGIN
		RAISERROR ('There are no Sewadar Lists to be imported; IMPORT terminated', 16, 1);
		RETURN -2;
	END

	INSERT INTO	ZSM..generic_sewadar_lists
			(	satsang_centre_id, sewadar_list_nm, sewadar_list_use, sewadar_list_other_use, other_satsang_centre_sewadars,
				is_other_satsang_centre, is_editing_allowed, is_for_export, programme_satsang_centre_id, remarks,
				generated_dtm, report_nm, session_id
			)
		SELECT	satsang_centre_id, sewadar_list_nm, sewadar_list_use, sewadar_list_other_use, other_satsang_centre_sewadars,
				is_other_satsang_centre, 'No', 'Yes', programme_satsang_centre_id, remarks,
				generated_dtm, report_nm, session_id
		FROM	ZSM_TMP..generic_sewadar_lists

	INSERT INTO	ZSM_TMP..generic_sewadar_lists_sewadars
			(	sewadar_list_id, satsang_centre_id, sewadar_grno
			)
		SELECT	l.sewadar_list_id, z.satsang_centre_id, z.sewadar_grno
		FROM	ZSM_TMP..generic_sewadar_lists	t
			JOIN	ZSM..generic_sewadar_lists	l
					ON	(	t.sewadar_list_nm	=	l.sewadar_list_nm	)
			JOIN	ZSM_TMP..generic_sewadar_lists_sewadars	z
					ON	(	z.sewadar_list_id	=	t.sewadar_list_id	);
END
GO

-- =============================================================================
-- vim:ts=4 ht=8 sw=4 guifont=Lucida_Console
