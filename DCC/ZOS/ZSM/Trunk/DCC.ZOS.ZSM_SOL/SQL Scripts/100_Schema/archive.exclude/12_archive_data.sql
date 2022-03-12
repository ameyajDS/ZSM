/* ==================================================================================
    Source File		:	archive_data.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Aug 02 18:43 IST 2012
    Version			:	1.00
    Last updated	:	Aug 02, 2012
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:	
    Reviewed On		:	
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		This script archives the audit data from ZSM database tables to ZSM_Archive.
    ==================================================================================
								   									  Revision History
    ----------------------------------------------------------------------------------
     JL : 02-Aug-2011
		*   Initial version
   ==================================================================================*/



EXEC _CopyTableData 'audit_logs', 'ZSM', 'ZSM_Archive'

EXEC _MoveTableData 'adt_badge_templates', 'ZSM', 'ZSM_Archive'
EXEC _MoveTableData 'adt_badge_templates_sewadar_status', 'ZSM', 'ZSM_Archive'
EXEC _MoveTableData 'adt_colours', 'ZSM', 'ZSM_Archive'
EXEC _MoveTableData 'adt_credit_specifications', 'ZSM', 'ZSM_Archive'
EXEC _MoveTableData 'adt_credit_specifications_sewas', 'ZSM', 'ZSM_Archive'
EXEC _MoveTableData 'adt_departments', 'ZSM', 'ZSM_Archive'
EXEC _MoveTableData 'adt_departments_satsang_centres', 'ZSM', 'ZSM_Archive'
EXEC _MoveTableData 'adt_sub_departments', 'ZSM', 'ZSM_Archive'
EXEC _MoveTableData 'adt_sub_departments_satsang_centres', 'ZSM', 'ZSM_Archive'
EXEC _MoveTableData 'adt_generic_attributes', 'ZSM', 'ZSM_Archive'
EXEC _MoveTableData 'adt_generic_attributes_list_values', 'ZSM', 'ZSM_Archive'
EXEC _MoveTableData 'adt_generic_attributes_status', 'ZSM', 'ZSM_Archive'
EXEC _MoveTableData 'adt_generic_attributes_satsang_centres', 'ZSM', 'ZSM_Archive'
EXEC _MoveTableData 'adt_post_offices_or_cities', 'ZSM', 'ZSM_Archive'
EXEC _MoveTableData 'adt_satsang_centres_details', 'ZSM', 'ZSM_Archive'
EXEC _MoveTableData 'adt_satsang_centre_functionaries', 'ZSM', 'ZSM_Archive'
EXEC _MoveTableData 'adt_sewas', 'ZSM', 'ZSM_Archive'
EXEC _MoveTableData 'adt_sewas_periods', 'ZSM', 'ZSM_Archive'
EXEC _MoveTableData 'adt_sewas_sewa_shifts', 'ZSM', 'ZSM_Archive'
EXEC _MoveTableData 'adt_sewas_satsang_centres', 'ZSM', 'ZSM_Archive'
EXEC _MoveTableData 'adt_sewa_exemptions', 'ZSM', 'ZSM_Archive'
EXEC _MoveTableData 'adt_sewa_exemption_applicable_sewas', 'ZSM', 'ZSM_Archive'
EXEC _MoveTableData 'adt_system_information_codes', 'ZSM', 'ZSM_Archive'
EXEC _MoveTableData 'adt_system_information_values', 'ZSM', 'ZSM_Archive'
EXEC _MoveTableData 'adt_weekly_sewa_locations', 'ZSM', 'ZSM_Archive'
EXEC _MoveTableData 'adt_sewadars', 'ZSM', 'ZSM_Archive'
EXEC _MoveTableData 'adt_sewadars_details', 'ZSM', 'ZSM_Archive'
EXEC _MoveTableData 'adt_sewadars_addresses', 'ZSM', 'ZSM_Archive'
EXEC _MoveTableData 'adt_sewadars_qualifications', 'ZSM', 'ZSM_Archive'
EXEC _MoveTableData 'adt_sewadars_skills', 'ZSM', 'ZSM_Archive'
EXEC _MoveTableData 'adt_sewadars_remarks', 'ZSM', 'ZSM_Archive'
EXEC _MoveTableData 'adt_sewadars_registrations', 'ZSM', 'ZSM_Archive'
EXEC _MoveTableData 'adt_sewadars_transfers', 'ZSM', 'ZSM_Archive'
EXEC _MoveTableData 'adt_sewadars_status_changes', 'ZSM', 'ZSM_Archive'
EXEC _MoveTableData 'adt_sewadars_responsibility_changes', 'ZSM', 'ZSM_Archive'
EXEC _MoveTableData 'adt_sewadars_particulars', 'ZSM', 'ZSM_Archive'
EXEC _MoveTableData 'adt_sewadars_attributes', 'ZSM', 'ZSM_Archive'
EXEC _MoveTableData 'adt_sewa_teams', 'ZSM', 'ZSM_Archive'
EXEC _MoveTableData 'adt_sewa_team_wise_sewadars', 'ZSM', 'ZSM_Archive'
EXEC _MoveTableData 'adt_arbitrary_daily_presences', 'ZSM', 'ZSM_Archive'
EXEC _MoveTableData 'adt_arbitrary_shift_presences', 'ZSM', 'ZSM_Archive'
EXEC _MoveTableData 'adt_arbitrary_summarised_exemptions', 'ZSM', 'ZSM_Archive'
EXEC _MoveTableData 'adt_sewadar_wise_sewa_summaries', 'ZSM', 'ZSM_Archive'
EXEC _MoveTableData 'adt_credit_specifications_sewadars', 'ZSM', 'ZSM_Archive'
EXEC _MoveTableData 'adt_generic_sewadar_lists', 'ZSM', 'ZSM_Archive'
EXEC _MoveTableData 'adt_generic_sewadar_lists_sewadars', 'ZSM', 'ZSM_Archive'
EXEC _MoveTableData 'adt_scanning_jobs', 'ZSM', 'ZSM_Archive'
EXEC _MoveTableData 'adt_scanning_jobs_periods', 'ZSM', 'ZSM_Archive'
EXEC _MoveTableData 'adt_scanning_sub_jobs', 'ZSM', 'ZSM_Archive'
EXEC _MoveTableData 'adt_scanning_sub_jobs_validations', 'ZSM', 'ZSM_Archive'
EXEC _MoveTableData 'adt_scanning_sub_jobs_valid_combinations', 'ZSM', 'ZSM_Archive'
EXEC _MoveTableData 'adt_scanning_jobs_controlling_dates', 'ZSM', 'ZSM_Archive'
EXEC _MoveTableData 'adt_scanned_badges', 'ZSM', 'ZSM_Archive'

EXEC _DeleteTableData 'audit_logs', 'ZSM'


-- =============================================================================
-- vim:ts=4 ht=8 sw=4
