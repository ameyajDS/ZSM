USE AMS
GO

IF EXISTS (SELECT * FROM sysobjects WHERE type = 'P' AND name = 'updItem')
	BEGIN
		DROP  Procedure  dbo.updItem
	END

GO

CREATE PROCEDURE dbo.updItem
(
	@item_id	int,
	@item_nm	varchar(30),--<desc>Name of the item to be created
	@asset_type_id	asset_type_id,
	@effective_from	datetime,
	@effective_till	datetime,
	@txn_ts bigint
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE items SET item_nm=@item_nm,
			asset_type_id=@asset_type_id,
			effective_from=@effective_from,
			effective_till=@effective_till
			
		WHERE item_id=@item_id
		AND Convert(bigint, txn_ts)=@txn_ts

END
GO
