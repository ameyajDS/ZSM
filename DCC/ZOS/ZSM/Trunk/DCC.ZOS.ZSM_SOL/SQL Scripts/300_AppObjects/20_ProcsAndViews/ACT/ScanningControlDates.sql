
/* ==================================================================================
    Source File		:	ScanningControlDates.sql
    Author(s)		:	Jitendra Loyal (JL)/ Ameya Jadhav (AJ)
    Started On		:	Sun Nov 28 01:00:00 IST 2010
    Version			:	0.04
    Last updated	:	Oct 13, 2012
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:	
    Reviewed On		:	
    ==================================================================================
									   Usage Notes
    ----------------------------------------------------------------------------------

    ==================================================================================
								      Revision History
    ----------------------------------------------------------------------------------
	 JL : 0.04 : 13-Oct-2012
		* Added TXN_TS in WHERE Clause for deleting in SP DeleteScanningJobsControllingDate
	 AJ : 0.03 : 13-Oct-2012
		* Added new parameter to SP DeleteScanningJobsControllingDate as controlling_dt
	 AJ : 0.02 : 10-Jun-2012
		* Deleted unwanted SPs UpdateScanningJobsControllingDate, QueryScanningJobsControllingDate
		* Updated DeleteScanningJobsControllingDate to validate the deletion of controlling date 
		if any corresponding record exists for it in scanned badges
   ==================================================================================*/


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertScanningJobsControllingDate
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertScanningJobsControllingDate'
			)
	BEGIN
		DROP PROCEDURE  InsertScanningJobsControllingDate
	END
GO
CREATE PROCEDURE InsertScanningJobsControllingDate
(
	@scanning_job_id			scanning_job_id,
	@controlling_dt				smalldatetime,
	@last_transfer_dtm			datetime = NULL,
	@total_processed_cnt		smallint = NULL,
	@is_closed					Boolean
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO scanning_jobs_controlling_dates
	(
		scanning_job_id, controlling_dt, last_transfer_dtm, total_processed_cnt, is_closed
	)
	VALUES
	(
		@scanning_job_id, @controlling_dt, @last_transfer_dtm, @total_processed_cnt, @is_closed
	)
END
GO
-- =============================================================================

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	DeleteScanningJobsControllingDate
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteScanningJobsControllingDate'
			)
	BEGIN
		DROP PROCEDURE  DeleteScanningJobsControllingDate
	END
GO
CREATE PROCEDURE DeleteScanningJobsControllingDate
(
	@scanning_job_id			scanning_job_id,
	@controlling_dt				DATETIME,
	@txn_ts						timestamp
)
WITH ENCRYPTION
AS
BEGIN
	IF EXISTS (	SELECT TOP 1 1
				FROM scanned_badges sb
				JOIN scanning_sub_jobs ss
					ON	(   ss.scanning_sub_job_id = sb.scanning_sub_job_id
						AND	ss.scanning_job_id	=	@scanning_job_id
						)
				JOIN scanning_jobs_controlling_dates sc
					ON  (	sb.controlling_dt = sc.controlling_dt
						AND	sc.scanning_job_id = @scanning_job_id
						)
				)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'DeleteNotAllowed', NULL, 'Controlling Date', 'as Badges are scanned', NULL
	END
	
	IF EXISTS (SELECT TOP 1 1
				FROM scanning_jobs_controlling_dates
				WHERE	is_closed = 'Yes'
				AND		last_transfer_dtm IS NOT NULL
				AND		scanning_job_id		=	@scanning_job_id
				AND		controlling_dt		=	@controlling_dt)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'DeleteNotAllowed', NULL, 'Controlling Date', 'as it is already processed', NULL
	END

	DELETE FROM scanning_jobs_controlling_dates
	WHERE scanning_job_id	=	@scanning_job_id
	AND controlling_dt		=	@controlling_dt
	AND	txn_ts				=	@txn_ts;
	
	IF (@@ROWCOUNT != 1)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotDeleted', NULL, NULL, NULL, NULL
	END
END
GO
-- =============================================================================

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	ViewScanningJobsControllingDate
-- =============================================================================
IF EXISTS	(	SELECT  *
				FROM    sysobjects
				WHERE name = 'ViewScanningJobsControllingDate' and TYPE='v'
			)

	BEGIN
		DROP VIEW ViewScanningJobsControllingDate
	END
GO
CREATE VIEW ViewScanningJobsControllingDate

WITH ENCRYPTION
AS
	SELECT
		cd.scanning_job_id,
		sj.scanning_job_nm,
		sj.satsang_centre_id,
		jt.scanning_job_type_cd,
		cd.controlling_dt,
		cd.last_transfer_dtm,
		cd.total_processed_cnt,
		cd.is_closed,
		cd.txn_ts
	FROM scanning_jobs_controlling_dates cd
	JOIN scanning_jobs sj ON sj.scanning_job_id = cd.scanning_job_id
	JOIN scanning_job_types jt ON jt.scanning_job_type_cd = sj.scanning_job_type_cd
	
GO


-- =============================================================================
-- vim:ts=4 ht=8 sw=4 guifont=Lucida_Console

