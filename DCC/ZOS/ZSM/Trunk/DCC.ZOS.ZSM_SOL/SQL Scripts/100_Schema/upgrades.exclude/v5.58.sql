/* ==================================================================================
    Source File		:	upgrade_v5.58.sql
    Author(s)		:	Ameya Jadhav
    Started On		:	Sun, Oct 14, 2012
    Last updated	:	
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Upgrade Script for v5.58
				....
		
    ==================================================================================
								      								  Revision History
    ----------------------------------------------------------------------------------
	Adding new badge template IDCard
   ==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

USE SysAdmin
GO

UPDATE packages
	SET	version_no = 5.58,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'

-- =============================================================================
--		ZSM changes
-- =============================================================================

USE ZSM
GO


INSERT INTO	badge_templates
		(	badge_template_id, badge_template_nm, badge_shape, information_type,
			foreground_colour_control, foreground_colour_id, background_colour_control, background_colour_id,
			top_line_font_size, top_line_part_1_type, top_line_part_1_text, top_line_parts_separator, top_line_part_2_type, top_line_part_2_text,
			middle_line_font_size, middle_line_part_1_type, middle_line_part_1_text, middle_line_parts_separator, middle_line_part_2_type, middle_line_part_2_text,
			bottom_line_font_size, bottom_line_part_1_type, bottom_line_part_1_text, bottom_line_parts_separator, bottom_line_part_2_type, bottom_line_part_2_text,
			expiry_year, report_file_nm_front, report_file_nm_back, procedure_nm_front, procedure_nm_back, are_outstation_sewadars_allowed
		)
	VALUES
		(	'IDCard',	'Identity Card',		'Vertical',		'Sewadar',
			'Colour',	1,		'Colour',	2,
			10,		'Text',			'RSSB',		'-',		'Satsang Centre',		NULL,
			9,		'Department',	NULL,							'()',		'Sub-Department',		NULL,
			8,		'Text',			'-',	NULL,		NULL,					NULL,
			2015,	'IDCardBadge.rpt',		NULL,	'GetIDCardSewaBadgeInfo',		NULL,	'Yes'
		);
INSERT INTO	badge_templates_sewadar_status	VALUES	(	'IDCard',	'Perm'	);
INSERT INTO	badge_templates_sewadar_status	VALUES	(	'IDCard',	'Temp'	);

-- =============================================================================
