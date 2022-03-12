/* ==================================================================================
	Source File		:	setup_indore_sewas.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	Wed May 23 15:13 IST 2012
	Version			:	1.00
	Module ID		:	ZSM
	Language		:	TRANSACT-SQL
	Last updated	:	23-May-2012
	Reviewed By		:
	Reviewed On		:
	==================================================================================
																		   Usage Notes
	----------------------------------------------------------------------------------

	==================================================================================
																	  Revision History
	----------------------------------------------------------------------------------
		*   Initial versions
	==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

USE ZSM
GO

	------ ==============================================
	------ Temporary Stored Procedure that creates a Sewa
	------ ==============================================

CREATE	PROCEDURE	TmpInsertSewa
(
	@centre	INT,
	@st_dt	DATETIME,
	@end_dt	DATETIME
)
AS
	DECLARE
		@yr			INT,
		@sewa_id	INT,
		@sewa_cd	VARCHAR (10),
		@sewa_nm	gnc_long_nm;
BEGIN
	SET @yr = YEAR (@end_dt);
	SET @sewa_cd = CONVERT (VARCHAR, @yr) + ' ANN'
	SET @sewa_nm = 'Annual Satsang Programme ' + CONVERT (VARCHAR, @yr)

	INSERT INTO sewas
			(	satsang_centre_id, sewa_cd, sewa_nm, start_dt, finish_dt, is_satsang_programme, is_scanner_used, is_leave_allowed, is_exemption_allowed,
				is_default_sewa, sewa_frequency, attendance_unit, attendance_marking, min_sewa_duration, max_sewa_duration, attendance_ts
			)
		VALUES
			(	@centre, @sewa_cd, @sewa_nm, @st_dt, @end_dt, 'Yes', 'No', 'No', 'No',
				'No', 'Daily', 'Day', 'Summary', 0, 10, GetDate()
			);
	
	SET @sewa_id = SCOPE_IDENTITY ();

	INSERT INTO	sewas_satsang_centres (	sewa_id, satsang_centre_id	)	VALUES	(	@sewa_id, @centre	);
END
GO

-- =======================
--	Sewas of Indore Centre
-- =======================

DECLARE
	@sewa_id	INT,
	@centre_id	INT;

SELECT	@centre_id	=	satsang_centre_id
FROM	satsang_centres_details
WHERE	centre_nm = 'Indore'
AND		is_main_centre = 'Yes';

IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Indore Centre not found', 16, 1);
	RETURN
END


EXEC TmpInsertSewa @centre_id, '20-Jan-97', '29-Jan-97'
EXEC TmpInsertSewa @centre_id, '26-Jan-98', '04-Feb-98'
EXEC TmpInsertSewa @centre_id, '25-Jan-99', '03-Feb-99'
EXEC TmpInsertSewa @centre_id, '24-Jan-00', '02-Feb-00'
EXEC TmpInsertSewa @centre_id, '22-Jan-01', '31-Jan-01'
EXEC TmpInsertSewa @centre_id, '21-Jan-02', '30-Jan-02'
EXEC TmpInsertSewa @centre_id, '20-Jan-03', '29-Jan-03'
EXEC TmpInsertSewa @centre_id, '19-Jan-04', '28-Jan-04'
EXEC TmpInsertSewa @centre_id, '24-Jan-05', '02-Feb-05'
EXEC TmpInsertSewa @centre_id, '02-Jan-06', '11-Jan-06'
EXEC TmpInsertSewa @centre_id, '01-Jan-07', '10-Jan-07'
EXEC TmpInsertSewa @centre_id, '31-Dec-07', '09-Jan-08'
EXEC TmpInsertSewa @centre_id, '05-Jan-09', '14-Jan-09'
EXEC TmpInsertSewa @centre_id, '04-Jan-10', '13-Jan-10'
EXEC TmpInsertSewa @centre_id, '03-Jan-11', '12-Jan-11'
EXEC TmpInsertSewa @centre_id, '23-Jan-12', '01-Feb-12'
GO

DROP	PROCEDURE	TmpInsertSewa
GO

-- ===========================================================================================
-- vim:ts=4 sw=4 ht=4
