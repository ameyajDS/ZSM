--The scrip inserts user for a NEW Centre where users do not exist for NEW Centre but exists for another centre (OLD)
--Ensure to replace OLD and NEW with three character Centre (fro example MUM, RPR)


Use SysAdmin
Go
INSERT INTO user_privileges
 (user_id, user_role_id, application_id)
select user_id, user_role_id, 'ZSM_NEW'
from user_privileges o
where application_id = 'ZSM_OLD'
and not exists (select 1 from user_privileges i 
				where i.application_id = 'ZSM_NEW' 
				and o.user_id = i.user_id
				AND o.user_role_id= i.user_role_id
				)

