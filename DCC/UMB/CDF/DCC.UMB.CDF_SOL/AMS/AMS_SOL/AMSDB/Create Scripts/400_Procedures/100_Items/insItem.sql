USE AMS
GO

IF EXISTS (SELECT * FROM sysobjects WHERE type = 'P' AND name = 'insItem')
	BEGIN
		DROP  Procedure  dbo.insItem
	END

GO

CREATE PROCEDURE dbo.insItem
(
	@item_nm	varchar(30),--<desc>Name of the item to be created
	@asset_type_id	asset_type_id,
	@effective_from	datetime,
	@effective_till	datetime,
	@item_id	int output
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO items(			
			item_nm,
			asset_type_id,
			effective_from,
			effective_till
			)
		VALUES
			(			
			@item_nm,
			@asset_type_id,
			@effective_from,
			@effective_till
			)
	SELECT @item_id = ident_current('items')
END
GO
