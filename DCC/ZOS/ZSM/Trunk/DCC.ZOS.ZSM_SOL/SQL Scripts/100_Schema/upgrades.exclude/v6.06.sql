/* ==================================================================================
    Source File		:	upgrade_v6.06.sql
    Author(s)		:	Ameya
    Started On		:	05th Jan 2019
	Last updated	:	05th Jan 2019
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		
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
	SET	version_no = 6.06,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'
GO


USE [ZSM]
GO

ALTER TABLE [dbo].[scanned_badges_store]
	ADD remarks VARCHAR(200) null
GO
