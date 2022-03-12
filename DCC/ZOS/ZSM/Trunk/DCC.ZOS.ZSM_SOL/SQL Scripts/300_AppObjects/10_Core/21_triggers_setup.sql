/* ==================================================================================
    Source File		:	18_trigger_b_integrity.sql
    Author(s)		:	Jitendra Loyal (JL) / Sukhdev B. Darira (SB)
    Started On		:	Sun Nov 28 01:00:00 IST 2010
    Version			:	0.02
    Last updated	:	Sep 24, 2013
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
     JL : 24-Sep-2013
	 	* All triggers after raising the error, rollback the transaction.
     SB : 0.01 : 28-Nov-2010
		*  First Draft
   ==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

-- =============================================================================

-- =============================================================================
--	Table 	GENERIC_ATTRIBUTES_LIST_VALUES
--	Trigger ensures that rows exist in this table only for such generic_attributes.attribute_type = List
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'generic_attributes_list_values_a_iu' AND xtype = 'TR')
	DROP TRIGGER generic_attributes_list_values_a_iu
GO

CREATE TRIGGER generic_attributes_list_values_a_iu	ON	generic_attributes_list_values
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						LEFT JOIN	generic_attributes	g
							ON 	(	i.attribute_id 	= 	g.attribute_id	
								)
					WHERE	g.attribute_type	=	'List'
					AND		g.attribute_id		IS NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'ParameterMisMatch', NULL,'GENERIC_ATTRIBUTES_LIST_VALUES', 'Attributes Type', 'List'
			ROLLBACK
			RETURN
		END
END
GO

-- =============================================================================
--	Table 	GENERIC_ATTRIBUTES_STATUS
--	Trigger ensures that rows exist in this table only for such generic_attributes.is_status_applicable = Yes
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'generic_attributes_status_a_iu' AND xtype = 'TR')
	DROP TRIGGER generic_attributes_status_a_iu
GO

CREATE TRIGGER generic_attributes_status_a_iu	ON	generic_attributes_status
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						LEFT JOIN	generic_attributes	g
							ON 	(	i.attribute_id 	= 	g.attribute_id	
								)
					WHERE	g.is_status_applicable	=	'Yes'
					AND		g.attribute_id			IS NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'ParameterMisMatch', NULL,'GENERIC_ATTRIBUTES_STATUS', 'Status Applicability', 'Yes'
			ROLLBACK
			RETURN
		END
END
GO
-- =============================================================================

-- vim:ts=4 ht=8 sw=4 guifont=Lucida_Console


