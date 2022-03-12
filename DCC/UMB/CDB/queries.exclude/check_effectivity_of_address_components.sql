
	--	Level 1 components effective for Ineffective Countries
SELECT	*
FROM	level_1_address_components l1
	JOIN	countries l2
		ON	(	l2.country_id	=	l1.country_id	)
WHERE	Getdate()		BETWEEN l1.effective_from AND l1.effective_till
AND		GETDATE()	NOT BETWEEN l2.effective_from AND l2.effective_till

	--	Level 2 components effective for Ineffective Level 1 Components
SELECT	*
FROM	level_1_address_components l1
	JOIN	level_2_address_components l2
		ON	(	l2.level_1_address_component_id	=	l1.level_1_address_component_id	)
WHERE	GETDATE()	NOT BETWEEN l1.effective_from AND l1.effective_till
AND		GETDATE()		BETWEEN l2.effective_from AND l2.effective_till


	--	Level 3 components effective for Ineffective Level 2 Components
SELECT	*
FROM	level_2_address_components l2
	JOIN	level_3_address_components l3
		ON	(	l3.level_2_address_component_id	=	l2.level_2_address_component_id	)
WHERE	GETDATE()		BETWEEN l3.effective_from AND l3.effective_till
AND		GETDATE()	NOT BETWEEN l2.effective_from AND l2.effective_till

/*

   FIx Level 3 Effective Till Date

UPDATE	l3
	SET	effective_till	=	GETDATE()
FROM	level_2_address_components l2
	JOIN	level_3_address_components l3
		ON	(	l3.level_2_address_component_id	=	l2.level_2_address_component_id	)
WHERE	GETDATE() between l3.effective_from AND l3.effective_till
AND		GETDATE() not between l2.effective_from AND l2.effective_till

*/
