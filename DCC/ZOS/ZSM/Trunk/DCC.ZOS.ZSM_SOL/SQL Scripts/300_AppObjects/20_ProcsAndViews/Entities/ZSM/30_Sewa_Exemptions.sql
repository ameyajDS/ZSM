SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertSewaExemption
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertSewaExemption'
			)
	BEGIN
		DROP PROCEDURE  InsertSewaExemption
	END
GO
CREATE PROCEDURE InsertSewaExemption
(
	@sewa_exemption_id			sewa_exemption_id output,
	@sewa_exemption_nm			gnc_nm,
	@sewa_exemption_type		varchar(10),
	@sewa_applicability			Boolean,
	@is_computed				Boolean,
	@effective_from				datetime,
	@effective_till				datetime
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO sewa_exemptions
	(
		sewa_exemption_nm, sewa_exemption_type, sewa_applicability, is_computed, effective_from, effective_till
	)
	VALUES
	(
		@sewa_exemption_nm, @sewa_exemption_type, @sewa_applicability, @is_computed, @effective_from, @effective_till
	)
	SELECT @sewa_exemption_id = SCOPE_IDENTITY()
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateSewaExemption
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateSewaExemption'
			)
	BEGIN
		DROP PROCEDURE  UpdateSewaExemption
	END
GO
CREATE PROCEDURE UpdateSewaExemption
(
	@sewa_exemption_id			sewa_exemption_id,
	@sewa_exemption_nm			gnc_nm,
	@sewa_exemption_type		varchar(10),
	@sewa_applicability			Boolean,
	@is_computed				Boolean,
	@effective_from				datetime,
	@effective_till				datetime,
	@txn_ts						timestamp
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    sewa_exemptions
	SET		
		sewa_exemption_nm		=	@sewa_exemption_nm,
		sewa_exemption_type		=	@sewa_exemption_type,
		sewa_applicability		=	@sewa_applicability,
		is_computed				=	@is_computed,
		effective_from			=	@effective_from,
		effective_till			=	@effective_till
	WHERE sewa_exemption_id		=	@sewa_exemption_id
	AND txn_ts				=	@txn_ts
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
--	Procedure	DeleteSewaExemption
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteSewaExemption'
			)
	BEGIN
		DROP PROCEDURE  DeleteSewaExemption
	END
GO
CREATE PROCEDURE DeleteSewaExemption
(
	@sewa_exemption_id			sewa_exemption_id,	
	@txn_ts						timestamp
)
WITH ENCRYPTION
AS
BEGIN	
	
	DELETE FROM sewa_exemptions_applicable_sewas
	WHERE sewa_exemption_id		=	@sewa_exemption_id	
	
	DELETE FROM sewa_exemptions
	WHERE sewa_exemption_id		=	@sewa_exemption_id
	AND txn_ts				=	@txn_ts
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
--	View	ViewSewaExemption
-- =============================================================================
IF EXISTS	(	SELECT  *
				FROM    sysobjects
				WHERE name = 'ViewSewaExemption' and TYPE='V'				
			)
	BEGIN
		DROP VIEW  ViewSewaExemption
	END
GO

CREATE VIEW ViewSewaExemption

WITH ENCRYPTION
AS
	SELECT
		sewa_exemption_id, 
		sewa_exemption_nm, 
		sewa_exemption_type, 
		sewa_applicability, 
		is_computed, 
		effective_from, 
		effective_till, 
		txn_ts
	FROM sewa_exemptions
	
GO
-- =============================================================================



-- vim:ts=4 sw=4 ht=4

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertSewaExemptionsApplicableSewa
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertSewaExemptionsApplicableSewa'
			)
	BEGIN
		DROP PROCEDURE  InsertSewaExemptionsApplicableSewa
	END
GO
CREATE PROCEDURE InsertSewaExemptionsApplicableSewa
(
	@sewa_exemption_id		sewa_exemption_id,
	@sewa_id				sewa_id,
	@exemption_days			CreditCntF = NULL
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO sewa_exemptions_applicable_sewas
	(
		sewa_exemption_id, sewa_id, exemption_days
	)
	VALUES
	(
		@sewa_exemption_id, @sewa_id, @exemption_days
	)
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateSewaExemptionsApplicableSewa
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateSewaExemptionsApplicableSewa'
			)
	BEGIN
		DROP PROCEDURE  UpdateSewaExemptionsApplicableSewa
	END
GO
CREATE PROCEDURE UpdateSewaExemptionsApplicableSewa
(
	@sewa_exemption_id		sewa_exemption_id,
	@sewa_id				sewa_id,
	@old_sewa_id				sewa_id,
	@exemption_days			CreditCntF
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    sewa_exemptions_applicable_sewas
	SET		
		sewa_id					=	@sewa_id,
		exemption_days			=	@exemption_days
	WHERE sewa_exemption_id		=	@sewa_exemption_id
	AND sewa_id					=	@old_sewa_id
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	DeleteSewaExemptionsApplicableSewa
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteSewaExemptionsApplicableSewa'
			)
	BEGIN
		DROP PROCEDURE  DeleteSewaExemptionsApplicableSewa
	END
GO
CREATE PROCEDURE DeleteSewaExemptionsApplicableSewa
(
	@sewa_exemption_id		sewa_exemption_id,
	@old_sewa_id				sewa_id	
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM sewa_exemptions_applicable_sewas
	WHERE sewa_exemption_id		=	@sewa_exemption_id
	AND sewa_id					=	@old_sewa_id
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	QuerySewaExemptionsApplicableSewa
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QuerySewaExemptionsApplicableSewa'
			)
	BEGIN
		DROP PROCEDURE  QuerySewaExemptionsApplicableSewa
	END
GO
CREATE PROCEDURE QuerySewaExemptionsApplicableSewa
(
	@sewa_exemption_id		sewa_exemption_id	
)
WITH ENCRYPTION
AS
BEGIN
	SELECT
		sewa_exemption_id, 
		se.sewa_id, 
		se.sewa_id as old_sewa_id,
		s.sewa_nm,
		exemption_days
	FROM sewa_exemptions_applicable_sewas se
	LEFT JOIN sewas s ON se.sewa_id = s.sewa_id
	WHERE sewa_exemption_id		=	@sewa_exemption_id
END
GO
-- =============================================================================



-- vim:ts=4 sw=4 ht=4