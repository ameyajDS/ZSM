SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertSpeakers
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertSpeakers'
			)
	BEGIN
		DROP PROCEDURE  InsertSpeakers
	END
GO

CREATE PROCEDURE InsertSpeakers
(
	@speaker_id					sewadar_id,
	@speaker_type				SpeakerType,
	@satsang_centre_id 			satsang_centre_id,
	@speaker_status				SpeakerStatus,
	@speaker_status_dtm			SMALLDATETIME
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO speakers
	(
		speaker_id, speaker_type, satsang_centre_id, speaker_status, speaker_status_dtm
	)
	VALUES
	(
		@speaker_id, @speaker_type, @satsang_centre_id, @speaker_status, @speaker_status_dtm
	)
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateSpeakers
-- =============================================================================

IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateSpeakers'
			)
	BEGIN
		DROP PROCEDURE  UpdateSpeakers
	END
GO

CREATE PROCEDURE UpdateSpeakers
(
	@speaker_id					sewadar_id,
	@speaker_type				SpeakerType,
	@satsang_centre_id 			satsang_centre_id,
	@speaker_status				SpeakerStatus,
	@speaker_status_dtm			SMALLDATETIME,
	@txn_ts						TIMESTAMP
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE speakers
	SET
		speaker_type			=	@speaker_type,
		speaker_status			=	@speaker_status,
		speaker_status_dtm		=	@speaker_status_dtm
	WHERE
		speaker_id				=	@speaker_id
	AND satsang_centre_id		=	@satsang_centre_id
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
--	Procedure	DeleteSpeakers
-- =============================================================================

IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteSpeakers'
			)
	BEGIN
		DROP PROCEDURE  DeleteSpeakers
	END
GO	

CREATE PROCEDURE DeleteSpeakers
(
	@speaker_id				sewadar_id,
	@satsang_centre_id		satsang_centre_id,
	@txn_ts					TIMESTAMP
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM speakers
	WHERE
		speaker_id				=	@speaker_id
	AND satsang_centre_id		=	@satsang_centre_id
	AND	txn_ts					=	@txn_ts
	
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
--	Procedure	QuerySpeakers
-- =============================================================================

IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QuerySpeakers'
			)
	BEGIN
		DROP PROCEDURE  QuerySpeakers
	END
GO	

CREATE PROCEDURE QuerySpeakers
(
	@speaker_id				sewadar_id
)
WITH ENCRYPTION
AS
BEGIN
	SELECT
		s.speaker_id,
		s.speaker_type,
		scd.satsang_centre_id,
		scd.is_main_centre,
		scd.centre_nm,
		s.speaker_status,
		s.speaker_status_dtm,
		s.txn_ts
	FROM speakers s
	JOIN satsang_centres_details scd ON scd.satsang_centre_id = s.satsang_centre_id
	WHERE
		s.speaker_id		= @speaker_id
	ORDER BY 
		s.speaker_id
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertSpeakersApprovalsRenewals
-- =============================================================================

IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertSpeakersApprovalsRenewals'
			)
	BEGIN
		DROP PROCEDURE  InsertSpeakersApprovalsRenewals
	END
GO

CREATE PROCEDURE InsertSpeakersApprovalsRenewals
(
	@speaker_id						sewadar_id,
	@request_for_speaker_type		SpeakerType,
	@is_approval					BIT,
	@approval_dt					DATE,
	@request_dt						DATE,
	@reference_no					VARCHAR (20),
	@reference_dt					DATE,
	@audition_remarks				VARCHAR (200),
	@review_remarks					VARCHAR (200),
	@review_sewadar_id				sewadar_id,
	@review_non_sewadar_nm			VARCHAR (30),
	@remarks						VARCHAR (200)
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO speakers_approvals_renewals
	(
		speaker_id, request_for_speaker_type, is_approval, approval_dt, request_dt, reference_no, reference_dt, audition_remarks, review_remarks, review_sewadar_id, review_non_sewadar_nm, remarks
	)
	VALUES
	(
		@speaker_id, @request_for_speaker_type, @is_approval, @approval_dt, @request_dt, @reference_no, @reference_dt, @audition_remarks, @review_remarks, @review_sewadar_id, @review_non_sewadar_nm, @remarks
	)
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateSpeakersApprovalsRenewals
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateSpeakersApprovalsRenewals'
			)
	BEGIN
		DROP PROCEDURE  UpdateSpeakersApprovalsRenewals
	END
GO

CREATE PROCEDURE UpdateSpeakersApprovalsRenewals
(
	@speaker_id						sewadar_id,
	@request_for_speaker_type		SpeakerType,
	@is_approval					BIT,
	@approval_dt					DATE,
	@request_dt						DATE,
	@reference_no					VARCHAR (20),
	@reference_dt					DATE,
	@audition_remarks				VARCHAR (200),
	@review_remarks					VARCHAR (200),
	@review_sewadar_id				sewadar_id,
	@review_non_sewadar_nm			VARCHAR (30),
	@remarks						VARCHAR (200),
	@txn_ts							TIMESTAMP
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE speakers_approvals_renewals
	SET 
		request_for_speaker_type	=		@request_for_speaker_type,
		is_approval					=		@is_approval,
		approval_dt					=		@approval_dt,
		request_dt					=		@request_dt,
		reference_no				=		@reference_no,
		reference_dt				=		@reference_dt,
		audition_remarks			=		@audition_remarks,
		review_remarks				=		@review_remarks,
		review_sewadar_id			=		@review_sewadar_id,
		review_non_sewadar_nm		=		@review_non_sewadar_nm,
		remarks						=		@remarks
	WHERE	speaker_id		=		@speaker_id
	AND		txn_ts			=		@txn_ts
END
GO

-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	DeleteSpeakersApprovalsRenewals
-- =============================================================================

IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteSpeakersApprovalsRenewals'
			)
	BEGIN
		DROP PROCEDURE  DeleteSpeakersApprovalsRenewals
	END
GO

CREATE PROCEDURE DeleteSpeakersApprovalsRenewals
(
	@speaker_id				sewadar_id,
	@request_for_speaker_type		SpeakerType,
	@is_approval					BIT,
	@approval_dt					DATE,
	@request_dt						DATE,
	@reference_no					VARCHAR (20),
	@reference_dt					DATE,
	@audition_remarks				VARCHAR (200),
	@review_remarks					VARCHAR (200),
	@review_sewadar_id				sewadar_id,
	@review_non_sewadar_nm			VARCHAR (30),
	@remarks						VARCHAR (200),
	@txn_ts							TIMESTAMP
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM speakers_approvals_renewals
	WHERE	speaker_id		=		@speaker_id
		AND is_approval			=	@is_approval
		AND approval_dt			=	@approval_dt
		AND request_dt			=	@request_dt
		AND reference_no		=	@reference_no
		AND reference_dt		=	@reference_dt
		AND audition_remarks	=	@audition_remarks
		AND review_remarks		=	@review_remarks
		AND review_sewadar_id	=	@review_sewadar_id
		AND review_non_sewadar_nm	=	@review_non_sewadar_nm
		AND	remarks				=	@remarks
		AND txn_ts				=	@txn_ts
END
GO


-- =============================================================================
--	Procedure	DeleteAllSpeakersApprovalsRenewals
-- =============================================================================

IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteAllSpeakersApprovalsRenewals'
			)
	BEGIN
		DROP PROCEDURE  DeleteAllSpeakersApprovalsRenewals
	END
GO

CREATE PROCEDURE DeleteAllSpeakersApprovalsRenewals
(
	@speaker_id				sewadar_id
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM speakers_approvals_renewals
	WHERE
		speaker_id		=		@speaker_id
END
GO

-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	QuerySpeakersApprovalsRenewals
-- =============================================================================

IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QuerySpeakersApprovalsRenewals'
			)
	BEGIN
		DROP PROCEDURE  QuerySpeakersApprovalsRenewals
	END
GO

CREATE PROCEDURE QuerySpeakersApprovalsRenewals
(
	@speaker_id		sewadar_id
)
WITH ENCRYPTION
AS
BEGIN
	SELECT 
		request_for_speaker_type,
		is_approval,
		approval_dt,
		request_dt,
		reference_no,
		reference_dt,
		audition_remarks,
		review_remarks,
		review_sewadar_id,
		review_non_sewadar_nm,
		remarks,
		txn_ts
	FROM	speakers_approvals_renewals
	WHERE speaker_id = @speaker_id
	ORDER BY speaker_id
END
GO

-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertSpeakersTrainings
-- =============================================================================


IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertSpeakersTrainings'
			)
	BEGIN
		DROP PROCEDURE  InsertSpeakersTrainings
	END
GO

CREATE PROCEDURE InsertSpeakersTrainings
(
	@speaker_id							sewadar_id,
	@training_for_speaker_type			SpeakerType,
	@training_dt						DATE,
	@is_attended						BIT,
	@request_dt							DATE,
	@reference_no						VARCHAR (20),
	@reference_dt						DATE,
	@remarks							VARCHAR (200)
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO speakers_trainings
	(
		speaker_id, training_for_speaker_type, training_dt, is_attended, request_dt, reference_no, reference_dt, remarks
	)
	VALUES
	(
		@speaker_id, @training_for_speaker_type, @training_dt, @is_attended, @request_dt, @reference_no, @reference_dt, @remarks
	)
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
--	Procedure	UpdateSpeakersTrainings
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateSpeakersTrainings'
			)
	BEGIN
		DROP PROCEDURE  UpdateSpeakersTrainings
	END
GO

CREATE PROCEDURE UpdateSpeakersTrainings
(
	@speaker_id							sewadar_id,
	@training_for_speaker_type			SpeakerType,
	@training_dt						DATE,
	@is_attended						BIT,
	@request_dt							DATE,
	@reference_no						VARCHAR (20),
	@reference_dt						DATE,
	@remarks							VARCHAR (200),
	@txn_ts								TIMESTAMP
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE speakers_trainings
	SET
		training_for_speaker_type	=	@training_for_speaker_type,
		training_dt					=	@training_dt,
		is_attended					=	@is_attended,
		request_dt					=	@request_dt,
		reference_no				=	@reference_no,
		@reference_dt				=	@reference_dt,
		remarks						=	@remarks
	WHERE 
		speaker_id		=	@speaker_id
	AND	txn_ts			=	@txn_ts
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
--	Procedure	DeleteAllSpeakersTrainings
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteAllSpeakersTrainings'
			)
	BEGIN
		DROP PROCEDURE  DeleteAllSpeakersTrainings
	END
GO
 
CREATE PROCEDURE DeleteAllSpeakersTrainings
(
	@speaker_id		sewadar_id
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM speakers_trainings
	WHERE
		speaker_id		=	@speaker_id
END
GO
		
-- =============================================================================
--	Procedure	DeleteSpeakersTrainings
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteSpeakersTrainings'
			)
	BEGIN
		DROP PROCEDURE  DeleteSpeakersTrainings
	END
GO
 
CREATE PROCEDURE DeleteSpeakersTrainings
(
	@speaker_id		sewadar_id,
	@training_for_speaker_type			SpeakerType,
	@training_dt						DATE,
	@is_attended						BIT,
	@request_dt							DATE,
	@reference_no						VARCHAR (20),
	@reference_dt						DATE,
	@remarks							VARCHAR (200),
	@txn_ts								TIMESTAMP
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM speakers_trainings
	WHERE
		speaker_id	= @speaker_id
		AND training_for_speaker_type =	@training_for_speaker_type
		AND training_dt		=	@training_dt
		AND is_attended		=	@is_attended
		AND request_dt		=	@request_dt
		AND reference_no	=	@reference_no
		AND reference_dt	=	@reference_dt
		AND remarks			=	@remarks
		AND txn_ts			=	@txn_ts
END
GO
		
-- =============================================================================



SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
--	Procedure	QuerySpeakersTrainings
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QuerySpeakersTrainings'
			)
	BEGIN
		DROP PROCEDURE  QuerySpeakersTrainings
	END
GO

CREATE PROCEDURE QuerySpeakersTrainings
(
	@speaker_id		sewadar_id
)
WITH ENCRYPTION
AS
BEGIN
	SELECT  
		training_for_speaker_type, 
		training_dt, 
		is_attended, 
		request_dt, 
		reference_no, 
		reference_dt, 
		remarks,
		txn_ts
	FROM	speakers_trainings
	WHERE
		speaker_id	=	@speaker_id
	ORDER BY	speaker_id
END
GO

-- =============================================================================
--	Procedure	ViewSpeakers
-- =============================================================================

IF EXISTS	(	SELECT  *
				FROM    sysobjects
				WHERE name = 'ViewSpeakers' and TYPE='v'
			)

	BEGIN
		DROP VIEW ViewSpeakers
	END
GO

CREATE VIEW ViewSpeakers
WITH ENCRYPTION
AS
	SELECT 
		s.speaker_id,
		vsh.full_nm,
		vsh.gender,
		vsh.birth_dtm,
		vsh.age,
		vsh.global_sewadar_status_cd,
		vsh.global_sewadar_status_dt,
		vsh.sewadar_status_nm,
		vsh.sewadar_status_dt,
		s.speaker_type,
		scd.satsang_centre_id,
		scd.is_main_centre,
		scd.centre_nm,
		s.speaker_status,
		s.speaker_status_dtm,
		s.txn_ts
	FROM speakers s
	JOIN ViewSewadarHeader vsh ON vsh.sewadar_id = s.speaker_id
	JOIN satsang_centres_details scd ON scd.satsang_centre_id = s.satsang_centre_id

GO
	
