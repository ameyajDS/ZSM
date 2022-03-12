DELETE	m
FROM	user_role_menus	m
	JOIN	user_role_menu_groups	mg
		ON	(	m.user_role_menu_group_id	=	mg.user_role_menu_group_id	)
WHERE	mg.user_role_id	IN
	('ZSM_RDR', 'ZSM_ATM', 'ZSM_USR', 'ZSM_SUP', 'ZSM_ADM', 'ZSM_CU', 'ZSM_PC');

DELETE
FROM	user_role_menu_groups
WHERE	user_role_id	IN
	('ZSM_RDR', 'ZSM_ATM', 'ZSM_USR', 'ZSM_SUP', 'ZSM_ADM', 'ZSM_CU', 'ZSM_PC');

DELETE
FROM	user_role_granted_actions
WHERE	package_id	=	'ZSM';

DELETE
FROM	package_screen_Actions
WHERE	package_id	=	'ZSM';

DELETE
FROM	User_Role_Privileges
WHERE	package_id	=	'ZSM';

DELETE
FROM	package_screens
WHERE	package_id	=	'ZSM';

DELETE	sa
FROM	Application_screen_audits	sa
	JOIN	applications			a
		ON	(	a.application_id	=	sa.application_id	)
WHERE	a.package_id	=	'ZSM';

