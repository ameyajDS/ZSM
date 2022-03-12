UPDATE [badge_templates]
SET report_file_nm_back = 'HorizontalQASewadarBack.rpt',
	procedure_nm_back = 'GetHorizontalSewadarBackInfo'
WHERE badge_template_id = 'QASewaBadg'


INSERT INTO [colours]
(		colour_id,
		[colour_nm]
      ,[red_component]
      ,[green_component]
      ,[blue_component]
      ,[remarks]
      ,[effective_from]
      ,[effective_till])
VALUES (17, 'LightPurple', 153, 0, 153, NULL, GETDATE(), Convert(datetime, '31/12/9999', 103))

SELECT * FROM [colours]

EXEC [InsertBadgeTemplate]
@badge_template_id = 'DarsSwa1',
@badge_template_nm = 'Sewa Badge',
@badge_shape = 'Horizontal',
@information_type = 'Sewadar',
@foreground_colour_control = 'Colour',
@foreground_colour_id = '1',
@background_colour_control = 'Colour',
@background_colour_id = '17',
@top_line_font_size = '12',
@top_line_part_1_type = 'Text',
@top_line_part_1_text = 'SEWA BADGE',
@top_line_parts_separator = NULL,
@top_line_part_2_type = NULL,
@top_line_part_2_text = NULL,
@middle_line_font_size = '9',
@middle_line_part_1_type = 'Department',
@middle_line_part_1_text = NULL,
@middle_line_parts_separator = NULL,
@middle_line_part_2_type = NULL,
@middle_line_part_2_text = NULL,
@bottom_line_font_size = '10',
@bottom_line_part_1_type = 'Text',
@bottom_line_part_1_text = 'RADHASOAMI SATSANG BEAS',
@bottom_line_parts_separator = '-',
@bottom_line_part_2_type = 'Satsang Centre',
@bottom_line_part_2_text = NULL,
@expiry_year = '2015',
@report_file_nm_front = 'HorizontalDarshanSewaFront.rpt',
@report_file_nm_back = 'HorizontalDarshanSewaBack.rpt',
@procedure_nm_front = 'GetHorizontalSewadarFrontInfo',
@procedure_nm_back = 'GetHorizontalSewadarBackInfo',
@are_outstation_sewadars_allowed = 'Yes'


INSERT INTO [badge_templates_sewadar_status]
([badge_template_id], [sewadar_status_cd])
VALUES ('DarsSwa1', 'Perm')

INSERT INTO [badge_templates_sewadar_status]
([badge_template_id], [sewadar_status_cd])
VALUES ('DarsSwa1', 'Temp')

EXEC [ZSM].[dbo].[InsertBadgeTemplate]
@badge_template_id = 'DarsSwa2',
@badge_template_nm = 'Darshan Sewa Badge(No. Series)',
@badge_shape = 'Horizontal',
@information_type = 'Range',
@foreground_colour_control = 'Colour',
@foreground_colour_id = '1',
@background_colour_control = 'Colour',
@background_colour_id = '17',
@top_line_font_size = '12',
@top_line_part_1_type = 'Text',
@top_line_part_1_text = 'DARSHAN SEWA',
@top_line_parts_separator = NULL,
@top_line_part_2_type = NULL,
@top_line_part_2_text = NULL,
@middle_line_font_size = 22,
@middle_line_part_1_type = 'TEXT',
@middle_line_part_1_text = 'SR. NO. ',
@middle_line_parts_separator = NULL,
@middle_line_part_2_type = NULL,
@middle_line_part_2_text = NULL,
@bottom_line_font_size = '10',
@bottom_line_part_1_type = 'Text',
@bottom_line_part_1_text = 'RADHASOAMI SATSANG BEAS',
@bottom_line_parts_separator = '-',
@bottom_line_part_2_type = 'Satsang Centre',
@bottom_line_part_2_text = NULL,
@expiry_year = '2015',
@report_file_nm_front = 'HorizontalDarshanSewaSeriesFront.rpt',
@report_file_nm_back = NULL,
@procedure_nm_front = 'GetDarshanSewaSeriesFrontInfo',
@procedure_nm_back = NULL,
@are_outstation_sewadars_allowed = 'Yes'


INSERT INTO [ZSM].[dbo].[badge_templates_sewadar_status]
([badge_template_id], [sewadar_status_cd])
VALUES ('DarsSwa2', 'Perm')

INSERT INTO [ZSM].[dbo].[badge_templates_sewadar_status]
([badge_template_id], [sewadar_status_cd])
VALUES ('DarsSwa2', 'Temp')
