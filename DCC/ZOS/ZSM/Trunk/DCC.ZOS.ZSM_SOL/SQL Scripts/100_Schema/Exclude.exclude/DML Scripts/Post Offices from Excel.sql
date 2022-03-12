--begin tran
--commit
--rollback

declare 
	@state	INT

SET @state = 124 ----- Maharashtra    110 -- Chhattisgarh

--INSERT INTO post_offices_or_cities
--		(	district_id, post_office_or_city_cd, post_office_or_city_nm	) 
	SELECT	*,
			d.district_or_city_id, 
			UPPER (SUBSTRING ([P#O# Code], 1, 10)), 
	/*		UPPER (SUBSTRING (
					CASE WHEN (SUBSTRING ([P#O# Code], LEN ([P#O# Code]), 1) = 'B'
						OR SUBSTRING ([P#O# Code], LEN ([P#O# Code]), 1) = 'S')
							AND (SUBSTRING ([P#O# Code], LEN ([P#O# Code]), 1)
									!= SUBSTRING ([P#O# Code], LEN ([P#O# Code])- 1, 1))
						THEN SUBSTRING ([P#O# Code], 1, LEN ([P#O# Code]) - 1)
						ELSE [P#O# Code]
					END, 1, 10)),
	*/		[P#O# Name]
	FROM OPENROWSET('Microsoft.Jet.OLEDB.4.0', 
					'Excel 8.0;Database=C:\users\Pune\Data for District Beed (Mah).xls',
	 				'SELECT * FROM [Beed$]') x
	left JOIN	cdb..districts_or_cities	d 		ON 	(	x.[District Name] 	=	d.district_nm	
													AND	d.state_id			=	@state
													)
--WHERE d.district_nm IS NULL
--WHERE [P#O# Code1] IS NULL
--WHERE [P#O# Code] != [P#O# Code]
--WHERE LEN ([P#O# Name]) > 30
WHERE	NOT EXISTS	(	SELECT	1
						FROM	post_offices_or_cities	z
						WHERE	z.district_id	=	d.district_or_city_id
						AND		z.post_office_or_city_nm	=	x.[P#O# Name]
					)
/*
AND	EXISTS	(	SELECT	1
						FROM	post_offices_or_cities	z
						WHERE	z.district_id	=	d.district_or_city_id
						AND		z.post_office_or_city_cd	=	SUBSTRING (x.[P#O# Code], 1, 10)			
		--UPPER (SUBSTRING (
		--			CASE WHEN (SUBSTRING (x.[P#O# Code], LEN (x.[P#O# Code]), 1) = 'B'
		--				OR SUBSTRING (x.[P#O# Code], LEN (x.[P#O# Code]), 1) = 'S')
		--					AND (SUBSTRING (x.[P#O# Code], LEN (x.[P#O# Code]), 1)
		--							!= SUBSTRING (x.[P#O# Code], LEN (x.[P#O# Code])- 1, 1))
		--				THEN SUBSTRING (x.[P#O# Code], 1, LEN (x.[P#O# Code]) - 1)
		--				ELSE x.[P#O# Code]
		--			END, 1, 10))

					)
*/

--order by LEN ([P#O# Code]) desc
			

/*
	SELECT	 [District Name], [P#O# Name], COUNT(*)
	FROM OPENROWSET('Microsoft.Jet.OLEDB.4.0', 
					'Excel 8.0;Database=C:\users\Pune\Data for District Beed (Mah).xls',
	 				'SELECT * FROM [Beed$]') x
	GROUP BY [District Name], [P#O# Name]
	HAVING COUNT(*) > 1
	ORDER BY 1, 2
	SELECT	 [District Name], [P#O# Code], COUNT(*)
	FROM OPENROWSET('Microsoft.Jet.OLEDB.4.0', 
					'Excel 8.0;Database=C:\users\Pune\Data for District Beed (Mah).xls',
	 				'SELECT * FROM [Beed$]') x
	GROUP BY [District Name], [P#O# Code]
	HAVING COUNT(*) > 1
	ORDER BY 1, 2
	SELECT	 [District Name], UPPER (SUBSTRING (
					CASE WHEN (SUBSTRING ([P#O# Code], LEN ([P#O# Code]), 1) = 'B'
						OR SUBSTRING ([P#O# Code], LEN ([P#O# Code]), 1) = 'S')
							AND (SUBSTRING ([P#O# Code], LEN ([P#O# Code]), 1)
									!= SUBSTRING ([P#O# Code], LEN ([P#O# Code])- 1, 1))
						THEN SUBSTRING ([P#O# Code], 1, LEN ([P#O# Code]) - 1)
						ELSE [P#O# Code]
					END, 1, 10)),
	 COUNT(*)
	FROM OPENROWSET('Microsoft.Jet.OLEDB.4.0', 
					'Excel 8.0;Database=C:\users\Pune\Data for District Beed (Mah).xls',
	 				'SELECT * FROM [Beed$]') x
	GROUP BY [District Name], UPPER (SUBSTRING (
					CASE WHEN (SUBSTRING ([P#O# Code], LEN ([P#O# Code]), 1) = 'B'
						OR SUBSTRING ([P#O# Code], LEN ([P#O# Code]), 1) = 'S')
							AND (SUBSTRING ([P#O# Code], LEN ([P#O# Code]), 1)
									!= SUBSTRING ([P#O# Code], LEN ([P#O# Code])- 1, 1))
						THEN SUBSTRING ([P#O# Code], 1, LEN ([P#O# Code]) - 1)
						ELSE [P#O# Code]
					END, 1, 10))
	HAVING COUNT(*) > 1
	ORDER BY 1, 2
	SELECT	 			UPPER (SUBSTRING (
					CASE WHEN (SUBSTRING ([P#O# Code], LEN ([P#O# Code]), 1) = 'B'
						OR SUBSTRING ([P#O# Code], LEN ([P#O# Code]), 1) = 'S')
							AND (SUBSTRING ([P#O# Code], LEN ([P#O# Code]), 1)
									!= SUBSTRING ([P#O# Code], LEN ([P#O# Code])- 1, 1))
						THEN SUBSTRING ([P#O# Code], 1, LEN ([P#O# Code]) - 1)
						ELSE [P#O# Code]
					END, 1, 10)),
*
	FROM OPENROWSET('Microsoft.Jet.OLEDB.4.0', 
					'Excel 8.0;Database=C:\users\Pune\Data for District Beed (Mah).xls',
	 				'SELECT * FROM [Beed$]') x
	WHERE [P#O# Code] like 'Ambl4%'
	OR		[P#O# Code] like  'Khdsh%'
	OR		[P#O# Code]	LIKE  'Klw%'
	OR 		[P#O# Code]	LIKE	'Pmplgn%'
	OR		[P#O# Code]	LIKE	'Pngr%'
order by 1
*/
