BEGIN TRAN;
--ROLLBACK;
--COMMIT;

IF (DB_NAME() != 'CDB')
BEGIN
	ROLLBACK;
	RAISERROR ('Datbase should be CDB', 16, 1);
	RETURN;
END

DECLARE
	@eftdt	DATE	=	GETDATE(),
	@tdt	DATE	=	'31 Dec 9999',
	@al		INTEGER,	--	audit_log_id
	@cnt1	INTEGER,
	@cnt2	INTEGER,
	@cnt3	INTEGER;

SET @eftdt = DATEADD (d, -1, @eftdt);

INSERT INTO	audit_logs
		(	[session_id], [application_id], [user_no], [user_role_id], [operation], [screen_id], [object_id], [operation_dts], [is_consumed]	)
	VALUES
		(	0, 'Script', 1, 'System', 'U', 'rev081', 'FRRO names reverts of Address Components', GETDATE(), 0	);
	SET @al	=	SCOPE_IDENTITY ();




--	=================================================================================================================
--	Set FRRO Name to be same as Level 3 Component Name where the names have been corrected in recent past
--	=================================================================================================================

UPDATE	level_3_address_components
	SET	frro_level3_nm	=	level_3_address_component_nm,
		audit_log_id	=	@al
WHERE	level_3_address_component_id	IN	(	671, 696, 782, 978, 1109, 1389, 1431, 1495, 1503, 1621, 1636, 1652, 1668, 49936, 60013, 83237, 88798, 130206,
												141909, 141910, 199309, 225368, 225369, 225405, 225440, 225481, 225490, 225493, 226415, 226416, 229130, 229131
											)
AND		frro_level3_nm	!=	level_3_address_component_nm;

IF (@@ROWCOUNT != 32)
BEGIN
	ROLLBACK;
	RAISERROR ('Setting FRRO Name for Level 3 Address Components failed', 16, 1);
	RETURN;
END


UPDATE	level_2_address_components
	SET	frro_level2_nm	=	level_2_address_component_nm,
		audit_log_id	=	@al
WHERE	level_2_address_component_id	IN	(	59, 83, 119, 124, 126, 129, 152, 162, 177, 184, 191, 198, 206, 218, 244, 252, 269, 281,
												294, 388, 409, 442, 510, 526, 534, 547, 549, 563, 577, 606, 700, 5513, 5514, 5627, 6386,
												6387, 6389, 6390, 6391, 6393, 6394, 6395, 6396, 6397, 6398, 6400, 6401, 6402, 6404, 6405,
												6406, 6408, 6411, 6412, 6413, 6418, 6420, 6421, 6422, 6423, 6424, 6425, 6426, 6428, 7492,
												7629, 7634, 7654, 7742, 7762, 7832, 8232, 8282, 9012, 9064, 9092, 9173, 9191, 9206, 9226,
												9280, 9295, 9359, 9379, 9842, 10465, 10796, 10891, 14400, 14405, 14415, 14445, 30287, 30301,
												30310, 30324, 30331, 30339, 30348, 30356, 30364, 30376, 30385, 30388, 30398, 30409, 30420,
												30429, 30444, 30451, 30457, 30472, 30482, 30492, 30504, 30514, 30529, 30540, 30556, 30579,
												30594, 30608, 30619, 30626, 40117, 43900, 45419, 45453, 45712, 45713, 45714, 45715, 45716,
												51472, 51983, 52519, 52525
											)
AND		frro_level2_nm	!=	level_2_address_component_nm;

IF (@@ROWCOUNT != 137)
BEGIN
	ROLLBACK;
	RAISERROR ('Setting FRRO Name for Level 2 Address Components failed', 16, 1);
	RETURN;
END


UPDATE	level_1_address_components
	SET	frro_level1_nm	=	level_1_address_component_nm,
		audit_log_id	=	@al
WHERE	level_1_address_component_id	IN	(	22, 23, 208, 1959, 1960, 2221, 3535, 4125, 4126, 4135, 4136, 4137, 4154
											)
AND		frro_level1_nm	!=	level_1_address_component_nm;

IF (@@ROWCOUNT != 13)
BEGIN
	ROLLBACK;
	RAISERROR ('Setting FRRO Name for Level 1 Address Components failed', 16, 1);
	RETURN;
END


--	==================================================

SELECT	*
FROM	level_3_address_components
WHERE	audit_log_id	=	@al
ORDER	BY	8, 4, 3;

SELECT	*
FROM	level_2_address_components
WHERE	audit_log_id	=	@al
ORDER	BY	8, 4, 3;

SELECT	*
FROM	level_1_address_components
WHERE	audit_log_id	=	@al
ORDER	BY	8, 4, 3;


