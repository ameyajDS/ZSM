/* ==================================================================================
	Source File		:	35_setup_post_migration.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	Sun 09 Jan 14:22:00 IST 2011
	Version			:	1.00
	Module ID		:	ZSM
	Language		:	TRANSACT-SQL
	Last updated	:	09-Jan-2011
	Reviewed By		:	
	Reviewed On		:	
	==================================================================================
																	  Usage Notes
	----------------------------------------------------------------------------------
		This script sets up the Construction Sewa and the Scanning Job 
		after migration.
	==================================================================================
																	  Revision History
	----------------------------------------------------------------------------------
	
	==================================================================================*/


DECLARE
	@satsang_centre_id		satsang_centre_id,
	@scanning_job_id		scanning_job_id,
	@sewa_id				sewa_id,

	@sewadar_list_id		sewadar_list_id,
	@shift_I_sub_job_id		scanning_job_id,
	@shift_II_sub_job_id	scanning_job_id,
	@shift_III_sub_job_id	scanning_job_id

SET	@satsang_centre_id	=	6015;

INSERT INTO	sewas
		(	satsang_centre_id, sewa_cd, sewa_nm, start_dt, finish_dt, is_satsang_programme, is_scanner_used, is_leave_allowed, is_exemption_allowed, is_default_sewa,
			sewa_frequency, attendance_unit, attendance_marking, min_sewa_duration, max_sewa_duration, ladies_born_after
		)
	VALUES
		(	@satsang_centre_id, '2011 MTH M', 'Construction Sewa Jan-Mar 2011', '10-Jan-2011', '07-Mar-2011', 'No', 'Yes', 'No', 'Yes', 'Yes',
			'Arbitrary', 'Shift', 'Arbitrary', 0, 3, '01-Jan-1951'
		);
SET	@sewa_id = SCOPE_IDENTITY ();

INSERT INTO	sewas_sewa_shifts	(	sewa_id, sewa_shift, sewa_shift_sq, credit_cnt, unit_cnt	)	VALUES	(	@sewa_id, '8am - 1pm (1)',		1, 1, 2	);
INSERT INTO	sewas_sewa_shifts	(	sewa_id, sewa_shift, sewa_shift_sq, credit_cnt, unit_cnt	)	VALUES	(	@sewa_id, '8am - 6.30pm(2)',	2, 1, 1	);
INSERT INTO	sewas_sewa_shifts	(	sewa_id, sewa_shift, sewa_shift_sq, credit_cnt, unit_cnt	)	VALUES	(	@sewa_id, '2pm - 6.30pm(3)',	3, 1, 2	);

INSERT INTO	sewas_satsang_centres	(	sewa_id, satsang_centre_id	)	VALUES	(	@sewa_id, @satsang_centre_id );

INSERT INTO	scanning_jobs
		(	satsang_centre_id, scanning_job_nm, scanning_job_type_cd, effective_from, effective_till, sewa_id, sewadar_list_id, is_deleting_allowed, status_system_info_cd	)
	VALUES
		(	@satsang_centre_id, 'Construction Sewa Jan-Mar 2011',  'Cnstrctn Sewa', '10-Jan-2011', '07-Mar-2011',	@sewa_id, 1, 'Yes', 'SttsCnstSewa' );

SET	@scanning_job_id = SCOPE_IDENTITY ();


INSERT INTO	scanning_sub_jobs	(	scanning_job_id, scanning_sub_job_nm, scanning_sub_job_sq	)	VALUES	(	@scanning_job_id, '8am - 1pm (1)',		1	);
SET	@shift_I_sub_job_id = SCOPE_IDENTITY ();

INSERT INTO	scanning_sub_jobs	(	scanning_job_id, scanning_sub_job_nm, scanning_sub_job_sq	)	VALUES	(	@scanning_job_id, '8am - 6.30pm(2)',	2	);
SET	@shift_II_sub_job_id = SCOPE_IDENTITY ();

INSERT INTO	scanning_sub_jobs	(	scanning_job_id, scanning_sub_job_nm, scanning_sub_job_sq	)	VALUES	(	@scanning_job_id, '2pm - 6.30pm(3)',	3	);
SET	@shift_III_sub_job_id = SCOPE_IDENTITY ();

INSERT INTO 	scanning_sub_jobs_validations	VALUES	(	@shift_I_sub_job_id,	@shift_I_sub_job_id,	'No Action'	);
INSERT INTO 	scanning_sub_jobs_validations	VALUES	(	@shift_I_sub_job_id,	@shift_II_sub_job_id,	'Move'	);
INSERT INTO 	scanning_sub_jobs_validations	VALUES	(	@shift_I_sub_job_id,	@shift_III_sub_job_id,	'Add'	);

INSERT INTO 	scanning_sub_jobs_validations	VALUES	(	@shift_II_sub_job_id,	@shift_I_sub_job_id,	'Move'	);
INSERT INTO 	scanning_sub_jobs_validations	VALUES	(	@shift_II_sub_job_id,	@shift_II_sub_job_id,	'No Action'	);
INSERT INTO 	scanning_sub_jobs_validations	VALUES	(	@shift_II_sub_job_id,	@shift_III_sub_job_id,	'Error'	);

INSERT INTO 	scanning_sub_jobs_validations	VALUES	(	@shift_III_sub_job_id,	@shift_I_sub_job_id,	'Error'	);
INSERT INTO 	scanning_sub_jobs_validations	VALUES	(	@shift_III_sub_job_id,	@shift_II_sub_job_id,	'Error'	);
INSERT INTO 	scanning_sub_jobs_validations	VALUES	(	@shift_III_sub_job_id,	@shift_III_sub_job_id,	'No Action'	);

