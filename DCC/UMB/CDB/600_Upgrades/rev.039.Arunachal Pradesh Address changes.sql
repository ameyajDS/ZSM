BEGIN TRAN;
--ROLLBACK;
--COMMIT;

DECLARE
	@dt1	DATETIME	=	CONVERT(date, GETDATE()),
	@dt2	DATETIME	=	'31 Dec 9999',
	@al		INTEGER,	--	audit_log_id
	@id1	INTEGER,
	@id2	INTEGER;

INSERT INTO	audit_logs
		(	[session_id], [application_id], [user_no], [user_role_id], [operation], [screen_id], [object_id], [operation_dts], [is_consumed]	)
	VALUES
		(	0, 'Script', 1, 'System', 'I', 'Script', 'Address Components', GETDATE(), 0	);
	SET @al	=	SCOPE_IDENTITY ();

-------------------------------------------------
-- Districts
-------------------------------------------------
UPDATE	level_2_address_components
SET		effective_till = @dt1,
		audit_log_id = @al
WHERE	level_2_address_component_id = 26
AND		level_2_address_component_nm = 'ALONG'

UPDATE	level_2_address_components
SET		effective_till = @dt1,
		audit_log_id = @al
WHERE	level_2_address_component_id = 42
AND		level_2_address_component_nm = 'WEST SUBANSIRI'

UPDATE	level_2_address_components
SET		level_2_address_component_nm = 'PAPUMPARE',
		audit_log_id = @al
WHERE	level_2_address_component_id = 35
AND		level_2_address_component_nm = 'PAPUM PARE'

SELECT @id1 = level_1_address_component_id 
FROM level_1_address_components
WHERE level_1_address_component_nm = 'ARUNACHAL PRADESH'

-------------------------------------------------
-- New District Anjaw
-------------------------------------------------
INSERT INTO level_2_address_components (level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id, is_authentic, effective_from, effective_till, frro_level2_nm, audit_log_id) VALUES
	('Anjaw', 'anj', @id1, 1, @dt1, @dt2, 'ANJAW', @al)
SET @id2 = SCOPE_IDENTITY ();

-- Cities
INSERT INTO level_3_address_components (level_3_address_component_nm, level_3_address_component_cd, level_2_address_component_id, is_authentic, effective_from, effective_till, frro_level3_nm, audit_log_id) VALUES
	('Hawai', 'haw', @id2, 1, @dt1, @dt2, 'Hawai', @al),
	('Hayuliang', 'hay', @id2, 1, @dt1, @dt2, 'Hayuliang', @al),
	('Manchal', 'man', @id2, 1, @dt1, @dt2, 'Manchal', @al),
	('Walong', 'wal', @id2, 1, @dt1, @dt2, 'Walong', @al),
	('Kibithoo', 'kib', @id2, 1, @dt1, @dt2, 'Kibithoo', @al),
	('Chaglagam', 'cha', @id2, 1, @dt1, @dt2, 'Chaglagam', @al),
	('Metengliang', 'met', @id2, 1, @dt1, @dt2, 'Metengliang', @al),
	('Goiliang', 'goi', @id2, 1, @dt1, @dt2, 'Goiliang', @al);
	
-------------------------------------------------
-- New District Itanagar
-------------------------------------------------
INSERT INTO level_2_address_components (level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id, is_authentic, effective_from, effective_till, frro_level2_nm, audit_log_id) VALUES
	('Itanagar', 'ita', @id1, 1, @dt1, @dt2, 'Itanagar', @al)
SET @id2 = SCOPE_IDENTITY ();

-- Cities
INSERT INTO level_3_address_components (level_3_address_component_nm, level_3_address_component_cd, level_2_address_component_id, is_authentic, effective_from, effective_till, frro_level3_nm, audit_log_id) VALUES
	('Itanagar', 'ita', @id2, 1, @dt1, @dt2, 'Itanagar', @al),
	('Naharlagun', 'nah', @id2, 1, @dt1, @dt2, 'Naharlagun', @al),
	('Banderdewa', 'ban', @id2, 1, @dt1, @dt2, 'Banderdewa', @al);

-------------------------------------------------
-- New District KRA Daadi
-------------------------------------------------
INSERT INTO level_2_address_components (level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id, is_authentic, effective_from, effective_till, frro_level2_nm, audit_log_id) VALUES
	('KRA Daadi', 'kra', @id1, 1, @dt1, @dt2, 'KRA Daadi', @al)
SET @id2 = SCOPE_IDENTITY ();

-- Cities
INSERT INTO level_3_address_components (level_3_address_component_nm, level_3_address_component_cd, level_2_address_component_id, is_authentic, effective_from, effective_till, frro_level3_nm, audit_log_id) VALUES
	('Palin', 'pal', @id2, 1, @dt1, @dt2, 'Palin', @al),
	('Jamin', 'jam', @id2, 1, @dt1, @dt2, 'Jamin', @al),
	('Yangte', 'yan', @id2, 1, @dt1, @dt2, 'Yangte', @al),
	('Chambang', 'cha', @id2, 1, @dt1, @dt2, 'Chambang', @al),
	('Tarak Langdi', 'tar', @id2, 1, @dt1, @dt2, 'Tarak Langdi', @al),
	('Gangte', 'gan', @id2, 1, @dt1, @dt2, 'Gangte', @al),
	('Tali', 'tal', @id2, 1, @dt1, @dt2, 'Tali', @al),
	('Pipsorang', 'pip', @id2, 1, @dt1, @dt2, 'Pipsorang', @al);

-------------------------------------------------
-- New District Longding
-------------------------------------------------
INSERT INTO level_2_address_components (level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id, is_authentic, effective_from, effective_till, frro_level2_nm, audit_log_id) VALUES
	('Longding', 'lon', @id1, 1, @dt1, @dt2, 'Longding', @al)
SET @id2 = SCOPE_IDENTITY ();

-- Cities
INSERT INTO level_3_address_components (level_3_address_component_nm, level_3_address_component_cd, level_2_address_component_id, is_authentic, effective_from, effective_till, frro_level3_nm, audit_log_id) VALUES
	('Wakka', 'wak', @id2, 1, @dt1, @dt2, 'Wakka', @al),
	('Pongchau', 'pon', @id2, 1, @dt1, @dt2, 'Pongchau', @al),
	('Kanubari', 'kan', @id2, 1, @dt1, @dt2, 'Kanubari', @al),
	('Pumao', 'pum', @id2, 1, @dt1, @dt2, 'Pumao', @al),
	('Launu', 'lau', @id2, 1, @dt1, @dt2, 'Launu', @al);

-------------------------------------------------
-- New District Namsai
-------------------------------------------------
INSERT INTO level_2_address_components (level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id, is_authentic, effective_from, effective_till, frro_level2_nm, audit_log_id) VALUES
	('Namsai', 'nam', @id1, 1, @dt1, @dt2, 'Namsai', @al)
SET @id2 = SCOPE_IDENTITY ();

-- Cities
INSERT INTO level_3_address_components (level_3_address_component_nm, level_3_address_component_cd, level_2_address_component_id, is_authentic, effective_from, effective_till, frro_level3_nm, audit_log_id) VALUES
	('Namsai', 'nam', @id2, 1, @dt1, @dt2, 'Namsai', @al),
	('Piyong/Ningroo', 'piy', @id2, 1, @dt1, @dt2, 'Piyong/Ningroo', @al),
	('Lathaw', 'lat', @id2, 1, @dt1, @dt2, 'Lathaw', @al),
	('Lekang', 'lek', @id2, 1, @dt1, @dt2, 'Lekang', @al),
	('Chongkham', 'cho', @id2, 1, @dt1, @dt2, 'Chongkham', @al);

-------------------------------------------------
-- New District Shiyomi
-------------------------------------------------
INSERT INTO level_2_address_components (level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id, is_authentic, effective_from, effective_till, frro_level2_nm, audit_log_id) VALUES
	('Shiyomi', 'shi', @id1, 1, @dt1, @dt2, 'Shiyomi', @al)
SET @id2 = SCOPE_IDENTITY ();

-- Cities
INSERT INTO level_3_address_components (level_3_address_component_nm, level_3_address_component_cd, level_2_address_component_id, is_authentic, effective_from, effective_till, frro_level3_nm, audit_log_id) VALUES
	('Menchukha', 'men', @id2, 1, @dt1, @dt2, 'Menchukha', @al),
	('Tato', 'tat', @id2, 1, @dt1, @dt2, 'Tato', @al),
	('Monigong', 'mon', @id2, 1, @dt1, @dt2, 'Monigong', @al),
	('Pidi', 'pid', @id2, 1, @dt1, @dt2, 'Pidi', @al);

-------------------------------------------------
-- New District Siang
-------------------------------------------------
INSERT INTO level_2_address_components (level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id, is_authentic, effective_from, effective_till, frro_level2_nm, audit_log_id) VALUES
	('Siang', 'sia', @id1, 1, @dt1, @dt2, 'Siang', @al)
SET @id2 = SCOPE_IDENTITY ();

-- Cities
INSERT INTO level_3_address_components (level_3_address_component_nm, level_3_address_component_cd, level_2_address_component_id, is_authentic, effective_from, effective_till, frro_level3_nm, audit_log_id) VALUES
	('Boleng', 'bol', @id2, 1, @dt1, @dt2, 'Boleng', @al),
	('Riga', 'rig', @id2, 1, @dt1, @dt2, 'Riga', @al),
	('Rebo-Perging', 'reb', @id2, 1, @dt1, @dt2, 'Rebo-Perging', @al),
	('Pangin', 'pan', @id2, 1, @dt1, @dt2, 'Pangin', @al),
	('Kebang', 'keb', @id2, 1, @dt1, @dt2, 'Kebang', @al),
	('Jomlo Mobuk', 'jom', @id2, 1, @dt1, @dt2, 'Jomlo Mobuk', @al),
	('Rumgong', 'rum', @id2, 1, @dt1, @dt2, 'Rumgong', @al),
	('Kaying', 'kay', @id2, 1, @dt1, @dt2, 'Kaying', @al),
	('Payum', 'pay', @id2, 1, @dt1, @dt2, 'Payum', @al);

