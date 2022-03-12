select department_nm, department_cd, sub_department_nm, sub_department_cd-- , *
from departments d
join departments_satsang_centres s on (d.department_id= s.department_id and s.satsang_centre_id = 5820)
left join sub_departments sd on (sd.department_id= d.department_id )
where getdate() between s.effective_from and s.effective_till
and sd.department_id is null or exists (select 1 from sub_departments_satsang_centres sc where sd.sub_department_id= sc.sub_department_id and sc.satsang_centre_id = 5820
and getdate() between sc.effective_from and sc.effective_till
)
order by 1, 3