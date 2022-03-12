using System;
using System.Collections.Generic;
using System.Text;

namespace DCC.UMB.CDF.Configuration
{

    public class MsgCodes
    {
        /// [[SQL String to generate this const file is
        /// sselect 'public const string '+ message_cd + ' = "' + replace(message_cd,'"','\"') + '";' 
        /// + '		//' + message_text
        /// from sysadmin..standard_messages
        /// ]]
        public const string ValueReqdSpecs = "ValueReqdSpecs";  //@1 can be specified only if @2 is @3 
        public const string ValueNotReqd = "ValueNotReqd";  //@1 can not be specified 
        public const string NotExist = "NotExist";  //@1 does not exist in the Database 
        public const string ExistInfo = "ExistInfo";  //@1 exist(s) in database 
        public const string OutOfRange = "OutOfRange";  //@1 must be between @2 and @3 
        public const string InvalidPeriod = "InvalidPeriod";  //@1 must be earlier than @2 
        public const string GreaterValueReqd = "GreaterValueReqd";  //@1 must be greater than @2 
        public const string GreaterOrEqualValueReqd = "GreaterOrEqualValueReqd";  //@1 must be greater than or equal to @2 
        public const string LesserValueReqd = "LesserValueReqd";  //@1 must be less than @2 
        public const string LesserOrEqualValueReqd = "LesserOrEqualValueReqd";  //@1 must be less than or equal to @2 
        public const string ValueList = "ValueList";  //@1 must be out of: @2 
        public const string ValueReqd = "ValueReqd";  //@1 must be specified 
        public const string CancelProcess = "CancelProcess";  //@1 Process is Cancelled 
        public const string ProcessMsg = "ProcessMsg";  //@1 Process successfully completed 
        public const string SaveWarning = "SaveWarning";  //@1 warning(s) detected! Continue with saving? 
        public const string ConfirmProcess = "ConfirmProcess";  //About to @1! Proceed with the process? 
        public const string FirstRecord = "FirstRecord";  //Already at First Record 
        public const string LastRecord = "LastRecord";  //Already at Last Record 
        public const string PrimaryKeyConstraint = "PrimaryKeyConstraint";  //Cant repeat field @1 in table @2 as it is primary key 
        public const string CheckConstraint = "CheckConstraint";  //Check constraints violated in table @1 
        public const string ExitWarning = "ExitWarning";  //Close the Application! Do you want to close? 
        public const string InvalidColumnIndexInHashmap = "InvalidColumnIndexInHashmap";  //Column Index @1 doesnt exists in hashmap 
        public const string ConnectionFailure = "ConnectionFailure";  //Connection cant be openened to @1 
        public const string DeleteWarning = "DeleteWarning";  //Continue with Delete Operation? 
        public const string DataChanged = "DataChanged";  //Data has changed in Current Record! Do you want to save changes? 
        public const string ChangeMode = "ChangeMode";  //Data has changed in screen! Continue with change mode? 
        public const string CloseWarning = "CloseWarning";  //Data has changed in screen! Continue with closing? 
        public const string MissingDelimiter = "MissingDelimiter";  //Delimiter @1 not found 
        public const string DetailsExpected = "DetailsExpected";  //Details are not specified for @1 
        public const string OneOfTwoValuesReqd = "OneOfTwoValuesReqd";  //Either @1 or @2 must be specified 
        public const string OneOfTwoValuesSpecs = "OneOfTwoValuesSpecs";  //Either @1 or @2 must be specified for @3 
        public const string OneOfThreeValuesReqd = "OneOfThreeValuesReqd";  //Either @1 or @2 or @3 must be specified 
        public const string NoUniqueRecordFound = "NoUniqueRecordFound";  //Either multiple or no record found for the given query
        public const string DisplayOrderError = "DisplayOrderError";  //Error occured while setting display order 
        public const string LookupError = "LookupError";  //Error while showing lookup 
        public const string FieldDoesNotExist = "FieldDoesNotExist";  //Field @1 does not exist in result set 
        public const string ForeignKeyConstraint = "ForeignKeyConstraint";  //Field @1 in table @2 is being referred 
        public const string DupValue = "DupValue";  //Information already exists 
        public const string RecordDeleted = "RecordDeleted";  //Information is successfully deleted 
        public const string SaveMsg = "SaveMsg";  //Information is successfully saved in the Database 
        public const string ObjectSaveMsg = "ObjectSaveMsg";  //Information is successfully saved in the Database for @1 with ID as @2
        public const string Internal = "Internal";  //Internal Error: @1 occurred at @2
        public const string InvalidMessage = "InvalidMessage";  //Internal Error: Invalid Message Code @1 used
        public const string InvalidApplicationArguments = "InvalidApplicationArguments";  //Invalid command line arguments passed to application
        public const string NoPrivilege = "NoPrivilege";  //No privileges for @1
        public const string NoRowMatchWithRowState = "NoRowMatchWithRowState";  //No row matches with row state @1
        public const string NotAffected = "NotAffected";  //No rows are affected
        public const string NoChanges = "NoChanges";  //Nothing to Save
        public const string InvalidScreenID = "InvalidScreenID";  //Screen ID @1 is invalid
        public const string NoFile = "NoFile";  //Specified file (@1) does not exist
        public const string SQLExecutionError = "SQLExecutionError";  //SQL Error: Cant execute SQL Statement
        public const string UniqueKeyConstraint = "UniqueKeyConstraint";  //Unique key violated in table @1
        public const string UnknownError = "UnknownError";  //Unknown error occured
        public const string MisMatchInfo = "MisMatchInfo";  //Values do not match for @1 and @2
        public const string NotFocusable = "NotFocusable";  //@1 is not focusable
        public const string InvalidArguments = "InvalidArguments";  //Invalid arguments passed to application
        public const string InterfaceNotImplemented = "InterfaceNotImplemented";  //Screen @1 does not implement Interface @2
        public const string BothValuesAreRequired = "BothValuesAreRequired";  //@1 must be specified if @2 is specified
        public const string NotAllowed = "NotAllowed";  //@1 is not allowed to update/delete @2
        public const string ValueRepeated = "ValueRepeated";  //@1 is repeated
        public const string ChangeNotAllowed = "ChangeNotAllowed";  //@1 cannot be modified
        public const string InvalidValue = "InvalidValue";  //Invalid @1 for @2
        public const string LengthMisMatch = "LengthMisMatch";  //@1 should be of exactly @2 characters
        public const string ScreenAlreadyOpened = "ScreenAlreadyOpened";  //Screen "@1" is already open in @2 Mode!
        public const string NoActiveControl = "NoActiveControl";  //There is no active control on the screen
        public const string PermissionDenied = "PermissionDenied";  //You don't have permissions to view @1 in @2 mode
        public const string NoMatchFound = "NoMatchFound";  //There is no record matching your query
        public const string NoRowToDelete = "NoRowToDelete";  //There is no row available for deletion
        public const string QuerySession = "QuerySession";  //This operation is not allowed in Query session
        public const string InValidSession = "InValidSession";  //The database session is not valid, please restart your application
        public const string MandatoryFieldsEmpty = "MandatoryFieldsEmpty";  //Please fill the mandatory fields of @1
        public const string InValidMode = "InValidMode";  //Internal Error, this mode is not supported
        public const string InValidOperation = "InValidOperation";  //Logging can't be peformed for this operation
        public const string MinCharacters = "MinCharacters";  //@1 should have atleast @2 characters
        public const string MaxResources = "MaxResources";  //Only @1 can be assigned for @2
        public const string NotAuthorized = "NotAuthorized";  //@1 is not authorized to @2
        /// <summary>@1 cannot be deleted @2</summary>
        public const string DeleteNotAllowed = "DeleteNotAllowed";  
        public const string OperationNotAllowed = "OperationNotAllowed";  //@1 cannot be performed because @2 
        public const string LookupMatchNotFound = "LookupMatchNotFound";  //Lookup could not find any record for your search @1
        public const string ObjectNotFound = "ObjectNotFound";  //@1 not found @2
        public const string StockInfo = "StockInfo";  //For item @1 available stock is @2
        public const string EqualValue = "EqualValue";  //@1 should be equal to @2
        public const string ObjectSaveMsgNum = "ObjectSaveMsgNum";  //Information is successfully saved in the Database for @1 with num as @2
        public const string ReferredEntity = "ReferredEntity";  //@1 cannot be @2, as it is referred by @3
        public const string ValueNotReqdSpecs = "ValueNotReqdSpecs";  //@1 cannot be set to @2 because of @3
        public const string OneOfTwoValuesOnly = "OneOfTwoValuesOnly";  //Either @1 or @2 should be specified
        public const string ToBeChanged = "ToBeChanged";  //This message needs to be changed @1        
        public const string NoCapturedImage = "Image Saving Failed! There is no image to save. Capture the image and try again";
        public const string UpdatePhoto = "Do you really want to overwrite the pervious photo!";

        public const string NotDeleted = "NotDeleted"; // Data could not be updated as some one else had changed/deleted it'
        public const string NotUpdated = "NotUpdated";// Data could not be deleted as some one else had changed/deleted it'
        public const string RefInt1 = "RefInt1";// @1 is not valid'
        public const string RefInt2 = "RefInt2";// @1 is/are not valid @2'

        public const string ObjectValidity = "ObjectValidity";	// @1 should be @2
        public const string ObjectCannotBe = "ObjectCannotBe";	// @1 cannot be @2
        public const string InvalidObject = "InvalidObject";	// @1 is invalid

        public const string PhotoSave = "PhotoSave";	// Photo successfully saved in @1. Please wait (preparing for next photo) ...
        public const string PhotoCancel = "PhotoCancel";	// Preparing for next photo. Please wait ...
        public const string PhotoPrepare = "PhotoPrepare";	// Photo cancelled. Please wait ...

        //[[Special/Internal Error Codes
        public const string ExceptionHandlerMessageCode = "@1";//This excepiton handler is used only while disposing exceptions
        //]]

    }
}
