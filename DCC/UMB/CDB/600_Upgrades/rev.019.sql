
CREATE	TABLE	passport_types
(
    passport_type_id	INTEGER		NOT NULL    IDENTITY (1,1)
						    CONSTRAINT	PassportTypes_PK_PassportTypeID
							PRIMARY KEY	NONCLUSTERED,
    passport_type_cd	VARCHAR (10)	NOT NULL,
    passport_type_nm	VARCHAR (50)	NOT NULL,

    remarks		VARCHAR (500)	    NULL,

    effective_from_dt	DATE		NOT NULL,
    effective_till_dt	DATE		NOT NULL,

    txn_ts		ROWVERSION	NOT NULL,

	CONSTRAINT	PassportTypes_UK_PassportTypeCode
		UNIQUE	NONCLUSTERED	(passport_type_cd),

	CONSTRAINT	PassportTypes_UK_PassportTypeName
		UNIQUE	CLUSTERED	(passport_type_nm),

	CONSTRAINT	PassportTypes_CK_EffectiveFrom_EffectiveTillDate
		CHECK	(effective_from_dt <= effective_till_dt)
)
GO


INSERT	INTO	passport_types
	    (	passport_type_cd, passport_type_nm, effective_from_dt, effective_till_dt	)
    VALUES
	    (	'R',	'Regular Passport',		GetDate(), '31-Dec-9999'	),
	    (	'PIO',	'Person of Indian Origin',	GetDate(), '31-Dec-9999'	),
	    (	'OCI',	'Overseas Citizen of India',	GetDate(), '31-Dec-9999'	),
	    (	'UN',	'United Nations Passport',	GetDate(), '31-Dec-9999'	),
	    (	'D',	'Diplomat Passport',		GetDate(), '31-Dec-9999'	),
	    (	'O',	'Official Passport',		GetDate(), '31-Dec-9999'	);


    --	These are typically used for Passports and Visas
CREATE	TABLE	document_issue_places
(
    document_issue_place_id	INTEGER		NOT NULL    IDENTITY (1,1)
							    CONSTRAINT	DocumentIssuePlaces_PK_DocumentIssuePlaceID
								PRIMARY KEY	NONCLUSTERED,
    document_issue_place_nm	VARCHAR (50)	NOT NULL,

    document_issue_country_id	country_id	    NULL    CONSTRAINT	DocumentIssuePlaces_FK_DocumentIssueCountryID
								REFERENCES	countries,
    remarks			VARCHAR (500)	    NULL,

    effective_from_dt		DATE		NOT NULL,
    effective_till_dt		DATE		NOT NULL,

    txn_ts			ROWVERSION	NOT NULL,
    audit_log_id		INTEGER		NOT NULL    CONSTRAINT	DocumentIssuePlaces_FK_AuditLogID
								REFERENCES	audit_logs,

	CONSTRAINT	DocumentIssuePlaces_UK_DocumentIssuePlaceName_DocumentIssueCountryID
		UNIQUE	CLUSTERED	(document_issue_place_nm, document_issue_country_id),

	CONSTRAINT	DocumentIssuePlaces_CK_EffectiveFrom_EffectiveTillDate
		CHECK	(effective_from_dt <= effective_till_dt)
)
GO

INSERT INTO	document_issue_places
	(	document_issue_place_nm, document_issue_country_id, effective_from_dt, effective_till_dt, audit_log_id	)
    VALUES
	(	'New Delhi',			1,			GetDate(), '31 Dec 9999',		2	),		-- India
	(	'Toronto',			14,			GetDate(), '31 Dec 9999',		2	),		-- Canada; we did not find any data for Ottawa
	(	'Dubai',			21,			GetDate(), '31 Dec 9999',		2	),		-- UAE; there is no data in FRRO
	(	'Hong Kong',			33,			GetDate(), '31 Dec 9999',		2	),		-- Hong Kong; there is no data in FRRO
	(	'Wellington',			35,			GetDate(), '31 Dec 9999',		2	),		-- Indonesia
	(	'Jakarta',			59,			GetDate(), '31 Dec 9999',		2	),		-- New Zealand
	(	'Cape Town',			74,			GetDate(), '31 Dec 9999',		2	),		-- South Africa
	(	'London',			85,			GetDate(), '31 Dec 9999',		2	),		-- UK
	(	'Washington D.C.',		86,			GetDate(), '31 Dec 9999',		2	),		-- USA
	(	'Muscat',			95,			GetDate(), '31 Dec 9999',		2	),		-- Oman
	(	'Doha',				99,			GetDate(), '31 Dec 9999',		2	);		-- Qatar

-- =============================================================================
--	Table document_types
-- =============================================================================
ALTER	TABLE	document_types
    ADD	document_type_cd	VARCHAR (10)	NULL
GO


UPDATE	document_types SET document_type_cd = 'Aadhaar'		WHERE document_type_nm = 'Aadhaar Card';
UPDATE	document_types SET document_type_cd = 'Passport'	WHERE document_type_nm = 'Passport';
UPDATE	document_types SET document_type_cd = 'DL'		WHERE document_type_nm = 'Driving License';
UPDATE	document_types SET document_type_cd = 'PAN'		WHERE document_type_nm = 'IT PAN Card';
UPDATE	document_types SET document_type_cd = 'Ration'		WHERE document_type_nm = 'Ration Card';
UPDATE	document_types SET document_type_cd = 'Voter'		WHERE document_type_nm = 'Voter ID Card';
UPDATE	document_types SET document_type_cd = 'Birth'		WHERE document_type_nm = 'Birth Certificate';
UPDATE	document_types SET document_type_cd = 'Marriage'	WHERE document_type_nm = 'Marriage Certificate';
UPDATE	document_types SET document_type_cd = 'Death'		WHERE document_type_nm = 'Death Certificate';
UPDATE	document_types SET document_type_cd = 'RentA'		WHERE document_type_nm = 'Rent Agreement';
UPDATE	document_types SET document_type_cd = 'Affidavit'	WHERE document_type_nm = 'Affidavit';


ALTER	TABLE	document_types
    ALTER COLUMN	document_type_cd	VARCHAR (10)	NOT NULL

ALTER	TABLE	document_types
    ADD	CONSTRAINT	DocumentTypes_UK_DocumentCode
	UNIQUE	NONCLUSTERED	(	document_type_cd	);
GO

-- =============================================================================

-- vim:ts=8 ht=8
