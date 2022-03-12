
--[[Insert User Role Privileges in User_Role_Privileges table

DELETE FROM	user_role_granted_actions	WHERE	package_id		= 'ZSM';
DELETE FROM	User_Role_Privileges WHERE package_id = 'ZSM';

--=============Photo Clicker====================
DECLARE @p_user_role_id AS user_role_id;
SET @p_user_role_id = 'ZSM_PC';

----------Activities--------

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_01',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_02',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_03',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_04',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_22',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_23',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'MSC_01', -- Opens from some of ACT_01 - ACT_04 screens
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'MSC_02', -- Opens from some of ACT_01 - ACT_04 screens
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'MSC_03', -- Opens from some of ACT_01 - ACT_04 screens
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

----------Photo Clicking--------

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'PHT_01',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

GO

--=============Reader====================
DECLARE @p_user_role_id AS user_role_id;
SET @p_user_role_id = 'ZSM_RDR';

----------Activities--------

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_01',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_02',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_03',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_04',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_22',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_23',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'MSC_01', -- Opens from some of ACT_01 - ACT_04 screens
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'MSC_02', -- Opens from some of ACT_01 - ACT_04 screens
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'MSC_03', -- Opens from some of ACT_01 - ACT_04 screens
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

----------Reports--------

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'RPT_01',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'RPT_06',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

GO

--=============Attendance Marker====================

DECLARE @p_user_role_id AS user_role_id;
SET @p_user_role_id = 'ZSM_ATM';

-------------Activities--------------------

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_01',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_02',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_03',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_04',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'


EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_22',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_23',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'


EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'MSC_01', -- Opens from some of ACT_01 - ACT_04 screens
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'MSC_02', -- Opens from some of ACT_01 - ACT_04 screens
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'MSC_03', -- Opens from some of ACT_01 - ACT_04 screens
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_19',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_20',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

-------------Attendance--------------------

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ATT_01',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ATT_02',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ATT_03',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ATT_04',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ATT_05',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ATT_06',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'No',
@is_delete_granted = 'Yes',
@is_print_granted = 'No'

----------Reports--------

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'RPT_01',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'RPT_02',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'RPT_06',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

GO

--======Centre User=======================

DECLARE @p_user_role_id AS user_role_id;
SET @p_user_role_id = 'ZSM_CU';

-------------Activities--------------------

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_01',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'Yes',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_02',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'Yes',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_03',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_04',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'MSC_01', -- Opens from some of ACT_01 - ACT_04 screens
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'MSC_02', -- Opens from some of ACT_01 - ACT_04 screens
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'MSC_03', -- Opens from some of ACT_01 - ACT_04 screens
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_07',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_08',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_12',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_14',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'Yes',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_19',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_20',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_22',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_23',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

-------------Attendance--------------------

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ATT_01',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ATT_02',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ATT_03',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ATT_04',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ATT_05',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ATT_06',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'No',
@is_delete_granted = 'Yes',
@is_print_granted = 'No'

----------Reports--------

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'RPT_01',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'RPT_02',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'RPT_03',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'RPT_04',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'RPT_05',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'RPT_06',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'


----------Entities--------
EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ENT_01',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ENT_02',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ENT_03',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ENT_05',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ENT_06',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ENT_07',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ENT_08',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ENT_09',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ENT_11',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ENT_12',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ENT_13',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ENT_14',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ENT_15',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

-------------Setup--------------------

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ENT_16',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'SET_03',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'SET_04',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'SET_05',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'SET_06',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'SET_07',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'SET_08',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

----------Photo Clicking--------
GO
--=============User====================

DECLARE @p_user_role_id AS user_role_id;
SET @p_user_role_id = 'ZSM_USR';

-------------Activities--------------------

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_01',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'Yes',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_02',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'Yes',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_03',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'Yes',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_22',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'Yes',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_23',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'Yes',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_04',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'Yes',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_05',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_12',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'


EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'MSC_01', -- Opens from some of ACT_01 - ACT_04 screens
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'MSC_02', -- Opens from some of ACT_01 - ACT_04 screens
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'MSC_03', -- Opens from some of ACT_01 - ACT_04 screens
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_07',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_19',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'Yes',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_20',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_14',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'Yes',
@is_print_granted = 'No'

-------------Attendance--------------------

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ATT_01',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ATT_02',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ATT_03',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ATT_04',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ATT_05',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ATT_06',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'No',
@is_delete_granted = 'Yes',
@is_print_granted = 'No'

----------Reports--------

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'RPT_01',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'RPT_02',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'RPT_03',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'RPT_06',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

----------Entities--------
EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ENT_01',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ENT_02',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ENT_03',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ENT_05',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ENT_06',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ENT_07',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ENT_08',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ENT_09',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ENT_11',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ENT_12',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'Yes',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ENT_13',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ENT_14',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ENT_15',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

-------------Setup--------------------

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'SET_01',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ENT_16',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'SET_03',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'SET_04',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'SET_05',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'SET_06',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'SET_07',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'SET_08',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

GO
--=============Supervisor====================

DECLARE @p_user_role_id AS user_role_id;
SET @p_user_role_id = 'ZSM_SUP';

-------------Activities--------------------

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_01',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'Yes',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_02',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'Yes',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_03',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'Yes',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_04',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'Yes',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_22',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'Yes',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_23',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'Yes',
@is_print_granted = 'No'


EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'MSC_01', -- Opens from some of ACT_01 - ACT_04 screens
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'MSC_02', -- Opens from some of ACT_01 - ACT_04 screens
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'MSC_03', -- Opens from some of ACT_01 - ACT_04 screens
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_05',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'MSC_04', -- Opens from ACT_05
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_06',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_07',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_08',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_09',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_10',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_12',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_13',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_14',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'Yes',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_19',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'Yes',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_20',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

----------Attendance--------

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ATT_01',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'Yes',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ATT_02',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'Yes',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ATT_03',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'Yes',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ATT_04',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ATT_05',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ATT_06',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'No',
@is_delete_granted = 'Yes',
@is_print_granted = 'No'

----------Reports--------
EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'RPT_01',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'RPT_02',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'RPT_03',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'RPT_04',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'RPT_05',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'RPT_06',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

-------------Entities--------------------

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ENT_01',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ENT_02',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ENT_03',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ENT_05',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ENT_06',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ENT_07',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ENT_08',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ENT_09',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ENT_11',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ENT_12',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'Yes',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ENT_13',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'Yes',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ENT_14',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'Yes',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ENT_15',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ENT_16',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'


-------------Setup--------------------

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'SET_01',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'


EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'SET_03',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'Yes',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'SET_04',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'SET_05',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'Yes',
@is_delete_granted = 'Yes',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'SET_06',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'SET_07',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'SET_08',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

GO

--=============Administrator====================

DECLARE @p_user_role_id AS user_role_id;
SET @p_user_role_id = 'ZSM_ADM';

-------------Activities--------------------

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_01',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'Yes',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_02',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'Yes',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_03',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_04',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_22',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_23',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'No',
@is_print_granted = 'No'


EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'MSC_01', -- Opens from some of ACT_01 - ACT_04 screens
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'MSC_02', -- Opens from some of ACT_01 - ACT_04 screens
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'MSC_03', -- Opens from some of ACT_01 - ACT_04 screens
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_05',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'MSC_04', -- Opens from ACT_05
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_06',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_07',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_08',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_09',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_10',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_12',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'No',
@is_print_granted = 'No'


EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_13',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_14',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_19',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'Yes',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ACT_20',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

----------Attendance--------

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ATT_01',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'Yes',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ATT_02',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'Yes',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ATT_03',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'Yes',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ATT_04',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ATT_05',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ATT_06',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'No',
@is_delete_granted = 'Yes',
@is_print_granted = 'No'

----------Reports--------
EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'RPT_01',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'RPT_02',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'RPT_03',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'RPT_04',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'RPT_05',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'RPT_06',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'No',
@is_delete_granted = 'No',
@is_print_granted = 'No'

----------Entities--------
EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ENT_01',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ENT_02',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ENT_03',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ENT_05',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ENT_06',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'Yes',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ENT_07',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ENT_08',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ENT_09',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'No',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ENT_11',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'Yes',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ENT_12',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'Yes',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ENT_13',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'Yes',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ENT_14',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'Yes',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ENT_15',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'Yes',
@is_print_granted = 'No'

----------Setup--------

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'SET_01',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'Yes',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'ENT_16',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'Yes',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'SET_03',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'Yes',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'SET_04',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'Yes',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'SET_05',
@is_select_granted = 'Yes',
@is_insert_granted = 'No',
@is_update_granted = 'Yes',
@is_delete_granted = 'Yes',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'SET_06',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'Yes',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'SET_07',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'Yes',
@is_print_granted = 'No'

EXEC insUserRolePrivilege
@package_id = 'ZSM',
@user_role_id = @p_user_role_id,
@screen_id = 'SET_08',
@is_select_granted = 'Yes',
@is_insert_granted = 'Yes',
@is_update_granted = 'Yes',
@is_delete_granted = 'No',
@is_print_granted = 'No'

GO

