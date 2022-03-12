SELECT	v.sewadar_id, first_nm, middle_nm, last_nm, gender, birth_dtm, initiation_dt, 
		sewadar_grno, sewadar_type, appointment_dt, is_outstation_sewadar, sewadar_status_cd, sewadar_status_dtm,
		department_nm, sub_department_nm, department_dt
FROM	v_sewadars	v
WHERE	satsang_centre_id	=	5040
AND		sewadar_status_cd	IN	(	'Perm', 'Temp')
AND		NOT EXISTS	(	SELECT	1
						FROM	sewadars_remarks	k
						WHERE	k.sewadar_id	=	v.sewadar_id
						AND		k.remarks_type	=	'Reference'
					)

