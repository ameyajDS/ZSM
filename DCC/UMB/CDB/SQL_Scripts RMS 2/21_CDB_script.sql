/* ==================================================================================
	Source File		:	21_CDB_script.sql
	Author(s)		:	Sukhdev B. Darira / Jitendra Loyal
	Started On		:	Thu Nov 27 23:02:00 IST 2008
	Version			:	0.02
	Module ID		:	RMS
	Language		:	TRANSACT-SQL
	Last updated	:	July 10, 2009
	Reviewed By		:	Jitendra Loyal
	Reviewed On		:	Jan 11, 2009
	==================================================================================
																		   Usage Notes
	==================================================================================
	Assumptions:

		1. The Earlier SWS schema / database is present and accessible as SWS
		2. The CDB (post migration to the new one) is present and accessible as CDB
	==================================================================================
																	  Revision History
	----------------------------------------------------------------------------------
		JL : July 10, 2009
			Pure INSERT statements have been moved to ../07_CDB_migration.sql;
			remaining statements stay here.
	==================================================================================*/

--	USE CDB

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

GO

-- =============================================================================
--	Countries
-- =============================================================================

--	Migrating the countries from SWS

INSERT	INTO	countries
		(		country_cd, country_nm, effective_from	)
	SELECT		'Mg' + CAST (s.country_code as VARCHAR) as country_cd , 
				country_name, transdate 
	FROM		SWS..pim_country 	s
	LEFT OUTER 	JOIN	
				countries			c
			ON	LOWER (REPLACE (s.country_name, ' ', '')) = LOWER (REPLACE (c.country_nm, ' ', ''))
	WHERE		c.country_nm 	IS NULL
	AND			s.country_name	!= 'UNKNOWN'
GO

-- =============================================================================
--	States
-- =============================================================================

--	Updating the state names in the SWS database, so that they do not create duplicates in CDB
--	The same states are present in CDB too, but have a different name spelling, as per the below updates

UPDATE	sws..pim_state	SET	state_name = 'Andhra Pradesh'		WHERE	state_code = 23 -- AND state_name = 'Andhera Pradesh'
UPDATE	sws..pim_state	SET	state_name = 'Chhattisgarh'			WHERE	state_code = 19 -- AND state_name = 'Chhatisgarh'
UPDATE	sws..pim_state	SET	state_name = 'Himachal Pradesh'		WHERE	state_code = 5 	-- AND state_name = 'H.P.'
UPDATE	sws..pim_state	SET	state_name = 'Jammu & Kashmir'		WHERE	state_code = 10 -- AND state_name = 'J & K'
UPDATE	sws..pim_state	SET	state_name = 'Madhya Pradesh'		WHERE	state_code = 12 -- AND state_name = 'M.P.'
UPDATE	sws..pim_state	SET	state_name = 'Uttar Pradesh'		WHERE	state_code = 8  -- AND state_name = 'U.P.'
UPDATE	sws..pim_state	SET	state_name = 'Union Territory'		WHERE	state_code = 3	-- AND state_name = 'U.T.'
UPDATE	sws..pim_state	SET	state_name = 'Uttarakhand'			WHERE	state_code = 69 -- AND state_name = 'Uttrakhand'

--	Migrating the other values from the SWS System
--		Logic: 	First find out the states that are not present in CDB and are present in SWS,
--				And then for each of them, find out their country_id in CDB, 
--				by comparing their country_name in SWS with Country_nm in CDB

INSERT	INTO	states
		(	state_cd, state_nm, country_id, effective_from	)
	SELECT	ns.state_code, ns.state_name, cc.country_id, ns.transdate
	FROM	(
				SELECT	'Mg' + CAST (ss.state_code as VARCHAR) as state_code,
						ss.state_name state_name, ss.country_code country_code, ss.transdate 
				FROM	SWS..pim_state					ss
					LEFT OUTER 	JOIN	states				cs
						ON		LOWER (REPLACE (ss.state_name, ' ', '')) = LOWER (REPLACE (cs.state_nm, ' ', ''))
				WHERE	cs.state_nm			IS NULL
				AND		ss.state_name		!= 'UNKNOWN'
			) NS
		INNER JOIN	SWS..pim_country						sc
			ON		ns.country_code		= sc.country_code
		INNER JOIN	countries			cc
			ON		LOWER (REPLACE (sc.country_name, ' ', '')) = LOWER (REPLACE (cc.country_nm, ' ', ''))
GO

-- =============================================================================
--	Districts or Cities
-- =============================================================================

--	Migrating the other values from the SWS System
--		Logic: 	First find out the districts that are not present in CDB and are present in SWS,
--				And then for each of them, find out their state_id in CDB, 
--				by comparing their state_name in SWS with state_nm in CDB

INSERT	INTO	districts_or_cities
		(	district_cd, district_nm, state_id, effective_from	)
	SELECT	nd.district_code, nd.district_name, cs.state_id, nd.transdate
	FROM	(
				SELECT	'Mg' + CAST (sd.district_code AS VARCHAR) as district_code,
						sd.district_name district_name, sd.state_code state_code, sd.transdate 
				FROM	SWS..pim_district					sd
					LEFT OUTER 	JOIN	districts_or_cities		cd
					ON	LOWER (REPLACE (sd.district_name, ' ', '')) = LOWER (REPLACE (cd.district_nm, ' ', ''))
				WHERE	cd.district_nm			IS NULL
				AND		sd.district_name		!= 'UNKNOWN'
			) ND
		INNER JOIN	SWS..pim_state	ss
			ON		nd.state_code		= ss.state_code
		INNER JOIN	states			cs
			ON		LOWER (REPLACE (ss.state_name, ' ', '')) = LOWER (REPLACE (cs.state_nm, ' ', ''))
GO

-- =============================================================================
--	Designations
-- =============================================================================

INSERT	INTO	designations
		(	designation_cd, designation_nm, designation_sq, minimum_age, maximum_starting_age, 
			retirement_age, effective_from, effective_till
		)
	SELECT	'Mg' + CAST (s.designation_code AS VARCHAR) as designation_code,
			s.designation_name, sort_order, s.minimum_age, s.maximum_starting_age, 
			s.age_of_retirement, s.start_date, COALESCE (s.end_date, CAST ('9999-12-31 00:00:00' AS DATETIME))
	FROM	(
				SELECT	a.designation_code,
						CASE
							WHEN COUNT(b.designation_code) = 1	THEN	a.designation_name
							WHEN COUNT(b.designation_code) = 2	THEN	a.designation_name + ' - old'
							WHEN COUNT(b.designation_code) = 3	THEN	a.designation_name + ' - older'
							WHEN COUNT(b.designation_code) = 4	THEN	a.designation_name + ' - oldest'
							ELSE a.designation_name + ' - old ' + CAST ((COUNT (b.designation_name) - 1) AS VARCHAR)
						END AS	designation_name,
						a.sort_order, a.minimum_age, a.maximum_starting_age, a.age_of_retirement, a.start_date, a.end_date
				FROM	sws..pim_designation		a
					INNER JOIN	sws..pim_designation	b
						ON	a.designation_name = b.designation_name
				WHERE	b.start_date >= a.start_date
				GROUP	BY	a.designation_code, a.designation_name, a.sort_order,
						a.minimum_age, a.maximum_starting_age, a.age_of_retirement, a.start_date, a.end_date
			) s
	LEFT OUTER JOIN
			cdb..designations			c
	ON		LOWER (REPLACE (s.designation_name, ' ', '')) = LOWER (REPLACE (c.designation_nm, ' ', ''))
	WHERE	c.designation_nm 			IS NULL
--	AND		s.end_date 					IS NULL
	AND		s.designation_name			!= 'Resident'
	ORDER BY	sort_order
GO

-- =============================================================================
--	Relations
-- =============================================================================

INSERT	INTO	relations
		(	relation_nm, effective_from	)
	SELECT	relation_name, transdate 
	FROM	SWS..pim_relation		s
	LEFT OUTER JOIN
			relations				c
	ON		LOWER (REPLACE (s.relation_name, ' ', '')) = LOWER (REPLACE (c.relation_nm, ' ', ''))
GO

--	Updating the relation name appropriately

UPDATE	relations
SET		relation_nm = 'Cousin Sister'
WHERE	relation_nm = 'Cousin sister'
GO


-- =============================================================================

-- vim:ts=4 sw=4 ht=4
