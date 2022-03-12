--begin tran
--rollback
set nocount on
--commit


---- Script for Bulk Sewadars Registrations for transfer of Sewadars across centre provided in a Sewadar List 

DECLARE
	@sewadar_list_nm			VARCHAR (60),
	@old_status_dtm				DATETIME,
	@dst_satsang_centre_nm		gnc_nm,
	@transfer_dt				SMALLDATETIME		=	GetDate(),
	@is_outstation_sewadar		Boolean,
	@remarks					remarks				=	'Transfer from Indore to Biaora'

		---- Inputs to the script are specified below
SET	@sewadar_list_nm			=	'Transfer to Bioara on 11 Jan 2017'
SET	@dst_satsang_centre_nm		=	'Biaora'
SET @old_status_dtm				=	CONVERT (VARCHAR (11), GetDate(), 106) + ' 21:01'
SET @is_outstation_sewadar		=	'Yes'


DECLARE
	@src_satsang_centre_id		satsang_centre_id,
	@dst_satsang_centre_id		satsang_centre_id,
	@sewadar_list_id			sewadar_list_id,
	@first_nm					VARCHAR (40),
	@last_nm					VARCHAR (40),
	@middle_nm					VARCHAR (40),
	@src_sewadar_grno           sewadar_grno,
	@rval						INT,
	@dst_sewadar_grno           sewadar_grno,
	@status_cd					VARCHAR (5)


SELECT	@sewadar_list_id = sewadar_list_id
FROM	generic_sewadar_lists
WHERE	sewadar_list_nm	=	@sewadar_list_nm;
IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Sewadar List not found', 16, 1);
	RETURN;
END

--SELECT	@sewadar_list_id = 1526
PRINT	@sewadar_list_id 

SELECT	@dst_satsang_centre_id	=	c.satsang_centre_id
FROM	CDB..satsang_centres	c
	JOIN	satsang_centres_details	d
		ON	(	c.satsang_centre_id	=	d.satsang_centre_id	)
WHERE	d.is_main_centre	=	'Yes'
AND		d.centre_nm			=	@dst_satsang_centre_nm;
IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Destination Satsang Centre not found', 16, 1);
	RETURN;
END

	--- We allow transfers for Retd and NI also temporarily
INSERT INTO system_information_values (system_info_cd, value_varchar) VALUES ('SttsSysTrf', 'Retd') 
INSERT INTO system_information_values (system_info_cd, value_varchar) VALUES ('SttsSysTrf', 'NI') 


DECLARE crsr CURSOR FOR
	SELECT	l.satsang_centre_id, l.sewadar_grno, r.sewadar_status_cd, first_nm, middle_nm, last_nm
	FROM	generic_sewadar_lists_sewadars l
		JOIN    sewadars_registrations	r
			ON  (   r.satsang_centre_id =	l.satsang_centre_id
				AND	r.sewadar_grno		=	l.sewadar_grno
				AND	l.sewadar_list_id	=	@sewadar_list_id
				)
		JOIN	sewadars	s
			ON	(	s.sewadar_id	=	r.sewadar_id	)
	ORDER BY l.sewadar_grno;

OPEN crsr
FETCH crsr INTO @src_satsang_centre_id, @src_sewadar_grno, @status_cd, @first_nm, @middle_nm, @last_nm;
WHILE (@@FETCH_STATUS = 0)
BEGIN
	print 'iterating over ' + @src_sewadar_grno + ' with Name as ' + @first_nm + ' ' + @middle_nm + ' ' + @last_nm
	IF (@status_cd NOT IN ('Perm', 'Temp', 'NI', 'Retd'))
	BEGIN
		RAISERROR ('Status of Sewadar with G.R. No. [%s] is %s', 16, 1, @src_sewadar_grno, @status_cd);
		CLOSE crsr
		DEALLOCATE crsr
		RETURN;
	END

	EXEC	@rval = TransferSewadarToSatsangCentre	@src_satsang_centre_id, @src_sewadar_grno, @dst_satsang_centre_id, @transfer_dt,
													NULL, NULL, @is_outstation_sewadar, @remarks, @dst_sewadar_grno OUTPUT;
	IF (@rval != 0)
	BEGIN
		PRINT @rval;
		RETURN ;
	END

	PRINT 'Created G.R.No. ... ' + @dst_sewadar_grno;
		--INSERT INTO generic_sewadar_lists_sewadars VALUES (@sewadar_list_id, @satsang_centre_id, @sewadar_grno);
		
	FETCH crsr INTO @src_satsang_centre_id, @src_sewadar_grno, @status_cd, @first_nm, @middle_nm, @last_nm;
END
CLOSE crsr
DEALLOCATE crsr

	--- We now disable transfers for Retd and NI
DELETE
FROM	system_information_values
WHERE	system_info_cd  = 'SttsSysTrf'
AND		value_varchar in ( 'Retd', 'NI') 


