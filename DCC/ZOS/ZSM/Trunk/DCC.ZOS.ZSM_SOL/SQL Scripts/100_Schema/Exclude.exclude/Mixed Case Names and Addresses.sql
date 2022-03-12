
 ------ Change the Names (all three parts) of Sewadars to mixed-case
BEGIN TRAN

ALTER TABLE sewadars DISABLE TRIGGER sewadars_a_iu
ALTER TABLE sewadars DISABLE TRIGGER sewadars_b_iu
ALTER TABLE sewadars DISABLE TRIGGER sewadars_c_iu
ALTER TABLE sewadars DISABLE TRIGGER sewadars_d_u
ALTER TABLE sewadars DISABLE TRIGGER sewadars_e_u
ALTER TABLE sewadars DISABLE TRIGGER sewadars_a_i_DML
ALTER TABLE sewadars DISABLE TRIGGER sewadars_b_u_DML

UPDATE	sewadars
	SET	first_nm	= dbo.MakeCamelCase (first_nm),
		middle_nm	= dbo.MakeCamelCase (middle_nm),
		last_nm	= dbo.MakeCamelCase (last_nm);

ALTER TABLE sewadars ENABLE TRIGGER sewadars_a_iu
ALTER TABLE sewadars ENABLE TRIGGER sewadars_b_iu
ALTER TABLE sewadars ENABLE TRIGGER sewadars_c_iu
ALTER TABLE sewadars ENABLE TRIGGER sewadars_d_u
ALTER TABLE sewadars ENABLE TRIGGER sewadars_e_u
ALTER TABLE sewadars ENABLE TRIGGER sewadars_a_i_DML
ALTER TABLE sewadars ENABLE TRIGGER sewadars_b_u_DML

ROLLBACK
--COMMIT

BEGIN TRAN

 ------ Change the Addresses of Sewadars to mixed-case

UPDATE	sewadars_addresses
	SET	address_line_1	= dbo.MakeCamelCase (address_line_1),
		address_line_2	= dbo.MakeCamelCase (address_line_2);

	--- Remove the trailing comma in Address Line 1, if any
UPDATE	sewadars_addresses
	SET	address_line_1	= SUBSTRING (address_line_1, 1, LEN (address_line_1) - 1)
WHERE	SUBSTRING (address_line_1, LEN (address_line_1), 1) = ',';

	--- Remove the trailing comma in Address Line 2, if any
UPDATE	sewadars_addresses
	SET	address_line_2	= SUBSTRING (address_line_2, 1, LEN (address_line_2) - 1)
WHERE	SUBSTRING (address_line_2, LEN (address_line_2), 1) = ',';

ROLLBACK
--COMMIT
