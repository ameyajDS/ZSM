/* ==================================================================================
    Source File		:	upgrade_v5.47.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Wed Feb 08 2012
    Last updated	:	Feb 15, 2012
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Upgrade Script for v5.47
			..... Added a FK constraint on UserRole in table SysAdmin..user_role_menu_groups
															 ========
			..... Adds the following SysAdmin..Stored Procedures
									 ========
					+	SetMenuGroup		user_role_id, menu_group_id, parent_menu_group_id, menu_group_nm, menu_group_dsc, ctrl_key_accessor, display_order
					+	SetPackageScreen	package_id, screen_id, screen_nm, operations_supported (IUDRPSMX), operations_audited (IUDAPMX),
											menu_group_id, menu_dsc, ctrl_key_accessor, display_order,
											user_roles_and_operations_list (list is separated by | whereas each role and operations (IUDRP) separated by a colon)
					+	SetPackageAction	package_id, screen_id, action_nm, display_order, user_roles_list (list is separated by |)
    ==================================================================================
								      								  Revision History
    ----------------------------------------------------------------------------------
		15-Feb-2012 :JL
			* SetPackageScreen now INSERTs into user_role_menus only when menu_group_id is specified.
			* SetPackageScreen now INSERTs into application_screen_audits only when parameter has some operations specified.
		11-Feb-2012 :JL
			* SetPackageScreen has a bug which user operations audited instead of operations desired for the user-role.
			* Set Menu Group now has a List of User Roles as the parameter instead of a single User-role.
		10-Feb-2012 :JL
			* Check Constraint Sewas_CK_ReferredSewaID_AttendanceMarking on Sewas table has been changed as it was not proper.
		09-Feb-2012 :JL
			* Few more error conditions added like Read must be specified if Delete or Update or Print is specified in the Stored Procedures.
			* Some error messages have been enhanced to provide Screen ID as part of the message in the Stored Procedures.
   ==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

USE SysAdmin
GO


UPDATE packages
	SET	version_no = 5.47,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'

ALTER	TABLE	user_role_menu_groups
	ADD	CONSTRAINT	FK_UserRoleMenuGroups_UserRoleID
    		FOREIGN KEY	(	user_role_id	)
					REFERENCES	package_user_roles;

GO


-- =============================================================================
--	Procedure	SetMenuGroup
-- =============================================================================
IF EXISTS	(	SELECT	1	FROM	sysobjects	WHERE	name	=	'SetMenuGroup'	AND	xtype	=	'P'	)
	DROP	PROCEDURE	SetMenuGroup
GO

CREATE 	PROCEDURE 	SetMenuGroup
(
    @p_menu_group_id		menu_group_id,
    @p_parent_menu_group_id	menu_group_id,
    @p_menu_group_nm		screen_nm,
    @p_menu_group_dsc		gnc_description,
    @p_ctrl_key_accessor	CHAR (1),
    @p_display_order		SMALLINT,
	@p_user_roles_list		VARCHAR (2000)				--	list is separated by |
)
WITH	ENCRYPTION
AS
	DECLARE
		@user_role_id	user_role_id,
		@position		INT
BEGIN
	SET @position = CHARINDEX ('|', @p_user_roles_list)
	IF (@position > 0)
	BEGIN
		SET @user_role_id = LTRIM(RTRIM(SUBSTRING (@p_user_roles_list, 1, @position - 1)));
		SET @p_user_roles_list = LTRIM(RTRIM(SUBSTRING (@p_user_roles_list, @position + 1, 2000)));
	END
	ELSE
	BEGIN
		SET @user_role_id = @p_user_roles_list;
		SET @p_user_roles_list = '';
	END

	IF (@user_role_id IS NULL OR @user_role_id = '')
	BEGIN
		RAISERROR ('ERROR: User Role ID must be specified for the Menu Group ID [%s] with Name [%s]', 16, -1, @p_menu_group_id, @p_menu_group_nm);
		RETURN
	END

	WHILE (LEN (@user_role_id) > 0)
	BEGIN																--- [
--		print 'User Role = [' + @user_role_id + ']'

		INSERT INTO	user_role_menu_groups
				(	user_role_id, menu_group_id, parent_menu_group_id, menu_group_nm, menu_group_dsc,
					ctrl_key_accessor, display_order
				)
			VALUES
				(	@user_role_id, @p_menu_group_id, @p_parent_menu_group_id, @p_menu_group_nm, @p_menu_group_dsc,
					@p_ctrl_key_accessor, @p_display_order
				);

		SET @position = CHARINDEX ('|', @p_user_roles_list)
		IF (@position > 0)
		BEGIN
			SET @user_role_id = LTRIM(RTRIM(SUBSTRING (@p_user_roles_list, 1, @position - 1)));
			SET @p_user_roles_list = LTRIM(RTRIM(SUBSTRING (@p_user_roles_list, @position + 1, 2000)));
		END
		ELSE
		BEGIN
			SET @user_role_id = @p_user_roles_list;
			SET @p_user_roles_list = '';
		END
	END																	--- ]
END
GO

-- =============================================================================
--	Procedure	_ValidateOptionsInString
-- =============================================================================
IF EXISTS	(	SELECT	1	FROM	sysobjects	WHERE	name	=	'_ValidateOptionsInString'	AND	xtype	=	'P'	)
	DROP	PROCEDURE	_ValidateOptionsInString
GO

CREATE 	PROCEDURE 	_ValidateOptionsInString
(
    @p_options	 	VARCHAR (20),
    @p_string		VARCHAR (20),
	@p_type			VARCHAR (100)
)
WITH	ENCRYPTION
AS
	DECLARE
		@idx	INT,
		@len	INT,
		@chr	CHAR,
		@opts	VARCHAR (20)
BEGIN
	SET @p_type	=	LTRIM(RTRIM(@p_type))
	IF (@p_type IS NULL OR @p_type = '')
	BEGIN
		RAISERROR ('INTERNAL ERROR: _ValidateString: Type of String to be validated was not specified', 16, -1);
		RETURN
	END

	SET @p_options	=	LTRIM(RTRIM(@p_options))
	IF (@p_options IS NULL OR @p_options = '')
	BEGIN
		RAISERROR ('INTERNAL ERROR: _ValidateString: Options were not specified for %s', 16, -1, @p_type)
		RETURN
	END

	SET @p_string	=	LTRIM(RTRIM(@p_string))
	IF (@p_string IS NULL OR @p_string = '')
	BEGIN
		RAISERROR ('INTERNAL ERROR: _ValidateString: String to find Options was not specified for %s', 16, -1, @p_type)
		RETURN
	END

	SET @idx = 1;
	SET @len = LEN (@p_options);
	SET @opts = '';
	WHILE (@idx <= @len)
	BEGIN
		SET @chr = SUBSTRING (@p_options, @idx, 1);
		IF	(CHARINDEX (@chr, @p_string) = 0)
			SET @opts = @opts + @chr;
		SET @idx = @idx + 1;
	END

	SET @len = LEN (@opts);
	IF (@len > 1)
		RAISERROR ('ERROR: Options [%s] are incorrect in [%s] for %s', 16, -1, @opts, @p_options, @p_type)
	ELSE IF (@len > 0)
		RAISERROR ('ERROR: Option [%s] is incorrect in [%s] for %s', 16, -1, @opts, @p_options, @p_type)
	RETURN @len;
END
GO

-- =============================================================================
--	Procedure	SetPackageScreen
-- =============================================================================
IF EXISTS	(	SELECT	1	FROM	sysobjects	WHERE	name	=	'SetPackageScreen'	AND	xtype	=	'P'	)
	DROP	PROCEDURE	SetPackageScreen
GO

CREATE 	PROCEDURE 	SetPackageScreen
(
	@p_package_id					package_id,
	@p_screen_id					screen_id,
	@p_screen_nm					screen_nm,
	@p_operations_supported			VARCHAR (10),					--	IUDRPSMX
	@p_operations_audited			VARCHAR (10),					--	IUDAPMX
	@p_menu_group_id				menu_group_id,
	@p_menu_dsc						gnc_description,
	@p_ctrl_key_accessor			CHAR (1),
	@p_display_order				SMALLINT,
	@p_user_roles_and_oprtns_list	VARCHAR (2000)				--	list is separated by | whereas each role and operations (IUDRP) separated by a colon
)
WITH	ENCRYPTION
AS
	DECLARE
		@user_role_id	user_role_id,
		@operations		VARCHAR (100),
		@usrrole_oprtns	VARCHAR (100),
		@msg			VARCHAR (200),
		@position		INT,
		@retval			INT
BEGIN
		---- Validations on Operations Supported
		----------------------------------------
	SET @p_operations_supported	=	LTRIM(RTRIM(@p_operations_supported))
	IF (@p_operations_supported IS NULL OR @p_operations_supported = '')
	BEGIN
		RAISERROR ('ERROR: Operations Supported must be specified for Screen [%s]', 16, -1, @p_screen_id);
		RETURN
	END
	IF (	CHARINDEX ('R', @p_operations_supported) = 0
		AND	CHARINDEX ('I', @p_operations_supported) = 0
		AND	CHARINDEX ('U', @p_operations_supported) = 0
		AND	CHARINDEX ('D', @p_operations_supported) = 0
		AND	CHARINDEX ('P', @p_operations_supported) = 0)
	BEGIN
		RAISERROR ('ERROR: Either R[ead] or I[nsert] or U[pdate] or D[elete] or P[rint] must be specified in Operations Supported [%s] for Screen [%s]', 16, -1, @p_operations_supported, @p_screen_id);
		RETURN
	END

	IF (CHARINDEX ('S', @p_operations_supported) > 0	AND	CHARINDEX ('I', @p_operations_supported) = 0)
	BEGIN
		RAISERROR ('ERROR: S[ave partial] can be specified only if I[nsert] is supported as an Operation on the Screen [%s]', 16, -1, @p_screen_id);
		RETURN
	END

	IF (CHARINDEX ('P', @p_operations_supported) > 0	AND	CHARINDEX ('R', @p_operations_supported) = 0)
	BEGIN
		RAISERROR ('ERROR: P[rint] can be specified only if R[ead] is supported as an Operation on the Screen [%s]', 16, -1, @p_screen_id);
		RETURN
	END

	IF (CHARINDEX ('U', @p_operations_supported) > 0	AND	CHARINDEX ('R', @p_operations_supported) = 0)
	BEGIN
		RAISERROR ('ERROR: U[pdate] can be specified only if R[ead] is supported as an Operation on the Screen [%s]', 16, -1, @p_screen_id);
		RETURN
	END

	IF (CHARINDEX ('D', @p_operations_supported) > 0	AND	CHARINDEX ('R', @p_operations_supported) = 0)
	BEGIN
		RAISERROR ('ERROR: D[elete] can be specified only if R[ead] is supported as an Operation on the Screen [%s]', 16, -1, @p_screen_id);
		RETURN
	END

	IF (CHARINDEX ('M', @p_operations_supported) > 0	AND	CHARINDEX ('U', @p_operations_supported) = 0)
	BEGIN
		RAISERROR ('ERROR: M[odify changes] can be specified only if U[pdate] is supported as an Operation on the Screen [%s]', 16, -1, @p_screen_id);
		RETURN
	END

	IF (CHARINDEX ('X', @p_operations_supported) > 0	AND	CHARINDEX ('D', @p_operations_supported) = 0)
	BEGIN
		RAISERROR ('ERROR: X[delete changes] can be specified only if D[elete] is supported as an Operation on the Screen [%s]', 16, -1, @p_screen_id);
		RETURN
	END

	SET @msg = 'Operations Supported in Screen [' + @p_screen_id + ']';
	EXEC @retval = _ValidateOptionsInString @p_operations_supported, 'IUDRPSMX', @msg;
	IF (@retval > 0)
		RETURN;

		---- Validations on Operations audited
		--------------------------------------
	SET @p_operations_audited	=	LTRIM(RTRIM(@p_operations_audited))
	IF (CHARINDEX ('M', @p_operations_audited) > 0	AND	CHARINDEX ('U', @p_operations_audited) = 0)
	BEGIN
		RAISERROR ('ERROR: M[odify changes] can be audited only if U[pdate] is also audited for the Screen [%s]', 16, -1, @p_screen_id);
		RETURN
	END

	IF (CHARINDEX ('X', @p_operations_audited) > 0	AND	CHARINDEX ('D', @p_operations_audited) = 0)
	BEGIN
		RAISERROR ('ERROR: X[delete changes] can be audited only if D[elete] is also audited for the Screen [%s]', 16, -1, @p_screen_id);
		RETURN
	END

	IF (LEN (@p_operations_audited) > 0)
	BEGIN
		SET @msg = 'Operations Audited for Screen [' + @p_screen_id + ']';
		EXEC @retval = _ValidateOptionsInString @p_operations_audited, 'IUDAPMX', @msg;
		IF (@retval > 0)
			RETURN;
	END

		---- Validations on User Roles and Operations List
		--------------------------------------------------
	SET @p_user_roles_and_oprtns_list	=	LTRIM(RTRIM(@p_user_roles_and_oprtns_list))
	IF (@p_user_roles_and_oprtns_list IS NULL OR @p_user_roles_and_oprtns_list = '')
	BEGIN
		RAISERROR ('ERROR: List of User Roles along with Operations must be specified for Screen [%s]', 16, -1, @p_screen_id);
		RETURN
	END

	INSERT INTO	package_screens
			(	package_id, screen_id, screen_nm,
				is_select_supported,
				is_insert_supported,
				is_update_supported,
				is_delete_supported,
				is_print_supported,
				is_update_changes_supported,
				is_delete_changes_supported,
				is_partial_save_supported
			)
		VALUES
			(	@p_package_id, @p_screen_id, @p_screen_nm,
				CASE WHEN CHARINDEX ('R', @p_operations_supported) > 0 THEN 'Yes' ELSE 'No' END,			--- R[ead] ... SELECT
				CASE WHEN CHARINDEX ('I', @p_operations_supported) > 0 THEN 'Yes' ELSE 'No' END,			--- I[nesrt]
				CASE WHEN CHARINDEX ('U', @p_operations_supported) > 0 THEN 'Yes' ELSE 'No' END,			--- U[pdate]
				CASE WHEN CHARINDEX ('D', @p_operations_supported) > 0 THEN 'Yes' ELSE 'No' END,			--- D[elete]
				CASE WHEN CHARINDEX ('P', @p_operations_supported) > 0 THEN 'Yes' ELSE 'No' END,			--- P[rint]
				CASE WHEN CHARINDEX ('M', @p_operations_supported) > 0 THEN 'Yes' ELSE 'No' END,			--- M[odify changes] ..... update_changes
				CASE WHEN CHARINDEX ('X', @p_operations_supported) > 0 THEN 'Yes' ELSE 'No' END,			--- X[delete_changes]
				CASE WHEN CHARINDEX ('S', @p_operations_supported) > 0 THEN 'Yes' ELSE 'No' END				--- S[ave partial]
			);

	IF (LEN (@p_operations_audited) > 0)
		INSERT INTO	application_screen_audits
				(	application_id, screen_id,
					is_insert_logged,
					is_update_logged,
					is_delete_logged,
					is_action_logged,
					is_print_logged,
					is_update_changes_logged,
					is_delete_changes_logged
				)
			SELECT	application_id, @p_screen_id,
					CASE WHEN CHARINDEX ('I', @p_operations_audited) > 0 THEN 'Yes' ELSE 'No' END,			--- I[nesrt]
					CASE WHEN CHARINDEX ('U', @p_operations_audited) > 0 THEN 'Yes' ELSE 'No' END,			--- U[pdate]
					CASE WHEN CHARINDEX ('D', @p_operations_audited) > 0 THEN 'Yes' ELSE 'No' END,			--- D[elete]
					CASE WHEN CHARINDEX ('A', @p_operations_audited) > 0 THEN 'Yes' ELSE 'No' END,			--- A[ction]
					CASE WHEN CHARINDEX ('P', @p_operations_audited) > 0 THEN 'Yes' ELSE 'No' END,			--- P[rint]
					CASE WHEN CHARINDEX ('M', @p_operations_audited) > 0 THEN 'Yes' ELSE 'No' END,			--- M[odify changes] ..... update_changes
					CASE WHEN CHARINDEX ('X', @p_operations_audited) > 0 THEN 'Yes' ELSE 'No' END			--- X 			     ..... delete_changes
			FROM	applications
			WHERE	package_id	=	@p_package_id;

	SET @position = CHARINDEX ('|', @p_user_roles_and_oprtns_list)
	IF (@position > 0)
	BEGIN
		SET @usrrole_oprtns = LTRIM(RTRIM(SUBSTRING (@p_user_roles_and_oprtns_list, 1, @position - 1)));
		SET @p_user_roles_and_oprtns_list = LTRIM(RTRIM(SUBSTRING (@p_user_roles_and_oprtns_list, @position + 1, 2000)));
	END
	ELSE
	BEGIN
		SET @usrrole_oprtns = @p_user_roles_and_oprtns_list;
		SET @p_user_roles_and_oprtns_list = '';
	END

	IF (@usrrole_oprtns IS NULL OR @usrrole_oprtns = '')
	BEGIN
		RAISERROR ('ERROR: User Role ID along with Operations Supported must be specified for Screen [%s]', 16, -1, @p_screen_id);
		RETURN
	END

	WHILE (LEN (@usrrole_oprtns) > 0)
	BEGIN																--- [
		SET @position = CHARINDEX (':', @usrrole_oprtns)
		IF (@position IS NULL OR @position = 0)
		BEGIN
			RAISERROR ('ERROR: Delimiter colon [:] is not found in [%s] for Screen [%s]', 16, -1, @usrrole_oprtns, @p_screen_id);
			RETURN
		END
		SET @user_role_id = LTRIM(RTRIM(SUBSTRING (@usrrole_oprtns, 1, @position - 1)));
		SET @operations = LTRIM(RTRIM(SUBSTRING (@usrrole_oprtns, @position + 1, 2000)));

--		print 'User Role = [' + @user_role_id + '], Operations = [' + @operations + ']'

		SET @msg = 'Operations for User Role [' + @user_role_id + ']';
		EXEC @retval = _ValidateOptionsInString @operations, 'IUDRP', @msg;
		IF (@retval > 0)
			RETURN;

		IF (	CHARINDEX ('R', @operations) = 0
			AND	CHARINDEX ('I', @operations) = 0
			AND	CHARINDEX ('U', @operations) = 0
			AND	CHARINDEX ('D', @operations) = 0
			AND	CHARINDEX ('P', @operations) = 0)
		BEGIN
			RAISERROR ('ERROR: Either R[ead] or I[nsert] or U[pdate] or D[elete] or P[rint] must be specified in Operations Supported [%s] for User-role [%s]', 16, -1, @operations, @user_role_id);
			RETURN
		END

		IF (CHARINDEX ('P', @operations) > 0	AND	CHARINDEX ('R', @operations) = 0)
		BEGIN
			RAISERROR ('ERROR: P[rint] can be specified only if R[ead] is provided to User Role [%s] on Screen [%s]', 16, -1, @user_role_id, @p_screen_id);
			RETURN
		END

		IF (CHARINDEX ('U', @operations) > 0	AND	CHARINDEX ('R', @operations) = 0)
		BEGIN
			RAISERROR ('ERROR: U[pdate] can be specified only if R[ead] is provided to User Role [%s] on Screen [%s]', 16, -1, @user_role_id, @p_screen_id);
			RETURN
		END

		IF (CHARINDEX ('D', @operations) > 0	AND	CHARINDEX ('R', @operations) = 0)
		BEGIN
			RAISERROR ('ERROR: D[elete] can be specified only if R[ead] is provided to User Role [%s] on Screen [%s]', 16, -1, @user_role_id, @p_screen_id);
			RETURN
		END

		IF (@p_menu_group_id IS NOT NULL AND @p_menu_group_id != '')
			INSERT INTO user_role_menus
					(	user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_key_accessor, display_order	)
				VALUES
					(	@user_role_id, @p_menu_group_id, @p_screen_nm, @p_menu_dsc, @p_ctrl_key_accessor, @p_display_order	);

		INSERT INTO	user_role_privileges
				(	user_role_id, screen_id, package_id,
					is_select_granted,
					is_insert_granted,
					is_update_granted,
					is_delete_granted,
					is_print_granted
				)
			VALUES
				(	@user_role_id, @p_screen_id, @p_package_id,
					CASE WHEN CHARINDEX ('R', @operations) > 0 THEN 'Yes' ELSE 'No' END,			--- R[ead]	... SELECT
					CASE WHEN CHARINDEX ('I', @operations) > 0 THEN 'Yes' ELSE 'No' END,			--- I[nesrt]
					CASE WHEN CHARINDEX ('U', @operations) > 0 THEN 'Yes' ELSE 'No' END,			--- U[pdate]
					CASE WHEN CHARINDEX ('D', @operations) > 0 THEN 'Yes' ELSE 'No' END,			--- D[elete]
					CASE WHEN CHARINDEX ('P', @operations) > 0 THEN 'Yes' ELSE 'No' END			--- P[rint]
				);

		SET @position = CHARINDEX ('|', @p_user_roles_and_oprtns_list)
		IF (@position > 0)
		BEGIN
			SET @usrrole_oprtns = LTRIM(RTRIM(SUBSTRING (@p_user_roles_and_oprtns_list, 1, @position - 1)));
			SET @p_user_roles_and_oprtns_list = LTRIM(RTRIM(SUBSTRING (@p_user_roles_and_oprtns_list, @position + 1, 2000)));
		END
		ELSE
		BEGIN
			SET @usrrole_oprtns = @p_user_roles_and_oprtns_list;
			SET @p_user_roles_and_oprtns_list = '';
		END
	END																	--- ]
END
GO

-- =============================================================================
--	Procedure	SetPackageAction
-- =============================================================================
IF EXISTS	(	SELECT	1	FROM	sysobjects	WHERE	name	=	'SetPackageAction'	AND	xtype	=	'P'	)
	DROP	PROCEDURE	SetPackageAction
GO

CREATE 	PROCEDURE 	SetPackageAction
(
	@p_package_id		package_id,
	@p_screen_id		screen_id,
	@p_action_nm		screen_nm,
	@p_display_order	SMALLINT,
	@p_user_roles_list	VARCHAR (2000)				--	list is separated by |
)
WITH	ENCRYPTION
AS
	DECLARE
		@user_role_id	user_role_id,
		@position		INT
BEGIN
	INSERT INTO	package_screen_actions
			(	package_id, screen_id, action_id, display_order	)
		VALUES
			(	@p_package_id, @p_screen_id, @p_action_nm, @p_display_order	);

	SET @position = CHARINDEX ('|', @p_user_roles_list)
	IF (@position > 0)
	BEGIN
		SET @user_role_id = LTRIM(RTRIM(SUBSTRING (@p_user_roles_list, 1, @position - 1)));
		SET @p_user_roles_list = LTRIM(RTRIM(SUBSTRING (@p_user_roles_list, @position + 1, 2000)));
	END
	ELSE
	BEGIN
		SET @user_role_id = @p_user_roles_list;
		SET @p_user_roles_list = '';
	END

	IF (@user_role_id IS NULL OR @user_role_id = '')
	BEGIN
		RAISERROR ('ERROR: User Role ID must be specified for the Package [%s] Screen [%s] Action [%s]', 16, -1, @p_package_id, @p_screen_id, @p_action_nm);
		RETURN
	END

	WHILE (LEN (@user_role_id) > 0)
	BEGIN																--- [
--		print 'User Role = [' + @user_role_id + ']'

		INSERT INTO	user_role_granted_actions
				(	user_role_id, package_id, screen_id, action_id, display_order	)
			VALUES
				(	@user_role_id, @p_package_id, @p_screen_id, @p_action_nm, @p_display_order	);

		SET @position = CHARINDEX ('|', @p_user_roles_list)
		IF (@position > 0)
		BEGIN
			SET @user_role_id = LTRIM(RTRIM(SUBSTRING (@p_user_roles_list, 1, @position - 1)));
			SET @p_user_roles_list = LTRIM(RTRIM(SUBSTRING (@p_user_roles_list, @position + 1, 2000)));
		END
		ELSE
		BEGIN
			SET @user_role_id = @p_user_roles_list;
			SET @p_user_roles_list = '';
		END
	END																	--- ]
END
GO

-- =============================================================================

USE ZSM
GO

EXEC 	sp_dropextendedproperty
		'Sewas_CK_IsReferredSewa_AttendanceMarking',
		'USER',	'dbo', 'TABLE',	'sewas'
GO


ALTER TABLE	sewas
	DROP CONSTRAINT	Sewas_CK_ReferredSewaID_AttendanceMarking;
GO

ALTER TABLE	sewas
	ADD CONSTRAINT	Sewas_CK_ReferredSewaID_AttendanceMarking
			CHECK	(	(	referred_sewa_id	IS NULL		AND	attendance_marking	!=	'Computed'	)
					OR	(	referred_sewa_id	IS NOT NULL	AND	attendance_marking	=	'Computed'	)
					);


EXEC 	sp_addextendedproperty
		'Sewas_CK_ReferredSewaID_AttendanceMarking', '"Attendance Marking" can be specified as Computed only if Referred Sewa is specified',
		'USER',	'dbo', 'TABLE',	'sewas'
GO

-- =============================================================================

-- vim:sw=4 ht=4 ai ts=4
