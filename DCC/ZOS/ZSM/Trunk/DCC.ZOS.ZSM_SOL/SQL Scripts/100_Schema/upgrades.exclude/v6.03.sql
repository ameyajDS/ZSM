/* ==================================================================================
    Source File		:	upgrade_v6.03.sql
    Author(s)		:	Ameya
    Started On		:	15th Dec 2018
	Last updated	:	15th Dec 2018
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		
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
	SET	version_no = 6.03,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'
GO




USE ZSM
GO


INSERT INTO [dbo].[scanning_job_types]
           ([scanning_job_type_cd]
           ,[remarks]
           ,[is_date_wise]
           ,[has_sub_jobs]
           ,[status_system_info_cd]
           ,[procedure_nm]
           ,[cnt_procedure_nm]
           ,[effective_from]
           ,[effective_till]
           ,[check_in_sewadar_list])
     VALUES
           ('AnnualSewa'
           ,'For recording annual sewa attendance'
           ,'Yes'
           ,'Yes'
           ,'SttsCnstSewa'
           ,'ProcessScannedAnnualAttendance'
           ,'GetSewadarTeamWiseDailyPresencesCount'
           ,'20180101'
           ,'99991231'
           ,'No')
GO


EXEC sp_unbindrule 'team_wise_daily_attendance.is_scanned';



