/* ==================================================================================
	Source File		:	schema.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	May 19, 2015 17:39 IST
	Module ID		:	CDB
	Last updated	:	May 22, 2015
	==================================================================================
																		   Usage Notes
	----------------------------------------------------------------------------------

	==================================================================================
																	  Revision History
	----------------------------------------------------------------------------------
		19, 20, 22-May-2015: JL
			* Initial Versions
	==================================================================================*/

--	====================================================================================================
---- Satsang Session Types like Feb, Mar, May, Jul, Sep, Oct & Dec
--	====================================================================================================

CREATE	TABLE	satsang_session_types
(
 	satsang_session_type_id			generic_entity_id	NOT NULL	IDENTITY (1, 1)
																	CONSTRAINT	SatsangSessionTypes_PK_SatsangSessionTypeID
																		PRIMARY	KEY	NONCLUSTERED,

		--- LATER. Trigger ensures that the satsang_session_type_cd is NOT changed
	satsang_session_type_cd			entity_tiny_cd		NOT NULL	CONSTRAINT	SatsangSessionTypes_U1_SatsangSessionTypeCode
																		UNIQUE	NONCLUSTERED,
	satsang_session_type_nm			entity_tiny_nm		NOT NULL	CONSTRAINT	SatsangSessionTypes_U2_SatsangSessionTypeName
																		UNIQUE	CLUSTERED,
	satsang_session_type_print_nm	entity_tiny_nm			NULL,
	satsang_session_type_sq			SMALLINT				NULL,
	satsang_session_type_dsc		entity_dsc				NULL,

	is_winter						BIT					NOT NULL,
	is_three_week_session			BIT					NOT NULL,

	effective_from_dt				DATE				NOT NULL	CONSTRAINT	SatsangSessionTypes_DF_EffectiveFromDate
					      												DEFAULT	GetDate(),
	effective_till_dt				DATE				NOT NULL	CONSTRAINT	SatsangSessionTypes_DF_EffectiveTillDate
					 	   												DEFAULT	'31-Dec-9999',
	txn_ts			 	   			ROWVERSION			NOT NULL,
	audit_log_id	 	   			audit_log_id		NOT NULL	CONSTRAINT	SatsangSessionTypes_FK_AuditLogID
					 	   												REFERENCES	audit_logs,

		CONSTRAINT	SatsangSessionTypes_CK_EffectiveDates
			CHECK	(	effective_from_dt	<=	effective_till_dt	)
)
GO


--	====================================================================================================
---- Activities like Satsang at Dera Beas, Satsang in India, Nam Dan, Questions and Answers, etc.
--	====================================================================================================

CREATE	TABLE	activities
(
 	activity_id				generic_entity_id	NOT NULL	IDENTITY (1, 1)
															CONSTRAINT	Activities_PK_ActivityID
																PRIMARY	KEY	NONCLUSTERED,

		--- LATER. Trigger ensures that the activity_cd is NOT changed
	activity_cd				entity_medium_cd	NOT NULL	CONSTRAINT	Activities_U1_ActivityCode
																UNIQUE	NONCLUSTERED,
	activity_nm				entity_medium_nm	NOT NULL	CONSTRAINT	Activities_U2_ActivityName
																UNIQUE	CLUSTERED,
	activity_print_nm		entity_medium_nm		NULL,
	activity_sq				SMALLINT				NULL,
	activity_dsc			entity_dsc				NULL,

	is_at_dera				BIT					NOT NULL	CONSTRAINT	Activities_DF_IsAtDera
																DEFAULT 0,
	is_at_india_centre		BIT					NOT NULL	CONSTRAINT	Activities_DF_IsAtIndiaCentre
																DEFAULT 0,
	is_at_abroad_centre		BIT					NOT NULL	CONSTRAINT	Activities_DF_IsAtAbroadCentre
																DEFAULT 0,
	
		--- Following seven columns are currently specified for Dera Activities which have a three-week session
		--- As an example, NDR, ND, CD are related activities to Satsang at Beas
	related_activity_id		generic_entity_id		NULL	CONSTRAINT	Activities_FK_RelatedActivityID
																REFERENCES	activities,

		---- It indicates the activity begins in the specified week of a session like ND, NDR
		---- If it is not specified, the offset_days and activities_cnt determine the activity for each of the weeks in the session like Car Darshan
	related_week_no			TINYINT					NULL	CONSTRAINT	Activities_CK_RelatedWeekNumber
																CHECK	( related_week_no BETWEEN 1 AND 3 ),

	offset_days				SMALLINT				NULL	CONSTRAINT	Activities_CK_OffsetDays
																CHECK	(	offset_days	BETWEEN -6 AND 6 ),

		--- If it is not a daily activity, it is a weekly activity. For example, NRI meeting is a weekly activity.
	is_daily_activity		BIT						NULL,

	activities_cnt			TINYINT					NULL	CONSTRAINT	Activities_CK_DaysCount
																CHECK	(	activities_cnt BETWEEN 1 AND 10 ),

			--- If winter columns are not specified, offset_days and days_cnt are applicable for all three-week sessions;
			---	otherwise for winter sessions, the offset days and days count are specified here
	winter_offset_days		SMALLINT				NULL	CONSTRAINT	Activities_CK_WinterOffsetDays
																CHECK	(	winter_offset_days	BETWEEN -6 AND 6 ),
	winter_activities_cnt	TINYINT					NULL	CONSTRAINT	Activities_CK_WinterDaysCount
																CHECK	(	winter_activities_cnt BETWEEN 1 AND 10 ),

	effective_from_dt		DATE				NOT NULL	CONSTRAINT	Activities_DF_EffectiveFromDate
																DEFAULT	GetDate(),
	effective_till_dt		DATE				NOT NULL	CONSTRAINT	Activities_DF_EffectiveTillDate
																DEFAULT	'31-Dec-9999',
	txn_ts					ROWVERSION			NOT NULL,
	audit_log_id			audit_log_id		NOT NULL	CONSTRAINT	Activities_FK_AuditLogID
																REFERENCES	audit_logs,

		CONSTRAINT	Activities_CK_EffectiveDates
			CHECK	(	effective_from_dt	<=	effective_till_dt	)
)
GO


--	====================================================================================================
---- Week-wise Activities Setup
--	====================================================================================================

CREATE	TABLE	setup_activities
(
 	setup_activity_id		generic_entity_id	NOT NULL	IDENTITY (1, 1)
															CONSTRAINT	SetupActivities_PK_SetupActivityID
																PRIMARY	KEY	NONCLUSTERED,

 	activity_id				generic_entity_id	NOT	NULL	CONSTRAINT	SetupActivities_FK_ActivityID
																REFERENCES	activities,

		--- Note that first week begins with the first Sunday of the year.
	week_no					TINYINT				NOT NULL	CONSTRAINT	SetupActivities_CK_WeekNumber
																CHECK	(	week_no	BETWEEN 1 AND 53),		---- 53 because some years may have 53 Sundays

		---	Each activity is offset by a number of days from this Sunday. For example, preceding Saturday will have offset_days as -1,
		--	and succeeding Wednesday has offset_days as +3. Offset 0 indicates Sunday
	offset_days				SMALLINT			NOT NULL	CONSTRAINT	SetupActivities_CK_OffsetDays
																CHECK	(	offset_days	BETWEEN -6 AND 6 ),

		--- Trigger ensures that the Satsang Session Type can be specified only when is_at_dera has been set.
		---- Activities at Beas are associated with a Satsang Session Type
 	satsang_session_type_id	generic_entity_id		NULL	CONSTRAINT	SetupActivities_FK_SatsangSessionTypeID
																REFERENCES	satsang_session_types,

		--- Trigger ensures that the venue/alternate_venue can be specified only when is_at_india_centre or is_at_abroad_centre is set.
	venue					VARCHAR (30)			NULL,				--- Suggestive ActivityVenue
	alternate_venue			VARCHAR (30)			NULL,				--- Suggestive ActivityVenue
                            
	txn_ts					ROWVERSION			NOT NULL,
	audit_log_id			audit_log_id		NOT NULL	CONSTRAINT	SetupActivities_FK_AuditLogID
																REFERENCES	audit_logs,

		CONSTRAINT	SetupActivities_UK_ActivitityID_WeekNumber_OffsetDays
			UNIQUE	CLUSTERED	(	activity_id, week_no, offset_days	),

		CONSTRAINT	SetupActivities_CK_Venue_AlternateVenue
			CHECK	(	(	venue	IS		NULL	AND	alternate_venue	IS	NULL	)
					OR	(	venue	IS NOT	NULL									)
					)
)
GO


--	====================================================================================================
---- Schedules Activities
---		The information in the following two tables is setup using an action which uses the setup_activities information
--		and puts the schedule for an year along with session details.
--	====================================================================================================

CREATE	TABLE	scheduled_activities
(
 	scheduled_activity_id	generic_entity_id	NOT NULL	IDENTITY (1, 1)
															CONSTRAINT	ScheduledActivities_PK_ScheduledActivityID
																PRIMARY	KEY	NONCLUSTERED,

 	activity_id				generic_entity_id	NOT	NULL	CONSTRAINT	ScheduledActivities_FK_ActivityID
																REFERENCES	activities,

	activity_dt				DATE				NOT NULL,

		--- Trigger ensures that the Satsang Session Type can be specified only when is_at_dera has been set.
		---- Activities at Beas are associated with a Satsang Session Type
 	satsang_session_type_id	generic_entity_id		NULL	CONSTRAINT	ScheduledActivities_FK_SatsangSessionTypeID
																REFERENCES	satsang_session_types,

		--- Trigger ensures that the venue/alternate_venue can be specified only when is_at_india_centre or is_at_abroad_centre is set.
	venue					VARCHAR (30)			NULL,				--- Suggestive ActivityVenue
	alternate_venue			VARCHAR (30)			NULL,				--- Suggestive ActivityVenue
                            
	is_cancelled			BIT					NOT NULL	CONSTRAINT	ScheduledActivities_DF_IsCancelled
																DEFAULT	0,
	txn_ts					ROWVERSION			NOT NULL,
	audit_log_id			audit_log_id		NOT NULL	CONSTRAINT	ScheduledActivities_FK_AuditLogID
																REFERENCES	audit_logs,

		CONSTRAINT	ScheduledActivities_UK_ActivitityID_WeekNumber_OffsetDays
			UNIQUE	CLUSTERED	(	activity_id, activity_dt	),

		CONSTRAINT	ScheduledActivities_CK_Venue_AlternateVenue
			CHECK	(	(	venue	IS		NULL	AND	alternate_venue	IS	NULL	)
					OR	(	venue	IS NOT	NULL									)
					)
)
GO


--	====================================================================================================
---		Sessions for an year are generated using an Action button, which puts here the data using information in session_compositions.
---- Typically this should be a tabular screen having Year as simple field and other information in grid.
--	====================================================================================================

CREATE	TABLE	satsang_sessions
(
	satsang_session_id		generic_entity_id		NOT NULL	IDENTITY (1, 1)
																CONSTRAINT	SatsangSessions_PK_SatsangSessionID
																	PRIMARY	KEY	NONCLUSTERED,

	yr						SMALLINT				NOT NULL	CONSTRAINT	SatsangSessions_CK_Year
																	CHECK	(	yr	BETWEEN	2000	AND	2100	),

 	satsang_session_type_id	generic_entity_id			NULL	CONSTRAINT	SatsangSessions_FK_SatsangSessionTypeID
																	REFERENCES	satsang_session_types,

	session_cd				entity_small_cd			NOT NULL,
	session_nm				entity_small_nm			NOT NULL,
	session_print_nm		entity_small_nm				NULL,

	session_start_dt		DATE					NOT NULL,
	session_end_dt			DATE					NOT NULL,

	txn_ts					ROWVERSION				NOT NULL,
	audit_log_id			audit_log_id			NOT NULL	CONSTRAINT	SatsangSessions_FK_AuditLogID
																	REFERENCES	audit_logs,

		CONSTRAINT	SatsangSessions_U1_Year_SessionCode
			UNIQUE	NONCLUSTERED	(	yr, session_cd	),

		CONSTRAINT	SatsangSessions_U2_Year_SessionStartDate
			UNIQUE	CLUSTERED		(	yr, session_start_dt	),

		CONSTRAINT	SatsangSessions_U3_Year_SessionEndDate
			UNIQUE	NONCLUSTERED	(	yr, session_end_dt	),

		CONSTRAINT	SatsangSessions_CK_SessionStartDate_SessionEndDate
			CHECK	(	session_start_dt	<	session_end_dt	)
)
GO

--	====================================================================================================


