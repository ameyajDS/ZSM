/* ==================================================================================
    Source File		:	upgrade_v5.39.sql.exclude
    Author(s)		:	Jitendra Loyal
    Started On		:	Tue Dec 17 2011
    Last updated	:	Dec 18, 2011
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Upgrade Script for v5.39
			..... Adding a new badge template for trainee sewadars
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
	SET	version_no = 5.39,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'

GO

USE ZSM
GO

-- =============================================================================
--	Set the Badge Template for Trainee and Open Sewadar Badge
-- =============================================================================

INSERT INTO	badge_templates
		(	badge_template_id, badge_template_nm, badge_shape, information_type,
			foreground_colour_control, foreground_colour_id, background_colour_control, background_colour_id,
			top_line_font_size, top_line_part_1_type, top_line_part_1_text, top_line_parts_separator, top_line_part_2_type, top_line_part_2_text,
			middle_line_font_size, middle_line_part_1_type, middle_line_part_1_text, middle_line_parts_separator, middle_line_part_2_type, middle_line_part_2_text,
			bottom_line_font_size, bottom_line_part_1_type, bottom_line_part_1_text, bottom_line_parts_separator, bottom_line_part_2_type, bottom_line_part_2_text,
			expiry_year, report_file_nm_front, report_file_nm_back, procedure_nm_front, procedure_nm_back
		)
	VALUES
		(	'TraineeSB',	'Trainee/Open Sewadar Badge',		'Horizontal',		'Sewadar',
			'Colour',	1,		'Colour',	2,
			10,		'Text',			'RSSB',		'-',		'Satsang Centre',		NULL,
			9,		'Department',	NULL,							'()',		'Sub-Department',		NULL,
			8,		'Text',			'',							'',		'Text',					'',
			2015,	'TraineeSewadarsBadge.rpt',		NULL,	'GetTraineeSewadarsBadgeInfo',		NULL
		);


INSERT INTO	badge_templates_sewadar_status	VALUES	(	'TraineeSB',	'Trn'	);
INSERT INTO	badge_templates_sewadar_status	VALUES	(	'TraineeSB',	'Open'	);


-- =============================================================================
--	Delete the Information Codes and Values for different uses of Status 
-- =============================================================================

DELETE FROM		system_information_values	WHERE	system_info_cd	IN 	(	'SttsBdgPrn', 'SttsBdgTrnOpn'	);
DELETE FROM		system_information_codes	WHERE	system_info_cd	IN 	(	'SttsBdgPrn', 'SttsBdgTrnOpn'	);

-- =============================================================================

-- vim:sw=4 ht=4 ai ts=4
