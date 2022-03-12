
DECLARE
    @centre_id		INTEGER,
	@main_centre_id	INTEGER,
	@state_id		INTEGER,
	@district_nm	VARCHAR (50),
	@area_nm		VARCHAR (50),
	@area_cd		VARCHAR (10);

SELECT	@main_centre_id	=	s.satsang_centre_id
FROM	cdb..satsang_centres	s
	JOIN	satsang_centres_details	d
		ON	(	s.satsang_centre_id	=	d.satsang_centre_id	)
WHERE	is_main_centre	=	'Yes'
AND		centre_alphabet	=	'M';
IF (@@ROWCOUNT != 1)
	RETURN;
PRINT @main_centre_id

SELECT	@state_id	=	state_id
FROM	CDB..states
WHERE	country_id	=	1
AND		state_nm	=	'Maharashtra';
IF (@@ROWCOUNT != 1)
	RETURN;
PRINT @state_id

SET @district_nm = 'Pune';
SET @area_cd	= 'PN';
SET @area_nm	= @district_nm + ' Area';

INSERT INTO	CDB..satsang_centres
		(	satsang_centre_cd, satsang_centre_nm, satsang_centre_type, address_line_1, district_or_city_id	)
	SELECT	@area_cd, @area_nm, 'Area', 'Not Applicable', district_or_city_id
	FROM	CDB..districts_or_cities
	WHERE	district_nm	=	@district_nm
	AND		state_id	=	@state_id;
SET	@centre_id	=	SCOPE_IDENTITY ();
INSERT	INTO	satsang_centres_details
	(	satsang_centre_id, is_main_centre, reports_to_centre_id )
    VALUES
	(	@centre_id, 'No', @main_centre_id	);

UPDATE	satsang_centres_details
	SET	reports_to_centre_id	=	@centre_id
WHERE	satsang_centre_id	IN	(	9961, 6094, 6098, 6012, 6005, 6105, 6106	);


SET @district_nm = 'Aurangabad';
SET @area_cd	= 'ARNGBD';
SET @area_nm	= @district_nm + ' Area';

INSERT INTO	CDB..satsang_centres
		(	satsang_centre_cd, satsang_centre_nm, satsang_centre_type, address_line_1, district_or_city_id	)
	SELECT	@area_cd, @area_nm, 'Area', 'Not Applicable', district_or_city_id
	FROM	CDB..districts_or_cities
	WHERE	district_nm	=	@district_nm
	AND		state_id	=	@state_id;
SET	@centre_id	=	SCOPE_IDENTITY ();
INSERT	INTO	satsang_centres_details
	(	satsang_centre_id, is_main_centre, reports_to_centre_id )
    VALUES
	(	@centre_id, 'No', @main_centre_id	);


UPDATE	satsang_centres_details
	SET	reports_to_centre_id	=	@centre_id
WHERE	satsang_centre_id	IN	(	6063, 6069, 6070, 6064	);



