/* ==================================================================================
	Source File		:	qualificaton.sql
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
	qualification_nm			VARCHAR (200),
	CDB_qualification1			VARCHAR (200),
	CDB_subject1				VARCHAR (200),
	CDB_qualification2			VARCHAR (200),
	CDB_subject2				VARCHAR (200),
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
		qualification_nm, CDB_qualification1, CDB_subject1, CDB_qualification2, CDB_subject2
	)
	SELECT 
		qualification_nm, CDB_qualification1, CDB_subject1, CDB_qualification2, CDB_subject2
	FROM OPENROWSET('Microsoft.Jet.OLEDB.4.0', 'Excel 8.0;Database=C:\TEMP\zsm_indore_qualifications.xls', 'SELECT * FROM [Indore Data$]');
GO

DECLARE
	@centre_id	INT,
	@CNT1		INT,
	@CNT2		INT;
SET @centre_id = 5820;

UPDATE m
	SET	m.qualification1_id		= q1.qualification_id,
		m.qlfctn_subject1_id	= s1.qlfctn_subject_id,
		m.qualification2_id		= q2.qualification_id,
		m.qlfctn_subject2_id	= s2.qlfctn_subject_id
--SELECT m.qualification_nm, q1.qualification_id, q1.qualification_nm, s1.qlfctn_subject_id, s1.qlfctn_subject_nm, 
--	q2.qualification_id, q2.qualification_nm, s2.qlfctn_subject_id, s2.qlfctn_subject_nm
	FROM mgr_centre_sewadars m
	JOIN 			#processed p 			ON p.qualification_nm		= m.qualification_nm
	LEFT OUTER JOIN	CDB..qualifications q1	ON q1.qualification_nm 		= p.CDB_qualification1
	LEFT OUTER JOIN CDB..qlfctn_subjects s1 ON s1.qlfctn_subject_nm = p.CDB_subject1
	LEFT OUTER JOIN 			CDB..qualifications q2	ON q2.qualification_nm 		= p.CDB_qualification2
	LEFT OUTER JOIN CDB..qlfctn_subjects s2 ON s2.qlfctn_subject_nm = p.CDB_subject2
	WHERE m.satsang_centre_id = @centre_id	AND		m.sewadar_id IS NULL 

SELECT @CNT1 = COUNT(*) FROM mgr_centre_sewadars m JOIN #processed p ON p.qualification_nm = m.qualification_nm WHERE CDB_qualification1 IS NOT NULL;
SELECT @CNT2 = COUNT(*) FROM mgr_centre_sewadars WHERE qualification1_id IS NOT NULL;

IF (@CNT1 <> @CNT2)
	BEGIN
		RAISERROR ('Some CDB_qualification1 did not get migrated', 16, 0);
		SELECT m.qualification_nm, p.CDB_qualification1 FROM mgr_centre_sewadars m JOIN #processed p ON p.qualification_nm = m.qualification_nm 
			WHERE CDB_qualification1 IS NOT NULL	AND		m.sewadar_id IS NULL  AND 
			NOT EXISTS (SELECT 1 FROM CDB..qualifications q WHERE q.qualification_nm = p.CDB_qualification1);
	END

SELECT @CNT1 = COUNT(*) FROM mgr_centre_sewadars m JOIN #processed p ON p.qualification_nm = m.qualification_nm WHERE CDB_subject1 IS NOT NULL	AND		m.sewadar_id IS NULL ;
SELECT @CNT2 = COUNT(*) FROM mgr_centre_sewadars WHERE qlfctn_subject1_id IS NOT NULL	AND		sewadar_id IS NULL ;

IF (@CNT1 <> @CNT2)
	BEGIN
		RAISERROR ('Some CDB_subject1 did not get migrated', 16, 0);
		SELECT m.qualification_nm, p.CDB_subject1 FROM mgr_centre_sewadars m JOIN #processed p ON p.qualification_nm = m.qualification_nm 
			WHERE CDB_subject1 IS NOT NULL 	AND		m.sewadar_id IS NULL AND 
			NOT EXISTS (SELECT 1 FROM CDB..qlfctn_subjects s WHERE s.qlfctn_subject_nm = p.CDB_subject1);
	END


SELECT @CNT1 = COUNT(*) FROM mgr_centre_sewadars m JOIN #processed p ON p.qualification_nm = m.qualification_nm WHERE CDB_subject1 IS NOT NULL	AND		m.sewadar_id IS NULL ;
SELECT @CNT2 = COUNT(*) FROM mgr_centre_sewadars m JOIN CDB..qualifications_qlfctn_subjects q ON q.qualification_id = m.qualification1_id 
														AND q.qlfctn_subject_id = m. qlfctn_subject1_id 
						WHERE qlfctn_subject1_id IS NOT NULL	AND		m.sewadar_id IS NULL ;

IF (@CNT1 <> @CNT2)
	BEGIN
		RAISERROR ('Some combination of qualification1_id and qlfctn_subject1_id does not belong to CDB..qualifications_qlfctn_subjects', 16, 0);
		SELECT m.qualification_nm, p.CDB_qualification1, p.CDB_subject1 FROM mgr_centre_sewadars m JOIN #processed p ON p.qualification_nm = m.qualification_nm 
			WHERE CDB_subject1 IS NOT NULL 	AND		m.sewadar_id IS NULL AND 
			NOT EXISTS (SELECT 1 FROM CDB..qualifications_qlfctn_subjects s WHERE	s.qlfctn_subject_id = m.qlfctn_subject1_id
																			AND		s.qualification_id = m.qualification1_id);
	END


SELECT @CNT1 = COUNT(*) FROM mgr_centre_sewadars m JOIN #processed p ON p.qualification_nm = m.qualification_nm WHERE CDB_qualification2 IS NOT NULL	AND		m.sewadar_id IS NULL ;
SELECT @CNT2 = COUNT(*) FROM mgr_centre_sewadars WHERE qualification2_id IS NOT NULL	AND		sewadar_id IS NULL ;

IF (@CNT1 <> @CNT2)
	BEGIN
		RAISERROR ('Some CDB_qualification2 did not get migrated', 16, 0);
		SELECT m.qualification_nm, p.CDB_qualification2 FROM mgr_centre_sewadars m JOIN #processed p ON p.qualification_nm = m.qualification_nm 
			WHERE CDB_qualification2 IS NOT NULL	AND		m.sewadar_id IS NULL  AND 
			NOT EXISTS (SELECT 1 FROM CDB..qualifications q WHERE q.qualification_nm = p.CDB_qualification2);
	END

SELECT @CNT1 = COUNT(*) FROM mgr_centre_sewadars m JOIN #processed p ON p.qualification_nm = m.qualification_nm WHERE CDB_subject2 IS NOT NULL	AND		m.sewadar_id IS NULL ;
SELECT @CNT2 = COUNT(*) FROM mgr_centre_sewadars WHERE qlfctn_subject2_id IS NOT NULL	AND		sewadar_id IS NULL ;

IF (@CNT1 <> @CNT2)
	BEGIN
		RAISERROR ('Some CDB_subject2 did not get migrated', 16, 0);
		SELECT m.qualification_nm, p.CDB_subject2 FROM mgr_centre_sewadars m JOIN #processed p ON p.qualification_nm = m.qualification_nm 
			WHERE CDB_subject2 IS NOT NULL 	AND		m.sewadar_id IS NULL AND 
			NOT EXISTS (SELECT 1 FROM CDB..qlfctn_subjects s WHERE s.qlfctn_subject_nm = p.CDB_subject2);
	END


SELECT @CNT1 = COUNT(*) FROM mgr_centre_sewadars m JOIN #processed p ON p.qualification_nm = m.qualification_nm WHERE CDB_subject2 IS NOT NULL	AND		m.sewadar_id IS NULL ;
SELECT @CNT2 = COUNT(*) FROM mgr_centre_sewadars m JOIN CDB..qualifications_qlfctn_subjects q ON q.qualification_id = m.qualification2_id 
														AND q.qlfctn_subject_id = m. qlfctn_subject2_id 
						WHERE qlfctn_subject2_id IS NOT NULL	AND		m.sewadar_id IS NULL ;

IF (@CNT1 <> @CNT2)
	BEGIN
		RAISERROR ('Some combination of qualification2_id and qlfctn_subject2_id does not belong to CDB..qualifications_qlfctn_subjects', 16, 1);
		SELECT m.qualification_nm, p.CDB_qualification2, p.CDB_subject2 FROM mgr_centre_sewadars m JOIN #processed p ON p.qualification_nm = m.qualification_nm 
			WHERE CDB_subject2 IS NOT NULL	AND		m.sewadar_id IS NULL  AND 
			NOT EXISTS (SELECT 1 FROM CDB..qualifications_qlfctn_subjects s WHERE	s.qlfctn_subject_id = m.qlfctn_subject2_id
																			AND		s.qualification_id	= m.qualification2_id);
	END

DROP TABLE #processed;

GO

