/* ==================================================================================
	Source File		:	10_sms_data_issues.sql
	Author(s)		:	Manish Saluja, Jiten Loyal
	Started On		:	Mon Dec 20, 2010
	Version			:	0.05
	Module ID		:	ZSM
	Language		:	TRANSACT-SQL
	Last updated	:	31-Dec-2010
	Reviewed By		:
	Reviewed On		:
	==================================================================================
																		   Usage Notes
	----------------------------------------------------------------------------------
		This script shows data issues in sms database that needs to be fixed.

	==================================================================================
																	  Revision History
	----------------------------------------------------------------------------------
	v0.05 MS	* 31-Dec-2010
				* Listed incorrect data in
					- districts
	v0.04 MS	* 28-Dec-2010
				* Listed incorrect data in
					- countries
					- states
	v0.03 MS	* 26-Dec-2010
				* Listed incorrect data in
					- scanned_daily_shift_presences
	v0.02 MS	* 22-Dec-2010
				* Listed incorrect data in
					- sewadars
	v0.01 MS	* 20-Dec-2010
				* Initial version listing incorrect data in
					- satsang_centre_functionaries
	==================================================================================*/

DECLARE 
	@cnt1				INT;

-- ====================================================================================================
--	Sewadars
-- ====================================================================================================

SELECT @cnt1 = COUNT(*) FROM sewadars WHERE	outside_sewadar_area_secretary IN ('Area Secretary', 'Select for outside sewadar', '')
IF (@cnt1 > 0)
	BEGIN
		RAISERROR ('There are some entries in sms..sewadars in which
			outside_sewadar_area_secretary IN (Area Secretary, Select for outside sewadar, '''')', 16, 0);
		SELECT * FROM sewadars WHERE outside_sewadar_area_secretary IS NOT NULL;
	END;

SELECT @cnt1 = COUNT(*) FROM sewadars WHERE	outside_sewadar_secretary IN ('Area Secretary', 'Select for outside sewadar', '', 'Secretary1')
IF (@cnt1 > 0)
	BEGIN
		RAISERROR ('There are some entries in sms..sewadars in which
			outside_sewadar_secretary IN (Area Secretary, Select for outside sewadar, '''', Secretary1)', 16, 0);
		SELECT * FROM sewadars WHERE outside_sewadar_secretary IS NOT NULL
	END;

-- ====================================================================================================
--	Satsang Centre Functionaries
-- ====================================================================================================

SELECT @cnt1 = COUNT(*) FROM satsang_centre_functionaries WHERE effective_from > effective_till
IF (@cnt1 > 0)
	BEGIN
		RAISERROR ('There are some entries in sms..satsang_centre_functionaries in which effective_from > effective_till', 16, 0);
		SELECT * FROM satsang_centre_functionaries WHERE effective_from > effective_till;
	END;

SELECT @cnt1 = COUNT(*)
			FROM sewadars s
LEFT OUTER 	JOIN satsang_centre_functionaries scf ON s.outside_sewadar_secretary = scf.functionary_nm AND scf.functionary = 'Secretary'
WHERE s.outside_sewadar_secretary IS NOT NULL AND scf.functionary_nm IS NULL;
IF (@cnt1 > 0)
	BEGIN
		RAISERROR ('There are some outside_sewadar_secretary in sms..sewadars that are not in sms..satsang_centre_functionaries', 16, 0);
		SELECT DISTINCT s.outside_sewadar_secretary
					FROM sewadars s
		LEFT OUTER 	JOIN satsang_centre_functionaries scf ON s.outside_sewadar_secretary = scf.functionary_nm
		WHERE s.outside_sewadar_secretary IS NOT NULL AND scf.functionary_nm IS NULL;
	END;

SELECT @cnt1 = COUNT(*)
			FROM sewadars s
LEFT OUTER 	JOIN satsang_centre_functionaries scf ON s.outside_sewadar_area_secretary = scf.functionary_nm  AND scf.functionary = 'Area Secretary'
WHERE s.outside_sewadar_area_secretary IS NOT NULL AND scf.functionary_nm IS NULL;
IF (@cnt1 > 0)
	BEGIN
		RAISERROR ('There are some outside_sewadar_area_secretary in sms..sewadars that are not in sms..satsang_centre_functionaries', 16, 0);
		SELECT DISTINCT s.outside_sewadar_area_secretary
					FROM SMS..sewadars s
		LEFT OUTER 	JOIN sms..satsang_centre_functionaries scf ON s.outside_sewadar_area_secretary = scf.functionary_nm  AND scf.functionary = 'Area Secretary'
		WHERE s.outside_sewadar_area_secretary IS NOT NULL AND scf.functionary_nm IS NULL;
	END;

SELECT @cnt1 = COUNT(*)
FROM satsang_centre_functionaries
WHERE functionary_nm IN ('Area Secretary', 'Secretary1');

IF (@cnt1 > 0)
	BEGIN
		RAISERROR ('There are some invalid functionary_nm in sms..satsang_centre_functionaries', 16, 0);
		SELECT * FROM sms..satsang_centre_functionaries
		WHERE functionary_nm IN ('Area Secretary', 'Secretary1');
	END;

-- ====================================================================================================
--	Scanned Daily Shift Presences
-- ====================================================================================================
SELECT @cnt1 = COUNT(*) FROM scanned_daily_shift_presences
WHERE shift_id NOT IN (SELECT DISTINCT shift_id FROM sewa_shifts);

IF (@cnt1 > 0)
	BEGIN
		RAISERROR ('There are some shift_id in scanned_daily_shift_presences that are not in sewa_shifts', 16, 0);
		SELECT * FROM scanned_daily_shift_presences
		WHERE shift_id NOT IN (SELECT DISTINCT shift_id FROM sewa_shifts);
	END;

-- ====================================================================================================
--	Countries
-- ====================================================================================================
SELECT @cnt1 = COUNT(*) FROM (	SELECT c.country_nm FROM countries c LEFT OUTER JOIN CDB..countries cc ON cc.country_nm = c.country_nm
								WHERE c.country_nm IS NOT NULL AND cc.country_nm IS NULL) t;
IF (@cnt1 > 0)
	BEGIN
		RAISERROR ('There are some countries in SMS that are not in CDB', 16, 0);
		SELECT c.country_nm FROM countries c LEFT OUTER JOIN CDB..countries cc ON cc.country_nm = c.country_nm
		WHERE c.country_nm IS NOT NULL AND cc.country_nm IS NULL;
	END;

-- ====================================================================================================
--	States
-- ====================================================================================================
SELECT @cnt1 = COUNT(*) FROM (
	SELECT s.state_nm FROM states s JOIN countries c ON c.country_id = s.country_id
	LEFT OUTER JOIN CDB..countries cc ON cc.country_nm = c.country_nm
	LEFT OUTER JOIN CDB..states cs ON cs.country_id = cc.country_id AND cs.state_nm = s.state_nm
	WHERE s.state_nm IS NOT NULL AND cs.state_nm IS NULL) t;
IF (@cnt1 > 0)
	BEGIN
		RAISERROR ('There are some states in SMS that are not in CDB', 16, 0);
		SELECT c.country_id, c.country_nm, s.state_id, s.state_nm FROM states s JOIN countries c ON c.country_id = s.country_id
		LEFT OUTER JOIN CDB..countries cc ON cc.country_nm = c.country_nm
		LEFT OUTER JOIN CDB..states cs ON cs.country_id = cc.country_id AND cs.state_nm = s.state_nm
		WHERE s.state_nm IS NOT NULL AND cs.state_nm IS NULL		
	END;

-- ====================================================================================================
--	Districts
-- ====================================================================================================
SELECT @cnt1 = COUNT(*) FROM (
	SELECT d.district_nm 
	FROM districts d JOIN states s ON s.state_id = d.state_id AND s.country_id = d.country_id
	JOIN countries c ON c.country_id = d.country_id
	LEFT OUTER JOIN CDB..countries cc ON cc.country_nm = c.country_nm AND cc.effective_till > GETDATE()
	LEFT OUTER JOIN CDB..states cs ON cs.country_id = cc.country_id AND cs.state_nm = s.state_nm AND cs.effective_till > GETDATE()
	LEFT OUTER JOIN CDB..districts_or_cities cd ON cd.state_id = cs.state_id AND cd.district_nm = d.district_nm AND cd.effective_till > GETDATE()
	WHERE d.district_nm IS NOT NULL AND cd.district_nm IS NULL ) t;
	
IF (@cnt1 > 0)
	BEGIN
		RAISERROR ('There are some districts in SMS that are not in CDB', 16, 0);
		SELECT c.country_nm, s.state_nm, d.district_nm 
		FROM districts d JOIN states s ON s.state_id = d.state_id AND s.country_id = d.country_id
		JOIN countries c ON c.country_id = d.country_id
		LEFT OUTER JOIN CDB..countries cc ON cc.country_nm = c.country_nm AND cc.effective_till > GETDATE()
		LEFT OUTER JOIN CDB..states cs ON cs.country_id = cc.country_id AND cs.state_nm = s.state_nm AND cs.effective_till > GETDATE()
		LEFT OUTER JOIN CDB..districts_or_cities cd ON cd.state_id = cs.state_id AND cd.district_nm = d.district_nm AND cd.effective_till > GETDATE()
		WHERE d.district_nm IS NOT NULL AND cd.district_nm IS NULL
		ORDER BY 3;
	END;
