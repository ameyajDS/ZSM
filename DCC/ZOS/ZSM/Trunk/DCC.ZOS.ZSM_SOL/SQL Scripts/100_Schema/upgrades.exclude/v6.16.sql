/* ==================================================================================
    Source File		:	v6.16.sql
    Author(s)		:	Ameya Jadhav
    Started On		:	Sun Feb 27 2022
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Upgrade Script for v6.16
    ==================================================================================
								      								  Revision History
    ----------------------------------------------------------------------------------

   ==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

USE SysAdmin
GO

UPDATE packages
	SET	version_no = 6.16,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'
GO

USE ZSM
GO

-- =============================================================================

INSERT INTO	badge_templates
		(	badge_template_id, badge_template_nm, badge_shape, information_type,
			foreground_colour_control, foreground_colour_id, background_colour_control, background_colour_id,
			top_line_font_size, top_line_part_1_type, top_line_part_1_text, top_line_parts_separator, top_line_part_2_type, top_line_part_2_text,
			middle_line_font_size, middle_line_part_1_type, middle_line_part_1_text, middle_line_parts_separator, middle_line_part_2_type, middle_line_part_2_text,
			bottom_line_font_size, bottom_line_part_1_type, bottom_line_part_1_text, bottom_line_parts_separator, bottom_line_part_2_type, bottom_line_part_2_text,
			expiry_year, report_file_nm_front, report_file_nm_back, procedure_nm_front, procedure_nm_back, are_outstation_sewadars_allowed
		)
	VALUES
		(	'GuideSB',	'Guide Sewadar',		'Vertical',		'Sewadar',
			'Colour',	1,		'Colour',	2,
			10,		'Text',			'GUIDE',		NULL,		NULL,		NULL,
			10,		'Department',	NULL,							'()',		'Sub-Department',		NULL,
			10,		'Text',			'Radhasoami Satsang Beas',		'-',		'Satsang Centre',		NULL,
			2015,	'GuideSewadarBadge.rpt',		NULL,	'GetGuideSewadarsBadgeInfo',		NULL,	'No'
		);

INSERT INTO	badge_templates_sewadar_status	VALUES	(	'GuideSB',	'Perm'	);
INSERT INTO	badge_templates_sewadar_status	VALUES	(	'GuideSB',	'Temp'	);

-- =============================================================================
