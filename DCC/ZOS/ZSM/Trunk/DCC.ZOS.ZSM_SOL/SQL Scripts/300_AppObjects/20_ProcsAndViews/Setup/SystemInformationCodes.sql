SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertSystemInformationCodes
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertSystemInformationCodes'
			)
	BEGIN
		DROP PROCEDURE  InsertSystemInformationCodes
	END
GO
CREATE PROCEDURE InsertSystemInformationCodes
(
	@system_info_cd		system_info_cd,
	@system_info_nm		gnc_nm,
	@remarks			remarks
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO system_information_codes
	(
		system_info_cd,system_info_nm,remarks
	)
	VALUES
	(
		@system_info_cd,@system_info_nm,@remarks
	)	
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateSystemInformationCodes
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateSystemInformationCodes'
			)
	BEGIN
		DROP PROCEDURE  UpdateSystemInformationCodes
	END
GO
CREATE PROCEDURE UpdateSystemInformationCodes
(
	@system_info_cd		system_info_cd,
	@old_system_info_cd		system_info_cd,
	@system_info_nm		gnc_nm,
	@remarks			remarks
		
)
WITH ENCRYPTION
AS
BEGIN


	DELETE FROM    system_information_values	
	WHERE	system_info_cd = @old_system_info_cd
	
	DELETE FROM    system_information_codes	
	WHERE	system_info_cd = @old_system_info_cd
	
	INSERT INTO system_information_codes
	(
		system_info_cd,system_info_nm,remarks
	)
	VALUES
	(
		@system_info_cd,@system_info_nm,@remarks
	)	
			
	IF (@@ROWCOUNT != 1)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotUpdated', NULL, NULL, NULL, NULL
	END	
	
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	DeleteSystemInformationCodes
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteSystemInformationCodes'
			)
	BEGIN
		DROP PROCEDURE  DeleteSystemInformationCodes
	END
GO
CREATE PROCEDURE DeleteSystemInformationCodes
(
	@system_info_cd		system_info_cd
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM system_information_values 
	WHERE system_info_cd = @system_info_cd

	DELETE FROM system_information_codes
	WHERE system_info_cd = @system_info_cd
	IF (@@ROWCOUNT != 1)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotDeleted', NULL, NULL, NULL, NULL
	END
END
GO
-- =============================================================================

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
--	Procedure	ViewSystemInformationCodes
-- =============================================================================

if exists(select * from sysobjects where name = 'viewSystemInformationCodes' and type='v')
begin
	drop view viewSystemInformationCodes
end
go
create view viewSystemInformationCodes  
as 
select *

from system_information_codes 

go


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertSystemInformationValues
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertSystemInformationValues'
			)
	BEGIN
		DROP PROCEDURE  InsertSystemInformationValues
	END
GO
CREATE PROCEDURE InsertSystemInformationValues
(
	@system_info_cd		system_info_cd,	
	@value_int		int,
	@value_varchar	gnc_nm,
	@value_dt		datetime,
	@value_dtm		datetime
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO system_information_values
	(
		system_info_cd,value_int,value_varchar,value_dt,value_dtm
	)
	VALUES
	(
		@system_info_cd,@value_int,@value_varchar,@value_dt,@value_dtm
	)
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateSystemInformationValues
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateSystemInformationValues'
			)
	BEGIN
		DROP PROCEDURE  UpdateSystemInformationValues
	END
GO
CREATE PROCEDURE UpdateSystemInformationValues
(
	@system_info_cd		system_info_cd,	
	@value_int		int,
	@value_varchar	gnc_nm,
	@value_dt		datetime,
	@value_dtm		datetime,
	@old_system_info_cd	varchar(10),
	@system_info_value     gnc_nm
	
)
WITH ENCRYPTION
AS
BEGIN
		DELETE FROM system_information_values
		WHERE system_info_cd = @old_system_info_cd and system_info_value = @system_info_value
		
		INSERT INTO system_information_values
		(
			system_info_cd,value_int,value_varchar,value_dt,value_dtm
		)
		VALUES
		(
			@system_info_cd,@value_int,@value_varchar,@value_dt,@value_dtm
		)
		
END
GO
-- =============================================================================
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	DeleteSystemInformationValues
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteSystemInformationValues'
			)
	BEGIN
		DROP PROCEDURE  DeleteSystemInformationValues
	END
GO
CREATE PROCEDURE DeleteSystemInformationValues
(
	@system_info_cd		system_info_cd,
	@system_info_value		gnc_nm
)
WITH ENCRYPTION
AS
BEGIN	
	DELETE FROM system_information_values
	WHERE system_info_cd = @system_info_cd and system_info_value = @system_info_value
END
GO
-- =============================================================================

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	QuerySystemInformationValues
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QuerySystemInformationValues'
			)
	BEGIN
		DROP PROCEDURE  QuerySystemInformationValues
	END
GO
CREATE PROCEDURE QuerySystemInformationValues
(	
	@system_info_cd		system_info_cd
)
WITH ENCRYPTION
AS
BEGIN
	SELECT			
		system_info_cd as grd_info_cd,
		system_info_value,
		value_int,
		value_varchar,
		value_dt,
		value_dtm
	FROM system_information_values siv
	WHERE system_info_cd = @system_info_cd
	ORDER BY system_info_cd desc
END
GO

