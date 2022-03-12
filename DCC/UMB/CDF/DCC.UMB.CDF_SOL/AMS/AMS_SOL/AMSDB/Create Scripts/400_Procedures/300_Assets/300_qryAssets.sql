USE AMS
GO
IF EXISTS (SELECT * FROM sysobjects WHERE type = 'P' AND name = 'qrySatsangCentresHoldingAssets')
	BEGIN
		DROP  Procedure  dbo.qrySatsangCentresHoldingAssets
	END

GO

CREATE Procedure dbo.qrySatsangCentresHoldingAssets
(
	@asset_id  int = null,
	@satsang_centre_id centre_id = null,
	@zone_id zone_id = null,
	@centre_type centre_type = null,
	@item_id int = null,
	@asset_type_id asset_type_id = null
)
AS
BEGIN
	SELECT distinct(satsang_centre_id),  zone_id,centre_type,satsang_centre_nm from fngetAllAssets()
	WHERE (
			((@asset_id is null) or (asset_id = @asset_id))
			AND
			((@satsang_centre_id is null) or (satsang_centre_id = @satsang_centre_id))
			AND
			((@zone_id is null) or (zone_id = @zone_id))
			AND
			((@centre_type is null) or (centre_type = @centre_type))
			AND
			((@item_id is null) or (item_id = @item_id))
			AND
			((@asset_type_id is null) or (asset_type_id = @asset_type_id)))
END


GO

