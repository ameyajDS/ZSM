/* ==================================================================================
    Source File		:	setup_usa_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	Sun Aug 31 15:37 2014
	Module ID		:	CDB
	Last updated	:	Aug 31, 2014
	==================================================================================
																		   Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of USA are set-up
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
	@country_id		INT;

-- ======================================================================
SELECT	@country_id	=	country_id
FROM	countries
WHERE	country_nm	=	'United States of America';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country USA not found', 16, 1);
	RETURN;
END

-- ======================================================================

INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) VALUES ( @country_id,	'Alabama',				'AL'	)
INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) VALUES ( @country_id,	'Alaska',				'AK'	)
INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) VALUES ( @country_id,	'Arizona',				'AZ'	)
INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) VALUES ( @country_id,	'Arkansas',				'AR'	)
INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) VALUES ( @country_id,	'California',			'CA'	)
INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) VALUES ( @country_id,	'Colorado',				'CO'	)
INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) VALUES ( @country_id,	'Connecticut',			'CT'	)
INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) VALUES ( @country_id,	'Delaware',				'DE'	)
INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) VALUES ( @country_id,	'District of Columbia',	'DC'	)
INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) VALUES ( @country_id,	'Florida',				'FL'	)
INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) VALUES ( @country_id,	'Georgia',				'GA'	)
INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) VALUES ( @country_id,	'Hawaii',				'HI'	)
INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) VALUES ( @country_id,	'Idaho',				'ID'	)
INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) VALUES ( @country_id,	'Illinois',				'IL'	)
INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) VALUES ( @country_id,	'Indiana',				'IN'	)
INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) VALUES ( @country_id,	'Iowa',					'IA'	)
INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) VALUES ( @country_id,	'Kansas',				'KS'	)
INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) VALUES ( @country_id,	'Kentucky',				'KY'	)
INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) VALUES ( @country_id,	'Louisiana',			'LA'	)
INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) VALUES ( @country_id,	'Maine',				'ME'	)
INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) VALUES ( @country_id,	'Maryland',				'MD'	)
INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) VALUES ( @country_id,	'Massachusetts',		'MA'	)
INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) VALUES ( @country_id,	'Michigan',				'MI'	)
INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) VALUES ( @country_id,	'Minnesota',			'MN'	)
INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) VALUES ( @country_id,	'Mississippi',			'MS'	)
INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) VALUES ( @country_id,	'Missouri',				'MO'	)
INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) VALUES ( @country_id,	'Montana',				'MT'	)
INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) VALUES ( @country_id,	'Nebraska',				'NE'	)
INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) VALUES ( @country_id,	'Nevada',				'NV'	)
INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) VALUES ( @country_id,	'New Hampshire',		'NH'	)
INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) VALUES ( @country_id,	'New Jersey',			'NJ'	)
INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) VALUES ( @country_id,	'New Mexico',			'NM'	)
INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) VALUES ( @country_id,	'New York',				'NY'	)
INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) VALUES ( @country_id,	'North Carolina',		'NC'	)
INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) VALUES ( @country_id,	'North Dakota',			'ND'	)
INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) VALUES ( @country_id,	'Ohio',					'OH'	)
INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) VALUES ( @country_id,	'Oklahoma',				'OK'	)
INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) VALUES ( @country_id,	'Oregon',				'OR'	)
INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) VALUES ( @country_id,	'Pennsylvania',			'PA'	)
INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) VALUES ( @country_id,	'Rhode Island',			'RI'	)
INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) VALUES ( @country_id,	'South Carolina',		'SC'	)
INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) VALUES ( @country_id,	'South Dakota',			'SD'	)
INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) VALUES ( @country_id,	'Tennessee',			'TN'	)
INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) VALUES ( @country_id,	'Texas',				'TX'	)
INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) VALUES ( @country_id,	'Utah',					'UT'	)
INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) VALUES ( @country_id,	'Vermont',				'VT'	)
INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) VALUES ( @country_id,	'Virginia',				'VA'	)
INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) VALUES ( @country_id,	'Washington',			'WA'	)
INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) VALUES ( @country_id,	'West Virginia',		'WV'	)
INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) VALUES ( @country_id,	'Wisconsin',			'WI'	)
INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) VALUES ( @country_id,	'Wyoming',				'WY'	)
-- ======================================================================

INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Aleutians East', 'AE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alaska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Anchorage', 'AN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alaska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Aleutians West', 'AW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alaska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bethel', 'BE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alaska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bristol Bay', 'BR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alaska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Denali', 'DE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alaska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Dillingham', 'DI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alaska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Fairbanks North Star', 'FA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alaska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Haines', 'HA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alaska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hoonah-Angoon', 'HH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alaska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Juneau', 'JU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alaska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ketchikan Gateway', 'KG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alaska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Kenai Peninsula', 'KN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alaska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Kodiak Island', 'KO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alaska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lake and Peninsula', 'LA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alaska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Matanuska-Susitna', 'MA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alaska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'North Slope', 'NH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alaska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Nome', 'NM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alaska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Northwest Arctic', 'NW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alaska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Petersburg', 'PB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alaska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Prince of Wales-Hyder', 'PH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alaska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sitka', 'SI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alaska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Southeast Fairbanks', 'SO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alaska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Skagway', 'SW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alaska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Valdez-Cordova', 'VA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alaska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wade Hampton', 'WA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alaska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wrangell', 'WG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alaska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Yakutat', 'YA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alaska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Yukon-Koyukuk', 'YU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alaska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Autauga', 'AU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Baldwin', 'BD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bibb', 'BI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bullock', 'BL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Barbour', 'BR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Butler', 'BT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Blount', 'BU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Crenshaw', 'CA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cleburne', 'CB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Choctaw', 'CC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Coffee', 'CF', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cherokee', 'CH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Chilton', 'CI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clarke', 'CK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Colbert', 'CL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Chambers', 'CM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Calhoun', 'CN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Conecuh', 'CO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Coosa', 'CS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cullman', 'CU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Covington', 'CV', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clay', 'CY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'DeKalb', 'DA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Dale', 'DE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Dallas', 'DL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Elmore', 'EL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Escambia', 'ES', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Etowah', 'ET', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Fayette', 'FA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Franklin', 'FR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Geneva', 'GE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Greene', 'GR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hale', 'HA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Henry', 'HE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Houston', 'HO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jackson', 'JA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jefferson', 'JE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lee', 'LE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Limestone', 'LI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lamar', 'LM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lowndes', 'LO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lauderdale', 'LU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lawrence', 'LW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Mobile', 'MB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Macon', 'MC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Madison', 'MD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Marengo', 'ME', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Morgan', 'MG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Marion', 'MI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Monroe', 'MR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Marshall', 'MS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Montgomery', 'MT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pickens', 'PC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Perry', 'PE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pike', 'PK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Randolph', 'RA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Russell', 'RU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Saint Clair', 'SA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Shelby', 'SH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sumter', 'SU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Talladega', 'TD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Tallapoosa', 'TP', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Tuscaloosa', 'TU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wilcox', 'WC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Walker', 'WK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Winston', 'WN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Washington', 'WS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Alabama'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Arkansas', 'AR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ashley', 'AS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Baxter', 'BA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Benton', 'BE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Boone', 'BO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bradley', 'BR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Calhoun', 'CA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cleburne', 'CB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Crittenden', 'CD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Craighead', 'CG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Columbia', 'CI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clark', 'CK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Carroll', 'CL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Conway', 'CN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cross', 'CO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Chicot', 'CT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cleveland', 'CV', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Crawford', 'CW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clay', 'CY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Dallas', 'DA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Desha', 'DE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Drew', 'DR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Faulkner', 'FA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Franklin', 'FR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Fulton', 'FU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Greene', 'GE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Garland', 'GL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Grant', 'GN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hempstead', 'HE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hot Spring', 'HT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Howard', 'HW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Independence', 'IN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Izard', 'IZ', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jackson', 'JA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jefferson', 'JE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Johnson', 'JO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lincoln', 'LC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lee', 'LE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lafayette', 'LF', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Logan', 'LG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lonoke', 'LO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Little River', 'LT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lawrence', 'LW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Madison', 'MD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Monroe', 'ME', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Miller', 'ML', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Marion', 'MN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Mississippi', 'MS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Montgomery', 'MT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Nevada', 'NV', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Newton', 'NW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ouachita', 'OU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pike', 'PE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Phillips', 'PH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Polk', 'PL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Poinsett', 'PN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pope', 'PP', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Prairie', 'PR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pulaski', 'PU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Perry', 'PY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Randolph', 'RA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Searcy', 'SA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sebastian', 'SB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Scott', 'SC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sharp', 'SH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Saint Francis', 'SI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Saline', 'SL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Stone', 'ST', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sevier', 'SV', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Union', 'UN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Van Buren', 'VA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Washington', 'WA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'White', 'WH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Woodruff', 'WO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Yell', 'YE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arkansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Apache', 'AP', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arizona'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cochise', 'CH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arizona'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Coconino', 'CO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arizona'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Graham', 'GA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arizona'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Greenlee', 'GE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arizona'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Gila', 'GI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arizona'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'La Paz', 'LA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arizona'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Maricopa', 'MA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arizona'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Mohave', 'MO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arizona'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Navajo', 'NA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arizona'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pima', 'PM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arizona'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pinal', 'PN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arizona'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Santa Cruz', 'SA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arizona'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Yavapai', 'YA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arizona'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Yuma', 'YU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Arizona'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Alameda', 'AA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Amador', 'AM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Alpine', 'AP', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Butte', 'BU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Calaveras', 'CA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Colusa', 'CL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Contra Costa', 'CN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Del Norte', 'DE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'El Dorado', 'EL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Fresno', 'FR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Glenn', 'GL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Humboldt', 'HU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Imperial', 'IM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Inyo', 'IN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Kern', 'KE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Kings', 'KI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lake', 'LK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Los Angeles', 'LO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lassen', 'LS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Modoc', 'MC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Merced', 'MD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Madera', 'ME', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Mendocino', 'MI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Marin', 'MN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Mono', 'MO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Mariposa', 'MP', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Monterey', 'MT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Napa', 'NA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Nevada', 'NE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Orange', 'OR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Placer', 'PA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Plumas', 'PU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Riverside', 'RI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'San Bernardino', 'SA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Santa Barbara', 'SB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sacramento', 'SC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'San Diego', 'SD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sierra', 'SE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'San Francisco', 'SF', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Shasta', 'SH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'San Benito', 'SI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'San Joaquin', 'SJ', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Siskiyou', 'SK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Santa Clara', 'SL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'San Mateo', 'SM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Solano', 'SN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sonoma', 'SO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'San Luis Obispo', 'SS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Stanislaus', 'ST', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sutter', 'SU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Santa Cruz', 'SZ', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Tehama', 'TE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Tulare', 'TL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Tuolumne', 'TO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Trinity', 'TR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ventura', 'VE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Yolo', 'YO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Yuba', 'YU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'California'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Arapahoe', 'AA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Archuleta', 'AC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Adams', 'AD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Alamosa', 'AL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Baca', 'BA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bent', 'BE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Boulder', 'BO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bromfield', 'BR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Chaffee', 'CA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cheyenne', 'CE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clear Creek', 'CL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Conejos', 'CN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Crowley', 'CR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Costilla', 'CS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Custer', 'CU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Denver', 'DN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Dolores', 'DO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Delta', 'DT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Douglas', 'DU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Eagle', 'EA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Elbert', 'EB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'El Paso', 'EL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Fremont', 'FR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Garfield', 'GA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Gilpin', 'GI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Grand', 'GR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Gunnison', 'GU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hinsdale', 'HI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Huerfano', 'HU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jackson', 'JA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jefferson', 'JE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Kiowa', 'KO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Kit Carson', 'KT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'La Plata', 'LA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lincoln', 'LI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lake', 'LK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Logan', 'LO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Larimer', 'LR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Las Animas', 'LS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Mesa', 'ME', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Moffat', 'MF', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Mineral', 'MI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Morgan', 'MN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Montrose', 'MO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Montezuma', 'MZ', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Otero', 'OT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ouray', 'OU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Park', 'PA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Phillips', 'PH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pitkin', 'PI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Prowers', 'PR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pueblo', 'PU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Rio Blanco', 'RB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Rio Grande', 'RG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Routt', 'RT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sedgwick', 'SE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Saguache', 'SG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'San Juan', 'SJ', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'San Miguel', 'SM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Summit', 'SU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Teller', 'TE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Washington', 'WA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Weld', 'WE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Yuma', 'YU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Colorado'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Fairfield', 'FA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Connecticut'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hartford', 'HA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Connecticut'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Litchfield', 'LI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Connecticut'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Middlesex', 'MI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Connecticut'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'New Haven', 'NH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Connecticut'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'New London', 'NL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Connecticut'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Tolland', 'TO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Connecticut'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Windham', 'WI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Connecticut'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'District of Columbia', 'DI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'District of Columbia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Kent', 'KE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Delaware'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'New Castle', 'NE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Delaware'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sussex', 'SU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Delaware'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Alachua', 'AL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bradford', 'BA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Brevard', 'BE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Baker', 'BK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Broward', 'BO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bay', 'BY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Calhoun', 'CA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Charlotte', 'CH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Citrus', 'CI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Collier', 'CL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Columbia', 'CU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clay', 'CY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Miami-Dade', 'DA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'DeSoto', 'DE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Dixie', 'DI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Duval', 'DU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Escambia', 'ES', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Flagler', 'FL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Franklin', 'FR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Gadsden', 'GA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Gilchrist', 'GI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Glades', 'GL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Gulf', 'GU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hernando', 'HA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hardee', 'HD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Highlands', 'HG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hillsborough', 'HL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hamilton', 'HM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Holmes', 'HO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hendry', 'HR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Indian River', 'IN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jackson', 'JA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jefferson', 'JE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lee', 'LE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lafayette', 'LF', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Liberty', 'LI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lake', 'LK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Leon', 'LO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Levy', 'LV', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Madison', 'MD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Marion', 'MI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Manatee', 'MN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Monroe', 'MO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Martin', 'MT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Nassau', 'NA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Okaloosa', 'OA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Okeechobee', 'OE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Orange', 'OR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Osceola', 'OS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pinellas', 'PI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Palm Beach', 'PL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Polk', 'PO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pasco', 'PS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Putnam', 'PU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Santa Rosa', 'SA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Seminole', 'SE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Saint Johns', 'SJ', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Saint Lucie', 'SL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sumter', 'SM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sarasota', 'SR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Suwannee', 'SW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Taylor', 'TA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Union', 'UN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Volusia', 'VO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wakulla', 'WK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Walton', 'WL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Washington', 'WS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Florida'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Appling', 'AP', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Atkinson', 'AT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Brantley', 'BA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bacon', 'BC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Baldwin', 'BD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Burke', 'BE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bulloch', 'BH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bibb', 'BI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bleckley', 'BK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ben Hill', 'BL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Berrien', 'BN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Brooks', 'BO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Baker', 'BR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Banks', 'BS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bartow', 'BT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Butts', 'BU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Barrow', 'BW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bryan', 'BY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Coweta', 'CA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cobb', 'CB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clinch', 'CC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Camden', 'CD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cherokee', 'CE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Coffee', 'CF', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Chattooga', 'CG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Chattahoochee', 'CH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Columbia', 'CI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clarke', 'CK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Carroll', 'CL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Chatham', 'CM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clayton', 'CN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cook', 'CO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Crisp', 'CP', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Colquitt', 'CQ', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Candler', 'CR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Catoosa', 'CS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Charlton', 'CT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Calhoun', 'CU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Crawford', 'CW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clay', 'CY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'DeKalb', 'DA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Decatur', 'DC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Dade', 'DD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Dodge', 'DG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Dougherty', 'DH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Douglas', 'DL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Dooly', 'DO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Dawson', 'DW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Early', 'EA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Echols', 'EC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Effingham', 'EF', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Elbert', 'EL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Emanuel', 'EM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Evans', 'EV', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Floyd', 'FL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Fannin', 'FN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Forsyth', 'FO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Franklin', 'FR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Fulton', 'FU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Fayette', 'FY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Grady', 'GD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Greene', 'GE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Gilmer', 'GI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Gordon', 'GO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Glascock', 'GS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Gwinnett', 'GW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Glynn', 'GY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Habersham', 'HB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hancock', 'HC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Heard', 'HD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Harris', 'HI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hall', 'HL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Houston', 'HO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Haralson', 'HS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hart', 'HT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Henry', 'HY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Irwin', 'IR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jackson', 'JC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jones', 'JE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jeff Davis', 'JF', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Johnson', 'JH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jenkins', 'JK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jefferson', 'JR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jasper', 'JS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Liberty', 'LB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lincoln', 'LC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lee', 'LE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Long', 'LG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lanier', 'LI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lamar', 'LM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lumpkin', 'LP', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Laurens', 'LR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lowndes', 'LW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Murray', 'MA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Macon', 'MC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Madison', 'MD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Muscogee', 'MG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'McIntosh', 'MH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Miller', 'ML', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Montgomery', 'MM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Monroe', 'MN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Morgan', 'MO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Marion', 'MR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Mitchell', 'MT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'McDuffie', 'MU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Meriwether', 'MW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Newton', 'NE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Oconee', 'OC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Oglethorpe', 'OG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Paulding', 'PA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pickens', 'PE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Peach', 'PH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pike', 'PK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pulaski', 'PL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Polk', 'PO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pierce', 'PR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Putnam', 'PT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Quitman', 'QU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Rabun', 'RB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Richmond', 'RI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Randolph', 'RN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Rockdale', 'RO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Spalding', 'SD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Stephens', 'SE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Seminole', 'SI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Screven', 'SR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sumter', 'SU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Stewart', 'SW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Schley', 'SY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Taliaferro', 'TA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Talbot', 'TB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Treutlen', 'TE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Telfair', 'TF', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Twiggs', 'TG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Thomas', 'TH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Tift', 'TI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Terrell', 'TL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Tombs', 'TM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Troup', 'TP', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Turner', 'TR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Tattnall', 'TT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Towns', 'TW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Taylor', 'TY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Union', 'UN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Upson', 'UP', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Walton', 'WA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wilcox', 'WC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ware', 'WE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Whitfield', 'WF', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Washington', 'WG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'White', 'WH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wilkinson', 'WI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Walker', 'WK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wheeler', 'WL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Worth', 'WO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Warren', 'WR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wilkes', 'WS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Webster', 'WT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wayne', 'WY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Georgia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hawaii', 'HA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Hawaii'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Honolulu', 'HO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Hawaii'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Kalawao', 'KL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Hawaii'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Kauai', 'KU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Hawaii'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Maui', 'MA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Hawaii'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Adair', 'AI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Allamakee', 'AL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Adams', 'AM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Appanoose', 'AP', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Audubon', 'AU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Buchanan', 'BC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Butler', 'BE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Black Hawk', 'BL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Benton', 'BN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Boone', 'BO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bremer', 'BR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Buena Vista', 'BV', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Chickasaw', 'CC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cedar', 'CD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cherokee', 'CE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cerro Gordo', 'CG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clarke', 'CK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Carroll', 'CL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clinton', 'CN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Calhoun', 'CO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cass', 'CS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clayton', 'CT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Crawford', 'CW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clay', 'CY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Delaware', 'DA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Decatur', 'DC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Dickinson', 'DI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Dallas', 'DL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Des Moines', 'DS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Dubuque', 'DU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Davis', 'DV', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Emmet', 'EM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Floyd', 'FL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Franklin', 'FN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Fremont', 'FO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Fayette', 'FT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Greene', 'GE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Guthrie', 'GH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Grundy', 'GN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hardin', 'HD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Henry', 'HE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hamilton', 'HM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hancock', 'HN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Howard', 'HO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Harrison', 'HR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Humboldt', 'HU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ida', 'ID', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Iowa', 'IO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jackson', 'JC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jefferson', 'JE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Johnson', 'JH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jones', 'JN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jasper', 'JS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Keokuk', 'KE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Kossuth', 'KO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lee', 'LE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Linn', 'LI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Louisa', 'LO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lucas', 'LU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lyon', 'LY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Madison', 'MD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Mitchell', 'ME', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Montgomery', 'MG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Marion', 'MI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Mahaska', 'MK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Mills', 'ML', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Monona', 'MO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Monroe', 'MR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Marshall', 'MS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Muscatine', 'MU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'O''Brien', 'OB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Osceola', 'OS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pocahontas', 'PC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Page', 'PG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Polk', 'PK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Plymouth', 'PM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Palo Alto', 'PO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pottawattamie', 'PT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Poweshiek', 'PW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ringgold', 'RI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sac', 'SA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Scott', 'SC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Shelby', 'SH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sioux', 'SI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Story', 'ST', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Tama', 'TM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Taylor', 'TY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Union', 'UN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Van Buren', 'VA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Winnebago', 'WB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Webster', 'WE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wright', 'WG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Winneshiek', 'WH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Woodbury', 'WO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wapello', 'WP', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Warren', 'WR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Washington', 'WS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Worth', 'WT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wayne', 'WY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Iowa'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ada', 'AA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Idaho'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Adams', 'AM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Idaho'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Benewah', 'BA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Idaho'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Boundary', 'BD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Idaho'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bingham', 'BG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Idaho'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bear Lake', 'BK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Idaho'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Blaine', 'BL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Idaho'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bannock', 'BO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Idaho'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bonner', 'BR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Idaho'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Boise', 'BS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Idaho'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Butte', 'BT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Idaho'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bonneville', 'BV', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Idaho'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clark', 'CA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Idaho'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clearwater', 'CE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Idaho'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Camas', 'CM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Idaho'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Canyon', 'CN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Idaho'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Caribou', 'CR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Idaho'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cassia', 'CS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Idaho'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Custer', 'CU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Idaho'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Elmore', 'EL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Idaho'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Franklin', 'FA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Idaho'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Fremont', 'FE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Idaho'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Gem', 'GE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Idaho'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Gooding', 'GO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Idaho'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Idaho', 'ID', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Idaho'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jefferson', 'JF', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Idaho'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jerome', 'JR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Idaho'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Kootenai', 'KO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Idaho'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Latah', 'LA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Idaho'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lincoln', 'LI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Idaho'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lemhi', 'LM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Idaho'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lewis', 'LW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Idaho'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Madison', 'MA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Idaho'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Minidoka', 'MI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Idaho'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Nez Perce', 'NE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Idaho'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Oneida', 'ON', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Idaho'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Owyhee', 'OW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Idaho'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Payette', 'PA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Idaho'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Power', 'PO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Idaho'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Shoshone', 'SH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Idaho'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Teton', 'TE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Idaho'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Twin Falls', 'TW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Idaho'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Valley', 'VA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Idaho'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Washington', 'WA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Idaho'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Adams', 'AD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Alexander', 'AL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bond', 'BN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Boone', 'BO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Brown', 'BR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bureau', 'BU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Coles', 'CE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Calhoun', 'CH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Christian', 'CI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clark', 'CK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Carroll', 'CL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Champaign', 'CM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clinton', 'CN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cook', 'CO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cass', 'CS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cumberland', 'CU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Crawford', 'CW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clay', 'CY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'DeKalb', 'DK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Douglas', 'DO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'DuPage', 'DU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'DeWitt', 'DW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Effingham', 'EF', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Edgar', 'EG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Edwards', 'EW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Fayette', 'FA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ford', 'FO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Franklin', 'FR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Fulton', 'FU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Gallatin', 'GA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Greene', 'GE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Grundy', 'GU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hancock', 'HC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Henderson', 'HD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hardin', 'HI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hamilton', 'HM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Henry', 'HY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Iroquois', 'IR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jackson', 'JC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jefferson', 'JF', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Johnson', 'JH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jo Daviess', 'JO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jersey', 'JR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jasper', 'JS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Kendall', 'KA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Kane', 'KE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Kankakee', 'KK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Knox', 'KX', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'LaSalle', 'LA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lee', 'LE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Livingston', 'LI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lake', 'LK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Logan', 'LO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lawrence', 'LW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Massac', 'MA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Macon', 'MC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Madison', 'MD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Mercer', 'ME', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Morgan', 'MG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Marshall', 'MH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Moultrie', 'MI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'McLean', 'ML', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Menard', 'MN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Marion', 'MO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Macoupin', 'MP', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Monroe', 'MR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Mason', 'MS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Montgomery', 'MT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'McDonough', 'MU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'McHenry', 'MY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ogle', 'OG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Piatt', 'PA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pope', 'PE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Peoria', 'PI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pike', 'PK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pulaski', 'PL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Putnam', 'PT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Perry', 'PY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Randolph', 'RA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Richland', 'RI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Rock Island', 'RO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Stark', 'SA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Shelby', 'SB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Saline', 'SE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Saint Clair', 'SI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sangamon', 'SM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Stephenson', 'SN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Scott', 'SO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Schuyler', 'SU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Tazewell', 'TA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Union', 'UN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Vermilion', 'VE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wabash', 'WB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Whiteside', 'WD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'White', 'WE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Washington', 'WG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Will', 'WL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Winnebago', 'WN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Woodford', 'WO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Warren', 'WR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Williamson', 'WS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wayne', 'WY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Illinois'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Adams', 'AD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Allen', 'AL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bartholomew', 'BA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Benton', 'BE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Blackford', 'BL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Boone', 'BO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Brown', 'BR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clinton', 'CI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clark', 'CK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Carroll', 'CO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cass', 'CS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Crawford', 'CW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clay', 'CY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Decatur', 'DC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'DeKalb', 'DE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Daviess', 'DI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Delaware', 'DL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Dearborn', 'DR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Dubois', 'DU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Elkhart', 'EL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Fayette', 'FA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Floyd', 'FL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Fountain', 'FO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Franklin', 'FR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Fulton', 'FU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Grant', 'GA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Greene', 'GE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Gibson', 'GI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hancock', 'HC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hendricks', 'HD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Harrison', 'HI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hamilton', 'HM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Howard', 'HO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Huntington', 'HU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Henry', 'HY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jackson', 'JC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jefferson', 'JF', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jennings', 'JN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Johnson', 'JO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jasper', 'JS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jay', 'JY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Knox', 'KN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Kosciusko', 'KO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'LaPorte', 'LA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'LaGrange', 'LG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lake', 'LK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lawrence', 'LW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Madison', 'MD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Morgan', 'MG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Miami', 'MI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Montgomery', 'MM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Martin', 'MN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Marion', 'MO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Monroe', 'MR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Marshall', 'MS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Newton', 'NE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Noble', 'NO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ohio', 'OH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Orange', 'OR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Owen', 'OW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Parke', 'PA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Perry', 'PE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pike', 'PI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pulaski', 'PL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Porter', 'PR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Posey', 'PS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Putnam', 'PT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Randolph', 'RA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ripley', 'RI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Rush', 'RU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Scott', 'SC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Steuben', 'SE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Shelby', 'SH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Saint Joseph', 'SN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Spencer', 'SP', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Starke', 'SR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sullivan', 'SU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Switzerland', 'SW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Tippecanoe', 'TP', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Tipton', 'TT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Union', 'UN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Vanderburgh', 'VA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Vermillion', 'VE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Vigo', 'VI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wabash', 'WB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wells', 'WE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'White', 'WH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Warrick', 'WI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Whitley', 'WL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Warren', 'WN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Washington', 'WS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wayne', 'WY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Indiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Barber', 'AB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Allen', 'AL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Anderson', 'AN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Atchison', 'AT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bourbon', 'BB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Brown', 'BR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Barton', 'BT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Butler', 'BU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clark', 'CA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cloud', 'CD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Coffey', 'CF', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cherokee', 'CK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cowley', 'CL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Comanche', 'CM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cheyenne', 'CN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Chautauqua', 'CQ', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Crawford', 'CR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Chase', 'CS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clay', 'CY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Decatur', 'DC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Douglas', 'DG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Dickinson', 'DK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Doniphan', 'DP', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Edwards', 'ED', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Elk', 'EK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ellis', 'EL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ellsworth', 'EW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Finney', 'FI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ford', 'FO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Franklin', 'FR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Geary', 'GE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Graham', 'GH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Greeley', 'GL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Gove', 'GO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Grant', 'GT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Greenwood', 'GW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Gray', 'GY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hodgeman', 'HG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hamilton', 'HM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Harper', 'HP', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Haskell', 'HS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Harvey', 'HV', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jackson', 'JA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jefferson', 'JF', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Johnson', 'JO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jewell', 'JW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Kearny', 'KE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Kingman', 'KM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Kiowa', 'KW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Labette', 'LB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lincoln', 'LC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lane', 'LE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Logan', 'LG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Linn', 'LN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Leavenworth', 'LV', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lyon', 'LY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Mitchell', 'MC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Meade', 'ME', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Montgomery', 'MG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Miami', 'MI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Marion', 'MN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'McPherson', 'MP', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Morris', 'MR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Marshall', 'MS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Morton', 'MT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Nemaha', 'NM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Neosho', 'NO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ness', 'NS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Norton', 'NT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Osborne', 'OB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Osage', 'OS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ottawa', 'OT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Phillips', 'PL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pawnee', 'PN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pratt', 'PR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pottawatomie', 'PT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Rawlins', 'RA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Rice', 'RC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Rush', 'RH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Riley', 'RL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Reno', 'RN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Rooks', 'RO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Republic', 'RP', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Russell', 'RS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Saline', 'SA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Scott', 'SC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sheridan', 'SD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Stafford', 'SF', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sedgwick', 'SG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sherman', 'SH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Smith', 'SM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Shawnee', 'SN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Stanton', 'ST', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sumner', 'SU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Stevens', 'SV', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Seward', 'SW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Thomas', 'TH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Trego', 'TR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wallace', 'WA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wabaunsee', 'WB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wichita', 'WH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wilson', 'WL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Woodson', 'WO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Washington', 'WS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wyandotte', 'WY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kansas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Adair', 'AD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Allen', 'AL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Anderson', 'AN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ballard', 'BA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Breckinridge', 'BC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Boyd', 'BD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Boyle', 'BE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bath', 'BH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bullitt', 'BI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bracken', 'BK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bell', 'BL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Barren', 'BN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Boone', 'BO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Butler', 'BR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Breathitt', 'BT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bourbon', 'BU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Caldwell', 'CD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Carlisle', 'CE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Christian', 'CH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clark', 'CK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Carroll', 'CL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Campbell', 'CM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clinton', 'CO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Carter', 'CR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Casey', 'CS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Crittenden', 'CT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cumberland', 'CU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Calloway', 'CW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clay', 'CY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Daviess', 'DA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Edmonson', 'ED', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Elliott', 'EL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Estill', 'ES', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Fayette', 'FA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Fleming', 'FE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Floyd', 'FO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Franklin', 'FR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Fulton', 'FU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Gallatin', 'GL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Green', 'GN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Garrard', 'GR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Grant', 'GT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Greenup', 'GU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Graves', 'GV', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Grayson', 'GY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hickman', 'HA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hancock', 'HC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Henderson', 'HE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Harlan', 'HL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hardin', 'HN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hopkins', 'HO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Harrison', 'HS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hart', 'HT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Henry', 'HY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jackson', 'JA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jefferson', 'JF', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Johnson', 'JO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jessamine', 'JS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Kenton', 'KE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Knott', 'KT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Knox', 'KX', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lawrence', 'LC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lee', 'LE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lewis', 'LI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lincoln', 'LN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Logan', 'LO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Larue', 'LR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Leslie', 'LS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Letcher', 'LT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Laurel', 'LU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Livingston', 'LV', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lyon', 'LY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Meade', 'MA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Mercer', 'MC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Madison', 'MD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Menifee', 'ME', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Magoffin', 'MF', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Morgan', 'MG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Marshall', 'MH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Martin', 'MI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'McCracken', 'MK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'McLean', 'ML', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Montgomery', 'MM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Marion', 'MN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Monroe', 'MO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'McCreary', 'MR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Mason', 'MS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Metcalfe', 'MT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Muhlenberg', 'MU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Nelson', 'NE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Nicholas', 'NI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Owen', 'OE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ohio', 'OH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Oldham', 'OL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Owsley', 'OS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pike', 'PI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pendleton', 'PN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Powell', 'PO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Perry', 'PR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pulaski', 'PU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Robertson', 'RB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Rockcastle', 'RC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Russell', 'RU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Rowan', 'RW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Scott', 'SC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Shelby', 'SH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Simpson', 'SI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Spencer', 'SP', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Taylor', 'TA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Trigg', 'TG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Trimble', 'TM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Todd', 'TO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Union', 'UN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Webster', 'WE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Whitley', 'WH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wolfe', 'WL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Woodford', 'WO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Warren', 'WR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Washington', 'WS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wayne', 'WY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Kentucky'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Acadia', 'AD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ascension', 'AE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Allen', 'AL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Assumption', 'AS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Avoyelles', 'AV', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Beauregard', 'BE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bienville', 'BI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bossier', 'BO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Calcasieu', 'CC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Claiborne', 'CI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cameron', 'CM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Caddo', 'CO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Concordia', 'CR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Catahoula', 'CT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Caldwell', 'CW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'De Soto', 'DE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'East Baton Rouge', 'EB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'East Carroll', 'EC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'East Feliciana', 'EF', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Evangeline', 'EV', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Franklin', 'FR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Grant', 'GR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Iberia', 'II', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Iberville', 'IV', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jackson', 'JA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jefferson Davis', 'JD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jefferson', 'JF', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'La Salle', 'LA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lincoln', 'LN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lafourche', 'LO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Livingston', 'LV', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lafayette', 'LY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Madison', 'MA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Morehouse', 'MO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Natchitoches', 'NA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Orleans', 'OR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ouachita', 'OU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Plaquemines', 'PL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pointe Coupee', 'PO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Rapides', 'RA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Red River', 'RE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Richland', 'RI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sabine', 'SB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Saint Charles', 'SC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Saint Bernard', 'SE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Saint Helena', 'SH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Saint James', 'SJ', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Saint Landry', 'SL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Saint Mary', 'SM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Saint John the Baptist', 'SO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Saint Martin', 'SR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Saint Tammany', 'ST', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Tangipahoa', 'TA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Tensas', 'TN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Terrebonne', 'TR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Union', 'UN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Vermilion', 'VM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Vernon', 'VN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'West Baton Rouge', 'WB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'West Carroll', 'WC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'West Feliciana', 'WF', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Winn', 'WI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Washington', 'WO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Webster', 'WR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Louisiana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Barnstable', 'BA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Massachusetts'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Berkshire', 'BE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Massachusetts'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bristol', 'BR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Massachusetts'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Dukes', 'DU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Massachusetts'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Essex', 'ES', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Massachusetts'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Franklin', 'FR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Massachusetts'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hampden', 'HD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Massachusetts'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hampshire', 'HS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Massachusetts'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Middlesex', 'MI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Massachusetts'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Nantucket', 'NA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Massachusetts'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Norfolk', 'NO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Massachusetts'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Plymouth', 'PL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Massachusetts'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Suffolk', 'SU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Massachusetts'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Worcester', 'WO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Massachusetts'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Allegany', 'AL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Maryland'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Anne Arundel', 'AN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Maryland'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Baltimore City', 'BA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Maryland'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Baltimore', 'BC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Maryland'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cecil', 'CE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Maryland'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Charles', 'CH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Maryland'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Calvert', 'CL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Maryland'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Caroline', 'CO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Maryland'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Carroll', 'CR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Maryland'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Dorchester', 'DO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Maryland'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Frederick', 'FR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Maryland'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Garrett', 'GA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Maryland'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Harford', 'HA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Maryland'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Howard', 'HO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Maryland'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Kent', 'KE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Maryland'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Montgomery', 'MO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Maryland'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Prince George''s', 'PR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Maryland'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Queen Anne''s', 'QU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Maryland'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Saint Mary''s', 'SA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Maryland'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Somerset', 'SO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Maryland'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Talbot', 'TA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Maryland'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Washington', 'WA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Maryland'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wicomico', 'WI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Maryland'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Worcester', 'WO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Maryland'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Androscoggin', 'AN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Maine'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Aroostook', 'AR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Maine'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cumberland', 'CU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Maine'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Franklin', 'FR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Maine'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hancock', 'HA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Maine'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Kennebec', 'KE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Maine'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Knox', 'KN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Maine'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lincoln', 'LI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Maine'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Oxford', 'OX', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Maine'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Penobscot', 'PE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Maine'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Piscataquis', 'PI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Maine'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sagadahoc', 'SA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Maine'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Somerset', 'SO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Maine'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Waldo', 'WL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Maine'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Washington', 'WS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Maine'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'York', 'YO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Maine'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Alcona', 'AC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Alger', 'AG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Allegan', 'AL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Antrim', 'AN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Alpena', 'AP', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Arenac', 'AR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Baraga', 'BA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Branch', 'BC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Benzie', 'BE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Berrien', 'BN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Barry', 'BR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bay', 'BY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clare', 'CE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Crawford', 'CF', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clinton', 'CN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Chippewa', 'CP', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cass', 'CS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Calhoun', 'CU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Charlevoix', 'CV', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cheboygan', 'CY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Delta', 'DE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Dickinson', 'DI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Eaton', 'EA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Emmet', 'EM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Genesee', 'GE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Gladwin', 'GL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Grand Traverse', 'GN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Gogebic', 'GO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Gratiot', 'GT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hillsdale', 'HI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Houghton', 'HO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Huron', 'HU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Isabella', 'IB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Iosco', 'IC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ingham', 'IH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ionia', 'II', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Iron', 'IR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jackson', 'JA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Kalamazoo', 'KA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Kalkaska', 'KK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Kent', 'KN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Keweenaw', 'KW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Leelanau', 'LE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Livingston', 'LI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lake', 'LK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lenawee', 'LN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lapeer', 'LP', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Luce', 'LU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Macomb', 'MB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Montcalm', 'MC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Midland', 'MD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Manistee', 'ME', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Muskegon', 'MG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Mackinac', 'MK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Menominee', 'MM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Mason', 'MN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Monroe', 'MO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Marquette', 'MQ', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Montmorency', 'MR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Mecosta', 'MT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Missaukee', 'MU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Newaygo', 'NE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Oceana', 'OA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Oakland', 'OD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Osceola', 'OE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ogemaw', 'OG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ontonagon', 'ON', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Oscoda', 'OO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Otsego', 'OS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ottawa', 'OT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Presque Isle', 'PR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Roscommon', 'RO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Saint Clair', 'SA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Saginaw', 'SG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Shiawassee', 'SH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Saint Joseph', 'SJ', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sanilac', 'SL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Schoolcraft', 'SR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Tuscola', 'TU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Van Buren', 'VA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wexford', 'WE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Washtenaw', 'WS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wayne', 'WY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Michigan'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Aitkin', 'AI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Anoka', 'AN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Becker', 'BC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Blue Earth', 'BE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Big Stone', 'BI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Benton', 'BN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Brown', 'BR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Beltrami', 'BT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clay', 'CA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clearwater', 'CE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Chisago', 'CG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Carlton', 'CL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cook', 'CO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Chippewa', 'CP', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cass', 'CS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cottonwood', 'CT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Carver', 'CV', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Crow Wing', 'CW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Dakota', 'DA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Dodge', 'DD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Douglas', 'DU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Faribault', 'FA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Fillmore', 'FI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Freeborn', 'FR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Goodhue', 'GO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Grant', 'GR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hennepin', 'HE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Houston', 'HO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hubbard', 'HU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Isanti', 'IS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Itasca', 'IT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jackson', 'JA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Kanabec', 'KA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Kandiyohi', 'KD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Kittson', 'KI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Koochiching', 'KO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lac qui Parle', 'LC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lake', 'LE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lincoln', 'LI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lake of the Woods', 'LO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Le Sueur', 'LU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lyon', 'LY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'McLeod', 'MC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Meeker', 'ME', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Mahnomen', 'MH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Mille Lacs', 'MI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Morrison', 'MR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Marshall', 'MS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Martin', 'MT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Murray', 'MU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Mower', 'MW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Nobles', 'NB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Nicollet', 'NI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Norman', 'NR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Olmsted', 'OL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Otter Tail', 'OT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pope', 'PE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pennington', 'PI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Polk', 'PL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pine', 'PN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pipestone', 'PS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ramsey', 'RA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Rock', 'RC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Red Lake', 'RD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Rice', 'RI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Renville', 'RN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Roseau', 'RS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Redwood', 'RW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Scott', 'SC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Steele', 'SE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sherburne', 'SH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sibley', 'SI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Stearns', 'SR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Saint Louis', 'ST', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Stevens', 'SV', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Swift', 'SW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Todd', 'TO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Traverse', 'TR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wabasha', 'WB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wadena', 'WD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Waseca', 'WE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Washington', 'WH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wilkin', 'WL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Winona', 'WN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wright', 'WR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Watonwan', 'WT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Yellow Medicine', 'YE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Minnesota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Adair', 'AD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Andrew', 'AN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Atchison', 'AT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Audrain', 'AU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Buchanan', 'BC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Butler', 'BE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bollinger', 'BI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Benton', 'BN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Boone', 'BO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Barry', 'BR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bates', 'BS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Barton', 'BT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Callaway', 'CA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cedar', 'CD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cole', 'CE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Crawford', 'CF', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cape Girardeau', 'CG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Chariton', 'CI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clark', 'CK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Carroll', 'CL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Camden', 'CM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clinton', 'CO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cooper', 'CP', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Carter', 'CR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cass', 'CS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Christian', 'CT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Caldwell', 'CW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clay', 'CY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Dade', 'DD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'DeKalb', 'DE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Dallas', 'DL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Dent', 'DN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Douglas', 'DO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Dunklin', 'DU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Daviess', 'DV', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Franklin', 'FR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Gasconade', 'GA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Greene', 'GE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Gentry', 'GT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Grundy', 'GU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hickory', 'HC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Henry', 'HE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Holt', 'HL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Howard', 'HR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Harrison', 'HS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Howell', 'HW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Iron', 'IR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jackson', 'JC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jefferson', 'JE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Johnson', 'JO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jasper', 'JS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Knox', 'KN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Laclede', 'LD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lewis', 'LE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lafayette', 'LF', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Linn', 'LN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lincoln', 'LO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Livingston', 'LV', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lawrence', 'LW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'McDonald', 'MA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Mercer', 'MC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Madison', 'MD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Moniteau', 'ME', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Morgan', 'MG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Mississippi', 'MI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Miller', 'ML', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Montgomery', 'MM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Macon', 'MN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Marion', 'MO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Monroe', 'MR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Maries', 'MS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Nodaway', 'NO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Newton', 'NT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'New Madrid', 'NW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Oregon', 'OR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Osage', 'OS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ozark', 'OZ', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pulaski', 'PA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Phelps', 'PH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pike', 'PI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pemiscot', 'PM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Putnam', 'PN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Polk', 'PO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Perry', 'PR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pettis', 'PS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Platte', 'PT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Reynolds', 'RE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ripley', 'RI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ralls', 'RL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Randolph', 'RN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ray', 'RY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Saint Charles', 'SA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Shelby', 'SB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Saint Clair', 'SC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Stoddard', 'SD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Stone', 'SE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Saint Francois', 'SF', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sainte Genevieve', 'SG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Schuyler', 'SH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Saline', 'SI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Saint Louis', 'SL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Shannon', 'SN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Scotland', 'SO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Scott', 'ST', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sullivan', 'SV', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Saint Louis City', 'SY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Taney', 'TA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Texas', 'TE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Vernon', 'VE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Webster', 'WE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wright', 'WG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Worth', 'WO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Warren', 'WR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Washington', 'WS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wayne', 'WY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Missouri'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Adams', 'AD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Alcorn', 'AL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Amite', 'AM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Attala', 'AT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Benton', 'BE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bolivar', 'BO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Claiborne', 'CB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clarke', 'CE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Coahoma', 'CH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Carroll', 'CL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Calhoun', 'CN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Copiah', 'CP', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Chickasaw', 'CS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Covington', 'CV', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Choctaw', 'CW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clay', 'CY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'DeSoto', 'DE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Forrest', 'FO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Franklin', 'FR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Greene', 'GE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Grenada', 'GN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'George', 'GR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hinds', 'HI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hancock', 'HN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Holmes', 'HO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Harrison', 'HR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Humphreys', 'HU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Issaquena', 'IS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Itawamba', 'IT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jackson', 'JC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jefferson Davis', 'JD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jefferson', 'JF', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jones', 'JO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jasper', 'JS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Kemper', 'KE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lee', 'LE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lincoln', 'LI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Leake', 'LK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Leflore', 'LL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lamar', 'LM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lowndes', 'LO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lauderdale', 'LU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lawrence', 'LW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lafayette', 'LY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Madison', 'MD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Marion', 'MI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Monroe', 'MR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Marshall', 'MS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Montgomery', 'MT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Noxubee', 'NO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Neshoba', 'NS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Newton', 'NW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Oktibbeha', 'OK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Panola', 'PA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pike', 'PI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pearl River', 'PL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Prentiss', 'PN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pontotoc', 'PO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Perry', 'PY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Quitman', 'QU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Rankin', 'RA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Scott', 'SC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sharkey', 'SH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Simpson', 'SI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Smith', 'SM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Stone', 'ST', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sunflower', 'SU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Tallahatchie', 'TL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Tippah', 'TP', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Tishomingo', 'TS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Tate', 'TT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Tunica', 'TU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Union', 'UN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Webster', 'WE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wilkinson', 'WK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Winston', 'WN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Warren', 'WR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Washington', 'WS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Walthall', 'WT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wayne', 'WY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Yalobusha', 'YL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Yazoo', 'YZ', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Mississippi'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Beaverhead', 'BE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Montana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Big Horn', 'BI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Montana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Blaine', 'BL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Montana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Broadwater', 'BR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Montana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Carbon', 'CB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Montana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Chouteau', 'CH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Montana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cascade', 'CS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Montana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Carter', 'CT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Montana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Custer', 'CU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Montana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Deer Lodge', 'DE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Montana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Daniels', 'DN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Montana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Dawson', 'DW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Montana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Fallon', 'FA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Montana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Fergus', 'FE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Montana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Flathead', 'FL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Montana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Glacier', 'GC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Montana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Garfield', 'GF', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Montana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Gallatin', 'GL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Montana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Granite', 'GN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Montana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Golden Valley', 'GO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Montana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hill', 'HI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Montana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jefferson', 'JE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Montana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Judith Basin', 'JU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Montana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lake', 'LA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Montana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Liberty', 'LB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Montana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lewis and Clark', 'LE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Montana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lincoln', 'LN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Montana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Madison', 'MA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Montana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'McCone', 'MC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Montana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Meagher', 'ME', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Montana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Mineral', 'MN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Montana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Missoula', 'MS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Montana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Musselshell', 'MU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Montana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Park', 'PA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Montana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Powder River', 'PD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Montana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Phillips', 'PH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Montana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Powell', 'PL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Montana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pondera', 'PN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Montana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Petroleum', 'PO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Montana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Prairie', 'PR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Montana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ravalli', 'RA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Montana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Richland', 'RI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Montana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Roosevelt', 'RO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Montana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Rosebud', 'RS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Montana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sanders', 'SA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Montana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sheridan', 'SH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Montana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Silver Bow', 'SI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Montana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Stillwater', 'ST', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Montana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sweet Grass', 'SW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Montana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Teton', 'TE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Montana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Toole', 'TO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Montana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Treasure', 'TR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Montana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Valley', 'VA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Montana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wheatland', 'WH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Montana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wibaux', 'WI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Montana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Yellowstone', 'YS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Montana'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Alamance', 'AA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Alexander', 'AE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Alleghany', 'AL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Anson', 'AN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ashe', 'AS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Avery', 'AV', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Beaufort', 'BA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Burke', 'BK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bladen', 'BL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Buncombe', 'BO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Brunswick', 'BS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bertie', 'BT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Catawba', 'CB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Camden', 'CD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Carteret', 'CE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Chatham', 'CH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Currituck', 'CI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Caldwell', 'CL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Columbus', 'CM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Craven', 'CN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cherokee', 'CO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cabarrus', 'CR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Caswell', 'CS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cumberland', 'CU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cleveland', 'CV', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Chowan', 'CW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clay', 'CY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Davidson', 'DD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Dare', 'DE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Durham', 'DH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Duplin', 'DP', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Davie', 'DV', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Edgecombe', 'ED', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Forsyth', 'FO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Franklin', 'FR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Greene', 'GE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Graham', 'GH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Granville', 'GN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Gaston', 'GS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Gates', 'GT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Guilford', 'GU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hertford', 'HD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hyde', 'HE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Halifax', 'HL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Henderson', 'HN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hoke', 'HO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Harnett', 'HT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Haywood', 'HW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Iredell', 'IR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jackson', 'JA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Johnston', 'JH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jones', 'JN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lee', 'LE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lincoln', 'LI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lenoir', 'LN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Mecklenburg', 'MB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Madison', 'MD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Moore', 'ME', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Mitchell', 'MI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Macon', 'MN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Montgomery', 'MO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Martin', 'MR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'McDowell', 'MW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Nash', 'NA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'New Hanover', 'NE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Northampton', 'NO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Onslow', 'ON', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Orange', 'OR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pender', 'PD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pitt', 'PI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pamlico', 'PM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Person', 'PN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Polk', 'PO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Perquimans', 'PQ', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pasquotank', 'PU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Randolph', 'RA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Robeson', 'RB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Rockingham', 'RC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Richmond', 'RI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Rutherford', 'RU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Rowan', 'RW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Scotland', 'SC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Stanly', 'SN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Stokes', 'SO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sampson', 'SP', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Surry', 'SU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Swain', 'SW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Transylvania', 'TR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Tyrrell', 'TY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Union', 'UN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Vance', 'VA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wilkes', 'WE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Washington', 'WI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wake', 'WK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wilson', 'WO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Warren', 'WR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Watauga', 'WT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wayne', 'WY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Yadkin', 'YD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Yancey', 'YN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Adams', 'AD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Barnes', 'BA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Benson', 'BE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Billings', 'BI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Burke', 'BK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Burleigh', 'BL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bottineau', 'BT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bowman', 'BW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cass', 'CS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cavalier', 'CV', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Dickey', 'DC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Dunn', 'DU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Divide', 'DV', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Eddy', 'ED', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Emmons', 'EM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Foster', 'FO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Grand Forks', 'GD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Griggs', 'GI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Golden Valley', 'GO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Grant', 'GT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hettinger', 'HE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Kidder', 'KI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'LaMoure', 'LA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Logan', 'LO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Mercer', 'ME', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'McHenry', 'MH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'McIntosh', 'MI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'McKenzie', 'MK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'McLean', 'ML', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Morton', 'MR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Mountrail', 'MU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Nelson', 'NE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Oliver', 'OL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pembina', 'PE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pierce', 'PI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Renville', 'RE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Richland', 'RI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ramsey', 'RM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ransom', 'RN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Rolette', 'RO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Steele', 'SE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sargent', 'SG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sheridan', 'SH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sioux', 'SI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Slope', 'SL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Stark', 'SR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Stutsman', 'SU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Towner', 'TO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Traill', 'TR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wells', 'WE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Williams', 'WI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Walsh', 'WL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ward', 'WR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'North Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Adams', 'AD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Antelope', 'AN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Arthur', 'AR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Banner', 'BA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Butler', 'BE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Buffalo', 'BF', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Blaine', 'BL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Boone', 'BO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Burt', 'BT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Brown', 'BW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Box Butte', 'BX', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Boyd', 'BY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cedar', 'CA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Chase', 'CE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cherry', 'CH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clay', 'CL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cuming', 'CM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Colfax', 'CO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cass', 'CS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Custer', 'CU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cheyenne', 'CY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Dodge', 'DE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Douglas', 'DG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Dixon', 'DI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Dakota', 'DK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Deuel', 'DL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Dawson', 'DN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Dawes', 'DS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Dundy', 'DY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Franklin', 'FA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Fillmore', 'FI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Frontier', 'FO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Furnas', 'FU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Grant', 'GA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Garden', 'GD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Greeley', 'GE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Garfield', 'GF', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Gage', 'GG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Gosper', 'GO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hitchcock', 'HI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hall', 'HL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hamilton', 'HM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hooker', 'HO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Harlan', 'HR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Holt', 'HT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Howard', 'HW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hayes', 'HY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jefferson', 'JE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Johnson', 'JO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Kearney', 'KA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Kimball', 'KB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Knox', 'KN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Keith', 'KT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Keya Paha', 'KY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lancaster', 'LA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Logan', 'LG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lincoln', 'LI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Loup', 'LU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Madison', 'MA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'McPherson', 'MC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Merrick', 'ME', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Morrill', 'MO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Nance', 'NA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Nemaha', 'NE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Nuckolls', 'NU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Otoe', 'OT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pawnee', 'PA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Perkins', 'PE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Phelps', 'PH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pierce', 'PI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Platte', 'PL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Polk', 'PO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Red Willow', 'RE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Richardson', 'RI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Rock', 'RO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Seward', 'SA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Scotts Bluff', 'SC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sheridan', 'SD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sioux', 'SI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Saline', 'SL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sherman', 'SM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Stanton', 'ST', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Saunders', 'SU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sarpy', 'SY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Thayer', 'TA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Thomas', 'TO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Thurston', 'TU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Valley', 'VA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Webster', 'WE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wheeler', 'WH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Washington', 'WS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wayne', 'WY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'York', 'YO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nebraska'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Belknap', 'BE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Hampshire'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Carroll', 'CA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Hampshire'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cheshire', 'CH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Hampshire'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Coös', 'CO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Hampshire'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Grafton', 'GR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Hampshire'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hillsborough', 'HI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Hampshire'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Merrimack', 'ME', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Hampshire'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Rockingham', 'RO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Hampshire'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Strafford', 'ST', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Hampshire'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sullivan', 'SU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Hampshire'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Atlantic', 'AT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Jersey'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bergen', 'BE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Jersey'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Burlington', 'BU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Jersey'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Camden', 'CM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Jersey'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cape May', 'CP', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Jersey'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cumberland', 'CU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Jersey'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Essex', 'ES', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Jersey'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Gloucester', 'GL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Jersey'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hudson', 'HD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Jersey'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hunterdon', 'HN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Jersey'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Mercer', 'ME', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Jersey'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Middlesex', 'MI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Jersey'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Monmouth', 'MN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Jersey'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Morris', 'MR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Jersey'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ocean', 'OC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Jersey'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Passaic', 'PA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Jersey'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Salem', 'SA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Jersey'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Somerset', 'SO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Jersey'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sussex', 'SU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Jersey'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Union', 'UN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Jersey'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Warren', 'WA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Jersey'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bernalillo', 'BE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Mexico'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Catron', 'CA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Mexico'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Chaves', 'CH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Mexico'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cibola', 'CI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Mexico'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Colfax', 'CO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Mexico'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Curry', 'CU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Mexico'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'De Baca', 'DE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Mexico'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Doña Ana', 'DO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Mexico'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Eddy', 'ED', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Mexico'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Grant', 'GR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Mexico'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Guadalupe', 'GU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Mexico'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Harding', 'HA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Mexico'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hidalgo', 'HI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Mexico'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lea', 'LE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Mexico'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lincoln', 'LI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Mexico'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Los Alamos', 'LO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Mexico'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Luna', 'LU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Mexico'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'McKinley', 'MC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Mexico'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Mora', 'MO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Mexico'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Otero', 'OT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Mexico'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Quay', 'QU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Mexico'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Rio Arriba', 'RI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Mexico'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Roosevelt', 'RO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Mexico'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sandoval', 'SD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Mexico'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sierra', 'SI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Mexico'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'San Juan', 'SJ', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Mexico'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'San Miguel', 'SM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Mexico'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Socorro', 'SO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Mexico'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Santa Fe', 'ST', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Mexico'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Taos', 'TA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Mexico'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Torrance', 'TO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Mexico'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Union', 'UN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Mexico'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Valencia', 'VA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New Mexico'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Carson City', 'CA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nevada'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Churchill', 'CH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nevada'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clark', 'CL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nevada'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Douglas', 'DO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nevada'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Elko', 'EL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nevada'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Esmeralda', 'ES', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nevada'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Eureka', 'EU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nevada'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Humboldt', 'HU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nevada'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lander', 'LA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nevada'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lincoln', 'LI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nevada'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lyon', 'LY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nevada'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Mineral', 'MI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nevada'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Nye', 'NY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nevada'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pershing', 'PE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nevada'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Storey', 'ST', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nevada'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Washoe', 'WA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nevada'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'White Pine', 'WH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Nevada'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Albany', 'AB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Allegany', 'AL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bronx', 'BN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Brome', 'BO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cortland', 'CD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cattaraugus', 'CG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Chenango', 'CH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clinton', 'CL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Chemung', 'CM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Chautauqua', 'CQ', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Columbia', 'CU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cayuga', 'CY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Delaware', 'DE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Dutchess', 'DU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Erie', 'ER', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Essex', 'ES', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Franklin', 'FR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Fulton', 'FU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Genesee', 'GE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Greene', 'GR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hamilton', 'HA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Herkimer', 'HE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jefferson', 'JE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Kings', 'KI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lewis', 'LE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Livingston', 'LI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Madison', 'MA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Monroe', 'MR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Montgomery', 'MT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Nassau', 'NA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'New York', 'NE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Niagara', 'NI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Oneida', 'OD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Orange', 'OE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Onondaga', 'OG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Orleans', 'OL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Otsego', 'OO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ontario', 'OR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Oswego', 'OS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Putnam', 'PU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Queens', 'QU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Rensselaer', 'RE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Richmond', 'RI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Rockland', 'RO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Seneca', 'SC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Suffolk', 'SF', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Saint Lawrence', 'SI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sullivan', 'SL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Schenectady', 'SN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Schoharie', 'SO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Saratoga', 'SR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Steuben', 'ST', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Schuyler', 'SU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Tioga', 'TI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Tompkins', 'TO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ulster', 'UL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Westchester', 'WE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wyoming', 'WM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wayne', 'WN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Warren', 'WR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Washington', 'WS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Yates', 'YA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'New York'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ashtabula', 'AB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Adams', 'AD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ashland', 'AL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Allen', 'AN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Athens', 'AS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Auglaize', 'AU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Belmont', 'BE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Brown', 'BR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Butler', 'BU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clermont', 'CE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Crawford', 'CF', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Champaign', 'CH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clinton', 'CI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clark', 'CK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Columbiana', 'CL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Carroll', 'CO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Coshocton', 'CS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cuyahoga', 'CU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Darke', 'DA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Defiance', 'DF', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Delaware', 'DL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Erie', 'ER', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Fairfield', 'FI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Franklin', 'FR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Fulton', 'FU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Fayette', 'FY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Gallia', 'GA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Geauga', 'GE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Greene', 'GR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Guernsey', 'GU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hocking', 'HC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hardin', 'HD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Henry', 'HE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Highland', 'HI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Holmes', 'HL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hamilton', 'HM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hancock', 'HN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Harrison', 'HR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Huron', 'HU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jackson', 'JA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jefferson', 'JE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Knox', 'KN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Logan', 'LG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Licking', 'LI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lake', 'LK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lorain', 'LR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lucas', 'LU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lawrence', 'LW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Morgan', 'MA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Mercer', 'MC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Medina', 'MD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Monroe', 'ME', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Mahoning', 'MH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Miami', 'MM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Madison', 'MO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Marion', 'MR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Meigs', 'MS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Montgomery', 'MT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Muskingum', 'MU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Morrow', 'MW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Noble', 'NO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ottawa', 'OT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Paulding', 'PA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pickaway', 'PC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Perry', 'PE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pike', 'PK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Portage', 'PO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Preble', 'PR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Putnam', 'PU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Richland', 'RI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ross', 'RO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sandusky', 'SA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Scioto', 'SC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Seneca', 'SE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Shelby', 'SH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Stark', 'ST', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Summit', 'SU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Trumbull', 'TR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Tuscarawas', 'TU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Union', 'UN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Van Wert', 'VA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Vinton', 'VI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wyandot', 'WD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wayne', 'WE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Williams', 'WI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wood', 'WO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Warren', 'WR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Washington', 'WS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Ohio'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Adair', 'AD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Alfalfa', 'AL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Atoka', 'AT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Beaver', 'BA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Beckham', 'BC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Blaine', 'BL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bryan', 'BR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Choctaw', 'CA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Caddo', 'CD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Creek', 'CE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Craig', 'CG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cherokee', 'CK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Coal', 'CL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Comanche', 'CM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Canadian', 'CN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cimarron', 'CO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Carter', 'CR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cotton', 'CT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Custer', 'CU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cleveland', 'CV', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Delaware', 'DL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Dewey', 'DW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ellis', 'EL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Grady', 'GD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Greer', 'GE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Garfield', 'GF', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Grant', 'GN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Garvin', 'GV', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Harmon', 'HM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Harper', 'HP', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Haskell', 'HS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hughes', 'HU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jackson', 'JA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jefferson', 'JE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Johnston', 'JO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Kay', 'KA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Kingfisher', 'KN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Kiowa', 'KO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Latimer', 'LA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Le Flore', 'LE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Logan', 'LG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lincoln', 'LI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Love', 'LV', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Marshall', 'MH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'McIntosh', 'MI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Major', 'MJ', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'McClain', 'ML', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Muskogee', 'MO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Murray', 'MR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'McCurtain', 'MU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Mayes', 'MY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Noble', 'NB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Nowata', 'NW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Okfuskee', 'OF', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Oklahoma', 'OL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Okmulgee', 'OM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Osage', 'OS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ottawa', 'OT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pittsburg', 'PI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pontotoc', 'PN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pottawatomie', 'PT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pushmataha', 'PU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pawnee', 'PW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Payne', 'PY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Roger Mills', 'RR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Rogers', 'RS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Seminole', 'SM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sequoyah', 'SQ', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Stephens', 'ST', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Texas', 'TE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Tillman', 'TI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Tulsa', 'TU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wagoner', 'WG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Washington', 'WN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Woods', 'WS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Washita', 'WT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Woodward', 'WW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oklahoma'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Baker', 'BA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oregon'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Benton', 'BE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oregon'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clackamas', 'CC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oregon'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Columbia', 'CL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oregon'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Coos', 'CO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oregon'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Crook', 'CR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oregon'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clatsop', 'CT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oregon'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Curry', 'CU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oregon'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Deschutes', 'DE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oregon'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Douglas', 'DO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oregon'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Gilliam', 'GI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oregon'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Grant', 'GR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oregon'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Harney', 'HA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oregon'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hood River', 'HO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oregon'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jackson', 'JA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oregon'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jefferson', 'JE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oregon'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Josephine', 'JO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oregon'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Klamath', 'KL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oregon'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lincoln', 'LC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oregon'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lane', 'LE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oregon'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lake', 'LK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oregon'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Linn', 'LN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oregon'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Malheur', 'ML', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oregon'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Morrow', 'MO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oregon'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Marion', 'MR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oregon'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Multnomah', 'MU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oregon'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Polk', 'PO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oregon'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sherman', 'SH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oregon'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Tillamook', 'TI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oregon'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Umatilla', 'UM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oregon'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Union', 'UN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oregon'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wasco', 'WC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oregon'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wheeler', 'WE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oregon'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Washington', 'WI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oregon'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wallowa', 'WW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oregon'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Yamhill', 'YA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Oregon'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Adams', 'AD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Allegheny', 'AL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Armstrong', 'AR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Beaver', 'BA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bucks', 'BC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bradford', 'BF', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Berks', 'BK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Blair', 'BL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bedford', 'BO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Butler', 'BT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Carbon', 'CB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cameron', 'CE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clearfield', 'CF', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Chester', 'CH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cambria', 'CI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clarion', 'CL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clinton', 'CN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Columbia', 'CO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Centre', 'CT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cumberland', 'CU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Crawford', 'CW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Dauphin', 'DA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Delaware', 'DE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Elk', 'EL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Erie', 'ER', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Fayette', 'FA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Forest', 'FO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Franklin', 'FR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Fulton', 'FU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Greene', 'GR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Huntingdon', 'HU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Indiana', 'IN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jefferson', 'JE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Juniata', 'JU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lebanon', 'LB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lackawanna', 'LC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lehigh', 'LH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lancaster', 'LN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Luzerne', 'LU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lawrence', 'LW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lycoming', 'LY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'McKean', 'MC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Mercer', 'ME', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Montgomery', 'MG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Mifflin', 'MI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Montour', 'MO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Monroe', 'MR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Northampton', 'NA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Northumberland', 'NU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Perry', 'PE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Philadelphia', 'PH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pike', 'PI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Potter', 'PO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Schuylkill', 'SC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sullivan', 'SL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Snyder', 'SN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Somerset', 'SO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Susquehanna', 'SS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Tioga', 'TI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Union', 'UN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Venango', 'VE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Westmoreland', 'WE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wyoming', 'WM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wayne', 'WN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Warren', 'WR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Washington', 'WS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'York', 'YO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Pennsylvania'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bristol', 'BR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Rhode Island'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Kent', 'KE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Rhode Island'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Newport', 'NE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Rhode Island'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Providence', 'PR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Rhode Island'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Washington', 'WA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Rhode Island'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Abbeville', 'AB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Aiken', 'AI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Allendale', 'AL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Anderson', 'AN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Beaufort', 'BA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Berkeley', 'BK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bamberg', 'BM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Barnwell', 'BN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Chesterfield', 'CF', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Calhoun', 'CH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cherokee', 'CK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clarendon', 'CN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Chester', 'CR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Charleston', 'CS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Colleton', 'CT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Darlington', 'DA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Dillon', 'DI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Dorchester', 'DO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Edgefield', 'ED', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Fairfield', 'FA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Florence', 'FL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Georgetown', 'GR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Greenville', 'GV', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Greenwood', 'GW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hampton', 'HA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Horry', 'HO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jasper', 'JA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Kershaw', 'KE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lee', 'LE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lancaster', 'LN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Laurens', 'LU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lexington', 'LX', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'McCormick', 'MC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Marion', 'MI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Marlboro', 'ML', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Newberry', 'NE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Oconee', 'OC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Orangeburg', 'OR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pickens', 'PI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Richland', 'RI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Saluda', 'SA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Spartanburg', 'SP', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sumter', 'SU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Union', 'UN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Williamsburg', 'WI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'York', 'YO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Carolina'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Aurora', 'AU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Beadle', 'BA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Buffalo', 'BF', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bon Homme', 'BH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Brookings', 'BK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bennett', 'BN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Butte', 'BT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Brule', 'BU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Brown', 'BW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Codington', 'CD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Charles Mix', 'CH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clark', 'CK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Corson', 'CO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Campbell', 'CP', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Custer', 'CU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clay', 'CY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Douglas', 'DO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Deuel', 'DU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Davison', 'DV', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Dewey', 'DW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Day', 'DY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Edmunds', 'ED', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Fall River', 'FL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Faulk', 'FU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Grant', 'GA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Gregory', 'GE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Haakon', 'HA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hand', 'HD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hughes', 'HG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hamlin', 'HM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Harding', 'HR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hanson', 'HS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hutchinson', 'HT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hyde', 'HY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jackson', 'JA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jerauld', 'JE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jones', 'JO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Kingsbury', 'KI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lincoln', 'LI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lake', 'LK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lawrence', 'LW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lyman', 'LY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'McCook', 'MC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Meade', 'MD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Miner', 'ME', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Mellette', 'ML', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Minnehaha', 'MN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Moody', 'MO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'McPherson', 'MP', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Marshall', 'MS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pennington', 'PN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Potter', 'PO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Perkins', 'PR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Roberts', 'RO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sanborn', 'SA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Shannon', 'SH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Spink', 'SP', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Stanley', 'ST', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sully', 'SU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Todd', 'TO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Tripp', 'TR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Turner', 'TU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Union', 'UN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Walworth', 'WA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Yankton', 'YA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ziebach', 'ZI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'South Dakota'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Anderson', 'AN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bedford', 'BD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bledsoe', 'BE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Benton', 'BN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Blount', 'BO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bradley', 'BR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cheatham', 'CA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cocke', 'CE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Coffee', 'CF', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Claiborne', 'CI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Crockett', 'CK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Campbell', 'CM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cannon', 'CN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Carroll', 'CR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Chester', 'CS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Carter', 'CT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cumberland', 'CU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clay', 'CY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Davidson', 'DA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Decatur', 'DC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'DeKalb', 'DE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Dickson', 'DI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Dyer', 'DY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Fayette', 'FA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Fentress', 'FE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Franklin', 'FR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Grainger', 'GA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Gibson', 'GB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Greene', 'GE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Giles', 'GL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Grundy', 'GU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hardeman', 'HA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hamblen', 'HB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hancock', 'HC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hardin', 'HI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hamilton', 'HL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hickman', 'HN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Houston', 'HO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Henry', 'HR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Henderson', 'HS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Humphreys', 'HU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hawkins', 'HW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Haywood', 'HY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jackson', 'JA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jefferson', 'JE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Johnson', 'JO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Knox', 'KN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lewis', 'LE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lincoln', 'LI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lake', 'LK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Loudon', 'LO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lauderdale', 'LU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lawrence', 'LW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'McNairy', 'MA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Macon', 'MC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Madison', 'MD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Meigs', 'ME', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Morgan', 'MG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Marion', 'MI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'McMinn', 'MM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Moore', 'MO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Monroe', 'MR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Marshall', 'MS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Montgomery', 'MT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Maury', 'MU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Obion', 'OB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Overton', 'OV', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Perry', 'PE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pickett', 'PI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Polk', 'PO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Putnam', 'PU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Roane', 'RA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Robertson', 'RB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Rhea', 'RH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Rutherford', 'RU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Stewart', 'SA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Scott', 'SC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Smith', 'SH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sullivan', 'SL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sumner', 'SN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sequatchie', 'SQ', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sevier', 'SV', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Shelby', 'SY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Tipton', 'TI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Trousdale', 'TR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Unicoi', 'UC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Union', 'UO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Van Buren', 'VA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Weakley', 'WE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'White', 'WH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Washington', 'WI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Williamson', 'WL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wilson', 'WO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Warren', 'WR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wayne', 'WY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Tennessee'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Aransas', 'AA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Archer', 'AC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Madison', 'AD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Anderson', 'AE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Angelina', 'AG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Callahan', 'AL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Armstrong', 'AM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Andrews', 'AR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Castro', 'AS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Atascosa', 'AT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Austin', 'AU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bandera', 'BA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Blanco', 'BC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Borden', 'BD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bee', 'BE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Brazoria', 'BI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Brooks', 'BK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bell', 'BL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Brown', 'BN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Briscoe', 'BO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bastrop', 'BP', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bosque', 'BQ', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Baylor', 'BR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Brewster', 'BS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Burnet', 'BT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Burleson', 'BU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bowie', 'BW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bexar', 'BX', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bailey', 'BY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Brazos', 'BZ', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cameron', 'CA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Crosby', 'CB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cochran', 'CC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Childress', 'CD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Comanche', 'CE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Collingsworth', 'CG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Chambers', 'CH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Collin', 'CI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cherokee', 'CK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Coryell', 'CL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Coleman', 'CM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Carson', 'CN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Colorado', 'CO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Camp', 'CP', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Crane', 'CR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cass', 'CS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Crockett', 'CT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Calhoun', 'CU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Caldwell', 'CW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clay', 'CY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Dickens', 'DC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'DeWitt', 'DE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Deaf Smith', 'DI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Dallam', 'DL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Dimmit', 'DM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Denton', 'DN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Donley', 'DO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Dallas', 'DS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Delta', 'DT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Duval', 'DU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Dawson', 'DW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Eastland', 'EA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ector', 'EC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Edwards', 'ED', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ellis', 'EI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Menard', 'EN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'El Paso', 'EP', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Erath', 'ER', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Foard', 'FD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Freestone', 'FE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Fisher', 'FH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Fannin', 'FI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Franklin', 'FK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Falls', 'FL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Frio', 'FO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Fort Bend', 'FR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Fayette', 'FT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Floyd', 'FY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Gonzales', 'GA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Glasscock', 'GC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Gregg', 'GE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Goliad', 'GI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Gillespie', 'GL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Grimes', 'GM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Grayson', 'GO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Garza', 'GR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Gaines', 'GS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Guadalupe', 'GU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Galveston', 'GV', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Gray', 'GY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hall', 'HA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hockley', 'HC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Henderson', 'HD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hale', 'HE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hansford', 'HF', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hidalgo', 'HG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hemphill', 'HH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hill', 'HI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Haskell', 'HK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hartley', 'HL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hamilton', 'HM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hardin', 'HN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hood', 'HO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hopkins', 'HP', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Harrison', 'HR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Houston', 'HS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hunt', 'HT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hudspeth', 'HU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Howard', 'HW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hays', 'HY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Midland', 'ID', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Irion', 'IR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jackson', 'JA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jefferson', 'JE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jeff Davis', 'JF', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jim Hogg', 'JG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Johnson', 'JH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jack', 'JK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jones', 'JN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jasper', 'JR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jim Wells', 'JW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Kendall', 'KD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Kenedy', 'KE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'King', 'KG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Kleberg', 'KL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Kimble', 'KM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Kinney', 'KN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Kerr', 'KR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Karnes', 'KS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Kent', 'KT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Kaufman', 'KU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Knox', 'KX', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lavaca', 'LA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lamb', 'LB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lee', 'LE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Loving', 'LI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Live Oak', 'LK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Llano', 'LL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lipscomb', 'LM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Leon', 'LN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Limestone', 'LO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lampasas', 'LP', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lamar', 'LR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'La Salle', 'LS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Liberty', 'LT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lubbock', 'LU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lynn', 'LY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Mason', 'MA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'McCulloch', 'MC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Matagorda', 'MD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Medina', 'ME', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Montgomery', 'MG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Mitchell', 'MH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Milam', 'MI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'McLennan', 'ML', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'McMullen', 'MM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Marion', 'MN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Moore', 'MO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Morris', 'MR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Mills', 'MS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Martin', 'MT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Montague', 'MU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Maverick', 'MV', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Motley', 'MY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Nacogdoches', 'NC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Newton', 'NE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Nolan', 'NO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Nueces', 'NU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Navarro', 'NV', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ochiltree', 'OC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Coke', 'OK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Oldham', 'OL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Comal', 'OM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Concho', 'ON', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cooke', 'OO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Orange', 'OR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cottle', 'OT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pecos', 'PE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Polk', 'PK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Parmer', 'PM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Panola', 'PN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Palo Pinto', 'PO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Parker', 'PR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Presidio', 'PS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Potter', 'PT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Randall', 'RA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Rockwall', 'RC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hardeman', 'RD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Reeves', 'RE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Refugio', 'RF', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Reagan', 'RG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Rains', 'RI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Rusk', 'RK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Real', 'RL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Runnels', 'RN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Robertson', 'RO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Harris', 'RR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Roberts', 'RS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Red River', 'RV', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Stonewall', 'SA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sabine', 'SB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Shackelford', 'SC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Stephens', 'SE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'San Augustine', 'SG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Schleicher', 'SH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sterling', 'SI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'San Jacinto', 'SJ', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Smith', 'SM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sherman', 'SN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'San Patricio', 'SP', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Starr', 'SR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'San Saba', 'SS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sutton', 'ST', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Scurry', 'SU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Somervell', 'SV', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Swisher', 'SW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Shelby', 'SY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Taylor', 'TA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Terry', 'TE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Tom Green', 'TG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Throckmorton', 'TH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Terrell', 'TL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Tarrant', 'TN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Trinity', 'TR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Titus', 'TU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Travis', 'TV', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Tyler', 'TY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Culberson', 'UL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Upton', 'UP', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Upshur', 'US', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hutchinson', 'UT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Uvalde', 'UV', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Victoria', 'VI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Val Verde', 'VL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Van Zandt', 'VN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Webb', 'WB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wichita', 'WC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ward', 'WD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wise', 'WE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wilbarger', 'WG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Washington', 'WH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Winkler', 'WI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Walker', 'WK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wheeler', 'WL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Williamson', 'WM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wharton', 'WN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wood', 'WO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Waller', 'WR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wilson', 'WS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Willacy', 'WY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Yoakum', 'YA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Young', 'YU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Zapata', 'ZP', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Zavala', 'ZV', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Texas'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Box Elder', 'BE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Utah'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Beaver', 'BV', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Utah'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cache', 'CA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Utah'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Carbon', 'CR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Utah'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Davis', 'DA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Utah'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Daggett', 'DG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Utah'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Duchesne', 'DU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Utah'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Emery', 'EM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Utah'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Garfield', 'GA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Utah'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Grand', 'GR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Utah'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Juab', 'JU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Utah'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Kane', 'KA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Utah'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Millard', 'MD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Utah'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Morgan', 'MN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Utah'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Piute', 'PT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Utah'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Rich', 'RH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Utah'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Iron', 'RN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Utah'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sevier', 'SE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Utah'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'San Juan', 'SJ', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Utah'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Salt Lake', 'SL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Utah'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sanpete', 'SP', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Utah'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Summit', 'SU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Utah'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Tooele', 'TE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Utah'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Uintah', 'UN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Utah'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Utah', 'UT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Utah'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wasatch', 'WA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Utah'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Weber', 'WB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Utah'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wayne', 'WE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Utah'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Washington', 'WN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Utah'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Albemarle', 'AB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Accomack', 'AC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Amherst', 'AH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Amelia', 'AI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Alleghany', 'AL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Appomattox', 'AP', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Arlington', 'AR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Augusta', 'AU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Alexandria', 'AX', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bath', 'BA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Buena Vista', 'BE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bedford', 'BF', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Buchanan', 'BH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bristol', 'BI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Buckingham', 'BK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bland', 'BL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Botetourt', 'BO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Brunswick', 'BU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Charles City', 'CC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Chesterfield', 'CD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Charlottesville', 'CE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Craig', 'CG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Colonial Heights', 'CH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Caroline', 'CI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clarke', 'CK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Carroll', 'CL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Campbell', 'CM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Culpeper', 'CP', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Chesapeake', 'CS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Charlotte', 'CT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cumberland', 'CU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Covington', 'CV', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Danville', 'DA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Dickenson', 'DC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Dinwiddie', 'DN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Emporia', 'EM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Essex', 'ES', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Fredericksburg', 'FB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Fairfax City', 'FC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Frederick', 'FK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Franklin', 'FN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Floyd', 'FO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Fauquier', 'FQ', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Franklin City', 'FR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Falls Church', 'FU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Fluvanna', 'FV', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Fairfax', 'FX', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Galax', 'GA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Greene', 'GE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Giles', 'GI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Gloucester', 'GL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Goochland', 'GO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Greensville', 'GS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Grayson', 'GY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Highland', 'HA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Henrico', 'HC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Halifax', 'HL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hampton', 'HM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Harrisonburg', 'HS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hanover', 'HV', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hopewell', 'HW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Henry', 'HY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Isle of Wight', 'IS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'James City', 'JA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'King and Queen', 'KA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'King George', 'KG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'King William', 'KW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lancaster', 'LA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Loudoun', 'LD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lee', 'LE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Louisa', 'LI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lunenburg', 'LN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lexington', 'LX', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lynchburg', 'LY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Madison', 'MD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Mecklenburg', 'ME', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Middlesex', 'MI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Montgomery', 'MO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Manassas Park', 'MP', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Martinsville', 'MR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Manassas', 'MS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Mathews', 'MT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Northampton', 'NA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Norton', 'NC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Norfolk', 'NF', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'New Kent', 'NK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Nelson', 'NL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Newport News', 'NN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Northumberland', 'NU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Nottoway', 'NY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Orange', 'OR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Page', 'PA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Petersburg', 'PB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Prince Edward', 'PD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Prince George', 'PG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Powhatan', 'PH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Patrick', 'PK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Poquoson', 'PQ', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Portsmouth', 'PR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pittsylvania', 'PS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pulaski', 'PU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Prince William', 'PW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Rockbridge', 'RB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Richmond City', 'RC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Radford', 'RD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Roanoke', 'RE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Rockingham', 'RG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Richmond', 'RI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Roanoke City', 'RO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Rappahannock', 'RP', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Russell', 'RU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Southampton', 'SA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Scott', 'SC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Salem', 'SE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Stafford', 'SF', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Smyth', 'SM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Shenandoah', 'SN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Suffolk', 'SO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Spotsylvania', 'SP', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Surry', 'SR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sussex', 'SS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Staunton', 'SU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Tazewell', 'TA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Virginia Beach', 'VI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Washington', 'WG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Winchester', 'WH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wise', 'WI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Williamsburg', 'WL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Westmoreland', 'WM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Warren', 'WR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Waynesboro', 'WS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wythe', 'WY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'York', 'YO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Addison', 'AD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Vermont'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bennington', 'BE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Vermont'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Caledonia', 'CA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Vermont'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Chittenden', 'CH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Vermont'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Essex', 'ES', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Vermont'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Franklin', 'FR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Vermont'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Grand Isle', 'GR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Vermont'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lamoille', 'LA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Vermont'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Orange', 'OA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Vermont'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Orleans', 'OL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Vermont'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Rutland', 'RU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Vermont'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Washington', 'WA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Vermont'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Windham', 'WH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Vermont'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Windsor', 'WS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Vermont'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Adams', 'AD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Washington'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Asotin', 'AS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Washington'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Benton', 'BE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Washington'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Chelan', 'CH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Washington'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clallam', 'CL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Washington'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Columbia', 'CM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Washington'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clark', 'CR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Washington'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cowlitz', 'CW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Washington'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Douglas', 'DO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Washington'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ferry', 'FE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Washington'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Franklin', 'FR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Washington'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Garfield', 'GF', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Washington'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Grant', 'GN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Washington'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Grays Harbor', 'GY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Washington'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Island', 'IS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Washington'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jefferson', 'JE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Washington'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Klickitat', 'KL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Washington'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'King', 'KN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Washington'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Kitsap', 'KS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Washington'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Kittitas', 'KT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Washington'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lewis', 'LE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Washington'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lincoln', 'LI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Washington'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Mason', 'MA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Washington'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Okanogan', 'OK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Washington'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pacific', 'PA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Washington'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pend Oreille', 'PE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Washington'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pierce', 'PI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Washington'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'San Juan', 'SA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Washington'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Skagit', 'SG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Washington'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Skamania', 'SM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Washington'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Snohomish', 'SN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Washington'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Spokane', 'SP', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Washington'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Stevens', 'ST', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Washington'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Thurston', 'TH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Washington'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Whatcom', 'WA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Washington'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wahkiakum', 'WH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Washington'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Whitman', 'WI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Washington'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Walla Walla', 'WL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Washington'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Yakima', 'YA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Washington'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Adams', 'AD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ashland', 'AS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Buffalo', 'BF', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Burnett', 'BN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Barron', 'BR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Brown', 'BW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Bayfield', 'BY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Calumet', 'CA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Chippewa', 'CH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clark', 'CL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Columbia', 'CO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Crawford', 'CR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Dane', 'DA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Dodge', 'DD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Douglas', 'DG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Dunn', 'DN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Door', 'DO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Eau Claire', 'EA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Florence', 'FL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Fond du Lac', 'FN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Forest', 'FR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Grant', 'GA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Green Lake', 'GL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Green', 'GN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Iowa', 'IO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Iron', 'IR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jackson', 'JA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jefferson', 'JE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Juneau', 'JU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Kenosha', 'KN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Kewaunee', 'KW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'La Crosse', 'LA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lafayette', 'LF', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lincoln', 'LI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Langlade', 'LN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Marathon', 'MH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Menominee', 'MN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Monroe', 'MO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Marquette', 'MQ', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Marinette', 'MT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Milwaukee', 'MU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Manitowoc', 'MW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Oconto', 'OC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Oneida', 'ON', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Outagamie', 'OU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ozaukee', 'OZ', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Price', 'PC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pepin', 'PE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pierce', 'PI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Polk', 'PL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Portage', 'PT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Racine', 'RA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Richland', 'RI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Rock', 'RO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Rusk', 'RU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Shawano', 'SA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sheboygan', 'SE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Saint Croix', 'SI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sauk', 'SU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sawyer', 'SW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Taylor', 'TA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Trempealeau', 'TR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Vernon', 'VE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Vilas', 'VI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Winnebago', 'WA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Waukesha', 'WK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Walworth', 'WL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Washington', 'WN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wood', 'WO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Waupaca', 'WP', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Washburn', 'WR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Waushara', 'WS', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wisconsin'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Barbour', 'BB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'West Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Berkeley', 'BE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'West Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Boone', 'BN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'West Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Brooke', 'BO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'West Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Braxton', 'BX', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'West Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Cabell', 'CB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'West Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Calhoun', 'CH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'West Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Clay', 'CY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'West Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Doddridge', 'DO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'West Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Fayette', 'FA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'West Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Grant', 'GA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'West Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Greenbrier', 'GE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'West Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Gilmer', 'GI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'West Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hardy', 'HD', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'West Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hampshire', 'HM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'West Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hancock', 'HN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'West Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Harrison', 'HR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'West Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jackson', 'JA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'West Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Jefferson', 'JE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'West Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Kanawha', 'KA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'West Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lewis', 'LE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'West Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lincoln', 'LI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'West Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Logan', 'LO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'West Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Morgan', 'MA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'West Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'McDowell', 'MC', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'West Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Monroe', 'ME', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'West Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Monongalia', 'MG', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'West Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Marshall', 'MH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'West Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Marion', 'MI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'West Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Mineral', 'ML', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'West Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Mason', 'MN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'West Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Mingo', 'MO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'West Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Mercer', 'MR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'West Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Nicholas', 'NI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'West Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ohio', 'OH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'West Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pendleton', 'PE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'West Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pleasants', 'PL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'West Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Pocahontas', 'PO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'West Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Preston', 'PR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'West Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Putnam', 'PU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'West Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Ritchie', 'RI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'West Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Raleigh', 'RL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'West Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Randolph', 'RN', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'West Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Roane', 'RO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'West Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Summers', 'SU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'West Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Taylor', 'TA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'West Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Tucker', 'TU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'West Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Tyler', 'TY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'West Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Upshur', 'UP', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'West Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wayne', 'WA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'West Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Webster', 'WB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'West Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wirt', 'WI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'West Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wood', 'WO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'West Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wetzel', 'WT', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'West Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Wyoming', 'WY', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'West Virginia'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Albany', 'AL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wyoming'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Big Horn', 'BI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wyoming'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Carbon', 'CB', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wyoming'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Converse', 'CE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wyoming'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Crook', 'CK', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wyoming'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Campbell', 'CM', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wyoming'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Fremont', 'FR', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wyoming'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Goshen', 'GO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wyoming'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Hot Springs', 'HO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wyoming'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Johnson', 'JO', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wyoming'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Laramie', 'LA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wyoming'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Lincoln', 'LI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wyoming'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Natrona', 'NA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wyoming'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Niobrara', 'NI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wyoming'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Park', 'PA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wyoming'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Platte', 'PL', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wyoming'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sheridan', 'SH', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wyoming'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sublette', 'SU', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wyoming'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Sweetwater', 'SW', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wyoming'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Teton', 'TE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wyoming'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Uinta', 'UI', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wyoming'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Washakie', 'WA', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wyoming'
INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	'Weston', 'WE', level_1_address_component_id	FROM	level_1_address_components	WHERE	level_1_address_component_nm	=	'Wyoming'

-- ======================================================================


UPDATE	level_1_address_components
	SET	is_authentic	=	1
WHERE	country_id	=	@country_id;

UPDATE	l2
	SET	is_authentic	=	1
FROM	level_2_address_components	l2
	JOIN	level_1_address_components	l1
		ON	(	l1.level_1_address_component_id	=	l2.level_1_address_component_id
			AND	l1.country_id	=	@country_id
			);

-- ======================================================================

