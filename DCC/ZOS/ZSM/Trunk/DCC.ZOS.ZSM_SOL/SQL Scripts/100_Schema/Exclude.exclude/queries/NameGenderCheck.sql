SELECT	l.sewadar_grno, l.sewadar_id, s.first_nm, s.middle_nm, s.last_nm, s.gender, 
		sewadar_status_cd, department_nm, sub_department_cd [Code], sub_department_nm
FROM	sewadars_registrations	l
	JOIN	sewadars s
		ON	(	s.sewadar_id = l.sewadar_id	)
	JOIN	departments	d
		ON	(	d.department_id	=	l.department_id	)
	LEFT JOIN	sub_departments	x
		ON	(	x.sub_department_id	=	l.sub_department_id	)
WHERE	--l.satsang_centre_id	=	5820
--AND		l.sewadar_status_cd	IN	(	'Perm', 'Temp'	)
--AND		is_outstation_sewadar	=	'No'
--AND		
s.gender = 'Male'
AND		( -- l.sewadar_grno	BETWEEN	'M01000' AND 'M02050' OR
 l.sewadar_grno	like 'f%'
)
--and sub_department_cd is null
ORDER BY l.sewadar_grno
