select s.sewadar_id, first_nm, middle_nm, last_nm, birth_dtm, Gender, centre_nm, sewadar_grno, sewadar_status_cd, sewadar_status_dtm
from sewadars s
	join sewadars_registrations r
		ON (	s.sewadar_id	=	r.sewadar_id )
	join satsang_centres_details d
		on (	r.satsang_centre_id = d.satsang_centre_id )
where	exists	(	select	x.sewadar_id, count(*)
					from	sewadars_registrations x
					where	s.sewadar_id = x.sewadar_id
					group by x.sewadar_id
					having count(*) > 1
				)
and	exists		(	select	x.sewadar_id
					from	sewadars_registrations x
					where	s.sewadar_id = x.sewadar_id
					and		substring (x.sewadar_grno, 1, 1) in ('o', 't')
				)
order by 1, 10
					
