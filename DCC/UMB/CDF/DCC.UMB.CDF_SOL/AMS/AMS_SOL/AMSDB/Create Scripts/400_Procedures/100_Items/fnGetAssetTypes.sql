USE AMS
GO
If EXISTS(select 1 from sysobjects where name = 'fnGetAssetTypes' and type ='IF')
DROP 	FUNCTION 	dbo.fnGetAssetTypes
GO

CREATE 	FUNCTION dbo.fnGetAssetTypes()
RETURNS TABLE
AS
RETURN
(
	SELECT 
		asset_type_id,
		asset_type_cd,
		asset_type_nm,
		effective_from,
		effective_till,
		txn_ts
	FROM 
		asset_types
)


