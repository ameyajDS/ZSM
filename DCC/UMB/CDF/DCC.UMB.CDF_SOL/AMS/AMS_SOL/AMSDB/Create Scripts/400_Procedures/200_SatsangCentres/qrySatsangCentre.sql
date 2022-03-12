USE AMS
GO
If EXISTS(select 1 from sysobjects where name = 'qrySatsangCentres' and type ='P')
DROP 	PROCEDURE 	dbo.qrySatsangCentres
GO

CREATE 	PROCEDURE dbo.qrySatsangCentres
(
	@ShowCurrent boolean = null
)
WITH ENCRYPTION
AS
BEGIN
	DECLARE @today datetime
	set @today = getdate()
	SELECT * from fnGetSatsangCentres()		
	WHERE
		@showCurrent='Yes' AND		
		@today >=effective_from AND
		@today <=effective_till 
		OR
		@showCurrent='No'
		OR
		@showCurrent IS NULL	

END


