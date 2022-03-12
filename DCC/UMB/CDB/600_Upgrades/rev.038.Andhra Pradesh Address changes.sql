BEGIN TRAN;
--ROLLBACK;
--COMMIT;

	-- ====================================================================================================
	--	Apart from changes for Andhra Pradesh,
	--		a couple of changes related to Kabirdham in Chhattisgarh are also made (at the end)
	-- ====================================================================================================
DECLARE
	@dt	DATETIME	=	'24 Jun 2021',
	@al	INTEGER,	--	audit_log_id
	@id	INTEGER;

INSERT INTO	audit_logs
		(	[session_id], [application_id], [user_no], [user_role_id], [operation], [screen_id], [object_id], [operation_dts], [is_consumed]	)
	VALUES
		(	0, 'Script', 1, 'System', 'I', 'Script', 'Address Components', GetDate(), 0	);
	SET @al	=	SCOPE_IDENTITY ();

-------------------------------------------------
-- Districts
-------------------------------------------------
UPDATE	level_2_address_components
SET		level_2_address_component_nm = 'ANANTHAPURAM',
		audit_log_id = @al
WHERE	level_2_address_component_id = 2
AND		level_2_address_component_nm = 'ANANTAPUR'

UPDATE	level_2_address_components
SET		level_2_address_component_nm = 'CHITTOR',
		audit_log_id = @al
WHERE	level_2_address_component_id = 3
AND		level_2_address_component_nm = 'CHITTOOR'

UPDATE	level_2_address_components
SET		level_2_address_component_nm = 'YSR Kadapa',
		audit_log_id = @al
WHERE	level_2_address_component_id = 4
AND		level_2_address_component_nm = 'CUDDAPAH'

UPDATE	level_2_address_components
SET		level_2_address_component_nm = 'SPS Nellore',
		audit_log_id = @al
WHERE	level_2_address_component_id = 15
AND		level_2_address_component_nm = 'NELLORE'

-------------------------------------------------
-- Cities of ANANTHAPURAM District
-------------------------------------------------
UPDATE	level_3_address_components
SET		level_3_address_component_nm = 'Atmakur',
		audit_log_id = @al
WHERE	level_3_address_component_id = 671
AND		level_3_address_component_nm = 'ATMAKUR(ATP)'

UPDATE	level_3_address_components
SET		level_3_address_component_nm = 'Peddavadugur',
		audit_log_id = @al
WHERE	level_3_address_component_id = 1495
AND		level_3_address_component_nm = 'PEDDAVA DUGUR'

UPDATE	level_3_address_components
SET		level_3_address_component_nm = 'Tadipatri',
		audit_log_id = @al
WHERE	level_3_address_component_id = 1652
AND		level_3_address_component_nm = 'TADPATRI'

UPDATE	level_3_address_components
SET		level_3_address_component_nm = 'Bathalapalle',
		audit_log_id = @al
WHERE	level_3_address_component_id = 696
AND		level_3_address_component_nm = 'BATHALAPALLI'

UPDATE	level_3_address_components
SET		level_3_address_component_nm = 'Chennekothapalle',
		audit_log_id = @al
WHERE	level_3_address_component_id = 782
AND		level_3_address_component_nm = 'CHENNEKOTHAPALLI'

UPDATE	level_3_address_components
SET		level_3_address_component_nm = 'Kanaganapalle',
		audit_log_id = @al
WHERE	level_3_address_component_id = 1109
AND		level_3_address_component_nm = 'KANAGANAPALLI'

UPDATE	level_3_address_components
SET		level_3_address_component_nm = 'Nambulapulakunta',
		audit_log_id = @al
WHERE	level_3_address_component_id = 1389
AND		level_3_address_component_nm = 'NAMBULAPULIKUNTA'

UPDATE	level_3_address_components
SET		level_3_address_component_nm = 'Obuladevaracheruvu',
		audit_log_id = @al
WHERE	level_3_address_component_id = 1431
AND		level_3_address_component_nm = 'OBULA DEVARA CHERUVU'

UPDATE	level_3_address_components
SET		level_3_address_component_nm = 'Tanakal',
		audit_log_id = @al
WHERE	level_3_address_component_id = 1668
AND		level_3_address_component_nm = 'TANAKALLU'

UPDATE	level_3_address_components
SET		level_3_address_component_nm = 'Gummagatta',
		audit_log_id = @al
WHERE	level_3_address_component_id = 978
AND		level_3_address_component_nm = 'GUMMAGHATTA'

UPDATE	level_3_address_components
SET		level_3_address_component_nm = 'Settur',
		audit_log_id = @al
WHERE	level_3_address_component_id = 1621
AND		level_3_address_component_nm = 'SHETTUR'

UPDATE	level_3_address_components
SET		level_3_address_component_nm = 'Penu Konda',
		audit_log_id = @al
WHERE	level_3_address_component_id = 1503
AND		level_3_address_component_nm = 'PENUKONDA'

UPDATE	level_3_address_components
SET		level_3_address_component_nm = 'Somandepalle',
		audit_log_id = @al
WHERE	level_3_address_component_id = 1636
AND		level_3_address_component_nm = 'SOMANDEPALLI'

INSERT INTO level_3_address_components (level_3_address_component_nm, level_3_address_component_cd, level_2_address_component_id, is_authentic, effective_from, effective_till, frro_level3_nm, audit_log_id) VALUES
	('Kudair', 'kud', 2, 1, GETDATE(), '31 dec 9999', 'Kudair', @al),
	('D.Hirehal', 'dh', 2, 1, GETDATE(), '31 dec 9999', 'D.Hirehal', @al)


--	==================================================
--	Other than Andhra Pradesh changes
--	==================================================

UPDATE	level_2_address_components
SET		level_2_address_component_nm = 'KABIRDHAM',
		audit_log_id = @al
WHERE	level_2_address_component_id = 129
AND		level_2_address_component_nm = 'KAWARDHA';

UPDATE	level_2_address_components
SET		effective_till	=	@dt,
		audit_log_id = @al
WHERE	level_2_address_component_id = 693
AND		level_2_address_component_nm = 'KABIR DHAM';

