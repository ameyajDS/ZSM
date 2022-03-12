/*
CREATE TABLE #tbl (centre_grno CHAR (6), sewadar_nm VARCHAR (100), dept varchar (50), photo_id varchar (10), 
				att2010 numeric (5,2), att2012 numeric (5,2), att2013 numeric (5,2), con_att2013 numeric (5,2)
		)
insert into #tbl
	SELECT	[GR NO#], [Name of Sewadar], [Department], PhotoID, [ATT-2010], [ATT-2012], [ATT-2013], [CON ATT]
	FROM OPENROWSET('Microsoft.Jet.OLEDB.4.0', 
					'Excel 8.0;Database=C:\users\Raipur\Final List ATT-2014 .xls',
	 				'SELECT * FROM [FINAL LIST$]') x

*/
select * from #tbl t
	JOIN	zsm..sewadars_remarks r
		ON	(	r.remarks_type = 'Reference'
			and r.remarks =	t.photo_id
		)
	JOIN	zsm..sewadars_remarks p
		ON	(	p.remarks_type = 'Old G.R.No.'
			and p.remarks =	t.centre_grno
		)
	JOIN	zsm..sewadars s
		ON	(	s.sewadar_id= p.sewadar_id
			AND	s.current_satsang_centre_id = 9720
--			AND	s.current_sewadar_grno = 
			)

where centre_grno not like '%new%'
and soundex(sewadar_nm) != soundex(first_nm + ' ' + middle_nm + ' ' + last_nm)
order by photo_id

/*where centre_grno is null
or sewadar_nm is null
or photo_id is null
*/