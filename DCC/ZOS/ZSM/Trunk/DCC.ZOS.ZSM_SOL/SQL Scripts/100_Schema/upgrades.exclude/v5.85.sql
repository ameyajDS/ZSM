USE Sysadmin
GO


INSERT INTO [Sysadmin].[dbo].[applications]
           ([application_id]
           ,[application_nm]
           ,[package_id]
           ,[database_nm]
           ,[implementation_dt]
           ,[error_log_level]
           ,[log_file_size_in_mb]
           ,[report_title]
           ,[report_footer]
           ,[path_1]
           ,[path_2]
           ,[path_3]
           ,[argument_1]
           ,[argument_2]
           ,[argument_3]
           ,[argument_4]
           ,[argument_5])
     VALUES
           ('ZSM_SPC'
           ,'Sewadar Photo Clicking(Mumbai)'
           ,'ZSM'
           ,'ZSM'
           ,GETDATE()
           ,'Error'
           ,10
           ,NULL
           ,NULL
           ,NULL
           ,NULL
           ,NULL
           ,6015
           ,'Mumbai'
           ,'Yes'
           ,NULL
           ,NULL)
GO

