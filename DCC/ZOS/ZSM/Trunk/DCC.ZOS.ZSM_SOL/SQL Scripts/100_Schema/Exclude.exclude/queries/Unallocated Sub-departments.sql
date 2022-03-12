SELECT	--COALESCE (responsibility, ''), 


		department_nm as [Department], l.remarks as [Old G.R.No.], first_nm [First Name], middle_nm [ Middle Name], last_nm [Last Name], 
		Gender, sewadar_grno [G.R. No.], sr.sewadar_id [Sewadar ID],
		sewadar_status_cd [Status], m.remarks as [Photo ID], CONVERT (VARCHAR, department_dt, 106) [Department Date],
		DATEDIFF (YEAR, birth_dtm, GetDate()) as [Age], CONVERT (VARCHAR(11), birth_dtm, 106) as DOB, satsang_centre_nm
FROM	sewadars_registrations	sr
	JOIN	sewadars	s
		ON	(	sr.sewadar_id	=	s.sewadar_id	)
	JOIN	sewadars_details	sd
		ON	(	sd.sewadar_id	=	s.sewadar_id	)
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
	LEFT JOIN	cdb..satsang_centres	sc
		ON	(	sd.weekly_satsang_centre_id = sc.satsang_centre_id	)
WHERE	sr.satsang_centre_id	=	5820
AND		sr.sub_department_id	IS NULL
AND		sr.sewadar_status_cd IN  ('Perm', 'Temp')
AND		sr.department_id	IN	(	SELECT	department_id
									FROM	departments
									WHERE	department_nm = 'Accommodation'
									OR		department_nm = 'Canteen'
									OR		department_nm = 'Langar'
									OR		department_nm = 'Luggage'
									OR		department_nm = 'Pandal'
									OR		department_nm = 'Sanitation'
									OR		department_nm = 'Security'
									OR		department_nm = 'Traffic '
									OR		department_nm = 'Watch and Ward'
								)
--and (sewadar_grno between 'L00001' and 'L02001'
--or sewadar_grno between 'G00001' and 'g01500'
--or sewadar_grno between 'M04501' and 'M05000'
--)
and responsibility is null
ORDER BY 7

