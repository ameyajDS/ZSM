SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	View	ViewRelations
-- =============================================================================
IF EXISTS	(	SELECT  *
				FROM    sysobjects
				WHERE name = 'ViewRelations' and TYPE='V'	
			)
	BEGIN
		DROP VIEW  ViewRelations
	END
GO
CREATE VIEW ViewRelations
AS
	SELECT 
	   relation_id
	 , relation_nm
	 , txn_ts
	 , effective_from
	 , effective_till
	 FROM dbo.relations
GO
-- =============================================================================