use SysAdmin
GO

EXEC insUserRolePrivilege
	@package_id = 'AMS',
	@user_role_id = 'AMS_Gnrc',
	@screen_id = 'ENT_01',
	@is_select_granted = 'Yes',
	@is_insert_granted = 'Yes',
	@is_update_granted = 'Yes',
	@is_delete_granted = 'Yes',
	@is_print_granted = 'Yes'

EXEC insUserRolePrivilege
	 @package_id = 'AMS',
	 @user_role_id = 'AMS_Gnrc',
	 @screen_id = 'ENT_02',
	 @is_select_granted = 'Yes',
	 @is_insert_granted = 'Yes',
	 @is_update_granted = 'Yes',
	 @is_delete_granted = 'Yes',
	 @is_print_granted = 'Yes'

EXEC insUserRolePrivilege
	 @package_id = 'AMS',
	 @user_role_id = 'AMS_Gnrc',
	 @screen_id = 'ENT_03',
	 @is_select_granted = 'Yes',
	 @is_insert_granted = 'Yes',
	 @is_update_granted = 'Yes',
	 @is_delete_granted = 'Yes',
	 @is_print_granted = 'Yes'
