USE CDB
GO

--	========================================================================================================================
--	IMPORTANT.
--	~~~~~~~~~
--	1.	This script operates in two modes, viz., Identify (default) and Delete.
--			"Identify" only lists /reports the instances where Address Level Components have been used.
--			"Delete" deletes the Address Level Componets if no case has been reported.
--	2.	It only checks on the SQL server; on PostgreSQL side, the data has to be checked manually.
--	3.	In "Delete" mode, transaction is started, which should be COMMITted or ROLLedBACK.
--	========================================================================================================================

--	ROLLBACK
--	COMMIT


DECLARE
	@mode	VARCHAR (10)	=	'Identify';


DROP	TABLE	IF EXISTS	tmp_l3_instances;

CREATE	TABLE	tmp_l3_instances	(	level_3_address_component_id	INTEGER			NOT	NULL	PRIMARY KEY,
										c_nm							VARCHAR (100)	NOT	NULL,
										l1_nm							VARCHAR (50)	NOT	NULL,
										l2_nm							VARCHAR (50)	NOT	NULL,
										l3_nm							VARCHAR (50)	NOT	NULL,
										c_id							INTEGER			NOT	NULL,
										l1_id							INTEGER			NOT	NULL,
										l2_id							INTEGER			NOT	NULL
									);

INSERT	INTO	tmp_l3_instances
	SELECT	level_3_address_component_id, country_nm, level_1_address_component_nm, level_2_address_component_nm, level_3_address_component_nm, country_id, level_1_address_component_id, level_2_address_component_id
	FROM	CDB..v_level_3_address_components
	WHERE	country_nm	=	'Canada'


DECLARE
	@stmt	VARCHAR (MAX),
	@e_id	INTEGER,
	@is_rec	BIT				=	0,
	@e_db	VARCHAR (50),
	@e_tbl	VARCHAR (50),
	@e_col	VARCHAR (50),
	@rf_db	VARCHAR (50),
	@rf_tbl	VARCHAR (50),
	@rf_col	VARCHAR (50);

DECLARE	crsr CURSOR	FOR
	SELECT	e.remote_entity_id, e.remote_entity_db, e.remote_entity_tbl, e.remote_entity_id_column, r.reference_db, r.reference_tbl, r.reference_column
	FROM	XCS..remote_entities	e
		JOIN	XCS..remote_entities_references	r
			ON	(	e.remote_entity_id	=	r.remote_entity_id	)
		JOIN	master.SYS.databases	d
			ON	(	d.name	=	r.reference_db	)
	WHERE	e.remote_entity_db	=	'CDB'
	AND		e.remote_entity_tbl	IN	(	'level_3_address_components'	)
	AND		r.reference_db	NOT	IN	(	'ARM', 'new_pdb', 'PDB2', 'newpdb', 'MMS'	)
	UNION
	SELECT	-99, 'CDB', 'level_3_address_components', 'level_3_address_component_id', 'CDB', 'pincodes', 'level_3_component_id'
	ORDER BY	2, 3;

OPEN	crsr;

FETCH	crsr
	INTO	@e_id, @e_db, @e_tbl, @e_col, @rf_db, @rf_tbl, @rf_col;
WHILE (@@FETCH_STATUS = 0)
BEGIN
--	PRINT	CONVERT (VARCHAR, @e_id) + '| ' + @e_db + '| ' + @e_tbl + '| ' + @e_col + '| ' + @rf_db + '| ' + @rf_tbl + '| ' + @rf_col;
	SET @stmt	=	'USE ' + @rf_db + ';
					IF EXISTS	(	SELECT	1
									FROM	INFORMATION_SCHEMA.TABLES
									WHERE	TABLE_NAME	=	''' + @rf_tbl + '''
								)
					BEGIN
						SELECT	''' +  CONVERT (VARCHAR, @e_id) + '| ' + @e_db + '| ' + @e_tbl + '| ' + @e_col + '| ' + @rf_db + '| ' + @rf_tbl + '| ' + @rf_col + ''' AS Ref,
								a.' + @rf_col + ', b.*, a.*
						FROM	' + @rf_db + '..' + @rf_tbl + '	a
							JOIN	' + CASE @e_tbl WHEN 'level_1_address_components' THEN 'CDB..tmp_l1_instances'
													WHEN 'level_2_address_components' THEN 'CDB..tmp_l2_instances'
													WHEN 'level_3_address_components' THEN 'CDB..tmp_l3_instances'
										END + '	b
								ON	(	a.'	+ @rf_col + '	=	b.' + @e_col + '	)
					END
					ELSE
						PRINT	''' + @rf_db + '..' + @rf_tbl + ' does not exist!''
					';
--	PRINT @stmt;
	EXEC (@stmt);
	IF (@@ROWCOUNT > 0)
		SET @is_rec = 1;

	FETCH	crsr
		INTO	@e_id, @e_db, @e_tbl, @e_col, @rf_db, @rf_tbl, @rf_col;
END

CLOSE crsr;
DEALLOCATE	crsr;

IF (@mode = 'Delete' AND @is_rec = 0)
BEGIN
	BEGIN TRAN;

	SELECT	l2_id	AS	level_2_address_component_id,
			l3_nm	AS	fsa_nm
		INTO	canada_forward_sortation_areas
	FROM	tmp_l3_instances
	WHERE	LEN (l3_nm)	=	3;

	DELETE	t
	FROM	tmp_l3_instances	i
		JOIN	level_3_address_components	t
			ON	(	i.level_3_address_component_id	=	t.level_3_address_component_id	);

	UPDATE	countries
		SET	level_3_address_component	=	NULL
	WHERE	country_nm	=	'Canada';

END

DROP	TABLE	tmp_l3_instances;

