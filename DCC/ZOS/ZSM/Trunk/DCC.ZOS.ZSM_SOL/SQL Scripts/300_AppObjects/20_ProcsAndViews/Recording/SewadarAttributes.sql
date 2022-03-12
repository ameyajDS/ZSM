
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertSewadarsAttribute'
			)
	BEGIN
		DROP PROCEDURE  InsertSewadarsAttribute
	END
GO
CREATE PROCEDURE InsertSewadarsAttribute
(
	@satsang_centre_id		satsang_centre_id,
	@sewadar_grno			sewadar_grno,
	@attribute_id			attribute_id,
	@string_value			varchar(255),
	@boolean_value			Boolean = NULL,
	@date_value				smalldatetime = NULL,
	@int_value				int	 = NULL,
	@number_value			numeric = NULL,
	@list_value				attribute_value = NULL,
	@remarks				varchar(1000) = NULL,
	@effective_from			datetime = NULL,
	@effective_till			datetime = NULL
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO sewadars_attributes
	(
		satsang_centre_id, sewadar_grno, attribute_id, boolean_value, date_value, int_value, number_value, list_value, remarks, effective_from, effective_till
	)
	VALUES
	(
		@satsang_centre_id, @sewadar_grno, @attribute_id, @boolean_value, @date_value, @int_value, @number_value, @list_value, @remarks, @effective_from, @effective_till
	)
END
GO

---------------------------------------------------------------------------------
IF EXISTS (SELECT TOP 1 1 FROM Sysobjects WHERE name ='DeleteSewadarAttributes' AND type='p')
BEGIN
	DROP PROCEDURE dbo.DeleteSewadarAttributes
END
GO
CREATE PROCEDURE dbo.DeleteSewadarAttributes
(
	@sewadar_grno	sewadar_grno,
	@satsang_centre_id	satsang_centre_id,
	@attribute_group	gnc_nm
)
AS
BEGIN
	
	/*DEBUG BLOCK
	DECLARE @sewadar_grno	sewadar_grno
	DECLARE @satsang_centre_id	satsang_centre_id
	DECLARE @attribute_group	gnc_nm
	SET @sewadar_grno = 'G00297'
	SET @satsang_centre_id = 6015
	SET @attribute_group = 'Sewadar'
	--*/
	
	DELETE sa
	FROM sewadars_attributes sa
	JOIN dbo.generic_attributes ga  ON (sa.attribute_id=ga.attribute_id)		
	WHERE ga.attribute_group=@attribute_group
	AND sa.satsang_centre_id=@satsang_centre_id
	AND sa.sewadar_grno=@sewadar_grno
END
GO
------------------------------------------------------------------------------------

--EXEC GetSewadarAttributes 'G00297',6015,'Sewadar'
IF EXISTS (SELECT TOP 1 1 FROM Sysobjects WHERE name ='GetSewadarAttributes' AND type='p')
BEGIN
	DROP PROCEDURE dbo.GetSewadarAttributes
END
GO
CREATE PROCEDURE dbo.GetSewadarAttributes
(
	@sewadar_grno	sewadar_grno,
	@satsang_centre_id	satsang_centre_id,
	@attribute_group	gnc_nm
)
AS
BEGIN
	
	/*DEBUG BLOCK
	DECLARE @sewadar_grno	sewadar_grno
	DECLARE @satsang_centre_id	satsang_centre_id
	DECLARE @attribute_group	gnc_nm
	SET @sewadar_grno = 'G00297'
	SET @satsang_centre_id = 6015
	SET @attribute_group = 'Sewadar'
	--*/
	SELECT ga.attribute_id, ga.attribute_nm,
	        ga.attribute_group, ga.attribute_sq, ga.attribute_type,
	        ga.attribute_length, ga.attribute_scale, ga.is_temporal,
	        ga.is_mandatory, ga.is_status_applicable, 
	        sa.boolean_value,sa.date_value,sa.int_value,sa.number_value,sa.list_value,
	        sa.remarks, sa.effective_from,sa.effective_till        
	FROM dbo.generic_attributes ga
		JOIN dbo.generic_attributes_satsang_centres sc
			ON	(	ga.attribute_id	=	sc.attribute_id
				AND	sc.satsang_centre_id	=	@satsang_centre_id
				AND	GetDate()	BETWEEN		sc.effective_from	AND	sc.effective_till
				)
	LEFT OUTER JOIN dbo.sewadars_attributes sa ON 
		(
			(sa.attribute_id=ga.attribute_id)
			AND ((sa.sewadar_grno IS NULL) OR (sa.sewadar_grno=@sewadar_grno))
			AND ((sa.satsang_centre_id IS NULL) OR (sa.satsang_centre_id=@satsang_centre_id))
	)
	WHERE ga.attribute_group=@attribute_group		
	ORDER BY ga.attribute_sq
	
END
GO

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE type='V' AND name = 'vwSewadarsAttributes')
BEGIN
	DROP VIEW vwSewadarsAttributes
END
GO
CREATE VIEW vwSewadarsAttributes
AS
SELECT vs.*
FROM ViewSewadarHeader vs
WHERE sewadar_grno IN (SELECT sewadar_grno FROM dbo.sewadars_attributes)


GO
-- =============================================================================
-- vim:ts=4 sw=4 ht=4
