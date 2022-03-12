select current_satsang_centre_id, current_sewadar_grno, COUNT(*)
from sewadars
group by current_satsang_centre_id, current_sewadar_grno
having COUNT(*) > 1


select *
from	sewadars	a
	JOIN	sewadars_registrations	b
		ON	(	a.current_satsang_centre_id	=	b.satsang_centre_id
			AND	a.current_sewadar_grno		=	b.sewadar_grno
			)
WHERE	a.sewadar_id	!=	b.sewadar_id


select * from sewadars 
where current_sewadar_grno is null

