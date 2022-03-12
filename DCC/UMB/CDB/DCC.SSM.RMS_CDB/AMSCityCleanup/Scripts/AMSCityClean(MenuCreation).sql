
use sysadmin
go

INSERT INTO package_screens VALUES ('CDB',	'ENT_12',	'AMS City Clean',	'Yes',	'Yes',	'Yes',	'Yes',	'No',	'Yes',	'Yes',	'No')

INSERT INTO package_user_roles VALUES ('CDB_AMS',	'AMS City Clean User',	'àÉ–Wþ 8ÖF³]Ùç',	'CDB',	'DCC.UMB.CDB2.exe',	NULL,	0)

INSERT INTO user_role_menu_groups VALUES ('CDB_AMS','ENT',NULL,'Entities','Entities','E',1)
DECLARE @menu_grp_id as int
Select @menu_grp_id = user_role_menu_group_id from user_role_menu_groups where user_role_id = 'CDB_AMS'

INSERT INTO user_role_menus VALUES (@menu_grp_id,'AMS City Clean','AMS City Clean','C',1)

INSERT INTO user_role_privileges VALUES ('CDB_AMS',	'ENT_12',	'CDB',	'Yes',	'Yes',	'Yes',	'Yes',	'Yes')

