BEGIN TRAN;
--ROLLBACK;
--COMMIT;
	
				/*
				   	Script to generate data is ...
							WITH bs AS (
								select	a.country_nm, a.level_1_address_component_nm, a.level_2_address_component_nm, a.level_3_address_component_nm, a.level_2_address_component_id, a.level_3_address_component_id,
										REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (REPLACE (a.level_3_address_component_nm, ' ', ''), '(', ''), ')', ''), '.', ''), '&', ''), '''', ''), ',', ''), '-', '') hash
								from	cdb.view_level_3_address_components	a
								WHERE	current_timestamp	between a.effective_from AND a.effective_till
								AND		a.country_nm	!=	'Canada'
							),
							bas AS (
								select	a.country_nm, a.level_1_address_component_nm, a.level_2_address_component_nm, a.level_3_address_component_nm level_3_nm_1, b.level_3_address_component_nm level_3_nm_2, a.level_3_address_component_id level_3_id_1, b.level_3_address_component_id level_3_id_2
								from	bs	a
									join	bs	b
										ON	(	a.level_2_address_component_id	=	b.level_2_address_component_id
											and	a.level_3_address_component_id	< b.level_3_address_component_id
											and	a.hash = b.hash
											)
							)
							SELECT	a.*
							FROM	bas	a
							where substring (level_3_nm_1, 1, 1) = substring (level_3_nm_2, 1, 1)
							ORDER BY 1, 2, 3, 4, 5
				   */

DECLARE
	@dt		DATE		=	GETDATE(),
	@al		INTEGER,	--	audit_log_id
	@cnt1	INTEGER,
	@cnt2	INTEGER;


DECLARE	@l3_renames	TABLE
	(	l3_id	INTEGER			NOT	NULL	PRIMARY	KEY,
		l3_nm	VARCHAR (40)	NOT	NULL,
		new_nm	VARCHAR (40)	NOT	NULL
	);

DECLARE	@l3_ineffective	TABLE
	(	l3_id	INTEGER			NOT	NULL	PRIMARY	KEY,
		l3_nm	VARCHAR (40)	NOT	NULL
	);

SET @dt = DATEADD (d, -1, @dt);

INSERT INTO	audit_logs
		(	[session_id], [application_id], [user_no], [user_role_id], [operation], [screen_id], [object_id], [operation_dts], [is_consumed]	)
	VALUES
		(	0, 'Script', 1, 'System', 'I', 'rev089', 'Level 3 Address Components', GETDATE(), 0	);
	SET @al	=	SCOPE_IDENTITY ();

--	==================================================
--	Make Ineffective -- Level 3 Address Components
--	==================================================

INSERT	INTO	@l3_ineffective		VALUES	(	1798,		'13 GOLLAPALLE'	),
											(	1800,		'155 KAMMAPALLE'	),
											(	1802,		'64 PEDDUR'	),
											(	5581,		'KODURU KOMALI'	),
											(	17240,		'CHITRAKOTA BODDAVALASA'	),
											(	21870,		'GANIRGRAM PT II'	),
											(	21903,		'HATICHERRA GRANT PT VII'	),
											(	22145,		'SAIDPUR PT II'	),
											(	25134,		'NA ALI MIRIGAON'	),
											(	25656,		'NIZ DHING'	),
											(	28928,		'GAUDARH RUDRANAGAR'	),
											(	33403,		'T.P.COLLEGE MADHEPURA'	),
											(	34979,		'BARA DAUD'	),
											(	38382,		'AMAON BARAON'	),
											(	39614,		'MORWARA I'	),
											(	39615,		'MORWARA II'	),
											(	45470,		'GARH UMARIA'	),
											(	46083,		'KATHIA I'	),
											(	46816,		'GOA -VELHA'	),
											(	47011,		'LOLIEM - POLEM'	),
											(	47571,		'ANKADIA NANA'	),
											(	47592,		'BANTVA DEVLI'	),
											(	47595,		'BARMAN NANA'	),
											(	49678,		'VADAL MOTI'	),
											(	50134,		'DOLARANA VASNA'	),
											(	50196,		'ISANPUR DODIA'	),
											(	52364,		'DEVKI VANSOL'	),
											(	55526,		'ADA HATHROL'	),
											(	55751,		'GORA ANJANA'	),
											(	55976,		'NAVA REVAS'	),
											(	56016,		'PATELNA DHUNDHA'	),
											(	56187,		'VANTDA BAYAD'	),
											(	56209,		'ZANZVA PANAI'	),
											(	56942,		'TIMBARVA SANKRI'	),
											(	58879,		'VALSAD - VANKAL'	),
											(	62480,		'BHANJRARU TISSA'	),
											(	63751,		'YOL JHARER'	),
											(	66822,		'CHHAPAKI KALAN'	),
											(	74237,		'HOSPET CO OPERATIVE COLONY'	),
											(	76734,		'HOLALKERE ROAD CHITRADURGA'	),
											(	77015,		'STATION ROAD CHITRADURGA'	),
											(	86072,		'EDAD IDUKKI'	),
											(	86380,		'ALAKODE KUTTARAMBA'	),
											(	86570,		'KEEZHUR IRITTY'	),
											(	86799,		'PUTHUR PANOOR'	),
											(	88167,		'KALLAI KOZHIKODE'	),
											(	88246,		'KOTANCHERI TAMARACHERI'	),
											(	88474,		'PUTHUR KOTUVALLI'	),
											(	89009,		'PUTHUR PALLIKKAL'	),
											(	89027,		'TAVANUR FEROKE'	),
											(	90308,		'RANNY PAZHAVANGADI'	),
											(	90904,		'KOOTHALI - TVM'	),
											(	90942,		'MADAVOOR PALLICKAL'	),
											(	92750,		'MOHGAON KHURD'	),
											(	92810,		'SAREKHA KOSMI'	),
											(	93773,		'DARGAH E HAKIMI'	),
											(	101594,		'PIPARIA BHOMA'	),
											(	101609,		'SADAK SEONI'	),
											(	101612,		'SAJPANI DHANORA'	),
											(	107598,		'HATTI KH'	),
											(	107656,		'KHARDE BK'	),
											(	107657,		'KHARDE KH'	),
											(	107731,		'MORANE LALING'	),
											(	107774,		'NAVARA NAVARI'	),
											(	107962,		'WAGHADI BK'	),
											(	112864,		'BHAVANI MANDIR TULJAPUR'	),
											(	112943,		'IDA PIDA'	),
											(	115831,		'GURUWAR PETH,TASGAON'	),
											(	116503,		'KANHER AKALE'	),
											(	119102,		'GAUL KHURD'	),
											(	131309,		'REONA UCHA'	),
											(	135023,		'NUHON COLONY ROPAR'	),
											(	135962,		'NOONDRI MENDRATAN'	),
											(	137403,		'DHARVI KALLAN'	),
											(	137565,		'KHARIA KALLAN'	),
											(	137741,		'RANASAR KHURD'	),
											(	138904,		'U-DLIYAS'	),
											(	140254,		'KHUDERA CHARNAN'	),
											(	164379,		'VALLAM TJ'	),
											(	7007,		'MANALA I'	),
											(	14619,		'VANNEL  K '	),
											(	189059,		'UJHAIYA FAKIRPUR'	),
											(	192519,		'DARUL ULOOM DEOBAND'	),
											(	197437,		'SECTOR II BHEL'	),
											(	198145,		'POKHRI CHOPRAKOT'	),
											(	199335,		'BHATWARI DHANARI'	),
											(	199363,		'FOLD DHANARI'	),
											(	199479,		'THATI DHANARI'	),
											(	199727,		'FULKUSMA KHATTAGRAM'	),
											(	199744,		'GHAGRA HALUDKANALI'	),
											(	200085,		'PARKURA ANARA'	),
											(	200100,		'PENCHARA DEULI'	),
											(	200212,		'SUNRI CHITRA'	),
											(	202520,		'ST. MARYS HILL'	),
											(	206596,		'DAKSHINGRAM SABITRI'	),
											(	207023,		'RAIPUR MIRPUR'	),
											(	207072,		'SAHAPUR BARALA'	),
											(	207422,		'HALALPUR KRISHNAPUR'	),
											(	209650,		'BUDGE BUDGE'	),
											(	2109,		'GYARAMPALLEKOTHAPALLE'	),
											(	2358,		'MARKETYARD-PALAMANER'	),
											(	2386,		'MITTOOR-CHITTOOR'	),
											(	9182,		'DHONE-BAZAR'	),
											(	9623,		'NANDIKOTKUR-BAZAR'	),
											(	15067,		'KALIKAVAYABITRAGUNTA'	),
											(	16320,		'BOMMINAIDUVALASA'	),
											(	17317,		'GAJAPATHINAGARAM'	),
											(	2959,		'ANANTHAIAH-GARIPALLE'	),
											(	20993,		'PIPUDIPU'	),
											(	229222,		'Batiamari'	),
											(	229276,		'Garoimari'	),
											(	22048,		'MANIPUR PTI'	),
											(	29200,		'SAKARIRAMNAGAR'	),
											(	31519,		'JOGAPUR-KOTHI'	),
											(	39464,		'HASANPUR RUSERA'	),
											(	44743,		'PV-15'	),
											(	44744,		'PV-26'	),
											(	44745,		'PV-38'	),
											(	44746,		'PV-9'	),
											(	44747,		'PV-92'	),
											(	45326,		'BADEGANTULI'	),
											(	48204,		'BHATAMALMOTI'	),
											(	48361,		'KAPRAMOTA'	),
											(	49548,		'PATNA-MALJI'	),
											(	50002,		'AMRAJINAMUVADA'	),
											(	50198,		'ISANPUR-MOTA'	),
											(	50373,		'NANA-JALUNDRA'	),
											(	50466,		'SAHEBJI-NA-MUVADA'	),
											(	50807,		'JAMKALYANPUR'	),
											(	50812,		'JAMWALI'	),
											(	52245,		'ASHRAM ROAD -NADIAD'	),
											(	52674,		'PORDA-BHATERA'	),
											(	55633,		'BORDITIMBA'	),
											(	57610,		'CHHOTA-UDEPUR'	),
											(	62469,		'BATHRI-BAZAR'	),
											(	64700,		'GHANAHATTI'	),
											(	64908,		'PUJARLI NO.2'	),
											(	68286,		'KENMANKATHI'	),
											(	70693,		'DSE-CHAIBASA'	),
											(	80067,		'BELUR-FORT'	),
											(	80964,		'WEST-NEMMALE'	),
											(	85341,		'MUTTOM-ALLEPPEY'	),
											(	85397,		'PERINGALAMULAKUZHA'	),
											(	85542,		'ANAPPARAKALADY'	),
											(	86118,		'KANJIKUZHI IDUKKI'	),
											(	86551,		'KARAPERAVOOR'	),
											(	86855,		'VADAKKUMBADRAMANTHALI'	),
											(	87074,		'PARAPPA DELAMPADY'	),
											(	87117,		'TIMIRI CHERVATHUR'	),
											(	88052,		'CALICUT ARTS SCIENCE COLLEGE'	),
											(	88119,		'EDAKKAD WEST HILL'	),
											(	88467,		'PUNNUR CHERUPALAM'	),
											(	88705,		'KALADI-MLP'	),
											(	88806,		'MANGALAM-MLP'	),
											(	89008,		'PUTHUR KOTTAKKAL'	),
											(	89977,		'ADUR-KLA'	),
											(	90373,		'VAYALA PARAKODE'	),
											(	92307,		'PARIYARAM WYNAD'	),
											(	101437,		'CHANDORI-KHURD'	),
											(	101539,		'KHUTKHAMARIA'	),
											(	101560,		'MOHGAON-KALA'	),
											(	107704,		'MANDISHIRPUR'	),
											(	118409,		'KOSBAD-HILL'	),
											(	118772,		'MANASMANDIR WARDHA'	),
											(	119642,		'T.BONGMUN'	),
											(	120635,		'KYNTONUMON'	),
											(	121666,		'LUNGLENG S'	),
											(	121668,		'LUNGRANGS'	),
											(	121702,		'TAWIPUI N'	),
											(	121704,		'TAWIPUI(S)'	),
											(	230573,		'Patharkhani'	),
											(	135716,		'DHANMANDI KISHAN GARH'	),
											(	137342,		'BISSUKALLAN'	),
											(	137365,		'CHANDI-KA-PAR'	),
											(	137499,		'JATON-KA-BERA'	),
											(	137680,		'NEHRON-KI-DHANI'	),
											(	138595,		'ITMARIA'	),
											(	138806,		'RAJA-JI-KA-KAREDA'	),
											(	148088,		'BAJAJROAD SIKAR'	),
											(	163009,		'ELANGADU-'	),
											(	163202,		'KARUPPUR-'	),
											(	163901,		'PUTHUR-'	),
											(	164749,		'BOILER PROJECT -'	),
											(	165323,		'ORDNANCE ESTATE -'	),
											(	168472,		'AGARAM -'	),
											(	106,		'CHINCHOLI-B'	),
											(	147,		'DHANORA-B'	),
											(	584,		'TANDUR-A'	),
											(	13003,		'X-ROADS KODAD'	),
											(	177659,		'RAJA-KA-TAJPUR'	),
											(	185447,		'PRATAPPURA'	),
											(	185681,		'DILLA KA-PURA'	),
											(	185942,		'PREMKAPURA'	),
											(	190932,		'KHAIKHERI'	),
											(	198835,		'ATALI -BYASI'	),
											(	200222,		'TAPTADAMDI'	),
											(	202607,		'BAIRAKANPUR'	),
											(	204441,		'WRITERS BUILDING'	),
											(	207106,		'SENDAJAMUR'	),
											(	208355,		'METAL STEEL FACTORY'	);

SET @cnt1 = @@ROWCOUNT;

UPDATE	l3
	SET		effective_till	=	@dt,
			audit_log_id	=	@al
FROM	level_3_address_components	l3
	JOIN	@l3_ineffective	d
		ON	(	l3.level_3_address_component_id	=	d.l3_id
			AND	l3.level_3_address_component_nm	=	d.l3_nm
			);

SET @cnt2 = @@ROWCOUNT;
IF (@cnt1 != @cnt2)
BEGIN
	ROLLBACK;
	SELECT	d.*
	FROM	@l3_ineffective	d
		LEFT JOIN	level_3_address_components	l3
			ON	(	l3.level_3_address_component_id	=	d.l3_id
				AND	l3.level_3_address_component_nm	=	d.l3_nm
				)
	WHERE	l3.level_3_address_component_id	IS	NULL;
	RAISERROR ('Row counts of Level 3 INEFFECTIVE mis-match; should be %d, but update only %d', 16, 1, @cnt1, @cnt2);
	RETURN;
END

PRINT 'Level 3 Ineffective ' + CONVERT (VARCHAR, @cnt1);


SELECT	*
FROM	level_3_address_components
WHERE	audit_log_id	=	@al
ORDER	BY	8, 4, 3;

