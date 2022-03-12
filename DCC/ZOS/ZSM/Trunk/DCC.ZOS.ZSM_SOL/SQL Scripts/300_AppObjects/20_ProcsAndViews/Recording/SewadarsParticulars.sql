SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertSewadarsParticular
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertSewadarsParticular'
			)
	BEGIN
		DROP PROCEDURE  InsertSewadarsParticular
	END
GO
CREATE PROCEDURE InsertSewadarsParticular
(
	@satsang_centre_id		satsang_centre_id,
	@sewadar_grno			sewadar_grno
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO sewadars_particulars
	(
		satsang_centre_id, sewadar_grno
	)
	VALUES
	(
		@satsang_centre_id, @sewadar_grno
	)
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateSewadarsParticular
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateSewadarsParticular'
			)
	BEGIN
		DROP PROCEDURE  UpdateSewadarsParticular
	END
GO
CREATE PROCEDURE UpdateSewadarsParticular
(
	@satsang_centre_id		satsang_centre_id,
	@sewadar_grno			sewadar_grno,
	@txn_ts					timestamp
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    sewadars_particulars
	SET
		sewadar_grno			=	@sewadar_grno
	WHERE
		satsang_centre_id		=	@satsang_centre_id
	AND sewadar_grno			=	@sewadar_grno
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
--	Procedure	DeleteSewadarsParticular
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteSewadarsParticular'
			)
	BEGIN
		DROP PROCEDURE  DeleteSewadarsParticular
	END
GO
CREATE PROCEDURE DeleteSewadarsParticular
(
	@satsang_centre_id		satsang_centre_id,
	@sewadar_grno			sewadar_grno,
	@txn_ts					timestamp
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM sewadars_particulars
	WHERE
		satsang_centre_id		=	@satsang_centre_id
	AND sewadar_grno			=	@sewadar_grno
	AND txn_ts					=	@txn_ts
	IF (@@ROWCOUNT != 1)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotDeleted', NULL, NULL, NULL, NULL
	END
END
GO
-- =============================================================================

-- =============================================================================
--	Procedure	DoesSewadarsParticularsExists
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DoesSewadarsParticularsExists'
			)
	BEGIN
		DROP PROCEDURE  DoesSewadarsParticularsExists
	END
GO
CREATE PROCEDURE DoesSewadarsParticularsExists
(
	@satsang_centre_id		satsang_centre_id,
	@sewadar_grno			sewadar_grno,
	@bExists				Boolean	= 'No'	OUTPUT
)
WITH ENCRYPTION
AS
BEGIN
	SELECT *
	FROM sewadars_particulars
	WHERE	satsang_centre_id		=	@satsang_centre_id
	AND		sewadar_grno			=	@sewadar_grno
	
	IF (@@ROWCOUNT > 0)
		BEGIN
			SET @bExists = 'Yes';
		END
	ELSE
		BEGIN
			SET @bExists = 'No';
		END
	
END
GO

-- =============================================================================

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	QuerySewadarsParticular
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    Sysobjects 
				WHERE   Name='ViewSewadarsParticulars'
				AND     TYPE='V'
			)
	BEGIN
		DROP VIEW  ViewSewadarsParticulars
	END
GO
CREATE VIEW ViewSewadarsParticulars
AS
SELECT  
		st.current_satsang_centre_id AS satsang_centre_id, 
		st.centre_nm, 
		st.current_sewadar_grno AS sewadar_grno, 
		st.full_nm, 
		st.sewadar_id, 
		st.age, 
		st.gender, 
		sr.sewadar_status_nm,
		sr.sewadar_status_dtm,
		sr.department_nm, 
		sr.sub_department_nm, 
		sr.department_dt,
		sp.txn_ts
FROM dbo.sewadars_particulars sp
JOIN dbo.ViewBasicSewadarsRegistrationInfo sr ON (sr.satsang_centre_id = sp.satsang_centre_id AND sr.sewadar_grno = sp.sewadar_grno)
JOIN dbo.ViewSewadarsTableOnly st ON (st.sewadar_id = sr.sewadar_id)
GO
-- =============================================================================



-- vim:ts=4 sw=4 ht=4
