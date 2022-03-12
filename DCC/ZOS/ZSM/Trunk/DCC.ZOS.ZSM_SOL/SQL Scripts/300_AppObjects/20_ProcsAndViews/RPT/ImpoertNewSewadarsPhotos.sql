
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	DeleteSewadarsRemarksReference
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteSewadarsRemarksReference'
			)
	BEGIN
		DROP PROCEDURE  DeleteSewadarsRemarksReference
	END
GO

CREATE PROCEDURE DeleteSewadarsRemarksReference
(
	@satsang_centre_id		satsang_centre_id,
	@sewadarIds				SewadarIdList READONLY
)
WITH ENCRYPTION
AS
BEGIN
	
	SELECT sewadar_id INTO #SewadarIdList
	FROM @sewadarIds

	DELETE sr 
	FROM sewadars_remarks sr
	INNER JOIN  #SewadarIdList sl  ON sl.sewadar_id = sr.sewadar_id
	JOIN ViewSewadarHeader vs ON sl.sewadar_id = sr.sewadar_id
	WHERE sr.remarks_type = 'Reference' AND	vs.satsang_centre_id = @satsang_centre_id
END
GO
-- =============================================================================
-- vim:ts=4 sw=4 ht=4

