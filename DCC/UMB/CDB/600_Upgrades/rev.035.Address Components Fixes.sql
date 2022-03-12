
-- Fixes in Address components

DECLARE
	@dt	DATETIME	=	'02 Jun 2021'

		--	Incorrect spelling in Level 3 components which differ from the same name of Level 2 Component Name
		--	and some have been invalidated which have similar spellings to another Level 3 Component Name under the same Level 2 Component
UPDATE	level_3_address_components
	SET	effective_till	=	@dt
WHERE	level_3_address_component_id	IN
			--			AIZAWL, ALAPUZHA, AURANAGABAD, BADGAM, BANK, BEMETRA, BHANDARAOF, CHURA CHANDPUR, DAVANAGERE, DAVANAGERE CITY 
				(	121282, 85137, 27186, 65887,	27521, 225367, 106264, 119662,		78060, 78061,
			--			DHARMAPURI COLLECTOR, DHARMAPURI F, DHARMAPURI PUB. OFFI, FEROZEPUR, HISSAR, JAHANABAD, KANNIYAKUMARI, KASARAGOD RS, KASARGOD, KHADOL/
					152781,	152783, 152785, 131503, 60012, 31774, 154909, 86973,		225403, 52503,
			--			KHADA, KHUSHI NAGAR, KULU, MARAJGANJ, MOHINDERGARH, MALAPURAM, MAMMIT, MARIGAON, NAWADHA, RAEBARELY
					52498, 187922, 63972, 188645,	61127, 88797, 225426, 225355,		36341, 192156,
			--			RAEBARELYKTY, RAMGARH TIKARI, RAJ SAMAND, RAJAURI, RAMNAGAR, RAMANATHAPURAM W, RAMANATHAPURAM BUS ST, RAMANATHAPURAM BAZ, SALEM STEEL PL, SALEM SO
					192155, 192170, 147438, 67459,	225396, 160136, 160133, 160131,		161193, 161191,
			--			SALEM SECOND AGRAHA, SALEM PENSION LI, SALEM NO, SALEM F, SALEM E, SALEM DT.BOARD BUILDI, SALEM DT. COURT BUILDI, SALEM BAZ, SALEM A.R. LI, SALEM C
					161189, 161188, 161185, 161183,	161180, 161178, 161177, 161173,		161171,	161169,
			--			SAMBA., SAWAIMADHOPUR, SERAIKELA, SHAIKHPURA, SHRAWASTI, SRAWASTI, SIBSAGAR, SONEPAT, SRI BIJEYNAGAR, SUNDERGARH
					67562, 147993, 71905, 40531,	225497, 193434, 26430, 62127,		141907, 130205,
			--			TAMENCLONG, TOWANG, ZIMITHANG, LHOV, GISHU, THIRUCHIRAPPALLI, TIRUCHIRAPPA, UJJAINIA,	VELLORE SUGAR MI, VELLORE SO,
					120296, 21168, 21170, 21160,	21155, 165762, 165807, 103405,		169940, 169942,
			--			VELLORE MAR, VELLORE F, VELLORE COLLECTOR, VELLORE CANTONM, VELLORE BAZ, VIJAYANAGARAM, VIJAYARAMAPURAM, VIZIANAGRAM, VISAKHA PATNAM, VIZAGAPATNAM
					169944, 169946, 169949, 169951,	169953, 18046, 18047, 18056,		18934, 18940,
			--			VISALAKSHINAGAR
					18939
				);


	--	===========================================
	--	Level 2 Address Components Name corrections
	--	===========================================

	PRINT	' BARA BANKI'
UPDATE	level_2_address_components
	SET	level_2_address_component_nm	=	'BARABANKI'			
WHERE	level_2_address_component_id	=	577;

	PRINT	' BARAMULA'
UPDATE	level_2_address_components
	SET	level_2_address_component_nm	=	'BARAMULLA'			
WHERE	level_2_address_component_id	=	207;

	PRINT	' BEMETRA'
UPDATE	level_2_address_components
	SET	level_2_address_component_nm	=	'BEMETARA'			
WHERE	level_2_address_component_id	=	119;

	PRINT	' CHICKMAGALUR'
UPDATE	level_2_address_components
	SET	level_2_address_component_nm	=	'CHIKMAGALUR'		
WHERE	level_2_address_component_id	=	253;

	PRINT	' DAVANAGERE'
UPDATE	level_2_address_components
	SET	level_2_address_component_nm	=	'DAVANGERE'			
WHERE	level_2_address_component_id	=	257;

	PRINT	' DINDIGUL-ANNA'
UPDATE	level_2_address_components
	SET	level_2_address_component_nm	=	'DINDIGUL'			
WHERE	level_2_address_component_id	=	526;

	PRINT	' JAHANABAD'
UPDATE	level_2_address_components
	SET	level_2_address_component_nm	=	'JEHANABAD'			
WHERE	level_2_address_component_id	=	83;

	PRINT	' KHUSHI NAGAR'
UPDATE	level_2_address_components
	SET	level_2_address_component_nm	=	'KUSHINAGAR'		
WHERE	level_2_address_component_id	=	610;

	PRINT	' KULU'
UPDATE	level_2_address_components
	SET	level_2_address_component_nm	=	'KULLU'				
WHERE	level_2_address_component_id	=	198;

	PRINT	' MAMMIT'
UPDATE	level_2_address_components
	SET	level_2_address_component_nm	=	'MAMIT'				
WHERE	level_2_address_component_id	=	409;

	PRINT	' MARIGAON'
UPDATE	level_2_address_components
	SET	level_2_address_component_nm	=	'MORIGAON'			
WHERE	level_2_address_component_id	=	59;

	PRINT	' RAJSAMAND'
UPDATE	level_2_address_components
	SET	level_2_address_component_nm	=	'RAJSAMAND'			
WHERE	level_2_address_component_id	=	510;

	PRINT	' RAJAURI'
UPDATE	level_2_address_components
	SET	level_2_address_component_nm	=	'RAJOURI'			
WHERE	level_2_address_component_id	=	218;

	PRINT	' RAMANAGAR'
UPDATE	level_2_address_components
	SET	level_2_address_component_nm	=	'RAMANAGARA'		
WHERE	level_2_address_component_id	=	269;

	PRINT	' RAMANAGAR'
UPDATE	level_2_address_components
	SET	level_2_address_component_nm	=	'SERAIKELA KHARSWAN'
WHERE	level_2_address_component_id	=	244;

	PRINT	' SIBSAGAR'
UPDATE	level_2_address_components
	SET	level_2_address_component_nm	=	'SIVASAGAR'			
WHERE	level_2_address_component_id	=	63;

	PRINT	' SONEPAT'
UPDATE	level_2_address_components
	SET	level_2_address_component_nm	=	'SONIPAT'			
WHERE	level_2_address_component_id	=	161;

	PRINT	' THIRUCHIRAPPALLI'
UPDATE	level_2_address_components
	SET	level_2_address_component_nm	=	'TIRUCHIRAPPALLI'	
WHERE	level_2_address_component_id	=	547;

	PRINT	' VIJAYANAGARAM'
UPDATE	level_2_address_components
	SET	level_2_address_component_nm	=	'VIZIANAGARAM'		
WHERE	level_2_address_component_id	=	20;


	--	===========================================
	--	Level 3 Address Components Name corrections
	--	===========================================

UPDATE	level_3_address_components
	SET	level_3_address_component_nm	=	'HISAR CANTT'				-- HISSAR CANTT
WHERE	level_3_address_component_id	=	60013;

UPDATE	level_3_address_components
	SET	level_3_address_component_nm	=	'MALAPPURAM CIVIL STATION'	-- MALAPURAM CIVIL STATION
WHERE	level_3_address_component_id	=	88798;

UPDATE	level_3_address_components
	SET	level_3_address_component_nm	=	'RAMANAGARAM'				-- RAMANAGARA
WHERE	level_3_address_component_id	=	83237;

UPDATE	level_3_address_components
	SET	level_3_address_component_nm	=	'SRI GANGANAGAR'			-- SRIGANGANAGAR
WHERE	level_3_address_component_id	=	141909;

UPDATE	level_3_address_components
	SET	level_3_address_component_nm	=	'SRI GANGANAGAR RS'			-- SRIGANGANAGAR RS
WHERE	level_3_address_component_id	=	141910;

UPDATE	level_3_address_components
	SET	level_3_address_component_nm	=	'SUNDARGARH COURT'			-- SUNDERGARH COURT
WHERE	level_3_address_component_id	=	130206;

UPDATE	level_3_address_components
	SET	level_3_address_component_nm	=	'UDHAM SINGH NAGAR'			-- UDHAMSINGH NAGAR
WHERE	level_3_address_component_id	=	199309;


	--	=============================================================================
	--	Fatehgarh district in UP is invalid, and thus it's Level 3 Components as well
	--	=============================================================================

UPDATE	level_3_address_components
	SET	effective_till	=	@dt
WHERE	level_2_address_component_id	=	590;		---	Fatehgarh
			
UPDATE	level_2_address_components
	SET	effective_till	=	@dt
WHERE	level_2_address_component_id	=	590;		---	Fatehgarh


