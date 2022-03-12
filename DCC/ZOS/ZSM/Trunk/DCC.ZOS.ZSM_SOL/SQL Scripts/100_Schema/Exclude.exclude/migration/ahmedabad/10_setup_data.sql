USE ZSM
GO

BEGIN TRAN

DECLARE
	@eff_from	DATETIME,
	@eff_till	DATETIME

SET @eff_from	=	cONVERT (VARCHAR (11), GetDate(), 106);
SET @eff_till	=	'31-Dec-9999';

-- ====================================================================================================
--	Initiation Places 
-- ====================================================================================================

insert into CDB..initiation_places (place_nm, effective_from, effective_till) values (	'Paror', @eff_from, @eff_till	)
insert into CDB..initiation_places (place_nm, effective_from, effective_till) values (	'Kenya', @eff_from, @eff_till	)


-- ====================================================================================================
--	Districts
-- ====================================================================================================

--ADDING districts not already present in districts_or_cities---

DECLARE
	@gujarat_id			INT

SELECT	@gujarat_id	=	cs.state_id
FROM	CDB..countries cc
	JOIN CDB..states cs ON cs.country_id = cc.country_id AND cs.state_nm = 'Gujarat' and cc.country_nm = 'India'
IF (@@ROWCOUNT != 1)
	RAISERROR ('Gujarat State''s ID could not be found', 16, 1);
	
insert into CDB..districts_or_cities ( district_cd, district_nm, state_id, effective_from, effective_till) values ('ANND', 'Anand',  @gujarat_id, @eff_from, @eff_till	)
insert into CDB..districts_or_cities ( district_cd, district_nm, state_id, effective_from, effective_till) values ('TP', 'Tapi',  @gujarat_id, @eff_from, @eff_till	)
insert into CDB..districts_or_cities ( district_cd, district_nm, state_id, effective_from, effective_till) values ('MS', 'Mahisagar',  @gujarat_id, @eff_from, @eff_till	)

UPDATE CDB..districts_or_cities			SET	district_nm	=	'Mehsana'
WHERE	state_id	=	@gujarat_id AND		district_nm	=	'Mahesana';

UPDATE CDB..districts_or_cities			SET	district_nm	=	'Panchmahal'
WHERE	state_id	=	@gujarat_id AND		district_nm	=	'Panchmahals';

-- ====================================================================================================
--	Post Offices (New)
-- ====================================================================================================


INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'Ahmedabad',	'AHMDBD'		FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'Ahmedabad'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'AMRAIVADI',	'AMRWD'			FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'Ahmedabad'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'BAPUNAGAR',	'BPNGR'			FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'Ahmedabad'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'BAVLA',	'BVL'				FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'Ahmedabad'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'BEHRAMPURA',	'BHRMPR'		FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'Ahmedabad'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'BOPAL',	'BPL'				FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'Ahmedabad'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'CANTONMENT',	'CNTNMNT'		FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'Ahmedabad'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'CHANDLODIA',	'CHNDLD'		FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'Ahmedabad'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'CIVIL HOSPITAL',	'CVLHSPTL'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'Ahmedabad'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'DARIYAPUR',	'DRPR'			FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'Ahmedabad'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'DASCROI',	'DXNSCTY'			FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'Ahmedabad'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'DHANDHUKA',	'DHNDHK'		FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'Ahmedabad'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'DHOLKA',	'DHLK'				FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'Ahmedabad'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'DETROJ',	'DTRJ'				FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'Ahmedabad'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'DUDHESWAR',	'DDHSHWR'		FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'Ahmedabad'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'ELLISBRIDGE',	'ELLSBRDG'		FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'Ahmedabad'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'GANDHI ASHRAM',	'GNDHSHRM'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'Ahmedabad'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'GHODASAR',	'GHDSR'			FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'Ahmedabad'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'Ghatlodia',	'GHTLD'			FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'Ahmedabad'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'GOTA',	'GT'				FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'Ahmedabad'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'ISANPUR',	'ISNPR'				FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'Ahmedabad'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'JANTANAGAR',	'JNTNGR'		FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'Ahmedabad'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'JIVRAJPARK',	'JVRJPRK'		FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'Ahmedabad'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'KHODIYAR NAGAR',	'KHDYRNGR'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'Ahmedabad'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'Krishnanagar',	'KRSHNNGR'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'Ahmedabad'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'LAL DARWAJA',	'LLDRWJ'		FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'Ahmedabad'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'MEMNAGAR',	'MMNGR'			FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'Ahmedabad'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'MEGHANINAGAR',	'MGHNNGR'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'Ahmedabad'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'NARODA',	'NRD'				FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'Ahmedabad'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'Naranpura',	'NRNPRVSTR'		FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'Ahmedabad'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'Navjivan',	'NVJVN'			FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'Ahmedabad'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'NANA CHILODA',	'NNCHLD'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'Ahmedabad'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'NAROL',	'NRL'				FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'Ahmedabad'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'ODHAV',	'ODHV'				FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'Ahmedabad'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'PALDI',	'PLD'				FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'Ahmedabad'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'RANIP',	'RNP'				FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'Ahmedabad'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'RAILWAY COLONY',	'RLWYCLNY'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'Ahmedabad'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'RAJPUR GOMTIPUR',	'RJPRGMTPR'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'Ahmedabad'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'RAKHIAL',	'RKHL'				FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'Ahmedabad'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'SARASPUR',	'SRSPR'			FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'Ahmedabad'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'Sabarmati',	'SBRMT'			FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'Ahmedabad'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'SAIJPURBOGHA',	'SJPRBGH'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'Ahmedabad'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'SHAHALAM ROZA',	'SHHLMRZ'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'Ahmedabad'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'SHAPUR',	'SHHPR'				FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'Ahmedabad'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'SOLA',	'SL'				FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'Ahmedabad'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'SARKHEJ',	'SRKHJ'				FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'Ahmedabad'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'THALTEJ',	'THLTJ'				FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'Ahmedabad'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'VADAJ',	'VDJ'				FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'Ahmedabad'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'VATVA',	'VTV'				FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'Ahmedabad'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'VEJALPUR',	'VJLPR'			FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'Ahmedabad'

	print '...... Ahmedabad complete'

INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'ANAND',	'ANND'		FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'ANAND'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'ANKLAV',	'ANKLV'		FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'ANAND'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'UMETHA',	'UMTA'		FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'ANAND'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'ANKLESHWAR',	'ANKLSHWR'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'BHARUCH'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'BHARUCH',	'BHRCH'			FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'BHARUCH'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'CHASVAD',	'CHSVD'			FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'BHARUCH'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'BHAVNAGAR',	'BHVNGR'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'BHAVNAGAR'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'BOTAD',	'BTD'			FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'BHAVNAGAR'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'AMBAJI',	'AMBJ'		FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'BANASKANTHA'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'CHHAPI',	'CHHP'		FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'BANASKANTHA'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'DEESA',	'DSA'		FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'BANASKANTHA'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'DHOTA',	'DHT'		FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'BANASKANTHA'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'PALANPUR',	'PLNPR'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'BANASKANTHA'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'VADGAM',	'VDGM'		FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'BANASKANTHA'

	print '...... Staring Dahod'

INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'DAHOD',	'DHD'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'DAHOD'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'DUDHIA',	'DDH'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'DAHOD'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'GARBADA',	'GRBD'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'DAHOD'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'GULTORA',	'GLTR'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'DAHOD'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'ZALOD',	'JHLD'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'DAHOD'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'KHAREDI',	'KHRD'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'DAHOD'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'LIMDI',	'LMD'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'DAHOD'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'LIMKHEDA',	'LMKHD'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'DAHOD'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'MANDER',	'MNDR'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'DAHOD'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'NAVAGAM',	'NVGM'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'DAHOD'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'PAVDI',	'PVD'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'DAHOD'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'Anodia',	'AND'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'GANDHI NAGAR'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'DEHGAM',	'DHGM'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'GANDHI NAGAR'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'KALOL',	'KLL'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'GANDHI NAGAR'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'MANSA',	'MNS'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'GANDHI NAGAR'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'PANSAR',	'PNSR'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'GANDHI NAGAR'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'GODHRA',	'GHDR'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'GODHRA'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'JAMNAGAR H.O.',	'JMNGR'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'JAMNAGAR'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'JUNAGADH',	'JNGDH'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'JUNAGADH'

	print '...... Staring Kheda'

INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'KAPADVANJ',	'KPDVNJ'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'KHEDA'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'KATHLAL',	'KTHLL'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'KHEDA'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'KHEDA',	'KHDYRNGR'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'KHEDA'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'ANJAR',	'ANJR'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'KACHCHH'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'BHUJ',	'BHJ'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'KACHCHH'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'NALIYA',	'NLY'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'KACHCHH'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'BHANDU',	'BHND'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'MEHSANA'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'BECHARAJI',	'BCHRJ'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'MEHSANA'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'KADI',	'KD'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'MEHSANA'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'KAHODA',	'KHD'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'MEHSANA'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'KHERALU',	'KHRL'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'MEHSANA'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'MEHSANA .IND.ESTATE',	'MHSNIE'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'MEHSANA'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'SURAJ',	'SRJ'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'MEHSANA'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'UNJHA',	'UNJH'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'MEHSANA'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'VADNAGAR',	'VDNGR'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'MEHSANA'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'VIJAPUR',	'VJPR'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'MEHSANA'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'VISNAGAR',	'VSNGR'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'MEHSANA'

INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'Khanpur',	'KHNP'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'Mahisagar'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'Babaliya',	'VSNGR'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'Mahisagar'


	print '...... Staring Navsari'

INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'GANDEVI',	'GNDVI'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'NAVSARI'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'JALALPORE','JLLPR'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'NAVSARI'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'Maroli Bazar','MRLBZ'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'NAVSARI'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'NADIAD',	'NDD'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'KHEDA'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'BALISNA',	'BLSN'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'PATAN'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'CHANSMA',	'CHNSM'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'PATAN'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'PATAN',	'PTN'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'PATAN'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'RADHANPUR',	'RDHNPR'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'PATAN'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'SANTALPUR',	'SNTLPR'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'PATAN'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'SIDDHPUR',	'SDDHPR'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'PATAN'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'VARAHI',	'VRH'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'PATAN'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'BABALIA',	'BBL'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'PANCHMAHAL'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'GODHRA',	'GDHR'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'PANCHMAHAL'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'LUNAVADA',	'LNVD'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'PANCHMAHAL'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'PANCHMAHAL',	'PNCHMHL'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'PANCHMAHAL'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'MORBI',	'MRB'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'RAJKOT'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'HIMATNAGAR',	'HMTNGR'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'SABARKANTHA'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'IDAR',	'IDR'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'SABARKANTHA'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'MODASA',	'MDS'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'SABARKANTHA'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'PRANTIJ',	'PRNTJ'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'SABARKANTHA'

	print '...... Staring Surat'

INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'BARDOLI',	'BRDL'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'SURAT'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'BHESTAN',	'BHSTN'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'SURAT'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'BAJIPURA',	'BJPR'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'SURAT'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'GHALA',	'GHL'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'SURAT'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'KAMREJ',	'KMRJ'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'SURAT'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'KATARGAM',	'KTRGM'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'SURAT'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'KHOLWAD',	'KHLVD'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'SURAT'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'MANDVI',	'MNDV'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'SURAT'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'NANPURA',	'NNPR'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'SURAT'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'OLPAD',	'OLPD'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'SURAT'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'RANDER',	'RNDR'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'SURAT'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'SACHIN',	'SCHN'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'SURAT'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'SANGRAMPUR',	'SNGRMPR'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'SURAT'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'SYADLA',	'SYDL'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'SURAT'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'UKAI',	'UKAI'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'SURAT'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'SONGADH',	'SNG'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'TAPI'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'VARACHHA ROAD',	'VRCHHRD'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'SURAT'

	print '...... Surat  complete'

INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'LIMBDI',	'LMBD'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'SURENDRANAGAR'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'SURENDRANAGAR H.O.',	'SRNDRNGR'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'SURENDRANAGAR'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'AJWA ROAD',	'AJWRD'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'VADODARA'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'AKOTA',	'AKT'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'VADODARA'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'ATLADRA',	'ATLDR'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'VADODARA'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'FATEHGANJ',	'FTHGNJ'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'VADODARA'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'GOTRI ROAD',	'GTR'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'VADODARA'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'KARELIBAUG',	'KRL'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'VADODARA'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'MAKARPURA',	'MKRPR'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'VADODARA'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'MANJALPUR',	'MNJLPR'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'VADODARA'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'PRATAPNAGAR',	'PRTPNGR'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'VADODARA'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'SAYAJIGANJ',	'SYJGNJ'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'VADODARA'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'SAMA ROAD',	'SM'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'VADODARA'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'TARSALI',	'TRSL'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'VADODARA'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'WAGHODIA ROAD',	'VGHD'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'VADODARA'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'ATUL',	'ATL'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'VALSAD'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'DUMLAV',	'DMLV'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'VALSAD'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'JOGVEL',	'JGVL'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'VALSAD'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'KANJAN RANCHHOD',	'KNJNRNCHHD'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'VALSAD'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'MOTA PONDHA',	'MTPNDH'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'VALSAD'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'NAVERA',	'NVR'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'VALSAD'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'PARDI PARIYA',	'PRDIPR'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'VALSAD'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'SALVAV',	'SLVV'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'VALSAD'
INSERT INTO post_offices_or_cities	(	district_id, post_office_or_city_nm, post_office_or_city_cd	) 
	SELECT	district_or_city_id, 'UMBERGAON',	'UMBRGN'	FROM	CDB..districts_or_cities	WHERE	state_id	=	@gujarat_id	AND	district_nm	=		'VALSAD'


-- ====================================================================================================
--	Post Offices (Existing).... changing their names
-- ====================================================================================================

UPDATE	p
	SET	post_office_or_city_nm	=	'Vadodara'
FROM	post_offices_or_cities	p
	JOIN	CDB..districts_or_cities	od
		ON	(	p.district_id	=	od.district_or_city_id	AND	od.state_id =	@gujarat_id	AND	p.post_office_or_city_nm	=	'Baroda'	AND	od.district_nm	=	'Vadodara'	)

IF (@@ROWCOUNT != 1)
	RAISERROR ('Baroda could not be renamed', 16, 1);

-- ====================================================================================================
--	Post Offices (Existing).... changing their districts
-- ====================================================================================================

UPDATE	p
	SET	district_id	=	nd.district_or_city_id
FROM	post_offices_or_cities	p
	JOIN	CDB..districts_or_cities	od
		ON	(	p.district_id	=	od.district_or_city_id	AND	od.state_id =	@gujarat_id	AND	p.post_office_or_city_nm	=	'Chandkheda'	AND	od.district_nm	=	'Ahmedabad'	)
	JOIN	CDB..districts_or_cities	nd
		ON	(	nd.state_id =	@gujarat_id	ANd	nd.district_nm	=	'Gandhi Nagar')
IF (@@ROWCOUNT != 1)
	RAISERROR ('District of Chandkheda could not be changed', 16, 1);

UPDATE	p
	SET	district_id	=	nd.district_or_city_id
FROM	post_offices_or_cities	p
	JOIN	CDB..districts_or_cities	od
		ON	(	p.district_id	=	od.district_or_city_id	AND	od.state_id =	@gujarat_id	AND	p.post_office_or_city_nm	=	'Gandhi Nagar'	AND	od.district_nm	=	'Ahmedabad'	)
	JOIN	CDB..districts_or_cities	nd
		ON	(	nd.state_id =	@gujarat_id	ANd	nd.district_nm	=	'Gandhi Nagar')
IF (@@ROWCOUNT != 1)
	RAISERROR ('District of Gandhi Nagar could not be changed', 16, 1);

