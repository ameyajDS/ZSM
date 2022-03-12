/* ==================================================================================
	Source File		:	occupation_skill.sql
	Author(s)		:	Manish Saluja / Jitendra Loyal
	Started On		:	
	Version			:	
	Module ID		:	ZSM (Indore)
	Language		:	TRANSACT-SQL
	Last updated	:	26 May 2012
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
	occupation1			VARCHAR (200),
	occupation2			VARCHAR (200),
	occupation3			VARCHAR (200),
	ZSM_Occupation		VARCHAR (200),
	CDB_Skill1			VARCHAR (200),
	CDB_Skill2			VARCHAR (200)
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
		occupation1, occupation2, occupation3, ZSM_Occupation, CDB_Skill1, CDB_Skill2
	)
	SELECT 
		occupation1, occupation2, occupation3, ZSM_Occupation, CDB_Skill1, CDB_Skill2
	FROM OPENROWSET('Microsoft.Jet.OLEDB.4.0', 'Excel 8.0;Database=C:\TEMP\zsm_indore_occupations.xls', 'SELECT * FROM [Indore Data$]');
GO

DECLARE
	@centre_id	INT,
	@CNT1		INT,
	@CNT2		INT;
SET @centre_id = 5820;

UPDATE m
	SET	m.occupation	= o.occupation,
		m.skill1_id		= s1.skill_id,
		m.skill2_id		= s2.skill_id
--SELECT m.occupation1, m.occupation2, m.occupation3, o.occupation, p.CDB_Skill1, s1.skill_id, p.CDB_Skill2, s2.skill_id
	FROM mgr_centre_sewadars m
	JOIN 			#processed p 			ON 	COALESCE(p.occupation1, '')		= m.occupation1	AND
												COALESCE(p.occupation2, '')		= m.occupation2 AND
												COALESCE(p.occupation3, '')		= m.occupation3
	JOIN			occupations o			ON 	o.occupation 		= p.ZSM_Occupation
	LEFT OUTER JOIN CDB..skills s1 			ON 	s1.skill_nm		 	= p.CDB_Skill1
	LEFT OUTER JOIN CDB..skills s2 			ON 	s2.skill_nm		 	= p.CDB_Skill2
	WHERE m.satsang_centre_id = @centre_id
	AND		m.sewadar_id IS NULL

SELECT @CNT1 = COUNT(*) FROM mgr_centre_sewadars m 
							JOIN #processed p ON	COALESCE(p.occupation1, '')		= m.occupation1	AND
													COALESCE(p.occupation2, '')		= m.occupation2 AND
													COALESCE(p.occupation3, '')		= m.occupation3 
							WHERE CDB_Skill1 IS NOT NULL	AND		m.sewadar_id IS NULL;
SELECT @CNT2 = COUNT(*) FROM mgr_centre_sewadars WHERE skill1_id IS NOT NULL	AND		sewadar_id IS NULL;

IF (@CNT1 <> @CNT2)
	BEGIN
		RAISERROR ('Some CDB_Skill1 did not get migrated', 16, 0);
		SELECT m.occupation1, m.occupation2, m.occupation3, p.CDB_Skill1 FROM mgr_centre_sewadars m 
							JOIN #processed p ON	COALESCE(p.occupation1, '')		= m.occupation1	AND
													COALESCE(p.occupation2, '')		= m.occupation2 AND
													COALESCE(p.occupation3, '')		= m.occupation3 
							WHERE CDB_Skill1 IS NOT NULL	AND		m.sewadar_id IS NULL AND 
								NOT EXISTS (SELECT 1 FROM CDB..skills q WHERE q.skill_nm = p.CDB_Skill1);
	END

SELECT @CNT1 = COUNT(*) FROM mgr_centre_sewadars m 
							JOIN #processed p ON	COALESCE(p.occupation1, '')		= m.occupation1	AND
													COALESCE(p.occupation2, '')		= m.occupation2 AND
													COALESCE(p.occupation3, '')		= m.occupation3 
							WHERE CDB_Skill2 IS NOT NULL	AND		m.sewadar_id IS NULL;
SELECT @CNT2 = COUNT(*) FROM mgr_centre_sewadars WHERE skill2_id IS NOT NULL	AND		sewadar_id IS NULL;

IF (@CNT1 <> @CNT2)
	BEGIN
		RAISERROR ('Some CDB_Skill2 did not get migrated', 16, 0);
		SELECT m.occupation1, m.occupation2, m.occupation3, p.CDB_Skill2 FROM mgr_centre_sewadars m 
							JOIN #processed p ON	COALESCE(p.occupation1, '')		= m.occupation1	AND
													COALESCE(p.occupation2, '')		= m.occupation2 AND
													COALESCE(p.occupation3, '')		= m.occupation3 
							WHERE CDB_Skill2 IS NOT NULL	AND		m.sewadar_id IS NULL AND 
								NOT EXISTS (SELECT 1 FROM CDB..skills q WHERE q.skill_nm = p.CDB_Skill2);
	END

SELECT @CNT1 = COUNT(*) FROM mgr_centre_sewadars m 
							JOIN #processed p ON	COALESCE(p.occupation1, '')		= m.occupation1	AND
													COALESCE(p.occupation2, '')		= m.occupation2 AND
													COALESCE(p.occupation3, '')		= m.occupation3 
							WHERE ZSM_Occupation IS NOT NULL	AND		m.sewadar_id IS NULL;
SELECT @CNT2 = COUNT(*) FROM mgr_centre_sewadars WHERE occupation IS NOT NULL	AND		sewadar_id IS NULL;

IF (@CNT1 <> @CNT2)
	BEGIN
		RAISERROR ('Some ZSM_Occupation did not get migrated', 16, 1);
		SELECT m.occupation1, m.occupation2, m.occupation3, p.ZSM_Occupation FROM mgr_centre_sewadars m 
							JOIN #processed p ON	COALESCE(p.occupation1, '')		= m.occupation1	AND
													COALESCE(p.occupation2, '')		= m.occupation2 AND
													COALESCE(p.occupation3, '')		= m.occupation3 
							WHERE ZSM_Occupation IS NOT NULL	AND		m.sewadar_id IS NULL AND 
								NOT EXISTS (SELECT 1 FROM occupations q WHERE q.occupation = p.ZSM_Occupation);
	END

UPDATE mgr_centre_sewadars
	SET occupation			= 'Un-employed',
		migration_remark2	= 'Unknown occupation is put as Un-employed'
	WHERE occupation IS NULL	AND		sewadar_id IS NULL;
	
DROP TABLE #processed;

GO

