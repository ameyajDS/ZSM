SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertScanningSubJobsValidation
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertScanningSubJobsValidation'
			)
	BEGIN
		DROP PROCEDURE  InsertScanningSubJobsValidation
	END
GO
CREATE PROCEDURE InsertScanningSubJobsValidation
(
	@recorded_sub_job_id		scanning_job_id,
	@recording_sub_job_id		scanning_job_id,
	@validating_action			scanning_validating_action
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO scanning_sub_jobs_validations
	(
		recorded_sub_job_id, recording_sub_job_id, validating_action
	)
	VALUES
	(
		@recorded_sub_job_id, @recording_sub_job_id, @validating_action
	)
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateScanningSubJobsValidation
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateScanningSubJobsValidation'
			)
	BEGIN
		DROP PROCEDURE  UpdateScanningSubJobsValidation
	END
GO
CREATE PROCEDURE UpdateScanningSubJobsValidation
(
	@recorded_sub_job_id		scanning_job_id,
	@recording_sub_job_id		scanning_job_id,
	@validating_action			scanning_validating_action
)
WITH ENCRYPTION
AS
BEGIN
	EXEC DeleteScanningSubJobsValidation @recorded_sub_job_id,@recording_sub_job_id

	EXEC InsertScanningSubJobsValidation  @recorded_sub_job_id,@recording_sub_job_id,@validating_action
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	DeleteScanningSubJobsValidation
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteScanningSubJobsValidation'
			)
	BEGIN
		DROP PROCEDURE  DeleteScanningSubJobsValidation
	END
GO
CREATE PROCEDURE DeleteScanningSubJobsValidation
(
	@recorded_sub_job_id		scanning_job_id,
	@recording_sub_job_id		scanning_job_id
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM scanning_sub_jobs_validations
	WHERE recorded_sub_job_id = @recorded_sub_job_id
	AND recording_sub_job_id = @recording_sub_job_id
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	QueryScanningSubJobsValidation
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QueryScanningSubJobsValidation'
			)
	BEGIN
		DROP PROCEDURE  QueryScanningSubJobsValidation
	END
GO
CREATE PROCEDURE QueryScanningSubJobsValidation
(
	@scanning_job_id		scanning_job_id
	
)
WITH ENCRYPTION
AS
BEGIN
	SELECT 	
	recorded_sub_job_id,
	recording_sub_job_id,
	ss.scanning_sub_job_nm as recorded_sub_job_name,
	ssing.scanning_sub_job_nm as recording_sub_job_name,
	validating_action
	FROM scanning_sub_jobs_validations sv
	JOIN scanning_sub_jobs ss ON ss.scanning_sub_job_id = sv.recorded_sub_job_id
	JOIN scanning_sub_jobs ssing ON ssing.scanning_sub_job_id = sv.recording_sub_job_id
	JOIN scanning_jobs s ON s.scanning_job_id = ss.scanning_job_id
	WHERE s.scanning_job_id =  @scanning_job_id
END
GO
-- =============================================================================

-- =============================================================================
--	Procedure	PopulateDefaultScanningSubJobsValidation
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='PopulateDefaultScanningSubJobsValidation'
			)
	BEGIN
		DROP PROCEDURE  PopulateDefaultScanningSubJobsValidation
	END
GO
CREATE PROCEDURE PopulateDefaultScanningSubJobsValidation
(
	@scanning_job_id		scanning_job_id
)
WITH ENCRYPTION
AS
BEGIN
	SELECT
		ss1.scanning_sub_job_nm as recorded_sub_job_name,
		ss2.scanning_sub_job_nm as recording_sub_job_name,
		ss1.scanning_sub_job_id as recorded_sub_job_id,
		ss2.scanning_sub_job_id as recording_sub_job_id,
		'' as validating_action
		
	FROM scanning_sub_jobs ss1 JOIN scanning_sub_jobs ss2 ON ss1.scanning_job_id = ss2.scanning_job_id
	JOIN scanning_jobs s ON s.scanning_job_id = ss1.scanning_job_id
	WHERE s.scanning_job_id =  @scanning_job_id
		
END
GO



-- vim:ts=4 sw=4 ht=4

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertScanningSubJobsValidCombination
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertScanningSubJobsValidCombination'
			)
	BEGIN
		DROP PROCEDURE  InsertScanningSubJobsValidCombination
	END
GO
CREATE PROCEDURE InsertScanningSubJobsValidCombination
(
	@scanning_job_id					scanning_job_id,
	@scanning_job_valid_sq				display_order,
	@valid_combination_sub_job_ids		varchar(35)
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO scanning_sub_jobs_valid_combinations
	(
		scanning_job_id, scanning_job_valid_sq, valid_combination_sub_job_ids
	)
	VALUES
	(
		@scanning_job_id, @scanning_job_valid_sq, @valid_combination_sub_job_ids
	)
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateScanningSubJobsValidCombination
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateScanningSubJobsValidCombination'
			)
	BEGIN
		DROP PROCEDURE  UpdateScanningSubJobsValidCombination
	END
GO
CREATE PROCEDURE UpdateScanningSubJobsValidCombination
(
	@scanning_job_id					scanning_job_id,
	@scanning_job_valid_sq				display_order,
	@valid_combination_sub_job_ids		varchar(35),
	@old_valid_combination_sub_job_ids		varchar(35)
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    scanning_sub_jobs_valid_combinations
	SET		
		scanning_job_valid_sq				=	@scanning_job_valid_sq,
		valid_combination_sub_job_ids		=	@valid_combination_sub_job_ids
	WHERE scanning_job_id	=	@scanning_job_id
	AND valid_combination_sub_job_ids = @old_valid_combination_sub_job_ids
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	DeleteScanningSubJobsValidCombination
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteScanningSubJobsValidCombination'
			)
	BEGIN
		DROP PROCEDURE  DeleteScanningSubJobsValidCombination
	END
GO
CREATE PROCEDURE DeleteScanningSubJobsValidCombination
(
	@scanning_job_id					scanning_job_id,	
	@old_valid_combination_sub_job_ids		varchar(35)
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM scanning_sub_jobs_valid_combinations
	WHERE scanning_job_id	=	@scanning_job_id
	AND valid_combination_sub_job_ids = @old_valid_combination_sub_job_ids
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	QueryScanningSubJobsValidCombination
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QueryScanningSubJobsValidCombination'
			)
	BEGIN
		DROP PROCEDURE  QueryScanningSubJobsValidCombination
	END
GO
CREATE PROCEDURE QueryScanningSubJobsValidCombination
(
	@scanning_job_id					scanning_job_id
	
)
WITH ENCRYPTION
AS
BEGIN
	SELECT		
		scanning_job_valid_sq, 
		valid_combination_sub_job_ids,
		valid_combination_sub_job_ids as old_valid_combination_sub_job_ids
	FROM scanning_sub_jobs_valid_combinations
	WHERE scanning_job_id = @scanning_job_id
END
GO
-- =============================================================================



-- vim:ts=4 sw=4 ht=4

IF  EXISTS (SELECT 1 FROM sysobjects WHERE NAME = 'fnGetSubJobName' AND TYPE = 'FN')
DROP FUNCTION [dbo].[fnGetSubJobName]
GO
CREATE FUNCTION [dbo].[fnGetSubJobName]
(
	@scanning_sub_job_id 		scanning_job_id
)
RETURNS VARCHAR
AS
BEGIN
	-- Declare the return variable here
	
	DECLARE @subJobName VARCHAR(30)
	
	SELECT @subJobName = scanning_sub_job_nm from scanning_sub_jobs where scanning_sub_job_id = @scanning_sub_job_id	
	
	RETURN @subJobName
END
GO


-- =============================================================================
--	Procedure	MakeSubJobsValidCombinationSqPositive
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='MakeSubJobsValidCombinationSqPositive'
			)
	BEGIN
		DROP PROCEDURE  MakeSubJobsValidCombinationSqPositive
	END
GO
CREATE PROCEDURE MakeSubJobsValidCombinationSqPositive
(
		@scanning_job_id			scanning_job_id
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    scanning_sub_jobs_valid_combinations
	SET
		scanning_job_valid_sq = -1*scanning_job_valid_sq
	WHERE
		scanning_job_id  =	@scanning_job_id
		
	AND scanning_job_valid_sq < 0
END
GO
-- =============================================================================
--	Procedure	UpdateSubJobsValidCombinationSq
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateSubJobsValidCombinationSq'
			)
	BEGIN
		DROP PROCEDURE  UpdateSubJobsValidCombinationSq
	END
GO
CREATE PROCEDURE UpdateSubJobsValidCombinationSq
(
	@scanning_job_id						scanning_job_id,	
	@old_valid_combination_sub_job_ids		varchar(35),
	@scanning_job_valid_sq					display_order	
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    scanning_sub_jobs_valid_combinations
	SET
		scanning_job_valid_sq		=	@scanning_job_valid_sq
		
	WHERE scanning_job_id	=	@scanning_job_id
	AND valid_combination_sub_job_ids = @old_valid_combination_sub_job_ids
END
GO

-- =============================================================================
--	Procedure	QueryScanningJobForInsertMode
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QueryScanningJobForInsertMode'
			)
	BEGIN
		DROP PROCEDURE  QueryScanningJobForInsertMode
	END
GO
CREATE PROCEDURE QueryScanningJobForInsertMode
(
	
	@scanning_job_id			scanning_job_id	
	
)
WITH ENCRYPTION
AS
BEGIN
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
		is_deleting_allowed, 
		status_system_info_cd, 
		last_transfer_dtm, 
		total_processed_cnt, 
		is_closed, 
		is_concluded, 
		sj.txn_ts,
		gs.sewadar_list_nm
	FROM scanning_jobs sj
	LEFT JOIN generic_sewadar_lists gs ON gs.sewadar_list_id = sj.sewadar_list_id
	LEFT JOIN sewas s ON s.sewa_id = sj.sewa_id
	WHERE scanning_job_id  = @scanning_job_id
	
END
GO

-- =============================================================================
--	Procedure	UpdateScanningJobTxnTs
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateScanningJobTxnTs'
			)
	BEGIN
		DROP PROCEDURE  UpdateScanningJobTxnTs
	END
GO
CREATE PROCEDURE UpdateScanningJobTxnTs
(
	@scanning_job_id			scanning_job_id,
	@txn_ts						timestamp
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    scanning_jobs
	SET
		satsang_centre_id = satsang_centre_id
	WHERE scanning_job_id = @scanning_job_id
	AND txn_ts					=	@txn_ts
	IF (@@ROWCOUNT != 1)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotUpdated', NULL, NULL, NULL, NULL
	END
END
GO
-- =============================================================================
