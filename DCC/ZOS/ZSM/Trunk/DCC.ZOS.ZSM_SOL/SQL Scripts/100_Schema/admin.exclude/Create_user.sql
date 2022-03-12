/* ==================================================================================
    Source File		:	51_first_user.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Wed May 01 13:04:04 IST 2002
    Module ID		:	SysAdmin
    Language		:	TRANSACT-SQL
    Reviewed By		:	
    Reviewed On		:	
    ==================================================================================
									   Usage Notes
    ----------------------------------------------------------------------------------
	Creates the FIRST user of SysAdmin application. This is required for boot-strapping.

	Set the three variables as suggested.
    ==================================================================================
								      Revision History
    ----------------------------------------------------------------------------------
	M001 : JL : 15-Feb-2003
	    Procedure CreateUser requires an additional argument.
    ==================================================================================*/

USE SysAdmin
GO

SET QUOTED_IDENTIFIER  OFF    SET ANSI_NULLS  ON
GO


DECLARE
    @user_id	user_id,
    @user_nm	gnc_nm,
    @application_id	application_id,
    @user_role_id	user_role_id,
    @user_pd	password,
    @sewadar_id	integer,
    @user_no	integer,
    @deactivation_dt	DATETIME


    -- =============================================================================
    -- Set the proper values here for the First User of SysAdmin Application
    -- =============================================================================
    SET	@user_id	=	'Daljeet'				---- User ID
    SET	@user_nm	=	'Daljeet Kaur Amrit'		---- Name of the User
    SET	@user_pd	=	'123456'			---- Password of the User
    SET	@sewadar_id	=	6155				---- Sewadar ID of the User

    SET	@deactivation_dt = DateAdd (d, 15, GetDate())
    SET	@application_id	=	'ZSM_RPR'
    SET	@user_role_id	=	'ZSM_USR'
    -- =============================================================================


EXEC	CreateUser	@user_id, @user_nm, @user_pd, NULL, @application_id, @user_role_id, @sewadar_id, 'ZSM', 'No', NULL, @user_no OUTPUT

print convert (varchar(10), @user_no) + ' is the number of the user'

INSERT	INTO	user_privileges (user_id, application_id, user_role_id) VALUES (@user_id, @application_id, @user_role_id);

SET	@application_id	=	'ZSM_IND'
--    SET	@user_role_id	=	'ZSM_ATM'

INSERT	INTO	user_privileges (user_id, application_id, user_role_id) VALUES (@user_id, @application_id, @user_role_id);


-- vim:ts=8 sw=4 ht=8
