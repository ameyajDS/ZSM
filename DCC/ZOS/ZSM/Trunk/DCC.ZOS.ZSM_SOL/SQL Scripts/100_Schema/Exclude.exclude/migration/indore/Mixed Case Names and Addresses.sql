BEGIN TRAN

UPDATE	mgr_centre_sewadars
	SET	first_name	= dbo.MakeCamelCase (first_name),
		middle_name	= dbo.MakeCamelCase (middle_name),
		address_line_1	= dbo.MakeCamelCase (address_line_1),
		address_line_2	= dbo.MakeCamelCase (address_line_2),
		surname	= dbo.MakeCamelCase (surname);

ROLLBACK
--COMMIT

BEGIN TRAN

	--- Remove the trailing comma in Address Line 1, if any
UPDATE	mgr_centre_sewadars
	SET	address_line_1	= SUBSTRING (address_line_1, 1, LEN (address_line_1) - 1)
WHERE	SUBSTRING (address_line_1, LEN (address_line_1), 1) = ',';

	--- Remove the trailing comma in Address Line 2, if any
UPDATE	mgr_centre_sewadars
	SET	address_line_2	= SUBSTRING (address_line_2, 1, LEN (address_line_2) - 1)
WHERE	SUBSTRING (address_line_2, LEN (address_line_2), 1) = ',';

ROLLBACK
--COMMIT

