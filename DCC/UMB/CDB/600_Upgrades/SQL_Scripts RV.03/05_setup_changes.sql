/* ==================================================================================
	Source File		:	changes.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	Sun Aug 31 16:32 2014
	Module ID		:	CDB
	Last updated	:	Aug 31, 2014
	==================================================================================
																		   Usage Notes
	----------------------------------------------------------------------------------

	==================================================================================
																	  Revision History
	----------------------------------------------------------------------------------

	==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO


-- ======================================================================
-- Country's Name changes
-- ======================================================================

UPDATE	countries
	SET	country_nm	=	'St. Martin F.W.I'
WHERE	country_nm	=	'Saint Martin'


-- ======================================================================
-- Country's Effective Date changes
-- ======================================================================

UPDATE	countries
	SET	effective_till	=	'31-Dec-9999'
WHERE	country_nm	IN	(	'Caribbean', 'Korea', 'St. Maarten'	);

-- ======================================================================

