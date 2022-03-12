-- =============================================================================
--	Procedure	AuthenticateAppUser
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='AuthenticateAppUser'
			)
	BEGIN
		DROP PROCEDURE  AuthenticateAppUser
	END
GO

CREATE PROCEDURE AuthenticateAppUser
(
	@p_user_id			VARCHAR(20),
	@p_password			VARCHAR(20)
)
AS
BEGIN
	DECLARE @userID INT
	DECLARE @ErrorMessage VARCHAR(50)

    IF EXISTS (SELECT TOP 1 [user_id] FROM SysAdmin.[dbo].[app_users] WHERE [user_id]=@p_user_id)
    BEGIN
        SET @userID=(SELECT [user_no] FROM SysAdmin.[dbo].[app_users] WHERE [user_id]=@p_user_id AND [Password]=HASHBYTES('SHA1', @p_password+CAST(salt AS NVARCHAR(36))))

       IF(@userID IS NULL)
	   BEGIN
		   SET @ErrorMessage = 'Incorrect password'
           SELECT @ErrorMessage AS error
	   END
       ELSE 
	   BEGIN
		   SELECT sewa_team_id, in_out_applicable, is_admin
           FROM SysAdmin.dbo.app_users_priviledges
		   WHERE [user_id] = @p_user_id
		END
    END
    ELSE
		BEGIN
			SET @ErrorMessage = 'Invalid login'
			SELECT @ErrorMessage AS error
		END
END
GO

-- =============================================================================
--	Procedure	AddAppUser
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='AddAppUser'
			)
	BEGIN
		DROP PROCEDURE  AddAppUser
	END
GO


CREATE PROCEDURE dbo.AddAppUser
(
	@p_user_id	VARCHAR(20),
	@p_user_nm	VARCHAR(50),
	@p_password	VARCHAR(20),
	@responseMessage NVARCHAR(250) OUTPUT
)
AS
BEGIN
    SET NOCOUNT ON
	DECLARE @salt UNIQUEIDENTIFIER=NEWID()

    BEGIN TRY
		IF NOT EXISTS (SELECT 1 FROM SysAdmin.[dbo].[app_users] WHERE user_id = @p_user_id) 
		BEGIN
			INSERT INTO SysAdmin.[dbo].[app_users] 
			([user_id], [password], salt, [user_nm])
			VALUES(@p_user_id, HASHBYTES('SHA1', @p_password+CAST(@salt AS NVARCHAR(36))), @salt, @p_user_nm)

			SET @responseMessage='Success'
		END
    END TRY
    BEGIN CATCH
        SET @responseMessage=ERROR_MESSAGE() 
    END CATCH

END
GO

-- =============================================================================
--	Procedure	AddAppUserPreviledges
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='AddAppUserPreviledges'
			)
	BEGIN
		DROP PROCEDURE  AddAppUserPreviledges
	END
GO

CREATE PROCEDURE dbo.AddAppUserPreviledges
(
	@p_user_id				VARCHAR(20),
	@p_sewa_id				INT,
	@p_sewa_team_id			INT,
	@p_in_out_applicable	SMALLINT,
	@responseMessage		NVARCHAR(250) OUTPUT
)
AS
BEGIN    
	DECLARE @user_no INT
	SELECT @user_no = user_no 
	FROM SysAdmin.dbo.app_users
	WHERE [user_id] = @p_user_id

    BEGIN TRY
		IF NOT EXISTS (SELECT 1 FROM SysAdmin.dbo.app_users_priviledges WHERE user_id = @p_user_id AND sewa_id = @p_sewa_id AND sewa_team_id = @p_sewa_team_id) 
		BEGIN
			INSERT INTO SysAdmin.dbo.app_users_priviledges
					([user_no],[user_id], sewa_id, sewa_team_id, in_out_applicable)
			VALUES (@user_no, @p_user_id, @p_sewa_id, @p_sewa_team_id, @p_in_out_applicable )
		END
    END TRY
    BEGIN CATCH
        SET @responseMessage=ERROR_MESSAGE() 
    END CATCH

END
GO

-- =============================================================================
--	Procedure	GetAllSatsangCentresForMobileSupport
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='GetAllSatsangCentresForMobileSupport'
			)
	BEGIN
		DROP PROCEDURE  GetAllSatsangCentresForMobileSupport
	END
GO

CREATE PROCEDURE GetAllSatsangCentresForMobileSupport
WITH ENCRYPTION
AS
BEGIN
	SELECT sc.[satsang_centre_id]
      ,scd.[centre_cd]
      ,sc.[satsang_centre_nm]
      ,sc.[satsang_centre_type]
      ,sc.[effective_from]
      ,sc.[effective_till]
	FROM [CDB].[dbo].[satsang_centres] sc
	INNER JOIN dbo.[satsang_centres_details]  scd ON (sc.[satsang_centre_id] = scd.[satsang_centre_id])
	WHERE sc.satsang_centre_id IN (6015);
END
GO

-- =============================================================================
--	Procedure	QueryDepartmentsBySatsangCentre
-- =============================================================================
--IF EXISTS	(	SELECT  TOP 1 1 
--				FROM    INFORMATION_SCHEMA.ROUTINES 
--				WHERE   ROUTINE_TYPE='PROCEDURE'
--				AND     SPECIFIC_NAME='QueryDepartmentsBySatsangCentre'
--			)
--	BEGIN
--		DROP PROCEDURE  QueryDepartmentsBySatsangCentre
--	END
--GO


--CREATE PROCEDURE QueryDepartmentsBySatsangCentre
--(
--	@satsang_centre_id					satsang_centre_id
--)
--WITH ENCRYPTION
--AS
--BEGIN
--	SELECT		 
--		sc.satsang_centre_id,
--		d.department_id,
--		d.department_cd,
--		d.department_nm,
--		c.colour_nm,
--		c.red_component,
--		c.green_component,
--		c.blue_component
--	FROM departments d
--	INNER JOIN departments_satsang_centres sd ON (d.department_id = sd.department_id)
--	INNER JOIN cdb..satsang_centres sc ON sc.satsang_centre_id = sd.satsang_centre_id
--	LEFT JOIN colours c ON (d.colour_id= c.colour_id)
--	WHERE sc.satsang_centre_id = @satsang_centre_id
--	and sd.[effective_till] > GETDATE() AND sd.effective_from <= GETDATE()
--END
--GO


-- =============================================================================
--	Procedure	GetProgramSewaDetails
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='GetProgramSewaDetails'
			)
	BEGIN
		DROP PROCEDURE  GetProgramSewaDetails
	END
GO


CREATE PROCEDURE GetProgramSewaDetails
(
	@satsang_centre_id		satsang_centre_id
)
WITH ENCRYPTION
AS
BEGIN
	SELECT sewa_id, sewa_cd, sewa_nm, start_dt, finish_dt
	FROM	sewas
	WHERE	satsang_centre_id = @satsang_centre_id
	AND [is_satsang_programme] = 'Yes'
	and [is_default_sewa] = 'Yes'
END
GO

-- =============================================================================
--	Procedure	GetAllSewaTeamsBySewa
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='GetAllSewaTeamsBySewa'
			)
	BEGIN
		DROP PROCEDURE  GetAllSewaTeamsBySewa
	END
GO


CREATE PROCEDURE GetAllSewaTeamsBySewa
(
	@sewa_id			INT,
	@user_id			VARCHAR(20)
)
WITH ENCRYPTION
AS
BEGIN
	
	SELECT st.[sewa_team_id], st.[sewa_team_nm], up.in_out_applicable, up.is_admin
	FROM [dbo].[sewa_teams] st
	INNER JOIN SysAdmin.dbo.app_users_priviledges up 
		ON (st.sewa_team_id = up.sewa_team_id
		AND	st.sewa_id = up.sewa_id)
	WHERE st.sewa_id = @sewa_id
	AND up.[user_id] = @user_id;
END
GO


-- =============================================================================
--	Procedure	GetAllSewadarWiseSewaTeams
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='GetAllSewadarWiseSewaTeams'
			)
	BEGIN
		DROP PROCEDURE  GetAllSewadarWiseSewaTeams
	END
GO


CREATE PROCEDURE GetAllSewadarWiseSewaTeams
(
	@sewa_id			INT,
	@satsang_centre_id	INT,
	@user_id				VARCHAR(20)
)
WITH ENCRYPTION
AS
BEGIN

	SELECT st.sewa_team_id, st.sewa_team_nm, s.current_sewadar_grno, s.first_nm + ' ' + s.middle_nm + ' ' + s.last_nm AS sewadar_nm
	FROM	sewa_teams		st
		INNER JOIN SysAdmin.dbo.app_users_priviledges up 
			ON (st.sewa_team_id = up.sewa_team_id
			AND	st.sewa_id = up.sewa_id
			AND up.[user_id] = @user_id )
		INNER JOIN	sewa_team_wise_sewadars		sw
			ON	(	st.sewa_id				=	@sewa_id
				AND	sw.sewa_team_id			=	st.sewa_team_id
				AND sw.transfer_out_dt	IS NULL
				)
		INNER JOIN	sewadars	s
			ON	( sw.sewadar_grno				=	s.current_sewadar_grno
				AND	s.current_satsang_centre_id		=	@satsang_centre_id)
		INNER JOIN	sewadars_registrations	sr
			ON	(	sw.sewadar_grno				=	sr.sewadar_grno
				AND sr.satsang_centre_id		=	@satsang_centre_id
				)
	ORDER BY st.sewa_team_id ASC, sw.serial_id ASC
END
GO
