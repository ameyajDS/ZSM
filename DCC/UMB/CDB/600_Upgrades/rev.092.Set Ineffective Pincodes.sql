
BEGIN TRAN;
--ROLLBACK;
--COMMIT;

DECLARE
	@tdt	DATE	=	DATEADD (d, -1, GetDate()),
	@al		INTEGER	--	audit_log_id


--	====================================================================================================

INSERT INTO	audit_logs
		(	[session_id], [application_id], [user_no], [user_role_id], [operation], [screen_id], [object_id], [operation_dts], [is_consumed]	)
	VALUES
		(	0, 'Script', 1, 'System', 'U', 'rev092', 'Invalidate Pincodes', GETDATE(), 0	);
	SET @al	=	SCOPE_IDENTITY ();

--	====================================================================================================
--	Set ineffective pincodes for which Level 2/3 codes are ineffective
--	====================================================================================================


UPDATE	z
	SET	effective_till_dt	=	@tdt,
		audit_log_id		=	@al
FROM	pincodes	z
	JOIN	level_3_address_components	l3
		ON	(	l3.level_3_address_component_id	=	z.level_3_component_id	)
WHERE	GETDATE() NOT	BETWEEN l3.effective_from AND l3.effective_till;


UPDATE	z
	SET	effective_till_dt	=	@tdt,
		audit_log_id		=	@al
FROM	pincodes	z
	JOIN	level_2_address_components	l2
		ON	(	l2.level_2_address_component_id	=	z.level_2_component_id	)
WHERE	GETDATE() NOT	BETWEEN l2.effective_from AND l2.effective_till;



--	====================================================================================================


