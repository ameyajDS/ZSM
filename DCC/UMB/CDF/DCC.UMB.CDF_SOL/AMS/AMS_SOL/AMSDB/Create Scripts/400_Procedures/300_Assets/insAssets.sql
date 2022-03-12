
USE AMS
GO

IF EXISTS (SELECT * FROM sysobjects WHERE type = 'P' AND name = 'insAssets')
	BEGIN
		DROP  Procedure  insAssets
	END

GO

CREATE Procedure dbo.insAssets
(
	@satsang_centre_id	centre_id,--<desc>Id of the satsang centre to which this asset belongs to
	@item_id			int,--<desc>Id of the item which constitutes this asset
	@make_model			varchar,--<desc>make/model of this asset
	@chasis_no			varchar,--<desc>Chasis Number of this vehicle asset
	@details			varchar,--<desc>Details of this asset
	@engine_no			varchar,--<desc>Engine Number of this vehicle asset
	@quantity			int,--<desc>Number of pieces of the item constituting this asset
	@acquisition_dt		datetime,--<desc> Date on which this asset was acquired
	@acquisition_cost	int,--<desc> Cost at which this asset was acquired
	@present_value		int,--<desc> Present value of this asset
	@valuation_dt		datetime,--<desc> Date at which the present value was calculated
	@remarks			varchar,--<desc> Other remarks about this asset. A free form text.
	@asset_id			int output		--<desc> The system generated id of this asset. This is a reference parameter.
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



