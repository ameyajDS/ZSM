Use SysAdmin
GO

    SELECT u.user_no, p.user_id, u.user_nm, p.application_id, p.user_role_id, a.sewadar_id

    FROM
    user_privileges p

    JOIN application_users u

    ON ( u.user_id = p.user_id )
	
	JOIN	all_users a
	ON	(	a.user_id	=	p.user_id	)

    ORDER
    BY 3