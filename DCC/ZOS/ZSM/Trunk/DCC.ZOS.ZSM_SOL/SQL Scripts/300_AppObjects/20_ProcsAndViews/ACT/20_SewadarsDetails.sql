SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertSewadarsQualification
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertSewadarsQualification'
			)
	BEGIN
		DROP PROCEDURE  InsertSewadarsQualification
	END
GO
CREATE PROCEDURE InsertSewadarsQualification
(
	@sewadar_id			sewadar_id,
	@qualification_sq		display_order,
	@qualification_id		qualification_id,
	@qlfctn_subject_id		qlfctn_subject_id = NULL
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO sewadars_qualifications
	(
		sewadar_id, qualification_sq, qualification_id, qlfctn_subject_id
	)
	VALUES
	(
		@sewadar_id, @qualification_sq, @qualification_id, @qlfctn_subject_id
	)
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	MakeSewadarsQualificationSqPositive
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='MakeSewadarsQualificationSqPositive'
			)
	BEGIN
		DROP PROCEDURE  MakeSewadarsQualificationSqPositive
	END
GO
CREATE PROCEDURE MakeSewadarsQualificationSqPositive
(
	@sewadar_id				sewadar_id
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    sewadars_qualifications
	SET
		qualification_sq		=	-1*qualification_sq
	WHERE
		sewadar_id			=	@sewadar_id
	AND	qualification_sq		<	0

END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateSewadarsQualificationSq
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateSewadarsQualificationSq'
			)
	BEGIN
		DROP PROCEDURE  UpdateSewadarsQualificationSq
	END
GO
CREATE PROCEDURE UpdateSewadarsQualificationSq
(
	@sewadar_id				sewadar_id,
	@qualification_sq		display_order,
	@old_qualification_id		qualification_id,
	@old_qualification_sq		display_order
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    sewadars_qualifications
	SET
		qualification_sq		=	@qualification_sq
	WHERE
		sewadar_id			=	@sewadar_id
	AND	qualification_id		=	@old_qualification_id
	AND	qualification_sq		=	@old_qualification_sq
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateSewadarsQualification
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateSewadarsQualification'
			)
	BEGIN
		DROP PROCEDURE  UpdateSewadarsQualification
	END
GO
CREATE PROCEDURE UpdateSewadarsQualification
(
	@sewadar_id				sewadar_id,
	@qualification_sq		display_order,
	@qualification_id		qualification_id,
	@qlfctn_subject_id		qlfctn_subject_id,
	@old_qualification_id		qualification_id,
	@old_qualification_sq		display_order
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    sewadars_qualifications
	SET
		qualification_sq		=	@qualification_sq,
		qualification_id		=	@qualification_id,
		qlfctn_subject_id		=	@qlfctn_subject_id
	WHERE
		sewadar_id			=	@sewadar_id
	AND	qualification_id		=	@old_qualification_id
	AND	qualification_sq		=	@old_qualification_sq
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	DeleteSewadarsQualification
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteSewadarsQualification'
			)
	BEGIN
		DROP PROCEDURE  DeleteSewadarsQualification
	END
GO
CREATE PROCEDURE DeleteSewadarsQualification
(
	@sewadar_id				sewadar_id,
	@old_qualification_id		qualification_id,
	@old_qualification_sq		display_order
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM sewadars_qualifications
	WHERE
		sewadar_id			=	@sewadar_id
	AND	qualification_id		=	@old_qualification_id
	AND	qualification_sq		=	@old_qualification_sq
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	QuerySewadarsQualification
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QuerySewadarsQualification'
			)
	BEGIN
		DROP PROCEDURE  QuerySewadarsQualification
	END
GO
CREATE PROCEDURE QuerySewadarsQualification
(
	@sewadar_id				sewadar_id
)
WITH ENCRYPTION
AS
BEGIN
	SELECT	
		PQ.qualification_sq,
		PQ.qualification_id,
		cdb..qualifications.qualification_nm,
		PQ.qlfctn_subject_id,
		old_qualification_sq = PQ.qualification_sq,
		old_qualification_id = 	PQ.qualification_id,
		cdb..qlfctn_subjects.qlfctn_subject_nm
	FROM sewadars_qualifications PQ
	INNER JOIN	cdb..qualifications ON	PQ.qualification_id=cdb..qualifications.qualification_id
	LEFT OUTER JOIN      cdb..qlfctn_subjects ON	PQ.qlfctn_subject_id=cdb..qlfctn_subjects.qlfctn_subject_id 
	WHERE
		sewadar_id			=	@sewadar_id
	ORDER BY PQ.qualification_sq
END
GO
-- =============================================================================
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertSewadarsOtherDisabilities
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertSewadarsOtherDisabilities'
			)
	BEGIN
		DROP PROCEDURE  InsertSewadarsOtherDisabilities
	END
GO
CREATE PROCEDURE InsertSewadarsOtherDisabilities
(
	@sewadar_id		sewadar_id,
	@medical_disability_id		medical_disability_id,
	@medical_disability_sq		display_order
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO sewadars_other_disabilities
	(
		sewadar_id, medical_disability_id, medical_disability_sq
	)
	VALUES
	(
		@sewadar_id, @medical_disability_id, @medical_disability_sq
	)
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateSewadarsOtherDisabilities
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateSewadarsOtherDisabilities'
			)
	BEGIN
		DROP PROCEDURE  UpdateSewadarsOtherDisabilities
	END
GO
CREATE PROCEDURE UpdateSewadarsOtherDisabilities
(
	@sewadar_id		sewadar_id,
	@medical_disability_id		medical_disability_id,
	@old_medical_disability_id		medical_disability_id
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    sewadars_other_disabilities
	SET
		medical_disability_id		=	@medical_disability_id
	WHERE
		sewadar_id		=	@sewadar_id
	AND	medical_disability_id		=	@old_medical_disability_id
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	DeleteSewadarsOtherDisabilities
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteSewadarsOtherDisabilities'
			)
	BEGIN
		DROP PROCEDURE  DeleteSewadarsOtherDisabilities
	END
GO
CREATE PROCEDURE DeleteSewadarsOtherDisabilities
(
	@sewadar_id		sewadar_id,
	@old_medical_disability_id		medical_disability_id
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM sewadars_other_disabilities
	WHERE
		sewadar_id		=	@sewadar_id
	AND	medical_disability_id		=	@old_medical_disability_id
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	QuerySewadarsOtherDisabilities
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QuerySewadarsOtherDisabilities'
			)
	BEGIN
		DROP PROCEDURE  QuerySewadarsOtherDisabilities
	END
GO
CREATE PROCEDURE QuerySewadarsOtherDisabilities
(
	@sewadar_id		sewadar_id
)
WITH ENCRYPTION
AS
BEGIN
	SELECT
		s.medical_disability_nm, 
		old_medical_disability_id = ss.medical_disability_id,
		ss.medical_disability_id,
		medical_disability_sq
	FROM sewadars_other_disabilities ss
	JOIN medical_disabilities s ON s.medical_disability_id = ss.medical_disability_id
	WHERE
		ss.sewadar_id		=	@sewadar_id
END
GO
-- =============================================================================



SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertSewadarsSkill
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertSewadarsSkill'
			)
	BEGIN
		DROP PROCEDURE  InsertSewadarsSkill
	END
GO
CREATE PROCEDURE InsertSewadarsSkill
(
	@sewadar_id		sewadar_id,
	@skill_id		skill_id,
	@skill_sq		display_order
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO sewadars_skills
	(
		sewadar_id, skill_id, skill_sq
	)
	VALUES
	(
		@sewadar_id, @skill_id, @skill_sq
	)
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateSewadarsSkill
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateSewadarsSkill'
			)
	BEGIN
		DROP PROCEDURE  UpdateSewadarsSkill
	END
GO
CREATE PROCEDURE UpdateSewadarsSkill
(
	@sewadar_id		sewadar_id,
	@skill_id		skill_id,
	@old_skill_id		skill_id
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    sewadars_skills
	SET
		skill_id		=	@skill_id
	WHERE
		sewadar_id		=	@sewadar_id
	AND	skill_id		=	@old_skill_id
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	DeleteSewadarsSkill
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteSewadarsSkill'
			)
	BEGIN
		DROP PROCEDURE  DeleteSewadarsSkill
	END
GO
CREATE PROCEDURE DeleteSewadarsSkill
(
	@sewadar_id		sewadar_id,
	@old_skill_id		skill_id
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM sewadars_skills
	WHERE
		sewadar_id		=	@sewadar_id
	AND	skill_id		=	@old_skill_id
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	QuerySewadarsSkill
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QuerySewadarsSkill'
			)
	BEGIN
		DROP PROCEDURE  QuerySewadarsSkill
	END
GO
CREATE PROCEDURE QuerySewadarsSkill
(
	@sewadar_id		sewadar_id
)
WITH ENCRYPTION
AS
BEGIN
	SELECT
		s.skill_nm, 
		old_skill_id = ss.skill_id,
		ss.skill_id,
		skill_sq
	FROM sewadars_skills ss
	JOIN CDB..skills s ON s.skill_id = ss.skill_id
	WHERE
		ss.sewadar_id		=	@sewadar_id
END
GO
-- =============================================================================



-- vim:ts=4 sw=4 ht=4

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertSewadarsAddresse
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertSewadarsAddresse'
			)
	BEGIN
		DROP PROCEDURE  InsertSewadarsAddresse
	END
GO
CREATE PROCEDURE InsertSewadarsAddresse
(
	@sewadar_id					sewadar_id,
	@address_type				address_type,
	@address_line_1				address_line,
	@address_line_2				address_line = NULL,
	@post_office_or_city_id		post_office_or_city_id,
	@pin_or_zip_code			pin_or_zip_code = NULL
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO sewadars_addresses
	(
		sewadar_id, address_type, address_line_1, address_line_2, post_office_or_city_id, pin_or_zip_code
	)
	VALUES
	(
		@sewadar_id, @address_type, @address_line_1, @address_line_2, @post_office_or_city_id, @pin_or_zip_code
	)
END
GO
-- =============================================================================
-- =============================================================================

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsUpdateSewadarsAddresseForSewadarDetail
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsUpdateSewadarsAddresseForSewadarDetail'
			)
	BEGIN
		DROP PROCEDURE  InsUpdateSewadarsAddresseForSewadarDetail
	END
GO
CREATE PROCEDURE InsUpdateSewadarsAddresseForSewadarDetail
(
	@sewadar_id					sewadar_id,
	@address_line_1				address_line,
	@address_line_2				address_line,
	@post_office_or_city_id		post_office_or_city_id,
	@pin_or_zip_code			pin_or_zip_code
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM   sewadars_addresses
	WHERE
		sewadar_id					=	@sewadar_id
	AND address_type				=	'Residence'
	IF @address_line_1 IS NOT NULL
	BEGIN
		exec InsertSewadarsAddresse @sewadar_id, 'Residence', 	@address_line_1, @address_line_2, @post_office_or_city_id, 	@pin_or_zip_code
	END
	
END
GO
-- =============================================================================



SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateSewadarsAddresse
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateSewadarsAddresse'
			)
	BEGIN
		DROP PROCEDURE  UpdateSewadarsAddresse
	END
GO
CREATE PROCEDURE UpdateSewadarsAddresse
(
	@sewadar_id					sewadar_id,
	@address_type				address_type,
	@address_line_1				address_line,
	@address_line_2				address_line,
	@post_office_or_city_id		post_office_or_city_id,
	@pin_or_zip_code			pin_or_zip_code
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    sewadars_addresses
	SET
		address_type				=	@address_type,
		address_line_1				=	@address_line_1,
		address_line_2				=	@address_line_2,
		post_office_or_city_id		=	@post_office_or_city_id,
		pin_or_zip_code				=	@pin_or_zip_code
	WHERE
		sewadar_id					=	@sewadar_id
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	DeleteSewadarsAddresse
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteSewadarsAddresse'
			)
	BEGIN
		DROP PROCEDURE  DeleteSewadarsAddresse
	END
GO
CREATE PROCEDURE DeleteSewadarsAddresse
(
	@sewadar_id					sewadar_id
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM sewadars_addresses
	WHERE
		sewadar_id					=	@sewadar_id
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	QuerySewadarsAddresse
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QuerySewadarsAddresse'
			)
	BEGIN
		DROP PROCEDURE  QuerySewadarsAddresse
	END
GO
CREATE PROCEDURE QuerySewadarsAddresse
(
	@sewadar_id				sewadar_id,
	@address_type			address_type

)
WITH ENCRYPTION
AS
BEGIN
	SELECT
		sa.address_line_1, 
		sa.address_line_2, 
		sa.post_office_or_city_id, 
		po.post_office_or_city_nm,
		sa.pin_or_zip_code,
		dc.district_nm,
		dc.district_or_city_id,
		s.state_id,
		s.state_nm,
		c.country_id,
		c.country_nm
	FROM sewadars_addresses sa
	JOIN post_offices_or_cities po ON po.post_office_or_city_id = sa.post_office_or_city_id
	JOIN CDB..districts_or_cities dc ON dc.district_or_city_id = po.district_id
	JOIN CDB..states s ON dc.state_id = s.state_id
	JOIN CDB..countries c ON c.country_id = s.country_id
	WHERE
		sa.sewadar_id					=	@sewadar_id
	AND sa.address_type				=	@address_type
END
GO
-- =============================================================================

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertSewadarsRemark
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertSewadarsRemark'
			)
	BEGIN
		DROP PROCEDURE  InsertSewadarsRemark
	END
GO
CREATE PROCEDURE InsertSewadarsRemark
(
	@sewadar_id			sewadar_id,
	@remarks_type		remarks_type,
	@remarks_sq			display_order,
	@remarks			remarks
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO sewadars_remarks
	(
		sewadar_id, remarks_type, remarks_sq, remarks
	)
	VALUES
	(
		@sewadar_id, @remarks_type, @remarks_sq, @remarks
	)
END
GO
-- =============================================================================

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertSewadarsRemark
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertSewadarsRemark'
			)
	BEGIN
		DROP PROCEDURE  InsertSewadarsRemark
	END
GO
CREATE PROCEDURE InsertSewadarsRemark
(
	@sewadar_id			sewadar_id,
	@remarks_type		remarks_type,
	@remarks_sq			display_order,
	@remarks			remarks
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO sewadars_remarks
	(
		sewadar_id, remarks_type, remarks_sq, remarks
	)
	VALUES
	(
		@sewadar_id, @remarks_type, @remarks_sq, @remarks
	)
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	MakeSewadarsRemarkSqPositive
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='MakeSewadarsRemarkSqPositive'
			)
	BEGIN
		DROP PROCEDURE  MakeSewadarsRemarkSqPositive
	END
GO
CREATE PROCEDURE MakeSewadarsRemarkSqPositive
(
	@sewadar_id			sewadar_id
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    sewadars_remarks
	SET
		remarks_sq			=	-1*remarks_sq
	WHERE
		sewadar_id			=	@sewadar_id
	AND	remarks_sq			<	0
END
GO
-- =============================================================================

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateSewadarsRemark
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateSewadarsRemarkSq'
			)
	BEGIN
		DROP PROCEDURE  UpdateSewadarsRemarkSq
	END
GO
CREATE PROCEDURE UpdateSewadarsRemarkSq
(
	@sewadar_id			sewadar_id,
	@remarks_sq			display_order,
	@old_remarks_type		remarks_type,
	@old_remarks_sq			display_order
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    sewadars_remarks
	SET
		remarks_sq			=	@remarks_sq
	WHERE
		sewadar_id			=	@sewadar_id
	AND	remarks_type			=	@old_remarks_type
	AND	remarks_sq			=	@old_remarks_sq
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateSewadarsRemark
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateSewadarsRemark'
			)
	BEGIN
		DROP PROCEDURE  UpdateSewadarsRemark
	END
GO
CREATE PROCEDURE UpdateSewadarsRemark
(
	@sewadar_id			sewadar_id,
	@remarks_type		remarks_type,
	@remarks_sq			display_order,
	@old_remarks_type		remarks_type,
	@old_remarks_sq			display_order,
	@remarks			remarks
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    sewadars_remarks
	SET
		remarks_type		=	@remarks_type,
		remarks_sq			=	@remarks_sq,
		remarks				=	@remarks
	WHERE
		sewadar_id			=	@sewadar_id
	AND	remarks_type			=	@old_remarks_type
	AND	remarks_sq			=	@old_remarks_sq
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	DeleteSewadarsRemark
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteSewadarsRemark'
			)
	BEGIN
		DROP PROCEDURE  DeleteSewadarsRemark
	END
GO
CREATE PROCEDURE DeleteSewadarsRemark
(
	@sewadar_id			sewadar_id,
	@old_remarks_type		remarks_type,
	@old_remarks_sq			display_order
)
WITH ENCRYPTION
AS

BEGIN
	DELETE FROM sewadars_remarks
	WHERE
		sewadar_id			=	@sewadar_id
	AND	remarks_type			=	@old_remarks_type
	AND	remarks_sq			=	@old_remarks_sq
END
GO
-- =============================================================================

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateOrInsertIfNotExistSewadarDetail
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateOrInsertIfNotExistSewadarDetail'
			)
	BEGIN
		DROP PROCEDURE  UpdateOrInsertIfNotExistSewadarDetail
	END
GO
CREATE PROCEDURE UpdateOrInsertIfNotExistSewadarDetail
(
	@sewadar_id						sewadar_id,
	@occupation						occupation
)
WITH ENCRYPTION
AS
BEGIN
	IF NOT EXISTS (SELECT 1 FROM sewadars_details WHERE sewadar_id = @sewadar_id)
	BEGIN
	INSERT INTO sewadars_details
	(
		sewadar_id, occupation
	)
	VALUES
	(
		@sewadar_id, @occupation
	)
	END
ELSE
	BEGIN
	UPDATE    sewadars_details
	SET
		occupation						=	@occupation
	WHERE 
		sewadar_id					=	@sewadar_id
	END
END
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertSewadarsDetail
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertSewadarsDetail'
			)
	BEGIN
		DROP PROCEDURE  InsertSewadarsDetail
	END
GO
CREATE PROCEDURE InsertSewadarsDetail
(
	@sewadar_id						sewadar_id,
	@address_proof					address_proof = NULL,
	@other_address_proof_id			address_proof_id = NULL,
	@telephone_mobile				telephone_lines = NULL,
	@telephone_residence			telephone_lines = NULL,
	@telephone_office				telephone_lines = NULL,
	@occupation						occupation,
	@attends_weekly_satsang			Boolean = NULL,
	@weekly_satsang_centre_id		satsang_centre_id = NULL,
	@has_hypertension				Boolean = NULL,
	@is_diabetic					Boolean = NULL,
	@has_skin_problem				Boolean = NULL,
	@has_epillepsy					Boolean = NULL
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO sewadars_details
	(
		sewadar_id, address_proof, other_address_proof_id, telephone_mobile, telephone_residence, telephone_office, occupation, attends_weekly_satsang, weekly_satsang_centre_id, has_hypertension, is_diabetic, has_skin_problem, has_epillepsy
	)
	VALUES
	(
		@sewadar_id, @address_proof, @other_address_proof_id, @telephone_mobile, @telephone_residence, @telephone_office, @occupation, @attends_weekly_satsang, @weekly_satsang_centre_id, @has_hypertension, @is_diabetic, @has_skin_problem, @has_epillepsy
	)
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateSewadarsDetail
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateSewadarsDetail'
			)
	BEGIN
		DROP PROCEDURE  UpdateSewadarsDetail
	END
GO
CREATE PROCEDURE UpdateSewadarsDetail
(
	@sewadar_id						sewadar_id,
	@address_proof					address_proof,
	@other_address_proof_id			address_proof_id,
	@telephone_mobile				telephone_lines,
	@telephone_residence			telephone_lines,
	@telephone_office				telephone_lines,
	@occupation						occupation,
	@attends_weekly_satsang			Boolean,
	@weekly_satsang_centre_id		satsang_centre_id,
	@has_hypertension				Boolean,
	@is_diabetic					Boolean,
	@has_skin_problem				Boolean,
	@has_epillepsy					Boolean,
	@txn_ts							timestamp
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    sewadars_details
	SET
		address_proof					=	@address_proof,
		other_address_proof_id			=	@other_address_proof_id,
		telephone_mobile				=	@telephone_mobile,
		telephone_residence				=	@telephone_residence,
		telephone_office				=	@telephone_office,
		occupation						=	@occupation,
		attends_weekly_satsang			=	@attends_weekly_satsang,
		weekly_satsang_centre_id		=	@weekly_satsang_centre_id,
		has_hypertension				=	@has_hypertension,
		is_diabetic						=	@is_diabetic,
		has_skin_problem				=	@has_skin_problem,
		has_epillepsy					=	@has_epillepsy
	WHERE 
		sewadar_id					=	@sewadar_id
	AND 	txn_ts						=	@txn_ts
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
--	Procedure	DeleteSewadarsDetail
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteSewadarsDetail'
			)
	BEGIN
		DROP PROCEDURE  DeleteSewadarsDetail
	END
GO
CREATE PROCEDURE DeleteSewadarsDetail
(
	@sewadar_id						sewadar_id,
	@txn_ts							timestamp
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM sewadars_addresses
	WHERE
		sewadar_id						=	@sewadar_id

	DELETE FROM sewadars_qualifications
	WHERE
		sewadar_id						=	@sewadar_id
	
	DELETE FROM sewadars_remarks
	WHERE
		sewadar_id						=	@sewadar_id
	
	DELETE FROM sewadars_skills
	WHERE
		sewadar_id						=	@sewadar_id
		
	DELETE FROM sewadars_details
	WHERE
		sewadar_id						=	@sewadar_id
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
IF EXISTS	(	SELECT  *
				FROM    sysobjects
				WHERE name = 'ViewSewadarsDetail' and TYPE='v'
			)

	BEGIN
		DROP VIEW ViewSewadarsDetail
	END
GO
CREATE VIEW ViewSewadarsDetail

WITH ENCRYPTION
AS
	SELECT
		sd.sewadar_id, 
		sd.address_proof, 
		sd.other_address_proof_id, 
		other_address_proof_nm = oap.address_proof_nm, 
		sd.telephone_mobile, 
		sd.telephone_residence, 
		sd.telephone_office, 
		sd.occupation, 
		sd.attends_weekly_satsang, 
		sd.weekly_satsang_centre_id, 
		vs.weekly_satsang_centre_nm,
		sd.has_hypertension, 
		sd.is_diabetic, 
		sd.has_skin_problem, 
		sd.has_epillepsy, 
		ad.address_type, 
		ad.address_line_1, 
		ad.address_line_2, 
		ad.post_office_or_city_id, 
		ad.pin_or_zip_code,
		vs.full_nm,
		vs.gender,
		vs.age,
		vs.global_sewadar_status_nm,
		vs.global_sewadar_status_dt,
		vs.sewadar_grno,
		vs.sewadar_status_dtm,
		--vs.sewadar_status_nm,
		vs.sewadar_status_cd,
		vs.centre_nm,
		vs.satsang_centre_id,
		vs.full_department_nm,
		vs.department_dt,
		vs.appointment_dt,
		poc.post_office_or_city_nm,
		doc.district_or_city_id,
		doc.district_nm,
		s.state_nm,
		s.state_id,
		c.country_nm,
		c.country_id,
		sd.txn_ts
	FROM sewadars_details sd
	JOIN ViewSewadarHeader vs ON vs.sewadar_id = sd.sewadar_id
	LEFT OUTER JOIN sewadars_addresses ad ON ad.sewadar_id = sd.sewadar_id AND ad.address_type = 'Residence'
	LEFT OUTER JOIN post_offices_or_cities poc ON poc.post_office_or_city_id = ad.post_office_or_city_id
	LEFT OUTER JOIN CDB..districts_or_cities doc ON poc.district_id = doc.district_or_city_id
	LEFT OUTER JOIN CDB..states s ON s.state_id = doc.state_id
	LEFT OUTER JOIN CDB..countries c ON c.country_id = s.country_id
	LEFT OUTER JOIN other_address_proofs oap ON oap.address_proof_id = sd.other_address_proof_id
GO
-- =============================================================================

-- vim:ts=4 sw=4 ht=4

