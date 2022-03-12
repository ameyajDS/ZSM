/* ==================================================================================
	Source File		:	08_cdb_updates.sql
	Author(s)		:	Jeetu Masand, Manish Saluja
	Started On		:	Thu Dec 01
	Version			:	v0.07
	Module ID		:	ZSM
	Language		:	TRANSACT-SQL
	Last updated	:	06-Feb-2011
	Reviewed By		:	Jiten Loyal
	Reviewed On		:
	==================================================================================
																		   Usage Notes
	----------------------------------------------------------------------------------
	This script adds / modifies the missing / incorrect data in CDB found during ZSM migration

	==================================================================================
																    CDB Tables Updated 
	----------------------------------------------------------------------------------
	* initiation_places
	* satsang_centres
	* relations
	* states
	* districts_or_cities
	* skills
	----------------------------------------------------------------------------------
																	  Revision History
	----------------------------------------------------------------------------------
	v0.07 MS	* 06-Feb-2011
				* Moved qulification related tables to 09_cdb_updates_for_qualification.sql
	v0.06 MS	* 05-Feb-2011
				* Updates done for following tables
					- qualifications
					- qlfctn_subjects
					- qualifications_qlfctn_subjects
	v0.05 MS	* 03-Jan-2011
				* Added definition of missing CDB audit tables
	v0.04 MS	* 01-Jan-2011
				* Updates done for following tables
					- skills
	v0.03 MS	* 31-Dec-2010
				* Renamed the file to 08_cdb_updates.sql
				* Removed the data updation of countries as it was not required.
				* refined the data updation for following tables
					- states
					- districts_or_cities
	v0.02 MS	* 28-Dec-2010
				* Removed migration of department_groups as it is not needed
				* Removed the relations migration and brought the one done in 13_schema_migration.sql
				* Renamed the file to 11_cdb_updates.sql and removed all the non-cdb updates from this file
				* Moved the sms updates to 10_sms_data_issues.sql and 10_sms_data_issues_fixes.sql.exclude
				* Brought cdb updates from 13_schema_migration.sql for following tables
					- initiation_places
					- satsang_centres
					- relations
				* Moved correction of data of countries and states to file 10_sms_data_issues_fixes.sql.exclude
	v0.01 JM	* Upto 19-Dec-2010
				* Initial version creates following temporary migration table
					- tmp_mgr_skills_mapping
				* Following table data updation scripts are written
					- countries
					- states
					- districts_or_cities
					- relations
					- skills
	
--Pending
--Notes

*/

-- ====================================================================================================
--	Missing CDB audit tables (from <>\UMB\CDB\Trunk\SQL_SCRIPTS\1_Schema\5_audit_schema.sql)
-- ====================================================================================================
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


DECLARE
	@centre_id			INT,
	@active_eff_from	DATETIME,
	@active_eff_till	DATETIME,
	@inactiv_eff_frm	DATETIME,
	@inactiv_eff_til	DATETIME,
	@cnt1				INT,
	@cnt2				INT;

	SELECT @centre_id		= satsang_centre_id FROM satsang_centres WHERE satsang_centre_nm = 'Bhayandar'; -- 6015
	SET	@active_eff_from 	= '01-Jan-2000';
	SET @active_eff_till	= '31-Dec-9999';
	SET @inactiv_eff_frm	= '01-Jan-2000';
	SET @inactiv_eff_til	= '31-Dec-2009';

-- ====================================================================================================
--	CDB Updates
-- ====================================================================================================

INSERT INTO initiation_places (place_nm, effective_from, effective_till) VALUES ('Ahmedabad',		@active_eff_from, @active_eff_till);
INSERT INTO initiation_places (place_nm, effective_from, effective_till) VALUES ('Kolkata',		@active_eff_from, @active_eff_till);
INSERT INTO initiation_places (place_nm, effective_from, effective_till) VALUES ('Hyderabad',		@active_eff_from, @active_eff_till);
INSERT INTO initiation_places (place_nm, effective_from, effective_till) VALUES ('Benin (West Africa)',		@active_eff_from, @active_eff_till);

INSERT INTO initiation_places (place_nm, effective_from, effective_till) VALUES ('Ajmer',			@inactiv_eff_frm, @inactiv_eff_til);
INSERT INTO initiation_places (place_nm, effective_from, effective_till) VALUES ('Akola',			@inactiv_eff_frm, @inactiv_eff_til);
INSERT INTO initiation_places (place_nm, effective_from, effective_till) VALUES ('Amritsar',		@inactiv_eff_frm, @inactiv_eff_til);
INSERT INTO initiation_places (place_nm, effective_from, effective_till) VALUES ('Bangkok',		@inactiv_eff_frm, @inactiv_eff_til);
INSERT INTO initiation_places (place_nm, effective_from, effective_till) VALUES ('Gujarat',		@inactiv_eff_frm, @inactiv_eff_til);
INSERT INTO initiation_places (place_nm, effective_from, effective_till) VALUES ('Gwalior',		@inactiv_eff_frm, @inactiv_eff_til);
INSERT INTO initiation_places (place_nm, effective_from, effective_till) VALUES ('HongKong',		@inactiv_eff_frm, @inactiv_eff_til);
INSERT INTO initiation_places (place_nm, effective_from, effective_till) VALUES ('Jaipur',			@inactiv_eff_frm, @inactiv_eff_til);
INSERT INTO initiation_places (place_nm, effective_from, effective_till) VALUES ('Jakarta',		@inactiv_eff_frm, @inactiv_eff_til);
INSERT INTO initiation_places (place_nm, effective_from, effective_till) VALUES ('Jamshedpur',		@inactiv_eff_frm, @inactiv_eff_til);
INSERT INTO initiation_places (place_nm, effective_from, effective_till) VALUES ('Karachi',		@inactiv_eff_frm, @inactiv_eff_til);
INSERT INTO initiation_places (place_nm, effective_from, effective_till) VALUES ('London',			@inactiv_eff_frm, @inactiv_eff_til);
INSERT INTO initiation_places (place_nm, effective_from, effective_till) VALUES ('Nagpur',			@inactiv_eff_frm, @inactiv_eff_til);
INSERT INTO initiation_places (place_nm, effective_from, effective_till) VALUES ('New Zealand',	@inactiv_eff_frm, @inactiv_eff_til);
INSERT INTO initiation_places (place_nm, effective_from, effective_till) VALUES ('NOT KNOWN',		@inactiv_eff_frm, @inactiv_eff_til);
INSERT INTO initiation_places (place_nm, effective_from, effective_till) VALUES ('Raipur',			@inactiv_eff_frm, @inactiv_eff_til);
INSERT INTO initiation_places (place_nm, effective_from, effective_till) VALUES ('San Francisco',	@inactiv_eff_frm, @inactiv_eff_til);
INSERT INTO initiation_places (place_nm, effective_from, effective_till) VALUES ('Sangli',			@inactiv_eff_frm, @inactiv_eff_til);
INSERT INTO initiation_places (place_nm, effective_from, effective_till) VALUES ('Sidhpur',		@inactiv_eff_frm, @inactiv_eff_til);
INSERT INTO initiation_places (place_nm, effective_from, effective_till) VALUES ('Spain',			@inactiv_eff_frm, @inactiv_eff_til);
INSERT INTO initiation_places (place_nm, effective_from, effective_till) VALUES ('TO BE SPECIFIED',@inactiv_eff_frm, @inactiv_eff_til);

INSERT INTO satsang_centres	(satsang_centre_cd, satsang_centre_nm, satsang_centre_type, address_line_1, district_or_city_id, effective_from, effective_till)
	SELECT	'0', 'KOLHAPUR', 'CENTRE', 'TO BE SPECIFIED', district_or_city_id, @active_eff_from, @active_eff_till FROM districts_or_cities 
	WHERE district_nm = 'KOLHAPUR';
UPDATE satsang_centres SET satsang_centre_cd = satsang_centre_id WHERE satsang_centre_nm = 'KOLHAPUR';

INSERT INTO satsang_centres (satsang_centre_cd, satsang_centre_nm, satsang_centre_type, address_line_1, district_or_city_id, effective_from, effective_till)
	SELECT	'0', 'Singapore', 'CENTRE', 'TO BE SPECIFIED', district_or_city_id, @active_eff_from, @active_eff_till FROM districts_or_cities 
	WHERE district_nm = 'Singapore';
UPDATE satsang_centres SET satsang_centre_cd = satsang_centre_id WHERE satsang_centre_nm = 'Singapore';

INSERT INTO satsang_centres (satsang_centre_cd, satsang_centre_nm, satsang_centre_type, address_line_1, district_or_city_id, effective_from, effective_till)
	SELECT	'0', 'San Francisco', 'CENTRE', 'TO BE SPECIFIED', district_or_city_id, @active_eff_from, @active_eff_till FROM districts_or_cities 
	WHERE district_nm = 'San Francisco';
UPDATE satsang_centres SET satsang_centre_cd = satsang_centre_id WHERE satsang_centre_nm = 'San Francisco';

INSERT INTO satsang_centres (satsang_centre_cd, satsang_centre_nm, satsang_centre_type, address_line_1, district_or_city_id, effective_from, effective_till)
	SELECT	'0', 'New York', 'CENTRE', 'TO BE SPECIFIED', district_or_city_id, @active_eff_from, @active_eff_till FROM districts_or_cities 
	WHERE district_nm = 'New York';
UPDATE satsang_centres SET satsang_centre_cd = satsang_centre_id WHERE satsang_centre_nm = 'New York';

INSERT INTO satsang_centres (satsang_centre_cd, satsang_centre_nm, satsang_centre_type, address_line_1, district_or_city_id, effective_from, effective_till)
	SELECT	'0', 'Kuwait', 'CENTRE', 'TO BE SPECIFIED', district_or_city_id, @active_eff_from, @active_eff_till FROM districts_or_cities 
	WHERE district_nm = 'Kuwait';
UPDATE satsang_centres SET satsang_centre_cd = satsang_centre_id WHERE satsang_centre_nm = 'Kuwait';

INSERT INTO satsang_centres (satsang_centre_cd, satsang_centre_nm, satsang_centre_type, address_line_1, district_or_city_id, effective_from, effective_till)
	SELECT	'0', 'Bilwa', 'POINT', 'TO BE SPECIFIED', district_or_city_id, @active_eff_from, @active_eff_till FROM districts_or_cities 
	WHERE district_nm = 'BAREILLY';
UPDATE satsang_centres SET satsang_centre_cd = satsang_centre_id WHERE satsang_centre_nm = 'Bilwa';

INSERT INTO relations (relation_nm, effective_from, effective_till) VALUES ('Colleague',	@active_eff_from, @active_eff_till);
INSERT INTO relations (relation_nm, effective_from, effective_till) VALUES ('Employee',	@active_eff_from, @active_eff_till);
INSERT INTO relations (relation_nm, effective_from, effective_till) VALUES ('Employer',	@active_eff_from, @active_eff_till);
INSERT INTO relations (relation_nm, effective_from, effective_till) VALUES ('Friend',		@active_eff_from, @active_eff_till);
INSERT INTO relations (relation_nm, effective_from, effective_till) VALUES ('Neighbour',	@active_eff_from, @active_eff_till);

INSERT INTO states (state_cd, state_nm, country_id, effective_from, effective_till) 
	SELECT 'DNH', 'Dadra & Nagar Haveli', country_id, @active_eff_from, @active_eff_till FROM countries WHERE country_nm = 'India';

UPDATE s SET state_nm = 'Daman & Diu' FROM states s JOIN countries c ON c.country_id = s.country_id WHERE c.country_nm = 'India' AND s.state_nm = 'Daman &  Deo';

UPDATE s SET effective_till = @inactiv_eff_til FROM states s JOIN countries c ON c.country_id = s.country_id
	WHERE s.state_nm = 'Andeman & Nicobar Islands' AND c.country_nm = 'India'; -- Another entry exists with name ANDAMAN & NICOBAR

INSERT INTO districts_or_cities (district_cd, district_nm, state_id, effective_from, effective_till)
	SELECT 'DAMAN', 'DAMAN', s.state_id, @active_eff_from, @active_eff_till FROM states s JOIN countries c ON c.country_id = s.country_id 
	WHERE c.country_nm = 'India' AND s.state_nm = 'Daman & Diu';

INSERT INTO districts_or_cities (district_cd, district_nm, state_id, effective_from, effective_till)
	SELECT 'DIU', 'DIU', s.state_id, @active_eff_from, @active_eff_till FROM states s JOIN countries c ON c.country_id = s.country_id 
	WHERE c.country_nm = 'India' AND s.state_nm = 'Daman & Diu';

INSERT INTO districts_or_cities (district_cd, district_nm, state_id, effective_from, effective_till)
	SELECT 'ERODE', 'ERODE', s.state_id, @active_eff_from, @active_eff_till FROM states s JOIN countries c ON c.country_id = s.country_id 
	WHERE c.country_nm = 'India' AND s.state_nm = 'TAMIL NADU';

INSERT INTO districts_or_cities (district_cd, district_nm, state_id, effective_from, effective_till)
	SELECT 'SN', 'SIDDHARTHNAGAR', s.state_id, @active_eff_from, @active_eff_till FROM states s JOIN countries c ON c.country_id = s.country_id 
	WHERE c.country_nm = 'India' AND s.state_nm = 'UTTAR PRADESH';

INSERT INTO districts_or_cities (district_cd, district_nm, state_id, effective_from, effective_till)
	SELECT 'SAL', 'Salalah', s.state_id, @active_eff_from, @active_eff_till FROM states s JOIN countries c ON c.country_id = s.country_id 
	WHERE c.country_nm = 'Oman' AND s.state_nm = 'Oman';

INSERT INTO districts_or_cities (district_cd, district_nm, state_id, effective_from, effective_till)
	SELECT 'ANAND', 'ANAND', s.state_id, @active_eff_from, @active_eff_till FROM states s JOIN countries c ON c.country_id = s.country_id 
	WHERE c.country_nm = 'India' AND s.state_nm = 'Gujarat';

UPDATE d SET effective_till = @inactiv_eff_til FROM districts_or_cities d JOIN states s ON s.state_id = d.state_id JOIN countries c ON c.country_id = s.country_id
	WHERE d.district_nm = 'Farukhabad' AND s.state_cd = 'UP' AND c.country_nm = 'India'; -- Another entry exists with name FARRUKHABAD

UPDATE d SET effective_till = @inactiv_eff_til FROM districts_or_cities d JOIN states s ON s.state_id = d.state_id JOIN countries c ON c.country_id = s.country_id
	WHERE d.district_nm = 'Vishakhapatnam' AND s.state_cd = 'AP' AND c.country_nm = 'India'; -- Another entry exists with name VISAKHAPATNAM

UPDATE d SET state_id = s_new.state_id FROM districts_or_cities d JOIN states s ON s.state_id = d.state_id JOIN countries c ON c.country_id = s.country_id
	JOIN states s_new ON s_new.country_id = c.country_id
	WHERE d.district_nm = 'Chandigarh' AND s.state_nm = 'UNION TERRITORY' AND c.country_nm = 'India' AND s_new.state_nm = 'Chandigarh'; -- Move to Chandigarh state

UPDATE d SET state_id = s_new.state_id FROM districts_or_cities d JOIN states s ON s.state_id = d.state_id JOIN countries c ON c.country_id = s.country_id
	JOIN states s_new ON s_new.country_id = c.country_id -- Move to Dadra & Nagar Haveli state 
	WHERE d.district_nm = 'DADRA & NAGAR HAVELI' AND s.state_nm = 'UNION TERRITORY' AND c.country_nm = 'India' AND s_new.state_nm = 'Dadra & Nagar Haveli';

UPDATE d SET district_nm = 'THIRUVANANTHAPURAM' FROM districts_or_cities d JOIN states s ON s.state_id = d.state_id JOIN countries c ON c.country_id = s.country_id
	WHERE d.district_nm = 'THIRUVANANTHPURAM' AND s.state_nm = 'KERALA' AND c.country_nm = 'India';

INSERT INTO skills (skill_nm, effective_from, effective_till)
	SELECT specialisation_nm, @active_eff_from, @active_eff_till FROM SMS..specialisation_areas;

GO

