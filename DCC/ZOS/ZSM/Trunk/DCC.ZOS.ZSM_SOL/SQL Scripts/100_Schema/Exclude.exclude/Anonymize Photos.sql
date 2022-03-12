
USE ZSM_Photos
GO

DROP TABLE sewadars_photos
GO

CREATE	TABLE	sewadars_photos
(
	sewadar_id			INTEGER		NOT NULL	CONSTRAINT	SewadarsPhotos_PK_SewadarID
													PRIMARY KEY	NONCLUSTERED,
	sewadar_photo		IMAGE		NOT NULL,
	photo_dt			DATETIME	NOT NULL	CONSTRAINT	SewadarsPhotos_CK_PhotoDt
														CHECK	(	photo_dt <= GETDATE()	)
)
GO

EXEC 	sp_addextendedproperty
		'SewadarsPhotos_CK_PhotoDt', 'Photo Date cannot be in future' ,
		'USER',	'dbo', 'TABLE',	'sewadars_photos'
GO

GRANT	SELECT, INSERT, UPDATE, DELETE	ON	sewadars_photos	TO	ZSM_ADM, ZSM_SUP, ZSM_USR, ZSM_PC;
GO

USE ZSM
GO

INSERT INTO ZSM_Photos..sewadars_photos (sewadar_id, sewadar_photo, photo_dt)
	SELECT s.sewadar_id, si.sample_image, sr.appointment_dt
	FROM sewadars s 
	JOIN _sample_images si ON	(	(CONVERT(INT,SUBSTRING(si.sample_id, 8, 3)) = ((s.sewadar_id%32)+1)) -- With a hole after every 31 photos
								AND	si.sample_id	LIKE	'Female%'
								AND	s.gender		=		'Female'
								)
	JOIN sewadars_registrations sr ON sr.satsang_centre_id = s.current_satsang_centre_id AND sr.sewadar_grno = s.current_sewadar_grno
GO

INSERT INTO ZSM_Photos..sewadars_photos (sewadar_id, sewadar_photo, photo_dt)
	SELECT s.sewadar_id, si.sample_image, sr.appointment_dt
	FROM sewadars s 
	JOIN _sample_images si ON	(	(CONVERT(INT,SUBSTRING(si.sample_id, 6, 3)) = ((s.sewadar_id%28)+1)) -- With a hole after every 27 photos
								AND	si.sample_id	LIKE	'Male%'
								AND	s.gender		=		'Male'
								)
	JOIN sewadars_registrations sr ON sr.satsang_centre_id = s.current_satsang_centre_id AND sr.sewadar_grno = s.current_sewadar_grno
GO

