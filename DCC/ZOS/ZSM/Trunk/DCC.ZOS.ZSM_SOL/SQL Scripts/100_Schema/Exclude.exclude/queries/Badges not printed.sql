select r.sewadar_grno, s.sewadar_id, first_nm, middle_nm, last_nm, birth_dtm 
from sewadars s
	JOIN sewadars_registrations r
		ON	(r.sewadar_id = s.sewadar_id)
where satsang_centre_id = 5820
and sewadar_status_cd in ('Perm', 'Temp')
and not exists ( 	select 	1 from sewadars_badges b 
					where 	b.satsang_centre_id = r.satsang_centre_id
					and 	b.sewadar_grno = r.sewadar_grno
					AND 	badge_template_id	=	'Programme'
	)
order by 1

select r.sewadar_grno, s.sewadar_id, first_nm, middle_nm, last_nm, birth_dtm 
from sewadars s
	JOIN sewadars_registrations r
		ON	(r.sewadar_id = s.sewadar_id)
where satsang_centre_id = 5820
and sewadar_status_cd in ('Perm', 'Temp')
and not exists ( 	select 	1 from sewadars_badges b 
					where 	b.satsang_centre_id = r.satsang_centre_id
					and 	b.sewadar_grno = r.sewadar_grno
					AND (	(	badge_template_id	=	'ConstSB' AND	is_outstation_sewadar = 'No' )
						OR	(	badge_template_id	=	'IDCard' AND	is_outstation_sewadar = 'Yes' )
						)
	)	
order by 1
