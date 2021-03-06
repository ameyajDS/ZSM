 --- set the database name in which the objects need to be granted access
USE	AMS
GO

--- declare variables
DECLARE	@user_list		VARCHAR (1000),
	@grant_statement	VARCHAR (2000)

--- set the user list to which the access is to be granted. make the list comma separated
SET	@user_list	= 'public'

--- declare a cursor to hold all the grant statements (excluding user info) for all the required objects
DECLARE	csr_obj CURSOR FORWARD_ONLY
	FOR	SELECT	'GRANT ' 
			+ CASE
				WHEN xtype IN ('P', 'FN')
					THEN 'EXEC '
				WHEN xtype = 'U'
					THEN 'SELECT, UPDATE '
				ELSE 'SELECT '
			  END
			+ 'ON ' + name + ' TO '
		FROM	sysobjects
		WHERE	xtype IN ('U', 'P', 'V', 'FN', 'TF', 'IF')
		AND	name NOT LIKE 'dt%'

--- open the cursor
OPEN csr_obj

--- fetch the first record from the cursor
FETCH NEXT FROM csr_obj 
	INTO @grant_statement

--- loop through all the records in the cursor
WHILE (@@FETCH_STATUS = 0)
	BEGIN

		--- print the statement if required
		--PRINT @grant_statement + @user_list

		--- execute the statement
		EXEC (@grant_statement + @user_list)

		--- fetch the next record from the cursor
		FETCH NEXT FROM csr_obj 
			INTO @grant_statement

	END

--- close and deallocate the cursor to free up resources
CLOSE csr_obj
DEALLOCATE csr_obj
GO
 