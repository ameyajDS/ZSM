
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertSewaTeam
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertSewaTeam'
			)
	BEGIN
		DROP PROCEDURE  InsertSewaTeam
	END
GO
CREATE PROCEDURE InsertSewaTeam
(
	@sewa_team_id			sewa_team_id output,
	@sewa_team_nm			gnc_long_nm,
	@team_description		remarks = NULL,
	@sewa_id				sewa_id,
	@acceptance_ts			smalldatetime = NULL
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO sewa_teams
	(
		sewa_team_nm, team_description, sewa_id, acceptance_ts
	)
	VALUES
	(
		@sewa_team_nm, @team_description, @sewa_id, @acceptance_ts
	)
	SELECT @sewa_team_id = SCOPE_IDENTITY()
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateSewaTeam
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateSewaTeam'
			)
	BEGIN
		DROP PROCEDURE  UpdateSewaTeam
	END
GO
CREATE PROCEDURE UpdateSewaTeam
(
	@sewa_team_id			sewa_team_id,
	@sewa_team_nm			gnc_long_nm,
	@team_description		remarks,
	@txn_ts					timestamp
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    sewa_teams
	SET
		sewa_team_nm			=	@sewa_team_nm,
		team_description		=	@team_description
	WHERE
	    sewa_team_id = @sewa_team_id
	AND txn_ts				=	@txn_ts
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
--	Procedure	DeleteSewaTeam
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteSewaTeam'
			)
	BEGIN
		DROP PROCEDURE  DeleteSewaTeam
	END
GO
CREATE PROCEDURE DeleteSewaTeam
(
	@sewa_team_id			sewa_team_id,
	@txn_ts					timestamp
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM sewa_teams
	WHERE
	    sewa_team_id = @sewa_team_id
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
--	Procedure	ViewSewaTeam
-- =============================================================================
IF EXISTS	(	SELECT  *
				FROM    sysobjects
				WHERE name = 'ViewSewaTeam' and TYPE='v'
			)

	BEGIN
		DROP VIEW ViewSewaTeam
	END
GO
CREATE VIEW ViewSewaTeam

WITH ENCRYPTION
AS
	SELECT
		st.sewa_team_id, 
		st.sewa_team_nm, 
		st.team_description, 
		st.sewa_id, 
		st.acceptance_ts, 
		s.satsang_centre_id,
		vsd.centre_nm,
		s.sewa_nm,
		s.start_dt,
		s.finish_dt,
		st.txn_ts
	FROM sewa_teams st
	JOIN sewas s ON st.sewa_id = s.sewa_id
	JOIN ViewSatsangCentreDetails vsd ON s.satsang_centre_id = vsd.satsang_centre_id
GO
-- =============================================================================

-- =============================================================================
--	Procedure	AcceptSewaTeam
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='AcceptSewaTeam'
			)
	BEGIN
		DROP PROCEDURE  AcceptSewaTeam
	END
GO
CREATE PROCEDURE AcceptSewaTeam
(
	@sewa_team_id			sewa_team_id,
	@txn_ts					timestamp
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    sewa_teams
	SET
		acceptance_ts			=	GetDate()
	WHERE
	    sewa_team_id = @sewa_team_id
	AND txn_ts				=	@txn_ts
	AND	acceptance_ts	IS NULL;
	IF (@@ROWCOUNT != 1)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotUpdated', NULL, NULL, NULL, NULL
	END
END
GO
-- =============================================================================




-- vim:ts=4 sw=4 ht=4
