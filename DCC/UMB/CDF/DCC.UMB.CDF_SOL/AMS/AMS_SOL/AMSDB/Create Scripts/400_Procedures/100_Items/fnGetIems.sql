USE AMS
GO
If EXISTS(select 1 from sysobjects where name = 'fnGetItems' and type ='IF')
DROP 	FUNCTION 	dbo.fnGetItems
GO

CREATE 	FUNCTION dbo.fnGetItems()
RETURNS TABLE
AS
RETURN
(
	SELECT 
		i.item_id,
		i.item_nm,
		a.asset_type_id,
		a.asset_type_nm,
		a.asset_type_cd,
		i.effective_from,
		i.effective_till,
		convert(bigint,i.txn_ts) as txn_ts
	FROM 
		items i
	JOIN asset_types a
	ON (i.asset_type_id = a.asset_type_id)

)


