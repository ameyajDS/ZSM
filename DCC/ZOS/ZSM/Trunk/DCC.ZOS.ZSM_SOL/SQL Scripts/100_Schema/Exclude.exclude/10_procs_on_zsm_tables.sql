/* ==================================================================================
    Source File		:	procs_on_zsm_tables.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Thu Dec 22 22:20:03 IST 2011
    Last updated	:	Feb 17, 2015
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:	JL
    Reviewed On		:	
    ==================================================================================
									   									   Usage Notes
    ----------------------------------------------------------------------------------

    ==================================================================================
								      								  Revision History
    ----------------------------------------------------------------------------------
		JL/MS : 17-Feb-2015
			* Added Procedure _Drop_ZSM_tables_table.
		JL : 02-Oct-2014
			* Procedure _DropProcedures has been changed as an entry for _ExportProgrammeCentreLists has been added.
		JL : 17, 18-Jan-2014
			* Bits 9 and 10 of column report_anomaly get definition now (to set the ownership of records with Centre (bit 9) or Zone (bit 10).
			  In case of mixed ownership (table sewadars), both bits are set. These have also been set for some tables.
		JL : 16-Jan-2014
			* An entry for dropping procedure __GetOrderByClause is put in _DropProcedures Procedure.
		JL/MS : 14-Jan-2014
			* Procedures __CheckCentreCode, _ReportAnomalies, __GetCentreSewadars, _DeleteZoneRecords, _InsertCentreRecordsInZone,
			  _UpdateRecordCount, _CountZoneRecordsBeforeOperation, _CountRecords, _CountRecordsBefore, _CountRecordsAfter,
			  _CountZoneRecordsBefore and _CountZoneRecordsAfter moved to procs_expimp.sql as these are applicable only in ZSM
			  database.
		JL : 11-Jan-2014
			* Bit 8 of column report_anomaly gets a definition now (to report records that are outside the prescribed range of alloted identity partition, are present in Zone and not in Centre).
			* Bit 8 of report_anomaly has also been set for some tables.
			* Bit 7 of column report_anomaly gets a definition now (to report records that are outside of the range allocated to the centre).
			* Bit 7 of report_anomaly has also been set for sewas, sequence_controlling_information and weekly_sewa_locations tables.
			* Bit 6 of column report_anomaly gets a definition now (to report records that do not belong to centre).
			* Columns report_anomaly has been set for sewas, sequence_controlling_information and weekly_sewa_locations tables.
			* Columns import_insert has been set for sewas, credit_specifications, weekly_sewa_locations, generic_attributes_satsang_centres
			* Columns import_insert and / or import_delete have been set for sewa_exemptions_applicable_sewas,
			  generic_attributes_satsang_centres, sewadars_txn_ts, sewa_teams_txn_ts, sewadars_badges tables.
			* Bit 4 of column import_insert gets a definition now (to import all non-existing records).
			* Stored Procedure _InsertCentreRecordsInZone changed to support
				+ storing and restoring the seed values for IDENTITY columns, and,
				+ importing all non-existing records for the 4th bit of import_insert column.
		JL : 10-Jan-2014
			* An entry for sewa_shifts_valid_combinations table added.
			* Various flags for four tables containing Sewas' informaton, viz., sewas_periods, sewas_sewa_shifts,
			  sewa_shifts_valid_combinations and sewas_satsang_centres, have been set as below:
			  		report_anomaly		1 + 4
					import_delete		1
					import_insert		1
		JL : 03-Jan-2014
			* Semantics of column import_insert established and has thus been set for some of the tables.
			* Stored Procedures _InsertCentreRecordsInZone and __GetCentreSewadars have been added.
			* Stored Procedure _DropProcedures has been modified to include the above two new procedures.
			* Stored Procedure _DeleteZoneRecords has been refactored to use __GetCentreSewadars.
		JL : 03-Jan-2014
			* Bit 7 in import_delete assigned for deleting records using Credit Specifications IDs along with Centre.
			* import_delete column set for tables sewa_teams and sewa_team_wise_sewadars.
			* Minor fixes in _DeleteZoneRecords stored procedure.
		JL : 02, 03-Jan-2014
			* Columns import_delete and import_insert added to table _ZSM_tables.
			* Column import_delete has been set for some of the tables; column import_insert is yet to be set.
			* Stored Procedures _DeleteZoneRecords and __CheckCentreCode have been added.
			* Stored Procedure _DropProcedures has been modified to include the above two new procedures.
			* Stored Procedure _ReportAnomalies has been refactored to use __CheckCentreCode.
		JL : 01-Jan-2014
			* Fixes in Stored Procedure _ReportAnomalies.
		JL : 31-Dec-2013
			* Optimized the Stored Procedure _CountRecords for efficiency.
		JL : 30-Dec-2013
			* Stored Procedures _CountZoneRecordsBefore, and _CountZoneRecordsAfter have been added.
			  Stored Procedure _DropProcedures has been modified to drop the newly added stored procedures.
		JL : 29-Dec-2013
			* Stored Procedures _UpdateRecordCount, _CountZoneRecordsBeforeOperation, _CountRecords, _CountRecordsBefore,
			  and _CountRecordsAfter have been added. Stored Procedure _Create_ZSM_tables_table has been added to
			  add the records for two tables _data_operations and _data_operations_tables. Stored Procedure _DropProcedures
			  has been modified to drop the newly added stored procedures.
		JL : 27-Dec-2013
			* Another column display_anomaly has been added, which controls the additional display information.
			* Further Stored Procedure _ReportAnomalies has been added which issues many dynamically created SELECT
			  statements to report any data, which is not benign. Such output of data should be copied into Excel sheets
			  and reported for manual correction.
		JL : 26-Dec-2013
			* Data-type of report_anomaly has been changed from Boolean to INT as its semantics have been made bit-wise for reporting
			  different anomalies. For details of anomalies, refer to comments near the column report_anomaly.
		JL : 21-Dec-2013
			* When Sewadars are shifted from one Centre to another centre after exporting the data to the Centre, and when the data is
			  then imported, the difference in data should be flagged so that manual action be taken for such differences. System
			  should however ignore the data of Sewadars from the imported Centre. A column report_anomaly has been kept for the purpose.
			  This has also been set for the tables for which the changes should be reported.
		JL : 25-Jan-2013
			* Previous implementation of has_audit_table  has been rolled back except for the addition of column has_audit_table.
			* Now _ExecProcOn_ZSMTables takes an additional optional parameter (default is No) for audit_table.
			  Therefore, _ExecProcOn_ZSMTables_AtZone procedure now defines the cursor as per this newly added parameter.
			* Internal Procedure _DropProcedures has been changed to include _CopyFromZoneTable and _CopyToZoneTable Internal Stored Procedures.
		JL : 24-Jan-2013
			* Column has_audit_table has been added to internal table _ZSM_tables, and thus it has been appropriately set for the respective tables.
			* Internal Procedure _ExecProcOn_ZSMTables_AtZone has been changed to make use of the has_audit_table column and thus is passed as
			  3rd parameter to Export/Import Internal Stored Procedures.
			* Internal Procedure _DropProcedures has been changed to include _CopyPhotos Internal Stored Procedure.
		JL : 09-Mar-2012
			* Support for new tables generic_list_report_headers and generic_list_report_details added.
		JL : 22,27-Dec-2011
			Initial version
   ==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

-- =============================================================================
-- Table _ZSM_tables which is used for Importing and Exporting
---	Note.	Audit tables (audit_log and adt_*) are not considered for export / import
---			and are thus not populated in this table.
-- -----------------------------------------------------------------------------
-- Procedure _Create_ZSM_tables_table creates the _ZSM_tables and populates it.
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = '_Create_ZSM_tables_table' AND xtype = 'P')
	DROP PROCEDURE _Create_ZSM_tables_table
GO

CREATE PROCEDURE _Create_ZSM_tables_table
WITH ENCRYPTION
AS
BEGIN
	IF EXISTS (SELECT * FROM sysobjects WHERE name = '_ZSM_tables' AND xtype = 'U')
		DROP TABLE _ZSM_tables

	CREATE TABLE _ZSM_tables
	(
		table_id			display_order		NOT NULL	IDENTITY (1, 1)
															CONSTRAINT	_ZSMTables_PK_TableID
																PRIMARY KEY NONCLUSTERED,
		table_nm			VARCHAR (50)		NOT NULL	CONSTRAINT	_ZSMTables_UK_TableNm
																UNIQUE NONCLUSTERED,
			-- It is updated in the respective call depending upon the ascending order or reverse order execution of Stored Procedure
		table_sq			display_order			NULL,

			---- Data in the table is used for Centre only, and is thus kept in imp_<tbl_nm> tables from Import till Export
		is_at_centre_only	Boolean				NOT NULL		Default	'No',

			--- possible values are N[one], P[reserve Seed], I[gnore Seed]
		identity_action		CHAR (1)			NOT NULL		Default	'N',

		seed_value			INT						NULL,
			
			---- Wheteher the table has an audit table whose name is adt_ followed by the base table name
		has_audit_table		Boolean				NOT NULL		Default	'No',

			---- Table is created in Import and should be destroyed towards the end of Export like this table itself
		is_import_export	Boolean				NOT NULL		Default	'No',

			---- This bit-wsie flag, if set, reports the anomalies in the data being imported from the Centre as below:
			---		Anomaly bits:
			----			Bit 1 (LSB)	Value 1  :	Report records that exist in Zone but not in Centre
			----			Bit 2 		Value 2  :	Report records that exist in Centre but not in Zone
			----			Bit 3 		Value 4  :	Report records that differ in Centre and Zone - note that we can NOT determine who changed (Centre or Zone)
			----	Additional constraint bits (4 and 5 only):
			----			Bit 4 		Value 8  :	Consider only for previously imported Sewas (excluding Archiving)
			----			Bit 5 		Value 16 :	Exclude freshly enrolled Sewadars for the Centre in the Zone

			----	Independant Anamoly bits:
			----			Bit 6 		Value 32  :	Report records that do not belong to the centre
			----			Bit 7 		Value 64  :	Report records that are outside the prescribed range of alloted identity partition.
			----			Bit 8 		Value 128 :	Report records that are outside the prescribed range of alloted identity partition, are present in Zone and not in Centre.

			----	Ownership bits (9 and 10 which are specified with bit 3):
			----			Bit 9 		Value 256 :	Table is managed by Centre
			----			Bit 10 		Value 512 :	Table is managed by Zone
			----					When bits 9 and 10 both are specified, the table is managed by both, Centre and Zone. In such a case, columns are hard-coded as per ownership.

			----	Therefore if multiple anomalies are to be reported, the sum of values assigned to the respective bits is specified.

			----	Further note that bits 4 and 5 can be set only when one or more of first three bits have been set (and NOT with bits 6 and 7);
			----	in other words, these (bits 4 and 5) cannot be set individually.
			----	For example, if data exists in Zone as well as in Centre is to be reported for a table, this should be set to 3.
			----	As another example, if data exists in Zone and difference in data is to be reported for a table, this should be set to 6.
			----	Finally, if first three kinds of anomalies are to be reported, this column should be set to 7 apart from additional bits 4th (value 8) and 5th (value 16), if required.
		report_anomaly		INT					NOT NULL		Default	0,

			----	Display information bits:
			----			Bit 1 		Value 1 :	Display additional information using sewadar_id	(alias p)
			----			Bit 2 		Value 2 :	Display additional information using satsang_centre_id and sewadar_grno	(alias q)
			----			Bit 3 		Value 4 :	Display additional information using sewa_team_wise_sewadars	(alias r)
			----	Note that only one of these bits (1, 2 or 3) can be used because this bit is used to display additional information.
			----	This bit can be set only if report_anomaly has been set.
		display_anomaly		INT					NOT NULL		Default	0,

			----	DELETE information bits for the records to be deleted in Zone for the Centre during import:
			----			Bit 1 		Value 1 :	Use Sewas of the Centre
			----			Bit 2 		Value 2 :	Use Sewas of the Centre along with corresponding Sewa Teams
			----			Bit 3 		Value 4 :	Use Sewas of the Centre excluding freshly enrolled Sewadars
			----			Bit 4 		Value 8 :	Use Sewadar IDs (obtained using JOIN between Zone and Centre Sewadars on Current Sewadar GRNo and restricted to the importing Centre)
			----			Bit 5 		Value 16 :	Use Sewadar GRNos (obtained using JOIN between Zone and Centre Sewadars on Current Sewadar GRNo and restricted to the importing Centre)
			----			Bit 6 		Value 32 :	Use Centre
			----			Bit 7 		Value 64 :	Use Credit Specifications ID along with Centre
			----	These bits are mutually exclusive. Therefore at most only one of these bits can be set.
		import_delete		INT					NOT NULL		Default	0,

			----	INSERT information bits during import:
			----			Bit 1 		Value 1 :	Import all records from Centre unconditionally
			----			Bit 2 		Value 2 :	Use Sewadar IDs (obtained using JOIN between Zone and Centre Sewadars on Current Sewadar GRNo and restricted to the importing Centre)
			----			Bit 3 		Value 4 :	Use Sewadar GRNos (obtained using JOIN between Zone and Centre Sewadars on Current Sewadar GRNo and restricted to the importing Centre)
			----			Bit 4		Value 8	:	Import all non-existing (determined using primary ket columns) records unconditionally
			----	These bits are mutually exclusive. Therefore at most only one of these bits can be set.
		import_insert		INT					NOT NULL		Default	0,

			CONSTRAINT	_ZSMTables_CK_ReportAnomaly_DisplayAnomaly
				CHECK 	(	(	report_anomaly	>	0	)
						OR	(	report_anomaly	=	0	AND	display_anomaly	=	0	)
						)
	);


	-- =============================================================================

	INSERT INTO _ZSM_tables (table_nm, is_at_centre_only, identity_action	)	VALUES (	'audit_logs', 'Yes', 'I'					);
	INSERT INTO _ZSM_tables (table_nm)											VALUES (	'address_proofs'							);
	INSERT INTO _ZSM_tables (table_nm)											VALUES (	'address_types'								);
	INSERT INTO _ZSM_tables (table_nm)											VALUES (	'attendance_units'							);
	INSERT INTO _ZSM_tables (table_nm)											VALUES (	'badge_part_types'							);
	INSERT INTO _ZSM_tables (table_nm)											VALUES (	'centre_functionaries'						);
	INSERT INTO _ZSM_tables (table_nm)											VALUES (	'sewadar_status'							);
	INSERT INTO _ZSM_tables (table_nm)											VALUES (	'sewadar_status_valid_transitions'			);
	INSERT INTO _ZSM_tables (table_nm, identity_action, has_audit_table)		VALUES (	'generic_attributes', 'P', 'Yes'			);
	INSERT INTO _ZSM_tables (table_nm, has_audit_table)							VALUES (	'generic_attributes_list_values', 'Yes'		);
	INSERT INTO _ZSM_tables (table_nm, has_audit_table)							VALUES (	'generic_attributes_status', 'Yes'			);
	INSERT INTO _ZSM_tables (table_nm)											VALUES (	'occupations'								);
	INSERT INTO _ZSM_tables (table_nm)											VALUES (	'sewadar_types'								);
	INSERT INTO _ZSM_tables (table_nm)											VALUES (	'remarks_types'								);
	INSERT INTO _ZSM_tables (table_nm)											VALUES (	'responsibilities'							);
	INSERT INTO _ZSM_tables (table_nm)											VALUES (	'scanning_validating_actions'				);
	INSERT INTO _ZSM_tables (table_nm)											VALUES (	'sewa_frequencies'							);
	INSERT INTO _ZSM_tables (table_nm)											VALUES (	'sewa_shifts'								);
	INSERT INTO _ZSM_tables (table_nm)											VALUES (	'sewadar_list_uses'							);
	INSERT INTO _ZSM_tables (table_nm, has_audit_table)							VALUES (	'system_information_codes', 'Yes'			);
	INSERT INTO _ZSM_tables (table_nm, has_audit_table)							VALUES (	'system_information_values', 'Yes'			);
	INSERT INTO _ZSM_tables (table_nm)											VALUES (	'scanning_job_types'						);
	INSERT INTO _ZSM_tables (table_nm)											VALUES (	'generic_reports'							);
	INSERT INTO _ZSM_tables (table_nm)											VALUES (	'_sample_images'							);

	INSERT INTO _ZSM_tables (table_nm, has_audit_table)							VALUES (	'colours', 'Yes'							);
	INSERT INTO _ZSM_tables (table_nm, has_audit_table)							VALUES (	'badge_templates', 'Yes'					);
	INSERT INTO _ZSM_tables (table_nm, has_audit_table)							VALUES (	'badge_templates_sewadar_status', 'Yes'		);
	INSERT INTO _ZSM_tables (table_nm, has_audit_table)							VALUES (	'satsang_centres_details', 'Yes'			);
	INSERT INTO _ZSM_tables (table_nm, identity_action, has_audit_table)		VALUES (	'satsang_centre_functionaries', 'P', 'Yes'	);
	INSERT INTO _ZSM_tables (table_nm, identity_action, has_audit_table, report_anomaly, import_insert)		VALUES (	'sewas', 'P', 'Yes', 32+64+128, 8			);
	INSERT INTO _ZSM_tables (table_nm, has_audit_table, report_anomaly, import_delete, import_insert)		VALUES (	'sewas_periods', 'Yes', 1+4+8, 1, 1		);
	INSERT INTO _ZSM_tables (table_nm, has_audit_table, report_anomaly, import_delete, import_insert)		VALUES (	'sewas_sewa_shifts', 'Yes', 1+4+8, 1, 1	);
	INSERT INTO _ZSM_tables (table_nm, has_audit_table, report_anomaly, import_delete, import_insert)		VALUES (	'sewa_shifts_valid_combinations', 'Yes', 1+8, 1, 1	);
	INSERT INTO _ZSM_tables (table_nm, has_audit_table, report_anomaly, import_delete, import_insert)		VALUES (	'sewas_satsang_centres', 'Yes', 1+8, 1, 1	);
	INSERT INTO _ZSM_tables (table_nm, identity_action, has_audit_table, report_anomaly, import_delete, import_insert)	VALUES (	'credit_specifications', 'P', 'Yes', 32+64+128, 32, 1	);
	INSERT INTO _ZSM_tables (table_nm, has_audit_table, import_delete, import_insert)	VALUES (	'credit_specifications_sewas', 'Yes', 64, 1	);
	INSERT INTO _ZSM_tables (table_nm, identity_action, has_audit_table)		VALUES (	'departments', 'P', 'Yes'					);
	INSERT INTO _ZSM_tables (table_nm, has_audit_table)							VALUES (	'departments_satsang_centres', 'Yes'		);
	INSERT INTO _ZSM_tables (table_nm, identity_action, has_audit_table)		VALUES (	'sub_departments', 'P', 'Yes'				);
	INSERT INTO _ZSM_tables (table_nm, has_audit_table)							VALUES (	'sub_departments_satsang_centres', 'Yes'	);
	INSERT INTO _ZSM_tables (table_nm, identity_action, has_audit_table, report_anomaly)	VALUES (	'post_offices_or_cities', 'P', 'Yes', 2+4+512	);
	INSERT INTO _ZSM_tables (table_nm, report_anomaly, import_insert)			VALUES (	'sequence_controlling_information', 32, 8	);
	INSERT INTO _ZSM_tables (table_nm, identity_action, has_audit_table)		VALUES (	'sewa_exemptions', 'P', 'Yes'				);
	INSERT INTO _ZSM_tables (table_nm, has_audit_table, import_delete, import_insert)		VALUES (	'sewa_exemptions_applicable_sewas', 'Yes', 1, 1	);
	INSERT INTO _ZSM_tables (table_nm, identity_action, has_audit_table, report_anomaly, import_insert)		VALUES (	'weekly_sewa_locations', 'P', 'Yes', 32+64+128, 8	);
	INSERT INTO _ZSM_tables (table_nm, has_audit_table, report_anomaly, import_delete, import_insert)		VALUES (	'generic_attributes_satsang_centres', 'Yes', 32, 32, 1	);
	INSERT INTO _ZSM_tables (table_nm, is_import_export)						VALUES (	'satsang_centres_seeds', 'Yes'				);
	INSERT INTO _ZSM_tables (table_nm, is_import_export)						VALUES (	'centres_tables_id_changes', 'Yes'			);
	INSERT INTO _ZSM_tables (table_nm, identity_action, has_audit_table, report_anomaly)	VALUES (	'medical_disabilities', 'P', 'Yes', 2+4+512	);
	INSERT INTO _ZSM_tables (table_nm, identity_action, report_anomaly)	VALUES (	'other_address_proofs', 'P', 2+4+512	);

	INSERT INTO _ZSM_tables (table_nm, identity_action, has_audit_table, report_anomaly)	VALUES (	'sewadars', 'P', 'Yes', 2+4+256+512	);
	INSERT INTO _ZSM_tables (table_nm, has_audit_table)							VALUES (	'sewadars_details', 'Yes'					);
	INSERT INTO _ZSM_tables (table_nm, has_audit_table, import_delete, import_insert)	VALUES (	'sewadars_addresses', 'Yes', 8, 2	);
	INSERT INTO _ZSM_tables (table_nm, has_audit_table, import_delete, import_insert)	VALUES (	'sewadars_qualifications', 'Yes', 8, 2	);
	INSERT INTO _ZSM_tables (table_nm, has_audit_table, import_delete, import_insert)	VALUES (	'sewadars_other_disabilities', 'Yes', 8, 2	);
	INSERT INTO _ZSM_tables (table_nm, has_audit_table, import_delete, import_insert)	VALUES (	'sewadars_skills', 'Yes', 8, 2		);
	INSERT INTO _ZSM_tables (table_nm, has_audit_table, import_delete, import_insert)	VALUES (	'sewadars_remarks', 'Yes', 8, 2		);
	INSERT INTO _ZSM_tables (table_nm, has_audit_table, report_anomaly, display_anomaly)	VALUES (	'sewadars_registrations', 'Yes', 2+4+512, 1	);
	INSERT INTO _ZSM_tables (table_nm)											VALUES (	'sewadars_satsang_centre_transfers'			);
	INSERT INTO _ZSM_tables (table_nm, has_audit_table, report_anomaly, display_anomaly)	VALUES (	'sewadars_transfers', 'Yes', 2+4+512, 2	);
	INSERT INTO _ZSM_tables (table_nm, has_audit_table, report_anomaly, display_anomaly)	VALUES (	'sewadars_status_changes', 'Yes', 2+4+512, 2	);
	INSERT INTO _ZSM_tables (table_nm, has_audit_table, report_anomaly, display_anomaly)	VALUES (	'sewadars_responsibility_changes', 'Yes', 2+4+512, 2	);
	INSERT INTO _ZSM_tables (table_nm, has_audit_table, import_delete, import_insert)	VALUES (	'sewadars_particulars', 'Yes', 16, 4	);
	INSERT INTO _ZSM_tables (table_nm, has_audit_table, import_delete, import_insert)	VALUES (	'sewadars_attributes', 'Yes', 16, 4	);
	INSERT INTO _ZSM_tables (table_nm, identity_action, has_audit_table, report_anomaly, import_delete, import_insert)	VALUES (	'sewa_teams', 'P', 'Yes', 64+128, 1, 1	);
	INSERT INTO _ZSM_tables (table_nm, has_audit_table, import_delete, import_insert)	VALUES (	'sewa_team_wise_sewadars', 'Yes', 2, 1	);
	INSERT INTO _ZSM_tables (table_nm, report_anomaly, import_delete, import_insert)	VALUES (	'sewadars_txn_ts', 32, 4, 1			);
	INSERT INTO _ZSM_tables (table_nm, import_delete, import_insert)			VALUES (	'sewa_teams_txn_ts', 2, 1					);
	INSERT INTO _ZSM_tables (table_nm, report_anomaly, display_anomaly, import_delete, import_insert)	VALUES (	'team_wise_daily_attendance', 1+2+4+8+256, 4, 2, 1	);
	INSERT INTO _ZSM_tables (table_nm, has_audit_table, report_anomaly, display_anomaly, import_delete, import_insert)	VALUES (	'arbitrary_daily_presences', 'Yes', 1+2+4+8+256, 2, 1, 1	);
	INSERT INTO _ZSM_tables (table_nm, has_audit_table, report_anomaly, display_anomaly, import_delete, import_insert)	VALUES (	'arbitrary_shift_presences', 'Yes', 1+2+4+8+256, 2, 1, 1	);
	INSERT INTO _ZSM_tables (table_nm, has_audit_table, report_anomaly, display_anomaly, import_delete, import_insert)	VALUES (	'arbitrary_summarised_exemptions', 'Yes', 1+2+4+8+256, 2, 1, 1	);
	INSERT INTO _ZSM_tables (table_nm, has_audit_table, report_anomaly, display_anomaly, import_delete, import_insert)	VALUES (	'sewadar_wise_sewa_summaries', 'Yes', 1+2+4+8+16, 2, 4, 1	);
	INSERT INTO _ZSM_tables (table_nm, has_audit_table, import_delete, import_insert)	VALUES (	'credit_specifications_sewadars', 'Yes', 64, 1	);
	INSERT INTO _ZSM_tables (table_nm, identity_action, import_insert)			VALUES (	'sewadars_badges', 'P', 8					);
	INSERT INTO _ZSM_tables (table_nm)											VALUES (	'sewadars_badge_issues_and_returns'			);
	INSERT INTO _ZSM_tables (table_nm)											VALUES (	'sewadars_merged' 							);
	INSERT INTO _ZSM_tables (table_nm, is_import_export)						VALUES (	'additionally_exported_sewadars', 'Yes'		);
	INSERT INTO _ZSM_tables (table_nm, is_import_export)						VALUES (	'manually_exported_sewadars', 'Yes'			);
	INSERT INTO _ZSM_tables (table_nm)											VALUES (	'speakers' 									);
	INSERT INTO _ZSM_tables (table_nm)											VALUES (	'speakers_approvals_renewals'				);
	INSERT INTO _ZSM_tables (table_nm)											VALUES (	'speakers_trainings'						);

	INSERT INTO _ZSM_tables (table_nm, is_at_centre_only, identity_action, report_anomaly	)	VALUES (	'generic_report_headers', 'Yes', 'P', 64	);
	INSERT INTO _ZSM_tables (table_nm, is_at_centre_only					)	VALUES (	'generic_report_details',				'Yes'		);
	INSERT INTO _ZSM_tables (table_nm, is_at_centre_only					)	VALUES (	'generic_list_report_headers',			'Yes'		);
	INSERT INTO _ZSM_tables (table_nm, is_at_centre_only					)	VALUES (	'generic_list_report_details',			'Yes'		);
	INSERT INTO _ZSM_tables (table_nm, is_at_centre_only, identity_action	)	VALUES (	'generic_report_summaries',				'Yes',	'I'	);
	INSERT INTO _ZSM_tables (table_nm, is_at_centre_only, identity_action	)	VALUES (	'generic_report_synopsis',				'Yes',	'I'	);

	INSERT INTO _ZSM_tables (table_nm, is_at_centre_only, identity_action, has_audit_table, report_anomaly	)	VALUES (	'generic_sewadar_lists', 'Yes',	'P', 'Yes', 64	);
	INSERT INTO _ZSM_tables (table_nm, is_at_centre_only, has_audit_table					)	VALUES (	'generic_sewadar_lists_sewadars',		'Yes', 'Yes'		);
	INSERT INTO _ZSM_tables (table_nm, is_at_centre_only, identity_action, has_audit_table, report_anomaly	)	VALUES (	'scanning_jobs',		'Yes',	'P', 'Yes', 64	);
	INSERT INTO _ZSM_tables (table_nm, is_at_centre_only, has_audit_table					)	VALUES (	'scanning_jobs_periods',				'Yes', 'Yes'		);
	INSERT INTO _ZSM_tables (table_nm, is_at_centre_only, identity_action					)	VALUES (	'scanning_sub_jobs',					'Yes',	'P'			);
	INSERT INTO _ZSM_tables (table_nm, is_at_centre_only, has_audit_table					)	VALUES (	'scanning_sub_jobs_validations',		'Yes', 'Yes'		);
	INSERT INTO _ZSM_tables (table_nm, is_at_centre_only, has_audit_table					)	VALUES (	'scanning_sub_jobs_valid_combinations',	'Yes', 'Yes'		);
	INSERT INTO _ZSM_tables (table_nm, is_at_centre_only, has_audit_table					)	VALUES (	'scanning_jobs_controlling_dates',		'Yes', 'Yes'		);
	INSERT INTO _ZSM_tables (table_nm, is_at_centre_only, has_audit_table					)	VALUES (	'scanning_jobs_sewa_teams',				'Yes', 'Yes'		);
	INSERT INTO _ZSM_tables (table_nm, is_at_centre_only, has_audit_table					)	VALUES (	'scanned_badge_file_audit_logs',		'Yes', 'Yes'		);
	INSERT INTO _ZSM_tables (table_nm, is_at_centre_only, has_audit_table					)	VALUES (	'scanned_badges',						'Yes', 'Yes'		);
	INSERT INTO _ZSM_tables (table_nm, is_at_centre_only									)	VALUES (	'scanned_badges_store',					'Yes'				);
	INSERT INTO _ZSM_tables (table_nm, is_at_centre_only, identity_action					)	VALUES (	'sewas_fp_controlling_dates',			'Yes',	'P'			);
	INSERT INTO _ZSM_tables (table_nm, is_at_centre_only									)	VALUES (	'scanned_fingerprints',					'Yes'				);
	INSERT INTO _ZSM_tables (table_nm, is_at_centre_only									)	VALUES (	'scanned_fingerprints_store',			'Yes'				);

	INSERT INTO _ZSM_tables (table_nm, identity_action, report_anomaly, import_insert		)	VALUES (	'sewadar_applications',		 'P',	  32+64+128, 8			);
	INSERT INTO _ZSM_tables (table_nm, import_insert										)	VALUES (	'sewadar_application_qualifications',			 8			);
	INSERT INTO _ZSM_tables (table_nm, import_insert										)	VALUES (	'sewadar_application_other_disabilities',		 8			);
	INSERT INTO _ZSM_tables (table_nm, import_insert										)	VALUES (	'sewadar_application_skills',					 8			);

	INSERT INTO _ZSM_tables (table_nm, is_import_export						)	VALUES (	'mgr_centre_sewadars',		'Yes'			);
	INSERT INTO _ZSM_tables (table_nm, is_import_export						)	VALUES (	'mgr_tmp_sewadars',			'Yes'			);
	INSERT INTO _ZSM_tables (table_nm, is_import_export						)	VALUES (	'tmp_bulk_registrations',	'Yes'			);
	INSERT INTO _ZSM_tables (table_nm, is_import_export						)	VALUES (	'_ZSM_tables',				'Yes'			);
	INSERT INTO _ZSM_tables (table_nm, is_import_export, identity_action	)	VALUES (	'_data_operations',			'Yes',	'P'		);
	INSERT INTO _ZSM_tables (table_nm, is_import_export						)	VALUES (	'_data_operations_tables',	'Yes'			);
END
GO

-- =============================================================================
-- -----------------------------------------------------------------------------
-- Procedure _Drop_ZSM_tables_table drops the _ZSM_tables
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = '_Drop_ZSM_tables_table' AND xtype = 'P')
	DROP PROCEDURE _Drop_ZSM_tables_table
GO

CREATE PROCEDURE _Drop_ZSM_tables_table
WITH ENCRYPTION
AS
BEGIN
	IF EXISTS (SELECT * FROM sysobjects WHERE name = '_ZSM_tables' AND xtype = 'U')
		DROP TABLE _ZSM_tables
END
GO

-- =============================================================================
-- Procedure _ExecProcOn_ZSMTables_AtZone
--	It does the specified operation on all the tables specified in _ZSM_tables.
--	It does not check for the current DB_NAME
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = '_ExecProcOn_ZSMTables_AtZone' AND xtype = 'P')
	DROP PROCEDURE _ExecProcOn_ZSMTables_AtZone
GO

CREATE PROCEDURE _ExecProcOn_ZSMTables_AtZone
(
	@p_centre_code			CHAR (3),
	@p_stored_proc			VARCHAR (50),
	@p_is_sort_ascending	VARCHAR (3)		=	'Yes',
	@p_is_at_centre_only	VARCHAR (3)		=	'No',
	@p_is_import_export		VARCHAR (3)		=	'No',
	@p_identity_action		CHAR (1)		=   '%',
	@p_is_audit_table		VARCHAR (3)		=	'No'
)
WITH ENCRYPTION
AS
	DECLARE
		@stmt				VARCHAR (1000),
		@tbl_nm				VARCHAR (50),
		@identity_action	CHAR (1),
		@seed_value			INT;
BEGIN
	IF (@p_centre_code IS NULL OR @p_centre_code = '')
	BEGIN
		RAISERROR('"Centre Code" must be specified', 16, 1)
		RETURN;
	END

	IF (@p_is_sort_ascending = 'Yes')
		UPDATE	_ZSM_tables
			SET	table_sq	=	table_id;
	ELSE IF (@p_is_sort_ascending = 'No')
		UPDATE	_ZSM_tables
			SET	table_sq	=	0 - table_id;
	ELSE
	BEGIN
		RAISERROR('"Whether Sorting is Ascending" can be specified as Yes or No only', 16, 1)
		RETURN;
	END

	IF (@p_is_audit_table =	'No')
		DECLARE	crsr CURSOR STATIC	FOR
			SELECT	table_nm, identity_action, COALESCE (seed_value, 0)
			FROM	_ZSM_tables
			WHERE	is_at_centre_only	LIKE	@p_is_at_centre_only
			AND		is_import_export	LIKE	@p_is_import_export
			AND		identity_action		LIKE	@p_identity_action
			ORDER BY table_sq;
	ELSE IF (@p_is_audit_table =	'Yes')
		DECLARE	crsr CURSOR STATIC	FOR
			SELECT	'adt_' + table_nm, 'N', COALESCE (seed_value, 0)
			FROM	_ZSM_tables
			WHERE	is_at_centre_only	LIKE	@p_is_at_centre_only
			AND		is_import_export	LIKE	@p_is_import_export
			AND		identity_action		LIKE	@p_identity_action
			AND		has_audit_table		=		'Yes'
			ORDER BY table_sq;
	
	OPEN crsr;

	FETCH crsr
		INTO	@tbl_nm, @identity_action, @seed_value
	
	WHILE (@@FETCH_STATUS = 0)
	BEGIN
		SET	@stmt	=	'EXEC ' + @p_stored_proc + ' ''' + @p_centre_code + ''', ''' + @tbl_nm + ''', ''' + @identity_action + ''', ' + CONVERT(VARCHAR, @seed_value) + ';';
		EXEC (@stmt);

--print @stmt
		FETCH crsr
			INTO	@tbl_nm, @identity_action, @seed_value
	END

	CLOSE crsr;

	DEALLOCATE crsr;
END
GO

-- =============================================================================
-- Procedure _ExecProcOn_ZSMTables
--	It does the specified operation on all the tables specified in _ZSM_tables.
--	Calls _ExecProcOn_ZSMTables_AtZone but also check the current DB_NAME
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = '_ExecProcOn_ZSMTables' AND xtype = 'P')
	DROP PROCEDURE _ExecProcOn_ZSMTables
GO

CREATE PROCEDURE _ExecProcOn_ZSMTables
(
	@p_centre_code			CHAR (3),
	@p_stored_proc			VARCHAR (50),
	@p_is_sort_ascending	VARCHAR (3)		=	'Yes',
	@p_is_at_centre_only	VARCHAR (3)		=	'No',
	@p_is_import_export		VARCHAR (3)		=	'No',
	@p_identity_action		CHAR (1)		=   '%',
	@p_is_audit_table		VARCHAR (3)		=	'No'
)
WITH ENCRYPTION
AS
	DECLARE
		@stmt				VARCHAR (1000);

BEGIN
	SET @stmt = 'ZSM_' + @p_centre_code;
	IF (@stmt != DB_NAME())
	BEGIN
		RAISERROR('Current Database is not for the ZSM as per the Centre Code specified', 16, 1)
		RETURN;
	END

	EXEC _ExecProcOn_ZSMTables_AtZone @p_centre_code, @p_stored_proc, @p_is_sort_ascending,
			@p_is_at_centre_only, @p_is_import_export, @p_identity_action, @p_is_audit_table
END
GO

-- =============================================================================
-- Procedure _DropProcedures
--	It drops all the temporary procedures
--	Need to add drop statements for any newly added procedures
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = '_DropProcedures' AND xtype = 'P')
	DROP PROCEDURE _DropProcedures
GO

CREATE PROCEDURE _DropProcedures
WITH ENCRYPTION
AS
BEGIN

	IF EXISTS (SELECT * FROM sysobjects WHERE name = '_Create_ZSM_tables_table' AND xtype = 'P')
		DROP PROCEDURE _Create_ZSM_tables_table
	IF EXISTS (SELECT * FROM sysobjects WHERE name = '_Drop_ZSM_tables_table' AND xtype = 'P')
		DROP PROCEDURE _Drop_ZSM_tables_table
	IF EXISTS (SELECT * FROM sysobjects WHERE name = '_CountZoneRecordsAfter' AND xtype = 'P')
		DROP PROCEDURE _CountZoneRecordsAfter
	IF EXISTS (SELECT * FROM sysobjects WHERE name = '_CountZoneRecordsBefore' AND xtype = 'P')
		DROP PROCEDURE _CountZoneRecordsBefore
	IF EXISTS (SELECT * FROM sysobjects WHERE name = '_CountRecordsAfter' AND xtype = 'P')
		DROP PROCEDURE _CountRecordsAfter
	IF EXISTS (SELECT * FROM sysobjects WHERE name = '_CountRecordsBefore' AND xtype = 'P')
		DROP PROCEDURE _CountRecordsBefore
	IF EXISTS (SELECT * FROM sysobjects WHERE name = '_CountRecords' AND xtype = 'P')
		DROP PROCEDURE _CountRecords
	IF EXISTS (SELECT * FROM sysobjects WHERE name = '_CountZoneRecordsBeforeOperation' AND xtype = 'P')
		DROP PROCEDURE _CountZoneRecordsBeforeOperation
	IF EXISTS (SELECT * FROM sysobjects WHERE name = '_UpdateRecordCount' AND xtype = 'P')
		DROP PROCEDURE _UpdateRecordCount

	IF EXISTS (SELECT * FROM sysobjects WHERE name = '_ExecProcOn_ZSMTables_AtZone' AND xtype = 'P')
		DROP PROCEDURE _ExecProcOn_ZSMTables_AtZone
	IF EXISTS (SELECT * FROM sysobjects WHERE name = '_ExecProcOn_ZSMTables' AND xtype = 'P')
		DROP PROCEDURE _ExecProcOn_ZSMTables
	IF EXISTS (SELECT * FROM sysobjects WHERE name = '_InsertCentreRecordsInZone' AND xtype = 'P')
		DROP PROCEDURE _InsertCentreRecordsInZone
	IF EXISTS (SELECT * FROM sysobjects WHERE name = '_DeleteZoneRecords' AND xtype = 'P')
		DROP PROCEDURE _DeleteZoneRecords
	IF EXISTS (SELECT * FROM sysobjects WHERE name = '__GetCentreSewadars' AND xtype = 'P')
		DROP PROCEDURE __GetCentreSewadars
	IF EXISTS (SELECT * FROM sysobjects WHERE name = '_ExportProgrammeCentreLists' AND xtype = 'P')
		DROP PROCEDURE _ExportProgrammeCentreLists
	IF EXISTS (SELECT * FROM sysobjects WHERE name = '_ReportAnomalies' AND xtype = 'P')
		DROP PROCEDURE _ReportAnomalies
	IF EXISTS (SELECT * FROM sysobjects WHERE name = '__CheckCentreCode' AND xtype = 'P')
		DROP PROCEDURE __CheckCentreCode
	IF EXISTS (SELECT * FROM sysobjects WHERE name = '_DropProcedures' AND xtype = 'P')
		DROP PROCEDURE _DropProcedures
	IF EXISTS (SELECT * FROM sysobjects WHERE name = '__GetOrderByClause' AND xtype = 'P')
		DROP PROCEDURE __GetOrderByClause

	IF EXISTS (SELECT * FROM sysobjects WHERE name = '_AddSeedsForNewSatsangCentre' AND xtype = 'P')
		DROP PROCEDURE _AddSeedsForNewSatsangCentre
	IF EXISTS (SELECT * FROM sysobjects WHERE name = '_SetupForCentre' AND xtype = 'P')
		DROP PROCEDURE _SetupForCentre

	IF EXISTS (SELECT * FROM sysobjects WHERE name = 'ExportFromZoneToCentre' AND xtype = 'P')
		DROP PROCEDURE  ExportFromZoneToCentre
	IF EXISTS (SELECT * FROM sysobjects WHERE name = 'ImportFromCentreToZone' AND xtype = 'P')
		DROP PROCEDURE  ImportFromCentreToZone
	IF EXISTS (SELECT * FROM sysobjects WHERE name = '_MoveDataToImpTable' AND xtype = 'P')
		DROP PROCEDURE  _MoveDataToImpTable
	IF EXISTS (SELECT * FROM sysobjects WHERE name = '_MoveDataFromImpTable' AND xtype = 'P')
		DROP PROCEDURE  _MoveDataFromImpTable
	IF EXISTS (SELECT * FROM sysobjects WHERE name = '_CopyZSMTable' AND xtype = 'P')
		DROP PROCEDURE  _CopyZSMTable
	IF EXISTS (SELECT * FROM sysobjects WHERE name = '_GetTableConditions' AND xtype = 'P')
		DROP PROCEDURE  _GetTableConditions
	IF EXISTS (SELECT * FROM sysobjects WHERE name = '_DropZSMTable' AND xtype = 'P')
		DROP PROCEDURE  _DropZSMTable
	IF EXISTS (SELECT * FROM sysobjects WHERE name = '_DropImpTable' AND xtype = 'P')
		DROP PROCEDURE  _DropImpTable
	IF EXISTS (SELECT * FROM sysobjects WHERE name = '_InitSeedOfCentreTable' AND xtype = 'P')
		DROP PROCEDURE  _InitSeedOfCentreTable
	IF EXISTS (SELECT * FROM sysobjects WHERE name = '_UpdateSatsangCentresSeeds' AND xtype = 'P')
		DROP PROCEDURE  _UpdateSatsangCentresSeeds
	IF EXISTS (SELECT * FROM sysobjects WHERE name = '_MovePhotosForCentre' AND xtype = 'P')
		DROP PROCEDURE  _MovePhotosForCentre
	IF EXISTS (SELECT * FROM sysobjects WHERE name = '_CopyPhotosDB' AND xtype = 'P')
		DROP PROCEDURE  _CopyPhotosDB
	IF EXISTS (SELECT * FROM sysobjects WHERE name = '_CopyFromZoneTable' AND xtype = 'P')
		DROP PROCEDURE  _CopyFromZoneTable
	IF EXISTS (SELECT * FROM sysobjects WHERE name = '_CopyToZoneTable' AND xtype = 'P')
		DROP PROCEDURE  _CopyToZoneTable
END
GO

-- =============================================================================
-- vim:ts=4 ht=8 sw=4 guifont=Lucida_Console

