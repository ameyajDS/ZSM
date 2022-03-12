
/* ==================================================================================
    	Source File		:	setup_bangladesh_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	10-10-2014
	Module ID		:	CDB
	Last updated		:	10-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Bangladesh are set-up
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
WHERE	country_nm	=	'Bangladesh';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Bangladesh not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Division',
		level_2_address_component	=	'District',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Khulna'            ,	     'Bagerhat',	'KH',	'BH');
INSERT INTO @tbl VALUES ('Chittagong'            ,	     'Bandarban',	'CG',	'BD');
INSERT INTO @tbl VALUES ('Barisal'            ,	     'Barguna',	'BA',	'BG');
INSERT INTO @tbl VALUES ('Barisal'            ,	     'Barisal',	'BA',	'BS');
INSERT INTO @tbl VALUES ('Barisal'            ,	     'Bhola',	'BA',	'BL');
INSERT INTO @tbl VALUES ('Rajshahi'            ,	     'Bogra',	'RS',	'BO');
INSERT INTO @tbl VALUES ('Chittagong'            ,	     'Brahmanbaria',	'CG',	'BB');
INSERT INTO @tbl VALUES ('Chittagong'            ,	     'Chandpur',	'CG',	'CP');
INSERT INTO @tbl VALUES ('Chittagong'            ,	     'Chittagong',	'CG',	'CT');
INSERT INTO @tbl VALUES ('Khulna'            ,	     'Chuadanga',	'KH',	'CD');
INSERT INTO @tbl VALUES ('Chittagong'            ,	     'Comilla',	'CG',	'CM');
INSERT INTO @tbl VALUES ('Chittagong'            ,	     'Cox''s Bazar',	'CG',	'CB');
INSERT INTO @tbl VALUES ('Dhaka'            ,	     'Dhaka',	'DA',	'DH');
INSERT INTO @tbl VALUES ('Rangpur'            ,	     'Dinajpur',	'RP',	'DJ');
INSERT INTO @tbl VALUES ('Dhaka'            ,	     'Faridpur',	'DA',	'FR');
INSERT INTO @tbl VALUES ('Chittagong'            ,	     'Feni',	'CG',	'FN');
INSERT INTO @tbl VALUES ('Rangpur'            ,	     'Gaibandha',	'RP',	'GB');
INSERT INTO @tbl VALUES ('Dhaka'            ,	     'Gazipur',	'DA',	'GZ');
INSERT INTO @tbl VALUES ('Dhaka'            ,	     'Gopalganj',	'DA',	'GG');
INSERT INTO @tbl VALUES ('Sylhet'            ,	     'Habiganj',	'SY',	'HA');
INSERT INTO @tbl VALUES ('Rajshahi'            ,	     'Jaipurhat',	'RS',	'JP');
INSERT INTO @tbl VALUES ('Dhaka'            ,	     'Jamalpur',	'DA',	'JM');
INSERT INTO @tbl VALUES ('Khulna'            ,	     'Jessore',	'KH',	'JS');
INSERT INTO @tbl VALUES ('Barisal'            ,	     'Jhalakati',	'BA',	'JK');
INSERT INTO @tbl VALUES ('Khulna'            ,	     'Jhenaidah',	'KH',	'JN');
INSERT INTO @tbl VALUES ('Chittagong'            ,	     'Khagrachari',	'CG',	'KG');
INSERT INTO @tbl VALUES ('Khulna'            ,	     'Khulna',	'KH',	'KL');
INSERT INTO @tbl VALUES ('Dhaka'            ,	     'Kishoreganj',	'DA',	'KS');
INSERT INTO @tbl VALUES ('Rangpur'            ,	     'Kurigram',	'RP',	'KR');
INSERT INTO @tbl VALUES ('Khulna'            ,	     'Kushtia',	'KH',	'KU');
INSERT INTO @tbl VALUES ('Chittagong'            ,	     'Lakshmipur',	'CG',	'LK');
INSERT INTO @tbl VALUES ('Rangpur'            ,	     'Lalmonirhat',	'RP',	'LL');
INSERT INTO @tbl VALUES ('Dhaka'            ,	     'Madaripur',	'DA',	'MD');
INSERT INTO @tbl VALUES ('Khulna'            ,	     'Magura',	'KH',	'MG');
INSERT INTO @tbl VALUES ('Dhaka'            ,	     'Manikganj',	'DA',	'MK');
INSERT INTO @tbl VALUES ('Khulna'            ,	     'Meherpur',	'KH',	'ME');
INSERT INTO @tbl VALUES ('Sylhet'            ,	     'Moulvibazar',	'SY',	'MB');
INSERT INTO @tbl VALUES ('Dhaka'            ,	     'Munshiganj',	'DA',	'MU');
INSERT INTO @tbl VALUES ('Dhaka'            ,	     'Mymensingh',	'DA',	'MM');
INSERT INTO @tbl VALUES ('Rajshahi'            ,	     'Naogaon',	'RS',	'NA');
INSERT INTO @tbl VALUES ('Khulna'            ,	     'Narail',	'KH',	'NR');
INSERT INTO @tbl VALUES ('Dhaka'            ,	     'Narayanganj',	'DA',	'NY');
INSERT INTO @tbl VALUES ('Dhaka'            ,	     'Narsingdi',	'DA',	'NS');
INSERT INTO @tbl VALUES ('Rajshahi'            ,	     'Natore',	'RS',	'NT');
INSERT INTO @tbl VALUES ('Rajshahi'            ,	     'Nawabganj',	'RS',	'NW');
INSERT INTO @tbl VALUES ('Dhaka'            ,	     'Netrakona',	'DA',	'NK');
INSERT INTO @tbl VALUES ('Rangpur'            ,	     'Nilphamari',	'RP',	'NP');
INSERT INTO @tbl VALUES ('Chittagong'            ,	     'Noakhali',	'CG',	'NO');
INSERT INTO @tbl VALUES ('Rajshahi'            ,	     'Pabna',	'RS',	'PB');
INSERT INTO @tbl VALUES ('Rangpur'            ,	     'Panchagarh',	'RP',	'PN');
INSERT INTO @tbl VALUES ('Chittagong'            ,	     'Parbattya Chattagram',	'CG',	'PC');
INSERT INTO @tbl VALUES ('Barisal'            ,	     'Patuakhali',	'BA',	'PT');
INSERT INTO @tbl VALUES ('Barisal'            ,	     'Pirojpur',	'BA',	'PR');
INSERT INTO @tbl VALUES ('Dhaka'            ,	     'Rajbari',	'DA',	'RB');
INSERT INTO @tbl VALUES ('Rajshahi'            ,	     'Rajshahi',	'RS',	'RS');
INSERT INTO @tbl VALUES ('Rangpur'            ,	     'Rangpur',	'RP',	'RP');
INSERT INTO @tbl VALUES ('Khulna'            ,	     'Satkhira',	'KH',	'ST');
INSERT INTO @tbl VALUES ('Dhaka'            ,	     'Shariatpur',	'DA',	'SA');
INSERT INTO @tbl VALUES ('Dhaka'            ,	     'Sherpur',	'DA',	'SP');
INSERT INTO @tbl VALUES ('Rajshahi'            ,	     'Sirajganj',	'RS',	'SR');
INSERT INTO @tbl VALUES ('Sylhet'            ,	     'Sunamganj',	'SY',	'SN');
INSERT INTO @tbl VALUES ('Sylhet'            ,	     'Sylhet',	'SY',	'SL');
INSERT INTO @tbl VALUES ('Dhaka'            ,	     'Tangail',	'DA',	'TA');
INSERT INTO @tbl VALUES ('Rangpur'            ,	     'Thakurgaon',	'RP',	'TH');

SET NOCOUNT OFF

INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) 
	SELECT	DISTINCT @country_id, level_1_nm, level_1_cd
	FROM	@tbl;

-- ======================================================================


INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	level_2_nm, level_2_cd, level_1_address_component_id
	FROM	@tbl	t
		LEFT JOIN	level_1_address_components	l1
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
			);


UPDATE	level_1_address_components
	SET	is_authentic	=	1
WHERE	country_id	=	@country_id;

-- ======================================================================

