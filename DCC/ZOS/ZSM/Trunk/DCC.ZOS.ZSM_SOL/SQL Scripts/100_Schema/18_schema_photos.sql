/* ==================================================================================
    Source File		:	schema_photos.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Mon Dec 12 14:16:30 IST 2011
    Version			:	1.00
    Last updated	:	Jan 28, 2014
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:	
    Reviewed On		:	
    ==================================================================================
									   Usage Notes
    ----------------------------------------------------------------------------------
    ==================================================================================
								      Revision History
    ----------------------------------------------------------------------------------
	 JL/MS: 28-Jan-2014
		*	Triggers moved to separate file so that can be dropped and sourced at any time
     JL : 12, 13, 15-Dec-2011
		*   Initial version
   ==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

-- =============================================================================
-- Photos of the sewadars are stored in the database rather than the file system.
-- This will be much easier to maintain than to keep the photos in the file system.
-- The primary reason for keeping the photos in the database is for security.
-- Trigger ensures that sewadar_id exists in ZSM..sewadars table for the entries here.(Trigger a)
-- =============================================================================

CREATE	TABLE	sewadars_photos
(
	sewadar_id			INTEGER		NOT NULL	CONSTRAINT	SewadarsPhotos_PK_SewadarID
													PRIMARY KEY	NONCLUSTERED,
	sewadar_photo		IMAGE		NOT NULL,
	photo_dt			DATETIME	NOT NULL	CONSTRAINT	SewadarsPhotos_CK_PhotoDt
														CHECK	(	photo_dt <= GETDATE()	)
)
GO

EXEC 	sp_addextendedproperty
		'SewadarsPhotos_CK_PhotoDt', 'Photo Date cannot be in future' ,
		'USER',	'dbo', 'TABLE',	'sewadars_photos'
GO

-- =============================================================================
--  Trigger ensures that audit_log_id exists in ZSM..audit_logs table for the entries here.(Trigger a)
-- =============================================================================
CREATE	TABLE	adt_sewadars_photos
(
 	audit_log_id		INTEGER			NOT NULL,
	sewadar_id			INTEGER			NOT NULL,
	sewadar_photo		IMAGE			NOT NULL,
	photo_dt			DATETIME		NOT NULL,

		CONSTRAINT	AdtSewadarsPhotos_PK_AuditLogId_SewadarId
			PRIMARY KEY		NONCLUSTERED	(	audit_log_id, sewadar_id	)
)
GO

-- =============================================================================

-- vim:ts=4 ht=8 sw=4
