SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertSewasPeriod
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertSewasPeriod'
			)
	BEGIN
		DROP PROCEDURE  InsertSewasPeriod
	END
GO
CREATE PROCEDURE InsertSewasPeriod
(
	@sewa_id		sewa_id,
	@start_dt		smalldatetime,
	@finish_dt		smalldatetime
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO sewas_periods
	(
		sewa_id, start_dt, finish_dt
	)
	VALUES
	(
		@sewa_id, @start_dt, @finish_dt
	)
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateSewasPeriod
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateSewasPeriod'
			)
	BEGIN
		DROP PROCEDURE  UpdateSewasPeriod
	END
GO
CREATE PROCEDURE UpdateSewasPeriod
(
	@sewa_id		sewa_id,
	@start_dt		smalldatetime,
	@finish_dt		smalldatetime,
	@old_start_dt		smalldatetime,
	@old_finish_dt		smalldatetime
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    sewas_periods
	SET
		start_dt		=	@start_dt,
		finish_dt		=	@finish_dt
	WHERE
		sewa_id			=	@sewa_id
	AND	start_dt		=	@old_start_dt
	AND	finish_dt		=	@old_finish_dt
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	DeleteSewasPeriod
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteSewasPeriod'
			)
	BEGIN
		DROP PROCEDURE  DeleteSewasPeriod
	END
GO
CREATE PROCEDURE DeleteSewasPeriod
(
	@sewa_id		sewa_id,
	@old_start_dt		smalldatetime,
	@old_finish_dt		smalldatetime
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM sewas_periods
	WHERE
		sewa_id			=	@sewa_id
	AND	start_dt		=	@old_start_dt
	AND	finish_dt		=	@old_finish_dt
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	QuerySewasPeriod
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QuerySewasPeriod'
			)
	BEGIN
		DROP PROCEDURE  QuerySewasPeriod
	END
GO
CREATE PROCEDURE QuerySewasPeriod
(
	@sewa_id		sewa_id
)
WITH ENCRYPTION
AS
BEGIN
	SELECT
		old_start_dt = start_dt, 
		old_finish_dt = finish_dt,
		start_dt, 
		finish_dt
	FROM sewas_periods
	WHERE sewa_id = @sewa_id
END
GO
-- =============================================================================



-- vim:ts=4 sw=4 ht=4

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertSewa
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertSewa'
			)
	BEGIN
		DROP PROCEDURE  InsertSewa
	END
GO
CREATE PROCEDURE InsertSewa
(
	@sewa_id					sewa_id output,
	@satsang_centre_id			satsang_centre_id,
	@sewa_cd					varchar(10),
	@sewa_nm					gnc_long_nm,
	@start_dt					smalldatetime,
	@finish_dt					smalldatetime,
	@is_satsang_programme		Boolean,
	@is_scanner_used			Boolean,
	@is_leave_allowed			Boolean,
	@is_exemption_allowed		Boolean,
	@is_default_sewa			Boolean,
	@sewa_frequency				sewa_frequency,
	@attendance_unit			attendance_unit,
	@attendance_marking			varchar(10),
	@min_sewa_duration			CreditCnt0 = NULL,
	@max_sewa_duration			CreditCnt = NULL,
	@gents_born_after			datetime = NULL,
	@ladies_born_after			datetime = NULL,
	@referred_sewa_id			sewa_id = NULL,	
	@trainee_current_seq_id 		sequence_id	=			NULL,
	@open_sewadar_current_seq_id sequence_id	=			NULL
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO sewas
	(
		satsang_centre_id, sewa_cd, sewa_nm, start_dt, finish_dt, is_satsang_programme, is_scanner_used, is_leave_allowed, is_exemption_allowed, is_default_sewa, sewa_frequency, attendance_unit, attendance_marking, min_sewa_duration, max_sewa_duration, gents_born_after, ladies_born_after, referred_sewa_id, trainee_current_seq_id, open_sewadar_current_seq_id
	)
	VALUES
	(
		@satsang_centre_id, @sewa_cd, @sewa_nm, @start_dt, @finish_dt, @is_satsang_programme, @is_scanner_used, @is_leave_allowed, @is_exemption_allowed, @is_default_sewa, @sewa_frequency, @attendance_unit, @attendance_marking, @min_sewa_duration, @max_sewa_duration, @gents_born_after, @ladies_born_after, @referred_sewa_id, @trainee_current_seq_id, @open_sewadar_current_seq_id
	)
	SELECT @sewa_id = SCOPE_IDENTITY()
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateSewa
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateSewa'
			)
	BEGIN
		DROP PROCEDURE  UpdateSewa
	END
GO
CREATE PROCEDURE UpdateSewa
(
	@sewa_id					sewa_id,
	@satsang_centre_id			satsang_centre_id,
	@sewa_cd					varchar(10),
	@sewa_nm					gnc_long_nm,
	@start_dt					smalldatetime,
	@finish_dt					smalldatetime,
	@is_satsang_programme		Boolean,
	@is_scanner_used			Boolean,
	@is_leave_allowed			Boolean,
	@is_exemption_allowed		Boolean,
	@is_default_sewa			Boolean,
	@sewa_frequency				sewa_frequency,
	@attendance_unit			attendance_unit,
	@attendance_marking			varchar(10),
	@min_sewa_duration			CreditCnt0,
	@max_sewa_duration			CreditCnt,
	@gents_born_after			datetime,
	@ladies_born_after			datetime,
	@referred_sewa_id			sewa_id,
	@trainee_current_seq_id 	sequence_id,
	@open_sewadar_current_seq_id sequence_id,
	@txn_ts						timestamp
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    sewas
	SET
		satsang_centre_id			=	@satsang_centre_id,
		sewa_cd						=	@sewa_cd,
		sewa_nm						=	@sewa_nm,
		start_dt					=	@start_dt,
		finish_dt					=	@finish_dt,
		is_satsang_programme		=	@is_satsang_programme,
		is_scanner_used				=	@is_scanner_used,
		is_leave_allowed			=	@is_leave_allowed,
		is_exemption_allowed		=	@is_exemption_allowed,
		is_default_sewa				=	@is_default_sewa,
		sewa_frequency				=	@sewa_frequency,
		attendance_unit				=	@attendance_unit,
		attendance_marking			=	@attendance_marking,
		min_sewa_duration			=	@min_sewa_duration,
		max_sewa_duration			=	@max_sewa_duration,
		gents_born_after			=	@gents_born_after,
		ladies_born_after			=	@ladies_born_after,
		referred_sewa_id			=	@referred_sewa_id,
		trainee_current_seq_id		=	@trainee_current_seq_id,
		open_sewadar_current_seq_id = 	@open_sewadar_current_seq_id
	WHERE 
	  sewa_id = @sewa_id
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
--	Procedure	DeleteSewa
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteSewa'
			)
	BEGIN
		DROP PROCEDURE  DeleteSewa
	END
GO
CREATE PROCEDURE DeleteSewa
(
	@sewa_id					sewa_id,
	@satsang_centre_id			satsang_centre_id,
	@txn_ts						timestamp
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM sewas_satsang_centres
	WHERE	sewa_id				= @sewa_id
	AND		satsang_centre_id	= @satsang_centre_id
	
	DELETE FROM sewas_periods
	WHERE	sewa_id				= @sewa_id

	DELETE FROM sewas
	WHERE sewa_id = @sewa_id
	AND	satsang_centre_id	= @satsang_centre_id
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
--	Procedure	QuerySewa
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QuerySewa'
			)
	BEGIN
		DROP PROCEDURE  QuerySewa
	END
GO
CREATE PROCEDURE QuerySewa
(
	@sewa_id					sewa_id,
	@satsang_centre_id			satsang_centre_id,
	@sewa_cd					varchar(10),
	@sewa_nm					gnc_long_nm,
	@start_dt					smalldatetime,
	@finish_dt					smalldatetime,
	@is_satsang_programme		Boolean,
	@is_scanner_used			Boolean,
	@is_leave_allowed			Boolean,
	@is_exemption_allowed		Boolean,
	@is_default_sewa			Boolean,
	@sewa_frequency				sewa_frequency,
	@attendance_unit			attendance_unit,
	@attendance_marking			varchar(10),
	@min_sewa_duration			CreditCnt0,
	@max_sewa_duration			CreditCnt,
	@gents_born_after			datetime,
	@ladies_born_after			datetime,
	@referred_sewa_id			sewa_id,
	@attendance_ts				datetime,
	@summary_ts					datetime,
	@deleted_ts					datetime,
	@locked_dtm					datetime,
	@txn_ts						timestamp
)
WITH ENCRYPTION
AS
BEGIN
	SELECT
		sewa_id, 
		satsang_centre_id, 
		sewa_cd, 
		sewa_nm, 
		start_dt, 
		finish_dt, 
		is_satsang_programme, 
		is_scanner_used, 
		is_leave_allowed, 
		is_exemption_allowed, 
		is_default_sewa, 
		sewa_frequency, 
		attendance_unit, 
		attendance_marking, 
		min_sewa_duration, 
		max_sewa_duration, 
		gents_born_after, 
		ladies_born_after, 
		referred_sewa_id, 
		attendance_ts, 
		summary_ts, 
		deleted_ts, 
		locked_dtm, 
		txn_ts
	FROM sewas
	WHERE (1 = 2) --ADD YOUR WHERE CLAUSE
END
GO
-- =============================================================================

-- =============================================================================
--	Procedure	ViewSewas
-- =============================================================================

if exists(select * from sysobjects where name = 'ViewSewas' and type='v')
begin
	drop view ViewSewas
end
go
create view ViewSewas  
as 
select ss1.*, ss2.sewa_nm as referred_sewa_nm

from Sewas ss1 
LEFT OUTER JOIN Sewas ss2
ON ss2.sewa_id = ss1.referred_sewa_id

go


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertSewasSewaShift
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertSewasSewaShift'
			)
	BEGIN
		DROP PROCEDURE  InsertSewasSewaShift
	END
GO
CREATE PROCEDURE InsertSewasSewaShift
(
	@sewa_id			sewa_id,
	@sewa_shift			sewa_shift,
	@sewa_shift_sq		display_order,
	@credit_cnt			CreditCnt,
	@unit_cnt			CreditCnt
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO sewas_sewa_shifts
	(
		sewa_id, sewa_shift, sewa_shift_sq, credit_cnt, unit_cnt
	)
	VALUES
	(
		@sewa_id, @sewa_shift, @sewa_shift_sq, @credit_cnt, @unit_cnt
	)
END
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateSewasSewaShift
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateSewasSewaShift'
			)
	BEGIN
		DROP PROCEDURE  UpdateSewasSewaShift
	END
GO
CREATE PROCEDURE UpdateSewasSewaShift
(
	@sewa_id			sewa_id,
	@sewa_shift			sewa_shift,
	@old_sewa_shift			sewa_shift,
	@sewa_shift_sq		display_order,
	@credit_cnt			CreditCnt,
	@unit_cnt			CreditCnt
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    sewas_sewa_shifts
	SET
		sewa_id				=	@sewa_id,
		sewa_shift			=	@sewa_shift,
		sewa_shift_sq		=	@sewa_shift_sq,
		credit_cnt			=	@credit_cnt,
		unit_cnt			=	@unit_cnt
	WHERE sewa_id = @sewa_id AND
	sewa_shift = @old_sewa_shift
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	DeleteSewasSewaShift
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteSewasSewaShift'
			)
	BEGIN
		DROP PROCEDURE  DeleteSewasSewaShift
	END
GO
CREATE PROCEDURE DeleteSewasSewaShift
(
	@sewa_id			sewa_id,
	@old_sewa_shift			sewa_shift
	
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM sewas_sewa_shifts
	WHERE sewa_id = @sewa_id AND
	sewa_shift = @old_sewa_shift
END
GO

-- =============================================================================
--	Procedure	MakeSewasSewaShiftSqPositive
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='MakeSewasSewaShiftSqPositive'
			)
	BEGIN
		DROP PROCEDURE  MakeSewasSewaShiftSqPositive
	END
GO
CREATE PROCEDURE MakeSewasSewaShiftSqPositive
(
	@sewa_id				sewa_id
	
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    sewas_sewa_shifts
	SET
		sewa_shift_sq = -1*sewa_shift_sq
	WHERE sewa_id = @sewa_id 		
	AND sewa_shift_sq < 0
END
GO
-- =============================================================================
--	Procedure	UpdateSewasSewaShiftSq
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateSewasSewaShiftSq'
			)
	BEGIN
		DROP PROCEDURE  UpdateSewasSewaShiftSq
	END
GO
CREATE PROCEDURE UpdateSewasSewaShiftSq
(
	@sewa_id				sewa_id,
	@old_sewa_shift			sewa_shift,
	@sewa_shift_sq			display_order
)
WITH ENCRYPTION
AS
BEGIN		
	
		UPDATE    sewas_sewa_shifts
	SET
		sewa_shift_sq = @sewa_shift_sq
	
	WHERE sewa_id = @sewa_id AND
	sewa_shift = @old_sewa_shift
		
END
GO

-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	QuerySewasSewaShift
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QuerySewasSewaShift'
			)
	BEGIN
		DROP PROCEDURE  QuerySewasSewaShift
	END
GO
CREATE PROCEDURE QuerySewasSewaShift
(
	@sewa_id			sewa_id
	
)
WITH ENCRYPTION
AS
BEGIN
	SELECT
		sewa_id, 
		sewa_shift as old_sewa_shift,
		sewa_shift, 
		sewa_shift_sq, 
		credit_cnt, 
		unit_cnt
	FROM sewas_sewa_shifts
	WHERE sewa_id = @sewa_id
END
GO
-- =============================================================================



-- vim:ts=4 sw=4 ht=4
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertSewasSatsangCentre
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertSewasSatsangCentre'
			)
	BEGIN
		DROP PROCEDURE  InsertSewasSatsangCentre
	END
GO
CREATE PROCEDURE InsertSewasSatsangCentre
(
	@sewa_id				sewa_id,
	@satsang_centre_id		satsang_centre_id
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO sewas_satsang_centres
	(
		sewa_id, satsang_centre_id
	)
	VALUES
	(
		@sewa_id, @satsang_centre_id
	)
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateSewasSatsangCentre
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateSewasSatsangCentre'
			)
	BEGIN
		DROP PROCEDURE  UpdateSewasSatsangCentre
	END
GO
CREATE PROCEDURE UpdateSewasSatsangCentre
(
	@sewa_id					sewa_id,
	@satsang_centre_id			satsang_centre_id,
	@old_satsang_centre_id		satsang_centre_id
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    sewas_satsang_centres
	SET
		sewa_id					=	@sewa_id,
		satsang_centre_id		=	@satsang_centre_id
	WHERE sewa_id					=	@sewa_id AND
		satsang_centre_id		=	@old_satsang_centre_id
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	DeleteSewasSatsangCentre
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteSewasSatsangCentre'
			)
	BEGIN
		DROP PROCEDURE  DeleteSewasSatsangCentre
	END
GO
CREATE PROCEDURE DeleteSewasSatsangCentre
(
	@sewa_id					sewa_id,
	@satsang_centre_id			satsang_centre_id,
	@old_satsang_centre_id		satsang_centre_id
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM sewas_satsang_centres
	WHERE sewa_id					=	@sewa_id AND
		satsang_centre_id		=	@old_satsang_centre_id
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	QuerySewasSatsangCentre
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QuerySewasSatsangCentre'
			)
	BEGIN
		DROP PROCEDURE  QuerySewasSatsangCentre
	END
GO
CREATE PROCEDURE QuerySewasSatsangCentre
(
	@sewa_id				sewa_id
	
)
WITH ENCRYPTION
AS
BEGIN
	SELECT
		sewa_id, 
		ssc.satsang_centre_id,
		sd.centre_nm as satsang_centre_nm,		
		ssc.satsang_centre_id  as old_satsang_centre_id
	FROM sewas_satsang_centres ssc
	JOIN CDB..satsang_centres sc ON ssc.satsang_centre_id = sc.satsang_centre_id
	JOIN satsang_centres_details sd ON sd.satsang_centre_id = ssc.satsang_centre_id
	
	WHERE sewa_id = @sewa_id
END
GO
-- =============================================================================
--	Procedure	AcceptAllSewaTeams
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='AcceptAllSewaTeams'
			)
	BEGIN
		DROP PROCEDURE  AcceptAllSewaTeams
	END
GO
CREATE PROCEDURE AcceptAllSewaTeams
(
	@sewa_id			sewa_id,
	@txn_ts				timestamp
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    t
	SET
		acceptance_ts			=	GetDate()
	FROM	sewa_teams	t
		JOIN	sewas	s
			ON	(	s.sewa_id = @sewa_id
				AND s.txn_ts	=	@txn_ts
				AND	t.sewa_id	=	s.sewa_id
			)
	WHERE	acceptance_ts	IS NULL;
	IF (@@ROWCOUNT = 0)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotUpdated', NULL, NULL, NULL, NULL
	END
END
GO

-- =============================================================================
--	Procedure	QuerySewasSewaShiftCombinations
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QuerySewasSewaShiftCombinations'
			)
	BEGIN
		DROP PROCEDURE  QuerySewasSewaShiftCombinations
	END
GO
CREATE PROCEDURE QuerySewasSewaShiftCombinations
(
	@sewa_id			sewa_id
)
WITH ENCRYPTION
AS
BEGIN
	SELECT	recorded_sewa_shift, recording_sewa_shift
	FROM	sewa_shifts_valid_combinations
	WHERE	sewa_id = @sewa_id
END
GO


-- =============================================================================
--	Procedure	DeleteSewasSewaShiftCombinations
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteSewasSewaShiftCombinations'
			)
	BEGIN
		DROP PROCEDURE  DeleteSewasSewaShiftCombinations
	END
GO
CREATE PROCEDURE DeleteSewasSewaShiftCombinations
(
	@sewa_id			sewa_id
)
WITH ENCRYPTION
AS
BEGIN
	DELETE
	FROM	sewa_shifts_valid_combinations
	WHERE	sewa_id = @sewa_id
END
GO


-- =============================================================================
--	Procedure	InsertSewasSewaShiftCombination
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertSewasSewaShiftCombination'
			)
	BEGIN
		DROP PROCEDURE  InsertSewasSewaShiftCombination
	END
GO
CREATE PROCEDURE InsertSewasSewaShiftCombination
(
	@sewa_id				sewa_id,
	@recorded_sewa_shift	sewa_shift,
	@recording_sewa_shift	sewa_shift
)
WITH ENCRYPTION
AS
BEGIN
	INSERT	INTO	sewa_shifts_valid_combinations
			(	sewa_id, recorded_sewa_shift, recording_sewa_shift	)
		VALUES
			(	@sewa_id, @recorded_sewa_shift, @recording_sewa_shift	);
END
GO
-- =============================================================================



-- vim:ts=4 sw=4 ht=4
