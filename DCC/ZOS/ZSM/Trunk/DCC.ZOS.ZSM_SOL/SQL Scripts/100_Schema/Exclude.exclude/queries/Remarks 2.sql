select * from generic_sewadar_lists_sewadars x
where exists (select * from sewadars_remarks y join sewadars z on y.sewadar_id = z.sewadar_id
where current_satsang_centre_id = 6056 and x.sewadar_grno = z.current_sewadar_grno
and remarks_type = 'reference')
and sewadar_list_id = 14



select current_satsang_centre_id, satsang_centre_id, current_sewadar_grno, sewadar_grno, *
from sewadars x join sewadars_registrations y on (x.sewadar_id = y. sewadar_id)
where y.satsang_centre_id = 6056
and ( current_sewadar_grno != sewadar_grno )


