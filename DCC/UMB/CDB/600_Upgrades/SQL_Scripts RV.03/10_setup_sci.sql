/* ==================================================================================
    Source File		:	setup_cdb.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Sun Aug 10, 2014
    Module ID		:	CDB
    Language		:	TRANSACT-SQL
    Last updated	:	24-Aug-2014
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Set-up data for CDB which is required for SCI migration
    ==================================================================================
								   									  Revision History
    ----------------------------------------------------------------------------------
		10, 24-Aug-2014 : JL
			* Initial version
    ==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO


-- ====================================================================================================
--	Change of names of Districts
-- ====================================================================================================

UPDATE	l2
	SET	level_2_address_component_nm	=	'SHAHEED BHAGAT SINGH NAGAR (NAWAN SHAHR)'
FROM	level_2_address_components	l2
	JOIN	level_1_address_components	l1
		ON	(	level_1_address_component_nm	=	'Punjab'
			AND	level_2_address_component_nm	=	'Nawanshahr'
			AND	l1.level_1_address_component_id	=	l2.level_1_address_component_id
			);

-- ====================================================================================================

UPDATE	l2
	SET	level_2_address_component_nm	=	'GANGANAGAR (SRI GANGANAGAR)'
FROM	level_2_address_components	l2
	JOIN	level_1_address_components	l1
		ON	(	level_1_address_component_nm	=	'Rajasthan'
			AND	level_2_address_component_nm	=	'Ganganagar'
			AND	l1.level_1_address_component_id	=	l2.level_1_address_component_id
			);

-- ====================================================================================================

UPDATE	l2
	SET	level_2_address_component_nm	=	'J.P. NAGAR (AMROHA)'
FROM	level_2_address_components	l2
	JOIN	level_1_address_components	l1
		ON	(	level_1_address_component_nm	=	'Uttar Pradesh'
			AND	level_2_address_component_nm	=	'J.P.NAGAR'
			AND	l1.level_1_address_component_id	=	l2.level_1_address_component_id
			);

-- ====================================================================================================

UPDATE	l2
	SET	level_2_address_component_nm	=	'SANT RAVIDAS NAGAR (BHADOHI)'
FROM	level_2_address_components	l2
	JOIN	level_1_address_components	l1
		ON	(	level_1_address_component_nm	=	'Uttar Pradesh'
			AND	level_2_address_component_nm	=	'SANT RAVIDAS NAGAR'
			AND	l1.level_1_address_component_id	=	l2.level_1_address_component_id
			);


-- ====================================================================================================
--	New Districts, that do not exist
-- ====================================================================================================

DELETE	l2
FROM	level_2_address_components	l2
	JOIN	level_1_address_components	l1
		ON	(	level_1_address_component_nm	=	'Chhattisgarh'
			AND	level_2_address_component_cd	=	'KD'
			AND	l1.level_1_address_component_id	=	l2.level_1_address_component_id
			);

INSERT	INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)
	SELECT	'KD', 'KABIR DHAM', level_1_address_component_id, 1
	FROM	level_1_address_components
	WHERE	level_1_address_component_nm	=	'Chhattisgarh'
	AND		country_id						=	1;


-- ====================================================================================================

DELETE	l2
FROM	level_2_address_components	l2
	JOIN	level_1_address_components	l1
		ON	(	level_1_address_component_nm	=	'Madhya Pradesh'
			AND	level_2_address_component_cd	=	'AM'
			AND	l1.level_1_address_component_id	=	l2.level_1_address_component_id
			);

INSERT	INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)
	SELECT	'AM', 'AGAR-MALWA', level_1_address_component_id, 1
	FROM	level_1_address_components
	WHERE	level_1_address_component_nm	=	'Madhya Pradesh'
	AND		country_id						=	1;


-- ====================================================================================================

DELETE	l2
FROM	level_2_address_components	l2
	JOIN	level_1_address_components	l1
		ON	(	level_1_address_component_nm	=	'Tamil Nadu'
			AND	level_2_address_component_cd	=	'TRPR'
			AND	l1.level_1_address_component_id	=	l2.level_1_address_component_id
			);

INSERT	INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)
	SELECT	'TRPR', 'TIRUPPUR', level_1_address_component_id, 1
	FROM	level_1_address_components
	WHERE	level_1_address_component_nm	=	'Tamil Nadu'
	AND		country_id						=	1;


-- ====================================================================================================

DELETE	l2
FROM	level_2_address_components	l2
	JOIN	level_1_address_components	l1
		ON	(	level_1_address_component_nm	=	'Uttar Pradesh'
			AND	level_2_address_component_cd	=	'AMTH'
			AND	l1.level_1_address_component_id	=	l2.level_1_address_component_id
			);

INSERT	INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)
	SELECT	'AMTH', 'AMETHI (CHHATRAPATI SHAHUJI MAH. NAGAR)', level_1_address_component_id, 1
	FROM	level_1_address_components
	WHERE	level_1_address_component_nm	=	'Uttar Pradesh'
	AND		country_id						=	1;


-- ====================================================================================================

DELETE	l2
FROM	level_2_address_components	l2
	JOIN	level_1_address_components	l1
		ON	(	level_1_address_component_nm	=	'Uttar Pradesh'
			AND	level_2_address_component_cd	=	'KSGNJ'
			AND	l1.level_1_address_component_id	=	l2.level_1_address_component_id
			);

INSERT	INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)
	SELECT	'KSGNJ', 'KASGANJ (KANSHIRAM NAGAR)', level_1_address_component_id, 1
	FROM	level_1_address_components
	WHERE	level_1_address_component_nm	=	'Uttar Pradesh'
	AND		country_id						=	1;


-- ====================================================================================================

DELETE	l2
FROM	level_2_address_components	l2
	JOIN	level_1_address_components	l1
		ON	(	level_1_address_component_nm	=	'Uttar Pradesh'
			AND	level_2_address_component_cd	=	'SML'
			AND	l1.level_1_address_component_id	=	l2.level_1_address_component_id
			);

INSERT	INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)
	SELECT	'SML', 'SHAMLI (PRABUDH NAGAR)', level_1_address_component_id, 1
	FROM	level_1_address_components
	WHERE	level_1_address_component_nm	=	'Uttar Pradesh'
	AND		country_id						=	1;


-- ====================================================================================================

DELETE	l2
FROM	level_2_address_components	l2
	JOIN	level_1_address_components	l1
		ON	(	level_1_address_component_nm	=	'Uttar Pradesh'
			AND	level_2_address_component_cd	=	'SMB'
			AND	l1.level_1_address_component_id	=	l2.level_1_address_component_id
			);

INSERT	INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)
	SELECT	'SMB', 'SAMBHAL (BHIM NAGAR)', level_1_address_component_id, 1
	FROM	level_1_address_components
	WHERE	level_1_address_component_nm	=	'Uttar Pradesh'
	AND		country_id						=	1;


-- ====================================================================================================

DELETE	l2
FROM	level_2_address_components	l2
	JOIN	level_1_address_components	l1
		ON	(	level_1_address_component_nm	=	'Uttar Pradesh'
			AND	level_2_address_component_cd	=	'LKHM'
			AND	l1.level_1_address_component_id	=	l2.level_1_address_component_id
			);

INSERT	INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)
	SELECT	'LKHM', 'LAKHIMPUR KHERI', level_1_address_component_id, 1
	FROM	level_1_address_components
	WHERE	level_1_address_component_nm	=	'Uttar Pradesh'
	AND		country_id						=	1;


-- ====================================================================================================

-- vim:ts=4 sw=4 ht=4

