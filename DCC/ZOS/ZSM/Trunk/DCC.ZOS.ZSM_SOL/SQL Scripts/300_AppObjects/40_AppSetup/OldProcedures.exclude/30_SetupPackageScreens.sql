
--[[Insert Screens IDs and Name in Package_screens table

DELETE FROM	user_role_granted_actions	WHERE	package_id		= 'ZSM';
DELETE FROM	package_screen_Actions		WHERE	package_id		= 'ZSM';
DELETE FROM	User_Role_Privileges		WHERE	package_id		= 'ZSM';
DELETE FROM package_screens				WHERE	package_id		= 'ZSM';
DELETE FROM	Application_screen_audits	WHERE	application_id	= 'ZSM_MUM'

-------------------------------------Activities Screens---------------------
EXEC inspackagescreen
@package_id = 'ZSM',
@screen_id = 'ACT_01',
@screen_nm = 'Sewadars',
@is_select_supported = 'Yes',
@is_insert_supported = 'Yes',
@is_update_supported = 'Yes',
@is_delete_supported = 'Yes',
@is_print_supported = 'No',
@is_update_changes_supported = 'Yes',
@is_delete_changes_supported = 'Yes',
@is_partial_save_supported = 'No'
EXEC insApplicationScreenAudit 'ZSM_MUM', 'ACT_01', 'Yes', 'Yes', 'Yes', 'Yes', 'No','Yes','Yes'

EXEC inspackagescreen
@package_id = 'ZSM',
@screen_id = 'ACT_02',
@screen_nm = 'Sewadar Details',
@is_select_supported = 'Yes',
@is_insert_supported = 'Yes',
@is_update_supported = 'Yes',
@is_delete_supported = 'Yes',
@is_print_supported = 'No',
@is_update_changes_supported = 'Yes',
@is_delete_changes_supported = 'Yes',
@is_partial_save_supported = 'No'
EXEC insApplicationScreenAudit 'ZSM_MUM', 'ACT_02', 'Yes', 'Yes', 'Yes', 'Yes', 'No','Yes','Yes'

EXEC inspackagescreen
@package_id = 'ZSM',
@screen_id = 'ACT_03',
@screen_nm = 'Sewadars Information',
@is_select_supported = 'Yes',
@is_insert_supported = 'Yes',
@is_update_supported = 'Yes',
@is_delete_supported = 'Yes',
@is_print_supported = 'No',
@is_update_changes_supported = 'Yes',
@is_delete_changes_supported = 'Yes',
@is_partial_save_supported = 'No'
EXEC insApplicationScreenAudit 'ZSM_MUM', 'ACT_03', 'Yes', 'Yes', 'Yes', 'Yes', 'No','Yes','Yes'


EXEC inspackagescreen
@package_id = 'ZSM',
@screen_id = 'ACT_04',
@screen_nm = 'Sewadars Particulars',
@is_select_supported = 'Yes',
@is_insert_supported = 'Yes',
@is_update_supported = 'Yes',
@is_delete_supported = 'Yes',
@is_print_supported = 'No',
@is_update_changes_supported = 'Yes',
@is_delete_changes_supported = 'Yes',
@is_partial_save_supported = 'No'
EXEC insApplicationScreenAudit 'ZSM_MUM', 'ACT_04', 'Yes', 'Yes', 'Yes', 'Yes', 'No','Yes','Yes'

EXEC inspackagescreen
@package_id = 'ZSM',
@screen_id = 'ACT_05',
@screen_nm = 'Department Transfers',
@is_select_supported = 'Yes',
@is_insert_supported = 'Yes',
@is_update_supported = 'Yes',
@is_delete_supported = 'Yes',
@is_print_supported = 'No',
@is_update_changes_supported = 'Yes',
@is_delete_changes_supported = 'Yes',
@is_partial_save_supported = 'No'
EXEC insApplicationScreenAudit 'ZSM_MUM', 'ACT_05', 'Yes', 'Yes', 'Yes', 'Yes', 'No','Yes','Yes'

EXEC inspackagescreen
@package_id = 'ZSM',
@screen_id = 'ACT_06',
@screen_nm = 'Satsang Centre Transfers',
@is_select_supported = 'Yes',
@is_insert_supported = 'Yes',
@is_update_supported = 'No',
@is_delete_supported = 'No',
@is_print_supported = 'No',
@is_update_changes_supported = 'No',
@is_delete_changes_supported = 'No',
@is_partial_save_supported = 'No'
EXEC insApplicationScreenAudit 'ZSM_MUM', 'ACT_06', 'Yes', 'Yes', 'No', 'No', 'No','No','No'

EXEC inspackagescreen
@package_id = 'ZSM',
@screen_id = 'ACT_07',
@screen_nm = 'Badge Printing',
@is_select_supported = 'No',
@is_insert_supported = 'Yes',
@is_update_supported = 'No',
@is_delete_supported = 'No',
@is_print_supported = 'No',
@is_update_changes_supported = 'No',
@is_delete_changes_supported = 'No',
@is_partial_save_supported = 'No'

EXEC inspackagescreen
@package_id = 'ZSM',
@screen_id = 'ACT_08',
@screen_nm = 'Roster Printing',
@is_select_supported = 'No',
@is_insert_supported = 'Yes',
@is_update_supported = 'No',
@is_delete_supported = 'No',
@is_print_supported = 'No',
@is_update_changes_supported = 'No',
@is_delete_changes_supported = 'No',
@is_partial_save_supported = 'No'
EXEC insApplicationScreenAudit 'ZSM_MUM', 'ACT_08', 'Yes', 'No', 'No', 'No', 'Yes','No','No'

EXEC inspackagescreen
@package_id = 'ZSM',
@screen_id = 'ACT_09',
@screen_nm = 'Import Existing Sewadars Photos',
@is_select_supported = 'No',
@is_insert_supported = 'Yes',
@is_update_supported = 'No',
@is_delete_supported = 'No',
@is_print_supported = 'No',
@is_update_changes_supported = 'No',
@is_delete_changes_supported = 'No',
@is_partial_save_supported = 'No'
EXEC insApplicationScreenAudit 'ZSM_MUM', 'ACT_09', 'Yes', 'No', 'No', 'No', 'No','No','No'

EXEC inspackagescreen
@package_id = 'ZSM',
@screen_id = 'ACT_10',
@screen_nm = 'Import New Sewadars Photos',
@is_select_supported = 'No',
@is_insert_supported = 'Yes',
@is_update_supported = 'No',
@is_delete_supported = 'No',
@is_print_supported = 'No',
@is_update_changes_supported = 'No',
@is_delete_changes_supported = 'No',
@is_partial_save_supported = 'No'
EXEC insApplicationScreenAudit 'ZSM_MUM', 'ACT_10', 'Yes', 'No', 'No', 'No', 'No','No','No'

EXEC inspackagescreen
@package_id = 'ZSM',
@screen_id = 'ACT_12',
@screen_nm = 'Sewadars Lists',
@is_select_supported = 'Yes',
@is_insert_supported = 'Yes',
@is_update_supported = 'Yes',
@is_delete_supported = 'Yes',
@is_print_supported = 'No',
@is_update_changes_supported = 'Yes',
@is_delete_changes_supported = 'Yes',
@is_partial_save_supported = 'No'
EXEC insApplicationScreenAudit 'ZSM_MUM', 'ACT_12', 'Yes', 'Yes', 'Yes', 'Yes', 'No','Yes','Yes'

EXEC inspackagescreen
@package_id = 'ZSM',
@screen_id = 'ACT_13',
@screen_nm = 'Merge Sewadars',
@is_select_supported = 'Yes',
@is_insert_supported = 'Yes',
@is_update_supported = 'No',
@is_delete_supported = 'No',
@is_print_supported = 'No',
@is_update_changes_supported = 'No',
@is_delete_changes_supported = 'No',
@is_partial_save_supported = 'No'
EXEC insApplicationScreenAudit 'ZSM_MUM', 'ACT_13', 'Yes', 'No', 'No', 'Yes', 'No','No','No'

EXEC inspackagescreen
@package_id = 'ZSM',
@screen_id = 'ACT_14',
@screen_nm = 'Sewadars in Sewadar List',
@is_select_supported = 'Yes',
@is_insert_supported = 'Yes',
@is_update_supported = 'Yes',
@is_delete_supported = 'Yes',
@is_print_supported = 'No',
@is_update_changes_supported = 'Yes',
@is_delete_changes_supported = 'Yes',
@is_partial_save_supported = 'No'
EXEC insApplicationScreenAudit 'ZSM_MUM', 'ACT_14', 'Yes', 'Yes', 'Yes', 'Yes', 'No','Yes','Yes'

EXEC inspackagescreen
@package_id = 'ZSM',
@screen_id = 'ACT_19',
@screen_nm = 'Scanning Control Dates',            
@is_select_supported = 'Yes',
@is_insert_supported = 'Yes',
@is_update_supported = 'Yes',
@is_delete_supported = 'Yes',
@is_print_supported = 'No',
@is_update_changes_supported = 'No',
@is_delete_changes_supported = 'No',
@is_partial_save_supported = 'No'
EXEC insApplicationScreenAudit 'ZSM_MUM', 'ACT_19', 'Yes', 'Yes', 'Yes', 'Yes', 'No','No','No'

EXEC inspackagescreen
@package_id = 'ZSM',
@screen_id = 'ACT_20',
@screen_nm = 'Badge Scan',
@is_select_supported = 'Yes',
@is_insert_supported = 'No',
@is_update_supported = 'No',
@is_delete_supported = 'No',
@is_print_supported = 'No',
@is_update_changes_supported = 'No',
@is_delete_changes_supported = 'No',
@is_partial_save_supported = 'No'
EXEC insApplicationScreenAudit 'ZSM_MUM', 'ACT_20', 'No', 'No', 'No', 'Yes', 'No','No','No'

EXEC inspackagescreen
@package_id = 'ZSM',
@screen_id = 'ACT_22',
@screen_nm = 'Trainee Sewadars',
@is_select_supported = 'Yes',
@is_insert_supported = 'Yes',
@is_update_supported = 'Yes',
@is_delete_supported = 'Yes',
@is_print_supported = 'No',
@is_update_changes_supported = 'Yes',
@is_delete_changes_supported = 'Yes',
@is_partial_save_supported = 'No'
EXEC insApplicationScreenAudit 'ZSM_MUM', 'ACT_22', 'Yes', 'Yes', 'Yes', 'Yes', 'No','Yes','Yes'

EXEC inspackagescreen
@package_id = 'ZSM',
@screen_id = 'ACT_23',
@screen_nm = 'Open Sewadars',
@is_select_supported = 'Yes',
@is_insert_supported = 'Yes',
@is_update_supported = 'Yes',
@is_delete_supported = 'Yes',
@is_print_supported = 'No',
@is_update_changes_supported = 'Yes',
@is_delete_changes_supported = 'Yes',
@is_partial_save_supported = 'No'
EXEC insApplicationScreenAudit 'ZSM_MUM', 'ACT_23', 'Yes', 'Yes', 'Yes', 'Yes', 'No','Yes','Yes'
-------------------------------------Attendance Screens---------------------
EXEC inspackagescreen
@package_id = 'ZSM',
@screen_id = 'ATT_01',
@screen_nm = 'Sewadar Wise Sewa Summaries',
@is_select_supported = 'Yes',
@is_insert_supported = 'Yes',
@is_update_supported = 'Yes',
@is_delete_supported = 'Yes',
@is_print_supported = 'No',
@is_update_changes_supported = 'Yes',
@is_delete_changes_supported = 'Yes',
@is_partial_save_supported = 'No'
EXEC insApplicationScreenAudit 'ZSM_MUM', 'ATT_01', 'Yes', 'Yes', 'Yes', 'Yes', 'No','Yes','Yes'

EXEC inspackagescreen
@package_id = 'ZSM',
@screen_id = 'ATT_02',
@screen_nm = 'Arbitrary Daily Presences',
@is_select_supported = 'Yes',
@is_insert_supported = 'Yes',
@is_update_supported = 'Yes',
@is_delete_supported = 'Yes',
@is_print_supported = 'No',
@is_update_changes_supported = 'Yes',
@is_delete_changes_supported = 'Yes',
@is_partial_save_supported = 'No'
EXEC insApplicationScreenAudit 'ZSM_MUM', 'ATT_02', 'Yes', 'Yes', 'Yes', 'Yes', 'No','Yes','Yes'


EXEC inspackagescreen
@package_id = 'ZSM',
@screen_id = 'ATT_03',
@screen_nm = 'Arbitrary Summarised Exemptions',
@is_select_supported = 'Yes',
@is_insert_supported = 'Yes',
@is_update_supported = 'Yes',
@is_delete_supported = 'Yes',
@is_print_supported = 'No',
@is_update_changes_supported = 'Yes',
@is_delete_changes_supported = 'Yes',
@is_partial_save_supported = 'No'
EXEC insApplicationScreenAudit 'ZSM_MUM', 'ATT_03', 'Yes', 'Yes', 'Yes', 'Yes', 'No','Yes','Yes'


EXEC inspackagescreen
@package_id = 'ZSM',
@screen_id = 'ATT_04',
@screen_nm = 'Team - Daily (Day-wise)',
@is_select_supported = 'Yes',
@is_insert_supported = 'Yes',
@is_update_supported = 'Yes',
@is_delete_supported = 'Yes',
@is_print_supported = 'No',
@is_update_changes_supported = 'No',
@is_delete_changes_supported = 'No',
@is_partial_save_supported = 'No'
EXEC insApplicationScreenAudit 'ZSM_MUM', 'ATT_04', 'Yes', 'Yes', 'Yes', 'Yes', 'No','Yes','Yes'


EXEC inspackagescreen
@package_id = 'ZSM',
@screen_id = 'ATT_05',
@screen_nm = 'Team - Daily (Sewadar-wise)',
@is_select_supported = 'Yes',
@is_insert_supported = 'Yes',
@is_update_supported = 'Yes',
@is_delete_supported = 'Yes',
@is_print_supported = 'No',
@is_update_changes_supported = 'No',
@is_delete_changes_supported = 'No',
@is_partial_save_supported = 'No'
EXEC insApplicationScreenAudit 'ZSM_MUM', 'ATT_05', 'Yes', 'Yes', 'Yes', 'Yes', 'No','Yes','Yes'


EXEC inspackagescreen
@package_id = 'ZSM',
@screen_id = 'ATT_06',
@screen_nm = 'Arbitrary Shift Presences',
@is_select_supported = 'Yes',
@is_insert_supported = 'Yes',
@is_update_supported = 'No',
@is_delete_supported = 'Yes',
@is_print_supported = 'No',
@is_update_changes_supported = 'No',
@is_delete_changes_supported = 'Yes',
@is_partial_save_supported = 'No'
EXEC insApplicationScreenAudit 'ZSM_MUM', 'ATT_06', 'Yes', 'No', 'Yes', 'Yes', 'No','No','Yes'

-------------------------------------Reports Screens---------------------
EXEC inspackagescreen
@package_id = 'ZSM',
@screen_id = 'RPT_01',
@screen_nm = 'Sewadars Reports',
@is_select_supported = 'No',
@is_insert_supported = 'Yes',
@is_update_supported = 'No',
@is_delete_supported = 'No',
@is_print_supported = 'No',
@is_update_changes_supported = 'No',
@is_delete_changes_supported = 'No',
@is_partial_save_supported = 'No'
EXEC insApplicationScreenAudit 'ZSM_MUM', 'RPT_01', 'No', 'No', 'No', 'No', 'Yes','No','No'

EXEC inspackagescreen
@package_id = 'ZSM',
@screen_id = 'RPT_02',
@screen_nm = 'Attendance Reports',
@is_select_supported = 'No',
@is_insert_supported = 'Yes',
@is_update_supported = 'No',
@is_delete_supported = 'No',
@is_print_supported = 'No',
@is_update_changes_supported = 'No',
@is_delete_changes_supported = 'No',
@is_partial_save_supported = 'No'
EXEC insApplicationScreenAudit 'ZSM_MUM', 'RPT_02', 'No', 'No', 'No', 'No', 'Yes','No','No'

EXEC inspackagescreen
@package_id = 'ZSM',
@screen_id = 'RPT_03',
@screen_nm = 'Miscellaneous Reports',
@is_select_supported = 'No',
@is_insert_supported = 'Yes',
@is_update_supported = 'No',
@is_delete_supported = 'No',
@is_print_supported = 'No',
@is_update_changes_supported = 'No',
@is_delete_changes_supported = 'No',
@is_partial_save_supported = 'No'
EXEC insApplicationScreenAudit 'ZSM_MUM', 'RPT_03', 'No', 'No', 'No', 'No', 'Yes','No','No'

EXEC inspackagescreen
@package_id = 'ZSM',
@screen_id = 'RPT_04',
@screen_nm = 'Discrepancy Reports',
@is_select_supported = 'No',
@is_insert_supported = 'Yes',
@is_update_supported = 'No',
@is_delete_supported = 'No',
@is_print_supported = 'No',
@is_update_changes_supported = 'No',
@is_delete_changes_supported = 'No',
@is_partial_save_supported = 'No'
EXEC insApplicationScreenAudit 'ZSM_MUM', 'RPT_04', 'No', 'No', 'No', 'No', 'Yes','No','No'

EXEC inspackagescreen
@package_id = 'ZSM',
@screen_id = 'RPT_05',
@screen_nm = 'Photo Reports',
@is_select_supported = 'No',
@is_insert_supported = 'Yes',
@is_update_supported = 'No',
@is_delete_supported = 'No',
@is_print_supported = 'No',
@is_update_changes_supported = 'No',
@is_delete_changes_supported = 'No',
@is_partial_save_supported = 'No'
EXEC insApplicationScreenAudit 'ZSM_MUM', 'RPT_05', 'No', 'No', 'No', 'No', 'Yes','No','No'

EXEC inspackagescreen
@package_id = 'ZSM',
@screen_id = 'RPT_06',
@screen_nm = 'Print Sewadar Details',
@is_select_supported = 'No',
@is_insert_supported = 'No',
@is_update_supported = 'No',
@is_delete_supported = 'No',
@is_print_supported = 'No',
@is_update_changes_supported = 'No',
@is_delete_changes_supported = 'No',
@is_partial_save_supported = 'No'
EXEC insApplicationScreenAudit 'ZSM_MUM', 'RPT_06', 'No', 'No', 'No', 'No','No','No','No'


-------------------------------------Entities Screens---------------------
EXEC inspackagescreen
@package_id = 'ZSM',
@screen_id = 'ENT_01',
@screen_nm = 'Countries',
@is_select_supported = 'Yes',
@is_insert_supported = 'Yes',
@is_update_supported = 'Yes',
@is_delete_supported = 'Yes',
@is_print_supported = 'No',
@is_update_changes_supported = 'Yes',
@is_delete_changes_supported = 'Yes',
@is_partial_save_supported = 'No'
EXEC insApplicationScreenAudit 'ZSM_MUM', 'ENT_01', 'Yes', 'Yes', 'Yes', 'Yes', 'No','Yes','Yes'

EXEC inspackagescreen
@package_id = 'ZSM',
@screen_id = 'ENT_02',
@screen_nm = 'States',
@is_select_supported = 'Yes',
@is_insert_supported = 'Yes',
@is_update_supported = 'Yes',
@is_delete_supported = 'Yes',
@is_print_supported = 'No',
@is_update_changes_supported = 'Yes',
@is_delete_changes_supported = 'Yes',
@is_partial_save_supported = 'No'
EXEC insApplicationScreenAudit 'ZSM_MUM', 'ENT_02', 'Yes', 'Yes', 'Yes', 'Yes', 'No','Yes','Yes'

EXEC inspackagescreen
@package_id = 'ZSM',
@screen_id = 'ENT_03',
@screen_nm = 'District or Cities',
@is_select_supported = 'Yes',
@is_insert_supported = 'Yes',
@is_update_supported = 'Yes',
@is_delete_supported = 'Yes',
@is_print_supported = 'No',
@is_update_changes_supported = 'Yes',
@is_delete_changes_supported = 'Yes',
@is_partial_save_supported = 'No'
EXEC insApplicationScreenAudit 'ZSM_MUM', 'ENT_03', 'Yes', 'Yes', 'Yes', 'Yes', 'No','Yes','Yes'

-- Not used in ZSM
--EXEC inspackagescreen
--@package_id = 'ZSM',
--@screen_id = 'ENT_04',
--@screen_nm = 'Occupations',
--@is_select_supported = 'Yes',
--@is_insert_supported = 'Yes',
--@is_update_supported = 'Yes',
--@is_delete_supported = 'Yes',
--@is_print_supported = 'No',
--@is_update_changes_supported = 'Yes',
--@is_delete_changes_supported = 'Yes',
--@is_partial_save_supported = 'No'
--EXEC insApplicationScreenAudit 'ZSM_MUM', 'ENT_04', 'Yes', 'Yes', 'Yes', 'Yes', 'No','Yes','Yes'

EXEC inspackagescreen
@package_id = 'ZSM',
@screen_id = 'ENT_05',
@screen_nm = 'Skills',
@is_select_supported = 'Yes',
@is_insert_supported = 'Yes',
@is_update_supported = 'Yes',
@is_delete_supported = 'Yes',
@is_print_supported = 'No',
@is_update_changes_supported = 'Yes',
@is_delete_changes_supported = 'Yes',
@is_partial_save_supported = 'No'
EXEC insApplicationScreenAudit 'ZSM_MUM', 'ENT_05', 'Yes', 'Yes', 'Yes', 'Yes', 'No','Yes','Yes'

EXEC inspackagescreen
@package_id = 'ZSM',
@screen_id = 'ENT_06',
@screen_nm = 'Colours',
@is_select_supported = 'Yes',
@is_insert_supported = 'Yes',
@is_update_supported = 'Yes',
@is_delete_supported = 'Yes',
@is_print_supported = 'No',
@is_update_changes_supported = 'Yes',
@is_delete_changes_supported = 'Yes',
@is_partial_save_supported = 'No'
EXEC insApplicationScreenAudit 'ZSM_MUM', 'ENT_06', 'Yes', 'Yes', 'Yes', 'Yes', 'No','Yes','Yes'

EXEC inspackagescreen
@package_id = 'ZSM',
@screen_id = 'ENT_07',
@screen_nm = 'Relations',
@is_select_supported = 'Yes',
@is_insert_supported = 'Yes',
@is_update_supported = 'Yes',
@is_delete_supported = 'Yes',
@is_print_supported = 'No',
@is_update_changes_supported = 'Yes',
@is_delete_changes_supported = 'Yes',
@is_partial_save_supported = 'No'
EXEC insApplicationScreenAudit 'ZSM_MUM', 'ENT_07', 'Yes', 'Yes', 'Yes', 'Yes', 'No','Yes','Yes'

EXEC inspackagescreen
@package_id = 'ZSM',
@screen_id = 'ENT_08',
@screen_nm = 'Qualification Types and Qualifications',
@is_select_supported = 'Yes',
@is_insert_supported = 'Yes',
@is_update_supported = 'Yes',
@is_delete_supported = 'Yes',
@is_print_supported = 'No',
@is_update_changes_supported = 'Yes',
@is_delete_changes_supported = 'Yes',
@is_partial_save_supported = 'No'
EXEC insApplicationScreenAudit 'ZSM_MUM', 'ENT_08', 'Yes', 'Yes', 'Yes', 'Yes', 'No','Yes','Yes'

EXEC inspackagescreen
@package_id = 'ZSM',
@screen_id = 'ENT_09',
@screen_nm = 'Qualification Subjects',
@is_select_supported = 'Yes',
@is_insert_supported = 'Yes',
@is_update_supported = 'Yes',
@is_delete_supported = 'Yes',
@is_print_supported = 'No',
@is_update_changes_supported = 'Yes',
@is_delete_changes_supported = 'Yes',
@is_partial_save_supported = 'No'
EXEC insApplicationScreenAudit 'ZSM_MUM', 'ENT_09', 'Yes', 'Yes', 'Yes', 'Yes', 'No','Yes','Yes'

-- Not used in ZSM
--EXEC inspackagescreen
--@package_id = 'ZSM',
--@screen_id = 'ENT_10',
--@screen_nm = 'Initiation Places',
--@is_select_supported = 'Yes',
--@is_insert_supported = 'Yes',
--@is_update_supported = 'Yes',
--@is_delete_supported = 'Yes',
--@is_print_supported = 'No',
--@is_update_changes_supported = 'Yes',
--@is_delete_changes_supported = 'Yes',
--@is_partial_save_supported = 'No'
--EXEC insApplicationScreenAudit 'ZSM_MUM', 'ENT_10', 'Yes', 'Yes', 'Yes', 'Yes', 'No','Yes','Yes'

EXEC inspackagescreen
@package_id = 'ZSM',
@screen_id = 'ENT_11',
@screen_nm = 'Satsang Centres Details',
@is_select_supported = 'Yes',
@is_insert_supported = 'Yes',
@is_update_supported = 'Yes',
@is_delete_supported = 'Yes',
@is_print_supported = 'No',
@is_update_changes_supported = 'Yes',
@is_delete_changes_supported = 'Yes',
@is_partial_save_supported = 'No'
EXEC insApplicationScreenAudit 'ZSM_MUM', 'ENT_11', 'Yes', 'Yes', 'Yes', 'Yes', 'No','Yes','Yes'

EXEC inspackagescreen
@package_id = 'ZSM',
@screen_id = 'ENT_12',
@screen_nm = 'Post Offices Or Cities',
@is_select_supported = 'Yes',
@is_insert_supported = 'Yes',
@is_update_supported = 'Yes',
@is_delete_supported = 'Yes',
@is_print_supported = 'No',
@is_update_changes_supported = 'Yes',
@is_delete_changes_supported = 'Yes',
@is_partial_save_supported = 'No'
EXEC insApplicationScreenAudit 'ZSM_MUM', 'ENT_12', 'Yes', 'Yes', 'Yes', 'Yes', 'No','Yes','Yes'

EXEC inspackagescreen
@package_id = 'ZSM',
@screen_id = 'ENT_13',
@screen_nm = 'Sewa Exemptions',
@is_select_supported = 'Yes',
@is_insert_supported = 'Yes',
@is_update_supported = 'Yes',
@is_delete_supported = 'Yes',
@is_print_supported = 'No',
@is_update_changes_supported = 'Yes',
@is_delete_changes_supported = 'Yes',
@is_partial_save_supported = 'No'
EXEC insApplicationScreenAudit 'ZSM_MUM', 'ENT_13', 'Yes', 'Yes', 'Yes', 'Yes', 'No','Yes','Yes'

EXEC inspackagescreen
@package_id = 'ZSM',
@screen_id = 'ENT_14',
@screen_nm = 'Weekly Sewa Locations',
@is_select_supported = 'Yes',
@is_insert_supported = 'Yes',
@is_update_supported = 'Yes',
@is_delete_supported = 'Yes',
@is_print_supported = 'No',
@is_update_changes_supported = 'Yes',
@is_delete_changes_supported = 'Yes',
@is_partial_save_supported = 'No'
EXEC insApplicationScreenAudit 'ZSM_MUM', 'ENT_14', 'Yes', 'Yes', 'Yes', 'Yes', 'No','Yes','Yes'

EXEC inspackagescreen
@package_id = 'ZSM',
@screen_id = 'ENT_15',
@screen_nm = 'Departments',
@is_select_supported = 'Yes',
@is_insert_supported = 'Yes',
@is_update_supported = 'Yes',
@is_delete_supported = 'Yes',
@is_print_supported = 'No',
@is_update_changes_supported = 'Yes',
@is_delete_changes_supported = 'Yes',
@is_partial_save_supported = 'No'
EXEC insApplicationScreenAudit 'ZSM_MUM', 'ENT_15', 'Yes', 'Yes', 'Yes', 'Yes', 'No','Yes','Yes'

-------------------------------------Setup Screens---------------------
EXEC inspackagescreen
@package_id = 'ZSM',
@screen_id = 'SET_01',
@screen_nm = 'Badge Templates',
@is_select_supported = 'Yes',
@is_insert_supported = 'Yes',
@is_update_supported = 'Yes',
@is_delete_supported = 'Yes',
@is_print_supported = 'No',
@is_update_changes_supported = 'Yes',
@is_delete_changes_supported = 'Yes',
@is_partial_save_supported = 'No'
EXEC insApplicationScreenAudit 'ZSM_MUM', 'SET_01', 'Yes', 'Yes', 'Yes', 'Yes', 'No','Yes','Yes'

EXEC inspackagescreen
@package_id = 'ZSM',
@screen_id = 'ENT_16',
@screen_nm = 'Credit Specifications',
@is_select_supported = 'Yes',
@is_insert_supported = 'Yes',
@is_update_supported = 'Yes',
@is_delete_supported = 'Yes',
@is_print_supported = 'No',
@is_update_changes_supported = 'Yes',
@is_delete_changes_supported = 'Yes',
@is_partial_save_supported = 'No'
EXEC insApplicationScreenAudit 'ZSM_MUM', 'ENT_16', 'Yes', 'Yes', 'Yes', 'Yes', 'No','Yes','Yes'

EXEC inspackagescreen
@package_id = 'ZSM',
@screen_id = 'SET_03',
@screen_nm = 'Sewas',
@is_select_supported = 'Yes',
@is_insert_supported = 'Yes',
@is_update_supported = 'Yes',
@is_delete_supported = 'Yes',
@is_print_supported = 'No',
@is_update_changes_supported = 'Yes',
@is_delete_changes_supported = 'Yes',
@is_partial_save_supported = 'No'
EXEC insApplicationScreenAudit 'ZSM_MUM', 'SET_03', 'Yes', 'Yes', 'Yes', 'Yes', 'No','Yes','Yes'

EXEC inspackagescreen
@package_id = 'ZSM',
@screen_id = 'SET_04',
@screen_nm = 'Scanning Jobs',
@is_select_supported = 'Yes',
@is_insert_supported = 'Yes',
@is_update_supported = 'Yes',
@is_delete_supported = 'Yes',
@is_print_supported = 'No',
@is_update_changes_supported = 'Yes',
@is_delete_changes_supported = 'Yes',
@is_partial_save_supported = 'No'
EXEC insApplicationScreenAudit 'ZSM_MUM', 'SET_04', 'Yes', 'Yes', 'Yes', 'Yes', 'No','Yes','Yes'

EXEC inspackagescreen
@package_id = 'ZSM',
@screen_id = 'SET_05',
@screen_nm = 'Sewa Teams',
@is_select_supported = 'Yes',
@is_insert_supported = 'No',
@is_update_supported = 'Yes',
@is_delete_supported = 'Yes',
@is_print_supported = 'No',
@is_update_changes_supported = 'Yes',
@is_delete_changes_supported = 'Yes',
@is_partial_save_supported = 'No'
EXEC insApplicationScreenAudit 'ZSM_MUM', 'SET_05', 'Yes', 'Yes', 'Yes', 'Yes', 'No','Yes','Yes'

EXEC inspackagescreen
@package_id = 'ZSM',
@screen_id = 'SET_06',
@screen_nm = 'System Information Codes',
@is_select_supported = 'Yes',
@is_insert_supported = 'Yes',
@is_update_supported = 'Yes',
@is_delete_supported = 'Yes',
@is_print_supported = 'No',
@is_update_changes_supported = 'Yes',
@is_delete_changes_supported = 'Yes',
@is_partial_save_supported = 'No'
EXEC insApplicationScreenAudit 'ZSM_MUM', 'SET_06', 'Yes', 'Yes', 'Yes', 'Yes', 'No','Yes','Yes'

EXEC inspackagescreen
@package_id = 'ZSM',
@screen_id = 'SET_07',
@screen_nm = 'Scanning Jobs Validations',
@is_select_supported = 'Yes',
@is_insert_supported = 'Yes',
@is_update_supported = 'Yes',
@is_delete_supported = 'Yes',
@is_print_supported = 'No',
@is_update_changes_supported = 'Yes',
@is_delete_changes_supported = 'No',
@is_partial_save_supported = 'No'
EXEC insApplicationScreenAudit 'ZSM_MUM', 'SET_07', 'Yes', 'Yes', 'No', 'Yes', 'No','Yes','Yes'

EXEC inspackagescreen
@package_id = 'ZSM',
@screen_id = 'SET_08',
@screen_nm = 'Generic Attributes',
@is_select_supported = 'Yes',
@is_insert_supported = 'Yes',
@is_update_supported = 'Yes',
@is_delete_supported = 'Yes',
@is_print_supported = 'No',
@is_update_changes_supported = 'Yes',
@is_delete_changes_supported = 'No',
@is_partial_save_supported = 'No'
EXEC insApplicationScreenAudit 'ZSM_MUM', 'SET_08', 'Yes', 'Yes', 'No', 'Yes', 'No','Yes','Yes'

-------------------------------------Photo Clicking Screens---------------------
EXEC inspackagescreen
@package_id = 'ZSM',
@screen_id = 'PHT_01',
@screen_nm = 'Sewadars Photo-clicking',
@is_select_supported = 'Yes',
@is_insert_supported = 'Yes',
@is_update_supported = 'No',
@is_delete_supported = 'No',
@is_print_supported = 'No',
@is_update_changes_supported = 'No',
@is_delete_changes_supported = 'No',
@is_partial_save_supported = 'No'
EXEC insApplicationScreenAudit 'ZSM_MUM', 'PHT_01', 'Yes', 'No', 'No', 'No', 'No','No','No'

EXEC inspackagescreen
@package_id = 'ZSM',
@screen_id = 'PHT_02',
@screen_nm = 'New Sewadars Photo-clicking',
@is_select_supported = 'No',
@is_insert_supported = 'Yes',
@is_update_supported = 'No',
@is_delete_supported = 'No',
@is_print_supported = 'No',
@is_update_changes_supported = 'No',
@is_delete_changes_supported = 'No',
@is_partial_save_supported = 'No'
EXEC insApplicationScreenAudit 'ZSM_MUM', 'PHT_02', 'Yes', 'No', 'No', 'No', 'No','No','No'
-------------------------------------Miscellaneous Screens---------------------
EXEC inspackagescreen
@package_id = 'ZSM',
@screen_id = 'MSC_01',
@screen_nm = 'History',
@is_select_supported = 'Yes',
@is_insert_supported = 'No',
@is_update_supported = 'No',
@is_delete_supported = 'No',
@is_print_supported = 'No',
@is_update_changes_supported = 'No',
@is_delete_changes_supported = 'No',
@is_partial_save_supported = 'No'

EXEC inspackagescreen
@package_id = 'ZSM',
@screen_id = 'MSC_02',
@screen_nm = 'Sewadar History',
@is_select_supported = 'Yes',
@is_insert_supported = 'No',
@is_update_supported = 'No',
@is_delete_supported = 'No',
@is_print_supported = 'No',
@is_update_changes_supported = 'No',
@is_delete_changes_supported = 'No',
@is_partial_save_supported = 'No'

EXEC inspackagescreen
@package_id = 'ZSM',
@screen_id = 'MSC_03',
@screen_nm = 'Sewa Summary',
@is_select_supported = 'Yes',
@is_insert_supported = 'No',
@is_update_supported = 'No',
@is_delete_supported = 'No',
@is_print_supported = 'No',
@is_update_changes_supported = 'No',
@is_delete_changes_supported = 'No',
@is_partial_save_supported = 'No'

EXEC inspackagescreen
@package_id = 'ZSM',
@screen_id = 'MSC_04',
@screen_nm = 'Sewa Team Transfers', -- Opens from Department Transfers screen
@is_select_supported = 'No',
@is_insert_supported = 'Yes',
@is_update_supported = 'No',
@is_delete_supported = 'No',
@is_print_supported = 'No',
@is_update_changes_supported = 'No',
@is_delete_changes_supported = 'No',
@is_partial_save_supported = 'No'
EXEC insApplicationScreenAudit 'ZSM_MUM', 'MSC_04', 'Yes', 'No', 'No', 'No', 'No','No','No'

