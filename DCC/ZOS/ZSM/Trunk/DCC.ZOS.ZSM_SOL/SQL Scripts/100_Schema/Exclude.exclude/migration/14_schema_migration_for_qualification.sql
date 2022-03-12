/* ==================================================================================
	Source File		:	14_schema_migration_for_qualification.sql
	Author(s)		:	Manish Saluja
	Started On		:	Sun Feb 06, 2011
	Version			:	0.01
	Module ID		:	ZSM
	Language		:	TRANSACT-SQL
	Last updated	:	06-Feb-2011
	Reviewed By		:	Jiten Loyal
	Reviewed On		:
	==================================================================================
																		   Usage Notes
	----------------------------------------------------------------------------------
							* This script migrates the sms qualification data to zsm
						 	* To migrate sewadars_qualifications, qualification_mapping.xls
					    	  needs to be present in C:\TEMP folder
	==================================================================================
	==================================================================================
													  ZSM Tables Migrated in this file
	----------------------------------------------------------------------------------
																From file 13_schema.sql
																-----------------------
	* sewadars_qualifications
	==================================================================================
																	  Revision History
	----------------------------------------------------------------------------------
	v0.01 MS	* Initial version separated from 13_schema_migration.sql
	==================================================================================*/

-- ====================================================================================================
--	Sewadars Qualifications
-- ====================================================================================================
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
	@cnt1				INT,
	@cnt2				INT;

INSERT INTO #processed (sms_qualification, cdb_qualification_1, cdb_qulftn_subject_1, cdb_qualification_2, cdb_qulftn_subject_2,
	cdb_qualification_3, cdb_qulftn_subject_3, cdb_qualification_4, cdb_qulftn_subject_4, remarks)
	SELECT sms_qualification, cdb_qualification_1, cdb_qulftn_subject_1, cdb_qualification_2, cdb_qulftn_subject_2,
		cdb_qualification_3, cdb_qulftn_subject_3, cdb_qualification_4, cdb_qulftn_subject_4, remarks
	FROM OPENROWSET('Microsoft.Jet.OLEDB.4.0', 'Excel 8.0;Database=C:\TEMP\qualification_mapping.xls', 'SELECT * FROM [SMS qualification$]');

SELECT @cnt1 = (SELECT s.qualification FROM SMS..sewadars s LEFT OUTER JOIN #processed p ON s.qualification = p.sms_qualification 
				WHERE p.sms_qualification IS  NULL AND s.qualification IS NOT NULL);

IF (@cnt1 <> 0)
	BEGIN
		RAISERROR ('Some qualification in SMS is not mapped to CDB qualifications', 16, 0);
		SELECT DISTINCT s.qualification FROM SMS..sewadars s LEFT OUTER JOIN #processed p ON s.qualification = p.sms_qualification 
										WHERE p.sms_qualification IS  NULL AND s.qualification IS NOT NULL
										ORDER BY s.qualification;
	END;

SELECT @cnt1 = (SELECT COUNT(*) FROM sewadars zs
	JOIN tmp_mgr_sms_sewadar_system_record ssr ON ssr.system_id = zs.sewadar_id
	JOIN SMS..sewadars s ON s.sewadar_id = ssr.sewadar_id
	WHERE s.qualification IS NOT NULL); -- 16261

SELECT @cnt2 = (SELECT COUNT(*) FROM sewadars zs
	JOIN tmp_mgr_sms_sewadar_system_record ssr ON ssr.system_id = zs.sewadar_id
	JOIN SMS..sewadars s ON s.sewadar_id = ssr.sewadar_id
	JOIN #processed p ON p.sms_qualification = s.qualification);  -- 16261

IF (@cnt1 <> @cnt2)
	RAISERROR ('Some qualification in SMS is not mapped to CDB qualifications', 16, 0);

SELECT @cnt1 = (SELECT COUNT(*) FROM sewadars zs -- 16628
	JOIN tmp_mgr_sms_sewadar_system_record ssr ON ssr.system_id = zs.sewadar_id
	JOIN SMS..sewadars s ON s.sewadar_id = ssr.sewadar_id); -- 16628

SELECT @cnt2 = (SELECT COUNT(*) FROM sewadars zs
	JOIN tmp_mgr_sms_sewadar_system_record ssr ON ssr.system_id = zs.sewadar_id
	JOIN SMS..sewadars s ON s.sewadar_id = ssr.sewadar_id
	JOIN #processed p ON p.sms_qualification = s.qualification);  -- 16261

SET @cnt2 = @cnt2 + (SELECT COUNT(*) FROM sewadars zs
	JOIN tmp_mgr_sms_sewadar_system_record ssr ON ssr.system_id = zs.sewadar_id
	JOIN SMS..sewadars s ON s.sewadar_id = ssr.sewadar_id
	WHERE s.qualification IS NULL); -- 367

IF (@cnt1 <> @cnt2)
	RAISERROR ('Sum of mapped qualification and NULL qualification is not equal to no of sewadars', 16, 0);

SELECT @cnt1 = (SELECT COUNT(*) FROM sewadars zs
	JOIN tmp_mgr_sms_sewadar_system_record ssr ON ssr.system_id = zs.sewadar_id
	JOIN SMS..sewadars s ON s.sewadar_id = ssr.sewadar_id
	JOIN #processed p ON p.sms_qualification = s.qualification
	LEFT OUTER JOIN CDB..qualifications q ON q.qualification_nm = p.cdb_qualification_1
	WHERE q.qualification_nm IS NULL AND p.cdb_qualification_1 IS NOT NULL); -- 536 
	
SELECT @cnt2 = (SELECT COUNT(*) FROM sewadars zs
	JOIN tmp_mgr_sms_sewadar_system_record ssr ON ssr.system_id = zs.sewadar_id
	JOIN SMS..sewadars s ON s.sewadar_id = ssr.sewadar_id
	JOIN #processed p ON p.sms_qualification = s.qualification
	WHERE p.cdb_qualification_1 = 'Not to be migrated'); --> NA / Nil

IF (@cnt1 <> @cnt2)
	RAISERROR ('Some of un-mapped qualification1 is different from "Not to be migrated"', 16, 0);

SELECT @cnt1 = (SELECT COUNT(*) FROM sewadars zs
	JOIN tmp_mgr_sms_sewadar_system_record ssr ON ssr.system_id = zs.sewadar_id
	JOIN SMS..sewadars s ON s.sewadar_id = ssr.sewadar_id
	JOIN #processed p ON p.sms_qualification = s.qualification);  -- 16261

SELECT @cnt2 = (SELECT COUNT(*) FROM sewadars zs
	JOIN tmp_mgr_sms_sewadar_system_record ssr ON ssr.system_id = zs.sewadar_id
	JOIN SMS..sewadars s ON s.sewadar_id = ssr.sewadar_id
	JOIN #processed p ON p.sms_qualification = s.qualification
	WHERE p.cdb_qualification_1 IS NULL);  -- 1177

SET @cnt2 = @cnt2 + (SELECT COUNT(*) FROM sewadars zs
	JOIN tmp_mgr_sms_sewadar_system_record ssr ON ssr.system_id = zs.sewadar_id
	JOIN SMS..sewadars s ON s.sewadar_id = ssr.sewadar_id
	JOIN #processed p ON p.sms_qualification = s.qualification
	WHERE p.cdb_qualification_1 = 'Not to be migrated'); -- 536 --> NA / Nil

SET @cnt2 = @cnt2 + (SELECT COUNT(*) FROM sewadars zs
	JOIN tmp_mgr_sms_sewadar_system_record ssr ON ssr.system_id = zs.sewadar_id
	JOIN SMS..sewadars s ON s.sewadar_id = ssr.sewadar_id
	JOIN #processed p ON p.sms_qualification = s.qualification
	JOIN CDB..qualifications q ON q.qualification_nm = p.cdb_qualification_1); -- 14548

IF (@cnt1 <> @cnt2)
	RAISERROR ('Sum of NULL, un-mapped and mapped qualification1 is different from sewadars with qualification in sms', 16, 0);

SELECT @cnt1 = (SELECT COUNT(*) FROM sewadars zs
	JOIN tmp_mgr_sms_sewadar_system_record ssr ON ssr.system_id = zs.sewadar_id
	JOIN SMS..sewadars s ON s.sewadar_id = ssr.sewadar_id
	JOIN #processed p ON p.sms_qualification = s.qualification
	JOIN CDB..qualifications q ON q.qualification_nm = p.cdb_qualification_1
	LEFT OUTER JOIN CDB..qlfctn_subjects qs ON qs.qlfctn_subject_nm = p.cdb_qulftn_subject_1
	WHERE qs.qlfctn_subject_nm IS NULL AND p.cdb_qulftn_subject_1 IS NOT NULL); -- 0

IF (@cnt1 <> 0)
	RAISERROR ('Some of qualification subject1 is not mapped', 16, 0);

INSERT INTO sewadars_qualifications
			(sewadar_id, qualification_sq, qualification_id, qlfctn_subject_id)
	SELECT	zs.sewadar_id,
	COALESCE((SELECT MAX(qualification_sq) FROM sewadars_qualifications sq WHERE sq.sewadar_id = zs.sewadar_id) + 1, 1),
	q.qualification_id, qs.qlfctn_subject_id
	FROM sewadars zs
	JOIN tmp_mgr_sms_sewadar_system_record ssr ON ssr.system_id = zs.sewadar_id
	JOIN SMS..sewadars s ON s.sewadar_id = ssr.sewadar_id
	JOIN #processed p ON p.sms_qualification = s.qualification
	JOIN CDB..qualifications q ON q.qualification_nm = p.cdb_qualification_1
	LEFT OUTER JOIN CDB..qlfctn_subjects qs ON qs.qlfctn_subject_nm = p.cdb_qulftn_subject_1;

SELECT @cnt1 = (SELECT COUNT(*) FROM sewadars zs
	JOIN tmp_mgr_sms_sewadar_system_record ssr ON ssr.system_id = zs.sewadar_id
	JOIN SMS..sewadars s ON s.sewadar_id = ssr.sewadar_id
	JOIN #processed p ON p.sms_qualification = s.qualification
	LEFT OUTER JOIN CDB..qualifications q ON q.qualification_nm = p.cdb_qualification_2
	WHERE q.qualification_nm IS NULL AND p.cdb_qualification_2 IS NOT NULL); -- 0
IF (@cnt1 <> 0)
	RAISERROR ('Some of qualification2 is not mapped', 16, 0);

SELECT @cnt1 = (SELECT COUNT(*) FROM sewadars zs
	JOIN tmp_mgr_sms_sewadar_system_record ssr ON ssr.system_id = zs.sewadar_id
	JOIN SMS..sewadars s ON s.sewadar_id = ssr.sewadar_id
	JOIN #processed p ON p.sms_qualification = s.qualification);  -- 16261

SELECT @cnt2 = (SELECT COUNT(*) FROM sewadars zs
	JOIN tmp_mgr_sms_sewadar_system_record ssr ON ssr.system_id = zs.sewadar_id
	JOIN SMS..sewadars s ON s.sewadar_id = ssr.sewadar_id
	JOIN #processed p ON p.sms_qualification = s.qualification
	WHERE p.cdb_qualification_2 IS NULL);  -- 15788

SET @cnt2 = @cnt2 + (SELECT COUNT(*) FROM sewadars zs
	JOIN tmp_mgr_sms_sewadar_system_record ssr ON ssr.system_id = zs.sewadar_id
	JOIN SMS..sewadars s ON s.sewadar_id = ssr.sewadar_id
	JOIN #processed p ON p.sms_qualification = s.qualification
	JOIN CDB..qualifications q ON q.qualification_nm = p.cdb_qualification_2); -- 473

IF (@cnt1 <> @cnt2)
	RAISERROR ('Sum of NULL and mapped qualification2 is different from sewadars with qualification in sms', 16, 0);

SELECT @cnt1 = (SELECT COUNT(*) FROM sewadars zs
	JOIN tmp_mgr_sms_sewadar_system_record ssr ON ssr.system_id = zs.sewadar_id
	JOIN SMS..sewadars s ON s.sewadar_id = ssr.sewadar_id
	JOIN #processed p ON p.sms_qualification = s.qualification
	JOIN CDB..qualifications q ON q.qualification_nm = p.cdb_qualification_2
	LEFT OUTER JOIN CDB..qlfctn_subjects qs ON qs.qlfctn_subject_nm = p.cdb_qulftn_subject_2
	WHERE qs.qlfctn_subject_nm IS NULL AND p.cdb_qulftn_subject_2 IS NOT NULL); -- 0

IF (@cnt1 <> 0)
	RAISERROR ('Some of qualification subject2 is not mapped', 16, 0);

INSERT INTO sewadars_qualifications
			(sewadar_id, qualification_sq, qualification_id, qlfctn_subject_id)
	SELECT	zs.sewadar_id,
	COALESCE((SELECT MAX(qualification_sq) FROM sewadars_qualifications sq WHERE sq.sewadar_id = zs.sewadar_id) + 1, 1),
	q.qualification_id, qs.qlfctn_subject_id
	FROM sewadars zs
	JOIN tmp_mgr_sms_sewadar_system_record ssr ON ssr.system_id = zs.sewadar_id
	JOIN SMS..sewadars s ON s.sewadar_id = ssr.sewadar_id
	JOIN #processed p ON p.sms_qualification = s.qualification
	JOIN CDB..qualifications q ON q.qualification_nm = p.cdb_qualification_2
	LEFT OUTER JOIN CDB..qlfctn_subjects qs ON qs.qlfctn_subject_nm = p.cdb_qulftn_subject_2;

SELECT @cnt1 = (SELECT COUNT(*) FROM sewadars zs
	JOIN tmp_mgr_sms_sewadar_system_record ssr ON ssr.system_id = zs.sewadar_id
	JOIN SMS..sewadars s ON s.sewadar_id = ssr.sewadar_id
	JOIN #processed p ON p.sms_qualification = s.qualification
	LEFT OUTER JOIN CDB..qualifications q ON q.qualification_nm = p.cdb_qualification_3
	WHERE q.qualification_nm IS NULL AND p.cdb_qualification_3 IS NOT NULL); -- 0
IF (@cnt1 <> 0)
	RAISERROR ('Some of qualification3 is not mapped', 16, 0);

SELECT @cnt1 = (SELECT COUNT(*) FROM sewadars zs
	JOIN tmp_mgr_sms_sewadar_system_record ssr ON ssr.system_id = zs.sewadar_id
	JOIN SMS..sewadars s ON s.sewadar_id = ssr.sewadar_id
	JOIN #processed p ON p.sms_qualification = s.qualification);  -- 16261

SELECT @cnt2 = (SELECT COUNT(*) FROM sewadars zs
	JOIN tmp_mgr_sms_sewadar_system_record ssr ON ssr.system_id = zs.sewadar_id
	JOIN SMS..sewadars s ON s.sewadar_id = ssr.sewadar_id
	JOIN #processed p ON p.sms_qualification = s.qualification
	WHERE p.cdb_qualification_3 IS NULL);  -- 16211

SET @cnt2 = @cnt2 + (SELECT COUNT(*) FROM sewadars zs
	JOIN tmp_mgr_sms_sewadar_system_record ssr ON ssr.system_id = zs.sewadar_id
	JOIN SMS..sewadars s ON s.sewadar_id = ssr.sewadar_id
	JOIN #processed p ON p.sms_qualification = s.qualification
	JOIN CDB..qualifications q ON q.qualification_nm = p.cdb_qualification_3); -- 50

IF (@cnt1 <> @cnt2)
	RAISERROR ('Sum of NULL and mapped qualification3 is different from sewadars with qualification in sms', 16, 0);

SELECT @cnt1 = (SELECT COUNT(*) FROM sewadars zs
	JOIN tmp_mgr_sms_sewadar_system_record ssr ON ssr.system_id = zs.sewadar_id
	JOIN SMS..sewadars s ON s.sewadar_id = ssr.sewadar_id
	JOIN #processed p ON p.sms_qualification = s.qualification
	JOIN CDB..qualifications q ON q.qualification_nm = p.cdb_qualification_3
	LEFT OUTER JOIN CDB..qlfctn_subjects qs ON qs.qlfctn_subject_nm = p.cdb_qulftn_subject_3
	WHERE qs.qlfctn_subject_nm IS NULL AND p.cdb_qulftn_subject_3 IS NOT NULL); -- 0

IF (@cnt1 <> 0)
	RAISERROR ('Some of qualification subject3 is not mapped', 16, 0);

INSERT INTO sewadars_qualifications
			(sewadar_id, qualification_sq, qualification_id, qlfctn_subject_id)
	SELECT	zs.sewadar_id,
	COALESCE((SELECT MAX(qualification_sq) FROM sewadars_qualifications sq WHERE sq.sewadar_id = zs.sewadar_id) + 1, 1),
	q.qualification_id, qs.qlfctn_subject_id
	FROM sewadars zs
	JOIN tmp_mgr_sms_sewadar_system_record ssr ON ssr.system_id = zs.sewadar_id
	JOIN SMS..sewadars s ON s.sewadar_id = ssr.sewadar_id
	JOIN #processed p ON p.sms_qualification = s.qualification
	JOIN CDB..qualifications q ON q.qualification_nm = p.cdb_qualification_3
	LEFT OUTER JOIN CDB..qlfctn_subjects qs ON qs.qlfctn_subject_nm = p.cdb_qulftn_subject_3;

SELECT @cnt1 = (SELECT COUNT(*) FROM sewadars zs
	JOIN tmp_mgr_sms_sewadar_system_record ssr ON ssr.system_id = zs.sewadar_id
	JOIN SMS..sewadars s ON s.sewadar_id = ssr.sewadar_id
	JOIN #processed p ON p.sms_qualification = s.qualification
	LEFT OUTER JOIN CDB..qualifications q ON q.qualification_nm = p.cdb_qualification_4
	WHERE q.qualification_nm IS NULL AND p.cdb_qualification_4 IS NOT NULL); -- 0
IF (@cnt1 <> 0)
	RAISERROR ('Some of qualification4 is not mapped', 16, 0);

SELECT @cnt1 = (SELECT COUNT(*) FROM sewadars zs
	JOIN tmp_mgr_sms_sewadar_system_record ssr ON ssr.system_id = zs.sewadar_id
	JOIN SMS..sewadars s ON s.sewadar_id = ssr.sewadar_id
	JOIN #processed p ON p.sms_qualification = s.qualification);  -- 16261

SELECT @cnt2 = (SELECT COUNT(*) FROM sewadars zs
	JOIN tmp_mgr_sms_sewadar_system_record ssr ON ssr.system_id = zs.sewadar_id
	JOIN SMS..sewadars s ON s.sewadar_id = ssr.sewadar_id
	JOIN #processed p ON p.sms_qualification = s.qualification
	WHERE p.cdb_qualification_4 IS NULL);  -- 16252

SET @cnt2 = @cnt2 + (SELECT COUNT(*) FROM sewadars zs
	JOIN tmp_mgr_sms_sewadar_system_record ssr ON ssr.system_id = zs.sewadar_id
	JOIN SMS..sewadars s ON s.sewadar_id = ssr.sewadar_id
	JOIN #processed p ON p.sms_qualification = s.qualification
	JOIN CDB..qualifications q ON q.qualification_nm = p.cdb_qualification_4); -- 9

IF (@cnt1 <> @cnt2)
	RAISERROR ('Sum of NULL and mapped qualification4 is different from sewadars with qualification in sms', 16, 0);

SELECT @cnt1 = (SELECT COUNT(*) FROM sewadars zs
	JOIN tmp_mgr_sms_sewadar_system_record ssr ON ssr.system_id = zs.sewadar_id
	JOIN SMS..sewadars s ON s.sewadar_id = ssr.sewadar_id
	JOIN #processed p ON p.sms_qualification = s.qualification
	JOIN CDB..qualifications q ON q.qualification_nm = p.cdb_qualification_4
	LEFT OUTER JOIN CDB..qlfctn_subjects qs ON qs.qlfctn_subject_nm = p.cdb_qulftn_subject_4
	WHERE qs.qlfctn_subject_nm IS NULL AND p.cdb_qulftn_subject_4 IS NOT NULL); -- 0

IF (@cnt1 <> 0)
	RAISERROR ('Some of qualification subject4 is not mapped', 16, 0);

INSERT INTO sewadars_qualifications
			(sewadar_id, qualification_sq, qualification_id, qlfctn_subject_id)
	SELECT	zs.sewadar_id,
	COALESCE((SELECT MAX(qualification_sq) FROM sewadars_qualifications sq WHERE sq.sewadar_id = zs.sewadar_id) + 1, 1),
	q.qualification_id, qs.qlfctn_subject_id
	FROM sewadars zs
	JOIN tmp_mgr_sms_sewadar_system_record ssr ON ssr.system_id = zs.sewadar_id
	JOIN SMS..sewadars s ON s.sewadar_id = ssr.sewadar_id
	JOIN #processed p ON p.sms_qualification = s.qualification
	JOIN CDB..qualifications q ON q.qualification_nm = p.cdb_qualification_4
	LEFT OUTER JOIN CDB..qlfctn_subjects qs ON qs.qlfctn_subject_nm = p.cdb_qulftn_subject_4;

-- remarks_type='Migration' & remarks_sq=4 is for storing qualification (column of SMS..sewadars table) for sewadars where the qualification specified was not clear (partially or completely)
INSERT INTO sewadars_remarks
			(sewadar_id, remarks_type, remarks_sq, remarks)
	SELECT	zs.sewadar_id, 'Migration', 4, p.remarks
	FROM sewadars zs
	JOIN tmp_mgr_sms_sewadar_system_record ssr ON ssr.system_id = zs.sewadar_id
	JOIN SMS..sewadars s ON s.sewadar_id = ssr.sewadar_id
	JOIN #processed p ON p.sms_qualification = s.qualification
	WHERE p.remarks IS NOT NULL;

DROP TABLE #processed;
GO
-- ====================================================================================================

