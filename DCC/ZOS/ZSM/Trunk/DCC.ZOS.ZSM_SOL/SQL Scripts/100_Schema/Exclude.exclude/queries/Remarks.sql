

select x.remarks, x.sewadar_id, current_sewadar_grno, department_nm, coalesce (sub_department_nm,''), first_nm, middle_nm, last_nm 
from sewadars_remarks x join sewadars y on (x.sewadar_id = y.sewadar_id)
join sewadars_registrations z on (z.sewadar_id = y.sewadar_id and current_sewadar_grno = sewadar_grno and current_satsang_centre_id = satsang_centre_id)
join departments d on (z.department_id = d.department_id)
left join sub_departments s on (s.sub_department_id = z.sub_department_id)
where remarks_type = 'Reference'
and x.remarks like 'N%'
order by 4


select remarks, * from generic_sewadar_lists_sewadars x 
	join sewadars_registrations y on (x.satsang_centre_id = y.satsang_centre_id and x.sewadar_grno = y.sewadar_grno)
	join sewadars_remarks z on (y.sewadar_id = z.sewadar_id and remarks_type = 'Reference')
where sewadar_list_id = 14
order by 1

begin tran

commit
select * from sewadars_photos where sewadar_id = 104098


rollback tran


select *
--delete
from sewadars_remarks a

where remarks_type = 'Reference'
--and remarks = '0112' --or remarks = '3409 - PREMA')

and not exists (
select 1 from sewadars_photos b where a.sewadar_id = b.sewadar_id)




select 1 from generic_sewadar_lists_sewadars x 
	join sewadars_registrations y on (x.satsang_centre_id = y.satsang_centre_id and x.sewadar_grno = y.sewadar_grno)
	join sewadars_remarks z on (y.sewadar_id = z.sewadar_id and remarks_type = 'Reference')
where sewadar_list_id = 14 and a.sewadar_id = z.sewadar_id)
order by remarks


select * from generic_sewadar_lists_sewadars x 
where sewadar_list_id = 14



select 'ren "' + x.remarks + '.jpg" ' + current_sewadar_grno + '.jpg'
from sewadars_remarks x join sewadars y on (x.sewadar_id = y.sewadar_id)
join sewadars_registrations z on (z.sewadar_id = y.sewadar_id and current_sewadar_grno = sewadar_grno and current_satsang_centre_id = satsang_centre_id)
join departments d on (z.department_id = d.department_id)
--join sewadars_photos yy on (x.sewadar_id = yy.sewadar_id)
left join sub_departments s on (s.sub_department_id = z.sub_department_id)
where remarks_type = 'Reference'
and current_satsang_centre_id = 6056
order by x.remarks

insert into generic_sewadar_lists_sewadars 
	select 49, current_satsang_centre_id, current_sewadar_grno
from sewadars_remarks x join sewadars y on (x.sewadar_id = y.sewadar_id)
join sewadars_registrations z on (z.sewadar_id = y.sewadar_id and current_sewadar_grno = sewadar_grno and current_satsang_centre_id = satsang_centre_id)
join departments d on (z.department_id = d.department_id)
left join sub_departments s on (s.sub_department_id = z.sub_department_id)
where remarks_type = 'Reference'
and current_satsang_centre_id = 6056





select x.remarks, count(*)
from sewadars_remarks x join sewadars y on (x.sewadar_id = y.sewadar_id)
join sewadars_registrations z on (z.sewadar_id = y.sewadar_id and current_sewadar_grno = sewadar_grno and current_satsang_centre_id = satsang_centre_id)
join departments d on (z.department_id = d.department_id)
left join sub_departments s on (s.sub_department_id = z.sub_department_id)
where remarks_type = 'Reference'
group by x.remarks
having count(*)
> 1
