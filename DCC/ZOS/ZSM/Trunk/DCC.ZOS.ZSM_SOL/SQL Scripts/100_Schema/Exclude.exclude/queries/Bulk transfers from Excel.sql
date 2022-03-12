--begin tran
--commit
--rollback

declare 
	@centre	INT

SET @centre = 5820 -- Indore --6056 -- Nagpur

--INSERT INTO sewadars_transfers
--		(	satsang_centre_id, sewadar_grno, effective_dt, old_department_id, old_sub_department_id, department_id, sub_department_id, remarks) 
--	SELECT 	m.remarks, 
	SELECT	--r.*, x.*, 
			r.satsang_centre_id, r.sewadar_grno, CONVERT (VARCHAR (11), GetDate(), 106),
			r.department_id, r.sub_department_id, sd.department_id , sd.sub_department_id, 'Bulk Transfer from Construction to Luggage as per Excel file'
	FROM OPENROWSET('Microsoft.Jet.OLEDB.4.0', 
					'Excel 8.0;Database=C:\users\Indore\Misc Excel Files\Unallocated Sub-Departments 19-Dec-2013.xls',
			--		'Excel 8.0;Database=C:\users\Nagpur\Nagpur gents canteen final jathas.xls',
			--		'Excel 8.0;Database=C:\users\Nagpur\Langar Jathas Bifurcation complete  List-28.03.13.xls',
			--		'Excel 8.0;Database=C:\users\Nagpur\For migration\Migrated\old grnos\sub depts to be added.xls',
	 				'SELECT * FROM [sub depts for entry$]') x
	JOIN	departments	d 		ON 	(x.department = d.department_nm	)
	JOIN	sewadars_remarks m	ON	(m.remarks_type= 'reference' and m.remarks = x.[photo id])
	JOIN	sewadars_registrations	r	ON	(r.satsang_centre_id = @centre
											AND x.[G#R#No#] = r.sewadar_grno
											AND	sewadar_status_cd  in ('Temp', 'Perm')
											AND	r.department_id	=	115
--											AND	r.sewadar_id	=	m.sewadar_ID
											)
	JOIN	sub_departments sd 	ON	(153 = sd.department_id	AND	x.[Sub Dept code]  = sd.sub_department_cd )
--WHERE ID  not in (2, 6, 261, 370, 377)
WHERE	coalesce (r.sub_department_id, 0) != coalesce (sd.sub_department_id, 0)
--	JOIN	sewadars_transfers t on (t.satsang_centre_id = r.satsang_centre_id and t.sewadar_grno = r.sewadar_grno
--					and effective_dt = '7 apr 2013')

/*   --- checks whether Current Department of Sewadar in System matches the one specified in Excel File 
where not exists  (select 1 from sewadars_registrations rr 
									JOIN departments d ON (d.department_id = r.department_id)
					where r.satsang_centre_id = @centre
					and r.sewadar_grno = rr.sewadar_grno
					and x.department_nm = d.department_nm
				)

*/
/*   --- checks whether G.R.No. in Excel File is valid
where not exists  (select 1 from sewadars_registrations r 
					where r.satsang_centre_id = @centre
					and x.[GR No#] = r.sewadar_grno
					and sewadar_status_cd  in ('Temp', 'Perm')
				)
*/

/*   --- checks whether Sub-department in Excel File is valid
 where not exists  (select 1 from departments d 
								join sub_departments sd on d.department_id = sd.department_id
								join sub_departments_satsang_centres s on s.sub_department_id = sd.sub_department_id
					where s.satsang_centre_id = @centre
					and d.department_nm = x.department
					and x.[Sub Dept Code] = sub_department_cd
					and getdate() between effective_from and effective_till
				)

*/
   --- checks whether Department in Excel File is valid
/*
where not exists  (select 1 from departments d join departments_satsang_centres s on d.department_id = s.department_id
					where s.satsang_centre_id = @centre
					and x.department = department_nm
					and getdate() between effective_from and effective_till
				)

*/
