/* ==================================================================================

    ==================================================================================
									   									   Usage Notes
    ----------------------------------------------------------------------------------
		The script which calls the Stored Procedure

		IMPORTANT... Note that the Excel File Name and it's location on the Server is
						specified in the first script.
		So the Steps are:
			1. Specify Excel File Location in "01 Data Upload Proc.sql"
			2. Execute "01 Data Upload Proc.sql"
			2. Execute "02 Data Upload.sql"			.. this script
    ==================================================================================
								      								  Revision History
    ----------------------------------------------------------------------------------
			Initial version
   ==================================================================================*/

USE ZSM
GO

SET XACT_ABORT ON

BEGIN TRAN

DECLARE
	@rval	INT,
	@recs	INT;		--- No. of records to be processed

SET @recs = 0;

EXEC @rval = TmpDataUpload 'AHM', 'No', @recs OUTPUT
IF (@rval = 0)
	EXEC @rval = TmpDataUpload 'AHM', 'Yes', @recs OUTPUT

IF (@rval = 0)
	COMMIT
ELSE
	ROLLBACK


DROP PROCEDURE TmpDataUpload

/*
	   To do .....
	   ~~~~~~~~~~~
			* DELETE TmpReference remarks_type
*/
