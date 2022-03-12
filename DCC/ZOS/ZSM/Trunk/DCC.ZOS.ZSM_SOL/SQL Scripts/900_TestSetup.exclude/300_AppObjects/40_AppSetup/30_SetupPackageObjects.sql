
--[[Insert Screens IDs and Name in Package_screens table

DELETE FROM user_role_menus WHERE user_role_id = 'TZS_TEST';
DELETE FROM user_role_menu_groups WHERE user_role_id = 'TZS_TEST';
DELETE FROM	user_role_granted_actions	WHERE	package_id		= 'TZS';
DELETE FROM	package_screen_Actions		WHERE	package_id		= 'TZS';
DELETE FROM	User_Role_Privileges		WHERE	package_id		= 'TZS';
DELETE FROM package_screens				WHERE	package_id		= 'TZS';
DELETE FROM	Application_screen_audits	WHERE	application_id	= 'TZS_TST';

INSERT INTO package_screens (package_id, screen_id, screen_nm, is_select_supported, is_insert_supported, is_update_supported,
	is_delete_supported, is_print_supported, is_update_changes_supported, is_delete_changes_supported, is_partial_save_supported)
	SELECT 'TZS', screen_id, screen_nm, is_select_supported, is_insert_supported, is_update_supported, is_delete_supported,
		is_print_supported, is_update_changes_supported, is_delete_changes_supported, is_partial_save_supported
	FROM package_screens
	WHERE package_id = 'ZSM';

INSERT INTO application_screen_audits (application_id, screen_id, is_insert_logged, is_update_logged, is_delete_logged,
	is_action_logged, is_print_logged, is_update_changes_logged, is_delete_changes_logged)
	SELECT 'TZS_TST', screen_id, is_insert_logged, is_update_logged, is_delete_logged,
	is_action_logged, is_print_logged, is_update_changes_logged, is_delete_changes_logged
	FROM application_screen_audits
	WHERE application_id = 'ZSM_MUM';

INSERT INTO user_role_privileges (package_id, user_role_id, screen_id, is_select_granted, is_insert_granted, is_update_granted,
	is_delete_granted, is_print_granted)
	SELECT 'TZS', 'TZS_TEST', screen_id, is_select_granted, is_insert_granted, is_update_granted,
	is_delete_granted, is_print_granted
	FROM user_role_privileges
	WHERE package_id = 'ZSM' AND user_role_id = 'ZSM_ADM';
	
INSERT INTO package_screen_actions (package_id, screen_id, action_id, display_order)
	SELECT 'TZS', screen_id, action_id, display_order
	FROM package_screen_actions
	WHERE package_id = 'ZSM';

INSERT INTO user_role_granted_actions (package_id, user_role_id, screen_id, action_id, display_order)
	SELECT 'TZS', 'TZS_TEST', screen_id, action_id, display_order
	FROM user_role_granted_actions
	WHERE package_id = 'ZSM' AND user_role_id = 'ZSM_ADM';
	
INSERT INTO user_role_menu_groups (user_role_id, menu_group_id, parent_menu_group_id, menu_group_nm, menu_group_dsc, 
	ctrl_Key_accessor, display_order)
	SELECT 'TZS_TEST', menu_group_id, parent_menu_group_id, menu_group_nm, menu_group_dsc, ctrl_Key_accessor, display_order
	FROM user_role_menu_groups
	WHERE user_role_id = 'ZSM_ADM';
	
INSERT INTO user_role_menus (user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order)
	SELECT 'TZS_TEST', menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order
	FROM user_role_menus
	WHERE user_role_id = 'ZSM_ADM';

-- Deleting CDB screens from menu
DELETE FROM user_role_menus WHERE user_role_id = 'TZS_TEST' AND menu_group_id = 'ENT' AND menu_nm IN 
	('Countries', 'Districts', 'Qualifications', 'Qualification Subjects', 'Relations', 'Satsang Centres', 'Skills', 'States')
	
GO
