/* ==================================================================================
    Source File		:	upgrade_v5.39.sql.exclude
    Author(s)		:	Jitendra Loyal
    Started On		:	Sat Jan 28 2012
    Last updated	:	Jan 29, 2012
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Upgrade Script for v5.46
			..... Adding a new user role ZSM_PC
			..... Messages for Photo operations
    ==================================================================================
								      								  Revision History
    ----------------------------------------------------------------------------------

   ==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

USE SysAdmin
GO


UPDATE packages
	SET	version_no = 5.46,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'

EXEC DROPROLE 'ZSM', 'ZSM_PC';
EXEC CREATEROLE 'ZSM', 'ZSM_PC', 'Photo Clicking User', 'DCC.ZOS.ZSM.exe';

GO

-- =============================================================================

INSERT INTO Sysadmin.dbo.standard_messages (package_id, message_cd,message_text)    VALUES( 'SAM', 'PhotoSave', 'Photo successfully saved in @1. Please wait (preparing for next photo) ...');
INSERT INTO Sysadmin.dbo.standard_messages (package_id, message_cd,message_text)    VALUES( 'SAM', 'PhotoPrepare', 'Preparing for next photo. Please wait ...');
INSERT INTO Sysadmin.dbo.standard_messages (package_id, message_cd,message_text)    VALUES( 'SAM', 'PhotoCancel', 'Photo cancelled. Please wait ...');

-- =============================================================================

-- vim:sw=4 ht=4 ai ts=4
