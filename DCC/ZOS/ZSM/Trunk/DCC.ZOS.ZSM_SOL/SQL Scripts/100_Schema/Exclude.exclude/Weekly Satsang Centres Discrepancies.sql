--- Sewadars with Weekly Satsang Centre specified which is not Centre, Point or Sub Centre
select	x.*, c.*, s.* 
from	sewadars_details	s
	JOIN	cdb..satsang_centres	c
		ON	(	s.weekly_satsang_centre_id	=	c.satsang_centre_id	)
	JOIN	sewadars	x
		ON	(	x.sewadar_id	=	s.sewadar_id	)
where	c.satsang_centre_type	NOT	IN	('Centre', 'Point', 'Sub Centre')



-- Sub Centres / Points with no reporting Satsang Centre
select *
from cdb..satsang_centres s
	join satsang_centres_details d
		on (s.satsang_centre_id = d.satsang_centre_id)
where s.satsang_centre_id in (
select distinct weekly_satsang_centre_id
from sewadars_details
)
and s.satsang_centre_type in ('Point', 'Sub Centre')
and d.reports_to_centre_id  is null
order by 3

-- Centres without reporting Area 
select s.*, district_nm, state_nm, country_nm
from cdb..satsang_centres s
	join satsang_centres_details d
		on (s.satsang_centre_id = d.satsang_centre_id)
	join cdb..districts_or_cities dc
		ON (dc.district_or_city_id = s.district_or_city_id)
	join cdb..states st on (st.state_id = dc.state_id)
	join cdb..countries c on (c.country_id= st.country_id)
where	s.satsang_centre_id in (
											select distinct weekly_satsang_centre_id
											from sewadars_details
										)
and satsang_centre_type in ('Centre')
and reports_to_centre_id is null
order by 3
