--QuerySewaTeamWiseSewadar


SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	QuerySewaTeamDeptName
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QuerySewaTeamDeptName'
			)
	BEGIN
		DROP PROCEDURE  QuerySewaTeamDeptName
	END
GO
CREATE PROCEDURE QuerySewaTeamDeptName
(
	@sewa_id		sewa_id	
)
WITH ENCRYPTION
AS
BEGIN

	SELECT DISTINCT st.sewa_team_id, d.department_nm, st.sewa_team_nm 
	FROM ViewSewaTeamAttendence st
	INNER JOIN departments d ON st.sewa_team_nm LIKE '%' + d.department_nm + '%'
	WHERE sewa_id = @sewa_id AND sewa_team_id is NOT NULL
	ORDER BY d.department_nm
END
GO