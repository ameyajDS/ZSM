INSERT INTO	satsang_centres_seeds
		(	satsang_centre_id, object_id, min_value, max_value, seed_value, is_zone	)
	SELECT	satsang_centre_id, 'sewadar_applications', min_value, max_value, min_value, is_zone
	FROM	satsang_centres_seeds
	WHERE	object_id	=	'sewa_teams';
GO

DECLARE
	@centre		VARCHAR (20)	=	'Mumbai',
	@seed_value	INT

SELECT	@seed_value	=	s.seed_value
FROM	satsang_centres_seeds	s
	JOIN	satsang_centres_details	c
		ON	(	s.satsang_centre_id	=	c.satsang_centre_id
			AND	c.is_main_centre	=	'Yes'
			AND	c.centre_nm			=	@centre
			AND	s.object_id			=	'sewadar_applications'
			);

IF (@@ROWCOUNT = 1)
BEGIN
	DBCC CHECKIDENT ('sewadar_applications', RESEED, @seed_value) WITH NO_INFOMSGs
END
ELSE
BEGIN
	RAISERROR ('FATAL ERROR: Unable to find the Seed Value for %s Satsang Centre', 16, -1, @centre);
	RETURN;
END

