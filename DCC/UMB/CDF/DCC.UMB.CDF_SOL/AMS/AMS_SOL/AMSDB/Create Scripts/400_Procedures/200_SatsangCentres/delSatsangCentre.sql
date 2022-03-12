USE AMS
GO

IF EXISTS (SELECT * FROM sysobjects WHERE type = 'P' AND name = 'delSatsangCentre')
	BEGIN
		DROP  Procedure  dbo.delSatsangCentre
	END

GO

CREATE PROCEDURE dbo.delSatsangCentre
(
	@satsang_centre_id 	int 
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM satsang_centres WHERE satsang_centre_id=@satsang_centre_id

END
GO
