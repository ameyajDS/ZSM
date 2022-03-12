/* ==================================================================================
	Source File		:	41_MSC_Qualifications
	Author(s)		:	Sukhdev B. Darira / Jitendra Loyal
	Started On		:	Thu Feb 25 23:55:07 IST 2010
	Version			:	0.01
	Module ID		:	RMS
	Language		:	TRANSACT-SQL
	Last updated	:	Feb 25, 2010
	Reviewed By		:	Jitendra Loyal
	Reviewed On		:	
	==================================================================================
																		   Usage Notes
	==================================================================================
	Assumptions:

	NOTE: A mapping excel sheet has been prepared and uploaded to share point at the following location
			Files -> RMS Migration n Dev Docs
	==================================================================================
																	  Revision History
	----------------------------------------------------------------------------------
		JL : July 10, 2009
			Pure INSERT statements have been moved to ../07_CDB_migration.sql;
			remaining statements stay here.
	==================================================================================*/

--	USE MSC

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

GO

-- =============================================================================
--	Updating the qualification IDs in the Centre_Sewadars table 
-- =============================================================================

UPDATE	centre_sewadars
	SET	qualification_id = 	(	SELECT	qualification_id
								FROM	cdb..qualifications
								WHERE	qualification_cd	= 'UNGRD'
							)
WHERE	qualification_id = 1
GO

UPDATE	centre_sewadars
	SET	qualification_id = 	(	SELECT	qualification_id
								FROM	cdb..qualifications
								WHERE	qualification_cd	= 'DELTRCL'
							)
WHERE	qualification_id = 2
GO

UPDATE	centre_sewadars
	SET	qualification_id = 	(	SELECT	qualification_id
								FROM	cdb..qualifications
								WHERE	qualification_cd	= 'GRD'
							)
WHERE	qualification_id = 3
GO

UPDATE	centre_sewadars
	SET	qualification_id = 	(	SELECT	qualification_id
								FROM	cdb..qualifications
								WHERE	qualification_cd	= 'Diploma'
							)
WHERE	qualification_id = 4
GO

UPDATE	centre_sewadars
	SET	qualification_id = 	(	SELECT	qualification_id
								FROM	cdb..qualifications
								WHERE	qualification_cd	= 'MAT'
							)
WHERE	qualification_id = 5
GO

UPDATE	centre_sewadars
	SET	qualification_id = 	(	SELECT	qualification_id
								FROM	cdb..qualifications
								WHERE	qualification_cd	= 'NA'
							)
WHERE	qualification_id = 6
GO

UPDATE	centre_sewadars
	SET	qualification_id = 	(	SELECT	qualification_id
								FROM	cdb..qualifications
								WHERE	qualification_cd	= 'UNMTR'
							)
WHERE	qualification_id = 7
GO

UPDATE	centre_sewadars
	SET	qualification_id = 	(	SELECT	qualification_id
								FROM	cdb..qualifications
								WHERE	qualification_cd	= 'BE'
							)
WHERE	qualification_id = 8
GO

UPDATE	centre_sewadars
	SET	qualification_id = 	(	SELECT	qualification_id
								FROM	cdb..qualifications
								WHERE	qualification_cd	= 'GRDMED'
							)
WHERE	qualification_id = 9
GO

UPDATE	centre_sewadars
	SET	qualification_id = 	(	SELECT	qualification_id
								FROM	cdb..qualifications
								WHERE	qualification_cd	= 'EnggDipl'
							)
WHERE	qualification_id = 10
GO

UPDATE	centre_sewadars
	SET	qualification_id = 	(	SELECT	qualification_id
								FROM	cdb..qualifications
								WHERE	qualification_cd	= 'PG'
							)
WHERE	qualification_id = 11
GO

-- =============================================================================

-- vim:ts=4 sw=4 ht=4
