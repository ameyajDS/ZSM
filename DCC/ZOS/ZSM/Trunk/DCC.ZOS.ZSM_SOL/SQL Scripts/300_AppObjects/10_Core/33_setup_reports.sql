/* ==================================================================================
    Source File		:	setup_reports.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Sat Dec 04 01:25 IST 2010
    Version			:	1.36
    Last updated	:	Jan 07, 2016
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		This is re-runnable script and setups / configures the reports information.
    ==================================================================================
								      								  Revision History
    ----------------------------------------------------------------------------------
		v1.35 JL : 07-Jan-2016
			* Area-wise Sewadars List Report now can be used to render Contact Numbers (instead of YOA and Old G.R.No.)
		v1.35 : JL : 25-Dec-2015
			* A new report "Sewadars Reporting Cards" has been added.
		v1.34 : JL : 28-Jun-2014
			* A new discrepancy report "Sewadars List having incorrect Health Details" has been added.
		v1.33 : JL : 14-May-2014
			* A new report "Daily Department-wise Summary" has been added.
		v1.32 : JL : 13-May-2014
			* 'Construction Attendance Summary' Report now uses Synopsis Report (instead of Summary Report).
		v1.31 : JL : 13-May-2014
			* 'Daily Scanned Attendance in Range' now uses the Synopsis Report (instead of Summary) for the Summary option.
		v1.30 : JL : 18-Feb-2014
			* Area-wise Sewadars List and Arbitrary Attendance Till Date Reports were not properly configured for summarization.
		v1.29 : JL : 10-Jan-2014
			* A new report 'Sewadars Attendance with invalid Sewa Shifts' has been added.
		v1.28 : JL : 05-Jan-2014
			* A new report 'List of Badges Not Printed' has been added.
			* Area-wise Sewadars List Report now can be used to render data using Sewadars List, if specified.
		v1.27 : JL : 24-Nov-2013
			* "Daily Scanned Attendance in Range" Report now has an additional parameter, which if set, excludes the Outstation Sewadars
			  that were present previous day. Note that these sewadars are excluded only if the report is taken for a single day, that is,
			  when FROM and TILL sewa dates are same.
		v1.26 : JL : 10-Nov-2013
			* Area-wise Sewadars List Report was not set-up with proper agruments; this has been done.
			* Daily Scanned Attendance in Range Report can now be restricted to an Area optionally as the Weekly Satsang Centres
			  of Sewadars.
		v1.25 : JL : 05-Nov-2013
			* "Sewadars List with Address+Tel" Report can now be restricted to Sewadars of an Area as per their weekly Satsang Centres.
		v1.24 : JL : 21-Oct-2013
			* Area-wise Sewadars List Report can now be summarized also. 
		v1.23 : JL : 21-Apr-2013
			* Area-wise Sewadars List Report can now optionally restrict the Sewadars to an age group.
		v1.22 : JL : 17-Mar-2013
			* Bulk Registration Report added.
		v1.21 : JL : 28-Jan-2013
			* Name of Sewa-wise Team List (Status-wise) Report has been changed to Sewa Teams List.
		v1.20 : JL : 20-Jan-2013
			* Report "Sewadars Register" can now be restricted to the List of Sewadars, if Sewadar List is specified.
		v1.19 : JL : 10-Jan-2013
			* Report "Sewadars List" can now be filtered on Departments and Gender, if required.
		v1.18 : JL : 29-Nov-2012
			* Report "List of Sewadars with Remarks" has been moved to Miscellaneous Reports from Discrepancy Reports.
			* Reports "Sewadars with missing Remarks Type", "Sewadars who have not clicked Photo", and "List of Sewadars with missing Addresses" will now output a list (to save paper).
		v1.17 : JL : 24-Oct-2012
			* A new discrepancy report 'Sewadars with missing Remarks Type' has been added.
		v1.16 : JL : 21-Oct-2012
			* A new Sewadar report 'Sewadars List (G.R.No.-wise)' added.
		v1.15 : JL : 25-Jun-2012
			* A new discrepancy report 'Sewadars List without Weekly Satsang Centres' added.
		v1.14 : JL : 29-May-2012
			* Data Migration Report has been moved to Miscellaneous Reports Group from Discrepancy Reports.
		v1.13 : JL : 06-May-2012
			* Badge Template has been made as a mandatory parameter for the Report "List of Badges Printed".
		v1.12 : JL : 21-Apr-2012
			* Data Migration Report added.
		v1.11 : JL : 11-Mar-2012
			* Following reports are now printed as a two-column list report:
				Sewadars List
				Eligible Sewadars List for Prashaad
				Unallocated Sewadars List
		v1.10 : AJ : 12-Feb-2012
			* Added new report 'Arbitrary Attendance Completed Till Date' in Attendance Reports
		v1.09 : JL : 30-Dec-2011
			* Summary option for Report 'Sewadars List for an Attribute' is functioning now.
			* Report 'New Sewadars List' takes now an additional parameter [Sewadar Type].
			* Report 'Heads of Departments List' was not functioning; report_nm was incorrect.
		v1.08 : JL : 27-Dec-2011
			* Support for Gender has been added to the report 'Turn-out Summary for Daily Sewas'
		v1.07 : JL : 17-Dec-2011
			* Two new reports 'Location-wise Trainee Sewadars Summary' and 'Location-wise Open Sewadars Summary' have been added.
		v1.06 : JL : 16-Dec-2011
			* Report_nm 'Department / Sub-Department-wise Sewadars Summary' takes now an additional parameter [Sewadar Type].
			* Two new reports 'Sewadar Register (Trainees)' and 'Sewadar Register (Open Sewadars)' have been added.
		v1.05 : JL : 15-Dec-2011
			A new report 'Sewadars List with Qualifications' added
		v1.04 : JL : 15-Nov-2011
			Report "List of Sewadars with Annotations" has been replaced with a report "List of Sewadars with Remarks".
			This report takes an additional parameter Remarks Type so that any kind of remarks can be printed like
			Annotations, To do notes, Remarks, etc.
		v1.03 : JL : 11-Nov-2011
			Another Report "Sewadars List without Photo" has been added in the Discrepancy Reports Group (4).
			Its parameters are same as Sewadar Register.
		v1.02 : JL : 11-Nov-2011
			Sewadar Register has two additional parameters, viz., Districts (multi-select) and
			Show Districts. The behaviour of the Sewadar Register is as below:
					Districts		Show Districts
					~~~~~~~~~		~~~~~~~~~~~~~~
				Not specified		No					Previous behaviour (prints Status of Sewadar)
				Specified			No					Prints City of Sewadar
				Not specified		Yes					Prints District of Sewadar
				Specified			Yes					Prints District of Sewadar
		v1.01 : JL : 28-Oct-2011
			Order of parameters was not correct for Outstation and Gender parameters for 'Sewadars List of Sewa Summary' report. This is fixed.
		JL : 04-Dec-2010
			*   Initial version
   ==================================================================================*/

-- =============================================================================
-- Data for the table generic_reports
-- =============================================================================

DELETE	FROM	generic_reports
GO

DECLARE @report_nm report_nm;
-- =============================================================================
--								Group 1 : Sewadars Reports
-- =============================================================================

SET @report_nm = 'Scanned Badges';

INSERT INTO generic_reports
			(	report_nm, report_group,
				is_satsang_centre, is_satsang_centre_multi_select, is_department, is_department_multi_select, is_sub_department, is_outstation_sewadar, is_gender, is_sewadar_list,
				is_gnc_dt1, gnc_dt1_label, is_gnc_dt2, gnc_dt2_label,
				is_cnt_1, cnt_1_label, cnt_1_min_value, cnt_1_max_value,
				is_cnt_2, cnt_2_label, cnt_2_min_value, cnt_2_max_value,
				procedure_nm,
				satsang_centre_id_prm, satsang_centre_nm_prm, department_id_prm, sub_department_id_prm, outstation_sewadar_prm, gender_prm,
				sewadar_list_id_prm, gnc_dt1_prm, gnc_dt2_prm, cnt_1_prm, cnt_2_prm,
				details_report_file_nm
			)
	VALUES	(	@report_nm, 3,
				'R', 'No', 'O', 'Yes', 'O', 'O', 'O', 'R',
				 'R','From', 'R', 'To',
				'O', 'Start Time 0000-2300', 0, 2359, 
				'O', 'End Time 0000-2300', 0, 2359,
				'GenerateScannedBadgesReport',
				1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11,
				'GenericReportPortrait.rpt'
			)

-- =============================================================================

SET @report_nm = 'Sewadar Register';

INSERT INTO generic_reports
			(	report_nm, sewadar_list_nm, is_sewadar_list_ticked,
				is_satsang_centre, is_satsang_centre_multi_select, is_department, is_department_multi_select, is_sub_department, is_outstation_sewadar, is_gender,
				is_country, is_state, is_district, is_gnc_boolean, gnc_boolean_label, is_sewadar_list,
				procedure_nm,
				satsang_centre_id_prm, satsang_centre_nm_prm, department_id_prm, sub_department_id_prm, outstation_sewadar_prm, gender_prm,
				district_id_prm, gnc_boolean_prm, sewadar_list_id_prm,
				details_report_file_nm
			)
	VALUES	(	@report_nm, @report_nm, 'No',
				'R', 'No', 'O', 'Yes', 'O', 'O', 'O',
				'O', 'O', 'O', 'O', 'Show District', 'O',
				'GenerateSewadarRegister',
				1, 2, 3, 4, 5, 6, 7, 8, 9,
				'GenericReportPortrait.rpt'
			)

-- =============================================================================

SET @report_nm = 'Area-wise Sewadars List';

INSERT INTO generic_reports
			(	report_nm, sewadar_list_nm, is_sewadar_list_ticked, report_type,
				is_satsang_centre, is_satsang_centre_multi_select, is_department, is_department_multi_select, is_sub_department, 
				is_outstation_sewadar, is_gender, is_area, is_sewadar_list, is_gnc_boolean, gnc_boolean_label, default_gnc_boolean,
				is_gnc_dt1, gnc_dt1_label, is_gnc_dt1_show_difference, is_gnc_dt2, gnc_dt2_label, is_gnc_dt2_show_difference,
				procedure_nm, satsang_centre_id_prm, satsang_centre_nm_prm, department_id_prm, sub_department_id_prm, 
				outstation_sewadar_prm, gender_prm, area_id_prm, area_nm_prm, gnc_dt1_prm, gnc_dt2_prm, sewadar_list_id_prm, gnc_boolean_prm,
				details_report_file_nm, summary_report_file_nm
			)
	VALUES	(	@report_nm, @report_nm, 'No', 'B',
				'R', 'No', 'O', 'Yes', 'O', 
				'O', 'O', 'O', 'O', 'R', 'Render Contact Nos.?', 'No',
				'O', 'Born after', 'Yes', 'O', 'Born till', 'Yes',
				'GenerateAreaWiseSewadarList',
				1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12,
				'GenericGroupReportPortrait.rpt', 'GenericSummaryPortrait.rpt'
			)

-- =============================================================================
SET @report_nm = 'Sewadars Reporting Cards';

INSERT INTO generic_reports
			(	report_nm, sewadar_list_nm, is_sewadar_list_ticked,
				is_satsang_centre, is_satsang_centre_multi_select, is_department, is_department_multi_select, is_sub_department, 
				is_outstation_sewadar, is_gender, is_area, is_sewadar_list, is_sewa,
				procedure_nm, satsang_centre_id_prm, satsang_centre_nm_prm, department_id_prm, sub_department_id_prm, 
				outstation_sewadar_prm, gender_prm, area_id_prm, area_nm_prm, sewadar_list_id_prm, sewa_id_prm, sewa_nm_prm,
				details_report_file_nm
			)
	VALUES	(	@report_nm, @report_nm, 'No',
				'R', 'No', 'O', 'Yes', 'O', 
				'O', 'O', 'O', 'O', 'O',
				'GenerateSewadarsReportingCards',
				1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11,
				'SewadarsReportingCard.rpt'
			)

-- =============================================================================

SET @report_nm = 'Sewadar Register (Trainees)';

INSERT INTO generic_reports
			(	report_nm, sewadar_list_nm, is_sewadar_list_ticked,
				is_satsang_centre, is_satsang_centre_multi_select, is_department, is_department_multi_select, is_outstation_sewadar, is_gender,
				is_gnc_dt1, gnc_dt1_label,
				procedure_nm,
				satsang_centre_id_prm, satsang_centre_nm_prm, department_id_prm, outstation_sewadar_prm, gender_prm, gnc_dt1_prm,
				details_report_file_nm
			)
	VALUES	(	@report_nm, @report_nm, 'No',
				'R', 'No', 'O', 'Yes', 'O', 'O',
				'O', 'Appointements after',
				'GenerateTraineeSewadarRegister',
				1, 2, 3, 4, 5, 6,
				'GenericReportPortrait.rpt'
			)

-- =============================================================================

SET @report_nm = 'Sewadar Register (Open Sewadars)';

INSERT INTO generic_reports
			(	report_nm, sewadar_list_nm, is_sewadar_list_ticked,
				is_satsang_centre, is_satsang_centre_multi_select, is_department, is_department_multi_select, is_outstation_sewadar, is_gender,
				is_gnc_dt1, gnc_dt1_label,
				procedure_nm,
				satsang_centre_id_prm, satsang_centre_nm_prm, department_id_prm, outstation_sewadar_prm, gender_prm, gnc_dt1_prm,
				details_report_file_nm
			)
	VALUES	(	@report_nm, @report_nm, 'No',
				'R', 'No', 'O', 'Yes', 'O', 'O',
				'O', 'Appointements after',
				'GenerateOpenSewadarRegister',
				1, 2, 3, 4, 5, 6,
				'GenericReportPortrait.rpt'
			)

-- =============================================================================

SET @report_nm = 'Sewadar Register (Photo Ind.)';

INSERT INTO generic_reports
			(	report_nm,
				is_satsang_centre, is_satsang_centre_multi_select, is_department, is_department_multi_select, is_sub_department, is_outstation_sewadar, is_gender, is_gnc_dt1, gnc_dt1_label, is_sewadar_list,
				procedure_nm,
				satsang_centre_id_prm, satsang_centre_nm_prm, department_id_prm, sub_department_id_prm, outstation_sewadar_prm, gender_prm, gnc_dt1_prm, sewadar_list_id_prm,
				details_report_file_nm, detail_report_footnote
			)
	VALUES	(	@report_nm,
				'R', 'No', 'O', 'Yes', 'O', 'O', 'O', 'R', 'Photo taken after', 'O',
				'GenerateSewadarRgsPhotoIndctr',
				1, 2, 3, 4, 5, 6, 7, 8,
				'GenericReportPortrait.rpt', 'No in the Photo column indicates that the sewadar has NOT clicked his/her photo after the specified date.'
			)

-- =============================================================================

SET @report_nm = 'Sewadars List for an Attribute';

INSERT INTO generic_reports
			(	report_nm, report_type, sewadar_list_nm, is_sewadar_list_ticked,
				is_satsang_centre, is_satsang_centre_multi_select, is_department, is_department_multi_select, is_sub_department, is_outstation_sewadar,
				is_gender, is_attribute, is_gnc_dt1, gnc_dt1_label, is_gnc_dt2, gnc_dt2_label, is_sewadar_list,
				procedure_nm,
				satsang_centre_id_prm, satsang_centre_nm_prm, department_id_prm, sub_department_id_prm, outstation_sewadar_prm, gender_prm, attribute_id_prm, attribute_nm_prm,
				gnc_dt1_prm, gnc_dt2_prm, sewadar_list_id_prm,
				details_report_file_nm, summary_report_file_nm
			)
	VALUES	(	@report_nm, 'B', @report_nm, 'No',
				'R', 'No', 'O', 'Yes', 'O', 'O', 'O', 'R', 'O', 'From', 'O', 'To', 'O',
				'GenerateSewadarAttributeList',
				1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11,
				'GenericReportPortrait.rpt', 'GenericSummaryPortrait.rpt'
			)

-- =============================================================================

SET @report_nm = 'Sewadars List with Qualifications';

INSERT INTO generic_reports
			(	report_nm,
				is_satsang_centre, is_satsang_centre_multi_select, is_department, is_department_multi_select, is_outstation_sewadar, is_gender, is_sewadar_list,
				procedure_nm,
				satsang_centre_id_prm, satsang_centre_nm_prm, department_id_prm, outstation_sewadar_prm, gender_prm, sewadar_list_id_prm,
				details_report_file_nm
			)
	VALUES	(	@report_nm,
				'R', 'No', 'O', 'Yes','O', 'O', 'O',
				'GenerateSewadarsQualifications',
				1, 2, 3, 4, 5, 6,
				'GenericReportPortrait.rpt'
			)

-- =============================================================================

SET @report_nm = 'Sewadars List with Address+Tel';

INSERT INTO generic_reports
			(	report_nm,
				is_satsang_centre, is_satsang_centre_multi_select, is_department, is_department_multi_select,is_sub_department, is_outstation_sewadar, is_gender, is_area, is_sewadar_list,
				procedure_nm,
				satsang_centre_id_prm, satsang_centre_nm_prm, department_id_prm, sub_department_id_prm, outstation_sewadar_prm, gender_prm, area_id_prm, area_nm_prm, sewadar_list_id_prm,
				details_report_file_nm
			)
	VALUES	(	@report_nm,
				'R', 'No', 'O', 'Yes','O', 'O', 'O', 'O', 'O',
				'GenerateSewadarsAddrTelList',
				1, 2, 3, 4, 5, 6, 7, 8, 9,
				'GenericGroupReportPortrait.rpt'
			)
-- =============================================================================

SET @report_nm = 'PO/City-wise Sewadars List';

INSERT INTO generic_reports
			(	report_nm, report_type, is_total_line, sewadar_list_nm, is_sewadar_list_ticked,
				is_satsang_centre, is_satsang_centre_multi_select, is_country, is_state, is_district, is_po_or_city, is_gender, is_sewadar_list,
				procedure_nm,
				satsang_centre_id_prm, satsang_centre_nm_prm, country_id_prm, state_id_prm, district_id_prm, po_or_city_id_prm, gender_prm, sewadar_list_id_prm,
				details_report_file_nm, summary_report_file_nm
			)
	VALUES	(	@report_nm, 'B', 'Yes', @report_nm, 'No',
				'R', 'No', 'R', 'O', 'O', 'O', 'O', 'O',
				'GenerateCityWiseSewadarList',
				1, 2, 3, 4, 5, 6, 7, 8,
				'GenericReportPortrait.rpt', 'GenericSummaryPortrait.rpt'
			)
-- =============================================================================

SET @report_nm = 'District-wise Sewadars List';

INSERT INTO generic_reports
			(	report_nm, report_type, is_total_line, sewadar_list_nm, is_sewadar_list_ticked,
				is_satsang_centre, is_satsang_centre_multi_select, is_country, is_state, is_district, is_gender, is_sewadar_list,
				procedure_nm,
				satsang_centre_id_prm, satsang_centre_nm_prm, country_id_prm, state_id_prm, district_id_prm, gender_prm, sewadar_list_id_prm,
				details_report_file_nm, summary_report_file_nm, report_main_ordering
			)
	VALUES	(	@report_nm, 'B', 'Yes', @report_nm, 'No',
				'R', 'No', 'R', 'O', 'O', 'O', 'O',
				'GenerateDstrctWiseSewadarList',
				1, 2, 3, 4, 5, 6, 7,
				'GenericReportPortrait.rpt', 'GenericSummaryPortrait.rpt', '{generic_report_details.grouping_1}'
			)
-- =============================================================================

SET @report_nm = 'State-wise Sewadars List';

INSERT INTO generic_reports
			(	report_nm, report_type, is_total_line, sewadar_list_nm, is_sewadar_list_ticked,
				is_satsang_centre, is_satsang_centre_multi_select, is_country, is_state, is_gender, is_sewadar_list,
				procedure_nm,
				satsang_centre_id_prm, satsang_centre_nm_prm, country_id_prm, state_id_prm, gender_prm, sewadar_list_id_prm,
				details_report_file_nm, summary_report_file_nm
			)
	VALUES	(	@report_nm, 'B', 'Yes', @report_nm, 'No',
				'R', 'No', 'R', 'O', 'O', 'O',
				'GenerateStateWiseSewadarList',
				1, 2, 3, 4, 5, 6,
				'GenericReportPortrait.rpt', 'GenericSummaryPortrait.rpt'
			)
-- =============================================================================

SET @report_nm = 'Country-wise Sewadars List';

INSERT INTO generic_reports
			(	report_nm, report_type, is_total_line, sewadar_list_nm, is_sewadar_list_ticked,
				is_satsang_centre, is_satsang_centre_multi_select, is_country, is_gender, is_sewadar_list,
				procedure_nm,
				satsang_centre_id_prm, satsang_centre_nm_prm, country_id_prm, gender_prm, sewadar_list_id_prm,
				details_report_file_nm, summary_report_file_nm
			)
	VALUES	(	@report_nm, 'B', 'Yes', @report_nm, 'No',
				'R', 'No', 'R', 'O', 'O',
				'GenerateCountryWiseSewadarList',
				1, 2, 3, 4, 5,
				'GenericReportPortrait.rpt', 'GenericSummaryPortrait.rpt'
			)
-- =============================================================================

SET @report_nm = 'List of Sewadars Acquired Age';

INSERT INTO generic_reports
			(	report_nm, report_type, is_total_line, sewadar_list_nm, is_sewadar_list_ticked,
				is_satsang_centre, is_satsang_centre_multi_select, is_gnc_dt1, gnc_dt1_label, is_gnc_dt1_show_difference, is_gnc_dt2, gnc_dt2_label, is_gnc_dt2_show_difference, is_gender, is_sewadar_list,
				procedure_nm,
				satsang_centre_id_prm, satsang_centre_nm_prm, gnc_dt1_prm, gnc_dt2_prm, gender_prm, sewadar_list_id_prm,
				details_report_file_nm, summary_report_file_nm
			)
	VALUES	(	@report_nm, 'B', 'Yes', @report_nm, 'No',
				'R', 'No', 'R', 'Males born before', 'Yes', 'R', 'Females born before', 'Yes', 'O', 'O',
				'GenerateSewadarsAcquiredAge',
				1, 2, 3, 4, 5, 6,
				'GenericReportPortrait.rpt', 'GenericSummaryPortrait.rpt'
			)
-- =============================================================================

SET @report_nm = 'List of Sewadars for an Age Group'

INSERT INTO generic_reports
			(	report_nm, report_type, sewadar_list_nm, is_sewadar_list_ticked,
				is_satsang_centre, is_satsang_centre_multi_select, is_department, is_department_multi_select, is_gnc_dt1, gnc_dt1_label, is_gnc_dt1_show_difference, 
				is_gnc_dt2, gnc_dt2_label, is_gnc_dt2_show_difference, is_gnc_boolean, gnc_boolean_label, is_gender, is_sewadar_list,
				procedure_nm,
				satsang_centre_id_prm, satsang_centre_nm_prm, department_id_prm, gnc_dt1_prm, gnc_dt2_prm, gnc_boolean_prm, gender_prm, sewadar_list_id_prm,
				details_report_file_nm, summary_report_file_nm
			)
	VALUES	(	@report_nm, 'B', @report_nm, 'No',
				'R', 'No', 'O', 'Yes', 'R', 'Born from', 'Yes', 
				'R', 'Born till', 'Yes', 'R', 'Only Non-Initiates', 'O', 'O',
				'GenerateSewadarListforAgeGroup',
				1, 2, 3, 4, 5, 6, 7, 8,
				'GenericReportPortrait.rpt', 'GenericSummaryPortrait.rpt'
			)
-- =============================================================================

SET @report_nm = 'Mobile Phone Report';

INSERT INTO generic_reports
			(	report_nm, report_group,
				is_satsang_centre, is_satsang_centre_multi_select, is_cnt_1, cnt_1_label, cnt_1_min_value, cnt_1_max_value, 
				is_cnt_2, cnt_2_label, cnt_2_min_value, cnt_2_max_value, is_sewadar_list,
				is_department, is_department_multi_select,is_sub_department, is_gender,
				procedure_nm,
				satsang_centre_id_prm, satsang_centre_nm_prm, cnt_1_prm, cnt_2_prm, sewadar_list_id_prm,
				department_id_prm, sub_department_id_prm, gender_prm,
				details_report_file_nm
			)
	VALUES	(	@report_nm, 1, 
				'R', 'No', 'R', 'Month', 1, 12, 
				'R', 'Year', 2001, 2100, 'O',
				'O', 'Yes', 'O', 'O',
				'GenerateMobilePhoneList',
				1, 2, 3, 4, 5, 6, 7, 8,
				'MobilePhoneReport.rpt'
			)
-- =============================================================================

SET @report_nm = 'New Sewadars List';

INSERT INTO generic_reports
			(	report_nm, report_type, is_total_line, sewadar_list_nm, is_sewadar_list_ticked,
				is_satsang_centre, is_satsang_centre_multi_select, is_start_dt, is_finish_dt, is_department, is_department_multi_select, is_sub_department,
				is_outstation_sewadar, is_gender, is_sewadar_type, is_sewadar_list,
				procedure_nm,
				start_dt_prm, finish_dt_prm,
				satsang_centre_id_prm, satsang_centre_nm_prm, department_id_prm, sub_department_id_prm,
				outstation_sewadar_prm, gender_prm, sewadar_type_nm_prm, sewadar_list_id_prm,
				details_report_file_nm, summary_report_file_nm
			)
	VALUES	(	@report_nm, 'B', 'Yes', @report_nm, 'No',
				'R', 'No', 'R', 'R', 'O', 'Yes', 'O', 'O', 'O', 'R', 'O',
				'GenerateNewSewadarsList',
				1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
				'GenericReportPortrait.rpt', 'GenericSummaryPortrait.rpt'
			)
-- =============================================================================

SET @report_nm = 'New Sewadars List (Alphabetical)';

INSERT INTO generic_reports
			(	report_nm,
				is_satsang_centre, is_satsang_centre_multi_select, is_start_dt, is_finish_dt,
				is_department, is_department_multi_select, is_sub_department, is_outstation_sewadar, is_gender, is_sewadar_type, is_sewadar_list,
				procedure_nm,
				start_dt_prm, finish_dt_prm,
				satsang_centre_id_prm, satsang_centre_nm_prm, department_id_prm, sub_department_id_prm,
				outstation_sewadar_prm, gender_prm, sewadar_type_nm_prm, sewadar_list_id_prm,
				details_report_file_nm
			)
	VALUES	(	@report_nm,
				'R', 'No', 'R', 'R',
				'O', 'Yes', 'O', 'O', 'O', 'R', 'O',
				'GenerateNewSewadarsAlphabeticalList',
				1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
				'GenericGroupReportPortrait.rpt'
			)
-- =============================================================================

SET @report_nm = 'Sewadars List (Status-wise)';

INSERT INTO generic_reports
			(	report_nm, report_type, is_total_line, sewadar_list_nm, is_sewadar_list_ticked,
				is_satsang_centre, is_satsang_centre_multi_select, is_department, is_department_multi_select, is_sub_department, is_status, is_status_multi_select, is_gender,
				is_cnt_1, cnt_1_label, cnt_1_min_value, cnt_1_max_value, is_cnt_2, cnt_2_label, cnt_2_min_value, cnt_2_max_value, is_sewadar_list,
				procedure_nm,
				satsang_centre_id_prm, satsang_centre_nm_prm, department_id_prm, sub_department_id_prm, status_prm, gender_prm, cnt_1_prm, cnt_2_prm, sewadar_list_id_prm,
				details_report_file_nm, summary_report_file_nm
			)
	VALUES	(	@report_nm, 'B', 'Yes', @report_nm, 'No',
				'R', 'No', 'O', 'Yes', 'O', 'R', 'Yes', 'O',
				'O', 'Appoints. From Yr', 1960, 2050,
				'O', 'Appoints. Till Yr', 1960, 2050, 'O',
				'GenerateSewadarList',
				1, 2, 3, 4, 5, 6, 7, 8, 9,
				'GenericReportPortrait.rpt', 'GenericSummaryPortrait.rpt'
			)
-- =============================================================================

SET @report_nm = 'Heads of Departments Attendance List';

INSERT INTO generic_reports
			(	report_nm, report_group,
				is_satsang_centre, is_satsang_centre_multi_select, is_gender, is_gnc_boolean, gnc_boolean_label,
				procedure_nm,
				satsang_centre_id_prm, satsang_centre_nm_prm, gender_prm, gnc_boolean_prm,
				is_eject_page, report_ordering,
				details_report_file_nm
			)
	VALUES	(	@report_nm, 3,
				'R', 'No', 'O', 'R', 'Attendance List',
				'GenerateHODsList',
				1, 2, 3, 4,
				'No', 'IF TRIM({sewadars_registrations.responsibility}) = ''Head'' THEN 1 ELSE IF ({sewadars_registrations.responsibility}) = ''Second Head'' THEN 2 ELSE IF ({sewadars_registrations.responsibility}) = ''Third Head'' THEN 3 ELSE 4',
				'GenericReportPortrait.rpt'
			)
-- =============================================================================

SET @report_nm = 'Heads of Departments List';

INSERT INTO generic_reports
			(	report_nm, report_group,
				is_satsang_centre, is_satsang_centre_multi_select, is_gender,
				procedure_nm,
				satsang_centre_id_prm, satsang_centre_nm_prm, gender_prm,
				is_eject_page, report_ordering,
				details_report_file_nm
			)
	VALUES	(	@report_nm, 3,
				'R', 'No', 'O',
				'GenerateHODs',
				1, 2, 3,
				'No', 'IF TRIM({sewadars_registrations.responsibility}) = ''Head'' THEN 1 ELSE IF ({sewadars_registrations.responsibility}) = ''Second Head'' THEN 2 ELSE IF ({sewadars_registrations.responsibility}) = ''Third Head'' THEN 3 ELSE 4',
				'GenericReportPortrait.rpt'
			)
-- =============================================================================

SET @report_nm = 'List of Badges Printed';

INSERT INTO generic_reports
			(	report_nm, report_group,
				is_satsang_centre, is_satsang_centre_multi_select, is_start_dt, is_finish_dt, is_gender, is_badge_template,
				is_cnt_1, cnt_1_label, cnt_1_min_value, cnt_1_max_value,
				is_cnt_2, cnt_2_label, cnt_2_min_value, cnt_2_max_value, is_sewadar_list,
				procedure_nm,
				satsang_centre_id_prm, satsang_centre_nm_prm, start_dt_prm, finish_dt_prm, gender_prm, cnt_1_prm, cnt_2_prm, badge_template_id_prm, badge_template_nm_prm, sewadar_list_id_prm,
				details_report_file_nm
			)
	VALUES	(	@report_nm, 3,
				'R', 'No', 'R', 'R', 'O', 'R',
				'O', 'Start Time 0000-2300', 0, 2359, 
				'O', 'End Time 0000-2300', 0, 2359, 'O',
				'GenerateBadgesPrintedList',
				1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
				'GenericReportPortrait.rpt'
			)
-- =============================================================================

SET @report_nm = 'Photos Comparison Report';

INSERT INTO generic_reports
			(	report_nm, report_group,
				is_satsang_centre, is_satsang_centre_multi_select, is_start_dt, is_finish_dt, is_gender, is_badge_template,
				is_cnt_1, cnt_1_label, cnt_1_min_value, cnt_1_max_value,
				is_cnt_2, cnt_2_label, cnt_2_min_value, cnt_2_max_value, is_sewadar_list, gnc_dt1_label, is_gnc_dt1,
				is_department, is_department_multi_select, is_status, is_status_multi_select,
				procedure_nm,
				satsang_centre_id_prm, satsang_centre_nm_prm, start_dt_prm, finish_dt_prm, gender_prm, cnt_1_prm, cnt_2_prm,
				badge_template_id_prm, badge_template_nm_prm, sewadar_list_id_prm, gnc_dt1_prm, department_id_prm, status_prm,
				details_report_file_nm
			)
	VALUES	(	@report_nm, 3,
				'R', 'No', 'R', 'R', 'O', 'R',
				'O', 'Start Time 0000-2300', 0, 2359,
				'O', 'End Time 0000-2300', 0, 2359, 'O', 'Photo on or after', 'R',
				'O', 'No', 'R', 'Yes',
				'GeneratePhotosComparisonReport',
				1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13,
				'GenericReportPortrait.rpt'
			)
-- =============================================================================

SET @report_nm = 'List of Badges Not Printed';

INSERT INTO generic_reports
			(	report_nm, report_group,
				is_satsang_centre, is_satsang_centre_multi_select, is_start_dt, is_finish_dt, is_gender, is_badge_template,
				is_cnt_1, cnt_1_label, cnt_1_min_value, cnt_1_max_value,
				is_cnt_2, cnt_2_label, cnt_2_min_value, cnt_2_max_value, is_gnc_dt1, gnc_dt1_label, is_outstation_sewadar,
				procedure_nm,
				satsang_centre_id_prm, satsang_centre_nm_prm, start_dt_prm, finish_dt_prm, gender_prm, cnt_1_prm, cnt_2_prm, badge_template_id_prm, badge_template_nm_prm, gnc_dt1_prm, outstation_sewadar_prm,
				details_report_file_nm
			)
	VALUES	(	@report_nm, 3,
				'R', 'No', 'R', 'R', 'O', 'R',
				'O', 'Start Time 0000-2300', 0, 2359, 
				'O', 'End Time 0000-2300', 0, 2359, 'O', 'Photo taken after', 'O',
				'GenerateBadgesNotPrintedList',
				1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11,
				'GenericReportPortrait.rpt'
			)
-- =============================================================================

SET @report_nm = 'List of Departments';

INSERT INTO generic_reports
			(	report_nm, report_type, report_group,
				is_satsang_centre, is_satsang_centre_multi_select, is_gnc_boolean, gnc_boolean_label, 
				is_eject_page, procedure_nm,
				satsang_centre_id_prm, satsang_centre_nm_prm, gnc_boolean_prm,
				summary_report_file_nm
			)
	VALUES	(	@report_nm, 'S',  3,
				'R', 'No', 'R', 'Split By Gender',
				'No', 'GenerateDepartmentsList',
				1, 2, 3,
				'GenericSynopsisPortrait.rpt'
			)
-- =============================================================================

SET @report_nm = 'Photos taken List of Sewadars (Name-wise)';

INSERT INTO generic_reports
			(	report_nm, report_group, report_type, is_total_line,
				is_satsang_centre, is_satsang_centre_multi_select, is_start_dt, is_finish_dt, is_gender,
				procedure_nm,
				satsang_centre_id_prm, satsang_centre_nm_prm, start_dt_prm, finish_dt_prm, gender_prm,
				details_report_file_nm, summary_report_file_nm
			)
	VALUES	(	@report_nm, 3, 'B', 'Yes',
				'R', 'No', 'R', 'R', 'O',
				'GeneratePhotosTakenList',
				1, 2, 3, 4, 5,
				'GenericReportPortrait.rpt', 'GenericSummaryPortrait.rpt'
			)
-- =============================================================================

SET @report_nm = 'Sewa Teams List';

INSERT INTO generic_reports
			(	report_nm, report_type, report_group, is_eject_page,
				is_satsang_centre, is_satsang_centre_multi_select, is_sewa,
				procedure_nm,  
				satsang_centre_id_prm, satsang_centre_nm_prm, sewa_id_prm,
				summary_report_file_nm
			)
	VALUES	(	@report_nm, 'S', 3, 'No',
				'R', 'No', 'R',
				'GenerateSewaTeamList',
				1, 2, 3,
				'GenericSynopsisPortrait.rpt'
			)
-- =============================================================================

SET @report_nm = 'Sewadars Status Change List';

INSERT INTO generic_reports
			(	report_nm, report_group,
				is_satsang_centre, is_satsang_centre_multi_select, is_start_dt, is_finish_dt, is_status, is_gender,
				procedure_nm,
				satsang_centre_id_prm, satsang_centre_nm_prm, start_dt_prm, finish_dt_prm, status_prm, gender_prm,
				details_report_file_nm
			)
	VALUES	(	@report_nm, 3,
				'R', 'No', 'R', 'R', 'O', 'O',
				'GenerateStatusChangeList',
				1, 2, 3, 4, 5, 6,
				'GenericReportPortrait.rpt'
			)
-- =============================================================================

SET @report_nm = 'Sewadars Transfers-In List';

INSERT INTO generic_reports
			(	report_nm, report_group,
				is_satsang_centre, is_satsang_centre_multi_select, is_start_dt, is_finish_dt, is_gender, is_gnc_boolean, gnc_boolean_label, default_gnc_boolean,
				procedure_nm,
				satsang_centre_id_prm, satsang_centre_nm_prm, start_dt_prm, finish_dt_prm, gender_prm, gnc_boolean_prm,
				details_report_file_nm
			)
	VALUES	(	@report_nm, 3,
				'R', 'No', 'R', 'R', 'O', 'R', 'Consider Sub-Dept?', 'Yes',
				'GenerateTransfersInList',
				1, 2, 3, 4, 5, 6,
				'GenericReportPortrait.rpt'
			)
-- =============================================================================

SET @report_nm = 'List of Sewadars (Non-initiated)';

INSERT INTO generic_reports
			(	report_nm, report_group,
				is_satsang_centre, is_satsang_centre_multi_select, is_department, is_department_multi_select, is_sub_department, 
				is_gnc_dt1, gnc_dt1_label, is_gnc_dt1_show_difference, is_gnc_dt2, gnc_dt2_label, is_gnc_dt2_show_difference,
				procedure_nm,
				satsang_centre_id_prm, satsang_centre_nm_prm, department_id_prm, sub_department_id_prm, gnc_dt1_prm, gnc_dt2_prm,
				details_report_file_nm
			)
	VALUES	(	@report_nm, 4,
				'R', 'No', 'O', 'Yes', 'O', 
				'R', 'Males born before', 'Yes', 'R', 'Females born before', 'Yes',
				'GenerateNonInitiateSewadarList',
				1, 2, 3, 4, 5, 6,
				'GenericReportPortrait.rpt'
			)
-- =============================================================================

SET @report_nm = 'List of Initiated Sewadars with Status as NI';

INSERT INTO generic_reports
			(	report_nm, report_group,
				is_satsang_centre, is_satsang_centre_multi_select, is_department, is_department_multi_select, is_sub_department, 
				procedure_nm,
				satsang_centre_id_prm, satsang_centre_nm_prm, department_id_prm, sub_department_id_prm,
				details_report_file_nm
			)
	VALUES	(	@report_nm, 4,
				'R', 'No', 'O', 'Yes', 'O', 
				'GenerateInitiatedNISewadarList',
				1, 2, 3, 4,
				'GenericReportPortrait.rpt'
			)
-- =============================================================================

SET @report_nm = 'List of Sewadars with Remarks';

INSERT INTO generic_reports
			(	report_nm, report_group, 
				is_satsang_centre, is_satsang_centre_multi_select, is_gender, is_remarks_type, is_sewadar_list,
				procedure_nm, 
				satsang_centre_id_prm, satsang_centre_nm_prm, gender_prm, remarks_type_prm, sewadar_list_id_prm,
				details_report_file_nm
			)
	VALUES	(	@report_nm, 3, 
				'R', 'No', 'O', 'R', 'O',
				'GenerateSewadarsListWithRemarks',
				1, 2, 3, 4, 5,
				'GenericReportPortrait.rpt'
			)
-- =============================================================================


SET @report_nm = 'Sewadars with missing Remarks Type';

INSERT INTO generic_reports
			(	report_nm, report_group, 
				is_satsang_centre, is_satsang_centre_multi_select, is_remarks_type,
				procedure_nm, 
				satsang_centre_id_prm, satsang_centre_nm_prm, remarks_type_prm,
				details_report_file_nm
			)
	VALUES	(	@report_nm, 4, 
				'R', 'No', 'R',
				'GenerateSewadarsListWithMissingRemarks',
				1, 2, 3,
				'GenericListReportPortrait.rpt'
			)
-- =============================================================================

-- =============================================================================

SET @report_nm = 'Data Migration Report';

INSERT INTO generic_reports
			(	report_nm, report_group, 
				is_satsang_centre, is_satsang_centre_multi_select, is_sewadar_list,
				procedure_nm,
				satsang_centre_id_prm, satsang_centre_nm_prm, sewadar_list_id_prm,
				details_report_file_nm
			)
	VALUES	(	@report_nm, 3, 
				'R', 'No', 'R',
				'GenerateDataMigrationReport',
				1, 2, 3,
				'GenericReportPortraitWODept.rpt'
			)

-- =============================================================================

SET @report_nm = 'Bulk Registration Report';

INSERT INTO generic_reports
			(	report_nm, report_group, 
				is_satsang_centre, is_satsang_centre_multi_select, is_sewadar_list,
				procedure_nm,
				satsang_centre_id_prm, satsang_centre_nm_prm, sewadar_list_id_prm,
				details_report_file_nm
			)
	VALUES	(	@report_nm, 3, 
				'R', 'No', 'R',
				'GenerateBulkRegistrationReport',
				1, 2, 3,
				'GenericReportPortraitWODept.rpt'
			)
-- =============================================================================

SET @report_nm = 'Sewadars who have not clicked Photos';

INSERT INTO generic_reports
			(	report_nm, report_group,
				is_satsang_centre, is_satsang_centre_multi_select, is_department, is_department_multi_select, is_sub_department, is_outstation_sewadar, is_gender, is_gnc_dt1, gnc_dt1_label,
				procedure_nm,
				satsang_centre_id_prm, satsang_centre_nm_prm, department_id_prm, sub_department_id_prm, outstation_sewadar_prm, gender_prm, gnc_dt1_prm,
				details_report_file_nm
			)
	VALUES	(	@report_nm, 4,
				'R', 'No', 'O', 'Yes', 'O', 'O', 'O', 'R', 'Not clicked after',
				'GenerateSewadarsPhotoNotClickd',
				1, 2, 3, 4, 5, 6, 7,
				'GenericListReportPortrait.rpt'
			)
-- =============================================================================

SET @report_nm = 'Sewadars without Attendance';

INSERT INTO generic_reports
			(	report_nm, report_group,
				is_satsang_centre, is_satsang_centre_multi_select, is_department, is_department_multi_select, is_sub_department, is_outstation_sewadar, is_gender, is_sewa,
				procedure_nm,
				satsang_centre_id_prm, satsang_centre_nm_prm, department_id_prm, sub_department_id_prm, outstation_sewadar_prm, gender_prm, sewa_id_prm,
				details_report_file_nm
			)
	VALUES	(	@report_nm, 4,
				'R', 'No', 'O', 'Yes', 'O', 'O', 'O', 'R',
				'GenerateSewadarsWithoutAttendance',
				1, 2, 3, 4, 5, 6, 7,
				'GenericReportPortrait.rpt'
			)
-- =============================================================================

SET @report_nm = 'Temporary Sewadars who may be made Permanent';

INSERT INTO generic_reports
			(	report_nm, report_group,
				is_satsang_centre, is_satsang_centre_multi_select, is_department, is_department_multi_select, is_sub_department, is_outstation_sewadar, is_gender, is_gnc_dt1, gnc_dt1_label,
				procedure_nm,
				satsang_centre_id_prm, satsang_centre_nm_prm, department_id_prm, sub_department_id_prm, outstation_sewadar_prm, gender_prm, gnc_dt1_prm,
				details_report_file_nm
			)
	VALUES	(	@report_nm, 3,
				'R', 'No', 'O', 'Yes', 'O', 'O', 'O', 'R', 'Appointments before',
				'GenerateTempSewadarsToBeMadePerm',
				1, 2, 3, 4, 5, 6, 7,
				'GenericReportPortrait.rpt'
			)
-- =============================================================================

SET @report_nm = 'Sewadars who have NOT returned badges';

INSERT INTO generic_reports
			(	report_nm, report_group,
				is_satsang_centre, is_satsang_centre_multi_select, is_department, is_department_multi_select, is_sub_department, is_outstation_sewadar, is_gender,
				is_sewadar_list, is_gnc_dt1, gnc_dt1_label,
				procedure_nm,
				satsang_centre_id_prm, satsang_centre_nm_prm, department_id_prm, sub_department_id_prm, outstation_sewadar_prm, gender_prm, sewadar_list_id_prm, gnc_dt1_prm,
				details_report_file_nm
			)
	VALUES	(	@report_nm, 4,
				'R', 'No', 'O', 'Yes', 'O', 'O', 'O', 'R', 'R', 'Photos taken after',
				'GenerateBadgesNotReturnedSewadars',
				1, 2, 3, 4, 5, 6, 7, 8,
				'GenericReportPortrait.rpt'
			)
-- =============================================================================

SET @report_nm = 'Regular Sewadars who may be made Inactive';

INSERT INTO generic_reports
			(	report_nm, report_group,
				is_satsang_centre, is_satsang_centre_multi_select, is_department, is_department_multi_select, is_sub_department, is_outstation_sewadar, is_gender, is_gnc_dt1, gnc_dt1_label,
				is_cnt_1, cnt_1_label, cnt_1_min_value, cnt_1_max_value,
				procedure_nm,
				satsang_centre_id_prm, satsang_centre_nm_prm, department_id_prm, sub_department_id_prm, outstation_sewadar_prm, gender_prm, gnc_dt1_prm, cnt_1_prm,
				details_report_file_nm
			)
	VALUES	(	@report_nm, 3,
				'R', 'No', 'O', 'Yes', 'O', 'O', 'O', 'R', 'Sewas after',
				'R', 'Max. days of Sewa', 0, 100,
				'GenerateSewadarsToBeMadeInactive',
				1, 2, 3, 4, 5, 6, 7, 8,
				'GenericReportPortrait.rpt'
			)
-- =============================================================================

SET @report_nm = 'Department / Sub-Department-wise Sewadars Summary';

INSERT INTO generic_reports
			(	report_nm, report_type, is_eject_page, is_total_line,
				is_satsang_centre, is_satsang_centre_multi_select, is_outstation_sewadar, is_sewadar_type, is_sewadar_list, 
				procedure_nm,
				satsang_centre_id_prm, satsang_centre_nm_prm, outstation_sewadar_prm, sewadar_type_nm_prm, sewadar_list_id_prm,
				summary_report_file_nm
			)
	VALUES	(	@report_nm, 'S', 'No', 'Yes',
				'R', 'No', 'O', 'R', 'R',
				'SummariseSubDeptSewadarsCount',
				1, 2, 3, 4, 5,
				'GenericSummaryPortrait.rpt'
			)
-- =============================================================================

SET @report_nm = 'Location-wise Open Sewadars Summary';

INSERT INTO generic_reports
			(	report_nm, report_type, is_eject_page, is_total_line,
				is_satsang_centre, is_satsang_centre_multi_select, is_outstation_sewadar,
				procedure_nm,
				satsang_centre_id_prm, satsang_centre_nm_prm, outstation_sewadar_prm,
				summary_report_file_nm
			)
	VALUES	(	@report_nm, 'S', 'No', 'Yes',
				'R', 'No', 'O',
				'SummariseLocationWiseOpenSewadars',
				1, 2, 3,
				'GenericSummaryPortrait.rpt'
			)
-- =============================================================================

SET @report_nm = 'Location-wise Trainee Sewadars Summary';

INSERT INTO generic_reports
			(	report_nm, report_type, is_eject_page, is_total_line,
				is_satsang_centre, is_satsang_centre_multi_select, is_outstation_sewadar,
				procedure_nm,
				satsang_centre_id_prm, satsang_centre_nm_prm, outstation_sewadar_prm,
				summary_report_file_nm
			)
	VALUES	(	@report_nm, 'S', 'No', 'Yes',
				'R', 'No', 'O',
				'SummariseLocationWiseTraineeSewadars',
				1, 2, 3,
				'GenericSummaryPortrait.rpt'
			)
-- =============================================================================

SET @report_nm = 'Status-wise Sewadars Summary';

INSERT INTO generic_reports
			(	report_nm, report_type, is_eject_page, is_total_line,
				is_satsang_centre, is_satsang_centre_multi_select, is_sewadar_list,
				procedure_nm,
				satsang_centre_id_prm, satsang_centre_nm_prm, sewadar_list_id_prm,
				summary_report_file_nm
			)
	VALUES	(	@report_nm, 'S', 'No', 'Yes',
				'R', 'No', 'O',
				'SummariseSewadarStatusCount',
				1, 2, 3,
				'GenericSummaryPortrait.rpt'
			)
-- =============================================================================

SET @report_nm = 'Weekly Sewadars List';

INSERT INTO generic_reports
			(	report_nm, report_type, is_total_line,
				is_satsang_centre, is_satsang_centre_multi_select, is_department, is_department_multi_select, is_sub_department, is_weekly_sewa_location, is_gender,
				procedure_nm,
				satsang_centre_id_prm, satsang_centre_nm_prm, department_id_prm, sub_department_id_prm,  
				weekly_sewa_location_id_prm, weekly_sewa_location_nm_prm, gender_prm,
				details_report_file_nm, summary_report_file_nm
			)
	VALUES	(	@report_nm, 'B', 'Yes',
				'R', 'No', 'O', 'Yes', 'O', 'R', 'O',
				'GenerateWeeklySewadarList',
				1, 2, 3, 4, 5, 6, 7,
				'GenericReportPortrait.rpt', 'GenericSummaryPortrait.rpt'
			)
-- =============================================================================

SET @report_nm = 'First Heads of Departments List';

INSERT INTO generic_reports
			(	report_nm, report_group, is_eject_page,
				is_satsang_centre, is_satsang_centre_multi_select, is_gender,
				procedure_nm, 
				satsang_centre_id_prm, satsang_centre_nm_prm, gender_prm,
				details_report_file_nm
			)
	VALUES	(	@report_nm, 3, 'No', 
				'R', 'No', 'O',
				'GenerateFirstHeadsList', 
				1, 2, 3,
				'GenericReportPortrait.rpt'
			)
-- =============================================================================

SET @report_nm = 'Sewadars Responsibility Change List';

INSERT INTO generic_reports
			(	report_nm, report_group,
				is_satsang_centre, is_satsang_centre_multi_select, is_start_dt, is_finish_dt, is_gender,
				procedure_nm,
				satsang_centre_id_prm, satsang_centre_nm_prm, start_dt_prm, finish_dt_prm, gender_prm,
				details_report_file_nm
			)
	VALUES	(	@report_nm, 3,
				'R', 'No', 'R', 'R', 'O',
				'GenerateRspnsbltyChangeList',
				1, 2, 3, 4, 5,
				'GenericReportPortrait.rpt'
			)
-- =============================================================================

SET @report_nm = 'Scanned Attendance for a Shift';

INSERT INTO generic_reports
			(	report_nm, report_type, report_group,
				is_sewa, is_sewa_shift, is_gnc_dt1, gnc_dt1_label,
				procedure_nm,
				sewa_id_prm, sewa_shift_prm, gnc_dt1_prm,
				details_report_file_nm, summary_report_file_nm
			)
	VALUES	(	@report_nm, 'B', 2,
				'R', 'R', 'R', 'Date of Sewa',
				'GenerateConstructionAttendance',
				1, 2, 3,
				'GenericReportPortrait.rpt', 'GenericSummaryPortrait.rpt'
			)
-- =============================================================================

SET @report_nm = 'Heads of Departments List (Age & DOR)';

INSERT INTO generic_reports
			(	report_nm, report_group, is_eject_page, 
				is_satsang_centre, is_satsang_centre_multi_select, is_gender,
				procedure_nm, 
				satsang_centre_id_prm, satsang_centre_nm_prm, gender_prm,
				report_ordering,
				details_report_file_nm
			)
	VALUES	(	@report_nm, 3, 'No',
				'R', 'No', 'O',
				'GenerateHODsListwithDORAge', 
				1, 2, 3,
				'IF TRIM({sewadars_registrations.responsibility}) = ''Head'' THEN 1 ELSE IF ({sewadars_registrations.responsibility}) = ''Second Head'' THEN 2 ELSE IF ({sewadars_registrations.responsibility}) = ''Third Head'' THEN 3 ELSE 4',
				'GenericReportPortrait.rpt'
			)
-- =============================================================================

SET @report_nm = 'List of Sub-Departments';

INSERT INTO generic_reports
			(	report_nm, report_type, is_eject_page, report_group,
				is_satsang_centre, is_satsang_centre_multi_select, is_gender,
				procedure_nm,
				satsang_centre_id_prm, satsang_centre_nm_prm, gender_prm,
				summary_report_file_nm
			)
	VALUES	(	@report_nm, 'S', 'No', 3,
				'R', 'No', 'O',
				'GenerateSubDepartmentsList',
				1, 2, 3,
				'GenericSynopsisPortrait.rpt'
			)
-- =============================================================================

SET @report_nm = 'Sewa Summary';

INSERT INTO generic_reports
			(	report_nm, report_type, report_group,
				is_sewa, is_gnc_boolean, gnc_boolean_label,
				procedure_nm,
				sewa_id_prm, sewa_nm_prm, gnc_boolean_prm,
				summary_report_file_nm
			)
	VALUES	(	@report_nm, 'S', 2, 
				'R', 'R', 'Exemption Allowed',
				'GenerateSewaSummary',
				1, 2, 3,
				'GenericSynopsisPortrait.rpt'
			)
-- =============================================================================

SET @report_nm = 'Sewadars List';

INSERT INTO generic_reports
			(	report_nm, report_type, is_sewadar_list, is_gnc_boolean, gnc_boolean_label, default_gnc_boolean,
				is_department, is_department_multi_select, is_sub_department, is_gender,
				procedure_nm,
				sewadar_list_id_prm, gnc_boolean_prm, department_id_prm, department_nm_prm, sub_department_id_prm, sub_department_nm_prm, gender_prm,
				details_report_file_nm, summary_report_file_nm
			)
	VALUES	(	@report_nm, 'B', 'R', 'R', 'Summarise Dept-wise?', 'Yes',
				'O', 'Yes', 'O', 'O',
				'GenerateSewadarListReport',
				1, 2, 3, 4, 5, 6, 7,
				'GenericListReportPortrait.rpt', 'GenericSummaryPortrait.rpt'
			)

-- =============================================================================

SET @report_nm = 'Sewadars List (G.R.No.-wise)';

INSERT INTO generic_reports
			(	report_nm, report_type, is_sewadar_list, procedure_nm,
				sewadar_list_id_prm,  details_report_file_nm
			)
	VALUES	(	@report_nm, 'D', 'R', 'GenerateSewadarListGRNoWise',
				1, 'GenericGroupReportPortrait.rpt'
			)

-- =============================================================================
SET @report_nm = 'Sewadars Team List';

INSERT INTO generic_reports
			(	report_nm, sewadar_list_nm, is_sewadar_list_ticked,
				is_satsang_centre, is_satsang_centre_multi_select, is_department, is_department_multi_select, is_sub_department,
				is_status, is_status_multi_select, is_district,
				is_outstation_sewadar, is_gender, is_gnc_boolean, gnc_boolean_label, default_gnc_boolean, is_sewa,
				procedure_nm,
				satsang_centre_id_prm, satsang_centre_nm_prm, department_id_prm, department_nm_prm, sub_department_id_prm, sub_department_nm_prm, status_prm, district_id_prm,
				outstation_sewadar_prm, gender_prm, gnc_boolean_prm, sewa_id_prm,
				details_report_file_nm
			)
	VALUES	(	@report_nm, @report_nm, 'No',
				'R', 'No', 'R', 'No', 'O',
				'O', 'Yes', 'O',
				'O', 'O', 'O', 'Directly make team?', 'Yes', 'O', 
				'GenerateTeamList',
				1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12,
				'GenericReportPortrait.rpt'
			)

-- =============================================================================

SET @report_nm = 'Other Sewadars List';

INSERT INTO generic_reports
			(	report_nm, report_group,
				is_satsang_centre, is_satsang_centre_multi_select, is_department, is_department_multi_select, is_sub_department, is_outstation_sewadar, is_gender, is_sewadar_list,
				procedure_nm,
				satsang_centre_id_prm, satsang_centre_nm_prm, department_id_prm, sub_department_id_prm, outstation_sewadar_prm , gender_prm, sewadar_list_id_prm,
				details_report_file_nm
			)
	VALUES	(	@report_nm, 4,
				'R', 'No', 'R', 'Yes', 'O', 'O', 'O', 'O',
				'GenerateOtherSewadarRegister',
				1, 2, 3, 4, 5, 6, 7,
				'GenericReportPortrait.rpt'
			)
-- =============================================================================

SET @report_nm = 'List of Sewadars in InActive Departments';

INSERT INTO generic_reports
			(	report_nm, report_group, report_type, is_total_line,
				is_satsang_centre, is_satsang_centre_multi_select, is_status, is_status_multi_select, is_gender,
				procedure_nm,
				satsang_centre_id_prm, satsang_centre_nm_prm, status_prm, gender_prm,
				details_report_file_nm, summary_report_file_nm
			)
	VALUES	(	@report_nm, 4, 'B', 'Yes',
				'R', 'No', 'O', 'Yes', 'O',
				'GenerateInActiveDeptSewadars',
				1, 2, 3, 4,
				'GenericReportPortrait.rpt', 'GenericSummaryPortrait.rpt'
			)
-- =============================================================================

SET @report_nm = 'List of Sewadars with Missing Addresses';

INSERT INTO generic_reports
			(	report_nm, report_group, report_type, is_total_line,
				is_satsang_centre, is_satsang_centre_multi_select, is_status, is_status_multi_select, is_gender,
				procedure_nm,
				satsang_centre_id_prm, satsang_centre_nm_prm, status_prm, gender_prm,
				details_report_file_nm, summary_report_file_nm
			)
	VALUES	(	@report_nm, 4, 'B', 'Yes',
				'R', 'No', 'O', 'Yes', 'O',
				'GenerateMissingAddressesList',
				1, 2, 3, 4,
				'GenericListReportPortrait.rpt', 'GenericSummaryPortrait.rpt'
			)
-- =============================================================================

SET @report_nm = 'Specialisation Area-wise Sewadars List';

INSERT INTO generic_reports
			(	report_nm,
				is_satsang_centre, is_satsang_centre_multi_select, is_skill, is_gender, is_sewadar_list,
				procedure_nm,
				satsang_centre_id_prm, satsang_centre_nm_prm, skill_id_prm, skill_nm_prm, gender_prm, sewadar_list_id_prm,
				details_report_file_nm
			)
	VALUES	(	@report_nm,
				'R', 'No', 'R', 'O', 'O',
				'GenerateSpclstnAreaSewadarList',
				1, 2, 3, 4, 5, 6,
				'GenericReportPortrait.rpt'
			)
-- =============================================================================

SET @report_nm = 'Qualification Category-wise Sewadars List';

INSERT INTO generic_reports
			(	report_nm,
				is_satsang_centre, is_satsang_centre_multi_select, is_qualification_type, is_gender, is_sewadar_list, 
				procedure_nm,
				satsang_centre_id_prm, satsang_centre_nm_prm, qualification_type_prm, gender_prm, sewadar_list_id_prm,
				details_report_file_nm
			)
	VALUES	(	@report_nm,
				'R', 'No', 'R', 'O', 'O',
				'GenerateQlfctnCtgrySewadarList',
				1, 2, 3, 4, 5,
				'GenericReportPortrait.rpt'
			)
-- =============================================================================

SET @report_nm = 'Sewadars List of Sewa Summary'

INSERT INTO generic_reports
			(	report_nm, report_type, report_group, is_total_line,
				is_sewa, is_cnt_1, cnt_1_label, cnt_1_min_value, cnt_1_max_value,
				is_cnt_2, cnt_2_label, cnt_2_min_value, cnt_2_max_value, is_department, is_department_multi_select, is_sub_department ,
				is_gender, is_outstation_sewadar,
				procedure_nm,
				sewa_id_prm, cnt_1_prm, cnt_2_prm, department_id_prm, sub_department_id_prm, outstation_sewadar_prm, gender_prm,
				details_report_file_nm, summary_report_file_nm
			)
	VALUES	(	@report_nm, 'B', 2, 'Yes',
				'R', 'R', 'Min. days', 0, 100, 'R', 'Max. days', 0, 2000, 'R', 'Yes', 'O',
				'O', 'O',
				'GenerateSewaSummarySewadarList',
				1, 2, 3, 4, 5, 6, 7,
				'GenericReportPortrait.rpt', 'GenericSummaryPortrait.rpt'
			)

-- =============================================================================

INSERT INTO generic_reports
			(	report_nm, report_type, report_group,
				is_satsang_centre, is_satsang_centre_multi_select, is_department, is_department_multi_select, is_sub_department, is_outstation_sewadar, is_gender,
				is_sewa, is_start_dt, is_finish_dt, is_area, is_gnc_boolean, gnc_boolean_label, default_gnc_boolean,
				procedure_nm,
				satsang_centre_id_prm, department_id_prm, sub_department_id_prm, outstation_sewadar_prm, gender_prm,
				sewa_id_prm, start_dt_prm, finish_dt_prm, area_id_prm, area_nm_prm, gnc_boolean_prm,
				details_report_file_nm, summary_report_file_nm
			)
	VALUES	(	'Scanned Attendance in Range', 'B', 2,
				'R', 'No', 'O', 'Yes', 'O', 'O', 'O',
				'R', 'R', 'R', 'O', 'R', 'W/o Prv Day OS Swdrs', 'No',
				'GenerateAttndncSummryBtwnRange',
				1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11,
				'GenericReportPortrait.rpt', 'GenericSynopsisPortrait.rpt'
			)

-- =============================================================================

INSERT INTO generic_reports
			(	report_nm, report_type, report_group,
				is_satsang_centre, is_satsang_centre_multi_select, is_department, is_department_multi_select, is_sub_department, is_outstation_sewadar, is_gender,
				is_sewa, is_start_dt, is_finish_dt, is_area, is_gnc_boolean, gnc_boolean_label, default_gnc_boolean,
				procedure_nm,
				satsang_centre_id_prm, department_id_prm, sub_department_id_prm, outstation_sewadar_prm, gender_prm,
				sewa_id_prm, start_dt_prm, finish_dt_prm, area_id_prm, area_nm_prm, gnc_boolean_prm,
				details_report_file_nm, summary_report_file_nm
			)
	VALUES	(	'Scanned Attendance in Range (Area-wise)', 'B', 2,
				'R', 'No', 'O', 'Yes', 'O', 'O', 'O',
				'R', 'R', 'R', 'O', 'R', 'W/o Prv Day OS Swdrs', 'No',
				'GenerateAttndncSummryBtwnRangeAreaWise',
				1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11,
				'GenericGroupReportPortrait.rpt', 'GenericSynopsisPortrait.rpt'
			)

-- =============================================================================

INSERT INTO generic_reports
			(	report_nm, report_type, report_group,
				is_sewa, is_finish_dt,
				procedure_nm,
				sewa_id_prm,  finish_dt_prm,
				details_report_file_nm, summary_report_file_nm
			)
	VALUES	(	'Arbitrary Attendance Completed Till Date', 'B', 2,
				'R', 'R',
				'GenerateAttndncCompletedTillDate',
				1, 3, 
				'GenericReportPortrait.rpt', 'GenericSummaryPortrait.rpt'
			)


-- =============================================================================

INSERT INTO generic_reports
			(	report_nm, report_group, report_type,
				is_sewa, is_start_dt, is_finish_dt,
				procedure_nm,
				sewa_id_prm, start_dt_prm, finish_dt_prm,
				summary_report_file_nm
			)
	VALUES	(	'Construction Attendance Summary', 2, 'S',
				'R', 'R', 'R',
				'GenerateCnstrctnAttndncSummary',
				1, 2, 3,
				'GenericSynopsisPortrait.rpt'
			)

-- =============================================================================

INSERT INTO generic_reports
			(	report_nm, report_group, report_type,
				is_sewa, is_gnc_dt1, gnc_dt1_label, is_gnc_dt1_default_current_date, is_gnc_boolean, gnc_boolean_label,
				procedure_nm,
				sewa_id_prm, gnc_dt1_prm, gnc_boolean_prm,
				summary_report_file_nm
			)
	VALUES	(	'Daily Department-wise Summary', 2, 'S',
				'R', 'R', 'Date of Sewa', 'Yes', 'O', 'Shift-wise',
				'GenerateDailyDeptWiseSummary',
				1, 2, 3,
				'GenericSynopsisPortrait.rpt'
			)
-- =============================================================================

INSERT INTO generic_reports
			(	report_nm, report_type, is_eject_page, report_group, is_total_line,
				is_sewa, is_status, is_status_multi_select, is_outstation_sewadar, is_gender,
				procedure_nm,
				sewa_id_prm, status_prm, outstation_sewadar_prm, gender_prm,
				summary_report_file_nm
			)
	VALUES	(	'Turn-out Summary for Daily Sewas', 'S', 'No', 2, 'Yes',
				'R', 'O', 'Yes', 'O', 'O',
				'GenerateDailySewaTurnOut',
				1, 2, 3, 4,
				'GenericSynopsisPortrait.rpt'
			)
-- =============================================================================

INSERT INTO generic_reports
			(	report_nm, report_type, is_eject_page, is_total_line,
				is_satsang_centre, is_satsang_centre_multi_select, is_outstation_sewadar, is_sewadar_list,
				procedure_nm,
				satsang_centre_id_prm, outstation_sewadar_prm, sewadar_list_id_prm,
				summary_report_file_nm
			)
	VALUES	(	'Department-wise Sewadars Summary', 'S', 'No', 'Yes',
				'R', 'No','O', 'O',
				'SummariseDeptSewadarsCount',
				1, 2, 3,
				'GenericSummaryPortrait.rpt'
			)

-- =============================================================================

INSERT INTO generic_reports
			(	report_nm, report_type, report_group, is_total_line,
				is_credit_specification, is_department, is_department_multi_select, is_sub_department, is_gender, is_attribute,
				procedure_nm,
				credit_specification_id_prm,
				department_id_prm, sub_department_id_prm, gender_prm, 
				attribute_id_prm, attribute_nm_prm,
				details_report_file_nm, summary_report_file_nm
			)
	VALUES	(	'Eligible Sewadars List for Prashaad', 'B', 2, 'Yes',
				'R', 'O', 'Yes', 'O', 'O', 'O',
				'GenerateSewadarsEligiblesList',
				1, 2, 3, 4, 5, 6,
				'GenericListReportPortrait.rpt', 'GenericSummaryPortrait.rpt'
			)

-- =============================================================================

INSERT INTO generic_reports -- Temporary. Will be removed LATER.
			(	report_nm, report_type, report_group, is_total_line,
				is_credit_specification, is_department, is_department_multi_select, is_sub_department, is_gender, is_attribute,
				procedure_nm,
				credit_specification_id_prm,
				department_id_prm, sub_department_id_prm, gender_prm, 
				attribute_id_prm, attribute_nm_prm,
				details_report_file_nm, summary_report_file_nm
			)
	VALUES	(	'Eligible Sewadars List for Prashaad (New)', 'B', 2, 'Yes',
				'R', 'O', 'Yes', 'O', 'O', 'O',
				'GenerateSewadarsEligiblesListNew',
				1, 2, 3, 4, 5, 6,
				'GenericListReportPortrait.rpt', 'GenericSummaryPortrait.rpt'
			)

-- =============================================================================

INSERT INTO generic_reports
			(	report_nm, report_type, report_group, is_total_line,
				is_sewa, is_department, is_department_multi_select, is_gender,
				procedure_nm,
				sewa_id_prm, department_id_prm, gender_prm,
				details_report_file_nm, summary_report_file_nm
			)
	VALUES	(	'Unallocated Sewadars List', 'B', 4, 'Yes',
				'R', 'R', 'Yes', 'O',
				'GenerateUnallocatedSewadars',
				1, 2, 3,
				'GenericListReportPortrait.rpt', 'GenericSummaryPortrait.rpt'
			)

-- =============================================================================

INSERT INTO generic_reports
			(	report_nm, report_type, report_group,
				is_credit_specification, is_department, is_department_multi_select, is_gender,
				procedure_nm,
				credit_specification_id_prm, credit_specification_nm_prm, gender_prm, department_id_prm,
				details_report_file_nm
			)
	VALUES	(	'Summary of Attendances for Sewas', 'D', 2,
				'R', 'R', 'Yes', 'O',
				'GenerateCreditSpecsSummary',
				1, 2, 3, 4,
				'GenericReportPortrait.rpt'
			)
-- =============================================================================

INSERT INTO generic_reports
			(	report_nm, report_type, is_eject_page, is_total_line,
				is_satsang_centre, is_satsang_centre_multi_select, is_status, is_status_multi_select, is_outstation_sewadar, is_sewadar_list,
				procedure_nm,
				satsang_centre_id_prm, status_prm, outstation_sewadar_prm, sewadar_list_id_prm,
				summary_report_file_nm
			)
	VALUES	(	'Department-wise Sewadars Summary (Status)', 'S', 'No', 'Yes',
				'R', 'No', 'R', 'Yes', 'O', 'O',
				'SummariseDeptSewadarsStatus',
				1, 2, 3, 4,
				'GenericSummaryPortrait.rpt'
			)
-- =============================================================================

INSERT INTO generic_reports
			(	report_nm, report_type, report_group,is_satsang_centre, is_total_line, is_gnc_boolean, gnc_boolean_label,
				is_sewa, is_start_dt, is_finish_dt, is_outstation_sewadar, is_department, is_department_multi_select, is_sub_department, is_gender,
				procedure_nm,
				satsang_centre_id_prm, sewa_id_prm, start_dt_prm, finish_dt_prm, department_id_prm, sub_department_id_prm, outstation_sewadar_prm, gender_prm, gnc_boolean_prm, 
				details_report_file_nm, summary_report_file_nm
			)
	VALUES	(	'Daily Attendance List', 'B', 2, 'R','Yes', 'O', 'Only Absentees?',
				'R', 'R', 'R', 'O', 'R', 'Yes', 'O', 'O',
				'GenerateDailyAttendanceList',
				1, 2, 3, 4, 5, 6, 7, 8, 9,
				'GenericGroupReportPortrait.rpt', 'GenericSummaryPortrait.rpt'
			)
-- =============================================================================

SET @report_nm = 'Sewadars List Without Photo';

INSERT INTO generic_reports
			(	report_nm, sewadar_list_nm, is_sewadar_list_ticked, report_group,
				is_satsang_centre, is_satsang_centre_multi_select, is_department, is_department_multi_select, is_outstation_sewadar, is_gender,
				is_country, is_state, is_district, is_gnc_boolean, gnc_boolean_label,
				procedure_nm,
				satsang_centre_id_prm, satsang_centre_nm_prm, department_id_prm, outstation_sewadar_prm, gender_prm,
				district_id_prm, gnc_boolean_prm,
				details_report_file_nm
			)
	VALUES	(	@report_nm, @report_nm, 'No', 4,
				'R', 'No', 'O', 'Yes', 'O', 'O',
				'O', 'O', 'O', 'O', 'Show District',
				'GenerateSewadarListWithoutPhoto',
				1, 2, 3, 4, 5, 6, 7,
				'GenericReportPortrait.rpt'
			)

-- =============================================================================

SET @report_nm = 'Sewadars List Without Address';

INSERT INTO generic_reports
			(	report_nm, report_group,
				is_satsang_centre, is_satsang_centre_multi_select, is_outstation_sewadar, is_gender,
				procedure_nm,
				satsang_centre_id_prm, satsang_centre_nm_prm, outstation_sewadar_prm, gender_prm,
				details_report_file_nm
			)
	VALUES	(	@report_nm, 4,
				'R', 'No', 'O', 'O',
				'GenerateSewadarListWithoutAddress',
				1, 2, 3, 4,
				'GenericReportPortrait.rpt'
			)

-- =============================================================================

SET @report_nm = 'Sewadars List without Weekly Satsang Centres';

INSERT INTO generic_reports
			(	report_nm, sewadar_list_nm, is_sewadar_list_ticked, report_group,
				is_satsang_centre, is_satsang_centre_multi_select, is_department, is_department_multi_select, is_sub_department, is_outstation_sewadar, is_gender,
				is_country, is_state, is_district,
				procedure_nm,
				satsang_centre_id_prm, satsang_centre_nm_prm, department_id_prm, sub_department_id_prm, outstation_sewadar_prm, gender_prm,
				district_id_prm,
				details_report_file_nm
			)
	VALUES	(	@report_nm, @report_nm, 'No', 4,
				'R', 'No', 'O', 'Yes', 'O', 'O', 'O',
				'O', 'O', 'O',
				'GenerateSewadarListWithoutWeeklyCentres',
				1, 2, 3, 4, 5, 6, 7,
				'GenericReportPortrait.rpt'
			)

-- =============================================================================
/*
SET @report_nm = 'Sewadars List having incorrect Health Details';

INSERT INTO generic_reports
			(	report_nm, sewadar_list_nm, is_sewadar_list_ticked, report_group,
				is_satsang_centre, is_satsang_centre_multi_select, is_outstation_sewadar, is_gender,
				procedure_nm,
				satsang_centre_id_prm, satsang_centre_nm_prm, outstation_sewadar_prm, gender_prm,
				details_report_file_nm
			)
	VALUES	(	@report_nm, @report_nm, 'No', 4,
				'R', 'No', 'O', 'O',
				'GenerateSewadarListWithIncorrectHealthDetails',
				1, 2, 3, 4,
				'GenericReportPortrait.rpt'
			)
*/
-- =============================================================================

SET @report_nm = 'Sewadars Attendance with invalid Sewa Shifts';

INSERT INTO generic_reports
			(	report_nm, report_group,
				is_satsang_centre, is_satsang_centre_multi_select, is_sewa,
				procedure_nm,
				satsang_centre_id_prm, satsang_centre_nm_prm, sewa_id_prm,
				details_report_file_nm
			)
	VALUES	(	@report_nm, 4,
				'R', 'No', 'O',
				'GenerateInvalidSewaShiftsSewadars',
				1, 2, 3,
				'GenericReportPortrait.rpt'
			)


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
			
-- =============================================================================

GO

