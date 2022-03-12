/* ==================================================================================
	Source File		:	setup_attributes.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	Mon Dec 20 17:41 IST 2010
	Version			:	1.00
	Module ID		:	ZSM
	Language		:	TRANSACT-SQL
	Last updated	:	20-Dec-2010
	Reviewed By		:
	Reviewed On		:
	==================================================================================
																		   Usage Notes
	----------------------------------------------------------------------------------

	==================================================================================
																	  Revision History
	----------------------------------------------------------------------------------
     JL : 20-Dec-2010
		*   Initial version
	==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

-- =============================================================================
-- Attributes
-- =============================================================================

DECLARE
	@centre_id			INT,
	@attr_id	attribute_id;

	SET	@centre_id	=	6015			----- Mumbai, Bhayendar

INSERT INTO	generic_attributes
		(	attribute_nm, attribute_group, attribute_sq, attribute_type, is_temporal, is_mandatory, is_status_applicable	)
	VALUES
		(	'Construction Sewa Exemption', 'Sewadar', 1, 'Boolean', 'No', 'No', 'Yes'	);
SET	@attr_id	=	SCOPE_IDENTITY();

INSERT INTO	generic_attributes_status	VALUES	(	@attr_id, 'PERM'	);
INSERT INTO	generic_attributes_status	VALUES	(	@attr_id, 'TEMP'	);

INSERT INTO generic_attributes_satsang_centres	VALUES	(	@attr_id, @centre_id, '25-Dec-2007', '31-Dec-9999'	);

-- =============================================================================

INSERT INTO	generic_attributes
		(	attribute_nm, attribute_group, attribute_sq, attribute_type, remarks, is_temporal, is_mandatory, is_status_applicable	)
	VALUES
		(	'Mobile Permission', 'Sewadar', 2, 'Boolean', 'Permission for Mobile phone in Satsang Pandal', 'No', 'No', 'Yes'	);
SET	@attr_id	=	SCOPE_IDENTITY();

INSERT INTO	generic_attributes_status	VALUES	(	@attr_id, 'PERM'	);

INSERT INTO generic_attributes_satsang_centres	VALUES	(	@attr_id, @centre_id, '28-Jun-2009', '31-Dec-9999'	);

-- =============================================================================

INSERT INTO	generic_attributes
		(	attribute_nm, attribute_group, attribute_sq, attribute_type, remarks, is_temporal, is_mandatory, is_status_applicable	)
	VALUES
		(	'Sewa allowed on Sunday, 2010', 'Sewadar', 3, 'Boolean', 'Construction Sewa, 2010 allowed to be done Sunday', 'No', 'No', 'Yes'	);
SET	@attr_id	=	SCOPE_IDENTITY();

INSERT INTO	generic_attributes_status	VALUES	(	@attr_id, 'PERM'	);
INSERT INTO	generic_attributes_status	VALUES	(	@attr_id, 'TEMP'	);

INSERT INTO generic_attributes_satsang_centres	VALUES	(	@attr_id, @centre_id, '24-Jan-2010', '25-Dec-2010'	);

-- ===========================================================================================
-- vim:ts=4 sw=4 ht=4
