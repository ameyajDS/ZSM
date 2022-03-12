SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertDepartment
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertDepartment'
			)
	BEGIN
		DROP PROCEDURE  InsertDepartment
	END
GO
CREATE PROCEDURE InsertDepartment
(
	@department_id				department_id output,
	@department_cd				varchar(5),
	@department_nm				gnc_nm,
	@colour_id					colour_id,
	@has_sub_departments		Boolean,
	@remarks					remarks = NULL
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO departments
	(
		department_cd, department_nm, colour_id, has_sub_departments, remarks
	)
	VALUES
	(
		@department_cd, @department_nm, @colour_id, @has_sub_departments, @remarks
	)
	SELECT @department_id = SCOPE_IDENTITY()
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateDepartment
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateDepartment'
			)
	BEGIN
		DROP PROCEDURE  UpdateDepartment
	END
GO
CREATE PROCEDURE UpdateDepartment
(
	@department_id				department_id,
	@department_cd				varchar(5),
	@department_nm				gnc_nm,
	@colour_id					colour_id,
	@has_sub_departments		Boolean,
	@remarks					remarks,
	@txn_ts						timestamp
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    departments
	SET
		department_cd			=	@department_cd,
		department_nm			=	@department_nm,
		colour_id				=	@colour_id,
		has_sub_departments		=	@has_sub_departments,
		remarks					=	@remarks
	WHERE department_id = @department_id
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
--	Procedure	DeleteDepartment
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteDepartment'
			)
	BEGIN
		DROP PROCEDURE  DeleteDepartment
	END
GO
CREATE PROCEDURE DeleteDepartment
(
	@department_id				department_id,	
	@txn_ts						timestamp
)
WITH ENCRYPTION
AS
BEGIN

	DELETE FROM departments_satsang_centres
	WHERE department_id = @department_id

	DELETE FROM sub_departments_satsang_centres
	WHERE sub_department_id IN (select sub_department_id FROM sub_departments
	WHERE department_id = @department_id)

	DELETE FROM sub_departments
	WHERE department_id = @department_id

	DELETE FROM departments
	WHERE department_id = @department_id
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
--	Procedure	ViewDepartment
-- =============================================================================
IF EXISTS	(	SELECT  *
				FROM    sysobjects
				WHERE name = 'ViewDepartment' and TYPE='V'	
			)
	BEGIN
		DROP VIEW  ViewDepartment
	END
GO
CREATE VIEW ViewDepartment

WITH ENCRYPTION
AS

	SELECT
		department_id, 
		department_cd, 
		department_nm, 
		colour_id, 
		has_sub_departments, 
		remarks, 
		txn_ts
	FROM departments
	

GO
-- =============================================================================

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertSubDepartment
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertSubDepartment'
			)
	BEGIN
		DROP PROCEDURE  InsertSubDepartment
	END
GO
CREATE PROCEDURE InsertSubDepartment
(
	@sub_department_id		department_id output,
	@department_id			department_id,
	@sub_department_cd		varchar(5),
	@sub_department_nm		gnc_nm,
	@sub_remarks				remarks = NULL
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO sub_departments
	(
		department_id, sub_department_cd, sub_department_nm, remarks
	)
	VALUES
	(
		@department_id, @sub_department_cd, @sub_department_nm, @sub_remarks
	)
	SELECT @sub_department_id = SCOPE_IDENTITY()
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateSubDepartment
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateSubDepartment'
			)
	BEGIN
		DROP PROCEDURE  UpdateSubDepartment
	END
GO
CREATE PROCEDURE UpdateSubDepartment
(
	@sub_department_id		department_id,
	@department_id			department_id,
	@sub_department_cd		varchar(5),
	@sub_department_nm		gnc_nm,
	@sub_remarks				remarks
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    sub_departments
	SET
		department_id			=	@department_id,
		sub_department_cd		=	@sub_department_cd,
		sub_department_nm		=	@sub_department_nm,
		remarks					=	@sub_remarks
	WHERE sub_department_id = @sub_department_id
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	DeleteSubDepartment
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteSubDepartment'
			)
	BEGIN
		DROP PROCEDURE  DeleteSubDepartment
	END
GO
CREATE PROCEDURE DeleteSubDepartment
(
	@sub_department_id		department_id	
	
)
WITH ENCRYPTION
AS
BEGIN

	DELETE FROM sub_departments_satsang_centres
	WHERE  sub_department_id = @sub_department_id

	DELETE FROM sub_departments
	WHERE  sub_department_id = @sub_department_id

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
--	Procedure	QuerySubDepartment
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QuerySubDepartment'
			)
	BEGIN
		DROP PROCEDURE  QuerySubDepartment
	END
GO
CREATE PROCEDURE QuerySubDepartment
(	
	@department_id			department_id
	
)
WITH ENCRYPTION
AS
BEGIN
	SELECT
		sub_department_id, 		
		sub_department_cd, 
		sub_department_nm, 
		remarks as sub_remarks
	FROM sub_departments
	WHERE department_id = @department_id
END
GO
-- =============================================================================

-- vim:ts=4 sw=4 ht=4

-- ============Stored Procs for Satsang Centres for Department============

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertDepartmentsSatsangCentre
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertDepartmentsSatsangCentre'
			)
	BEGIN
		DROP PROCEDURE  InsertDepartmentsSatsangCentre
	END
GO
CREATE PROCEDURE InsertDepartmentsSatsangCentre
(
	@department_id					department_id,
	@satsang_centre_id				satsang_centre_id,
	@genders_allowed				char(1),
	@is_common_roster				Boolean,
	@is_generic						Boolean,
	@is_weekly						Boolean,
	@sub_department_mandatory		Boolean = NULL,
	@effective_from					datetime,
	@effective_till					datetime
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO departments_satsang_centres
	(
		department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from, effective_till
	)
	VALUES
	(
		@department_id, @satsang_centre_id, @genders_allowed, @is_common_roster, @is_generic, @is_weekly, @sub_department_mandatory, @effective_from, @effective_till
	)
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateDepartmentsSatsangCentre
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateDepartmentsSatsangCentre'
			)
	BEGIN
		DROP PROCEDURE  UpdateDepartmentsSatsangCentre
	END
GO
CREATE PROCEDURE UpdateDepartmentsSatsangCentre
(
	@department_id					department_id,
	@satsang_centre_id				satsang_centre_id,
	@old_satsang_centre_id				satsang_centre_id,
	@genders_allowed				char(1),
	@is_common_roster				Boolean,
	@is_generic						Boolean,
	@is_weekly						Boolean,
	@sub_department_mandatory		Boolean,
	@effective_from					datetime,
	@effective_till					datetime
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    departments_satsang_centres
	SET
		department_id					=	@department_id,
		satsang_centre_id				=	@satsang_centre_id,
		genders_allowed					=	@genders_allowed,
		is_common_roster				=	@is_common_roster,
		is_generic						=	@is_generic,
		is_weekly						=	@is_weekly,
		sub_department_mandatory		=	@sub_department_mandatory,
		effective_from					=	@effective_from,
		effective_till					=	@effective_till
	WHERE department_id = @department_id
	AND satsang_centre_id = @old_satsang_centre_id
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	DeleteDepartmentsSatsangCentre
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteDepartmentsSatsangCentre'
			)
	BEGIN
		DROP PROCEDURE  DeleteDepartmentsSatsangCentre
	END
GO
CREATE PROCEDURE DeleteDepartmentsSatsangCentre
(
	@department_id					department_id,
	@old_satsang_centre_id				satsang_centre_id	
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM departments_satsang_centres
	WHERE department_id = @department_id
	AND satsang_centre_id = @old_satsang_centre_id
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	QueryDepartmentsSatsangCentre
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QueryDepartmentsSatsangCentre'
			)
	BEGIN
		DROP PROCEDURE  QueryDepartmentsSatsangCentre
	END
GO
CREATE PROCEDURE QueryDepartmentsSatsangCentre
(
	@department_id					department_id
	
)
WITH ENCRYPTION
AS
BEGIN
	SELECT		 
		d.satsang_centre_id, 
		d.satsang_centre_id as old_satsang_centre_id,
		genders_allowed, 
		is_common_roster, 
		is_generic, 
		is_weekly, 
		sub_department_mandatory, 
		d.effective_from, 
		d.effective_till,
		centre_cd = COALESCE(scd.centre_cd, sc.satsang_centre_cd),		
		centre_nm = COALESCE(scd.centre_nm, sc.satsang_centre_nm)
	FROM departments_satsang_centres d
	JOIN satsang_centres_details scd ON scd.satsang_centre_id = d.satsang_centre_id
	JOIN cdb..satsang_centres sc ON sc.satsang_centre_id = scd.satsang_centre_id
	WHERE department_id = @department_id
END
GO
-- =============================================================================
-- vim:ts=4 sw=4 ht=4
-- ============Stored Procs for Satsang Centres for Sub Department============

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertSubDepartmentsSatsangCentre
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertSubDepartmentsSatsangCentre'
			)
	BEGIN
		DROP PROCEDURE  InsertSubDepartmentsSatsangCentre
	END
GO
CREATE PROCEDURE InsertSubDepartmentsSatsangCentre
(
	@sub_department_id		department_id,
	@satsang_centre_id		satsang_centre_id,
	@effective_from			datetime,
	@effective_till			datetime
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO sub_departments_satsang_centres
	(
		sub_department_id, satsang_centre_id, effective_from, effective_till
	)
	VALUES
	(
		@sub_department_id, @satsang_centre_id, @effective_from, @effective_till
	)
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	DeleteSubDepartmentsSatsangCentre
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteSubDepartmentsSatsangCentre'
			)
	BEGIN
		DROP PROCEDURE  DeleteSubDepartmentsSatsangCentre
	END
GO
CREATE PROCEDURE DeleteSubDepartmentsSatsangCentre
(
	@sub_department_id		department_id	
	
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM sub_departments_satsang_centres
	WHERE sub_department_id = @sub_department_id
	

END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	QuerySubDepartmentsSatsangCentre
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QuerySubDepartmentsSatsangCentre'
			)
	BEGIN
		DROP PROCEDURE  QuerySubDepartmentsSatsangCentre
	END
GO
CREATE PROCEDURE QuerySubDepartmentsSatsangCentre
(
	@sub_department_id		department_id

)
WITH ENCRYPTION
AS
BEGIN
	SELECT
		sd.satsang_centre_id, 
		sd.satsang_centre_id as old_satsang_centre_id,
		sd.effective_from,
		sd.effective_till,
		centre_cd = COALESCE(scd.centre_cd, sc.satsang_centre_cd),		
		centre_nm = COALESCE(scd.centre_nm, sc.satsang_centre_nm)		
	FROM sub_departments_satsang_centres sd
	JOIN satsang_centres_details scd ON scd.satsang_centre_id = sd.satsang_centre_id
	JOIN cdb..satsang_centres sc ON sc.satsang_centre_id = scd.satsang_centre_id
	WHERE sub_department_id = @sub_department_id	
END
GO
-- =============================================================================

-- vim:ts=4 sw=4 ht=4