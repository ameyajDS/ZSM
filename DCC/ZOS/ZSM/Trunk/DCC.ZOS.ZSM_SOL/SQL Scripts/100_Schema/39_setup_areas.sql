DECLARE
    @centre_id	INTEGER;

INSERT INTO	CDB..satsang_centres
	(	satsang_centre_cd, satsang_centre_nm, satsang_centre_type, address_line_1, district_or_city_id	)
    VALUES
	(	'BRHNP', 'Burhanpur Area', 'Area', 'Not Applicable', 730	);
SET	@centre_id	=	SCOPE_IDENTITY ();
INSERT	INTO	satsang_centres_details
	(	satsang_centre_id, is_main_centre, reports_to_centre_id )
    VALUES
	(	@centre_id, 'No', 5820	);

INSERT INTO	CDB..satsang_centres
	(	satsang_centre_cd, satsang_centre_nm, satsang_centre_type, address_line_1, district_or_city_id	)
    VALUES
	(	'DWS', 'Dewas Area', 'Area', 'Not Applicable', 310	);
SET	@centre_id	=	SCOPE_IDENTITY ();
INSERT	INTO	satsang_centres_details
	(	satsang_centre_id, is_main_centre, reports_to_centre_id )
    VALUES
	(	@centre_id, 'No', 5820	);

INSERT INTO	CDB..satsang_centres
	(	satsang_centre_cd, satsang_centre_nm, satsang_centre_type, address_line_1, district_or_city_id	)
    VALUES
	(	'GWLR', 'Gwalior Area', 'Area', 'Not Applicable', 313	);
SET	@centre_id	=	SCOPE_IDENTITY ();
INSERT	INTO	satsang_centres_details
	(	satsang_centre_id, is_main_centre, reports_to_centre_id )
    VALUES
	(	@centre_id, 'No', 5820	);

INSERT INTO	CDB..satsang_centres
	(	satsang_centre_cd, satsang_centre_nm, satsang_centre_type, address_line_1, district_or_city_id	)
    VALUES
	(	'SHVPR', 'Shivpuri Area', 'Area', 'Not Applicable', 335	);
SET	@centre_id	=	SCOPE_IDENTITY ();
INSERT	INTO	satsang_centres_details
	(	satsang_centre_id, is_main_centre, reports_to_centre_id )
    VALUES
	(	@centre_id, 'No', 5820	);

INSERT INTO	CDB..satsang_centres
	(	satsang_centre_cd, satsang_centre_nm, satsang_centre_type, address_line_1, district_or_city_id	)
    VALUES
	(	'ITRSI', 'Itarsi Area', 'Area', 'Not Applicable', 314	);
SET	@centre_id	=	SCOPE_IDENTITY ();
INSERT	INTO	satsang_centres_details
	(	satsang_centre_id, is_main_centre, reports_to_centre_id )
    VALUES
	(	@centre_id, 'No', 5820	);

INSERT INTO	CDB..satsang_centres
	(	satsang_centre_cd, satsang_centre_nm, satsang_centre_type, address_line_1, district_or_city_id	)
    VALUES
	(	'INDR', 'Indore Area', 'Area', 'Not Applicable', 315	);
SET	@centre_id	=	SCOPE_IDENTITY ();
INSERT	INTO	satsang_centres_details
	(	satsang_centre_id, is_main_centre, reports_to_centre_id )
    VALUES
	(	@centre_id, 'No', 5820	);

INSERT INTO	CDB..satsang_centres
	(	satsang_centre_cd, satsang_centre_nm, satsang_centre_type, address_line_1, district_or_city_id	)
    VALUES
	(	'MHW', 'Mhow Area', 'Area', 'Not Applicable', 315	);
SET	@centre_id	=	SCOPE_IDENTITY ();
INSERT	INTO	satsang_centres_details
	(	satsang_centre_id, is_main_centre, reports_to_centre_id )
    VALUES
	(	@centre_id, 'No', 5820	);

INSERT INTO	CDB..satsang_centres
	(	satsang_centre_cd, satsang_centre_nm, satsang_centre_type, address_line_1, district_or_city_id	)
    VALUES
	(	'SNWD', 'Sanawad Area', 'Area', 'Not Applicable', 319	);
SET	@centre_id	=	SCOPE_IDENTITY ();
INSERT	INTO	satsang_centres_details
	(	satsang_centre_id, is_main_centre, reports_to_centre_id )
    VALUES
	(	@centre_id, 'No', 5820	);

INSERT INTO	CDB..satsang_centres
	(	satsang_centre_cd, satsang_centre_nm, satsang_centre_type, address_line_1, district_or_city_id	)
    VALUES
	(	'JZBLPR', 'Jabalpur Area', 'Area', 'Not Applicable', 316	);
SET	@centre_id	=	SCOPE_IDENTITY ();
INSERT	INTO	satsang_centres_details
	(	satsang_centre_id, is_main_centre, reports_to_centre_id )
    VALUES
	(	@centre_id, 'No', 5820	);

INSERT INTO	CDB..satsang_centres
	(	satsang_centre_cd, satsang_centre_nm, satsang_centre_type, address_line_1, district_or_city_id	)
    VALUES
	(	'MNDSR', 'Mandsaur Area', 'Area', 'Not Applicable', 321	);
SET	@centre_id	=	SCOPE_IDENTITY ();
INSERT	INTO	satsang_centres_details
	(	satsang_centre_id, is_main_centre, reports_to_centre_id )
    VALUES
	(	@centre_id, 'No', 5820	);

INSERT INTO	CDB..satsang_centres
	(	satsang_centre_cd, satsang_centre_nm, satsang_centre_type, address_line_1, district_or_city_id	)
    VALUES
	(	'RTLM', 'Ratlam Area', 'Area', 'Not Applicable', 327	);
SET	@centre_id	=	SCOPE_IDENTITY ();
INSERT	INTO	satsang_centres_details
	(	satsang_centre_id, is_main_centre, reports_to_centre_id )
    VALUES
	(	@centre_id, 'No', 5820	);

INSERT INTO	CDB..satsang_centres
	(	satsang_centre_cd, satsang_centre_nm, satsang_centre_type, address_line_1, district_or_city_id	)
    VALUES
	(	'BN', 'Bina Area', 'Area', 'Not Applicable', 329	);
SET	@centre_id	=	SCOPE_IDENTITY ();
INSERT	INTO	satsang_centres_details
	(	satsang_centre_id, is_main_centre, reports_to_centre_id )
    VALUES
	(	@centre_id, 'No', 5820	);

INSERT INTO	CDB..satsang_centres
	(	satsang_centre_cd, satsang_centre_nm, satsang_centre_type, address_line_1, district_or_city_id	)
    VALUES
	(	'KTN', 'Katni Area', 'Area', 'Not Applicable', 558	);
SET	@centre_id	=	SCOPE_IDENTITY ();
INSERT	INTO	satsang_centres_details
	(	satsang_centre_id, is_main_centre, reports_to_centre_id )
    VALUES
	(	@centre_id, 'No', 5820	);

INSERT INTO	CDB..satsang_centres
	(	satsang_centre_cd, satsang_centre_nm, satsang_centre_type, address_line_1, district_or_city_id	)
    VALUES
	(	'UJJN', 'Ujjain Area', 'Area', 'Not Applicable', 338	);
SET	@centre_id	=	SCOPE_IDENTITY ();
INSERT	INTO	satsang_centres_details
	(	satsang_centre_id, is_main_centre, reports_to_centre_id )
    VALUES
	(	@centre_id, 'No', 5820	);

INSERT INTO	CDB..satsang_centres
	(	satsang_centre_cd, satsang_centre_nm, satsang_centre_type, address_line_1, district_or_city_id	)
    VALUES
	(	'AGRMW', 'Agar Malwa Area', 'Area', 'Not Applicable', 334	);
SET	@centre_id	=	SCOPE_IDENTITY ();
INSERT	INTO	satsang_centres_details
	(	satsang_centre_id, is_main_centre, reports_to_centre_id )
    VALUES
	(	@centre_id, 'No', 5820	);

INSERT INTO	CDB..satsang_centres
	(	satsang_centre_cd, satsang_centre_nm, satsang_centre_type, address_line_1, district_or_city_id	)
    VALUES
	(	'DHDW', 'Dhudwa Area', 'Area', 'Not Applicable', 302	);
SET	@centre_id	=	SCOPE_IDENTITY ();
INSERT	INTO	satsang_centres_details
	(	satsang_centre_id, is_main_centre, reports_to_centre_id )
    VALUES
	(	@centre_id, 'No', 5820	);

INSERT INTO	CDB..satsang_centres
	(	satsang_centre_cd, satsang_centre_nm, satsang_centre_type, address_line_1, district_or_city_id	)
    VALUES
	(	'NGPA', 'Nagpur Area', 'Area', 'Not Applicable', 271	);
SET	@centre_id	=	SCOPE_IDENTITY ();
INSERT	INTO	satsang_centres_details
	(	satsang_centre_id, is_main_centre, reports_to_centre_id )
    VALUES
	(	@centre_id, 'No', 6056	);

INSERT INTO	CDB..satsang_centres
	(	satsang_centre_cd, satsang_centre_nm, satsang_centre_type, address_line_1, district_or_city_id	)
    VALUES
	(	'AMRVT', 'Amravati Area', 'Area', 'Not Applicable', 93	);
SET	@centre_id	=	SCOPE_IDENTITY ();
INSERT	INTO	satsang_centres_details
	(	satsang_centre_id, is_main_centre, reports_to_centre_id )
    VALUES
	(	@centre_id, 'No', 6056	);

INSERT INTO	CDB..satsang_centres
	(	satsang_centre_cd, satsang_centre_nm, satsang_centre_type, address_line_1, district_or_city_id	)
    VALUES
	(	'AKL', 'AKola Area', 'Area', 'Not Applicable', 92	);
SET	@centre_id	=	SCOPE_IDENTITY ();
INSERT	INTO	satsang_centres_details
	(	satsang_centre_id, is_main_centre, reports_to_centre_id )
    VALUES
	(	@centre_id, 'No', 6056	);

INSERT INTO	CDB..satsang_centres
	(	satsang_centre_cd, satsang_centre_nm, satsang_centre_type, address_line_1, district_or_city_id	)
    VALUES
	(	'GNDA', 'Gondia Area', 'Area', 'Not Applicable', 107	);
SET	@centre_id	=	SCOPE_IDENTITY ();
INSERT	INTO	satsang_centres_details
	(	satsang_centre_id, is_main_centre, reports_to_centre_id )
    VALUES
	(	@centre_id, 'No', 6056	);

