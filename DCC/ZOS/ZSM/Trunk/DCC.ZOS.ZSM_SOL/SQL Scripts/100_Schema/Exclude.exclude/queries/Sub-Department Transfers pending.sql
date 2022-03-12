select  department_nm, sub_dept_nm, r.centre_grno,
       first_name, middle_name, surname, gender
 from mgr_centre_sewadars r join mgr_sewadars_sub_depts s on s.centre_grno= r.centre_grno
where transfer_dtm is null
order by 1,2,convert (int, r.centre_grno)
