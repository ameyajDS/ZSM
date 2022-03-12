USE SysAdmin
GO

DELETE FROM package_menus WHERE package_id = 'AMS';

DELETE FROM package_menu_groups WHERE package_id = 'AMS'

-- INSERTING ENTITIES MENU GROUPS
sp_help insPackageMenu;
EXEC insPackageMenuGroup 'AMS', 'ENT', NULL , 'Entities', 'Entities', 'E', 1;


DECLARE @v_group_id varchar(24)
DECLARE @v_package_id varchar(24)

SET @v_group_id = 'ENT'
SET @v_package_id = 'AMS'

EXEC insPackageMenu @v_package_id, @v_group_id, 'Items', 'Items','I', 1 
EXEC insPackageMenu @v_package_id, @v_group_id, 'Satsang Centres', 'Satsang Centres', 'S', 2 
EXEC insPackageMenu @v_package_id, @v_group_id, 'Assets', 'Assets', 'A', 3 

