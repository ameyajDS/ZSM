SELECT	department_nm as [Department], MAX (l.remarks) as [Old G.R.No.], first_nm [First Name], middle_nm [ Middle Name], last_nm [Last Name], 
		Gender, sewadar_grno [G.R. No.], sr.sewadar_id [Sewadar ID],
		sewadar_status_cd [Status], MAX (m.remarks) as [Photo ID], CONVERT (VARCHAR, department_dt, 106) [Department Date]
FROM	sewadars_registrations	sr
	JOIN	sewadars	s
		ON	(	sr.sewadar_id	=	s.sewadar_id	)
	JOIN	departments	d
		ON	(	sr.department_id	=	d.department_id	)
	LEFT JOIN	sewadars_remarks	l
		ON	(	s.sewadar_id	=	l.sewadar_id
			AND	l.remarks_type	=	'Old G.R.No.'
			)
	LEFT JOIN	sewadars_remarks	m
		ON	(	s.sewadar_id	=	m.sewadar_id
			AND	m.remarks_type	=	'Reference'
			)
WHERE	sr.satsang_centre_id	=	5820
AND		sr.sewadar_grno BETWEEN 'L00001' and 'L00002'
group by  d.department_nm , s.first_nm , middle_nm , last_nm , 
		Gender, sewadar_grno , sr.sewadar_id ,
		sewadar_status_cd ,department_dt

ORDER BY sr.sewadar_grno

