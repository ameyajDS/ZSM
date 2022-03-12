/* ==================================================================================
   	Setup of Iraq Governate/province and cities. Source - 
	https://en.wikipedia.org/wiki/List_of_cities_in_Iraq
	Correct spellings of places is taken from the original article i.e. by clicking on the link of that place.
	==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

-- ======================================================================

DECLARE @country_id INT, @level_1_nm VARCHAR(50)

-- ======================================================================
SELECT	@country_id	=	country_id
FROM	countries
WHERE	country_nm	=	'Iraq'

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Iraq not found', 16, 1)
	RETURN
END

UPDATE	countries
	SET	level_1_address_component	=	'Province',
		level_2_address_component	=	'City / District',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

DECLARE	@tbl	TABLE	(	level_1_cd	VARCHAR (5) PRIMARY KEY, level_1_nm varchar (50) UNIQUE)

INSERT INTO @tbl VALUES ('AN', 'Al Anbar')
INSERT INTO @tbl VALUES ('AM', 'Al Muthanna')
INSERT INTO @tbl VALUES ('QA', 'Al-Qadisiyah')
INSERT INTO @tbl VALUES ('BB', 'Babil')
INSERT INTO @tbl VALUES ('BG', 'Baghdad')
INSERT INTO @tbl VALUES ('BS', 'Basra')
INSERT INTO @tbl VALUES ('DH', 'Dohuk')
INSERT INTO @tbl VALUES ('DQ', 'Dhi Qar')
INSERT INTO @tbl VALUES ('DY', 'Diyala')
INSERT INTO @tbl VALUES ('ER', 'Erbil')
INSERT INTO @tbl VALUES ('KR', 'Karbala')
INSERT INTO @tbl VALUES ('KK', 'Kirkuk')
INSERT INTO @tbl VALUES ('MY', 'Maysan')
INSERT INTO @tbl VALUES ('NJ', 'Najaf')
INSERT INTO @tbl VALUES ('NN', 'Nineveh')
INSERT INTO @tbl VALUES ('SL', 'Saladin')
INSERT INTO @tbl VALUES ('SY', 'Sulaymaniyah')
INSERT INTO @tbl VALUES ('WS', 'Wasit')


-- ======================================================================

DECLARE	@tb	TABLE	(	level_1_nm	VARCHAR (50),
							level_2_cd	VARCHAR (5) ,
							level_2_nm	VARCHAR (50),
								PRIMARY KEY (level_1_nm, level_2_cd),
								UNIQUE (level_1_nm, level_2_nm)
						)

SELECT @level_1_nm = 'Al Anbar'
INSERT INTO @tb VALUES (@level_1_nm, 'QA', 'Al-Qaim')
INSERT INTO @tb VALUES (@level_1_nm, 'AR', 'Ar-Rutba')
INSERT INTO @tb VALUES (@level_1_nm, 'BH', 'Khan al-Baghdadi')
INSERT INTO @tb VALUES (@level_1_nm, 'FL', 'Fallujah')
INSERT INTO @tb VALUES (@level_1_nm, 'HD', 'Haditha')
INSERT INTO @tb VALUES (@level_1_nm, 'HT', 'Heet')
INSERT INTO @tb VALUES (@level_1_nm, 'RM', 'Ramadi')

INSERT INTO @tb VALUES ('Al Muthanna', 'SM', 'Samawah')

SELECT @level_1_nm = 'Al-Qadisiyah'
INSERT INTO @tb VALUES (@level_1_nm, 'AF', 'Afak')
INSERT INTO @tb VALUES (@level_1_nm, 'DW', 'Al Diwaniyah')
INSERT INTO @tb VALUES (@level_1_nm, 'SH', 'Shamia')

SELECT @level_1_nm = 'Babil'
INSERT INTO @tb VALUES (@level_1_nm, 'HH', 'Hillah')
INSERT INTO @tb VALUES (@level_1_nm, 'QS', 'Al-Qasim')
INSERT INTO @tb VALUES (@level_1_nm, 'ES', 'Al Eskanaria')
INSERT INTO @tb VALUES (@level_1_nm, 'MH', 'Al Mehawil')
INSERT INTO @tb VALUES (@level_1_nm, 'MS', 'Al Mosayeb')
INSERT INTO @tb VALUES (@level_1_nm, 'IS', 'Iskandariya')

INSERT INTO @tb VALUES ('Baghdad', 'BG', 'Baghdad')

SELECT @level_1_nm = 'Basra'
INSERT INTO @tb VALUES (@level_1_nm, 'BS', 'Basra')
INSERT INTO @tb VALUES (@level_1_nm, 'UQ', 'Umm Qasr')
INSERT INTO @tb VALUES (@level_1_nm, 'ZB', 'Az Zubayr')

SELECT @level_1_nm = 'Dohuk'
INSERT INTO @tb VALUES (@level_1_nm, 'DH', 'Duhok')
INSERT INTO @tb VALUES (@level_1_nm, 'ZK', 'Zakho')

INSERT INTO @tb VALUES ('Dhi Qar', 'NS', 'Nasiriyah')

SELECT @level_1_nm = 'Diyala'
INSERT INTO @tb VALUES (@level_1_nm, 'BQ', 'Baqubah')
INSERT INTO @tb VALUES (@level_1_nm, 'KH', 'Khanaqin')
INSERT INTO @tb VALUES (@level_1_nm, 'MQ', 'Miqdadiyah')

INSERT INTO @tb VALUES ('Erbil', 'ER', 'Erbil')

INSERT INTO @tb VALUES ('Karbala', 'KR', 'Karbala')

SELECT @level_1_nm = 'Kirkuk'
INSERT INTO @tb VALUES (@level_1_nm, 'ZB', 'Al Zab')
INSERT INTO @tb VALUES (@level_1_nm, 'KR', 'Kirkuk')

INSERT INTO @tb VALUES ('Maysan', 'AM', 'Amarah')

INSERT INTO @tb VALUES ('Najaf', 'NJ', 'Najaf')

SELECT @level_1_nm = 'Nineveh'
INSERT INTO @tb VALUES (@level_1_nm, 'MS', 'Mosul')
INSERT INTO @tb VALUES (@level_1_nm, 'TL', 'Tal Afar')
INSERT INTO @tb VALUES (@level_1_nm, 'TK', 'Tel Keppe')

SELECT @level_1_nm = 'Saladin'
INSERT INTO @tb VALUES (@level_1_nm, 'AD', 'Ad-Dawr')
INSERT INTO @tb VALUES (@level_1_nm, 'AW', 'Al-Awja')
INSERT INTO @tb VALUES (@level_1_nm, 'FR', 'Al-Faris')
INSERT INTO @tb VALUES (@level_1_nm, 'BJ', 'Baiji')
INSERT INTO @tb VALUES (@level_1_nm, 'BL', 'Balad')
INSERT INTO @tb VALUES (@level_1_nm, 'SM', 'Samarra')
INSERT INTO @tb VALUES (@level_1_nm, 'TJ', 'Taji')
INSERT INTO @tb VALUES (@level_1_nm, 'TK', 'Tikrit')

SELECT @level_1_nm = 'Sulaymaniyah'
INSERT INTO @tb VALUES (@level_1_nm, 'HL', 'Halabja')
INSERT INTO @tb VALUES (@level_1_nm, 'SL', 'Sulaymaniyah')

INSERT INTO @tb VALUES ('Wasit', 'KT', 'Kut El Amara')


-- ======================================================================

declare @generated_cdb_audit_log_id bigint
exec cdb..insertAuditLog
		@audit_log_id		=	@generated_cdb_audit_log_id output,
		@user_no            =	1, -- DCC
		@audited_object_id	=	'LEVEL1_LEVEL2',
		@operation			=	'I',
		@user_role_id       =	'CDB_ADM',
		@application_id		=	'CDB_APP',
		@screen_id          =	'0',
		@action_id			=	null   


INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd, 
										 frro_level1_nm, audit_log_id ) 
	SELECT	@country_id, level_1_nm, level_1_cd, level_1_nm, @generated_cdb_audit_log_id
	FROM	@tbl

-- ======================================================================

INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id, 
										 frro_level2_nm, audit_log_id )
	SELECT	level_2_nm, level_2_cd, level_1_address_component_id, level_2_nm, @generated_cdb_audit_log_id
	FROM	@tb	t
		JOIN	level_1_address_components	l1
			ON	(	l1.level_1_address_component_nm	=	t.level_1_nm
				AND	l1.country_id					=	@country_id
				)

-- ======================================================================

UPDATE	l2
	SET	is_authentic	=	1
FROM	level_2_address_components	l2
	JOIN	level_1_address_components	l1
		ON	(	l1.level_1_address_component_id	=	l2.level_1_address_component_id
			AND	l1.country_id	=	@country_id
			)

-- ======================================================================

UPDATE	level_1_address_components
	SET	is_authentic	=	1
WHERE	country_id	=	@country_id

-- ======================================================================

