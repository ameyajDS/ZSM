/* ==================================================================================
    Source File		:	upgrade_v5.50.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Thu Feb 28 2012
    Last updated	:	Mar 09, 2012
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Upgrade Script for v5.50
			..... In SetPackageScreen, message changed when User Role ID was not specified for a Menu Item (when Screen ID is not specified).
			..... In SetPackageScreen, the User Role ID was not properly handled for Menu Item (when Screen ID is not specified).
    ==================================================================================
								      								  Revision History
    ----------------------------------------------------------------------------------
		9-Mar-2012
			* New tables generic_list_report_headers and generic_list_report_details added to support
			  reports that print only Sewadar Names. These will now be printed in two columns, and the
			  page breaks are also manually computed to save paper.
   ==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

USE SysAdmin
GO


UPDATE packages
	SET	version_no = 5.50,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'

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
	@p_user_roles_and_oprtns_list	VARCHAR (2000)				--	list is separated by | whereas each role and operations (IUDRP) separated by a colon for a screen
																--	list is separated by | for each role for a menu item
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
	IF (@p_screen_id IS NOT NULL AND @p_screen_id != '')
	BEGIN
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
	END

		---- Validations on User Roles and Operations List
		--------------------------------------------------
	SET @p_user_roles_and_oprtns_list	=	LTRIM(RTRIM(@p_user_roles_and_oprtns_list))
	IF (@p_user_roles_and_oprtns_list IS NULL OR @p_user_roles_and_oprtns_list = '')
	BEGIN
		RAISERROR ('ERROR: List of User Roles along with Operations must be specified [%s] or List of User-roles must be specified for menu [%s]', 16, -1, @p_screen_id, @p_menu_dsc);
		RETURN
	END

	IF (@p_screen_id IS NOT NULL AND @p_screen_id != '')
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

	IF (LEN (@p_operations_audited) > 0 AND @p_screen_id IS NOT NULL AND @p_screen_id != '')
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
		RAISERROR ('ERROR: User Role ID along with Operations Supported must be specified for Screen [%s] or List of User-roles must be specified for Menu [%s]', 16, -1, @p_screen_id, @p_menu_dsc);
		RETURN
	END

	WHILE (LEN (@usrrole_oprtns) > 0)
	BEGIN																--- [
		SET @position = CHARINDEX (':', @usrrole_oprtns)
		IF ((@position IS NULL OR @position = 0) AND @p_screen_id IS NOT NULL AND @p_screen_id != '')
		BEGIN
			RAISERROR ('ERROR: Delimiter colon [:] is not found in [%s] for Screen [%s]', 16, -1, @usrrole_oprtns, @p_screen_id);
			RETURN
		END
		IF (@p_screen_id IS NULL OR @p_screen_id = '')
			SET @user_role_id = @usrrole_oprtns;
		ELSE
		BEGIN
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
		END

		IF (@p_menu_group_id IS NOT NULL AND @p_menu_group_id != '')
			INSERT INTO user_role_menus
					(	user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_key_accessor, display_order	)
				VALUES
					(	@user_role_id, @p_menu_group_id, @p_screen_nm, @p_menu_dsc, @p_ctrl_key_accessor, @p_display_order	);

		IF (@p_screen_id IS NOT NULL AND @p_screen_id != '')
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
--		ZSM changes
-- =============================================================================

USE ZSM
GO

CREATE	TABLE	generic_list_report_headers
(
	session_id					report_session_id		NOT NULL	CONSTRAINT	GenericListReportHeaders_FK_SessionID
																		REFERENCES	generic_report_headers,
	header_serial_id			INTEGER					NOT NULL,
	sub_header_information		report_description		NOT NULL,
	is_eject_page				Boolean					NOT NULL	CONSTRAINT	GenericListReportHeaders_DF_IsEjectPage
																		DEFAULT	'No',
		
		CONSTRAINT	GenericListReportDetails_PK_SessionID_HeaderSerialID
			PRIMARY KEY	NONCLUSTERED	(	session_id, header_serial_id 	)
)
GO

-- =============================================================================

CREATE	TABLE	generic_list_report_details
(
	session_id					report_session_id		NOT NULL,
	header_serial_id			INTEGER					NOT NULL,
	column1_serial_id			INTEGER					NOT NULL,
	column1_satsang_centre_id 	satsang_centre_id		NOT NULL,
	column1_sewadar_grno		sewadar_grno			NOT NULL,
	column1_sewadar_nm			VARCHAR (100)			NOT NULL,
	column2_serial_id			INTEGER						NULL,
	column2_satsang_centre_id 	satsang_centre_id			NULL,
	column2_sewadar_grno		sewadar_grno				NULL,
	column2_sewadar_nm			VARCHAR (100)				NULL,

		CONSTRAINT	GenericListReportDetails_PK_SessionID_HeaderSerialID_Column1SerialID
			PRIMARY KEY	NONCLUSTERED	(	session_id, header_serial_id, column1_serial_id 	),

		CONSTRAINT	GenericListReportDetails_FK_SessionID_HeaderSerialID
			FOREIGN KEY	(	session_id, header_serial_id 	)
				REFERENCES	generic_list_report_headers,

		CONSTRAINT	GenericListReportDetails_FK_Column1SatsangCentreID_Column1SewadarGRNo
			FOREIGN KEY	(	column1_satsang_centre_id, column1_sewadar_grno	)
				REFERENCES	sewadars_registrations,

		CONSTRAINT	GenericListReportDetails_FK_Column2SatsangCentreID_Column2SewadarGRNo
			FOREIGN KEY	(	column2_satsang_centre_id, column2_sewadar_grno	)
				REFERENCES	sewadars_registrations
)
GO

-- =============================================================================

-- vim:sw=4 ht=4 ai ts=4
