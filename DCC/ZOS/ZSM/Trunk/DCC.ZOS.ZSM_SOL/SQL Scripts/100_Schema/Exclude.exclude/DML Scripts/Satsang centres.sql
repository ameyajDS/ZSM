select district_nm, x.*, y.* from cdb..satsang_centres x left join satsang_centres_details y on x.satsang_centre_id = y.satsang_centre_id
left join cdb..districts_or_cities z on x.district_or_city_id = z.district_or_city_id
where satsang_centre_nm like 'bhop%'
order by 4

select state_nm, a.* from cdb..districts_or_cities a join cdb..states b on a.state_id = b.state_id
 where district_nm like 'bhopal%'

--select * from post_offices_or_cities where post_office_or_city_nm like 'jan%'

/*
declare @centre_id int

INSERT INTO	CDB..satsang_centres
	(	satsang_centre_cd, satsang_centre_type, 
		satsang_centre_nm, address_line_1, address_line_2, pin_or_zip_code, 
		district_or_city_id)
    VALUES
	(	'SRJNGR', 'Point', 
		'Suraj Nagar',	'Village Sewani Gaud', 'Post Surajnagar, Teh. Bhopal', 462044,
		 305 )
SET	@centre_id	=	SCOPE_IDENTITY ();
INSERT	INTO	satsang_centres_details
	(	satsang_centre_id, is_main_centre, reports_to_centre_id )
    VALUES
	(	@centre_id, 'No', 9950	);


UPDATE	satsang_centres_details
	SET	reports_to_centre_id	=	6064
WHERE	satsang_centre_id	IN	(	10107, 6078, 6071, 10125, 6089, 6093, 6072, 8824, 6091, 10106, 10270, 6084 )

UPDATE	cdb..satsang_centres
	SET	address_line_2 = null, pin_or_zip_code = '465220'--, district_or_city_id = 338
WHERE	satsang_centre_id	IN	(	10347 )

*/ 