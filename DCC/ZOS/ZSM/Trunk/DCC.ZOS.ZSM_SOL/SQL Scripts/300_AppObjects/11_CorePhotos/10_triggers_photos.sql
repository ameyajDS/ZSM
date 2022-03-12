/* ==================================================================================
    Source File		:	triggers_photos.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Tue Jan 28 08:38:30 IST 2014
    Version			:	1.00
    Last updated	:	Jan 28, 2014
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:	
    Reviewed On		:	
    ==================================================================================
									   Usage Notes
    ----------------------------------------------------------------------------------
		The trigger needs to be ONLY created in ZONAL office as the other Satsang Centres'
		do not update photos
    ==================================================================================
								      Revision History
    ----------------------------------------------------------------------------------
     JL/MS : 28-Jan-2014
		*   Triggers separated from schema file so that can be dropped and sourced at any time.
   ==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

-- =============================================================================
--  Table   sewadars_photos
--  Trigger ensures that sewadar_id exists in ZSM..sewadars table for the entries here.
--	This trigger needs to be ONLY created in ZONAL office as the other Satsang Centres' databases
--		will be differently named like ZSM_NGP, ZSM_PUN, etc.
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE  xtype = 'TR' AND name = 'sewadars_photos_a_iu')
	DROP TRIGGER sewadars_photos_a_iu
GO

CREATE TRIGGER sewadars_photos_a_iu ON sewadars_photos
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						LEFT OUTER JOIN	ZSM..sewadars s
							ON 	(	s.sewadar_id	= i.sewadar_id	)					
					WHERE	s.sewadar_id		IS 		NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'NotExist', 'Sewadar ID', NULL, NULL, NULL
			RETURN
		END
END
GO

-- =============================================================================

-- =============================================================================
--  Table   adt_sewadars_photos
--  Trigger ensures that audit_log_id exists in ZSM..audit_logs table for the entries here.
--	This trigger needs to be ONLY created in ZONAL office as the other Satsang Centres' databases
--		will be differently named like ZSM_NGP, ZSM_PUN, etc.
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE  xtype = 'TR' AND name = 'adt_sewadars_photos_a_iu')
	DROP TRIGGER adt_sewadars_photos_a_iu
GO

CREATE TRIGGER adt_sewadars_photos_a_iu ON adt_sewadars_photos
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						LEFT OUTER JOIN	ZSM..audit_logs a
							ON 	(	a.audit_log_id	= i.audit_log_id	)					
					WHERE	a.audit_log_id		IS 		NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'NotExist', 'Audit Log ID', NULL, NULL, NULL
			RETURN
		END
END
GO

-- =============================================================================

-- vim:ts=4 ht=8 sw=4
