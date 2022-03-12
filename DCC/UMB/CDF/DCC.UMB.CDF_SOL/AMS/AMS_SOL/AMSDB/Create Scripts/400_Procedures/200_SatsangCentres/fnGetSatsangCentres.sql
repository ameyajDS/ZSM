USE AMS
GO
If EXISTS(select 1 from sysobjects where name = 'fnGetSatsangCentres' and type ='IF')
DROP 	FUNCTION 	dbo.fnGetSatsangCentres
GO

CREATE 	FUNCTION dbo.fnGetSatsangCentres()
RETURNS TABLE
AS
RETURN
(
	SELECT 
		satsang_centre_id,
		zone_id,
		centre_type,
		satsang_centre_nm,
		effective_from,
		effective_till,
		convert(bigint,txn_ts) as txn_ts
	FROM 
		satsang_centres
)


