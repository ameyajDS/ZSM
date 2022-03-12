
USE AMS
GO

IF EXISTS (SELECT * FROM sysobjects WHERE type = 'P' AND name = 'insAssets')
	BEGIN
		DROP  Procedure  insAssets
	END

GO

CREATE Procedure dbo.insAssets
	(
		@satsang_centre_id	centre_id,
		@item_id			int,
		@make_model			varchar,
		@chasis_no			varchar,
		@details			varchar,
		@engine_no			varchar,
		@quantity			int,
		@acquisition_dt		datetime,
		@acquisition_cost	int,
		@present_value		int,
		@valuation_dt		datetime,
		@remarks			varchar,
		@asset_id			int output		
	)
AS
BEGIN
	INSERT INTO assets( satsang_centre_id,
						item_id,
						make_model,
						chasis_no,
						details,
						engine_no,
						quantity,
						acquisition_dt,
						acquisition_cost,
						present_value,
						valuation_dt,
						remarks)						
				VALUES(	@satsang_centre_id,
						@item_id,
						@make_model,
						@chasis_no,
						@details,
						@engine_no,
						@quantity,
						@acquisition_dt,
						@acquisition_cost,
						@present_value,
						@valuation_dt,
						@remarks)
SELECT @asset_id = ident_current('assets')

END
GO



