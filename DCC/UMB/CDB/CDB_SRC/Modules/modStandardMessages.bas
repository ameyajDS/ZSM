Attribute VB_Name = "modStandardMessages"
'This Module is a replication of the data present in the SysAdmin
'Database standard_messages table.
'Whenever any confusion, the SysAdmin database would be the Master,
'this file is generated whenever the there is change in the standard_
'messages table.
'Development team should be refering to this module while coding and
'modErrros.UnknownError as the error_code instead of a string
 
 
Option Explicit

Public Const BothValuesAreRequired = "BothValuesAreRequired"           'SAM---- @1 must be specified if @2 is specified
Public Const CancelProcess = "CancelProcess"           'SAM---- @1 Process is Cancelled 
Public Const ChangeMode = "ChangeMode"           'SAM---- Data has changed in screen! Continue with change mode? 
Public Const ChangeNotAllowed = "ChangeNotAllowed"           'SAM---- @1 cannot be modified
Public Const CheckConstraint = "CheckConstraint"           'SAM---- Check constraints violated in table @1 
Public Const CloseWarning = "CloseWarning"           'SAM---- Data has changed in screen! Continue with closing? 
Public Const ConfirmProcess = "ConfirmProcess"           'SAM---- About to @1! Proceed with the process? 
Public Const ConnectionFailure = "ConnectionFailure"           'SAM---- Connection cant be openened to @1 
Public Const DataChanged = "DataChanged"           'SAM---- Data has changed in Current Record! Do you want to save changes? 
Public Const DeleteNotAllowed = "DeleteNotAllowed"           'SAM---- @1 cannot be deleted @2
Public Const DeleteWarning = "DeleteWarning"           'SAM---- Continue with Delete Operation? 
Public Const DetailsExpected = "DetailsExpected"           'SAM---- Details are not specified for @1 
Public Const DisplayOrderError = "DisplayOrderError"           'SAM---- Error occured while setting display order 
Public Const DupValue = "DupValue"           'SAM---- Information already exists 
Public Const EqualValue = "EqualValue"           'SAM---- @1 should be equal to @2
Public Const ExistInfo = "ExistInfo"           'SAM---- @1 exist(s) in database 
Public Const ExitWarning = "ExitWarning"           'SAM---- Close the Application! Do you want to close? 
Public Const FieldDoesNotExist = "FieldDoesNotExist"           'SAM---- Field @1 does not exist in result set 
Public Const FirstRecord = "FirstRecord"           'SAM---- Already at First Record 
Public Const ForeignKeyConstraint = "ForeignKeyConstraint"           'SAM---- Field @1 in table @2 is being referred 
Public Const GreaterOrEqualValueReqd = "GreaterOrEqualValueReqd"           'SAM---- @1 must be greater than or equal to @2 
Public Const GreaterValueReqd = "GreaterValueReqd"           'SAM---- @1 must be greater than @2 
Public Const InterfaceNotImplemented = "InterfaceNotImplemented"           'SAM---- Screen @1 does not implement Interface @2
Public Const Internal = "Internal"           'SAM---- Internal Error: @1 occurred at @2
Public Const InvalidApplicationArguments = "InvalidApplicationArguments"           'SAM---- Invalid command line arguments passed to application
Public Const InvalidArguments = "InvalidArguments"           'SAM---- Invalid arguments passed to application
Public Const InvalidColumnIndexInHashmap = "InvalidColumnIndexInHashmap"           'SAM---- Column Index @1 doesnt exists in hashmap 
Public Const InvalidMessage = "InvalidMessage"           'SAM---- Internal Error: Invalid Message Code @1 used
Public Const InValidMode = "InValidMode"           'SAM---- Internal Error, this mode is not supported
Public Const InValidOperation = "InValidOperation"           'SAM---- Logging can't be peformed for this operation
Public Const InvalidPeriod = "InvalidPeriod"           'SAM---- @1 must be earlier than @2 
Public Const InvalidScreenID = "InvalidScreenID"           'SAM---- Screen ID @1 is invalid
Public Const InValidSession = "InValidSession"           'SAM---- The database session is not valid, please restart your application
Public Const InvalidValue = "InvalidValue"           'SAM---- Invalid @1 for @2
Public Const LastRecord = "LastRecord"           'SAM---- Already at Last Record 
Public Const LengthMisMatch = "LengthMisMatch"           'SAM---- @1 should be of exactly @2 characters
Public Const LesserOrEqualValueReqd = "LesserOrEqualValueReqd"           'SAM---- @1 must be less than or equal to @2 
Public Const LesserValueReqd = "LesserValueReqd"           'SAM---- @1 must be less than @2 
Public Const LookupError = "LookupError"           'SAM---- Error while showing lookup 
Public Const LookupMatchNotFound = "LookupMatchNotFound"           'SAM---- Lookup could not find any record for your search @1
Public Const MandatoryFieldsEmpty = "MandatoryFieldsEmpty"           'SAM---- Please fill the mandatory fields of @1
Public Const MaxResources = "MaxResources"           'SAM---- Only @1 can be assigned for @2
Public Const MinCharacters = "MinCharacters"           'SAM---- @1 should have atleast @2 characters
Public Const MisMatchInfo = "MisMatchInfo"           'SAM---- Values do not match for @1 and @2
Public Const MissingDelimiter = "MissingDelimiter"           'SAM---- Delimiter @1 not found 
Public Const NoActiveControl = "NoActiveControl"           'SAM---- There is no active control on the screen
Public Const NoChanges = "NoChanges"           'SAM---- Nothing to Save
Public Const NoFile = "NoFile"           'SAM---- Specified file (@1) does not exist
Public Const NoMatchFound = "NoMatchFound"           'SAM---- There is no record matching your query
Public Const NoPrivilege = "NoPrivilege"           'SAM---- No privileges for @1
Public Const NoRowMatchWithRowState = "NoRowMatchWithRowState"           'SAM---- No row matches with row state @1
Public Const NoRowToDelete = "NoRowToDelete"           'SAM---- There is no row available for deletion
Public Const NotAffected = "NotAffected"           'SAM---- No rows are affected
Public Const NotAllowed = "NotAllowed"           'SAM---- @1 is not allowed to update/delete @2
Public Const NotAuthorized = "NotAuthorized"           'SAM---- @1 is not authorized to @2
Public Const NotExist = "NotExist"           'SAM---- @1 does not exist in the Database 
Public Const NotFocusable = "NotFocusable"           'SAM---- @1 is not focusable
Public Const NoUniqueRecordFound = "NoUniqueRecordFound"           'SAM---- Either multiple or no record found for the given query
Public Const ObjectNotFound = "ObjectNotFound"           'SAM---- @1 not found @2
Public Const ObjectSaveMsg = "ObjectSaveMsg"           'SAM---- Information is successfully saved in the Database for @1 with ID as @2
Public Const ObjectSaveMsgNum = "ObjectSaveMsgNum"           'SAM---- Information is successfully saved in the Database for @1 with num as @2
Public Const OneOfThreeValuesReqd = "OneOfThreeValuesReqd"           'SAM---- Either @1 or @2 or @3 must be specified 
Public Const OneOfTwoValuesOnly = "OneOfTwoValuesOnly"           'SAM---- Either @1 or @2 should be specified
Public Const OneOfTwoValuesReqd = "OneOfTwoValuesReqd"           'SAM---- Either @1 or @2 must be specified 
Public Const OneOfTwoValuesSpecs = "OneOfTwoValuesSpecs"           'SAM---- Either @1 or @2 must be specified for @3 
Public Const OperationNotAllowed = "OperationNotAllowed"           'SAM---- @1 cannot be performed because @2 
Public Const OutOfRange = "OutOfRange"           'SAM---- @1 must be between @2 and @3 
Public Const PermissionDenied = "PermissionDenied"           'SAM---- You don't have permissions to view @1 in @2 mode
Public Const PrimaryKeyConstraint = "PrimaryKeyConstraint"           'SAM---- Cant repeat field @1 in table @2 as it is primary key 
Public Const ProcessMsg   = "ProcessMsg  "           'SAM---- @1 Process successfully completed 
Public Const QuerySession = "QuerySession"           'SAM---- This operation is not allowed in Query session
Public Const RecordDeleted = "RecordDeleted"           'SAM---- Information is successfully deleted 
Public Const ReferredEntity = "ReferredEntity"           'SAM---- @1 cannot be @2, as it is referred by @3
Public Const SaveMsg = "SaveMsg"           'SAM---- Information is successfully saved in the Database 
Public Const SaveWarning = "SaveWarning"           'SAM---- @1 warning(s) detected! Continue with saving? 
Public Const ScreenAlreadyOpened = "ScreenAlreadyOpened"           'SAM---- Screen "@1" is already open in @2 Mode!
Public Const SQLExecutionError = "SQLExecutionError"           'SAM---- SQL Error: Cant execute SQL Statement
Public Const ToBeChanged = "ToBeChanged"           'SAM---- This message needs to be changed @1
Public Const UniqueKeyConstraint = "UniqueKeyConstraint"           'SAM---- Unique key violated in table @1
Public Const UnknownError = "UnknownError"           'SAM---- Unknown error occured
Public Const ValueList = "ValueList"           'SAM---- @1 must be out of: @2 
Public Const ValueNotReqd = "ValueNotReqd"           'SAM---- @1 can not be specified 
Public Const ValueNotReqdSpecs = "ValueNotReqdSpecs"           'SAM---- @1 cannot be set to @2 because of @3
Public Const ValueRepeated = "ValueRepeated"           'SAM---- @1 is repeated
Public Const ValueReqd = "ValueReqd"           'SAM---- @1 must be specified 
Public Const ValueReqdSpecs = "ValueReqdSpecs"           'SAM---- @1 can be specified only if @2 is @3 
Public Const StockInfo = "StockInfo"           'SIM---- For item @1 available stock is @2
