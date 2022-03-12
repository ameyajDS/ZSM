/* ==================================================================================
	Source File		:	09_cdb_updates_for_qualification.sql
	Author(s)		:	Manish Saluja
	Started On		:	Sun Feb 06, 2011
	Version			:	v0.01
	Module ID		:	ZSM
	Language		:	TRANSACT-SQL
	Last updated	:	06-Feb-2011
	Reviewed By		:	Jiten Loyal
	Reviewed On		:
	==================================================================================
																		   Usage Notes
	----------------------------------------------------------------------------------
	* This script adds / modifies the missing / incorrect data in CDB qualification
	  related tables.
	* To migrate qualification tables, qualification_mapping.xls needs to be present
	  in C:\TEMP folder
	==================================================================================
																    CDB Tables Updated 
	----------------------------------------------------------------------------------
	* qualifications
	* qlfctn_subjects
	* qualifications_qlfctn_subjects
	----------------------------------------------------------------------------------
																	  Revision History
	----------------------------------------------------------------------------------
	v0.01 MS	* 06-Feb-2011
				* Initial version separated from 08_cdb_updates.sql

*/

UPDATE qlfctn_subjects SET qlfctn_subject_nm = 'Finance Management' WHERE qlfctn_subject_nm = 'Financial Management';

UPDATE qlfctn_subjects SET qlfctn_subject_nm = 'Marketing' WHERE qlfctn_subject_nm = 'Martketing';

UPDATE qlfctn_subjects SET qlfctn_subject_nm = 'Radio & TV' WHERE qlfctn_subject_nm = 'Radio & TV Service';

UPDATE qlfctn_subjects SET qlfctn_subject_nm = 'Business Admin.' WHERE qlfctn_subject_nm = 'Business Admnin.';

UPDATE qualifications SET qualification_nm = 'First Year M.A.' WHERE qualification_nm = 'First Year MA';

UPDATE qualifications SET qualification_nm = 'M.B.A.', remarks = 'Master of Business Administration'WHERE qualification_nm = 'Master of Business Adminstrati';

GO

CREATE TABLE #processed
(
	qlfctn_subject_nm		VARCHAR(20),
	description				VARCHAR(50),
	remarks					VARCHAR(20)
);

CREATE TABLE #processed_new
(
	qlfctn_subject_nm		VARCHAR(20),
	qlfctn_subject_cd		VARCHAR(5),
	description				VARCHAR(50)
);

EXEC sp_configure 'show advanced options', 1
GO
RECONFIGURE
GO
--EXEC sp_configure 'Ad Hoc Distributed Queries', 1
--GO
--RECONFIGURE
--GO

DECLARE
	@active_eff_from	DATETIME,
	@active_eff_till	DATETIME,
	@cnt1				INT,
	@cnt2				INT;

	SET	@active_eff_from 	= '01-Jan-2000';
	SET @active_eff_till	= '31-Dec-9999';

INSERT INTO #processed (qlfctn_subject_nm, description, remarks)
	SELECT qlfctn_subject_nm, description, remarks
	FROM OPENROWSET('Microsoft.Jet.OLEDB.4.0', 'Excel 8.0;Database=C:\TEMP\qualification_mapping.xls', 'SELECT * FROM [CDB qlfctn subjects$]');
SELECT @cnt1 = (SELECT COUNT(*) FROM #processed);

INSERT INTO #processed_new (qlfctn_subject_nm, qlfctn_subject_cd, description)
	SELECT qlfctn_subject_nm, qlfctn_subject_cd, description
	FROM OPENROWSET('Microsoft.Jet.OLEDB.4.0', 'Excel 8.0;Database=C:\TEMP\qualification_mapping.xls', 'SELECT * FROM [New Subjects$]');

INSERT INTO qlfctn_subjects (qlfctn_subject_cd, qlfctn_subject_nm, description, effective_from, effective_till)
	SELECT n.qlfctn_subject_cd, n.qlfctn_subject_nm, p.description, @active_eff_from, @active_eff_till
	FROM #processed p LEFT OUTER JOIN qlfctn_subjects q ON q.qlfctn_subject_nm = p.qlfctn_subject_nm
	JOIN #processed_new n ON n.qlfctn_subject_nm = p.qlfctn_subject_nm
	WHERE p.qlfctn_subject_nm IS NOT NULL AND q.qlfctn_subject_nm IS NULL;
SELECT @cnt2 = (SELECT COUNT(*) FROM qlfctn_subjects);
IF (@cnt1 <> @cnt2)
	RAISERROR ('Not all new qualification subjects got added in CDB', 16, 0);

DROP TABLE #processed;
DROP TABLE #processed_new;
GO

CREATE TABLE #processed
(
	qualification_nm		VARCHAR(35),
	remarks					VARCHAR(200),
	updates					VARCHAR(35)
);

CREATE TABLE #processed_new
(
	qualification_nm		VARCHAR(35),
	qualification_type		VARCHAR(16),
	qualification_cd		VARCHAR(8),
	remarks					VARCHAR(200)
);

EXEC sp_configure 'show advanced options', 1
GO
RECONFIGURE
GO
--EXEC sp_configure 'Ad Hoc Distributed Queries', 1
--GO
--RECONFIGURE
--GO

DECLARE
	@active_eff_from	DATETIME,
	@active_eff_till	DATETIME,
	@cnt1				INT,
	@cnt2				INT;

	SET	@active_eff_from 	= '01-Jan-2000';
	SET @active_eff_till	= '31-Dec-9999';

INSERT INTO #processed (qualification_nm, remarks, updates)
	SELECT qualification_nm, remarks, updates
	FROM OPENROWSET('Microsoft.Jet.OLEDB.4.0', 'Excel 8.0;Database=C:\TEMP\qualification_mapping.xls', 'SELECT * FROM [CDB qualification$]');
SELECT @cnt1 = (SELECT COUNT(*) FROM #processed);

INSERT INTO #processed_new (qualification_nm, qualification_type, qualification_cd, remarks)
	SELECT qualification_nm, qualification_type, qualification_cd, remarks
	FROM OPENROWSET('Microsoft.Jet.OLEDB.4.0', 'Excel 8.0;Database=C:\TEMP\qualification_mapping.xls', 'SELECT * FROM [New Qualifications$]');
	
INSERT INTO qualifications (qualification_type, qualification_cd, qualification_nm, remarks, effective_from, effective_till)
	SELECT n.qualification_type, n.qualification_cd, n.qualification_nm, p.remarks, @active_eff_from, @active_eff_till
	FROM #processed p LEFT OUTER JOIN qualifications q ON q.qualification_nm = p.qualification_nm
	JOIN #processed_new n ON n.qualification_nm = p.qualification_nm
	WHERE p.qualification_nm IS NOT NULL AND q.qualification_nm IS NULL
SELECT @cnt2 = (SELECT COUNT(*) FROM qualifications);
IF (@cnt1 <> @cnt2)
	RAISERROR ('Not all new qualifications got added in CDB', 16, 0);

DROP TABLE #processed;
DROP TABLE #processed_new;
GO

CREATE TABLE #processed
(
	sms_qualification		VARCHAR(100),
	cdb_qualification_1		VARCHAR(35),
	cdb_qulftn_subject_1	VARCHAR(20),
	cdb_qualification_2		VARCHAR(35),
	cdb_qulftn_subject_2	VARCHAR(20),
	cdb_qualification_3		VARCHAR(35),
	cdb_qulftn_subject_3	VARCHAR(20),
	cdb_qualification_4		VARCHAR(35),
	cdb_qulftn_subject_4	VARCHAR(20),
	remarks					VARCHAR(100)
);

EXEC sp_configure 'show advanced options', 1
GO
RECONFIGURE
GO
--EXEC sp_configure 'Ad Hoc Distributed Queries', 1
--GO
--RECONFIGURE
--GO

DECLARE
	@active_eff_from	DATETIME,
	@active_eff_till	DATETIME;

	SET	@active_eff_from 	= '01-Jan-2000';
	SET @active_eff_till	= '31-Dec-9999';

INSERT INTO #processed (sms_qualification, cdb_qualification_1, cdb_qulftn_subject_1, cdb_qualification_2, cdb_qulftn_subject_2,
	cdb_qualification_3, cdb_qulftn_subject_3, cdb_qualification_4, cdb_qulftn_subject_4, remarks)
	SELECT sms_qualification, cdb_qualification_1, cdb_qulftn_subject_1, cdb_qualification_2, cdb_qulftn_subject_2,
		cdb_qualification_3, cdb_qulftn_subject_3, cdb_qualification_4, cdb_qulftn_subject_4, remarks
	FROM OPENROWSET('Microsoft.Jet.OLEDB.4.0', 'Excel 8.0;Database=C:\TEMP\qualification_mapping.xls', 'SELECT * FROM [SMS qualification$]')

INSERT INTO qualifications_qlfctn_subjects (qualification_id, qlfctn_subject_id, effective_from, effective_till)
	SELECT DISTINCT q.qualification_id, s.qlfctn_subject_id,
		CASE WHEN (q.effective_from > s.effective_from) THEN q.effective_from ELSE s.effective_from END,
		CASE WHEN (q.effective_from < s.effective_till) THEN q.effective_till ELSE s.effective_till END
	FROM #processed p 
	JOIN qualifications q ON q.qualification_nm = p.cdb_qualification_1
	JOIN qlfctn_subjects s ON s.qlfctn_subject_nm = p.cdb_qulftn_subject_1
	LEFT OUTER JOIN qualifications_qlfctn_subjects qs ON qs.qualification_id = q.qualification_id AND qs.qlfctn_subject_id = s.qlfctn_subject_id
	WHERE p.cdb_qualification_1 IS NOT NULL AND qs.qualification_id IS NULL
	
INSERT INTO qualifications_qlfctn_subjects (qualification_id, qlfctn_subject_id, effective_from, effective_till)
	SELECT DISTINCT q.qualification_id, s.qlfctn_subject_id,
		CASE WHEN (q.effective_from > s.effective_from) THEN q.effective_from ELSE s.effective_from END,
		CASE WHEN (q.effective_from < s.effective_till) THEN q.effective_till ELSE s.effective_till END
	FROM #processed p 
	JOIN qualifications q ON q.qualification_nm = p.cdb_qualification_2
	JOIN qlfctn_subjects s ON s.qlfctn_subject_nm = p.cdb_qulftn_subject_2
	LEFT OUTER JOIN qualifications_qlfctn_subjects qs ON qs.qualification_id = q.qualification_id AND qs.qlfctn_subject_id = s.qlfctn_subject_id
	WHERE p.cdb_qualification_2 IS NOT NULL AND qs.qualification_id IS NULL
	
INSERT INTO qualifications_qlfctn_subjects (qualification_id, qlfctn_subject_id, effective_from, effective_till)
	SELECT DISTINCT q.qualification_id, s.qlfctn_subject_id,
		CASE WHEN (q.effective_from > s.effective_from) THEN q.effective_from ELSE s.effective_from END,
		CASE WHEN (q.effective_from < s.effective_till) THEN q.effective_till ELSE s.effective_till END
	FROM #processed p 
	JOIN qualifications q ON q.qualification_nm = p.cdb_qualification_3
	JOIN qlfctn_subjects s ON s.qlfctn_subject_nm = p.cdb_qulftn_subject_3
	LEFT OUTER JOIN qualifications_qlfctn_subjects qs ON qs.qualification_id = q.qualification_id AND qs.qlfctn_subject_id = s.qlfctn_subject_id
	WHERE p.cdb_qualification_3 IS NOT NULL AND qs.qualification_id IS NULL
	
INSERT INTO qualifications_qlfctn_subjects (qualification_id, qlfctn_subject_id, effective_from, effective_till)
	SELECT DISTINCT q.qualification_id, s.qlfctn_subject_id,
		CASE WHEN (q.effective_from > s.effective_from) THEN q.effective_from ELSE s.effective_from END,
		CASE WHEN (q.effective_from < s.effective_till) THEN q.effective_till ELSE s.effective_till END
	FROM #processed p 
	JOIN qualifications q ON q.qualification_nm = p.cdb_qualification_4
	JOIN qlfctn_subjects s ON s.qlfctn_subject_nm = p.cdb_qulftn_subject_4
	LEFT OUTER JOIN qualifications_qlfctn_subjects qs ON qs.qualification_id = q.qualification_id AND qs.qlfctn_subject_id = s.qlfctn_subject_id
	WHERE p.cdb_qualification_4 IS NOT NULL AND qs.qualification_id IS NULL
	
DROP TABLE #processed;
GO

