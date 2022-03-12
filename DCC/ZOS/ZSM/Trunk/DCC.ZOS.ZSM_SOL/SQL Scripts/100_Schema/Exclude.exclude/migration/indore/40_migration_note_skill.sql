/* ==================================================================================
	Source File		:	occupation_skill.sql
	Author(s)		:	Manish Saluja / Jitendra Loyal
	Started On		:	
	Version			:	
	Module ID		:	ZSM (Indore)
	Language		:	TRANSACT-SQL
	Last updated	:	27 May 2012
	Reviewed By		:	
	Reviewed On		:	
	==================================================================================
														 				   Usage Notes
	==================================================================================
																	  Revision History
	==================================================================================*/




IF EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = '#processed')
	DROP TABLE #processed
GO

CREATE TABLE #processed 
(
	occupation				VARCHAR (200),
	skill1_nm				VARCHAR (200),
	skill2_nm				VARCHAR (200),
	migration_note_skill	VARCHAR (200),
	CDB_Skill1				VARCHAR (200),
	CDB_Skill2				VARCHAR (200),
	CDB_Skill3				VARCHAR (200),
)
GO

EXEC sp_configure 'show advanced options', 1
GO
RECONFIGURE
GO
--EXEC sp_configure 'Ad Hoc Distributed Queries', 1
--GO
--RECONFIGURE
--GO

INSERT INTO #processed
	(
		occupation, skill1_nm, skill2_nm, migration_note_skill, CDB_Skill1, CDB_Skill2, CDB_Skill3
	)
	SELECT 
		occupation, skill1_nm, skill2_nm, migration_note_skill, CDB_Skill1, CDB_Skill2, CDB_Skill3
	FROM OPENROWSET('Microsoft.Jet.OLEDB.4.0', 'Excel 8.0;Database=C:\TEMP\zsm_indore_migration_note_skill.xls', 'SELECT * FROM [Indore Data$]');
GO

DECLARE
	@centre_id	INT,
	@CNT1		INT,
	@CNT2		INT;

SET @centre_id = 5820;

UPDATE m
	SET	m.skill1_id		= COALESCE(s1.skill_id, c1.skill_id),
		m.skill2_id		= COALESCE(s2.skill_id, c2.skill_id),
		m.skill3_id		= c3.skill_id
--SELECT m.skill1_id, m.skill2_id, c1.skill_id, c2.skill_id, c3.skill_id
	FROM mgr_centre_sewadars m
	LEFT OUTER JOIN CDB..skills s1 			ON 	s1.skill_id		 	= m.skill1_id
	LEFT OUTER JOIN CDB..skills s2 			ON 	s2.skill_id		 	= m.skill2_id
	JOIN 			#processed p 			ON 	COALESCE(p.occupation, '')				= COALESCE(m.occupation, '')	AND
												COALESCE(p.skill1_nm, '')				= COALESCE(s1.skill_nm, '') 	AND
												COALESCE(p.skill2_nm, '')				= COALESCE(s2.skill_nm, '')		AND
												COALESCE(p.migration_note_skill, '')	= m.migration_note_skill
	LEFT OUTER JOIN CDB..skills c1			ON	c1.skill_nm			= p.CDB_Skill1
	LEFT OUTER JOIN CDB..skills c2			ON	c2.skill_nm			= p.CDB_Skill2
	LEFT OUTER JOIN CDB..skills c3			ON	c3.skill_nm			= p.CDB_Skill3
	WHERE m.satsang_centre_id = @centre_id	AND		sewadar_id IS NULL

DROP TABLE #processed;

GO

