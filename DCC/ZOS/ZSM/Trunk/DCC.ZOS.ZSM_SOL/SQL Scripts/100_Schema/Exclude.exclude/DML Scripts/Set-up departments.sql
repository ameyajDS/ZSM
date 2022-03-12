select x.department_id, department_nm, d.sub_department_id,  sub_department_cd, sub_department_nm, satsang_centre_id from departments x left join sub_departments d on (x.department_id = d.department_id)
left join sub_departments_satsang_centres y on(d.sub_department_id = y.sub_department_id)
where department_nm > 'c'
--where satsang_centre_id = 9720
order by 2, 5

--select * from satsang_centres_details where is_main_centre  = 'yes'

--select * from sub_departments_satsang_centres


-- ====================================================================================================
insert into sub_departments (sub_department_nm, sub_department_cd, department_id)
values ('Jatha G30', 'G30', 110)





insert into sub_departments (sub_department_nm, sub_department_cd, department_id)
select 'Jatha G6' + Substring (sub_department_nm, 9, 1), 'G6' + Substring (sub_department_cd, 3, 1), 110
from sub_departments
where sub_department_id between 489 and 494


-- ====================================================================================================

INSERT INTO	sub_departments_satsang_centres	(	sub_department_id, satsang_centre_id	)
--		VALUES		(	374 , 9720);

select sub_department_id, 9720
from sub_departments
where sub_department_id between 478 and 524



