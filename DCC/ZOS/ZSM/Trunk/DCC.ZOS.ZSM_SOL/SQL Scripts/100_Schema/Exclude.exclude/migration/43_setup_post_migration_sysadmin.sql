----------------------------------------------------------
--		ZSM Sewadars View
---------------------------------------------------------
CREATE	VIEW	v_ZSMsewadars
AS

	SELECT	z.sewadar_id			AS	sewadar_id,
		RTRIM(z.first_nm) + ' ' + SUBSTRING (RTRIM(z.middle_nm), 1, 1) + '. ' + RTRIM(z.last_nm)	AS	sewadar_nm,
		DateDiff (yyyy, z.birth_dtm, GetDate())	AS	age,
		z.gender		AS	gender
	FROM	zsm..sewadars	z
	   -- JOIN	rms..person_status_applicability	s
		--ON	(	p.status_id	=	s.person_status_id
		  --  	AND	s.person_type_cd	=	'S'
		--	AND	s.is_application_access	=	'Yes'
		--	)
GO

GRANT SELECT ON v_ZSMsewadars TO SAM_Gnrc
GO
------------------------------------------------------------------------------

