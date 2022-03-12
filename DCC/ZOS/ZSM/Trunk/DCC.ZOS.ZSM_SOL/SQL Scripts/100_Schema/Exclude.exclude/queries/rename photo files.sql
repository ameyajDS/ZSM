select 'rename ' + m.remarks--  + '-' + first_nm 
									+ '.jpg ' + r.sewadar_grno + '.jpg'
from sewadars_registrations  r  
	join sewadars s on s.sewadar_id = r.sewadar_id  and r.satsang_centre_id = 6056
	join sewadars_remarks m on m.sewadar_id = r.sewadar_id and m.remarks_type = 'Reference' --and m.remarks like 'I2%'
where not exists (select 1 from zsm_photos..sewadars_photos p where p.sewadar_id = r.sewadar_id)
and sewadar_status_cd in ('perm', 'temp', 'ni', 'retd')
order by r.sewadar_grno
