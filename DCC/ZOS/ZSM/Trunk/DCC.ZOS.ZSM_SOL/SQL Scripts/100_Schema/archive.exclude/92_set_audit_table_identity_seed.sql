/* ==================================================================================
    Source File		:	set_audit_table_identity_seed.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Aug 02 18:43 IST 2012
    Version			:	1.00
    Last updated	:	Aug 02, 2012
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:	
    Reviewed On		:	
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		This script resets the Identity Seed for audit_logs Table
    ==================================================================================
								   									  Revision History
    ----------------------------------------------------------------------------------
     JL : 02-Aug-2011
		*   Initial version
   ==================================================================================*/




DECLARE
	@max_val	INT

SELECT	@max_val	=	MAX (audit_log_id)
FROM	ZSM_Archive..audit_logs;

IF (@max_val IS NOT NULL AND @max_val > 0)
	DBCC CHECKIDENT ('audit_logs', RESEED, @max_val) WITH NO_INFOMSGS;
	

-- =============================================================================
-- vim:ts=4 ht=8 sw=4
