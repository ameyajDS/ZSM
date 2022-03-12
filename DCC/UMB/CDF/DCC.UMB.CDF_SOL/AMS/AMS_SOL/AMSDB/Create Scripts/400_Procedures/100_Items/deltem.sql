USE AMS
GO

IF EXISTS (SELECT * FROM sysobjects WHERE type = 'P' AND name = 'delItem')
	BEGIN
		DROP  Procedure  dbo.delItem
	END

GO

CREATE PROCEDURE dbo.delItem
(
	@item_id	int 
)
WITH ENCRYPTION
AS
BEGIN
	DELETE from items where item_id = @item_id
END
GO
