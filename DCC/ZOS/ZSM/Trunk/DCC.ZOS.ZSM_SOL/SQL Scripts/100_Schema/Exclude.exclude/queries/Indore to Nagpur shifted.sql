select m.remarks, i.sewadar_id, n.sewadar_grno,  first_nm + ' ' + middle_nm + ' ' + last_nm, birth_dtm, gender, n.sewadar_status_cd, department_nm, coalesce(sub_department_nm, '')
from sewadars_registrations i 
join sewadars_registrations n on (i.sewadar_id= n.sewadar_id)
join sewadars x on (x.sewadar_id= n.sewadar_id)
join departments d on (d.department_id = n.department_id)
left join sub_departments sd on (sd.sub_department_id = n.sub_department_id)
join sewadars_remarks m on (x.sewadar_id= m.sewadar_id and remarks_type = 'reference')
where i.satsang_centre_id = 5820 and i.sewadar_status_cd = 'shft'
and n.satsang_centre_id = 6056
--and n.sewadar_status_dtm > '11 mar 2013'
order by 1

select gender, department_nm, coalesce(sub_department_nm, ''), count(*)
from sewadars_registrations i 
join sewadars_registrations n on (i.sewadar_id= n.sewadar_id)
join sewadars x on (x.sewadar_id= n.sewadar_id)
join departments d on (d.department_id = n.department_id)
left join sub_departments sd on (sd.sub_department_id = n.sub_department_id)

where i.satsang_centre_id = 5820 and i.sewadar_status_cd = 'shft'
and n.satsang_centre_id = 6056
group by gender, department_nm, coalesce(sub_department_nm, '')
order by 1 desc, 2, 3
