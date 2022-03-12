IF EXISTS	(	SELECT	1
				FROM	INFORMATION_SCHEMA.VIEWS
				WHERE	table_name	=	'v_sewadars'
			)
	DROP VIEW	v_sewadars
GO

CREATE	VIEW	v_sewadars
AS
	SELECT	s.sewadar_id, s.first_nm, s.middle_nm, s.last_nm, s.gender, s.birth_dtm, s.initiation_dt, s.global_sewadar_status_cd,
			r.satsang_centre_id, r.sewadar_grno, r.sewadar_type, r.appointment_dt, r.is_outstation_sewadar, r.department_id, r.sub_department_id, r.department_dt, r.sewadar_status_cd, r.sewadar_status_dtm,
			d.department_nm, sd.sub_department_nm
	FROM	sewadars_registrations	r
		JOIN	sewadars	s
			ON	(	r.sewadar_id	=	s.sewadar_id	)
		JOIN	departments	d
			ON	(	d.department_id	=	r.department_id	)
		LEFT JOIN	sub_departments	sd
			ON	(	sd.sub_department_id	=	r.sub_department_id	)

