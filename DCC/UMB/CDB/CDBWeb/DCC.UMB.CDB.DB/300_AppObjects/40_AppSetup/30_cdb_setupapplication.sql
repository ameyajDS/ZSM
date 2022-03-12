Use Sysadmin
Go
update package_user_roles set default_user_role_menu_id=null where user_role_id in ('CDB_Gnrc','CDB_LKPRDR','CDB_Read') 

DELETE m
FROM user_role_menus m
JOIN user_role_menu_groups g ON (m.user_role_menu_group_id=g.user_role_menu_group_id)
WHERE g.user_role_id IN ('CDB_Gnrc','CDB_LKPRDR','CDB_Read') 
AND g.menu_group_id in ('Entities','Geographic');

DELETE FROM user_role_menu_groups
WHERE user_role_id IN ('CDB_Gnrc','CDB_LKPRDR','CDB_Read')
AND menu_group_id IN ('Entities','Geographic')

DELETE FROM user_role_granted_actions
WHERE package_id = 'CDB'
AND screen_id IN ('CDB_01','CDB_02','GEO_01','GEO_02','GEO_03','GEO_04','GEO_05')

DELETE FROM package_screen_actions
WHERE package_id = 'CDB'
AND screen_id IN ('CDB_01','CDB_02','GEO_01','GEO_02','GEO_03','GEO_04','GEO_05')

DELETE sa
FROM application_screen_audits sa
JOIN applications a ON sa.application_id = a.application_id
WHERE a.package_id = 'CDB'
AND screen_id IN ('CDB_01','CDB_02','GEO_01','GEO_02','GEO_03','GEO_04','GEO_05')

DELETE FROM user_role_privileges
WHERE package_id = 'CDB'
AND screen_id IN ('CDB_01','CDB_02','GEO_01','GEO_02','GEO_03','GEO_04','GEO_05')

DELETE FROM package_screens
WHERE package_id = 'CDB'
AND screen_id IN ('CDB_01','CDB_02','GEO_01','GEO_02','GEO_03','GEO_04','GEO_05')

EXEC SetMenuGroup  'Entities', NULL, 'Entities', 'Entities', 'e', '1', 'CDB_Gnrc|CDB_Read'

EXEC SetPackageScreen  'CDB', 'CDB_01', 'Relation', 'IUPRM', '', 'Entities', 'Relation', 'r', '1', 'CDB_Gnrc:IURP|CDB_LKPRDR:R|CDB_Read:R'



EXEC SetPackageScreen  'CDB', 'CDB_02', 'Working Units', 'IUPRM', '', 'Entities', 'Working Units', 'w', '2', 'CDB_Gnrc:IURP|CDB_LKPRDR:R|CDB_Read:R'


EXEC SetMenuGroup  'Geographic', NULL, 'Geographic', 'Geographic', 'g', '2', 'CDB_Gnrc|CDB_Read'

EXEC SetPackageScreen  'CDB', 'GEO_01', 'Level-0 Countries', 'IUPRM', '', 'Geographic', 'Level-0 Countries', '0', '1', 'CDB_Gnrc:IURP|CDB_LKPRDR:R|CDB_Read:R'



EXEC SetPackageScreen  'CDB', 'GEO_02', 'Level-1 States', 'IUPRM', '', 'Geographic', 'Level-1 States', '1', '2', 'CDB_Gnrc:IURP|CDB_LKPRDR:R|CDB_Read:R'



EXEC SetPackageScreen  'CDB', 'GEO_03', 'Level-2 Districts', 'IUPRM', '', 'Geographic', 'Level-2 Districts', '2', '3', 'CDB_Gnrc:IURP|CDB_LKPRDR:R|CDB_Read:R'



EXEC SetPackageScreen  'CDB', 'GEO_04', 'Level-3 Cities', 'IUPRM', '', 'Geographic', 'Level-3 Cities', '3', '4', 'CDB_Gnrc:IURP|CDB_LKPRDR:R|CDB_Read:R'



EXEC SetPackageScreen  'CDB', 'GEO_05', 'Level-4 Post Offices', 'IUPRM', '', 'Geographic', 'Level-4 Post Offices', '4', '5', 'CDB_Gnrc:IURP|CDB_LKPRDR:R|CDB_Read:R'
