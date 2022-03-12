ALTER TABLE banks
ADD bank_alias VARCHAR(100) NULL
GO

ALTER TABLE banks
ADD parent_bank_id	SMALLINT NULL constraint FK_Banks_Parent_BankId		references banks
GO

