/* ==================================================================================
    Source File		:	20_triggers_drop.sql
    Author(s)		:	Jitendra Loyal (JL)
    Started On		:	Thu Mar 03 10:25:00 IST 2011
    Version			:	0.01
    Last updated	:	Mar 01, 2010
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:	
    Reviewed On		:	
    ==================================================================================
									   Usage Notes
    ----------------------------------------------------------------------------------
		Drops all the triggers in the current database
    ==================================================================================
								      Revision History
    ----------------------------------------------------------------------------------

   ==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

EXEC	SysAdmin..DropAllTriggers	'ZSM'
GO

-- =============================================================================
--	List and drop all triggers in the current database
-- =============================================================================


-- =============================================================================

-- vim:ts=4 ht=8 sw=4 guifont=Lucida_Console


