SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertGenericSewadarList
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertGenericSewadarList'
			)
	BEGIN
		DROP PROCEDURE  InsertGenericSewadarList
	END
GO
CREATE PROCEDURE InsertGenericSewadarList
(
	@sewadar_list_id					sewadar_list_id output,
	@satsang_centre_id					satsang_centre_id,
	@sewadar_list_nm					gnc_long_nm,
	@sewadar_list_use					sewadar_list_use = NULL,
	@sewadar_list_other_use				sewadar_list_use = NULL,
	@other_satsang_centre_sewadars		Boolean,
	@is_other_satsang_centre			Boolean,
	@is_editing_allowed					Boolean,
	@remarks							remarks = NULL,
	@generated_dtm						smalldatetime = NULL,
	@report_nm							report_nm = NULL,
	@is_for_export						Boolean,
	@programme_satsang_centre_id 		satsang_centre_id,	
	@session_id							report_session_id = NULL
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO generic_sewadar_lists
	(
		satsang_centre_id, sewadar_list_nm, sewadar_list_use, sewadar_list_other_use, other_satsang_centre_sewadars, is_other_satsang_centre, is_editing_allowed, remarks, generated_dtm, report_nm, is_for_export, programme_satsang_centre_id, session_id
	)
	VALUES
	(
		@satsang_centre_id, @sewadar_list_nm, @sewadar_list_use, @sewadar_list_other_use, @other_satsang_centre_sewadars, @is_other_satsang_centre, @is_editing_allowed, @remarks, @generated_dtm, @report_nm, @is_for_export, @programme_satsang_centre_id, @session_id
	)
	SELECT @sewadar_list_id = SCOPE_IDENTITY()
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateGenericSewadarList
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateGenericSewadarList'
			)
	BEGIN
		DROP PROCEDURE  UpdateGenericSewadarList
	END
GO
CREATE PROCEDURE UpdateGenericSewadarList
(
	@sewadar_list_id					sewadar_list_id,
	@satsang_centre_id					satsang_centre_id,
	@sewadar_list_nm					gnc_long_nm,
	@sewadar_list_use					sewadar_list_use,
	@sewadar_list_other_use				sewadar_list_use,
	@other_satsang_centre_sewadars		Boolean,
	@is_other_satsang_centre			Boolean,
	@is_editing_allowed					Boolean,
	@remarks							remarks,
	@generated_dtm						smalldatetime,
	@report_nm							report_nm,
	@is_for_export						Boolean,
	@programme_satsang_centre_id 		satsang_centre_id,	
	@session_id							report_session_id,
	@txn_ts								timestamp
)
WITH ENCRYPTION
AS
BEGIN
	IF (@is_for_export IS NULL)
		SET @is_for_export = 'No';
	UPDATE    generic_sewadar_lists
	SET
		satsang_centre_id					=	@satsang_centre_id,
		sewadar_list_nm						=	@sewadar_list_nm,
		sewadar_list_use					=	@sewadar_list_use,
		sewadar_list_other_use				=	@sewadar_list_other_use,
		other_satsang_centre_sewadars		=	@other_satsang_centre_sewadars,
		is_other_satsang_centre				=	@is_other_satsang_centre,
		is_editing_allowed					=	@is_editing_allowed,
		remarks								=	@remarks,
		generated_dtm						=	@generated_dtm,
		report_nm							=	@report_nm,
		is_for_export						=	@is_for_export,
		programme_satsang_centre_id			=	@programme_satsang_centre_id,
		session_id							=	@session_id
	WHERE
	 	sewadar_list_id = @sewadar_list_id
	AND txn_ts							=	@txn_ts
	IF (@@ROWCOUNT != 1)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotUpdated', NULL, NULL, NULL, NULL
	END
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	DeleteGenericSewadarList
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteGenericSewadarList'
			)
	BEGIN
		DROP PROCEDURE  DeleteGenericSewadarList
	END
GO
CREATE PROCEDURE DeleteGenericSewadarList
(
	@sewadar_list_id		sewadar_list_id,
	@satsang_centre_id		satsang_centre_id,
	@txn_ts					timestamp
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM generic_sewadar_lists_sewadars
	WHERE	sewadar_list_id		=	@sewadar_list_id
		AND	satsang_centre_id	=	@satsang_centre_id


	DELETE FROM generic_sewadar_lists
	WHERE   sewadar_list_id		=	@sewadar_list_id
		AND	satsang_centre_id	=	@satsang_centre_id
		AND txn_ts				=	@txn_ts
		
	IF (@@ROWCOUNT != 1)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotDeleted', NULL, NULL, NULL, NULL
	END
END
GO
-- =============================================================================

-- =============================================================================
--	Procedure	ViewGenericSewadarList
-- =============================================================================
IF EXISTS	(	SELECT  *
				FROM    sysobjects
				WHERE name = 'ViewGenericSewadarList' and TYPE='v'
			)

	BEGIN
		DROP VIEW ViewGenericSewadarList
	END
GO
CREATE VIEW ViewGenericSewadarList

WITH ENCRYPTION
AS
	SELECT
		vsc.centre_nm,
		g.sewadar_list_id, 
		g.satsang_centre_id, 
		g.sewadar_list_nm, 
		g.sewadar_list_use, 
		g.sewadar_list_other_use, 
		g.other_satsang_centre_sewadars, 
		g.is_other_satsang_centre, 
		g.is_editing_allowed, 
		g.remarks, 
		g.generated_dtm, 
		g.report_nm, 
		g.exported_dtm,
		g.is_for_export,
		g.programme_satsang_centre_id,
		programme_satsang_centre_nm = sc.centre_nm,
		g.session_id, 
		g.txn_ts
	FROM generic_sewadar_lists g
	JOIN ViewSatsangCentreDetails vsc ON vsc.satsang_centre_id = g.satsang_centre_id
	LEFT OUTER JOIN ViewSatsangCentreDetails sc ON sc.satsang_centre_id = g.programme_satsang_centre_id
GO
-- =============================================================================

-- =============================================================================
--	Procedure	ViewSewadarsInSewadarList
-- =============================================================================
IF EXISTS	(	SELECT  *
				FROM    sysobjects
				WHERE name = 'ViewSewadarsInSewadarList' and TYPE='v'
			)

	BEGIN
		DROP VIEW ViewSewadarsInSewadarList
	END
GO
CREATE VIEW ViewSewadarsInSewadarList

WITH ENCRYPTION
AS

	SELECT
		g.sewadar_list_id, 
		list_satsang_centre_id = g.satsang_centre_id, 
		list_centre_nm = vsc.centre_nm,
		application_satsang_centre_id = application_centre.satsang_centre_id,
		g.sewadar_list_nm, 
		g.sewadar_list_use, 
		g.sewadar_list_other_use, 
		g.other_satsang_centre_sewadars, 
		g.is_other_satsang_centre, 
		g.is_editing_allowed, 
		g.remarks, 
		g.generated_dtm, 
		g.report_nm, 
		g.session_id, 
		swd_satsang_centre_id = gs.satsang_centre_id, 
		swd_sewadar_gr_no = gs.sewadar_grno,
		swd_centre_nm = swd_vsc.centre_nm,
		old_satsang_centre_id = gs.satsang_centre_id, 
		old_sewadar_grno = gs.sewadar_grno,
		swd_sewadar_id = sr.sewadar_id,
		vs.full_nm,
		vs.sewadar_grno, 
		vs.age, 
		vs.gender, 
		vs.sewadar_status_nm, 
		vs.sewadar_status_dtm, 
		vs.department_nm, 
		vs.sub_department_nm, 
		vs.department_dt 
	FROM generic_sewadar_lists_sewadars gs
	JOIN generic_sewadar_lists g ON g.sewadar_list_id = gs.sewadar_list_id
	JOIN (SELECT scd.satsang_centre_id FROM satsang_centres_details scd) AS application_centre
		ON (application_centre.satsang_centre_id = g.satsang_centre_id OR g.is_other_satsang_centre = 'Yes')
	JOIN sewadars_registrations sr ON 
		(	(sr.satsang_centre_id 	= gs.satsang_centre_id)
		AND (sr.sewadar_grno 		= gs.sewadar_grno)
		AND	(	(	(g.other_satsang_centre_sewadars	= 'No')
				AND	(sr.satsang_centre_id				= g.satsang_centre_id)
				)
			OR	(	(g.other_satsang_centre_sewadars	= 'Yes')
				AND	(	(g.is_other_satsang_centre	= 'No')
					OR	(	(g.is_other_satsang_centre	= 'Yes')
						AND	(sr.satsang_centre_id		= application_centre.satsang_centre_id)
						)
					)
				)
			)
		)
	JOIN ViewSewadarHeader vs ON  vs.sewadar_id = sr.sewadar_id
	JOIN ViewSatsangCentreDetails vsc ON vsc.satsang_centre_id = g.satsang_centre_id
	JOIN ViewSatsangCentreDetails swd_vsc ON swd_vsc.satsang_centre_id = gs.satsang_centre_id

GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertGenericSewadarListsSewadar
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertGenericSewadarListsSewadar'
			)
	BEGIN
		DROP PROCEDURE  InsertGenericSewadarListsSewadar
	END
GO
CREATE PROCEDURE InsertGenericSewadarListsSewadar
(
	@sewadar_list_id		sewadar_list_id,
	@satsang_centre_id		satsang_centre_id,
	@sewadar_grno			sewadar_grno
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO generic_sewadar_lists_sewadars
	(
		sewadar_list_id, satsang_centre_id, sewadar_grno
	)
	VALUES
	(
		@sewadar_list_id, @satsang_centre_id, @sewadar_grno
	)
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateGenericSewadarListsSewadar
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateGenericSewadarListsSewadar'
			)
	BEGIN
		DROP PROCEDURE  UpdateGenericSewadarListsSewadar
	END
GO
CREATE PROCEDURE UpdateGenericSewadarListsSewadar
(
	@sewadar_list_id		sewadar_list_id,
	@satsang_centre_id		satsang_centre_id,
	@sewadar_grno			sewadar_grno,
	@old_satsang_centre_id		satsang_centre_id,
	@old_sewadar_grno			sewadar_grno
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    generic_sewadar_lists_sewadars
	SET
		satsang_centre_id		=	@satsang_centre_id,
		sewadar_grno			=	@sewadar_grno
	WHERE
		sewadar_list_id		=	@sewadar_list_id
	AND	satsang_centre_id		=	@old_satsang_centre_id
	AND	sewadar_grno		=	@old_sewadar_grno
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	DeleteGenericSewadarListsSewadar
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteGenericSewadarListsSewadar'
			)
	BEGIN
		DROP PROCEDURE  DeleteGenericSewadarListsSewadar
	END
GO
CREATE PROCEDURE DeleteGenericSewadarListsSewadar
(
	@sewadar_list_id		sewadar_list_id,
	@old_satsang_centre_id		satsang_centre_id,
	@old_sewadar_grno			sewadar_grno
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM generic_sewadar_lists_sewadars
	WHERE
		sewadar_list_id		=	@sewadar_list_id
	AND	satsang_centre_id		=	@old_satsang_centre_id
	AND	sewadar_grno		=	@old_sewadar_grno
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	QueryGenericSewadarListsSewadar
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QueryGenericSewadarListsSewadar'
			)
	BEGIN
		DROP PROCEDURE  QueryGenericSewadarListsSewadar
	END
GO
CREATE PROCEDURE QueryGenericSewadarListsSewadar
(
	@sewadar_list_id		sewadar_list_id,
	@satsang_centre_id		satsang_centre_id
)
WITH ENCRYPTION
AS
BEGIN

	SELECT
		g.sewadar_grno,
		old_satsang_centre_id = g.satsang_centre_id, 
		old_sewadar_grno = g.sewadar_grno,
		sr.sewadar_id,
		vs.full_nm
	FROM generic_sewadar_lists_sewadars g
	JOIN sewadars_registrations sr ON sr.satsang_centre_id = g.satsang_centre_id AND sr.sewadar_grno = g.sewadar_grno
	JOIN ViewSewadarHeader vs ON  vs.sewadar_id = sr.sewadar_id
	WHERE
		g.sewadar_list_id = @sewadar_list_id
	AND	g.satsang_centre_id = @satsang_centre_id
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UnionGenericSewadarListsSewadar
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UnionGenericSewadarListsSewadar'
			)
	BEGIN
		DROP PROCEDURE  UnionGenericSewadarListsSewadar
	END
GO
CREATE PROCEDURE UnionGenericSewadarListsSewadar
(
	@sewadar_list_id		sewadar_list_id,
	@other_sewadar_list_id	sewadar_list_id,
	@is_delete_list			BIT
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO generic_sewadar_lists_sewadars
		SELECT	@sewadar_list_id,
				g1.satsang_centre_id,
				g1.sewadar_grno
		FROM	generic_sewadar_lists_sewadars g1
		WHERE	g1.sewadar_list_id = @other_sewadar_list_id
		AND		NOT EXISTS	(	SELECT	TOP 1 1
								FROM	generic_sewadar_lists_sewadars g
								WHERE	g.sewadar_list_id	=	@sewadar_list_id 
								AND		g.satsang_centre_id	=	g1.satsang_centre_id
								AND		g.sewadar_grno		=	g1.sewadar_grno
							);

	IF (@is_delete_list = 1)
	BEGIN
		DELETE
		FROM	generic_sewadar_lists_sewadars
		WHERE	sewadar_list_id	=	@other_sewadar_list_id;

		DELETE
		FROM	generic_sewadar_lists
		WHERE	sewadar_list_id	=	@other_sewadar_list_id;
	END
END
GO

-- =============================================================================
--	Procedure	IntersectGenericSewadarListsSewadar
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='IntersectGenericSewadarListsSewadar'
			)
	BEGIN
		DROP PROCEDURE  IntersectGenericSewadarListsSewadar
	END
GO
CREATE PROCEDURE IntersectGenericSewadarListsSewadar
(
	@sewadar_list_id		sewadar_list_id,
	@other_sewadar_list_id	sewadar_list_id,
	@is_delete_list			BIT
)
WITH ENCRYPTION
AS
BEGIN
	DELETE 	g1
	FROM	generic_sewadar_lists_sewadars	g1
	WHERE	sewadar_list_id = @sewadar_list_id
	AND		NOT EXISTS	(	SELECT	TOP 1 1
							FROM	generic_sewadar_lists_sewadars g
							WHERE	g.sewadar_list_id	=	@other_sewadar_list_id 
							AND		g.satsang_centre_id	=	g1.satsang_centre_id
							AND		g.sewadar_grno		=	g1.sewadar_grno
						);

	
	IF (@is_delete_list = 1)
	BEGIN
		DELETE
		FROM	generic_sewadar_lists_sewadars
		WHERE	sewadar_list_id	=	@other_sewadar_list_id;

		DELETE
		FROM	generic_sewadar_lists
		WHERE	sewadar_list_id	=	@other_sewadar_list_id;
	END
END
GO
-- =============================================================================

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	MinusGenericSewadarListsSewadar
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='MinusGenericSewadarListsSewadar'
			)
	BEGIN
		DROP PROCEDURE  MinusGenericSewadarListsSewadar
	END
GO
CREATE PROCEDURE MinusGenericSewadarListsSewadar
(
	@sewadar_list_id		sewadar_list_id,
	@other_sewadar_list_id	sewadar_list_id,
	@is_delete_list			BIT
)
WITH ENCRYPTION
AS
BEGIN
	DELETE 	g1
	FROM	generic_sewadar_lists_sewadars	g1
	WHERE	sewadar_list_id = @sewadar_list_id
	AND		EXISTS	(	SELECT	TOP 1 1
						FROM	generic_sewadar_lists_sewadars g
						WHERE	g.sewadar_list_id	=	@other_sewadar_list_id 
						AND		g.satsang_centre_id	=	g1.satsang_centre_id
						AND		g.sewadar_grno		=	g1.sewadar_grno
					);

	IF (@is_delete_list = 1)
	BEGIN
		DELETE
		FROM	generic_sewadar_lists_sewadars
		WHERE	sewadar_list_id	=	@other_sewadar_list_id;

		DELETE
		FROM	generic_sewadar_lists
		WHERE	sewadar_list_id	=	@other_sewadar_list_id;
	END
END
GO
-- =============================================================================
-- vim:ts=4 sw=4 ht=4

