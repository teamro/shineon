// The contents of this file are subject to the Mozilla Public License Version 1.1 (the "License"); 
// you may not use this file except in compliance with the License. You may obtain a copy of the 
// License at http://www.mozilla.org/MPL/ 
// 
// Software distributed under the License is distributed on an "AS IS" basis, WITHOUT WARRANTY OF 
// ANY KIND, either express or implied. See the License for the specificlanguage governing rights and 
// limitations under the License.

namespace ShineOn.Rtl;

interface

var 
  sLineBreak: String := System.Environment.NewLine;

  sErrorLoadingPackage: String := 'Can''t load package {0}.'+sLineBreak+'{1}';
  SException: String := 'Exception {0} in module {1} at {2}.' + sLineBreak + '{3}{4}' + sLineBreak;
  SOSError: String := 'System Error.  Code: {0}.'+sLineBreak+'{1}';

const
  { mh: maybe convert it into a global method that would call the NewLine property?
        note that the ifdef will not work when running the same .exe on Mono and .NET,
        the same will apply to stuff like path separaters, etc. }
  
  // wish I could use System.Environment.NewLine here...
  //sLineBreak = {$IFDEF LINUX} #10 {$ENDIF} {$IFDEF MSWINDOWS} #13#10 {$ENDIF};
  
  SUnknown = '<unknown>';
  SInvalidFloat = '''{0}'' is not a valid floating point value';
  SInvalidCurrency = '''{0}'' is not a valid currency value';
  SInvalidDateTimeFloat = '''{0}'' is not a valid date and time';
  SInvalidTimeStamp = '''{0}.{1}'' is not a valid timestamp';
  SInvalidGUID = '''{0}'' is not a valid Guid value';
  SInvalidBoolean = '''{0}'' is not a valid Boolean value';
  SDateEncodeError = 'Invalid argument to date encode';
  SOutOfMemory = 'Out of memory';
  SInOutError = 'I/O error {0}';
  SFileNotFound = 'File not found';
  STooManyOpenFiles = 'Too many open files';
  SAccessDenied = 'File access denied';
  SEndOfFile = 'Read beyond end of file';
  SDiskFull = 'Disk full';
  SInvalidInput = 'Invalid numeric input';
  SDivByZero = 'Division by zero';
  SRangeError = 'Range check error';
  SIntOverflow = 'Integer overflow';
  SInvalidOp = 'Invalid floating point operation';
  SZeroDivide = 'Floating point division by zero';
  SOverflow = 'Floating point overflow';
  SUnderflow = 'Floating point underflow';
  SInvalidPointer = 'Invalid pointer operation';
  SInvalidCast = 'Invalid class typecast';
{$IFDEF MSWINDOWS}
  SAccessViolation = 'Access violation at address {0}. {1} of address {2}';
{$ENDIF}
{$IFDEF LINUX}
  SAccessViolation = 'Access violation at address {0}, accessing address {1}';
{$ENDIF}
  SStackOverflow = 'Stack overflow';
  SControlC = 'Control-C hit';
  SQuit = 'Quit key hit';
  SPrivilege = 'Privileged instruction';
  SOperationAborted = 'Operation aborted';
  SExceptTitle = 'Application Error';
{$IFDEF LINUX}
  SSigactionFailed = 'sigaction call failed';
{$ENDIF}
  SInvalidFormat = 'Format ''{0}'' invalid or incompatible with argument';
  SArgumentMissing = 'No argument for format ''{0}''';
  SDispatchError = 'Variant method calls not supported';
  SReadAccess = 'Read';
  SWriteAccess = 'Write';
  SResultTooLong = 'Format result longer than 4096 characters';
  SFormatTooLong = 'Format String too long';

  SVarArrayCreate = 'Error creating variant array';
  SVarArrayBounds = 'Variant array index out of bounds';
  SVarArrayLocked = 'Variant array is locked';

  SInvalidVarCast = 'Invalid variant type conversion';
  SInvalidVarOp = 'Invalid variant operation';
  SInvalidVarOpWithHResult = 'Invalid variant operation (${0:8x})';

  SVarTypeOutOfRange = 'Custom variant type ({0.4x}) is out of range';
  SVarTypeAlreadyUsed = 'Custom variant type ({0.4x}) already used by {1}';
  SVarTypeNotUsable = 'Custom variant type ({0.4x}) is not usable';
  SVarTypeTooManyCustom = 'Too many custom variant types have been registered';
  SVarTypeRangeCheck1 = 'Range check error for variant of type ({0})';
  SVarTypeRangeCheck2 = 'Range check error while converting variant of type ({0}) into type ({1})';
  SInvalidVarNullOp = 'Invalid NULL variant operation';

  SVarTypeCouldNotConvert = 'Could not convert variant of type ({0}) into type ({1})';
  SVarTypeConvertOverflow = 'Overflow while converting variant of type ({0}) into type ({1})';
  SVarOverflow = 'Variant overflow';
  SVarInvalid = 'Invalid argument';
  SVarBadType = 'Invalid variant type';
  SVarNotImplemented = 'Operation not supported';
  SVarOutOfMemory = 'Variant operation ran out memory';
  SVarUnexpected = 'Unexpected variant error';

  SVarDataClearRecursing = 'Recursion while doing a VarDataClear';
  SVarDataCopyRecursing = 'Recursion while doing a VarDataCopy';
  SVarDataCopyNoIndRecursing = 'Recursion while doing a VarDataCopyNoInd';
  SVarDataInitRecursing = 'Recursion while doing a VarDataInit';
  SVarDataCastToRecursing = 'Recursion while doing a VarDataCastTo';
  SVarIsEmpty = 'Variant is empty';
  sUnknownFromType = 'Cannot convert from the specified type';
  sUnknownToType = 'Cannot convert to the specified type';
  SExternalException = 'External exception {0x}';
  SAssertionFailed = 'Assertion failed';
  SIntfCastError = 'Interface not supported';
  SSafecallException = 'Exception in safecall method';
  SAssertError = '{0} ({1}, line {2})';
  SAbstractError = 'Abstract Error';
  SModuleAccessViolation = 'Access violation at address {0} in module ''{1}''. {2} of address {3}';
  SCannotReadPackageInfo = 'Cannot access package information for package ''{0}''';
  SInvalidPackageFile = 'Invalid package file ''{0}''';
  SInvalidPackageHandle = 'Invalid package handle';
  SDuplicatePackageUnit = 'Cannot load package ''{0}.''  It contains unit ''{1},''' +
    'which is also contained in package ''{2}''';
  SUnkOSError = 'A call to an OS function failed';
  SNL = 'Application is not licensed to use this feature';


  SShortMonthNameJan = 'Jan';
  SShortMonthNameFeb = 'Feb';
  SShortMonthNameMar = 'Mar';
  SShortMonthNameApr = 'Apr';
  SShortMonthNameMay = 'May';
  SShortMonthNameJun = 'Jun';
  SShortMonthNameJul = 'Jul';
  SShortMonthNameAug = 'Aug';
  SShortMonthNameSep = 'Sep';
  SShortMonthNameOct = 'Oct';
  SShortMonthNameNov = 'Nov';
  SShortMonthNameDec = 'Dec';

  SLongMonthNameJan = 'January';
  SLongMonthNameFeb = 'February';
  SLongMonthNameMar = 'March';
  SLongMonthNameApr = 'April';
  SLongMonthNameMay = 'May';
  SLongMonthNameJun = 'June';
  SLongMonthNameJul = 'July';
  SLongMonthNameAug = 'August';
  SLongMonthNameSep = 'September';
  SLongMonthNameOct = 'October';
  SLongMonthNameNov = 'November';
  SLongMonthNameDec = 'December';

  SShortDayNameSun = 'Sun';
  SShortDayNameMon = 'Mon';
  SShortDayNameTue = 'Tue';
  SShortDayNameWed = 'Wed';
  SShortDayNameThu = 'Thu';
  SShortDayNameFri = 'Fri';
  SShortDayNameSat = 'Sat';

  SLongDayNameSun = 'Sunday';
  SLongDayNameMon = 'Monday';
  SLongDayNameTue = 'Tuesday';
  SLongDayNameWed = 'Wednesday';
  SLongDayNameThu = 'Thursday';
  SLongDayNameFri = 'Friday';
  SLongDayNameSat = 'Saturday';

{$IFDEF LINUX}
  SEraEntries = '';
{$ENDIF}

  SCannotCreateDir = 'Unable to create directory';

  SAncestorNotFound = 'Ancestor for ''{0}'' not found';
  SAssignError = 'Cannot assign a {0} to a {1}';
  SBitsIndexError = 'Bits index out of range';
  SBucketListLocked = 'List is locked during an active ForEach';
  SCantWriteResourceStreamError = 'Can''t write to a read-only resource stream';
  SCharExpected = '''''{0}'''' expected';
  SCheckSynchronizeError = 'CheckSynchronize called from thread ${0x}, which is NOT the main thread';
  SClassNotFound = 'Class {0} not found';
  SDelimiterQuoteCharError = 'Delimiter and QuoteChar properties cannot have the same value';
  SDuplicateClass = 'A class named {0} already exists';
  SDuplicateItem = 'List does not allow duplicates ($0{0x})';
  SDuplicateName = 'A component named {0} already exists';
  SDuplicateString = 'String list does not allow duplicates';
  SFCreateError = 'Cannot create file {0}';
  SFixedColTooBig = 'Fixed column count must be less than column count';
  SFixedRowTooBig = 'Fixed row count must be less than row count';
  SFOpenError = 'Cannot open file {0}';
  SGridTooLarge = 'Grid too large for operation';
  SIdentifierExpected = 'Identifier expected';
  SIndexOutOfRange = 'Grid index out of range';
  SIniFileWriteError = 'Unable to write to {0}';
  SInvalidActionCreation = 'Invalid action creation';
  SInvalidActionEnumeration = 'Invalid action enumeration';
  SInvalidActionRegistration = 'Invalid action registration';
  SInvalidActionUnregistration = 'Invalid action unregistration';
  SInvalidBinary = 'Invalid binary value';
  SInvalidDate = '''''{0}'''' is not a valid date';
  SInvalidDateTime = '''''{0}'''' is not a valid date and time';
  SInvalidFileName = 'Invalid file name - {0}';
  SInvalidImage = 'Invalid stream format';
  SInvalidInteger = '''''{0}'''' is not a valid Int32 value';
  SInvalidMask = '''{0}'' is an invalid mask at ({1})';
  SInvalidName = '''''{0}'''' is not a valid component name';
  SInvalidProperty = 'Invalid property value';
  SInvalidPropertyElement = 'Invalid property element: {0}';
  SInvalidPropertyPath = 'Invalid property path';
  SInvalidPropertyType = 'Invalid property type: {0}';
  SInvalidPropertyValue = 'Invalid property value';
  SInvalidRegType = 'Invalid data type for ''{0}''';
  SInvalidString = 'Invalid String constant';
  SInvalidStringGridOp = 'Cannot insert or delete rows from grid';
  SInvalidTime = '''''{0}'''' is not a valid time';
  SItemNotFound = 'Item not found (${0x})';
  SLineTooLong = 'Line too long';
  SListCapacityError = 'List capacity out of bounds ({0})';
  SListCountError = 'List count out of bounds ({0})';
  SListIndexError = 'List index out of bounds ({0})';
  SMaskErr = 'Invalid input value';
  SMaskEditErr = 'Invalid input value.  Use escape key to abandon changes';
  SMemoryStreamError = 'Out of memory while expanding memory stream';
  SNoComSupport = '{0} has not been registered as a COM class';
  SNotPrinting = 'Printer is not currently printing';
  SNumberExpected = 'Number expected';
  SParseError = '{0} on line {1}';
  SComponentNameTooLong = 'Component name ''{0}'' exceeds 64 character limit';
  SPropertyException = 'Error reading {0}{1}{2}: {3}';
  SPrinting = 'Printing in progress';
  SReadError = 'Stream read error';
  SReadOnlyProperty = 'Property is read-only';
  SRegCreateFailed = 'Failed to create key {0}';
  SRegGetDataFailed = 'Failed to get data for ''{0}''';
  SRegisterError = 'Invalid component registration';
  SRegSetDataFailed = 'Failed to set data for ''{0}''';
  SResNotFound = 'Resource {0} not found';
  SSeekNotImplemented = '{0}.Seek not implemented';
  SSortedListError = 'Operation not allowed on sorted list';
  SStringExpected = 'String expected';
  SSymbolExpected = '{0} expected';
  STimeEncodeError = 'Invalid argument to time encode';
  STooManyDeleted = 'Too many rows or columns deleted';
  SUnknownGroup = '{0} not in a class registration group';
  SUnknownProperty = 'Property {0} does not exist';
  SWriteError = 'Stream write error';
  SStreamSetSize = 'Error setting stream size';
  SThreadCreateError = 'Thread creation error: {0}';
  SThreadError = 'Thread Error: {0} ({1})';

  SInvalidDateDay = '({0}, {1}) is not a valid DateDay pair';
  SInvalidDateWeek = '({0}, {1}, {2}) is not a valid DateWeek triplet';
  SInvalidDateMonthWeek = '({0}, {1}, {2}, {3}) is not a valid DateMonthWeek quad';
  SInvalidDayOfWeekInMonth = '({0}, {1}, {2}, {3}) is not a valid DayOfWeekInMonth quad';
  SInvalidJulianDate = '{0} Julian cannot be represented as a DateTime';
  SMissingDateTimeField = '?';

  SConvIncompatibleTypes2 = 'Incompatible conversion types [{0}, {1}]';
  SConvIncompatibleTypes3 = 'Incompatible conversion types [{0}, {1}, {2}]';
  SConvIncompatibleTypes4 = 'Incompatible conversion types [{0} - {1}, {2} - {3}]';
  SConvUnknownType = 'Unknown conversion type {0}';
  SConvDuplicateType = 'Conversion type ({0}) already registered in {1}';
  SConvUnknownFamily = 'Unknown conversion family {0}';
  SConvDuplicateFamily = 'Conversion family ({0}) already registered';
  SConvUnknownDescription = '[{0.8x}]';
  SConvIllegalType = 'Illegal type';
  SConvIllegalFamily = 'Illegal family';
  SConvFactorZero = '{0} has a factor of zero';
  SConvStrParseError = 'Could not parse {0}';
  SFailedToCallConstructor = 'TStrings descendant {0} failed to call inherited constructor';

  sWindowsSocketError = 'Windows socket error: {0} ({1}), on API ''{2}''';
  sAsyncSocketError = 'Asynchronous socket error {0}';
  sNoAddress = 'No address specified';
  sCannotListenOnOpen = 'Can''t listen on an open socket';
  sCannotCreateSocket = 'Can''t create new socket';
  sSocketAlreadyOpen = 'Socket already open';
  sCantChangeWhileActive = 'Can''t change value while socket is active';
  sSocketMustBeBlocking = 'Socket must be in blocking mode';
  sSocketIOError = '{0} error {1}, {2}';
  sSocketRead = 'Read';
  sSocketWrite = 'Write';
  sFmtSetLengthError = 'SetLength does not support the type {0}';

implementation

end.
