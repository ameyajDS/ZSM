/* ==================================================================================
    Source File		:	upgrade_v5.31.sql.exclude
    Author(s)		:	Jitendra Loyal
    Started On		:	Tue Nov 15 12:06 IST 2011
    Version			:	1.00
    Last updated	:	Nov 15, 2011
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Upgrade Script for v5.31
			..... Columns is_remarks_type and remarks_type_prm added to table generic_reports
			..... Stored Procedure GenerateAnnotationsList dropped; instead there is a new Stored Procedure
					to get all types of remarks
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
	SET	version_no = 5.31,			
		version_dt = GetDate()
WHERE	package_id = 'ZSM'

GO
USE ZSM


DROP	TABLE	adt_generic_report_synopsis;
DROP	TABLE	adt_generic_report_summaries;
DROP	TABLE	adt_generic_report_details;
DROP	TABLE	adt_generic_report_headers;

DROP	TABLE	generic_report_synopsis;
DROP	TABLE	generic_report_summaries;
DROP	TABLE	generic_report_details;
DROP	TABLE	generic_report_headers;

DROP	TABLE	generic_reports;

GO

-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'report_description')
	EXEC	sp_droptype	'report_description'
GO

EXEC	sp_addtype	'report_description',		'VARCHAR (300)',	'NULL'
GO

-- =============================================================================
-- Table for Generic Reports... there is no front-end screen to manager this screen,
--	but the parameters screen for these reports is controlled using information in this table.
-- =============================================================================

CREATE	TABLE	generic_reports
(
	report_nm						report_nm				NOT NULL	CONSTRAINT	GenericReports_PK_ReportNm
																			PRIMARY KEY	NONCLUSTERED,
                                                        
	report_group					TINYINT					NOT NULL	Default	1,		--- Used for grouping like Sewadar Reports, Attendance Reports, Photo Reports, etc.
	report_type						CHAR (1)				NOT NULL	Default	'D',	--- D[etails only], S[ummary only], B[oth]
	is_total_line					Boolean					NOT NULL	Default	'No', 	--- to be used when report_type is S or B
                                                        
	sewadar_list_nm					gnc_long_nm					NULL,			-- If specified, it indicates that the report output can be saved. A check-box Save Result, which
																				-- is initially either ticked or not, should be shown along with Sewadar List field with this column's value.
	is_sewadar_list_ticked			Boolean						NULL,			-- It is specified along with sewadar_list_nm and indicates as to whether the check-box is ticked or not.
                                                        
	is_satsang_centre				CHAR (1)				NOT NULL	Default	'N',	--- R[equired], O[ptional], N[ot required]		--- Default is always the Parameter Satsang Centre
	is_satsang_centre_multi_select	Boolean		    			NULL,					--- It is specified along with is_satsang_centre
	is_sewa							CHAR (1)				NOT NULL	Default	'N',	--- R[equired], O[ptional], N[ot required]
	is_default_sewa					Boolean					NOT NULL	Default	'No',	--- When Yes, it is to be taken for the parameter Satsang Centre
	is_start_dt						CHAR (1)				NOT NULL	Default	'N',	--- R[equired], O[ptional], N[ot required]
	is_finish_dt					CHAR (1)				NOT NULL	Default	'N',	--- R[equired], O[ptional], N[ot required]
	default_period_source			CHAR (1)					NULL	Default	'N',	---	N[one], S[ewa dates], C[urrent System Dates]
	is_department					CHAR (1)				NOT NULL	Default	'N',	--- R[equired], O[ptional], N[ot required]
	is_department_multi_select		Boolean						NULL,					--- It is specified along with is_department
	is_sub_department				CHAR (1)				NOT NULL	Default	'N',	--- R[equired], O[ptional], N[ot required]
	is_status						CHAR (1)				NOT NULL	Default	'N',	--- R[equired], O[ptional], N[ot required]
	is_status_multi_select			Boolean						NULL,					--- It is specified along with is_status
	status_system_info_cd			system_info_cd				NULL,					--- It may be specified along with is_status
	is_global_status				CHAR (1)				NOT NULL	Default	'N',	--- Y[es], N[o]
	is_weekly_sewa_location			CHAR (1)			    NOT NULL	Default	'N',	--- R[equired], O[ptional], N[ot required]
	is_country						CHAR (1)	    		NOT NULL	Default	'N',	--- R[equired], N[ot required]; it is always multi-select, if required
	default_country_id				INTEGER						NULL,					--- It may be specified along with is_country
	is_state						CHAR (1)			    NOT NULL	Default	'N',	--- R[equired], N[ot required]; it is always multi-select, if required
	is_district						CHAR (1)	    		NOT NULL	Default	'N',	--- R[equired], N[ot required]; it is always multi-select, if required
	is_po_or_city					CHAR (1)				NOT NULL	Default	'N',	--- R[equired], N[ot required]; it is always multi-select, if required
	is_gender						CHAR (1)				NOT NULL	Default	'N',	--- R[equired], O[ptional], N[ot required]
	is_outstation_sewadar			CHAR (1)				NOT NULL	Default 'N',	--- R[equired], O[ptional], N[ot required]
	default_outstation_sewadar		Boolean						NULL,					--- It may be specified along with is_outstation_sewadar
	is_cnt_1						CHAR (1)				NOT NULL	Default 'N',	--- R[equired], O[ptional], N[ot required]
	cnt_1_label						CHAR (20)					NULL,					--- Specified when is_cnt_1 IN (R, O)
	cnt_1_min_value					INTEGER						NULL,					--- Specified when is_cnt_1 IN (R, O)
	cnt_1_max_value					INTEGER						NULL,					--- Specified when is_cnt_1 IN (R, O)
	cnt_1_default_value				INTEGER						NULL,					--- It may be specified when is_cnt_1 IN (R, O)
	is_cnt_2						CHAR (1)				NOT NULL	Default 'N',	--- R[equired], O[ptional], N[ot required]
	cnt_2_label						CHAR (20)					NULL,					--- Specified when is_cnt_2 IN (R, O)
	cnt_2_min_value					INTEGER						NULL,					--- Specified when is_cnt_2 IN (R, O)
	cnt_2_max_value					INTEGER				    	NULL,					--- Specified when is_cnt_2 IN (R, O)
	cnt_2_default_value				INTEGER						NULL,					--- It may be specified when is_cnt_2 IN (R, O)
	is_team							CHAR (1)				NOT NULL	Default 'N',	--- R[equired], O[ptional], N[ot required]
	is_credit_specification			CHAR (1)				NOT NULL	Default 'N',	--- R[equired], O[ptional], N[ot required]
	is_default_credit_specification	Boolean						NULL,					--- If yes, take it from credit_specifications.is_finally_used for parameter Satsang Centre
	is_gnc_dt1						CHAR (1)	    		NOT NULL	Default 'N',	--- R[equired], O[ptional], N[ot required]
	gnc_dt1_label					CHAR (20)					NULL,					--- Specified when is_gnc_dt IN (R, O)
	is_gnc_dt1_default_current_date	Boolean						NULL,					--- If yes, show Current Date as default; it can be specified along with is_gnc_dt1
	is_gnc_dt1_show_difference		Boolean						NULL,					--- If yes, it shows the difference in years (floor) between the date specified and current date as a displayonly field next to this
	is_gnc_dt2						CHAR (1)	    		NOT NULL	Default 'N',	--- R[equired], O[ptional], N[ot required]
	gnc_dt2_label					CHAR (20)					NULL,					--- Specified when is_gnc_dt IN (R, O)
	is_gnc_dt2_default_current_date	Boolean						NULL,					--- If yes, show Current Date as default; it can be specified along with is_gnc_dt2
	is_gnc_dt2_show_difference		Boolean						NULL,					--- If yes, it shows the difference in years (floor) between the date specified and current date as a displayonly field next to this
	is_skill						CHAR (1)			    NOT NULL	Default	'N',	--- R[equired], O[ptional], N[ot required]
	is_qualification_type			CHAR (1)				NOT NULL	Default	'N',	--- R[equired], O[ptional], N[ot required]
	is_gnc_boolean					CHAR (1)	    		NOT NULL	Default 'N',	--- R[equired], O[ptional], N[ot required]
	gnc_boolean_label				CHAR (20)					NULL,					--- Specified when is_gnc_boolean IN (R, O)
	default_gnc_boolean				Boolean						NULL,					--- It can be specified along with is_gnc_boolean and contains the default value
	is_attribute					CHAR (1)				NOT NULL	Default	'N',	--- R[equired], O[ptional], N[ot required]
	attribute_system_info_cd		system_info_cd				NULL,					--- It may be specified along with is_attribute
	is_sewadar_list					CHAR (1)				NOT NULL	Default	'N',	---	R[equired], N[ot required]
    is_sewa_shift                   CHAR (1)			    NOT NULL	Default	'N',	--- R[equired], O[ptional], N[ot required]                        	    	
    is_badge_template               CHAR (1)			    NOT NULL	Default	'N',	--- R[equired], O[ptional], N[ot required]                        	    	
    is_remarks_type	                CHAR (1)			    NOT NULL	Default	'N',	--- R[equired], O[ptional], N[ot required] ... Drop Down for Remarks Type
                                                	    	
	is_eject_page					Boolean					NOT NULL	Default	'Yes',
                                                	    	
	audit_type						CHAR (1)				NOT NULL	Default	'N',	--- N[one], Q[uick audit], R[egular audit], B[adge print]

	report_ordering					VARCHAR (512)			NOT NULL
		Default	'IF TRIM({sewadars.middle_nm}) = '''' THEN TRIM ({sewadars.first_nm}) + '' '' + TRIM ({sewadars.last_nm}) ELSE TRIM ({sewadars.first_nm}) + '' '' + LEFT (TRIM ({sewadars.middle_nm}), 1) + ''. '' + TRIM ({sewadars.last_nm})',
	is_ascending_order				Boolean					NOT NULL	Default	'Yes',
                                                	
	procedure_nm					procedure_nm			NOT NULL,
                                                            
	sewa_id_prm						TINYINT					NOT NULL	Default	0,
	sewa_nm_prm						TINYINT					NOT NULL	Default	0,
	start_dt_prm					TINYINT		    		NOT NULL	Default	0,
	finish_dt_prm					TINYINT					NOT NULL	Default	0,
	department_id_prm				TINYINT					NOT NULL	Default	0,
	department_nm_prm				TINYINT					NOT NULL	Default	0,
	sub_department_id_prm			TINYINT		    		NOT NULL	Default	0,
	sub_department_nm_prm			TINYINT					NOT NULL	Default	0,
	status_prm						TINYINT					NOT NULL	Default	0,
	weekly_sewa_location_id_prm		TINYINT		    		NOT NULL	Default	0,
	weekly_sewa_location_nm_prm		TINYINT					NOT NULL	Default	0,
	country_id_prm					TINYINT					NOT NULL	Default	0,
	state_id_prm					TINYINT					NOT NULL	Default	0,
	district_id_prm					TINYINT					NOT NULL	Default	0,
	po_or_city_id_prm				TINYINT					NOT NULL	Default	0,
	gender_prm						TINYINT					NOT NULL	Default	0,
	outstation_sewadar_prm			TINYINT					NOT NULL	Default	0,
	cnt_1_prm						TINYINT					NOT NULL	Default	0,
	cnt_2_prm						TINYINT		    		NOT NULL	Default	0,
	team_id_prm						TINYINT					NOT NULL	Default	0,
	team_nm_prm						TINYINT					NOT NULL	Default	0,
	credit_specification_id_prm		TINYINT					NOT NULL	Default	0,
	credit_specification_nm_prm		TINYINT		    		NOT NULL	Default	0,
	gnc_dt1_prm						TINYINT					NOT NULL	Default	0,
	gnc_dt2_prm						TINYINT					NOT NULL	Default	0,
	skill_id_prm					TINYINT					NOT NULL	Default	0,
	skill_nm_prm					TINYINT		    		NOT NULL	Default	0,
	qualification_type_prm			TINYINT					NOT NULL	Default	0,
	gnc_boolean_prm					TINYINT					NOT NULL	Default	0,
	satsang_centre_id_prm			TINYINT					NOT NULL	Default	0,
	satsang_centre_nm_prm			TINYINT					NOT NULL	Default	0,
	attribute_id_prm				TINYINT					NOT NULL	Default	0,
	attribute_nm_prm				TINYINT					NOT NULL	Default	0,
	sewadar_list_id_prm				TINYINT					NOT NULL	Default	0,
	sewa_shift_prm					TINYINT					NOT NULL	Default	0,
	badge_template_id_prm			TINYINT					NOT NULL	Default	0,
	badge_template_nm_prm			TINYINT					NOT NULL	Default	0,
	remarks_type_prm				TINYINT					NOT NULL	Default	0,
                                                	    
	details_report_file_nm			file_nm						NULL,
	summary_report_file_nm			file_nm						NULL,
                                                	    
	detail_report_footnote			VARCHAR (200)				NULL,
	summary_report_footnote			VARCHAR (200)				NULL
)
GO

-- =============================================================================

CREATE	TABLE	generic_report_headers
(
	session_id					report_session_id		NOT NULL	IDENTITY (1,1)
																	CONSTRAINT	GenericReportHeaders_PK_SessionID
																		PRIMARY KEY	NONCLUSTERED,
	report_header				report_description		NOT NULL,
	extra_information_header	report_description			NULL,
	major_information_header	gnc_long_nm					NULL,
	prepare_dtm					SMALLDATETIME			NOT NULL	CONSTRAINT	GenericReportHeaders_DF_PrepareDtm
																		DEFAULT	GetDate()
)
GO

-- =============================================================================

CREATE	TABLE	generic_report_details
(
	session_id					report_session_id		NOT NULL	CONSTRAINT	GenericReportDetails_FK_SessionID
																		REFERENCES	generic_report_headers,
	satsang_centre_id 			satsang_centre_id		NOT NULL,
	sewadar_grno				sewadar_grno			NOT NULL,

	extra_information			report_description			NULL,

		CONSTRAINT	GenericReportDetails_PK_SessionID_SatsangCentreID_SewadarGRNo
			PRIMARY KEY	NONCLUSTERED	(	session_id, satsang_centre_id, sewadar_grno 	),

		CONSTRAINT	GenericReportDetails_FK_SatsangCentreID_SewadarGRNo
			FOREIGN KEY	(	satsang_centre_id, sewadar_grno	)
				REFERENCES	sewadars_registrations
)
GO

-- =============================================================================

CREATE	TABLE	generic_report_summaries
(
	session_id					report_session_id	NOT NULL	CONSTRAINT	GenericReportSummaries_FK_SessionID
																	REFERENCES	generic_report_headers,
	serial_id					INTEGER				NOT NULL	IDENTITY (1, 1),
	major_information			gnc_long_nm			NOT NULL,
	minor_information			gnc_long_nm				NULL,
	gents_cnt					INTEGER				NOT NULL,
	ladies_cnt					INTEGER				NOT NULL,

		CONSTRAINT	GenericReportSummaries_PK_SessionID_SerialID
			PRIMARY KEY	NONCLUSTERED	(	session_id, serial_id	)
)
GO

-- =============================================================================

CREATE	TABLE	generic_report_synopsis
(
	session_id				report_session_id	NOT NULL	CONSTRAINT	GenericReportSynopsis_FK_SessionID
																		REFERENCES	generic_report_headers,
	serial_id				INTEGER				NOT NULL	IDENTITY (1, 1),
	major_information		gnc_long_nm			NOT NULL,
	minor_information		gnc_long_nm				NULL,
	extra_information		report_description		NULL,

		CONSTRAINT	GenericReportSynopsis_PK_SessionID_SerialID
			PRIMARY KEY	NONCLUSTERED	(	session_id, serial_id	)
)
GO

-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateAnnotationsList' AND xtype = 'P')
	DROP PROCEDURE GenerateAnnotationsList
GO

-- =============================================================================

-- vim:sw=4 ht=4 ai ts=4
