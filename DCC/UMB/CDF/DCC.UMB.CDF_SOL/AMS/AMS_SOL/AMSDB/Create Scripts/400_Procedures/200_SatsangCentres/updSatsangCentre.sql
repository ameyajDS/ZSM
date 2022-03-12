USE AMS
GO

IF EXISTS (SELECT * FROM sysobjects WHERE type = 'P' AND name = 'updSatsangCentre')
	BEGIN
		DROP  Procedure  dbo.updSatsangCentre
	END

GO

CREATE PROCEDURE dbo.updSatsangCentre
(
	@satsang_centre_id 	int,
	@zone_id		zone_id,
	@centre_type		centre_type,
	@satsang_centre_nm	varchar,
	@effective_from		datetime,
	@effective_till		datetime,
	@txn_ts 		bigint
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE satsang_centres SET 			
				zone_id=@zone_id,
				centre_type=@centre_type,
				satsang_centre_nm=@satsang_centre_nm,
				effective_from=@effective_from,
				effective_till=@effective_till
			WHERE
				satsang_centre_id =@satsang_centre_id AND
				CONVERT(bigint, txn_ts)=@txn_ts
END
GO
