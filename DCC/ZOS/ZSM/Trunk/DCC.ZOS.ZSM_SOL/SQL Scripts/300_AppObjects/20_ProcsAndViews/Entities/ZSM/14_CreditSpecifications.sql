SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertCreditSpecification
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertCreditSpecification'
			)
	BEGIN
		DROP PROCEDURE  InsertCreditSpecification
	END
GO
CREATE PROCEDURE InsertCreditSpecification
(
	@credit_specification_id		credit_specification_id output,
	@credit_specification_nm		gnc_nm,
	@credit_specification_dt		smalldatetime,
	@satsang_centre_id				satsang_centre_id,
	@credit_group_nm				gnc_nm,
	@is_uniform_specification		Boolean,
	@is_outstation_sewadar			Boolean = NULL,
	@credit_cnt						CreditCnt,
	@unit_cnt						CreditCnt,
	@is_exemption_considered		Boolean,
	@presence_sewa_id				sewa_id = NULL,
	@min_credit_cnt					CreditCnt = NULL,
	@specification_ts				datetime,
	@computation_ts					datetime = NULL,
	@last_appointment_dt			SMALLDATETIME,
	@is_finally_used				Boolean = NULL
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO credit_specifications
	(
		credit_specification_nm, credit_specification_dt, satsang_centre_id, credit_group_nm, is_uniform_specification, is_outstation_sewadar, credit_cnt, unit_cnt, is_exemption_considered, presence_sewa_id, min_credit_cnt, specification_ts, computation_ts, is_finally_used, last_appointment_dt
	)
	VALUES
	(
		@credit_specification_nm, @credit_specification_dt, @satsang_centre_id, @credit_group_nm, @is_uniform_specification, @is_outstation_sewadar, @credit_cnt, @unit_cnt, @is_exemption_considered, @presence_sewa_id, @min_credit_cnt, @specification_ts, @computation_ts, @is_finally_used, @last_appointment_dt
	)
	SELECT @credit_specification_id = SCOPE_IDENTITY()
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateCreditSpecification
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateCreditSpecification'
			)
	BEGIN
		DROP PROCEDURE  UpdateCreditSpecification
	END
GO
CREATE PROCEDURE UpdateCreditSpecification
(
	@credit_specification_id		credit_specification_id,
	@credit_specification_nm		gnc_nm,
	@credit_specification_dt		smalldatetime,
	@satsang_centre_id				satsang_centre_id,
	@credit_group_nm				gnc_nm,
	@is_uniform_specification		Boolean,
	@is_outstation_sewadar			Boolean,
	@credit_cnt						CreditCnt,
	@unit_cnt						CreditCnt,
	@is_exemption_considered		Boolean,
	@presence_sewa_id				sewa_id,
	@min_credit_cnt					CreditCnt,
	@is_finally_used				Boolean,
	@last_appointment_dt			SMALLDATETIME,
	@txn_ts							timestamp
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    credit_specifications
	SET
		credit_specification_nm			=	@credit_specification_nm,
		credit_specification_dt			=	@credit_specification_dt,
		satsang_centre_id				=	@satsang_centre_id,
		credit_group_nm					=	@credit_group_nm,
		is_uniform_specification		=	@is_uniform_specification,
		is_outstation_sewadar			=	@is_outstation_sewadar,
		credit_cnt						=	@credit_cnt,
		unit_cnt						=	@unit_cnt,
		is_exemption_considered			=	@is_exemption_considered,
		presence_sewa_id				=	@presence_sewa_id,
		min_credit_cnt					=	@min_credit_cnt,
		specification_ts				=	GETDATE(),
		is_finally_used					=	@is_finally_used,
		last_appointment_dt				= 	@last_appointment_dt
	WHERE
	credit_specification_id = @credit_specification_id
	AND txn_ts						=	@txn_ts
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
--	Procedure	DeleteCreditSpecification
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteCreditSpecification'
			)
	BEGIN
		DROP PROCEDURE  DeleteCreditSpecification
	END
GO
CREATE PROCEDURE DeleteCreditSpecification
(
	@credit_specification_id		credit_specification_id,	
	@txn_ts							timestamp
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM credit_specifications_sewas
	WHERE
	credit_specification_id = @credit_specification_id
	
	DELETE FROM credit_specifications
	WHERE
	credit_specification_id = @credit_specification_id
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
--	Procedure	QueryCreditSpecification
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QueryCreditSpecification'
			)
	BEGIN
		DROP PROCEDURE  QueryCreditSpecification
	END
GO
CREATE PROCEDURE QueryCreditSpecification
(
	@credit_specification_id		credit_specification_id,
	@credit_specification_nm		gnc_nm,
	@credit_specification_dt		smalldatetime,
	@satsang_centre_id				satsang_centre_id,
	@credit_group_nm				gnc_nm,
	@is_uniform_specification		Boolean,
	@is_outstation_sewadar			Boolean,
	@credit_cnt						CreditCnt,
	@unit_cnt						CreditCnt,
	@is_exemption_considered		Boolean,
	@presence_sewa_id				sewa_id,
	@min_credit_cnt					CreditCnt,
	@specification_ts				datetime,
	@computation_ts					datetime,
	@is_finally_used				Boolean,
	@txn_ts							timestamp
)
WITH ENCRYPTION
AS
BEGIN
	SELECT
		credit_specification_id, 
		credit_specification_nm, 
		credit_specification_dt, 
		satsang_centre_id,
		credit_group_nm,
		is_uniform_specification, 
		is_outstation_sewadar, 
		credit_cnt, 
		unit_cnt, 
		is_exemption_considered,
		presence_sewa_id,
		min_credit_cnt, 
		specification_ts, 
		computation_ts, 
		is_finally_used, 
		txn_ts
	FROM credit_specifications
	WHERE (1 = 2) --ADD YOUR WHERE CLAUSE
END
GO
-- =============================================================================


-- =============================================================================
--	Procedure	ViewCreditSpecifications
-- =============================================================================
IF EXISTS	(	SELECT  *
				FROM    sysobjects
				WHERE name = 'ViewCreditSpecifications' and TYPE='v'
			)

	BEGIN
		DROP VIEW ViewCreditSpecifications
	END
GO
CREATE VIEW ViewCreditSpecifications

WITH ENCRYPTION
AS
	SELECT
		c.credit_specification_id,
		c.credit_specification_nm, 
		c.credit_specification_dt, 
		c.satsang_centre_id,
		c.credit_group_nm,
		c.is_uniform_specification, 
		c.is_outstation_sewadar,
		c.credit_cnt, 
		c.unit_cnt, 
		c.is_exemption_considered,
		c.presence_sewa_id,
		s.sewa_nm,
		c.min_credit_cnt, 
		c.specification_ts, 
		c.computation_ts, 
		c.is_finally_used,
		c.last_appointment_dt,
		c.txn_ts
	FROM credit_specifications c
	LEFT OUTER JOIN sewas s ON s.sewa_id = c.presence_sewa_id
GO
-- =============================================================================



-- vim:ts=4 sw=4 ht=4


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertCreditSpecificationsSewa
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertCreditSpecificationsSewa'
			)
	BEGIN
		DROP PROCEDURE  InsertCreditSpecificationsSewa
	END
GO
CREATE PROCEDURE InsertCreditSpecificationsSewa
(
	@credit_specification_id		credit_specification_id,
	@sewa_id						sewa_id,
	@credit_cnt						CreditCnt,
	@unit_cnt						CreditCnt,
	@is_exemption_considered		Boolean,
	@min_credit_cnt					CreditCnt0,
	@max_credit_cnt					CreditCntF
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO credit_specifications_sewas
	(
		credit_specification_id, sewa_id, credit_cnt, unit_cnt, is_exemption_considered, min_credit_cnt, max_credit_cnt
	)
	VALUES
	(
		@credit_specification_id, @sewa_id, @credit_cnt, @unit_cnt, @is_exemption_considered, @min_credit_cnt, @max_credit_cnt
	)
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateCreditSpecificationsSewa
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateCreditSpecificationsSewa'
			)
	BEGIN
		DROP PROCEDURE  UpdateCreditSpecificationsSewa
	END
GO
CREATE PROCEDURE UpdateCreditSpecificationsSewa
(
	@credit_specification_id		credit_specification_id,
	@sewa_id						sewa_id,
	@old_sewa_id					sewa_id,
	@credit_cnt						CreditCnt,
	@unit_cnt						CreditCnt,
	@is_exemption_considered		Boolean,
	@min_credit_cnt					CreditCnt0,
	@max_credit_cnt					CreditCntF
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    credit_specifications_sewas
	SET		
		sewa_id						=	@sewa_id,
		credit_cnt					=	@credit_cnt,
		unit_cnt					=	@unit_cnt,
		is_exemption_considered		=	@is_exemption_considered,
		min_credit_cnt				=	@min_credit_cnt,
		max_credit_cnt				=	@max_credit_cnt
	WHERE credit_specification_id = @credit_specification_id
	AND sewa_id = @old_sewa_id
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	DeleteCreditSpecificationsSewa
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteCreditSpecificationsSewa'
			)
	BEGIN
		DROP PROCEDURE  DeleteCreditSpecificationsSewa
	END
GO
CREATE PROCEDURE DeleteCreditSpecificationsSewa
(
	@credit_specification_id		credit_specification_id,
	@old_sewa_id						sewa_id
	
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM credit_specifications_sewas
	WHERE credit_specification_id = @credit_specification_id
	AND sewa_id = @old_sewa_id
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	QueryCreditSpecificationsSewa
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QueryCreditSpecificationsSewa'
			)
	BEGIN
		DROP PROCEDURE  QueryCreditSpecificationsSewa
	END
GO
CREATE PROCEDURE QueryCreditSpecificationsSewa
(
	@credit_specification_id		credit_specification_id
	
)
WITH ENCRYPTION
AS
BEGIN
	SELECT		
		c.sewa_id, 
		c.sewa_id  as old_sewa_id,	
		s.sewa_nm,	
		credit_cnt, 
		unit_cnt, 
		is_exemption_considered, 
		min_credit_cnt, 
		max_credit_cnt
	FROM credit_specifications_sewas c
	JOIN sewas s ON c.sewa_id = s.sewa_id	
	WHERE credit_specification_id = @credit_specification_id
END
GO
-- =============================================================================

IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='CopyCreditSpecificationsAndItsSewas'
			)
	BEGIN
		DROP PROCEDURE  CopyCreditSpecificationsAndItsSewas
	END
GO
CREATE PROCEDURE CopyCreditSpecificationsAndItsSewas
(
	@credit_specification_id		credit_specification_id,
	@new_credit_specification_nm	gnc_nm
	
)
WITH ENCRYPTION
AS
BEGIN
	DECLARE @var_generated_id credit_specification_id;
	INSERT INTO credit_specifications
	(
		credit_specification_nm, credit_specification_dt, satsang_centre_id, credit_group_nm, is_uniform_specification, is_outstation_sewadar, credit_cnt, unit_cnt, is_exemption_considered, presence_sewa_id, min_credit_cnt, specification_ts, computation_ts, is_finally_used, last_appointment_dt
	)
	SELECT
		@new_credit_specification_nm, GETDATE(), satsang_centre_id, credit_group_nm, is_uniform_specification, is_outstation_sewadar, credit_cnt, unit_cnt, is_exemption_considered, presence_sewa_id, NULL, specification_ts, NULL, NULL, last_appointment_dt
	FROM credit_specifications
	WHERE credit_specification_id = @credit_specification_id

	SET @var_generated_id	=	SCOPE_IDENTITY();

	IF (@var_generated_id IS NOT NULL)
	BEGIN
		INSERT INTO credit_specifications_sewas
		(
			credit_specification_id, sewa_id, credit_cnt, unit_cnt, is_exemption_considered, min_credit_cnt, max_credit_cnt
		)
		SELECT
			@var_generated_id, sewa_id, credit_cnt, unit_cnt, is_exemption_considered, 0, max_credit_cnt
		FROM credit_specifications_sewas
		WHERE credit_specification_id = @credit_specification_id
	END

	SELECT @var_generated_id
END
GO

-- =============================================================================

IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QueryCreditSpecificationsOfAGroup'
			)
	BEGIN
		DROP PROCEDURE  QueryCreditSpecificationsOfAGroup
	END
GO
CREATE PROCEDURE QueryCreditSpecificationsOfAGroup
(
	@credit_group_nm						gnc_nm,
	@exclude_credit_specification_id		credit_specification_id
	
)
WITH ENCRYPTION
AS
BEGIN
	SELECT	credit_specification_nm, min_credit_cnt
	FROM	credit_specifications
	WHERE	credit_group_nm				=	@credit_group_nm
	AND		credit_specification_id		!=	@exclude_credit_specification_id
END
GO

-- =============================================================================

-- vim:ts=4 sw=4 ht=4
