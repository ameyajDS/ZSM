SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertSewadarsMerged
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertSewadarsMerged'
			)
	BEGIN
		DROP PROCEDURE  InsertSewadarsMerged
	END
GO
CREATE PROCEDURE InsertSewadarsMerged
(
	@src_sewadar_id		sewadar_id,
	@dst_sewadar_id		sewadar_id
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO sewadars_merged
	(
		src_sewadar_id, dst_sewadar_id, merged_dtm
	)
	VALUES
	(
		@src_sewadar_id, @dst_sewadar_id, GETDATE()
	)
END
GO
-- =============================================================================
-- vim:ts=4 sw=4 ht=4


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	ViewMergeSewadarInformation
-- =============================================================================
IF EXISTS	(	SELECT  *
				FROM    sysobjects
				WHERE name = 'ViewMergeSewadarInformation' and TYPE='v'
			)

	BEGIN
		DROP VIEW ViewMergeSewadarInformation
	END
GO
CREATE VIEW ViewMergeSewadarInformation

WITH ENCRYPTION
AS
	SELECT
		sm.src_sewadar_id, 
		sm.dst_sewadar_id, 
		sm.merged_dtm,
		dst_full_nm = dst_vs.full_nm,
		src_full_nm = src_vs.full_nm
	FROM sewadars_merged sm
	JOIN ViewSewadarHeader src_vs ON src_vs.sewadar_id = sm.src_sewadar_id
	JOIN ViewSewadarHeader dst_vs ON dst_vs.sewadar_id = sm.dst_sewadar_id


GO

