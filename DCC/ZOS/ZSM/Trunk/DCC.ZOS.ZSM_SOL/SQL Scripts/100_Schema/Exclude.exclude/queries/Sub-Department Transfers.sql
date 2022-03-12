select department_nm, sub_department_nm, sub_department_cd, l.remarks as "Old G.R.No.",
       first_nm, middle_nm, last_nm, gender, r.sewadar_grno, k.remarks as "Photo ID", CONVERT (VARCHAR, department_dt, 106) as "Department Date"
 from sewadars_registrations r join sewadars s on s.sewadar_id= r.sewadar_id
 join departments d on r.department_id = d.department_id
 join sub_departments e on r.sub_department_id = e.sub_department_id

left join sewadars_remarks k on  k.sewadar_id= r.sewadar_id and k.remarks_type = 'reference'
left join sewadars_remarks l on  l.sewadar_id= r.sewadar_id and l.remarks_type like 'Old G.R.No.'
where r.satsang_centre_id= 5820
and r.sewadar_status_cd in ('temp', 'perm')
and r.sub_department_id is not null
and department_dt >= '9 oct 2012'
order by 1,2,convert (int, l.remarks)
--order by 1,2,convert (int, l.remarks)
