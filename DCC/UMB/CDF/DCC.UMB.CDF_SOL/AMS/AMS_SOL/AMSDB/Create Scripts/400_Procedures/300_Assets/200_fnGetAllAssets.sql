IF EXISTS (SELECT * FROM sysobjects WHERE type = 'IF' AND name = 'fnGetAllAssets')
	BEGIN
		DROP  Function  dbo.fnGetAllAssets
	END

GO
CREATE FUNCTION dbo.fnGetAllAssets ()
RETURNS TABLE 
AS
RETURN 
(
	SELECT	
			a.asset_id,
			a.satsang_centre_id,
			a.item_id,			
			a.make_model,
			a.chasis_no,
			a.details,
			a.engine_no,
			a.quantity,
			a.acquisition_dt,
			a.acquisition_cost,
			a.present_value,
			a.valuation_dt,
			a.remarks,
			a.txn_ts,			
			i.item_nm,			
			at.asset_type_id,
			at.asset_type_cd,
			at.asset_type_nm,
			z.zone_id,
			z.zone_nm,			
			sc.centre_type,
			sc.satsang_centre_nm
	FROM	assets a
	JOIN	satsang_centres sc ON (sc.satsang_centre_id = a.satsang_centre_id)
	JOIN	zones z ON(sc.zone_id = z.zone_id)
	JOIN	items i ON(i.item_id = a.item_id)
	JOIN	asset_types at ON (at.asset_type_id = i.asset_type_id)
	
)
GO
 