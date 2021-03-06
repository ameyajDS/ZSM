
INSERT INTO [colours]
(		colour_id,
		[colour_nm]
      ,[red_component]
      ,[green_component]
      ,[blue_component]
      ,[remarks]
      ,[effective_from]
      ,[effective_till])
VALUES (16, 'Peach', 255, 128, 128, NULL, GETDATE(), Convert(datetime, '31/12/9999', 103))

SELECT * FROM [colours]

EXEC [InsertBadgeTemplate]
@badge_template_id = 'QASewaBadg',
@badge_template_nm = 'QA Sewa Badge',
@badge_shape = 'Horizontal',
@information_type = 'Sewadar',
@foreground_colour_control = 'Colour',
@foreground_colour_id = '1',
@background_colour_control = 'Colour',
@background_colour_id = '16',
@top_line_font_size = '12',
@top_line_part_1_type = 'Text',
@top_line_part_1_text = 'Q & A SEWADAR BADGE',
@top_line_parts_separator = NULL,
@top_line_part_2_type = NULL,
@top_line_part_2_text = NULL,
@middle_line_font_size = '9',
@middle_line_part_1_type = 'Department',
@middle_line_part_1_text = NULL,
@middle_line_parts_separator = '()',
@middle_line_part_2_type = 'Sub-Department',
@middle_line_part_2_text = NULL,
@bottom_line_font_size = '10',
@bottom_line_part_1_type = 'Text',
@bottom_line_part_1_text = 'RADHASOAMI SATSANG BEAS',
@bottom_line_parts_separator = '-',
@bottom_line_part_2_type = 'Satsang Centre',
@bottom_line_part_2_text = NULL,
@expiry_year = '2015',
@report_file_nm_front = 'HorizontalQASewadarFront.rpt',
@report_file_nm_back = 'HorizontalQASewadarBack.rpt',
@procedure_nm_front = 'GetHorizontalSewadarFrontInfo',
@procedure_nm_back = 'GetHorizontalSewadarBackInfo',
@are_outstation_sewadars_allowed = 'No'


INSERT INTO [badge_templates_sewadar_status]
([badge_template_id], [sewadar_status_cd])
VALUES ('QASewaBadg', 'Perm')

INSERT INTO [badge_templates_sewadar_status]
([badge_template_id], [sewadar_status_cd])
VALUES ('QASewaBadg', 'Temp')
