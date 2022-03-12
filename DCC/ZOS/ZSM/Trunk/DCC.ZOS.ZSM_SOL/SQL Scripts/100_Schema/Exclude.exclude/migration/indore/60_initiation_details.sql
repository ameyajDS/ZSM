/* ==================================================================================
	Source File		:	initiation_details.sql
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

UPDATE mgr_centre_sewadars
	SET	initiation_place	= 'Ahmedabad'
	WHERE	is_migrated			= 'N'
	AND		initiation_place	= 'Ahmedbad';

UPDATE mgr_centre_sewadars
	SET	initiation_place	= 'Dera'
	WHERE	is_migrated			= 'N'
	AND		initiation_place	= 'Beas';

IF EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = '#processed')
	DROP TABLE #processed
GO

CREATE TABLE #processed 
(
	centre_grno			VARCHAR (200),
	patron_id			VARCHAR (200)
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
		centre_grno, patron_id
	)
	SELECT 
		centre_grno, patron_id
	FROM OPENROWSET('Microsoft.Jet.OLEDB.4.0', 'Excel 8.0;Database=C:\TEMP\zsm_indore_initiation_details.xls', 'SELECT * FROM [Indore Data$]');
  
GO

CREATE TABLE mgr_tmp_initiation_by
(
	centre_grno			VARCHAR (10),
	patron_id			INT
)
GO

INSERT INTO mgr_tmp_initiation_by
	(
		centre_grno, patron_id
	)
	SELECT 
		centre_grno, patron_id
	FROM #processed;

UPDATE m
	SET m.initiation_by			= i.patron_id,
		m.initiation_place_id	= p.place_id
	FROM mgr_centre_sewadars m
	JOIN mgr_tmp_initiation_by i	ON i.centre_grno	= m.centre_grno
	JOIN CDB..initiation_places p	ON p.place_nm		= m.initiation_place
	WHERE	m.is_migrated	= 'N'
	AND		m.is_initiated	= 1;
	
UPDATE m
	SET m.initiation_by			=	NULL,
		m.initiation_dt			=	NULL,
		m.initiation_place_id	=	NULL	
	FROM mgr_centre_sewadars m
	WHERE	m.is_migrated	= 'N'
	AND		NOT EXISTS (SELECT 1 FROM mgr_tmp_initiation_by i WHERE i.centre_grno = m.centre_grno);
		
GO

DROP TABLE #processed;
DROP TABLE mgr_tmp_initiation_by;
GO

