/* ==================================================================================
    Source File		:	funcs.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Sun Feb 27 12:02 IST 2011
    Version			:	1.00
    Last updated	:	May 12, 2014
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Common functions:
			GetMonthText
			GetDayText
			MakeCamelCase
			FormatNumber	Formats a given number (supplied as VARCHAR) to a right-justified VARCHAR (100) of specified length.
    ==================================================================================
								      								  Revision History
    ----------------------------------------------------------------------------------
		12-May-2014 : JL
			* Function FormatNumber added
   ==================================================================================*/

-- =============================================================================
-- Function GetMonthText
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GetMonthText' AND xtype = 'FN')
	DROP FUNCTION GetMonthText
GO

CREATE	FUNCTION	GetMonthText
(
	@p_mth		INT
)
	RETURNS gnc_nm

WITH ENCRYPTION
AS
BEGIN
	DECLARE
		@gnc_nm	gnc_nm;

    SELECT	@gnc_nm	=	CASE	@p_mth
							WHEN	1	THEN	'January'
							WHEN	2	THEN	'February'
							WHEN	3	THEN	'March'
							WHEN	4	THEN	'April'
							WHEN	5	THEN	'May'
							WHEN	6	THEN	'June'
							WHEN	7	THEN	'July'
							WHEN	8	THEN	'August'
							WHEN	9	THEN	'September'
							WHEN	10	THEN	'October'
							WHEN	11	THEN	'November'
							WHEN	12	THEN	'December'
										ELSE	'INVALID Month (' + COALESCE (CONVERT (VARCHAR, @p_mth), 'NULL') + ')'
						END;

    RETURN	@gnc_nm
END
GO

-- =============================================================================
-- Function GetDayText
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GetDayText' AND xtype = 'FN')
	DROP FUNCTION GetDayText
GO

CREATE	FUNCTION	GetDayText
(
	@p_day		INT
)
	RETURNS CHAR(2)

WITH ENCRYPTION
AS
BEGIN
	DECLARE
		@txt	VARCHAR(20);

    SET	@txt	=	COALESCE (CONVERT (VARCHAR, @p_day), 'NL');
	IF (LEN (@txt) < 2)
		SET @txt = '0' + @txt
	ELSE IF (LEN (@txt) > 2)
		SET @txt = SUBSTRING (@txt, 1, 2)

    RETURN	@txt
END
GO

-- =============================================================================
-- Function MakeCamelCase
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'MakeCamelCase' AND xtype = 'FN')
	DROP FUNCTION MakeCamelCase
GO

CREATE FUNCTION MakeCamelCase
(
	@p_str	VARCHAR (1000)
)
RETURNS
	VARCHAR (1000)
BEGIN
	DECLARE
		@str	VARCHAR (1000),
		@tmpstr	VARCHAR (100),
		@romans	VARCHAR (10),
		@len	INT,
		@i		INT,
		@chg	CHAR (1),
		@ch		CHAR (1),
		@pch	CHAR (1),
		@rmns	INT,
		@dgt	INT,
		@pdgt	INT,
		@nmbr	INT
		-- 1st, 2nd, 3rd, 4th 
	
	SET @romans = 'IVX'
	

	IF (@p_str IS NULL)
		RETURN @str;
	SET @pch = ''
	SET @dgt = -1
	SET @pdgt = -1
	SET @nmbr = -1
	SET @i = 0
	SET @chg = 'U'
	SET @str = ''
	SET @tmpstr = ''
	SET @rmns = -1
	SET @len = LEN (@p_str)

	WHILE (@i < @len)
	BEGIN
		SET @i = @i + 1
		SET @ch = SUBSTRING (@p_str, @i, 1)

			---- Roman Characters are always in Capitals
		IF (CHARINDEX (@pch, @romans, 1) > 0 AND CHARINDEX (@ch, @romans, 1) > 0)
		BEGIN
			IF (@rmns = -1)
			BEGIN
				IF (ASCII(SUBSTRING (@str, @i -1, 1)) BETWEEN 65 AND 90)
				BEGIN
					SET @rmns = @i
					SET @chg = 'U'
				END
			END
			ELSE
				SET @chg = 'U'
		END
		ELSE IF (ASCII (@ch) BETWEEN 65 AND 90 OR	ASCII (@ch) BETWEEN 97 AND 122)
		BEGIN
			IF (@rmns > 0)
			BEGIN
				SET @str = SUBSTRING (@str, 1, @rmns - 1) + LOWER (SUBSTRING (@str, @rmns, @len))
				SET @rmns = -1
			END
		END
		ELSE IF (@rmns > 0)
			SET @rmns = -1

			---- Normal Processing begins
		IF (@chg = 'U')
			SET @str = @str + UPPER (@ch)
		ELSE
			SET @str = @str + LOWER (@ch)

			--- Handle the case for 1st, 2nd, 3rd, 4th through 9th and 0th ....... 11th and 12th are pending
		IF (@nmbr = @i - 2)
		BEGIN
			IF ((@dgt = '1' AND ((@ch = 'T' AND @pdgt = -1) OR (@ch = 'H' AND @pdgt = 1)))
					OR (@dgt =  '2' AND ((@ch = 'D' AND @pdgt = -1) OR (@ch = 'H' AND @pdgt = 1)))
					OR (@dgt =  '3' AND @ch = 'D')
					OR ((@dgt = '0' OR @dgt BETWEEN '4' AND '9') AND @ch = 'H')
				)
				SET @str = SUBSTRING (@str, 1, @nmbr) + LOWER (SUBSTRING (@str, @nmbr + 1, 2))
			SET @nmbr = -1
			SET @dgt = -1
			SET @pdgt = -1
		END

		IF (@chg = 'U' AND	(	ASCII (@ch) BETWEEN 65 AND 90
							OR	ASCII (@ch) BETWEEN 97 AND 122
							)
			)
		BEGIN
			SET @chg = 'L'
		END
		ELSE IF (@chg = 'L' AND ASCII (@ch) NOT BETWEEN 65 AND 90
							AND	ASCII (@ch) NOT BETWEEN 97 AND 122
				)
			SET @chg = 'U'
		IF (@ch BETWEEN '0' AND '9')
		BEGIN
			SET @nmbr = @i
			SET @dgt = @ch
			IF (@pch = '1')
				SET @pdgt = @pch
		END
		ELSE IF (@nmbr = @i - 1)
			IF ((@dgt = '1' AND ((@ch != 'S' AND @pdgt = 1) AND (@ch != 'T' AND @pdgt = -1)))
					OR (@dgt = '2' AND ((@ch != 'N' AND @pdgt = 1) AND (@ch != 'T' AND @pdgt = -1)))
					OR (@dgt = '3' AND @ch != 'R')
					OR ((@dgt = '0' OR @dgt BETWEEN '4' AND '9') AND @ch != 'T')
				)
			BEGIN
				SET @nmbr = -1
				SET @dgt = -1
				SET @pdgt = -1
			END

			---- Keep PO and CHS in upper-case, if that occurs as a word
		IF ((ASCII (@ch) BETWEEN 65 AND 90	OR	ASCII (@ch) BETWEEN 97 AND 122) AND (ASCII (@pch) NOT BETWEEN 65 AND 90 AND ASCII (@pch) NOT BETWEEN 97 AND 122))
			SET @tmpstr = UPPER (@ch)
		ELSE IF (LEN (@tmpstr) > 0 AND (ASCII (@ch) BETWEEN 65 AND 90	OR	ASCII (@ch) BETWEEN 97 AND 122))
			SET @tmpstr = @tmpstr + UPPER (@ch)
		IF (LEN (@tmpstr) >= 2 AND (ASCII (@ch) NOT BETWEEN 65 AND 90 AND ASCII (@ch) NOT BETWEEN 97 AND 122))
		BEGIN
			IF ((LEN (@tmpstr) = 2 AND @tmpstr = 'PO') OR (LEN (@tmpstr) = 3 AND @tmpstr = 'CHS'))
			BEGIN
				SET @str = @str + '|'			--- This is sentinel as trailing space reduces the length
				SET @str = SUBSTRING (@str, 1, LEN (@str) - LEN (@tmpstr) - 2) + @tmpstr + @ch
			END
			SET @tmpstr = ''
		END
		SET @pch = @ch                                                               
	END
	RETURN @str
END
GO

-- =============================================================================
-- Function FormatNumber
---		Formats a given number (supplied as VARCHAR) to a right-justified VARCHAR (100) of specified length.
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'FormatNumber' AND xtype = 'FN')
	DROP FUNCTION FormatNumber
GO

CREATE	FUNCTION	FormatNumber
(
	@p_number_str	VARCHAR (100),
	@p_len			INT
)
	RETURNS VARCHAR (100)

WITH ENCRYPTION
AS
BEGIN
	DECLARE
		@s VARCHAR (100);

	IF (@p_len <= LEN (@p_number_str) OR IsNumeric (@p_number_str) = 0)
		SET @s = @p_number_str
	ELSE
		SET @s = REPLICATE (' ', @p_len - LEN(@p_number_str)) + @p_number_str
	RETURN @s
END
GO

-- =============================================================================
-- vim:ts=4 ht=8 sw=4 guifont=Lucida_Console

