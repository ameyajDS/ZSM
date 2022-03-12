/* ==================================================================================
    Source File		:	upgrade_v5.53.sql
    Author(s)		:	Manish Saluja
    Started On		:	Sun May 27, 2012
    Last updated	:	May 27, 2012
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Upgrade Script for v5.53
			..... To update the records for the splitting of CDB skill 'Watch & Mobile Shop' into 2.
		This needs to be run in all the centre locations (including Zone).
    ==================================================================================
								      								  Revision History
    ----------------------------------------------------------------------------------

   ==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

USE SysAdmin
GO

UPDATE packages
	SET	version_no = 5.53,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'

-- =============================================================================
--		CDB changes
-- =============================================================================

USE CDB
GO

DECLARE @act_effective_from DATETIME;
SET @act_effective_from = '1-Jan-2000';

-- Splitting 'Watch & Mobile Shop' into 2
UPDATE skills
	SET		skill_nm = 'Watch Shop'
	WHERE	skill_nm = 'Watch & Mobile Shop';
INSERT INTO skills (skill_nm, effective_from) VALUES ('Mobile Shop', @act_effective_from);

GO

-- =============================================================================
--		ZSM changes
-- =============================================================================

USE ZSM
GO

DECLARE 
	@skill1_id 	INT,
	@skill2_id	INT;

SELECT @skill1_id = skill_id FROM CDB..skills WHERE skill_nm = 'Watch Shop';
SELECT @skill2_id = skill_id FROM CDB..skills WHERE skill_nm = 'Mobile Shop';

INSERT INTO sewadars_skills (sewadar_id, skill_id, skill_sq)
	SELECT s1.sewadar_id, @skill2_id, (SELECT MAX(skill_sq) FROM sewadars_skills s2 WHERE s2.sewadar_id = s1.sewadar_id) + 1
	FROM sewadars_skills s1
	WHERE EXISTS 	
				( 	SELECT 1 FROM sewadars_skills s3
						WHERE s3.sewadar_id = s1.sewadar_id AND s3.skill_id = @skill1_id
				);
-- =============================================================================


GO

-- =============================================================================

-- vim:sw=4 ht=4 ai ts=4
