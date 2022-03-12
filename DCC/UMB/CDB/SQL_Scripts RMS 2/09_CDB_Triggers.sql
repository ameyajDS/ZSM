/* ==================================================================================
    Source File		:	triggers.sql
    Author(s)		:	Kavita Rajdeo, Sukhdev B. Darira, Jitendra Loyal
    Started On		:	Tue Sep 30 15:31:25 IST 2008
    Version			:	0.05
    Last updated	:	Feb 28, 2010
    Module ID		:	RMS (Residents Management System)
    Language		:	TRANSACT-SQL
    Reviewed By		:	Jitendra Loyal
    Reviewed On		:	
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Triggers in CDB defined for RMS
    ==================================================================================
								      								  Revision History
    ----------------------------------------------------------------------------------
	JL : 28-Feb_2010
		Trigger on Satsang Centres has been commented as we will be taking an
		approach to NOT to allow DELETEs in CDB.
    ==================================================================================*/

--USE CDB

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

-- =============================================================================
--	All Referential Integrity Triggers for CDB tables
-- =============================================================================

-- =============================================================================
--	Table 	PERSON_TITLES
--	A trigger in CDB ensures that UPDATE (PK) / DELETE in CDB is prevented
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'person_titles_a_du' AND xtype = 'TR')
	DROP TRIGGER person_titles_a_du
GO

CREATE TRIGGER person_titles_a_du ON person_titles
	WITH ENCRYPTION 
		FOR UPDATE, DELETE
AS
DECLARE
	@v_faults							VARCHAR (500),
	@v_left								TINYINT
BEGIN
	SET		@v_faults = ''

	
	IF	(	(UPDATE (person_title)) 	OR 	((SELECT COUNT(*) FROM inserted ) = 0)	)
	BEGIN
		SELECT 	@v_faults = CAST (d.person_title AS VARCHAR) + ', ' + @v_faults
		FROM 	deleted d 
			JOIN	RMS..persons p
				ON 	(	d.person_title 	= 	p.title	)					

		IF	(	LEN (@v_faults) > 0	)	
		BEGIN
			SET	@v_left		= ((50 + (LEN (@v_faults)-1) - ABS (50 - (LEN (@v_faults)-1))) / 2)

			IF	(	@v_left	= 50	)
				SET	@v_faults = LEFT (@v_faults, 51 - (CHARINDEX (',', REVERSE (@v_faults)))) + '...'		
			ELSE
				SET	@v_faults	= LEFT (@v_faults, @v_left)
				
			EXEC SysAdmin..RaiseErrorMessage 'ForeignKeyConstraint2', NULL, 'Title(s)', @v_faults, 'persons (RMS)'
			RETURN
		END
	END
END
GO
-- =============================================================================

-- =============================================================================
--	Table 	MARITAL_STATUS
--	A trigger in CDB ensures that the UPDATE (PK) / DELETE in CDB is prevented.
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'marital_status_a_du' AND xtype = 'TR')
	DROP TRIGGER marital_status_a_du
GO

CREATE TRIGGER marital_status_a_du ON marital_status
	WITH ENCRYPTION 
		FOR UPDATE, DELETE
AS
DECLARE
	@v_faults							VARCHAR (500),
	@v_left								TINYINT
BEGIN
	SET		@v_faults = ''

	IF	(	(UPDATE (marital_status)) 	OR 	((SELECT COUNT(*) FROM inserted ) = 0)	)
	BEGIN
		SELECT 	@v_faults = CAST (d.marital_status AS VARCHAR) + ', ' + @v_faults
		FROM 	deleted d 
			JOIN	RMS..persons p
				ON 	(	d.marital_status = p.marital_status	)					

		IF	(	LEN (@v_faults) > 0	)
		BEGIN
			SET	@v_left		= ((50 + (LEN (@v_faults)-1) - ABS (50 - (LEN (@v_faults)-1))) / 2)

			IF	(	@v_left	= 50 	)
				SET	@v_faults = LEFT (@v_faults, 51 - (CHARINDEX (',', REVERSE (@v_faults)))) + '...'		
			ELSE
				SET	@v_faults	= LEFT (@v_faults, @v_left)
				
			EXEC SysAdmin..RaiseErrorMessage 'ForeignKeyConstraint2', NULL, 'Marital Status', @v_faults, 'persons (RMS)'
			RETURN
		END
	END
END
GO
-- =============================================================================

-- =============================================================================
--	Table 	DESIGNATIONS
--	A trigger in CDB ensures that UPDATE (PK) / DELETE in CDB is prevented
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'designations_a_du' AND xtype = 'TR')
	DROP TRIGGER designations_a_du
GO

CREATE TRIGGER designations_a_du ON designations
	WITH ENCRYPTION 
		FOR UPDATE, DELETE
AS
DECLARE
	@v_ref_by			VARCHAR (500),
	@v_left				TINYINT
BEGIN
	SET	@v_ref_by = ''

	IF	(	(UPDATE (designation_id)) 	OR 	((SELECT COUNT(*) FROM inserted ) = 0)	)
	BEGIN

		-- checking if this table is being referred by RMS..sewadars
		IF 	EXISTS	(	SELECT	TOP 1 1
						FROM	deleted d
							JOIN	RMS..sewadars s
								ON (	d.designation_id = s.designation_id	)
					)
			BEGIN
				SET	@v_ref_by = 'sewadars (RMS)'
			END

		-- checking if this table is being referred by RMS..notification_sewadars
		IF 	EXISTS	(	SELECT	TOP 1 1
						FROM	deleted d
							JOIN	RMS..notification_sewadars ns
								ON (	d.designation_id = ns.designation_id	)
					)
			BEGIN
				SET	@v_ref_by = @v_ref_by + ', ' + 'notification_sewadars (RMS)'
			END

		-- checking if this table is being referred by RMS..notification_addressee_place_holders
		IF 	EXISTS	(	SELECT	TOP 1 1
						FROM	deleted d
							JOIN	RMS..notification_addressee_place_holders naph
								ON (	d.designation_id = naph.designation_id	)
					)
			BEGIN
				SET	@v_ref_by = @v_ref_by + ', ' + 'notification_addressee_place_holders (RMS)'
			END		
	END

	IF	(	LEN (@v_ref_by) > 0	)
	BEGIN
		SET	@v_left		= ((	50 + LEN (@v_ref_by) - ABS (50 - LEN (@v_ref_by))	) / 2)

		IF	(	@v_left	= 50 	) 
			SET	@v_ref_by = LEFT (@v_ref_by, 50 - (CHARINDEX (',', REVERSE (@v_ref_by)))) + '...'		
		ELSE
			SET	@v_ref_by = LEFT (@v_ref_by, @v_left)		

		EXEC SysAdmin..RaiseErrorMessage 'ForeignKeyConstraint1', NULL, 'Designation(s)', @v_ref_by, NULL
		RETURN
	END
END
GO
-- =============================================================================

-- =============================================================================
--	Table 	SEWADAR_TYPES
--	A trigger in CDB ensures that UPDATE (PK) / DELETE in CDB is prevented
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadar_types_a_du' AND xtype = 'TR')
	DROP TRIGGER sewadar_types_a_du
GO

CREATE TRIGGER sewadar_types_a_du ON sewadar_types
	WITH ENCRYPTION 
		FOR UPDATE, DELETE
AS
DECLARE
	@v_ref_by			VARCHAR (500),
	@v_left				TINYINT
BEGIN
	SET	@v_ref_by = ''

	IF	(	(UPDATE (sewadartype_id)) 	OR 	((SELECT COUNT(*) FROM inserted ) = 0)	)
	BEGIN

		-- checking if this table is being referred by RMS..sewadars
		IF 	EXISTS	(	SELECT	TOP 1 1
						FROM	deleted d
							JOIN	RMS..sewadars s
								ON (	d.sewadartype_id = s.sewadar_type_id	)
					)
			BEGIN
				SET	@v_ref_by = 'sewadars (RMS)'
			END

		-- checking if this table is being referred by RMS..id_card_templates
		IF 	EXISTS	(	SELECT	TOP 1 1
						FROM	deleted d
							JOIN	RMS..id_card_templates ict
								ON (	d.sewadartype_id = ict.sewadar_type_id	)
					)
			BEGIN
				SET	@v_ref_by = @v_ref_by + ', ' + 'id_card_templates (RMS)'
			END

		-- checking if this table is being referred by RMS..notification_sewadars
		IF 	EXISTS	(	SELECT	TOP 1 1
						FROM	deleted d
							JOIN	RMS..notification_sewadars ns
								ON (	d.sewadartype_id = ns.sewadar_type_id	)
					)
			BEGIN
				SET	@v_ref_by = @v_ref_by + ', ' + 'notification_sewadars (RMS)'
			END		

		-- checking if this table is being referred by RMS..notification_addressee_place_holders
		IF 	EXISTS	(	SELECT	TOP 1 1
						FROM	deleted d
							JOIN	RMS..notification_addressee_place_holders naph
								ON (	d.sewadartype_id = naph.sewadar_type_id	)
					)
			BEGIN
				SET	@v_ref_by = @v_ref_by + ', ' + 'notification_addressee_place_holders (RMS)'
			END		
	END

	IF	(	LEN (@v_ref_by) > 0	)
	BEGIN
		SET	@v_left		= ((	50 + LEN (@v_ref_by) - ABS (50 - LEN (@v_ref_by))	) / 2)

		IF	(	@v_left	= 50 	) 
			SET	@v_ref_by = LEFT (@v_ref_by, 50 - (CHARINDEX (',', REVERSE (@v_ref_by)))) + '...'		
		ELSE
			SET	@v_ref_by = LEFT (@v_ref_by, @v_left)		

		EXEC SysAdmin..RaiseErrorMessage 'ForeignKeyConstraint1', NULL, 'Sewadar Type(s)', @v_ref_by, NULL
		RETURN
	END
END
GO
-- =============================================================================
-- =============================================================================
--	Table 	DOCUMENT_TYPES
--	A trigger in CDB ensures that UPDATE (PK) / DELETE in CDB is prevented
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'document_types_a_du' AND xtype = 'TR')
	DROP TRIGGER document_types_a_du
GO

CREATE TRIGGER document_types_a_du ON document_types
	WITH ENCRYPTION 
		FOR UPDATE, DELETE
AS
DECLARE
	@v_ref_by			VARCHAR (500),
	@v_left				TINYINT
BEGIN
	SET	@v_ref_by = ''

	IF	(	(UPDATE (document_type_id)) 	OR 	((SELECT COUNT(*) FROM inserted ) = 0)	)
	BEGIN

		-- checking if this table is being referred by RMS..
		IF 	EXISTS	(	SELECT	TOP 1 1
						FROM	deleted d
							JOIN	RMS..persons_documents pd
								ON (	d.document_type_id = pd.document_type_id)
					)
			BEGIN
				SET	@v_ref_by = 'persons_documents (RMS)'
			END

	END

	IF	(	LEN (@v_ref_by) > 0	)
	BEGIN
		SET	@v_left		= ((	50 + LEN (@v_ref_by) - ABS (50 - LEN (@v_ref_by))	) / 2)

		IF	(	@v_left	= 50 	) 
			SET	@v_ref_by = LEFT (@v_ref_by, 50 - (CHARINDEX (',', REVERSE (@v_ref_by)))) + '...'		
		ELSE
			SET	@v_ref_by = LEFT (@v_ref_by, @v_left)		

		EXEC SysAdmin..RaiseErrorMessage 'ForeignKeyConstraint1', NULL, 'Document Type(s)', @v_ref_by, NULL
		RETURN
	END
END
GO
-- =============================================================================

-- =============================================================================
--	Table 	RELATIONS
--	A trigger in CDB ensures that UPDATE (PK) / DELETE in CDB is prevented
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'relations_a_du' AND xtype = 'TR')
	DROP TRIGGER relations_a_du
GO

CREATE TRIGGER relations_a_du ON relations
	WITH ENCRYPTION 
		FOR UPDATE, DELETE
AS
DECLARE
	@v_ref_by			VARCHAR (500),
	@v_left				TINYINT
BEGIN
	SET	@v_ref_by = ''

	IF	(	(UPDATE (relation_id)) 	OR 	((SELECT COUNT(*) FROM inserted ) = 0)	)
	BEGIN
		-- checking if this table is being referred by RMS..persons
		IF 	EXISTS	(	SELECT	TOP 1 1
						FROM	deleted d
							JOIN	RMS..persons	p
								ON (	d.relation_id = p.next_of_kin_relation_id	)
					)
			BEGIN
				SET	@v_ref_by = 'persons (RMS)'
			END

		-- checking if this table is being referred by RMS..persons_relatives_in_sewa
		IF 	EXISTS	(	SELECT	TOP 1 1
						FROM	deleted d
							JOIN	RMS..persons_relatives_in_sewa pris
								ON (	d.relation_id = pris.relation_id)
					)
			BEGIN
				SET	@v_ref_by =  @v_ref_by + ', ' + 'persons_relatives_in_sewa (RMS)'
			END

		-- checking if this table is being referred by RMS..persons_dependants
		IF 	EXISTS	(	SELECT	TOP 1 1
						FROM	deleted d
							JOIN	RMS..persons_dependants pd
								ON (	d.relation_id = pd.relationship_id)
					)
			BEGIN
				SET	@v_ref_by =  @v_ref_by + ', ' + 'persons_dependants (RMS)'
			END
	END

	IF	(	LEN (@v_ref_by) > 0	)
	BEGIN
		SET	@v_left		= ((	50 + LEN (@v_ref_by) - ABS (50 - LEN (@v_ref_by))	) / 2)

		IF	(	@v_left	= 50 	) 
			SET	@v_ref_by = LEFT (@v_ref_by, 50 - (CHARINDEX (',', REVERSE (@v_ref_by)))) + '...'		
		ELSE
			SET	@v_ref_by = LEFT (@v_ref_by, @v_left)		

		EXEC SysAdmin..RaiseErrorMessage 'ForeignKeyConstraint1', NULL, 'Relation(s)', @v_ref_by, NULL
		RETURN
	END
END
GO
-- =============================================================================

-- =============================================================================
--	Table 	SKILLS
--	A trigger in CDB ensures that UPDATE (PK) / DELETE in CDB is prevented
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'skills_a_du' AND xtype = 'TR')
	DROP TRIGGER skills_a_du
GO

CREATE TRIGGER skills_a_du ON skills
	WITH ENCRYPTION 
		FOR UPDATE, DELETE
AS
DECLARE
	@v_ref_by			VARCHAR (500),
	@v_left				TINYINT
BEGIN
	SET	@v_ref_by = ''

	IF	(	(UPDATE (skill_id)) 	OR 	((SELECT COUNT(*) FROM inserted ) = 0)	)
	BEGIN

		-- checking if this table is being referred by RMS..persons_skills
		IF 	EXISTS	(	SELECT	TOP 1 1
						FROM	deleted d
							JOIN	RMS..persons_skills ps
								ON (	d.skill_id = ps.skill_id	)
					)
			BEGIN
				SET	@v_ref_by = 'persons_skills (RMS)'
			END
	END

	IF	(	LEN (@v_ref_by) > 0	)
	BEGIN
		SET	@v_left		= ((	50 + LEN (@v_ref_by) - ABS (50 - LEN (@v_ref_by))	) / 2)

		IF	(	@v_left	= 50 	) 
			SET	@v_ref_by = LEFT (@v_ref_by, 50 - (CHARINDEX (',', REVERSE (@v_ref_by)))) + '...'		
		ELSE
			SET	@v_ref_by = LEFT (@v_ref_by, @v_left)		

		EXEC SysAdmin..RaiseErrorMessage 'ForeignKeyConstraint1', NULL, 'Skill(s)', @v_ref_by, NULL
		RETURN
	END
END
GO
-- =============================================================================

-- =============================================================================
--	Table 	CURRENCIES
--	A trigger in CDB ensures that UPDATE (PK) / DELETE in CDB is prevented
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'currencies_a_du' AND xtype = 'TR')
	DROP TRIGGER currencies_a_du
GO

CREATE TRIGGER currencies_a_du ON currencies
	WITH ENCRYPTION 
		FOR UPDATE, DELETE
AS
DECLARE
	@v_ref_by			VARCHAR (500),
	@v_left				TINYINT
BEGIN
	SET	@v_ref_by = ''

	IF	(	(UPDATE (currency_id)) 	OR 	((SELECT COUNT(*) FROM inserted ) = 0)	)
	BEGIN

		-- checking if this table is being referred by RMS..persons
		IF 	EXISTS	(	SELECT	TOP 1 1
						FROM	deleted d
							JOIN	RMS..persons p
								ON (	d.currency_id = p.currency_id	)
					)
			BEGIN
				SET	@v_ref_by = 'persons (RMS)'
			END
	END

	IF	(	LEN (@v_ref_by) > 0	)
	BEGIN
		SET	@v_left		= ((	50 + LEN (@v_ref_by) - ABS (50 - LEN (@v_ref_by))	) / 2)

		IF	(	@v_left	= 50 	) 
			SET	@v_ref_by = LEFT (@v_ref_by, 50 - (CHARINDEX (',', REVERSE (@v_ref_by)))) + '...'		
		ELSE
			SET	@v_ref_by = LEFT (@v_ref_by, @v_left)		

		EXEC SysAdmin..RaiseErrorMessage 'ForeignKeyConstraint1', NULL, 'Currency(ies)', @v_ref_by, NULL
		RETURN
	END
END
GO
-- =============================================================================

-- =============================================================================
--	Table 	QLFCTN_SUBJECTS
--	A trigger ensures effective_from (if updated) is earlier than the qualifications_qlfctn_subjects.effective_from, if any
--	A trigger ensures effective_till (if updated) is later than the qualifications_qlfctn_subjects.effective_till, if any
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'qlfctn_subjects_a_u' AND xtype = 'TR')
	DROP TRIGGER qlfctn_subjects_a_u
GO

CREATE TRIGGER qlfctn_subjects_a_u ON qlfctn_subjects
	WITH ENCRYPTION
   		FOR UPDATE
AS
BEGIN
	IF UPDATE (effective_from)
		IF 	EXISTS	(	SELECT	TOP 1 1
						FROM	inserted i
							JOIN	qualifications_qlfctn_subjects q
								ON	(	i.qlfctn_subject_id = q.qlfctn_subject_id	)
						WHERE	i.effective_from > q.effective_from
					)
			BEGIN
				EXEC SysAdmin..RaiseErrorMessage 'InvalidEntry', NULL, 'Effective From', NULL, NULL
				RETURN
			END

	IF UPDATE (effective_till)
		IF 	EXISTS	(	SELECT	TOP 1 1
						FROM	inserted i
							JOIN	qualifications_qlfctn_subjects q
								ON	(	i.qlfctn_subject_id = q.qlfctn_subject_id	)
						WHERE	i.effective_till < q.effective_till
					)
			BEGIN
				EXEC SysAdmin..RaiseErrorMessage 'InvalidEntry', NULL, 'Effective Till', NULL, NULL
				RETURN
			END
END
GO


-- =============================================================================
--	Table 	Qualifications
--	A trigger ensures effective_from (if updated) is earlier than the qualifications_qlfctn_subjects.effective_from, if any
--	A trigger ensures effective_till (if updated) is later than the qualifications_qlfctn_subjects.effective_till, if any
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'qualifications_a_u' AND xtype = 'TR')
	DROP TRIGGER qualifications_a_u
GO

CREATE TRIGGER qualifications_a_u ON qualifications
	WITH ENCRYPTION
   		FOR UPDATE
AS
BEGIN
	IF UPDATE (effective_from)
		IF 	EXISTS	(	SELECT	TOP 1 1
						FROM	inserted i
							JOIN	qualifications_qlfctn_subjects q
								ON	(	i.qualification_id = q.qualification_id	)
						WHERE	i.effective_from > q.effective_from
					)
			BEGIN
				EXEC SysAdmin..RaiseErrorMessage 'InvalidEntry', NULL, 'Effective From', NULL, NULL
				RETURN
			END

	IF UPDATE (effective_till)
		IF 	EXISTS	(	SELECT	TOP 1 1
						FROM	inserted i
							JOIN	qualifications_qlfctn_subjects q
								ON	(	i.qualification_id = q.qualification_id	)
						WHERE	i.effective_till < q.effective_till
					)
			BEGIN
				EXEC SysAdmin..RaiseErrorMessage 'InvalidEntry', NULL, 'Effective Till', NULL, NULL
				RETURN
			END
END
GO

-- =============================================================================
--	Table 	QUALIFICATIONS
--	A trigger in CDB ensures that UPDATE (PK) / DELETE in CDB is prevented
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'qualifications_b_du' AND xtype = 'TR')
	DROP TRIGGER qualifications_b_du
GO

CREATE TRIGGER qualifications_b_du ON qualifications
	WITH ENCRYPTION 
		FOR UPDATE, DELETE
AS
DECLARE
	@v_ref_by			VARCHAR (500),
	@v_left				TINYINT
BEGIN
	SET	@v_ref_by = ''

	IF	(	(UPDATE (qualification_id)) 	OR 	((SELECT COUNT(*) FROM inserted ) = 0)	)
	BEGIN

		-- checking if this table is being referred by RMS..persons_qualifications
		IF 	EXISTS	(	SELECT	TOP 1 1
						FROM	deleted d
							JOIN	RMS..persons_qualifications pq
								ON (	d.qualification_id = pq.qualification_id	)
					)
			BEGIN
				SET	@v_ref_by = 'persons_qualifications (RMS)'
			END
	END

	IF	(	LEN (@v_ref_by) > 0	)
	BEGIN
		SET	@v_left		= ((	50 + LEN (@v_ref_by) - ABS (50 - LEN (@v_ref_by))	) / 2)

		IF	(	@v_left	= 50 	) 
			SET	@v_ref_by = LEFT (@v_ref_by, 50 - (CHARINDEX (',', REVERSE (@v_ref_by)))) + '...'		
		ELSE
			SET	@v_ref_by = LEFT (@v_ref_by, @v_left)		

		EXEC SysAdmin..RaiseErrorMessage 'ForeignKeyConstraint1', NULL, 'Qualification(s)', @v_ref_by, NULL
		RETURN
	END
END
GO
-- =============================================================================

-- =============================================================================
--	Table 	Qualification Subjects
--	Trigger ensures:
---				(a) effective_from is not earlier than the [qlfctn_subjects|qualifications].effective_from, if any
---				(b) effective_till (if updated) is earlier than the [qlfctn_subjects|qualifications].effective_till, if any
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'qualifications_qlfctn_subjects_a_iu' AND xtype = 'TR')
	DROP TRIGGER qualifications_qlfctn_subjects_a_iu
GO

CREATE TRIGGER qualifications_qlfctn_subjects_a_iu ON qualifications_qlfctn_subjects
	WITH ENCRYPTION
   		FOR INSERT, UPDATE
AS
BEGIN
	IF UPDATE (effective_from)
		IF 	EXISTS	(	SELECT	TOP 1 1
						FROM	inserted i
							JOIN	qualifications q
								ON	(	i.qualification_id = q.qualification_id	)
							JOIN	qlfctn_subjects s
								ON	(	i.qlfctn_subject_id = s.qlfctn_subject_id	)
						WHERE	i.effective_from < q.effective_from
						OR 		i.effective_from < s.effective_from
					)
			BEGIN
				EXEC SysAdmin..RaiseErrorMessage 'InvalidEntry', NULL, 'Effective From', NULL, NULL
				RETURN
			END

	IF UPDATE (effective_till)
		IF 	EXISTS	(	SELECT	TOP 1 1
						FROM	inserted i
							JOIN	qualifications q
								ON	(	i.qualification_id = q.qualification_id	)
							LEFT JOIN	qlfctn_subjects s
								ON	(	i.qlfctn_subject_id = s.qlfctn_subject_id	)
						WHERE	i.effective_till > q.effective_till
						OR		i.effective_till > s.effective_till
					)
			BEGIN
				EXEC SysAdmin..RaiseErrorMessage 'InvalidEntry', NULL, 'Effective Till', NULL, NULL
				RETURN
			END
END
GO
-- =============================================================================


-- =============================================================================
--	Table 	QUALIFICATIONS_QLFCTN_SUBJECTS
--	A trigger in CDB ensures that UPDATE (PK) / DELETE in CDB is prevented
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'qualifications_qlfctn_subjects_b_du' AND xtype = 'TR')
	DROP TRIGGER qualifications_qlfctn_subjects_b_du
GO

CREATE TRIGGER qualifications_qlfctn_subjects_b_du ON qualifications_qlfctn_subjects
	WITH ENCRYPTION 
		FOR UPDATE, DELETE
AS
DECLARE
	@v_ref_by			VARCHAR (500),
	@v_left				TINYINT
BEGIN
	SET	@v_ref_by = ''

	IF	(	(UPDATE (qualification_id)) 	OR (UPDATE (qlfctn_subject_id))	OR 	((SELECT COUNT(*) FROM inserted ) = 0)	)
	BEGIN

		-- checking if this table is being referred by RMS..persons_qualifications
		IF 	EXISTS	(	SELECT	TOP 1 1
						FROM	deleted d
							JOIN	RMS..persons_qualifications pq
								ON 	(	d.qualification_id = pq.qualification_id
									AND	d.qlfctn_subject_id = pq.qlfctn_subject_id	
									)
					)
			BEGIN
				SET	@v_ref_by = 'persons_qualifications (RMS)'
			END
	END

	IF	(	LEN (@v_ref_by) > 0	)
	BEGIN
		SET	@v_left		= ((	50 + LEN (@v_ref_by) - ABS (50 - LEN (@v_ref_by))	) / 2)

		IF	(	@v_left	= 50 	) 
			SET	@v_ref_by = LEFT (@v_ref_by, 50 - (CHARINDEX (',', REVERSE (@v_ref_by)))) + '...'		
		ELSE
			SET	@v_ref_by = LEFT (@v_ref_by, @v_left)		

		EXEC SysAdmin..RaiseErrorMessage 'ForeignKeyConstraint1', NULL, 'Qualification Subject(s)', @v_ref_by, NULL
		RETURN
	END
END
GO
-- =============================================================================

-- =============================================================================
--	Table 	ADDRESS_TYPES
--	A trigger in CDB ensures that UPDATE (PK) / DELETE in CDB is prevented
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'address_types_a_du' AND xtype = 'TR')
	DROP TRIGGER address_types_a_du
GO

CREATE TRIGGER address_types_a_du ON address_types
	WITH ENCRYPTION 
		FOR UPDATE, DELETE
AS
DECLARE
	@v_ref_by			VARCHAR (500),
	@v_left				TINYINT
BEGIN
	SET	@v_ref_by = ''

	IF	(	(UPDATE (address_type_id)) 	OR	((SELECT COUNT(*) FROM inserted ) = 0)	)
	BEGIN

		-- checking if this table is being referred by RMS..persons_addresses
		IF 	EXISTS	(	SELECT	TOP 1 1
						FROM	deleted d
							JOIN	RMS..persons_addresses pa
								ON (	d.address_type_id = pa.address_type_id	)
					)
			BEGIN
				SET	@v_ref_by = 'persons_addresses (RMS)'
			END
	END

	IF	(	LEN (@v_ref_by) > 0	)
	BEGIN
		SET	@v_left		= ((	50 + LEN (@v_ref_by) - ABS (50 - LEN (@v_ref_by))	) / 2)

		IF	(	@v_left	= 50 	) 
			SET	@v_ref_by = LEFT (@v_ref_by, 50 - (CHARINDEX (',', REVERSE (@v_ref_by)))) + '...'		
		ELSE
			SET	@v_ref_by = LEFT (@v_ref_by, @v_left)		

		EXEC SysAdmin..RaiseErrorMessage 'ForeignKeyConstraint1', NULL, 'Address Type(s)', @v_ref_by, NULL
		RETURN
	END
END
GO
-- =============================================================================

-- =============================================================================
--	Table 	DISTRICTS_OR_CITIES
--	A trigger in CDB ensures that UPDATE (PK) / DELETE in CDB is prevented
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'districts_or_cities_a_du' AND xtype = 'TR')
	DROP TRIGGER districts_or_cities_a_du
GO

CREATE TRIGGER districts_or_cities_a_du ON districts_or_cities
	WITH ENCRYPTION 
		FOR UPDATE, DELETE
AS
DECLARE
	@v_ref_by			VARCHAR (500),
	@v_left				TINYINT
BEGIN
	SET	@v_ref_by = ''

	IF	(	(UPDATE (district_or_city_id)) 	OR	((SELECT COUNT(*) FROM inserted ) = 0)	)
	BEGIN

		-- checking if this table is being referred by RMS..persons_addresses
		IF 	EXISTS	(	SELECT	TOP 1 1
						FROM	deleted d
							JOIN	RMS..persons_addresses pa
								ON (	d.district_or_city_id = pa.city_id	)
					)
			BEGIN
				SET	@v_ref_by = 'persons_addresses (RMS)'
			END
	END

	IF	(	LEN (@v_ref_by) > 0	)
	BEGIN
		SET	@v_left		= ((	50 + LEN (@v_ref_by) - ABS (50 - LEN (@v_ref_by))	) / 2)

		IF	(	@v_left	= 50 	) 
			SET	@v_ref_by = LEFT (@v_ref_by, 50 - (CHARINDEX (',', REVERSE (@v_ref_by)))) + '...'		
		ELSE
			SET	@v_ref_by = LEFT (@v_ref_by, @v_left)		

		EXEC SysAdmin..RaiseErrorMessage 'ForeignKeyConstraint1', NULL, 'Districts or Cities', @v_ref_by, NULL
		RETURN
	END
END
GO
-- =============================================================================

-- =============================================================================
--	Table 	SATSANG_CENTRES
--	A trigger in CDB ensures that UPDATE (PK) / DELETE in CDB is prevented
-- =============================================================================
/* -------
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'satsang_centres_a_du' AND xtype = 'TR')
	DROP TRIGGER satsang_centres_a_du
GO

CREATE TRIGGER satsang_centres_a_du ON satsang_centres
	WITH ENCRYPTION 
		FOR UPDATE, DELETE
AS
DECLARE
	@v_ref_by			VARCHAR (500),
	@v_left				TINYINT
BEGIN
	SET	@v_ref_by = ''

	IF	(	(UPDATE (satsang_centre_id)) 	OR	((SELECT COUNT(*) FROM inserted ) = 0)	)
	BEGIN

		-- checking if this table is being referred by RMS..persons_previous_sewa_details
		IF 	EXISTS	(	SELECT	TOP 1 1
						FROM	deleted d
							JOIN	RMS..persons_previous_sewa_details ppsd
								ON (	d.satsang_centre_id = ppsd.satsang_center_id	)
					)
			BEGIN
				SET	@v_ref_by = 'persons_previous_sewa_details (RMS)'
			END
	END

	IF	(	LEN (@v_ref_by) > 0	)
	BEGIN
		SET	@v_left		= ((	50 + LEN (@v_ref_by) - ABS (50 - LEN (@v_ref_by))	) / 2)

		IF	(	@v_left	= 50 	) 
			SET	@v_ref_by = LEFT (@v_ref_by, 50 - (CHARINDEX (',', REVERSE (@v_ref_by)))) + '...'		
		ELSE
			SET	@v_ref_by = LEFT (@v_ref_by, @v_left)		

		EXEC SysAdmin..RaiseErrorMessage 'ForeignKeyConstraint1', NULL, 'Satsang Centre(s)', @v_ref_by, NULL
		RETURN
	END
END
GO
------ */
-- =============================================================================

-- =============================================================================
--	Table 	WORKING_UNIT_ENTITIES
--	A trigger in CDB ensures that UPDATE (PK) / DELETE in CDB is prevented
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'working_unit_entities_a_du' AND xtype = 'TR')
	DROP TRIGGER working_unit_entities_a_du
GO

CREATE TRIGGER working_unit_entities_a_du ON working_unit_entities
	WITH ENCRYPTION 
		FOR UPDATE, DELETE
AS
DECLARE
	@v_ref_by			VARCHAR (500),
	@v_left				TINYINT
BEGIN
	SET	@v_ref_by = ''

	IF	(	(UPDATE (entity_id)) 	OR	((SELECT COUNT(*) FROM inserted ) = 0)	)
	BEGIN

		-- checking if this table is being referred by RMS..notification_place_holders
		IF 	EXISTS	(	SELECT	TOP 1 1
						FROM	deleted d
							JOIN	RMS..notification_place_holders nph
								ON (	d.entity_id = nph.working_unit_entity_id	)
					)
			BEGIN
				SET	@v_ref_by = 'notification_place_holders (RMS)'
			END
	END

	IF	(	LEN (@v_ref_by) > 0	)
	BEGIN
		SET	@v_left		= ((	50 + LEN (@v_ref_by) - ABS (50 - LEN (@v_ref_by))	) / 2)

		IF	(	@v_left	= 50 	) 
			SET	@v_ref_by = LEFT (@v_ref_by, 50 - (CHARINDEX (',', REVERSE (@v_ref_by)))) + '...'		
		ELSE
			SET	@v_ref_by = LEFT (@v_ref_by, @v_left)		

		EXEC SysAdmin..RaiseErrorMessage 'ForeignKeyConstraint1', NULL, 'Working Unit Entity(ies)', @v_ref_by, NULL
		RETURN
	END
END
GO
-- =============================================================================

-- =============================================================================
--	All Integrity Triggers for CDB tables against CDB Tables
-- =============================================================================

-- =============================================================================
--	Table 	WORKING_UNITS
--	A trigger ensures that ensures 
	--	when is_staff_posted is set to Yes, all the levels below working_unit_id
	--	have indeed is_staff_posted set to Yes.
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'working_units_a_iu' AND xtype = 'TR')
	DROP TRIGGER working_units_a_iu
GO

CREATE TRIGGER working_units_a_iu ON working_units
	WITH ENCRYPTION
   		FOR INSERT , UPDATE
AS
DECLARE
	@v_working_unit_id				working_unit_id,
	@v_group_working_unit_id		working_unit_id,
	@v_is_staff_posted				Boolean,
	@v_start						INTEGER,
	@v_generation					INTEGER,
	@MyCursor						CURSOR

DECLARE	@v_stage					TABLE 
									(
										generation 			INTEGER, 
										working_unit_id		INTEGER, 
										is_staff_posted		VARCHAR (3)
									)
	SET	@MyCursor	= CURSOR FAST_FORWARD
	FOR
		SELECT	working_unit_id, group_working_unit_id, is_staff_posted
		FROM	inserted
		WHERE	UPPER (@v_is_staff_posted) = 'YES'
BEGIN
	-- 	cursor based implementation, just in case, the insert / update operation involved > 1 rows
	-- 	opening the cursor 
	OPEN	@MyCursor
	--	fetching the next record from cursor
	FETCH	NEXT	FROM	@MyCursor
		INTO	@v_working_unit_id, @v_group_working_unit_id, @v_is_staff_posted
	-- 	as long as some record has been fetched
	WHILE	(	@@FETCH_STATUS = 0 	)
	BEGIN
		-- 	reset the generation to 0, as the new record begins now
		SET	@v_generation = 0
		--	and also empty the @v_stage temporary in memory table
		DELETE	@v_stage
		-- insert the first generation (the current record itself)
		INSERT	@v_stage
		SELECT	@v_generation, @v_working_unit_id, @v_is_staff_posted
		-- loop thru the entire tree below the current record
		WHILE 	(	@@ROWCOUNT > 0	)
		BEGIN
			SET	@v_generation = @v_generation + 1
			--	get the next generation of the current record
			INSERT		@v_stage
			SELECT		@v_generation, w.working_unit_id, w.is_staff_posted
			FROM		CDB..working_units	w
				INNER JOIN	@v_stage AS s 
					ON 	(	w.group_working_unit_id = s.working_unit_id )
			WHERE		s.generation = @v_generation - 1
			AND 	NOT EXISTS (SELECT 1 FROM @v_stage AS r WHERE r.working_unit_id = w.working_unit_id)
			-- 	next level generation is populated in the stage table.
			-- 	check if any working_unit has the is_staff_posted as 'No', if so, raise the error and return
			IF	EXISTS	(	SELECT	TOP 1 1
							FROM	@v_stage
							WHERE	UPPER (is_staff_posted) = 'NO'
						)
				BEGIN
					EXEC SysAdmin..RaiseErrorMessage 'ObjectValidity', NULL, 'Working Unit', 'Having Staff posted as Yes for all levels below', NULL
					RETURN				
				END
		END
		--	fetching the next record from cursor
		FETCH	NEXT	FROM	@MyCursor
			INTO	@v_working_unit_id, @v_group_working_unit_id, @v_is_staff_posted
	END
	-- 	closing the cursor
	CLOSE 		@MyCursor 
	--	deallocating the cursor
	DEALLOCATE 	@MyCursor 
END
GO
-- =============================================================================

-- =============================================================================
--	Table 	WORKING_UNITS
--	A trigger in CDB ensures that UPDATE (PK) / DELETE in CDB is prevented
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'working_units_b_du' AND xtype = 'TR')
	DROP TRIGGER working_units_b_du
GO

CREATE TRIGGER working_units_b_du ON working_units
	WITH ENCRYPTION 
		FOR UPDATE, DELETE
AS
DECLARE
	@v_ref_by			VARCHAR (500),
	@v_left				TINYINT
BEGIN
	SET	@v_ref_by = ''

	IF	(	(UPDATE (working_unit_id)) 	OR 	((SELECT COUNT(*) FROM inserted ) = 0)	)
	BEGIN

		-- checking if this table is being referred by RMS..sewadars
		IF 	EXISTS	(	SELECT	TOP 1 1
						FROM	deleted d
							JOIN	RMS..sewadars s
								ON (	d.working_unit_id = s.working_unit_id	)
					)
			BEGIN
				SET	@v_ref_by = 'sewadars (RMS)'
			END

		-- checking if this table is being referred by RMS..cmptd_id_card_details
		IF 	EXISTS	(	SELECT	TOP 1 1
						FROM	deleted d
							JOIN	RMS..cmptd_id_card_details c
								ON (	d.working_unit_id = c.working_unit_id	)
					)
			BEGIN
				SET	@v_ref_by = @v_ref_by + ', ' + 'cmptd_id_card_details (RMS)'
			END

		-- checking if this table is being referred by RMS..notification_sewadars
		IF 	EXISTS	(	SELECT	TOP 1 1
						FROM	deleted d
							JOIN	RMS..notification_sewadars ns
								ON (	d.working_unit_id = ns.working_unit_id	)
					)
			BEGIN
				SET	@v_ref_by = @v_ref_by + ', ' + 'notification_sewadars (RMS)'
			END	

		-- checking if this table is being referred by RMS..notification_addressee_place_holders
		IF 	EXISTS	(	SELECT	TOP 1 1
						FROM	deleted d
							JOIN	RMS..notification_addressee_place_holders naph
								ON (	d.working_unit_id = naph.working_unit_id	)
					)
			BEGIN
				SET	@v_ref_by = @v_ref_by + ', ' + 'notification_addressee_place_holders (RMS)'
			END				
	END

	IF	(	LEN (@v_ref_by) > 0	)	
	BEGIN
		SET	@v_left		= ((	50 + LEN (@v_ref_by) - ABS (50 - LEN (@v_ref_by))	) / 2)

		IF	(	@v_left	= 50 	) 
			SET	@v_ref_by = LEFT (@v_ref_by, 50 - (CHARINDEX (',', REVERSE (@v_ref_by)))) + '...'		
		ELSE
			SET	@v_ref_by = LEFT (@v_ref_by, @v_left)		

		EXEC SysAdmin..RaiseErrorMessage 'ForeignKeyConstraint1', NULL, 'Working Unit(s)', @v_ref_by, NULL
		RETURN
	END
END
GO
-- =============================================================================

-- =============================================================================
--	Table WORKING_UNIT_RESPONSIBILITIES
---	A Trigger that ensures:-
---					*	working_unit_id is child of responsibility_types.working_unit_id
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'working_unit_responsibilities_a_iu' AND xtype = 'TR')
	DROP TRIGGER working_unit_responsibilities_a_iu
GO

CREATE TRIGGER working_unit_responsibilities_a_iu ON working_unit_responsibilities
	WITH ENCRYPTION
   		FOR INSERT, UPDATE
AS
BEGIN
	IF	EXISTS	(	SELECT	TOP 1 1 
					FROM 	inserted i
						JOIN	working_units	w
							ON	(	i.working_unit_id = w.working_unit_id	)
						LEFT OUTER JOIN	responsibility_types	rt
							ON	(	w.group_working_unit_id = rt.working_unit_id	
								AND	i.responsibility_type_id = rt.responsibility_type_id	
								)
					WHERE	w.group_working_unit_id		IS NOT NULL
					AND		rt.responsibility_type_id	IS NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'ObjectValidity', NULL, 'Working Unit', 'Child of Working unit at which Resp. is defined', NULL
			RETURN				
		END
END
GO
-- =============================================================================

-- =============================================================================
--	Table WORKING_UNIT_RESPONSIBILITIES
---	A Trigger that ensures:-
--					*	sewadar_id exists in RMS..sewadars table (OR persons table with the person type as "S"), and is Active
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'working_unit_responsibilities_b_iu' AND xtype = 'TR')
	DROP TRIGGER working_unit_responsibilities_b_iu
GO

CREATE TRIGGER working_unit_responsibilities_b_iu ON working_unit_responsibilities
	WITH ENCRYPTION
   		FOR INSERT, UPDATE
AS
BEGIN
	IF	EXISTS	(	SELECT	TOP 1 1 
					FROM	inserted	i
						LEFT OUTER JOIN	RMS..persons	p
							ON	(	i.sewadar_id = p.person_id
								AND	p.person_type_cd = 'S'
								)
						LEFT OUTER JOIN	RMS..person_status ps
							ON	(	p.status_id = ps.person_status_id	)
					WHERE	i.sewadar_id	IS NOT NULL
					AND		(
								p.person_id			IS NULL
							OR	ps.person_status_id	IS NULL
							)
				)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'ObjectValidity', NULL, 'Sewadar', 'an Active Sewadar', NULL
			RETURN				
		END
END
GO
-- =============================================================================

-- =============================================================================
--	Table WORKING_UNIT_RESPONSIBILITIES
---	A Trigger that ensures:-
--					*	The number of rows for a working unit and responsibility type is less than
--						or equal to the responsibility_types.responsibility_cnt.
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'working_unit_responsibilities_c_iu' AND xtype = 'TR')
	DROP TRIGGER working_unit_responsibilities_c_iu
GO

CREATE TRIGGER working_unit_responsibilities_c_iu ON working_unit_responsibilities
	WITH ENCRYPTION
   		FOR INSERT, UPDATE
AS
BEGIN
	IF	EXISTS	(	SELECT	TOP 1 1 
					FROM	(
								SELECT	responsibility_type_id, working_unit_id, count(*) as no_of_sewadars
								FROM	inserted
								GROUP	BY	responsibility_type_id, working_unit_id
							)	i_agg
						JOIN	responsibility_types	rt
							ON	(	rt.responsibility_type_id = i_agg.responsibility_type_id	)
					WHERE	i_agg.no_of_sewadars > rt.responsibility_cnt
				)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'LesserOrEqualValueReqd', NULL, 'No of working unit/Resp type records', 'The count defined for the Responsibility type', NULL
			RETURN				
		END
END
GO
-- =============================================================================

-- =============================================================================
--	Table WORKING_UNIT_SANCTIONED_STRENGTH
		--- This working unit should have is_staff_posted set to Yes.
		--- LATER: A trigger to be written to ensure the above.
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'working_unit_sanctioned_strength_a_iu' AND xtype = 'TR')
	DROP TRIGGER working_unit_sanctioned_strength_a_iu
GO

CREATE TRIGGER working_unit_sanctioned_strength_a_iu ON working_unit_sanctioned_strength
	WITH ENCRYPTION
   		FOR INSERT, UPDATE
AS
BEGIN
	IF 	EXISTS	(	SELECT	TOP 1 1 
					FROM	inserted i
						LEFT OUTER JOIN	working_units w
							ON	(	i.working_unit_id = w.working_unit_id
								AND	UPPER (w.is_staff_posted) = 'YES'
							)
					WHERE	i.working_unit_id 	IS NOT NULL
					AND		w.working_unit_id	IS NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'ObjectValidity', NULL, 'Working Unit', 'having staff posted as Yes', NULL
			RETURN		
		END
END
GO
-- =============================================================================
-- vim:ts=4 ht=4 sw=4
