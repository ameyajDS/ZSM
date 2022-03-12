SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertArbitrarySummarisedExemption
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertArbitrarySummarisedExemption'
			)
	BEGIN
		DROP PROCEDURE  InsertArbitrarySummarisedExemption
	END
GO
CREATE PROCEDURE InsertArbitrarySummarisedExemption
(
	@sewa_id				sewa_id,
	@satsang_centre_id		satsang_centre_id,
	@sewadar_grno			sewadar_grno,
	@sewa_exemption_id		sewa_exemption_id,
	@exemption_days			CreditCntF
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO arbitrary_summarised_exemptions
	(
		sewa_id, satsang_centre_id, sewadar_grno, sewa_exemption_id, exemption_days
	)
	VALUES
	(
		@sewa_id, @satsang_centre_id, @sewadar_grno, @sewa_exemption_id, @exemption_days
	)
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateArbitrarySummarisedExemption
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateArbitrarySummarisedExemption'
			)
	BEGIN
		DROP PROCEDURE  UpdateArbitrarySummarisedExemption
	END
GO
CREATE PROCEDURE UpdateArbitrarySummarisedExemption
(
	@sewa_id				sewa_id,
	@satsang_centre_id		satsang_centre_id,
	@sewadar_grno			sewadar_grno,
	@sewa_exemption_id		sewa_exemption_id,
	@exemption_days			CreditCntF,
	
	@old_sewa_id					sewa_id,
	@old_satsang_centre_id			satsang_centre_id,
	@old_sewadar_grno				sewadar_grno
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    arbitrary_summarised_exemptions
	SET
		sewa_id					=	@sewa_id,
		satsang_centre_id		=	@satsang_centre_id,
		sewadar_grno			=	@sewadar_grno,
		sewa_exemption_id		=	@sewa_exemption_id,
		exemption_days			=	@exemption_days
	WHERE 	
	sewa_id				=		 @old_sewa_id AND 
	satsang_centre_id	=		 @old_satsang_centre_id AND
	sewadar_grno		=		 @old_sewadar_grno 
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	DeleteArbitrarySummarisedExemption
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteArbitrarySummarisedExemption'
			)
	BEGIN
		DROP PROCEDURE  DeleteArbitrarySummarisedExemption
	END
GO
CREATE PROCEDURE DeleteArbitrarySummarisedExemption
(
	@old_sewa_id					sewa_id,
	@old_satsang_centre_id			satsang_centre_id,
	@old_sewadar_grno				sewadar_grno
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM arbitrary_summarised_exemptions
	WHERE 	
	sewa_id				=		 @old_sewa_id AND 
	satsang_centre_id	=		 @old_satsang_centre_id AND
	sewadar_grno		=		 @old_sewadar_grno 
END
GO
-- =============================================================================

-- =============================================================================
--	Procedure	ViewArbitrarySummarisedExemption
-- =============================================================================

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF EXISTS	(	SELECT  *
				FROM    sysobjects
				WHERE name = 'ViewArbitrarySummarisedExemption' and TYPE='V'				
			)
	BEGIN
		DROP VIEW  ViewArbitrarySummarisedExemption
	END
GO

CREATE VIEW ViewArbitrarySummarisedExemption

WITH ENCRYPTION
AS

	SELECT
		ase.sewa_id, 
		ase.satsang_centre_id, 
		ase.sewadar_grno,
		sw.sewa_nm, 
		ase.sewa_exemption_id, 
		se.sewa_exemption_nm,
		exemption_days,	
		ase.sewa_id as old_sewa_id,
		ase.satsang_centre_id as old_satsang_centre_id, 
		ase.sewadar_grno as old_sewadar_grno,		
		vs.centre_nm, 
		vs.full_nm, 
		vs.sewadar_id, 
		vs.age, 
		vs.gender, 
		vs.sewadar_status_nm, 
		vs.sewadar_status_dtm, 
		vs.department_nm, 
		vs.sub_department_nm, 
		vs.department_dt,
		sw.finish_dt,
		sw.start_dt,	
		stt.screen_id,
		stt.txn_ts as sewadar_txn_ts
	FROM arbitrary_summarised_exemptions  ase
	JOIN sewas sw ON sw.sewa_id = ase.sewa_id
	JOIN sewa_exemptions se ON se.sewa_exemption_id = ase.sewa_exemption_id
	JOIN ViewSewadarHeaderOnGRNo vs  ON  ase.satsang_centre_id = vs.satsang_centre_id AND ase.sewadar_grno = vs.sewadar_grno 
	JOIN sewadars_txn_ts stt ON stt.satsang_centre_id = sw.satsang_centre_id AND stt.sewadar_grno = vs.sewadar_grno AND  sw.sewa_id = stt.sewa_id
	 
GO

-- =============================================================================
