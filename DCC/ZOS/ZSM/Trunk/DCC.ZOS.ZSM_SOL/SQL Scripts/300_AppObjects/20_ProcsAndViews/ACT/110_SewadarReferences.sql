-- =============================================================================
--	Procedure	UpdateSewadarsRegistration
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateSewadarReferences'
			)
	BEGIN
		DROP PROCEDURE  UpdateSewadarReferences
	END
GO
CREATE PROCEDURE UpdateSewadarReferences
(
	@satsang_centre_id				satsang_centre_id,
	@sewadar_grno					sewadar_grno,
	@reference_1_sewadar_id			sewadar_id,
	@reference_1_relationship		relationship_id,
	@reference_1_nm					gnc_nm,
	@reference_1_centre_id			satsang_centre_id,
	@reference_1_department			varchar(20),
	@reference_2_sewadar_id			sewadar_id,
	@reference_2_relationship		relationship_id,
	@reference_2_nm					gnc_nm,
	@reference_2_centre_id			satsang_centre_id,
	@reference_2_department			varchar(20),
	@txn_ts							timestamp
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    sewadars_registrations
	SET
		reference_1_sewadar_id			=	@reference_1_sewadar_id,
		reference_1_relationship		=	@reference_1_relationship,
		reference_1_nm					=	@reference_1_nm,
		reference_1_centre_id			=	@reference_1_centre_id,
		reference_1_department			=	@reference_1_department,
		reference_2_sewadar_id			=	@reference_2_sewadar_id,
		reference_2_relationship		=	@reference_2_relationship,
		reference_2_nm					=	@reference_2_nm,
		reference_2_centre_id			=	@reference_2_centre_id,
		reference_2_department			=	@reference_2_department
	WHERE
		satsang_centre_id				=	@satsang_centre_id
	AND	sewadar_grno					=	@sewadar_grno
	AND txn_ts						=	@txn_ts
	IF (@@ROWCOUNT != 1)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotUpdated', NULL, NULL, NULL, NULL
	END
END
GO