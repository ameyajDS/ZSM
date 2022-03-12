USE AMS
GO
If EXISTS(select 1 from sysobjects where name = 'qryItem' and type ='P')
DROP 	PROCEDURE 	dbo.qryItem
GO

CREATE 	PROCEDURE dbo.qryItem
(
	@ShowCurrent boolean = null
)
WITH ENCRYPTION
AS
BEGIN
	DECLARE @today datetime
	set @today = getdate()
	SELECT * from fnGetItems()		
	WHERE
		@showCurrent='Yes' AND		
		@today >=effective_from AND
		@today <=effective_till 
		OR
		@showCurrent='No'
		OR
		@showCurrent IS NULL	

END


