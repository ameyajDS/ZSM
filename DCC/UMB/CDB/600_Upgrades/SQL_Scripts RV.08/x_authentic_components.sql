
/* ==================================================================================
   	Source File		:	setup_authentic_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	12-10-2014
	Module ID		:	CDB
	Last updated		:	12-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components are set authentic
	==================================================================================
		Revision History
	----------------------------------------------------------------------------------

	==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

-- ======================================================================

UPDATE	l
	SET	is_authentic	=	1
FROM	level_1_address_components	l
	JOIN	countries	c
		ON	(	c.country_id	=	l.country_id	)
WHERE	country_nm	IN	(	'Anguilla', 'Armenia', 'Bahrain', 'Egypt', 'Jamaica', 'Libya', 'Maldives', 'North Korea', 'Qatar', 'Trinidad And Tobago', 'Uruguay'
						)

-- ======================================================================
