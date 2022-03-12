USE [ZSM]
GO

IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='ImportBulkSewadarScannedRecords'
			)
	BEGIN
		DROP PROCEDURE  ImportBulkSewadarScannedRecords
	END
GO

CREATE PROCEDURE ImportBulkSewadarScannedRecords
(
	@sewadarRecords			dbo.SewadarBadgeRecord READONLY
)
WITH ENCRYPTION
AS
BEGIN
		CREATE TABLE #SewadarRecords
		(
			scanning_sub_job_id		smallint,
			controlling_dt			smalldatetime,
			satsang_centre_id		int,
			sewadar_grno			char(6),
			scannedDTM				datetime,
			remarks					VARCHAR(100)
		)
		
		INSERT INTO #SewadarRecords
		(scanning_sub_job_id,controlling_dt,satsang_centre_id,sewadar_grno,scannedDTM)
		SELECT scanning_sub_job_id, controlling_dt, satsang_centre_id, sewadar_grno, 
			  scannedDTM
		FROM (SELECT scanning_sub_job_id, controlling_dt, satsang_centre_id, sewadar_grno, 
			  scannedDTM, ROW_NUMBER() OVER (partition by sewadar_grno order by scannedDTM DESC)AS row
			  FROM @sewadarRecords) AS Data
		WHERE row = 1

		UPDATE	t
			SET	remarks	=	CASE	WHEN	sewadar_status_cd	NOT IN	(	'Temp', 'Perm', 'NI', 'Retd'	)
										THEN	'Status of Sewadar is [' + sewadar_status_cd + ']'
							END
		FROM	#sewadarRecords	t
			JOIN	sewadars_registrations	s
				ON	(	t.satsang_centre_id		=	s.satsang_centre_id
					AND	t.sewadar_grno	COLLATE DATABASE_DEFAULT =	s.sewadar_grno
					)
		WHERE	remarks	IS	NULL;
		
		UPDATE	t
			SET	remarks	=	CASE	WHEN	global_sewadar_status_cd	IN	(	'Exp', 'Susp'	)
										THEN	'Status of Sewadar is [' + ss.sewadar_status_nm + ']'
							END
		FROM	#sewadarRecords	t
		INNER	JOIN	sewadars	s
				ON	(	t.satsang_centre_id		=	s.current_satsang_centre_id
					AND	t.sewadar_grno	COLLATE DATABASE_DEFAULT =	s.current_sewadar_grno
					)
		INNER JOIN sewadar_status ss ON (s.global_sewadar_status_cd = ss.sewadar_status_cd)
		WHERE	t.remarks	IS	NULL;

		SELECT * INTO #FailedRecords
		FROM #SewadarRecords
		WHERE remarks IS NOT NULL

		DELETE #SewadarRecords
		WHERE remarks IS NOT NULL
		
		MERGE scanned_badges AS T
		USING #SewadarRecords AS S
		ON (T.scanning_sub_job_id = S.scanning_sub_job_id AND
			T.controlling_dt = S.controlling_dt AND
			T.satsang_centre_id = S.satsang_centre_id AND 
			T.sewadar_grno COLLATE DATABASE_DEFAULT = S.sewadar_grno)
			WHEN NOT MATCHED BY TARGET THEN
			INSERT (scanning_sub_job_id, controlling_dt,
						satsang_centre_id, sewadar_grno, scanned_dtm)
			VALUES (S.scanning_sub_job_id, S.controlling_dt,
						S.satsang_centre_id, S.sewadar_grno, S.scannedDTM);

		SELECT * FROM #FailedRecords;

		DROP TABLE #FailedRecords
		DROP TABLE #SewadarRecords

END
GO


IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertScannedBadgeFileAuditLog'
			)
	BEGIN
		DROP PROCEDURE  InsertScannedBadgeFileAuditLog
	END
GO


CREATE PROCEDURE InsertScannedBadgeFileAuditLog
(
	@scanning_job_id		INT,
	@filepath				VARCHAR(MAX),
	@controlling_dt			SMALLDATETIME,		
	@import_username		VARCHAR(100),
	@process_dt				DATETIME	,
	@process_username		VARCHAR(100)
)
AS
BEGIN
	INSERT INTO [dbo].[scanned_badge_file_audit_logs]
           ([scanning_job_id]
           ,[filepath]
           ,[controlling_dt]
           ,[import_username]
           ,[process_dt]
           ,[process_username])
     VALUES
           (@scanning_job_id
           ,@filepath		
           ,@controlling_dt	
           ,@import_username
           ,@process_dt		
           ,@process_username
		   )
END
GO

IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='GetScannedBadgeFileAuditLog'
			)
	BEGIN
		DROP PROCEDURE  GetScannedBadgeFileAuditLog
	END
GO


CREATE PROCEDURE GetScannedBadgeFileAuditLog
(
	@scanning_job_id		INT
)
AS
BEGIN
	SELECT * FROM [dbo].[scanned_badge_file_audit_logs]
	WHERE scanning_job_id = @scanning_job_id
	ORDER BY process_dt DESC, controlling_dt DESC
END
GO


IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateScannedBadgeFileAuditLog'
			)
	BEGIN
		DROP PROCEDURE  UpdateScannedBadgeFileAuditLog
	END
GO


CREATE PROCEDURE UpdateScannedBadgeFileAuditLog
(
	@scanning_job_id		INT,
	@controlling_dt			SMALLDATETIME,
	@process_dt				DATETIME,
	@process_username		VARCHAR(100)
)
AS
BEGIN
	
	UPDATE [dbo].[scanned_badge_file_audit_logs]
	SET process_dt = @process_dt, process_username = @process_username
	WHERE scanning_job_id = @scanning_job_id
	AND controlling_dt = @controlling_dt
	AND process_username IS NULL
END
GO