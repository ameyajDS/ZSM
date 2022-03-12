/* ==================================================================================
    Source File		:	upgrade_v6.05.sql
    Author(s)		:	Ameya
    Started On		:	25th Dec 2018
	Last updated	:	25th Dec 2018
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
	SET	version_no = 6.05,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'
GO


USE [ZSM]
GO


DECLARE @report_nm VARCHAR(100)

SET @report_nm = 'Sewadar Attendance Not Marked'

INSERT INTO generic_reports
			(	report_nm, report_group, report_type, is_satsang_centre, is_sewa, is_department, is_department_multi_select,
				procedure_nm,
				satsang_centre_id_prm, satsang_centre_nm_prm, sewa_id_prm, department_id_prm,
				details_report_file_nm, summary_report_file_nm
			)
	VALUES	(	@report_nm, 3, 'B', 'R', 'R', 'O', 'Yes',				
				'GeneratePendingSewadarsForDailyAttendance',
				1, 2, 3, 4,
				'GenericGroupReportPortrait.rpt', 'GenericSummaryPortrait.rpt'
			)
go

DELETE generic_reports
where report_nm = 'Daily Attendance List'

INSERT INTO generic_reports
			(	report_nm, report_type, report_group,is_satsang_centre, is_total_line, 
				 is_sewa, is_start_dt, is_finish_dt, is_outstation_sewadar, is_department, is_department_multi_select, is_sub_department,
				procedure_nm,
				satsang_centre_id_prm, sewa_id_prm, start_dt_prm, finish_dt_prm, department_id_prm, sub_department_id_prm, outstation_sewadar_prm,
				details_report_file_nm, summary_report_file_nm
			)
	VALUES	(	'Daily Attendance List', 'B', 2, 'R','Yes',
				'R', 'R', 'R', 'O', 'R', 'Yes', 'O',
				'GenerateDailyAttendanceList',
				1, 2, 3, 4, 5, 6, 7,
				'GenericGroupReportPortrait.rpt', 'GenericGroupReportPortrait.rpt'
			)


INSERT INTO generic_reports
			(	report_nm, report_type, report_group,is_satsang_centre, is_total_line, 
				 is_sewa, is_start_dt, is_finish_dt, is_outstation_sewadar, is_department, is_department_multi_select, is_sub_department,
				procedure_nm,
				satsang_centre_id_prm, sewa_id_prm, start_dt_prm, finish_dt_prm, department_id_prm, sub_department_id_prm, outstation_sewadar_prm,
				details_report_file_nm, summary_report_file_nm
			)
	VALUES	(	'Daily Attendance Absent List', 'B', 2, 'R','Yes',
				'R', 'R', 'R', 'O', 'R', 'Yes', 'O',
				'GenerateDailyAttendanceAbsentList',
				1, 2, 3, 4, 5, 6, 7,
				'GenericGroupReportPortrait.rpt', 'GenericSummaryPortrait.rpt'
			)

GO	
