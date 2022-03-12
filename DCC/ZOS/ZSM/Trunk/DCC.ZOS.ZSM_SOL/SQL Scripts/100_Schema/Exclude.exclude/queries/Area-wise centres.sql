	DECLARE	@centres	TABLE	(	id	INT	PRIMARY KEY,	typ	varCHAR (15), ss_nm	VARCHAR (100), deactivated_on datetime)
		
		INSERT INTO	@centres
			SELECT	s.satsang_centre_id, 'Centre', s.satsang_centre_nm, case when getdate()not between s.effective_from and s.effective_till then s.effective_till end
			FROM	satsang_centres_details	a
				JOIN	satsang_centres_details	c
					ON	(	a.reports_to_centre_id	=	5820
						AND	c.reports_to_centre_id	=	a.satsang_centre_id
						)
				JOIN	CDB..satsang_centres	s
					ON		s.satsang_centre_id	=	c.satsang_centre_id	
--and getdate() between effective_from and effective_till
where exists (select 1 from sewadars_details where weekly_satsang_centre_id = s.satsang_centre_id)
			UNION
			SELECT	s.satsang_centre_id, 'Centre', s.satsang_centre_nm, case when getdate()not between s.effective_from and s.effective_till then s.effective_till end
			FROM	CDB..satsang_centres	s
			WHERE	s.satsang_centre_id	=	5820
--and not exists (select 1 from sewadars_details where weekly_satsang_centre_id = s.satsang_centre_id)
		
	INSERT INTO	@centres
		SELECT	s.satsang_centre_id, s.satsang_centre_type, ss_nm + ' - ' + s.satsang_centre_nm, case when getdate()not between s.effective_from and s.effective_till then s.effective_till end
		FROM	@centres	p
			JOIN	satsang_centres_details	c
				ON	(	c.reports_to_centre_id	=	p.id	)
			JOIN	CDB..satsang_centres	s
				ON		s.satsang_centre_id	=	c.satsang_centre_id	
--and getdate() between effective_from and effective_till
--and not exists (select 1 from sewadars_details where weekly_satsang_centre_id = s.satsang_centre_id)

select * from @centres		
where typ != 'a'
order by 3--4 desc