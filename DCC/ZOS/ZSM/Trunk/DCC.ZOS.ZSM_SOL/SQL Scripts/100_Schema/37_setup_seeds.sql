/* ==================================================================================
	Source File		:	setup_seeds.sql
	Author(s)		:	Manish Saluja
	Started On		:	Sat Dec 24 12:32 IST 2011
	Version			:	1.00
	Module ID		:	ZSM
	Language		:	TRANSACT-SQL
	Last updated	:	24-Dec-2011
	Reviewed By		:
	Reviewed On		:
	==================================================================================
																		   Usage Notes
	----------------------------------------------------------------------------------
		This script sets up the min / max / default values of seeds of tables that have
		partitions for various centres.
	==================================================================================
																	  Revision History
	----------------------------------------------------------------------------------

	==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

DECLARE @mum_centre_id 		satsang_centre_id,
		@ngp_centre_id 		satsang_centre_id,
		@ten_crores			INTEGER,
		@eleven_crores		INTEGER,
		@ten_thousands		SMALLINT,
		@eleven_thousands	SMALLINT;

SET @mum_centre_id 		= 6015;
SET @ngp_centre_id 		= 6056;
SET @ten_crores			= 100000000;
SET @eleven_crores		= 110000000;
SET @ten_thousands		= 10000;
SET @eleven_thousands	= 11000;

INSERT INTO satsang_centres_seeds (satsang_centre_id, object_id, min_value, max_value, seed_value, is_zone)
	VALUES (@mum_centre_id, 'sewas', 1, @ten_crores, 1, 'Yes');
INSERT INTO satsang_centres_seeds (satsang_centre_id, object_id, min_value, max_value, seed_value, is_zone)
	VALUES (@ngp_centre_id, 'sewas', @ten_crores + 1, @eleven_crores, @ten_crores + 1, 'No');

INSERT INTO satsang_centres_seeds (satsang_centre_id, object_id, min_value, max_value, seed_value, is_zone)
	VALUES (@mum_centre_id, 'credit_specifications', 1, @ten_thousands, 1, 'Yes');
INSERT INTO satsang_centres_seeds (satsang_centre_id, object_id, min_value, max_value, seed_value, is_zone)
	VALUES (@ngp_centre_id, 'credit_specifications', @ten_thousands + 1, @eleven_thousands, @ten_thousands + 1, 'No');

INSERT INTO satsang_centres_seeds (satsang_centre_id, object_id, min_value, max_value, seed_value, is_zone)
	VALUES (@mum_centre_id, 'post_offices_or_cities', 1, @ten_crores, 1, 'Yes');
INSERT INTO satsang_centres_seeds (satsang_centre_id, object_id, min_value, max_value, seed_value, is_zone)
	VALUES (@ngp_centre_id, 'post_offices_or_cities', @ten_crores + 1, @eleven_crores, @ten_crores + 1, 'No');

INSERT INTO satsang_centres_seeds (satsang_centre_id, object_id, min_value, max_value, seed_value, is_zone)
	VALUES (@mum_centre_id, 'weekly_sewa_locations', 1, @ten_crores, 1, 'Yes');
INSERT INTO satsang_centres_seeds (satsang_centre_id, object_id, min_value, max_value, seed_value, is_zone)
	VALUES (@ngp_centre_id, 'weekly_sewa_locations', @ten_crores + 1, @eleven_crores, @ten_crores + 1, 'No');

INSERT INTO satsang_centres_seeds (satsang_centre_id, object_id, min_value, max_value, seed_value, is_zone)
	VALUES (@mum_centre_id, 'sewa_teams', 1, @ten_crores, 1, 'Yes');
INSERT INTO satsang_centres_seeds (satsang_centre_id, object_id, min_value, max_value, seed_value, is_zone)
	VALUES (@ngp_centre_id, 'sewa_teams', @ten_crores + 1, @eleven_crores, @ten_crores + 1, 'No');

INSERT INTO satsang_centres_seeds (satsang_centre_id, object_id, min_value, max_value, seed_value, is_zone)
	VALUES (@mum_centre_id, 'sewadars_badges', 1, @ten_crores, 1, 'Yes');
INSERT INTO satsang_centres_seeds (satsang_centre_id, object_id, min_value, max_value, seed_value, is_zone)
	VALUES (@ngp_centre_id, 'sewadars_badges', @ten_crores + 1, @eleven_crores, @ten_crores + 1, 'No');

INSERT INTO satsang_centres_seeds (satsang_centre_id, object_id, min_value, max_value, seed_value, is_zone)
	VALUES (@mum_centre_id, 'generic_sewadar_lists', 1, @ten_crores, 1, 'Yes');
INSERT INTO satsang_centres_seeds (satsang_centre_id, object_id, min_value, max_value, seed_value, is_zone)
	VALUES (@ngp_centre_id, 'generic_sewadar_lists', @ten_crores + 1, @eleven_crores, @ten_crores + 1, 'No');

INSERT INTO satsang_centres_seeds (satsang_centre_id, object_id, min_value, max_value, seed_value, is_zone)
	VALUES (@mum_centre_id, 'generic_report_headers', 1, @ten_crores, 1, 'Yes');
INSERT INTO satsang_centres_seeds (satsang_centre_id, object_id, min_value, max_value, seed_value, is_zone)
	VALUES (@ngp_centre_id, 'generic_report_headers', @ten_crores + 1, @eleven_crores, @ten_crores + 1, 'No');

INSERT INTO satsang_centres_seeds (satsang_centre_id, object_id, min_value, max_value, seed_value, is_zone)
	VALUES (@mum_centre_id, 'scanning_jobs', 1, @ten_thousands, 1, 'Yes');
INSERT INTO satsang_centres_seeds (satsang_centre_id, object_id, min_value, max_value, seed_value, is_zone)
	VALUES (@ngp_centre_id, 'scanning_jobs', @ten_thousands + 1, @eleven_thousands, @ten_thousands + 1, 'No');

INSERT INTO satsang_centres_seeds (satsang_centre_id, object_id, min_value, max_value, seed_value, is_zone)
	VALUES (@mum_centre_id, 'scanning_sub_jobs', 1, @ten_thousands, 1, 'Yes');
INSERT INTO satsang_centres_seeds (satsang_centre_id, object_id, min_value, max_value, seed_value, is_zone)
	VALUES (@ngp_centre_id, 'scanning_sub_jobs', @ten_thousands + 1, @eleven_thousands, @ten_thousands + 1, 'No');

GO	
