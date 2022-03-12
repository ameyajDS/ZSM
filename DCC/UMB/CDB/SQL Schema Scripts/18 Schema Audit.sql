/* ==================================================================================
	Source File		:	audit_schema.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	Mon Nov 15 11:57:00 IST 2010
	Version			:	1.00
	Module ID		:	CDB
	Language		:	TRANSACT-SQL
	Last updated	:	
	Reviewed By		:	
	Reviewed On		:	
	==================================================================================
																		   Usage Notes
	----------------------------------------------------------------------------------
		Audit Schema for only following tables:
			countries
			states
			districts_or_cities
	==================================================================================
																	  Revision History
	----------------------------------------------------------------------------------

	==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO


CREATE	TABLE	adt_countries	(
	audit_log_id		INTEGER			NOT NULL	CONSTRAINT	AdtCountries_FK_AuditLogId
															REFERENCES	audit_logs,
    country_id			country_id		NOT NULL,
    country_cd			VARCHAR (5)		NOT NULL,
    country_nm			VARCHAR (55)	NOT NULL,
    isd_code			VARCHAR (10)	    NULL,
    gmt_diff			Numeric(4,2)	NOT NULL,
    effective_from		DATETIME		NOT NULL,
    effective_till		DATETIME		NOT NULL,

		CONSTRAINT	AdtCountries_PK_CountryId_AuditLogId
				PRIMARY KEY		NONCLUSTERED	(country_id, audit_log_id)
)
GO

CREATE	TABLE	adt_states	(
	audit_log_id		INTEGER			NOT NULL	CONSTRAINT	AdtStates_FK_AuditLogId
															REFERENCES	audit_logs,
    state_id			state_id		NOT NULL,
    state_cd			VARCHAR (5)		NOT NULL,
    state_nm			VARCHAR (55)	NOT NULL,
    country_id			country_id		NOT NULL,
    effective_from		DATETIME		NOT NULL,
    effective_till		DATETIME		NOT NULL,

		CONSTRAINT	AdtStates_PK_StateId_AuditLogId
				PRIMARY KEY		NONCLUSTERED	(state_id, audit_log_id)
)
GO

CREATE	TABLE	adt_districts_or_cities	(
	audit_log_id		INTEGER				NOT NULL	CONSTRAINT	AdtDistrictsOrCities_FK_AuditLogId
																REFERENCES	audit_logs,
    district_or_city_id	district_or_city_id	NOT NULL,
    district_cd			VARCHAR (5)			NOT NULL,
    district_nm			VARCHAR (55)		NOT NULL,
    state_id			state_id			NOT NULL,
    effective_from		DATETIME			NOT NULL,
    effective_till		DATETIME			NOT NULL,

		CONSTRAINT	AdtDistrictsOrCities_PK_DistrictOrCityId_AuditLogId
				PRIMARY KEY		NONCLUSTERED	(district_or_city_id, audit_log_id)
)
GO

CREATE	TABLE	adt_skills		(
	audit_log_id		INTEGER			NOT NULL	CONSTRAINT	AdtSkills_FK_AuditLogId
															REFERENCES	audit_logs,
    skill_id			skill_id		NOT NULL,
    skill_nm			VARCHAR (20)	NOT NULL,
    effective_from		DATETIME		NOT NULL,
    effective_till		DATETIME		NOT NULL,

		CONSTRAINT	AdtSkills_PK_SkillId_AuditLogId
				PRIMARY KEY		NONCLUSTERED	(skill_id, audit_log_id)
)
GO

CREATE	TABLE	adt_occupations		(
	audit_log_id		INTEGER			NOT NULL	CONSTRAINT	AdtOccupations_FK_AuditLogId
															REFERENCES	audit_logs,
    occupation_id		occupation_id	NOT NULL,
    occupation_cd		VARCHAR (5)		NOT NULL,
    occupation_nm		VARCHAR (20)	NOT NULL,
    effective_from		DATETIME		NOT NULL,
    effective_till		DATETIME		NOT NULL,

		CONSTRAINT	AdtOccupations_PK_OccupationId_AuditLogId
				PRIMARY KEY		NONCLUSTERED	(occupation_id, audit_log_id)
)
GO

CREATE	TABLE	adt_relations		(
	audit_log_id		INTEGER			NOT NULL	CONSTRAINT	AdtRelations_FK_AuditLogId
															REFERENCES	audit_logs,
    relation_id			relation_id		NOT NULL,
    relation_nm			VARCHAR (20)	NOT NULL,
    effective_from		DATETIME		NOT NULL,
    effective_till		DATETIME		NOT NULL,

		CONSTRAINT	AdtRelations_PK_RelationId_AuditLogId
				PRIMARY KEY		NONCLUSTERED	(relation_id, audit_log_id)
)
GO

CREATE	TABLE	adt_satsang_centres	(
	audit_log_id			INTEGER				NOT NULL	CONSTRAINT	AdtSatsangCentres_FK_AuditLogId
																	REFERENCES	audit_logs,
    satsang_centre_id		satsang_centre_id	NOT NULL,
    satsang_centre_cd		CHAR (5)			NOT NULL,
    satsang_centre_nm		VARCHAR (25)		NOT NULL,
    satsang_centre_type		satsang_centre_type	NOT NULL,
    address_line_1			address_line		NOT NULL,
    address_line_2			address_line		    NULL,
    district_or_city_id		district_or_city_id	NOT NULL,
    pin_or_zip_code			pin_or_zip_code		    NULL,
    secretary				person_id		   		NULL,
    telephones				telephone_lines		    NULL,
    email_addresses			email_addresses		    NULL,
    fax_lines				telephone_lines		    NULL,
    effective_from			DATETIME			NOT NULL,
    effective_till			DATETIME			NOT NULL,

		CONSTRAINT	AdtSatsangCentres_PK_SatsangCentreId_AuditLogId
				PRIMARY KEY		NONCLUSTERED	(satsang_centre_id, audit_log_id)
)
GO

