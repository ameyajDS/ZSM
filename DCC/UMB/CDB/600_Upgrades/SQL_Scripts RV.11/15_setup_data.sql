/* ==================================================================================
	Source File		:	setup.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	May 22, 2015 17:30 IST
	Module ID		:	CDB
	Last updated	:	May 22, 2015
	==================================================================================
																		   Usage Notes
	----------------------------------------------------------------------------------

	==================================================================================
																	  Revision History
	----------------------------------------------------------------------------------
		22-May-2015: JL
			* Initial Versions
	==================================================================================*/


DECLARE
	@audit_log_id			INT,

	@sstid_feb				generic_entity_id,
	@sstid_mar				generic_entity_id,
	@sstid_may				generic_entity_id,
	@sstid_jul				generic_entity_id,
	@sstid_sep				generic_entity_id,
	@sstid_oct				generic_entity_id,
	@sstid_dec				generic_entity_id,

	@aid_satsang_beas		generic_entity_id,
	@aid_satsang_india		generic_entity_id,
	@aid_satsang_abroad		generic_entity_id,
	@aid_ndr				generic_entity_id,
	@aid_nd					generic_entity_id,
	@aid_qa					generic_entity_id,
	@aid_cd					generic_entity_id,
	@aid_nri				generic_entity_id,
	@aid_ws_start			generic_entity_id,
	@aid_ws_end				generic_entity_id,
	@aid_ss_start			generic_entity_id,
	@aid_ss_end				generic_entity_id;

INSERT INTO	audit_logs
		(	session_id, application_id, user_no, user_role_id, operation, screen_id, object_id	)
	VALUES
		(	0, 'CDB', 0, 'SYSTEM', 'I', 'Set-up', 'Initial Set-up'	);

SET @audit_log_id	=	SCOPE_IDENTITY ();

--	====================================================================================================
---- Satsang Session Types like Feb, Mar, May, Jul, Sep, Oct & Dec
--	====================================================================================================

INSERT INTO	satsang_session_types ( satsang_session_type_cd, satsang_session_type_nm, is_winter, is_three_week_session, audit_log_id )	VALUES ( 'Feb', 'February',		1, 1, @audit_log_id );
	SET	@sstid_feb		=	SCOPE_IDENTITY ();                                                   
INSERT INTO	satsang_session_types ( satsang_session_type_cd, satsang_session_type_nm, is_winter, is_three_week_session, audit_log_id )	VALUES ( 'Mar', 'March',		1, 1, @audit_log_id );
	SET	@sstid_mar		=	SCOPE_IDENTITY ();                                                   
INSERT INTO	satsang_session_types ( satsang_session_type_cd, satsang_session_type_nm, is_winter, is_three_week_session, audit_log_id )	VALUES ( 'May', 'May',			0, 1, @audit_log_id );
	SET	@sstid_may		=	SCOPE_IDENTITY ();                                                   
INSERT INTO	satsang_session_types ( satsang_session_type_cd, satsang_session_type_nm, is_winter, is_three_week_session, audit_log_id )	VALUES ( 'Jul', 'July',			0, 0, @audit_log_id );
	SET	@sstid_jul		=	SCOPE_IDENTITY ();                                                   
INSERT INTO	satsang_session_types ( satsang_session_type_cd, satsang_session_type_nm, is_winter, is_three_week_session, audit_log_id )	VALUES ( 'Sep', 'September',	0, 1, @audit_log_id );
	SET	@sstid_sep		=	SCOPE_IDENTITY ();                                                   
INSERT INTO	satsang_session_types ( satsang_session_type_cd, satsang_session_type_nm, is_winter, is_three_week_session, audit_log_id )	VALUES ( 'Oct', 'October',		1, 1, @audit_log_id );
	SET	@sstid_oct		=	SCOPE_IDENTITY ();                                                   
INSERT INTO	satsang_session_types ( satsang_session_type_cd, satsang_session_type_nm, is_winter, is_three_week_session, audit_log_id )	VALUES ( 'Dec', 'December',		1, 1, @audit_log_id );
	SET	@sstid_dec		=	SCOPE_IDENTITY ();

--	====================================================================================================
---- Activities like Satsang at Dera Beas, Satsang in India, Nam Dan, Questions and Answers, etc.
--	====================================================================================================

INSERT INTO	activities	( activity_cd, activity_nm, is_at_dera, audit_log_id )			VALUES	(	'S',		'Satsang at Dera Beas',					1, @audit_log_id	)
	SET	@aid_satsang_beas		=	SCOPE_IDENTITY ();
INSERT INTO	activities	( activity_cd, activity_nm, is_at_india_centre, audit_log_id )	VALUES	(	'IS',		'Satsang at India Centre',				1, @audit_log_id	)
	SET	@aid_satsang_india		=	SCOPE_IDENTITY ();
INSERT INTO	activities	( activity_cd, activity_nm, is_at_abroad_centre, audit_log_id )	VALUES	(	'AS',		'Satsang abroad',						1, @audit_log_id	)
	SET	@aid_satsang_abroad		=	SCOPE_IDENTITY ();

INSERT INTO	activities	( activity_cd, activity_nm,					 is_at_dera, related_activity_id, related_week_no, offset_days, is_daily_activity, activities_cnt, audit_log_id )
				VALUES	(	'NDR',	'Nam Dan Registration at Dera Beas',	1,	 @aid_satsang_beas,   1,				-3,			1,					3,		 @audit_log_id	)
	SET	@aid_ndr				=	SCOPE_IDENTITY ();

INSERT INTO	activities	( activity_cd, activity_nm,		 is_at_dera, related_activity_id, related_week_no, offset_days, is_daily_activity, activities_cnt, audit_log_id )
				VALUES	(	'ND',	'Nam Dan at Dera Beas',	1,		 @aid_satsang_beas,   1,				1,			1,					5,		 @audit_log_id	)
	SET	@aid_nd					=	SCOPE_IDENTITY ();

INSERT INTO	activities	( activity_cd, activity_nm,							 is_at_dera, related_activity_id, offset_days, is_daily_activity, activities_cnt, winter_offset_days, winter_activities_cnt, audit_log_id )
				VALUES	(	'QA',		'Questions and Answeres at Dera Beas',	1, 		  @aid_satsang_beas,   			2,		1,					3,				1,					2,			@audit_log_id	)
	SET	@aid_qa					=	SCOPE_IDENTITY ();

INSERT INTO	activities	( activity_cd, activity_nm,				 is_at_dera, related_activity_id, offset_days, is_daily_activity, activities_cnt, audit_log_id )
			VALUES		(	'CD',	'Car Darshan at Dera Beas',			1,		@aid_satsang_beas,	-1,				1,					1,		  @audit_log_id	)
	SET	@aid_cd					=	SCOPE_IDENTITY ();

INSERT INTO	activities	( activity_cd, activity_nm,				 is_at_dera, related_activity_id, related_week_no, offset_days, is_daily_activity, activities_cnt, audit_log_id )
			VALUES		(	'NRIM',	'NRI Meeting at Dera Beas',			1,		@aid_satsang_beas,	2,				-2,				0,					2,		  @audit_log_id	)
	SET	@aid_nri				=	SCOPE_IDENTITY ();

INSERT INTO	activities	( activity_cd, activity_nm,				 is_at_dera, related_activity_id, related_week_no, offset_days, is_daily_activity, activities_cnt, audit_log_id )
			VALUES		(	'WSS',		'Winter Session Starts',	1,		@aid_satsang_beas,			1,				-3,				1,					1,	   @audit_log_id	)
	SET	@aid_ws_start			=	SCOPE_IDENTITY ();

INSERT INTO	activities	( activity_cd, activity_nm,				 is_at_dera, related_activity_id, related_week_no, offset_days, is_daily_activity, activities_cnt, audit_log_id )
			VALUES		(	'WSE',		'Winter Session Ends',		1,		@aid_satsang_beas,			3,				3,				1,				1,		   @audit_log_id	)
	SET	@aid_ws_end				=	SCOPE_IDENTITY ();

INSERT INTO	activities	( activity_cd, activity_nm,				 is_at_dera, related_activity_id, related_week_no, offset_days, is_daily_activity, activities_cnt, audit_log_id )
			VALUES		(	'SSS',		'Summer Session Starts',	1,		@aid_satsang_beas,			1,				-3,				1,					1,	   @audit_log_id	)
	SET	@aid_ss_start			=	SCOPE_IDENTITY ();

INSERT INTO	activities	( activity_cd, activity_nm,				 is_at_dera, related_activity_id, related_week_no, offset_days, is_daily_activity, activities_cnt, audit_log_id )
			VALUES		(	'SSE',		'Summer Session Ends',		1,		@aid_satsang_beas,			3,				3,				1,				1,		   @audit_log_id	)
	SET	@aid_ss_end				=	SCOPE_IDENTITY ();

--	====================================================================================================
---- Week-wise Activities Setup
--	====================================================================================================

INSERT INTO	setup_activities (	activity_id, week_no, offset_days, venue, audit_log_id	) VALUES (	@aid_satsang_india, 1,	0,	'Mumbai',		@audit_log_id	)
		-- Week 2, 3 no activity
INSERT INTO	setup_activities (	activity_id, week_no, offset_days, venue, audit_log_id	) VALUES (	@aid_satsang_india, 4,	0,	'Raipur',		@audit_log_id	)
INSERT INTO	setup_activities (	activity_id, week_no, offset_days, venue, audit_log_id	) VALUES (	@aid_satsang_india, 5,	0,	'Indore',		@audit_log_id	)
INSERT INTO	setup_activities (	activity_id, week_no, offset_days, venue, audit_log_id	) VALUES (	@aid_satsang_india, 6,	0,	'Hyderabad',	@audit_log_id	)
INSERT INTO	setup_activities (	activity_id, week_no, offset_days, satsang_session_type_id,	audit_log_id ) VALUES (	@aid_satsang_beas,	7,	0,	@sstid_feb,		@audit_log_id	)
INSERT INTO	setup_activities (	activity_id, week_no, offset_days, satsang_session_type_id,	audit_log_id ) VALUES (	@aid_satsang_beas,	8,	0,	@sstid_feb,		@audit_log_id	)
INSERT INTO	setup_activities (	activity_id, week_no, offset_days, satsang_session_type_id,	audit_log_id ) VALUES (	@aid_satsang_beas,	9,	0,	@sstid_feb,		@audit_log_id	)
INSERT INTO	setup_activities (	activity_id, week_no, offset_days, venue, alternate_venue, audit_log_id	)
																						  VALUES (	@aid_satsang_india, 10,	0,	'Kolkata', 'Jamshedpur',	@audit_log_id	)
INSERT INTO	setup_activities (	activity_id, week_no, offset_days, venue, audit_log_id	) VALUES (	@aid_satsang_india, 11,	0,	'Delhi',		@audit_log_id	)
INSERT INTO	setup_activities (	activity_id, week_no, offset_days, satsang_session_type_id,	audit_log_id ) VALUES (	@aid_satsang_beas,	12,	0,	@sstid_mar,		@audit_log_id	)
INSERT INTO	setup_activities (	activity_id, week_no, offset_days, satsang_session_type_id,	audit_log_id ) VALUES (	@aid_satsang_beas,	13,	0,	@sstid_mar,		@audit_log_id	)
INSERT INTO	setup_activities (	activity_id, week_no, offset_days, satsang_session_type_id,	audit_log_id ) VALUES (	@aid_satsang_beas,	14,	0,	@sstid_mar,		@audit_log_id	)
INSERT INTO	setup_activities (	activity_id, week_no, offset_days, venue, audit_log_id	) VALUES (	@aid_satsang_india, 15,	0,	'Jammu',		@audit_log_id	)
		-- Week 16
INSERT INTO	setup_activities (	activity_id, week_no, offset_days, venue, audit_log_id	) VALUES (	@aid_satsang_abroad, 17, 0,	'Spain',		@audit_log_id	)
		-- Week 18
INSERT INTO	setup_activities (	activity_id, week_no, offset_days, venue, audit_log_id	) VALUES (	@aid_satsang_india, 19,	0,	'Paror',		@audit_log_id	)
INSERT INTO	setup_activities (	activity_id, week_no, offset_days, satsang_session_type_id,	audit_log_id ) VALUES (	@aid_satsang_beas,	20,	0,	@sstid_may,		@audit_log_id	)
INSERT INTO	setup_activities (	activity_id, week_no, offset_days, satsang_session_type_id,	audit_log_id ) VALUES (	@aid_satsang_beas,	21,	0,	@sstid_may,		@audit_log_id	)
INSERT INTO	setup_activities (	activity_id, week_no, offset_days, satsang_session_type_id,	audit_log_id ) VALUES (	@aid_satsang_beas,	22,	0,	@sstid_may,		@audit_log_id	)
		-- Week 23, 24, 25, 26
INSERT INTO	setup_activities (	activity_id, week_no, offset_days, satsang_session_type_id,	audit_log_id ) VALUES (	@aid_satsang_beas,	27,	0,	@sstid_jul,			@audit_log_id	)

INSERT INTO	setup_activities (	activity_id, week_no, offset_days,		audit_log_id	) VALUES (	@aid_satsang_abroad, 28, 0,					@audit_log_id	)
INSERT INTO	setup_activities (	activity_id, week_no, offset_days,		audit_log_id	) VALUES (	@aid_satsang_abroad, 29, 0,					@audit_log_id	)
INSERT INTO	setup_activities (	activity_id, week_no, offset_days,		audit_log_id	) VALUES (	@aid_satsang_abroad, 30, 0,					@audit_log_id	)
INSERT INTO	setup_activities (	activity_id, week_no, offset_days,		audit_log_id	) VALUES (	@aid_satsang_abroad, 31, 0,					@audit_log_id	)
INSERT INTO	setup_activities (	activity_id, week_no, offset_days,		audit_log_id	) VALUES (	@aid_satsang_abroad, 32, 0,					@audit_log_id	)

INSERT INTO	setup_activities (	activity_id, week_no, offset_days, venue, audit_log_id	) VALUES (	@aid_satsang_abroad, 33, 0,	'U.K.',			@audit_log_id	)

INSERT INTO	setup_activities (	activity_id, week_no, offset_days,		audit_log_id	) VALUES (	@aid_satsang_abroad, 34, 0,					@audit_log_id	)
INSERT INTO	setup_activities (	activity_id, week_no, offset_days,		audit_log_id	) VALUES (	@aid_satsang_abroad, 35, 0,					@audit_log_id	)

INSERT INTO	setup_activities (	activity_id, week_no, offset_days, venue, audit_log_id	) VALUES (	@aid_satsang_india, 36,	0,	'Bangalore',	@audit_log_id	)

INSERT INTO	setup_activities (	activity_id, week_no, offset_days, satsang_session_type_id,	audit_log_id ) VALUES (	@aid_satsang_beas,	37,	0,	@sstid_sep,		@audit_log_id	)
INSERT INTO	setup_activities (	activity_id, week_no, offset_days, satsang_session_type_id,	audit_log_id ) VALUES (	@aid_satsang_beas,	38,	0,	@sstid_sep,		@audit_log_id	)
INSERT INTO	setup_activities (	activity_id, week_no, offset_days, satsang_session_type_id,	audit_log_id ) VALUES (	@aid_satsang_beas,	39,	0,	@sstid_sep,		@audit_log_id	)

INSERT INTO	setup_activities (	activity_id, week_no, offset_days, venue, audit_log_id	) VALUES (	@aid_satsang_india, 40,	0,	'Nagpur',		@audit_log_id	)
INSERT INTO	setup_activities (	activity_id, week_no, offset_days, venue, audit_log_id	) VALUES (	@aid_satsang_india, 41,	0,	'Delhi',		@audit_log_id	)

INSERT INTO	setup_activities (	activity_id, week_no, offset_days, satsang_session_type_id,	audit_log_id ) VALUES (	@aid_satsang_beas,	42,	0,	@sstid_oct,		@audit_log_id	)
INSERT INTO	setup_activities (	activity_id, week_no, offset_days, satsang_session_type_id,	audit_log_id ) VALUES (	@aid_satsang_beas,	43,	0,	@sstid_oct,		@audit_log_id	)
INSERT INTO	setup_activities (	activity_id, week_no, offset_days, satsang_session_type_id,	audit_log_id ) VALUES (	@aid_satsang_beas,	44,	0,	@sstid_oct,		@audit_log_id	)

INSERT INTO	setup_activities (	activity_id, week_no, offset_days, venue, audit_log_id	) VALUES (	@aid_satsang_india, 45,	0,	'Sikanderpur',	@audit_log_id	)

INSERT INTO	setup_activities (	activity_id, week_no, offset_days,		audit_log_id	) VALUES (	@aid_satsang_abroad, 46, 0,					@audit_log_id	)

INSERT INTO	setup_activities (	activity_id, week_no, offset_days, venue, audit_log_id	) VALUES (	@aid_satsang_india, 47,	0,	'Lucknow',		@audit_log_id	)
INSERT INTO	setup_activities (	activity_id, week_no, offset_days, venue, audit_log_id	) VALUES (	@aid_satsang_india, 48,	0,	'Delhi',		@audit_log_id	)

INSERT INTO	setup_activities (	activity_id, week_no, offset_days, satsang_session_type_id,	audit_log_id ) VALUES (	@aid_satsang_beas,	49,	0,	@sstid_dec,		@audit_log_id	)
INSERT INTO	setup_activities (	activity_id, week_no, offset_days, satsang_session_type_id,	audit_log_id ) VALUES (	@aid_satsang_beas,	50,	0,	@sstid_dec,		@audit_log_id	)
INSERT INTO	setup_activities (	activity_id, week_no, offset_days, satsang_session_type_id,	audit_log_id ) VALUES (	@aid_satsang_beas,	51,	0,	@sstid_dec,		@audit_log_id	)
INSERT INTO	setup_activities (	activity_id, week_no, offset_days, venue, alternate_venue, audit_log_id	)
																						  VALUES (	@aid_satsang_india, 52,	0,	'Ahmedabad', 'Jaipur',	@audit_log_id	)

--	====================================================================================================


