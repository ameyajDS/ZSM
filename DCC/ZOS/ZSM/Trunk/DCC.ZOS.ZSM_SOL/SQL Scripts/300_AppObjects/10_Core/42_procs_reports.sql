/* ==================================================================================
    Source File		:	42_procs_reports.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Tue Dec 07 08:59 IST 2010
    Version			:	1.72
    Last updated	:	08-Jan, 2016
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		This is re-runnable script and thus is pre-qualified with DROP statements.
    ==================================================================================
								      								  Revision History
    ----------------------------------------------------------------------------------
		v1.73 : JL : 07-Jan-2016
			* Stored procedure GenerateAreaWiseSewadarList has been changed to support a boolean parameter, which when set (to Yes)
			  renders Age, Department and Mobile number, and when unset (to No) renders Age, Status, YOA, Old G.R.No. and Department (as earlier).
		v1.72 : JL : 25-Dec-2015
			* Stored procedure GenerateSewadarsReportingCards has been added
		v1.71 : JL : 15-Feb-2015
			* Stored procedure GenerateAttndncSummryBtwnRange has been changed to handle accumulated sewa days in 3 digits and two decimal places.
		v1.70 : JL : 28-Jun-2014
			* All stored procedures that have the option of generating a Summary Report have
			  been modified to use major_information_header instead of extra_information_header. (Issue 3010)
		v1.69 : JL : 28-Jun-2014
			* Stored Procedure GenerateSewadarListWithIncorrectHealthDetails has been added.
		v1.68 : JL : 13-Jun-2014
			* Stored Procedure GenerateAreaWiseSewadarList has been changed to report all Centres/Sub-Centres/Points
			  even though these may not be below the Satsang Centre hierarchy for which the report is being taken.
		v1.67 : JL : 14, 15-May-2014
			* Stored Procedure GenerateDailyDeptWiseSummary has been added.
		v1.66 : JL : 13-May-2014
			* Stored Procedure GenerateCnstrctnAttndncSummary has been modified to put the totals properly and order of shifts. 
			  And this uses now Synopsis Report (instead of Summary Report).
		v1.65 : JL : 13-May-2014
			* Stored Procedure SynopsisSessionDeptWise has been added for showing the percentage along with total and present strength.
			* Stored Procedure GenerateAttndncSummryBtwnRange now calls SynopsisSessionDeptWise (instead of SummariseSessionSumDeptWise) and
			  other changes have been done including the change in Column Heading.
			* Stored Procedure SummariseSessionSumDeptWise has been dropped since it is not used by any other procedure.
		v1.64 : JL : 10-Jan-2014
			* Stored Procedure GenerateInvalidSewaShiftsSewadars added.
		v1.63 : JL : 05-Jan-2014
			* Most of the stored procedures that were rendering data using current_sewadar_grno have been changed to report
			  data using sewadar_grno from sewadars_registrations.
		v1.62 : JL : 05-Jan-2014
			* Stored Procedure GenerateNotBadgesPrintedList added.
			* Stored Procedure GenerateAreaWiseSewadarList to support an additional parameter Sewadars List ID.
		v1.61 : JL : 31-Dec-2013
			* Stored Procedure GenerateBadgesPrintedList changed to fix the violation of the Primary Key Constraint 
			  GenericReportDetails_PK_SessionID_SatsangCentreID_SewadarGRNo Error.
		v1.60 : JL : 26-Nov-2013
			* Stored Procedure GenerateAttndncSummryBtwnRange (for Daily Scanned Attendance in Range Report) now has an additional
			  boolean parameter, which if set, excludes the Outstation Sewadars that were present previous day. Note that these
			  sewadars are excluded only if the report is taken for a single day, that is, when FROM and TILL sewa dates are same.
		v1.59 : JL : 17-Nov-2013
			* Stored Procedure SummariseSessionSumDeptWise changed so that the summation is now done on a part of string.
			  This caused problem in "Daily Scanned Attendance in Range" report. Note that the Summary report gives the
			  number of Days of Sewa for each Department.
		v1.58 : JL : 10-Nov-2013
			* Stored Procedure SummariseSewa changed so that the check of Time-stamps of Summarisation and Attendance
			  recording is performed before the check for Deleted Time-stamp check. This has been done to NOT to
			  throw error when couple of reports call SummariseSewa before rendering data.
		v1.57 : JL : 10-Nov-2013
			* Stored Procedure GenerateAreaWiseSewadarList was not set-up with proper agruments; this has been done.
			* Stored Procedures GenerateAttndncSummryBtwnRange (for Daily Scanned Attendance in Range Report) now restricts
			  to an Area as the Weekly Satsang Centres of Sewadars. It also shows Sewadar's Age, Contact Phone Number and 
			  Weekly Satsang Centre for a Sewadar apart for number of Days of Sewa done in the period specified.
			* Stored Procedure GenerateSewadarsAddrTelList now considers Weekly Satsang Centre (if Area is specified) for
			  grouping of Sewadars. If Area is not specified, the report lists Sewadars as per their Departments.
		v1.56 : JL : 05-Nov-2013
			* Stored Procedure GenerateSewadarsAddrTelList changed to support optional restriction of the List to Sewadars of an Area as per their
			  weekly Satsang Centre.
		v1.55 : JL : 21-Oct-2013
			* Stored Procedure GenerateAreaWiseSewadarList modified to summarize the data, if need be.
		v1.54 : JL : 20-Sep to 24-Sep-2013
			* All Stored Procedures that raise error also now return a negative value apart from raising the error.
			* All calls to stored procedures now check the return value, and if the return value is non-zero, the
			  calling stored procedure also returns with the returned value.
		v1.53 : JL : 18-Sep-2013
			* Stored Procedures, which called SummariseSewa did not propogate the error, if any. Now the Stored Procedures
			  ArchiveSewa, ComputeCredits, ComputeCreditsNew, 
		v1.52 : JL : 17-Sep-2013
			* Stored Procedure ArchiveSewa modified so that the computed sewas also have the summary, deletion and locked timestamps.
		v1.51 : JL : 25-Aug-2013
			* Stored Procedure ArchiveSewa modified as part of review for releasing for use. 
		v1.50 : JL : 21-Apr-2013
			* Stored Procedure GenerateAreaWiseSewadarList modified to support restricting sewadars in an age group.
		v1.49 : JL : 17-Mar-2013
			* Stored Procedure GenerateBulkRegistrationReport added.
		v1.48 : JL : 01-Feb-2013
			* Stored Procedure GenerateDailySewaTurnOut (Turn-out Summary for Daily Sewas Report) now handles 5 figure of sewadars strength instead of 4 figure previously.
		v1.47 : JL : 28-Jan-2013
			* SummariseSewa Stored Procedure raised an error if Sewa's Attendance Marking was Summary. Now, it does not raise an error, and
			  simply returns.
		v1.46 : JL : 28-Jan-2013
			* Sewadar List (Status-wise) Report renders the Status if multiple Status are selected as parameter; telephone is not rendered now.
			  Stored Procedure GenerateSewadarList has been changed.
			* Name of Sewa-wise Team List (Status-wise) Report has been changed to Sewa Teams List. It also now renders the count of Sewadars
			  within parenthesis. Stored Procedure GenerateSewaTeamList has been changed.
		v1.45 : JL : 20-Jan-2013
			* Stored Procedure GenerateSewadarRegister can now restrict the Sewadars to a Sewadar List, if specified.
		v1.44 : JL : 10-Jan-2013
			* Stored Procedure GenerateSewadarRegister now uses JOIN on sewadar_id instead of Current Satsang Centre and Current Sewadar GRNo.
			* Procedure GenerateSewadarListReport has been changed as Report "Sewadars List" can now be filtered on Departments and Gender, if required.
		v1.43 : JL : 06-Jan-2013
			* Stored Procedure ComputeCredits changed to ignore Sewadars who are not present if Presence Sewa ID
			  for a Credit Specification has been specified.
		v1.42 : JL : 06-Jan-2013
			* Stored Procedure ComputeCredits changed to consider the Last Appointment Date.
		v1.41 : JL : 05-Jan-2013
			* Stored Procedure for Sewadar Register (GenerateSewadarRegister) changed to support Sub-departments restriction,
			  if provided as parameter.
		v1.40 : JL : 29-Nov-2012
			* Reports "Sewadars with missing Remarks Type", "Sewadars who have not clicked Photo", and "List of Sewadars with missing Addresses" will now output a list (to save paper).
			  Therefore, corresponding Stored Procedures GenerateSewadarsPhotoNotClickd and GenerateMissingAddressesList have been changed; GenerateSewadarsListWithMissingRemarks did
			  not require change.
			* Stored Procedure GenerateUnallocatedSewadars changed so as NOT to project column information as List is printed without any information.
		v1.39 : JL : 25-Nov-2012
			Stored Procedure GenerateAreaWiseSewadarList changed to add an additional column for Old. G.R.No.
		v1.38 : JL : 28-Oct-2012
			Stored Procedure GenerateMissingAddressesList changed as it was resulting in multiple Sewadar Records.
		v1.37 : JL : 24-Oct-2012
			Stored Procedure GenerateSewadarsListWithMissingRemarks added.
		v1.36 : JL : 21-Oct-2012
			Stored Procedure GenerateSewadarListGRNoWise added.
		v1.35 : JL : 19-Aug-2012
			In Stored Procedure GenerateSewaSummarySewadarList, JOIN with sewadars table was using Current Satsang Centre and Current G.R.No. This
			has been changed so as to use Sewadar ID.
		v1.34 : AJ : 04-Aug-2012
			Stored Procedure GenerateAreaWiseSewadarList has been uncommented & fixed the table reference CDB..satsang_centres
		v1.33 : JL : 31-Jul-2012
			Stored Procedure GenerateAreaWiseSewadarList has been commented as it was breaking the build. Ameya to un-comment when committing relevant Schema changes.
		v1.32 : JL : 29-Jul-2012
			Stored Procedure GenerateAreaWiseSewadarList added.
		v1.31 : JL : 29-Jul-2012
			All INSERTs into generic_report_details are now qualified with Column Names. This has been done to take care of new addition of columns in this table.
		v1.30 : JL : 12-Jul-2012
			In Stored Procedure GenerateDataMigrationReport, Satsang Centre was not taken from the Sewadar list.
		v1.29 : JL : 25-Jun-2012
			* Stored procedure GenerateSewadarListWithoutWeeklyCentres did not check the absence of Weekly Satsang Centre.
		v1.28 : JL : 25-Jun-2012
			* Stored procedure GenerateSewadarListWithoutWeeklyCentres written for the new report 'Sewadars List without Weekly Satsang Centres'.
		v1.27 : JL : 29-May-2012
			In Stored Procedure GenerateDataMigrationReport, Sub-department was required to be present always. This is fixed.
		v1.26 : JL : 07-May-2012
			In Stored Procedure GenerateDataMigrationReport, now the Department and Sub-department, if any, is also rendered.
		v1.25 : JL : 06-May-2012
			In Stored Procedure GenerateBadgesPrintedList, the Column Type (corresponding to Badge Template) has been removed
			because Badge Template is a mandatory parameter.
		v1.24 : AJ : 28-Apr-2012
			Fixed GenerateDataMigrationReport removed the where clause of remarks_sq = 1
		v1.24 : JL : 21-Apr-2012
			Stored Procedure GenerateDataMigrationReport added.
		v1.23 : JL : 24-Mar-2012
			* Fixed System Information Code as SttsGenUse (from SttsGen) in Stored Procedure GenerateSubDepartmentsList
			  associated with List of Sub-Departments. This was resulting in not listing the Departments that do not
			  have Sub-Departments.
		v1.22 : JL : 24-Mar-2012
			* Fixes in Stored Procedure MakeListReport:
				+ Gender detection was not correct
				+ Number of rows per page is 58 (instead of 57)
				+ When number of full pages for a Department / Sub-department was 1, it was not filling the remaining page
				+ Order of filling the balance departments was not as per maximum records
		v1.21 : JL : 12-Mar-2012
			* Fixes in Stored Procedure MakeListReport as two columns were considered across pages instead
			  of being on the same page; the computations have been re-worked and corrected.
		v1.20 : JL : 11-Mar-2012
			* Added Stored Procedure MakeListReport for creating data for column-wise reports.
		v1.19 : AJ : 22-Feb-2012
			* Added the summarization of data in GenerateAttndncCompletedTillDate.
		v1.18 : AJ : 12-Feb-2012
			* Added new SP GenerateAttndncCompletedTillDate for new attendance report to load 
			  sewadars who completed their max sewa on given date with exemptions 
			  as per arbirary presences
		v1.17 : JL : 17-Jan-2012
			* For Trainee and Open Sewadars, instead of Year of Appointment, System ID is printed.
			  Stored Procedure GenerateTraineeOrOpenSewadarRegister has been thus changed.
		v1.16 : JL : 04-Jan-2012
			* In Stored Procedure GenerateSewadarsAddrTelList, Satsang Centre Name parameter was not specified, though
			  it was expected as per the table definition.
		v1.15 : JL : 01-Jan-2012
			* In Stored Procedure ComputeCredits, the conditions to check the individual sewa criteria
			  now preceeds with the check for a total number of Sewas that should exist for each of the Sewadars
			  for which the criteria is specified after the previous check. The two checks have now been swapped.
			  Previously it was assumed that there would not be any record with credits as 0 in Sewadar's Summary.
		v1.14 : JL : 31-Dec-2011
			* Stored Procedure SummariseSewa did not compute Summarised Exemptions correctly; this is fixed.
			* Stored Procedure ComputeCredits did not work fine with is_outstation_sewadar clause; a workaround has been put.
			  A permanent table has been used instead of a memory table; the table needs to be regularised later.
						CREATE TABLE tmp_sewadar_credits
								(
									credit_specification_id	INTEGER				NOT NULL,
									sewadar_grno		CHAR (6)			NOT NULL,
									satsang_centre_id	INTEGER				NOT NULL,
									sewa_id				INTEGER				NOT NULL,
									eligible_credit_cnt	INTEGER				NOT NULL,
									
									PRIMARY	KEY		(credit_specification_id, sewadar_grno, satsang_centre_id, sewa_id)
								)
			* Stored Procedure GenerateSewaSummary did not account for exemptions if a person was completely absent; this is fixed.
		v1.13 : JL : 30-Dec-2011
			* Stored Procedure GenerateNewSewadarsList now accepts an additional parameter SewadarType.
		v1.12 : JL : 27-Dec-2011
			* Stored Procedure GenerateDailySewaTurnOut has now an additional parameter for Gender.
		v1.11 : JL : 18-Dec-2011
		    * There was a parameter mis-match on invocation of stored procedure GenerateSewadarsQualifications; this is fixed.
			* Stored Procedure GenerateSewadarsEligiblesList corrected as it was resulting in a Primary Key violation error.
		v1.10 : JL : 17-Dec-2011
			* New Stored Procedures SummariseLocationWiseTraineeSewadars, SummariseLocationWiseOpenSewadars and SummariseLocationWiseTraineeOrOpenSewadars written.
		v1.09 : JL : 16-Dec-2011
			* Stored Procedure ComputeCredits changed such that temporary table has been replaced with memory tables.
			* Stored Procedure SummariseSubDeptSewadarsCount now accepts an additional parameter SewadarType.
			* New Stored Procedures GenerateTraineeSewadarRegister, GenerateOpenSewadarRegister and GenerateTraineeOrOpenSewadarRegister written.
		v1.08 : JL : 15-Dec-2011
			* Function GetSewadarQualifications does not restrict the qualifications to a Qualification Category for a Sewadar;
			  instead it would list all the Qualifications for a Sewadar (its parameter for Qualification Category has been dropped).
			  The impact of this change will be on report 'Qualification Category-wise Sewadars List', which will now list call qualifications
			  for a Sewadar, if a Sewadar has a qualification falling in the Qualification Category supplied as a parameter to the Report.
		    * A stored procedure GenerateSewadarsQualifications written for report 'Sewadars List with Qualifications'
		v1.07 : JL : 11-Dec-2011
			Stored Procedure GenerateSpclstnAreaSewadarList corrected as it had an extra JOIN on sewadars_details table.
			Stored Procedure GenerateDailySewaTurnOut modified as sewa_id was ambiguous (artifact of adding sewa_id in sewadars_registrations).
			Stored Procedure GenerateSewadarsAcquiredAge changed to remove a space from the Column Header.
		v1.06 : JL : 20-Nov-2011
			Stored GenerateSewadarsListWithRemarks changed to NOT to emit Status because (a) it is not essential in
			this report, and (b) it affects the formatting when remarks span more than one line.
		v1.05 : JL : 15-Nov-2011
			Stored Procedure GenerateAnnotationsList dropped; instead procedure GenerateSewadarsListWithRemarks added
			along with a function GetSewadarRemarks.
		v1.04 : JL : 11-Nov-2011
			Stored Procedure GenerateSewadarsPhotoNotClickd corrected to show the correct results.
		v1.03 : JL : 11-Nov-2011
			Stored Procedure GenerateSewadarListWithoutPhoto for "Sewadars List without Photo" report has been added.
		v1.02 : JL : 11-Nov-2011
			Stored Procedure GenerateSewadarRegister changed to support two additional parameters, viz., Districts (multi-select) and
			Show Districts. The behaviour of the Sewadar Register is as below:
					Districts		Show Districts
					~~~~~~~~~		~~~~~~~~~~~~~~
				Not specified		No					Previous behaviour (prints Status of Sewadar)
				Specified			No					Prints City of Sewadar
				Not specified		Yes					Prints District of Sewadar
				Specified			Yes					Prints District of Sewadar
		v1.01 : JL : 28-Oct-2011
			Stored Procedure GenerateSewaSummarySewadarList had in-sufficient JOIN conditions; satsang_centre_id was
			ignored at couple of places. This has been fixed.
		JL : ??-Dec-2010
			*   Initial version
   ==================================================================================*/

-- =============================================================================

-- ======================================================================================================================
-- FUNCTION FormatIntegerToString
-- ======================================================================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'FormatIntegerToString' AND xtype = 'FN')
	DROP FUNCTION FormatIntegerToString
GO

CREATE FUNCTION FormatIntegerToString
(
	@p_integer				INTEGER,
	@p_length				TINYINT
)
RETURNS
	VARCHAR (20)
AS
BEGIN
	DECLARE
		@return_str	VARCHAR (20),
		@len		TINYINT;
		
	SET @return_str = '' + CONVERT (VARCHAR, @p_integer);
	RETURN SPACE (@p_length - LEN(@return_str)) + @return_str;
END
GO

-- ======================================================================================================================
-- FUNCTION FormatNumericToString
-- ======================================================================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'FormatNumericToString' AND xtype = 'FN')
	DROP FUNCTION FormatNumericToString
GO

CREATE FUNCTION FormatNumericToString
(
	@p_numeric				NUMERIC (12, 1),
	@p_length				TINYINT
)
RETURNS
	VARCHAR (20)
AS
BEGIN
	DECLARE
		@return_str	VARCHAR (20),
		@len		TINYINT;
	
	SET @return_str = '' + CONVERT (VARCHAR, @p_numeric);
	RETURN SPACE (@p_length - LEN(@return_str)) + @return_str;
END
GO

-- =============================================================================
-- Procedure MakeListReport	(session_id)
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'MakeListReport' AND xtype = 'P')
	DROP PROCEDURE MakeListReport
GO

CREATE PROCEDURE MakeListReport
(
	@p_session_id			integer
)
AS
	DECLARE
		@itrn	INTEGER,
		@cnt	INTEGER,
		@id		INTEGER,
		@tid	INTEGER,
		@lstid	INTEGER,
		@sid	INTEGER,
		@lfrows	INTEGER,
		@pgrecs	INTEGER,
		@pgrows	INTEGER,
		@bkrecs	INTEGER,
		@bkrows	INTEGER;
BEGIN
		---- Constants
	SET @pgrows = 58;			--- Number of rows in a page
	SET @pgrecs = @pgrows * 2;	--- Number of records in a page
	SET @bkrows = 7;			--- Number of rows equivalent to a group header
	SET @bkrecs = @bkrows * 2;	--- Number of records equivalent to a group header

	DECLARE	@tbl	TABLE
		(	id			INTEGER			NOT NULL	IDENTITY (1, 1),
			dept_id		INTEGER			NOT NULL,
			sub_dept_id	INTEGER				NULL,
			gender		CHAR (1)		NOT NULL,
			cnt			INTEGER			NOT NULL,
			serial_id	INTEGER				NULL,
			sub_hdr		VARCHAR (200)	NOT	NULL,
			pgbrk		CHAR (1)		NOT NULL,
			start_rid	INTEGER				NULL
		);

	INSERT	INTO	@tbl
			(	dept_id, sub_dept_id, gender, cnt, pgbrk, sub_hdr	)
		SELECT	b.department_id, b.sub_department_id, SUBSTRING (gender, 1, 1), COUNT (*), 'N',
				department_nm + COALESCE (' (' + sub_department_nm + ')', '') + ' - ' + CASE	gender WHEN 'Male' THEN 'Gents' ELSE 'Ladies' END
		FROM	generic_report_details	a
			JOIN	sewadars_registrations	b
				ON	(	a.session_id		=	@p_session_id
					AND	b.satsang_centre_id	=	a.satsang_centre_id
					AND	b.sewadar_grno		=	a.sewadar_grno
					)
			JOIN	sewadars	c
				ON	(	b.sewadar_id	=	c.sewadar_id
					)
			JOIN	departments	d
				ON	(	b.department_id	=	d.department_id	)
			LEFT JOIN	sub_departments	s
				ON	(	b.sub_department_id	=	s.sub_department_id	)
		GROUP BY b.department_id, b.sub_department_id, gender, department_nm, sub_department_nm
		ORDER BY 6;
	
	SET @itrn = 0;

	UPDATE	@tbl
		SET	serial_id	=	id
	WHERE	cnt / @pgrecs >= 1
	OR		cnt % @pgrecs > @pgrecs - (@bkrows + 1) * 2;

	UPDATE	@tbl
		SET	pgbrk	=	'Y'
	WHERE	cnt % @pgrecs > @pgrecs - (@bkrows + 1) * 2;

	DECLARE	fill_crsr	CURSOR FOR
		SELECT	id, serial_id, cnt % @pgrecs
		FROM	@tbl
		WHERE	serial_id	IS NOT NULL
		AND		cnt % @pgrecs	BETWEEN	1 AND @pgrecs -  (@bkrows + 1) * 2
		AND		pgbrk	=	'N'
		ORDER BY serial_id
		FOR READ ONLY;
	
	OPEN	fill_crsr;

	FETCH	fill_crsr
		INTO	@id, @sid, @cnt;
	
	WHILE (@@FETCH_STATUS = 0)
	BEGIN
		SET @lstid = NULL;
		SET @lfrows = (@pgrecs - @cnt - (@cnt % 2)) / 2;
		WHILE (@lfrows > @bkrows)
		BEGIN
			SELECT	TOP 1	@tid = id
			FROM	@tbl
			WHERE	serial_id	IS NULL
			AND		cnt	=	(	SELECT	MAX (cnt)
								FROM	@tbl
								WHERE	serial_id	IS NULL
								AND		cnt	<= (@lfrows - @bkrows) * 2
							);
			IF (@@ROWCOUNT > 0 AND @tid IS NOT NULL)
			BEGIN
				UPDATE	@tbl
					SET	serial_id	=	serial_id + 1
				WHERE	serial_id	IS NOT NULL
				AND		serial_id	>	@sid + @itrn;

				SELECT	@lfrows = @lfrows - (cnt + (cnt % 2)) / 2 - @bkrows
				FROM	@tbl
				WHERE	id	=	@tid;

				SET @lstid = @tid;

				SET @itrn = @itrn + 1;
				UPDATE	@tbl
					SET	serial_id	=	@sid + @itrn
				WHERE	id	=	@tid;
			END
			ELSE
				SET @lfrows = 0;
		END
		IF (@lstid IS NULL)
			SET @lstid = @id;
		UPDATE	@tbl
			SET	pgbrk	=	'Y'
		WHERE	id	=	@lstid;
		FETCH	fill_crsr
			INTO	@id, @sid, @cnt;
	END
	
	CLOSE	fill_crsr;
	DEALLOCATE	fill_crsr;

	SELECT	@sid = MAX (COALESCE (serial_id, 0))
	FROM	@tbl;

	SET @id = NULL;

	SELECT	TOP 1	@id = id, @cnt = cnt
	FROM	@tbl
	WHERE	serial_id	IS NULL
	ORDER BY cnt DESC;

	WHILE (@id IS NOT NULL)
	BEGIN
		SET @lstid = NULL;
		SET @sid = @sid + 1;

		UPDATE	@tbl
			SET	serial_id	=	@sid
		WHERE	id	=	@id;

		SET @lfrows = (@pgrecs - @cnt - (@cnt % 2)) / 2;
		WHILE (@lfrows > @bkrows)
		BEGIN
			SELECT	TOP 1	@tid = id
			FROM	@tbl
			WHERE	serial_id	IS NULL
			AND		cnt	=	(	SELECT	MAX (cnt)
								FROM	@tbl
								WHERE	serial_id	IS NULL
								AND		cnt	<= (@lfrows - @bkrows) * 2
								AND		id	!=	@id
							);
			IF (@@ROWCOUNT > 0 AND @tid IS NOT NULL)
			BEGIN
				SELECT	@lfrows = @lfrows - (cnt + (cnt % 2)) / 2 - @bkrows
				FROM	@tbl
				WHERE	id	=	@tid;

				SET @lstid = @tid;
				SET @sid = @sid + 1;

				UPDATE	@tbl
					SET	serial_id	=	@sid
				WHERE	id	=	@tid;
			END
			ELSE
				SET @lfrows = 0;
		END
		IF (@lstid IS NULL)
			SET @lstid = @id;
		UPDATE	@tbl
			SET	pgbrk	=	'Y'
		WHERE	id	=	@lstid;

		SET @id = NULL;

		SELECT	TOP 1	@id = id, @cnt = cnt
		FROM	@tbl
		WHERE	serial_id	IS NULL
		ORDER BY cnt DESC;
	END

--SELECT * from @tbl order by serial_id;

	INSERT INTO	generic_list_report_headers
		SELECT	@p_session_id, serial_id, sub_hdr, CASE pgbrk WHEN 'Y' THEN 'Yes' WHEN 'N' THEN 'No' END
		FROM	@tbl
		ORDER BY serial_id;

	DECLARE	@dtl	TABLE
		(	rid			INTEGER			NOT NULL	IDENTITY (1, 1),
			hdr_srl_id	INTEGER			NOT NULL,
			cnt			INTEGER			NOT NULL,
			centre_id	INTEGER			NOT	NULL,
			grno		CHAR (6)		NOT	NULL,
			nm			VARCHAR (100)	NOT	NULL
		);

	INSERT	INTO	@dtl
			(	hdr_srl_id, cnt, centre_id, grno, nm	)
		SELECT	t.serial_id, t.cnt, b.satsang_centre_id, b.sewadar_grno, c.first_nm + ' ' + COALESCE (SUBSTRING (c.middle_nm, 1, 1) + '.', '') + ' ' + c.last_nm
		FROM	generic_report_details	a
			JOIN	sewadars_registrations	b
				ON	(	a.session_id		=	@p_session_id
					AND	b.satsang_centre_id	=	a.satsang_centre_id
					AND	b.sewadar_grno		=	a.sewadar_grno
					)
			JOIN	sewadars	c
				ON	(	b.sewadar_id	=	c.sewadar_id
					)
			JOIN	@tbl	t
				ON	(	b.department_id	=	t.dept_id
					AND	(	(	b.sub_department_id IS NULL		AND	t.sub_dept_id IS NULL		)
						OR	(	b.sub_department_id IS NOT NULL	AND	t.sub_dept_id IS NOT NULL
							AND	b.sub_department_id	=	t.sub_dept_id
							)
						)
					AND	SUBSTRING (c.gender, 1, 1)	=	t.gender
					)
		ORDER BY 1, 5;
	UPDATE	@tbl
		SET	start_rid	=	(	SELECT	MIN	(rid)
								FROM	@dtl
								WHERE	hdr_srl_id	=	serial_id
							);
	
	INSERT INTO generic_list_report_details
			(	session_id, header_serial_id, column1_serial_id, column1_satsang_centre_id, column1_sewadar_grno, column1_sewadar_nm,
				column2_serial_id, column2_satsang_centre_id, column2_sewadar_grno, column2_sewadar_nm
			)
		SELECT	@p_session_id, t.serial_id, d.rid - t.start_rid + 1, d.centre_id, d.grno, d.nm,
											r.rid - t.start_rid + 1, r.centre_id, r.grno, r.nm
		FROM	@dtl	d
			JOIN	@tbl	t
				ON	(	d.hdr_srl_id	=	t.serial_id
					AND	(	(	d.cnt	<=	@pgrecs	AND	d.rid	BETWEEN	t.start_rid	AND	t.start_rid + (d.cnt / 2) + (CASE d.cnt % 2 WHEN 0 THEN -1 ELSE 0 END))
						OR	(	d.cnt	>	@pgrecs	AND	(d.rid - t.start_rid + 1)	<=	(d.cnt / @pgrecs) * @pgrecs	AND	((d.rid - t.start_rid) / @pgrows) % 2 = 0	)
						OR	(	d.cnt	>	@pgrecs	AND	(d.rid - t.start_rid + 1)	>	(d.cnt / @pgrecs) * @pgrecs
															AND	(d.rid - t.start_rid + 1) BETWEEN	(d.cnt / @pgrecs) * @pgrecs + 1
																							AND		(d.cnt / @pgrecs) * @pgrecs + (d.cnt - (d.cnt / @pgrecs) * @pgrecs) / 2 + (d.cnt % 2))
						)
					)
			LEFT JOIN	@dtl r
				ON	(	r.hdr_srl_id	=	t.serial_id
					AND	(	(	d.cnt	<=	@pgrecs	AND	r.rid	=	d.rid + (t.cnt / 2) + (t.cnt % 2)	)
						OR	(	d.cnt	>	@pgrecs	AND	(r.rid - t.start_rid + 1)	<=	(d.cnt / @pgrecs) * @pgrecs AND r.rid = d.rid + @pgrows	)
						OR	(	d.cnt	>	@pgrecs	AND	(r.rid - t.start_rid + 1)	>	(d.cnt / @pgrecs) * @pgrecs AND r.rid = d.rid + ((d.cnt - (d.cnt / @pgrecs) * @pgrecs) / 2) + (d.cnt % 2))
						)
					);
END
GO

-- =============================================================================
-- Procedure SynopsisSessionDeptWise	(session_id)
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'SynopsisSessionDeptWise' AND xtype = 'P')
	DROP PROCEDURE SynopsisSessionDeptWise
GO

CREATE PROCEDURE SynopsisSessionDeptWise
(
	@p_session_id			integer,
	@p_satsang_centre_id	integer,
	@p_sewa_id				integer
)
AS

BEGIN
	DELETE	FROM	generic_report_synopsis
	WHERE	session_id	=	@p_session_id

	DECLARE	@tmp_gnts	TABLE
		(	department_id	INTEGER,
			sm				NUMERIC (12,1)
		)

	DECLARE	@tmp_lds	TABLE
		(	department_id	INTEGER,
			sm				NUMERIC (12,1)
		)
	DECLARE	@tmp_dept_cnt	TABLE
		(	department_id	INTEGER,
			gents_count		INTEGER,
			gents_sum		NUMERIC (12,1),
			gents_percent	NUMERIC (6,2),
			ladies_count	INTEGER,
			ladies_sum		NUMERIC (12,1),
			ladies_percent	NUMERIC (6,2)
		)

		--- Get the department strengths for gents and ladies respectively
	INSERT	INTO	@tmp_gnts
		SELECT	department_id, COUNT (sewadar_grno)
		FROM	sewadars s
			JOIN	sewadars_registrations sr
				ON	(	s.sewadar_id				=	sr.sewadar_id
					AND is_outstation_sewadar		=	'No'
					AND	sr.satsang_centre_id		=	@p_satsang_centre_id
					AND	s.global_sewadar_status_cd	IS NULL
				)	
			JOIN	system_information_values	iv
					ON	(	iv.system_info_cd	=	'SttsGenUse'
						AND	iv.value_varchar	=	sewadar_status_cd
						)
			JOIN	sewas	w
					ON	(	w.sewa_id	=	@p_sewa_id	)
		WHERE	gender						=	'Male'
		AND		(	(	gents_born_after	IS NULL	)
				OR	(	gents_born_after	IS NOT NULL
					AND	s.birth_dtm			>=	gents_born_after
					)
				)
		GROUP BY department_id

	
	INSERT	INTO	@tmp_lds
		SELECT	department_id, COUNT (sewadar_grno) as females 
		FROM	sewadars s
			JOIN	sewadars_registrations sr
				ON	(	s.sewadar_id				=		sr.sewadar_id
					AND is_outstation_sewadar		=	'No'
					AND	sr.satsang_centre_id		=	@p_satsang_centre_id
					AND	s.global_sewadar_status_cd	IS NULL
					)	
			JOIN	system_information_values	iv
					ON	(	iv.system_info_cd	=	'SttsGenUse'
						AND	iv.value_varchar	=	sewadar_status_cd
						)
			JOIN	sewas	w
					ON	(	w.sewa_id	=	@p_sewa_id	)
		WHERE	gender						=	'Female'
		AND		(	(	ladies_born_after	IS NULL	)
				OR	(	ladies_born_after	IS NOT NULL
					AND	s.birth_dtm			>=	ladies_born_after
					)
				)
		GROUP BY department_id

	INSERT	INTO	@tmp_dept_cnt
			(	department_id, gents_count, ladies_count)
		SELECT	COALESCE (gnts.department_id, lds.department_id), gnts.sm, lds.sm
		FROM	@tmp_gnts gnts
			FULL OUTER JOIN	@tmp_lds lds
				ON	(	gnts.department_id = lds.department_id	);
	
	DELETE	@tmp_gnts;
	DELETE	@tmp_lds;
	
	INSERT	INTO	@tmp_gnts
		SELECT	b.department_id, SUM (CONVERT (NUMERIC (12,2), SUBSTRING (a.extra_information, 1, 5))) 
		FROM	generic_report_details	a
			JOIN	sewadars_registrations	b
				ON	(	a.session_id		=	@p_session_id
					AND	b.satsang_centre_id	=	a.satsang_centre_id
					AND	b.sewadar_grno		=	a.sewadar_grno
					)
			JOIN	sewadars	c
				ON	(	b.sewadar_id	=	c.sewadar_id
					AND	c.gender		=	'Male'
					)
		GROUP BY department_id;

	INSERT	INTO	@tmp_lds
		SELECT	b.department_id, SUM (CONVERT (NUMERIC (12,2), SUBSTRING (a.extra_information, 1, 5)))
		FROM	generic_report_details	a
			JOIN	sewadars_registrations	b
				ON	(	a.session_id		=	@p_session_id
					AND	b.satsang_centre_id	=	a.satsang_centre_id
					AND	b.sewadar_grno		=	a.sewadar_grno
					)
			JOIN	sewadars	c
				ON	(	b.sewadar_id	=	c.sewadar_id
					AND	c.gender		=	'Female'
					)
		GROUP BY department_id;
	
	UPDATE	dc
		SET	gents_sum	=	g.sm,
			ladies_sum	=	l.sm
	FROM	@tmp_dept_cnt	dc
		LEFT JOIN	@tmp_gnts	g
			ON	(	dc.department_id	=	g.department_id	)
		LEFT JOIN	@tmp_lds	l
			ON	(	dc.department_id	=	l.department_id	)
	
	UPDATE	@tmp_dept_cnt
		SET	gents_percent	=	gents_sum * 100 / gents_count,
			ladies_percent	=	ladies_sum * 100 / ladies_count;

	INSERT	INTO	generic_report_synopsis
			(	session_id, major_information, extra_information	)
		SELECT	@p_session_id,
				department_nm,
				COALESCE (dbo.FormatNumber (CAST (gents_count		AS VARCHAR), 6), SPACE (6)) +
				COALESCE (dbo.FormatNumber (CAST (gents_sum		AS VARCHAR), 9), SPACE (9)) + 
				COALESCE (dbo.FormatNumber (CAST (gents_percent	AS VARCHAR), 7), SPACE (7)) + 
				COALESCE (dbo.FormatNumber (CAST (ladies_count	AS VARCHAR), 8), SPACE (8)) +
				COALESCE (dbo.FormatNumber (CAST (ladies_sum		AS VARCHAR), 9), SPACE (9)) + 
				COALESCE (dbo.FormatNumber (CAST (ladies_percent	AS VARCHAR), 7), SPACE (7))
		FROM	@tmp_dept_cnt	a
			JOIN	departments		b
				ON	(	a.department_id = b.department_id	)
		ORDER BY 2;

		/*
	INSERT	INTO	generic_report_synopsis
			(	session_id, major_information, extra_information	)
		VALUES
			(	@p_session_id, '--------------------------------', '-----------------------------------------------')
			*/

	INSERT	INTO	generic_report_synopsis
			(	session_id, major_information, extra_information	)
		SELECT	@p_session_id,
				'TOTAL',
				dbo.FormatNumber (CAST (SUM (gents_count)	AS VARCHAR), 6) +
				dbo.FormatNumber (CAST (SUM (gents_sum)		AS VARCHAR), 9) + 
				dbo.FormatNumber (CAST (CAST ((SUM (gents_sum) * 100 / SUM (gents_count)) AS NUMERIC (6,2))	AS VARCHAR), 7) + 
				dbo.FormatNumber (CAST (SUM (ladies_count)	AS VARCHAR), 8) +
				dbo.FormatNumber (CAST (SUM (ladies_sum)	AS VARCHAR), 9) + 
				dbo.FormatNumber (CAST (CAST ((SUM (ladies_sum) * 100 / SUM (ladies_count)) AS NUMERIC (6,2))	AS VARCHAR), 7)
		FROM	@tmp_dept_cnt;

	INSERT	INTO	generic_report_synopsis
			(	session_id, major_information, extra_information	)
		VALUES
			(	@p_session_id, '================================', '===============================================')
END
GO
-- =============================================================================
-- Procedure SummariseSessionSumDeptWise	(session_id)
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'SummariseSessionSumDeptWise' AND xtype = 'P')
	DROP PROCEDURE SummariseSessionSumDeptWise
GO

-- =============================================================================
-- Procedure SummariseSewa
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'SummariseSewa' AND xtype = 'P')
	DROP PROCEDURE SummariseSewa
GO

CREATE PROCEDURE SummariseSewa
(
	@p_sewa_id				sewa_id
)
AS
	DECLARE
		@sewa_nm					gnc_nm,
		@start_dt					SMALLDATETIME,
		@finish_dt					SMALLDATETIME,
		@attendance_unit			attendance_unit,	-- Day, Shift
		@attendance_marking			VARCHAR (10),	-- Team-wise, Arbitrary, Summary, Computed
		@is_leave_allowed			Boolean,
		@is_exemption_allowed		Boolean,
		@referred_sewa_id			sewa_id,
		@attendance_ts				DATETIME,
		@summary_ts					DATETIME,
		@deleted_ts					DATETIME,
		@sewadar_grno				sewadar_grno,
		@exempt_days				numeric (6,2),
		@satsang_centre_id 			satsang_centre_id,		
		@dst_sewa_id				sewa_id
BEGIN

	SELECT	@sewa_nm				=	sewa_nm,
			@start_dt				=	start_dt,
			@finish_dt				=	finish_dt,
			@attendance_unit		=	attendance_unit,
			@attendance_marking		=	attendance_marking,
			@is_leave_allowed		=	is_leave_allowed,
			@is_exemption_allowed	=	is_exemption_allowed,
			@attendance_ts			=	attendance_ts,
			@summary_ts				=	summary_ts,
			@deleted_ts				=	deleted_ts,
			@referred_sewa_id		=	referred_sewa_id,
			@satsang_centre_id		=	satsang_centre_id
	FROM	sewas
	WHERE	sewa_id		=	@p_sewa_id


	SET	@dst_sewa_id			=	@p_sewa_id
	
	IF ( @attendance_marking = 'Computed')
		BEGIN
			SELECT	@sewa_nm				=	sewa_nm,
					@attendance_unit		=	attendance_unit,
					@attendance_marking		=	attendance_marking,
					@is_leave_allowed		=	is_leave_allowed,
					@is_exemption_allowed	=	is_exemption_allowed,
					@attendance_ts			=	attendance_ts,
					@deleted_ts				=	deleted_ts
			FROM	sewas
			WHERE	sewa_id		=	@referred_sewa_id

			IF (@@ROWCOUNT = 0 OR @sewa_nm IS NULL OR @sewa_nm = '')
				BEGIN
					EXEC SysAdmin..RaiseErrorMessage 'NotExist', NULL, 'Referred Sewa information', NULL, NULL
					RETURN -1;
				END

			SET	@p_sewa_id	=	@referred_sewa_id
		END

	IF (@attendance_marking = 'Summary')
		BEGIN
--			EXEC SysAdmin..RaiseErrorMessage 'ExistInfo', NULL, 'Summary for Sewa', NULL, NULL
			RETURN 0;			-- it is not an error; we cannot summarise the Sewa where the attendance is recorded as Summary only.
		END

	IF (@summary_ts IS NOT NULL AND @summary_ts >= @attendance_ts)
		BEGIN
			RETURN
		END
	IF (@deleted_ts IS NOT NULL)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'ExistInfo', NULL, 'Summary for Sewa (after Deletion)', NULL, NULL
			RETURN -2;
		END

	IF (@attendance_ts IS NULL)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'NotExist', NULL, 'Attendance information', NULL, NULL
			RETURN -3;
		END

	DECLARE	@swss	TABLE	(	cntr INT, grno	CHAR (6), p INT, a INT, l INT, e INT, PRIMARY KEY NONCLUSTERED (cntr, grno) 	);
	DELETE
	FROM	sewadar_wise_sewa_summaries
	WHERE	sewa_id	=	@dst_sewa_id

	SET	@summary_ts	=	GetDate()

	IF (@attendance_marking = 'Team-wise')
		BEGIN										---- [
			IF (@attendance_unit = 'Day')
				BEGIN							--- [
					INSERT INTO	@swss
						SELECT	sw.satsang_centre_id,
								sw.sewadar_grno,
								SUM (CASE WHEN tda.attendance = 'P' THEN 1 ELSE 0 END),
								SUM (CASE WHEN tda.attendance = 'A' THEN 1 ELSE 0 END),
								SUM (CASE WHEN tda.attendance = 'L' THEN 1 ELSE 0 END),
								SUM (CASE WHEN tda.attendance = 'E' THEN 1 ELSE 0 END)
						FROM	sewa_teams					st
						JOIN	sewa_team_wise_sewadars		sw
									ON	(	st.sewa_id				=	@p_sewa_id
										AND	sw.sewa_team_id			=	st.sewa_team_id
										)
						LEFT OUTER JOIN	team_wise_daily_attendance	tda
									ON	(	tda.sewa_team_id	=		sw.sewa_team_id
										AND	tda.serial_id		=		sw.serial_id
										AND	tda.attendance_dt	BETWEEN	@start_dt AND @finish_dt
										)
						GROUP BY	sw.satsang_centre_id, sw.sewadar_grno;
					
					INSERT INTO	sewadar_wise_sewa_summaries
							(sewa_id, satsang_centre_id, sewadar_grno, present_cnt, absent_cnt, leave_cnt, exempt_cnt, is_system_recorded)
						SELECT	@dst_sewa_id,
								cntr,
								grno, p, a, l, e, 'Yes'
						FROM	@swss
						WHERE	p +	a +	l + e	> 0;
				END								--- ]
		END											 --- ]
	ELSE IF (@attendance_marking = 'Arbitrary')
		BEGIN										---- [
			IF (@attendance_unit = 'Day')
				BEGIN
					INSERT INTO	sewadar_wise_sewa_summaries
							(sewa_id, satsang_centre_id, sewadar_grno, present_cnt, absent_cnt, leave_cnt, exempt_cnt, is_system_recorded)
						SELECT	@dst_sewa_id,
								satsang_centre_id,
								sewadar_grno,				
								COUNT (*),
								0,
								0,
								0,
								'Yes'
						FROM	arbitrary_daily_presences
						WHERE	sewa_id		=	@p_sewa_id
						AND		presence_dt	BETWEEN	@start_dt AND @finish_dt
						GROUP BY	satsang_centre_id, sewadar_grno
						HAVING		COUNT (*)	>	0;
				END
			ELSE IF (@attendance_unit = 'Shift')
				BEGIN
					INSERT INTO	sewadar_wise_sewa_summaries
							(sewa_id, satsang_centre_id, sewadar_grno, present_cnt, absent_cnt, leave_cnt, exempt_cnt, is_system_recorded)
						SELECT	@dst_sewa_id,						
								satsang_centre_id,
								sewadar_grno,
								SUM ((credit_cnt * 1.0)/unit_cnt),
								0,
								0,
								0,
								'Yes'
						FROM	arbitrary_shift_presences ap
							JOIN	sewas_sewa_shifts s
								ON	(	ap.sewa_id			=	s.sewa_id
									AND	ap.sewa_shift		=	s.sewa_shift
									AND	ap.sewa_id			=	@p_sewa_id
									AND	presence_dt		BETWEEN	@start_dt AND @finish_dt
									)
						GROUP BY	satsang_centre_id, sewadar_grno
				END
			
			-- =============================================================================
			-- Summarise the Exemptions in arbitrary sewas
			-- =============================================================================
			
			IF (@is_exemption_allowed = 'Yes')
			BEGIN
				UPDATE	s
					SET	exempt_cnt	=	e.exemption_days
				FROM	arbitrary_summarised_exemptions	e
					JOIN	sewadar_wise_sewa_summaries	s
						ON	(	s.sewa_id			=	@dst_sewa_id
							AND	e.sewa_id			=	@dst_sewa_id
							AND	s.satsang_centre_id	=	e.satsang_centre_id
							AND	s.sewadar_grno		=	e.sewadar_grno
							);
				
				INSERT INTO	sewadar_wise_sewa_summaries
								(	sewa_id, satsang_centre_id, sewadar_grno, present_cnt, exempt_cnt, absent_cnt, leave_cnt, is_system_recorded)
					SELECT	@dst_sewa_id,
							satsang_centre_id,
							sewadar_grno,
							0,
							exemption_days,
							0,
							0,
							'Yes'
					FROM	arbitrary_summarised_exemptions	e
					WHERE	sewa_id		=	@dst_sewa_id
					AND		NOT	EXISTS	(	SELECT	sewadar_grno
											FROM	sewadar_wise_sewa_summaries	s
											WHERE	s.sewadar_grno	=	e.sewadar_grno
											AND		s.satsang_centre_id	=	e.satsang_centre_id
											AND		s.sewa_id			=	@dst_sewa_id
									);
			END		
			
		END											---- ]

	UPDATE	sewas
		SET	summary_ts	=	@summary_ts
	WHERE	sewa_id		=	@dst_sewa_id

END
GO



-- =============================================================================
-- Procedure ArchiveSewa
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'ArchiveSewa' AND xtype = 'P')
	DROP PROCEDURE ArchiveSewa
GO

CREATE PROCEDURE ArchiveSewa
(
	@p_sewa_id				sewa_id
)
AS
	DECLARE
		@attendance_marking		VARCHAR (10),	-- Team-wise, Arbitrary, Summary, Computed
		@deleted_ts				DATETIME,
		@locked_ts				DATETIME,
		@attendance_ts			DATETIME,
		@rval					INT,
		@sewa_id				sewa_id;
BEGIN
	DECLARE	@tbl TABLE	(	sewa_team_id	INT		NOT NULL	PRIMARY KEY	NONCLUSTERED
						);

	SELECT	@attendance_marking		=	attendance_marking,
			@attendance_ts			=	attendance_ts,
			@locked_ts				=	locked_dtm,
			@deleted_ts				=	deleted_ts
	FROM	sewas
	WHERE	sewa_id		=	@p_sewa_id;

	IF (@@ROWCOUNT = 0)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'NotExist', NULL, 'Sewa', NULL, NULL
			RETURN -1;
		END

	IF (@attendance_marking IN ('Computed', 'Summary') )
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'NotAffected', NULL, NULL, NULL, NULL
			RETURN -2;
		END

	IF (@deleted_ts IS NOT NULL)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'ExistInfo', NULL, 'Archive for Sewa (after Deletion)', NULL, NULL
			RETURN -3;
		END
	
	IF (@locked_ts IS NULL)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Archiving of Sewa', 'the Sewa is not Locked', NULL
			RETURN -4;
		END
	
	---=================================
	--- Summarize referred sewas, if any 
	---=================================
	UPDATE	sewas
		SET	locked_dtm	= NULL
	WHERE	sewa_id		=	@p_sewa_id;

	DECLARE	sewa_crsr	CURSOR FOR
		SELECT	sewa_id
		FROM	sewas
		WHERE	referred_sewa_id = @p_sewa_id;
	
	OPEN	sewa_crsr;

	FETCH	sewa_crsr
		INTO	@sewa_id;
	
	WHILE (@@FETCH_STATUS = 0)
		BEGIN
			-- forcefully summarize sewa
			UPDATE	sewas 
				SET	summary_ts = NULL
			WHERE	sewa_id = @sewa_id;

			EXEC	@rval =	SummariseSewa @sewa_id;
			IF (@rval != 0)
				RETURN @rval;

			UPDATE	sewas
				SET	deleted_ts	=	GetDate (),
					locked_dtm	=	GetDate()
			WHERE	sewa_id = @sewa_id;

			FETCH	sewa_crsr
				INTO	@sewa_id;
		END
	
	CLOSE	sewa_crsr;
	DEALLOCATE	sewa_crsr;

	---=================================
	--- Summarize the Sewa now
	---=================================

	-- forcefully summarize sewa
	UPDATE	sewas 
	    SET	summary_ts = NULL
	WHERE	sewa_id = @p_sewa_id;

	EXEC	@rval =	SummariseSewa @p_sewa_id;
	IF (@rval != 0)
		RETURN @rval;

	---==============================================
	--- Summariztion over; delete the Attendance Data
	---==============================================

	DELETE	sewadars_txn_ts
	WHERE	sewa_id = @p_sewa_id
	AND		screen_id != 'ATT_01';

	IF (@attendance_marking = 'Arbitrary')
	BEGIN
		DELETE	arbitrary_daily_presences
		WHERE	sewa_id = @p_sewa_id;

		DELETE	arbitrary_shift_presences
		WHERE	sewa_id = @p_sewa_id;

		DELETE	arbitrary_summarised_exemptions
		WHERE	sewa_id = @p_sewa_id;
	END
	ELSE		--	@attendance_marking = 'Team-wise'
	BEGIN
		INSERT INTO	@tbl
			SELECT	sewa_team_id
			FROM	sewa_teams 
			WHERE	sewa_id = @p_sewa_id;
			
		DELETE	t 
		FROM	team_wise_daily_attendance	t
			JOIN	@tbl	tb
				ON	(	t.sewa_team_id = tb.sewa_team_id );

		DELETE	t 
		FROM	sewa_teams_txn_ts	t
			JOIN	@tbl	tb
				ON	(	t.sewa_team_id = tb.sewa_team_id );

		DELETE	t 
		FROM	sewa_team_wise_sewadars	t 
			JOIN	@tbl	tb
				ON	(	t.sewa_team_id = tb.sewa_team_id );

		DELETE	sewa_teams
		WHERE	sewa_id = @p_sewa_id;
	END

	UPDATE	sewas 
		SET	deleted_ts		=	GetDate (),
			locked_dtm		=	@locked_ts,
			attendance_ts	=	@attendance_ts
	WHERE	sewa_id = @p_sewa_id;
END
GO

-- =============================================================================
-- Procedure LockSewa
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'LockSewa' AND xtype = 'P')
	DROP PROCEDURE LockSewa
GO

CREATE PROCEDURE LockSewa
(
	@p_sewa_id				sewa_id
)
AS
BEGIN
	UPDATE	sewas
		SET	locked_dtm	=	GetDate()
	WHERE	sewa_id		=	@p_sewa_id
	AND		locked_dtm	IS NULL
	AND		deleted_ts	IS NULL;

	IF (@@ROWCOUNT = 0)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotAffected', NULL, NULL, NULL, NULL
		RETURN -1;
	END
END
GO

-- =============================================================================
-- Procedure UnLockSewa
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'UnLockSewa' AND xtype = 'P')
	DROP PROCEDURE UnLockSewa
GO

CREATE PROCEDURE UnLockSewa
(
	@p_sewa_id				sewa_id
)
AS
BEGIN
	UPDATE	sewas
		SET	locked_dtm	=	NULL
	WHERE	sewa_id		=	@p_sewa_id
	AND		locked_dtm	IS NOT NULL
	AND		deleted_ts	IS NULL;

	IF (@@ROWCOUNT = 0)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotAffected', NULL, NULL, NULL, NULL
		RETURN -1;
	END
END
GO

-- =============================================================================
-- Procedure SummariseSewaForSewadar
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'SummariseSewaForSewadar' AND xtype = 'P')
	DROP PROCEDURE SummariseSewaForSewadar
GO

CREATE PROCEDURE SummariseSewaForSewadar
(
	@p_sewa_id				sewa_id,
	@p_satsang_centre_id	satsang_centre_id,
	@p_sewadar_grno			sewadar_grno
)
AS
	DECLARE
		@sewa_nm					gnc_nm,
		@attendance_unit			attendance_unit,	-- Day, Shift
		@attendance_marking			VARCHAR (10),	-- Team-wise, Arbitrary, Summary
		@is_leave_allowed			Boolean,
		@is_exemption_allowed		Boolean,
		@attendance_ts				DATETIME,
		@summary_ts					DATETIME,
		@deleted_ts					DATETIME,
		@locked_dtm					DATETIME,
		@satsang_centre_id			satsang_centre_id,
		@exempt_days				numeric (6,2)
		
BEGIN

	SELECT	@sewa_nm				=	sewa_nm,
			@attendance_unit		=	attendance_unit,
			@attendance_marking		=	attendance_marking,
			@is_leave_allowed		=	is_leave_allowed,
			@is_exemption_allowed	=	is_exemption_allowed,
			@attendance_ts			=	attendance_ts,
			@summary_ts				=	summary_ts,
			@deleted_ts				=	deleted_ts,
			@locked_dtm				=	locked_dtm,
			@satsang_centre_id		=	satsang_centre_id
	FROM	sewas
	WHERE	sewa_id		=	@p_sewa_id
	AND		attendance_marking		!=	'Summary'

	IF (@@ROWCOUNT = 0 OR @sewa_nm IS NULL OR @sewa_nm = '')
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'NotExist', NULL, 'Sewa information', NULL, NULL
			RETURN -1;
		END

	IF (@deleted_ts IS NOT NULL OR @attendance_ts IS NULL OR @locked_dtm IS NOT NULL)
		RETURN

	IF (@summary_ts IS NOT NULL)
		BEGIN
			IF (@summary_ts >= @attendance_ts)
				RETURN
		END

	
	DELETE
	FROM	sewadar_wise_sewa_summaries
	WHERE	sewa_id				=	@p_sewa_id
	AND		satsang_centre_id	=	@p_satsang_centre_id
	AND		sewadar_grno		=	@p_sewadar_grno;

	IF (@attendance_marking = 'Team-wise')
		BEGIN										---- [
			IF (@attendance_unit = 'Day')
				BEGIN							--- [
					DECLARE	@swss	TABLE	(	cntr INT, grno	CHAR (6), p INT, a INT, l INT, e INT, PRIMARY KEY NONCLUSTERED (cntr, grno) 	);
					
					INSERT INTO	@swss
						SELECT	sw.satsang_centre_id,
								sw.sewadar_grno,
								SUM (CASE WHEN tda.attendance = 'P' THEN 1 ELSE 0 END),
								SUM (CASE WHEN tda.attendance = 'A' THEN 1 ELSE 0 END),
								SUM (CASE WHEN tda.attendance = 'L' THEN 1 ELSE 0 END),
								SUM (CASE WHEN tda.attendance = 'E' THEN 1 ELSE 0 END)
						FROM	sewa_teams					st
						JOIN	sewa_team_wise_sewadars		sw
									ON	(	st.sewa_id				=	@p_sewa_id
										AND	sw.sewa_team_id			=	st.sewa_team_id
										AND	sw.satsang_centre_id	=	@p_satsang_centre_id
										AND sw.sewadar_grno			=	@p_sewadar_grno
										)
						LEFT OUTER JOIN	team_wise_daily_attendance	tda
									ON	(	tda.sewa_team_id	=		sw.sewa_team_id
										AND	tda.serial_id		=		sw.serial_id										
										)
						GROUP BY	sw.satsang_centre_id, sw.sewadar_grno
					
					INSERT INTO	sewadar_wise_sewa_summaries
							(sewa_id, satsang_centre_id, sewadar_grno, present_cnt, absent_cnt, leave_cnt, exempt_cnt, is_system_recorded)
						SELECT	@p_sewa_id,
								cntr,
								grno, p, a, l, e, 'Yes'
						FROM	@swss
						WHERE	p +	a +	l + e	> 0	
						
					END								--- ]
		END											 --- ]

	ELSE IF (@attendance_marking = 'Arbitrary')
		BEGIN										---- [
			IF (@attendance_unit = 'Day')
				BEGIN
					INSERT INTO	sewadar_wise_sewa_summaries
							(sewa_id, satsang_centre_id, sewadar_grno, present_cnt, absent_cnt, leave_cnt, exempt_cnt, is_system_recorded)
						SELECT	@p_sewa_id,
								satsang_centre_id,
								sewadar_grno,				
								COUNT (*),
								0,
								0,
								0,
								'Yes'
						FROM	arbitrary_daily_presences
						WHERE	sewa_id				=	@p_sewa_id
						AND		satsang_centre_id	=	@p_satsang_centre_id
						AND		sewadar_grno		=	@p_sewadar_grno
						GROUP BY	satsang_centre_id, sewadar_grno
						HAVING		COUNT (*)	>	0;
				END
				
			ELSE IF (@attendance_unit = 'Shift')
				BEGIN
					INSERT INTO	sewadar_wise_sewa_summaries
							(sewa_id, satsang_centre_id, sewadar_grno, present_cnt, absent_cnt, leave_cnt, exempt_cnt, is_system_recorded)
						SELECT	@p_sewa_id,						
								satsang_centre_id,
								sewadar_grno,
								SUM ((credit_cnt * 1.0)/unit_cnt),
								0,
								0,
								0,
								'Yes'
						FROM	arbitrary_shift_presences ap
							JOIN	sewas_sewa_shifts s
								ON	(	ap.sewa_id				=	s.sewa_id
									AND	ap.sewa_shift			=	s.sewa_shift
									AND	ap.sewa_id				=	@p_sewa_id
									AND	ap.satsang_centre_id	=	@p_satsang_centre_id
									AND	ap.sewadar_grno			=	@p_sewadar_grno
									)
						GROUP BY	satsang_centre_id, sewadar_grno
				END
							
			-- =============================================================================
			-- Summarise the Exemptions in arbitrary sewas
			-- =============================================================================
			IF (@is_exemption_allowed = 'Yes')
			BEGIN					--- [				
				SELECT	@exempt_days =  exemption_days 
				FROM	arbitrary_summarised_exemptions
				WHERE	sewa_id			=	@p_sewa_id
				AND		satsang_centre_id	=	@p_satsang_centre_id
				AND		sewadar_grno	=	@p_sewadar_grno;

				IF (@@ROWCOUNT > 0)
				BEGIN
					UPDATE	sewadar_wise_sewa_summaries
					SET		exempt_cnt	=	@exempt_days
					WHERE	sewa_id			=	@p_sewa_id
					AND		satsang_centre_id	=	@p_satsang_centre_id
					AND		sewadar_grno	=	@p_sewadar_grno

					IF (@@ROWCOUNT = 0)
						BEGIN
							INSERT INTO	sewadar_wise_sewa_summaries
									(	sewa_id, satsang_centre_id, sewadar_grno, present_cnt, exempt_cnt, absent_cnt, leave_cnt, is_system_recorded)
								VALUES
									(@p_sewa_id, @satsang_centre_id, @p_sewadar_grno, 0, @exempt_days, 0, 0, 'Yes')
					END
				END

			END						--- ]
		END									---- ]
		
											
END
GO

-- =============================================================================
-- Procedure SummariseSewasForSewadar
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'SummariseSewasForSewadar' AND xtype = 'P')
	DROP PROCEDURE SummariseSewasForSewadar
GO

CREATE PROCEDURE SummariseSewasForSewadar
(
	@p_satsang_centre_id	satsang_centre_id,
	@p_sewadar_grno			sewadar_grno
)
AS
	DECLARE
		@rval		INT,
		@sewa_id	sewa_id

BEGIN

	DECLARE	sewa_crsr	CURSOR
	FOR
		SELECT	sewa_id
		FROM	sewas
		WHERE	referred_sewa_id	IS NULL
		AND		attendance_marking	!=	'Summary';
	
	OPEN	sewa_crsr;

	FETCH	sewa_crsr
		INTO	@sewa_id;
	
	WHILE (@@FETCH_STATUS = 0)
		BEGIN
			EXEC	@rval =	SummariseSewaForSewadar	@sewa_id, @p_satsang_centre_id, @p_sewadar_grno;
			IF (@rval != 0)
				RETURN @rval;

			FETCH	sewa_crsr
				INTO	@sewa_id;
		END
	
	CLOSE	sewa_crsr;

	DEALLOCATE	sewa_crsr;
END
GO

-- =============================================================================
-- Procedure ComputeCredits
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'ComputeCredits' AND xtype = 'P')
	DROP PROCEDURE ComputeCredits
GO

CREATE PROCEDURE ComputeCredits
(
	@p_credit_specification_id	credit_specification_id
)
AS
	DECLARE
		@sewa_id				sewa_id,
		@specification_ts		DATETIME,
		@computation_ts			DATETIME,
		@sewadar_grno			sewadar_grno,
		@appointment_dt			SMALLDATETIME,
		@last_appointment_dt	SMALLDATETIME,
		@presence_sewa_id		sewa_id,
		@finish_dt				SMALLDATETIME,
		@chr_dt_1				CHAR (12),
		@chr_dt_2				CHAR (12),
		@min_credit_cnt			SMALLINT,
		@sewa_cnt				SMALLINT,
		@rval					INT,
		@is_outstation			VARCHAR (3)

BEGIN

	SELECT	@specification_ts		=	specification_ts,
			@computation_ts			=	computation_ts,
			@min_credit_cnt			=	min_credit_cnt,
			@last_appointment_dt	=	last_appointment_dt,
			@presence_sewa_id		=	presence_sewa_id,
			@is_outstation			=	is_outstation_sewadar
	FROM	credit_specifications
	WHERE	credit_specification_id	=	@p_credit_specification_id

	IF (@@ROWCOUNT = 0 OR @specification_ts IS NULL)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'NotExist', NULL, 'Credit Specification information', NULL, NULL
			RETURN -1;
		END
	
	IF (@min_credit_cnt IS NULL)
		SET	@min_credit_cnt	= 1

	IF (@is_outstation IS NULL)
		SET	@is_outstation = '%'

	DECLARE	sewa_crsr	CURSOR
	FOR
			SELECT	a.sewa_id
			FROM	credit_specifications_sewas	a,
					sewas						b
			WHERE	credit_specification_id	=	@p_credit_specification_id
			AND		a.sewa_id				=	b.sewa_id
			AND		(	b.attendance_marking	!=	'Summary'
					OR	EXISTS	(	SELECT	sewa_id
									FROM	sewas
									WHERE	sewas.sewa_id	=	b.referred_sewa_id
								)
					)
		UNION
			SELECT	presence_sewa_id
			FROM	credit_specifications
			WHERE	credit_specification_id	=	@p_credit_specification_id
			AND		presence_sewa_id	IS NOT NULL;
	
	OPEN	sewa_crsr

	FETCH	sewa_crsr
		INTO	@sewa_id
	
	WHILE (@@FETCH_STATUS = 0)
		BEGIN
			EXEC	@rval =	SummariseSewa	@sewa_id
			IF (@rval != 0)
				RETURN @rval;

			FETCH	sewa_crsr
				INTO	@sewa_id
		END
	
	CLOSE	sewa_crsr

	DEALLOCATE	sewa_crsr

	
	SET	@computation_ts = GetDate()

	DELETE	FROM	credit_specifications_sewadars
	WHERE	credit_specification_id	=	@p_credit_specification_id

--print @@ROWCOUNT

	/*
	DECLARE	@tmp_sewadar_credits	TABLE
		(
			sewadar_grno		CHAR (6)			NOT NULL,
			satsang_centre_id	INTEGER				NOT NULL,
			sewa_id				INTEGER				NOT NULL,
			eligible_credit_cnt	INTEGER				NOT NULL,
			
			PRIMARY	KEY		(sewadar_grno, satsang_centre_id, sewa_id)
		)
*/

	DELETE	FROM	tmp_sewadar_credits
	WHERE	credit_specification_id	=	@p_credit_specification_id;

		-- Note. SELECT/INSERT sewadars after credit computations for each of the sewas

--print @is_outstation
--print len(@is_outstation)
	INSERT	INTO	tmp_sewadar_credits
		SELECT	a.credit_specification_id,
				b.sewadar_grno,
				b.satsang_centre_id,
				b.sewa_id,
				CASE	a.is_exemption_considered
					WHEN	'Yes'	THEN	
						1.0 * (COALESCE (b.present_cnt, 0) + COALESCE (b.exempt_cnt, 0)) * a.credit_cnt / a.unit_cnt
					WHEN	'No'	THEN
						 b.present_cnt * a.credit_cnt / a.unit_cnt
						
				END
						AS	eligible_credit_cnt
		FROM	credit_specifications_sewas	a
			JOIN	sewadar_wise_sewa_summaries	b
				ON	(	a.credit_specification_id	=		@p_credit_specification_id
					AND	b.sewa_id					=		a.sewa_id
					)
			JOIN	sewadars_registrations		c
				ON	(	b.sewadar_grno				=		c.sewadar_grno
					AND	b.satsang_centre_id			=		c.satsang_centre_id
					AND	c.appointment_dt			<=		@last_appointment_dt
					)
		WHERE	(	(	c.is_outstation_sewadar		=	'Yes'	AND @is_outstation	= 'Yes'	)
				OR	(	c.is_outstation_sewadar		=	'No'	AND @is_outstation	= 'No'	)
				OR	(	@is_outstation	= '%'	)
				)

--print 'Recs identified : ' + CONVERT (VARCHAR, @@ROWCOUNT)

	SELECT	TOP 1
			@sewadar_grno		=	a.sewadar_grno,
			@sewa_id			=	a.sewa_id,
			@appointment_dt		=	b.appointment_dt,
			@finish_dt			=	c.finish_dt
	FROM	tmp_sewadar_credits		a
	JOIN	sewadars_registrations		b
				ON	(	a.sewadar_grno			=	b.sewadar_grno
					AND	a.satsang_centre_id		=	b.satsang_centre_id
					AND	credit_specification_id	=	@p_credit_specification_id
					)
	JOIN	sewas					c
				ON	(	a.sewa_id			=	c.sewa_id
					AND	b.appointment_dt	>	c.finish_dt
					)
	WHERE	c.sewa_frequency		=	'Daily'
	AND		c.attendance_unit		=	'Day'
	AND		c.attendance_marking	=	'Team-wise'
	
	IF (@@ROWCOUNT > 0)
		BEGIN
			DECLARE @msg VARCHAR (100);
			SET @msg = 'Attendance for at least one Sewadar with GR No. ' + @sewadar_grno + '(appointed on ' + @chr_dt_1 + ') has been recorded for Sewa (ID ' + @sewa_id + ') that finished on ' + @chr_dt_2		
			SET	@chr_dt_1 = CONVERT (VARCHAR (11), @appointment_dt, 106)
			SET	@chr_dt_2 = CONVERT (VARCHAR (11), @finish_dt, 106)
			EXEC SysAdmin..RaiseErrorMessage 'ExistInfo', NULL, @msg, NULL, NULL
			RETURN -2;
		END

		-- Note. Delete the records that do not meet the individual criteria
	DELETE	a
	FROM	tmp_sewadar_credits	a
		JOIN	credit_specifications_sewas	b
				ON	(	a.eligible_credit_cnt		NOT BETWEEN		b.min_credit_cnt AND b.max_credit_cnt
					AND	b.credit_specification_id	=	a.credit_specification_id
					AND	b.sewa_id					=	a.sewa_id
					)
	WHERE	a.credit_specification_id	=	@p_credit_specification_id;
	
	--print @@ROWCOUNT

		-- Note. Delete the records that do not have the records for all sewas
	SELECT	@sewa_cnt	=	COUNT (*)
	FROM	credit_specifications_sewas
	WHERE	credit_specification_id	=	@p_credit_specification_id

--print @@ROWCOUNT

	DELETE	x
	FROM	tmp_sewadar_credits	x
	WHERE	credit_specification_id	=	@p_credit_specification_id
	AND		EXISTS (
				SELECT	a.sewadar_grno, a.satsang_centre_id, COUNT (*)
				FROM	tmp_sewadar_credits	a
				WHERE	a.credit_specification_id	=	x.credit_specification_id
				AND		a.sewadar_grno		=	x.sewadar_grno
				AND		a.satsang_centre_id	=	x.satsang_centre_id
				GROUP BY a.sewadar_grno, a.satsang_centre_id
				HAVING	COUNT (*)	<	@sewa_cnt
			)
	
--print @@ROWCOUNT
		-- Note. Delete the records that do not have presence recorded in Sewa Specified in presence_sewa_id, if specified

	IF (@presence_sewa_id IS NOT NULL)
		DELETE	x
		FROM	tmp_sewadar_credits	x
		WHERE	credit_specification_id	=	@p_credit_specification_id
		AND		EXISTS (
					SELECT	1
					FROM	sewadar_wise_sewa_summaries	a
					WHERE	a.sewa_id			=	@presence_sewa_id
					AND		a.sewadar_grno		=	x.sewadar_grno
					AND		a.satsang_centre_id	=	x.satsang_centre_id
					AND		present_cnt		=	0
				)
	
	--print @@ROWCOUNT

		-- Note. SELECT the sewadars that satisfy the overall qualifying criteria
	INSERT	INTO	credit_specifications_sewadars
		SELECT	credit_specification_id,
				satsang_centre_id,
				sewadar_grno,
				SUM (eligible_credit_cnt)
		FROM	tmp_sewadar_credits
		WHERE	credit_specification_id	=	@p_credit_specification_id
		GROUP BY	credit_specification_id, satsang_centre_id, sewadar_grno
		HAVING	SUM (eligible_credit_cnt)	>= @min_credit_cnt

--print @@ROWCOUNT

	UPDATE	credit_specifications
		SET	computation_ts	=	@computation_ts
	WHERE	credit_specification_id	=	@p_credit_specification_id

END
GO

-- =============================================================================
-- Procedure ComputeCreditsNew													-- Temporary. Will be removed LATER.
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'ComputeCreditsNew' AND xtype = 'P')
	DROP PROCEDURE ComputeCreditsNew
GO

CREATE PROCEDURE ComputeCreditsNew
(
	@p_credit_specification_id	credit_specification_id
)
AS
	DECLARE
		@sewa_id				sewa_id,
		@specification_ts		DATETIME,
		@computation_ts			DATETIME,
		@sewadar_grno			sewadar_grno,
		@appointment_dt			SMALLDATETIME,
		@last_appointment_dt	SMALLDATETIME,
		@presence_sewa_id		sewa_id,
		@finish_dt				SMALLDATETIME,
		@chr_dt_1				CHAR (12),
		@chr_dt_2				CHAR (12),
		@min_credit_cnt			SMALLINT,
		@sewa_cnt				SMALLINT,
		@rval					INT,
		@is_outstation			VARCHAR (3)

BEGIN

	SELECT	@specification_ts		=	specification_ts,
			@computation_ts			=	computation_ts,
			@min_credit_cnt			=	min_credit_cnt,
			@last_appointment_dt	=	last_appointment_dt,
			@presence_sewa_id		=	presence_sewa_id,
			@is_outstation			=	is_outstation_sewadar
	FROM	credit_specifications
	WHERE	credit_specification_id	=	@p_credit_specification_id

	IF (@@ROWCOUNT = 0 OR @specification_ts IS NULL)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'NotExist', NULL, 'Credit Specification information', NULL, NULL
			RETURN -1;
		END
	
	IF (@min_credit_cnt IS NULL)
		SET	@min_credit_cnt	= 1

	IF (@is_outstation IS NULL)
		SET	@is_outstation = '%'

	DECLARE	sewa_crsr	CURSOR
	FOR
			SELECT	a.sewa_id
			FROM	credit_specifications_sewas	a,
					sewas						b
			WHERE	credit_specification_id	=	@p_credit_specification_id
			AND		a.sewa_id				=	b.sewa_id
			AND		(	b.attendance_marking	!=	'Summary'
					OR	EXISTS	(	SELECT	sewa_id
									FROM	sewas
									WHERE	sewas.sewa_id	=	b.referred_sewa_id
								)
					)
		UNION
			SELECT	presence_sewa_id
			FROM	credit_specifications
			WHERE	credit_specification_id	=	@p_credit_specification_id
			AND		presence_sewa_id	IS NOT NULL;
	
	OPEN	sewa_crsr

	FETCH	sewa_crsr
		INTO	@sewa_id
	
	WHILE (@@FETCH_STATUS = 0)
		BEGIN
			EXEC	@rval =	SummariseSewa	@sewa_id
			IF (@rval != 0)
				RETURN @rval;
			IF (@@ERROR != 0)
				RETURN

			FETCH	sewa_crsr
				INTO	@sewa_id
		END
	
	CLOSE	sewa_crsr

	DEALLOCATE	sewa_crsr

	
	SET	@computation_ts = GetDate()

	DELETE	FROM	credit_specifications_sewadars
	WHERE	credit_specification_id	=	@p_credit_specification_id

--print @@ROWCOUNT

	DECLARE	@tmp_sewadar_credits	TABLE
		(
			sewadar_grno		CHAR (6)			NOT NULL,
			satsang_centre_id	INTEGER				NOT NULL,
			sewa_id				INTEGER				NOT NULL,
			eligible_credit_cnt	INTEGER				NOT NULL,
			
			PRIMARY	KEY		(sewadar_grno, satsang_centre_id, sewa_id)
		)

		-- Note. SELECT/INSERT sewadars after credit computations for each of the sewas

--print @is_outstation
--print len(@is_outstation)
	INSERT	INTO	@tmp_sewadar_credits
		SELECT	b.sewadar_grno,
				b.satsang_centre_id,
				b.sewa_id,
				CASE	a.is_exemption_considered
					WHEN	'Yes'	THEN	
						1.0 * (COALESCE (b.present_cnt, 0) + COALESCE (b.exempt_cnt, 0)) * a.credit_cnt / a.unit_cnt
					WHEN	'No'	THEN
						 b.present_cnt * a.credit_cnt / a.unit_cnt
						
				END
						AS	eligible_credit_cnt
		FROM	credit_specifications_sewas	a
			JOIN	sewadar_wise_sewa_summaries	b
				ON	(	a.credit_specification_id	=		@p_credit_specification_id
					AND	b.sewa_id					=		a.sewa_id
					)
			JOIN	sewadars_registrations		c
				ON	(	b.sewadar_grno				=		c.sewadar_grno
					AND	b.satsang_centre_id			=		c.satsang_centre_id
					AND	c.appointment_dt			<=		@last_appointment_dt
					)
		WHERE	(	(	c.is_outstation_sewadar		=	'Yes'	AND @is_outstation	= 'Yes'	)
				OR	(	c.is_outstation_sewadar		=	'No'	AND @is_outstation	= 'No'	)
				OR	(	@is_outstation	= '%'	)
				)

--print 'Recs identified : ' + CONVERT (VARCHAR, @@ROWCOUNT)

	SELECT	TOP 1
			@sewadar_grno		=	a.sewadar_grno,
			@sewa_id			=	a.sewa_id,
			@appointment_dt		=	b.appointment_dt,
			@finish_dt			=	c.finish_dt
	FROM	@tmp_sewadar_credits		a
	JOIN	sewadars_registrations		b
				ON	(	a.sewadar_grno			=	b.sewadar_grno
					AND	a.satsang_centre_id		=	b.satsang_centre_id
					)
	JOIN	sewas					c
				ON	(	a.sewa_id			=	c.sewa_id
					AND	b.appointment_dt	>	c.finish_dt
					)
	WHERE	c.sewa_frequency		=	'Daily'
	AND		c.attendance_unit		=	'Day'
	AND		c.attendance_marking	=	'Team-wise'
	
	IF (@@ROWCOUNT > 0)
		BEGIN
			DECLARE @msg VARCHAR (100);
			SET @msg = 'Attendance for at least one Sewadar with GR No. ' + @sewadar_grno + '(appointed on ' + @chr_dt_1 + ') has been recorded for Sewa (ID ' + @sewa_id + ') that finished on ' + @chr_dt_2		
			SET	@chr_dt_1 = CONVERT (VARCHAR (11), @appointment_dt, 106)
			SET	@chr_dt_2 = CONVERT (VARCHAR (11), @finish_dt, 106)
			EXEC SysAdmin..RaiseErrorMessage 'ExistInfo', NULL, @msg, NULL, NULL
			RETURN -2;
		END

		-- Note. Delete the records that do not meet the individual criteria
	DELETE	a
	FROM	@tmp_sewadar_credits	a
		JOIN	credit_specifications_sewas	b
				ON	(	a.eligible_credit_cnt		NOT BETWEEN		b.min_credit_cnt AND b.max_credit_cnt
					AND	b.credit_specification_id	=	@p_credit_specification_id
					AND	b.sewa_id					=	a.sewa_id
					);
	
	--print @@ROWCOUNT

		-- Note. Delete the records that do not have the records for all sewas
	SELECT	@sewa_cnt	=	COUNT (*)
	FROM	credit_specifications_sewas
	WHERE	credit_specification_id	=	@p_credit_specification_id

--print @@ROWCOUNT

	DELETE	x
	FROM	@tmp_sewadar_credits	x
	WHERE	EXISTS (
				SELECT	a.sewadar_grno, a.satsang_centre_id, COUNT (*)
				FROM	@tmp_sewadar_credits	a
				WHERE		a.sewadar_grno		=	x.sewadar_grno
				AND		a.satsang_centre_id	=	x.satsang_centre_id
				GROUP BY a.sewadar_grno, a.satsang_centre_id
				HAVING	COUNT (*)	<	@sewa_cnt
			)
	
--print @@ROWCOUNT
		-- Note. Delete the records that do not have presence recorded in Sewa Specified in presence_sewa_id, if specified

	IF (@presence_sewa_id IS NOT NULL)
		DELETE	x
		FROM	@tmp_sewadar_credits	x
		WHERE	EXISTS (
					SELECT	1
					FROM	sewadar_wise_sewa_summaries	a
					WHERE	a.sewa_id			=	@presence_sewa_id
					AND		a.sewadar_grno		=	x.sewadar_grno
					AND		a.satsang_centre_id	=	x.satsang_centre_id
					AND		present_cnt		=	0
				)
	
	--print @@ROWCOUNT

		-- Note. SELECT the sewadars that satisfy the overall qualifying criteria
	INSERT	INTO	credit_specifications_sewadars
		SELECT	@p_credit_specification_id,
				satsang_centre_id,
				sewadar_grno,
				SUM (eligible_credit_cnt)
		FROM	@tmp_sewadar_credits
		GROUP BY	satsang_centre_id, sewadar_grno
		HAVING	SUM (eligible_credit_cnt)	>= @min_credit_cnt

--print @@ROWCOUNT

	UPDATE	credit_specifications
		SET	computation_ts	=	@computation_ts
	WHERE	credit_specification_id	=	@p_credit_specification_id

END
GO

-- =============================================================================
-- Procedure SummariseSessionDeptWise
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'SummariseSessionDeptWise' AND xtype = 'P')
	DROP PROCEDURE SummariseSessionDeptWise
GO

CREATE PROCEDURE SummariseSessionDeptWise
(
	@p_session_id			integer
)
AS

BEGIN
	DELETE	FROM	generic_report_summaries
	WHERE	session_id	=	@p_session_id

	DECLARE	@tmp_gnts	TABLE
		(	department_id	INTEGER,
			cnt				INTEGER
		)

	DECLARE	@tmp_lds	TABLE
		(	department_id	INTEGER,
			cnt				INTEGER
		)
	DECLARE	@tmp_dept_cnt	TABLE
		(	department_id	INTEGER,
			gents_cnt		INTEGER,
			ladies_cnt		INTEGER
		)

	INSERT	INTO	@tmp_gnts
		SELECT	b.department_id, COUNT (a.sewadar_grno) 
		FROM	generic_report_details	a
			JOIN	sewadars_registrations	b
				ON	(	a.session_id		=	@p_session_id
					AND	b.satsang_centre_id	=	a.satsang_centre_id
					AND	b.sewadar_grno		=	a.sewadar_grno
					)
			JOIN	sewadars	c
				ON	(	b.sewadar_id	=	c.sewadar_id
					AND	c.gender		=	'Male'
					)
		GROUP BY department_id;

	INSERT	INTO	@tmp_lds
		SELECT	b.department_id, COUNT (a.sewadar_grno) 
		FROM	generic_report_details	a
			JOIN	sewadars_registrations	b
				ON	(	a.session_id		=	@p_session_id
					AND	b.satsang_centre_id	=	a.satsang_centre_id
					AND	b.sewadar_grno		=	a.sewadar_grno
					)
			JOIN	sewadars	c
				ON	(	b.sewadar_id	=	c.sewadar_id
					AND	c.gender		=	'Female'
					)
		GROUP BY department_id;

	INSERT	INTO	@tmp_dept_cnt
		SELECT	COALESCE (gnts.department_id, lds.department_id), gnts.cnt, lds.cnt
		FROM	@tmp_gnts gnts
			FULL OUTER JOIN	@tmp_lds lds
				ON	(	gnts.department_id = lds.department_id	);

	INSERT	INTO	generic_report_summaries
			(	session_id,	major_information, gents_cnt, ladies_cnt)
		SELECT	@p_session_id,
				department_nm,
				COALESCE (gents_cnt, 0),
				COALESCE (ladies_cnt, 0)
		FROM	@tmp_dept_cnt	a
			JOIN	departments		b
				ON	(	a.department_id = b.department_id	)
		ORDER BY 2;
END
GO

-- =============================================================================
-- Procedure SummariseSessionDeptSubDeptWise
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'SummariseSessionDeptSubDeptWise' AND xtype = 'P')
	DROP PROCEDURE SummariseSessionDeptSubDeptWise
GO

CREATE PROCEDURE SummariseSessionDeptSubDeptWise
(
	@p_session_id			integer
)
AS

BEGIN
	DELETE	FROM	generic_report_summaries
	WHERE	session_id	=	@p_session_id

	DECLARE	@tmp_gnts	TABLE
		(	department_id		INTEGER,
		 	sub_department_id	INTEGER,
			cnt					INTEGER
		)

	DECLARE	@tmp_lds	TABLE
		(	department_id		INTEGER,
		 	sub_department_id	INTEGER,
			cnt					INTEGER
		)
	DECLARE	@tmp_dept_cnt	TABLE
		(	department_id		INTEGER,
		 	sub_department_id	INTEGER,
			gents_cnt			INTEGER,
			ladies_cnt			INTEGER
		)

	INSERT	INTO	@tmp_gnts
		SELECT	b.department_id, b.sub_department_id, COUNT (a.sewadar_grno) 
		FROM	generic_report_details	a
			JOIN	sewadars_registrations	b
				ON	(	a.session_id		=	@p_session_id
					AND	b.satsang_centre_id	=	a.satsang_centre_id
					AND	b.sewadar_grno		=	a.sewadar_grno
					)
			JOIN	sewadars	c
				ON	(	b.sewadar_id	=	c.sewadar_id
					AND	c.gender		=	'Male'
					)
		GROUP BY b.department_id, b.sub_department_id;

	INSERT	INTO	@tmp_lds
		SELECT	b.department_id, b.sub_department_id, COUNT (a.sewadar_grno) 
		FROM	generic_report_details	a
			JOIN	sewadars_registrations	b
				ON	(	a.session_id		=	@p_session_id
					AND	b.satsang_centre_id	=	a.satsang_centre_id
					AND	b.sewadar_grno		=	a.sewadar_grno
					)
			JOIN	sewadars	c
				ON	(	b.sewadar_id	=	c.sewadar_id
					AND	c.gender		=	'Female'
					)
		GROUP BY b.department_id, b.sub_department_id;

	INSERT	INTO	@tmp_dept_cnt
			SELECT	department_id, sub_department_id, 0, 0
			FROM	@tmp_gnts
		UNION
			SELECT	department_id, sub_department_id, 0, 0
			FROM	@tmp_lds;

	UPDATE	t
		SET	gents_cnt	=	cnt
	FROM	@tmp_dept_cnt t
	JOIN	@tmp_gnts a
	ON	(	t.department_id		=	a.department_id	
			AND	t.sub_department_id	IS NULL
			AND	a.sub_department_id				IS NULL 
			)
	 OR		(	t.department_id		=	a.department_id	
			AND	t.sub_department_id	=	a.sub_department_id	
			);

	UPDATE	t
		SET	ladies_cnt	=	cnt
	FROM	@tmp_dept_cnt t
	JOIN	@tmp_lds a
	ON	(	t.department_id		=	a.department_id	
			AND	t.sub_department_id	IS NULL
			AND	a.sub_department_id				IS NULL 
			)
	 OR		(	t.department_id		=	a.department_id	
			AND	t.sub_department_id	=	a.sub_department_id	
			);

	INSERT	INTO	generic_report_summaries
			(	session_id,	major_information, gents_cnt, ladies_cnt)
		SELECT	@p_session_id,
				department_nm + COALESCE (' [' + sub_department_nm + ']', ''),
				COALESCE (gents_cnt, 0),
				COALESCE (ladies_cnt, 0)
		FROM	@tmp_dept_cnt	a
			JOIN	departments		b
				ON	(	a.department_id	=	b.department_id	)
			LEFT OUTER JOIN	sub_departments		c
				ON	(	a.sub_department_id	=	c.sub_department_id	)
		ORDER BY 2;
END
GO

-- =============================================================================
-- Procedure GenerateSewadarListWithoutPhoto
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateSewadarListWithoutPhoto' AND xtype = 'P')
	DROP PROCEDURE GenerateSewadarListWithoutPhoto
GO

CREATE PROCEDURE GenerateSewadarListWithoutPhoto
(
	@p_satsang_centre_id 	satsang_centre_id,
	@p_satsang_centre_nm 	gnc_nm,
	@p_department_ids		report_xml_prm,
	@p_is_outstation		VARCHAR (3),
	@p_gender				VARCHAR (6),
	@p_district_ids			report_xml_prm,
	@p_is_show_district		Boolean,
	@p_session_id			INTEGER				OUTPUT
)
AS
	DECLARE
		@extra_information_header	report_description,
		@extra_information			report_description

BEGIN
	DECLARE	@depts		TABLE	(	id	INT	);
	DECLARE	@districts	TABLE	(	id	INT	);
	DECLARE @hdoc INT;
	
	/*
	IF (@p_department_ids IS NULL)
		SET @extra_information = ' for All Departments'
	ELSE
		SET @extra_information = ''
		*/

	IF (@p_department_ids IS NULL)
		INSERT INTO	@depts
			SELECT	department_id
			FROM	departments_satsang_centres
			WHERE	satsang_centre_id	=	@p_satsang_centre_id
			AND		effective_till	>	GetDate();
	ELSE
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_department_ids; 
		INSERT INTO	@depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT);
		EXEC sp_xml_removedocument @hdoc;
	END
		
	IF (@p_district_ids IS NOT NULL)
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_district_ids; 
		INSERT INTO	@districts 
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT) 
		EXEC sp_xml_removedocument @hdoc
	END
	ELSE
	BEGIN	
		INSERT INTO	@districts
			SELECT	district_or_city_id
			FROM	CDB..districts_or_cities
			WHERE	effective_till	>	GetDate();
	END		

	IF (@p_district_ids IS NOT NULL)
		SET @extra_information = 'Sewadars List without Photo for District(s)';
	ELSE
		SET @extra_information = 'Sewadars List without Photo';

	IF (@p_is_outstation = 'Yes')
		SET @extra_information = @extra_information + ' of Outstation Sewadars'
	ELSE IF (@p_is_outstation = 'No')
		SET @extra_information = @extra_information + ' of Local Sewadars'

	IF (@p_is_show_district = 'Yes')
		SET	@extra_information_header = 'Age YOA District   Telephone'
	ELSE IF (@p_district_ids IS NOT NULL)
		SET	@extra_information_header = 'Age YOA City       Telephone'
	ELSE
		SET	@extra_information_header = 'Age   YOA  Status  Telephone'
		
	INSERT INTO	generic_report_headers
			(	report_header, extra_information_header	)
		VALUES
			(	@extra_information, @extra_information_header	);

	SET	@p_session_id = SCOPE_IDENTITY();

	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
		SELECT	@p_session_id,
				@p_satsang_centre_id,
				sr.sewadar_grno,
						CASE WHEN @p_is_outstation = '%' AND is_outstation_sewadar = 'Yes' THEN '*' ELSE SPACE (1) END
						+ CONVERT (CHAR (2), DATEDIFF (YEAR, birth_dtm, GetDate())) + SPACE (2)
						+ CASE	WHEN @p_is_show_district = 'No' AND @p_district_ids IS NULL THEN CONVERT (CHAR(4), DATEPART (YY, appointment_dt)) + SPACE (2)
																											+ sr.sewadar_status_cd + SPACE (3)
																							ELSE SUBSTRING (CONVERT (CHAR(4), DATEPART (YY, appointment_dt)), 3, 2) + SPACE (1)
										+ CASE WHEN @p_is_show_district = 'Yes' THEN SUBSTRING (district_nm, 1, 10) + REPLICATE (' ', CASE WHEN 10 - LEN (district_nm) < 0 THEN 1 ELSE 11 - LEN(district_nm) END)
																				ELSE SUBSTRING (post_office_or_city_nm, 1, 10) + REPLICATE (' ', CASE WHEN 10 - LEN (post_office_or_city_nm) < 0 THEN 1 ELSE 11 - LEN(post_office_or_city_nm) END)
										  END
						  END
						+ COALESCE (telephone_mobile, COALESCE (telephone_residence, ''))
		FROM	sewadars_registrations	sr
			JOIN	system_information_values	iv
				ON	(	iv.system_info_cd		=		'SttsGenUse'
					AND	iv.value_varchar		=		sewadar_status_cd
					AND	is_outstation_sewadar	LIKE	@p_is_outstation
					AND sr.satsang_centre_id	=		@p_satsang_centre_id
					)
			JOIN	sewadars	s
				ON	(	s.sewadar_id		=		sr.sewadar_id
					AND	gender						LIKE	@p_gender
					AND	s.global_sewadar_status_cd	IS NULL
					AND	NOT	EXISTS	(	SELECT	1
										FROM	ZSM_Photos..sewadars_photos	p
										WHERE	p.sewadar_id	=	s.sewadar_id
									)
					)
			JOIN	sewadars_addresses	sa
				ON	(	sa.sewadar_id	=	s.sewadar_id
					AND	sa.address_type	=	'Residence'
					)
			JOIN	@depts
				ON	(	sr.department_id	=	id	)
			JOIN	sewadars_details	sd
				ON	(	sd.sewadar_id	=	sr.sewadar_id	)
			JOIN post_offices_or_cities poc 
				ON  (	poc.post_office_or_city_id = sa.post_office_or_city_id	)
			JOIN @districts d
				ON  (	poc.district_id = d.id 	)
			JOIN CDB..districts_or_cities doc
				ON	(	doc.district_or_city_id = d.id	)		
END
GO

-- =============================================================================
-- Procedure GenerateSewadarListWithoutAddress
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateSewadarListWithoutAddress' AND xtype = 'P')
	DROP PROCEDURE GenerateSewadarListWithoutAddress
GO

CREATE PROCEDURE GenerateSewadarListWithoutAddress
(
	@p_satsang_centre_id 	satsang_centre_id,
	@p_satsang_centre_nm 	gnc_nm,
	@p_is_outstation		VARCHAR (3),
	@p_gender				VARCHAR (6),
	@p_session_id			INTEGER				OUTPUT
)
AS
	DECLARE
		@extra_information_header	report_description,
		@extra_information			report_description

BEGIN
	SET @extra_information = 'Sewadars List without Address';

	IF (@p_is_outstation = 'Yes')
		SET @extra_information = @extra_information + ' of Outstation Sewadars'
	ELSE IF (@p_is_outstation = 'No')
		SET @extra_information = @extra_information + ' of Local Sewadars'

	SET	@extra_information_header = ' Age   YOA  Status  Telephone'
		
	INSERT INTO	generic_report_headers
			(	report_header, extra_information_header	)
		VALUES
			(	@extra_information, @extra_information_header	);

	SET	@p_session_id = SCOPE_IDENTITY();

	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
		SELECT	@p_session_id,
				@p_satsang_centre_id,
				sr.sewadar_grno,
						CASE WHEN @p_is_outstation = '%' AND is_outstation_sewadar = 'Yes' THEN '*' ELSE SPACE (1) END + SPACE(1)
						+ CONVERT (CHAR (2), DATEDIFF (YEAR, birth_dtm, GetDate())) + SPACE (2)
						+ CONVERT (CHAR(4), DATEPART (YY, appointment_dt)) + SPACE (2)
						+ sr.sewadar_status_cd + SPACE (3)
						+ COALESCE (telephone_mobile, COALESCE (telephone_residence, ''))
		FROM	sewadars_registrations	sr
			JOIN	system_information_values	iv
				ON	(	iv.system_info_cd		=		'SttsGenUse'
					AND	iv.value_varchar		=		sewadar_status_cd
					AND	is_outstation_sewadar	LIKE	@p_is_outstation
					AND sr.satsang_centre_id	=		@p_satsang_centre_id
					)
			JOIN	sewadars	s
				ON	(	s.sewadar_id		=		sr.sewadar_id
					AND	gender						LIKE	@p_gender
					AND	s.global_sewadar_status_cd	IS NULL
					)
			JOIN	sewadars_details	sd
				ON	(	sd.sewadar_id	=	sr.sewadar_id	)
		WHERE	NOT	EXISTS	(	SELECT	1
										FROM	sewadars_addresses	sa
										WHERE	sa.sewadar_id	=	s.sewadar_id
										AND		sa.address_type	=	'Residence'
							)
END
GO

-- =============================================================================
-- Procedure GenerateSewadarRegister
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateSewadarRegister' AND xtype = 'P')
	DROP PROCEDURE GenerateSewadarRegister
GO

CREATE PROCEDURE GenerateSewadarRegister
(
	@p_satsang_centre_id 	satsang_centre_id,
	@p_satsang_centre_nm 	gnc_nm,
	@p_department_ids		report_xml_prm,
	@p_sub_department_ids	report_xml_prm,
	@p_is_outstation		VARCHAR (3),
	@p_gender				VARCHAR (6),
	@p_district_ids			report_xml_prm,
	@p_is_show_district		Boolean,
	@p_sewadar_list_id		sewadar_list_id,
	@p_session_id			INTEGER				OUTPUT
)
AS
	DECLARE
		@extra_information_header	report_description,
		@extra_information			report_description,
		@sewadar_list_nm			VARCHAR (60)

BEGIN
	DECLARE	@depts		TABLE	(	id	INT	);
	DECLARE	@sub_depts	TABLE	(	id	INT	);
	DECLARE	@districts	TABLE	(	id	INT	);
	DECLARE @hdoc INT;
	
	IF (@p_department_ids IS NULL)
		INSERT INTO	@depts
			SELECT	department_id
			FROM	departments_satsang_centres
			WHERE	satsang_centre_id	=	@p_satsang_centre_id
			AND		effective_till	>	GetDate();
	ELSE
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_department_ids; 
		INSERT INTO	@depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT);
		EXEC sp_xml_removedocument @hdoc;
	END
		
	IF (@p_sub_department_ids IS NOT NULL)
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_sub_department_ids; 
		INSERT INTO	@sub_depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT) 
		EXEC sp_xml_removedocument @hdoc
	END
		
	IF (@p_district_ids IS NOT NULL)
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_district_ids; 
		INSERT INTO	@districts 
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT) 
		EXEC sp_xml_removedocument @hdoc
	END
	ELSE
	BEGIN	
		INSERT INTO	@districts
			SELECT	district_or_city_id
			FROM	CDB..districts_or_cities
			WHERE	effective_till	>	GetDate();
	END		

	IF (@p_sewadar_list_id IS NOT NULL)
		SELECT	@sewadar_list_nm	=	sewadar_list_nm
		FROM	generic_sewadar_lists
		WHERE	sewadar_list_id	=	@p_sewadar_list_id;

	IF (@p_district_ids IS NOT NULL)
		SET @extra_information = 'Sewadar Register for District(s)';
	ELSE
		SET @extra_information = 'Sewadar Register';

	IF (@sewadar_list_nm IS NOT NULL)
		SET @extra_information = @extra_information + ' as per ' + @sewadar_list_nm;
	ELSE
	BEGIN
		IF (@p_is_outstation = 'Yes')
			SET @extra_information = @extra_information + ' of Outstation Sewadars'
		ELSE IF (@p_is_outstation = 'No')
			SET @extra_information = @extra_information + ' of Local Sewadars'
	END

	IF (@p_is_show_district = 'Yes')
		SET	@extra_information_header = 'Age YOA District   Telephone'
	ELSE IF (@p_district_ids IS NOT NULL)
		SET	@extra_information_header = 'Age YOA City       Telephone'
	ELSE
		SET	@extra_information_header = 'Age   YOA  Status  Telephone'
		
	INSERT INTO	generic_report_headers
			(	report_header, extra_information_header	)
		VALUES
			(	@extra_information, @extra_information_header	);

	SET	@p_session_id = SCOPE_IDENTITY();

	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
		SELECT	@p_session_id,
				@p_satsang_centre_id,
				sr.sewadar_grno,
						CASE WHEN @p_is_outstation = '%' AND is_outstation_sewadar = 'Yes' THEN '*' ELSE SPACE (1) END
						+ CONVERT (CHAR (2), DATEDIFF (YEAR, birth_dtm, GetDate())) + SPACE (2)
						+ CASE	WHEN @p_is_show_district = 'No' AND @p_district_ids IS NULL THEN CONVERT (CHAR(4), DATEPART (YY, appointment_dt)) + SPACE (2)
																											+ sr.sewadar_status_cd + SPACE (3)
																							ELSE SUBSTRING (CONVERT (CHAR(4), DATEPART (YY, appointment_dt)), 3, 2) + SPACE (1)
										+ CASE WHEN @p_is_show_district = 'Yes' THEN SUBSTRING (district_nm, 1, 10) + REPLICATE (' ', CASE WHEN 10 - LEN (district_nm) < 0 THEN 1 ELSE 11 - LEN(district_nm) END)
																				ELSE SUBSTRING (post_office_or_city_nm, 1, 10) + REPLICATE (' ', CASE WHEN 10 - LEN (post_office_or_city_nm) < 0 THEN 1 ELSE 11 - LEN(post_office_or_city_nm) END)
										  END
						  END
						+ COALESCE (telephone_mobile, COALESCE (telephone_residence, ''))
		FROM	sewadars_registrations	sr
			JOIN	system_information_values	iv
				ON	(	iv.system_info_cd		=		'SttsGenUse'
					AND	iv.value_varchar		=		sewadar_status_cd
					AND	is_outstation_sewadar	LIKE	@p_is_outstation
					AND sr.satsang_centre_id	=		@p_satsang_centre_id
					)
			JOIN	sewadars	s
				ON	(	s.sewadar_id		=		sr.sewadar_id
					AND	gender						LIKE	@p_gender
					AND	s.global_sewadar_status_cd	IS NULL
					)
			JOIN	sewadars_addresses	sa
				ON	(	sa.sewadar_id	=	s.sewadar_id
					AND	sa.address_type	=	'Residence'
					)
			JOIN	@depts
				ON	(	sr.department_id	=	id	)
			JOIN	sewadars_details	sd
				ON	(	sd.sewadar_id	=	sr.sewadar_id	)
			JOIN post_offices_or_cities poc 
				ON  (	poc.post_office_or_city_id = sa.post_office_or_city_id	)
			JOIN @districts d
				ON  (	poc.district_id = d.id 	)
			JOIN CDB..districts_or_cities doc
				ON	(	doc.district_or_city_id = d.id	)		
			LEFT	JOIN	@sub_depts	x
				ON	(	sr.sub_department_id	=	x.id	)
			LEFT JOIN	generic_sewadar_lists_sewadars	z
				ON	(	sr.satsang_centre_id	=	z.satsang_centre_id
					AND	sr.sewadar_grno			=	z.sewadar_grno
					AND	z.sewadar_list_id		=	@p_sewadar_list_id
					)
		WHERE	(	(	@p_sub_department_ids	IS NOT NULL	AND	x.id	IS NOT NULL	)
				OR	(	@p_sub_department_ids	IS NULL								)
				)
		AND		(	(	@p_sewadar_list_id	IS NOT NULL	AND	z.satsang_centre_id	IS NOT NULL	)
				OR	(	@p_sewadar_list_id	IS NULL											)
				)
END
GO

-- =============================================================================
-- Procedure GenerateScannedBadgesReport
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateScannedBadgesReport' AND xtype = 'P')
	DROP PROCEDURE GenerateScannedBadgesReport
GO

CREATE PROCEDURE GenerateScannedBadgesReport
(
	@p_satsang_centre_id 	satsang_centre_id,
	@p_satsang_centre_nm 	gnc_nm,
	@p_department_ids		report_xml_prm,
	@p_sub_department_ids	report_xml_prm,
	@p_is_outstation		VARCHAR (3),
	@p_gender				VARCHAR (6),
	@p_sewadar_list_id		sewadar_list_id,
	@p_start_dt				DATETIME,
	@p_finish_dt			DATETIME,
	@p_start_time			INTEGER,
	@p_finish_time			INTEGER,
	@p_session_id			INTEGER				OUTPUT
)
AS
	DECLARE
		@extra_information_header	report_description,
		@extra_information			report_description,
		@sewadar_list_nm			VARCHAR (60),
		@sub_job_id					INT,
		@str						VARCHAR (25)
BEGIN
	DECLARE	@depts		TABLE	(	id	INT	);
	DECLARE	@sub_depts	TABLE	(	id	INT	);
	DECLARE @hdoc INT;
	
	IF (@p_department_ids IS NULL)
		INSERT INTO	@depts
			SELECT	department_id
			FROM	departments_satsang_centres
			WHERE	satsang_centre_id	=	@p_satsang_centre_id
			AND		effective_till	>	GetDate();
	ELSE
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_department_ids; 
		INSERT INTO	@depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT);
		EXEC sp_xml_removedocument @hdoc;
	END
		
	IF (@p_sub_department_ids IS NOT NULL)
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_sub_department_ids; 
		INSERT INTO	@sub_depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT) 
		EXEC sp_xml_removedocument @hdoc
	END
		
	SELECT	@sewadar_list_nm	=	l.sewadar_list_nm,
			@sub_job_id			=	j.scanning_sub_job_id
	FROM	generic_sewadar_lists	l
		JOIN	scanning_jobs	s
			ON	(	l.sewadar_list_id	=	s.sewadar_list_id	)
		JOIN	scanning_job_types	t
			ON	(	s.scanning_job_type_cd	=	t.scanning_job_type_cd
				AND	t.has_sub_jobs		=	'No'
				)
		JOIN	scanning_sub_jobs	j
			ON	(	s.scanning_job_id	=	j.scanning_job_id	)
	WHERE	l.sewadar_list_id	=	@p_sewadar_list_id;
	IF (@@ROWCOUNT = 0)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotExist', NULL, 'Scanning Job for the Sewadar List', NULL, NULL
		RETURN -1;
	END

	IF (@p_start_time IS NULL OR @p_start_time < 0 OR @p_start_time > 2400)
		SET @p_start_time = 0;
	IF (@p_finish_time IS NULL OR @p_finish_time < 0 OR @p_finish_time > 2400)
		SET @p_finish_time = 2359;
	IF (@p_start_time % 100 >= 60)
		SET @p_start_time = (@p_start_time / 100) * 100 + 59
	IF (@p_finish_time % 100 >= 60)
		SET @p_finish_time = (@p_finish_time / 100) * 100 + 59
	SET	@p_start_dt		= DATEADD (mi, CAST (@p_start_time / 100 AS int) * 60 + @p_start_time % 100, @p_start_dt) 
	SET	@p_finish_dt	= DATEADD (mi, CAST (@p_finish_time / 100 AS int) * 60 + @p_finish_time % 100, @p_finish_dt) 
	SET @str = CONVERT (VARCHAR, @p_finish_dt, 106) + space (1) + SUBSTRING (CONVERT (VARCHAR, @p_finish_dt, 108), 1, 5) + ':59.999'
	SET	@p_finish_dt	= @str;
	SET @extra_information = @sewadar_list_nm + ' from '
							+ CONVERT (VARCHAR(11), @p_start_dt, 106)
							+ ' (' + CONVERT (VARCHAR(5), @p_start_dt, 108) + ')'
							+ ' to '
							+ CONVERT (VARCHAR(11), @p_finish_dt, 106)
							+ ' (' + CONVERT (VARCHAR(5), @p_finish_dt, 108) + ')'


	SET	@extra_information_header = 'Status  Scanned Date & Time'
		
	INSERT INTO	generic_report_headers
			(	report_header, extra_information_header	)
		VALUES
			(	@extra_information, @extra_information_header	);

	SET	@p_session_id = SCOPE_IDENTITY();

	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
		SELECT	@p_session_id,
				@p_satsang_centre_id,
				sr.sewadar_grno,
				SPACE(1) + SUBSTRING(sr.sewadar_status_cd + SPACE (6), 1, 6) +
				SPACE(1) + CONVERT (VARCHAR, MIN (b.scanned_dtm), 106) +
				SPACE(1) + CONVERT (VARCHAR(5), MIN (b.scanned_dtm), 108)
		FROM	generic_sewadar_lists_sewadars	z
			JOIN	scanned_badges_store	b
				ON	(	z.sewadar_list_id		=	@p_sewadar_list_id
					AND	b.scanning_sub_job_id	=	@sub_job_id
					AND	b.satsang_centre_id		=	z.satsang_centre_id
					AND	b.sewadar_grno			=	z.sewadar_grno
					AND	b.scanned_dtm		BETWEEN	@p_start_dt	AND	@p_finish_dt
					)
			JOIN	sewadars_registrations	sr
				ON	(	sr.satsang_centre_id	=	z.satsang_centre_id
					AND	sr.sewadar_grno			=	z.sewadar_grno
					AND	is_outstation_sewadar	LIKE	@p_is_outstation
					)
			JOIN	sewadars	s
				ON	(	s.sewadar_id		=		sr.sewadar_id
					AND	gender						LIKE	@p_gender
					AND	s.global_sewadar_status_cd	IS NULL
					)
			JOIN	@depts
				ON	(	sr.department_id	=	id	)
			LEFT	JOIN	@sub_depts	x
				ON	(	sr.sub_department_id	=	x.id	)
		WHERE	(	(	@p_sub_department_ids	IS NOT NULL	AND	x.id	IS NOT NULL	)
				OR	(	@p_sub_department_ids	IS NULL								)
				)
		GROUP BY sr.sewadar_grno, sr.sewadar_status_cd, sr.satsang_centre_id;
END
GO

-- =============================================================================
-- Procedure GenerateAreaWiseSewadarList
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateAreaWiseSewadarList' AND xtype = 'P')
	DROP PROCEDURE GenerateAreaWiseSewadarList
GO

CREATE PROCEDURE GenerateAreaWiseSewadarList
(
	@p_satsang_centre_id 	satsang_centre_id,
	@p_satsang_centre_nm 	gnc_nm,
	@p_department_ids		report_xml_prm,
	@p_sub_department_ids	report_xml_prm,
	@p_is_outstation		VARCHAR (3),
	@p_gender				VARCHAR (6),
	@p_area_id				satsang_centre_id,
	@p_area_nm			 	gnc_nm,
	@p_date_from			DATETIME,
	@p_date_till			DATETIME,
	@p_sewadar_list_id		sewadar_list_id,
	@p_is_contact_no		Boolean,
	@p_is_summary			Boolean,
	@p_session_id			INTEGER				OUTPUT
)
AS
	DECLARE
		@extra_information_header	report_description,
		@sewadar_list_nm		 	gnc_long_nm,
		@extra_information			report_description

BEGIN
	SELECT	@sewadar_list_nm	=	sewadar_list_nm
	FROM	generic_sewadar_lists
	WHERE	sewadar_list_id	=	@p_sewadar_list_id;

	DECLARE	@depts		TABLE	(	id	INT	);
	DECLARE	@sub_depts	TABLE	(	id	INT	);
	DECLARE	@centres	TABLE	(	id	INT	PRIMARY KEY,	typ	CHAR (1), ss_nm	VARCHAR (100)	);
	DECLARE @hdoc INT;
	
	IF (@p_department_ids IS NULL)
		INSERT INTO	@depts
			SELECT	department_id
			FROM	departments_satsang_centres
			WHERE	satsang_centre_id	=	@p_satsang_centre_id
			AND		effective_till	>	GetDate();
	ELSE
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_department_ids; 
		INSERT INTO	@depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT);
		EXEC sp_xml_removedocument @hdoc;
	END
		
	IF (@p_sub_department_ids IS NOT NULL)
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_sub_department_ids; 
		INSERT INTO	@sub_depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT) 
		EXEC sp_xml_removedocument @hdoc
	END

	IF (@p_area_id IS NULL)
	BEGIN
		INSERT INTO	@centres
				(	id	)
			SELECT	DISTINCT	weekly_satsang_centre_id
			FROM	sewadars_registrations	r
				JOIN	sewadars_details	d
					ON	(	d.sewadar_id	=	r.sewadar_id
						AND	satsang_centre_id	=	@p_satsang_centre_id
						)
			WHERE	weekly_satsang_centre_id	IS NOT NULL;

		UPDATE	c
			SET	typ		=	SUBSTRING (sc.satsang_centre_type, 1, 1),
				ss_nm	=	CASE sc.satsang_centre_type WHEN 'C' THEN sc.satsang_centre_nm ELSE COALESCE (rc.satsang_centre_nm + ' - ', '') + sc.satsang_centre_nm END
		FROM	@centres	c
			JOIN	CDB..satsang_centres	sc
				ON	(	sc.satsang_centre_id	=	c.id	)
			JOIN	satsang_centres_details	s
				ON	(	s.satsang_centre_id	=	c.id	)
			LEFT JOIN	CDB..satsang_centres	rc
				ON	(	rc.satsang_centre_id	=	s.reports_to_centre_id	);
	END
	ELSE
	BEGIN
		INSERT INTO	@centres
			SELECT	s.satsang_centre_id, 'C', s.satsang_centre_nm
			FROM	satsang_centres_details	c
				JOIN	CDB..satsang_centres	s
					ON	(	s.satsang_centre_id	=	c.satsang_centre_id
						AND	c.reports_to_centre_id	=	@p_area_id
						)
		
		INSERT INTO	@centres
			SELECT	s.satsang_centre_id, SUBSTRING (s.satsang_centre_type, 1, 1), ss_nm + ' - ' + s.satsang_centre_nm
			FROM	@centres	p
				JOIN	satsang_centres_details	c
					ON	(	c.reports_to_centre_id	=	p.id	)
				JOIN	CDB..satsang_centres	s
					ON	(	s.satsang_centre_id	=	c.satsang_centre_id	)
	END

	IF (@p_is_summary = 'No')
		SET @extra_information = 'Area-wise Sewadar List';
	ELSE
		SET @extra_information = 'Area-wise Sewadar Summary';

	IF (@p_is_outstation = 'Yes')
		SET @extra_information = @extra_information + ' of Outstation Sewadars'
	ELSE IF (@p_is_outstation = 'No')
		SET @extra_information = @extra_information + ' of Local Sewadars'

	IF (@p_sewadar_list_id	IS NOT	NULL AND @sewadar_list_nm IS NOT NULL)					--- Restrict to Sewadar List
		SET @extra_information = @extra_information + ' as per ' + @sewadar_list_nm;

	IF (@p_date_from IS NOT NULL AND @p_date_till IS NOT NULL)
		SET @extra_information = @extra_information + ' born between ' + CONVERT (VARCHAR (11), @p_date_from, 6)
															+ ' and ' +  CONVERT (VARCHAR (11), @p_date_till, 6)
	ELSE IF (@p_date_from IS NOT NULL)
		SET @extra_information = @extra_information + ' born after ' + CONVERT (VARCHAR (11), @p_date_from, 6)
	ELSE IF (@p_date_till IS NOT NULL)
		SET @extra_information = @extra_information + ' born before ' +  CONVERT (VARCHAR (11), @p_date_till, 6)

	IF (@p_is_contact_no = 'Yes')
		SET	@extra_information_header = 'Age Department            Telephone'
	ELSE
		SET	@extra_information_header = 'Age Status YOA Old-GR Department'
		
	IF (@p_is_summary = 'No')
		INSERT INTO	generic_report_headers
				(	report_header, extra_information_header	)
			VALUES
				(	@extra_information, @extra_information_header	);
	ELSE
		INSERT INTO	generic_report_headers
				(	report_header, major_information_header	)
			VALUES
				(	@extra_information, @extra_information_header	);

	SET	@p_session_id = SCOPE_IDENTITY();

	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information,
				grouping_1,		--	Ssatsang Centre - [Sub Centre|Point]
				grouping_2		--	Gender
			)
		SELECT	@p_session_id,
				sr.satsang_centre_id,
				sr.sewadar_grno,
				CASE	WHEN @p_is_contact_no = 'Yes'
					THEN
						SPACE (1)
							+ CONVERT (CHAR (2), DATEDIFF (YEAR, birth_dtm, GetDate())) + SPACE (1)
							+ SUBSTRING (department_nm + COALESCE (' (' +  sub_department_cd + ')','') + SPACE (20), 1, 21) + SPACE (1)
							+ telephone_mobile
					ELSE
						SPACE (1)
							+ CONVERT (CHAR (2), DATEDIFF (YEAR, birth_dtm, GetDate())) + SPACE (1)
							+ sr.sewadar_status_cd + SPACE (2)
							+ CONVERT (CHAR(4), DATEPART (YY, appointment_dt)) + SPACE (1)
							+ RIGHT ('      ' + COALESCE (swr.remarks, ' '), 6) + SPACE (1)
							+ department_nm + COALESCE ('(' + sub_department_cd + ')', '')
				END,
				ss.ss_nm,
				s.gender
		FROM	sewadars_registrations	sr
			JOIN	sewadars	s
				ON	(	s.sewadar_id				=	sr.sewadar_id
					AND	gender						LIKE	@p_gender
					AND	s.global_sewadar_status_cd	IS NULL
					AND	is_outstation_sewadar	LIKE	@p_is_outstation
					AND sr.satsang_centre_id	=		@p_satsang_centre_id
					)
			JOIN	@depts dpt
				ON	(	sr.department_id	=	dpt.id	)
			LEFT	JOIN	@sub_depts	x
				ON	(	sr.sub_department_id	=	x.id	)
			JOIN	sewadars_details	sd
				ON	(	sd.sewadar_id	=	sr.sewadar_id	)
			JOIN	@centres	ss
				ON	(	sd.weekly_satsang_centre_id	=	ss.id	)
			JOIN	departments	d
				ON	(	d.department_id	=	sr.department_id	)
			LEFT JOIN	sub_departments	sdp
				ON	(	sdp.sub_department_id	=	sr.sub_department_id	)
			LEFT JOIN	sewadars_remarks swr
				ON	(	swr.sewadar_id	=	sr.sewadar_id
					AND	swr.remarks_type	=	'Old G.R.No.'
					)
			LEFT JOIN	system_information_values	iv
				ON	(	iv.system_info_cd		=		'SwdStsArea'
					AND	iv.value_varchar		=		sewadar_status_cd
					)
			LEFT JOIN generic_sewadar_lists_sewadars	sl
				ON	(	sl.satsang_centre_id =	sr.satsang_centre_id
					AND	sl.sewadar_grno		 =	sr.sewadar_grno
					AND	sl.sewadar_list_id	 =	@p_sewadar_list_id
					)
			WHERE	(	(	@p_sewadar_list_id IS NOT NULL	AND	sl.sewadar_grno		IS	NOT NULL	)
					OR	(	@p_sewadar_list_id IS NULL		AND	iv.value_varchar	IS	NOT	NULL	)
					)
			AND		(	(	@p_sub_department_ids	IS NOT NULL	AND	x.id	IS NOT NULL	)
					OR	(	@p_sub_department_ids	IS NULL							)
					);
	IF (@p_date_from IS NOT NULL)
		DELETE	x
		FROM	generic_report_details	x
			JOIN	sewadars_registrations	r
				ON	(	x.satsang_centre_id	=	r.satsang_centre_id
					AND	x.sewadar_grno		=	r.sewadar_grno
					)
			JOIN	sewadars	s
				ON	(	r.sewadar_id	=	s.sewadar_id	)
		WHERE	birth_dtm	<	@p_date_from;
	IF (@p_date_till IS NOT NULL)
		DELETE	x
		FROM	generic_report_details	x
			JOIN	sewadars_registrations	r
				ON	(	x.satsang_centre_id	=	r.satsang_centre_id
					AND	x.sewadar_grno		=	r.sewadar_grno
					)
			JOIN	sewadars	s
				ON	(	r.sewadar_id	=	s.sewadar_id	)
		WHERE	birth_dtm	>	@p_date_till;

	IF (@p_is_summary = 'Yes') 
	BEGIN
		INSERT	INTO	generic_report_summaries
				(	session_id,	major_information, gents_cnt, ladies_cnt	)
			SELECT	@p_session_id,
					grouping_1,
					SUM (CASE WHEN grouping_2 = 'Male' THEN 1 ELSE 0 END),
					SUM (CASE WHEN grouping_2 = 'Female' THEN 1 ELSE 0 END)
			FROM	generic_report_details
			WHERE	session_id	=	@p_session_id
			GROUP BY	grouping_1
			ORDER BY 2;
	END
END
GO
 
-- =============================================================================
-- Procedure GenerateSewadarsReportingCards
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateSewadarsReportingCards' AND xtype = 'P')
	DROP PROCEDURE GenerateSewadarsReportingCards
GO

CREATE PROCEDURE GenerateSewadarsReportingCards
(
	@p_satsang_centre_id 	satsang_centre_id,
	@p_satsang_centre_nm 	gnc_nm,
	@p_department_ids		report_xml_prm,
	@p_sub_department_ids	report_xml_prm,
	@p_is_outstation		VARCHAR (3),
	@p_gender				VARCHAR (6),
	@p_area_id				satsang_centre_id,
	@p_area_nm			 	gnc_nm,
	@p_sewadar_list_id		sewadar_list_id,
	@p_sewa_id				sewa_id,
	@p_sewa_nm				gnc_nm,
	@p_session_id			INTEGER	= 0			OUTPUT
)
AS
	DECLARE
		@extra_information_header	report_description,
		@extra_information			report_description

BEGIN
	DECLARE	@depts		TABLE	(	id	INT	);
	DECLARE	@sub_depts	TABLE	(	id	INT	);
	DECLARE	@centres	TABLE	(	id	INT	PRIMARY KEY,	typ	VARCHAR (20), area_nm	VARCHAR (100), ss_nm	VARCHAR (100)	);
	DECLARE @hdoc INT;
	
	IF (@p_department_ids IS NULL)
		INSERT INTO	@depts
			SELECT	department_id
			FROM	departments_satsang_centres
			WHERE	satsang_centre_id	=	@p_satsang_centre_id
			AND		effective_till	>	GetDate();
	ELSE
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_department_ids; 
		INSERT INTO	@depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT);
		EXEC sp_xml_removedocument @hdoc;
	END
		
	IF (@p_sub_department_ids IS NOT NULL)
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_sub_department_ids; 
		INSERT INTO	@sub_depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT) 
		EXEC sp_xml_removedocument @hdoc
	END

	IF (@p_area_id IS NULL)
	BEGIN
		INSERT INTO	@centres
				(	id	)
			SELECT	DISTINCT	weekly_satsang_centre_id
			FROM	sewadars_registrations	r
				JOIN	sewadars_details	d
					ON	(	d.sewadar_id	=	r.sewadar_id
						AND	satsang_centre_id	=	@p_satsang_centre_id
						)
			WHERE	weekly_satsang_centre_id	IS NOT NULL;

		UPDATE	c
			SET	typ		=	sc.satsang_centre_type,
				ss_nm	=	CASE sc.satsang_centre_type WHEN 'C' THEN sc.satsang_centre_nm ELSE COALESCE (rc.satsang_centre_nm + ' - ', '') + sc.satsang_centre_nm END,
				area_nm	=	REPLACE (a.satsang_centre_nm, ' Area', '')
		FROM	@centres	c
			JOIN	CDB..satsang_centres	sc
				ON	(	sc.satsang_centre_id	=	c.id	)
			JOIN	satsang_centres_details	s
				ON	(	s.satsang_centre_id	=	c.id	)
			LEFT JOIN	CDB..satsang_centres	rc
				ON	(	rc.satsang_centre_id	=	s.reports_to_centre_id	)
			LEFT JOIN	satsang_centres_details	rcd
				ON	(	rcd.satsang_centre_id	=	rc.satsang_centre_id	)
			LEFT JOIN	CDB..satsang_centres	a
				ON	(	a.satsang_centre_id	=	rcd.reports_to_centre_id	);
	END
	ELSE
	BEGIN
		INSERT INTO	@centres
			SELECT	s.satsang_centre_id, 'Centre', @p_area_nm, s.satsang_centre_nm
			FROM	satsang_centres_details	c
				JOIN	CDB..satsang_centres	s
					ON	(	s.satsang_centre_id	=	c.satsang_centre_id
						AND	c.reports_to_centre_id	=	@p_area_id
						)
		
		INSERT INTO	@centres
			SELECT	s.satsang_centre_id, @p_area_nm, s.satsang_centre_type, ss_nm + ' - ' + s.satsang_centre_nm
			FROM	@centres	p
				JOIN	satsang_centres_details	c
					ON	(	c.reports_to_centre_id	=	p.id	)
				JOIN	CDB..satsang_centres	s
					ON	(	s.satsang_centre_id	=	c.satsang_centre_id	)
	END

		---- [ ---- Though these lines are not needed for the report, but to use the Generic Report mechanism, these are required ------------
	SET @extra_information = 'Area-wise Sewadar Reporting Cards';

	SET	@extra_information_header = 'Age Status YOA Old-GR Department'
		
	INSERT INTO	generic_report_headers
			(	report_header, major_information_header	)
		VALUES
			(	@extra_information, @extra_information_header	);

	SET	@p_session_id = SCOPE_IDENTITY();
		---- ] --------------------------------------------------------------------------------------------------------------------------------
	
	IF (@p_sewa_id	IS NOT NULL)
		EXEC SummariseSewa @p_sewa_id;

	SELECT	sr.sewadar_id, s.gender,
			COALESCE (dbo.MakeCamelCase (ss.area_nm) + ' / ', '') + dbo.MakeCamelCase (ss.ss_nm)	AS	satsang_centre_nm, 		---- Contains Sub-Centre or Point Name, if applicable
			dbo.MakeCamelCase (ss.typ)	AS	satsang_centre_type,
			dbo.MakeCamelCase (s.first_nm) + ' ' + COALESCE (SUBSTRING (dbo.MakeCamelCase (s.middle_nm), 1, 1) + '. ', '') + dbo.MakeCamelCase (s.last_nm) as sewadar_nm,
			sr.satsang_centre_id,
			sr.sewadar_grno,
			dbo.MakeCamelCase (c.centre_nm) AS centre_nm,							---- The Centre where Sewadar has been registered; the sewadar badge is made at this centre
			department_nm + COALESCE (' (' + LTRIM(RTRIM(sub_department_cd)) + ')', '')	AS	department,
			w.present_cnt + w.exempt_cnt		AS	sewa_days_at_program_centre,
			YEAR (sw.finish_dt)		AS	reporting_card_year
	FROM	sewadars_registrations	sr
		JOIN	system_information_values	iv
			ON	(	iv.system_info_cd		=		'SttsCnstSewa'
				AND	iv.value_varchar		=		sewadar_status_cd
				AND	is_outstation_sewadar	LIKE	@p_is_outstation
				AND sr.satsang_centre_id	=		@p_satsang_centre_id
				)
		JOIN	sewadars	s
			ON	(	s.sewadar_id				=	sr.sewadar_id
				AND	gender						LIKE	@p_gender
				AND	s.global_sewadar_status_cd	IS NULL
				)
		JOIN	@depts dpt
			ON	(	sr.department_id	=	dpt.id	)
		LEFT	JOIN	@sub_depts	x
			ON	(	sr.sub_department_id	=	x.id	)
		JOIN	sewadars_details	sd
			ON	(	sd.sewadar_id	=	sr.sewadar_id	)
		JOIN	@centres	ss
			ON	(	sd.weekly_satsang_centre_id	=	ss.id	)
		JOIN	departments	d
			ON	(	d.department_id	=	sr.department_id	)
		JOIN	satsang_centres_details	c
			ON	(	c.satsang_centre_id	=	sr.satsang_centre_id	)
		LEFT JOIN	sub_departments	sdp
			ON	(	sdp.sub_department_id	=	sr.sub_department_id	)
		LEFT JOIN generic_sewadar_lists_sewadars	sl
			ON	(	sl.satsang_centre_id =	sr.satsang_centre_id
				AND	sl.sewadar_grno		 =	sr.sewadar_grno
				AND	sl.sewadar_list_id	 =	@p_sewadar_list_id
				)
		LEFT JOIN	sewadar_wise_sewa_summaries	w
			ON	(	w.sewa_id			=	@p_sewa_id
				AND	w.satsang_centre_id	=	sr.satsang_centre_id
				AND	w.sewadar_grno		=	sr.sewadar_grno
				)
		LEFT JOIN	sewas	sw
			ON	(	sw.sewa_id	=	@p_sewa_id	)
	WHERE	(	(	@p_sewadar_list_id IS NOT NULL	AND	sl.sewadar_grno IS NOT NULL	)
			OR	(	@p_sewadar_list_id IS NULL	)
			)
	AND		(	(	@p_sub_department_ids	IS NOT NULL	AND	x.id	IS NOT NULL	)
			OR	(	@p_sub_department_ids	IS NULL							)
			);
END
GO
 
-- =============================================================================
-- Procedure GenerateSewadarListWithoutWeeklyCentres
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateSewadarListWithoutWeeklyCentres' AND xtype = 'P')
	DROP PROCEDURE GenerateSewadarListWithoutWeeklyCentres
GO

CREATE PROCEDURE GenerateSewadarListWithoutWeeklyCentres
(
	@p_satsang_centre_id 	satsang_centre_id,
	@p_satsang_centre_nm 	gnc_nm,
	@p_department_ids		report_xml_prm,
	@p_sub_department_ids	report_xml_prm,
	@p_is_outstation		VARCHAR (3),
	@p_gender				VARCHAR (6),
	@p_district_ids			report_xml_prm,
	@p_session_id			INTEGER				OUTPUT
)
AS
	DECLARE
		@extra_information_header	report_description,
		@extra_information			report_description

BEGIN
	DECLARE	@depts		TABLE	(	id	INT	);
	DECLARE	@sub_depts	TABLE	(	id	INT	);
	DECLARE	@districts	TABLE	(	id	INT	);
	DECLARE @hdoc INT;
	
	/*
	IF (@p_department_ids IS NULL)
		SET @extra_information = ' for All Departments'
	ELSE
		SET @extra_information = ''
		*/

	IF (@p_department_ids IS NULL)
		INSERT INTO	@depts
			SELECT	department_id
			FROM	departments_satsang_centres
			WHERE	satsang_centre_id	=	@p_satsang_centre_id
			AND		effective_till	>	GetDate();
	ELSE
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_department_ids; 
		INSERT INTO	@depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT);
		EXEC sp_xml_removedocument @hdoc;
	END
		
	IF (@p_sub_department_ids IS NOT NULL)
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_sub_department_ids; 
		INSERT INTO	@sub_depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT) 
		EXEC sp_xml_removedocument @hdoc
	END
		
	IF (@p_district_ids IS NOT NULL)
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_district_ids; 
		INSERT INTO	@districts 
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT) 
		EXEC sp_xml_removedocument @hdoc
	END
	ELSE
	BEGIN	
		INSERT INTO	@districts
			SELECT	district_or_city_id
			FROM	CDB..districts_or_cities
			WHERE	effective_till	>	GetDate();
	END		


	IF (@p_is_outstation = 'Yes')
		SET @extra_information = 'List of Outstation Sewadars'
	ELSE IF (@p_is_outstation = 'No')
		SET @extra_information = 'List of Local Sewadars'
	ELSE
		SET @extra_information = 'List of Sewadars'
	SET @extra_information = @extra_information + ' without Weekly Satsang Centres';

	SET	@extra_information_header = 'Age YOA Status Place'
		
	INSERT INTO	generic_report_headers
			(	report_header, extra_information_header	)
		VALUES
			(	@extra_information, @extra_information_header	);

	SET	@p_session_id = SCOPE_IDENTITY();

	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
		SELECT	@p_session_id,
				@p_satsang_centre_id,
				sr.sewadar_grno,
						SPACE (1)
						+ CONVERT (CHAR (2), DATEDIFF (YEAR, birth_dtm, GetDate())) + SPACE (2)
						+ SUBSTRING (CONVERT (CHAR(4), DATEPART (YY, appointment_dt)), 3, 2) + SPACE (2)
						+ sr.sewadar_status_cd + SPACE (2)
						+ post_office_or_city_nm + CASE WHEN district_nm != post_office_or_city_nm THEN ' (' + district_nm + ')' ELSE '' END
		FROM	sewadars_registrations	sr
			JOIN	system_information_values	iv
				ON	(	iv.system_info_cd		=		'SttsGenUse'
					AND	iv.value_varchar		=		sewadar_status_cd
					AND	is_outstation_sewadar	LIKE	@p_is_outstation
					AND sr.satsang_centre_id	=		@p_satsang_centre_id
					)
			JOIN	sewadars	s
				ON	(	s.sewadar_id				=		sr.sewadar_id
					AND	gender						LIKE	@p_gender
					AND	s.global_sewadar_status_cd	IS NULL
					)
			JOIN	sewadars_details	x
				ON	(	x.sewadar_id	=	s.sewadar_id
					AND	x.weekly_satsang_centre_id	IS NULL
					)
			JOIN	sewadars_addresses	sa
				ON	(	sa.sewadar_id	=	s.sewadar_id
					AND	sa.address_type	=	'Residence'
					)
			JOIN	@depts
				ON	(	sr.department_id	=	id	)
			JOIN	sewadars_details	sd
				ON	(	sd.sewadar_id	=	sr.sewadar_id	)
			JOIN post_offices_or_cities poc 
				ON  (	poc.post_office_or_city_id = sa.post_office_or_city_id	)
			JOIN @districts d
				ON  (	poc.district_id = d.id 	)
			JOIN CDB..districts_or_cities doc
				ON	(	doc.district_or_city_id = d.id	)
			LEFT	JOIN	@sub_depts	tsd
				ON	(	sr.sub_department_id	=	tsd.id	)
			WHERE	(	@p_sub_department_ids	IS NOT NULL	AND	tsd.id	IS NOT NULL	)
				OR	(	@p_sub_department_ids	IS NULL					)
END
GO

-- =============================================================================
-- Procedure GenerateSewadarListWithIncorrectHealthDetails
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateSewadarListWithIncorrectHealthDetails' AND xtype = 'P')
	DROP PROCEDURE GenerateSewadarListWithIncorrectHealthDetails
GO
-- =============================================================================
-- Procedure GenerateTraineeOrOpenSewadarRegister
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateTraineeOrOpenSewadarRegister' AND xtype = 'P')
	DROP PROCEDURE GenerateTraineeOrOpenSewadarRegister
GO

CREATE PROCEDURE GenerateTraineeOrOpenSewadarRegister
(
	@p_satsang_centre_id 		satsang_centre_id,
	@p_satsang_centre_nm	 	gnc_nm,
	@p_department_ids			report_xml_prm,
	@p_is_outstation			VARCHAR (3),
	@p_gender					VARCHAR (6),
	@p_appointments_after_dt	DATETIME,
	@p_sewadar_type				CHAR (1),
	@p_session_id				INTEGER				OUTPUT
)
AS
	DECLARE
		@extra_information_header	report_description,
		@extra_information			report_description,
		@sewadar_type_nm			gnc_nm,
		@status_cd					VARCHAR (10)

BEGIN
	DECLARE	@depts		TABLE	(	id	INT	);
	DECLARE @hdoc INT;
	
	IF (@p_department_ids IS NULL)
		INSERT INTO	@depts
			SELECT	department_id
			FROM	departments_satsang_centres
			WHERE	satsang_centre_id	=	@p_satsang_centre_id
			AND		effective_till	>	GetDate();
	ELSE
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_department_ids; 
		INSERT INTO	@depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT);
		EXEC sp_xml_removedocument @hdoc;
	END

	IF (@p_sewadar_type = 'O')
	BEGIN
		SET @sewadar_type_nm = 'Open';
		SET @status_cd = 'Open';
	END
	ELSE IF (@p_sewadar_type = 'T')
	BEGIN
		SET @sewadar_type_nm = 'Trainee';
		SET @status_cd = 'Trn';
	END
		
	SET @extra_information = 'Sewadar Register';

	IF (@p_is_outstation = 'Yes')
		SET @extra_information = @extra_information + ' of Outstation ' + @sewadar_type_nm + ' Sewadars'
	ELSE IF (@p_is_outstation = 'No')
		SET @extra_information = @extra_information + ' of Local ' + @sewadar_type_nm + ' Sewadars'
	ELSE
		SET @extra_information = @extra_information + ' of ' + @sewadar_type_nm + ' Sewadars'
	IF (@p_appointments_after_dt IS NOT NULL)
		SET @extra_information = @extra_information + ' appointed on or after ' + CONVERT (VARCHAR, @p_appointments_after_dt, 106)
	ELSE
		SET @p_appointments_after_dt = '01 Jan 1950';

	SET	@extra_information_header = 'Age Sys ID Telephone    Location'
		
	INSERT INTO	generic_report_headers
			(	report_header, extra_information_header	)
		VALUES
			(	@extra_information, @extra_information_header	);

	SET	@p_session_id = SCOPE_IDENTITY();

	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
		SELECT	@p_session_id,
				@p_satsang_centre_id,
				sr.sewadar_grno,
						CONVERT (CHAR (3), DATEDIFF (YEAR, birth_dtm, GetDate())) + SPACE (1)
						+ CONVERT (CHAR(6), s.sewadar_id) + SPACE (1)
						+ CONVERT (CHAR (12), SUBSTRING (COALESCE (telephone_mobile, COALESCE (telephone_residence, '')), 1, 12))
						+ district_nm + '(' + state_nm + ')'
		FROM	sewadars_registrations	sr
			JOIN	sewadars	s
				ON	(	s.sewadar_id				=		sr.sewadar_id
					AND	sewadar_status_cd			=		@status_cd
					AND	is_outstation_sewadar		LIKE	@p_is_outstation
					AND sr.satsang_centre_id		=		@p_satsang_centre_id
					AND	gender						LIKE	@p_gender
					AND	s.global_sewadar_status_cd	IS NULL
					AND	sr.appointment_dt			>=		@p_appointments_after_dt
					)
			JOIN	@depts
				ON	(	sr.department_id	=	id	)
			JOIN	sewadars_details	sd
				ON	(	sd.sewadar_id	=	s.sewadar_id	)
			JOIN CDB..districts_or_cities doc
				ON	(	doc.district_or_city_id = sr.location_district_id	)		
			JOIN CDB..states st
				ON	(	st.state_id	= doc.state_id	)
END
GO

-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateTraineeSewadarRegister' AND xtype = 'P')
	DROP PROCEDURE GenerateTraineeSewadarRegister
GO

CREATE PROCEDURE GenerateTraineeSewadarRegister
(
	@p_satsang_centre_id 		satsang_centre_id,
	@p_satsang_centre_nm	 	gnc_nm,
	@p_department_ids			report_xml_prm,
	@p_is_outstation			VARCHAR (3),
	@p_gender					VARCHAR (6),
	@p_appointments_after_dt	DATETIME,
	@p_session_id				INTEGER				OUTPUT
)
AS
	DECLARE
		@rval					INT;
BEGIN
	EXEC	@rval = GenerateTraineeOrOpenSewadarRegister	@p_satsang_centre_id, @p_satsang_centre_nm, @p_department_ids, @p_is_outstation,
												@p_gender, @p_appointments_after_dt, 'T', @p_session_id	OUTPUT;
	IF (@rval != 0)
		RETURN @rval;
END
GO

-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateOpenSewadarRegister' AND xtype = 'P')
	DROP PROCEDURE GenerateOpenSewadarRegister
GO

CREATE PROCEDURE GenerateOpenSewadarRegister
(
	@p_satsang_centre_id 		satsang_centre_id,
	@p_satsang_centre_nm	 	gnc_nm,
	@p_department_ids			report_xml_prm,
	@p_is_outstation			VARCHAR (3),
	@p_gender					VARCHAR (6),
	@p_appointments_after_dt	DATETIME,
	@p_session_id				INTEGER				OUTPUT
)
AS
	DECLARE
		@rval					INT;
BEGIN
	EXEC	@rval = GenerateTraineeOrOpenSewadarRegister	@p_satsang_centre_id, @p_satsang_centre_nm, @p_department_ids, @p_is_outstation,
												@p_gender, @p_appointments_after_dt, 'O', @p_session_id	OUTPUT;
	IF (@rval != 0)
		RETURN @rval;
END
GO

-- =============================================================================
-- Procedure SummariseLocationWiseTraineeOrOpenSewadars
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'SummariseLocationWiseTraineeOrOpenSewadars' AND xtype = 'P')
	DROP PROCEDURE SummariseLocationWiseTraineeOrOpenSewadars
GO

CREATE PROCEDURE SummariseLocationWiseTraineeOrOpenSewadars
(
	@p_satsang_centre_id 		satsang_centre_id,
	@p_satsang_centre_nm	 	gnc_nm,
	@p_is_outstation			VARCHAR (3),
	@p_sewadar_type				CHAR (1),
	@p_session_id				INTEGER				OUTPUT
)
AS
	DECLARE
		@sewadar_type_nm			gnc_nm,
		@status_cd					VARCHAR (10)
BEGIN
	IF (@p_sewadar_type = 'O')
	BEGIN
		SET @sewadar_type_nm = 'Open';
		SET @status_cd = 'Open';
	END
	ELSE IF (@p_sewadar_type = 'T')
	BEGIN
		SET @sewadar_type_nm = 'Trainee';
		SET @status_cd = 'Trn';
	END

	INSERT INTO	generic_report_headers
			(	report_header, major_information_header )
		VALUES
			(	'Location-wise Summary of ' + @sewadar_type_nm + ' Sewadars as on ' + CONVERT (VARCHAR(11), GetDate(), 106),
			  	'Location (State)'
			)

	SET	@p_session_id = SCOPE_IDENTITY();

	DECLARE	@tmp_lctn_cnt	TABLE
		(	location_id		INTEGER,
			males_cnt		INTEGER,
			females_cnt		INTEGER
		)
	
	INSERT	INTO	@tmp_lctn_cnt
						SELECT	COALESCE (males.location_district_id, females.location_district_id),
								males_count,
								females_count
						FROM	(	SELECT	location_district_id, COUNT (*) as males_count 
									FROM	sewadars	s
										JOIN	sewadars_registrations	sr
											ON	(	s.sewadar_id				=		sr.sewadar_id
												AND sr.satsang_centre_id		=		@p_satsang_centre_id
												AND	sr.sewadar_status_cd		=		@status_cd
												AND	gender						=		'Male'
												AND	s.global_sewadar_status_cd	IS NULL
												AND	is_outstation_sewadar		LIKE	@p_is_outstation
												AND	sr.sewadar_type				=		@p_sewadar_type
												)
									GROUP BY location_district_id
								)	AS	males
							FULL OUTER JOIN
								(	SELECT	location_district_id, COUNT (*) as females_count 
									FROM	sewadars	s
										JOIN	sewadars_registrations	sr
											ON	(	s.sewadar_id				=		sr.sewadar_id
												AND sr.satsang_centre_id		=		@p_satsang_centre_id
												AND	sr.sewadar_status_cd		=		@status_cd
												AND	gender						=		'Female'
												AND	s.global_sewadar_status_cd	IS NULL
												AND	is_outstation_sewadar		LIKE	@p_is_outstation
												AND	sr.sewadar_type				=		@p_sewadar_type
												)
									GROUP BY location_district_id
								)	AS	females	
								ON	(	males.location_district_id		=	females.location_district_id
									);

	INSERT	INTO	generic_report_summaries
			(	session_id,	major_information, gents_cnt, ladies_cnt)
		SELECT	@p_session_id,
				district_nm + '(' + state_nm + ')',
				COALESCE (SUM (males_cnt), 0),
				COALESCE (SUM (females_cnt), 0)
		FROM	@tmp_lctn_cnt	a
			JOIN CDB..districts_or_cities doc
				ON	(	doc.district_or_city_id = location_id	)		
			JOIN CDB..states st
				ON	(	st.state_id	= doc.state_id	)
		GROUP BY district_nm + '(' + state_nm + ')'
		ORDER BY 2
END
GO

-- =============================================================================
-- Procedure SummariseLocationWiseOpenSewadars
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'SummariseLocationWiseOpenSewadars' AND xtype = 'P')
	DROP PROCEDURE SummariseLocationWiseOpenSewadars
GO

CREATE PROCEDURE SummariseLocationWiseOpenSewadars
(
	@p_satsang_centre_id 		satsang_centre_id,
	@p_satsang_centre_nm	 	gnc_nm,
	@p_is_outstation			VARCHAR (3),
	@p_session_id				INTEGER				OUTPUT
)
AS
	DECLARE
		@rval					INT;
BEGIN
	EXEC	@rval = SummariseLocationWiseTraineeOrOpenSewadars	@p_satsang_centre_id, @p_satsang_centre_nm, @p_is_outstation, 'O', @p_session_id	OUTPUT;
	IF (@rval != 0)
		RETURN @rval;
END
GO

-- =============================================================================
-- Procedure SummariseLocationWiseTraineeSewadars
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'SummariseLocationWiseTraineeSewadars' AND xtype = 'P')
	DROP PROCEDURE SummariseLocationWiseTraineeSewadars
GO

CREATE PROCEDURE SummariseLocationWiseTraineeSewadars
(
	@p_satsang_centre_id 		satsang_centre_id,
	@p_satsang_centre_nm	 	gnc_nm,
	@p_is_outstation			VARCHAR (3),
	@p_session_id				INTEGER				OUTPUT
)
AS
	DECLARE
		@rval					INT;
BEGIN
	EXEC	@rval = SummariseLocationWiseTraineeOrOpenSewadars	@p_satsang_centre_id, @p_satsang_centre_nm, @p_is_outstation, 'T', @p_session_id	OUTPUT;
	IF (@rval != 0)
		RETURN @rval;
END
GO

-- =============================================================================
-- Procedure GenerateSewadarRgsPhotoIndctr
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateSewadarRgsPhotoIndctr' AND xtype = 'P')
	DROP PROCEDURE GenerateSewadarRgsPhotoIndctr
GO

CREATE PROCEDURE GenerateSewadarRgsPhotoIndctr
(
	@p_satsang_centre_id 	satsang_centre_id,
	@p_satsang_centre_nm 	gnc_nm,
	@p_department_ids		report_xml_prm,
	@p_sub_department_ids	report_xml_prm,				---- LATER: This is pending to be supported
	@p_is_outstation		VARCHAR (3),
	@p_gender				VARCHAR (6),
	@p_photo_after_dt		DATETIME,
	@p_sewadar_list_id 		sewadar_list_id,
	@p_session_id			INTEGER				OUTPUT
)
AS
	DECLARE
		@extra_information_header	report_description,
		@sewadar_list_nm		 	gnc_long_nm,
		@extra_information			report_description

BEGIN
	SELECT	@sewadar_list_nm	=	sewadar_list_nm
	FROM	generic_sewadar_lists
	WHERE	sewadar_list_id	=	@p_sewadar_list_id;

	DECLARE	@depts		TABLE	(	id	INT	);
	DECLARE	@sub_depts	TABLE	(	id	INT	);
	DECLARE @hdoc INT;	

	IF (@p_department_ids IS NULL)
		INSERT INTO	@depts
			SELECT	department_id
			FROM	departments_satsang_centres
			WHERE	satsang_centre_id	=	@p_satsang_centre_id
			AND		effective_till	>	GetDate();
	ELSE
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_department_ids; 
		INSERT INTO	@depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT);
		EXEC sp_xml_removedocument @hdoc;
	END
		
	IF (@p_sub_department_ids IS NOT NULL)
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_sub_department_ids; 
		INSERT INTO	@sub_depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT) 
		EXEC sp_xml_removedocument @hdoc
	END
		
	SET	@extra_information_header = 'Photo Age  YOA   Telephone-Res.'
	SET	@extra_information = ''

	IF (@p_is_outstation = 'Yes')
		SET @extra_information = @extra_information + ' for Outside Sewadars'
	ELSE IF (@p_is_outstation = 'No')
		SET @extra_information = @extra_information + ' for Local Sewadars'

	IF (@p_sewadar_list_id	IS NOT	NULL AND @sewadar_list_nm IS NOT NULL)					--- Restrict to Sewadar List
		INSERT INTO	generic_report_headers
				(	report_header, extra_information_header	)
			VALUES
				(	'Sewadar Register as per ' + @sewadar_list_nm + ' (Indicator for photo after ' + CONVERT (VARCHAR (11), @p_photo_after_dt, 106) + ')', @extra_information_header	);
	ELSE
		INSERT INTO	generic_report_headers
				(	report_header, extra_information_header	)
			VALUES
				(	'Sewadar Register for ' + @extra_information + ' (Indicator for photo after ' + CONVERT (VARCHAR (11), @p_photo_after_dt, 106) + ')', @extra_information_header	);

	SET	@p_session_id = SCOPE_IDENTITY();

	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
		SELECT	@p_session_id,
				@p_satsang_centre_id,
				sr.sewadar_grno,
						CASE WHEN @p_is_outstation = '%' AND is_outstation_sewadar = 'Yes' THEN '*' ELSE SPACE (1) END
						+ space (1)
						+ CASE	WHEN	photo_dt > @p_photo_after_dt THEN '  ' ELSE 'No' END + SPACE (3)
						+ CONVERT (CHAR (2), DATEDIFF (YEAR, birth_dtm, GetDate())) + SPACE (2)
						+ CONVERT (CHAR(4), DATEPART (YY, appointment_dt)) + SPACE (2)
						+ COALESCE (telephone_mobile, COALESCE (telephone_residence, ''))
		FROM	sewadars	s
			JOIN	sewadars_registrations	sr
				ON	(	s.sewadar_id				=		sr.sewadar_id
					AND sr.satsang_centre_id		=		@p_satsang_centre_id
					AND	gender						LIKE	@p_gender
					AND	s.global_sewadar_status_cd	IS NULL
					AND	is_outstation_sewadar		LIKE	@p_is_outstation
					)
			JOIN	system_information_values	iv
				ON	(	iv.system_info_cd	=	'SttsGenUse'
					AND	iv.value_varchar	=	sewadar_status_cd
					)
			JOIN	@depts
				ON	(	sr.department_id	=	id	)
			JOIN	sewadars_details	sd
				ON	(	sd.sewadar_id	=	sr.sewadar_id	)
			LEFT JOIN	ZSM_Photos..sewadars_photos	sp
				ON	(	sp.sewadar_id	=	sr.sewadar_id	)
			LEFT	JOIN	@sub_depts	x
				ON	(	sr.sub_department_id	=	x.id	)
			LEFT JOIN	generic_sewadar_lists_sewadars	g
				ON	(	g.sewadar_grno		=	sr.sewadar_grno
					AND g.satsang_centre_id =	sr.satsang_centre_id
					AND g.sewadar_list_id	=	@p_sewadar_list_id
					)
		WHERE	(	(	@p_sub_department_ids	IS NOT NULL	AND	x.id	IS NOT NULL	)
				OR	(	@p_sub_department_ids	IS NULL								)
				)
		AND		(	@p_sewadar_list_id	IS		NULL
				OR	g.sewadar_grno		IS	NOT	NULL
				)
			
END
GO

-- =============================================================================
-- Procedure GenerateSewadarAttributeList
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateSewadarAttributeList' AND xtype = 'P')
	DROP PROCEDURE GenerateSewadarAttributeList
GO

CREATE PROCEDURE GenerateSewadarAttributeList
(
	@p_satsang_centre_id 	satsang_centre_id,
	@p_satsang_centre_nm 	gnc_nm,
	@p_department_ids		report_xml_prm,
	@p_sub_department_ids	report_xml_prm,
	@p_is_outstation		VARCHAR (3),
	@p_gender				VARCHAR (6),
	@p_attribute_id			attribute_id,
	@p_attribute_nm			gnc_nm,
	@p_start_dt				DATETIME,
	@p_finish_dt			DATETIME,
	@p_sewadar_list_id 		sewadar_list_id,
	@p_is_summary			Boolean,
	@p_session_id			INTEGER				OUTPUT
)
AS

	DECLARE
		@extra_information_header	report_description,
		@extra_information			report_description,
		@rval						INT,
		@attribute_type				gnc_short_nm,
		@sewadar_list_nm		 	gnc_long_nm,
		@is_temporal				Boolean

BEGIN
	SELECT	@sewadar_list_nm	=	sewadar_list_nm
	FROM	generic_sewadar_lists
	WHERE	sewadar_list_id	=	@p_sewadar_list_id;

	DECLARE	@depts		TABLE	(	id	INT	);
	DECLARE	@sub_depts	TABLE	(	id	INT	);
	DECLARE @hdoc INT;	

	SELECT	@attribute_type		=	attribute_type,
			@is_temporal		=	is_temporal
	FROM	generic_attributes
	WHERE	attribute_id	=	@p_attribute_id;

	IF (@p_department_ids IS NULL)
		INSERT INTO	@depts
			SELECT	department_id
			FROM	departments_satsang_centres
			WHERE	satsang_centre_id	=	@p_satsang_centre_id
			AND		effective_till	>	GetDate();
	ELSE
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_department_ids; 
		INSERT INTO	@depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT);
		EXEC sp_xml_removedocument @hdoc;
	END
		
	IF (@p_sub_department_ids IS NOT NULL)
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_sub_department_ids; 
		INSERT INTO	@sub_depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT) 
		EXEC sp_xml_removedocument @hdoc
	END
		
	SET	@extra_information_header = 'Age Status  '
	IF (@attribute_type	=	'Date')
		SET	@extra_information_header = @extra_information_header + '   Date   '
	ELSE IF (@is_temporal = 'Yes')
		SET	@extra_information_header = @extra_information_header + ' Eff. Date'
	SET	@extra_information_header = @extra_information_header + '  Reference'

	SET	@extra_information = ''

	IF (@p_is_outstation = 'Yes')
		SET @extra_information = @extra_information + ' for Outside Sewadars'
	ELSE IF (@p_is_outstation = 'No')
		SET @extra_information = @extra_information + ' for Local Sewadars'
	IF (@p_sewadar_list_id	IS NOT	NULL AND @sewadar_list_nm IS NOT NULL)					--- Restrict to Sewadar List
		SET @extra_information = @extra_information + ' as per ' + @sewadar_list_nm
		
	IF (@attribute_type	= 'Date' OR @is_temporal = 'Yes')
	BEGIN
		IF (@p_start_dt IS NOT NULL)
			SET	@extra_information_header = @extra_information_header + ' from ' + CONVERT (VARCHAR (11), @p_start_dt, 106);
		ELSE
			SET @p_start_dt = '01 Jan 2000';
		IF (@p_finish_dt IS NOT NULL)
			SET	@extra_information_header = @extra_information_header + ' till ' + CONVERT (VARCHAR (11), @p_finish_dt, 106);
		ELSE
			SET @p_finish_dt = '31 Dec 2099';
	END

	IF (@p_is_summary = 'No')
		INSERT INTO	generic_report_headers
				(	report_header, extra_information_header	)
			VALUES
				(	'List of Sewadars with ' + @p_attribute_nm + ' ' + @extra_information, @extra_information_header	)
	ELSE
		INSERT INTO	generic_report_headers
				(	report_header, major_information_header	)
			VALUES
				(	'Summary of Sewadars with ' + @p_attribute_nm + ' ' + @extra_information, @extra_information_header	)


	SET	@p_session_id = SCOPE_IDENTITY()
	
	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
		SELECT	@p_session_id,
				@p_satsang_centre_id,
				sr.sewadar_grno,
				space (1)
						+ CONVERT (CHAR (2), DATEDIFF (YEAR, birth_dtm, GetDate())) + SPACE (2)
						+ sr.sewadar_status_cd + SPACE (3)
						+ CASE WHEN @attribute_type = 'Date' THEN CONVERT (VARCHAR (11), sa.date_value, 106)
															 ELSE CASE WHEN @is_temporal = 'Yes' THEN CONVERT (VARCHAR (11), sa.effective_from, 106)
																								 ELSE	SPACE(11)
															 END
						  END + SPACE (2)
						+ CONVERT (VARCHAR, s.sewadar_id) + COALESCE (' ' + sa.remarks, '')
		FROM	sewadars	s
			JOIN	sewadars_registrations	sr
				ON	(	s.sewadar_id				=		sr.sewadar_id
					AND sr.satsang_centre_id		= 		@p_satsang_centre_id
					AND	gender						LIKE	@p_gender
					AND	s.global_sewadar_status_cd	IS NULL
					AND	is_outstation_sewadar		LIKE	@p_is_outstation
					)
			JOIN	@depts
				ON	(	sr.department_id	=	id	)
			JOIN	sewadars_details	sd
				ON	(	sd.sewadar_id	=	sr.sewadar_id	)
			JOIN	sewadars_attributes	sa
				ON	(	sa.sewadar_grno			=	sr.sewadar_grno
					AND	sa.satsang_centre_id	=	@p_satsang_centre_id
					AND	sa.attribute_id			=	@p_attribute_id
					)
			LEFT	JOIN	@sub_depts	x
				ON	(	sr.sub_department_id	=	x.id	)
			LEFT JOIN	generic_sewadar_lists_sewadars	g
				ON	(	g.sewadar_grno		=	sr.sewadar_grno
					AND g.satsang_centre_id =	sr.satsang_centre_id
					AND g.sewadar_list_id	=	@p_sewadar_list_id
					)
		WHERE	(	(	@p_sub_department_ids	IS NOT NULL	AND	x.id	IS NOT NULL	)
				OR	(	@p_sub_department_ids	IS NULL					)
				)
		AND		(	(	@attribute_type	= 'Date' AND	sa.date_value BETWEEN @p_start_dt	AND @p_finish_dt	)
				OR	(	@attribute_type != 'Date'	)
				)
		AND		(	@p_sewadar_list_id	IS		NULL
				OR	g.sewadar_grno		IS	NOT	NULL
				)
		AND		(	(	@is_temporal = 'Yes' AND	sa.effective_from BETWEEN @p_start_dt	AND @p_finish_dt	)
				OR	(	@is_temporal = 'No'	)
				);

	IF (@p_is_summary = 'Yes') 
	BEGIN
		EXEC	@rval =	SummariseSessionDeptWise	@p_session_id
		IF (@rval != 0)
			RETURN @rval;
	END
END
GO


-- ======================================================================================================================
-- Procedure GenerateDstrctWiseSewadarList
-- ======================================================================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateDstrctWiseSewadarList' AND xtype = 'P')
	DROP PROCEDURE GenerateDstrctWiseSewadarList
GO

CREATE PROCEDURE GenerateDstrctWiseSewadarList
(
	@p_satsang_centre_id 	satsang_centre_id,
	@p_satsang_centre_nm 	gnc_nm,
	@p_country_ids			report_xml_prm,
	@p_state_ids			report_xml_prm,
	@p_district_ids			report_xml_prm,
	@p_gender				VARCHAR (6),
	@p_sewadar_list_id		sewadar_list_id,
	@p_is_summary			Boolean,
	@p_session_id			INTEGER				OUTPUT
)
AS

BEGIN
	DECLARE
		@sewadar_list_nm		 gnc_long_nm,
		@rval					INT;

	SELECT	@sewadar_list_nm	=	sewadar_list_nm
	FROM	generic_sewadar_lists
	WHERE	sewadar_list_id	=	@p_sewadar_list_id;

	DECLARE	@districts	TABLE	(	id		INT	);
	DECLARE	@hdoc		INT;
	
	IF (@p_district_ids IS NOT NULL)
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_district_ids; 
		INSERT INTO	@districts 
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT) 
		EXEC sp_xml_removedocument @hdoc
	END
	ELSE IF (@p_state_ids IS NOT NULL)
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_state_ids; 
		INSERT INTO	@districts 
			SELECT	DISTINCT	district_or_city_id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
					WITH	(id	INT) 
				JOIN CDB..districts_or_cities doc
					ON	(	id = state_id	)			
		EXEC sp_xml_removedocument @hdoc
	END
	ELSE IF (@p_country_ids IS NOT NULL)
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_country_ids; 
		INSERT INTO	@districts 
			SELECT	DISTINCT	district_or_city_id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
					WITH	(id	INT) 
				JOIN CDB..states	s
					ON	(	country_id	=	id	)
				JOIN CDB..districts_or_cities d
					ON	(	s.state_id	=	d.state_id	)
		EXEC sp_xml_removedocument @hdoc
	END
	ELSE
	BEGIN	
		INSERT INTO	@districts
			SELECT	district_or_city_id
			FROM	CDB..districts_or_cities
			WHERE	effective_till	>	GetDate();
	END		
	
	IF (@p_sewadar_list_id	IS NOT	NULL AND @sewadar_list_nm IS NOT NULL)					--- Restrict to Sewadar List
	BEGIN
		IF (@p_is_summary = 'No')
			INSERT INTO	generic_report_headers
					(	report_header, extra_information_header	)
				VALUES
					(	'District-wise List of Sewadars as per ' + @sewadar_list_nm, 'Age   YOA  Status  Department'
					)
		ELSE
			INSERT INTO	generic_report_headers
					(	report_header, major_information_header	)
				VALUES
					(	'District-wise Summary of Sewadars as per ' + @sewadar_list_nm, 'Department'
					)
	END
	ELSE
	BEGIN
		IF (@p_is_summary = 'No')
			INSERT INTO	generic_report_headers
					(	report_header, extra_information_header	)
				VALUES
					(	'District-wise List of Sewadars', 'Age   YOA  Status  Department'
					)
		ELSE
			INSERT INTO	generic_report_headers
					(	report_header, major_information_header	)
				VALUES
					(	'District-wise Summary of Sewadars', 'Department'
					)
	END

	SET	@p_session_id = SCOPE_IDENTITY();

	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information, grouping_1	)
		SELECT	@p_session_id,
				@p_satsang_centre_id,
				sr.sewadar_grno,
				CASE WHEN is_outstation_sewadar = 'Yes' THEN '*' ELSE SPACE (1) END
				+ CONVERT (CHAR (2), DATEDIFF (YEAR, birth_dtm, GetDate())) + SPACE (2)
				+ CONVERT (CHAR(4), DATEPART (YY, appointment_dt)) + SPACE (2) + sr.sewadar_status_cd + SPACE (4)
				+ department_nm + COALESCE (' (' + RTRIM (LTRIM (sub_department_cd)) + ')', ''),
				district_nm
				/*
				RTRIM (sad.address_line_1) + ', '
						+ COALESCE (RTRIM (sad.address_line_2) + ', ', '')
						+ RTRIM (poc.post_office_or_city_nm) + ', '
						+ RTRIM (doc.district_nm) + ', '
						+ COALESCE ('- ' + RTRIM (sad.pin_or_zip_code), '')
						*/
		FROM 	sewadars	s
			JOIN	sewadars_registrations	sr
				ON	(	s.sewadar_id				=		sr.sewadar_id
					AND sr.satsang_centre_id		=		@p_satsang_centre_id
					AND	gender						LIKE	@p_gender
					AND	s.global_sewadar_status_cd	IS NULL
					)
			JOIN	system_information_values	iv
				ON	(	iv.system_info_cd	=	'SttsActv'
					AND	iv.value_varchar	=	sr.sewadar_status_cd
					)
			JOIN	sewadars_addresses	 sad
				ON  (	sad.sewadar_id = sr.sewadar_id 
					AND sad.address_type = 'Residence'
					)
			JOIN post_offices_or_cities poc 
				ON  (	poc.post_office_or_city_id = sad.post_office_or_city_id	)			
			JOIN @districts d
				ON  (	poc.district_id = d.id 	)
			JOIN CDB..districts_or_cities doc
				ON	(	doc.district_or_city_id = d.id	)		
			JOIN	departments dpt
				ON	(	sr.department_id	=	dpt.department_id	)
			LEFT JOIN	sub_departments sdpt
				ON	(	sr.sub_department_id	=	sdpt.sub_department_id	)
			LEFT JOIN generic_sewadar_lists_sewadars	sl
				ON	(	sl.satsang_centre_id =	sr.satsang_centre_id
					AND	sl.sewadar_grno		 =	sr.sewadar_grno
					AND	sl.sewadar_list_id	 =	@p_sewadar_list_id
					)
			WHERE (	(	@p_sewadar_list_id IS NOT NULL	AND	sl.sewadar_grno IS NOT NULL	)
					OR	(	@p_sewadar_list_id IS NULL	)
					)
		
	IF (@p_is_summary = 'Yes') 
	BEGIN
		EXEC	@rval =	SummariseSessionDeptWise	@p_session_id
		IF (@rval != 0)
			RETURN @rval;
	END

END
GO

-- ======================================================================================================================
-- Procedure GenerateSewadarsAcquiredAge
-- ======================================================================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateSewadarsAcquiredAge' AND xtype = 'P')
	DROP PROCEDURE GenerateSewadarsAcquiredAge
GO

CREATE PROCEDURE GenerateSewadarsAcquiredAge
(
	@p_satsang_centre_id 	satsang_centre_id,
	@p_satsang_centre_nm 	gnc_nm,
	@p_males_born_bfr_dt	SMALLDATETIME,
	@p_females_born_bfr_dt	SMALLDATETIME,
	@p_gender				VARCHAR (6),
	@p_sewadar_list_id		sewadar_list_id,
	@p_is_summary			Boolean,
	@p_session_id			INTEGER				OUTPUT
)
AS
	DECLARE
		@extra_information_header	report_description,
		@extra_information			report_description,
		@rval						INT,
		@sewadar_list_nm		 	gnc_long_nm,
		@report_header				report_description

BEGIN
	SELECT	@sewadar_list_nm	=	sewadar_list_nm
	FROM	generic_sewadar_lists
	WHERE	sewadar_list_id	=	@p_sewadar_list_id;

	IF (@p_is_summary = 'No')
		BEGIN
			SET	@report_header = 'List of Sewadars '
			SET	@extra_information_header = 'Date of Birth  YOA  Status '
		END
	ELSE
		BEGIN
			SET	@report_header = 'Summary of Sewadars '
			SET	@extra_information_header = 'Department'
		END

	SET	@report_header = @report_header + 'acquired Age (Males - ' + CONVERT (VARCHAR (11),DATEDIFF (YEAR, @p_males_born_bfr_dt, GETDATE()), 106)
											+ ', Females - ' + CONVERT (VARCHAR (11),DATEDIFF (YEAR, @p_females_born_bfr_dt, GETDATE()), 106)
											

	IF (@p_sewadar_list_id	IS NOT	NULL AND @sewadar_list_nm IS NOT NULL)					--- Restrict to Sewadar List
		SET	@report_header += ' as per ' + @sewadar_list_nm;

	IF (@p_is_summary = 'No')
		INSERT INTO	generic_report_headers
				(	report_header, extra_information_header	)
			VALUES
				(	@report_header, @extra_information_header	)
	ELSE
		INSERT INTO	generic_report_headers
				(	report_header, major_information_header	)
			VALUES
				(	@report_header, @extra_information_header	)

	SET	@p_session_id = SCOPE_IDENTITY()

	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
		SELECT	@p_session_id,
				@p_satsang_centre_id,
				sr.sewadar_grno,
				SPACE (1)
						+ CONVERT (VARCHAR (11), birth_dtm, 106) + SPACE (2)
						+ CONVERT (CHAR(4), DATEPART (YY, appointment_dt)) + SPACE (2)
						+ ss.sewadar_status_nm
		FROM	sewadars_registrations	sr
			JOIN	system_information_values	iv
				ON	(	iv.system_info_cd		=		'SttsActv'
					AND	iv.value_varchar		=		sewadar_status_cd
					AND sr.satsang_centre_id	=		@p_satsang_centre_id
					)
			JOIN	sewadars	s
				ON	(	s.sewadar_id				=		sr.sewadar_id
					AND	s.global_sewadar_status_cd	IS NULL
					AND	(	(	gender	=	'Female'	AND		birth_dtm < @p_females_born_bfr_dt	)
						OR	(	gender	=	'Male'		AND		birth_dtm < @p_males_born_bfr_dt	)
						)
					AND	gender						LIKE	@p_gender
					)
			 JOIN	sewadar_status	ss
				ON	(	sr.sewadar_status_cd	=	ss.sewadar_status_cd	)		
			 LEFT JOIN generic_sewadar_lists_sewadars	sl
				ON	(	sl.satsang_centre_id =	sr.satsang_centre_id
					AND	sl.sewadar_grno		 =	sr.sewadar_grno
					AND	sl.sewadar_list_id	 =	@p_sewadar_list_id
					)
			WHERE (	(	@p_sewadar_list_id IS NOT NULL	AND	sl.sewadar_grno IS NOT NULL	)
					OR	(	@p_sewadar_list_id IS NULL	)
					)
	IF (@p_is_summary = 'Yes') 
	BEGIN
		EXEC	@rval =	SummariseSessionDeptWise	@p_session_id
		IF (@rval != 0)
			RETURN @rval;
	END

END
GO

-- =============================================================================
-- Procedure GenerateSewadarListforAgeGroup
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateSewadarListforAgeGroup' AND xtype = 'P')
	DROP PROCEDURE GenerateSewadarListforAgeGroup
GO

CREATE PROCEDURE GenerateSewadarListforAgeGroup
(
	@p_satsang_centre_id 	satsang_centre_id,
	@p_satsang_centre_nm 	gnc_nm,
	@p_department_ids		report_xml_prm,
	@p_date_from			DATETIME,
	@p_date_till			DATETIME,
	@p_is_non_initiate		Boolean,
	@p_gender				VARCHAR (6),
	@p_sewadar_list_id		sewadar_list_id,
	@p_is_summary			Boolean,
	@p_session_id			INTEGER				OUTPUT
)
AS
	DECLARE
		@extra_information_header	report_description,
		@extra_information			report_description,
		@sewadar_list_nm		 	gnc_long_nm,
		@rval						INT,
		@report_header_part			report_description
		
BEGIN
	SELECT	@sewadar_list_nm	=	sewadar_list_nm
	FROM	generic_sewadar_lists
	WHERE	sewadar_list_id	=	@p_sewadar_list_id;

	DECLARE	@depts		TABLE	(	id	INT	);
	DECLARE @hdoc INT;

	IF (@p_department_ids IS NULL)
		INSERT INTO	@depts
			SELECT	department_id
			FROM	departments_satsang_centres
			WHERE	satsang_centre_id	=	@p_satsang_centre_id
			AND		effective_till	>	GetDate();
	ELSE
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_department_ids; 
		INSERT INTO	@depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT);
		EXEC sp_xml_removedocument @hdoc;
	END
		
	SET @extra_information = ''

	IF (@p_is_non_initiate = 'Yes')
		SET	@extra_information_header = 'Age   YOA  Status  Tele.'
	ELSE
		SET	@extra_information_header = 'Age   YOA  Status  YOI  Tele.'

	SET @report_header_part =
				CASE @p_is_non_initiate WHEN 'Yes' THEN ' Non-Initiated ' ELSE ' ' END
				+ 'Sewadars in Age Group (' 
				+ CONVERT(	VARCHAR(3), DATEDIFF (YEAR, @p_date_till, GetDate()))
				+ ' to '
				+ CONVERT(	VARCHAR(3), DATEDIFF (YEAR, @p_date_from, GetDate())) 
				+ ')' + @extra_information
	
	IF (@p_sewadar_list_id	IS NOT	NULL AND @sewadar_list_nm IS NOT NULL)					--- Restrict to Sewadar List
		SET @report_header_part += ' as per ' + @sewadar_list_nm;

	IF (@p_is_summary = 'No')
		INSERT INTO	generic_report_headers
				(	report_header, extra_information_header	)
			VALUES
				(	'List of' + @report_header_part , @extra_information_header )
	ELSE
		INSERT INTO	generic_report_headers
				(	report_header, major_information_header	)
			VALUES
				(	'Summary of' +  @report_header_part , @extra_information_header )

	SET	@p_session_id = SCOPE_IDENTITY();

	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
		SELECT	@p_session_id,
				@p_satsang_centre_id,
				sr.sewadar_grno,
				space (1)
						+ CONVERT (CHAR (2), DATEDIFF (YEAR, birth_dtm, GetDate())) + SPACE (2)
						+ CONVERT (CHAR(4), DATEPART (YY, appointment_dt)) + SPACE (2)
						+ CONVERT (CHAR(4), sr.sewadar_status_cd) + SPACE (3)
						+ CASE WHEN @p_is_non_initiate = 'Yes'	THEN ''
						  ELSE
						  CASE WHEN initiation_dt IS NULL		THEN '    '	
						  ELSE CONVERT (VARCHAR (4), DATEPART (YY, initiation_dt)) END + SPACE (2)
						  END
						+ COALESCE (telephone_residence, '')
		FROM	sewadars	s
			JOIN	sewadars_registrations	sr
				ON	(	s.sewadar_id				=		sr.sewadar_id
					AND sr.satsang_centre_id		=		@p_satsang_centre_id
					AND	s.global_sewadar_status_cd	IS NULL
					AND	(	(	@p_is_non_initiate = 'Yes' AND initiation_dt IS NULL	)
						OR	(	@p_is_non_initiate = 'No'	)
						)
					AND	gender						LIKE	@p_gender
					AND	birth_dtm BETWEEN	@p_date_from AND @p_date_till
					)
			JOIN	system_information_values	iv
				ON	(	iv.system_info_cd	=	'SttsActv'
					AND	iv.value_varchar	=	sewadar_status_cd
					)
			JOIN	@depts
				ON	(	sr.department_id	=	id	)
			JOIN	sewadars_details	sd
				ON	(	sd.sewadar_id	=	sr.sewadar_id	)
			LEFT JOIN generic_sewadar_lists_sewadars	sl
				ON	(	sl.satsang_centre_id =	sr.satsang_centre_id
					AND	sl.sewadar_grno		 =	sr.sewadar_grno
					AND	sl.sewadar_list_id	 =	@p_sewadar_list_id
					)
			WHERE (	(	@p_sewadar_list_id IS NOT NULL	AND	sl.sewadar_grno IS NOT NULL	)
					OR	(	@p_sewadar_list_id IS NULL	)
					)

	IF (@p_is_summary = 'Yes')
	BEGIN
		EXEC	@rval =	SummariseSessionDeptSubDeptWise	@p_session_id
		IF (@rval != 0)
			RETURN @rval;
	END
END
GO

-- =============================================================================
--	Procedure GenerateMobilePhoneList
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateMobilePhoneList' AND xtype = 'P')
	DROP PROCEDURE GenerateMobilePhoneList
GO


CREATE      PROCEDURE GenerateMobilePhoneList
(
	@p_satsang_centre_id 	satsang_centre_id,
	@p_satsang_centre_nm 	gnc_nm,
	@p_month				INTEGER,
	@p_year					INTEGER,
	@p_sewadar_list_id		sewadar_list_id,
	@p_department_ids		report_xml_prm,
	@p_sub_department_ids	report_xml_prm,
	@p_gender				VARCHAR (6),
	@p_session_id			INTEGER				OUTPUT
)
AS
	DECLARE
		@sewadar_list_nm		 	gnc_long_nm,
		@extra_information_header	report_description

BEGIN
	SELECT	@sewadar_list_nm	=	sewadar_list_nm
	FROM	generic_sewadar_lists
	WHERE	sewadar_list_id	=	@p_sewadar_list_id;

	DECLARE	@depts		TABLE	(	id	INT	);
	DECLARE	@sub_depts	TABLE	(	id	INT	);
	DECLARE @hdoc INT;

	IF (@p_department_ids IS NULL)
		SET @extra_information_header = 'for all Departments'
	ELSE
		SET @extra_information_header = ''

	IF (@p_department_ids IS NULL)
		INSERT INTO	@depts
			SELECT	department_id
			FROM	departments_satsang_centres
			WHERE	satsang_centre_id	=	@p_satsang_centre_id
			AND		effective_till	>	GetDate();
	ELSE
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_department_ids; 
		INSERT INTO	@depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT);
		EXEC sp_xml_removedocument @hdoc;
	END
		
	IF (@p_sub_department_ids IS NOT NULL)
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_sub_department_ids; 
		INSERT INTO	@sub_depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT) 
		EXEC sp_xml_removedocument @hdoc
	END
		
	SET @extra_information_header = '('
								+ DATENAME(MM, CONVERT(DATETIME, CONVERT(VARCHAR, @p_month) + '/01/' + CONVERT(VARCHAR, @p_year))) 
								+ ' ' 
								+ CONVERT(VARCHAR, DATEPART(yyyy, CONVERT(DATETIME, CONVERT(VARCHAR, @p_month) + '/01/' + CONVERT(VARCHAR, @p_year)))) 
								+ ') ' + @extra_information_header
	
	IF (@p_sewadar_list_id	IS NOT	NULL AND @sewadar_list_nm IS NOT NULL)					--- Restrict to Sewadar List
		INSERT INTO	generic_report_headers
				(	report_header, extra_information_header	)
			VALUES
				(	'Mobile Phone Permission as per ' + @sewadar_list_nm, @extra_information_header )
	ELSE
		INSERT INTO	generic_report_headers
				(	report_header, extra_information_header	)
			VALUES
				(	'Mobile Phone Permission', @extra_information_header )
	
	SET	@p_session_id = SCOPE_IDENTITY();
	
		INSERT	INTO	generic_report_details
				(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
			SELECT	@p_session_id,
					@p_satsang_centre_id,
					sr.sewadar_grno,
					sd.telephone_mobile
			FROM	sewadars	s
				JOIN	sewadars_registrations	sr
					ON	(	s.sewadar_id				=		sr.sewadar_id
						AND sr.satsang_centre_id		=		@p_satsang_centre_id
						AND	s.global_sewadar_status_cd	IS NULL
						AND	s.gender					LIKE	@p_gender
						)
				JOIN	system_information_values	iv
					ON	(	iv.system_info_cd	=	'SttsActv'
						AND	iv.value_varchar	=	sewadar_status_cd
						)
				JOIN	sewadars_details	sd
					ON	(	sd.sewadar_id	=	sr.sewadar_id	)
				JOIN	sewadars_attributes	sa
					ON	(	sa.sewadar_grno			=	sr.sewadar_grno
						AND	sa.satsang_centre_id	=	@p_satsang_centre_id
						)
				JOIN	generic_attributes ga
					ON	(	sa.attribute_id = ga.attribute_id
						AND	ga.attribute_nm	= 'Mobile Permission'
						)
				JOIN	@depts
					ON	(	sr.department_id	=	id	)
				LEFT JOIN generic_sewadar_lists_sewadars	sl
					ON	(	sl.satsang_centre_id =	sa.satsang_centre_id
						AND	sl.sewadar_grno		 =	sa.sewadar_grno
						AND	sl.sewadar_list_id	 =	@p_sewadar_list_id
						)
				LEFT	JOIN	@sub_depts	x
					ON	(	sr.sub_department_id	=	x.id	)
			WHERE	(	(	@p_sewadar_list_id IS NOT NULL	AND	sl.sewadar_grno IS NOT NULL	)
					OR	(	@p_sewadar_list_id IS NULL	)
					)
			AND		(	(	@p_sub_department_ids	IS NOT NULL	AND	x.id	IS NOT NULL	)
					OR	(	@p_sub_department_ids	IS NULL					)
					)
		
END
GO

-- =============================================================================
-- Procedure GenerateNewSewadarsList
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateNewSewadarsList' AND xtype = 'P')
	DROP PROCEDURE GenerateNewSewadarsList
GO

CREATE PROCEDURE GenerateNewSewadarsList
(
	@p_start_dt				SMALLDATETIME,
	@p_finish_dt			SMALLDATETIME,
	@p_satsang_centre_id 	satsang_centre_id,
	@p_satsang_centre_nm 	gnc_nm,
	@p_department_ids		report_xml_prm,
	@p_sub_department_ids	report_xml_prm,
	@p_is_outstation		VARCHAR (3),
	@p_gender				VARCHAR (6),
	@p_sewadar_type			VARCHAR (20),
	@p_sewadar_list_id		sewadar_list_id,
	@p_is_summary			Boolean,
	@p_session_id			INTEGER				OUTPUT
)
AS
	DECLARE
		@report_header				report_description,
		@rval						INT,
		@sewadar_list_nm		 	gnc_long_nm,
		@extra_information_header	report_description
		
BEGIN
	SELECT	@sewadar_list_nm	=	sewadar_list_nm
	FROM	generic_sewadar_lists
	WHERE	sewadar_list_id	=	@p_sewadar_list_id;

	DECLARE	@depts		TABLE	(	id	INT	);
	DECLARE	@sub_depts	TABLE	(	id	INT	);
	DECLARE @hdoc INT;	

	IF (@p_department_ids IS NULL)
		INSERT INTO	@depts
			SELECT	department_id
			FROM	departments_satsang_centres
			WHERE	satsang_centre_id	=	@p_satsang_centre_id
			AND		effective_till	>	GetDate();
	ELSE
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_department_ids; 
		INSERT INTO	@depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT);
		EXEC sp_xml_removedocument @hdoc;
	END
		
	IF (@p_sub_department_ids IS NOT NULL)
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_sub_department_ids; 
		INSERT INTO	@sub_depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT) 
		EXEC sp_xml_removedocument @hdoc
	END


	SET	@p_start_dt		= @p_start_dt + '00:00'
	SET	@p_finish_dt	= CONVERT (DATETIME, CONVERT (VARCHAR (11), @p_finish_dt, 106) + ' 23:59')


	IF (@p_is_summary = 'Yes')
		BEGIN
			SET	@report_header	=	'New ' + @p_sewadar_type + ' Sewadars Summary '
			SET	@extra_information_header = 'Department'
		END
	ELSE
		BEGIN
			SET	@report_header	=	'New ' + @p_sewadar_type + ' Sewadars List '
			SET	@extra_information_header = 'Age  Appointment  Telephone-Res.'
		END
	IF (@p_sewadar_list_id	IS NOT	NULL AND @sewadar_list_nm IS NOT NULL)					--- Restrict to Sewadar List
		SET	@report_header	+=	' as per ' + @sewadar_list_nm

	SET @p_sewadar_type = SUBSTRING (@p_sewadar_type, 1, 1);

	SET @report_header = @report_header + ' from ' + CONVERT (VARCHAR (11), @p_start_dt, 106)
											+ ' to ' + CONVERT (VARCHAR (11), @p_finish_dt, 106)

	IF (@p_is_outstation = 'Yes')
		SET @report_header = @report_header + ' for Outside Sewadars'
	ELSE IF (@p_is_outstation = 'No')
		SET @report_header = @report_header + ' for Local Sewadars'

	IF (@p_is_summary = 'Yes')
		INSERT INTO	generic_report_headers
				(report_header, major_information_header)
			VALUES
				(@report_header, @extra_information_header)
	ELSE
		INSERT INTO	generic_report_headers
				(report_header, extra_information_header)
			VALUES
				(@report_header, @extra_information_header)

	SET	@p_session_id = SCOPE_IDENTITY();

	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
		SELECT	@p_session_id,
				@p_satsang_centre_id,
				sr.sewadar_grno,
				space (1)
						+ CONVERT (CHAR (2), DATEDIFF (YEAR, birth_dtm, GetDate())) + SPACE (2)
						+ CONVERT (VARCHAR (11), appointment_dt, 106) + SPACE (2)
						+ COALESCE (telephone_mobile, COALESCE (telephone_residence, ''))
		FROM	sewadars_registrations	sr
			JOIN	sewadars	s
				ON	(	s.sewadar_id				=		sr.sewadar_id
					AND	gender						LIKE	@p_gender
					AND	is_outstation_sewadar		LIKE	@p_is_outstation
					AND	sr.appointment_dt			BETWEEN	@p_start_dt	AND @p_finish_dt
					AND	s.global_sewadar_status_cd	IS NULL
					AND sr.satsang_centre_id		=		@p_satsang_centre_id
					AND	sr.sewadar_type				=	@p_sewadar_type
					)
			JOIN	sewadars_details	sd
				ON	(	sd.sewadar_id	=	sr.sewadar_id	)
			JOIN	@depts
				ON	(	sr.department_id	=	id	)
			LEFT	JOIN	@sub_depts	x
				ON	(	sr.sub_department_id	=	x.id	)
			LEFT JOIN	system_information_values	iv
				ON	(	iv.system_info_cd		=		'SttsGenUse'
					AND	iv.value_varchar		=		sewadar_status_cd
					)
			LEFT JOIN generic_sewadar_lists_sewadars	sl
				ON	(	sl.satsang_centre_id =	sr.satsang_centre_id
					AND	sl.sewadar_grno		 =	sr.sewadar_grno
					AND	sl.sewadar_list_id	 =	@p_sewadar_list_id
					)
			WHERE (	(	@p_sewadar_list_id IS NOT NULL	AND	sl.sewadar_grno IS NOT NULL	)
					OR	(	@p_sewadar_list_id IS NULL	)
					)
			AND	(	@p_sewadar_type IN ('O', 'T')			--- Open or Trainee Sewadars
				OR	iv.system_info_cd			IS NOT NULL	--- For Regular Sewadars
				)
			AND 	(	(	@p_sub_department_ids	IS NOT NULL	AND	x.id	IS NOT NULL	)
					OR	(	@p_sub_department_ids	IS NULL								)
					)
		
	IF (@p_is_summary = 'Yes')
	BEGIN
		EXEC	@rval =	SummariseSessionDeptSubDeptWise	@p_session_id
		IF (@rval != 0)
			RETURN @rval;
	END
END
GO

-- =============================================================================
-- Procedure GenerateNewSewadarsAlphabeticalList
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateNewSewadarsAlphabeticalList' AND xtype = 'P')
	DROP PROCEDURE GenerateNewSewadarsAlphabeticalList
GO

CREATE PROCEDURE GenerateNewSewadarsAlphabeticalList
(
	@p_start_dt				SMALLDATETIME,
	@p_finish_dt			SMALLDATETIME,
	@p_satsang_centre_id 	satsang_centre_id,
	@p_satsang_centre_nm 	gnc_nm,
	@p_department_ids		report_xml_prm,
	@p_sub_department_ids	report_xml_prm,
	@p_is_outstation		VARCHAR (3),
	@p_gender				VARCHAR (6),
	@p_sewadar_type			VARCHAR (20),
	@p_sewadar_list_id 		sewadar_list_id,
	@p_session_id			INTEGER				OUTPUT
)
AS
	DECLARE
		@report_header				report_description,
		@rval						INT,
		@sewadar_list_nm		 	gnc_long_nm,
		@extra_information_header	report_description
		
BEGIN
	SELECT	@sewadar_list_nm	=	sewadar_list_nm
	FROM	generic_sewadar_lists
	WHERE	sewadar_list_id	=	@p_sewadar_list_id;

	DECLARE	@depts		TABLE	(	id	INT	);
	DECLARE	@sub_depts	TABLE	(	id	INT	);
	DECLARE @hdoc INT;	

	IF (@p_department_ids IS NULL)
		INSERT INTO	@depts
			SELECT	department_id
			FROM	departments_satsang_centres
			WHERE	satsang_centre_id	=	@p_satsang_centre_id
			AND		effective_till	>	GetDate();
	ELSE
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_department_ids; 
		INSERT INTO	@depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT);
		EXEC sp_xml_removedocument @hdoc;
	END
		
	IF (@p_sub_department_ids IS NOT NULL)
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_sub_department_ids; 
		INSERT INTO	@sub_depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT) 
		EXEC sp_xml_removedocument @hdoc
	END


	SET	@p_start_dt		= @p_start_dt + '00:00'
	SET	@p_finish_dt	= CONVERT (DATETIME, CONVERT (VARCHAR (11), @p_finish_dt, 106) + ' 23:59')


	SET	@report_header	=	'New ' + @p_sewadar_type + ' Sewadars List (Alphabetical)'
	IF (@p_sewadar_list_id	IS NOT	NULL AND @sewadar_list_nm IS NOT NULL)					--- Restrict to Sewadar List
		SET	@report_header	=	@report_header	+ ' as per '	+ @sewadar_list_nm
	ELSE
		SET	@report_header	=	@report_header	+ ' from '	+ CONVERT (VARCHAR (11), @p_start_dt, 106)
												+ ' to '	+ CONVERT (VARCHAR (11), @p_finish_dt, 106)

	SET	@extra_information_header = 'Age  Department'
	SET @p_sewadar_type = SUBSTRING (@p_sewadar_type, 1, 1);

	IF (@p_is_outstation = 'Yes')
		SET @report_header = @report_header + ' for Outside Sewadars'
	ELSE IF (@p_is_outstation = 'No')
		SET @report_header = @report_header + ' for Local Sewadars'

	INSERT INTO	generic_report_headers
			(report_header, extra_information_header, grouping_1_rendered, grouping_1_ascending)
		VALUES
			(@report_header, @extra_information_header, 'No', 'No')

	SET	@p_session_id = SCOPE_IDENTITY();

	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information, grouping_3	)
		SELECT	@p_session_id,
				@p_satsang_centre_id,
				sr.sewadar_grno,
				space (1)
						+ CONVERT (CHAR (2), DATEDIFF (YEAR, birth_dtm, GetDate())) + SPACE (2)
						+ department_nm
						+ COALESCE (' (' + sub_department_nm + ')', ''),
--				s.gender,
				SUBSTRING (s.first_nm + ' ' + SUBSTRING (s.middle_nm, 1, 1) + ' ' + s.last_nm, 1, 50)
		FROM	sewadars_registrations	sr
			JOIN	sewadars	s
				ON	(	s.sewadar_id				=		sr.sewadar_id
					AND	gender						LIKE	@p_gender
					AND	is_outstation_sewadar		LIKE	@p_is_outstation
					AND	sr.appointment_dt			BETWEEN	@p_start_dt	AND @p_finish_dt
					AND	s.global_sewadar_status_cd	IS NULL
					AND sr.satsang_centre_id		=		@p_satsang_centre_id
					AND	sr.sewadar_type				=	@p_sewadar_type
					)
			JOIN	sewadars_details	sd
				ON	(	sd.sewadar_id	=	sr.sewadar_id	)
			JOIN	@depts
				ON	(	sr.department_id	=	id	)
			LEFT	JOIN	@sub_depts	x
				ON	(	sr.sub_department_id	=	x.id	)
			LEFT JOIN	system_information_values	iv
				ON	(	iv.system_info_cd		=		'SttsGenUse'
					AND	iv.value_varchar		=		sewadar_status_cd
					)
			JOIN	departments	d
				ON	(	d.department_id	=	sr.department_id	)
			LEFT	JOIN	sub_departments	sb
				ON	(	sb.sub_department_id	=	sr.sub_department_id	)
			LEFT JOIN	generic_sewadar_lists_sewadars	g
				ON	(	g.sewadar_grno		=	sr.sewadar_grno
					AND g.satsang_centre_id =	sr.satsang_centre_id
					AND g.sewadar_list_id	=	@p_sewadar_list_id
					)
		WHERE 	(	@p_sewadar_type IN ('O', 'T')			--- Open or Trainee Sewadars
				OR	iv.system_info_cd			IS NOT NULL	--- For Regular Sewadars
				)
		AND		(	@p_sewadar_list_id	IS		NULL
				OR	g.sewadar_grno		IS	NOT	NULL
				)
		AND 	(	(	@p_sub_department_ids	IS NOT NULL	AND	x.id	IS NOT NULL	)
				OR	(	@p_sub_department_ids	IS NULL								)
				);
END
GO

-- =============================================================================
-- Procedure GenerateSewadarList
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateSewadarList' AND xtype = 'P')
	DROP PROCEDURE GenerateSewadarList
GO

CREATE PROCEDURE GenerateSewadarList
(
	@p_satsang_centre_id 	satsang_centre_id,
	@p_satsang_centre_nm 	gnc_nm,
	@p_department_ids		report_xml_prm,
	@p_sub_department_ids	report_xml_prm,
	@p_statuses				report_xml_prm,
	@p_gender				VARCHAR (6),
	@p_apptmnts_from_year	INTEGER,
	@p_apptmnts_till_year	INTEGER,
	@p_sewadar_list_id 		sewadar_list_id,
	@p_is_summary			Boolean,
	@p_session_id			INTEGER				OUTPUT
)
AS
	DECLARE
		@extra_information_header	report_description,
		@report_header				report_description,
		@cur_year					INTEGER,
		@rval						INT,
		@sewadar_list_nm		 	gnc_long_nm,
		@from_appt_dt				SMALLDATETIME,
		@till_appt_dt				SMALLDATETIME
		
BEGIN
	SELECT	@sewadar_list_nm	=	sewadar_list_nm
	FROM	generic_sewadar_lists
	WHERE	sewadar_list_id	=	@p_sewadar_list_id;

	DECLARE	@depts		TABLE	(	id	INT	);
	DECLARE	@sub_depts	TABLE	(	id	INT	);
	DECLARE	@statuses	TABLE	(	stts	VARCHAR (4)	);
	DECLARE
		@hdoc INT,
		@cnt  INT;	

	IF (@p_department_ids IS NULL)
		INSERT INTO	@depts
			SELECT	department_id
			FROM	departments_satsang_centres
			WHERE	satsang_centre_id	=	@p_satsang_centre_id
			AND		effective_till	>	GetDate();
	ELSE
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_department_ids; 
		INSERT INTO	@depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT);
		EXEC sp_xml_removedocument @hdoc;
	END
		
	IF (@p_sub_department_ids IS NOT NULL)
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_sub_department_ids; 
		INSERT INTO	@sub_depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT) 
		EXEC sp_xml_removedocument @hdoc
	END
	
	IF (@p_statuses IS NULL)
		INSERT INTO	@statuses
			SELECT	sewadar_status_cd
			FROM	sewadar_status
			WHERE	effective_till	>	GetDate();
	ELSE
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_statuses; 
		INSERT INTO	@statuses
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	VARCHAR (4)) 
		EXEC sp_xml_removedocument @hdoc
	END
	
	SELECT	@cnt = COUNT (*)
	FROM	@statuses;

	IF (@p_apptmnts_till_year IS NOT NULL AND	@p_apptmnts_from_year IS NOT NULL AND @p_apptmnts_from_year > @p_apptmnts_till_year)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'LesserOrEqualValueReqd', NULL, 'Appointments From Year', 'Appointments Till Year', NULL
			RETURN -1;
		END
	
	SET @report_header = NULL
	SELECT @report_header = ISNULL(@report_header+' ', '') +  stts FROM  @statuses
	
	IF (@p_is_summary = 'Yes')
		BEGIN
			SET	@report_header = ISNULL(@report_header, '') + ' Sewadars Summary'
			SET	@extra_information_header = 'Department'
		END
	ELSE
		BEGIN
			SET	@report_header = ISNULL(@report_header, '') + ' Sewadars List'
			SET	@extra_information_header = 'Age   YOA  Change Dt  Init '
			IF (@cnt > 1)
				SET @extra_information_header = @extra_information_header + 'Status'
		END
	IF (@p_sewadar_list_id	IS NOT	NULL AND @sewadar_list_nm IS NOT NULL)					--- Restrict to Sewadar List
		SET	@report_header = @report_header + ' as per ' + @sewadar_list_nm

	SET	@cur_year = Year (GetDate())
	IF (@p_apptmnts_from_year IS NOT NULL AND @p_apptmnts_from_year > 0)
		BEGIN
			SET	@from_appt_dt = '01 Jan ' + CONVERT (CHAR (4), @p_apptmnts_from_year)
			SET	@report_header = @report_header + ' appointed since ' + CONVERT (CHAR (4), @p_apptmnts_from_year)
		END
	ELSE
		SET	@from_appt_dt = '01 Jan 1960'

	IF (@p_apptmnts_till_year IS NOT NULL AND @p_apptmnts_till_year > 0)
		BEGIN
			IF (@p_apptmnts_from_year IS NOT NULL AND @p_apptmnts_from_year > 0)
				SET	@report_header = @report_header + ' and till ' + CONVERT (CHAR (4), @p_apptmnts_till_year)
			ELSE
				SET	@report_header = @report_header + ' appointed till ' + CONVERT (CHAR (4), @p_apptmnts_till_year)
			SET	@till_appt_dt = '31 Dec ' + CONVERT (CHAR (4), @p_apptmnts_till_year)
		END
	ELSE
		SET	@till_appt_dt = '31 Dec ' + CONVERT (CHAR (4), @cur_year)

	IF (@p_is_summary = 'Yes')
		INSERT INTO	generic_report_headers
				(report_header, major_information_header)
			VALUES
				(@report_header, @extra_information_header)
	ELSE
		INSERT INTO	generic_report_headers
				(report_header, extra_information_header)
			VALUES
				(@report_header, @extra_information_header)

	SET	@p_session_id = SCOPE_IDENTITY();

	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
		SELECT	@p_session_id,
				@p_satsang_centre_id,
				sr.sewadar_grno,
				space (1)
						+ CONVERT (CHAR (2), DATEDIFF (YEAR, birth_dtm, GetDate())) + SPACE (2)
						+ CONVERT (CHAR(4), DATEPART (YY, appointment_dt)) + SPACE (2)
						+ CONVERT (VARCHAR (11), sr.sewadar_status_dtm, 6) + SPACE (2)
						+ CASE WHEN initiation_dt IS NULL THEN 'No   ' ELSE 'Yes  ' END
						+ CASE WHEN @cnt > 1 THEN sr.sewadar_status_cd ELSE '' END
		FROM	sewadars_registrations	sr
			JOIN	@statuses
				ON	(	sr.satsang_centre_id	=	@p_satsang_centre_id
					AND	sr.sewadar_status_cd	=	stts
					)
			JOIN	sewadars	s
				ON	(	s.sewadar_id				=		sr.sewadar_id
					AND	gender						LIKE	@p_gender
					AND	s.global_sewadar_status_cd	IS NULL
					AND	appointment_dt				BETWEEN	@from_appt_dt AND	@till_appt_dt
					)
			JOIN	@depts
				ON	(	sr.department_id	=	id	)
			JOIN	sewadars_details	sd
				ON	(	sd.sewadar_id	=	sr.sewadar_id	)
			LEFT	JOIN	@sub_depts	x
				ON	(	sr.sub_department_id	=	x.id	)
			LEFT JOIN	generic_sewadar_lists_sewadars	g
				ON	(	g.sewadar_grno		=	sr.sewadar_grno
					AND g.satsang_centre_id =	sr.satsang_centre_id
					AND g.sewadar_list_id	=	@p_sewadar_list_id
					)
		WHERE	(	(	@p_sub_department_ids	IS NOT NULL	AND	x.id	IS NOT NULL	)
				OR	(	@p_sub_department_ids	IS NULL					)
				)
		AND		(	@p_sewadar_list_id	IS		NULL
				OR	g.sewadar_grno		IS	NOT	NULL
				)

	IF (@p_is_summary = 'Yes')
	BEGIN
		EXEC	@rval =	SummariseSessionDeptWise	@p_session_id
		IF (@rval != 0)
			RETURN @rval;
	END

END
GO

-- =============================================================================
-- Procedure GenerateHODsList
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateHODsList' AND xtype = 'P')
	DROP PROCEDURE GenerateHODsList
GO

CREATE PROCEDURE GenerateHODsList
(
	@p_satsang_centre_id 	satsang_centre_id,
	@p_satsang_centre_nm 	gnc_nm,
	@p_gender				VARCHAR (6),
	@p_is_attendance		Boolean	=	'No',
	@p_session_id			INTEGER			OUTPUT
)
AS

BEGIN

	IF @p_is_attendance = 'Yes'
		INSERT INTO	generic_report_headers
				(	report_header, extra_information_header	)
			VALUES
				(	'Heads of Departments Attendance List', '|   |   |   |   |   |   |   |   |   |   |'	)
	ELSE
		INSERT INTO	generic_report_headers
			(	report_header, extra_information_header	)
		VALUES
			(	'Heads of Departments List', 'Telephones'	)


	SET	@p_session_id = SCOPE_IDENTITY();

	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
		SELECT	@p_session_id,
				@p_satsang_centre_id,
				sr.sewadar_grno,
							
				+ CASE	WHEN @p_is_attendance = 'Yes' 
						THEN '|___|___|___|___|___|___|___|___|___|___|' 
						ELSE COALESCE (telephone_mobile + ' ', '')
							 + COALESCE (	'R-' + telephone_residence,  ''	)
							 + COALESCE (	'O-' + telephone_office, ''	)
						END
		FROM	sewadars_registrations	sr
			JOIN	sewadars	s
				ON	(	sr.satsang_centre_id		=		@p_satsang_centre_id
					AND	responsibility				IN		('Head', 'Second Head', 'Third Head', 'Fourth Head')
					AND	s.sewadar_id				=		sr.sewadar_id
					AND	gender						LIKE	@p_gender
					)
			JOIN	sewadars_details	sd
				ON	(	sd.sewadar_id	=	sr.sewadar_id	)
				
END
GO

-- =============================================================================
-- Procedure GenerateHODs
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateHODs' AND xtype = 'P')
	DROP PROCEDURE GenerateHODs
GO

CREATE PROCEDURE GenerateHODs
(
	@p_satsang_centre_id 	satsang_centre_id,
	@p_satsang_centre_nm 	gnc_nm,
	@p_gender				VARCHAR (6),
	@p_session_id			INTEGER				OUTPUT
)
AS

BEGIN

	INSERT INTO	generic_report_headers
			(	report_header, extra_information_header	)
		VALUES
			(	'Heads of Departments List', 'Mobile No.'	)

	SET	@p_session_id = SCOPE_IDENTITY();

	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
		SELECT	@p_session_id,
				@p_satsang_centre_id,
				sr.sewadar_grno,
				telephone_mobile
		FROM	sewadars_registrations	sr
			JOIN	sewadars	s
				ON	(	sr.satsang_centre_id		=		@p_satsang_centre_id
					AND	responsibility				IN		('Head', 'Second Head', 'Third Head', 'Fourth Head')
					AND	s.sewadar_id				=		sr.sewadar_id
					AND	gender						LIKE	@p_gender
					)
			JOIN	sewadars_details	sd
				ON	(	sd.sewadar_id	=	sr.sewadar_id	)
END
GO

-- =============================================================================
-- Procedure GenerateBadgesPrintedList
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateBadgesPrintedList' AND xtype = 'P')
	DROP PROCEDURE GenerateBadgesPrintedList
GO

CREATE PROCEDURE GenerateBadgesPrintedList
(
	@p_satsang_centre_id 	satsang_centre_id,
	@p_satsang_centre_nm 	gnc_nm,
	@p_start_dt				SMALLDATETIME,
	@p_finish_dt			SMALLDATETIME,
	@p_gender				VARCHAR (6),
	@p_start_time			INTEGER,
	@p_finish_time			INTEGER,
	@p_badge_template_id	badge_template_id,
	@p_badge_template_nm	gnc_nm,
	@p_sewadar_list_id		sewadar_list_id,
	@p_session_id			INTEGER				OUTPUT
)
AS
	DECLARE
		@extra_information_header	report_description,
		@report_header				report_description,
		@sewadar_list_nm		 	gnc_long_nm,
		@str						VARCHAR (25)

BEGIN
	SELECT	@sewadar_list_nm	=	sewadar_list_nm
	FROM	generic_sewadar_lists
	WHERE	sewadar_list_id	=	@p_sewadar_list_id;

	IF (@p_start_time IS NULL OR @p_start_time < 0 OR @p_start_time > 2400)
		SET @p_start_time = 0;
	IF (@p_finish_time IS NULL OR @p_finish_time < 0 OR @p_finish_time > 2400)
		SET @p_finish_time = 2359;
	IF (@p_start_time % 100 >= 60)
		SET @p_start_time = (@p_start_time / 100) * 100 + 59
	IF (@p_finish_time % 100 >= 60)
		SET @p_finish_time = (@p_finish_time / 100) * 100 + 59
	SET	@p_start_dt		= DATEADD (mi, CAST (@p_start_time / 100 AS int) * 60 + @p_start_time % 100, @p_start_dt) 
	SET	@p_finish_dt	= DATEADD (mi, CAST (@p_finish_time / 100 AS int) * 60 + @p_finish_time % 100, @p_finish_dt) 
	SET @str = CONVERT (VARCHAR, @p_finish_dt, 106) + space (1) + SUBSTRING (CONVERT (VARCHAR, @p_finish_dt, 108), 1, 5) + ':59.999'
	SET	@p_finish_dt	= @str;
	IF (@p_sewadar_list_id	IS NOT	NULL AND @sewadar_list_nm IS NOT NULL)					--- Restrict to Sewadar List
		SET @report_header = 'List of Badges ' + COALESCE ('(' + @p_badge_template_nm + ') ', '') + 'printed as per ' + @sewadar_list_nm;
	ELSE
		SET @report_header = 'List of Badges ' + COALESCE ('(' + @p_badge_template_nm + ') ', '') + 'printed from '
								+ CONVERT (VARCHAR(11), @p_start_dt, 106)
								+ ' (' + CONVERT (VARCHAR(5), @p_start_dt, 108) + ')'
								+ ' to '
								+ CONVERT (VARCHAR(11), @p_finish_dt, 106)
								+ ' (' + CONVERT (VARCHAR(5), @p_finish_dt, 108) + ')'

	SET	@extra_information_header = ' Print Date/Time Type  No Photo Date'


	INSERT INTO	generic_report_headers
			(	report_header, extra_information_header	)
		VALUES
			(	@report_header, @extra_information_header	)

	SET	@p_session_id = SCOPE_IDENTITY();

	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
		SELECT	@p_session_id,
				@p_satsang_centre_id,
				sr.sewadar_grno,	
				CONVERT (VARCHAR (9), sb.printing_dtm, 6) + SPACE (1)
				+ CONVERT (VARCHAR (5), sb.printing_dtm, 108) + SPACE (2)
--				+ COALESCE (SUBSTRING (@p_badge_template_id, 1, 5), SPACE(5)) + SPACE (2)
				+ sr.sewadar_status_cd + SPACE (2)
				+ CONVERT (char (2), (
										SELECT	COUNT(*)
										FROM	sewadars_badges	sb2
										WHERE	sb2.printing_dtm	BETWEEN	@p_start_dt	AND	@p_finish_dt
										AND		sb2.satsang_centre_id	=	sr.satsang_centre_id
										AND		sb2.sewadar_grno		=	sr.sewadar_grno
										AND		(	sb2.badge_template_id	=	@p_badge_template_id
												OR	@p_badge_template_id	IS NULL
												)
									 )
						  ) + SPACE (1)
				+ COALESCE (CONVERT (VARCHAR (9), sp.photo_dt, 6), 'No Photo')
		FROM	sewadars_registrations	sr
			JOIN	sewadars_badges sb
				ON	(	sr.sewadar_grno			=	sb.sewadar_grno
					AND sr.satsang_centre_id	=	sb.satsang_centre_id
					AND	sb.satsang_centre_id	=	@p_satsang_centre_id
					AND	(	sb.badge_template_id	=	@p_badge_template_id
						OR	@p_badge_template_id	IS NULL
						)
					AND	badge_id					=	(	SELECT	MAX (badge_id)
															FROM	sewadars_badges sb1
															WHERE	sb1.satsang_centre_id	=	sb.satsang_centre_id
															AND		sb1.sewadar_grno		=	sb.sewadar_grno
															AND		sb1.printing_dtm		BETWEEN	@p_start_dt	AND	@p_finish_dt
															AND		(	sb1.badge_template_id	=	@p_badge_template_id
																	OR	@p_badge_template_id	IS NULL
																	)
														)
					)
			JOIN	sewadars	s
				ON	(	s.sewadar_id				=		sr.sewadar_id
					AND	gender						LIKE	@p_gender
					AND	s.global_sewadar_status_cd	IS NULL
					)
			LEFT JOIN    ZSM_Photos..sewadars_photos		sp
				ON	(	sp.sewadar_id	=	sr.sewadar_id	)
			LEFT JOIN generic_sewadar_lists_sewadars	sl
				ON	(	sl.satsang_centre_id =	sr.satsang_centre_id
					AND	sl.sewadar_grno		 =	sr.sewadar_grno
					AND	sl.sewadar_list_id	 =	@p_sewadar_list_id
					)
		WHERE (	(	@p_sewadar_list_id IS NOT NULL	AND	sl.sewadar_grno IS NOT NULL	)
				OR	(	@p_sewadar_list_id IS NULL	)
				)
END
GO

-- =============================================================================
-- Procedure GeneratePhotosComparisonReport
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GeneratePhotosComparisonReport' AND xtype = 'P')
	DROP PROCEDURE GeneratePhotosComparisonReport
GO

CREATE PROCEDURE GeneratePhotosComparisonReport
(
	@p_satsang_centre_id 	satsang_centre_id,
	@p_satsang_centre_nm 	gnc_nm,
	@p_start_dt				DATETIME,
	@p_finish_dt			DATETIME,
	@p_gender				VARCHAR (6),
	@p_start_time			INTEGER,
	@p_finish_time			INTEGER,
	@p_badge_template_id	badge_template_id,
	@p_badge_template_nm	gnc_nm,
	@p_sewadar_list_id		sewadar_list_id,
	@p_photo_taken_dt		DATE,						--- Photos taken on or after
	@p_department_id		department_id,
	@p_statuses				report_xml_prm,
	@p_session_id			INTEGER				OUTPUT
)
AS
	DECLARE
		@extra_information_header	report_description,
		@report_header				report_description,
		@sewadar_list_nm		 	gnc_long_nm,
		@str						VARCHAR (25)

BEGIN
	SELECT	@sewadar_list_nm	=	sewadar_list_nm
	FROM	generic_sewadar_lists
	WHERE	sewadar_list_id	=	@p_sewadar_list_id;

	DECLARE	@stts	TABLE	(	stts	VARCHAR (4)	);
	DECLARE @hdoc INT;

	EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_statuses; 
	INSERT INTO	@stts
		SELECT	DISTINCT	id
		FROM 	OPENXML (@hdoc, '/Root/r', 1)
			WITH	(id	VARCHAR (4)) 
	EXEC sp_xml_removedocument @hdoc

	IF (@p_start_time IS NULL OR @p_start_time < 0 OR @p_start_time > 2400)
		SET @p_start_time = 0;
	IF (@p_finish_time IS NULL OR @p_finish_time < 0 OR @p_finish_time > 2400)
		SET @p_finish_time = 2359;
	IF (@p_start_time % 100 >= 60)
		SET @p_start_time = (@p_start_time / 100) * 100 + 59
	IF (@p_finish_time % 100 >= 60)
		SET @p_finish_time = (@p_finish_time / 100) * 100 + 59
	SET	@p_start_dt		= DATEADD (mi, CAST (@p_start_time / 100 AS int) * 60 + @p_start_time % 100, @p_start_dt) 
	SET	@p_finish_dt	= DATEADD (mi, CAST (@p_finish_time / 100 AS int) * 60 + @p_finish_time % 100, @p_finish_dt) 
	SET @str = CONVERT (VARCHAR, @p_finish_dt, 106) + space (1) + SUBSTRING (CONVERT (VARCHAR, @p_finish_dt, 108), 1, 5) + ':59.999'
	SET	@p_finish_dt	= @str;

	IF (@p_sewadar_list_id	IS NOT	NULL AND @sewadar_list_nm IS NOT NULL)					--- Restrict to Sewadar List
		SET @report_header = 'Photos Comparison Report ' + COALESCE ('(' + @p_badge_template_nm + ') ', '') + 'for Badges printed as per ' + @sewadar_list_nm;
	ELSE
		SET @report_header = 'Photos Comparison Report ' + COALESCE ('(' + @p_badge_template_nm + ') ', '') + 'for Badges printed from '
								+ CONVERT (VARCHAR(11), @p_start_dt, 106)
								+ ' (' + CONVERT (VARCHAR(5), @p_start_dt, 108) + ')'
								+ ' to '
								+ CONVERT (VARCHAR(11), @p_finish_dt, 106)
								+ ' (' + CONVERT (VARCHAR(5), @p_finish_dt, 108) + ')'

	DECLARE
		@tbl	TABLE	(	swd_id	sewadar_id	PRIMARY KEY,
							grno	CHAR (6)	UNIQUE,
							sts		VARCHAR (6)	NOT NULL,
							bm_dt	DATE		NULL,
							ph_dt	DATE		NULL
						);

	INSERT INTO	@tbl
		SELECT	r.sewadar_id, r.sewadar_grno, sewadar_status_cd, date_value, photo_dt
		FROM	sewadars	s
			JOIN	sewadars_registrations	r
				ON	(	s.sewadar_id		=	r.sewadar_id
					AND	s.current_satsang_centre_id	=	r.satsang_centre_id
					AND	s.current_sewadar_grno		=	r.sewadar_grno
					AND	r.satsang_centre_id			=	@p_satsang_centre_id
					AND	s.gender					LIKE	@p_gender
					AND	s.global_sewadar_status_cd	IS NULL
					AND	(	r.department_id		=	@p_department_id
						OR	@p_department_id	IS	NULL
						)
					)
			JOIN	@stts
				ON	(	stts	=	r.sewadar_status_cd	)
			LEFT JOIN	sewadars_attributes	a
				ON	(	a.satsang_centre_id	=	r.satsang_centre_id
					AND	a.sewadar_grno		=	r.sewadar_grno
					AND	a.attribute_id		=	14							--- Attribute ID for Biometric Record Date
					)
			LEFT JOIN    ZSM_Photos..sewadars_photos		sp
				ON	(	sp.sewadar_id	=	r.sewadar_id
					AND	sp.photo_dt		>=	@p_photo_taken_dt
					)
			LEFT JOIN generic_sewadar_lists_sewadars	sl
				ON	(	sl.satsang_centre_id =	r.satsang_centre_id
					AND	sl.sewadar_grno		 =	r.sewadar_grno
					AND	sl.sewadar_list_id	 =	@p_sewadar_list_id
					)
		WHERE	(	a.date_value	IS	NOT	NULL
				OR	sp.photo_dt		IS	NOT	NULL
				)
		AND 	(	(	@p_sewadar_list_id IS NOT NULL	AND	sl.sewadar_grno IS NOT NULL	)
				OR	(	@p_sewadar_list_id IS NULL	)
				);

	SET	@extra_information_header = 'Stts FingerPrint   Photo    Print Date/Time #'

	INSERT INTO	generic_report_headers
			(	report_header, extra_information_header	)
		VALUES
			(	@report_header, @extra_information_header	)

	SET	@p_session_id = SCOPE_IDENTITY();

	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
		SELECT	@p_session_id,
				@p_satsang_centre_id,
				t.grno,
				CONVERT (CHAR(4), t.sts) + SPACE (2)
				+ COALESCE (CONVERT (VARCHAR (9), t.bm_dt, 6),  SPACE (9)) + SPACE (2)
				+ COALESCE (CONVERT (VARCHAR (9), t.ph_dt, 6),  SPACE (9)) + SPACE (2)
				+ COALESCE (CONVERT (VARCHAR (9), sb.printing_dtm, 6),  SPACE (9)) + SPACE (1)
				+ COALESCE (CONVERT (VARCHAR (5), sb.printing_dtm, 108),  SPACE (5)) + SPACE (1)
				+ COALESCE (CONVERT (VARCHAR (2), (
										SELECT	COUNT(*)
										FROM	sewadars_badges	sb2
										WHERE	sb2.printing_dtm	BETWEEN	@p_start_dt	AND	@p_finish_dt
										AND		sb2.satsang_centre_id	=	@p_satsang_centre_id
										AND		sb2.sewadar_grno		=	t.grno
										AND		(	sb2.badge_template_id	=	@p_badge_template_id
												OR	@p_badge_template_id	IS NULL
												)
									 )
						  ), '')
		FROM	@tbl	t
			LEFT JOIN	sewadars_badges sb
				ON	(	sb.sewadar_grno			=	t.grno
					AND	sb.satsang_centre_id	=	@p_satsang_centre_id
					AND	(	sb.badge_template_id	=	@p_badge_template_id
						OR	@p_badge_template_id	IS NULL
						)
					AND	badge_id					=	(	SELECT	MAX (badge_id)
															FROM	sewadars_badges sb1
															WHERE	sb1.satsang_centre_id	=	sb.satsang_centre_id
															AND		sb1.sewadar_grno		=	sb.sewadar_grno
															AND		sb1.printing_dtm	BETWEEN	@p_start_dt	AND	@p_finish_dt
															AND		(	sb1.badge_template_id	=	@p_badge_template_id
																	OR	@p_badge_template_id	IS NULL
																	)
														)
					);
END
GO

-- =============================================================================
-- Procedure GenerateBadgesNotPrintedList
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateBadgesNotPrintedList' AND xtype = 'P')
	DROP PROCEDURE GenerateBadgesNotPrintedList
GO

CREATE PROCEDURE GenerateBadgesNotPrintedList
(
	@p_satsang_centre_id 	satsang_centre_id,
	@p_satsang_centre_nm 	gnc_nm,
	@p_start_dt				SMALLDATETIME,
	@p_finish_dt			SMALLDATETIME,
	@p_gender				VARCHAR (6),
	@p_start_time			INTEGER,
	@p_finish_time			INTEGER,
	@p_badge_template_id	badge_template_id,
	@p_badge_template_nm	gnc_nm,
	@p_photo_taken_after	SMALLDATETIME,
	@p_is_outstation		VARCHAR (3),
	@p_session_id			INTEGER				OUTPUT
)
AS
	DECLARE
		@extra_information_header	report_description,
		@report_header				report_description

BEGIN
	IF (@p_start_time IS NULL OR @p_start_time < 0 OR @p_start_time > 2400)
		SET @p_start_time = 0;
	IF (@p_finish_time IS NULL OR @p_finish_time < 0 OR @p_finish_time > 2400)
		SET @p_finish_time = 2359;
	IF (@p_start_time % 100 >= 60)
		SET @p_start_time = (@p_start_time / 100) * 100 + 59
	IF (@p_finish_time % 100 >= 60)
		SET @p_finish_time = (@p_finish_time / 100) * 100 + 59
	SET	@p_start_dt		= DATEADD (mi, CAST (@p_start_time / 100 AS int) * 60 + @p_start_time % 100, @p_start_dt) 
	SET	@p_finish_dt	= DATEADD (mi, CAST (@p_finish_time / 100 AS int) * 60 + @p_finish_time % 100, @p_finish_dt) 
	SET @report_header = 'List of Badges ' + COALESCE ('(' + @p_badge_template_nm + ') ', '') + 'not printed from '
							+ CONVERT (VARCHAR(11), @p_start_dt, 106)
							+ ' (' + CONVERT (VARCHAR(5), @p_start_dt, 108) + ')'
							+ ' to '
							+ CONVERT (VARCHAR(11), @p_finish_dt, 106)
							+ ' (' + CONVERT (VARCHAR(5), @p_finish_dt, 108) + ')'

	SET	@extra_information_header = 'Status  Photo Date'

	INSERT INTO	generic_report_headers
			(	report_header, extra_information_header	)
		VALUES
			(	@report_header, @extra_information_header	)

	SET	@p_session_id = SCOPE_IDENTITY();

	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
		SELECT	@p_session_id,
				@p_satsang_centre_id,
				sr.sewadar_grno,	
				sr.sewadar_status_cd + SPACE (2)
				+ COALESCE (CONVERT (VARCHAR (9), sp.photo_dt, 6), 'No Photo')
		FROM	sewadars_registrations	sr
			JOIN	sewadars	s
				ON	(	s.sewadar_id				=		sr.sewadar_id
					AND	gender						LIKE	@p_gender
					AND	s.global_sewadar_status_cd	IS NULL
					)
			LEFT JOIN    ZSM_Photos..sewadars_photos		sp
				ON	(	sp.sewadar_id	=	sr.sewadar_id	)
		WHERE	sr.satsang_centre_id	=	@p_satsang_centre_id
		AND	(	(	sr.sewadar_status_cd	IN	(	'Perm', 'Temp'	)
				AND	@p_badge_template_id	NOT IN	(	'TraineeSB', 'Retired'	)
				)
			OR	(	sr.sewadar_status_cd	=	'Retd'
				AND	@p_badge_template_id	=	'Retired'
				)
			OR	(	sr.sewadar_status_cd	IN	(	'Open', 'Trn'	)
				AND	@p_badge_template_id	=	'TraineeSB'
				)
			)
		AND		sr.is_outstation_sewadar	LIKE	@p_is_outstation
		AND		NOT EXISTS	(	SELECT	1
								FROM	sewadars_badges sb
								WHERE	sr.sewadar_grno			=	sb.sewadar_grno
								AND		sr.satsang_centre_id	=	sb.satsang_centre_id
								AND		sb.badge_template_id	=	@p_badge_template_id
								AND		sb.printing_dtm			BETWEEN	@p_start_dt	AND	@p_finish_dt
							)
		AND	(	(	@p_photo_taken_after	IS NULL	)
			OR	(	@p_photo_taken_after	IS NOT NULL
				AND	sp.sewadar_id			IS NOT NULL
				AND	sp.photo_dt				>	@p_photo_taken_after
				)
			);
END
GO

-- =============================================================================
-- Procedure GenerateDepartmentsList
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateDepartmentsList' AND xtype = 'P')
	DROP PROCEDURE GenerateDepartmentsList
GO


CREATE PROCEDURE GenerateDepartmentsList
(
	@p_satsang_centre_id 	satsang_centre_id,
	@p_satsang_centre_nm 	gnc_nm,
	@p_split_by_gender		Boolean,
	@p_session_id			INTEGER				OUTPUT
)
AS

BEGIN

	INSERT INTO	generic_report_headers
			(	report_header, major_information_header, extra_information_header	)
		VALUES
			(	'Departments List', '', CASE WHEN @p_split_by_gender = 'No' THEN '' ELSE SPACE (5) + 'Males' + SPACE (18) + 'Females' END	)

	SET	@p_session_id = SCOPE_IDENTITY();


	IF	(@p_split_by_gender = 'No')
		BEGIN
			INSERT	INTO	generic_report_synopsis
					(session_id, major_information, extra_information)
				SELECT	@p_session_id,
						department_nm,
						''
				FROM	departments d
				JOIN	departments_satsang_centres dsc
					ON	(	d.department_id = dsc.department_id
						AND	GETDATE() BETWEEN dsc.effective_from AND dsc.effective_till
						AND dsc.satsang_centre_id = @p_satsang_centre_id
						)
				ORDER BY	department_nm
		END
	ELSE
		BEGIN
			INSERT	INTO	generic_report_synopsis
					(session_id, major_information, extra_information)
				SELECT	@p_session_id,
						department_nm,
						CASE WHEN SUM (Males) = 0 THEN SPACE (2) + REPLICATE ('X', 10) + SPACE (9) ELSE REPLICATE (SPACE (1), 21) END + '|' + SPACE (4) 
						+ CASE WHEN SUM (Females) = 0 THEN REPLICATE ('X', 10) ELSE REPLICATE (SPACE (1), 10) END 
				FROM	departments	dpt
				JOIN	(	SELECT	department_id, COUNT (sewadar_grno) as Males, Females = 0 
							FROM	sewadars s
								JOIN	sewadars_registrations sr
									ON	(	s.sewadar_id				=		sr.sewadar_id
										AND	s.global_sewadar_status_cd	IS NULL
										)	
								JOIN	system_information_values	iv
										ON	(	iv.system_info_cd	=	'SttsGenUse'
											AND	iv.value_varchar	=	sewadar_status_cd
											)
							WHERE	gender	=	'Male'	
							GROUP BY department_id

						UNION
									
							SELECT	department_id, Males = 0, COUNT (sewadar_grno) as Females 
							FROM	sewadars s
								JOIN	sewadars_registrations sr
									ON	(	s.sewadar_id				=		sr.sewadar_id	)
								JOIN	system_information_values	iv
										ON	(	iv.system_info_cd	=	'SttsGenUse'
											AND	iv.value_varchar	=	sewadar_status_cd
											)
							WHERE	gender	=	'Female'	
							GROUP BY department_id
											
					) counts
				ON	(	dpt.department_id		= counts.department_id)
				GROUP BY	department_nm
				ORDER BY	department_nm
		END			
END
GO

-- =============================================================================
-- Procedure GeneratePhotosTakenList
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GeneratePhotosTakenList' AND xtype = 'P')
	DROP PROCEDURE GeneratePhotosTakenList
GO

CREATE PROCEDURE GeneratePhotosTakenList
(
	@p_satsang_centre_id 	satsang_centre_id,
	@p_satsang_centre_nm 	gnc_nm,
	@p_start_dt				SMALLDATETIME,
	@p_finish_dt			SMALLDATETIME,
	@p_gender				VARCHAR (6),
	@p_is_summary			Boolean,
	@p_session_id			INTEGER				OUTPUT
)
AS
	DECLARE
		@extra_information_header	report_description,
		@rval						INT,
		@report_header				report_description

BEGIN

	SET	@p_start_dt		= @p_start_dt + '00:00'
	SET	@p_finish_dt	= CONVERT (DATETIME, CONVERT (VARCHAR (11), @p_finish_dt, 106) + ' 23:59')

	IF (@p_is_summary = 'Yes')
		BEGIN
			SET	@extra_information_header = 'Department'
			SET @report_header = 'Photos taken Summary of Sewadars from ' + CONVERT (VARCHAR (11), @p_start_dt, 106)
											+ ' to ' + CONVERT (VARCHAR (11), @p_finish_dt, 106)
			INSERT INTO	generic_report_headers
					(	report_header, major_information_header)
				VALUES
					(	@report_header, @extra_information_header	)
		END
	ELSE
		BEGIN
			SET	@extra_information_header = 'Date        Status'
			SET @report_header = 'Photos taken List of Sewadars from ' + CONVERT (VARCHAR (11), @p_start_dt, 106)
											+ ' to ' + CONVERT (VARCHAR (11), @p_finish_dt, 106)
			INSERT INTO	generic_report_headers
					(	report_header, extra_information_header)
				VALUES
					(	@report_header, @extra_information_header	)
		END


	SET	@p_session_id = SCOPE_IDENTITY();

	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
		SELECT	@p_session_id,
				@p_satsang_centre_id,
				sr.sewadar_grno,
				CONVERT (VARCHAR (11), p.photo_dt, 106) + SPACE (3) 
				+ ss.sewadar_status_nm
		FROM	sewadars	s
			JOIN	sewadars_registrations	sr
				ON	(	s.sewadar_id				=		sr.sewadar_id
					AND	sr.satsang_centre_id		=		@p_satsang_centre_id
					AND	gender						LIKE	@p_gender
					AND	s.global_sewadar_status_cd	IS NULL
					AND	sr.satsang_centre_id		=	s.current_satsang_centre_id
					AND	sr.sewadar_grno				=	s.current_sewadar_grno
					)
			JOIN	ZSM_Photos..sewadars_photos	p
				ON	(	p.sewadar_id	=	sr.sewadar_id
					AND	photo_dt	BETWEEN	@p_start_dt	AND	@p_finish_dt
					)
			JOIN	sewadar_status	ss
				ON	(	sr.sewadar_status_cd	=	ss.sewadar_status_cd	)	


	IF (@p_is_summary = 'Yes')
	BEGIN
		EXEC	@rval =	SummariseSessionDeptWise	@p_session_id
		IF (@rval != 0)
			RETURN @rval;
	END

END
GO

-- =============================================================================
-- GenerateSewaTeamList
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateSewaTeamList' AND xtype = 'P')
	DROP PROCEDURE GenerateSewaTeamList
GO

CREATE	PROCEDURE	GenerateSewaTeamList
(
	@p_satsang_centre_id 	satsang_centre_id,
	@p_satsang_centre_nm 	gnc_nm,
	@p_sewa_id				sewa_id,
	@p_session_id			INTEGER				OUTPUT
)

AS

	DECLARE	@sewa_nm	gnc_nm
	BEGIN
		
		SELECT	@sewa_nm = sewa_nm
		FROM	sewas
		WHERE	sewa_id	= @p_sewa_id	AND	 satsang_centre_id	=	@p_satsang_centre_id

		IF	(@sewa_nm IS NULL) OR (RTRIM (@sewa_nm) = '')
			BEGIN
				EXEC SysAdmin..RaiseErrorMessage 'NotExist', NULL, 'Sewa Name', NULL, NULL
				RETURN -1;
			END

		INSERT INTO	generic_report_headers
				(	report_header, major_information_header	)
			VALUES
				(	'List of teams for ' + @sewa_nm, ''	)

		SET	@p_session_id	=	SCOPE_IDENTITY();

		INSERT	INTO	generic_report_synopsis
				(session_id, major_information, extra_information)
			SELECT	@p_session_id, RTRIM (sewa_team_nm) + ' (' + CONVERT (VARCHAR, COUNT(*)) + ')', ' '
			FROM	sewa_teams a
				JOIN	sewa_team_wise_sewadars b
					ON	(	a.sewa_team_id	=	b.sewa_team_id	)
			WHERE	sewa_id		=	@p_sewa_id
			GROUP BY sewa_team_nm
			ORDER BY sewa_team_nm
	END
GO

-- =============================================================================
-- Procedure GenerateStatusChangeList
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateStatusChangeList' AND xtype = 'P')
	DROP PROCEDURE GenerateStatusChangeList
GO

CREATE PROCEDURE GenerateStatusChangeList
(
	@p_satsang_centre_id 	satsang_centre_id,
	@p_satsang_centre_nm 	gnc_nm,
	@p_start_dt				SMALLDATETIME,
	@p_finish_dt			SMALLDATETIME,
	@p_statuses				report_xml_prm,
	@p_gender				VARCHAR (6),
	@p_session_id			INTEGER				OUTPUT
)
AS
	DECLARE
		@extra_information_header	report_description,
		@report_header				report_description

BEGIN

	DECLARE	@statuses	TABLE	(	stts	VARCHAR (4)	);
	DECLARE @hdoc INT;
	
	IF (@p_statuses IS NULL)
		INSERT INTO	@statuses
			SELECT	sewadar_status_cd
			FROM	sewadar_status
			WHERE	effective_till	>	GetDate();
	ELSE
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_statuses; 
		INSERT INTO	@statuses
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	VARCHAR (4)) 
		EXEC sp_xml_removedocument @hdoc
	END

	SET	@p_start_dt		= @p_start_dt + '00:00'
	SET	@p_finish_dt	= CONVERT (DATETIME, CONVERT (VARCHAR (11), @p_finish_dt, 106) + ' 23:59')
	
	SET	@extra_information_header = 'Date     Age   YOA  Initiated'

	SET @report_header = 'Status Change Sewadars List from ' + CONVERT (VARCHAR(11), @p_start_dt, 106)
									+ ' to ' + CONVERT (VARCHAR(11), @p_finish_dt, 106)

	DECLARE	@tbl	TABLE	(	sewadar_grno	CHAR (6)		NOT NULL	PRIMARY KEY,
								effective_dtm	SMALLDATETIME	NOT NULL
							)

	INSERT INTO	@tbl
		SELECT	sewadar_grno, MAX (effective_dtm)
		FROM	sewadars_status_changes
		WHERE	satsang_centre_id	=	@p_satsang_centre_id
		AND 	effective_dtm		BETWEEN		@p_start_dt	AND	@p_finish_dt
		GROUP BY sewadar_grno

	INSERT INTO	generic_report_headers
			(	report_header, extra_information_header	)
		VALUES
			(	@report_header, @extra_information_header	)

	SET	@p_session_id = SCOPE_IDENTITY();

	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
		SELECT	@p_session_id,
				@p_satsang_centre_id,
				sc.sewadar_grno,
				CONVERT (VARCHAR(11), x.effective_dtm, 106) + SPACE (2)
						+ CONVERT (CHAR (2), DATEDIFF (YEAR, s.birth_dtm, GetDate())) + SPACE (2)
						+ CONVERT (CHAR(4), DATEPART (YY, sr.appointment_dt)) + SPACE (2)
						+ CASE WHEN s.initiation_dt IS NULL THEN 'No   ' ELSE 'Yes  ' END
						+ sc.sewadar_status_cd
		FROM	@tbl	x
			JOIN	sewadars_status_changes	sc
				ON	(	sc.satsang_centre_id	=	@p_satsang_centre_id
					AND	sc.sewadar_grno			=	x.sewadar_grno
					AND sc.effective_dtm		=	x.effective_dtm
					)
			JOIN sewadars_registrations	sr
				ON	(	sr.satsang_centre_id	=	sc.satsang_centre_id
					AND	sr.sewadar_grno			=	sc.sewadar_grno
					)
			JOIN	@statuses
				ON	(	sr.sewadar_status_cd	=	stts
					)
			JOIN	sewadars	s
				ON	(	s.sewadar_id		=		sr.sewadar_id
					AND	gender						LIKE	@p_gender
					)
END
GO

-- =============================================================================
-- Procedure GenerateSewadarListGRNoWise
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateSewadarListGRNoWise' AND xtype = 'P')
	DROP PROCEDURE GenerateSewadarListGRNoWise
GO

CREATE PROCEDURE GenerateSewadarListGRNoWise
(
	@p_sewadar_list_id 		sewadar_list_id,
	@p_session_id			INTEGER				OUTPUT
)
AS
	DECLARE
		@report_header		report_description
BEGIN
	SELECT	@report_header	=	sewadar_list_nm
	FROM	generic_sewadar_lists
	WHERE	sewadar_list_id	=	@p_sewadar_list_id;

	INSERT INTO	generic_report_headers
			(	report_header, extra_information_header		)
		VALUES
			(	@report_header, '| VD | ID | AB | BM |Sts. Department'	);

	SET	@p_session_id = SCOPE_IDENTITY();

	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information, grouping_3	)
		SELECT	@p_session_id,
				r.satsang_centre_id,
				r.sewadar_grno,
				'|____|____|____|____|'
					+ r.sewadar_status_cd + ' '
					+ LTRIM (RTRIM (department_nm)) + COALESCE ('(' + LTRIM (RTRIM (sub_department_cd)) + ')', ''),
				r.sewadar_grno
		FROM	generic_sewadar_lists_sewadars	l
			JOIN	sewadars_registrations	r
				ON	(	l.satsang_centre_id	=	r.satsang_centre_id
					AND	l.sewadar_grno		=	r.sewadar_grno
					)
			JOIN	departments	d
				ON	(	d.department_id = r.department_id	)
			LEFT JOIN	sub_departments	s
				ON	(	s.sub_department_id = r.sub_department_id	)
		WHERE	l.sewadar_list_id	=	@p_sewadar_list_id;
END
GO

-- =============================================================================
-- Procedure GenerateSewadarListReport
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateSewadarListReport' AND xtype = 'P')
	DROP PROCEDURE GenerateSewadarListReport
GO

CREATE PROCEDURE GenerateSewadarListReport
(
	@p_sewadar_list_id 		sewadar_list_id,
	@p_is_dept_wise			Boolean,
	@p_department_ids		report_xml_prm,
	@p_sub_department_ids	report_xml_prm,
	@p_gender				VARCHAR (6),
	@p_is_summary			Boolean,
	@p_session_id			INTEGER				OUTPUT
)
AS
	DECLARE
		@rval				INT,
		@report_header		report_description
BEGIN
	DECLARE	@depts		TABLE	(	id	INT	);
	DECLARE	@sub_depts	TABLE	(	id	INT	);
	DECLARE @hdoc INT;

	IF (@p_department_ids IS NOT NULL)
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_department_ids; 
		INSERT INTO	@depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT);
		EXEC sp_xml_removedocument @hdoc;
	END
		
	IF (@p_sub_department_ids IS NOT NULL)
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_sub_department_ids; 
		INSERT INTO	@sub_depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT) 
		EXEC sp_xml_removedocument @hdoc
	END
	
	SELECT	@report_header	=	sewadar_list_nm
	FROM	generic_sewadar_lists
	WHERE	sewadar_list_id	=	@p_sewadar_list_id;
	IF (@p_is_summary = 'Yes')
		SET	@report_header	=	@report_header + ' Summary';
	IF (@p_is_summary = 'Yes')
		INSERT INTO	generic_report_headers
				(	report_header, major_information_header		)
			VALUES
				(	@report_header, ''	);
	ELSE
		INSERT INTO	generic_report_headers
				(	report_header, extra_information_header		)
			VALUES
				(	@report_header, ''	);

	SET	@p_session_id = SCOPE_IDENTITY();

	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
		SELECT	@p_session_id,
				g.satsang_centre_id,
				g.sewadar_grno,
				''
		FROM	generic_sewadar_lists_sewadars	g
			JOIN	sewadars_registrations	r
				ON	(	g.satsang_centre_id	=	r.satsang_centre_id
					AND	g.sewadar_grno		=	r.sewadar_grno
					)
			JOIN	sewadars	s
				ON	(	s.sewadar_id	=		r.sewadar_id
					AND	gender			LIKE	@p_gender
					)
			LEFT JOIN	@depts	d
				ON	(	r.department_id	=	d.id	)
			LEFT JOIN	@sub_depts	x
				ON	(	r.sub_department_id	=	x.id	)
		WHERE	sewadar_list_id	=	@p_sewadar_list_id
		AND	(	(	@p_department_ids	IS NOT NULL	AND	d.id	IS NOT NULL	)
			OR	(	@p_department_ids	IS NULL								)
			)
		AND	(	(	@p_sub_department_ids	IS NOT NULL	AND	x.id	IS NOT NULL	)
			OR	(	@p_sub_department_ids	IS NULL								)
			);
	IF (@p_is_summary = 'Yes')
	BEGIN
		IF (@p_is_dept_wise = 'Yes')
		BEGIN
			EXEC	@rval =	SummariseSessionDeptWise	@p_session_id
			IF (@rval != 0)
				RETURN @rval;
		END
		ELSE
		BEGIN
			EXEC	@rval =	SummariseSessionDeptSubDeptWise	@p_session_id
			IF (@rval != 0)
				RETURN @rval;
		END
	END
	ELSE
	BEGIN
		EXEC	@rval =	MakeListReport	@p_session_id
		IF (@rval != 0)
			RETURN @rval;
	END
END
GO

-- =============================================================================
-- Procedure GenerateTransfersInList
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateTransfersInList' AND xtype = 'P')
	DROP PROCEDURE GenerateTransfersInList
GO

CREATE PROCEDURE GenerateTransfersInList
(
	@p_satsang_centre_id 	satsang_centre_id,
	@p_satsang_centre_nm 	gnc_nm,
	@p_start_dt				SMALLDATETIME,
	@p_finish_dt			SMALLDATETIME,
	@p_gender				VARCHAR (6),
	@p_consider_sub_dept	Boolean,
	@p_session_id			INTEGER				OUTPUT
)
AS
	DECLARE
		@extra_information_header	report_description,
		@report_header				report_description

BEGIN

	SET	@p_start_dt		= @p_start_dt + '00:00'
	SET	@p_finish_dt	= CONVERT (DATETIME, CONVERT (VARCHAR (12), @p_finish_dt, 106) + ' 23:59')

	SET	@extra_information_header = 'Date        Status           Previous Department'

	SET @report_header = 'Transfers-in List from ' + CONVERT (VARCHAR(11), @p_start_dt, 106)
									+ ' to ' + CONVERT (VARCHAR(11), @p_finish_dt, 106)

	INSERT INTO	generic_report_headers
			(	report_header, extra_information_header		)
		VALUES
			(	@report_header, @extra_information_header	)

	SET	@p_session_id = SCOPE_IDENTITY();

	DECLARE	@tbl	TABLE	(	sewadar_grno	CHAR (6)		NOT NULL	PRIMARY KEY,
								effective_dt	SMALLDATETIME	NOT NULL
							)

	INSERT INTO	@tbl
		SELECT	sewadar_grno, MAX (effective_dt)
		FROM	sewadars_transfers
		WHERE	satsang_centre_id	=	@p_satsang_centre_id
		AND 	effective_dt		BETWEEN		@p_start_dt	AND	@p_finish_dt
		GROUP BY sewadar_grno

	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
		SELECT	@p_session_id,
				@p_satsang_centre_id,
				x.sewadar_grno,
				CONVERT (VARCHAR (11), x.effective_dt, 106) + SPACE (3)
						+ sr.sewadar_status_cd + SPACE (2)
						+ RTRIM (d.department_nm) + SPACE (1)
						+ COALESCE ('(' + sd.sub_department_nm + ')', '')
		FROM	@tbl	x
			JOIN	sewadars_transfers	st
					ON	(	st.satsang_centre_id	=	@p_satsang_centre_id
						AND	st.sewadar_grno			=	x.sewadar_grno
						AND	st.effective_dt			=	x.effective_dt
						)
			JOIN	departments			d
					ON	(	st.old_department_id	=		d.department_id
						)
			LEFT OUTER JOIN	sub_departments		sd
					ON	(	st.old_department_id		=	sd.department_id
						AND	st.old_sub_department_id	=	sd.sub_department_id
						)
			JOIN	sewadars_registrations			sr
					ON	(	st.sewadar_grno			=	sr.sewadar_grno
						AND	st.satsang_centre_id	=	sr.satsang_centre_id
						)
			JOIN	sewadars		s
					ON	(	s.sewadar_id	=		sr.sewadar_id
						AND	gender			LIKE	@p_gender
						)
		WHERE	(	(	@p_consider_sub_dept = 'Yes'	)
				OR	(	@p_consider_sub_dept = 'No'
					AND	st.department_id	!=	st.old_department_id
					)
				);
END
GO

-- =============================================================================
-- Procedure GenerateNonInitiateSewadarList
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateNonInitiateSewadarList' AND xtype = 'P')
	DROP PROCEDURE GenerateNonInitiateSewadarList
GO

CREATE PROCEDURE GenerateNonInitiateSewadarList
(
	@p_satsang_centre_id 	satsang_centre_id,
	@p_satsang_centre_nm 	gnc_nm,
	@p_department_ids		report_xml_prm,
	@p_sub_department_ids	report_xml_prm,
	@p_males_born_bfr_dt	SMALLDATETIME,
	@p_females_born_bfr_dt	SMALLDATETIME,
	@p_session_id			INTEGER				OUTPUT
)
AS
	DECLARE
		@extra_information_header	report_description

BEGIN

	DECLARE	@depts		TABLE	(	id	INT	);
	DECLARE	@sub_depts	TABLE	(	id	INT	);
	DECLARE @hdoc INT;	

	IF (@p_department_ids IS NULL)
		INSERT INTO	@depts
			SELECT	department_id
			FROM	departments_satsang_centres
			WHERE	satsang_centre_id	=	@p_satsang_centre_id
			AND		effective_till	>	GetDate();
	ELSE
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_department_ids; 
		INSERT INTO	@depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT);
		EXEC sp_xml_removedocument @hdoc;
	END
		
	IF (@p_sub_department_ids IS NOT NULL)
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_sub_department_ids; 
		INSERT INTO	@sub_depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT) 
		EXEC sp_xml_removedocument @hdoc
	END
			
	
	SET	@extra_information_header = 'Age   YOA  Status Telephone-Res.'

	INSERT INTO	generic_report_headers
			(	report_header, extra_information_header	)
		VALUES
			(	'List of Sewadars (Non-Initiated)', @extra_information_header		)

	SET	@p_session_id = SCOPE_IDENTITY();

	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
		SELECT	@p_session_id,
				@p_satsang_centre_id,
				sr.sewadar_grno,
				space (1)
						+ CONVERT (CHAR (2), DATEDIFF (YEAR, birth_dtm, GetDate())) + SPACE (2)
						+ CONVERT (CHAR(4), DATEPART (YY, appointment_dt)) + SPACE (2)
						+ sr.sewadar_status_cd + SPACE (3)
						+ COALESCE (telephone_residence, '')
		FROM	sewadars_registrations	sr
			JOIN	sewadars	s
				ON	(	s.sewadar_id				=		sr.sewadar_id
					AND sr.satsang_centre_id	=		@p_satsang_centre_id
					AND	s.global_sewadar_status_cd	IS NULL
					AND initiation_dt IS NULL
					AND	(	(	gender	=	'Female'	AND		birth_dtm < @p_females_born_bfr_dt	)
						OR	(	gender	=	'Male'		AND		birth_dtm < @p_males_born_bfr_dt	)
						)
					)
			JOIN	system_information_values	iv
				ON	(	iv.system_info_cd		=		'SttsActv'
					AND	iv.value_varchar		=		sewadar_status_cd					
					)			
			JOIN	@depts
				ON	(	sr.department_id	=	id	)
			JOIN	sewadars_details	sd
				ON	(	sd.sewadar_id	=	sr.sewadar_id	)
			LEFT	JOIN	@sub_depts	x
				ON	(	sr.sub_department_id	=	x.id	)
			WHERE	(	@p_sub_department_ids	IS NOT NULL	AND	x.id	IS NOT NULL	)
				OR	(	@p_sub_department_ids	IS NULL					)
					
	END
GO

-- =============================================================================
-- Procedure GenerateInitiatedNISewadarList
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateInitiatedNISewadarList' AND xtype = 'P')
	DROP PROCEDURE GenerateInitiatedNISewadarList
GO

CREATE PROCEDURE GenerateInitiatedNISewadarList
(
	@p_satsang_centre_id 	satsang_centre_id,
	@p_satsang_centre_nm 	gnc_nm,
	@p_department_ids		report_xml_prm,
	@p_sub_department_ids	report_xml_prm,
	@p_session_id			INTEGER				OUTPUT
)
AS
	DECLARE
		@extra_information_header	report_description

BEGIN

	DECLARE	@depts		TABLE	(	id	INT	);
	DECLARE	@sub_depts	TABLE	(	id	INT	);
	DECLARE @hdoc INT;	

	IF (@p_department_ids IS NULL)
		INSERT INTO	@depts
			SELECT	department_id
			FROM	departments_satsang_centres
			WHERE	satsang_centre_id	=	@p_satsang_centre_id
			AND		effective_till	>	GetDate();
	ELSE
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_department_ids; 
		INSERT INTO	@depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT);
		EXEC sp_xml_removedocument @hdoc;
	END
		
	IF (@p_sub_department_ids IS NOT NULL)
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_sub_department_ids; 
		INSERT INTO	@sub_depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT) 
		EXEC sp_xml_removedocument @hdoc
	END
			
	
	SET	@extra_information_header = 'Age   Initiation Date and Place'

	INSERT INTO	generic_report_headers
			(	report_header, extra_information_header	)
		VALUES
			(	'List of Initiated Sewadars with NI Status', @extra_information_header		)

	SET	@p_session_id = SCOPE_IDENTITY();

	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
		SELECT	@p_session_id,
				@p_satsang_centre_id,
				sr.sewadar_grno,
				space (1)
						+ CONVERT (CHAR (2), DATEDIFF (YEAR, birth_dtm, GetDate())) + SPACE (3)
						+ CONVERT (VARCHAR(11), initiation_dt, 106) + SPACE (3)
						+ place_nm
		FROM	sewadars_registrations	sr
			JOIN	sewadars	s
				ON	(	s.sewadar_id				=	sr.sewadar_id
					AND sr.satsang_centre_id		=	@p_satsang_centre_id
					AND	s.global_sewadar_status_cd	IS		NULL
					AND initiation_dt				IS	NOT NULL
					AND	sewadar_status_cd			=	'NI'
					)
			JOIN	CDB..initiation_places	i
				ON	(	i.place_id	=	s.initiation_place_id	)
			JOIN	@depts
				ON	(	sr.department_id	=	id	)
			LEFT	JOIN	@sub_depts	x
				ON	(	sr.sub_department_id	=	x.id	)
			WHERE	(	@p_sub_department_ids	IS NOT NULL	AND	x.id	IS NOT NULL	)
				OR	(	@p_sub_department_ids	IS NULL					)
					
	END
GO

-- ======================================================================================================================
-- FUNCTION GetSewadarRemarks
-- ======================================================================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GetSewadarRemarks' AND xtype = 'FN')
	DROP FUNCTION GetSewadarRemarks
GO

CREATE FUNCTION GetSewadarRemarks
(
	@p_sewadar_id			sewadar_id,
	@p_remarks_type			remarks_type
)
RETURNS
	VARCHAR (300)
AS
BEGIN
	DECLARE @return_str	VARCHAR (300);
	DECLARE	@qual		TABLE	(	qual_cd VARCHAR(8),qlfctn_subj VARCHAR(20) 	);
		
	SET @return_str = '';

	SELECT	@return_str = @return_str + remarks + '; '
	FROM	sewadars_remarks
	WHERE	sewadar_id	=	@p_sewadar_id
	AND		remarks_type	=	@p_remarks_type
	ORDER BY	remarks_sq;
	
	IF(LEN (@return_str) > 1)
		SET @return_str = LEFT (@return_str, LEN (@return_str) - 1);
	
	RETURN @return_str;
END
GO

-- =============================================================================
-- Procedure GenerateSewadarsListWithRemarks
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateSewadarsListWithRemarks' AND xtype = 'P')
	DROP PROCEDURE GenerateSewadarsListWithRemarks
GO

CREATE PROCEDURE GenerateSewadarsListWithRemarks
(
	@p_satsang_centre_id 	satsang_centre_id,
	@p_satsang_centre_nm 	gnc_nm,
	@p_gender				VARCHAR (6),
	@p_remarks_type			remarks_type,
	@p_sewadar_list_id 		sewadar_list_id,
	@p_session_id			INTEGER				OUTPUT
)
AS
	DECLARE
		@sewadar_list_nm	gnc_long_nm
BEGIN
	SELECT	@sewadar_list_nm	=	sewadar_list_nm
	FROM	generic_sewadar_lists
	WHERE	sewadar_list_id	=	@p_sewadar_list_id;

	IF (@p_sewadar_list_id	IS NOT	NULL AND @sewadar_list_nm IS NOT NULL)					--- Restrict to Sewadar List
		INSERT INTO	generic_report_headers
				(	report_header, extra_information_header		)
			VALUES
				(	'List of Sewadars as per ' + @sewadar_list_nm + ' with Remarks of Type - ' + @p_remarks_type, @p_remarks_type		)
	ELSE
		INSERT INTO	generic_report_headers
				(	report_header, extra_information_header		)
			VALUES
			(	'List of Sewadars with Remarks of Type - ' + @p_remarks_type, @p_remarks_type		)

	SET	@p_session_id = SCOPE_IDENTITY();

	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
		SELECT	@p_session_id,
				@p_satsang_centre_id,
				sr.sewadar_grno,
				dbo.GetSewadarRemarks (sr.sewadar_id, @p_remarks_type)
		FROM	sewadars_registrations	sr
			JOIN	sewadars	s
				ON	(	s.sewadar_id				=		sr.sewadar_id
					AND sr.satsang_centre_id		=		@p_satsang_centre_id
					AND	s.global_sewadar_status_cd	IS NULL
					AND	gender						LIKE	@p_gender
					)
			JOIN	system_information_values	iv
				ON	(	iv.system_info_cd		=		'SttsActv'
					AND	iv.value_varchar		=		sewadar_status_cd					
					)
			LEFT JOIN	generic_sewadar_lists_sewadars	g
				ON	(	g.sewadar_grno		=	sr.sewadar_grno
					AND g.satsang_centre_id =	sr.satsang_centre_id
					AND g.sewadar_list_id	=	@p_sewadar_list_id
					)
		WHERE	EXISTS	(	SELECT	1
							FROM	sewadars_remarks	srm
							WHERE	srm.sewadar_id	=	sr.sewadar_id	
							AND		remarks_type	=	@p_remarks_type
						)
		AND		(	@p_sewadar_list_id	IS		NULL
				OR	g.sewadar_grno		IS	NOT	NULL
				);
END
GO


-- =============================================================================
-- Procedure GenerateSewadarsListWithMissingRemarks
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateSewadarsListWithMissingRemarks' AND xtype = 'P')
	DROP PROCEDURE GenerateSewadarsListWithMissingRemarks
GO

CREATE PROCEDURE GenerateSewadarsListWithMissingRemarks
(
	@p_satsang_centre_id 	satsang_centre_id,
	@p_satsang_centre_nm 	gnc_nm,
	@p_remarks_type			remarks_type,
	@p_session_id			INTEGER				OUTPUT
)
AS
	DECLARE
		@rval					INT;
BEGIN
	INSERT INTO	generic_report_headers
			(	report_header, extra_information_header		)
		VALUES
			(	'List of Sewadars with missing ' + @p_remarks_type, 'Sewadar ID'		)

	SET	@p_session_id = SCOPE_IDENTITY();

	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
		SELECT	@p_session_id,
				sr.satsang_centre_id,
				sr.sewadar_grno,
				sr.sewadar_id
		FROM	sewadars_registrations	sr
			JOIN	sewadars	s
				ON	(	s.sewadar_id		=		sr.sewadar_id
					AND sr.satsang_centre_id		=		@p_satsang_centre_id
					AND	s.global_sewadar_status_cd	IS NULL
					)
			JOIN	system_information_values	iv
				ON	(	iv.system_info_cd		=		'SwdStsArea'
					AND	iv.value_varchar		=		sr.sewadar_status_cd					
					)
		WHERE	NOT EXISTS	(	SELECT	1
								FROM	sewadars_remarks	srm
								WHERE	srm.sewadar_id	=	sr.sewadar_id	
								AND		remarks_type	=	@p_remarks_type
							);
	EXEC	@rval =	MakeListReport	@p_session_id;
	IF (@rval != 0)
		RETURN @rval;
END
GO


-- =============================================================================
-- Procedure GenerateDataMigrationReport
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateDataMigrationReport' AND xtype = 'P')
	DROP PROCEDURE GenerateDataMigrationReport
GO

CREATE PROCEDURE GenerateDataMigrationReport
(
	@p_satsang_centre_id 	satsang_centre_id,
	@p_satsang_centre_nm 	gnc_nm,
	@p_sewadar_list_id 		sewadar_list_id,
	@p_session_id			INTEGER				OUTPUT
)
AS
	DECLARE
		@sewadar_list_nm	 	gnc_long_nm;
BEGIN
	SELECT	@sewadar_list_nm	=	sewadar_list_nm
	FROM	generic_sewadar_lists
	WHERE	sewadar_list_id	=	@p_sewadar_list_id;

	INSERT INTO	generic_report_headers
			(	report_header, extra_information_header		)
		VALUES
			(	'Data Migration Report for ' + @sewadar_list_nm, 'PhotoID SewadarID Old GRNo Department'		)
			                                            ---       1234567890123456789012345678901234567890

	SET	@p_session_id = SCOPE_IDENTITY();

	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
		SELECT	@p_session_id,
				s.satsang_centre_id,
				s.sewadar_grno,
				SUBSTRING (SUBSTRING (SUBSTRING (r.remarks + SPACE (10), 1, 8) + CONVERT (VARCHAR, sr.sewadar_id) + SPACE (10), 1, 18) + COALESCE (o.remarks, '') + SPACE (20), 1, 27)
						+ department_nm + COALESCE ('(' + sub_department_nm + ')', '')
		FROM	sewadars_registrations	sr
			JOIN	generic_sewadar_lists_sewadars	s
				ON	(	s.sewadar_grno		=	sr.sewadar_grno
					AND s.satsang_centre_id =	sr.satsang_centre_id
					AND s.sewadar_list_id	=	@p_sewadar_list_id
					)
			JOIN	sewadars_remarks	r
				ON	(	r.sewadar_id	=	sr.sewadar_id
					AND	r.remarks_type	=	'Reference'
					AND	r.remarks_sq	=	1
					)
			LEFT JOIN	sewadars_remarks	o
				ON	(	o.sewadar_id	=	sr.sewadar_id
					)
			JOIN	departments	d
				ON	(	d.department_id	=	sr.department_id	)
			LEFT JOIN	sub_departments	sd
				ON	(	sd.sub_department_id	=	sr.sub_department_id	)
		WHERE	o.remarks_type	=	'Old G.R.No.'
END
GO

-- =============================================================================
-- Procedure GenerateBulkRegistrationReport
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateBulkRegistrationReport' AND xtype = 'P')
	DROP PROCEDURE GenerateBulkRegistrationReport
GO

CREATE PROCEDURE GenerateBulkRegistrationReport
(
	@p_satsang_centre_id 	satsang_centre_id,
	@p_satsang_centre_nm 	gnc_nm,
	@p_sewadar_list_id 		sewadar_list_id,
	@p_session_id			INTEGER				OUTPUT
)
AS
	DECLARE
		@sewadar_list_nm	 	gnc_long_nm;
BEGIN
	SELECT	@sewadar_list_nm	=	sewadar_list_nm
	FROM	generic_sewadar_lists
	WHERE	sewadar_list_id	=	@p_sewadar_list_id;

	INSERT INTO	generic_report_headers
			(	report_header, extra_information_header		)
		VALUES
			(	'Data Migration Report for ' + @sewadar_list_nm, 'PhotoID  SewadarID  Department'		)
			                                            ---       1234567890123456789012345678901234567890

	SET	@p_session_id = SCOPE_IDENTITY();

	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
		SELECT	@p_session_id,
				s.satsang_centre_id,
				s.sewadar_grno,
				SUBSTRING (SUBSTRING (r.remarks + SPACE (11), 1, 9) + CONVERT (VARCHAR(10), sr.sewadar_id) + SPACE (10), 1, 20)
						+ department_nm + COALESCE ('(' + sub_department_nm + ')', '')
		FROM	sewadars_registrations	sr
			JOIN	generic_sewadar_lists_sewadars	s
				ON	(	s.sewadar_grno		=	sr.sewadar_grno
					AND s.satsang_centre_id =	sr.satsang_centre_id
					AND s.sewadar_list_id	=	@p_sewadar_list_id
					)
			JOIN	sewadars_remarks	r
				ON	(	r.sewadar_id	=	sr.sewadar_id
					AND	r.remarks_type	=	'Reference'
					AND	r.remarks_sq	=	1
					)
			JOIN	departments	d
				ON	(	d.department_id	=	sr.department_id	)
			LEFT JOIN	sub_departments	sd
				ON	(	sd.sub_department_id	=	sr.sub_department_id	)
END
GO

-- =============================================================================
-- Procedure GenerateSewadarsPhotoNotClickd
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateSewadarsPhotoNotClickd' AND xtype = 'P')
	DROP PROCEDURE GenerateSewadarsPhotoNotClickd
GO

CREATE PROCEDURE GenerateSewadarsPhotoNotClickd
(
	@p_satsang_centre_id 	satsang_centre_id,
	@p_satsang_centre_nm 	gnc_nm,
	@p_department_ids		report_xml_prm,
	@p_sub_department_ids	report_xml_prm,
	@p_is_outstation		VARCHAR (3),
	@p_gender				VARCHAR (6),
	@p_photo_after_dt		DATETIME,
	@p_session_id			INTEGER				OUTPUT
)
AS
	DECLARE
		@extra_information_header	report_description,
		@rval						INT,
		@extra_information			report_description

BEGIN

	DECLARE	@depts		TABLE	(	id	INT	);
	DECLARE	@sub_depts	TABLE	(	id	INT	);
	DECLARE @hdoc INT;	
	
	IF (@p_department_ids IS NULL)
		INSERT INTO	@depts
			SELECT	department_id
			FROM	departments_satsang_centres
			WHERE	satsang_centre_id	=	@p_satsang_centre_id
			AND		effective_till	>	GetDate();
	ELSE
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_department_ids; 
		INSERT INTO	@depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT);
		EXEC sp_xml_removedocument @hdoc;
	END
		
	IF (@p_sub_department_ids IS NOT NULL)
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_sub_department_ids; 
		INSERT INTO	@sub_depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT) 
		EXEC sp_xml_removedocument @hdoc
	END
	
	SET  @extra_information = ''
	SET	@extra_information_header = 'Age   YOA   Telephone'

	IF (@p_is_outstation = 'Yes')
		SET @extra_information = @extra_information + ' Outside Sewadars'
	ELSE IF (@p_is_outstation = 'No')
		SET @extra_information = @extra_information + ' Local Sewadars'
	ELSE
		SET @extra_information = @extra_information + ' Sewadars'

	INSERT INTO	generic_report_headers
			(	report_header, extra_information_header	)
		VALUES
			('List of ' + @extra_information + ' who have not clicked their photo after ' + CONVERT (VARCHAR (11), @p_photo_after_dt, 106),
			  @extra_information_header
			)

	SET	@p_session_id = SCOPE_IDENTITY();

	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
		SELECT	@p_session_id,
				@p_satsang_centre_id,
				sr.sewadar_grno,
				SPACE (1)
				/* + CONVERT (CHAR (2), DATEDIFF (YEAR, birth_dtm, GetDate())) + SPACE (2)
						+ CONVERT (CHAR(4), DATEPART (YY, appointment_dt)) + SPACE (2)
						+ COALESCE (telephone_mobile, COALESCE (telephone_residence, ''))
				 */
		FROM	sewadars	s
			JOIN	sewadars_registrations	sr
				ON	(	s.sewadar_id				=		sr.sewadar_id
					AND sr.satsang_centre_id		=		@p_satsang_centre_id
					AND	gender						LIKE	@p_gender
					AND	s.global_sewadar_status_cd	IS NULL
					AND	is_outstation_sewadar		LIKE	@p_is_outstation
					)
			JOIN	system_information_values	iv
				ON	(	iv.system_info_cd	=	'SttsGenUse'
					AND	iv.value_varchar	=	sewadar_status_cd
					)
			JOIN	@depts
				ON	(	sr.department_id	=	id	)
			JOIN	sewadars_details	sd				--- Not sure about this JOIN..... may be to eliminate Open and Trainee Sewadars
				ON	(	sd.sewadar_id	=	sr.sewadar_id	)
			LEFT JOIN	ZSM_Photos..sewadars_photos	sp
				ON	(	sp.sewadar_id	=	sr.sewadar_id	)
			LEFT	JOIN	@sub_depts	x
				ON	(	sr.sub_department_id	=	x.id	)
		WHERE	(	sp.sewadar_id	IS NULL
				OR	sp.photo_dt		<=	@p_photo_after_dt
				)
		AND		(	(	@p_sub_department_ids	IS NOT NULL	AND	x.id	IS NOT NULL	)
				OR	(	@p_sub_department_ids	IS NULL								)
				)
	EXEC 	@rval = MakeListReport @p_session_id;			
	IF (@rval != 0)
		RETURN @rval;
END
GO

-- =============================================================================
-- Procedure GenerateSewadarsWithoutAttendance
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateSewadarsWithoutAttendance' AND xtype = 'P')
	DROP PROCEDURE GenerateSewadarsWithoutAttendance
GO

CREATE PROCEDURE GenerateSewadarsWithoutAttendance
(
	@p_satsang_centre_id 		satsang_centre_id,
	@p_satsang_centre_nm 		gnc_nm,
	@p_department_ids			report_xml_prm,
	@p_sub_department_ids		report_xml_prm,
	@p_is_outstation			VARCHAR (3),
	@p_gender					VARCHAR (6),
	@p_sewa_id					sewa_id,
	@p_session_id				INTEGER				OUTPUT
)
AS
	DECLARE
		@extra_information_header	report_description,
		@extra_information			report_description,
		@sewa_finish_dt				DATE,
		@sewa_nm					gnc_nm;

BEGIN
	DECLARE	@depts		TABLE	(	id	INT	);
	DECLARE	@sub_depts	TABLE	(	id	INT	);
	DECLARE @hdoc INT;	
	
	IF (@p_department_ids IS NULL)
		INSERT INTO	@depts
			SELECT	department_id
			FROM	departments_satsang_centres
			WHERE	satsang_centre_id	=	@p_satsang_centre_id
			AND		effective_till	>	GetDate();
	ELSE
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_department_ids; 
		INSERT INTO	@depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT);
		EXEC sp_xml_removedocument @hdoc;
	END
		
	IF (@p_sub_department_ids IS NOT NULL)
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_sub_department_ids; 
		INSERT INTO	@sub_depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT) 
		EXEC sp_xml_removedocument @hdoc
	END
	
	SET	@extra_information_header = 'Status  Appointment'

	IF (@p_is_outstation = 'Yes')
		SET @extra_information = 'Outside Sewadars'
	ELSE IF (@p_is_outstation = 'No')
		SET @extra_information = 'Local Sewadars'
	ELSE
		SET @extra_information = 'Sewadars'

	EXEC SummariseSewa @p_sewa_id;

	SELECT	@sewa_nm	=	sewa_nm,
			@sewa_finish_dt	=	finish_dt
	FROM	sewas
	WHERE	sewa_id	=	@p_sewa_id;

	INSERT INTO	generic_report_headers
			(	report_header, extra_information_header	)
		VALUES
			(	@extra_information + ' whose Attendance is not recorded for ' + @sewa_nm, @extra_information_header	)

	SET	@p_session_id = SCOPE_IDENTITY();

	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
		SELECT	@p_session_id,
				@p_satsang_centre_id,
				sr.sewadar_grno,
				SPACE (1) + SUBSTRING (sr.sewadar_status_cd + SPACE (2), 1, 4) + SPACE (4) + CONVERT (VARCHAR (11), appointment_dt, 106)
		FROM	sewadars	s
			JOIN	sewadars_registrations	sr
				ON	(	s.sewadar_id				=		sr.sewadar_id
					AND sr.satsang_centre_id		=		@p_satsang_centre_id
					AND	gender						LIKE	@p_gender
					AND	s.global_sewadar_status_cd	IS NULL
					AND	is_outstation_sewadar		LIKE	@p_is_outstation
					AND	sr.sewadar_status_cd		IN	(	'Perm', 'Temp', 'NI'	)
					AND	sr.appointment_dt			<=		@sewa_finish_dt
					)
			JOIN	@depts
				ON	(	sr.department_id	=	id	)
			LEFT	JOIN	@sub_depts	y
				ON	(	sr.sub_department_id	=	y.id	)
			LEFT JOIN	sewadar_wise_sewa_summaries	x
				ON	(	x.sewa_id				=	@p_sewa_id
					AND	sr.satsang_centre_id	=	x.satsang_centre_id
					AND	sr.sewadar_grno			=	x.sewadar_grno
					)
		WHERE	(	(	@p_sub_department_ids	IS NOT NULL	AND	y.id	IS NOT NULL	)
				OR	(	@p_sub_department_ids	IS NULL								)
				)
		AND		x.sewadar_grno	IS NULL;
END
GO

-- =============================================================================
-- Function _ConsiderSewaForCentre (centre_id, sewa_id)
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = '_ConsiderSewaForCentre' AND xtype = 'FN')
	DROP FUNCTION _ConsiderSewaForCentre
GO

CREATE FUNCTION _ConsiderSewaForCentre
(
	@p_centre_id	INTEGER,
	@p_sewa_id		INTEGER
)
RETURNS
	BIT
AS
BEGIN
	DECLARE
		@sewa_considered	BIT	=	0;
	
	DECLARE @tbl	TABLE	(	centre_id	INT,
								sewa_id		INT		PRIMARY KEY
							);
							
	-- mumbai centre
	INSERT INTO	@tbl	VALUES	(	6015, 152	);
	INSERT INTO	@tbl	VALUES	(	6015, 149	);
	INSERT INTO	@tbl	VALUES	(	6015, 146	);

	-- Indore centres
	INSERT INTO	@tbl	VALUES	(	5820, 120000023	);
	INSERT INTO	@tbl	VALUES	(	5820, 120000026	);
	INSERT INTO	@tbl	VALUES	(	5820, 120000028	);	

		-- Nagpur centre
	INSERT INTO	@tbl	VALUES	(	6056, 63	);
	INSERT INTO	@tbl	VALUES	(	6056, 100000019	);
	INSERT INTO	@tbl	VALUES	(	6056, 100000011	);
	INSERT INTO	@tbl	VALUES	(	6056, 100000007	);
	INSERT INTO	@tbl	VALUES	(	6056, 100000022	);
	INSERT INTO	@tbl	VALUES	(	6056, 100000028	);
	
	-- Raipur centre
	INSERT INTO	@tbl	VALUES	(	9720, 95	);
	INSERT INTO	@tbl	VALUES	(	9720, 130000003	);
	INSERT INTO	@tbl	VALUES	(	9720, 130000005	);
	INSERT INTO	@tbl	VALUES	(	9720, 130000009	);
	INSERT INTO	@tbl	VALUES	(	9720, 130000013	);
	INSERT INTO	@tbl	VALUES	(	9720, 130000019	);
	

	IF EXISTS	(	SELECT	1
					FROM	@tbl
					WHERE	centre_id	=	@p_centre_id
				)
	BEGIN
		IF EXISTS	(	SELECT	1
						FROM	@tbl
						WHERE	centre_id	=	@p_centre_id
						AND		sewa_id		=	@p_sewa_id
					)
			SET @sewa_considered	=	1;
		ELSE
			SET @sewa_considered	=	0;
	END
	ELSE
		SET @sewa_considered	=	1;

	RETURN @sewa_considered;
END
GO

-- =============================================================================
-- Procedure GenerateTempSewadarsToBeMadePerm
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateTempSewadarsToBeMadePerm' AND xtype = 'P')
	DROP PROCEDURE GenerateTempSewadarsToBeMadePerm
GO

CREATE PROCEDURE GenerateTempSewadarsToBeMadePerm
(
	@p_satsang_centre_id 		satsang_centre_id,
	@p_satsang_centre_nm 		gnc_nm,
	@p_department_ids			report_xml_prm,
	@p_sub_department_ids		report_xml_prm,
	@p_is_outstation			VARCHAR (3),
	@p_gender					VARCHAR (6),
	@p_appointment_before_dt	DATETIME,
	@p_session_id				INTEGER				OUTPUT
)
AS
	DECLARE
		@extra_information_header	report_description,
		@extra_information			report_description,
		@sewa_id					sewa_id,
		@sewa_start_dt				DATE,
		@sewa_finish_dt				DATE,
		@sewa_start_str				VARCHAR (11),
		@sewa_days					SMALLINT

BEGIN
					/* .... IMPORTANT to NOTE......
					   A report "Temporary Sewadars who may be made Permanent" has been added in the Miscellaneous Reports. It has parameters for Department(s), Sub-departments(s),
					   Gender and Outstation / Local Sewadars. Further, it takes an additional parameter for "Appointments before" date. This is used for identifying
					   Temporary Sewadars who have been appointed on or before this date. Also, this is used for identifying Sewas which have ended after this date.

					   Note that :
					   	* Only Temporary Sewadars are considered.
						* The number of presences are shown for each sewa. If sewadar has been appointed after the Sewa, the place is left empty.
						* If a Sewadar was exempt, or was on leave, or was absent for the entire Sewa period, EX, LV and AB are rendered respectively.
						* If a sewadar's appointment is after a Sewa Start date, an asterisk is shown.
						* Only Satsang Programmes ..... we do NOT want to consider construction sewas; if we need to consider, the space on a line may be constrained.
						* Sewa Date is specified as per Sewa Start Date (and NOT Satsang Programme... we do NOT store programme dates)
						*/
	DECLARE	@depts		TABLE	(	id	INT	);
	DECLARE	@sub_depts	TABLE	(	id	INT	);
	DECLARE @hdoc INT;	
	
	IF (@p_department_ids IS NULL)
		INSERT INTO	@depts
			SELECT	department_id
			FROM	departments_satsang_centres
			WHERE	satsang_centre_id	=	@p_satsang_centre_id
			AND		effective_till	>	GetDate();
	ELSE
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_department_ids; 
		INSERT INTO	@depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT);
		EXEC sp_xml_removedocument @hdoc;
	END
		
	IF (@p_sub_department_ids IS NOT NULL)
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_sub_department_ids; 
		INSERT INTO	@sub_depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT) 
		EXEC sp_xml_removedocument @hdoc
	END
	
	SET	@extra_information_header = 'Appointment'

	IF (@p_is_outstation = 'Yes')
		SET @extra_information = 'Outside Temporary Sewadars'
	ELSE IF (@p_is_outstation = 'No')
		SET @extra_information = 'Local Temporary Sewadars'
	ELSE
		SET @extra_information = 'Temporary Sewadars'

	DECLARE	@tbl	TABLE
		(	grno	CHAR (6)		NOT NULL	PRIMARY KEY,
			appt_dt	DATE			NOT NULL,
			info	VARCHAR (100)	NOT NULL
		)

	INSERT INTO	@tbl
		SELECT	sr.sewadar_grno, appointment_dt, CONVERT (VARCHAR (11), appointment_dt, 106)
				/* + CONVERT (CHAR (2), DATEDIFF (YEAR, birth_dtm, GetDate())) + SPACE (2)
						+ CONVERT (CHAR(4), DATEPART (YY, appointment_dt)) + SPACE (2)
						+ COALESCE (telephone_mobile, COALESCE (telephone_residence, ''))
				 */
		FROM	sewadars	s
			JOIN	sewadars_registrations	sr
				ON	(	s.sewadar_id				=		sr.sewadar_id
					AND sr.satsang_centre_id		=		@p_satsang_centre_id
					AND	gender						LIKE	@p_gender
					AND	s.global_sewadar_status_cd	IS NULL
					AND	is_outstation_sewadar		LIKE	@p_is_outstation
					AND	sr.appointment_dt			<=	@p_appointment_before_dt
					AND	sr.sewadar_status_cd		=	'Temp'
					)
			JOIN	@depts
				ON	(	sr.department_id	=	id	)
			LEFT	JOIN	@sub_depts	x
				ON	(	sr.sub_department_id	=	x.id	)
		WHERE	(	(	@p_sub_department_ids	IS NOT NULL	AND	x.id	IS NOT NULL	)
				OR	(	@p_sub_department_ids	IS NULL								)
				);

	DECLARE	sewa_crsr	CURSOR
	FOR
		SELECT	sewa_id, start_dt, finish_dt, DATEDIFF (d, start_dt, finish_dt) + 1, CONVERT (VARCHAR (11), start_dt, 106)
		FROM	sewas
		WHERE	finish_dt				>=	@p_appointment_before_dt
		AND		is_satsang_programme	=	'Yes'
		AND		attendance_marking		=	'Team-wise'
		AND		satsang_centre_id		=	@p_satsang_centre_id
		ORDER BY start_dt;


	OPEN	sewa_crsr

	FETCH	sewa_crsr
		INTO	@sewa_id, @sewa_start_dt, @sewa_finish_dt, @sewa_days, @sewa_start_str

	WHILE (@@FETCH_STATUS = 0)
		BEGIN
			IF (dbo._ConsiderSewaForCentre (@p_satsang_centre_id, @sewa_id) = 1)
			BEGIN
				EXEC SummariseSewa @sewa_id;

				SET @extra_information_header = @extra_information_header + SPACE(1) + SUBSTRING (@sewa_start_str, 4, 3) + SUBSTRING (@sewa_start_str, 10, 2)
				UPDATE	t
					SET	info	=	info +	CASE WHEN	s.sewadar_grno	IS NULL
												THEN	SPACE (6)
												ELSE	CASE WHEN present_cnt = 0 THEN CASE WHEN exempt_cnt = @sewa_days  THEN '  EX'
																							WHEN leave_cnt  = @sewa_days  THEN '  LV'
																							WHEN absent_cnt  = @sewa_days THEN '  AB'
																														ELSE '   0'
																					END
															WHEN present_cnt < 10 THEN SPACE (3) + CONVERT (VARCHAR, CAST (present_cnt AS INT))
																				ELSE 	SPACE (2) + CONVERT (VARCHAR, CAST (present_cnt AS INT))
														END
														+ CASE WHEN t.appt_dt > @sewa_start_dt AND t.appt_dt <= @sewa_finish_dt THEN '* '
																																ELSE SPACE (2)
														END
											END
				FROM	@tbl	t
					LEFT JOIN	sewadar_wise_sewa_summaries	s
						ON	(	s.sewa_id			=	@sewa_id
							AND	s.satsang_centre_id	=	@p_satsang_centre_id
							AND	s.sewadar_grno		=	t.grno
							);
			END

			FETCH	sewa_crsr
				INTO	@sewa_id, @sewa_start_dt, @sewa_finish_dt, @sewa_days, @sewa_start_str
		END

	CLOSE	sewa_crsr
	DEALLOCATE	sewa_crsr

	INSERT INTO	generic_report_headers
			(	report_header, extra_information_header	)
		VALUES
			('List of ' + @extra_information + ' who may be made Permanent appointed before ' + CONVERT (VARCHAR (11), @p_appointment_before_dt, 106),
			  @extra_information_header
			)

	SET	@p_session_id = SCOPE_IDENTITY();

	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
		SELECT	@p_session_id,
				@p_satsang_centre_id,
				grno,
				info
		FROM	@tbl;
END
GO

-- =============================================================================
-- Procedure GenerateBadgesNotReturnedSewadars
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateBadgesNotReturnedSewadars' AND xtype = 'P')
	DROP PROCEDURE GenerateBadgesNotReturnedSewadars
GO

CREATE PROCEDURE GenerateBadgesNotReturnedSewadars
(
	@p_satsang_centre_id 		satsang_centre_id,
	@p_satsang_centre_nm 		gnc_nm,
	@p_department_ids			report_xml_prm,
	@p_sub_department_ids		report_xml_prm,
	@p_is_outstation			VARCHAR (3),
	@p_gender					VARCHAR (6),
	@p_sewadar_list_id			INTEGER,
	@p_photo_after_dt			DATETIME,
	@p_session_id				INTEGER				OUTPUT
)
AS
	DECLARE
		@extra_information_header	report_description,
		@sewadar_list_nm		 	gnc_long_nm,
		@extra_information			report_description
BEGIN
	SELECT	@sewadar_list_nm	=	sewadar_list_nm
	FROM	generic_sewadar_lists
	WHERE	sewadar_list_id	=	@p_sewadar_list_id;

	DECLARE	@depts		TABLE	(	id	INT	);
	DECLARE	@sub_depts	TABLE	(	id	INT	);
	DECLARE @hdoc INT;	
	
	IF (@p_department_ids IS NULL)
		INSERT INTO	@depts
			SELECT	department_id
			FROM	departments_satsang_centres
			WHERE	satsang_centre_id	=	@p_satsang_centre_id
			AND		effective_till	>	GetDate();
	ELSE
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_department_ids; 
		INSERT INTO	@depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT);
		EXEC sp_xml_removedocument @hdoc;
	END
		
	IF (@p_sub_department_ids IS NOT NULL)
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_sub_department_ids; 
		INSERT INTO	@sub_depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT) 
		EXEC sp_xml_removedocument @hdoc
	END
	
	SET	@extra_information_header = 'Status'

	IF (@p_is_outstation = 'Yes')
		SET @extra_information = 'Outside Temporary Sewadars'
	ELSE IF (@p_is_outstation = 'No')
		SET @extra_information = 'Local Temporary Sewadars'
	ELSE
		SET @extra_information = 'Temporary Sewadars'

	DECLARE	@tbl	TABLE
		(	grno	CHAR (6)		NOT NULL	PRIMARY KEY,
			appt_dt	DATE			NOT NULL,
			info	VARCHAR (100)	NOT NULL
		)

	IF (@p_sewadar_list_id	IS NOT	NULL AND @sewadar_list_nm IS NOT NULL)					--- Restrict to Sewadar List
		INSERT INTO	generic_report_headers
				(	report_header, extra_information_header	)
			VALUES
				(	@extra_information + ' who have not returned badges (Photos taken after ' + CONVERT (VARCHAR, @p_photo_after_dt, 106) + ') as per ' + @sewadar_list_nm, @extra_information_header	)
	ELSE
		INSERT INTO	generic_report_headers
				(	report_header, extra_information_header	)
			VALUES
				(	@extra_information + ' who have not returned badges (Photos taken after ' + CONVERT (VARCHAR, @p_photo_after_dt, 106) + ')', @extra_information_header	)

	SET	@p_session_id = SCOPE_IDENTITY();

	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
		SELECT	@p_session_id, @p_satsang_centre_id, sr.sewadar_grno, sr.sewadar_status_cd
		FROM	sewadars	s
			JOIN	sewadars_registrations	sr
				ON	(	s.sewadar_id				=		sr.sewadar_id
					AND sr.satsang_centre_id		=		@p_satsang_centre_id
					AND	gender						LIKE	@p_gender
					AND	s.global_sewadar_status_cd	IS NULL
					AND	is_outstation_sewadar		LIKE	@p_is_outstation
					AND	sr.sewadar_status_cd		IN	(	'Temp', 'Perm', 'Retd'	)
					)
			JOIN	ZSM_Photos..sewadars_photos	p
				ON	(	p.sewadar_id	=	s.sewadar_id
					AND	p.photo_dt		>=	@p_photo_after_dt
					)
			JOIN	@depts
				ON	(	sr.department_id	=	id	)
			LEFT	JOIN	@sub_depts	x
				ON	(	sr.sub_department_id	=	x.id	)
		WHERE	(	(	@p_sub_department_ids	IS NOT NULL	AND	x.id	IS NOT NULL	)
				OR	(	@p_sub_department_ids	IS NULL								)
				)
		AND		NOT	EXISTS	(	SELECT	1
								FROM	generic_sewadar_lists_sewadars	l
								WHERE	l.sewadar_list_id		=	@p_sewadar_list_id
								AND		l.satsang_centre_id		=	sr.satsang_centre_id
								AND		l.sewadar_grno			=	sr.sewadar_grno
							);
END
GO


-- =============================================================================
-- Procedure GenerateSewadarsToBeMadeInactive
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateSewadarsToBeMadeInactive' AND xtype = 'P')
	DROP PROCEDURE GenerateSewadarsToBeMadeInactive
GO

CREATE PROCEDURE GenerateSewadarsToBeMadeInactive
(
	@p_satsang_centre_id 	satsang_centre_id,
	@p_satsang_centre_nm 	gnc_nm,
	@p_department_ids		report_xml_prm,
	@p_sub_department_ids	report_xml_prm,
	@p_is_outstation		VARCHAR (3),
	@p_gender				VARCHAR (6),
	@p_sewas_after_dt		DATETIME,
	@p_max_sewa_days		INTEGER,
	@p_session_id			INTEGER				OUTPUT
)
AS
	DECLARE
		@extra_information_header	report_description,
		@extra_information			report_description,
		@sewa_id					sewa_id,
		@sewa_start_dt				DATE,
		@sewa_finish_dt				DATE,
		@sewa_start_str				VARCHAR (11),
		@sewa_days					SMALLINT

BEGIN
	DECLARE	@depts		TABLE	(	id	INT	);
	DECLARE	@sub_depts	TABLE	(	id	INT	);
	DECLARE @hdoc INT;	
	
	IF (@p_department_ids IS NULL)
		INSERT INTO	@depts
			SELECT	department_id
			FROM	departments_satsang_centres
			WHERE	satsang_centre_id	=	@p_satsang_centre_id
			AND		effective_till	>	GetDate();
	ELSE
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_department_ids; 
		INSERT INTO	@depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT);
		EXEC sp_xml_removedocument @hdoc;
	END
		
	IF (@p_sub_department_ids IS NOT NULL)
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_sub_department_ids; 
		INSERT INTO	@sub_depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT) 
		EXEC sp_xml_removedocument @hdoc
	END
	
	SET	@extra_information_header = 'Status'

	IF (@p_is_outstation = 'Yes')
		SET @extra_information = 'Outside Sewadars'
	ELSE IF (@p_is_outstation = 'No')
		SET @extra_information = 'Local Sewadars'
	ELSE
		SET @extra_information = 'Sewadars'

	DECLARE	@tbl	TABLE
		(	grno	CHAR (6)		NOT NULL	PRIMARY KEY,
			status	VARCHAR (4)		NOT NULL,
			info	VARCHAR (100)	NOT NULL,
			isq		BIT				NOT NULL
		)

	INSERT INTO	@tbl
		SELECT	sr.sewadar_grno, sewadar_status_cd, SPACE (1) + CASE WHEN sewadar_status_cd = 'NI' THEN ' NI ' ELSE sewadar_status_cd END + SPACE (1), 1
		FROM	sewadars	s
			JOIN	sewadars_registrations	sr
				ON	(	s.sewadar_id				=		sr.sewadar_id
					AND sr.satsang_centre_id		=		@p_satsang_centre_id
					AND	gender						LIKE	@p_gender
					AND	s.global_sewadar_status_cd	IS NULL
					AND	is_outstation_sewadar		LIKE	@p_is_outstation
					AND	sr.sewadar_status_cd		IN	(	'Temp', 'Perm', 'NI'	)
					)
			JOIN	@depts
				ON	(	sr.department_id	=	id	)
			LEFT	JOIN	@sub_depts	x
				ON	(	sr.sub_department_id	=	x.id	)
		WHERE	(	(	@p_sub_department_ids	IS NOT NULL	AND	x.id	IS NOT NULL	)
				OR	(	@p_sub_department_ids	IS NULL								)
				);

	DECLARE	sewa_crsr	CURSOR
	FOR
		SELECT	sewa_id, start_dt, finish_dt, DATEDIFF (d, start_dt, finish_dt) + 1, CONVERT (VARCHAR (11), start_dt, 106)
		FROM	sewas
		WHERE	finish_dt				>=	@p_sewas_after_dt
		AND		is_satsang_programme	=	'Yes'
		AND		attendance_marking		=	'Team-wise'
		AND		satsang_centre_id		=	@p_satsang_centre_id
		ORDER BY start_dt;


	OPEN	sewa_crsr

	FETCH	sewa_crsr
		INTO	@sewa_id, @sewa_start_dt, @sewa_finish_dt, @sewa_days, @sewa_start_str

	WHILE (@@FETCH_STATUS = 0)
		BEGIN
			IF (dbo._ConsiderSewaForCentre (@p_satsang_centre_id, @sewa_id) = 1)
			BEGIN 
				EXEC SummariseSewa @sewa_id;

				SET @extra_information_header = @extra_information_header + SPACE(1) + SUBSTRING (@sewa_start_str, 4, 3) + SUBSTRING (@sewa_start_str, 10, 2)
				UPDATE	t
					SET	info	=	info +	CASE WHEN	s.sewadar_grno	IS NULL
												THEN	SPACE (6)
												ELSE	CASE WHEN present_cnt = 0 THEN CASE WHEN exempt_cnt = @sewa_days  THEN '  EX'
																							WHEN leave_cnt  = @sewa_days  THEN '  LV'
																							WHEN absent_cnt  = @sewa_days THEN '  AB'
																														ELSE '   0'
																					END
															WHEN present_cnt <= 10 THEN SPACE (3) + CONVERT (VARCHAR, CAST (present_cnt AS INT))
																				ELSE 	SPACE (2) + CONVERT (VARCHAR, CAST (present_cnt AS INT))
														END + SPACE (2)
											END,
						isq		=	CASE WHEN isq = 1 THEN CASE WHEN s.present_cnt + s.exempt_cnt > @p_max_sewa_days THEN 0 ELSE isq END ELSE isq END
				FROM	@tbl	t
					LEFT JOIN	sewadar_wise_sewa_summaries	s
						ON	(	s.sewa_id			=	@sewa_id
							AND	s.satsang_centre_id	=	@p_satsang_centre_id
							AND	s.sewadar_grno		=	t.grno
							);
				
				UPDATE @tbl
				SET isq = 0
				WHERE LTRIM(RTRIM(info)) = 'Perm' OR LTRIM(RTRIM(info)) = 'Temp'
				
			END
			FETCH	sewa_crsr
				INTO	@sewa_id, @sewa_start_dt, @sewa_finish_dt, @sewa_days, @sewa_start_str
		END

	CLOSE	sewa_crsr
	DEALLOCATE	sewa_crsr

	DELETE
	FROM	@tbl
	WHERE	isq = 0;

	INSERT INTO	generic_report_headers
			(	report_header, extra_information_header	)
		VALUES
			('List of ' + @extra_information + ' who may be made Inactive (Sewas after ' + CONVERT (VARCHAR (11), @p_sewas_after_dt, 106) + ')',
			  @extra_information_header
			)

	SET	@p_session_id = SCOPE_IDENTITY();

	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
		SELECT	@p_session_id,
				@p_satsang_centre_id,
				grno,
				info
		FROM	@tbl;
END
GO

-- =============================================================================
-- Procedure SummariseSubDeptSewadarsCount
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'SummariseSubDeptSewadarsCount' AND xtype = 'P')
	DROP PROCEDURE SummariseSubDeptSewadarsCount
GO

CREATE PROCEDURE SummariseSubDeptSewadarsCount
(
	@p_satsang_centre_id 	satsang_centre_id,
	@p_satsang_centre_nm 	gnc_nm,
	@p_is_outstation		VARCHAR (3),
	@p_sewadar_type			VARCHAR (20),
	@p_sewadar_list_id 		sewadar_list_id,
	@p_session_id			INTEGER				OUTPUT
)
AS
	DECLARE
		@extra_information_header	report_description,
		@extra_information			report_description,
		@sewadar_status_cd			VARCHAR (4),
		@sewadar_list_nm	 		gnc_long_nm,
		@stmt						VARCHAR (4000)

BEGIN
	SELECT	@sewadar_list_nm	=	sewadar_list_nm
	FROM	generic_sewadar_lists
	WHERE	sewadar_list_id	=	@p_sewadar_list_id;

	IF (@p_sewadar_list_id	IS NOT	NULL AND @sewadar_list_nm IS NOT NULL)					--- Restrict to Sewadar List
		INSERT INTO	generic_report_headers
				(	report_header, major_information_header )
			VALUES
				(	'Department / Sub-Department-wise Summary of ' + @p_sewadar_type + ' Sewadars as per ' + @sewadar_list_nm,
					'Department (Sub-Department)'
				)
	ELSE
		INSERT INTO	generic_report_headers
				(	report_header, major_information_header )
			VALUES
				(	'Department / Sub-Department-wise Summary of ' + @p_sewadar_type + ' Sewadars as on ' + CONVERT (VARCHAR(11), GetDate(), 106),
					'Department (Sub-Department)'
				)

	SET	@p_session_id = SCOPE_IDENTITY();
	IF (@p_sewadar_type = 'Open')
		SET @sewadar_status_cd	=	'Open';
	ELSE IF (@p_sewadar_type = 'Trainee')
		SET @sewadar_status_cd	=	'Trn';

	CREATE	TABLE	#tmp_dept_cnt
		(	department_id		SMALLINT,
			sub_department_id	SMALLINT,
			males_cnt			INTEGER,
			females_cnt			INTEGER
		)
	
	SET @p_sewadar_type = SUBSTRING (@p_sewadar_type, 1, 1);

	SET @stmt = 	'INSERT	INTO	#tmp_dept_cnt
						SELECT	COALESCE (males.department_id, females.department_id),
								COALESCE (males.sub_department_id, females.sub_department_id),
								males_count,
								females_count
						FROM	(	SELECT	department_id, sub_department_id, COUNT (*) as males_count 
									FROM	sewadars	s
										JOIN	sewadars_registrations	sr
											ON	(	s.sewadar_id				=		sr.sewadar_id
												AND sr.satsang_centre_id		=	' + CONVERT (VARCHAR, @p_satsang_centre_id) + '
												AND	gender						=		''Male''
												AND	s.global_sewadar_status_cd	IS NULL
												AND	is_outstation_sewadar		LIKE	''' + @p_is_outstation	+ ''''
	IF (@p_sewadar_type IN ('O', 'T'))			--- Open or Trainee Sewadars
		SET @stmt = @stmt	+	'				AND	sr.sewadar_status_cd		=	''' + @sewadar_status_cd + ''''
		SET @stmt = @stmt	+	'				AND	sr.sewadar_type				=	''' + @p_sewadar_type + ''''
	SET @stmt = @stmt	+				'		)	'
	IF (@p_sewadar_type = 'R')					--- Regular Sewadars
		SET @stmt = @stmt	+	'		JOIN	system_information_values	iv
											ON	(	iv.system_info_cd	=	''SttsGenUse''
												AND	iv.value_varchar	=	sewadar_status_cd
												)	'

	IF (@p_sewadar_list_id	IS NOT	NULL AND @sewadar_list_nm IS NOT NULL)					--- Restrict to Sewadar List
		SET @stmt = @stmt	+	'		JOIN	generic_sewadar_lists_sewadars	g
											ON	(	g.sewadar_grno		=	s.current_sewadar_grno
												AND g.satsang_centre_id =	s.current_satsang_centre_id
												AND g.sewadar_list_id	=	' + CONVERT (VARCHAR, @p_sewadar_list_id) + '
												)	'
	SET @stmt = @stmt	+		'	GROUP BY department_id, sub_department_id
								)	AS	males
							FULL OUTER JOIN
								(	SELECT	department_id, sub_department_id, COUNT (*) as females_count 
									FROM	sewadars	s
										JOIN	sewadars_registrations	sr
											ON	(	s.sewadar_id				=		sr.sewadar_id
												AND sr.satsang_centre_id		=	' + CONVERT (VARCHAR, @p_satsang_centre_id) + '
												AND	gender						=		''Female''
												AND	s.global_sewadar_status_cd	IS NULL
												AND	is_outstation_sewadar		LIKE	''' + @p_is_outstation	+ ''''
	IF (@p_sewadar_type IN ('O', 'T'))			--- Open or Trainee Sewadars
		SET @stmt = @stmt	+	'				AND	sr.sewadar_type				=	''' + @p_sewadar_type + ''''
	SET @stmt = @stmt	+				'		)	'
	IF (@p_sewadar_type = 'R')					--- Regular Sewadars
		SET @stmt = @stmt	+	'		JOIN	system_information_values	iv
											ON	(	iv.system_info_cd	=	''SttsGenUse''
												AND	iv.value_varchar	=	sr.sewadar_status_cd
												)	'
	IF (@p_sewadar_list_id	IS NOT	NULL AND @sewadar_list_nm IS NOT NULL)					--- Restrict to Sewadar List
		SET @stmt = @stmt	+	'		JOIN	generic_sewadar_lists_sewadars	g
											ON	(	g.sewadar_grno		=	s.current_sewadar_grno
												AND g.satsang_centre_id =	s.current_satsang_centre_id
												AND g.sewadar_list_id	=	' + CONVERT (VARCHAR, @p_sewadar_list_id) + '
												)	'
	SET @stmt = @stmt	+		'	GROUP BY department_id, sub_department_id
								)	AS	females	
								ON	(	males.department_id		=	females.department_id
									AND	males.sub_department_id	=	females.sub_department_id
									)'

	EXEC (@stmt);

	INSERT	INTO	generic_report_summaries
			(	session_id,	major_information, gents_cnt, ladies_cnt)
		SELECT	@p_session_id,
				department_nm + COALESCE (' (' + sub_department_nm + ')', ''),
				COALESCE (SUM (males_cnt), 0),
				COALESCE (SUM (females_cnt), 0)
		FROM	#tmp_dept_cnt	a
			JOIN	departments		b
				ON	(	a.department_id = b.department_id	)
			LEFT OUTER JOIN	sub_departments		c
				ON	(	a.sub_department_id	=	c.sub_department_id	)
		GROUP BY department_nm + COALESCE (' (' + sub_department_nm + ')', '')
		ORDER BY 2

	DROP	TABLE	#tmp_dept_cnt;
END
GO

-- ======================================================================================================================
-- Procedure GenerateSewaSummary
-- ======================================================================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateSewaSummary' AND xtype = 'P')
	DROP PROCEDURE GenerateSewaSummary
GO


CREATE PROCEDURE GenerateSewaSummary
(
	@p_sewa_id				sewa_id,
	@p_sewa_nm				gnc_nm,
	@p_is_exemption			Boolean,
	@p_session_id			INTEGER				OUTPUT
)
AS
	DECLARE
		@rval					INT;

BEGIN
	EXEC	@rval =	SummariseSewa	@p_sewa_id;
	IF (@rval != 0)
		RETURN @rval;

	INSERT INTO	generic_report_headers
			(	report_header, extra_information_header	)
		VALUES
			(	'Sewa Summary for '+ @p_sewa_nm, 'Sewa Days   No. of Sewadars      Total'	)

	SET	@p_session_id = SCOPE_IDENTITY();
	
	DECLARE	@tbl	TABLE	(	sr			INTEGER		IDENTITY (1, 1),
								att			NUMERIC (5,1),
								cnt			INTEGER
							)
	
	IF (@p_is_exemption = 'Yes')
		INSERT	INTO	@tbl
				(	att, cnt	)
			SELECT	COALESCE (present_cnt, 0) + COALESCE (exempt_cnt, 0), COUNT(*)
			FROM	sewadar_wise_sewa_summaries
			WHERE	sewa_id			=	@p_sewa_id
			GROUP BY COALESCE (present_cnt, 0) + COALESCE (exempt_cnt, 0)
			ORDER BY COALESCE (present_cnt, 0) + COALESCE (exempt_cnt, 0)
	ELSE
		INSERT	INTO	@tbl
				(	att, cnt	)
			SELECT	present_cnt, COUNT(*)
			FROM	sewadar_wise_sewa_summaries
			WHERE	sewa_id			=	@p_sewa_id
			GROUP BY present_cnt
			ORDER BY present_cnt
	
	INSERT	INTO	generic_report_synopsis
			(	session_id,	major_information, extra_information	)
		SELECT	@p_session_id,
				space (50) + dbo.FormatIntegerToString (a.sr, 6),
				dbo.FormatNumericToString (a.att, 6) + SPACE (4)
					+ dbo.FormatIntegerToString (a.cnt, 10) + SPACE (8)
					+ dbo.FormatIntegerToString (SUM (b.cnt), 10)
		FROM	@tbl	a
			JOIN	@tbl		b
				ON	(	a.att <= b.att	)
		GROUP BY a.sr, a.att, a.cnt
		ORDER BY 2
END
GO

-- ======================================================================================================================
-- Procedure GenerateTeamList
-- ======================================================================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateTeamList' AND xtype = 'P')
	DROP PROCEDURE GenerateTeamList
GO

CREATE PROCEDURE GenerateTeamList
(
	@p_satsang_centre_id 	satsang_centre_id,
	@p_satsang_centre_nm 	gnc_nm,
	@p_department_id		department_id,
	@p_department_nm		gnc_nm,
	@p_sub_department_id	sub_department_id,
	@p_sub_department_nm	gnc_nm,	
	@p_statuses				report_xml_prm,
	@p_district_ids			report_xml_prm,
	@p_is_outstation		VARCHAR (3),
	@p_gender				VARCHAR (6),
	@p_directly_make_team	Boolean,
	@p_sewa_id				sewa_id,
	@p_session_id			INTEGER				OUTPUT

)
AS

BEGIN

	DECLARE	@statuses	TABLE	(	stts	VARCHAR (4)	);
	DECLARE	@districts	TABLE	(	id		INT	);
	
	DECLARE
		@report_header		report_description,
		@hdoc				INT,
		@alldstt			Boolean,
		@cnt				INT,
		@sewa_team_id		sewa_team_id;	
		
	
	IF (@p_statuses IS NULL)
		INSERT INTO	@statuses
			SELECT	value_varchar
			FROM	system_information_values
			WHERE	system_info_cd	=	'SttsGenUse';
	ELSE
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_statuses; 
		INSERT INTO	@statuses
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	VARCHAR (4)) 
		EXEC sp_xml_removedocument @hdoc
	END
	
		
	IF (@p_district_ids IS NULL)
	BEGIN	
		SET @alldstt = 'Yes';
		INSERT INTO	@districts
			SELECT	district_or_city_id
			FROM	CDB..districts_or_cities;
	END		
	ELSE
	BEGIN
		SET @alldstt = 'No';
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_district_ids; 
		INSERT INTO	@districts 
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT) ;
		EXEC sp_xml_removedocument @hdoc;
	END
	
	SET @report_header = @p_department_nm + COALESCE ('(' + @p_sub_department_nm + ')', '') 
	
	IF ( @p_gender = 'Male' )
		SET @report_header = @report_header + '-G'
		
	ELSE IF ( @p_gender = 'Female' )
		SET @report_header = @report_header + '-L'
		
	IF (@p_is_outstation = 'Yes')
		SET @report_header = @report_header + '-Outside '
	ELSE IF (@p_is_outstation = 'No')
		SET @report_header = @report_header + '-Local '
	ELSE
		SET @report_header = @report_header + '-All '
		
	SELECT @report_header = @report_header + '-' + SPACE(1) + stts
	FROM  @statuses	
		JOIN	system_information_values	iv
			ON	(	iv.system_info_cd	= 'SttsActv'
				AND	iv.value_varchar	=	stts 
				AND stts NOT IN ( 'Perm', 'Temp' )
				)
	
	IF ( @alldstt = 'No' )
		SELECT @report_header = @report_header + '-' + district_nm
		FROM	@districts d
			JOIN CDB..districts_or_cities	doc
				ON	(	d.id	=  doc.district_or_city_id )

	INSERT INTO	generic_report_headers ( report_header	)
			VALUES ( @report_header )

	SET	@p_session_id = SCOPE_IDENTITY();
	
		
	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
		SELECT	@p_session_id,
				@p_satsang_centre_id,
				sr.sewadar_grno,
				''
		FROM	sewadars_registrations	sr
			JOIN	@statuses
				ON	(	sr.satsang_centre_id	=	@p_satsang_centre_id
					AND	sr.sewadar_status_cd	=	stts
					)
			JOIN	sewadars	s
				ON	(	s.sewadar_id				=		sr.sewadar_id
					AND	gender						LIKE	@p_gender
					AND	is_outstation_sewadar		LIKE	@p_is_outstation
					AND	s.global_sewadar_status_cd	IS NULL
					AND sr.department_id			=		@p_department_id
					AND	(	(	sr.sub_department_id	=		@p_sub_department_id	AND	@p_sub_department_id IS NOT NULL	)
						OR	@p_sub_department_id IS NULL
						)
					)
			/*
			JOIN	sewadars_details	sd
				ON	(	sd.sewadar_id	=	sr.sewadar_id	)
			*/
			JOIN		sewadars_addresses	 sad 
				ON  (	sad.sewadar_id = sr.sewadar_id 
					AND sad.address_type = 'Residence'
					)
			JOIN post_offices_or_cities poc 
				ON  (	poc.post_office_or_city_id = sad.post_office_or_city_id	)
			JOIN @districts
				ON  (	poc.district_id = id );

	SET @cnt = @@ROWCOUNT;

	IF (@p_directly_make_team = 'Yes' AND @p_sewa_id IS NOT NULL)
		IF (@cnt > 0)
		BEGIN
			DECLARE	@tbl	TABLE	(	id		INT			NOT NULL	IDENTITY (1, 1),
										grno	CHAR (6)	NOT NULL
									);
			INSERT INTO	@tbl
				(	grno	)
				SELECT	sr.sewadar_grno
				FROM	generic_report_details	gr
					JOIN	sewadars_registrations	sr
						ON	(	gr.sewadar_grno		=		sr.sewadar_grno
							AND gr.satsang_centre_id =		sr.satsang_centre_id
							)
					JOIN	sewadars	s
						ON	(	s.sewadar_id	=		sr.sewadar_id
							)
				WHERE	session_id = @p_session_id
				AND		NOT EXISTS	(	SELECT	1
										FROM	sewa_team_wise_sewadars	x
											JOIN	sewa_teams	y
												ON	(	x.sewa_team_id		=	y.sewa_team_id
													AND	y.sewa_id			=	@p_sewa_id
													AND	x.sewadar_grno		=	sr.sewadar_grno
													AND x.satsang_centre_id =	sr.satsang_centre_id
													)
									)
				ORDER BY s.first_nm, s.last_nm, SUBSTRING (s.middle_nm, 1, 1);	
			
			IF (@@ROWCOUNT > 0)
			BEGIN
				SET @report_header = @report_header + '(' + CONVERT (VARCHAR, @p_session_id) + ')' 
				SET @report_header = SUBSTRING (@report_header, 1, 60);			--- Sewa Team name can be a maximum of 60 characters
				
				INSERT INTO	sewa_teams 
					(	sewa_id, sewa_team_nm	)
					SELECT 	sewa_id, @report_header
					FROM sewas
					WHERE sewa_id = @p_sewa_id;
				
					SET	@sewa_team_id = SCOPE_IDENTITY();

				INSERT INTO	sewa_team_wise_sewadars
					(	sewa_team_id, serial_id, satsang_centre_id, sewadar_grno	)
					SELECT	@sewa_team_id, id, @p_satsang_centre_id, grno
					FROM	@tbl
					ORDER BY id;
			END
			ELSE
				EXEC SysAdmin..RaiseErrorMessage 'NotAffected', NULL, NULL, NULL, NULL
		END
		ELSE
			EXEC SysAdmin..RaiseErrorMessage 'NotAffected', NULL, NULL, NULL, NULL
END
GO

-- =============================================================================
-- Procedure GenerateSewaSummarySewadarList
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateSewaSummarySewadarList' AND xtype = 'P')
	DROP PROCEDURE GenerateSewaSummarySewadarList
GO


CREATE PROCEDURE GenerateSewaSummarySewadarList
(
	@p_sewa_id				sewa_id,	
	@p_min_cnt				SMALLINT,
	@p_max_cnt				SMALLINT,
	@p_department_ids		report_xml_prm,
	@p_sub_department_ids	report_xml_prm,
	@p_is_outstation		VARCHAR (3),
	@p_gender				VARCHAR (6),
	@p_is_summary			Boolean,
	@p_session_id			INTEGER				OUTPUT
)
AS
	DECLARE
		@sewa_nm					gnc_nm,
		@report_header				report_description,
		@satsang_centre_id			satsang_centre_id,
		@extra_information_header	report_description,
		@is_leave_allowed			Boolean,
		@is_exemption_allowed		Boolean,
		@attendance_marking			CHAR (9),	-- Team-wise, Arbitrary, Summary
		@rval						INT
BEGIN

	IF ( @p_max_cnt < @p_min_cnt	)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'GreaterValueReqd', NULL, 'Max count', 'Min count', NULL
			RETURN -1;
		END


	SELECT	@sewa_nm				=	sewa_nm,
			@is_leave_allowed		=	is_leave_allowed,
			@is_exemption_allowed	=	is_exemption_allowed,
			@attendance_marking		=	attendance_marking,
			@satsang_centre_id		=	satsang_centre_id
	FROM	sewas
	WHERE	sewa_id		=	@p_sewa_id

	IF (@@ROWCOUNT = 0 OR @sewa_nm IS NULL OR @sewa_nm = '')
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'NotExist', NULL, 'Sewa Information', NULL, NULL
			RETURN -2;
		END

	IF (@attendance_marking != 'Summary')
	BEGIN
		EXEC	@rval =	SummariseSewa @p_sewa_id
		IF (@rval != 0)
			RETURN @rval;
	END

	DECLARE	@depts		TABLE	(	id	INT	);
	DECLARE	@sub_depts	TABLE	(	id	INT	);
	DECLARE @hdoc INT;
	
	IF (@p_department_ids IS NULL)
		INSERT INTO	@depts
			SELECT	department_id
			FROM	departments_satsang_centres
			WHERE	satsang_centre_id	=	@satsang_centre_id
			AND		effective_till	>	GetDate();
	ELSE
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_department_ids; 
		INSERT INTO	@depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT);
		EXEC sp_xml_removedocument @hdoc;
	END
		
	IF (@p_sub_department_ids IS NOT NULL)
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_sub_department_ids; 
		INSERT INTO	@sub_depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT) 
		EXEC sp_xml_removedocument @hdoc
	END
	
	IF (@p_is_summary = 'No')
		BEGIN
			SET	@report_header = 'List of Sewadars with Sewa Summary ' + RTRIM (@sewa_nm)
			IF (@p_is_outstation = 'Yes')
				 SET	@report_header = @report_header + ' for Local Sewadars'
			ELSE IF (@p_is_outstation = 'No')
				SET	@report_header = @report_header + ' for Outstation Sewadars'
			
			SET	@extra_information_header	=	'  Present  '
			
			IF (@is_exemption_allowed = 'Yes')
				SET @extra_information_header	=	@extra_information_header + ' Exempt  '				
			
			IF (@is_leave_allowed = 'Yes')
				SET	@extra_information_header	=	@extra_information_header + ' Leave  '
				
			IF (@attendance_marking = 'Team-wise')
				SET	@extra_information_header	=	@extra_information_header + ' Absent  '
			INSERT INTO	generic_report_headers
					(	report_header, extra_information_header	)
				VALUES
					(	@report_header, @extra_information_header	)

		END
	ELSE
		BEGIN
			SET	@report_header = 'Summary of Sewadars for ' + RTRIM (@sewa_nm)
			SET	@extra_information_header	=	'Department'			
			INSERT INTO	generic_report_headers
					(	report_header, major_information_header	)
				VALUES
					(	@report_header, @extra_information_header	)
		END

	SET	@report_header = @report_header + ' with ' + CONVERT (VARCHAR, @p_min_cnt) + ' to ' + CONVERT (VARCHAR, @p_max_cnt) + ' days present'
		

				

	SET	@p_session_id = SCOPE_IDENTITY();

	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
		SELECT	@p_session_id,
				@satsang_centre_id,
				sm.sewadar_grno,
				SPACE (3)
					+ CASE	WHEN present_cnt = 0						THEN	SPACE (6)
							WHEN present_cnt BETWEEN 0.01 AND 9.99		THEN	SPACE (3) + CONVERT (CHAR(3), CONVERT (NUMERIC (3,1), present_cnt))
							WHEN present_cnt BETWEEN 10 AND 99.99		THEN	SPACE (2) + CONVERT (CHAR(4), CONVERT (NUMERIC (4,1), present_cnt))
							WHEN present_cnt BETWEEN 100 AND 999.99		THEN	SPACE (1) + CONVERT (CHAR(5), CONVERT (NUMERIC (5,1), present_cnt))
							ELSE															CONVERT (CHAR(6), CONVERT (NUMERIC (6,1), present_cnt))
					  END
					+ CASE WHEN @is_exemption_allowed = 'Yes'
						THEN	SPACE (3)
								+ CASE	WHEN COALESCE (exempt_cnt, 0) = 0			THEN	SPACE (6)
										WHEN exempt_cnt BETWEEN 0.01 AND 9.99		THEN	SPACE (3) + CONVERT (CHAR(3), CONVERT (NUMERIC (3,1), exempt_cnt))
										WHEN exempt_cnt BETWEEN 10 AND 99.99		THEN	SPACE (2) + CONVERT (CHAR(4), CONVERT (NUMERIC (4,1), exempt_cnt))
										WHEN exempt_cnt BETWEEN 100 AND 999.99		THEN	SPACE (1) + CONVERT (CHAR(5), CONVERT (NUMERIC (5,1), exempt_cnt))
										ELSE															CONVERT (CHAR(6), CONVERT (NUMERIC (6,1), exempt_cnt))
								  END
						ELSE	SPACE (0)
					  END
					+ CASE WHEN @is_leave_allowed = 'Yes'
						THEN	SPACE (2)
								+ CASE	WHEN COALESCE (leave_cnt, 0) = 0			THEN	SPACE (6)
										WHEN leave_cnt BETWEEN 0.01 AND 9.99		THEN	SPACE (3) + CONVERT (CHAR(3), CONVERT (NUMERIC (3,1), leave_cnt))
										WHEN leave_cnt BETWEEN 10 AND 99.99			THEN	SPACE (2) + CONVERT (CHAR(4), CONVERT (NUMERIC (4,1), leave_cnt))
										WHEN leave_cnt BETWEEN 100 AND 999.99		THEN	SPACE (1) + CONVERT (CHAR(5), CONVERT (NUMERIC (5,1), leave_cnt))
										ELSE															CONVERT (CHAR(6), CONVERT (NUMERIC (6,1), leave_cnt))
								  END
						ELSE	SPACE (0)
					  END
					+ SPACE (3)
					+ CASE	WHEN absent_cnt = 0							THEN	SPACE (6)
							WHEN absent_cnt BETWEEN 0.01 AND 9.99		THEN	SPACE (5) + CONVERT (CHAR(3), CONVERT (NUMERIC (3,1), absent_cnt))
							WHEN absent_cnt BETWEEN 10 AND 99.99		THEN	SPACE (4) + CONVERT (CHAR(4), CONVERT (NUMERIC (4,1), absent_cnt))
							WHEN absent_cnt BETWEEN 100 AND 999.99		THEN	SPACE (3) + CONVERT (CHAR(5), CONVERT (NUMERIC (5,1), absent_cnt))
							ELSE															CONVERT (CHAR(6), CONVERT (NUMERIC (6,1), absent_cnt))
					  END
		FROM	sewadar_wise_sewa_summaries	sm
			JOIN	sewadars_registrations	sr
				ON	(	sm.sewa_id				=			@p_sewa_id
					AND	sm.sewadar_grno			=			sr.sewadar_grno					
					AND	sm.satsang_centre_id	=			sr.satsang_centre_id					
					AND	is_outstation_sewadar	LIKE		@p_is_outstation
					AND present_cnt				BETWEEN		@p_min_cnt	AND	@p_max_cnt
					)
			JOIN sewadars s
				ON	(	s.sewadar_id		=	sr.sewadar_id
					AND	gender					LIKE	@p_gender
					)	
			JOIN	@depts
				ON	(	sr.department_id	=	id	)
			LEFT	JOIN	@sub_depts	x
				ON	(	sr.sub_department_id	=	x.id	)
			WHERE	(	@p_sub_department_ids	IS NOT NULL	AND	x.id	IS NOT NULL	)
				OR	(	@p_sub_department_ids	IS NULL					)
	IF (@p_is_summary = 'Yes')
	BEGIN
		EXEC	@rval =	SummariseSessionDeptWise	@p_session_id
		IF (@rval != 0)
			RETURN @rval;
	END
END
GO

-- =============================================================================
-- Procedure GenerateAttndncSummryBtwnRange
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateAttndncSummryBtwnRange' AND xtype = 'P')
	DROP PROCEDURE GenerateAttndncSummryBtwnRange
GO

CREATE PROCEDURE GenerateAttndncSummryBtwnRange
(
	@p_satsang_centre_id	satsang_centre_id,
	@p_department_ids		report_xml_prm,
	@p_sub_department_ids	report_xml_prm,
	@p_is_outstation		VARCHAR (3),
	@p_gender				VARCHAR (6),
	@p_sewa_id				sewa_id,
	@p_from_sewa_dt			DATETIME,
	@p_to_sewa_dt			DATETIME,
	@p_area_id				satsang_centre_id,
	@p_area_nm			 	gnc_nm,
	@p_exclude_previous_day_outstation_sewadars	boolean,
	@p_is_summary			boolean,
	@p_session_id			INTEGER				OUTPUT
)
AS
	DECLARE
		@report_header				report_description,
		@extra_information			report_description,
		@major_information			gnc_long_nm,
		@satsang_centre_id			satsang_centre_id,
		@rval						INT,
		@prev_dt					DATETIME,
		@sewa_nm					gnc_nm

BEGIN
	DECLARE	@centres	TABLE	(	id	INT	PRIMARY KEY,	typ	CHAR (1), ss_nm	VARCHAR (100)	);
	DECLARE	@depts		TABLE	(	id	INT	);
	DECLARE	@sub_depts	TABLE	(	id	INT	);
	DECLARE @hdoc INT;

	IF (@p_department_ids IS NULL)
		INSERT INTO	@depts
			SELECT	department_id
			FROM	departments_satsang_centres
			WHERE	satsang_centre_id	=	@p_satsang_centre_id
			AND		effective_till	>	GetDate();
	ELSE
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_department_ids; 
		INSERT INTO	@depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT);
		EXEC sp_xml_removedocument @hdoc;
	END
		
	IF (@p_sub_department_ids IS NOT NULL)
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_sub_department_ids; 
		INSERT INTO	@sub_depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT) 
		EXEC sp_xml_removedocument @hdoc
	END

	SELECT	@sewa_nm			=	sewa_nm,
			@satsang_centre_id	=	satsang_centre_id
	FROM	sewas
	WHERE	sewa_id = @p_sewa_id;
	
	SET	@report_header = 'Attendance for ' + @sewa_nm + ' from ' + CONVERT (VARCHAR(11),  @p_from_sewa_dt, 106) + ' to ' + CONVERT (VARCHAR(11), @p_to_sewa_dt, 106)
	IF (@p_area_id IS NOT NULL)
		SET @report_header = @report_header + ' for ' + @p_area_nm
	
	IF (@p_is_summary = 'No')
		SET	@extra_information = 'Total  Age Telephone   Satsang Centre'
	ELSE
	BEGIN
		SET	@major_information	=	'Department'
		SET	@extra_information	=	'     GENTS                          LADIES
Strength Present   %    Strength Present   %'
	END
		
	IF (@p_area_id IS NOT NULL)
	BEGIN
		INSERT INTO	@centres
			SELECT	s.satsang_centre_id, 'C', s.satsang_centre_nm
			FROM	satsang_centres_details	c
				JOIN	CDB..satsang_centres	s
					ON	(	s.satsang_centre_id	=	c.satsang_centre_id
						AND	c.reports_to_centre_id	=	@p_area_id
						);
		
		INSERT INTO	@centres
			SELECT	s.satsang_centre_id, SUBSTRING (s.satsang_centre_type, 1, 1), ss_nm + ' - ' + s.satsang_centre_nm
			FROM	@centres	p
				JOIN	satsang_centres_details	c
					ON	(	c.reports_to_centre_id	=	p.id	)
				JOIN	CDB..satsang_centres	s
					ON	(	s.satsang_centre_id	=	c.satsang_centre_id	);
	END

	INSERT INTO	generic_report_headers
			(	report_header, major_information_header, extra_information_header	)
		VALUES
			(	@report_header, @major_information, @extra_information	)

	SET	@p_session_id = SCOPE_IDENTITY();

	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
		SELECT	@p_session_id,
				a.satsang_centre_id,
				a.sewadar_grno,
				CASE	WHEN	SUM (( credit_cnt * 1.0) / unit_cnt) > 100
								THEN	CONVERT (VARCHAR(6), CONVERT (NUMERIC (12, 2), SUM ((credit_cnt * 1.0)/unit_cnt)))
						WHEN	SUM (( credit_cnt * 1.0) / unit_cnt) BETWEEN 10 AND 100
								THEN	SPACE (1) + CONVERT (VARCHAR(5), CONVERT (NUMERIC (12, 2), SUM ((credit_cnt * 1.0)/unit_cnt)))
								ELSE	SPACE (2) + CONVERT (VARCHAR(4), CONVERT (NUMERIC (12, 2), SUM ((credit_cnt * 1.0)/unit_cnt)))
				END + SPACE (2)
						+ CONVERT (CHAR (2), DATEDIFF (YEAR, birth_dtm, GetDate())) + SPACE (1)
						+ SUBSTRING (COALESCE (telephone_mobile, COALESCE (telephone_residence, '')) + SPACE (10), 1, 11) + SPACE (1)
						+ COALESCE (ss_nm, satsang_centre_nm, '')
		FROM	dbo.arbitrary_shift_presences	a
			JOIN	sewadars_registrations	sr
				ON	(	sr.sewadar_grno		=		a.sewadar_grno
					AND sr.satsang_centre_id =		a.satsang_centre_id
					AND	sr.is_outstation_sewadar	LIKE	@p_is_outstation
					)
			JOIN	sewadars	sw
				ON	(	sw.sewadar_id	=	sr.sewadar_id
					AND	sw.gender		LIKE	@p_gender
					AND	sw.global_sewadar_status_cd	IS NULL
					)
			JOIN	sewadars_details	sd
				ON	(	sd.sewadar_id	=	sw.sewadar_id	)
			LEFT JOIN	sewas_sewa_shifts  s
					ON	(	a.sewa_id		=		s.sewa_id
						AND	a.sewa_shift	=		s.sewa_shift						
						)
			LEFT JOIN	CDB..satsang_centres	sc
					ON	(	sd.weekly_satsang_centre_id	=	sc.satsang_centre_id	)
			LEFT JOIN	@centres	ss
				ON	(	sd.weekly_satsang_centre_id	=	ss.id	)
			JOIN	@depts dpt
				ON	(	sr.department_id	=	dpt.id	)
			LEFT	JOIN	@sub_depts	x
				ON	(	sr.sub_department_id	=	x.id	)
		WHERE	a.sewa_id		=		@p_sewa_id
		AND		a.presence_dt BETWEEN	@p_from_sewa_dt 	AND	@p_to_sewa_dt	
		AND		(	(	@p_area_id	IS NOT  NULL	AND	ss.id	IS NOT NULL	)
				OR	(	@p_area_id	IS NULL		)
				)
		AND		(	(	@p_sub_department_ids	IS NOT NULL	AND	x.id	IS NOT NULL	)
				OR	(	@p_sub_department_ids	IS NULL							)
				)
		GROUP BY a.sewadar_grno, a.satsang_centre_id, birth_dtm, telephone_mobile, telephone_residence, ss_nm, satsang_centre_nm;
	IF (@p_from_sewa_dt = @p_to_sewa_dt AND @p_exclude_previous_day_outstation_sewadars = 'Yes')
	BEGIN
		SET @prev_dt	=	@p_from_sewa_dt - 1;
		DELETE	d
		FROM	generic_report_details	d
			JOIN	sewadars_registrations	r
				ON	(	r.satsang_centre_id	=	d.satsang_centre_id
					AND	r.sewadar_grno		=	d.sewadar_grno
					AND	r.is_outstation_sewadar	=	'Yes'
					)
		WHERE	session_id	=	@p_session_id
		AND		EXISTS	(	SELECT	1
							FROM	arbitrary_shift_presences	a
							WHERE	a.satsang_centre_id	=	d.satsang_centre_id
							AND		a.sewadar_grno		=	d.sewadar_grno
							AND		a.presence_dt			=	@p_from_sewa_dt
						)
	END

	IF (@p_is_summary = 'Yes')
	BEGIN
		EXEC	@rval =	SynopsisSessionDeptWise	@p_session_id, @satsang_centre_id,  @p_sewa_id
		IF (@rval != 0)
			RETURN @rval;
	END
END
GO

-- =============================================================================
-- Procedure GenerateAttndncSummryBtwnRangeAreaWise
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateAttndncSummryBtwnRangeAreaWise' AND xtype = 'P')
	DROP PROCEDURE GenerateAttndncSummryBtwnRangeAreaWise
GO

CREATE PROCEDURE GenerateAttndncSummryBtwnRangeAreaWise
(
	@p_satsang_centre_id	satsang_centre_id,
	@p_department_ids		report_xml_prm,
	@p_sub_department_ids	report_xml_prm,
	@p_is_outstation		VARCHAR (3),
	@p_gender				VARCHAR (6),
	@p_sewa_id				sewa_id,
	@p_from_sewa_dt			DATETIME,
	@p_to_sewa_dt			DATETIME,
	@p_area_id				satsang_centre_id,
	@p_area_nm			 	gnc_nm,
	@p_exclude_previous_day_outstation_sewadars	boolean,
	@p_is_summary			boolean,
	@p_session_id			INTEGER				OUTPUT
)
AS
	DECLARE
		@report_header				report_description,
		@extra_information			report_description,
		@major_information			gnc_long_nm,
		@satsang_centre_id			satsang_centre_id,
		@rval						INT,
		@prev_dt					DATETIME,
		@sewa_nm					gnc_nm

BEGIN
	DECLARE	@centres	TABLE	(	id	INT	PRIMARY KEY,	typ	CHAR (1), ss_nm	VARCHAR (100)	);
	DECLARE	@depts		TABLE	(	id	INT	);
	DECLARE	@sub_depts	TABLE	(	id	INT	);
	DECLARE @hdoc INT;

	IF (@p_department_ids IS NULL)
		INSERT INTO	@depts
			SELECT	department_id
			FROM	departments_satsang_centres
			WHERE	satsang_centre_id	=	@p_satsang_centre_id
			AND		effective_till	>	GetDate();
	ELSE
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_department_ids; 
		INSERT INTO	@depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT);
		EXEC sp_xml_removedocument @hdoc;
	END
		
	IF (@p_sub_department_ids IS NOT NULL)
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_sub_department_ids; 
		INSERT INTO	@sub_depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT) 
		EXEC sp_xml_removedocument @hdoc
	END

	SELECT	@sewa_nm			=	sewa_nm,
			@satsang_centre_id	=	satsang_centre_id
	FROM	sewas
	WHERE	sewa_id = @p_sewa_id;
	
	SET	@report_header = 'Attendance for ' + @sewa_nm + ' from ' + CONVERT (VARCHAR(11),  @p_from_sewa_dt, 106) + ' to ' + CONVERT (VARCHAR(11), @p_to_sewa_dt, 106)
	IF (@p_area_id IS NOT NULL)
		SET @report_header = @report_header + ' for ' + @p_area_nm
	
	IF (@p_is_summary = 'No')
		SET	@extra_information = 'Total  Age Telephone   Satsang Centre'
	ELSE
	BEGIN
		SET	@major_information	=	'Department'
		SET	@extra_information	=	'     GENTS                          LADIES
Strength Present   %    Strength Present   %'
	END
		
	IF (@p_area_id IS NOT NULL)
	BEGIN
		INSERT INTO	@centres
			SELECT	s.satsang_centre_id, 'C', s.satsang_centre_nm
			FROM	satsang_centres_details	c
				JOIN	CDB..satsang_centres	s
					ON	(	s.satsang_centre_id	=	c.satsang_centre_id
						AND	c.reports_to_centre_id	=	@p_area_id
						);
		
		INSERT INTO	@centres
			SELECT	s.satsang_centre_id, SUBSTRING (s.satsang_centre_type, 1, 1), ss_nm + ' - ' + s.satsang_centre_nm
			FROM	@centres	p
				JOIN	satsang_centres_details	c
					ON	(	c.reports_to_centre_id	=	p.id	)
				JOIN	CDB..satsang_centres	s
					ON	(	s.satsang_centre_id	=	c.satsang_centre_id	);
	END
	ELSE
	BEGIN
		INSERT INTO	@centres
				(	id	)
			SELECT	DISTINCT	weekly_satsang_centre_id
			FROM	sewadars_registrations	r
				JOIN	sewadars_details	d
					ON	(	d.sewadar_id	=	r.sewadar_id
						AND	satsang_centre_id	=	@p_satsang_centre_id
						)
			WHERE	weekly_satsang_centre_id	IS NOT NULL;

		UPDATE	c
			SET	typ		=	SUBSTRING (sc.satsang_centre_type, 1, 1),
				ss_nm	=	CASE sc.satsang_centre_type WHEN 'C' THEN sc.satsang_centre_nm ELSE COALESCE (rc.satsang_centre_nm + ' - ', '') + sc.satsang_centre_nm END
		FROM	@centres	c
			JOIN	CDB..satsang_centres	sc
				ON	(	sc.satsang_centre_id	=	c.id	)
			JOIN	satsang_centres_details	s
				ON	(	s.satsang_centre_id	=	c.id	)
			LEFT JOIN	CDB..satsang_centres	rc
				ON	(	rc.satsang_centre_id	=	s.reports_to_centre_id	);
	END

	INSERT INTO	generic_report_headers
			(	report_header, major_information_header, extra_information_header	)
		VALUES
			(	@report_header, @major_information, @extra_information	)

	SET	@p_session_id = SCOPE_IDENTITY();

	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information,
				grouping_1,		--	Ssatsang Centre - [Sub Centre|Point]
				grouping_2		--	Gender
			)
		SELECT	@p_session_id,
				a.satsang_centre_id,
				a.sewadar_grno,
				CASE	WHEN	SUM (( credit_cnt * 1.0) / unit_cnt) > 100
								THEN	CONVERT (VARCHAR(6), CONVERT (NUMERIC (12, 2), SUM ((credit_cnt * 1.0)/unit_cnt)))
						WHEN	SUM (( credit_cnt * 1.0) / unit_cnt) BETWEEN 10 AND 100
								THEN	SPACE (1) + CONVERT (VARCHAR(5), CONVERT (NUMERIC (12, 2), SUM ((credit_cnt * 1.0)/unit_cnt)))
								ELSE	SPACE (2) + CONVERT (VARCHAR(4), CONVERT (NUMERIC (12, 2), SUM ((credit_cnt * 1.0)/unit_cnt)))
				END + SPACE (2)
						+ CONVERT (CHAR (2), DATEDIFF (YEAR, birth_dtm, GetDate())) + SPACE (1)
						+ SUBSTRING (COALESCE (telephone_mobile, COALESCE (telephone_residence, '')) + SPACE (10), 1, 11) + SPACE (1)
						+ COALESCE (ss_nm, satsang_centre_nm, ''),
				ss.ss_nm,
				sw.gender
		FROM	dbo.arbitrary_shift_presences	a
			JOIN	sewadars_registrations	sr
				ON	(	sr.sewadar_grno		=		a.sewadar_grno
					AND sr.satsang_centre_id =		a.satsang_centre_id
					AND	sr.is_outstation_sewadar	LIKE	@p_is_outstation
					)
			JOIN	sewadars	sw
				ON	(	sw.sewadar_id	=	sr.sewadar_id
					AND	sw.gender		LIKE	@p_gender
					AND	sw.global_sewadar_status_cd	IS NULL
					)
			JOIN	sewadars_details	sd
				ON	(	sd.sewadar_id	=	sw.sewadar_id	)
			LEFT JOIN	sewas_sewa_shifts  s
					ON	(	a.sewa_id		=		s.sewa_id
						AND	a.sewa_shift	=		s.sewa_shift						
						)
			LEFT JOIN	CDB..satsang_centres	sc
					ON	(	sd.weekly_satsang_centre_id	=	sc.satsang_centre_id	)
			LEFT JOIN	@centres	ss
				ON	(	sd.weekly_satsang_centre_id	=	ss.id	)
			JOIN	@depts dpt
				ON	(	sr.department_id	=	dpt.id	)
			LEFT	JOIN	@sub_depts	x
				ON	(	sr.sub_department_id	=	x.id	)
		WHERE	a.sewa_id		=		@p_sewa_id
		AND		a.presence_dt BETWEEN	@p_from_sewa_dt 	AND	@p_to_sewa_dt	
		AND		(	(	@p_area_id	IS NOT  NULL	AND	ss.id	IS NOT NULL	)
				OR	(	@p_area_id	IS NULL		)
				)
		AND		(	(	@p_sub_department_ids	IS NOT NULL	AND	x.id	IS NOT NULL	)
				OR	(	@p_sub_department_ids	IS NULL							)
				)
		GROUP BY a.sewadar_grno, a.satsang_centre_id, birth_dtm, telephone_mobile, telephone_residence, ss_nm, satsang_centre_nm, sw.gender;
	IF (@p_from_sewa_dt = @p_to_sewa_dt AND @p_exclude_previous_day_outstation_sewadars = 'Yes')
	BEGIN
		SET @prev_dt	=	@p_from_sewa_dt - 1;
		DELETE	d
		FROM	generic_report_details	d
			JOIN	sewadars_registrations	r
				ON	(	r.satsang_centre_id	=	d.satsang_centre_id
					AND	r.sewadar_grno		=	d.sewadar_grno
					AND	r.is_outstation_sewadar	=	'Yes'
					)
		WHERE	session_id	=	@p_session_id
		AND		EXISTS	(	SELECT	1
							FROM	arbitrary_shift_presences	a
							WHERE	a.satsang_centre_id	=	d.satsang_centre_id
							AND		a.sewadar_grno		=	d.sewadar_grno
							AND		a.presence_dt		=	@p_from_sewa_dt
						)
	END

	IF (@p_is_summary = 'Yes')
	BEGIN
		INSERT	INTO	generic_report_summaries
				(	session_id,	major_information, gents_cnt, ladies_cnt	)
			SELECT	@p_session_id,
					grouping_1,
					SUM (CASE WHEN grouping_2 = 'Male' THEN 1 ELSE 0 END),
					SUM (CASE WHEN grouping_2 = 'Female' THEN 1 ELSE 0 END)
			FROM	generic_report_details
			WHERE	session_id	=	@p_session_id
			GROUP BY	grouping_1
			ORDER BY 2;
	END
END
GO

-- =============================================================================
-- Procedure GenerateAttndncCompletedTillDate
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateAttndncCompletedTillDate' AND xtype = 'P')
	DROP PROCEDURE GenerateAttndncCompletedTillDate
GO

CREATE PROCEDURE GenerateAttndncCompletedTillDate
(
	@p_sewa_id				sewa_id,
	@p_to_sewa_dt			DATETIME,
	@p_is_summary			boolean,
	@p_session_id			INTEGER				OUTPUT
)
AS
	DECLARE
		@report_header				report_description,
		@extra_information			report_description,
		@satsang_centre_id			satsang_centre_id,
		@sewa_nm					gnc_nm,
		@max_sewa_duration			SMALLINT,
		@rval						INT,
		@sewa_start_dt				DATETIME
BEGIN

	SELECT	@sewa_nm			=	sewa_nm,
			@satsang_centre_id	=	satsang_centre_id,
			@sewa_start_dt		=	start_dt,
			@max_sewa_duration	=	max_sewa_duration
	FROM	sewas
	WHERE	sewa_id = @p_sewa_id;
	
	SET	@report_header = 'Attendance for ' + @sewa_nm + ' attendance ' + COALESCE (CONVERT (VARCHAR, @max_sewa_duration) + ' & above as ', '')
		 + 'on ' +  CONVERT (VARCHAR(11), @p_to_sewa_dt, 106)
	
	IF (@p_is_summary = 'No')
		SET	@extra_information = 'Total Days'
	ELSE
		SET	@extra_information	=	'Department'
		

	IF (@p_is_summary = 'No')
		INSERT INTO	generic_report_headers
				(	report_header, extra_information_header	)
			VALUES
				(	@report_header, @extra_information	)
	ELSE
		INSERT INTO	generic_report_headers
				(	report_header, major_information_header	)
			VALUES
				(	@report_header, @extra_information	)

	SET	@p_session_id = SCOPE_IDENTITY();

	INSERT INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
		SELECT @p_session_id, pr.satsang_centre_id, pr.sewadar_grno, CONVERT (VARCHAR, pr.presence_cnt + COALESCE (ex.exemption_days, 0)) 
		FROM	(	SELECT	a.satsang_centre_id, a.sewadar_grno,
							CONVERT (NUMERIC (12, 2), SUM (COALESCE((credit_cnt * 1.0)/unit_cnt, 0))) AS presence_cnt
					FROM	dbo.arbitrary_shift_presences	a
						LEFT JOIN	sewas_sewa_shifts  ss
								ON	(	a.sewa_id		=		ss.sewa_id
									AND	a.sewa_shift	=		ss.sewa_shift						
									)
					WHERE	a.sewa_id			=	@p_sewa_id
					AND		a.presence_dt BETWEEN	@sewa_start_dt 	AND		@p_to_sewa_dt
					GROUP BY a.sewadar_grno, a.satsang_centre_id
				) pr
		LEFT JOIN arbitrary_summarised_exemptions ex
			ON (	ex.sewa_id				=	@p_sewa_id
				AND	ex.satsang_centre_id	=	pr.satsang_centre_id
				AND ex.sewadar_grno			=	pr.sewadar_grno
				)
		WHERE	pr.presence_cnt + COALESCE (ex.exemption_days, 0) >= @max_sewa_duration
		AND		EXISTS	(	SELECT	1
							FROM	arbitrary_shift_presences sh
							WHERE	sh.sewa_id				=	@p_sewa_id
							AND		sh.satsang_centre_id	=	pr.satsang_centre_id
							AND		sh.sewadar_grno			=	pr.sewadar_grno
							AND		sh.presence_dt			=	@p_to_sewa_dt
						);		
	IF (@p_is_summary = 'Yes')
	BEGIN
		EXEC	@rval =	SummariseSessionDeptWise	@p_session_id
		IF (@rval != 0)
			RETURN @rval;
	END
END
GO


-- =============================================================================
-- Procedure GenerateDailyDeptWiseSummary
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateDailyDeptWiseSummary' AND xtype = 'P')
	DROP PROCEDURE GenerateDailyDeptWiseSummary
GO

CREATE PROCEDURE GenerateDailyDeptWiseSummary
(
	@p_sewa_id				sewa_id,
	@p_sewa_dt				DATETIME,
	@p_is_shift_wise		Boolean,
	@p_session_id			INTEGER				OUTPUT
)
AS
	DECLARE
		@report_header			report_description,
		@extra_information		report_description,
		@line1					report_description,
		@line2					report_description,
		@satsang_centre_id		satsang_centre_id,
		@credits				NUMERIC (6,2),
		@p_sewa_nm				gnc_nm,
		@d_id					INT,
		@d_nm					gnc_nm,
		@newline_ch				CHAR (1)
BEGIN
	DECLARE
		@tbl	TABLE	(	d_id		INT,
							d_nm		VARCHAR (60),
							shift		VARCHAR (15),
							credit_cnt	NUMERIC (5,2),
							grouping	VARCHAR (15),
							gender	VARCHAR (6),
							cnt	INT,
							ordering	NUMERIC (10,2),
							dsc	VARCHAR (100)
						)

	SET @newline_ch = '
';

	SELECT	@p_sewa_nm	=	sewa_nm,
			@satsang_centre_id		=	satsang_centre_id
	FROM	sewas
	WHERE	sewa_id		=	@p_sewa_id

	SET	@report_header = 'Daily Attendance Department-wise Summary for ' + @p_sewa_nm + ' (' + RTRIM (@p_sewa_id) + ') for ' + CONVERT (VARCHAR(11), @p_sewa_dt, 106)

	SET @line1 = ''
	SET @line2 = ''

	IF (@p_is_shift_wise = 'Yes')
		SELECT	@line1 = @line1 + CAST (sewa_shift AS CHAR(15)) + SPACE (1),
				@line2 = @line2 + '  Gents  Ladies '
		FROM	sewas_sewa_shifts
		WHERE	sewa_id	=	@p_sewa_id
		ORDER	BY	sewa_shift_sq;
	ELSE
		SELECT	@line1 = @line1 + dbo.formatnumber (CAST (CAST (x.credits AS NUMERIC (3,2)) AS VARCHAR), 10) + SPACE (6),
				@line2 = @line2 + '  Gents  Ladies '
		FROM	(	SELECT	DISTINCT	CAST (credit_cnt AS NUMERIC (3,2))/unit_cnt	AS	credits
					FROM	sewas_sewa_shifts
					WHERE	sewa_id	=	@p_sewa_id
				)	x
		ORDER BY x.credits;

	INSERT INTO	generic_report_headers
			(	report_header, major_information_header, extra_information_header	)
		VALUES
			(	@report_header, 'Department', @line1 + @newline_ch + @line2 )
	SET	@p_session_id = SCOPE_IDENTITY();

	IF (@p_is_shift_wise = 'Yes')
		INSERT	INTO	@tbl
				(	d_id, d_nm, shift, credit_cnt, grouping, gender, cnt, ordering	)
			SELECT	d.department_id, d.department_nm, a.sewa_shift, NULL, a.sewa_shift, gender, COUNT (a.sewadar_grno), sewa_shift_sq
			FROM	arbitrary_shift_presences	a
				JOIN	sewadars_registrations	sr
						ON	(	a.sewadar_grno		=	sr.sewadar_grno
							AND	a.satsang_centre_id	=	sr.satsang_centre_id
							AND	a.sewa_id			=	@p_sewa_id
							AND	a.presence_dt		=	@p_sewa_dt
							)
				JOIN	sewadars	b
					ON	(	b.sewadar_id	=	sr.sewadar_id	)
				JOIN	sewas_sewa_shifts	x
					ON	(	x.sewa_id		=	a.sewa_id
						AND	x.sewa_shift	=	a.sewa_shift
						)
				JOIN	departments	d
					ON	(	d.department_id	=	sr.department_id	)
				JOIN	departments_satsang_centres	c
					ON	(	d.department_id	=	c.department_id
						AND	c.satsang_centre_id	=	@satsang_centre_id
						)
				WHERE	GetDate()	BETWEEN	c.effective_from AND c.effective_till
				GROUP BY d.department_id, d.department_nm, a.sewa_shift, gender, sewa_shift_sq;
	ELSE
		INSERT	INTO	@tbl
				(	d_id, d_nm, shift, credit_cnt, grouping, gender, cnt, ordering	)
			SELECT	d.department_id, d.department_nm, NULL, CAST (credit_cnt AS NUMERIC (3,2))/unit_cnt, CAST (credit_cnt AS NUMERIC (3,2))/unit_cnt, gender, COUNT (a.sewadar_grno), CAST (credit_cnt AS NUMERIC (3,2))/unit_cnt
			FROM	arbitrary_shift_presences	a
				JOIN	sewadars_registrations	sr
						ON	(	a.sewadar_grno		=	sr.sewadar_grno
							AND	a.satsang_centre_id	=	sr.satsang_centre_id
							AND	a.sewa_id			=	@p_sewa_id
							AND	a.presence_dt		=	@p_sewa_dt
							)
				JOIN	sewadars	b
					ON	(	b.sewadar_id	=	sr.sewadar_id	)
				JOIN	sewas_sewa_shifts	x
					ON	(	x.sewa_id		=	a.sewa_id
						AND	x.sewa_shift	=	a.sewa_shift
						)
				JOIN	departments	d
					ON	(	d.department_id	=	sr.department_id	)
				JOIN	departments_satsang_centres	c
					ON	(	d.department_id	=	c.department_id
						AND	c.satsang_centre_id	=	@satsang_centre_id
						)
				WHERE	GetDate()	BETWEEN	c.effective_from AND c.effective_till
				GROUP BY d.department_id, d.department_nm, CAST (credit_cnt AS NUMERIC (3,2))/unit_cnt, gender;
				
	INSERT	INTO	@tbl
			(	d_id, d_nm, gender, grouping, cnt, ordering	)
		SELECT	d_id, d_nm, g.gender, o.grouping, 0, o.ordering
		FROM	(	SELECT	DISTINCT	d_id, d_nm
					FROM	@tbl
				)	d
			JOIN	(	SELECT	DISTINCT	gender
						FROM	@tbl
					)	g
				ON	(	1	=	1)
			JOIN	(	SELECT	DISTINCT	grouping, ordering
						FROM	@tbl
					)	o
				ON	(	1	=	1)
		WHERE	NOT	EXISTS	(	SELECT	1
								FROM	@tbl	t
								WHERE	t.d_id		=	d.d_id
								AND		t.gender	=	g.gender
								AND		t.grouping	=	o.grouping
								AND		t.ordering	=	o.ordering
							);

	DECLARE	crsr	CURSOR
	FOR
		SELECT	DISTINCT	d_id, d_nm
		FROM	@tbl
		ORDER BY 2

	OPEN	crsr

	FETCH	crsr
		INTO	@d_id, @d_nm

	WHILE (@@FETCH_STATUS = 0)
		BEGIN
			SET @extra_information = ''

			SELECT	@extra_information = @extra_information + '|' + dbo.FormatNumber (CAST (cnt	AS VARCHAR), 6) + '|'
			FROM	@tbl
			WHERE	d_id	=	@d_id
			ORDER BY	ordering, gender DESC;
			SET	@extra_information = REPLACE (@extra_information, '|', ' ');
			SET	@extra_information = REPLACE (@extra_information, ' 0 ', '   ');

			INSERT	INTO	generic_report_synopsis
					(	session_id,	major_information, extra_information	)
				VALUES
					(	@p_session_id, @d_nm, @extra_information	);

			FETCH	crsr
				INTO	@d_id, @d_nm
		END

	CLOSE	crsr
	DEALLOCATE	crsr

	SET @extra_information = ''

	SELECT	@extra_information = @extra_information + '|' + COALESCE (dbo.FormatNumber (CAST (SUM (cnt)	AS VARCHAR), 6), SPACE (6)) + '|',
			@line1 = ordering,			--- we need this and the next column for GROUP BY to function; otherwise there is no need for this in SELECT
			@line2 = gender
	FROM	@tbl
	GROUP BY ordering, gender
	ORDER BY ordering, gender DESC;

	SET	@extra_information = REPLACE (@extra_information, '|', ' ');

	INSERT	INTO	generic_report_synopsis
			(	session_id,	major_information, extra_information	)
		VALUES
			(	@p_session_id, 'T O T A L', @extra_information	);

END
GO

-- =============================================================================
-- Procedure GenerateCnstrctnAttndncSummary
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateCnstrctnAttndncSummary' AND xtype = 'P')
	DROP PROCEDURE GenerateCnstrctnAttndncSummary
GO

CREATE PROCEDURE GenerateCnstrctnAttndncSummary
(
	@p_sewa_id				sewa_id,
	@p_start_dt				DATETIME,
	@p_finish_dt			DATETIME,
	@p_session_id			INTEGER				OUTPUT
)
AS
	DECLARE
		@report_header				report_description,
		@p_sewa_nm					gnc_nm
		
BEGIN

	DECLARE
		@tbl	TABLE	(	dt	DATETIME,
							shift	VARCHAR (15),
							gender	VARCHAR (6),
							cnt	INT,
							shfno	INT,
							dsc	VARCHAR (100)	)

	SELECT	@p_sewa_nm	=	sewa_nm
	FROM	sewas
	WHERE	sewa_id		=	@p_sewa_id

	SET	@report_header = 'Construction Attendance Summary for ' + @p_sewa_nm + ' (' + RTRIM (@p_sewa_id) + ') from ' + CONVERT (VARCHAR(11), @p_start_dt, 106)
												+ ' to ' + CONVERT (VARCHAR(11), @p_finish_dt, 106)

	INSERT INTO	generic_report_headers
			(	report_header, major_information_header, extra_information_header	)
		VALUES
			(	@report_header, '   Date              Shift', '     Gents    Ladies       Total'	)

	SET	@p_session_id = SCOPE_IDENTITY();

	INSERT	INTO	@tbl
			(	dt, shift, gender, cnt, shfno	)
		SELECT	presence_dt, a.sewa_shift, gender, COUNT (a.sewadar_grno), sewa_shift_sq
		FROM	arbitrary_shift_presences	a
			JOIN	sewadars_registrations	sr
					ON	(	a.sewadar_grno		=	sr.sewadar_grno
						AND	a.satsang_centre_id	=	sr.satsang_centre_id
						AND	a.sewa_id			=	@p_sewa_id
						AND	a.presence_dt	BETWEEN	@p_start_dt	AND @p_finish_dt
						)
			JOIN	sewadars	b
				ON	(	b.sewadar_id	=	sr.sewadar_id	)
			JOIN	sewas_sewa_shifts	x
				ON	(	x.sewa_id		=	a.sewa_id
					AND	x.sewa_shift	=	a.sewa_shift
					)
			GROUP BY presence_dt, a.sewa_shift, gender, sewa_shift_sq
			ORDER BY presence_dt, sewa_shift_sq, gender
				
	INSERT	INTO	@tbl
			(	dt, shift, gender, cnt, shfno	)
		SELECT	dt, 'T O T A L', gender, SUM (cnt), 80000
		FROM	@tbl
		GROUP BY dt, gender;

	INSERT	INTO	@tbl
			(	dt, shift, gender, cnt, shfno	)
		SELECT	dt, '=========', gender, NULL, 90000
		FROM	@tbl
		GROUP BY dt, gender;

	UPDATE	@tbl
		SET	dsc	=	CONVERT (VARCHAR (11), dt, 106) + SPACE (7) + shift
	FROM	@tbl	y
	WHERE	EXISTS	(
		SELECT	1
		FROM	(	SELECT	DISTINCT dt, gender, MIN (shfno)	AS shfno
					FROM	@tbl
					GROUP BY	dt, gender
				)	x
		WHERE	x.dt		=	y.dt
		AND		x.shfno		=	y.shfno
		AND		x.gender	=	y.gender
					);

	UPDATE	@tbl
		SET	dsc	=	SPACE (27) + shift
	WHERE	dsc	IS NULL;

	INSERT	INTO	generic_report_synopsis
			(	session_id,	major_information, extra_information	)
		SELECT	@p_session_id,
				dsc,
				CASE WHEN shfno < 90000
					THEN	COALESCE (dbo.FormatNumber (CAST (gcnt	AS VARCHAR), 10), SPACE (10)) +
							COALESCE (dbo.FormatNumber (CAST (lcnt	AS VARCHAR), 10), SPACE (10)) +
							dbo.FormatNumber (CAST ((COALESCE (gcnt, 0) + COALESCE (lcnt, 0)) AS VARCHAR), 12)
					ELSE	REPLICATE ('=', 32)
				END
		FROM	(	SELECT	COALESCE (g.dt, l.dt) dt,
							COALESCE (g.shift, l.shift) shift,
							COALESCE (g.shfno, l.shfno) shfno,
							COALESCE (g.dsc, l.dsc) dsc,
							g.cnt AS gcnt,
							l.cnt AS lcnt
					FROM	(	(	SELECT	dt, shift, shfno, dsc, cnt
									FROM	@tbl
									WHERE	gender	=	'Male'
								)	g
								FULL JOIN	(	SELECT	dt, shift, shfno, dsc, cnt
												FROM	@tbl
												WHERE	gender	=	'Female'
											)	l
									ON	(	g.dt	=	l.dt
										AND	g.shift	=	l.shift
										)
							)
					) y
		ORDER BY dt, shfno;

END
GO

-- =============================================================================
-- Procedure GenerateDailySewaTurnOut
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateDailySewaTurnOut' AND xtype = 'P')
	DROP PROCEDURE GenerateDailySewaTurnOut
GO

CREATE PROCEDURE GenerateDailySewaTurnOut
(
	@p_sewa_id				sewa_id,
	@p_statuses				report_xml_prm,
	@p_is_outstation		VARCHAR (3),
	@p_gender				VARCHAR (6),
	@p_session_id			INTEGER				OUTPUT
)
AS
	DECLARE
		@sewa_nm					gnc_nm,
		@start_dt					SMALLDATETIME,
		@finish_dt					SMALLDATETIME,
		@sewa_frequency				CHAR (9),	-- Daily, Weekly, Monthly, Arbitrary
		@attendance_unit			CHAR (8),	-- Day, Hours, Duration
		@attendance_marking			CHAR (9),	-- Team-wise, Arbitrary, Summary
		@dt							SMALLDATETIME,
		@dept_id					department_id,
		@sub_dept_id				department_id,
		@tmp_dt						SMALLDATETIME,
		@tmp_dept_id				department_id,
		@tmp_sub_dept_id			department_id,
		@extra_information_header	report_description,
		@extra_information			report_description,
		@prsnt_information			report_description,
		@report_header				report_description,
		@sewadar_cnt				SMALLINT,
		@cnt						SMALLINT

BEGIN

	DECLARE	@statuses	TABLE	(	stts	VARCHAR (4)	);
	DECLARE @hdoc INT;
	
	IF (@p_statuses IS NULL)
		INSERT INTO	@statuses
			SELECT	sewadar_status_cd
			FROM	sewadar_status
			WHERE	effective_till	>	GetDate();
	ELSE
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_statuses; 
		INSERT INTO	@statuses
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	VARCHAR (4)) 
		EXEC sp_xml_removedocument @hdoc
	END
	
	
	SELECT	@sewa_nm				=	sewa_nm,
			@start_dt				=	start_dt,
			@finish_dt				=	finish_dt,
			@sewa_frequency			=	sewa_frequency,
			@attendance_unit		=	attendance_unit,
			@attendance_marking		=	attendance_marking
	FROM	sewas
	WHERE	sewa_id		=	@p_sewa_id

	
	IF (@@ROWCOUNT = 0 OR @sewa_nm IS NULL OR @sewa_nm = '')
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'NotExist', NULL, 'Sewa information', NULL, NULL
			RETURN -1;
		END
		
		
	IF (@sewa_frequency != 'Daily')
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'InvalidValue', NULL, 'Sewa Frequency', 'Sewa', NULL
			RETURN -2;
		END

	IF (@attendance_unit != 'Day')
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'InvalidValue', NULL, 'Attendance Unit', 'Sewa', NULL
			RETURN -3;
		END

	IF (@attendance_marking = 'Summary')
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'InvalidValue', NULL, 'Attendance Marking', 'Sewa', NULL
			RETURN -4;
		END	
	

	SET	@tmp_dt	=	@start_dt
	SET @report_header = 'Daily Turnout from ' + CONVERT (VARCHAR(11), @start_dt, 106)
								+ ' to ' + CONVERT (VARCHAR(11), @finish_dt, 106)
	
	IF (@p_is_outstation = 'Yes')
		SET @report_header = @report_header + ' (Outside Sewadars) for ' + RTRIM (@sewa_nm)
	ELSE IF (@p_is_outstation = 'No')
		SET @report_header = @report_header + ' (Local  Sewadars) for ' + RTRIM (@sewa_nm)
	

	SET	@extra_information_header = SPACE (0)

	
	CREATE TABLE	#sewa_total_turnout
		(
			dt			SMALLDATETIME	NOT NULL	PRIMARY KEY,
			sewadar_cnt	SMALLINT		NOT NULL	default 0
		)

	WHILE (@tmp_dt <= @finish_dt)
		BEGIN
			SET	@extra_information_header = @extra_information_header
											+ SPACE (2)
											+ SUBSTRING (CONVERT (CHAR (11), @tmp_dt, 121), 9, 2)
											+ SPACE (2)
			INSERT INTO	#sewa_total_turnout
				VALUES	(@tmp_dt, 0)

			SET @tmp_dt = @tmp_dt + 1
		END

	INSERT INTO	generic_report_headers
			(	report_header, extra_information_header	)
		VALUES
			(	@report_header, @extra_information_header	)

	SET	@p_session_id = SCOPE_IDENTITY();

	IF (@attendance_marking = 'Arbitrary')
		BEGIN
			DECLARE	attendance_crsr	CURSOR
			FOR
				SELECT	department_id,
						sub_department_id,
						presence_dt			AS	dt,
						COUNT (*)			AS	cnt
				FROM	arbitrary_daily_presences	a
					JOIN	sewadars_registrations	sr
						ON	(	sr.sewadar_grno				=	a.sewadar_grno
							AND	sr.is_outstation_sewadar	LIKE	@p_is_outstation
							)
					JOIN	sewadars	s
						ON	(	s.sewadar_id				=		sr.sewadar_id
							AND	gender						LIKE	@p_gender
							AND	s.global_sewadar_status_cd	IS NULL
							)
					JOIN	@statuses
						ON	(	sr.sewadar_status_cd	=	stts	)
				WHERE	a.sewa_id	= @p_sewa_id
				GROUP BY department_id, sub_department_id, presence_dt
				ORDER BY 1, 2, 3
		END
	ELSE IF (@attendance_marking = 'Team-wise')
		BEGIN
			DECLARE	attendance_crsr	CURSOR
			FOR
				SELECT	e.department_id,
						e.sub_department_id,
						d.attendance_dt		AS	dt,
						COUNT (*)			AS	cnt
				FROM	sewa_teams				b
				JOIN	sewa_team_wise_sewadars	c
							ON	(	b.sewa_id		=	@p_sewa_id
								AND	c.sewa_team_id	=	b.sewa_team_id
								)
				JOIN	team_wise_daily_attendance	d
							ON	(	d.sewa_team_id	=	c.sewa_team_id
								AND	d.serial_id		=	c.serial_id
								AND	d.attendance	=	'P'
								)
				JOIN	sewadars_registrations	e
						ON	(	c.sewadar_grno			=	e.sewadar_grno
							AND	c.satsang_centre_id		=	e.satsang_centre_id
							AND	e.is_outstation_sewadar	LIKE	@p_is_outstation
							)
				JOIN	sewadars	s
					ON	(	s.sewadar_id				=		e.sewadar_id
						AND	gender						LIKE	@p_gender
						AND	s.global_sewadar_status_cd	IS NULL
						)
				JOIN	@statuses
						ON	(	e.sewadar_status_cd	=	stts	)
								
				GROUP BY e.department_id, e.sub_department_id, d.attendance_dt
				ORDER BY 1, 2, 3
		END


	OPEN	attendance_crsr

	CREATE TABLE	#sewa_turnout
		(
			department_id		CHAR (5)		NOT NULL,
			sub_department_id	CHAR (5)		NULL,
			extra_information	VARCHAR (200)	NULL
		)
			
	SET	@dept_id		=	SPACE(0)
	SET	@tmp_dept_id	=	SPACE(0)
	SET	@dt				=	@start_dt - 1

	FETCH	attendance_crsr	INTO
			@tmp_dept_id,
			@tmp_sub_dept_id,
			@tmp_dt,
			@sewadar_cnt

	WHILE (@@FETCH_STATUS = 0)
		BEGIN
			IF (@dept_id <> @tmp_dept_id OR @sub_dept_id <> @tmp_sub_dept_id
					OR ((@tmp_sub_dept_id IS NULL OR @tmp_sub_dept_id = '') AND @sub_dept_id IS NOT NULL)
					OR ((@sub_dept_id IS NULL OR @sub_dept_id = '') AND @tmp_sub_dept_id IS NOT NULL))
				BEGIN
					IF (@dept_id <> SPACE(0))
						BEGIN
							INSERT	INTO	#sewa_turnout
								VALUES
									(@dept_id, @sub_dept_id, @extra_information)
						END
					SET	@extra_information	=	SPACE (0)
					SET	@dept_id		=	@tmp_dept_id
					SET	@sub_dept_id	=	@tmp_sub_dept_id
					SET	@dt	=	@start_dt - 1
				END
			SET	@cnt	=	DATEDIFF (DD, @dt, @tmp_dt)
			WHILE (@cnt > 1)
				BEGIN
					SET	@cnt = @cnt - 1
					SET	@extra_information	=	@extra_information + SPACE (6)
				END
			SET	@extra_information	=	@extra_information
					+ CASE	WHEN @sewadar_cnt <= 0					THEN	SPACE (5)
							WHEN @sewadar_cnt BETWEEN 1 AND 9		THEN	SPACE (4) + CONVERT (CHAR(1), @sewadar_cnt)
							WHEN @sewadar_cnt BETWEEN 10 AND 99		THEN	SPACE (3) + CONVERT (CHAR(2), @sewadar_cnt)
							WHEN @sewadar_cnt BETWEEN 100 AND 999	THEN	SPACE (2) + CONVERT (CHAR(3), @sewadar_cnt)
							WHEN @sewadar_cnt BETWEEN 1000 AND 9999	THEN	SPACE (1) + CONVERT (CHAR(4), @sewadar_cnt)
							ELSE														CONVERT (Char(5), @sewadar_cnt)
					  END
					+ SPACE (1)

			UPDATE	#sewa_total_turnout
				SET	sewadar_cnt	=	sewadar_cnt + @sewadar_cnt
			WHERE	dt	=	@tmp_dt

			SET	@dt	=	@tmp_dt

			FETCH	attendance_crsr	INTO
					@tmp_dept_id,
					@tmp_sub_dept_id,
					@tmp_dt,
					@sewadar_cnt
		END

	IF (@dept_id <> SPACE(0))
		BEGIN
			INSERT	INTO	#sewa_turnout
				VALUES
					(@dept_id, @sub_dept_id, @extra_information)
		END

	CLOSE	attendance_crsr
	DEALLOCATE	attendance_crsr

	INSERT	INTO	generic_report_synopsis
			(session_id, major_information, extra_information)
		SELECT	@p_session_id,
				RTRIM (b.department_nm) + COALESCE(' (' + c.sub_department_nm + ')', ''),
				extra_information
		FROM	#sewa_turnout			a
		JOIN	departments				b
					ON	(a.department_id	=	b.department_id
						)
		LEFT OUTER JOIN	sub_departments	c
					ON	(	a.department_id		=	c.department_id
						AND	a.sub_department_id	=	c.sub_department_id
						)
		ORDER BY	RTRIM (b.department_nm) + COALESCE(' (' + c.sub_department_nm + ')', '')

	SET	@extra_information	=	SPACE (0)

	DECLARE	total_crsr	CURSOR
	FOR
		SELECT	dt,
				sewadar_cnt
		FROM	#sewa_total_turnout
		ORDER BY 1
	
	OPEN	total_crsr

	SET	@dt				=	@start_dt - 1

	FETCH	total_crsr
		INTO	@tmp_dt, @sewadar_cnt
	
	WHILE (@@FETCH_STATUS = 0)
		BEGIN
			SET	@cnt	=	DATEDIFF (DD, @dt, @tmp_dt)
			WHILE (@cnt > 1)
				BEGIN
					SET	@cnt = @cnt - 1
					SET	@extra_information	=	@extra_information + SPACE (6)
				END

			SET	@extra_information	=	@extra_information
					+ CASE	WHEN @sewadar_cnt <= 0					THEN	SPACE (5)
							WHEN @sewadar_cnt BETWEEN 1 AND 9		THEN	SPACE (4) + CONVERT (CHAR(1), @sewadar_cnt)
							WHEN @sewadar_cnt BETWEEN 10 AND 99		THEN	SPACE (3) + CONVERT (CHAR(2), @sewadar_cnt)
							WHEN @sewadar_cnt BETWEEN 100 AND 999	THEN	SPACE (2) + CONVERT (CHAR(3), @sewadar_cnt)
							WHEN @sewadar_cnt BETWEEN 1000 AND 9999	THEN	SPACE (1) + CONVERT (CHAR(4), @sewadar_cnt)
							ELSE														CONVERT (CHAR(5), @sewadar_cnt)
					  END
					+ SPACE (1)

			SET	@dt	=	@tmp_dt

			FETCH	total_crsr
				INTO	@tmp_dt, @sewadar_cnt
		END
	
	CLOSE	total_crsr

	DEALLOCATE	total_crsr

	INSERT	INTO	generic_report_synopsis
			(session_id, major_information, extra_information)
		VALUES
			(@p_session_id, '                 T  O  T  A  L', @extra_information)


END
GO

-- =============================================================================
-- Procedure SummariseDeptSewadarsCount
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'SummariseDeptSewadarsCount' AND xtype = 'P')
	DROP PROCEDURE SummariseDeptSewadarsCount
GO

CREATE PROCEDURE SummariseDeptSewadarsCount
(
	@p_satsang_centre_id		satsang_centre_id,
	@p_is_outstation			VARCHAR (3),
	@p_sewadar_list_id 			sewadar_list_id,
	@p_session_id				INTEGER				OUTPUT
)
AS
	DECLARE
		@extra_information_header	report_description,
		@report_header				report_description,
		@extra_information			report_description,
		@sewadar_list_nm	 		gnc_long_nm;

BEGIN
	SELECT	@sewadar_list_nm	=	sewadar_list_nm
	FROM	generic_sewadar_lists
	WHERE	sewadar_list_id	=	@p_sewadar_list_id;

	SET @report_header = 'Department-wise Summary of '
	IF (@p_is_outstation = 'Yes')
		SET @report_header = @report_header + 'Outside '
	ELSE IF (@p_is_outstation = 'No')
		SET @report_header = @report_header + 'Local '

	IF (@p_sewadar_list_id	IS NOT	NULL AND @sewadar_list_nm IS NOT NULL)					--- Restrict to Sewadar List
		SET @report_header = @report_header + 'Sewadars as per ' + @sewadar_list_nm
	ELSE
		SET @report_header = @report_header + 'Sewadars as on ' + CONVERT (VARCHAR(11), GetDate(), 106)

	INSERT INTO	generic_report_headers
			(	report_header, major_information_header	)
		VALUES
			(	@report_header, 'Department'	)

	SET	@p_session_id = SCOPE_IDENTITY();

	SELECT	department_id, COUNT (sr.sewadar_grno) as males 
		INTO	#tmp_gents
	FROM	sewadars s
		JOIN	sewadars_registrations sr
			ON	(	s.sewadar_id				=		sr.sewadar_id
				AND is_outstation_sewadar		LIKE	@p_is_outstation
				AND	sr.satsang_centre_id		=	@p_satsang_centre_id
				AND	s.global_sewadar_status_cd	IS NULL
			)	
		JOIN	system_information_values	iv
				ON	(	iv.system_info_cd	=	'SttsGenUse'
					AND	iv.value_varchar	=	sewadar_status_cd
					)
		LEFT JOIN	generic_sewadar_lists_sewadars	g
			ON	(	g.sewadar_grno		=	sr.sewadar_grno
				AND g.satsang_centre_id =	sr.satsang_centre_id
				AND g.sewadar_list_id	=	@p_sewadar_list_id
				)
	WHERE	gender		=	'Male'
	AND		(	@p_sewadar_list_id	IS		NULL
			OR	g.sewadar_grno		IS	NOT	NULL
			)
	GROUP BY department_id

	
	SELECT	department_id, COUNT (sr.sewadar_grno) as females 
		INTO	#tmp_ladies
	FROM	sewadars s
		JOIN	sewadars_registrations sr
			ON	(	s.sewadar_id				=		sr.sewadar_id
				AND is_outstation_sewadar		LIKE	@p_is_outstation
				AND	sr.satsang_centre_id		=	@p_satsang_centre_id
				AND	s.global_sewadar_status_cd		IS NULL
				)	
		JOIN	system_information_values	iv
			ON	(	iv.system_info_cd	=	'SttsGenUse'
				AND	iv.value_varchar	=	sewadar_status_cd
				)
		LEFT JOIN	generic_sewadar_lists_sewadars	g
			ON	(	g.sewadar_grno		=	sr.sewadar_grno
				AND g.satsang_centre_id =	sr.satsang_centre_id
				AND g.sewadar_list_id	=	@p_sewadar_list_id
				)
	WHERE	gender						=	'Female'
	AND		(	@p_sewadar_list_id	IS		NULL
			OR	g.sewadar_grno		IS	NOT	NULL
			)
	GROUP BY department_id

	
	INSERT	INTO	generic_report_summaries
			(	session_id,	major_information, gents_cnt, ladies_cnt)
		SELECT	@p_session_id,
				department_nm,
				COALESCE (males, 0),
				COALESCE (females, 0)
		FROM	#tmp_gents			a
		FULL OUTER JOIN	#tmp_ladies	b
					ON	(a.department_id = b.department_id)
		JOIN	departments		c
					ON	(COALESCE (a.department_id, b.department_id) = c.department_id)
		ORDER BY 2


END
GO

-- =============================================================================
-- Procedure GenerateSewadarsEligiblesList
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateSewadarsEligiblesList' AND xtype = 'P')
	DROP PROCEDURE GenerateSewadarsEligiblesList
GO

CREATE PROCEDURE GenerateSewadarsEligiblesList
(
	@p_credit_specification_id	credit_specification_id,
	@p_department_ids			report_xml_prm,
	@p_sub_department_ids		report_xml_prm,
	@p_gender					VARCHAR (6),
	@p_attribute_id				attribute_id,
	@p_attribute_nm				gnc_nm,
	@p_is_summary				Boolean,
	@p_session_id				INTEGER				OUTPUT
)
AS
	DECLARE
		@credit_specification_nm	gnc_nm,
		@report_header				report_description,
		@rval						INT,
		@extra_information			report_description
BEGIN

	DECLARE	@depts		TABLE	(	id	INT	);
	DECLARE	@sub_depts	TABLE	(	id	INT	);
	DECLARE @hdoc INT;
	
	IF (@p_department_ids IS NULL)
		INSERT INTO	@depts
			SELECT	department_id
			FROM	departments_satsang_centres
			WHERE	satsang_centre_id	=	( SELECT satsang_centre_id FROM credit_specifications WHERE credit_specification_id = @p_credit_specification_id )
			AND		effective_till	>	GetDate();
	ELSE
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_department_ids; 
		INSERT INTO	@depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT);
		EXEC sp_xml_removedocument @hdoc;
	END
		
	IF (@p_sub_department_ids IS NOT NULL)
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_sub_department_ids; 
		INSERT INTO	@sub_depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT) 
		EXEC sp_xml_removedocument @hdoc
	END
	
	
	SELECT	@credit_specification_nm	=	credit_specification_nm
	FROM	credit_specifications
	WHERE	credit_specification_id		=	@p_credit_specification_id
	
	IF (@@ROWCOUNT = 0 OR @credit_specification_nm = '')
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'NotExist', NULL, 'Credit Information', NULL, NULL
			RETURN -1;
		END

	EXEC	@rval =	ComputeCredits @p_credit_specification_id
	IF (@rval != 0)
		RETURN @rval;

	IF (@p_is_summary = 'No')
		BEGIN
			SET	@report_header = 'List of Sewadars eligible for ' + RTRIM (@credit_specification_nm)
			SET	@extra_information	=	' '
		END
	ELSE
		BEGIN
			SET	@report_header = 'Summary of Sewadars eligible for ' + RTRIM (@credit_specification_nm)
			SET	@extra_information	=	'Department'
		END

	IF (@p_attribute_id != NULL AND @p_attribute_id !=  '')
		SET	@report_header = @report_header + ' (Attribute: ' + @p_attribute_nm + ')'

	IF (@p_is_summary = 'No')
		INSERT INTO	generic_report_headers
				(	report_header, extra_information_header	)
			VALUES
				(	@report_header, @extra_information	)
	ELSE
		INSERT INTO	generic_report_headers
				(	report_header, major_information_header	)
			VALUES
				(	@report_header, @extra_information	)

	SET	@p_session_id = SCOPE_IDENTITY();

	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
		SELECT	@p_session_id,
				cs.satsang_centre_id,
				cs.sewadar_grno,
				' '							---- We do not want to print any additional information
		FROM	credit_specifications_sewadars	cs
			JOIN	sewadars_registrations	sr
				ON	(	cs.credit_specification_id	=	@p_credit_specification_id
					AND	cs.sewadar_grno				=	sr.sewadar_grno
					AND	cs.satsang_centre_id		=	sr.satsang_centre_id
					)
			JOIN	system_information_values	iv
				ON	(	iv.system_info_cd		=		'SttsGenUse'
					AND	iv.value_varchar		=		sewadar_status_cd
					)
			JOIN	sewadars	s
				ON	(	s.sewadar_id				=		sr.sewadar_id
					AND	gender						LIKE	@p_gender
					AND	s.global_sewadar_status_cd	IS NULL
					)
			JOIN	@depts
				ON	(	sr.department_id	=	id	)
			LEFT	JOIN	@sub_depts	x
				ON	(	sr.sub_department_id	=	x.id	)
			WHERE	(	@p_sub_department_ids	IS NOT NULL	AND	x.id	IS NOT NULL	)
				OR	(	@p_sub_department_ids	IS NULL					)
	IF (@p_attribute_id != NULL AND @p_attribute_id !=  '')
		DELETE
		FROM	generic_report_details
		FROM	generic_report_details d
		WHERE	session_id = @p_session_id
		AND		NOT EXISTS 	(	SELECT 1
								FROM	sewadars_attributes s
								WHERE	s.sewadar_grno = d.sewadar_grno
								AND		s.attribute_id	=	@p_attribute_id
							)
	IF (@p_is_summary = 'Yes')
	BEGIN
		EXEC	@rval =	SummariseSessionDeptWise	@p_session_id
		IF (@rval != 0)
			RETURN @rval;
	END
	ELSE
	BEGIN
		EXEC	@rval =	MakeListReport	@p_session_id
		IF (@rval != 0)
			RETURN @rval;
	END
END
GO

-- =============================================================================
-- Procedure GenerateSewadarsEligiblesListNew 									-- Temporary. Will be removed LATER
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateSewadarsEligiblesListNew' AND xtype = 'P')
	DROP PROCEDURE GenerateSewadarsEligiblesListNew
GO

CREATE PROCEDURE GenerateSewadarsEligiblesListNew
(
	@p_credit_specification_id	credit_specification_id,
	@p_department_ids			report_xml_prm,
	@p_sub_department_ids		report_xml_prm,
	@p_gender					VARCHAR (6),
	@p_attribute_id				attribute_id,
	@p_attribute_nm				gnc_nm,
	@p_is_summary				Boolean,
	@p_session_id				INTEGER				OUTPUT
)
AS
	DECLARE
		@credit_specification_nm	gnc_nm,
		@report_header				report_description,
		@rval						INT,
		@extra_information			report_description
BEGIN

	DECLARE	@depts		TABLE	(	id	INT	);
	DECLARE	@sub_depts	TABLE	(	id	INT	);
	DECLARE @hdoc INT;
	
	IF (@p_department_ids IS NULL)
		INSERT INTO	@depts
			SELECT	department_id
			FROM	departments_satsang_centres
			WHERE	satsang_centre_id	=	( SELECT satsang_centre_id FROM credit_specifications WHERE credit_specification_id = @p_credit_specification_id )
			AND		effective_till	>	GetDate();
	ELSE
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_department_ids; 
		INSERT INTO	@depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT);
		EXEC sp_xml_removedocument @hdoc;
	END
		
	IF (@p_sub_department_ids IS NOT NULL)
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_sub_department_ids; 
		INSERT INTO	@sub_depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT) 
		EXEC sp_xml_removedocument @hdoc
	END
	
	
	SELECT	@credit_specification_nm	=	credit_specification_nm
	FROM	credit_specifications
	WHERE	credit_specification_id		=	@p_credit_specification_id
	
	IF (@@ROWCOUNT = 0 OR @credit_specification_nm = '')
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'NotExist', NULL, 'Credit Information', NULL, NULL
			RETURN -1;
		END

	EXEC	@rval =	ComputeCreditsNew @p_credit_specification_id
	IF (@rval != 0)
		RETURN @rval;

	IF (@p_is_summary = 'No')
		BEGIN
			SET	@report_header = 'List of Sewadars eligible for ' + RTRIM (@credit_specification_nm)
			SET	@extra_information	=	' '
		END
	ELSE
		BEGIN
			SET	@report_header = 'Summary of Sewadars eligible for ' + RTRIM (@credit_specification_nm)
			SET	@extra_information	=	'Department'
		END

	IF (@p_attribute_id != NULL AND @p_attribute_id !=  '')
		SET	@report_header = @report_header + ' (Attribute: ' + @p_attribute_nm + ')'

	IF (@p_is_summary = 'No')
		INSERT INTO	generic_report_headers
				(	report_header, extra_information_header	)
			VALUES
				(	@report_header, @extra_information	)
	ELSE
		INSERT INTO	generic_report_headers
				(	report_header, major_information_header	)
			VALUES
				(	@report_header, @extra_information	)

	SET	@p_session_id = SCOPE_IDENTITY();

	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
		SELECT	@p_session_id,
				cs.satsang_centre_id,
				cs.sewadar_grno,
				' '							---- We do not want to print any additional information
		FROM	credit_specifications_sewadars	cs
			JOIN	sewadars_registrations	sr
				ON	(	cs.credit_specification_id	=	@p_credit_specification_id
					AND	cs.sewadar_grno				=	sr.sewadar_grno
					AND	cs.satsang_centre_id		=	sr.satsang_centre_id
					)
			JOIN	system_information_values	iv
				ON	(	iv.system_info_cd		=		'SttsGenUse'
					AND	iv.value_varchar		=		sewadar_status_cd
					)
			JOIN	sewadars	s
				ON	(	s.sewadar_id				=		sr.sewadar_id
					AND	gender						LIKE	@p_gender
					AND	s.global_sewadar_status_cd	IS NULL
					)
			JOIN	@depts
				ON	(	sr.department_id	=	id	)
			LEFT	JOIN	@sub_depts	x
				ON	(	sr.sub_department_id	=	x.id	)
			WHERE	(	@p_sub_department_ids	IS NOT NULL	AND	x.id	IS NOT NULL	)
				OR	(	@p_sub_department_ids	IS NULL					)
	IF (@p_attribute_id != NULL AND @p_attribute_id !=  '')
		DELETE
		FROM	generic_report_details
		FROM	generic_report_details d
		WHERE	session_id = @p_session_id
		AND		NOT EXISTS 	(	SELECT 1
								FROM	sewadars_attributes s
								WHERE	s.sewadar_grno = d.sewadar_grno
								AND		s.attribute_id	=	@p_attribute_id
							)
	IF (@p_is_summary = 'Yes')
	BEGIN
		EXEC	@rval =	SummariseSessionDeptWise	@p_session_id
		IF (@rval != 0)
			RETURN @rval;
	END
	ELSE
	BEGIN
		EXEC	@rval =	MakeListReport	@p_session_id
		IF (@rval != 0)
			RETURN @rval;
	END
END
GO

-- =============================================================================
-- Procedure GenerateUnallocatedSewadars
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateUnallocatedSewadars' AND xtype = 'P')
	DROP PROCEDURE GenerateUnallocatedSewadars
GO

CREATE PROCEDURE GenerateUnallocatedSewadars
(
	@p_sewa_id					sewa_id,
	@p_department_ids			report_xml_prm,
	@p_gender					VARCHAR (6),
	@p_is_summary				Boolean,
	@p_session_id				INTEGER				OUTPUT
)
AS
	DECLARE
		@sewa_nm					gnc_nm,
		@attendance_marking			VARCHAR (10),	-- Team-wise, Arbitrary, Summary
		@sewadar_grno				sewadar_grno,
		@satsang_centre_id			satsang_centre_id,
		@extra_information_header	report_description,
		@extra_information			report_description,
		@report_header				report_description,
		@status						sewadar_status_cd,
		@rval						INT,
		@cnt						SMALLINT

	DECLARE	@tab_sewa_team_sewadars	TABLE	(
			satsang_centre_id	INT,
			sewadar_grno		CHAR (6)
		)

BEGIN

	SELECT	@sewa_nm				=	sewa_nm,
			@attendance_marking		=	attendance_marking,
			@satsang_centre_id		=	satsang_centre_id
	FROM	sewas
	WHERE	sewa_id		=	@p_sewa_id

	IF (@@ROWCOUNT = 0 OR @sewa_nm IS NULL OR @sewa_nm = '')
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'NotExist', NULL, 'Sewa Information', NULL, NULL
			RETURN -1;
		END
	
	IF (@attendance_marking != 'Team-wise')
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'InvalidValue', NULL, 'Attendance Marking', 'Sewa', NULL
			RETURN -2;
		END
	
	DECLARE	@depts		TABLE	(	id	INT	);
	DECLARE @hdoc INT;
	
	IF (@p_department_ids IS NULL)
		SET @extra_information = ' for All Departments'
	ELSE
		SET @extra_information = ''

	IF (@p_department_ids IS NULL)
		INSERT INTO	@depts
			SELECT	department_id
			FROM	departments_satsang_centres
			WHERE	satsang_centre_id	=	@satsang_centre_id
			AND		effective_till	>	GetDate();
	ELSE
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_department_ids; 
		INSERT INTO	@depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT);
		EXEC sp_xml_removedocument @hdoc;
	END
		
			
	IF (@p_is_summary = 'No')
		BEGIN
			SET	@report_header = 'Unallocated Sewadars List for ' + RTRIM (@sewa_nm)
			SET	@extra_information_header = 'Age   YOA  Status Telephone'
			INSERT INTO	generic_report_headers
					(	report_header, extra_information_header	)
				VALUES
					(	@report_header + ' for ' + @extra_information, @extra_information_header	)
		END
	ELSE
		BEGIN
			SET	@report_header = 'Unallocated Sewadars Summary for ' + RTRIM (@sewa_nm)
			SET	@extra_information_header = 'Department'
			INSERT INTO	generic_report_headers
					(	report_header, major_information_header	)
				VALUES
					(	@report_header + ' for ' + @extra_information, @extra_information_header	)
		END


	SET	@p_session_id = SCOPE_IDENTITY();

	INSERT	INTO	@tab_sewa_team_sewadars	(satsang_centre_id, sewadar_grno)
		SELECT	b.satsang_centre_id, b.sewadar_grno
		FROM	sewa_teams				a
		JOIN	sewa_team_wise_sewadars	b
					ON	(	a.sewa_id		=	@p_sewa_id
						AND	a.sewa_team_id	=	b.sewa_team_id
						AND	b.transfer_out_dt	IS	NULL
						)

	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
		SELECT	@p_session_id,
				@satsang_centre_id,
				sewadar_grno,
				space (1)
	/*
						+ CONVERT (CHAR (2), DATEDIFF (YEAR, birth_dtm, GetDate())) + SPACE (2)
						+ CONVERT (CHAR(4), DATEPART (YY, appointment_dt)) + SPACE (2)
						+ sr.sewadar_status_cd + '.  '
						+ COALESCE (sd.telephone_mobile, sd.telephone_residence, SPACE(0))
						*/
		FROM	sewadars_registrations	sr
			JOIN	system_information_values	iv
				ON	(	iv.system_info_cd		=		'SttsGenUse'
					AND	iv.value_varchar		=		sewadar_status_cd
					AND sr.satsang_centre_id	=		@satsang_centre_id
					)
			JOIN	sewadars	s
				ON	(	s.sewadar_id		=		sr.sewadar_id
					AND	gender						LIKE	@p_gender
					AND	s.global_sewadar_status_cd	IS NULL
					)
			JOIN	@depts
				ON	(	sr.department_id	=	id	)
			JOIN	sewadars_details	sd
				ON	(	sd.sewadar_id	=	sr.sewadar_id	)
		WHERE	NOT EXISTS	(	SELECT	b.sewadar_grno
								FROM	@tab_sewa_team_sewadars	b
								WHERE	sr.sewadar_grno	=	b.sewadar_grno
								AND		sr.satsang_centre_id	=	b.satsang_centre_id
							)

	IF (@p_is_summary = 'Yes')
	BEGIN
		EXEC	@rval =	SummariseSessionDeptWise	@p_session_id
		IF (@rval != 0)
			RETURN @rval;
	END
	ELSE
	BEGIN
		EXEC	@rval =	MakeListReport	@p_session_id
		IF (@rval != 0)
			RETURN @rval;
	END
END
GO

-- =============================================================================
-- Procedure GenerateCreditSpecsSummary
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateCreditSpecsSummary' AND xtype = 'P')
	DROP PROCEDURE GenerateCreditSpecsSummary
GO

CREATE PROCEDURE GenerateCreditSpecsSummary
(
	@p_credit_specification_id	INTEGER,
	@p_credit_specification_nm	gnc_nm,
	@p_gender					VARCHAR (6),
	@p_department_ids			report_xml_prm,
	@p_session_id				INTEGER				OUTPUT
)
AS
	DECLARE
		@sewadar_grno				sewadar_grno,
		@sewa_id					sewa_id,
		@tmp_sewadar_grno			sewadar_grno,
		@satsang_centre_id			satsang_centre_id,
		@extra_information_header	report_description,
		@extra_information			report_description,
		@report_header				report_description,
		@att_cnt					SMALLINT

BEGIN

	DECLARE	@depts		TABLE	(	id	INT	);
	DECLARE @hdoc INT;
	
	IF (@p_department_ids IS NULL)
		INSERT INTO	@depts
			SELECT	department_id
			FROM	departments_satsang_centres
			WHERE	satsang_centre_id	=	( SELECT satsang_centre_id FROM credit_specifications WHERE credit_specification_id = @p_credit_specification_id )
			AND		effective_till	>	GetDate();
	ELSE
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_department_ids; 
		INSERT INTO	@depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT);
		EXEC sp_xml_removedocument @hdoc;
	END
		
	SET	@extra_information = ''

	SET	@extra_information_header = SPACE (0)

	DECLARE	sewa_crsr	CURSOR
	FOR
		SELECT	a.sewa_id
		FROM	credit_specifications_sewas	a,
				sewas						b
		WHERE	credit_specification_id	=	@p_credit_specification_id
		AND		a.sewa_id				=	b.sewa_id
		ORDER BY b.start_dt


	OPEN	sewa_crsr

	FETCH	sewa_crsr
		INTO	@sewa_id

	WHILE (@@FETCH_STATUS = 0)
		BEGIN
			SELECT	@extra_information_header = @extra_information_header + @sewa_id + SPACE (3)
			FETCH	sewa_crsr
				INTO	@sewa_id
		END

	CLOSE	sewa_crsr
	DEALLOCATE	sewa_crsr

	SET @report_header = 'Summary of Attendances for ' + @p_credit_specification_nm

	SET @report_header = @report_header + ' (' + RTRIM (@p_credit_specification_id) + ')'

	INSERT INTO	generic_report_headers
			(	report_header, extra_information_header	)
		VALUES
			(	@report_header, @extra_information_header	)

	SET	@p_session_id = SCOPE_IDENTITY();

	DECLARE	smry_crsr	CURSOR
	FOR
		SELECT	ss.sewadar_grno, 
				sw.sewa_id,
				sw.satsang_centre_id,
				coalesce (present_cnt, 0) + coalesce (exempt_cnt, 0)	as	att_cnt
		FROM	credit_specifications_sewas	cs
			JOIN	sewadar_wise_sewa_summaries ss
				ON	(	cs.sewa_id		=	ss.sewa_id	)
			JOIN	sewas	sw
				ON	(	sw.sewa_id	=	cs.sewa_id	)			
			JOIN	sewadars_registrations	sr
				ON	(	ss.sewadar_grno			=	sr.sewadar_grno
					AND	ss.satsang_centre_id	=	sr.satsang_centre_id
					)
			JOIN	system_information_values	iv
				ON	(	iv.system_info_cd		=		'SttsGenUse'
					AND	iv.value_varchar		=		sewadar_status_cd
					)
			JOIN	sewadars	s
				ON	(	s.sewadar_id				=		sr.sewadar_id
					AND	gender						LIKE	@p_gender
					AND	s.global_sewadar_status_cd	IS NULL
					)
			JOIN	@depts
				ON	(	sr.department_id	=	id	)
		WHERE 	cs.credit_specification_id	=	@p_credit_specification_id	
		ORDER BY ss.sewadar_grno, sw.start_dt
		

	OPEN	smry_crsr

	SET	@sewadar_grno	=	SPACE(0)

	FETCH	smry_crsr	INTO
			@tmp_sewadar_grno,
			@sewa_id,
			@satsang_centre_id,
			@att_cnt

	WHILE (@@FETCH_STATUS = 0)
		BEGIN
			IF (@sewadar_grno <> @tmp_sewadar_grno)
				BEGIN
					IF (@sewadar_grno <> SPACE(0))
						BEGIN
							INSERT	INTO	generic_report_details
									(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
								VALUES	(@p_session_id, @satsang_centre_id, @sewadar_grno, @extra_information)
						END
					SET	@extra_information	=	SPACE (0)
					SET	@sewadar_grno	=	@tmp_sewadar_grno
				END
			IF (LEN (@extra_information) < PATINDEX ('%' + @sewa_id + '%', @extra_information_header) - 1)
					SET	@extra_information	=	@extra_information	+ SPACE (PATINDEX ('%' + @sewa_id + '%', @extra_information_header) - LEN (@extra_information) - 1)
			SET	@extra_information	=	@extra_information + CONVERT (VARCHAR, @att_cnt)

			FETCH	smry_crsr	INTO
					@tmp_sewadar_grno,
					@sewa_id,
					@satsang_centre_id,
					@att_cnt
		END

	IF (@sewadar_grno <> SPACE(0))
		BEGIN
			INSERT	INTO	generic_report_details
					(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
				VALUES	(@p_session_id, @satsang_centre_id, @sewadar_grno, @extra_information)
		END

	CLOSE	smry_crsr
	DEALLOCATE	smry_crsr

END
GO

-- =============================================================================
-- Procedure SummariseDeptSewadarsStatus
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'SummariseDeptSewadarsStatus' AND xtype = 'P')
	DROP PROCEDURE SummariseDeptSewadarsStatus
GO

CREATE PROCEDURE SummariseDeptSewadarsStatus
(
	@p_satsang_centre_id 	satsang_centre_id,
	@p_statuses				report_xml_prm,
	@p_is_outstation		VARCHAR (3),
	@p_sewadar_list_id 		sewadar_list_id,
	@p_session_id			INTEGER				OUTPUT
)
AS
	DECLARE
		@extra_information_header	report_description,
		@report_header				report_description,
		@extra_information			report_description,
		@sewadar_list_nm	 		gnc_long_nm;

BEGIN
	SELECT	@sewadar_list_nm	=	sewadar_list_nm
	FROM	generic_sewadar_lists
	WHERE	sewadar_list_id	=	@p_sewadar_list_id;

	DECLARE	@statuses	TABLE	(	stts	VARCHAR (4)	);
	DECLARE @hdoc INT;
	
	
	EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_statuses; 
	INSERT INTO	@statuses
		SELECT	DISTINCT	id
		FROM 	OPENXML (@hdoc, '/Root/r', 1)
			WITH	(id	VARCHAR (4)) 
	EXEC sp_xml_removedocument @hdoc
	

	SET	@report_header = '';

	IF (@p_is_outstation = 'Yes')
		SET @report_header = @report_header + ' for Outside Sewadars'
	ELSE IF (@p_is_outstation = 'No')
		SET @report_header = @report_header + ' for Local Sewadars'
	
	IF (@p_sewadar_list_id	IS NOT	NULL AND @sewadar_list_nm IS NOT NULL)					--- Restrict to Sewadar List
		SET @report_header = 'Sewadars Summary as per ' + @sewadar_list_nm
	ELSE
		SET @report_header = 'Sewadars Summary as on ' + CONVERT (CHAR(12), GetDate(), 107) + @report_header 

	IF EXISTS (	SELECT TOP 1 1	FROM	@statuses	)
	BEGIN
		SET @report_header = @report_header + ' (Status : '
		SELECT	@report_header = ISNULL(@report_header + ' ', '') +  stts
		FROM	@statuses;
		SET @report_header = @report_header + ')'
	END

	INSERT INTO	generic_report_headers
			(	report_header, major_information_header	)
		VALUES
			(	@report_header, 'Department'	)

	SET	@p_session_id = SCOPE_IDENTITY();

	SELECT	department_id, COUNT (sr.sewadar_grno) as males 
		INTO	#tmp_gents
	FROM	sewadars s
		JOIN	sewadars_registrations sr
			ON	(	s.sewadar_id			=		sr.sewadar_id
				AND is_outstation_sewadar	LIKE	@p_is_outstation
				)	
		JOIN	@statuses
			ON	(	sr.sewadar_status_cd	=	stts	)
		LEFT JOIN	generic_sewadar_lists_sewadars	g
			ON	(	g.sewadar_grno		=	sr.sewadar_grno
				AND g.satsang_centre_id =	sr.satsang_centre_id
				AND g.sewadar_list_id	=	@p_sewadar_list_id
				)
	WHERE	gender					=	'Male'
	AND		sr.satsang_centre_id	=	@p_satsang_centre_id
	AND		(	@p_sewadar_list_id	IS		NULL
			OR	g.sewadar_grno		IS	NOT	NULL
			)
	GROUP BY department_id;
	
	
	SELECT	department_id, COUNT (sr.sewadar_grno) as females 
		INTO	#tmp_ladies
	FROM	sewadars s
		JOIN	sewadars_registrations sr
			ON	(	s.sewadar_id			=		sr.sewadar_id
				AND is_outstation_sewadar	LIKE	@p_is_outstation
				)	
		JOIN	@statuses
				ON	(	sr.sewadar_status_cd	=	stts	)
		LEFT JOIN	generic_sewadar_lists_sewadars	g
			ON	(	g.sewadar_grno		=	sr.sewadar_grno
				AND g.satsang_centre_id =	sr.satsang_centre_id
				AND g.sewadar_list_id	=	@p_sewadar_list_id
				)
	WHERE	gender						=	'Female'
	AND		sr.satsang_centre_id	=	@p_satsang_centre_id		
	AND		(	@p_sewadar_list_id	IS		NULL
			OR	g.sewadar_grno		IS	NOT	NULL
			)
	GROUP BY department_id;
	
	INSERT	INTO	generic_report_summaries
			(	session_id,	major_information, gents_cnt, ladies_cnt)
		SELECT	@p_session_id,
				department_nm,
				COALESCE (males, 0),
				COALESCE (females, 0)
		FROM	#tmp_gents			a
		FULL OUTER JOIN	#tmp_ladies	b
					ON	(a.department_id = b.department_id)
		JOIN	departments		c
					ON	(COALESCE (a.department_id, b.department_id) = c.department_id)
		ORDER BY 2

END
GO

-- ======================================================================================================================
-- Procedure GenerateCityWiseSewadarList
-- ======================================================================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateCityWiseSewadarList' AND xtype = 'P')
	DROP PROCEDURE GenerateCityWiseSewadarList
GO

CREATE PROCEDURE GenerateCityWiseSewadarList
(
	@p_satsang_centre_id 	satsang_centre_id,
	@p_satsang_centre_nm 	gnc_nm,
	@p_country_ids			report_xml_prm,
	@p_state_ids			report_xml_prm,
	@p_district_ids			report_xml_prm,
	@p_po_or_city_ids		report_xml_prm,
	@p_gender				VARCHAR (6),
	@p_sewadar_list_id		sewadar_list_id,
	@p_is_summary			Boolean,
	@p_session_id			INTEGER				OUTPUT
)
AS
	DECLARE
		@rval					INT;

BEGIN

	DECLARE	@cities	TABLE	(	id		INT	);
	DECLARE	@hdoc		INT;
	
	IF (@p_po_or_city_ids IS NOT NULL)
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_po_or_city_ids; 
		INSERT INTO	@cities 
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT) 
		EXEC sp_xml_removedocument @hdoc
	END
	ELSE IF (@p_district_ids IS NOT NULL)
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_district_ids;
		INSERT INTO @cities
			SELECT	DISTINCT	post_office_or_city_id	
			FROM OPENXML (@hdoc, '/Root/r', 1)
					WITH	(id	INT) 
				JOIN post_offices_or_cities
					ON	(	id = district_id	)			
		EXEC sp_xml_removedocument @hdoc
	END
	ELSE IF (@p_state_ids IS NOT NULL)
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_state_ids; 
		INSERT INTO @cities
			SELECT	DISTINCT	post_office_or_city_id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
					WITH	(id	INT) 
				JOIN CDB..districts_or_cities d
					ON	(	id = state_id	)
				JOIN post_offices_or_cities p
					ON	(	d.district_or_city_id = p.district_id )				
		EXEC sp_xml_removedocument @hdoc
	END
	ELSE IF (@p_country_ids IS NOT NULL)
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_country_ids; 
		INSERT INTO @cities
			SELECT	DISTINCT	post_office_or_city_id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
					WITH	(id	INT) 
				JOIN CDB..states	s
					ON	(	country_id	=	id	)
				JOIN CDB..districts_or_cities d
					ON	(	s.state_id	=	d.state_id	)
				JOIN post_offices_or_cities p
					ON	(	d.district_or_city_id = p.district_id )		
		EXEC sp_xml_removedocument @hdoc
	END
	ELSE
	BEGIN	
		INSERT INTO @cities
			SELECT	post_office_or_city_id
			FROM	post_offices_or_cities
			WHERE	effective_till	>	GetDate();
	END

	IF (@p_is_summary = 'No')
		INSERT INTO	generic_report_headers
				(	report_header, extra_information_header	)
			VALUES
				(	'City-wise List of Sewadars ' , 'Age   YOA  Status Telephone' )
	ELSE
		INSERT INTO	generic_report_headers
				(	report_header, major_information_header	)
			VALUES
				(	'City-wise Summary of Sewadars ' , 'Department' )

	SELECT	@p_session_id =  SCOPE_IDENTITY();

	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
		SELECT	@p_session_id,
				@p_satsang_centre_id,
				sr.sewadar_grno,
				space (1)
						+ CONVERT (CHAR (2), DATEDIFF (YEAR, birth_dtm, GetDate())) + SPACE (2)
						+ CONVERT (CHAR(4), DATEPART (YY, appointment_dt)) + SPACE (2)
						+ sr.sewadar_status_cd + SPACE (3)
						+ COALESCE (sd.telephone_mobile, COALESCE (sd.telephone_residence, ''))

		FROM	sewadars	s
			JOIN	sewadars_registrations	sr
				ON	(	s.sewadar_id				=		sr.sewadar_id
					AND sr.satsang_centre_id		=		@p_satsang_centre_id
					AND	gender						LIKE	@p_gender
					AND	s.global_sewadar_status_cd	IS NULL
					)
			JOIN	system_information_values	iv
				ON	(	iv.system_info_cd	=	'SttsActv'
					AND	iv.value_varchar	=	sewadar_status_cd
					)
			JOIN	sewadars_details	sd
				ON	(	sd.sewadar_id	=	sr.sewadar_id	)
			
			JOIN	sewadars_addresses	 sad 
				ON  (	sad.sewadar_id = sd.sewadar_id 
					AND sad.address_type = 'Residence'
					)
			JOIN @cities 
				ON  (	
						sad.post_office_or_city_id	=	id	
					)	
			LEFT JOIN generic_sewadar_lists_sewadars	sl
				ON	(	sl.satsang_centre_id =	sr.satsang_centre_id
					AND	sl.sewadar_grno		 =	sr.sewadar_grno
					AND	sl.sewadar_list_id	 =	@p_sewadar_list_id
					)
			WHERE (	
					(	@p_sewadar_list_id IS NOT NULL	AND	sl.sewadar_grno IS NOT NULL	)
					OR	(	@p_sewadar_list_id IS NULL	)
			)
			

	IF (@p_is_summary = 'Yes') 
	BEGIN
		EXEC	@rval =	SummariseSessionDeptWise	@p_session_id
		IF (@rval != 0)
			RETURN @rval;
	END

END
GO

-- =============================================================================
-- Procedure SummariseSewadarStatusCount
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'SummariseSewadarStatusCount' AND xtype = 'P')
	DROP PROCEDURE SummariseSewadarStatusCount
GO

CREATE PROCEDURE SummariseSewadarStatusCount
(
	@p_satsang_centre_id 	satsang_centre_id,
	@p_satsang_centre_nm 	gnc_nm,
	@p_sewadar_list_id 		sewadar_list_id,
	@p_session_id			INTEGER				OUTPUT
)
AS
	DECLARE
		@sewadar_list_nm	gnc_long_nm;

BEGIN
	SELECT	@sewadar_list_nm	=	sewadar_list_nm
	FROM	generic_sewadar_lists
	WHERE	sewadar_list_id	=	@p_sewadar_list_id;

	IF (@p_sewadar_list_id	IS NOT	NULL AND @sewadar_list_nm IS NOT NULL)					--- Restrict to Sewadar List
		INSERT INTO	generic_report_headers
				(	report_header, major_information_header	)
			VALUES
				(	'Status-wise Summary of Sewadars as per ' + @sewadar_list_nm, 'Status'	)
	ELSE
		INSERT INTO	generic_report_headers
				(	report_header, major_information_header	)
			VALUES
				(	'Status-wise Summary of Sewadars as on ' + CONVERT (VARCHAR(11), GetDate(), 106), 'Status'	)

	SELECT	@p_session_id = SCOPE_IDENTITY();

	INSERT	INTO	generic_report_summaries
			(	session_id,	major_information, gents_cnt, ladies_cnt	)
		SELECT	@p_session_id,
				COALESCE (males.sewadar_status_cd, females.sewadar_status_cd),
				COALESCE (males_count, 0),
				COALESCE (females_count, 0)
		FROM	(	SELECT	sr.sewadar_status_cd, COUNT (*) as males_count 
					FROM	sewadars	s
						JOIN	sewadars_registrations	sr
							ON	(	s.sewadar_id				=		sr.sewadar_id
								AND sr.satsang_centre_id		=		@p_satsang_centre_id
								AND	gender						=		'Male'
								AND	s.global_sewadar_status_cd	IS NULL
								)
						LEFT JOIN	generic_sewadar_lists_sewadars	g
							ON	(	g.sewadar_grno		=	sr.sewadar_grno
								AND g.satsang_centre_id =	sr.satsang_centre_id
								AND g.sewadar_list_id	=	@p_sewadar_list_id
								)
					WHERE	(	@p_sewadar_list_id	IS		NULL
							OR	g.sewadar_grno		IS	NOT	NULL
							)
					GROUP BY sewadar_status_cd
				)	AS	males
		
		FULL OUTER JOIN
				(	SELECT	sr.sewadar_status_cd, COUNT (*) as females_count 
					FROM	sewadars	s
						JOIN	sewadars_registrations	sr
							ON	(	s.sewadar_id				=		sr.sewadar_id
								AND sr.satsang_centre_id		=		@p_satsang_centre_id
								AND	gender						=		'Female'
								AND	s.global_sewadar_status_cd	IS NULL
								)
						LEFT JOIN	generic_sewadar_lists_sewadars	g
							ON	(	g.sewadar_grno		=	sr.sewadar_grno
								AND g.satsang_centre_id =	sr.satsang_centre_id
								AND g.sewadar_list_id	=	@p_sewadar_list_id
								)
					WHERE	(	@p_sewadar_list_id	IS		NULL
							OR	g.sewadar_grno		IS	NOT	NULL
							)
					GROUP BY sewadar_status_cd
				)	AS	females
			ON	males.sewadar_status_cd = females.sewadar_status_cd
			ORDER BY 2

END
GO

-- =============================================================================
-- Procedure GenerateWeeklySewadarList
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateWeeklySewadarList' AND xtype = 'P')
	DROP PROCEDURE GenerateWeeklySewadarList
GO

CREATE PROCEDURE GenerateWeeklySewadarList
(
	@p_satsang_centre_id 		satsang_centre_id,
	@p_satsang_centre_nm 		gnc_nm,
	@p_department_ids			report_xml_prm,
	@p_sub_department_ids		report_xml_prm,
	@p_weekly_sewa_location_id	weekly_sewa_location_id,
	@p_weekly_sewa_location_nm	gnc_nm,
	@p_gender					VARCHAR (6),
	@p_is_summary				Boolean,
	@p_session_id				INTEGER				OUTPUT
)
AS
	DECLARE
		@extra_information_header	report_description,
		@extra_information			report_description,
		@rval						INT,
		@report_header				report_description
		
BEGIN
	DECLARE	@depts		TABLE	(	id	INT	);
	DECLARE	@sub_depts	TABLE	(	id	INT	);
	DECLARE @hdoc INT;	

	IF (@p_department_ids IS NULL)
		INSERT INTO	@depts
			SELECT	department_id
			FROM	departments_satsang_centres
			WHERE	satsang_centre_id	=	@p_satsang_centre_id
			AND		effective_till	>	GetDate();
	ELSE
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_department_ids; 
		INSERT INTO	@depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT);
		EXEC sp_xml_removedocument @hdoc;
	END
		
	IF (@p_sub_department_ids IS NOT NULL)
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_sub_department_ids; 
		INSERT INTO	@sub_depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT) 
		EXEC sp_xml_removedocument @hdoc
	END
	
	
	SELECT	@extra_information = SPACE (0)

	IF (@p_is_summary = 'Yes')
		BEGIN
			SELECT	@report_header = 'Weekly Sewadars Summary for ' + RTRIM (@p_weekly_sewa_location_nm)
			SELECT	@extra_information_header = 'Department'
			INSERT INTO	generic_report_headers
					(	report_header, major_information_header	)
				VALUES
					(	@report_header, @extra_information_header	)
		END
	ELSE
		BEGIN
			SELECT	@report_header = 'Weekly Sewadars List for ' + @extra_information + ' at ' + RTRIM (@p_weekly_sewa_location_nm)
			SELECT	@extra_information_header = 'Age   YOA  Status  Init  Telephone-Res.'
			INSERT INTO	generic_report_headers
					(	report_header, extra_information_header	)
				VALUES
					(	@report_header, @extra_information_header	)
		END



	SELECT	@p_session_id = SCOPE_IDENTITY();

	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
		SELECT	@p_session_id,
				@p_satsang_centre_id,
				sr.sewadar_grno,
				space (1)
						+ CONVERT (CHAR (2), DATEDIFF (YEAR, birth_dtm, GetDate())) + SPACE (2)
						+ CONVERT (CHAR(4), DATEPART (YY, appointment_dt)) + SPACE (2)
						+ sr.sewadar_status_cd + SPACE (3)
						+ CASE WHEN initiation_dt IS NULL THEN 'No   ' ELSE 'Yes  ' END
						+ COALESCE (telephone_residence, '')
		FROM	sewadars_registrations	sr
			JOIN	sewadars	s
				ON	(	s.sewadar_id				=		sr.sewadar_id
					AND sr.satsang_centre_id		=		@p_satsang_centre_id
					AND	s.global_sewadar_status_cd	IS NULL
					AND sr.weekly_sewa_location_id	=		@p_weekly_sewa_location_id
					AND	s.gender					LIKE	@p_gender
					)
			JOIN	system_information_values	iv
				ON	(	iv.system_info_cd		=		'SttsActv'
					AND	iv.value_varchar		=		sewadar_status_cd					
					)			
			JOIN	@depts
				ON	(	sr.department_id	=	id	)
			JOIN	sewadars_details	sd
				ON	(	sd.sewadar_id	=	sr.sewadar_id	)
			LEFT	JOIN	@sub_depts	x
				ON	(	sr.sub_department_id	=	x.id	)
			WHERE	(	@p_sub_department_ids	IS NOT NULL	AND	x.id	IS NOT NULL	)
				OR	(	@p_sub_department_ids	IS NULL					)
		
	IF (@p_is_summary = 'Yes')
	BEGIN
		EXEC	@rval =	SummariseSessionDeptWise	@p_session_id
		IF (@rval != 0)
			RETURN @rval;
	END

END
GO

-- =============================================================================
-- Procedure GenerateFirstHeadsList
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateFirstHeadsList' AND xtype = 'P')
	DROP PROCEDURE GenerateFirstHeadsList
GO

CREATE PROCEDURE GenerateFirstHeadsList
(
	@p_satsang_centre_id 		satsang_centre_id,
	@p_satsang_centre_nm 		gnc_nm,
	@p_gender					VARCHAR (6),
	@p_session_id				INTEGER				OUTPUT
)
AS

BEGIN

	INSERT INTO	generic_report_headers
			(	report_header, extra_information_header	)
		VALUES
			(	'First Heads of Departments List', 'Telephones'	)

	SELECT	@p_session_id = SCOPE_IDENTITY();

	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
		SELECT	@p_session_id,
				@p_satsang_centre_id,
				sr.sewadar_grno,
				COALESCE ('Mbl: ' + telephone_mobile + ' ', '')
						+ COALESCE (CHAR (13) + 'Res: ' + telephone_residence + ' ', '')
						+ COALESCE (CHAR (13) + 'Off: ' + telephone_office + ' ', '')
		FROM	sewadars_registrations	sr
			JOIN	sewadars	s
				ON	(	s.sewadar_id				=		sr.sewadar_id
					AND sr.satsang_centre_id		=		@p_satsang_centre_id
					AND	s.global_sewadar_status_cd	IS NULL
					AND	s.gender					LIKE	@p_gender
					AND sr.responsibility			=		'Head'
					)
			JOIN	sewadars_details	sd
				ON	(	sd.sewadar_id	=	sr.sewadar_id	)				
						
						
END
GO

-- =============================================================================
-- Procedure GenerateRspnsbltyChangeList (start_dt, finish_dt, gender, session_id)
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateRspnsbltyChangeList' AND xtype = 'P')
	DROP PROCEDURE GenerateRspnsbltyChangeList
GO

CREATE PROCEDURE GenerateRspnsbltyChangeList
(
	@p_satsang_centre_id 		satsang_centre_id,
	@p_satsang_centre_nm 		gnc_nm,
	@p_start_dt					SMALLDATETIME,
	@p_finish_dt				SMALLDATETIME,
	@p_gender					VARCHAR (6),
	@p_session_id				INTEGER				OUTPUT
)
AS
	DECLARE
		@extra_information_header	report_description,
		@report_header				report_description

BEGIN

	SET	@p_start_dt		= @p_start_dt + '00:00'
	SET	@p_finish_dt	= CONVERT (DATETIME, CONVERT (VARCHAR (12), @p_finish_dt, 106) + ' 23:59')

	SELECT	@extra_information_header = 'Date        Responsibility'

	SELECT @report_header = 'Responsibility Change Sewadars List from ' + CONVERT (VARCHAR(11), @p_start_dt, 106)
									+ ' to ' + CONVERT (VARCHAR(11), @p_finish_dt, 106)

	DECLARE	@tbl	TABLE	(	sewadar_grno	CHAR (6)		NOT NULL	PRIMARY KEY,
								effective_dtm	SMALLDATETIME	NOT NULL
							)

	INSERT INTO	@tbl
		SELECT	sewadar_grno, MAX (effective_dtm)
		FROM	sewadars_responsibility_changes
		WHERE	satsang_centre_id	=	@p_satsang_centre_id
		AND 	effective_dtm		BETWEEN		@p_start_dt	AND	@p_finish_dt
		GROUP BY sewadar_grno

	INSERT INTO	generic_report_headers
			(	report_header, extra_information_header		)
		VALUES
			(	@report_header, @extra_information_header	)

	SELECT	@p_session_id = SCOPE_IDENTITY();

	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
		SELECT	@p_session_id,
				@p_satsang_centre_id,
				sr.sewadar_grno,
				CONVERT (CHAR (9), x.effective_dtm, 6) + SPACE (3)
				+ COALESCE (src.old_responsibility, 'None') + ' to ' + COALESCE (sr.responsibility, 'None')
		FROM	@tbl	x
				JOIN	sewadars_responsibility_changes	src
					ON	(	src.satsang_centre_id	=	@p_satsang_centre_id
						AND	src.sewadar_grno		=	x.sewadar_grno
						AND src.effective_dtm		=	x.effective_dtm
						)
				JOIN	sewadars_registrations	sr
					ON	(	sr.sewadar_grno			=		src.sewadar_grno
						AND sr.satsang_centre_id	=		src.satsang_centre_id
						)
				JOIN	sewadars	s
					ON	(	s.sewadar_id	=		sr.sewadar_id
						AND	s.gender		LIKE	@p_gender
						)
END
GO

-- ======================================================================================================================
-- Procedure GenerateCountryWiseSewadarList
-- ======================================================================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateCountryWiseSewadarList' AND xtype = 'P')
	DROP PROCEDURE GenerateCountryWiseSewadarList
GO

CREATE PROCEDURE GenerateCountryWiseSewadarList
(
	@p_satsang_centre_id 	satsang_centre_id,
	@p_satsang_centre_nm 	gnc_nm,
	@p_country_ids			report_xml_prm,
	@p_gender				VARCHAR (6),
	@p_sewadar_list_id		sewadar_list_id,
	@p_is_summary			Boolean,
	@p_session_id			INTEGER				OUTPUT
)
AS
	DECLARE
		@extra_information		report_description,
		@report_header			report_description,
		@sewadar_list_nm		gnc_long_nm,
		@rval					INT;

BEGIN
	SELECT	@sewadar_list_nm	=	sewadar_list_nm
	FROM	generic_sewadar_lists
	WHERE	sewadar_list_id	=	@p_sewadar_list_id;

	DECLARE	@countries	TABLE	(	id		INT	);
	DECLARE	@hdoc		INT;
	
	IF (@p_country_ids IS NOT NULL)
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_country_ids; 
		INSERT INTO	@countries 
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT) 
		EXEC sp_xml_removedocument @hdoc
	END
	ELSE
	BEGIN	
		INSERT INTO	@countries
			SELECT	country_id
			FROM	CDB..countries
			WHERE	effective_till	>	GetDate();
	END

	IF (@p_is_summary = 'No')
	BEGIN
		SET @report_header = 'List of Sewadars '
		SET @extra_information = 'Address'
	END
	ELSE
	BEGIN
		SET @report_header = 'Summary of Sewadars '
		SET @extra_information = 'Department'
	END
	IF (@p_sewadar_list_id	IS NOT	NULL AND @sewadar_list_nm IS NOT NULL)					--- Restrict to Sewadar List
		SET @report_header += ' as per ' + @sewadar_list_nm;

	INSERT INTO	generic_report_headers
			(	report_header, major_information_header	)
		VALUES
			(	@report_header, @extra_information	);

	SELECT	@p_session_id = SCOPE_IDENTITY();

	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
		SELECT	@p_session_id,
				@p_satsang_centre_id,
				sr.sewadar_grno,
				RTRIM (sad.address_line_1) + ', '
						+ COALESCE (RTRIM (sad.address_line_2) + ', ', '')
						+ RTRIM (poc.post_office_or_city_nm) + ', '
						+ RTRIM (doc.district_nm) + ', '
						+ COALESCE ('- ' + RTRIM (sad.pin_or_zip_code) + ', ', '')
						+ RTRIM (st.state_nm) + ', '
						+ RTRIM (cntrs.country_nm)
		FROM	sewadars	s
			JOIN	sewadars_registrations	sr
				ON	(	s.sewadar_id				=		sr.sewadar_id
					AND sr.satsang_centre_id		=		@p_satsang_centre_id
					AND	gender						LIKE	@p_gender
					AND	s.global_sewadar_status_cd	IS NULL
					)
			JOIN	system_information_values	iv
				ON	(	iv.system_info_cd	=	'SttsActv'
					AND	iv.value_varchar	=	sewadar_status_cd
					)
			JOIN	sewadars_addresses	 sad 
				ON  (	sad.sewadar_id = sr.sewadar_id 
					AND sad.address_type = 'Residence'
					)
			JOIN	post_offices_or_cities poc 
				ON  (	poc.post_office_or_city_id = sad.post_office_or_city_id		)
			JOIN	CDB..districts_or_cities doc 
				ON  (	doc.district_or_city_id	=	poc.district_id		)
			JOIN	CDB..states st 
				ON  (	st.state_id		=	doc.state_id	 )
			JOIN	@countries c
				ON	(	st.country_id	=	c.id	)
			JOIN	CDB..countries	cntrs
				ON	(	cntrs.country_id	=	c.id	)	
			LEFT JOIN generic_sewadar_lists_sewadars	sl
				ON	(	sl.satsang_centre_id =	sr.satsang_centre_id
					AND	sl.sewadar_grno		 =	sr.sewadar_grno
					AND	sl.sewadar_list_id	 =	@p_sewadar_list_id
					)
			WHERE (	(	@p_sewadar_list_id IS NOT NULL	AND	sl.sewadar_grno IS NOT NULL	)
					OR	(	@p_sewadar_list_id IS NULL	)
					)

	IF (@p_is_summary = 'Yes')
	BEGIN
		EXEC	@rval =	SummariseSessionDeptWise	@p_session_id
		IF (@rval != 0)
			RETURN @rval;
	END

END
GO

-- =============================================================================
-- Procedure GenerateConstructionAttendance
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateConstructionAttendance' AND xtype = 'P')
	DROP PROCEDURE GenerateConstructionAttendance
GO

CREATE PROCEDURE GenerateConstructionAttendance
(
	@p_sewa_id				sewa_id,
	@p_sewa_shift			sewa_shift,
	@p_sewa_dt				SMALLDATETIME,
	@p_is_summary			Boolean,
	@p_session_id			INTEGER				OUTPUT
)
AS
	DECLARE
		@report_header				report_description,
		@extra_information			report_description,
		@sewa_nm					gnc_nm,
		@rval						INT,
		@satsang_centre_id			satsang_centre_id
		
BEGIN

	SELECT	@sewa_nm				=	sewa_nm,
			@satsang_centre_id		=	satsang_centre_id
	FROM	sewas
	WHERE	sewa_id		=	@p_sewa_id

	IF (@p_is_summary = 'No')
		BEGIN
			SELECT	@report_header = 'Attendance for ' + @sewa_nm + ' (' + RTRIM (@p_sewa_shift) + ') for ' + CONVERT (VARCHAR(11), @p_sewa_dt, 106)
			SELECT	@extra_information = 'Age   YOA  Status Telephone'
			INSERT INTO	generic_report_headers
					(	report_header, extra_information_header	)
				VALUES
					(	@report_header, @extra_information	)
		END
	ELSE
		BEGIN
			SELECT	@extra_information	=	'Department'
			SELECT	@report_header = 'Attendance Summary for ' + @sewa_nm + ' (' + RTRIM (@p_sewa_shift) + ') for ' + CONVERT (VARCHAR(11), @p_sewa_dt, 106)
			INSERT INTO	generic_report_headers
					(	report_header, major_information_header	)
				VALUES
					(	@report_header, @extra_information	)
		END


	SELECT	@p_session_id = SCOPE_IDENTITY();

	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
		SELECT	@p_session_id,
				a.satsang_centre_id,
				sr.sewadar_grno,
				space (1)
						+ CONVERT (CHAR (2), DATEDIFF (YEAR, birth_dtm, GetDate())) + SPACE (2)
						+ CONVERT (CHAR(4), DATEPART (YY, appointment_dt)) + SPACE (2)
						+ sr.sewadar_status_cd + SPACE (3)
						+ COALESCE (telephone_mobile, COALESCE (telephone_residence, ''))
		FROM	arbitrary_shift_presences	a
			JOIN	sewadars_registrations	sr
				ON	(   a.sewadar_grno		=	sr.sewadar_grno
					AND a.satsang_centre_id =	sr.satsang_centre_id
					AND	a.presence_dt		=	@p_sewa_dt
					AND	a.sewa_shift		=	@p_sewa_shift
					AND a.sewa_id			=	@p_sewa_id	
					)
			JOIN	sewadars	s
				ON	(	s.sewadar_id	=	sr.sewadar_id	)
			JOIN	sewadars_details	sd
				ON	(	sd.sewadar_id	=	s.sewadar_id	)		
		
	IF (@p_is_summary = 'Yes')
	BEGIN
		EXEC	@rval =	SummariseSessionDeptWise	@p_session_id
		IF (@rval != 0)
			RETURN @rval;
	END

END
GO

-- =============================================================================
-- Procedure GenerateDailyAttendanceList
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateDailyAttendanceList' AND xtype = 'P')
	DROP PROCEDURE GenerateDailyAttendanceList
GO

CREATE PROCEDURE GenerateDailyAttendanceList
(
	@p_satsang_centre_id	int,
	@p_sewa_id				sewa_id,
	@p_start_dt				SMALLDATETIME,
	@p_finish_dt			SMALLDATETIME,
	@p_department_ids		report_xml_prm,
	@p_sub_department_ids	report_xml_prm,
	@p_is_outstation		VARCHAR (3),
	@p_gender			VARCHAR (6),
	@p_is_absentees_only	Boolean,
	@p_is_summary			Boolean,
	@p_session_id			INTEGER				OUTPUT
)
AS
	DECLARE
		@sewa_nm					gnc_nm,
		@start_dt					SMALLDATETIME,
		@finish_dt					SMALLDATETIME,
		@sewa_frequency				CHAR (9),	-- Daily, Arbitrary
		@attendance_unit			CHAR (8),	-- Day, Shift
		@attendance_marking			CHAR (9),	-- Team-wise, Arbitrary, Summary
		@dt							SMALLDATETIME,
		@sewadar_grno				sewadar_grno,
		@tmp_dt						SMALLDATETIME,
		@tmp_sewadar_grno			sewadar_grno,
		@extra_information_header	report_description,
		@extra_information			report_description,
		@prsnt_information			report_description,
		@report_header				report_description,
		@attndnc					CHAR (3),
		@dflt_rspns					CHAR (3),
		@status						CHAR (20),
		@tmp_team_nm				VARCHAR (60),
		@tmp_gender					VARCHAR (6),
		@team_nm					VARCHAR (60),
		@gender						VARCHAR (6),
		@satsang_centre_id			satsang_centre_id,
		@tmp_status					CHAR (20),
		@cnt						SMALLINT,
		@rval						INT

BEGIN

	DECLARE	@depts		TABLE	(	id	INT	);
	DECLARE	@sub_depts	TABLE	(	id	INT	);
	DECLARE @hdoc INT;	

	SELECT	@sewa_nm				=	sewa_nm,
			@start_dt				=	start_dt,
			@finish_dt				=	finish_dt,
			@sewa_frequency			=	sewa_frequency,
			@attendance_unit		=	attendance_unit,
			@attendance_marking		=	attendance_marking,
			@satsang_centre_id		=	satsang_centre_id
	FROM	sewas
	WHERE	sewa_id		=	@p_sewa_id

	IF (@@ROWCOUNT = 0 OR @sewa_nm IS NULL OR @sewa_nm = '')
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'NotExist', NULL, 'Sewa Information', NULL, NULL
			RETURN -1;
		END
	
	IF (@p_department_ids IS NULL)
		INSERT INTO	@depts
			SELECT	department_id
			FROM	departments_satsang_centres
			WHERE	satsang_centre_id	=	@satsang_centre_id
			AND		effective_till	>	GetDate();
	ELSE
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_department_ids; 
		INSERT INTO	@depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT);
		EXEC sp_xml_removedocument @hdoc;
	END
		
	IF (@p_sub_department_ids IS NOT NULL)
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_sub_department_ids; 
		INSERT INTO	@sub_depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT) 
		EXEC sp_xml_removedocument @hdoc
	END	
		

	IF (@p_start_dt > @p_finish_dt)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'InvalidPeriod', NULL, 'Starting date', 'Finish date', NULL
			RETURN -2;
		END
		
	IF (@p_start_dt < @start_dt)
		SELECT	@p_start_dt = @start_dt

	IF (@p_finish_dt > @finish_dt)
		SELECT	@p_finish_dt = @finish_dt	

	IF (@sewa_frequency != 'Daily')
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'InvalidValue', NULL, 'Sewa Frequency', 'Sewa', NULL
			RETURN -3;
		END

	IF (@attendance_unit != 'Day')
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'InvalidValue', NULL, 'Attendance Unit', 'Sewa', NULL
			RETURN -4;
		END

	IF (@attendance_marking != 'Team-wise')
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'InvalidValue', NULL, 'Attendance Marking', 'Sewa', NULL
			RETURN -5;
		END
	
	
	SELECT	@tmp_dt	=	@p_start_dt
	IF (@p_is_summary = 'No')
		BEGIN
			SELECT @report_header = 'Daily Attendance Register '
			IF (@p_is_absentees_only = 'Yes')
				SELECT @report_header = @report_header + '(Absentees only) '
			SELECT @report_header = @report_header + 'from ' + CONVERT (VARCHAR(11), @p_start_dt, 106)
										+ ' to ' + CONVERT (VARCHAR(11), @p_finish_dt, 106)
			SELECT	@extra_information_header = SPACE (0)

			WHILE (@tmp_dt <= @p_finish_dt)
				BEGIN
					SELECT	@extra_information_header = @extra_information_header
													+ SUBSTRING (CONVERT (VARCHAR(11), @tmp_dt, 121), 9, 2)
													+ SPACE (1)
					SELECT @tmp_dt = @tmp_dt + 1
				END

		END
	ELSE
		BEGIN
			SELECT @report_header = 'Daily Attendance Summary from ' + CONVERT (VARCHAR(11), @p_start_dt, 106)
										+ ' to ' + CONVERT (VARCHAR(11), @p_finish_dt, 106)
			SELECT	@extra_information_header = 'Department'
		END
	IF (@p_is_outstation = 'Yes')
		SELECT @report_header = @report_header + ' for Outside Sewadars'
	ELSE IF (@p_is_outstation = 'No')
		SELECT @report_header = @report_header + ' for Local Sewadars'
	SELECT @report_header = @report_header + ' (' + RTRIM (@p_sewa_id) + ')'

	IF (@p_is_summary = 'No')
		INSERT INTO	generic_report_headers
				(	report_header, extra_information_header	)
			VALUES
				(	@report_header, @extra_information_header + '  Status'		)
	ELSE
		INSERT INTO	generic_report_headers
				(	report_header, major_information_header	)
			VALUES
				(	@report_header, @extra_information_header )

	SELECT	@p_session_id = SCOPE_IDENTITY();

	IF (@attendance_marking = 'Team-wise')
		BEGIN
			SELECT	@dflt_rspns	= '   '
			DECLARE	attendance_crsr	CURSOR
			FOR
				SELECT	sw.sewadar_grno,
						tda.attendance_dt		AS	dt,
						SPACE (1) + tda.attendance + SPACE (1)		AS	atndnc,
						ss.sewadar_status_nm,
						st.sewa_team_nm,
						s.gender
				FROM	sewa_teams		st
					JOIN	sewa_team_wise_sewadars		sw
						ON	(	st.sewa_id				=	@p_sewa_id
							AND	sw.sewa_team_id			=	st.sewa_team_id
							)
					LEFT OUTER JOIN	team_wise_daily_attendance	tda
						ON	(	tda.sewa_team_id	=		sw.sewa_team_id
							AND	tda.serial_id		=		sw.serial_id
							AND	tda.attendance_dt	BETWEEN	@p_start_dt AND @p_finish_dt
							)
					JOIN	sewadars_registrations	sr
						ON	(	sw.sewadar_grno				=	sr.sewadar_grno
							AND sr.satsang_centre_id		=	@p_satsang_centre_id
							AND	sr.is_outstation_sewadar	LIKE	@p_is_outstation
							)
					JOIN	sewadars	s
						ON	(	s.sewadar_id	=	sr.sewadar_id	)
					JOIN	system_information_values	iv
						ON	(	iv.system_info_cd		=		'SttsActv'
							AND	iv.value_varchar		=		sr.sewadar_status_cd
							)
					JOIN	sewadar_status	ss
						ON	(	sr.sewadar_status_cd	=	ss.sewadar_status_cd	)					
					JOIN	@depts
						ON	(	sr.department_id	=	id	)
					LEFT	JOIN	@sub_depts	x
						ON	(	sr.sub_department_id	=	x.id	)
					WHERE	(	(	@p_sub_department_ids	IS NOT NULL	AND	x.id	IS NOT NULL	)
							OR	(	@p_sub_department_ids	IS NULL					)
							)
					AND		(	(	@p_is_absentees_only	=	'Yes'	AND	tda.attendance	=	'A'	)
							OR	@p_is_absentees_only	=	'No'
							OR	@p_is_absentees_only	IS	NULL
							)
					AND		(	s.gender	LIKE	@p_gender	)
				ORDER BY 1, 2
		END

	OPEN	attendance_crsr

	SELECT	@sewadar_grno	=	SPACE(0)
	SELECT	@dt	=	@p_start_dt - 1

	FETCH	attendance_crsr	INTO
			@tmp_sewadar_grno,
			@tmp_dt,
			@attndnc,
			@tmp_status,
			@tmp_team_nm,
			@tmp_gender

	WHILE (@@FETCH_STATUS = 0)
		BEGIN
			IF (@sewadar_grno <> @tmp_sewadar_grno)
				BEGIN
					IF (@sewadar_grno <> SPACE(0))
						BEGIN
							IF (@dt < @p_start_dt)
								SELECT	@dt	=	@p_start_dt - 1
							SELECT	@cnt	=	DATEDIFF (DD, @dt, @p_finish_dt)
							WHILE (@cnt > 0)
								BEGIN
									SELECT	@cnt = @cnt - 1
									SELECT	@extra_information	=	@extra_information + @dflt_rspns
								END
							INSERT	INTO	generic_report_details
									(	session_id, satsang_centre_id, sewadar_grno, extra_information, grouping_1, grouping_2	)
								VALUES	(@p_session_id, @satsang_centre_id, @sewadar_grno, @extra_information + SPACE (2) + @status, @team_nm, @gender)
						END
					SET	@extra_information	=	SPACE (0)
					SET	@sewadar_grno		=	@tmp_sewadar_grno
					SET	@status				=	@tmp_status
					SET	@team_nm			=	@tmp_team_nm
					SET	@gender				=	@tmp_gender
					SET	@dt					=	@p_start_dt - 1
				END
			IF (@tmp_dt >= @p_start_dt AND @tmp_dt <= @p_finish_dt)
				BEGIN
					IF (@dt < @p_start_dt)
						SELECT	@dt	=	@p_start_dt - 1
					SELECT	@cnt	=	DATEDIFF (DD, @dt, @tmp_dt)
					WHILE (@cnt > 1)
						BEGIN
							SELECT	@cnt = @cnt - 1
							SELECT	@extra_information	=	@extra_information + @dflt_rspns
						END
					SELECT	@extra_information	=	@extra_information + @attndnc
				END
			SELECT	@dt	=	@tmp_dt

			FETCH	attendance_crsr	INTO
					@tmp_sewadar_grno,
					@tmp_dt,
					@attndnc,
					@tmp_status,
					@tmp_team_nm,
					@tmp_gender
		END

	IF (@sewadar_grno <> SPACE(0))
		BEGIN
			IF (@dt < @p_start_dt)
				SELECT	@dt	=	@p_start_dt - 1
			SELECT	@cnt	=	DATEDIFF (DD, @dt, @p_finish_dt)
			WHILE (@cnt > 0)
				BEGIN
					SELECT	@cnt = @cnt - 1
					SELECT	@extra_information	=	@extra_information + @dflt_rspns
					
				END
			INSERT	INTO	generic_report_details
					(	session_id, satsang_centre_id, sewadar_grno, extra_information, grouping_1, grouping_2	)
				VALUES	(@p_session_id, @satsang_centre_id, @sewadar_grno, @extra_information + SPACE (2) + @status, @team_nm, @gender)
		END

	CLOSE	attendance_crsr
	DEALLOCATE	attendance_crsr

	IF (@p_is_summary = 'Yes')
	BEGIN
		INSERT	INTO	generic_report_summaries
				(	session_id,	major_information, gents_cnt, ladies_cnt	)
			SELECT	@p_session_id,
					grouping_1,
					SUM (CASE WHEN grouping_2 = 'Male' THEN 1 ELSE 0 END),
					SUM (CASE WHEN grouping_2 = 'Female' THEN 1 ELSE 0 END)
			FROM	generic_report_details
			WHERE	session_id	=	@p_session_id
			GROUP BY	grouping_1
			ORDER BY 2;
	END

END
GO


-- =============================================================================
-- Procedure GenerateHODsListwithDORAge
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateHODsListwithDORAge' AND xtype = 'P')
	DROP PROCEDURE GenerateHODsListwithDORAge
GO

CREATE PROCEDURE GenerateHODsListwithDORAge
(
	@p_satsang_centre_id 	satsang_centre_id,
	@p_satsang_centre_nm 	gnc_nm,
	@p_gender				VARCHAR (6),
	@p_session_id			INTEGER				OUTPUT
)
AS

BEGIN

	INSERT INTO	generic_report_headers
		(	report_header, extra_information_header	)
	VALUES
		(	'Heads of Departments List (Age & DOR)', 'Age   YOA  Responsibility Date ' )


	SELECT	@p_session_id = SCOPE_IDENTITY();

	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
		SELECT	@p_session_id,
				@p_satsang_centre_id,
				sr.sewadar_grno,
				space (1)
						+ CONVERT (CHAR (2), DATEDIFF (YEAR, birth_dtm, GetDate())) + SPACE (2)
						+ CONVERT (CHAR (4), DATEPART (YY, appointment_dt)) + SPACE (2)
						+ CONVERT (VARCHAR (11), responsibility_dtm, 106)
		FROM	sewadars_registrations	sr
			JOIN	sewadars	s
				ON	(	sr.satsang_centre_id		=		@p_satsang_centre_id
					AND	responsibility				IN		('Head', 'Second Head', 'Third Head', 'Fourth Head')
					AND	s.sewadar_id				=		sr.sewadar_id
					AND	gender						LIKE	@p_gender
					)
				
END
GO

-- =========================================================================================================
-- Procedure GenerateStateWiseSewadarList
-- =========================================================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateStateWiseSewadarList' AND xtype = 'P')
	DROP PROCEDURE GenerateStateWiseSewadarList
GO

CREATE PROCEDURE GenerateStateWiseSewadarList
(
	@p_satsang_centre_id 	satsang_centre_id,
	@p_satsang_centre_nm 	gnc_nm,
	@p_country_ids			report_xml_prm,
	@p_state_ids			report_xml_prm,
	@p_gender				VARCHAR (6),
	@p_sewadar_list_id		sewadar_list_id,
	@p_is_summary			Boolean,
	@p_session_id			INTEGER				OUTPUT
)
AS
	DECLARE
		@extra_information		report_description,
		@report_header			report_description,
		@sewadar_list_nm		 gnc_long_nm,
		@rval					INT;

BEGIN
	SELECT	@sewadar_list_nm	=	sewadar_list_nm
	FROM	generic_sewadar_lists
	WHERE	sewadar_list_id	=	@p_sewadar_list_id;

	DECLARE	@states		TABLE	(	id		INT	);
	DECLARE	@hdoc		INT;
	
	IF (@p_state_ids IS NOT NULL)
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_state_ids; 
		INSERT INTO	@states 
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT) 
		EXEC sp_xml_removedocument @hdoc
	END
	ELSE IF (@p_country_ids IS NOT NULL)
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_country_ids; 
		INSERT INTO	@states 
			SELECT	DISTINCT	state_id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
					WITH	(id	INT) 
				JOIN CDB..states
					ON	(	id = country_id	)
		EXEC sp_xml_removedocument @hdoc
	END
	ELSE
	BEGIN	
		INSERT INTO	@states
			SELECT	state_id
			FROM	CDB..states
			WHERE	effective_till	>	GetDate();
	END	

	IF (@p_is_summary = 'No')
	BEGIN
		SET @report_header = 'State-wise List of Sewadars '
		SET @extra_information = 'Address'
	END
	ELSE
	BEGIN
		SET @report_header = 'State-wise Summary of Sewadars '
		SET @extra_information = 'Department'
	END
	IF (@p_sewadar_list_id	IS NOT	NULL AND @sewadar_list_nm IS NOT NULL)					--- Restrict to Sewadar List
		SET @report_header += ' as per ' + @sewadar_list_nm;

	INSERT INTO	generic_report_headers
			(	report_header, major_information_header	)
		VALUES
			(	@report_header, @extra_information	);

	SELECT	@p_session_id = SCOPE_IDENTITY();

	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
		SELECT	@p_session_id,
				@p_satsang_centre_id,
				sr.sewadar_grno,
				RTRIM (sad.address_line_1) + ', '
						+ COALESCE (RTRIM (sad.address_line_2) + ', ', '')
						+ RTRIM (poc.post_office_or_city_nm) + ', '
						+ RTRIM (doc.district_nm) + ', '
						+ COALESCE ('- ' + RTRIM (sad.pin_or_zip_code) + ', ', '')
						+ RTRIM	(st.state_nm)
		FROM 	sewadars	s
			JOIN	sewadars_registrations	sr
				ON	(	s.sewadar_id				=		sr.sewadar_id
					AND sr.satsang_centre_id		=		@p_satsang_centre_id
					AND	gender						LIKE	@p_gender
					AND	s.global_sewadar_status_cd	IS NULL
					)
			JOIN	system_information_values	iv
				ON	(	iv.system_info_cd	=	'SttsActv'
					AND	iv.value_varchar	=	sewadar_status_cd
					)
			JOIN	sewadars_details	sd
				ON	(	sd.sewadar_id	=	sr.sewadar_id	)
			
			JOIN	sewadars_addresses	 sad 
				ON  (	sad.sewadar_id = sd.sewadar_id 
					AND sad.address_type = 'Residence'
					)
			JOIN	post_offices_or_cities poc 
				ON  (	poc.post_office_or_city_id = sad.post_office_or_city_id	)
			
			JOIN	CDB..districts_or_cities doc 
				ON  (	poc.district_id = doc.district_or_city_id	)
			
			JOIN	@states
				ON	(	doc.state_id	=	id	)
			
			JOIN	CDB..states st 
				ON  (	st.state_id = id	)
			LEFT JOIN generic_sewadar_lists_sewadars	sl
				ON	(	sl.satsang_centre_id =	sr.satsang_centre_id
					AND	sl.sewadar_grno		 =	sr.sewadar_grno
					AND	sl.sewadar_list_id	 =	@p_sewadar_list_id
					)
			WHERE 	(	(	@p_sewadar_list_id IS NOT NULL	AND	sl.sewadar_grno IS NOT NULL	)
					OR	(	@p_sewadar_list_id IS NULL	)
					)
	
	IF (@p_is_summary = 'Yes')
	BEGIN
		EXEC	@rval =	SummariseSessionDeptWise	@p_session_id
		IF (@rval != 0)
			RETURN @rval;
	END

END
GO

-- =============================================================================
-- Procedure GenerateSubDepartmentsList
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateSubDepartmentsList' AND xtype = 'P')
	DROP PROCEDURE GenerateSubDepartmentsList
GO

CREATE PROCEDURE GenerateSubDepartmentsList
(
	@p_satsang_centre_id 	satsang_centre_id,
	@p_satsang_centre_nm 	gnc_nm,
	@p_gender				VARCHAR (6),
	@p_session_id			INTEGER				OUTPUT
)
AS

BEGIN

	INSERT INTO	generic_report_headers
			(	report_header, major_information_header, extra_information_header	)
		VALUES
			(	CASE WHEN @p_Gender = '%' THEN '' WHEN @p_gender = 'Male' THEN 'Males ' ELSE 'Females ' END + 'Departments with Sub-departments List', 'Department', '' 	)

	SELECT	@p_session_id = SCOPE_IDENTITY();

	
	INSERT	INTO	generic_report_synopsis 
			(	session_id, major_information, extra_information	)
			SELECT	@p_session_id, department_nm, ''
			FROM	departments	d
			WHERE	EXISTS	(SELECT	TOP 1 department_id
							 FROM 	sewadars	s
								JOIN	sewadars_registrations	sr
									ON	(	s.sewadar_id				=		sr.sewadar_id
										AND sr.satsang_centre_id		=		@p_satsang_centre_id
										AND	gender						LIKE	@p_gender
										AND	s.global_sewadar_status_cd	IS NULL
										AND sr.department_id			=		d.department_id
										AND	sr.sub_department_id		IS NULL
										)
								JOIN	system_information_values	iv
									ON	(	iv.system_info_cd	=	'SttsGenUse'
										AND	iv.value_varchar	=	sewadar_status_cd
										)		
							)		
							 
							
			UNION
			
			SELECT	@p_session_id, department_nm + ' (' + sub_department_nm + ')', 	''
			FROM	departments	d
				JOIN	sub_departments sd
					ON	(	sd.department_id	=	d.department_id )
			WHERE	EXISTS	(SELECT	TOP 1 department_id
							 FROM 	sewadars	s
								JOIN	sewadars_registrations	sr
									ON	(	s.sewadar_id				=		sr.sewadar_id
										AND sr.satsang_centre_id		=		@p_satsang_centre_id
										AND	gender						LIKE	@p_gender
										AND	s.global_sewadar_status_cd	IS NULL
										AND sr.department_id			=		sd.department_id
										AND	sr.sub_department_id		=		sd.sub_department_id
										)
								JOIN	system_information_values	iv
									ON	(	iv.system_info_cd	=	'SttsGenUse'
										AND	iv.value_varchar	=	sewadar_status_cd
										)		
							)
			ORDER BY	2

END
GO

-- =============================================================================
-- Procedure GenerateOtherSewadarRegister
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateOtherSewadarRegister' AND xtype = 'P')
	DROP PROCEDURE GenerateOtherSewadarRegister
GO

CREATE PROCEDURE GenerateOtherSewadarRegister
(
	@p_satsang_centre_id 	satsang_centre_id,
	@p_satsang_centre_nm 	gnc_nm,
	@p_department_ids		report_xml_prm,
	@p_sub_department_ids	report_xml_prm,
	@p_is_outstation		VARCHAR (3),
	@p_gender				VARCHAR (6),
	@p_sewadar_list_id		sewadar_list_id,
	@p_session_id			INTEGER				OUTPUT
)
AS
	DECLARE
		@sewadar_list_nm		 	gnc_long_nm,
		@extra_information_header	report_description,
		@extra_information			report_description

BEGIN
	SELECT	@sewadar_list_nm	=	sewadar_list_nm
	FROM	generic_sewadar_lists
	WHERE	sewadar_list_id	=	@p_sewadar_list_id;

	DECLARE	@depts		TABLE	(	id	INT	);
	DECLARE	@sub_depts	TABLE	(	id	INT	);
	DECLARE @hdoc INT;	

	IF (@p_department_ids IS NULL)
		INSERT INTO	@depts
			SELECT	department_id
			FROM	departments_satsang_centres
			WHERE	satsang_centre_id	=	@p_satsang_centre_id
			AND		effective_till	>	GetDate();
	ELSE
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_department_ids; 
		INSERT INTO	@depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT);
		EXEC sp_xml_removedocument @hdoc;
	END
		
	IF (@p_sub_department_ids IS NOT NULL)
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_sub_department_ids; 
		INSERT INTO	@sub_depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT) 
		EXEC sp_xml_removedocument @hdoc
	END

	SELECT	@extra_information_header = 'Age   YOA  Status   Telephone'
	SET	@extra_information = ''

	IF (@p_is_outstation = 'Yes')
		SELECT @extra_information = @extra_information + ' for Outside Sewadars'
	ELSE IF (@p_is_outstation = 'No')
		SELECT @extra_information = @extra_information + ' for Local Sewadars'

	IF (@p_sewadar_list_id	IS NOT	NULL AND @sewadar_list_nm IS NOT NULL)					--- Restrict to Sewadar List
		SELECT @extra_information = @extra_information + ' as per ' + @sewadar_list_nm;

	INSERT INTO	generic_report_headers
			(	report_header, extra_information_header	)
		VALUES
			('Other Sewadars List (Non-Initiate, InActive, Unwanted, Retired & Transfer Sought) for ' + @extra_information,
			  @extra_information_header
			)

	SELECT	@p_session_id = SCOPE_IDENTITY();

	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
		SELECT	@p_session_id,
				@p_satsang_centre_id,
				sr.sewadar_grno,
				space (1)
						+ CONVERT (CHAR (2), DATEDIFF (YEAR, birth_dtm, GetDate())) + SPACE (2)
						+ CONVERT (CHAR(4), DATEPART (YY, appointment_dt)) + SPACE (2)
						+ sr.sewadar_status_cd + SPACE (3)
						+ COALESCE (telephone_mobile, COALESCE (telephone_residence, ''))
		FROM	sewadars_registrations	sr
			JOIN	sewadars	s
				ON	(	s.sewadar_id				=		sr.sewadar_id
					AND sr.satsang_centre_id		=		@p_satsang_centre_id
					AND	s.global_sewadar_status_cd	IS NULL
					AND	gender						LIKE	@p_gender
					AND	is_outstation_sewadar		LIKE	@p_is_outstation
					)
			JOIN	@depts
				ON	(	sr.department_id	=	id	)
			JOIN	sewadars_details	sd
				ON	(	sd.sewadar_id	=	sr.sewadar_id	)
			LEFT	JOIN	@sub_depts	x
				ON	(	sr.sub_department_id	=	x.id	)			
			LEFT JOIN generic_sewadar_lists_sewadars	sl
				ON	(	sl.satsang_centre_id =	sr.satsang_centre_id
					AND	sl.sewadar_grno		 =	sr.sewadar_grno
					AND	sl.sewadar_list_id	 =	@p_sewadar_list_id
					)
		WHERE	NOT EXISTS	(	SELECT	1
								FROM	system_information_values	iv
								WHERE	iv.system_info_cd		=		'SttsActv'
								AND		sr.sewadar_status_cd	=		iv.value_varchar	
							)
		AND 	(	(	@p_sub_department_ids	IS NOT NULL	AND	x.id	IS NOT NULL	)
				OR	(	@p_sub_department_ids	IS NULL								)
				)
		AND		(	(	@p_sewadar_list_id IS NOT NULL	AND	sl.sewadar_grno IS NOT NULL	)
				OR	(	@p_sewadar_list_id IS NULL										)
				)
	END
GO

-- =============================================================================
-- Procedure GenerateInActiveDeptSewadars
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateInActiveDeptSewadars' AND xtype = 'P')
	DROP PROCEDURE GenerateInActiveDeptSewadars
GO

CREATE PROCEDURE GenerateInActiveDeptSewadars
(
	@p_satsang_centre_id 	satsang_centre_id,
	@p_satsang_centre_nm 	gnc_nm,
	@p_statuses				report_xml_prm,
	@p_gender				VARCHAR (6),
	@p_is_summary			Boolean,
	@p_session_id			INTEGER				OUTPUT
)
AS
	DECLARE
		@extra_information_header	report_description,
		@rval						INT,
		@extra_information			report_description

BEGIN
	DECLARE	@statuses	TABLE	(	stts	VARCHAR (4)	);
	DECLARE @hdoc INT;

	IF (@p_statuses IS NULL)
		INSERT INTO	@statuses
			SELECT	sewadar_status_cd
			FROM	sewadar_status
			WHERE	effective_till	>	GetDate();
	ELSE
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_statuses; 
		INSERT INTO	@statuses
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	VARCHAR (4)) 
		EXEC sp_xml_removedocument @hdoc
	END
	
	IF (@p_is_summary = 'Yes')
		BEGIN
			SELECT	@extra_information	=	'Summary of Sewadars in InActive Departments'
			SELECT	@extra_information_header = 'Department'
			--IF (@p_status <> '' AND @p_status IS NOT NULL)
			--	SELECT	@extra_information	=	@extra_information + ' having status' +  ' -' + stts FROM  @statuses
			INSERT INTO	generic_report_headers
					(	report_header, major_information_header	)
				VALUES
					(	@extra_information, @extra_information_header	)
		END
	ELSE
		BEGIN
			SELECT	@extra_information	=	'List of Sewadars in InActive Departments'
			SELECT	@extra_information_header = 'Age   YOA  Status          Telephone-Res.'
			INSERT INTO	generic_report_headers
					(	report_header, extra_information_header	)
				VALUES
					(	@extra_information, @extra_information_header	)
		END



	SELECT	@p_session_id = SCOPE_IDENTITY();

	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
		SELECT	@p_session_id,
				@p_satsang_centre_id,
				sr.sewadar_grno,
				space (1)
						+ CONVERT (CHAR (2), DATEDIFF (YEAR, birth_dtm, GetDate())) + SPACE (2)
						+ CONVERT (CHAR(4), DATEPART (YY, appointment_dt)) + SPACE (2)
						+ sr.sewadar_status_cd + ' '
						+ COALESCE (telephone_residence, SPACE(0))
		FROM	sewadars_registrations	sr
			JOIN	@statuses
				ON	(	sr.satsang_centre_id	=	@p_satsang_centre_id
					AND	sr.sewadar_status_cd	=	stts
					)
			JOIN	sewadars	s
				ON	(	s.sewadar_id				=		sr.sewadar_id
					AND	gender						LIKE	@p_gender
					AND	s.global_sewadar_status_cd	IS NULL
					)
			JOIN	sewadars_details	sd
				ON	(	sd.sewadar_id	=	sr.sewadar_id	)
			
			JOIN 	departments_satsang_centres dsc
				ON	(	dsc.department_id		=	sr.department_id
					AND	dsc.satsang_centre_id	=	sr.satsang_centre_id
					AND	dsc.effective_till		<	GetDate()
					)

	IF (@p_is_summary = 'Yes')
	BEGIN
		EXEC	@rval =	SummariseSessionDeptWise	@p_session_id
		IF (@rval != 0)
			RETURN @rval;
	END


END
GO

-- =============================================================================
-- Procedure GenerateMissingAddressesList
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateMissingAddressesList' AND xtype = 'P')
	DROP PROCEDURE GenerateMissingAddressesList
GO

CREATE PROCEDURE GenerateMissingAddressesList
(
	@p_satsang_centre_id 	satsang_centre_id,
	@p_satsang_centre_nm 	gnc_nm,
	@p_statuses				report_xml_prm,
	@p_gender				VARCHAR (6),
	@p_is_summary			Boolean,
	@p_session_id			INTEGER				OUTPUT
)
AS
	DECLARE
		@extra_information_header	report_description,
		@rval						INT,
		@extra_information			report_description

BEGIN
	DECLARE	@statuses	TABLE	(	stts	VARCHAR (4)	);
	DECLARE @hdoc INT;

	IF (@p_statuses IS NULL)
		INSERT INTO	@statuses
			SELECT	sewadar_status_cd
			FROM	sewadar_status
			WHERE	effective_till	>	GetDate();
	ELSE
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_statuses; 
		INSERT INTO	@statuses
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	VARCHAR (4)) 
		EXEC sp_xml_removedocument @hdoc
	END
	
	IF (@p_is_summary = 'Yes')
		BEGIN
			SELECT	@extra_information	=	'Summary of Sewadars with Missing Addresses'
			SELECT	@extra_information_header = 'Department'
			--IF (@p_status <> '' AND @p_status IS NOT NULL)
			--	SELECT	@extra_information	=	@extra_information + ' having status' +  ' -' + stts FROM  @statuses
			INSERT INTO	generic_report_headers
					(	report_header, major_information_header	)
				VALUES
					(	@extra_information, @extra_information_header	)
		END
	ELSE
		BEGIN
			SELECT	@extra_information	=	'List of Sewadars with Missing Addresses'
	--		SELECT	@extra_information_header = 'Age   YOA  Status'
			INSERT INTO	generic_report_headers
					(	report_header, extra_information_header	)
				VALUES
					(	@extra_information, @extra_information_header	)
		END



	SELECT	@p_session_id = SCOPE_IDENTITY();

	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
		SELECT	@p_session_id,
				sr.satsang_centre_id,
				sr.sewadar_grno,
				space (1)
	/*
						+ CONVERT (CHAR (2), DATEDIFF (YEAR, birth_dtm, GetDate())) + SPACE (2)
						+ CONVERT (CHAR(4), DATEPART (YY, appointment_dt)) + SPACE (2)
						+ sr.sewadar_status_cd
	*/
		FROM	sewadars_registrations	sr
			JOIN	@statuses
				ON	(	sr.satsang_centre_id	=	@p_satsang_centre_id
					AND	sr.sewadar_status_cd	=	stts
					)
			JOIN	sewadars	s
				ON	(	s.sewadar_id		=		sr.sewadar_id
					AND	gender						LIKE	@p_gender
					)
		WHERE	NOT EXISTS	(	SELECT	1
								FROM	sewadars_addresses	a
								WHERE	a.sewadar_id	=	sr.sewadar_id
							)

	IF (@p_is_summary = 'Yes')
	BEGIN
		EXEC	@rval =	SummariseSessionDeptWise	@p_session_id
		IF (@rval != 0)
			RETURN @rval;
	END
	ELSE
	BEGIN
		EXEC	@rval =	MakeListReport	@p_session_id;
		IF (@rval != 0)
			RETURN @rval;
	END
END
GO

-- =============================================================================
-- Procedure GenerateSpclstnAreaSewadarList
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateSpclstnAreaSewadarList' AND xtype = 'P')
	DROP PROCEDURE GenerateSpclstnAreaSewadarList
GO

CREATE PROCEDURE GenerateSpclstnAreaSewadarList
(
	@p_satsang_centre_id 	satsang_centre_id,
	@p_satsang_centre_nm 	gnc_nm,
	@p_skill_id				skill_id,
	@p_skill_nm				gnc_nm,
	@p_gender				VARCHAR (6),
	@p_sewadar_list_id		sewadar_list_id,
	@p_session_id			INTEGER				OUTPUT
)
AS
	DECLARE
		@sewadar_list_nm		 	gnc_long_nm
BEGIN
	SELECT	@sewadar_list_nm	=	sewadar_list_nm
	FROM	generic_sewadar_lists
	WHERE	sewadar_list_id	=	@p_sewadar_list_id;

	IF (@p_sewadar_list_id	IS NOT	NULL AND @sewadar_list_nm IS NOT NULL)					--- Restrict to Sewadar List
		INSERT INTO	generic_report_headers
				(	report_header, extra_information_header	)
			VALUES
				(	'Sewadars List with ' +  COALESCE ( @p_skill_nm, '') + ' Skill as per ' + @sewadar_list_nm,
					'Age   YOA  Status Telephone-Res.'	)
	ELSE
		INSERT INTO	generic_report_headers
				(	report_header, extra_information_header	)
			VALUES
				(	'Sewadars List with ' +  COALESCE ( @p_skill_nm, '') + ' Skill',
					'Age   YOA  Status Telephone-Res.'	)

	SELECT	@p_session_id = SCOPE_IDENTITY();

	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
		SELECT	@p_session_id,
				@p_satsang_centre_id,
				sr.sewadar_grno,
				space (1)
						+ CONVERT (CHAR (2), DATEDIFF (YEAR, birth_dtm, GetDate())) + SPACE (2)
						+ CONVERT (CHAR(4), DATEPART (YY, appointment_dt)) + SPACE (2)
						+ sr.sewadar_status_cd + ' '
						+ COALESCE (telephone_residence, SPACE(0))
		FROM	sewadars_registrations	sr
			JOIN	sewadars	s
				ON	(	s.sewadar_id				=		sr.sewadar_id
					AND sr.satsang_centre_id		=		@p_satsang_centre_id
					AND	gender						LIKE	@p_gender
					AND	s.global_sewadar_status_cd	IS NULL
					)
			JOIN	system_information_values	iv
				ON	(	iv.system_info_cd	=	'SttsActv'
					AND	iv.value_varchar	=	sewadar_status_cd
					)		
			JOIN	sewadars_details	sd
				ON	(	sd.sewadar_id	=	s.sewadar_id	)
			JOIN	sewadars_skills		ss
				ON	(	ss.sewadar_id	=	sr.sewadar_id
					AND	ss.skill_id		=	@p_skill_id
					)
			LEFT JOIN generic_sewadar_lists_sewadars	sl
				ON	(	sl.satsang_centre_id =	sr.satsang_centre_id
					AND	sl.sewadar_grno		 =	sr.sewadar_grno
					AND	sl.sewadar_list_id	 =	@p_sewadar_list_id
					)
			WHERE (	(	@p_sewadar_list_id IS NOT NULL	AND	sl.sewadar_grno IS NOT NULL	)
					OR	(	@p_sewadar_list_id IS NULL	)
					)

END
GO

-- ======================================================================================================================
-- FUNCTION GetSewadarQualifications
-- ======================================================================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GetSewadarQualifications' AND xtype = 'FN')
	DROP FUNCTION GetSewadarQualifications
GO

CREATE FUNCTION GetSewadarQualifications
(
	@p_sewadar_id			sewadar_id
)
RETURNS
	VARCHAR (100)
AS
BEGIN
	DECLARE @return_str	VARCHAR (100);
	DECLARE	@qual		TABLE	(	qual_cd VARCHAR(8),qlfctn_subj VARCHAR(20) 	);
		
			
	INSERT INTO @qual
		SELECT	qualification_cd, qs.qlfctn_subject_nm
			FROM	sewadars_qualifications		sq
				JOIN 	CDB..qualifications		q
					ON	(	sq.sewadar_id			=	@p_sewadar_id
						AND	q.qualification_id		=	sq.qualification_id
						)
				LEFT JOIN	CDB..qlfctn_subjects	qs
					ON	(	qs.qlfctn_subject_id	=	sq.qlfctn_subject_id	);
									
	SET @return_str = '' 
	SELECT @return_str =  @return_str + qual_cd + COALESCE ( '(' + qlfctn_subj + ')', '' ) + ', ' FROM @qual
	
	IF(LEN (@return_str) > 1)
		SET @return_str = LEFT (@return_str, LEN (@return_str) - 1);
	
	RETURN @return_str
									
END
GO

-- =============================================================================
-- Procedure GenerateQlfctnCtgrySewadarList
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateQlfctnCtgrySewadarList' AND xtype = 'P')
	DROP PROCEDURE GenerateQlfctnCtgrySewadarList
GO

CREATE PROCEDURE GenerateQlfctnCtgrySewadarList
(
	@p_satsang_centre_id 		satsang_centre_id,
	@p_satsang_centre_nm 		gnc_nm,
	@p_qualification_type		VARCHAR (16),
	@p_gender					VARCHAR (6),
	@p_sewadar_list_id			sewadar_list_id,
	@p_session_id				INTEGER				OUTPUT
)
AS
	DECLARE
		@sewadar_list_nm		 	gnc_long_nm
BEGIN

	IF (@p_sewadar_list_id	IS NOT	NULL AND @sewadar_list_nm IS NOT NULL)					--- Restrict to Sewadar List
		INSERT INTO	generic_report_headers
				(	report_header, extra_information_header	)
			VALUES
				('List of Sewadars with Qualification Category as ' + RTRIM (@p_qualification_type) + ' as per ' + @sewadar_list_nm,
				'Age   YOA  Status Qualifications'
				)
	ELSE
		INSERT INTO	generic_report_headers
				(	report_header, extra_information_header	)
			VALUES
				('List of Sewadars with Qualification Category as ' + RTRIM (@p_qualification_type),
				'Age   YOA  Status Qualifications'
				)

	SELECT	@p_session_id = SCOPE_IDENTITY();

	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
		SELECT	@p_session_id,
				@p_satsang_centre_id,
				sr.sewadar_grno,
				space (1)
						+ CONVERT (CHAR (2), DATEDIFF (YEAR, birth_dtm, GetDate())) + SPACE (2)
						+ CONVERT (CHAR(4), DATEPART (YY, appointment_dt)) + SPACE (2)
						+ sr.sewadar_status_cd + SPACE (2)
						+ dbo.GetSewadarQualifications (sr.sewadar_id)
		FROM	sewadars_registrations	sr 
			JOIN	sewadars	s
				ON	(	s.sewadar_id				=		sr.sewadar_id
					AND	gender						LIKE	@p_gender
					AND	s.global_sewadar_status_cd	IS NULL
					)
			JOIN	system_information_values	iv
				ON	(	iv.system_info_cd	=	'SttsActv'
					AND	iv.value_varchar	=	sewadar_status_cd
					)		
			JOIN	sewadars_details	sd
				ON	(	sd.sewadar_id	=	sr.sewadar_id	)
			LEFT JOIN generic_sewadar_lists_sewadars	sl
				ON	(	sl.satsang_centre_id =	sr.satsang_centre_id
					AND	sl.sewadar_grno		 =	sr.sewadar_grno
					AND	sl.sewadar_list_id	 =	@p_sewadar_list_id
					)
			WHERE (	(	@p_sewadar_list_id IS NOT NULL	AND	sl.sewadar_grno IS NOT NULL	)
					OR	(	@p_sewadar_list_id IS NULL	)
					)
			AND	sr.satsang_centre_id = @p_satsang_centre_id 
				AND EXISTS	(	SELECT	1
							FROM	sewadars_qualifications		sq
								JOIN 	CDB..qualifications		q
							ON	(	sq.sewadar_id			=	sr.sewadar_id
								AND	q.qualification_id		=	sq.qualification_id
								AND	q.qualification_type	=	@p_qualification_type
								)
						);

END
GO


-- =============================================================================
-- Procedure GenerateSewadarsAddrTelList
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateSewadarsAddrTelList' AND xtype = 'P')
	DROP PROCEDURE GenerateSewadarsAddrTelList
GO

CREATE PROCEDURE GenerateSewadarsAddrTelList
(
	@p_satsang_centre_id 	satsang_centre_id,
	@p_satsang_centre_nm 	gnc_nm,
	@p_department_ids		report_xml_prm,
	@p_sub_department_ids	report_xml_prm,
	@p_is_outstation		VARCHAR (3),
	@p_gender				VARCHAR (6),
	@p_area_id				satsang_centre_id,
	@p_area_nm			 	gnc_nm,
	@p_sewadar_list_id		sewadar_list_id,
	@p_session_id			INTEGER				OUTPUT
)
AS
	DECLARE
		@sewadar_list_nm		 	gnc_long_nm,
		@extra_information_header	report_description,
		@extra_information			report_description

BEGIN
	SELECT	@sewadar_list_nm	=	sewadar_list_nm
	FROM	generic_sewadar_lists
	WHERE	sewadar_list_id	=	@p_sewadar_list_id;

	DECLARE	@depts		TABLE	(	id	INT	);
	DECLARE	@sub_depts	TABLE	(	id	INT	);
	DECLARE	@centres	TABLE	(	id	INT	PRIMARY KEY,	typ	CHAR (1), ss_nm	VARCHAR (100)	);
	DECLARE @hdoc INT;
	
	IF (@p_department_ids IS NULL)
		SET @extra_information = ' for All Departments'
	ELSE
		SET @extra_information = ''

	IF (@p_department_ids IS NULL)
		INSERT INTO	@depts
			SELECT	department_id
			FROM	departments_satsang_centres
			WHERE	satsang_centre_id	=	@p_satsang_centre_id
			AND		effective_till	>	GetDate();
	ELSE
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_department_ids; 
		INSERT INTO	@depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT);
		EXEC sp_xml_removedocument @hdoc;
	END
		
	IF (@p_sub_department_ids IS NOT NULL)
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_sub_department_ids; 
		INSERT INTO	@sub_depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT) 
		EXEC sp_xml_removedocument @hdoc
	END
		
	IF (@p_area_id IS NOT NULL)
	BEGIN
		INSERT INTO	@centres
			SELECT	s.satsang_centre_id, 'C', s.satsang_centre_nm
			FROM	satsang_centres_details	c
				JOIN	CDB..satsang_centres	s
					ON	(	s.satsang_centre_id	=	c.satsang_centre_id
						AND	c.reports_to_centre_id	=	@p_area_id
						);
		
		INSERT INTO	@centres
			SELECT	s.satsang_centre_id, SUBSTRING (s.satsang_centre_type, 1, 1), ss_nm + ' - ' + s.satsang_centre_nm
			FROM	@centres	p
				JOIN	satsang_centres_details	c
					ON	(	c.reports_to_centre_id	=	p.id	)
				JOIN	CDB..satsang_centres	s
					ON	(	s.satsang_centre_id	=	c.satsang_centre_id	);
	END

	SET	@extra_information_header = 'Address (and Telephone(s))'
		
	IF (@p_is_outstation = 'Yes')
		SET @extra_information = @extra_information + ' for Outside Sewadars'
	ELSE IF (@p_is_outstation = 'No')
		SET @extra_information = @extra_information + ' for Local Sewadars'	
	
	IF (@p_area_id IS NOT NULL)
		SET @extra_information = @extra_information + ' for ' + @p_area_nm

	IF (@p_sewadar_list_id	IS NOT	NULL AND @sewadar_list_nm IS NOT NULL)					--- Restrict to Sewadar List
		SET @extra_information = @extra_information + ' as per ' + @sewadar_list_nm
	
	INSERT INTO	generic_report_headers
			(report_header, extra_information_header)
		VALUES
			('Sewadars List with Addresses (and Telephone(s)) ' + @extra_information,
			  @extra_information_header)

	SELECT	@p_session_id = @@IDENTITY

	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information,
				grouping_1, grouping_2	---, grouping_3
			)
		SELECT	@p_session_id,
				@p_satsang_centre_id,
				sr.sewadar_grno,
				sa.address_line_1 + ', '
				+	COALESCE (sa.address_line_2 + ', ', '')
				+	poc.post_office_or_city_nm
				+	CASE doc.district_nm	WHEN poc.post_office_or_city_nm		THEN ''
											WHEN scd.centre_nm					THEN ', ' + doc.district_nm
											ELSE ', Distt: ' + doc.district_nm 
					END
				+	CASE sa.pin_or_zip_code	WHEN '999999'	THEN ''
											ELSE COALESCE ( ' - ' + RTRIM (sa.pin_or_zip_code), '')
					END
				+	CASE st.state_nm		WHEN doc.district_nm	THEN ''
											ELSE ', ' + st.state_nm
					END
				+	CASE c.country_nm		WHEN 'India'		THEN ''
											WHEN st.state_nm	THEN ''
											ELSE ', ' + c.country_nm
					END
				+	CASE	WHEN	telephone_residence IS NULL		AND		telephone_office IS NULL	AND  telephone_mobile IS NULL
											THEN ''
							ELSE ' ('	+ COALESCE ('Res: ' + telephone_residence + ' ', '')
										+ COALESCE ('Off: ' + telephone_office + ' ', '')
										+ COALESCE ('Mbl: ' + telephone_mobile + ' ', '')
										+ ')'
					END,
				CASE	WHEN @p_area_id	IS NULL
							THEN	LTRIM (RTRIM (department_nm)) + COALESCE (' (' + LTRIM (RTRIM (sub_department_nm)) + ')', '')
							ELSE	ss_nm
				END,
/*				CASE	WHEN @p_area_id	IS NULL
							THEN	NULL
							ELSE	LTRIM (RTRIM (department_nm)) + COALESCE ('(' + LTRIM (RTRIM (sub_department_nm)) + ')', '')
				END,
*/				gender
		FROM	sewadars_registrations	sr
			JOIN	system_information_values	iv
				ON	(	iv.system_info_cd		=		'SttsGenUse'
					AND	iv.value_varchar		=		sewadar_status_cd
					AND	is_outstation_sewadar	LIKE	@p_is_outstation
					AND sr.satsang_centre_id	=		@p_satsang_centre_id
					)
			JOIN	sewadars	s
				ON	(	s.sewadar_id				=		sr.sewadar_id
					AND	gender						LIKE	@p_gender
					AND	s.global_sewadar_status_cd	IS NULL
					)
			JOIN	@depts
				ON	(	sr.department_id	=	id	)
			JOIN	sewadars_details	sd
				ON	(	sd.sewadar_id	=	sr.sewadar_id	)
			JOIN    sewadars_addresses	sa
				ON	(	sa.sewadar_id	=	sr.sewadar_id
					AND sa.address_type = 'Residence'
					)
			JOIN post_offices_or_cities poc 
				ON  (	poc.post_office_or_city_id	=	sa.post_office_or_city_id	)			
			JOIN CDB..districts_or_cities doc
				ON	(	doc.district_or_city_id	=	poc.district_id 	)
			LEFT JOIN satsang_centres_details	scd
				ON	(	scd.centre_nm		=	doc.district_nm	
					AND	scd.is_main_centre	=	'Yes'
					)
			JOIN	CDB..states st 
				ON  (	st.state_id	=	doc.state_id	)
			JOIN	CDB..countries	c
				ON	(	c.country_id	=	st.country_id	)					
			LEFT	JOIN	@sub_depts	x
				ON	(	sr.sub_department_id	=	x.id	)
			LEFT JOIN	@centres	ss
				ON	(	sd.weekly_satsang_centre_id	=	ss.id	)
			JOIN	departments dp
				ON	(	sr.department_id	=	dp.department_id	)
			LEFT JOIN	sub_departments sdp
				ON	(	sr.sub_department_id	=	sdp.sub_department_id	)
			LEFT JOIN generic_sewadar_lists_sewadars	sl
				ON	(	sl.satsang_centre_id =	sr.satsang_centre_id
					AND	sl.sewadar_grno		 =	sr.sewadar_grno
					AND	sl.sewadar_list_id	 =	@p_sewadar_list_id
					)
			WHERE (	(	@p_sewadar_list_id IS NOT NULL	AND	sl.sewadar_grno IS NOT NULL	)
					OR	(	@p_sewadar_list_id IS NULL	)
					)
			AND	(	(	@p_sub_department_ids	IS NOT NULL	AND	x.id	IS NOT NULL	)
					OR	(	@p_sub_department_ids	IS NULL					)
					)
			AND		(	(	@p_area_id	IS NOT  NULL	AND	ss.id	IS NOT NULL	)
					OR	(	@p_area_id	IS NULL		)
					);
END
GO


-- =============================================================================
-- Procedure GenerateSewadarsQualifications
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateSewadarsQualifications' AND xtype = 'P')
	DROP PROCEDURE GenerateSewadarsQualifications
GO

CREATE PROCEDURE GenerateSewadarsQualifications
(
	@p_satsang_centre_id 	satsang_centre_id,
	@p_satsang_centre_nm 	gnc_nm,
	@p_department_ids		report_xml_prm,
	@p_is_outstation		VARCHAR (3),
	@p_gender				VARCHAR (6),
	@p_sewadar_list_id		sewadar_list_id,
	@p_session_id			INTEGER				OUTPUT
)
AS
	DECLARE
		@sewadar_list_nm		 	gnc_long_nm,
		@extra_information_header	report_description,
		@extra_information			report_description

BEGIN
	SELECT	@sewadar_list_nm	=	sewadar_list_nm
	FROM	generic_sewadar_lists
	WHERE	sewadar_list_id	=	@p_sewadar_list_id;

	DECLARE	@depts		TABLE	(	id	INT	);
	DECLARE @hdoc INT;
	
	IF (@p_department_ids IS NULL)
		SET @extra_information = ' for All Departments'
	ELSE
		SET @extra_information = ''

	IF (@p_department_ids IS NULL)
		INSERT INTO	@depts
			SELECT	department_id
			FROM	departments_satsang_centres
			WHERE	satsang_centre_id	=	@p_satsang_centre_id
			AND		effective_till	>	GetDate();
	ELSE
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_department_ids; 
		INSERT INTO	@depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT);
		EXEC sp_xml_removedocument @hdoc;
	END
		
	SET	@extra_information_header = 'Qualification(s)'
	
		
	IF (@p_is_outstation = 'Yes')
		SET @extra_information = @extra_information + ' for Outside Sewadars'
	ELSE IF (@p_is_outstation = 'No')
		SET @extra_information = @extra_information + ' for Local Sewadars'	
	
	IF (@p_sewadar_list_id	IS NOT	NULL AND @sewadar_list_nm IS NOT NULL)					--- Restrict to Sewadar List
		SET @extra_information = @extra_information + ' as per ' + @sewadar_list_nm;
	
	INSERT INTO	generic_report_headers
			(report_header, extra_information_header)
		VALUES
			('Sewadars List with Qualification(s) ' + @extra_information, @extra_information_header)

	SELECT	@p_session_id = @@IDENTITY

	INSERT	INTO	generic_report_details
			(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
		SELECT	@p_session_id,
				@p_satsang_centre_id,
				sr.sewadar_grno,
				dbo.GetSewadarQualifications (sr.sewadar_id)
		FROM	sewadars_registrations	sr
			JOIN	system_information_values	iv
				ON	(	iv.system_info_cd		=		'SttsGenUse'
					AND	iv.value_varchar		=		sewadar_status_cd
					AND	is_outstation_sewadar	LIKE	@p_is_outstation
					AND sr.satsang_centre_id	=		@p_satsang_centre_id
					)
			JOIN	sewadars	s
				ON	(	s.sewadar_id				=		sr.sewadar_id
					AND	gender						LIKE	@p_gender
					AND	s.global_sewadar_status_cd	IS NULL
					)
			JOIN	@depts
				ON	(	sr.department_id	=	id	)
			LEFT JOIN generic_sewadar_lists_sewadars	sl
				ON	(	sl.satsang_centre_id =	sr.satsang_centre_id
					AND	sl.sewadar_grno		 =	sr.sewadar_grno
					AND	sl.sewadar_list_id	 =	@p_sewadar_list_id
					)
			WHERE (	(	@p_sewadar_list_id IS NOT NULL	AND	sl.sewadar_grno IS NOT NULL	)
					OR	(	@p_sewadar_list_id IS NULL	)
					)
END
GO

-- =============================================================================
--	Procedure	GetSewadarOtherDisabilities
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GetSewadarOtherDisabilities' AND xtype = 'FN')
	DROP FUNCTION GetSewadarOtherDisabilities
GO
CREATE FUNCTION GetSewadarOtherDisabilities
(
	@sewadar_id		sewadar_id
)
RETURNS VARCHAR (200)
AS
BEGIN
	DECLARE
		@dtls	VARCHAR (200);
	SET @dtls = '';
	SELECT	@dtls = @dtls + ' [' + medical_disability_nm + ']'
	FROM	sewadars_other_disabilities	o
		JOIN	medical_disabilities	m
			ON	(	o.medical_disability_id	=	m.medical_disability_id	)
	WHERE	o.sewadar_id	=	@sewadar_id
	ORDER BY	o.medical_disability_sq;

	RETURN	@dtls;
END
GO
-- =============================================================================
--	Procedure	QuerySewadarPrintDetails
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QuerySewadarPrintDetails'
			)
	BEGIN
		DROP PROCEDURE  QuerySewadarPrintDetails
	END
GO
CREATE PROCEDURE QuerySewadarPrintDetails
(
		@sewadar_id						sewadar_id,
		@sewadar_gr_no					sewadar_grno
)
WITH ENCRYPTION
AS
DECLARE 
	@generic_attribute_id	INT
BEGIN

	SELECT @generic_attribute_id = attribute_id
	FROM generic_attributes 
	WHERE attribute_nm= 'Biometric Record Date'
	
	SELECT 
		s.sewadar_id,
		s.first_nm,
		s.middle_nm,
		s.last_nm,
		s.gender,
		s.is_married,
		Birth_dt = CONVERT(VARCHAR, s.birth_dtm, 106),
		age = DATEDIFF(year, s.birth_dtm, GETDATE()),
		appointmentDate = CONVERT(VARCHAR, sr.appointment_dt, 106) + ' since ' 
			+ CONVERT(VARCHAR, DATEDIFF(year, sr.appointment_dt, GETDATE())) + ' years',
		initiation_details = 'Initiated on ' + CONVERT(VARCHAR, s.initiation_dt, 106) + ' at ' + ip.place_nm,
		dbo.GetSewadarQualifications (sr.sewadar_id) as Qualification,
		dep.department_nm,
		sub_dep.sub_department_nm,
		current_sewadar_status_nm = ss_cur.sewadar_status_nm,
		sd.occupation,
		ad.address_line_1,
		ad.address_line_2,
		poc.post_office_or_city_nm,
		doc.district_nm,
		ad.pin_or_zip_code,
		st.state_nm,		
		c.country_nm,
		sd.telephone_mobile,
		sd.telephone_residence,
		sd.telephone_office,
		s_ap.first_nm + ' ' + SUBSTRING(s_ap.middle_nm, 1,1) + ' ' + s_ap.last_nm +' - '+ s_ap.current_sewadar_grno as approver_nm,
		s_spon.first_nm + ' ' + SUBSTRING(s_spon.middle_nm, 1,1) + ' ' + s_spon.last_nm + ' - ' + s_spon.current_sewadar_grno as sponsorer_nm,
		COALESCE (ref1.first_nm + ' ' + SUBSTRING(ref1.middle_nm, 1,1) + ' ' + ref1.last_nm, sr.reference_1_nm) + '('+ ref1_rel.relation_nm +')' AS reference_1,
		COALESCE (ref2.first_nm + ' ' + SUBSTRING(ref2.middle_nm, 1,1) + ' ' + ref2.last_nm, sr.reference_2_nm) + '('+ ref2_rel.relation_nm +')' AS reference_2,
		sp.sewadar_photo,
		sp.photo_dt,
		sc.centre_nm,
		CASE sr.is_outstation_sewadar WHEN 'Yes' THEN 'Outstation' ELSE 'Local' END + ' Sewadar'								AS	sewadar_type,
		ss.satsang_centre_nm + CASE ss.satsang_centre_type WHEN 'Centre' THEN '' ELSE ' (' + rc.satsang_centre_nm + ')' END	AS	attends_satsang_at_centre,
		COALESCE (sd.address_proof, oap.address_proof_nm)																		AS	address_proof,
		CASE WHEN sd.has_hypertension		= 'Yes' THEN '[Hypertension]'	ELSE '' END
			+ CASE WHEN sd.is_diabetic		= 'Yes' THEN ' [Diabetic]'		ELSE '' END
			+ CASE WHEN sd.has_skin_problem	= 'Yes' THEN ' [Skin Problem]'	ELSE '' END
			+ CASE WHEN sd.has_epillepsy	= 'Yes' THEN ' [Epillepsy]'		ELSE '' END
			+ dbo.GetSewadarOtherDisabilities (sr.sewadar_id)												AS	medical_details,
		CASE CONVERT(VARCHAR, sa.[date_value], 106) WHEN NULL  THEN '' ELSE 'Biometric Record Date - ' + CONVERT(VARCHAR, sa.[date_value], 106) END as BiometricData
	FROM sewadars s
		JOIN sewadars_registrations sr
			ON	(	s.sewadar_id	=	sr.sewadar_id	)
		LEFT JOIN sewadars s_ap 
			ON	( s_ap.sewadar_id		=	sr.security_approver_id	)
		LEFT JOIN sewadars s_spon 
			ON ( s_spon.sewadar_id					=	sr.sponsorer_id)
		LEFT JOIN sewadars ref1
			ON ( ref1.sewadar_id					=	sr.reference_1_sewadar_id	)
		LEFT JOIN sewadars ref2
			ON ( ref2.sewadar_id					=	sr.reference_2_sewadar_id	)
		JOIN sewadars_details sd ON sd.sewadar_id = sr.sewadar_id
		JOIN satsang_centres_details	sc ON ( sc.satsang_centre_id = sr.satsang_centre_id )
		JOIN departments dep ON sr.department_id = dep.department_id	
		LEFT OUTER JOIN sub_departments sub_dep ON sr.sub_department_id = sub_dep.sub_department_id
		LEFT OUTER JOIN CDB..initiation_places ip ON ip.place_id = s.initiation_place_id
		JOIN sewadar_status ss_cur ON (COALESCE (s.global_sewadar_status_cd, sr.sewadar_status_cd) = ss_cur.sewadar_status_cd)
		LEFT OUTER JOIN sewadars_addresses ad ON ad.sewadar_id = sd.sewadar_id AND ad.address_type = 'Residence'
		LEFT OUTER JOIN post_offices_or_cities poc ON poc.post_office_or_city_id = ad.post_office_or_city_id
		LEFT OUTER JOIN CDB..districts_or_cities doc ON poc.district_id = doc.district_or_city_id
		LEFT OUTER JOIN CDB..states st ON st.state_id = doc.state_id
		LEFT OUTER JOIN CDB..countries c ON c.country_id = st.country_id
		LEFT OUTER JOIN CDB..relations ref1_rel ON ref1_rel.relation_id = sr.reference_1_relationship
		LEFT OUTER JOIN CDB..relations ref2_rel ON ref2_rel.relation_id = sr.reference_2_relationship
		LEFT OUTER JOIN ZSM_Photos..sewadars_photos sp ON s.sewadar_id = sp.sewadar_id
		LEFT JOIN	CDB..satsang_centres	ss
			ON	(	sd.weekly_satsang_centre_id	=	ss.satsang_centre_id	)
		LEFT JOIN	satsang_centres_details	scd
			ON	(	scd.satsang_centre_id	=	ss.satsang_centre_id	)
		LEFT JOIN	CDB..satsang_centres	rc
			ON	(	rc.satsang_centre_id	=	scd.reports_to_centre_id	)
		LEFT JOIN	other_address_proofs	oap
			ON	(	oap.address_proof_id	=	sd.other_address_proof_id	)
		LEFT JOIN [sewadars_attributes] sa ON (sa.sewadar_grno = sr.sewadar_grno 
											AND sa.satsang_centre_id = sr.satsang_centre_id 
											AND sa.attribute_id = @generic_attribute_id)
		
	WHERE s.sewadar_id = @sewadar_id
	AND	  sr.sewadar_grno = @sewadar_gr_no
	
END
GO

-- =============================================================================
-- Procedure GenerateInvalidSewaShiftsSewadars
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateInvalidSewaShiftsSewadars' AND xtype = 'P')
	DROP PROCEDURE GenerateInvalidSewaShiftsSewadars
GO

CREATE PROCEDURE GenerateInvalidSewaShiftsSewadars
(
	@p_satsang_centre_id 	satsang_centre_id,
	@p_satsang_centre_nm 	gnc_nm,
	@p_sewa_id				sewa_id,
	@p_session_id			INTEGER				OUTPUT
)
AS
	DECLARE
		@report_header			report_description,
		@extra_information		report_description,
		@sewa_nm				gnc_nm,
		@grno					sewadar_grno,
		@dt						DATETIME
BEGIN
	DECLARE
		@tbl	TABLE
			(	grno	CHAR (6),
				dt		DATETIME,
					PRIMARY KEY (grno, dt)
			);

	INSERT INTO	@tbl
			(	grno, dt	)
		SELECT	DISTINCT	a.sewadar_grno, a.presence_dt		-- We are using distinct because there can be more than one invalid combination in a day
		FROM	arbitrary_shift_presences	a
			JOIN	arbitrary_shift_presences	b
				ON	(	a.sewa_id		=		b.sewa_id
					AND	a.satsang_centre_id	=	b.satsang_centre_id
					AND	a.sewadar_grno		=	b.sewadar_grno
					AND	a.presence_dt		=	b.presence_dt
					AND	a.sewa_shift		>	b.sewa_shift
					)
		WHERE	NOT EXISTS	(	SELECT	1
								FROM	sewa_shifts_valid_combinations  c
								WHERE	c.sewa_id				=	a.sewa_id
								AND		c.recorded_sewa_shift	=	a.sewa_shift
								AND		c.recording_sewa_shift	=	b.sewa_shift
							)
		AND		a.satsang_centre_id	=	@p_satsang_centre_id
		AND		(	(	@p_sewa_id	IS NULL		)
				OR	(	@p_sewa_id	IS NOT NULL
					AND	a.sewa_id	=	@p_sewa_id
					)
				);

	SELECT	@sewa_nm			=	sewa_nm
	FROM	sewas
	WHERE	sewa_id = @p_sewa_id;

	SET	@report_header = 'Invalid Sewa Shifts ' + COALESCE ('for ' + @sewa_nm, '')
	
	SET	@extra_information	=	'Date(s) when invalid shifts are recorded'
		
	INSERT INTO	generic_report_headers
			(	report_header, extra_information_header	)
		VALUES
			(	@report_header, @extra_information	)

	SET	@p_session_id = SCOPE_IDENTITY();

	DECLARE	crsr	CURSOR FOR
		SELECT	grno, MIN (dt)
		FROM	@tbl
		GROUP BY grno
		FOR READ ONLY;
	
	OPEN	crsr;

	FETCH	crsr
		INTO	@grno, @dt;
	
	WHILE (@@FETCH_STATUS = 0)
	BEGIN
		SET @extra_information = CONVERT (VARCHAR (11), @dt, 106);

		SELECT	@extra_information	=	@extra_information + ', ' + CONVERT (VARCHAR (11), dt, 106)
		FROM	@tbl
		WHERE	grno	=	@grno
		AND		dt		>	@dt;

		INSERT INTO	generic_report_details
				(	session_id, satsang_centre_id, sewadar_grno, extra_information	)
			VALUES
				(	@p_session_id, @p_satsang_centre_id, @grno, @extra_information	);

		FETCH	crsr
			INTO	@grno, @dt;
	END
	
	CLOSE	crsr;
	DEALLOCATE	crsr;

END
GO

-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GenerateDailyAttendanceAbsentList' AND xtype = 'P')
	DROP PROCEDURE GenerateDailyAttendanceAbsentList
GO

-- =============================================================================
-- Procedure GeneratePendingSewadarsForDailyAttendance
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GeneratePendingSewadarsForDailyAttendance' AND xtype = 'P')
	DROP PROCEDURE GeneratePendingSewadarsForDailyAttendance
GO

CREATE PROCEDURE GeneratePendingSewadarsForDailyAttendance
(
	@p_satsang_centre_id	int,
	@p_satsang_centre_nm	VARCHAR(100), 
	@p_sewa_id				INT,
	@p_department_ids		report_xml_prm,
	@p_is_summary			Boolean,
	@p_session_id			INTEGER				OUTPUT
)
AS
BEGIN
	DECLARE @scanning_job_id		scanning_job_id,
	@controlling_dt					SMALLDATETIME,
	@sewaTeamCount					INT,
	@scanningjobNm				VARCHAR(100),
	@extra_information_header	report_description,
	@extra_information			report_description
	DECLARE	@depts		TABLE	(	id	INT	);
	DECLARE @hdoc INT;	

	SELECT @controlling_dt = controlling_dt, @scanning_job_id = sj.scanning_job_id, @scanningjobNm = sj.scanning_job_nm
	FROM scanning_jobs_controlling_dates sc
	INNER JOIN scanning_jobs sj ON (sc.scanning_job_id = sj.scanning_job_id)
	WHERE sc.is_closed = 'No'
	and sj.sewa_id = @p_sewa_id
	
	IF (@p_department_ids IS NULL)
		INSERT INTO	@depts
			SELECT	department_id
			FROM	departments_satsang_centres
			WHERE	satsang_centre_id	=	@p_satsang_centre_id
			AND		effective_till	>	GetDate();
	ELSE
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_department_ids; 
		INSERT INTO	@depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT);
		EXEC sp_xml_removedocument @hdoc;
	END

	IF @scanning_job_id > 0 
	BEGIN

		CREATE TABLE #FilteredSewaTeamIdByDepartments
		(
			sewa_team_id	INT,
			sewa_team_nm	VARCHAR(100)
		)

		CREATE TABLE #FilteredTeamDailyAttendance(
		[sewa_team_id]		INT NOT NULL,
		[serial_id]			INT NOT NULL,
		[attendance_dt]		[smalldatetime] NOT NULL,
		[attendance]		[char](1) NOT NULL,
		[sewa_exemption_id] SMALLINT NULL,
		[is_scanned]		CHAR(3) NOT NULL
		)
		
		CREATE TABLE #SewaTeamBySewa
		(
			sewa_team_id	int,
			team_nm			VARCHAR(100),
			serial_id		int,
			sewadar_grno	varchar(6),
			attendance_dt	datetime
		)

		SELECT @sewaTeamCount = COUNT(*)
		FROM scanning_jobs_sewa_teams
		WHERE scanning_job_id = @scanning_job_id
		
			
		IF @sewaTeamCount > 0
		BEGIN
			INSERT INTO #FilteredSewaTeamIdByDepartments
			SELECT DISTINCT st.sewa_team_id, stt.sewa_team_nm 
			FROM	sewa_team_wise_sewadars st
			INNER JOIN scanning_jobs_sewa_teams sjst ON (sjst.sewa_team_id = st.sewa_team_id)
			INNER JOIN sewa_teams stt ON stt.sewa_team_id = sjst.sewa_team_id
			INNER JOIN sewas s ON s.sewa_id = stt.sewa_id 
			INNER JOIN sewadars_registrations	sr
						ON	(	st.sewadar_grno				=	sr.sewadar_grno
							AND sr.satsang_centre_id		=	@p_satsang_centre_id)
			INNER JOIN	@depts	ON	(	sr.department_id	=	id	)
			WHERE st.satsang_centre_id = @p_satsang_centre_id
			AND s.sewa_id = @p_sewa_id

			INSERT INTO #FilteredTeamDailyAttendance
			SELECT twda.sewa_team_id,twda.serial_id,twda.attendance_dt,twda.attendance,twda.sewa_exemption_id,twda.is_scanned
			FROM team_wise_daily_attendance twda
			INNER JOIN scanning_jobs_sewa_teams sjst ON (twda.sewa_team_id = sjst.sewa_team_id)
			WHERE twda.sewa_team_id IN (select sewa_team_id from sewa_teams where sewa_id = @p_sewa_id)
			AND sjst.satsang_centre_id = @p_satsang_centre_id
			AND sjst.scanning_job_id = @scanning_job_id
			AND twda.attendance_dt = @controlling_dt

			INSERT INTO #SewaTeamBySewa
			SELECT st.sewa_team_id, stt.sewa_team_nm, serial_id, st.sewadar_grno, @controlling_dt
			FROM sewa_team_wise_sewadars st
			INNER JOIN scanning_jobs_sewa_teams sjst ON (sjst.sewa_team_id = st.sewa_team_id)
			INNER JOIN sewa_teams stt ON stt.sewa_team_id = sjst.sewa_team_id
			INNER JOIN sewas s ON s.sewa_id = stt.sewa_id 
			INNER JOIN sewadars_registrations	sr
						ON	(	st.sewadar_grno				=	sr.sewadar_grno
							AND sr.satsang_centre_id		=	@p_satsang_centre_id)
			INNER JOIN	@depts	ON	(	sr.department_id	=	id	)
			WHERE st.satsang_centre_id = @p_satsang_centre_id
			AND s.sewa_id = @p_sewa_id
		END
		ELSE
		BEGIN
			INSERT INTO #FilteredSewaTeamIdByDepartments
			SELECT DISTINCT st.sewa_team_id, stt.sewa_team_nm 
			FROM	sewa_team_wise_sewadars st			
			INNER JOIN sewa_teams stt ON st.sewa_team_id = stt.sewa_team_id
			INNER JOIN sewas s ON s.sewa_id = stt.sewa_id 
			INNER JOIN sewadars_registrations	sr
						ON	(	st.sewadar_grno				=	sr.sewadar_grno
							AND sr.satsang_centre_id		=	@p_satsang_centre_id)
			INNER JOIN	@depts	ON	(	sr.department_id	=	id	)
			WHERE st.satsang_centre_id = @p_satsang_centre_id
			AND s.sewa_id = @p_sewa_id

			INSERT INTO #FilteredTeamDailyAttendance
			SELECT twda.* FROM team_wise_daily_attendance twda
			WHERE sewa_team_id IN (select sewa_team_id from sewa_teams where sewa_id = @p_sewa_id)
			AND attendance_dt = @controlling_dt

			INSERT INTO #SewaTeamBySewa
			SELECT st.sewa_team_id, stt.sewa_team_nm, serial_id, st.sewadar_grno, @controlling_dt
			FROM sewa_team_wise_sewadars st
			INNER JOIN sewa_teams stt ON stt.sewa_team_id = st.sewa_team_id
			INNER JOIN sewas s ON s.sewa_id = stt.sewa_id 
			INNER JOIN sewadars_registrations	sr
						ON	(	st.sewadar_grno				=	sr.sewadar_grno
							AND sr.satsang_centre_id		=	@p_satsang_centre_id)
			INNER JOIN	@depts	ON	(	sr.department_id	=	id	)			
			WHERE st.satsang_centre_id = @p_satsang_centre_id
			AND s.sewa_id = @p_sewa_id
		END

		SET @extra_information = 'Sewadar Attendance Not Marked For '+ @scanningjobNm+ ' for Controlling Date ' + LEFT(CONVERT(VARCHAR, @controlling_dt, 120), 10);
		SET @extra_information_header = '';
		INSERT INTO	generic_report_headers
				(	report_header, extra_information_header	)
			VALUES
				(	@extra_information, @extra_information_header	);
		
		SET	@p_session_id = SCOPE_IDENTITY();

		INSERT	INTO	generic_report_details
				(	session_id, satsang_centre_id, sewadar_grno, extra_information,
					grouping_1,		--	SewaTeam
					grouping_2	)	--	Gender

		SELECT @p_session_id, @p_satsang_centre_id, st.sewadar_grno, '', st.team_nm, s.gender
		from #FilteredTeamDailyAttendance tda 
		RIGHT OUTER JOIN #SewaTeamBySewa st ON 
		(		tda.sewa_team_id = st.sewa_team_id 
				AND
				tda.serial_id = st.serial_id 		
				AND 
				tda.attendance_dt = st.attendance_dt
		)
		INNER JOIN [dbo].[sewadars] s ON (s.current_sewadar_grno COLLATE DATABASE_DEFAULT = st.sewadar_grno AND s.current_satsang_centre_id = @p_satsang_centre_id)
		WHERE tda.sewa_team_id IS NULL
		ORDER BY team_nm;
	
		IF (@p_is_summary = 'Yes') 
		BEGIN
			INSERT	INTO	generic_report_summaries
					(	session_id,	major_information, gents_cnt, ladies_cnt	)
				SELECT	@p_session_id,
						grouping_1,
						SUM (CASE WHEN grouping_2 = 'Male' THEN 1 ELSE 0 END),
						SUM (CASE WHEN grouping_2 = 'Female' THEN 1 ELSE 0 END)
				FROM	generic_report_details
				WHERE	session_id	=	@p_session_id
				GROUP BY	grouping_1
				ORDER BY 2;
		END
	END
END
GO


-- =============================================================================

