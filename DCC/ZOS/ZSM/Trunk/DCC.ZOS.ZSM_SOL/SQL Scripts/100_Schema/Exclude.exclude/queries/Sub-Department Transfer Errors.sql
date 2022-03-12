select x.*, l.sewadar_id, s.first_nm, s.middle_nm, s.last_nm, s.gender, s.current_sewadar_grno, k.remarks as "Photo ID"
 from mgr_sewadars_sub_depts x
	left join sewadars_remarks l on  l.remarks=convert (varchar, x.centre_grno) and l.remarks_type like 'Old G.R.No.'
  left join sewadars s on (s.sewadar_id = l.sewadar_id)
left join sewadars_remarks k on k.sewadar_id = s.sewadar_id and k.remarks_type = 'Reference'
where x.remarks is not null

