				
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	ParsePipeSeparatedTwoArgs
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='ParsePipeSeparatedTwoArgs'
			)
	BEGIN
		DROP PROCEDURE  ParsePipeSeparatedTwoArgs
	END
GO
CREATE PROCEDURE ParsePipeSeparatedTwoArgs
(
			@p_object_id		VARCHAR (200),
			@str1				VARCHAR(50) OUTPUT,
	        @str2				VARCHAR(50) OUTPUT
)
WITH ENCRYPTION
AS
BEGIN
	select @str2 = RIGHT(@p_object_id, LEN(@p_object_id) - CHARINDEX('|', @p_object_id))
	select @str1 = LEFT(@p_object_id, CHARINDEX('|', @p_object_id)-1)
END				
				
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	ParsePipeSeparatedThreeArgs
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='ParsePipeSeparatedThreeArgs'
			)
	BEGIN
		DROP PROCEDURE  ParsePipeSeparatedThreeArgs
	END
GO
CREATE PROCEDURE ParsePipeSeparatedThreeArgs
(
			@p_object_id		VARCHAR (200),
			@str1				VARCHAR(50) OUTPUT,
	        @str2				VARCHAR(50) OUTPUT,
	        @str3				VARCHAR(50) OUTPUT
)
WITH ENCRYPTION
AS
BEGIN
	select @str3 = RIGHT(RIGHT(@p_object_id, LEN(@p_object_id) - CHARINDEX('|', @p_object_id)) , LEN(RIGHT(@p_object_id, LEN(@p_object_id) - CHARINDEX('|', @p_object_id))) - CHARINDEX('|', RIGHT(@p_object_id, LEN(@p_object_id) - CHARINDEX('|', @p_object_id))))
	select @str2 = LEFT(RIGHT(@p_object_id, LEN(@p_object_id) - CHARINDEX('|', @p_object_id)), CHARINDEX('|', RIGHT(@p_object_id, LEN(@p_object_id) - CHARINDEX('|', @p_object_id))) -1)
	select @str1 = LEFT(@p_object_id, CHARINDEX('|', @p_object_id)-1)
END

