USE AMS
GO

IF EXISTS (SELECT * FROM sysobjects WHERE type = 'P' AND name = 'insSatsangCentre')
	BEGIN
		DROP  Procedure  dbo.insSatsangCentre
	END

GO

CREATE PROCEDURE dbo.insSatsangCentre
(
	@zone_id		zone_id,
	@centre_type		centre_type,
	@satsang_centre_nm	varchar(25),
	@effective_from		datetime,
	@effective_till		datetime,
	@satsang_centre_id 	int OUTPUT
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO satsang_centres(			
				zone_id,
				centre_type,
				satsang_centre_nm,
				effective_from,
				effective_till
				)
		VALUES
			(			
				@zone_id,
				@centre_type,
				@satsang_centre_nm,
				@effective_from,
				@effective_till
			)
	SELECT @satsang_centre_id = ident_current('satsang_centres')
END
GO
