SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertBadgeTemplate
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertBadgeTemplate'
			)
	BEGIN
		DROP PROCEDURE  InsertBadgeTemplate
	END
GO
CREATE PROCEDURE InsertBadgeTemplate
(
	@badge_template_id					badge_template_id,
	@badge_template_nm					gnc_nm,
	@badge_shape						varchar(10),
	@information_type					varchar(10),
	@foreground_colour_control			ColourControl,
	@foreground_colour_id				colour_id = NULL,
	@background_colour_control			ColourControl,
	@background_colour_id				colour_id = NULL,
	@top_line_font_size					BadgeFontSize,
	@top_line_part_1_type				badge_part_type,
	@top_line_part_1_text				badge_text = NULL,
	@top_line_parts_separator			Separator = NULL,
	@top_line_part_2_type				badge_part_type = NULL,
	@top_line_part_2_text				badge_text = NULL,
	@middle_line_font_size				BadgeFontSize = NULL,
	@middle_line_part_1_type			badge_part_type = NULL,
	@middle_line_part_1_text			badge_text = NULL,
	@middle_line_parts_separator		Separator = NULL,
	@middle_line_part_2_type			badge_part_type = NULL,
	@middle_line_part_2_text			badge_text = NULL,
	@bottom_line_font_size				BadgeFontSize,
	@bottom_line_part_1_type			badge_part_type,
	@bottom_line_part_1_text			badge_text = NULL,
	@bottom_line_parts_separator		Separator = NULL,
	@bottom_line_part_2_type			badge_part_type = NULL,
	@bottom_line_part_2_text			badge_text = NULL,
	@expiry_year						char(4) = NULL,
	@report_file_nm_front				file_nm,
	@report_file_nm_back				file_nm = NULL,
	@procedure_nm_front					procedure_nm,
	@procedure_nm_back					procedure_nm = NULL,
	@are_outstation_sewadars_allowed	Boolean
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO badge_templates
	(
		badge_template_id, badge_template_nm, badge_shape, information_type, foreground_colour_control, foreground_colour_id, background_colour_control, background_colour_id, top_line_font_size, top_line_part_1_type, top_line_part_1_text, top_line_parts_separator, top_line_part_2_type, top_line_part_2_text, middle_line_font_size, middle_line_part_1_type, middle_line_part_1_text, middle_line_parts_separator, middle_line_part_2_type, middle_line_part_2_text, bottom_line_font_size, bottom_line_part_1_type, bottom_line_part_1_text, bottom_line_parts_separator, bottom_line_part_2_type, bottom_line_part_2_text, expiry_year, report_file_nm_front, report_file_nm_back, procedure_nm_front, procedure_nm_back, are_outstation_sewadars_allowed
	)
	VALUES
	(
		@badge_template_id, @badge_template_nm, @badge_shape, @information_type, @foreground_colour_control, @foreground_colour_id, @background_colour_control, @background_colour_id, @top_line_font_size, @top_line_part_1_type, @top_line_part_1_text, @top_line_parts_separator, @top_line_part_2_type, @top_line_part_2_text, @middle_line_font_size, @middle_line_part_1_type, @middle_line_part_1_text, @middle_line_parts_separator, @middle_line_part_2_type, @middle_line_part_2_text, @bottom_line_font_size, @bottom_line_part_1_type, @bottom_line_part_1_text, @bottom_line_parts_separator, @bottom_line_part_2_type, @bottom_line_part_2_text, @expiry_year, @report_file_nm_front, @report_file_nm_back, @procedure_nm_front, @procedure_nm_back, @are_outstation_sewadars_allowed
	)
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateBadgeTemplate
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateBadgeTemplate'
			)
	BEGIN
		DROP PROCEDURE  UpdateBadgeTemplate
	END
GO
CREATE PROCEDURE UpdateBadgeTemplate
(
	@badge_template_id					badge_template_id,
	@badge_template_nm					gnc_nm,
	@badge_shape						varchar(10),
	@information_type					varchar(10),
	@foreground_colour_control			ColourControl,
	@foreground_colour_id				colour_id,
	@background_colour_control			ColourControl,
	@background_colour_id				colour_id,
	@top_line_font_size					BadgeFontSize,
	@top_line_part_1_type				badge_part_type,
	@top_line_part_1_text				badge_text,
	@top_line_parts_separator			Separator,
	@top_line_part_2_type				badge_part_type,
	@top_line_part_2_text				badge_text,
	@middle_line_font_size				BadgeFontSize,
	@middle_line_part_1_type			badge_part_type,
	@middle_line_part_1_text			badge_text,
	@middle_line_parts_separator		Separator,
	@middle_line_part_2_type			badge_part_type,
	@middle_line_part_2_text			badge_text,
	@bottom_line_font_size				BadgeFontSize,
	@bottom_line_part_1_type			badge_part_type,
	@bottom_line_part_1_text			badge_text,
	@bottom_line_parts_separator		Separator,
	@bottom_line_part_2_type			badge_part_type,
	@bottom_line_part_2_text			badge_text,
	@expiry_year						char(4),
	@report_file_nm_front				file_nm,
	@report_file_nm_back				file_nm,
	@procedure_nm_front					procedure_nm,
	@procedure_nm_back					procedure_nm,
	@are_outstation_sewadars_allowed	Boolean,
	@txn_ts								timestamp
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    badge_templates
	SET
		badge_template_nm				=	@badge_template_nm,
		badge_shape						=	@badge_shape,
		information_type				=	@information_type,
		foreground_colour_control		=	@foreground_colour_control,
		foreground_colour_id			=	@foreground_colour_id,
		background_colour_control		=	@background_colour_control,
		background_colour_id			=	@background_colour_id,
		top_line_font_size				=	@top_line_font_size,
		top_line_part_1_type			=	@top_line_part_1_type,
		top_line_part_1_text			=	@top_line_part_1_text,
		top_line_parts_separator		=	@top_line_parts_separator,
		top_line_part_2_type			=	@top_line_part_2_type,
		top_line_part_2_text			=	@top_line_part_2_text,
		middle_line_font_size			=	@middle_line_font_size,
		middle_line_part_1_type			=	@middle_line_part_1_type,
		middle_line_part_1_text			=	@middle_line_part_1_text,
		middle_line_parts_separator		=	@middle_line_parts_separator,
		middle_line_part_2_type			=	@middle_line_part_2_type,
		middle_line_part_2_text			=	@middle_line_part_2_text,
		bottom_line_font_size			=	@bottom_line_font_size,
		bottom_line_part_1_type			=	@bottom_line_part_1_type,
		bottom_line_part_1_text			=	@bottom_line_part_1_text,
		bottom_line_parts_separator		=	@bottom_line_parts_separator,
		bottom_line_part_2_type			=	@bottom_line_part_2_type,
		bottom_line_part_2_text			=	@bottom_line_part_2_text,
		expiry_year						=	@expiry_year,
		report_file_nm_front			=	@report_file_nm_front,
		report_file_nm_back				=	@report_file_nm_back,
		procedure_nm_front				=	@procedure_nm_front,
		procedure_nm_back				=	@procedure_nm_back,
		are_outstation_sewadars_allowed =   @are_outstation_sewadars_allowed
	WHERE @badge_template_id = @badge_template_id
	AND txn_ts						=	@txn_ts
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
--	Procedure	DeleteBadgeTemplate
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteBadgeTemplate'
			)
	BEGIN
		DROP PROCEDURE  DeleteBadgeTemplate
	END
GO
CREATE PROCEDURE DeleteBadgeTemplate
(
	@badge_template_id					badge_template_id,
	@txn_ts								timestamp
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM badge_templates
	WHERE badge_template_id = @badge_template_id 
	AND txn_ts=	@txn_ts
	IF (@@ROWCOUNT != 1)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotDeleted', NULL, NULL, NULL, NULL
	END
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	QueryBadgeTemplate
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QueryBadgeTemplate'
			)
	BEGIN
		DROP PROCEDURE  QueryBadgeTemplate
	END
GO
CREATE PROCEDURE QueryBadgeTemplate
(
	@badge_template_id					badge_template_id,
	@badge_template_nm					gnc_nm,
	@badge_shape						varchar(10),
	@information_type					varchar(10),
	@foreground_colour_control			ColourControl,
	@foreground_colour_id				colour_id,
	@background_colour_control			ColourControl,
	@background_colour_id				colour_id,
	@top_line_font_size					BadgeFontSize,
	@top_line_part_1_type				badge_part_type,
	@top_line_part_1_text				badge_text,
	@top_line_parts_separator			Separator,
	@top_line_part_2_type				badge_part_type,
	@top_line_part_2_text				badge_text,
	@middle_line_font_size				BadgeFontSize,
	@middle_line_part_1_type			badge_part_type,
	@middle_line_part_1_text			badge_text,
	@middle_line_parts_separator		Separator,
	@middle_line_part_2_type			badge_part_type,
	@middle_line_part_2_text			badge_text,
	@bottom_line_font_size				BadgeFontSize,
	@bottom_line_part_1_type			badge_part_type,
	@bottom_line_part_1_text			badge_text,
	@bottom_line_parts_separator		Separator,
	@bottom_line_part_2_type			badge_part_type,
	@bottom_line_part_2_text			badge_text,
	@expiry_year						char(4),
	@report_file_nm_front				file_nm,
	@report_file_nm_back				file_nm,
	@procedure_nm_front					procedure_nm,
	@procedure_nm_back					procedure_nm,
	@txn_ts								timestamp
)
WITH ENCRYPTION
AS
BEGIN
	SELECT
		badge_template_id, 
		badge_template_nm, 
		badge_shape, 
		information_type, 
		foreground_colour_control, 
		foreground_colour_id, 
		background_colour_control, 
		background_colour_id, 
		top_line_font_size, 
		top_line_part_1_type, 
		top_line_part_1_text, 
		top_line_parts_separator, 
		top_line_part_2_type, 
		top_line_part_2_text, 
		middle_line_font_size, 
		middle_line_part_1_type, 
		middle_line_part_1_text, 
		middle_line_parts_separator, 
		middle_line_part_2_type, 
		middle_line_part_2_text, 
		bottom_line_font_size, 
		bottom_line_part_1_type, 
		bottom_line_part_1_text, 
		bottom_line_parts_separator, 
		bottom_line_part_2_type, 
		bottom_line_part_2_text, 
		expiry_year, 
		report_file_nm_front, 
		report_file_nm_back, 
		procedure_nm_front, 
		procedure_nm_back, 
		txn_ts
	FROM badge_templates
	WHERE (1 = 2) --ADD YOUR WHERE CLAUSE
END
GO

-- =============================================================================
--	Procedure	ViewBadgeTemplates
-- =============================================================================
IF EXISTS	(	SELECT  *
				FROM    sysobjects
				WHERE name = 'ViewBadgeTemplates' and TYPE='v'
			)

	BEGIN
		DROP VIEW ViewBadgeTemplates
	END
GO
CREATE VIEW ViewBadgeTemplates

WITH ENCRYPTION
AS
	SELECT
		badge_template_id, 
		badge_template_nm, 
		badge_shape, 
		information_type, 
		foreground_colour_control, 
		foreground_colour_id, 
		foreground_colour_nm = f.colour_nm, 
		background_colour_control, 
		background_colour_id, 
		background_colour_nm = b.colour_nm, 
		top_line_font_size, 
		top_line_part_1_type, 
		top_line_part_1_text, 
		top_line_parts_separator, 
		top_line_part_2_type, 
		top_line_part_2_text, 
		middle_line_font_size,
		middle_line_part_1_type,
		middle_line_part_1_text,
		middle_line_parts_separator, 
		middle_line_part_2_type, 
		middle_line_part_2_text, 
		bottom_line_font_size, 
		bottom_line_part_1_type, 
		bottom_line_part_1_text, 
		bottom_line_parts_separator, 
		bottom_line_part_2_type, 
		bottom_line_part_2_text, 
		expiry_year, 
		report_file_nm_front, 
		report_file_nm_back, 
		procedure_nm_front, 
		procedure_nm_back,
		are_outstation_sewadars_allowed,
		badge_templates.txn_ts
	FROM badge_templates
	LEFT JOIN colours f ON f.colour_id = badge_templates.foreground_colour_id 
	LEFT JOIN colours b ON b.colour_id = badge_templates.background_colour_id
GO
-- =============================================================================


-- vim:ts=4 sw=4 ht=4
