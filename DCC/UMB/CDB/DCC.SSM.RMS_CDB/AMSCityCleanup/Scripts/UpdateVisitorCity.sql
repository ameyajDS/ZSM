USE [Hostels]
GO

/****** Object:  StoredProcedure [dbo].[UpdateAMSCities]    Script Date: 05/08/2015 17:59:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateVisitorCity]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[UpdateVisitorCity]
GO

USE [Hostels]
GO

/****** Object:  StoredProcedure [dbo].[UpdateVisitorCity]    Script Date: 05/08/2015 17:59:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateVisitorCity]  
@p_new_selected_city as nvarchar(50), 
@p_cdb_city_id	INT,
@p_vst_id INT, 
@p_user_no INT   
AS
BEGIN
	Declare @cnt AS INT
	UPDATE t_visitor
	SET vst_city =  @p_new_selected_city,
		cdb_city_id	=	@p_cdb_city_id
	OUTPUT	INSERTED.Vst_ID, DELETED.Vst_City, INSERTED.Vst_City, INSERTED.Sta_ID, INSERTED.cdb_city_id, GetDate()
		INTO city_bulk_update_log
	WHERE vst_ID = @p_vst_id
	SET @cnt = @@ROWCOUNT

	INSERT INTO	cdb_city_log
		(	user_no, operation_dtm, original_city_nm, cdb_city_id, records_affected, vst_id	)
	VALUES	
		(	@p_user_no, GetDate (), @p_new_selected_city, @p_cdb_city_id, @cnt, @p_vst_id	);
END

GO


