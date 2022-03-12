--begin tran
--rollback
set nocount on
--commit


DECLARE
	@status_dtm				DATETIME,
	@satsang_centre_nm		gnc_nm

		---- Inputs to the script are specified below
SET	@satsang_centre_nm		=	'Nagpur'
SET @status_dtm				=	'03-Sep-2017 18:30'

DECLARE
	@satsang_centre_id		satsang_centre_id,
	@sewadar_list_id			sewadar_list_id,
	@gender						VARCHAR (6),
	@first_nm					VARCHAR (40),
	@last_nm					VARCHAR (40),
	@middle_nm					VARCHAR (40),
	@src_sewadar_grno           sewadar_grno,
	@dst_sewadar_grno           sewadar_grno,
	@sewadar_id					INT,
	@status_cd					VARCHAR (5)


SELECT	@satsang_centre_id	=	c.satsang_centre_id
FROM	CDB..satsang_centres	c
	JOIN	satsang_centres_details	d
		ON	(	c.satsang_centre_id	=	d.satsang_centre_id	)
WHERE	d.is_main_centre	=	'Yes'
AND		d.centre_nm			=	@satsang_centre_nm;
IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Satsang Centre not found', 16, 1);
	RETURN;
END

DECLARE crsr CURSOR FOR
	SELECT	r.sewadar_grno, r.sewadar_id, s.gender, r.sewadar_status_cd, first_nm, middle_nm, last_nm
	FROM	sewadars_registrations	r
		JOIN	sewadars	s
			ON	(	s.sewadar_id	=	r.sewadar_id	)
	WHERE	satsang_centre_id = @satsang_centre_id
	AND		sewadar_grno IN (
					'M03139', 'F02968', 'F02969', 'F02970', 'F02971', 'F02972', 'F02973', 'M03140', 'F02974', 'M03141', 'F02975', 'F02976', 'F02977', 'M03142', 'F02978',
					'F02979', 'M03143', 'F02980', 'F02981', 'F02989', 'M03146', 'M03147', 'M03148', 'M03150', 'M03155', 'F02999', 'M03161', 'M03162', 'F03007', 'F03011',
					'F03013', 'F03014', 'F03016', 'F03017', 'F03018', 'F03021', 'F03032', 'F03033', 'F03034', 'F03035', 'F03036', 'F03037', 'F03038', 'F03039', 'F03040',
					'F03041', 'F03042', 'F03043', 'F03044', 'F03045', 'F03046', 'F03047', 'F03048', 'M03171', 'F03049', 'F03050', 'F03051', 'M03173', 'F03052', 'F03053',
					'F03054', 'M03175', 'M03180', 'M03182', 'M03183', 'F03059', 'M03185', 'M03186', 'F03063', 'F03064', 'F03069', 'F03072', 'M03191', 'F03087', 'F03090',
					'F03094', 'F03095', 'F03097', 'F03100', 'F03103', 'M03198', 'F03107', 'F03109', 'F03110', 'F03111', 'F03112', 'F03113', 'F03114', 'F03115', 'F03116',
					'F03117', 'F03119', 'F03121', 'F03132', 'F03133', 'F03137', 'F03142', 'F03143', 'F03153', 'F03155', 'F03156', 'M03206', 'M03218', 'M03223', 'M03224',
					'M03225', 'M03226', 'M03227', 'M03228', 'M03229', 'M03230', 'M03231', 'M03232', 'M03233', 'M03234', 'M03235', 'M03236', 'M03238', 'M03239', 'M03240',
					'M03241', 'M03242', 'M03243', 'M03244', 'M03246', 'M03247', 'M03252', 'M03253', 'M03255', 'M03256', 'F03175', 'F03181', 'M03271', 'M03276', 'F03189',
					'F03190', 'F03192', 'F03194', 'M03281', 'M03283', 'M03284', 'M03285', 'M03287', 'M03288', 'M03289', 'M03290', 'F03204', 'M03291', 'M03292', 'M03293',
					'M03294', 'M03295', 'M03299', 'M03302', 'F03206', 'F03210', 'M03306', 'M03313', 'M03316', 'M03333', 'F03211', 'M03345', 'M03346', 'M03348', 'M03349',
					'M03357', 'M03361', 'M03369', 'F03213', 'F03214', 'F03220', 'F03221', 'F03223', 'F03227', 'F03228', 'F03229', 'F03230', 'F03242', 'F03243', 'M03391',
					'F03244', 'F03246', 'M03403', 'M03404', 'M03405', 'F03247', 'M03406', 'F03251', 'M03432', 'M03437', 'M03446'
	)
	AND		sewadar_status_cd = 'Cncl'
	AND		sewadar_status_dtm = '03-Sep-2017 17:28'
	ORDER BY r.sewadar_grno;

OPEN crsr
FETCH crsr INTO @src_sewadar_grno, @sewadar_id, @gender, @status_cd, @first_nm, @middle_nm, @last_nm;
WHILE (@@FETCH_STATUS = 0)
BEGIN
	print 'iterating over ' + @src_sewadar_grno + ' with Name as ' + @first_nm + ' ' + @middle_nm + ' ' + @last_nm
	IF (@status_cd NOT IN ('Cncl'))
	BEGIN
		RAISERROR ('Status of Sewadar with G.R. No. [%s] is %s; sewadar skipped', 16, 1, @src_sewadar_grno, @status_cd);
		CLOSE crsr
		DEALLOCATE crsr
		RETURN;
	END
		EXEC GetSewadarRegistrationNumber @satsang_centre_id,   -- Should be Indore and if part of application, should be the one that is passed as a Parameter to the Application
										@gender,                	-- Values allowed are Male or Female
										'No',						-- Outstation Sewadar? Yes/No
										@dst_sewadar_grno OUTPUT
										

		INSERT INTO sewadars_registrations 
			(	satsang_centre_id, sewadar_grno, sewadar_id, appointment_dt, is_outstation_sewadar,
				department_id, sub_department_id, department_dt, sewadar_status_cd, sewadar_status_dtm,
				reference_1_sewadar_id, reference_1_relationship, reference_1_nm, reference_1_centre_id, reference_1_department,
				reference_2_sewadar_id, reference_2_relationship, reference_2_nm, reference_2_centre_id, reference_2_department,
				sponsorer_id, area_secretary_id, secretary_id, security_approver_id, sewa_samiti_approver_id, location_district_id
			) 
			SELECT	@satsang_centre_id, @dst_sewadar_grno, sewadar_id, appointment_dt, 'No',
					department_id, 
					sub_department_id,
					CONVERT (VARCHAR (11), GetDate(), 106), 'Temp', @status_dtm,
					reference_1_sewadar_id, reference_1_relationship, reference_1_nm, reference_1_centre_id, reference_1_department,
					reference_2_sewadar_id, reference_2_relationship, reference_2_nm, reference_2_centre_id, reference_2_department,
					sponsorer_id, area_secretary_id, secretary_id, security_approver_id, sewa_samiti_approver_id, location_district_id
			FROM	sewadars_registrations
			WHERE 	satsang_centre_id	=	@satsang_centre_id
			AND		sewadar_grno		=	@src_sewadar_grno;
		
		IF (@@ROWCOUNT != 1)
		BEGIN
			RAISERROR ('Error when processing Sewadar with G.R. No. [%s] is %s', 16, 1, @src_sewadar_grno, @status_cd);
			CLOSE crsr
			DEALLOCATE crsr
			RETURN;
		END;

	FETCH crsr INTO @src_sewadar_grno, @sewadar_id, @gender, @status_cd, @first_nm, @middle_nm, @last_nm;
END
CLOSE crsr
DEALLOCATE crsr


