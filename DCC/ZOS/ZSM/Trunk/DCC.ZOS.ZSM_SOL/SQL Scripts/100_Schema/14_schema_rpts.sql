/* ==================================================================================
    Source File		:	schema_rpts.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Sat Nov 27 05:28 IST 2010
    Last updated	:	Oct 23, 2014
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		There are no Audit tables for Generic Reports.
		Only the report generation entry should be audited. This audit entry must
		contain the information as to whether the sewadar_list was saved or not.
    ==================================================================================
								      								  Revision History
    ----------------------------------------------------------------------------------
    JL : 23-Oct-2014
		* Added column is_summary in generic_report_headers to allow to render previously 
		  generated reports.
    JL : 30-Jun-2014
		* Added column report_nm in generic_report_headers to allow to render previously 
		  generated reports.
    AJ : 29-Jul-2012
		* Added three columns Grouping_1, Grouping_2, Grouping_3 in generic_report_details 
			to support GenericGroupReportPortrait report
		  Added two columns grouping_1_ascending, grouping_1_rendering in generic_report_headers
			to support GenericGroupReportPortrait report
    JL : 09-Mar-2012
		* New tables generic_list_report_headers and generic_list_report_details added to support
		  reports that print only Sewadar Names. These will now be printed in two columns, and the
		  page breaks are also manually computed to save paper.
    JL : 22-Dec-2011
		* Table definition for generic_reports moved to schema_setup script.
    JL : 16-Dec-2011
		*   Column sewadar_type_prm renamed to sewadar_type_nm_prm of table generic_reports.
    JL : 15-Dec-2011
		*   Columns is_sewadar_type and sewadar_type_prm added to table generic_reports.
    JL : 15-Nov-2011
		*   Columns is_remarks_type and remarks_type_prm added to table generic_reports.
    JL : 27,10-Dec-2010
		*   Initial version
   ==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO


-- =============================================================================
-- Tables that store results or output of Generic Reports
-- =============================================================================

CREATE	TABLE	generic_report_headers
(
	session_id					report_session_id		NOT NULL	IDENTITY (1,1)
																	CONSTRAINT	GenericReportHeaders_PK_SessionID
																		PRIMARY KEY	NONCLUSTERED,
	report_nm					report_nm					NULL,
	is_summary					Boolean						NULL,
	report_header				report_description		NOT NULL,
	extra_information_header	report_description			NULL,
	major_information_header	gnc_long_nm					NULL,
	prepare_dtm					SMALLDATETIME			NOT NULL	CONSTRAINT	GenericReportHeaders_DF_PrepareDtm
																		DEFAULT	GetDate(),	
	grouping_1_ascending		Boolean					NOT NULL	Default	'Yes',
	grouping_1_rendered			Boolean					NOT NULL	Default	'Yes'
)
GO

-- =============================================================================

CREATE	TABLE	generic_report_details
(
	session_id					report_session_id		NOT NULL	CONSTRAINT	GenericReportDetails_FK_SessionID
																		REFERENCES	generic_report_headers,
	satsang_centre_id 			satsang_centre_id		NOT NULL,
	sewadar_grno				sewadar_grno			NOT NULL,

	extra_information			report_description		NULL,
	
	grouping_1					VARCHAR(50)				NULL,
	grouping_2					VARCHAR(50)				NULL,
	grouping_3					VARCHAR(50)				NULL,
	
		CONSTRAINT	GenericReportDetails_PK_SessionID_SatsangCentreID_SewadarGRNo
			PRIMARY KEY	NONCLUSTERED	(	session_id, satsang_centre_id, sewadar_grno 	),

		CONSTRAINT	GenericReportDetails_FK_SatsangCentreID_SewadarGRNo
			FOREIGN KEY	(	satsang_centre_id, sewadar_grno	)
				REFERENCES	sewadars_registrations
)
GO

-- =============================================================================

CREATE	TABLE	generic_list_report_headers
(
	session_id					report_session_id		NOT NULL	CONSTRAINT	GenericListReportHeaders_FK_SessionID
																		REFERENCES	generic_report_headers,
	header_serial_id			INTEGER					NOT NULL,
	sub_header_information		report_description		NOT NULL,
	is_eject_page				Boolean					NOT NULL	CONSTRAINT	GenericListReportHeaders_DF_IsEjectPage
																		DEFAULT	'No',
		
		CONSTRAINT	GenericListReportDetails_PK_SessionID_HeaderSerialID
			PRIMARY KEY	NONCLUSTERED	(	session_id, header_serial_id 	)
)
GO

-- =============================================================================

CREATE	TABLE	generic_list_report_details
(
	session_id					report_session_id		NOT NULL,
	header_serial_id			INTEGER					NOT NULL,
	column1_serial_id			INTEGER					NOT NULL,
	column1_satsang_centre_id 	satsang_centre_id		NOT NULL,
	column1_sewadar_grno		sewadar_grno			NOT NULL,
	column1_sewadar_nm			VARCHAR (100)			NOT NULL,
	column2_serial_id			INTEGER						NULL,
	column2_satsang_centre_id 	satsang_centre_id			NULL,
	column2_sewadar_grno		sewadar_grno				NULL,
	column2_sewadar_nm			VARCHAR (100)				NULL,

		CONSTRAINT	GenericListReportDetails_PK_SessionID_HeaderSerialID_Column1SerialID
			PRIMARY KEY	NONCLUSTERED	(	session_id, header_serial_id, column1_serial_id 	),

		CONSTRAINT	GenericListReportDetails_FK_SessionID_HeaderSerialID
			FOREIGN KEY	(	session_id, header_serial_id 	)
				REFERENCES	generic_list_report_headers,

		CONSTRAINT	GenericListReportDetails_FK_Column1SatsangCentreID_Column1SewadarGRNo
			FOREIGN KEY	(	column1_satsang_centre_id, column1_sewadar_grno	)
				REFERENCES	sewadars_registrations,

		CONSTRAINT	GenericListReportDetails_FK_Column2SatsangCentreID_Column2SewadarGRNo
			FOREIGN KEY	(	column2_satsang_centre_id, column2_sewadar_grno	)
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

-- vim:sw=4 ht=4 ai ts=4
