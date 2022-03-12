use zsm
go
/* ==================================================================================
	Source File		:	upload_sewadars_in_a_list.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	Wed Jul 02 18:27:00 IST 2014
	Module ID		:	ZSM
	Language		:	TRANSACT-SQL
	Last updated	:	03-Jul-2014
	==================================================================================
																		   Usage Notes
	----------------------------------------------------------------------------------
		Script to upload Sewadars in a Generic List. Before uploading, it DELETEs the existing
		entries of Sewadars in the List. The list should be existing.

		Note that the Excel File should conform to following;
			1. The name of the Excel File should be grnos.xls
			2. It should be located at C:\users\pramod on the Live Server
			3. It should have a sheet called Sheet1
			4. This sheet should have G.R.Nos. in a column, which should have a column heading as GRNO
	==================================================================================
																	  Revision History
	----------------------------------------------------------------------------------
     JL : 02, 03-Jul-2014
		*   Initial version
	==================================================================================*/


DECLARE
	@list_id			INT,
	@centre_id			INT,
	@sewadar_list_nm	VARCHAR (60)

-- ====================================================================================================
--	If the Sewadar List is different, ID and Name of the List should be changed in the following statements.
-- ====================================================================================================
SET	@list_id			=	1667  		-- rpr=1667 ind=1623 ngp=1644 mum=1667 jmd=1668 kol=1669
SET @sewadar_list_nm	=	'mum-tmp'  	-- XXX='xxx-tmp'
-- ====================================================================================================

DECLARE	@tbl	TABLE	(	grno	VARCHAR (20)	NOT NULL	PRIMARY KEY	)

SELECT	@centre_id	=	satsang_centre_id
FROM	generic_sewadar_lists
WHERE	sewadar_list_id	=	@list_id
AND		sewadar_list_nm	=	@sewadar_list_nm;

IF (@@ROWCOUNT = 1)
BEGIN
	INSERT INTO	@tbl
		SELECT	grno
		FROM	OPENROWSET	(	'Microsoft.Jet.OLEDB.4.0', 
								'Excel 8.0;Database=C:\users\Pramod\grnos.xls',
								'SELECT * FROM [Sheet1$]'
							);

	IF (@@ROWCOUNT > 0)
	BEGIN
		DELETE
		FROM	generic_sewadar_lists_sewadars
		WHERE	sewadar_list_id	=	@list_id;

		INSERT INTO generic_sewadar_lists_sewadars
				(	sewadar_list_id, satsang_centre_id, sewadar_grno	)
			SELECT	@list_id, @centre_id, grno
			FROM	@tbl
			WHERE	grno	IS NOT NULL
			AND		LEN (grno)	=	6
	END
END

