/* ==================================================================================
	Source File		:	countries_setup.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	Sat Jun 21 15:16 2014
	Module ID		:	CDB
	Last updated	:	Jun 25, 2014
	==================================================================================
																		   Usage Notes
	----------------------------------------------------------------------------------
		Countries data is set-up/revised apart from setting up Level 1 and Level 2 Address Components.
		
			Following names of the countries have been changed:
				New Name									Old Name
				~~~~~~~~									~~~~~~~~
				Antigua and Barbuda							Antigua
				Cocos (Keeling) Islands						Cocos Islands
				Congo-Brazzaville							Congo
				Congo-kinshasa								DR Congo
				French Southern Lands						French Southern Territories
				Heard and Mcdonald Islands					Heard Island And Mcdonald Islands
				Macau										Macao
				Palestinian Territories						Palestinian Territory
				Saint Martin								St. Martin F.W.I
				South Georgia and South Sandwich Islands	South Georgia
				Saint Pierre and Miquelon					St. Pierre & Miquelon
				Saint Vincent and the Grenadines			St. Vincent & Grenadines
				Svalbard and Jan Mayen Islands				Svalbard and Jan Mayen
				United States of America					United States
				Vatican City								Vatican

			Country codes have been changed for the following countries:
				Country				Code
				~~~~~~~				~~~~
				Slovenia			S
				Solomon Islands		SI

			Following countries have been made in-effective:
				KOREA, "Korea, Republic Of (South Korea)", Caribbean, St. Lucia,
				St. Maarten, "Taiwan, Province of China", U.S.A. and Yugoslavia

			Following country has been made effective:
				South Korea
	==================================================================================
																	  Revision History
	----------------------------------------------------------------------------------
		26-Jun-2014 : JL
			* Minor fix: to set the countries as aunthentic, all should be marked as unauthentic first.
	==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

-- ======================================================================
-- Set-up the countries data in a memory table
-- ======================================================================

DECLARE
	@countries	TABLE	(	country_nm	VARCHAR (40) NOT NULL PRIMARY KEY,
							level_1		VARCHAR (40),
							level_2		VARCHAR (40)
						)

INSERT INTO @countries VALUES (	'Albania', 'County', 'District');
INSERT INTO @countries VALUES (	'Afghanistan', 'Province', 'City / District');
INSERT INTO @countries VALUES (	'Algeria', 'Province', 'District');
INSERT INTO @countries VALUES (	'Aland Islands', 'Municipality', NULL);
INSERT INTO @countries VALUES (	'Canada', 'Province', 'County');
INSERT INTO @countries VALUES (	'Russia', 'Subject', 'Raion');
INSERT INTO @countries VALUES (	'American Samoa', 'District', 'County');
INSERT INTO @countries VALUES (	'Andorra', 'Parish', NULL);
INSERT INTO @countries VALUES (	'Angola', 'Province', 'Council');
INSERT INTO @countries VALUES (	'Anguilla', 'District', NULL);
INSERT INTO @countries VALUES (	'Antarctica', 'Claim', NULL);
INSERT INTO @countries VALUES (	'Antigua and Barbuda', 'Parish', NULL);
INSERT INTO @countries VALUES (	'Argentina', 'Province', 'Department');
INSERT INTO @countries VALUES (	'Armenia', 'Province', NULL);
INSERT INTO @countries VALUES (	'Aruba', NULL, NULL);
INSERT INTO @countries VALUES (	'Australia', 'State', 'Shire');
INSERT INTO @countries VALUES (	'Austria', 'State', 'District');
INSERT INTO @countries VALUES (	'Azerbaijan', 'District', NULL);
INSERT INTO @countries VALUES (	'Bahamas', 'District', NULL);
INSERT INTO @countries VALUES (	'Bahrain', 'Governorate', NULL);
INSERT INTO @countries VALUES (	'Bangladesh', 'Division', 'District');
INSERT INTO @countries VALUES (	'Barbados', 'Parish', NULL);
INSERT INTO @countries VALUES (	'Belarus', 'Region', 'District');
INSERT INTO @countries VALUES (	'Belgium', 'Province', 'Arrondissement');
INSERT INTO @countries VALUES (	'Belize', 'District', 'Subdivision');
INSERT INTO @countries VALUES (	'Benin', 'Department', 'Commune');
INSERT INTO @countries VALUES (	'Bermuda', 'Parish', NULL);
INSERT INTO @countries VALUES (	'Bhutan', 'District', 'Subdistrict');
INSERT INTO @countries VALUES (	'Bolivia', 'Department', 'Province');
INSERT INTO @countries VALUES (	'Bonaire, Sint Eustatius and Saba', 'Island region', NULL);
INSERT INTO @countries VALUES (	'Bosnia-Herzegovina', 'County', 'Commune');
INSERT INTO @countries VALUES (	'Botswana', 'District', 'Sub-district');
INSERT INTO @countries VALUES (	'Bouvet Island', NULL, NULL);
INSERT INTO @countries VALUES (	'Brazil', 'State', 'Microregion');
INSERT INTO @countries VALUES (	'British Indian Ocean Territory', NULL, NULL);
INSERT INTO @countries VALUES (	'Brunei', 'District', 'Mukim');
INSERT INTO @countries VALUES (	'Bulgaria', 'Region', 'Municipality');
INSERT INTO @countries VALUES (	'Burkina Faso', 'Province', 'Department');
INSERT INTO @countries VALUES (	'Burundi', 'Province', 'Commune');
INSERT INTO @countries VALUES (	'Cambodia', 'Province', 'District');
INSERT INTO @countries VALUES (	'Cameroon', 'Region', 'Department');
INSERT INTO @countries VALUES (	'Cape Verde', 'County', 'Parish');
INSERT INTO @countries VALUES (	'Cayman Islands', 'District', NULL);
INSERT INTO @countries VALUES (	'Central African Republic', 'Prefecture', 'Sub-prefecture');
INSERT INTO @countries VALUES (	'Chad', 'Region', 'Department');
INSERT INTO @countries VALUES (	'Chile', 'Region', 'Province');
INSERT INTO @countries VALUES (	'China', 'Province', 'Prefecture');
INSERT INTO @countries VALUES (	'Christmas Island', NULL, NULL);
INSERT INTO @countries VALUES (	'Cocos (Keeling) Islands', NULL, NULL);
INSERT INTO @countries VALUES (	'Colombia', 'Department', 'Municipality');
INSERT INTO @countries VALUES (	'Comoros', 'Autonomous island', NULL);
INSERT INTO @countries VALUES (	'Congo-Brazzaville', 'Region', 'District');
INSERT INTO @countries VALUES (	'Congo-kinshasa', 'Province', 'Zone');
INSERT INTO @countries VALUES (	'Cook Islands', NULL, NULL);
INSERT INTO @countries VALUES (	'Costa Rica', 'Province', 'Canton');
INSERT INTO @countries VALUES (	'Ivory Coast', 'District', 'Region');
INSERT INTO @countries VALUES (	'Croatia', 'County', 'Commune');
INSERT INTO @countries VALUES (	'Cuba', 'Province', 'Municipality');
INSERT INTO @countries VALUES (	'Curacao', NULL, NULL);
INSERT INTO @countries VALUES (	'Cyprus', 'District', NULL);
INSERT INTO @countries VALUES (	'Czech Republic', 'Region', 'District');
INSERT INTO @countries VALUES (	'Denmark', 'Region', 'Municipality');
INSERT INTO @countries VALUES (	'Djibouti', 'Region', 'Commune');
INSERT INTO @countries VALUES (	'Dominica', 'Parish', NULL);
INSERT INTO @countries VALUES (	'Dominican Republic', 'Province', 'Municipality');
INSERT INTO @countries VALUES (	'Ecuador', 'Province', 'Canton');
INSERT INTO @countries VALUES (	'Egypt', 'Governorate', NULL);
INSERT INTO @countries VALUES (	'El Salvador', 'Department', 'Municipio');
INSERT INTO @countries VALUES (	'Equatorial Guinea', 'Province', 'District');
INSERT INTO @countries VALUES (	'Eritrea', 'Region', 'Subregion');
INSERT INTO @countries VALUES (	'Estonia', 'County', 'Municipality');
INSERT INTO @countries VALUES (	'Ethiopia', 'State', 'Zone');
INSERT INTO @countries VALUES (	'Falkland Islands', NULL, NULL);
INSERT INTO @countries VALUES (	'Faroe Islands', 'Region', 'Commune');
INSERT INTO @countries VALUES (	'Fiji', 'Division', 'Province');
INSERT INTO @countries VALUES (	'Finland', 'Region', 'Sub-region');
INSERT INTO @countries VALUES (	'France', 'Department', 'Arrondissement');
INSERT INTO @countries VALUES (	'French Guiana', 'Arrondissement', 'Commune');
INSERT INTO @countries VALUES (	'French Polynesia', 'Subdivision', 'Commune');
INSERT INTO @countries VALUES (	'French Southern Lands', 'District', NULL);
INSERT INTO @countries VALUES (	'Gabon', 'Province', 'Department');
INSERT INTO @countries VALUES (	'Gambia', 'Region', 'District');
INSERT INTO @countries VALUES (	'Georgia', 'Region', 'District');
INSERT INTO @countries VALUES (	'Germany', 'State', 'District');
INSERT INTO @countries VALUES (	'Ghana', 'Region', 'District');
INSERT INTO @countries VALUES (	'Gibraltar', NULL, NULL);
INSERT INTO @countries VALUES (	'Greece', 'Administration', 'Municipality');
INSERT INTO @countries VALUES (	'Greenland', 'Commune', 'Municipality');
INSERT INTO @countries VALUES (	'Grenada', 'Parish', NULL);
INSERT INTO @countries VALUES (	'Guadeloupe', 'Arrondissement', 'Commune');
INSERT INTO @countries VALUES (	'Guam', 'Municipality', NULL);
INSERT INTO @countries VALUES (	'Guatemala', 'Department', 'Municipality');
INSERT INTO @countries VALUES (	'Guernsey', 'Parish', NULL);
INSERT INTO @countries VALUES (	'Guinea', 'Prefecture', 'Subprefecture');
INSERT INTO @countries VALUES (	'Guinea-Bissau', 'Region', 'Sector');
INSERT INTO @countries VALUES (	'Guyana', 'Region', 'Council');
INSERT INTO @countries VALUES (	'Haiti', 'Department', 'Arrondissement');
INSERT INTO @countries VALUES (	'Heard and McDonald Islands', NULL, NULL);
INSERT INTO @countries VALUES (	'Honduras', 'Department', 'Municipality');
INSERT INTO @countries VALUES (	'Hong Kong', 'District', 'Council');
INSERT INTO @countries VALUES (	'Hungary', 'County', 'Town-region');
INSERT INTO @countries VALUES (	'Iceland', 'Region', 'Municipality');
INSERT INTO @countries VALUES (	'Indonesia', 'Province', 'Regency');
INSERT INTO @countries VALUES (	'Iran', 'Province', 'County');
INSERT INTO @countries VALUES (	'Iraq', 'Province', 'Qadha');
INSERT INTO @countries VALUES (	'Ireland', 'County', NULL);
INSERT INTO @countries VALUES (	'Isle of Man', 'Sheading', 'Parish');
INSERT INTO @countries VALUES (	'Israel', 'District', 'Subdistrict');
INSERT INTO @countries VALUES (	'Italy', 'Province', 'Commune');
INSERT INTO @countries VALUES (	'Jamaica', 'Parish', NULL);
INSERT INTO @countries VALUES (	'Japan', 'Prefecture', 'County');
INSERT INTO @countries VALUES (	'Jersey', 'Parish', NULL);
INSERT INTO @countries VALUES (	'Jordan', 'Province', 'Sub-district');
INSERT INTO @countries VALUES (	'Kazakhstan', 'Region', 'Rayon');
INSERT INTO @countries VALUES (	'Kenya', 'County', 'District');
INSERT INTO @countries VALUES (	'Kiribati', 'Island group', NULL);
INSERT INTO @countries VALUES (	'Kuwait', 'Governorate', NULL);
INSERT INTO @countries VALUES (	'Kyrgyzstan', 'Region', 'District');
INSERT INTO @countries VALUES (	'Laos', 'Province', 'District');
INSERT INTO @countries VALUES (	'Latvia', 'Municipality', NULL);
INSERT INTO @countries VALUES (	'Lebanon', 'Province', 'County');
INSERT INTO @countries VALUES (	'Lesotho', 'District', 'Council');
INSERT INTO @countries VALUES (	'Liberia', 'County', 'District');
INSERT INTO @countries VALUES (	'Libya', 'District', NULL);
INSERT INTO @countries VALUES (	'Liechtenstein', 'Commune', NULL);
INSERT INTO @countries VALUES (	'Lithuania', 'County', 'Municipality');
INSERT INTO @countries VALUES (	'Luxembourg', 'District', 'Canton');
INSERT INTO @countries VALUES (	'Macau', 'District', 'Parish');
INSERT INTO @countries VALUES (	'Macedonia', 'Municipality', NULL);
INSERT INTO @countries VALUES (	'Madagascar', 'Province', 'Region');
INSERT INTO @countries VALUES (	'Malawi', 'District', NULL);
INSERT INTO @countries VALUES (	'Malaysia', 'State', 'District');
INSERT INTO @countries VALUES (	'Maldives', 'Atoll', NULL);
INSERT INTO @countries VALUES (	'Mali', 'Region', 'Circle');
INSERT INTO @countries VALUES (	'Malta', 'Region', 'Locality');
INSERT INTO @countries VALUES (	'Marshall Islands', 'Municipality', NULL);
INSERT INTO @countries VALUES (	'Martinique', 'Arrondissement', 'Commune');
INSERT INTO @countries VALUES (	'Mauritania', 'Region', 'Department');
INSERT INTO @countries VALUES (	'Mauritius', 'District', NULL);
INSERT INTO @countries VALUES (	'Mayotte', 'Commune', NULL);
INSERT INTO @countries VALUES (	'Mexico', 'State', 'Municipality');
INSERT INTO @countries VALUES (	'Micronesia', 'State', 'Municipality');
INSERT INTO @countries VALUES (	'Moldova', 'District', NULL);
INSERT INTO @countries VALUES (	'Monaco', 'Commune', NULL);
INSERT INTO @countries VALUES (	'Mongolia', 'Province', 'Soum');
INSERT INTO @countries VALUES (	'Montenegro', 'Commune', 'Settlement');
INSERT INTO @countries VALUES (	'Montserrat', 'Parish', NULL);
INSERT INTO @countries VALUES (	'Morocco', 'Region', 'Prefecture');
INSERT INTO @countries VALUES (	'Mozambique', 'Province', 'District');
INSERT INTO @countries VALUES (	'Myanmar', 'Region', 'District');
INSERT INTO @countries VALUES (	'Namibia', 'Region', 'Constituency');
INSERT INTO @countries VALUES (	'Nauru', 'District', NULL);
INSERT INTO @countries VALUES (	'Nepal', 'Region', 'District');
INSERT INTO @countries VALUES (	'Netherlands', 'Province', 'Municipality');
INSERT INTO @countries VALUES (	'New Caledonia', 'Province', 'Commune');
INSERT INTO @countries VALUES (	'New Zealand', 'Region', 'District');
INSERT INTO @countries VALUES (	'Nicaragua', 'Department', 'Municipality');
INSERT INTO @countries VALUES (	'Niger', 'Region', 'Department');
INSERT INTO @countries VALUES (	'Nigeria', 'State', 'Local government areas');
INSERT INTO @countries VALUES (	'Niue', 'Village', NULL);
INSERT INTO @countries VALUES (	'Norfolk Island', NULL, NULL);
INSERT INTO @countries VALUES (	'North Korea', 'Province', 'County');
INSERT INTO @countries VALUES (	'Northern Mariana Islands', 'Municipality', NULL);
INSERT INTO @countries VALUES (	'Norway', 'County', 'Municipality');
INSERT INTO @countries VALUES (	'Oman', 'Governorate', 'District');
INSERT INTO @countries VALUES (	'Pakistan', 'Province', 'Division');
INSERT INTO @countries VALUES (	'Palau', 'State', NULL);
INSERT INTO @countries VALUES (	'Palestinian Territories', 'District', 'Governorate');
INSERT INTO @countries VALUES (	'Panama', 'Province', 'District');
INSERT INTO @countries VALUES (	'Papua New Guinea', 'Province', 'District');
INSERT INTO @countries VALUES (	'Paraguay', 'Department', 'District');
INSERT INTO @countries VALUES (	'Peru', 'Region', 'Province');
INSERT INTO @countries VALUES (	'Philippines', 'Province', 'Municipality');
INSERT INTO @countries VALUES (	'Pitcairn', NULL, NULL);
INSERT INTO @countries VALUES (	'Poland', 'Province', 'County');
INSERT INTO @countries VALUES (	'Portugal', 'District', 'Municipality');
INSERT INTO @countries VALUES (	'Puerto Rico', 'Municipality', 'Barrio');
INSERT INTO @countries VALUES (	'Qatar', 'Municipality', NULL);
INSERT INTO @countries VALUES (	'Reunion', 'Arrondissement', 'Commune');
INSERT INTO @countries VALUES (	'Romania', 'County', 'Commune');
INSERT INTO @countries VALUES (	'Rwanda', 'Province', 'District');
INSERT INTO @countries VALUES (	'Saint Barthelemy', NULL, NULL);
INSERT INTO @countries VALUES (	'Saint Helena', 'Dependency', NULL);
INSERT INTO @countries VALUES (	'Saint Kitts and Nevis', 'Parish', NULL);
INSERT INTO @countries VALUES (	'Saint Lucia', 'District', NULL);
INSERT INTO @countries VALUES (	'Saint Martin', NULL, NULL);
INSERT INTO @countries VALUES (	'Saint Pierre and Miquelon', 'Commune', NULL);
INSERT INTO @countries VALUES (	'Saint Vincent and the Grenadines', 'Parish', NULL);
INSERT INTO @countries VALUES (	'Samoa', 'District', NULL);
INSERT INTO @countries VALUES (	'San Marino', 'Municipality', NULL);
INSERT INTO @countries VALUES (	'Sao Tome and Principe', 'Region', 'District');
INSERT INTO @countries VALUES (	'Saudi Arabia', 'Region', 'Governorate');
INSERT INTO @countries VALUES (	'Senegal', 'Region', 'Department');
INSERT INTO @countries VALUES (	'Serbia', 'District', 'Municipality');
INSERT INTO @countries VALUES (	'Seychelles', 'District', 'Subdistrict');
INSERT INTO @countries VALUES (	'Sierra Leone', 'Province', 'District');
INSERT INTO @countries VALUES (	'Singapore', NULL, NULL);
INSERT INTO @countries VALUES (	'Sint Maarten', NULL, NULL);
INSERT INTO @countries VALUES (	'Slovak Republic', 'Region', 'District');
INSERT INTO @countries VALUES (	'Slovenia', 'Region', 'Commune');
INSERT INTO @countries VALUES (	'Solomon Islands', 'Province', 'Ward');
INSERT INTO @countries VALUES (	'Somalia', 'Region', 'District');
INSERT INTO @countries VALUES (	'South Africa', 'Province', 'Municipality');
INSERT INTO @countries VALUES (	'South Georgia and South Sandwich Islands', NULL, NULL);
INSERT INTO @countries VALUES (	'South Korea', 'Province', 'County');
INSERT INTO @countries VALUES (	'South Sudan', 'State', 'County');
INSERT INTO @countries VALUES (	'Spain', 'Province', 'Municipality');
INSERT INTO @countries VALUES (	'Sri Lanka', 'District', 'Division');
INSERT INTO @countries VALUES (	'Sudan', 'State', 'District');
INSERT INTO @countries VALUES (	'Suriname', 'District', 'Ressort');
INSERT INTO @countries VALUES (	'Svalbard and Jan Mayen Islands', 'Territory', 'Authority');
INSERT INTO @countries VALUES (	'Swaziland', 'Region', 'Constituency');
INSERT INTO @countries VALUES (	'Sweden', 'County', 'Municipality');
INSERT INTO @countries VALUES (	'Switzerland', 'Canton', 'District');
INSERT INTO @countries VALUES (	'Syrian Arab Republic', 'Province', 'District');
INSERT INTO @countries VALUES (	'Taiwan', 'Province', 'County');
INSERT INTO @countries VALUES (	'Tajikistan', 'Region', 'Raion');
INSERT INTO @countries VALUES (	'Tanzania', 'Region', 'District');
INSERT INTO @countries VALUES (	'Thailand', 'Province', 'District');
INSERT INTO @countries VALUES (	'Timor-Leste', 'District', 'Subdistrict');
INSERT INTO @countries VALUES (	'Togo', 'Region', 'Prefecture');
INSERT INTO @countries VALUES (	'Tokelau', 'Atoll', NULL);
INSERT INTO @countries VALUES (	'Tonga', 'Island group', 'District');
INSERT INTO @countries VALUES (	'Trinidad and Tobago', 'County', NULL);
INSERT INTO @countries VALUES (	'Tunisia', 'Governorate', 'Delegation');
INSERT INTO @countries VALUES (	'Turkey', 'Province', 'District');
INSERT INTO @countries VALUES (	'Turkmenistan', 'Province', 'District');
INSERT INTO @countries VALUES (	'Turks and Caicos Islands', NULL, NULL);
INSERT INTO @countries VALUES (	'Tuvalu', 'Island council', NULL);
INSERT INTO @countries VALUES (	'Uganda', 'District', 'County');
INSERT INTO @countries VALUES (	'Ukraine', 'Region', 'Raion');
INSERT INTO @countries VALUES (	'United Arab Emirates', 'Emirate', NULL);
INSERT INTO @countries VALUES (	'United Kingdom', 'County', 'District');
INSERT INTO @countries VALUES (	'United States Minor Outlying Islands', 'Territory', NULL);
INSERT INTO @countries VALUES (	'United States of America', 'State', 'County');
INSERT INTO @countries VALUES (	'Uruguay', 'Department', NULL);
INSERT INTO @countries VALUES (	'Uzbekistan', 'Region', 'District');
INSERT INTO @countries VALUES (	'Vanuatu', 'Province', 'Council');
INSERT INTO @countries VALUES (	'Vatican City', NULL, NULL);
INSERT INTO @countries VALUES (	'Venezuela', 'State', 'Municipality');
INSERT INTO @countries VALUES (	'Vietnam', 'Province', 'District');
INSERT INTO @countries VALUES (	'Virgin Islands, British', NULL, NULL);
INSERT INTO @countries VALUES (	'Virgin Islands, U.S.', 'District', 'Subdistrict');
INSERT INTO @countries VALUES (	'Wallis and Futuna', 'Kingdom', 'District');
INSERT INTO @countries VALUES (	'Western Sahara', 'Province', NULL);
INSERT INTO @countries VALUES (	'Yemen', 'Governorate', 'District');
INSERT INTO @countries VALUES (	'Zambia', 'Province', 'District');
INSERT INTO @countries VALUES (	'Zimbabwe', 'Province', 'District');

-- ======================================================================
-- Country Name changes
-- ======================================================================

UPDATE	countries
	SET	country_nm	=	'Antigua and Barbuda'
WHERE	country_nm	=	'Antigua';

UPDATE	countries
	SET	country_nm	=	'Cocos (Keeling) Islands'
WHERE	country_nm	=	'Cocos Islands';

UPDATE	countries
	SET	country_nm	=	'Congo-Brazzaville'
WHERE	country_nm	=	'Congo';

UPDATE	countries
	SET	country_nm	=	'Congo-kinshasa'
WHERE	country_nm	=	'DR Congo';

UPDATE	countries
	SET	country_nm	=	'French Southern Lands'
WHERE	country_nm	=	'French Southern Territories';

UPDATE	countries
	SET	country_nm	=	'Heard and Mcdonald Islands'
WHERE	country_nm	=	'Heard Island And Mcdonald Islands';

UPDATE	countries
	SET	country_nm	=	'Macau'
WHERE	country_nm	=	'Macao';

UPDATE	countries
	SET	country_nm	=	'Palestinian Territories'
WHERE	country_nm	=	'Palestinian Territory';

UPDATE	countries
	SET	country_nm	=	'Saint Martin'
WHERE	country_nm	=	'St. Martin F.W.I';

UPDATE	countries
	SET	country_nm	=	'South Georgia and South Sandwich Islands'
WHERE	country_nm	=	'South Georgia';

UPDATE	countries
	SET	country_nm	=	'Saint Pierre and Miquelon'
WHERE	country_nm	=	'St. Pierre & Miquelon';

UPDATE	countries
	SET	country_nm	=	'Saint Vincent and the Grenadines'
WHERE	country_nm	=	'St. Vincent & Grenadines';

UPDATE	countries
	SET	country_nm	=	'Svalbard and Jan Mayen Islands'
WHERE	country_nm	=	'Svalbard and Jan Mayen';

UPDATE	countries
	SET	country_nm	=	'United States of America'
WHERE	country_nm	=	'United States';

UPDATE	countries
	SET	country_nm	=	'Vatican City'
WHERE	country_nm	=	'Vatican';

-- ======================================================================
-- Country's Code changes
-- ======================================================================

UPDATE	countries
	SET	country_cd	=	'S'
WHERE	country_nm	=	'Slovenia';

UPDATE	countries
	SET	country_cd	=	'SI'
WHERE	country_nm	=	'Solomon Islands';


-- ======================================================================
-- Country's Effective Date changes
-- ======================================================================

UPDATE	countries
	SET	effective_till	=	'1-Jun-2014'
WHERE	country_nm	LIKE	'Korea%';

UPDATE	countries
	SET	effective_till	=	'31-Dec-9999'
WHERE	country_nm	=	'South Korea';

UPDATE	countries
	SET	effective_till	=	'1-Jun-2014'
WHERE	country_nm	IN	(	'Caribbean', 'St. Lucia', 'St. Maarten', 'Taiwan, Province of China', 'U.S.A.', 'Yugoslavia'	);

-- ======================================================================
-- Now set the Level 1 and 2 Address Components
-- ======================================================================

UPDATE	t
	SET	level_1_address_component	=	level_1,
		level_2_address_component	=	level_2
FROM	countries	t
	JOIN	@countries	x
		ON	(	x.country_nm	=	t.country_nm	);

-- ======================================================================
-- Insert the countries that do not exist
-- ======================================================================
INSERT	INTO	countries
		(	country_nm, country_cd, level_1_address_component, level_2_address_component	)
	SELECT	t.country_nm,
			CASE
				WHEN t.country_nm LIKE 'Bonaire%' THEN 'BSES'
				WHEN t.country_nm LIKE 'Isle of%' THEN 'IM'
				WHEN t.country_nm LIKE 'Sint Ma%' THEN 'SiM'
				ELSE SUBSTRING (t.country_nm, 1, 1) + CASE WHEN CHARINDEX (' ', t.country_nm) > 0 THEN SUBSTRING (t.country_nm, CHARINDEX (' ', t.country_nm) + 1, 1) ELSE '' END
			END,
			level_1, level_2
	FROM	@countries	t
	WHERE	NOT EXISTS	(	SELECT	1
							FROM	countries	c
							WHERE	c.country_nm	=	t.country_nm
						);

-- ======================================================================
-- Mark the countries authentic which are effective
-- ======================================================================

UPDATE	countries
	SET	is_authentic	=	0;

UPDATE	countries
	SET	is_authentic	=	1
WHERE	GetDate() BETWEEN effective_from AND effective_till
AND		country_nm	!=	'Unavailable';

-- ======================================================================

