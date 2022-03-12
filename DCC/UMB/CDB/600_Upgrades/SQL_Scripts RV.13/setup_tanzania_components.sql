/* ==================================================================================
   	Source File		:	setup_tanzania_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	04-Apr-2016
	Module ID		:	CDB
	Last updated	:	04-Apr-2016
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 & 2 Address Components of Tanzania are set-up
	==================================================================================
		Revision History
	----------------------------------------------------------------------------------

	==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

-- ======================================================================

DECLARE
	@country_id		INT

-- ======================================================================
SELECT	@country_id	=	country_id
FROM	countries
WHERE	country_nm	=	'Tanzania'

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Tanzania not found', 16, 1)
	RETURN
END

UPDATE	countries
	SET	level_1_address_component	=	'Region',
		level_2_address_component	=	'District',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id


-- ======================================================================

DECLARE	@tbl	TABLE	(	level_1_cd	VARCHAR (5) PRIMARY KEY, level_1_nm varchar (50) UNIQUE)

INSERT INTO @tbl VALUES ('AS', 'Arusha')
INSERT INTO @tbl VALUES ('DS', 'Dar es Salaam')
INSERT INTO @tbl VALUES ('DO', 'Dodoma')
INSERT INTO @tbl VALUES ('GE', 'Geita')
INSERT INTO @tbl VALUES ('IG', 'Iringa')
INSERT INTO @tbl VALUES ('KG', 'Kagera')
INSERT INTO @tbl VALUES ('KA', 'Katavi')
INSERT INTO @tbl VALUES ('KM', 'Kigoma')
INSERT INTO @tbl VALUES ('KL', 'Kilimanjaro')
INSERT INTO @tbl VALUES ('LI', 'Lindi')
INSERT INTO @tbl VALUES ('MY', 'Manyara')
INSERT INTO @tbl VALUES ('MA', 'Mara')
INSERT INTO @tbl VALUES ('MB', 'Mbeya')
INSERT INTO @tbl VALUES ('MO', 'Morogoro')
INSERT INTO @tbl VALUES ('MT', 'Mtwara')
INSERT INTO @tbl VALUES ('MZ', 'Mwanza')
INSERT INTO @tbl VALUES ('NJ', 'Njombe')
INSERT INTO @tbl VALUES ('PN', 'Pemba North (Kaskazini Pemba)')
INSERT INTO @tbl VALUES ('PS', 'Pemba South (Kusini Pemba)')
INSERT INTO @tbl VALUES ('PW', 'Pwani')
INSERT INTO @tbl VALUES ('RU', 'Rukwa')
INSERT INTO @tbl VALUES ('RV', 'Ruvuma')
INSERT INTO @tbl VALUES ('SY', 'Shinyanga')
INSERT INTO @tbl VALUES ('SI', 'Simiyu')
INSERT INTO @tbl VALUES ('SD', 'Singida')
INSERT INTO @tbl VALUES ('TB', 'Tabora')
INSERT INTO @tbl VALUES ('TN', 'Tanga')
INSERT INTO @tbl VALUES ('ZN', 'Zanzibar North (Kaskazini Unguja)')
INSERT INTO @tbl VALUES ('ZS', 'Zanzibar South & Central (Kusini Unguja)')
INSERT INTO @tbl VALUES ('ZW', 'Zanzibar Urban West (Mjini Magharibi)')

-- ======================================================================

DECLARE	@tb	TABLE	(	level_1_nm	VARCHAR (50),
							level_2_cd	VARCHAR (5) ,
							level_2_nm	VARCHAR (50),
								PRIMARY KEY (level_1_nm, level_2_cd),
								UNIQUE (level_1_nm, level_2_nm)
						)

INSERT INTO @tb VALUES ('Arusha', 'AR', 'Arusha')
INSERT INTO @tb VALUES ('Arusha', 'AS', 'Arusha City')
INSERT INTO @tb VALUES ('Arusha', 'KR', 'Karatu')
INSERT INTO @tb VALUES ('Arusha', 'LG', 'Longido')
INSERT INTO @tb VALUES ('Arusha', 'MR', 'Meru')
INSERT INTO @tb VALUES ('Arusha', 'MD', 'Monduli')
INSERT INTO @tb VALUES ('Arusha', 'NG', 'Ngorongoro')
INSERT INTO @tb VALUES ('Dar es Salaam', 'IM', 'Ilala Municipal')
INSERT INTO @tb VALUES ('Dar es Salaam', 'KM', 'Kinondoni Municipal')
INSERT INTO @tb VALUES ('Dar es Salaam', 'TM', 'Temeke Municipal')
INSERT INTO @tb VALUES ('Dodoma', 'BH', 'Bahi')
INSERT INTO @tb VALUES ('Dodoma', 'CW', 'Chamwino')
INSERT INTO @tb VALUES ('Dodoma', 'CB', 'Chemba')
INSERT INTO @tb VALUES ('Dodoma', 'DM', 'Dodoma Municipal')
INSERT INTO @tb VALUES ('Dodoma', 'KD', 'Kondoa')
INSERT INTO @tb VALUES ('Dodoma', 'KG', 'Kongwa')
INSERT INTO @tb VALUES ('Dodoma', 'MP', 'Mpwapwa')
INSERT INTO @tb VALUES ('Geita', 'BK', 'Bukombe')
INSERT INTO @tb VALUES ('Geita', 'CH', 'Chato')
INSERT INTO @tb VALUES ('Geita', 'GT', 'Geita')
INSERT INTO @tb VALUES ('Geita', 'MB', 'Mbogwe')
INSERT INTO @tb VALUES ('Geita', 'NY', 'Nyang''hwale')
INSERT INTO @tb VALUES ('Iringa', 'IM', 'Iringa Municipal')
INSERT INTO @tb VALUES ('Iringa', 'IR', 'Iringa (Rural)')
INSERT INTO @tb VALUES ('Iringa', 'KL', 'Kilolo')
INSERT INTO @tb VALUES ('Iringa', 'MT', 'Mafinga Town')
INSERT INTO @tb VALUES ('Iringa', 'MF', 'Mufindi')
INSERT INTO @tb VALUES ('Kagera', 'BH', 'Biharamulo')
INSERT INTO @tb VALUES ('Kagera', 'BM', 'Bukoba Municipal')
INSERT INTO @tb VALUES ('Kagera', 'BR', 'Bukoba (Rural)')
INSERT INTO @tb VALUES ('Kagera', 'KG', 'Karagwe')
INSERT INTO @tb VALUES ('Kagera', 'KR', 'Kyerwa')
INSERT INTO @tb VALUES ('Kagera', 'MS', 'Missenyi')
INSERT INTO @tb VALUES ('Kagera', 'ML', 'Muleba')
INSERT INTO @tb VALUES ('Kagera', 'NG', 'Ngara')
INSERT INTO @tb VALUES ('Katavi', 'ML', 'Mlele')
INSERT INTO @tb VALUES ('Katavi', 'MP', 'Mpanda')
INSERT INTO @tb VALUES ('Katavi', 'MT', 'Mpanda Town')
INSERT INTO @tb VALUES ('Kigoma', 'BH', 'Buhigwe')
INSERT INTO @tb VALUES ('Kigoma', 'KK', 'Kakonko')
INSERT INTO @tb VALUES ('Kigoma', 'KS', 'Kasulu')
INSERT INTO @tb VALUES ('Kigoma', 'KT', 'Kasulu Town')
INSERT INTO @tb VALUES ('Kigoma', 'KB', 'Kibondo')
INSERT INTO @tb VALUES ('Kigoma', 'KR', 'Kigoma (Rural)')
INSERT INTO @tb VALUES ('Kigoma', 'KU', 'Kigoma-Ujiji Municipal')
INSERT INTO @tb VALUES ('Kigoma', 'UV', 'Uvinza')
INSERT INTO @tb VALUES ('Kilimanjaro', 'HA', 'Hai')
INSERT INTO @tb VALUES ('Kilimanjaro', 'MM', 'Moshi Municipal')
INSERT INTO @tb VALUES ('Kilimanjaro', 'MR', 'Moshi (Rural)')
INSERT INTO @tb VALUES ('Kilimanjaro', 'MW', 'Mwanga')
INSERT INTO @tb VALUES ('Kilimanjaro', 'RB', 'Rombo')
INSERT INTO @tb VALUES ('Kilimanjaro', 'SM', 'Same')
INSERT INTO @tb VALUES ('Kilimanjaro', 'SH', 'Siha')
INSERT INTO @tb VALUES ('Lindi', 'KL', 'Kilwa')
INSERT INTO @tb VALUES ('Lindi', 'LM', 'Lindi Municipal')
INSERT INTO @tb VALUES ('Lindi', 'LR', 'Lindi (Rural)')
INSERT INTO @tb VALUES ('Lindi', 'LW', 'Liwale')
INSERT INTO @tb VALUES ('Lindi', 'NH', 'Nachingwea')
INSERT INTO @tb VALUES ('Lindi', 'RG', 'Ruangwa')
INSERT INTO @tb VALUES ('Manyara', 'BB', 'Babati')
INSERT INTO @tb VALUES ('Manyara', 'BT', 'Babati Town')
INSERT INTO @tb VALUES ('Manyara', 'HN', 'Hanang')
INSERT INTO @tb VALUES ('Manyara', 'KT', 'Kiteto')
INSERT INTO @tb VALUES ('Manyara', 'MB', 'Mbulu')
INSERT INTO @tb VALUES ('Manyara', 'SM', 'Simanjiro')
INSERT INTO @tb VALUES ('Mara', 'BD', 'Bunda')
INSERT INTO @tb VALUES ('Mara', 'BT', 'Butiama')
INSERT INTO @tb VALUES ('Mara', 'MM', 'Musoma Municipal')
INSERT INTO @tb VALUES ('Mara', 'MR', 'Musoma (Rural)')
INSERT INTO @tb VALUES ('Mara', 'RR', 'Rorya')
INSERT INTO @tb VALUES ('Mara', 'SR', 'Serengeti')
INSERT INTO @tb VALUES ('Mara', 'TR', 'Tarime')
INSERT INTO @tb VALUES ('Mbeya', 'CY', 'Chunya')
INSERT INTO @tb VALUES ('Mbeya', 'IJ', 'Ileje')
INSERT INTO @tb VALUES ('Mbeya', 'KY', 'Kyela')
INSERT INTO @tb VALUES ('Mbeya', 'ML', 'Mbarali')
INSERT INTO @tb VALUES ('Mbeya', 'MC', 'Mbeya City')
INSERT INTO @tb VALUES ('Mbeya', 'MR', 'Mbeya (Rural)')
INSERT INTO @tb VALUES ('Mbeya', 'MZ', 'Mbozi')
INSERT INTO @tb VALUES ('Mbeya', 'MB', 'Momba')
INSERT INTO @tb VALUES ('Mbeya', 'RG', 'Rungwe')
INSERT INTO @tb VALUES ('Mbeya', 'TT', 'Tunduma Town')
INSERT INTO @tb VALUES ('Morogoro', 'GR', 'Gairo')
INSERT INTO @tb VALUES ('Morogoro', 'KB', 'Kilombero')
INSERT INTO @tb VALUES ('Morogoro', 'KL', 'Kilosa')
INSERT INTO @tb VALUES ('Morogoro', 'MM', 'Morogoro Municipal')
INSERT INTO @tb VALUES ('Morogoro', 'MR', 'Morogoro (Rural)')
INSERT INTO @tb VALUES ('Morogoro', 'MV', 'Mvomero')
INSERT INTO @tb VALUES ('Morogoro', 'UL', 'Ulanga')
INSERT INTO @tb VALUES ('Mtwara', 'MS', 'Masasi')
INSERT INTO @tb VALUES ('Mtwara', 'MT', 'Masasi Town')
INSERT INTO @tb VALUES ('Mtwara', 'MM', 'Mtwara Municipal')
INSERT INTO @tb VALUES ('Mtwara', 'MR', 'Mtwara (Rural)')
INSERT INTO @tb VALUES ('Mtwara', 'NY', 'Nanyumbu')
INSERT INTO @tb VALUES ('Mtwara', 'NW', 'Newala')
INSERT INTO @tb VALUES ('Mtwara', 'TD', 'Tandahimba')
INSERT INTO @tb VALUES ('Mwanza', 'IM', 'Ilemela Municipal')
INSERT INTO @tb VALUES ('Mwanza', 'KW', 'Kwimba')
INSERT INTO @tb VALUES ('Mwanza', 'MG', 'Magu')
INSERT INTO @tb VALUES ('Mwanza', 'MS', 'Misungwi')
INSERT INTO @tb VALUES ('Mwanza', 'NM', 'Nyamagana Municipal')
INSERT INTO @tb VALUES ('Mwanza', 'SN', 'Sengerema')
INSERT INTO @tb VALUES ('Mwanza', 'UK', 'Ukerewe')
INSERT INTO @tb VALUES ('Njombe', 'LD', 'Ludewa')
INSERT INTO @tb VALUES ('Njombe', 'MT', 'Makambako Town')
INSERT INTO @tb VALUES ('Njombe', 'MK', 'Makete')
INSERT INTO @tb VALUES ('Njombe', 'NJ', 'Njombe')
INSERT INTO @tb VALUES ('Njombe', 'NT', 'Njombe Town')
INSERT INTO @tb VALUES ('Njombe', 'WG', 'Wanging''ombe')
INSERT INTO @tb VALUES ('Pemba North (Kaskazini Pemba)', 'MC', 'Micheweni')
INSERT INTO @tb VALUES ('Pemba North (Kaskazini Pemba)', 'WT', 'Wete')
INSERT INTO @tb VALUES ('Pemba South (Kusini Pemba)', 'CC', 'Chake Chake')
INSERT INTO @tb VALUES ('Pemba South (Kusini Pemba)', 'MK', 'Mkoani')
INSERT INTO @tb VALUES ('Pwani', 'BG', 'Bagamoyo')
INSERT INTO @tb VALUES ('Pwani', 'KB', 'Kibaha')
INSERT INTO @tb VALUES ('Pwani', 'KT', 'Kibaha Town')
INSERT INTO @tb VALUES ('Pwani', 'KS', 'Kisarawe')
INSERT INTO @tb VALUES ('Pwani', 'MF', 'Mafia')
INSERT INTO @tb VALUES ('Pwani', 'MK', 'Mkuranga')
INSERT INTO @tb VALUES ('Pwani', 'RF', 'Rufiji')
INSERT INTO @tb VALUES ('Rukwa', 'KL', 'Kalambo')
INSERT INTO @tb VALUES ('Rukwa', 'NK', 'Nkasi')
INSERT INTO @tb VALUES ('Rukwa', 'SM', 'Sumbawanga Municipal')
INSERT INTO @tb VALUES ('Rukwa', 'SR', 'Sumbawanga (Rural)')
INSERT INTO @tb VALUES ('Ruvuma', 'MB', 'Mbinga')
INSERT INTO @tb VALUES ('Ruvuma', 'NT', 'Namtumbo')
INSERT INTO @tb VALUES ('Ruvuma', 'NY', 'Nyasa')
INSERT INTO @tb VALUES ('Ruvuma', 'SM', 'Songea Municipal')
INSERT INTO @tb VALUES ('Ruvuma', 'SR', 'Songea (Rural)')
INSERT INTO @tb VALUES ('Ruvuma', 'TD', 'Tunduru')
INSERT INTO @tb VALUES ('Shinyanga', 'KH', 'Kahama')
INSERT INTO @tb VALUES ('Shinyanga', 'KT', 'Kahama Town')
INSERT INTO @tb VALUES ('Shinyanga', 'KS', 'Kishapu')
INSERT INTO @tb VALUES ('Shinyanga', 'SM', 'Shinyanga Municipal')
INSERT INTO @tb VALUES ('Shinyanga', 'SR', 'Shinyanga (Rural)')
INSERT INTO @tb VALUES ('Simiyu', 'BR', 'Bariadi')
INSERT INTO @tb VALUES ('Simiyu', 'BS', 'Busega')
INSERT INTO @tb VALUES ('Simiyu', 'IT', 'Itilima')
INSERT INTO @tb VALUES ('Simiyu', 'MS', 'Maswa')
INSERT INTO @tb VALUES ('Simiyu', 'MT', 'Meatu')
INSERT INTO @tb VALUES ('Singida', 'IK', 'Ikungi')
INSERT INTO @tb VALUES ('Singida', 'IR', 'Iramba')
INSERT INTO @tb VALUES ('Singida', 'MY', 'Manyoni')
INSERT INTO @tb VALUES ('Singida', 'ML', 'Mkalama')
INSERT INTO @tb VALUES ('Singida', 'SM', 'Singida Municipal')
INSERT INTO @tb VALUES ('Singida', 'SR', 'Singida (Rural)')
INSERT INTO @tb VALUES ('Tabora', 'IG', 'Igunga')
INSERT INTO @tb VALUES ('Tabora', 'KL', 'Kaliua')
INSERT INTO @tb VALUES ('Tabora', 'NZ', 'Nzega')
INSERT INTO @tb VALUES ('Tabora', 'SK', 'Sikonge')
INSERT INTO @tb VALUES ('Tabora', 'TM', 'Tabora Municipal')
INSERT INTO @tb VALUES ('Tabora', 'UR', 'Urambo')
INSERT INTO @tb VALUES ('Tabora', 'UU', 'Uyui')
INSERT INTO @tb VALUES ('Tanga', 'HN', 'Handeni')
INSERT INTO @tb VALUES ('Tanga', 'HT', 'Handeni Town')
INSERT INTO @tb VALUES ('Tanga', 'KL', 'Kilindi')
INSERT INTO @tb VALUES ('Tanga', 'KG', 'Korogwe')
INSERT INTO @tb VALUES ('Tanga', 'KT', 'Korogwe Town')
INSERT INTO @tb VALUES ('Tanga', 'LS', 'Lushoto')
INSERT INTO @tb VALUES ('Tanga', 'MK', 'Mkinga')
INSERT INTO @tb VALUES ('Tanga', 'MH', 'Muheza')
INSERT INTO @tb VALUES ('Tanga', 'PG', 'Pangani')
INSERT INTO @tb VALUES ('Tanga', 'TC', 'Tanga City')
INSERT INTO @tb VALUES ('Zanzibar North (Kaskazini Unguja)', 'KA', 'Kaskazini A [North A]')
INSERT INTO @tb VALUES ('Zanzibar North (Kaskazini Unguja)', 'KB', 'Kaskazini B [North B]')
INSERT INTO @tb VALUES ('Zanzibar South & Central (Kusini Unguja)', 'KT', 'Kati [Central]')
INSERT INTO @tb VALUES ('Zanzibar South & Central (Kusini Unguja)', 'KS', 'Kusini [South]')
INSERT INTO @tb VALUES ('Zanzibar Urban West (Mjini Magharibi)', 'MG', 'Magharibi [West]')
INSERT INTO @tb VALUES ('Zanzibar Urban West (Mjini Magharibi)', 'MN', 'Mjini [Town]')

-- ======================================================================

INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) 
	SELECT	@country_id, level_1_nm, level_1_cd
	FROM	@tbl

-- ======================================================================

INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	level_2_nm, level_2_cd, level_1_address_component_id
	FROM	@tb	t
		JOIN	level_1_address_components	l1
			ON	(	l1.level_1_address_component_nm	=	t.level_1_nm
				AND	l1.country_id					=	@country_id
				)

-- ======================================================================

UPDATE	l2
	SET	is_authentic	=	1
FROM	level_2_address_components	l2
	JOIN	level_1_address_components	l1
		ON	(	l1.level_1_address_component_id	=	l2.level_1_address_component_id
			AND	l1.country_id	=	@country_id
			)

-- ======================================================================

UPDATE	level_1_address_components
	SET	is_authentic	=	1
WHERE	country_id	=	@country_id

-- ======================================================================

