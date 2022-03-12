select  a.sewadar_id, b.sewadar_id, a.first_nm, b.first_nm, a.middle_nm, b.middle_nm, a.last_nm, b.last_nm, a.birth_dtm, b.birth_dtm, 
		m.centre_nm, x.sewadar_grno, x.sewadar_status_cd,
		n.centre_nm, y.sewadar_grno, y.sewadar_status_cd,
		a.is_married, a.initiation_dt

from sewadars a join sewadars b 
on (    soundex (a.first_nm) = soundex (b.first_nm)
	and soundex (a.middle_nm) = soundex (b.middle_nm)
	and soundex (a.last_nm) = soundex (b.last_nm)
	and a.gender = b.gender
	and a.sewadar_id != b.sewadar_id
	and ( 	a.birth_dtm between dateadd (year, -5, cast (b.birth_dtm as datetime)) and dateadd (year, 5, cast (b.birth_dtm as datetime)) 
		OR	b.birth_dtm between dateadd (year, -5, cast (a.birth_dtm as datetime)) and dateadd (year, 5, cast (a.birth_dtm as datetime)) 
		)
	)
join sewadars_registrations x on (a.sewadar_id = x .sewadar_id and x.sewadar_status_cd in ('temp', 'perm', 'ni', 'retd'))
join sewadars_registrations y on (b.sewadar_id = y .sewadar_id and y.sewadar_status_cd in ('temp', 'perm', 'ni', 'retd'))
join satsang_centres_details m on (x.satsang_centre_id = m.satsang_centre_id)
join satsang_centres_details n on (y.satsang_centre_id = n.satsang_centre_id)

order by  a.first_nm, b.first_nm, a.middle_nm, b.middle_nm, a.last_nm, b.last_nm, a.birth_dtm, b.birth_dtm, 
		x.satsang_centre_id, x.sewadar_grno, x.sewadar_status_cd,
		y.satsang_centre_id, y.sewadar_grno, y.sewadar_status_cd
		
