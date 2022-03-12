

USE ZSM
GO

UPDATE sc
	SET secretary_signature = si.sample_image
	FROM _sample_images si
	JOIN satsang_centres_details sc ON (sc.centre_nm = si.sample_id AND sc.is_main_centre = 'Yes')
GO

