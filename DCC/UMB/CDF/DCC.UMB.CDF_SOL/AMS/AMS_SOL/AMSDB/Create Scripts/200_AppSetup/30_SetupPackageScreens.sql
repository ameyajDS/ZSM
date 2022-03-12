Use SysAdmin
GO

--[[data unit category screen
EXEC insPackageScreen
	@package_id = 'AMS',
	@screen_id = 'ENT_01',
	@screen_nm = 'Items',
	@is_select_supported = 'Yes',
	@is_insert_supported = 'Yes',
	@is_update_supported = 'Yes',
	@is_delete_supported = 'Yes',
	@is_print_supported = 'No ',
	@is_update_changes_supported = 'No ',
	@is_delete_changes_supported = 'No ',
	@is_partial_save_supported = 'No '
 --]]
 
 
 
--[[data unit screen
EXEC insPackageScreen
	@package_id = 'AMS',
	@screen_id = 'ENT_02',
	@screen_nm = 'Satsang Centers',
	@is_select_supported = 'Yes',
	@is_insert_supported = 'Yes',
	@is_update_supported = 'Yes',
	@is_delete_supported = 'Yes',
	@is_print_supported = 'No ',
	@is_update_changes_supported = 'No ',
	@is_delete_changes_supported = 'No ',
	@is_partial_save_supported = 'No '
 --]]
 
 
 --[[join type stage
EXEC insPackageScreen
	@package_id = 'AMS',
	@screen_id = 'ENT_03',
	@screen_nm = 'Assets',
	@is_select_supported = 'Yes',
	@is_insert_supported = 'Yes',
	@is_update_supported = 'Yes',
	@is_delete_supported = 'Yes',
	@is_print_supported = 'No ',
	@is_update_changes_supported = 'No ',
	@is_delete_changes_supported = 'No ',
	@is_partial_save_supported = 'No '
 --]]
 