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
			1. The name of the Excel File {saved as Test(MS Dos) should be grnos.txt}
			2. It should be located at E:\users\pramod on the Live Server
			3. NA
			4. This sheet should have only one columns for GR NO (No column heading is required)
	==================================================================================
																	  Revision History
	----------------------------------------------------------------------------------
     JL : 02, 03-Jul-2014
		*   Initial version
     PA : 15-Feb-2015 Enhancement to check Invalid / Duplicates
	: 02-Dec-2017 Introduced a concept of temporary table Tmp_Grnos_tmp due to problem in importing directly from Excel on Live Server

	==================================================================================*/
-- Checking for NULL and length 6 to be moved to checking invalid records

USE ZSM
GO
IF EXISTS (SELECT * FROM sysobjects WHERE xtype = 'U' AND name = 'Tmp_Grnos_tmp')
BEGIN
    drop table Tmp_Grnos_tmp
END 

CREATE TABLE Tmp_Grnos_tmp
(	sewadar_grno		char(6)		NOT	NULL
);

IF EXISTS (SELECT * FROM sysobjects WHERE xtype = 'U' AND name = 'Tmp_Grnos_dup')
BEGIN
    drop table Tmp_Grnos_dup
END 

BULK INSERT [dbo].[Tmp_Grnos_tmp]
--	FROM 'E:\users\pramod\GrNos.txt'
	FROM 'E:\ZSM\GrNos.txt'
	WITH (fieldterminator = ',', rowterminator = '\n')
GO
ALTER TABLE Tmp_Grnos_tmp ADD sewadar_list_id	INT		NULL
GO
ALTER TABLE Tmp_Grnos_tmp ADD satsang_centre_id	INT NULL
GO

DECLARE
	@list_id			INT,
	@centre_id			INT,
	@sewadar_list_nm	VARCHAR (60),
	@tmp_cnt			INT,
	@rows_to_add		INT,
	@rows_in_txt_file	INT
-- ====================================================================================================
--	If the Sewadar List is different, ID and Name of the List should be changed in the following statements.
-- ====================================================================================================
SET	@list_id			=	1644  		-- rpr=1667 ind=1623 ngp=1644 mum=1667 jmd=1668 kol=1669
SET @sewadar_list_nm	=	'NGP-tmp'  	-- XXX='xxx-tmp'
-- ====================================================================================================


SELECT	@centre_id	=	satsang_centre_id
FROM	generic_sewadar_lists
WHERE	sewadar_list_id	=	@list_id
AND		sewadar_list_nm	=	@sewadar_list_nm;

UPDATE 	Tmp_Grnos_tmp SET sewadar_list_id = @list_id 
UPDATE 	Tmp_Grnos_tmp SET satsang_centre_id = @centre_id

SET @rows_in_txt_file = @@ROWCOUNT;

--Check & Delete rows having invalid sewadar_grno

SELECT sewadar_grno from Tmp_grnos_tmp where sewadar_grno not in
 (select sewadar_grno from sewadars_registrations where satsang_centre_id = @centre_id)

DELETE From Tmp_grnos_tmp WHERE sewadar_grno in (
SELECT sewadar_grno from Tmp_grnos_tmp where sewadar_grno not in
( select sewadar_grno from sewadars_registrations where satsang_centre_id = @centre_id)
)

DELETE From Tmp_grnos_tmp WHERE (sewadar_grno IS NULL OR LEN(sewadar_grno) <> 6)

--Check & Delete rows having multiple occurences of sewadar_grno - AAA

SELECT     sewadar_grno, COUNT(*) AS dupes  
FROM         Tmp_Grnos_tmp  
GROUP BY sewadar_grno  
HAVING      (COUNT(*) > 1);

SELECT * INTO Tmp_Grnos_dup FROM Tmp_Grnos_tmp WHERE 1=2

INSERT INTO Tmp_Grnos_dup
	(	sewadar_list_id, satsang_centre_id, sewadar_grno	)
	SELECT     @list_id, @centre_id, sewadar_grno 
	FROM         Tmp_Grnos_tmp  
	GROUP BY sewadar_grno  
	HAVING      (COUNT(*) > 1);
DELETE Tmp_Grnos_Tmp where sewadar_grno in (SELECT sewadar_grno from Tmp_grnos_dup)


INSERT INTO Tmp_Grnos_Tmp
	(	sewadar_list_id, satsang_centre_id, sewadar_grno	)
	SELECT     @list_id, @centre_id, sewadar_grno 
	FROM         Tmp_Grnos_dup  
;

Print 'Total records in Text File'
Print @rows_in_txt_file

--Actual insertion of records in table follows

Select sewadar_grno FROM Tmp_grnos_tmp -- Find a simple solution to count rows - BBB
SET @rows_to_add = @@ROWCOUNT;
Print 'Total records Added in the List'
Print @rows_to_add

IF (@rows_to_add > 0)
BEGIN
	DELETE
	FROM	generic_sewadar_lists_sewadars
	WHERE	sewadar_list_id	=	@list_id;
	INSERT INTO generic_sewadar_lists_sewadars
		(	sewadar_list_id, satsang_centre_id, sewadar_grno	)
	SELECT	sewadar_list_id, satsang_centre_id, sewadar_grno 
		FROM	Tmp_Grnos_tmp
END

DROP TABLE Tmp_Grnos_tmp
DROP TABLE Tmp_Grnos_dup

