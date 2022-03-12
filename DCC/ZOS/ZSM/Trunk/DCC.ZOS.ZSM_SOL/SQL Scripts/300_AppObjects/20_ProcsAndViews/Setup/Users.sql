-- =============================================================================
--	Procedure	QueryUsers
-- =============================================================================


IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QueryUsers'
			)
	BEGIN
		DROP PROCEDURE  QueryUsers
	END
GO

CREATE PROCEDURE QueryUsers
(
	@user_no			user_no,
	@user_id			user_id,
	@user_nm			person_nm,
	@email_id			varchar(20),
	@activation_dt		datetime,
	@deactivation_dt	datetime,
	@is_open_sewadar	boolean,
	@sewadar_id		    int,
	@is_locked			boolean,
	@user_role_id		user_role_id,
	@application_id		application_id
)
WITH ENCRYPTION
AS
BEGIN
	SELECT 
		alu.user_no, 
		alu.user_id, 
		alu.user_nm, 
		alu.email_id, 
		alu.activation_dt, 
		alu.deactivation_dt, 
		alu.is_open_sewadar,
	    alu.sewadar_id,
	    apu.is_locked,
	    up.user_role_id, 
	    up.application_id    
	FROM sysadmin..all_users alu
		FULL JOIN sysadmin..application_users apu
			ON alu.user_id = apu.user_id
		FULL JOIN sysadmin..user_privileges up
			ON alu.user_id = up.user_id
		
END
GO
	

-- =============================================================================
--	Procedure	ViewUsers
-- =============================================================================
IF EXISTS	(	SELECT  *
				FROM    sysobjects
				WHERE name = 'ViewUsers' and TYPE='v'
			)

	BEGIN
		DROP VIEW ViewUsers
	END
GO

CREATE VIEW ViewUsers

WITH ENCRYPTION
AS

	SELECT 
		alu.user_no, 
		alu.user_id, 
		alu.user_nm, 
		alu.email_id, 
		alu.activation_dt, 
		alu.deactivation_dt, 
		alu.is_open_sewadar,
	    alu.sewadar_id, 
	    apu.is_locked,
	    up.user_role_id, 
	    up.application_id 
	    
	FROM sysadmin..all_users alu
	
		FULL JOIN sysadmin..application_users apu
			ON alu.user_id = apu.user_id
		FULL JOIN sysadmin..user_privileges up
			ON alu.user_id = up.user_id
		

GO


-- =============================================================================
--	Procedure		CreateUser
-- =============================================================================

--IF EXISTS	(	SELECT	1	FROM	sysobjects	WHERE	name	=	'CreateUser'	AND	xtype	=	'P'	)
--	DROP	PROCEDURE	CreateUser
--GO

--CREATE	PROCEDURE	CreateUser
--(
--	@user_id			user_id,
--	@user_nm			person_nm,
--	@password			password,
--	@email_id			VARCHAR (50),							
--	@application_id		application_id,							
--	@user_role_id		user_role_id,
--	@sewadar_id			INTEGER,						
--	@is_open_sewadar	boolean,								
--	@deactivation_dt	DATETIME,							
--	@user_no			user_no			OUTPUT
--)
--WITH	ENCRYPTION
--AS
--BEGIN
--EXEC SysAdmin..CreateUser @user_id, @user_nm, @password, @email_id, @application_id, @user_role_id,@sewadar_id, @is_open_sewadar, @deactivation_dt
--END
--GO

-- =============================================================================
--	Procedure	DropUser
-- =============================================================================

IF EXISTS	(	SELECT	1	FROM	sysobjects	WHERE	name	=	'DropUser'	AND	xtype	=	'P'	)
	DROP	PROCEDURE	DropUser
GO

CREATE PROCEDURE DropUser
(
	@user_id		user_id
)
WITH ENCRYPTION
AS
BEGIN
EXEC SysAdmin..DropUser @user_id
END
GO

-- =============================================================================
--	Procedure	SetUserPassword
-- =============================================================================


--IF EXISTS	(	SELECT  TOP 1 1 
--				FROM    INFORMATION_SCHEMA.ROUTINES 
--				WHERE   ROUTINE_TYPE='PROCEDURE'
--				AND     SPECIFIC_NAME='SetUserPassword'
--			)
--	BEGIN
--		DROP PROCEDURE  SetUserPassword
--	END
--GO

--CREATE PROCEDURE SetUserPassword
--(
--	@p_user_id		user_id,
--	@p_password		password
--)
--WITH ENCRYPTION
--AS
--BEGIN
--EXEC SysAdmin..SetUserPassword @p_user_id, @p_password
--END
--GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	ClearUserSessions
-- =============================================================================
IF EXISTS	(	SELECT	1	FROM	sysobjects	WHERE	name	=	'ClearUserSessions'	AND	xtype	=	'P'	)
	DROP	PROCEDURE	ClearUserSessions
GO

CREATE	PROCEDURE	ClearUserSessions
(
	@p_user_no	user_no
)
WITH	ENCRYPTION
AS
BEGIN
EXEC SysAdmin..ClearUserSessions @p_user_no
END
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertUsersApplicationDetails
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertUsersApplicationDetails'
			)
	BEGIN
		DROP PROCEDURE  InsertUsersApplicationDetails
	END
GO
CREATE PROCEDURE InsertUsersApplicationDetails
(
	@user_id				user_id,
	@application_id			application_id,
	@user_role_id			user_role_id
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO SysAdmin..user_privileges
	(
		user_id, application_id, user_role_id
	)
	VALUES
	(
		@user_id, @application_id, @user_role_id
	)
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateUsersApplication
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateUsersApplication'
			)
	BEGIN
		DROP PROCEDURE  UpdateUsersApplication
	END
GO
CREATE PROCEDURE UpdateUsersApplication
(
	@user_id				user_id,
	@application_id			application_id,
	@user_role_id			user_role_id,
	@old_application_id		application_id,
	@old_user_role_id		user_role_id
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    user_privileges
	SET
		application_id			=	@application_id,
		user_role_id			=	@user_role_id
	WHERE
		user_id					=	@user_id
	AND	application_id			=	@old_application_id
	AND	user_role_id			=	@old_user_role_id
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	DeleteUsersApplication
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteUsersApplication'
			)
	BEGIN
		DROP PROCEDURE  DeleteUsersApplication
	END
GO

CREATE PROCEDURE DeleteUsersApplication
(
	@user_id					user_id,
	@old_application_id			application_id,
	@old_user_role_id			user_role_id
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM user_privileges
	WHERE
		user_id					=	@user_id
	AND	application_id			=	@old_application_id
	AND	user_role_id			=	@old_user_role_id
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	QueryUsersApplication
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QueryUsersApplication'
			)
	BEGIN
		DROP PROCEDURE  QueryUsersApplication
	END
GO

CREATE PROCEDURE QueryUsersApplication
(
	@user_no				user_no
)
WITH ENCRYPTION
AS
BEGIN
	SELECT	au.user_no,
			au.user_id,
			au.user_nm,
			au.email_id,
			up.application_id,
			up.user_role_id
		FROM Sysadmin..all_users au
	JOIN	Sysadmin..user_privileges up ON	au.user_id = up.user_id
	WHERE
		user_no			=	@user_no
	ORDER BY up.application_id, up.user_role_id
END
GO
-- =============================================================================
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
