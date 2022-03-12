SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertMedicalDisabilitie
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertMedicalDisabilitie'
			)
	BEGIN
		DROP PROCEDURE  dbo.InsertMedicalDisabilitie
	END
GO
CREATE PROCEDURE dbo.InsertMedicalDisabilitie
(
	@medical_disability_id		medical_disability_id output,
	@medical_disability_nm		gnc_long_nm,
	@medical_disability_cd		varchar(10),
	@effective_from				datetime,
	@effective_till				datetime
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO medical_disabilities
	(
		medical_disability_nm, medical_disability_cd, effective_from, effective_till
	)
	VALUES
	(
		@medical_disability_nm, @medical_disability_cd, @effective_from, @effective_till
	)
	SELECT @medical_disability_id = SCOPE_IDENTITY()
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateMedicalDisabilitie
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateMedicalDisabilitie'
			)
	BEGIN
		DROP PROCEDURE  dbo.UpdateMedicalDisabilitie
	END
GO
CREATE PROCEDURE dbo.UpdateMedicalDisabilitie
(
	@medical_disability_id		medical_disability_id,
	@medical_disability_nm		gnc_long_nm,
	@medical_disability_cd		varchar(10),
	@effective_from				datetime,
	@effective_till				datetime,
	@txn_ts						timestamp
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    medical_disabilities
	SET
		medical_disability_nm		=	@medical_disability_nm,
		medical_disability_cd		=	@medical_disability_cd,
		effective_from				=	@effective_from,
		effective_till				=	@effective_till
	WHERE
	 	medical_disability_id = @medical_disability_id
	AND txn_ts					=	@txn_ts
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
--	Procedure	DeleteMedicalDisabilitie
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteMedicalDisabilitie'
			)
	BEGIN
		DROP PROCEDURE  dbo.DeleteMedicalDisabilitie
	END
GO
CREATE PROCEDURE dbo.DeleteMedicalDisabilitie
(
	@medical_disability_id		medical_disability_id,
	@txn_ts						timestamp
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM medical_disabilities
	WHERE
	    medical_disability_id = @medical_disability_id
	AND txn_ts=	@txn_ts
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
--	Procedure	ViewMedicalDisabilitie
-- =============================================================================
IF EXISTS	(	SELECT  *
				FROM    sysobjects
				WHERE name = 'ViewMedicalDisabilitie' and TYPE='V'	
			)
	BEGIN
		DROP VIEW  ViewMedicalDisabilitie
	END
GO
CREATE VIEW ViewMedicalDisabilitie

WITH ENCRYPTION
AS

	SELECT
		medical_disability_id, 
		medical_disability_nm, 
		medical_disability_cd, 
		effective_from, 
		effective_till, 
		txn_ts
	FROM medical_disabilities
GO
-- =============================================================================



-- vim:ts=4 sw=4 ht=4
