/* ==================================================================================
    Source File		:	upgrade_v5.83.sql
    Author(s)		:	Ameya Jadhav
    Started On		:	29 Dec, 2015
    Last updated	:	29 Dec, 2015
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Upgrade Script for v5.83
			Adding new badge template for SSCD sewa
			-----------------------------------------------------------------------
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
	SET	version_no = 5.83,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'
GO

-- =============================================================================

USE ZSM
GO

INSERT INTO [ZSM].[dbo].[colours]
           ([colour_id]
           ,[colour_nm]
           ,[red_component]
           ,[green_component]
           ,[blue_component]
           ,[remarks]
           ,[effective_from]
           ,[effective_till])
     VALUES
           (18
           ,'Orange - Dark'
           ,247,	150,	70
           ,''
           ,GETDATE()
           ,'9999-12-31')
GO


INSERT INTO [ZSM].[dbo].[badge_templates]
           ([badge_template_id]
           ,[badge_template_nm]
           ,[badge_shape]
           ,[information_type]
           ,[foreground_colour_control]
           ,[foreground_colour_id]
           ,[background_colour_control]
           ,[background_colour_id]
           ,[top_line_font_size]
           ,[top_line_part_1_type]
           ,[top_line_part_1_text]
           ,[top_line_parts_separator]
           ,[top_line_part_2_type]
           ,[top_line_part_2_text]
           ,[middle_line_font_size]
           ,[middle_line_part_1_type]
           ,[middle_line_part_1_text]
           ,[middle_line_parts_separator]
           ,[middle_line_part_2_type]
           ,[middle_line_part_2_text]
           ,[bottom_line_font_size]
           ,[bottom_line_part_1_type]
           ,[bottom_line_part_1_text]
           ,[bottom_line_parts_separator]
           ,[bottom_line_part_2_type]
           ,[bottom_line_part_2_text]
           ,[expiry_year]
           ,[report_file_nm_front]
           ,[report_file_nm_back]
           ,[procedure_nm_front]
           ,[procedure_nm_back]
           ,[is_expiry_year_check]
           ,[are_outstation_sewadars_allowed])
     VALUES
           ('SSCDSwBdge'
           ,'SSCD Sewa Badge'
           ,'Horizontal'
           ,'Sewadar'
           ,'Colour'
           ,1
           ,'Colour'
           ,18
           ,12
           ,'Text'
           ,'S S C D SEWADAR BADGE'
           ,NULL
           ,NULL
           ,NULL
           ,10
           ,'Department'
           ,NULL
           ,'()'
           ,'Sub-Department'
           ,NULL
           ,10
           ,'Text'
           ,'RADHASOAMI SATSANG BEAS'
           ,'-'
           ,'Satsang Centre'
           ,null
           ,2015
           ,'HorizontalSSCDSewadarFront.rpt'
           ,'HorizontalQASewadarBack.rpt'
           ,'GetHorizontalSewadarFrontInfo'
           ,'GetHorizontalSewadarBackInfo'
           ,'Yes'
           ,'Yes')
GO


INSERT badge_templates_sewadar_status
(badge_template_id, sewadar_status_cd)
VALUES ('SSCDSwBdge', 'Perm')
GO

INSERT badge_templates_sewadar_status
(badge_template_id, sewadar_status_cd)
VALUES ('SSCDSwBdge', 'Temp')
GO