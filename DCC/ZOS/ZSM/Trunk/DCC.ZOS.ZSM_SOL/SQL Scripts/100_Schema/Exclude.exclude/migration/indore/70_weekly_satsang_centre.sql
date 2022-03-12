/* ==================================================================================
	Source File		:	weekly_satsang_centre.sql
	Author(s)		:	Manish Saluja / Jitendra Loyal
	Started On		:	
	Version			:	
	Module ID		:	ZSM (Indore)
	Language		:	TRANSACT-SQL
	Last updated	:	2 Jun 2012
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
	weekly_satsang_centre_nm		VARCHAR (200),
	CDB_satsang_centre_nm			VARCHAR (200)
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
		weekly_satsang_centre_nm, CDB_satsang_centre_nm
	)
	SELECT 
		weekly_satsang_centre_nm, CDB_satsang_centre_nm
	FROM OPENROWSET('Microsoft.Jet.OLEDB.4.0', 'Excel 8.0;Database=C:\TEMP\zsm_indore_weekly_satsang_centre.xls', 'SELECT * FROM [Indore Data$]');
  
GO

CREATE TABLE mgr_tmp_weekly_satsang_centres
(
	weekly_satsang_centre_nm	VARCHAR (25),
	CDB_satsang_centre_nm		VARCHAR (25)
)
GO

INSERT INTO mgr_tmp_weekly_satsang_centres
	(
		weekly_satsang_centre_nm, CDB_satsang_centre_nm
	)
	SELECT 
		weekly_satsang_centre_nm, CDB_satsang_centre_nm
	FROM #processed;

SELECT * FROM mgr_tmp_weekly_satsang_centres m
WHERE NOT EXISTS 	( SELECT 1 FROM satsang_centres_details d JOIN CDB..satsang_centres s ON s.satsang_centre_id = d.satsang_centre_id
						WHERE s.satsang_centre_nm = m.CDB_satsang_centre_nm
					)
AND EXISTS ( SELECT 1 FROM CDB..satsang_centres s WHERE s.satsang_centre_nm = m.CDB_satsang_centre_nm );

IF (@@ROWCOUNT > 0)
	RAISERROR ('Some satsang_centres are no did not transfered from CDB to ZSM', 16, 0);

UPDATE m
	SET weekly_satsang_centre_id = s.satsang_centre_id
	FROM mgr_centre_sewadars m
	JOIN mgr_tmp_weekly_satsang_centres t ON t.weekly_satsang_centre_nm = m.weekly_satsang_centre_nm
	JOIN CDB..satsang_centres s ON 
		s.satsang_centre_nm		=		t.CDB_satsang_centre_nm AND 
		GETDATE()			BETWEEN		s.effective_from AND s.effective_till
	WHERE m.is_migrated = 'N';
 
UPDATE m
	SET weekly_satsang_centre_id = s.satsang_centre_id
	FROM mgr_centre_sewadars m
	JOIN CDB..satsang_centres s ON 
		s.satsang_centre_nm		=		m.weekly_satsang_centre_nm AND 
		GETDATE()			BETWEEN		s.effective_from AND s.effective_till
	WHERE m.is_migrated = 'N';

GO


DROP TABLE #processed;
DROP TABLE mgr_tmp_weekly_satsang_centres;
GO

