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
  HexDisplayPrefix = '$';

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
  SStackOverflow = 'Stack overflow';
  SControlC = 'Control-C hit';
  SQuit = 'Quit key hit';
  SPrivilege = 'Privileged instruction';
  SOperationAborted = 'Operation aborted';
  SExceptTitle = 'Application Error';
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

  {RTLConsts}
  SInvalidMethodPropertyDelegate = 'Invalid property: [%s] Could not create delegate';
  SInvalidMethodPropertyAccessor = 'Invalid property: [%s] Could not find method accessor';
  SMethodNotFoundError = 'Method (%s) not found';

    SCmplxCouldNotParseImaginary = 'Could not parse imaginary portion';
  SCmplxCouldNotParseSymbol = 'Could not parse required ''%s'' symbol';
  SCmplxCouldNotParsePlus = 'Could not parse required ''+'' (or ''-'') symbol';
  SCmplxCouldNotParseReal = 'Could not parse real portion';
  SCmplxUnexpectedEOS = 'Unexpected end of string [%s]';
  SCmplxUnexpectedChars = 'Unexpected characters';
  SCmplxErrorSuffix = '%s [%s<?>%s]';

  hNoSystem = 'No Help Manager installed.';
  hNoTopics = 'No topic-based help installed.';
  hNoContext = 'No context-sensitive help installed.';
  hNoContextFound = 'No help found for context %d.';
  hNothingFound = 'No help found for "%s"';
  hNoTableOfContents = 'No Table of Contents found.';

  { ************************************************************************* }
  { Distance's family type }
  SDistanceDescription = 'Distance';

  { Distance's various conversion types }
  SMicromicronsDescription = 'Micromicrons';
  SAngstromsDescription = 'Angstroms';
  SMillimicronsDescription = 'Millimicrons';
  SMicronsDescription = 'Microns';
  SMillimetersDescription = 'Millimeters';
  SCentimetersDescription = 'Centimeters';
  SDecimetersDescription = 'Decimeters';
  SMetersDescription = 'Meters';
  SDecametersDescription = 'Decameters';
  SHectometersDescription = 'Hectometers';
  SKilometersDescription = 'Kilometers';
  SMegametersDescription = 'Megameters';
  SGigametersDescription = 'Gigameters';
  SInchesDescription = 'Inches';
  SFeetDescription = 'Feet';
  SYardsDescription = 'Yards';
  SMilesDescription = 'Miles';
  SNauticalMilesDescription = 'NauticalMiles';
  SAstronomicalUnitsDescription = 'AstronomicalUnits';
  SLightYearsDescription = 'LightYears';
  SParsecsDescription = 'Parsecs';
  SCubitsDescription = 'Cubits';
  SFathomsDescription = 'Fathoms';
  SFurlongsDescription = 'Furlongs';
  SHandsDescription = 'Hands';
  SPacesDescription = 'Paces';
  SRodsDescription = 'Rods';
  SChainsDescription = 'Chains';
  SLinksDescription = 'Links';
  SPicasDescription = 'Picas';
  SPointsDescription = 'Points';

  { ************************************************************************* }
  { Area's family type }
  SAreaDescription = 'Area';

  { Area's various conversion types }
  SSquareMillimetersDescription = 'SquareMillimeters';
  SSquareCentimetersDescription = 'SquareCentimeters';
  SSquareDecimetersDescription = 'SquareDecimeters';
  SSquareMetersDescription = 'SquareMeters';
  SSquareDecametersDescription = 'SquareDecameters';
  SSquareHectometersDescription = 'SquareHectometers';
  SSquareKilometersDescription = 'SquareKilometers';
  SSquareInchesDescription = 'SquareInches';
  SSquareFeetDescription = 'SquareFeet';
  SSquareYardsDescription = 'SquareYards';
  SSquareMilesDescription = 'SquareMiles';
  SAcresDescription = 'Acres';
  SCentaresDescription = 'Centares';
  SAresDescription = 'Ares';
  SHectaresDescription = 'Hectares';
  SSquareRodsDescription = 'SquareRods';

  { ************************************************************************* }
  { Volume's family type }
  SVolumeDescription = 'Volume';

  { Volume's various conversion types }
  SCubicMillimetersDescription = 'CubicMillimeters';
  SCubicCentimetersDescription = 'CubicCentimeters';
  SCubicDecimetersDescription = 'CubicDecimeters';
  SCubicMetersDescription = 'CubicMeters';
  SCubicDecametersDescription = 'CubicDecameters';
  SCubicHectometersDescription = 'CubicHectometers';
  SCubicKilometersDescription = 'CubicKilometers';
  SCubicInchesDescription = 'CubicInches';
  SCubicFeetDescription = 'CubicFeet';
  SCubicYardsDescription = 'CubicYards';
  SCubicMilesDescription = 'CubicMiles';
  SMilliLitersDescription = 'MilliLiters';
  SCentiLitersDescription = 'CentiLiters';
  SDeciLitersDescription = 'DeciLiters';
  SLitersDescription = 'Liters';
  SDecaLitersDescription = 'DecaLiters';
  SHectoLitersDescription = 'HectoLiters';
  SKiloLitersDescription = 'KiloLiters';
  SAcreFeetDescription = 'AcreFeet';
  SAcreInchesDescription = 'AcreInches';
  SCordsDescription = 'Cords';
  SCordFeetDescription = 'CordFeet';
  SDecisteresDescription = 'Decisteres';
  SSteresDescription = 'Steres';
  SDecasteresDescription = 'Decasteres';

  { American Fluid Units }
  SFluidGallonsDescription = 'FluidGallons';
  SFluidQuartsDescription = 'FluidQuarts';
  SFluidPintsDescription = 'FluidPints';
  SFluidCupsDescription = 'FluidCups';
  SFluidGillsDescription = 'FluidGills';
  SFluidOuncesDescription = 'FluidOunces';
  SFluidTablespoonsDescription = 'FluidTablespoons';
  SFluidTeaspoonsDescription = 'FluidTeaspoons';

  { American Dry Units }
  SDryGallonsDescription = 'DryGallons';
  SDryQuartsDescription = 'DryQuarts';
  SDryPintsDescription = 'DryPints';
  SDryPecksDescription = 'DryPecks';
  SDryBucketsDescription = 'DryBuckets';
  SDryBushelsDescription = 'DryBushels';

  { English Imperial Fluid/Dry Units }
  SUKGallonsDescription = 'UKGallons';
  SUKPottlesDescription = 'UKPottle';
  SUKQuartsDescription = 'UKQuarts';
  SUKPintsDescription = 'UKPints';
  SUKGillsDescription = 'UKGill';
  SUKOuncesDescription = 'UKOunces';
  SUKPecksDescription = 'UKPecks';
  SUKBucketsDescription = 'UKBuckets';
  SUKBushelsDescription = 'UKBushels';

  { ************************************************************************* }
  { Mass's family type }
  SMassDescription = 'Mass';

  { Mass's various conversion types }
  SNanogramsDescription = 'Nanograms';
  SMicrogramsDescription = 'Micrograms';
  SMilligramsDescription = 'Milligrams';
  SCentigramsDescription = 'Centigrams';
  SDecigramsDescription = 'Decigrams';
  SGramsDescription = 'Grams';
  SDecagramsDescription = 'Decagrams';
  SHectogramsDescription = 'Hectograms';
  SKilogramsDescription = 'Kilograms';
  SMetricTonsDescription = 'MetricTons';
  SDramsDescription = 'Drams';
  SGrainsDescription = 'Grains';
  STonsDescription = 'Tons';
  SLongTonsDescription = 'LongTons';
  SOuncesDescription = 'Ounces';
  SPoundsDescription = 'Pounds';
  SStonesDescription = 'Stones';

  { ************************************************************************* }
  { Temperature's family type }
  STemperatureDescription = 'Temperature';

  { Temperature's various conversion types }
  SCelsiusDescription = 'Celsius';
  SKelvinDescription = 'Kelvin';
  SFahrenheitDescription = 'Fahrenheit';
  SRankineDescription = 'Rankine';
  SReaumurDescription = 'Reaumur';

  { ************************************************************************* }
  { Time's family type }
  STimeDescription = 'Time';

  { Time's various conversion types }
  SMilliSecondsDescription = 'MilliSeconds';
  SSecondsDescription = 'Seconds';
  SMinutesDescription = 'Minutes';
  SHoursDescription = 'Hours';
  SDaysDescription = 'Days';
  SWeeksDescription = 'Weeks';
  SFortnightsDescription = 'Fortnights';
  SMonthsDescription = 'Months';
  SYearsDescription = 'Years';
  SDecadesDescription = 'Decades';
  SCenturiesDescription = 'Centuries';
  SMillenniaDescription = 'Millennia';
  SDateTimeDescription = 'DateTime';
  SJulianDateDescription = 'JulianDate';
  SModifiedJulianDateDescription = 'ModifiedJulianDate';

  // The following strings are now found in SysConsts.pas
  //SInvalidDate = '''''%s'''' is not a valid date' 
  //SInvalidDateTime = '''''%s'''' is not a valid date and time' 
  //SInvalidInteger = '''''%s'''' is not a valid integer value' 
  //SInvalidTime = '''''%s'''' is not a valid time' 
  //STimeEncodeError = 'Invalid argument to time encode' 

  // Added in VCL.NET
  SCouldNotParseImaginary = 'Could not parse imaginary portion';
  SCouldNotParseSymbol = 'Could not parse required ''%s'' symbol';
  SCouldNotParsePlus = 'Could not parse required ''+'' (or ''-'') symbol';
  SCouldNotParseReal = 'Could not parse real portion';
  SUnexpectedChars = 'Unexpected characters';
  SErrorSuffix = '%s [%s<?>%s]';
  SImaginaryNotZero = 'Could not simplify, imaginary part is non-zero [%s]';

  SUnknownEnumName = 'Enumeration does not contain %s';
  SUnknownEnumValue = 'Enumeration does not contain 0x%.8x';
  SInvalidPropInfoType = 'Invalid property info type';
  SInvalidTypeInfoType = 'Invalid property typeinfo type';

  SNoConstructorFound = 'No suitiable constructor found';
  SItemNotFoundWithPrefix = 'Item not found (%s%x)';

  SNotAConversionString = 'string does not represent a valid Conversion type value.';

implementation

end.
