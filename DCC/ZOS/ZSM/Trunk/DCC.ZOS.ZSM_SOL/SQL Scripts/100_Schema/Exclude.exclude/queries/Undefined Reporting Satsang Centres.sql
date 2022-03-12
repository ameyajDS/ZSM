SELECT	c.satsang_centre_id, c.satsang_centre_cd, c.satsang_centre_nm, c.satsang_centre_type,
		COALESCE (c.address_line_1, '') + COALESCE (c.address_line_2, '') AS address, district_nm, state_nm
FROM	CDB..satsang_centres	c
	JOIN	satsang_centres_details	d
		ON	(	c.satsang_centre_id	=	d.satsang_centre_id	)
	LEFT JOIN	CDB..districts_or_cities	t
		ON	(	c.district_or_city_id	=	t.district_or_city_id	)
	LEFT JOIN	CDB..states	s
		ON	(	s.state_id	=	t.state_id	)
WHERE	c.satsang_centre_id	IN	(	SELECT	DISTINCT weekly_satsang_centre_id
									FROM	sewadars_registrations	sr
										JOIN	sewadars_details	sd
											ON	(	sr.sewadar_id	=	sd.sewadar_id	)
									WHERE	satsang_centre_id	=	5820
							)
AND		satsang_centre_type IN ('Sub Centre', 'Point')
AND		reports_to_centre_id	IS NULL
ORDER BY 3