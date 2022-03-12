select centre_grno [Old G.R.No.], r.sewadar_id [Sewadar ID], centre_nm [Centre], r.sewadar_grno [G.R.No.],
		first_nm + coalesce (' ' + middle_nm, '') + ' ' + last_nm [Name], CONVERT (VARCHAR, S.birth_dtm, 106) [DOB], 
		sewadar_status_cd [Status]
from mgr_centre_sewadars m
 join sewadars s on (m.sewadar_id = s.sewadar_id) 
 join sewadars_registrations r on (r.sewadar_id = s.sewadar_id 
						and s. current_sewadar_grno = r.sewadar_grno
						and s.current_satsang_centre_id = r.satsang_centre_id 
				) 
join satsang_centres_details c on (r.satsang_centre_id = c.satsang_centre_id)
where not exists (select 1 from sewadars_remarks a where a.sewadar_id = r.sewadar_id
				and remarks_type = 'Old G.R.No.'
)
 