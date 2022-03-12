SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertScanningJobsPeriod
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertScanningJobsPeriod'
			)
	BEGIN
		DROP PROCEDURE  InsertScanningJobsPeriod
	END
GO
CREATE PROCEDURE InsertScanningJobsPeriod
(
	@scanning_job_id		scanning_job_id,
	@effective_from			datetime,
	@effective_till			datetime
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO scanning_jobs_periods
	(
		scanning_job_id, effective_from, effective_till
	)
	VALUES
	(
		@scanning_job_id, @effective_from, @effective_till
	)
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateScanningJobsPeriod
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateScanningJobsPeriod'
			)
	BEGIN
		DROP PROCEDURE  UpdateScanningJobsPeriod
	END
GO
CREATE PROCEDURE UpdateScanningJobsPeriod
(
	@scanning_job_id		scanning_job_id,
	@old_effective_from			datetime,
	@old_effective_till			datetime,
	@effective_from			datetime,
	@effective_till			datetime
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    scanning_jobs_periods
	SET
		effective_from		=	@effective_from,
		effective_till		=	@effective_till
	WHERE
		scanning_job_id		=	@scanning_job_id
	AND	effective_from		=	@old_effective_from
	AND	effective_till		=	@old_effective_till
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	DeleteScanningJobsPeriod
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteScanningJobsPeriod'
			)
	BEGIN
		DROP PROCEDURE  DeleteScanningJobsPeriod
	END
GO
CREATE PROCEDURE DeleteScanningJobsPeriod
(
	@scanning_job_id		scanning_job_id,
	@old_effective_from			datetime,
	@old_effective_till			datetime
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM scanning_jobs_periods
	WHERE
		scanning_job_id		=	@scanning_job_id
	AND	effective_from		=	@old_effective_from
	AND	effective_till		=	@old_effective_till
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	QueryScanningJobsPeriod
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QueryScanningJobsPeriod'
			)
	BEGIN
		DROP PROCEDURE  QueryScanningJobsPeriod
	END
GO
CREATE PROCEDURE QueryScanningJobsPeriod
(
	@scanning_job_id		scanning_job_id
)
WITH ENCRYPTION
AS
BEGIN
	SELECT
		old_effective_from = effective_from, 
		old_effective_till = effective_till,
		effective_from, 
		effective_till
	FROM scanning_jobs_periods
	WHERE
		scanning_job_id = @scanning_job_id 
END
GO
-- =============================================================================
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertScanningJob
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertScanningJob'
			)
	BEGIN
		DROP PROCEDURE  InsertScanningJob
	END
GO
CREATE PROCEDURE InsertScanningJob
(
	@scanning_job_id			scanning_job_id output,
	@satsang_centre_id			satsang_centre_id,
	@scanning_job_nm			gnc_nm,
	@scanning_job_type_cd		scanning_job_type_cd,
	@remarks					remarks = NULL,
	@effective_from				datetime,
	@effective_till				datetime,
	@sewadar_list_id			sewadar_list_id = NULL,
	@sewa_id					sewa_id = NULL,
	@is_deleting_allowed		Boolean,
	@status_system_info_cd		system_info_cd = NULL,
	@last_transfer_dtm			datetime = NULL,
	@total_processed_cnt		smallint = NULL,
	@is_closed					Boolean,
	@is_concluded				Boolean
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO scanning_jobs
	(
		satsang_centre_id, scanning_job_nm, scanning_job_type_cd, remarks, effective_from, effective_till, sewadar_list_id, sewa_id, is_deleting_allowed, status_system_info_cd, last_transfer_dtm, total_processed_cnt, is_closed, is_concluded
	)
	VALUES
	(
		@satsang_centre_id, @scanning_job_nm, @scanning_job_type_cd, @remarks, @effective_from, @effective_till, @sewadar_list_id, @sewa_id, @is_deleting_allowed, @status_system_info_cd, @last_transfer_dtm, @total_processed_cnt, @is_closed, @is_concluded
	)
	SELECT @scanning_job_id = SCOPE_IDENTITY()

	
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateScanningJob
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateScanningJob'
			)
	BEGIN
		DROP PROCEDURE  UpdateScanningJob
	END
GO
CREATE PROCEDURE UpdateScanningJob
(
	@scanning_job_id			scanning_job_id,
	@satsang_centre_id			satsang_centre_id,
	@scanning_job_nm			gnc_nm,
	@scanning_job_type_cd		scanning_job_type_cd,
	@remarks					remarks,
	@effective_from				datetime,
	@effective_till				datetime,
	@sewadar_list_id			sewadar_list_id,
	@sewa_id					sewa_id,
	@is_deleting_allowed		Boolean,
	@status_system_info_cd		system_info_cd,
	@last_transfer_dtm			datetime,
	@total_processed_cnt		smallint,
	@is_closed					Boolean,
	@is_concluded				Boolean,
	@txn_ts						timestamp
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    scanning_jobs
	SET
		satsang_centre_id			=	@satsang_centre_id,
		scanning_job_nm				=	@scanning_job_nm,
		scanning_job_type_cd		=	@scanning_job_type_cd,
		remarks						=	@remarks,
		effective_from				=	@effective_from,
		effective_till				=	@effective_till,
		sewadar_list_id				=	@sewadar_list_id,
		sewa_id						=	@sewa_id,
		is_deleting_allowed			=	@is_deleting_allowed,
		status_system_info_cd		=	@status_system_info_cd,
		last_transfer_dtm			=	@last_transfer_dtm,
		total_processed_cnt			=	@total_processed_cnt,
		is_closed					=	@is_closed,
		is_concluded				=	@is_concluded
	WHERE scanning_job_id = @scanning_job_id
	AND txn_ts					=	@txn_ts
	IF (@@ROWCOUNT != 1)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotUpdated', NULL, NULL, NULL, NULL
	END
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	DeleteScanningJob
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteScanningJob'
			)
	BEGIN
		DROP PROCEDURE  DeleteScanningJob
	END
GO
CREATE PROCEDURE DeleteScanningJob
(
	@scanning_job_id			scanning_job_id,
	
	@txn_ts						timestamp
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM scanning_jobs
	WHERE scanning_job_id = @scanning_job_id
	AND txn_ts=	@txn_ts
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
--	Procedure	ViewScanningJob
-- =============================================================================

IF EXISTS(SELECT * FROM sysobjects WHERE NAME = 'ViewScanningJob' AND TYPE='v')
BEGIN
	DROP VIEW ViewScanningJob
END
GO
CREATE VIEW ViewScanningJob  
AS 
SELECT
		scanning_job_id, 
		sj.satsang_centre_id, 
		scanning_job_nm, 
		scanning_job_type_cd, 
		sj.remarks, 
		effective_from, 
		effective_till, 
		sj.sewadar_list_id, 
		s.sewa_id, 
		s.sewa_nm,
		s.sewa_cd,
		is_deleting_allowed, 
		sj.status_system_info_cd, 
		status_system_info_nm = sic.system_info_nm,
		last_transfer_dtm, 
		total_processed_cnt, 
		is_closed, 
		is_concluded, 
		sj.txn_ts,
		gs.sewadar_list_nm
	FROM scanning_jobs sj
	LEFT JOIN generic_sewadar_lists gs ON gs.sewadar_list_id = sj.sewadar_list_id
	LEFT JOIN sewas s ON s.sewa_id = sj.sewa_id
	LEFT JOIN system_information_codes sic ON sic.system_info_cd = sj.status_system_info_cd

go

-- =============================================================================
--	Procedure For Scanning Job Type
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	QueryScanningJobTypes
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QueryScanningJobTypes'
			)
	BEGIN
		DROP PROCEDURE  QueryScanningJobTypes
	END
GO
CREATE PROCEDURE QueryScanningJobTypes
(	
	@scanning_job_type_cd		varchar(15)
)
WITH ENCRYPTION
AS
BEGIN
	SELECT			
		*
	FROM scanning_job_types 
	WHERE scanning_job_type_cd = @scanning_job_type_cd
	
END
GO

-- =============================================================================
--	Procedure	QueryAllScanningJobTypes
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QueryAllScanningJobTypes'
			)
	BEGIN
		DROP PROCEDURE  QueryAllScanningJobTypes
	END
GO
CREATE PROCEDURE QueryAllScanningJobTypes
WITH ENCRYPTION
AS
BEGIN
	SELECT	scanning_job_type_cd
      ,remarks
      ,is_date_wise
      ,has_sub_jobs
      ,status_system_info_cd
      ,procedure_nm
      ,cnt_procedure_nm
      ,effective_from
      ,effective_till
      ,check_in_sewadar_list
	FROM scanning_job_types 	
END
GO


-- =============================================================================
--	Procedure For Scanning Sub Jobs
-- =============================================================================

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertScanningSubJob
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertScanningSubJob'
			)
	BEGIN
		DROP PROCEDURE  InsertScanningSubJob
	END
GO
CREATE PROCEDURE InsertScanningSubJob
(
	@scanning_sub_job_id		scanning_job_id output,
	@scanning_job_id			scanning_job_id,
	@scanning_sub_job_nm		gnc_nm,
	@scanning_sub_job_sq		display_order
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO scanning_sub_jobs
	(
		scanning_job_id, scanning_sub_job_nm, scanning_sub_job_sq
	)
	VALUES
	(
		@scanning_job_id, @scanning_sub_job_nm, @scanning_sub_job_sq
	)
	SELECT @scanning_sub_job_id = SCOPE_IDENTITY()
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateScanningSubJob
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateScanningSubJob'
			)
	BEGIN
		DROP PROCEDURE  UpdateScanningSubJob
	END
GO
CREATE PROCEDURE UpdateScanningSubJob
(
	@scanning_sub_job_id		scanning_job_id,	
	@scanning_sub_job_nm		gnc_nm,
	@scanning_sub_job_sq		display_order
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    scanning_sub_jobs
	SET		
		scanning_sub_job_nm		=	@scanning_sub_job_nm,
		scanning_sub_job_sq		=	@scanning_sub_job_sq
	WHERE scanning_sub_job_id = @scanning_sub_job_id
END
GO

-- =============================================================================
--	Procedure	DeleteScanningSubJob
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteScanningSubJob'
			)
	BEGIN
		DROP PROCEDURE  DeleteScanningSubJob
	END
GO
CREATE PROCEDURE DeleteScanningSubJob
(
	@scanning_sub_job_id		scanning_job_id
	
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM scanning_sub_jobs
	WHERE scanning_sub_job_id = @scanning_sub_job_id
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	QueryScanningSubJob
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QueryScanningSubJob'
			)
	BEGIN
		DROP PROCEDURE  QueryScanningSubJob
	END
GO
CREATE PROCEDURE QueryScanningSubJob
(
	
	@scanning_job_id			scanning_job_id
	
)
WITH ENCRYPTION
AS
BEGIN
	SELECT
		scanning_sub_job_id, 		 
		scanning_sub_job_nm, 
		scanning_sub_job_sq
	FROM scanning_sub_jobs
	WHERE scanning_job_id  = @scanning_job_id
	ORDER BY scanning_sub_job_sq
END
GO
-- =============================================================================


-- =============================================================================
--	Procedure	MakeScanningSubJobSqPositive
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='MakeScanningSubJobSqPositive'
			)
	BEGIN
		DROP PROCEDURE  MakeScanningSubJobSqPositive
	END
GO
CREATE PROCEDURE MakeScanningSubJobSqPositive
(
		@scanning_job_id			scanning_job_id
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    scanning_sub_jobs
	SET
		scanning_sub_job_sq = -1*scanning_sub_job_sq
	WHERE
		scanning_job_id  =	@scanning_job_id
		
	AND scanning_sub_job_sq < 0
END
GO
-- =============================================================================
--	Procedure	UpdateScanningSubJobSq
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateScanningSubJobSq'
			)
	BEGIN
		DROP PROCEDURE  UpdateScanningSubJobSq
	END
GO
CREATE PROCEDURE UpdateScanningSubJobSq
(
	@scanning_sub_job_id		scanning_job_id,	
	@scanning_sub_job_sq		display_order	
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    scanning_sub_jobs
	SET
		scanning_sub_job_sq		=	@scanning_sub_job_sq
		
	WHERE scanning_sub_job_id		=	@scanning_sub_job_id
END
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

