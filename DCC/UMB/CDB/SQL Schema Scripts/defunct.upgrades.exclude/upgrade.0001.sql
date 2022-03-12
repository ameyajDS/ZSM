USE CDB
GO


CREATE	TABLE	gst_states
(
 		--	This column contains the state number as given by GST Council
	gst_state_no			CHAR (2)				NOT	NULL	CONSTRAINT	GSTRates_PK_GSTStateNo
																	PRIMARY	KEY	CLUSTERED,

		--	Corresponding State ID in Level 1 Address Components
	level_1_component_id	address_component_id	NOT NULL	CONSTRAINT	GSTRates_FK_Level1AddressComponentID
																	REFERENCES	level_1_address_components,

		--	This column need to be dropped when we get out of older structure of address components (states, districts, post_offices)
    state_id				state_id				NOT NULL	CONSTRAINT	GSTRates_FK_StateID
																	REFERENCES	states,
	effective_from_dt		DATE					NOT	NULL	CONSTRAINT	GSTRates_DF_EffectiveFromDate
																	DEFAULT	GetDate(),
	effective_till_dt		DATE					NOT	NULL	CONSTRAINT	GSTRates_DF_EffectiveTillDate
																	DEFAULT	'31-Dec-9999',

		CONSTRAINT	GSTRates_UK_GSTStateNo_EffectiveFromDate
			UNIQUE	NONCLUSTERED	(	gst_state_no, effective_from_dt	)
)
GO

--	====================================================================================================
--	Data fixes in states
--												We have two Andaman & Nicobar Islands
--	====================================================================================================
							---	Disable one
UPDATE	states
	SET	effective_till	=	'01-Jun-2018'
WHERE	state_id	=	751
AND		state_nm	=	'Andeman & Nicobar Islands';
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('State Andeman & Nicobar Islands NOT FOUND; .... exiting ...', 16, 1);
	RETURN;
END

							--	Correc the other one
UPDATE	states
	SET	state_nm	=	'ANDAMAN & NICOBAR ISLANDS'
WHERE	state_id	=	743
AND		state_nm	=	'ANDAMAN & NICOBAR';
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('State ANDAMAN & NICOBAR NOT FOUND; .... exiting ...', 16, 1);
	RETURN;
END

--	====================================================================================================
--	Create states / level 1 components that do not exist
--	====================================================================================================

DECLARE
	@india_id			INT,
	@state_id_dadra_n_h	INT,
	@l1c_id_chandigarh	INT,
	@l1c_id_daman_diu	INT,
	@l1c_id_dadra_n_h	INT,
	@l1c_id_lakshsd		INT,
	@l1c_id_andaman_n	INT;

SELECT	@india_id	=	country_id	FROM	countries	WHERE	country_nm =	'India';
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('State ANDAMAN & NICOBAR NOT FOUND; .... exiting ...', 16, 1);
	RETURN;
END

INSERT	INTO	states	( state_cd, state_nm, country_id )	VALUES	( 'DNH', 'Dadra and Nagar Haveli', @india_id	);
SET @state_id_dadra_n_h	=	SCOPE_IDENTITY();

INSERT INTO	level_1_address_components ( level_1_address_component_cd, level_1_address_component_nm, country_id, is_authentic )
		VALUES	(	'CH', 'Chandigarh', @india_id, 1	);
SET	@l1c_id_chandigarh	=	SCOPE_IDENTITY();

INSERT INTO	level_1_address_components ( level_1_address_component_cd, level_1_address_component_nm, country_id, is_authentic )
		VALUES	(	'DD', 'Daman and Diu', @india_id, 1	);
SET	@l1c_id_daman_diu	=	SCOPE_IDENTITY();

INSERT INTO	level_1_address_components ( level_1_address_component_cd, level_1_address_component_nm, country_id, is_authentic )
		VALUES	(	'DNH', 'Dadra and Nagar Haveli', @india_id, 1	);
SET	@l1c_id_dadra_n_h	=	SCOPE_IDENTITY();

INSERT INTO	level_1_address_components ( level_1_address_component_cd, level_1_address_component_nm, country_id, is_authentic )
		VALUES	(	'LD', 'Lakshwadeep', @india_id, 1	);
SET	@l1c_id_lakshsd	=	SCOPE_IDENTITY();

INSERT INTO	level_1_address_components ( level_1_address_component_cd, level_1_address_component_nm, country_id, is_authentic )
		VALUES	(	'AN', 'Andaman and Nicobar Islands', @india_id, 1	);
SET	@l1c_id_andaman_n	=	SCOPE_IDENTITY();


--	====================================================================================================
--	Set-up data for GST States
--	====================================================================================================

INSERT INTO	gst_states	( gst_state_no, level_1_component_id, state_id )	VALUES	(	'01',	12,		130	);		--	JAMMU AND KASHMIR
INSERT INTO	gst_states	( gst_state_no, level_1_component_id, state_id )	VALUES	(	'02',	11,		129	);		--	HIMACHAL PRADESH
INSERT INTO	gst_states	( gst_state_no, level_1_component_id, state_id )	VALUES	(	'03',	24,		121	);		--	PUNJAB
INSERT INTO	gst_states	( gst_state_no, level_1_component_id, state_id )	VALUES	(	'04',	@l1c_id_chandigarh,	752	);		--	CHANDIGARH
INSERT INTO	gst_states	( gst_state_no, level_1_component_id, state_id )	VALUES	(	'05',	31,		109	);		--	UTTARAKHAND
INSERT INTO	gst_states	( gst_state_no, level_1_component_id, state_id )	VALUES	(	'06',	10,		134	);		--	HARYANA
INSERT INTO	gst_states	( gst_state_no, level_1_component_id, state_id )	VALUES	(	'07',	7,		108	);		--	DELHI
INSERT INTO	gst_states	( gst_state_no, level_1_component_id, state_id )	VALUES	(	'08',	25,		122	);		--	RAJASTHAN
INSERT INTO	gst_states	( gst_state_no, level_1_component_id, state_id )	VALUES	(	'09',	30,		114	);		--	UTTAR  PRADESH
INSERT INTO	gst_states	( gst_state_no, level_1_component_id, state_id )	VALUES	(	'10',	5,		132	);		--	BIHAR
INSERT INTO	gst_states	( gst_state_no, level_1_component_id, state_id )	VALUES	(	'11',	26,		119	);		--	SIKKIM
INSERT INTO	gst_states	( gst_state_no, level_1_component_id, state_id )	VALUES	(	'12',	3,		137	);		--	ARUNACHAL PRADESH
INSERT INTO	gst_states	( gst_state_no, level_1_component_id, state_id )	VALUES	(	'13',	21,		125	);		--	NAGALAND
INSERT INTO	gst_states	( gst_state_no, level_1_component_id, state_id )	VALUES	(	'14',	18,		128	);		--	MANIPUR
INSERT INTO	gst_states	( gst_state_no, level_1_component_id, state_id )	VALUES	(	'15',	20,		112	);		--	MIZORAM
INSERT INTO	gst_states	( gst_state_no, level_1_component_id, state_id )	VALUES	(	'16',	28,		118	);		--	TRIPURA
INSERT INTO	gst_states	( gst_state_no, level_1_component_id, state_id )	VALUES	(	'17',	19,		127	);		--	MEGHLAYA
INSERT INTO	gst_states	( gst_state_no, level_1_component_id, state_id )	VALUES	(	'18',	4,		136	);		--	ASSAM
INSERT INTO	gst_states	( gst_state_no, level_1_component_id, state_id )	VALUES	(	'19',	32,		115	);		--	WEST BENGAL
INSERT INTO	gst_states	( gst_state_no, level_1_component_id, state_id )	VALUES	(	'20',	13,		107	);		--	JHARKHAND
INSERT INTO	gst_states	( gst_state_no, level_1_component_id, state_id )	VALUES	(	'21',	22,		120	);		--	ODISHA
INSERT INTO	gst_states	( gst_state_no, level_1_component_id, state_id )	VALUES	(	'22',	6,		110	);		--	CHATTISGARH
INSERT INTO	gst_states	( gst_state_no, level_1_component_id, state_id )	VALUES	(	'23',	16,		123	);		--	MADHYA PRADESH
INSERT INTO	gst_states	( gst_state_no, level_1_component_id, state_id )	VALUES	(	'24',	9,		133	);		--	GUJARAT
INSERT INTO	gst_states	( gst_state_no, level_1_component_id, state_id )	VALUES	(	'25',	@l1c_id_daman_diu,	753	);		--	DAMAN AND DIU
INSERT INTO	gst_states	( gst_state_no, level_1_component_id, state_id )	VALUES	(	'26',	@l1c_id_dadra_n_h,	@state_id_dadra_n_h	);		--	DADRA AND NAGAR HAVELI
INSERT INTO	gst_states	( gst_state_no, level_1_component_id, state_id )	VALUES	(	'27',	17,		124	);		--	MAHARASHTRA

																												--	ANDHRA PRADESH(BEFORE DIVISION)
INSERT INTO	gst_states	( gst_state_no, level_1_component_id, state_id, effective_from_dt, effective_till_dt )
																			VALUES	(	'28',	1,		135, '01-Jun-2018', '10-Jun-2018'	);

INSERT INTO	gst_states	( gst_state_no, level_1_component_id, state_id )	VALUES	(	'29',	14,		131	);		--	KARNATAKA
INSERT INTO	gst_states	( gst_state_no, level_1_component_id, state_id )	VALUES	(	'30',	8,		111	);		--	GOA
INSERT INTO	gst_states	( gst_state_no, level_1_component_id, state_id )	VALUES	(	'31',	@l1c_id_lakshsd,	755	);		--	LAKSHWADEEP
INSERT INTO	gst_states	( gst_state_no, level_1_component_id, state_id )	VALUES	(	'32',	15,		126	);		--	KERALA
INSERT INTO	gst_states	( gst_state_no, level_1_component_id, state_id )	VALUES	(	'33',	27,		117	);		--	TAMIL NADU
INSERT INTO	gst_states	( gst_state_no, level_1_component_id, state_id )	VALUES	(	'34',	23,		113	);		--	PUDUCHERRY
INSERT INTO	gst_states	( gst_state_no, level_1_component_id, state_id )	VALUES	(	'35',	@l1c_id_andaman_n,	743	);		--	ANDAMAN AND NICOBAR ISLANDS
INSERT INTO	gst_states	( gst_state_no, level_1_component_id, state_id )	VALUES	(	'36',	4107,	815	);		--	TELANGANA
INSERT INTO	gst_states	( gst_state_no, level_1_component_id, state_id )	VALUES	(	'37',	1,		135	);		--	ANDHRA PRADESH (NEW)

--	====================================================================================================
GO
