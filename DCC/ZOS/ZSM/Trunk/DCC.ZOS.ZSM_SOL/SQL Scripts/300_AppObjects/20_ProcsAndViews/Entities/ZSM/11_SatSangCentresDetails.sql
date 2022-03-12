USE
CDB
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertSatsangCentre
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertSatsangCentre'
			)
	BEGIN
		DROP PROCEDURE  InsertSatsangCentre
	END
GO
CREATE PROCEDURE InsertSatsangCentre
(
	@satsang_centre_id			satsang_centre_id output,
	@satsang_centre_cd			char(8),
	@satsang_centre_nm			varchar(25),
	@satsang_centre_type		satsang_centre_type,
	@address_line_1				varchar(75),
	@address_line_2				varchar(75) = NULL,
	@district_or_city_id		district_or_city_id,
	@pin_or_zip_code			pin_or_zip_code = NULL,
	@secretary					person_id = NULL,
	@telephones					telephone_lines = NULL,
	@email_addresses			email_addresses = NULL,
	@fax_lines					telephone_lines = NULL,
	@effective_from				datetime,
	@effective_till				datetime
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO CDB..satsang_centres
	(
		satsang_centre_cd, satsang_centre_nm, satsang_centre_type, address_line_1, address_line_2, district_or_city_id, pin_or_zip_code, secretary, telephones, email_addresses, fax_lines, effective_from, effective_till
	)
	VALUES
	(
		@satsang_centre_cd, @satsang_centre_nm, @satsang_centre_type, @address_line_1, @address_line_2, @district_or_city_id, @pin_or_zip_code, @secretary, @telephones, @email_addresses, @fax_lines, @effective_from, @effective_till
	)
	SELECT @satsang_centre_id = SCOPE_IDENTITY()
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateSatsangCentre
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateSatsangCentre'
			)
	BEGIN
		DROP PROCEDURE  UpdateSatsangCentre
	END
GO
CREATE PROCEDURE UpdateSatsangCentre
(
	@satsang_centre_id			satsang_centre_id,
	@satsang_centre_cd			char(8),
	@satsang_centre_nm			varchar(25),
	@satsang_centre_type		satsang_centre_type,
	@address_line_1				varchar(75),
	@address_line_2				varchar(75),
	@district_or_city_id		district_or_city_id,
	@pin_or_zip_code			pin_or_zip_code,
	--@secretary					person_id,
	@telephones					telephone_lines,
	@email_addresses			email_addresses,
	@fax_lines					telephone_lines,
	@txn_ts						timestamp,
	@effective_from				datetime,
	@effective_till				datetime
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    CDB..satsang_centres
	SET
		satsang_centre_cd		=	@satsang_centre_cd,
		satsang_centre_nm		=	@satsang_centre_nm,
		satsang_centre_type		=	@satsang_centre_type,
		address_line_1			=	@address_line_1,
		address_line_2			=	@address_line_2,
		district_or_city_id		=	@district_or_city_id,
		pin_or_zip_code			=	@pin_or_zip_code,
		--secretary				=	@secretary,
		telephones				=	@telephones,
		email_addresses			=	@email_addresses,
		fax_lines				=	@fax_lines,
		effective_from			=	@effective_from,
		effective_till			=	@effective_till
	WHERE satsang_centre_id = @satsang_centre_id
	AND txn_ts				=	@txn_ts
	IF (@@ROWCOUNT != 1)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotUpdated', NULL, NULL, NULL, NULL
	END
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	DeleteSatsangCentre
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteSatsangCentre'
			)
	BEGIN
		DROP PROCEDURE  DeleteSatsangCentre
	END
GO
CREATE PROCEDURE DeleteSatsangCentre
(
	@satsang_centre_id			satsang_centre_id,
	@satsang_centre_cd			char(8),
	@satsang_centre_nm			varchar(25),
	@satsang_centre_type		satsang_centre_type,
	@address_line_1				varchar(75),
	@address_line_2				varchar(75),
	@district_or_city_id		district_or_city_id,
	@pin_or_zip_code			pin_or_zip_code,
	@secretary					person_id,
	@telephones					telephone_lines,
	@email_addresses			email_addresses,
	@fax_lines					telephone_lines,
	@txn_ts						timestamp,
	@effective_from				datetime,
	@effective_till				datetime
)
WITH ENCRYPTION
AS
BEGIN
	
	
	DELETE FROM CDB..satsang_centres
	WHERE satsang_centre_id = @satsang_centre_id
	AND txn_ts=	@txn_ts
	IF (@@ROWCOUNT != 1)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotDeleted', NULL, NULL, NULL, NULL
	END
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

---- =============================================================================
----	Procedure	QuerySatsangCentre
---- =============================================================================
--IF EXISTS	(	SELECT  TOP 1 1 
--				FROM    INFORMATION_SCHEMA.ROUTINES 
--				WHERE   ROUTINE_TYPE='PROCEDURE'
--				AND     SPECIFIC_NAME='QuerySatsangCentre'
--			)
--	BEGIN
--		DROP PROCEDURE  QuerySatsangCentre
--	END
--GO
--CREATE PROCEDURE QuerySatsangCentre
--(
--	@satsang_centre_id			satsang_centre_id,
--	@satsang_centre_cd			char(8),
--	@satsang_centre_nm			varchar(25),
--	@satsang_centre_type		satsang_centre_type,
--	@address_line_1				varchar(75),
--	@address_line_2				varchar(75),
--	@district_or_city_id		district_or_city_id,
--	@pin_or_zip_code			pin_or_zip_code,
--	@secretary					person_id,
--	@telephones					telephone_lines,
--	@email_addresses			email_addresses,
--	@fax_lines					telephone_lines,
--	@txn_ts						timestamp,
--	@effective_from				datetime,
--	@effective_till				datetime
--)
--WITH ENCRYPTION
--AS
--BEGIN
--	SELECT
--		satsang_centre_id, 
--		satsang_centre_cd, 
--		satsang_centre_nm, 
--		satsang_centre_type, 
--		address_line_1, 
--		address_line_2, 
--		district_or_city_id, 
--		pin_or_zip_code, 
--		secretary, 
--		telephones, 
--		email_addresses, 
--		fax_lines, 
--		txn_ts, 
--		effective_from, 
--		effective_till
--	FROM CDB..satsang_centres
--	WHERE (1 = 2) --ADD YOUR WHERE CLAUSE
--END
--GO
---- =============================================================================



-- vim:ts=4 sw=4 ht=4
USE
ZSM
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertSatsangCentresDetail
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertSatsangCentresDetail'
			)
	BEGIN
		DROP PROCEDURE  InsertSatsangCentresDetail
	END
GO
CREATE PROCEDURE InsertSatsangCentresDetail
(
	@satsang_centre_id			satsang_centre_id,
	@is_main_centre				Boolean,
	@centre_nm					gnc_nm = NULL,
	@centre_alphabet			gnc_nm = NULL,
	@centre_cd					char(3) = NULL,
	@reports_to_centre_id		satsang_centre_id = NULL,
	@remarks					remarks = NULL,
	@colour_id					colour_id = NULL,
	@secretary_signature		image = NULL
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO satsang_centres_details
	(
		satsang_centre_id, is_main_centre, centre_nm, centre_alphabet, centre_cd, reports_to_centre_id, remarks, secretary_signature, colour_id
	)
	VALUES
	(
		@satsang_centre_id, @is_main_centre, @centre_nm, @centre_alphabet, @centre_cd, @reports_to_centre_id, @remarks, @secretary_signature, @colour_id
	)
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateSatsangCentresDetail
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateSatsangCentresDetail'
			)
	BEGIN
		DROP PROCEDURE  UpdateSatsangCentresDetail
	END
GO
CREATE PROCEDURE UpdateSatsangCentresDetail
(
	@satsang_centre_id			satsang_centre_id,
	@is_main_centre				Boolean,
	@centre_nm					gnc_nm,
	@centre_alphabet			gnc_nm,
	@centre_cd					char(3),
	@reports_to_centre_id		satsang_centre_id,
	@remarks					remarks,
		@colour_id					colour_id = NULL,
	@secretary_signature		image
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    satsang_centres_details
	SET
		
		is_main_centre				=	@is_main_centre,
		centre_nm					=	@centre_nm,
		centre_alphabet				=	@centre_alphabet,
		centre_cd					=	@centre_cd,
		reports_to_centre_id		=	@reports_to_centre_id,
		remarks						=	@remarks,
		colour_id					=	@colour_id,
		secretary_signature			=	@secretary_signature
	WHERE
		satsang_centre_id			=	@satsang_centre_id
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	DeleteSatsangCentresDetail
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteSatsangCentresDetail'
			)
	BEGIN
		DROP PROCEDURE  DeleteSatsangCentresDetail
	END
GO
CREATE PROCEDURE DeleteSatsangCentresDetail
(
	@satsang_centre_id			satsang_centre_id,
	@is_main_centre				Boolean,
	@centre_nm					gnc_nm,
	@centre_alphabet			gnc_nm,
	@centre_cd					char(3),
	@reports_to_centre_id		satsang_centre_id,
	@remarks					remarks,
	@secretary_signature		image
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM satsang_centres_details
	WHERE (1 = 2)
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	QuerySatsangCentresDetail
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QuerySatsangCentresDetail'
			)
	BEGIN
		DROP PROCEDURE  QuerySatsangCentresDetail
	END
GO
CREATE PROCEDURE QuerySatsangCentresDetail
(
	@satsang_centre_id			satsang_centre_id,
	@is_main_centre				Boolean,
	@centre_nm					gnc_nm,
	@centre_alphabet			gnc_nm,
	@centre_cd					char(3),
	@reports_to_centre_id		satsang_centre_id,
	@remarks					remarks,
	@secretary_signature		image
)
WITH ENCRYPTION
AS
BEGIN
	SELECT
		satsang_centre_id, 
		is_main_centre, 
		centre_nm, 
		centre_alphabet, 
		centre_cd, 
		reports_to_centre_id, 
		remarks, 
		secretary_signature
	FROM satsang_centres_details
	WHERE (1 = 2) --ADD YOUR WHERE CLAUSE
END
GO
-- =============================================================================



-- vim:ts=4 sw=4 ht=4

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertSatsangCentreFunctionarie
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertSatsangCentreFunctionarie'
			)
	BEGIN
		DROP PROCEDURE  InsertSatsangCentreFunctionarie
	END
GO
CREATE PROCEDURE InsertSatsangCentreFunctionarie
(
	@centre_functionary_id		centre_functionary_id output,
	@satsang_centre_id			satsang_centre_id,
	@centre_functionary			centre_functionary,
	@functionary_nm				functionary_nm,
	@is_current					Boolean,
	@telephones					telephone_lines = NULL,
	@email_addresses			email_addresses = NULL,
	@effective_from				datetime,
	@effective_till				datetime
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO satsang_centre_functionaries
	(
		satsang_centre_id, centre_functionary, functionary_nm, is_current, telephones, email_addresses, effective_from, effective_till
	)
	VALUES
	(
		@satsang_centre_id, @centre_functionary, @functionary_nm, @is_current, @telephones, @email_addresses, @effective_from, @effective_till
	)
	SELECT @centre_functionary_id = SCOPE_IDENTITY()
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateSatsangCentreFunctionarie
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateSatsangCentreFunctionarie'
			)
	BEGIN
		DROP PROCEDURE  UpdateSatsangCentreFunctionarie
	END
GO
CREATE PROCEDURE UpdateSatsangCentreFunctionarie
(
	@centre_functionary_id		centre_functionary_id,
	@satsang_centre_id			satsang_centre_id,
	@centre_functionary			centre_functionary,
	@functionary_nm				functionary_nm,
	@is_current					Boolean,
	@telephones					telephone_lines,
	@email_addresses			email_addresses,
	@effective_from				datetime,
	@effective_till				datetime
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    satsang_centre_functionaries
	SET
		satsang_centre_id			=	@satsang_centre_id,
		centre_functionary			=	@centre_functionary,
		functionary_nm				=	@functionary_nm,
		is_current					=	@is_current,
		telephones					=	@telephones,
		email_addresses				=	@email_addresses,
		effective_from				=	@effective_from,
		effective_till				=	@effective_till
	WHERE centre_functionary_id = @centre_functionary_id
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	DeleteSatsangCentreFunctionarie
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteSatsangCentreFunctionarie'
			)
	BEGIN
		DROP PROCEDURE  DeleteSatsangCentreFunctionarie
	END
GO
CREATE PROCEDURE DeleteSatsangCentreFunctionarie
(
	@centre_functionary_id		centre_functionary_id,
	@satsang_centre_id			satsang_centre_id,
	@centre_functionary			centre_functionary,
	@functionary_nm				functionary_nm,
	@is_current					Boolean,
	@telephones					telephone_lines,
	@email_addresses			email_addresses,
	@effective_from				datetime,
	@effective_till				datetime
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM satsang_centre_functionaries
	WHERE centre_functionary_id = @centre_functionary_id
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	QuerySatsangCentreFunctionarie
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QuerySatsangCentreFunctionarie'
			)
	BEGIN
		DROP PROCEDURE  QuerySatsangCentreFunctionarie
	END
GO
CREATE PROCEDURE QuerySatsangCentreFunctionarie
(
	@satsang_centre_id			satsang_centre_id,
	@centre_functionary			centre_functionary
)
WITH ENCRYPTION
AS
BEGIN
	SELECT
		centre_functionary_id, 
		satsang_centre_id, 
		centre_functionary, 
		functionary_nm, 
		is_current, 
		telephones, 
		email_addresses, 
		effective_from, 
		effective_till
	FROM satsang_centre_functionaries s
	WHERE s.centre_functionary = @centre_functionary AND s.satsang_centre_id = @satsang_centre_id
END
GO
-- =============================================================================



-- vim:ts=4 sw=4 ht=4

-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (SELECT 1 FROM sysobjects WHERE NAME = 'fnGetSatsangCentreName' AND TYPE = 'FN')
DROP FUNCTION [dbo].[fnGetSatsangCentreName]
GO
CREATE FUNCTION [dbo].[fnGetSatsangCentreName] 
(
	@satsang_centre_id satsang_centre_id
)
RETURNS nvarchar(100)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result nvarchar(100)
	
	SELECT @Result = satsang_centre_nm
	FROM   cdb..satsang_centres 
	WHERE satsang_centre_id = @satsang_centre_id

	RETURN @Result
END
GO

IF  EXISTS (SELECT 1 FROM sysobjects WHERE NAME = 'fnGetStateName' AND TYPE = 'FN')
DROP FUNCTION [dbo].[fnGetStateName]
GO
CREATE FUNCTION [dbo].[fnGetStateName] 
(
	@district_or_city_id int
)
RETURNS nvarchar(100)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result nvarchar(100)
	
	SELECT @Result = state_nm
	FROM cdb..districts_or_cities dc
	JOIN cdb..states s on s.state_id = dc.state_id
	WHERE dc.district_or_city_id = @district_or_city_id
	

	RETURN @Result
END
GO

IF  EXISTS (SELECT 1 FROM sysobjects WHERE NAME = 'fnGetStateId' AND TYPE = 'FN')
DROP FUNCTION [dbo].[fnGetStateId]
GO
CREATE FUNCTION [dbo].[fnGetStateId] 
(
	@district_or_city_id int
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result int
	
	SELECT @Result = s.state_id
	FROM cdb..districts_or_cities dc
	JOIN cdb..states s on s.state_id = dc.state_id
	WHERE dc.district_or_city_id = @district_or_city_id
	

	RETURN @Result
END
GO


IF  EXISTS (SELECT 1 FROM sysobjects WHERE NAME = 'fnGetCountryName' AND TYPE = 'FN')
DROP FUNCTION [dbo].[fnGetCountryName]
GO
CREATE FUNCTION [dbo].[fnGetCountryName] 
(
	@state_id int
)
RETURNS nvarchar(100)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result nvarchar(100)
	
	SELECT @Result = c.country_nm from cdb..states s
	JOIN cdb..countries c ON c.country_id = s.country_id
	WHERE s.state_id = @state_id
	

	RETURN @Result
END
GO

IF  EXISTS (SELECT 1 FROM sysobjects WHERE NAME = 'fnGetCountryId' AND TYPE = 'FN')
DROP FUNCTION [dbo].[fnGetCountryId]
GO
CREATE FUNCTION [dbo].[fnGetCountryId] 
(
	@state_id int
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result int
	
	SELECT @Result = c.country_id from cdb..states s
	JOIN cdb..countries c ON c.country_id = s.country_id
	WHERE s.state_id = @state_id
	

	RETURN @Result
END
GO

IF  EXISTS (SELECT 1 FROM sysobjects WHERE NAME = 'fnGetSatsangCentreCode' AND TYPE = 'FN')
DROP FUNCTION [dbo].[fnGetSatsangCentreCode]
GO
CREATE FUNCTION [dbo].[fnGetSatsangCentreCode] 
(
	@satsang_centre_id satsang_centre_id
)
RETURNS nvarchar(100)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result nvarchar(100)
	SELECT @Result = satsang_centre_cd 
	FROM cdb..satsang_centres 
	WHERE satsang_centre_id = @satsang_centre_id
	
	RETURN @Result
END
GO
-- =============================================================================



-- vim:ts=4 sw=4 ht=4
