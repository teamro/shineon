// The contents of this file are subject to the Mozilla Public License Version 1.1 (the "License"); 
// you may not use this file except in compliance with the License. You may obtain a copy of the 
// License at http://www.mozilla.org/MPL/ 
// 
// Software distributed under the License is distributed on an "AS IS" basis, WITHOUT WARRANTY OF 
// ANY KIND, either express or implied. See the License for the specificlanguage governing rights and 
// limitations under the License.

// $Id: Types.pas 78 2006-04-09 11:16:43Z msgclb $

// History:
//
// 2005-06-04   :   Lloyd Kinsella    : More complete implementation of TDateTime
// 2006-03-16   :   Jeroen Vandezande : changed Integer to Word of some var's in TryEncodeDateTime & TryEncodeDate
// 2006-04-09   :   Corwin Burgess  : changed TDateTime form class to record

namespace ShineOn.RTL;

interface

uses
  System,
  System.Globalization,
  System.Runtime.InteropServices; // for guid attribute and FILETIME
  
type
{ TStream seek origins }
  TSeekOrigin = public (Beginning, Current, &End);

type  
  HRESULT = public LongInt;

  TGUID = public System.Guid;
  PGUID = public ^TGUID;

  PLongint = public ^LongInt;
  PInteger = public ^Integer;
  PSmallInt = public ^SmallInt;
  PDouble = public ^Double;
  PByte = public ^Byte;
  DWORD = public LongWord;

  TIntegerDynArray      = public array of Integer;
  TCardinalDynArray     = public array of Cardinal;
  TWordDynArray         = public array of Word;
  TSmallIntDynArray     = public array of SmallInt;
  TByteDynArray         = public array of Byte;
  TShortIntDynArray     = public array of ShortInt;
  TInt64DynArray        = public array of Int64;
  TLongWordDynArray     = public array of LongWord;
  TSingleDynArray       = public array of Single;
  TDoubleDynArray       = public array of Double;
  TBooleanDynArray      = public array of Boolean;
  TStringDynArray       = public array of String;
  TWideStringDynArray   = public array of WideString;

  TPoint = public System.Drawing.Point;
  TRect = public System.Drawing.Rectangle; 
  TSize = public System.Drawing.Size;
  TSmallPoint = public System.Drawing.Point;

  TOleChar = public WideChar;
  POleStr = public ^WideChar;
  PPOleStr = public ^POleStr;

  PCLSID = public ^TGUID;
  TCLSID = public TGUID;

  Largeint = public Int64;
  PDWORD = public ^DWORD;
  
  LCID = public Word;
  LANGID = public Word;

  PFileTime = public ^TFileTime;
  TFileTime = public FILETIME;

  [Guid('00000000-0000-0000-C000-000000000046')]
  IInterface = public interface
    function QueryInterface(const IID: TGUID; out Obj:IInterface): HRESULT; // stdcall;
    function _AddRef: Integer; // stdcall;
    function _Release: Integer; // stdcall;
  end;
  
  IUnknown = public interface(IInterface);

  IInvokable = public interface(IInterface);

 
  // Exceptions
  EAbort = public class(Exception);

  EHeapException = public class(Exception)
  private
    AllowFree: Boolean;
  public
//    procedure FreeInstance; override;
  end;

  EOutOfMemory = public class(EHeapException);

  EInOutError = public class(Exception)
  public
    ErrorCode: Integer;
  end;

  EExternal = public class(Exception)
  public
{$IFDEF MSWINDOWS}
    //ExceptionRecord: PExceptionRecord platform;
{$ENDIF}
{$IFDEF LINUX}
    //ExceptionAddress: LongWord platform;
    //AccessAddress: LongWord platform;
    //SignalNumber: Integer platform;
{$ENDIF}
  end;

  EExternalException = public class(EExternal);

  EIntError = public class(EExternal);
  EDivByZero = public class(EIntError);
  ERangeError = public class(EIntError);
  EIntOverflow = public class(EIntError);

  EMathError = public class(EExternal);
  EInvalidOp = public class(EMathError);
  EZeroDivide = public class(EMathError);
  EOverflow = public class(EMathError);
  EUnderflow = public class(EMathError);

  EInvalidPointer = public class(EHeapException);

  EInvalidCast = public class(Exception);

  EConvertError = public class(Exception);

  EAccessViolation = public class(EExternal);
  EPrivilege = public class(EExternal);
  EStackOverflow = public class(EExternal);
  EControlC = public class(EExternal);
  
{$IFDEF LINUX}
  EQuit = class(EExternal);
{$ENDIF}

  EVariantError = public class(Exception);

  EPropReadOnly = public class(Exception);
  EPropWriteOnly = public class(Exception);

  EAssertionFailed = public class(Exception);

{$IFNDEF PC_MAPPED_EXCEPTIONS}
  EAbstractError = public class(Exception);
{$ENDIF}

  EIntfCastError = public class(Exception);

  EInvalidContainer = public class(Exception);
  EInvalidInsert = public class(Exception);

  EPackageError = public class(Exception);

  EOSError = public class(Exception)
  public
    ErrorCode: DWORD;
  end;
  
{$IFDEF MSWINDOWS}
  EWin32Error = public class(EOSError);
{$ENDIF}

  ESafecallException = public class(Exception);


type

{ Text alignment types }
  TAlignment = public (LeftJustify, RightJustify, Center);
  TLeftRight = public (taLeftJustify,taRightJustify); //!!! Not compatible with global taLeftJustify/taRightJustify
  TBiDiMode = public (LeftToRight, RightToLeft, RightToLeftNoAlign, RightToLeftReadingOnly);
  TShiftState = public set of (Shift, Alt, Ctrl, Left, Right, Middle, Double);
  THelpType = public (Keyword, Context);
  
  
{ Types used by standard events }
type
//  THelpContext = -MaxLongint..MaxLongint; // not supported by Chrome
//  TShortCut = Low(Word)..High(Word); // not supported by Chrome

{ Standard events }

  TNotifyEvent = public procedure(Sender: Object) of object;
  TGetStrProc = public procedure(S: String) of object;

{ Exception classes }

  EStreamError = public class(Exception);
  EFCreateError = public class(EStreamError);
  EFOpenError = public class(EStreamError);
  EFilerError = public class(EStreamError);
  EReadError = public class(EFilerError);
  EWriteError = public class(EFilerError);
  EClassNotFound = public class(EFilerError);
  EMethodNotFound = public class(EFilerError);
  EInvalidImage = public class(EFilerError);
  EResNotFound = public class(Exception);
  EListError = public class(Exception);
  EBitsError = public class(Exception);
  EStringListError = public class(Exception);
  EComponentError = public class(Exception);
  EParserError = public class(Exception);
  EOutOfResources = public class(EOutOfMemory);
  EInvalidOperation = public class(Exception);

{ Duplicate management }

  TDuplicates = public (Ignore, Accept, Error);
  

type
{ TList class }

  //PPointerList = public ^TPointerList;
  //TPointerList = public array[0..MaxListSize - 1] of IntPtr;
  TTextLineBreakStyle = public (LF, CRLF);
  
type  
  THandle = public IntPtr;
  Currency = public Double;     // TODO: is this correct?
  
{ TDateTime Class }
  
type
  TDate = TDateTime;
  TTime = TDateTime;

  // TODO: handle negative values
  EDateTimeException = public class(Exception);
  TDateTime = public record (IFormattable, IComparable, IConvertible)
  private
    FValue: System.DateTime;
    class var FMinValue, FMaxValue: System.DateTime;
  public
    class constructor Create;
    constructor Create(const AValue: Double);
    constructor Create(const ADays: Integer);
    constructor Create(const AYear, AMonth, ADay, AHour, AMinute, ASecond, AMSec: Word);
        
    function ToString: String; override;
    function ToDateTime: DateTime;

    class function Parse(const AValue: String): TDateTime;
    class function Parse(const AValue: String; Provider: IFormatProvider): TDateTime;
    class function Parse(const AValue: String; Provider: IFormatProvider; Style: System.Globalization.DateTimeStyles): TDateTime;

    function Year: Integer;
    function Month: Integer;
    function Day: Integer;
    function Hour: Integer;
    function Minute: Integer;
    function Second: Integer;
    function MSec: Integer;
    function Ticks: Int64;
    function DayOfYear: Integer;
    function DayOfMonth: Integer;
    function DayOfWeek: Integer;
    function WeekOfYear: Integer;

    class function Time: TDateTime;
    class function Date: TDateTime;

    class function IsLeapYear(AYear: Word): Boolean;
    class function DaysInMonth(AYear, AMonth: Word): Word;
    class function Now: TDateTime;

    class function TheDate: TDateTime; 
    class function TheTime: TDateTime;
    class function TheYear: Word;

    class procedure DecodeDate(const AValue: TDateTime; out AYear, AMonth, ADay: Word);
    class function DecodeDate(const AValue: TDateTime; out AYear, AMonth, ADay, DOW: Word): Boolean;
    class procedure DecodeTime(const AValue: TDateTime; out AHour, AMinute, ASecond, AMSec: Word);
    class procedure DecodeDateTime(const AValue: TDateTime; out AYear, AMonth, ADay, AHour, AMinute, ASecond, AMSec: Word);
    class function EncodeDate(AYear, AMonth, ADay: Word): TDateTime;
    class function EncodeTime(AHour, AMinute, ASecond, AMSec: Word): TDateTime;
    class function EncodeDateTime(const AYear, AMonth, ADay, AHour, AMinute, ASecond, AMSec: Word): TDateTime;
    class function TryEncodeDate(AYear, AMonth, ADay: Word; out Rslt: TDateTime): Boolean;
    class function TryEncodeTime(AHour, AMinute, ASecond, AMSec: Word; out Rslt: TDateTime): Boolean;
    class function TryEncodeDateTime(const AYear, AMonth, ADay, AHour, AMinute, ASecond, AMSec: Word; out Rslt: TDateTime): Boolean;

    function ReplaceDate(AYear, AMonth, ADay: Word): TDateTime;
    function ReplaceDate(const ADate: TDateTime): TDateTime;
    function ReplaceTime(AHour, AMinute, ASecond, AMSec: Word): TDateTime;
    function ReplaceTime(const ATime: TDateTime): TDateTime;
    function AddMonth(AMonths: Integer): TDateTime;

    class function MinValue: TDateTime;
    class function MaxValue: TDateTime;

    class function Trunc(const AValue: TDateTime): Int64;
    class function Frac(const AValue: TDateTime): Double;
    class function Round(const AValue: TDateTime): Int64;

    class operator Minus(const AValue: TDateTime): TDateTime;
    class operator Plus(const AValue: TDateTime): TDateTime;

    class operator Add(const Left, Right: TDateTime): TDateTime;
    class operator Add(const Left: TDateTime; const Right: Double): TDateTime;
    class operator Add(const Left: TDateTime; const Right: System.TimeSpan): TDateTime;
    class operator Subtract(const Left, Right: TDateTime): TDateTime;
    class operator Subtract(const Left: TDateTime; const Right: Double): TDateTime;
    class operator Subtract(const Left: TDateTime; const Right: System.TimeSpan): TDateTime;

    class operator Equal(const Left, Right: TDateTime): Boolean;
    class operator NotEqual(const Left, Right: TDateTime): Boolean;
    class operator Less(const Left, Right: TDateTime): Boolean;
    class operator LessOrEqual(const Left, Right: TDateTime): Boolean;
    class operator Greater(const Left, Right: TDateTime): Boolean;
    class operator GreaterOrEqual(const Left, Right: TDateTime): Boolean;

    class operator Implicit(const AValue: Integer): TDateTime;
    class operator Implicit(const AValue: Int64): TDateTime;
    class operator Implicit(const AValue: Double): TDateTime;
    class operator Implicit(const AValue: TDateTime): Double;
    class operator Implicit(const AValue: System.DateTime): TDateTime;
    class operator Implicit(const AValue: TDateTime): System.DateTime;

    // IFormattable
    function ToString(Fmt: String; Provider: IFormatProvider): String;

    // IComparable
    function CompareTo(AValue: System.Object): Integer;

    // IConvertible
    function GetTypeCode: TypeCode;
    function ToInt16(Provider: IFormatProvider): SmallInt;
    function ToInt32(Provider: IFormatProvider): Integer;
    function ToSingle(Provider: IFormatProvider): Single;
    function ToDouble(Provider: IFormatProvider): Double;
    function ToDateTime(Provider: IFormatProvider): DateTime;
    function ToBoolean(Provider: IFormatProvider): Boolean;
    function ToDecimal(Provider: IFormatProvider): Decimal;
    function ToSByte(Provider: IFormatProvider): ShortInt;
    function ToByte(Provider: IFormatProvider): Byte;
    function ToUInt16(Provider: IFormatProvider): Word;
    function ToUInt32(Provider: IFormatProvider): LongWord;
    function ToInt64(Provider: IFormatProvider): Int64;
    function ToUInt64(Provider: IFormatProvider): UInt64;
    function ToString(Provider: IFormatProvider): String;
    function ToChar(Provider: IFormatProvider): Char;
    function ToType(Typ: System.Type; Provider: IFormatProvider): System.Object;
  end;
  
  TDayTable = public array [1..12] of Word;
  // The only difference between AnsiString and String is that AnsiString assumes that [] access is 1-based
  // TODO: maybe implement IComparable, ICloneable, IConvertible and IEnumerable?
  // !!! CURRENTLY EXPERIMENTAL - use at your own risk!!!
  AnsiString = public sealed class // should this be a struct instead (avoids having to create instances explicitly)?
  private
    FString:String;
    method set_Chars(Index:Int32; value: Char);
    method get_Chars(Index:Int32): Char;
  public
    class operator Add(const Left, Right: AnsiString): AnsiString;
    class operator Equal(const Left, Right: AnsiString): Boolean;
    class operator NotEqual(const Left, Right: AnsiString): Boolean;
    class operator Less(const Left, Right: AnsiString): Boolean;
    class operator LessOrEqual(const Left, Right: AnsiString): Boolean;
    class operator Greater(const Left, Right: AnsiString): Boolean;
    class operator GreaterOrEqual(const Left, Right: AnsiString): Boolean;

    class operator Implicit(const Value: String): AnsiString;
    // TODO: should we really allow implicit conversion from AnsiString to String? 
    // What happens when users call RTL String routines (i.e Pos) with AnsiString parameters?
    class operator Implicit(const Value: AnsiString): String;
    
    function ToString(Provider: IFormatProvider): String;
    function ToString: String;override;
    constructor (S:String);
    constructor (S:AnsiString);
    property Chars[Index:Int32]:Char read get_Chars write set_Chars;default;
  end;

const
  SDateOutOfRangeError = 'Value given is out of TDateTime range';
  SDateToStringError   = 'TDateTime value cannot be converted to a String';
  SStringToDateError   = 'String value cannot be converted to a TDateTime';
  SObjectToDateError   = 'Object value cannot be converted to a TDateTime';
  //SDateEncodeError     = 'Date values given cannot be converted to a TDateTime';
  //STimeEncodeError     = 'Time values given cannot be converted to a TDateTime';
  SDateTimeEncodeError = 'Date and Time values given cannot be converted to a TDateTime';

  MonthDays: array [0..1] of TDayTable = [[31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31],
                                          [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]];

  DaysPerWeek = 7;
  WeeksPerFortnight = 2;
  MonthsPerYear = 12;
  YearsPerDecade = 10;
  YearsPerCentury = 100;
  YearsPerMillennium = 1000;

  DayMonday = 1;
  DayTuesday = 2;
  DayWednesday = 3;
  DayThursday = 4;
  DayFriday = 5;
  DaySaturday = 6;
  DaySunday = 7;

  HoursPerDay = 24;
  MinsPerHour = 60;
  SecsPerMin  = 60;
  MSecsPerSec = 1000;
  MinsPerDay  = HoursPerDay * MinsPerHour;
  SecsPerDay  = MinsPerDay * SecsPerMin;
  MSecsPerDay = SecsPerDay * MSecsPerSec;
  
  OneHour = 1 / HoursPerDay;
  OneMinute = 1 / MinsPerDay;
  OneSecond = 1 / SecsPerDay;
  OneMillisecond = 1 / MSecsPerDay;
     
  DaysPerYear: array [0..1] of Word = [365, 366];
           
  {var RecodeLeaveFieldAsIs:Word := High(Word);}
  LFAI = $FF00; // Less typing, readable code
    
  DOWMap: array [1..7] of Word = [7, 1, 2, 3, 4, 5, 6];
  
  TicksPerDay: Int64 = 864000000000;

  DateDelta = 693594;

  MinDateTimeAsDouble:Double = -657434.0;     //  1/01/0100  0:00:00.000 AM
  MaxDateTimeAsDouble:Double = 2958465.99999; // 12/31/9999 11:59:59.999 PM
  
implementation

function DelphiEpoch: DateTime;
begin
  Result := new DateTime(1899,12,30,0,0,0,0);
end;

function DateTimeToDouble(const AValue: DateTime): Double;
begin
  Result := AValue.ToOADate;
end;

function DoubleToDateTime(const AValue: Double): DateTime;
begin
  Result := DateTime.FromOADate(AValue);
end;

class constructor TDateTime.Create;
begin
  FMinValue := System.DateTime.Create(100, 1, 1, 0, 0, 0, 0);
  FMaxValue := System.DateTime.Create(9999, 12, 31, 23, 59, 59, 999);
end;

constructor TDateTime.Create(const AValue: Double);
begin
  inherited Create;
  FValue := DoubleToDateTime(AValue);
end;

constructor TDateTime.Create(const ADays: Integer);
begin
  inherited Create;
  FValue := DoubleToDateTime(ADays);
end;

constructor TDateTime.Create(const AYear, AMonth, ADay, AHour, AMinute, ASecond, AMSec: Word);
begin
  inherited Create;
  FValue := new DateTime(AYear,AMonth,ADay,AHour,AMinute,ASecond,AMSec);
end;

function TDateTime.ToString: String;
begin
  Result := FValue.ToString;
end;

function TDateTime.ToDateTime: DateTime;
begin
  Result := FValue;
end;

class function TDateTime.Parse(const AValue: String): TDateTime;
begin
  Result.FValue := System.DateTime.Parse(AValue);
end;

class function TDateTime.Parse(const AValue: String; Provider: IFormatProvider): TDateTime;
begin
  Result.FValue := System.DateTime.Parse(AValue, Provider);
end;

class function TDateTime.Parse(const AValue: String; Provider: IFormatProvider; Style: System.Globalization.DateTimeStyles): TDateTime;
begin
  Result.FValue := System.DateTime.Parse(AValue, Provider, Style);
end;

function TDateTime.Year: Integer;
begin
  Result := FValue.Year;
end;

function TDateTime.Month: Integer;
begin
  Result := FValue.Month;
end;

function TDateTime.Day: Integer;
begin
  Result := FValue.Day;
end;

function TDateTime.Hour: Integer;
begin
  Result := FValue.Hour;
end;

function TDateTime.Minute: Integer;
begin
  Result := FValue.Minute;
end;

function TDateTime.Second: Integer;
begin
  Result := FValue.Second;
end;

function TDateTime.MSec: Integer;
begin
  Result := FValue.Millisecond;
end;

function TDateTime.Ticks: Int64;
begin
  Result := FValue.Ticks;
end;

function TDateTime.DayOfYear: Integer;
begin
  Result := FValue.DayOfYear;
end;

function TDateTime.DayOfMonth: Integer;
begin
  Result := FValue.Day;
end;

function TDateTime.DayOfWeek: Integer;
begin
  Result := Integer(FValue.DayOfWeek);
end;

function TDateTime.WeekOfYear: Integer;
var
  Culture: CultureInfo;
  DTFI: DateTimeFormatInfo;
begin
  Culture := System.Threading.Thread.CurrentThread.CurrentCulture;
  DTFI := Culture.DateTimeFormat;
  Result :=  Culture.Calendar.GetWeekOfYear(FValue,DTFI.CalendarWeekRule,DTFI.FirstDayOfWeek);
end;

class function TDateTime.IsLeapYear(AYear: Word): Boolean;
begin
  Result := DateTime.IsLeapYear(AYear);
end;

class function TDateTime.DaysInMonth(AYear, AMonth: Word): Word;
var
  Offset: Integer;
begin
  if DateTime.IsLeapYear(AYear) then
    Offset := 1
  else
    Offset := 0;
    
  Result := MonthDays[Offset][AMonth];
end;

class function TDateTime.Now: TDateTime;
begin
  Result.FValue := System.DateTime.Now;
end;

class function TDateTime.TheDate: TDateTime;
begin
  Result := Now.Date;
end;

class function TDateTime.TheTime: TDateTime;
begin
  Result := Now.Time;
end;

class function TDateTime.TheYear: Word;
begin
  Result := Now.Year;
end;

class function TDateTime.Time: TDateTime;
begin
  var LHour, LMinute, LSecond, LMSec: Word;

  var T:DateTime := DateTime.Now;
  Console.Out.WriteLine('TDateTime.Time T Now: {0}', T);
    
  DecodeTime(T, LHour, LMinute, LSecond, LMSec);

  Result := EncodeTime(LHour, LMinute, LSecond, LMSec);
end;

class function TDateTime.Date: TDateTime;
begin
  var D:DateTime := System.DateTime.Now;  
  Result.FValue := D.Date;
end;

class procedure TDateTime.DecodeDate(const AValue: TDateTime; out AYear, AMonth, ADay: Word);
begin
  AYear := AValue.Year;
  AMonth := AValue.Month;
  ADay := AValue.Day;
end;

class function TDateTime.DecodeDate(const AValue: TDateTime; out AYear, AMonth, ADay, DOW: Word): Boolean;
begin
  AYear := AValue.Year;
  AMonth := AValue.Month;
  ADay := AValue.Day;
  DOW := AValue.DayOfWeek;
end;

class procedure TDateTime.DecodeTime(const AValue: TDateTime; out AHour, AMinute, ASecond, AMSec: Word);
begin
  AHour := AValue.Hour;
  AMinute := AValue.Minute;
  ASecond := AValue.Second;
  AMSec := AValue.MSec;
end;

class procedure TDateTime.DecodeDateTime(const AValue: TDateTime; out AYear, AMonth, ADay, AHour, AMinute, ASecond, AMSec: Word);
begin
  TDateTime.DecodeDate(AValue,AYear,AMonth,ADay);
  TDateTime.DecodeTime(AValue,AHour,AMinute,ASecond,AMSec);
end;

class function TDateTime.EncodeDate(AYear, AMonth, ADay: Word): TDateTime;
begin
  Result := new TDateTime(AYear,AMonth,ADay,0,0,0,0);
end;

class function TDateTime.EncodeTime(AHour, AMinute, ASecond, AMSec: Word): TDateTime;
begin
  Result := new TDateTime(100,1,1,AHour,AMinute,ASecond,AMSec);
end;

class function TDateTime.EncodeDateTime(const AYear, AMonth, ADay, AHour, AMinute, ASecond, AMSec: Word): TDateTime;
begin
  Result := new TDateTime(AYear,AMonth,ADay,AHour,AMinute,ASecond,AMSec);
end;

class function TDateTime.TryEncodeDate(AYear, AMonth, ADay: Word; out Rslt: TDateTime): Boolean;
var
  Offset, DIM: word;
begin
  Result := False;
  Rslt := default(TDateTime);
  
  if (AYear < 100) or (AYear > 9999) then Exit;
  if (AMonth < 1) or (AMonth > 12) then Exit;
  
  if DateTime.IsLeapYear(AYear) then
    Offset := 1
  else
    Offset := 0;
    
  DIM := MonthDays[Offset][AMonth];
  
  if (ADay < 1) or (ADay > DIM) then Exit;
  
  Rslt := EncodeDate(AYear,AMonth,ADay);
  
  Result := True;
end;

class function TDateTime.TryEncodeTime(AHour, AMinute, ASecond, AMSec: Word; out Rslt: TDateTime): Boolean;
begin
  Result := False;
  Rslt := default(TDateTime);
  
  if (AHour < 0) or (AHour > 12) then Exit;
  if (AMinute < 0) or (AMinute > 59) then Exit;
  if (ASecond < 0) or (ASecond > 59) then Exit;
  if (AMSec < 0) or (AMSec > 999) then Exit;
  
  Rslt := EncodeTime(AHour,AMinute,ASecond,AMSec);
  
  Result := True;
end;

class function TDateTime.TryEncodeDateTime(const AYear, AMonth, ADay, AHour, AMinute, ASecond, AMSec: Word; out Rslt: TDateTime): Boolean;
var
  Offset, DIM: word;
begin
  Result := False;
  Rslt := default(TDateTime);
  
  if (AYear < 100) or (AYear > 9999) then Exit;
  if (AMonth < 1) or (AMonth > 12) then Exit;
  
  if DateTime.IsLeapYear(AYear) then
    Offset := 1
  else
    Offset := 0;
    
  DIM := MonthDays[Offset][AMonth];
  
  if (ADay < 1) or (ADay > DIM) then Exit;
  
  if (AHour < 0) or (AHour > 12) then Exit;
  if (AMinute < 0) or (AMinute > 59) then Exit;
  if (ASecond < 0) or (ASecond > 59) then Exit;
  if (AMSec < 0) or (AMSec > 999) then Exit;
  
  Rslt := EncodeDateTime(AYear,AMonth,ADay,AHour,AMinute,ASecond,AMSec);
  
  Result := True;
end;

function TDateTime.ReplaceDate(AYear, AMonth, ADay: Word): TDateTime;
var
  LHour, LMinute, LSecond, LMilliSecond: Word;
begin
  DecodeTime(Self, LHour, LMinute, LSecond, LMilliSecond);
  Result := EncodeDateTime(AYear, AMonth, ADay, LHour, LMinute, LSecond, LMilliSecond);
end;

function TDateTime.ReplaceDate(const ADate: TDateTime): TDateTime;
var
  LYear, LMonth, LDay: Word;
begin
  DecodeDate(ADate, LYear, LMonth, LDay);
  Result := ReplaceDate(LYear, LMonth, LDay);

end;

function TDateTime.ReplaceTime(AHour, AMinute, ASecond, AMSec: Word): TDateTime;
var
  LYear, LMonth, LDay: Word;
begin
  DecodeDate(Self, LYear, LMonth, LDay);
  Result := EncodeDateTime(LYear, LMonth, LDay, AHour, AMinute, ASecond, AMSec);

end;

function TDateTime.ReplaceTime(const ATime: TDateTime): TDateTime;
var
  LHour, LMinute, LSecond, LMilliSecond: Word;
begin
  DecodeTime(ATime, LHour, LMinute, LSecond, LMilliSecond);
  Result := ReplaceTime(LHour, LMinute, LSecond, LMilliSecond);

end;

function TDateTime.AddMonth(AMonths: Integer): TDateTime;
begin
  Result.FValue := FValue.AddMonths(AMonths);
end;

class function TDateTime.MinValue: TDateTime;
begin
  Result.FValue := FMinValue;
end;

class function TDateTime.MaxValue: TDateTime;
begin
  Result.FValue := FMaxValue;
end;

class function TDateTime.Trunc(const AValue: TDateTime): Int64;
begin
  Result := ShineOn.RTL.System.Trunc(AValue);
end;

class function TDateTime.Frac(const AValue: TDateTime): Double;
begin
  Result := ShineOn.RTL.System.Frac(AValue);
end;

class function TDateTime.Round(const AValue: TDateTime): Int64;
begin
  Result := ShineOn.RTL.System.Round(AValue);
end;

class operator TDateTime.Minus(const AValue: TDateTime): TDateTime;
begin
  Result := new TDateTime(-DateTimeToDouble(AValue));
end;

class operator TDateTime.Plus(const AValue: TDateTime): TDateTime;
begin
  Result := new TDateTime(AValue);
end;

class operator TDateTime.Add(const Left, Right: TDateTime): TDateTime;
var
  LeftDateTime, RightDateTime: DateTime;
begin
  LeftDateTime := Left.ToDateTime;
  RightDateTime := Right.ToDateTime;

  LeftDateTime.AddTicks(RightDateTime.Ticks);

  Result := TDateTime(LeftDateTime);
end;

class operator TDateTime.Add(const Left: TDateTime; const Right: Double): TDateTime;
var
  Buffer: TDateTime;
  LeftDateTime, RightDateTime: DateTime;
begin
  Buffer := new TDateTime(Right);
  LeftDateTime := Left.ToDateTime;
  RightDateTime := Buffer.ToDateTime;

  LeftDateTime.AddTicks(RightDateTime.Ticks);

  Result := TDateTime(LeftDateTime);
end;

class operator TDateTime.Add(const Left: TDateTime; const Right: System.TimeSpan): TDateTime;
var
  LeftDateTime, RightDateTime: DateTime;
begin
  LeftDateTime := Left.ToDateTime;
  RightDateTime := new DateTime(Right.Ticks);

  LeftDateTime.AddTicks(RightDateTime.Ticks);

  Result := TDateTime(RightDateTime);
end;

class operator TDateTime.Subtract(const Left, Right: TDateTime): TDateTime;
var
  Buffer: TimeSpan;
  LeftDateTime, RightDateTime: DateTime;
begin
  LeftDateTime := Left.ToDateTime;
  RightDateTime := Right.ToDateTime;

  Buffer := new TimeSpan(RightDateTime.Ticks);

  Result := TDateTime(LeftDateTime.Subtract(Buffer));
end;

class operator TDateTime.Subtract(const Left: TDateTime; const Right: Double): TDateTime;
var
  LeftDateTime, RightDateTime: DateTime;
  Span: TimeSpan;
  Buffer: DateTime;
begin
  LeftDateTime := Left.ToDateTime;
  RightDateTime := new TDateTime(Right).ToDateTime;

  Span := new TimeSpan(RightDateTime.Ticks);
  Buffer := LeftDateTime.Subtract(Span);

  Result := TDateTime(Buffer);
end;

class operator TDateTime.Subtract(const Left: TDateTime; const Right: System.TimeSpan): TDateTime;
var
  LeftDateTime: DateTime;
begin
  LeftDateTime := Left.ToDateTime;

  Result := TDateTime(LeftDateTime.Subtract(Right));
end;

class operator TDateTime.Equal(const Left, Right: TDateTime): Boolean;
var
  LeftDateTime, RightDateTime: DateTime;
begin
  LeftDateTime := Left.ToDateTime;
  RightDateTime := Right.ToDateTime;

  Result := (DateTime.Compare(LeftDateTime,RightDateTime) = 0);
end;

class operator TDateTime.NotEqual(const Left, Right: TDateTime): Boolean;
var
  LeftDateTime, RightDateTime: DateTime;
begin
  LeftDateTime := Left.ToDateTime;
  RightDateTime := Right.ToDateTime;

  Result := (DateTime.Compare(LeftDateTime,RightDateTime) <> 0);
end;

class operator TDateTime.Less(const Left, Right: TDateTime): Boolean;
var
  LeftDateTime, RightDateTime: DateTime;
begin
  LeftDateTime := Left.ToDateTime;
  RightDateTime := Right.ToDateTime;

  Result := (DateTime.Compare(LeftDateTime,RightDateTime) < 0);
end;

class operator TDateTime.LessOrEqual(const Left, Right: TDateTime): Boolean;
var
  LeftDateTime, RightDateTime: DateTime;
begin
  LeftDateTime := Left.ToDateTime;
  RightDateTime := Right.ToDateTime;

  if (DateTime.Compare(LeftDateTime,RightDateTime) < 0) or (DateTime.Compare(LeftDateTime,RightDateTime) = 0) then
    Result := True
  else
    Result := False;
end;

class operator TDateTime.Greater(const Left, Right: TDateTime): Boolean;
var
  LeftDateTime, RightDateTime: DateTime;
begin
  LeftDateTime := Left.ToDateTime;
  RightDateTime := Right.ToDateTime;

  Result := (DateTime.Compare(LeftDateTime,RightDateTime) > 0);
end;

class operator TDateTime.GreaterOrEqual(const Left, Right: TDateTime): Boolean;
var
  LeftDateTime, RightDateTime: DateTime;
begin
  LeftDateTime := Left.ToDateTime;
  RightDateTime := Right.ToDateTime;

  if (DateTime.Compare(LeftDateTime,RightDateTime) > 0) or (DateTime.Compare(LeftDateTime,RightDateTime) = 0) then
    Result := True
  else
    Result := False;
end;

class operator TDateTime.Implicit(const AValue: Integer): TDateTime;
begin
  Result := DoubleToDateTime(AValue);
end;

class operator TDateTime.Implicit(const AValue: Int64): TDateTime;
begin
  Result := DoubleToDateTime(AValue);
end;

class operator TDateTime.Implicit(const AValue: Double): TDateTime;
begin
  Result := DoubleToDateTime(AValue);
end;

class operator TDateTime.Implicit(const AValue: TDateTime): Double;
begin
  Result := DateTimeToDouble(AValue);
end;

class operator TDateTime.Implicit(const AValue: System.DateTime): TDateTime;
begin
  Result.FValue := AValue;
end;

class operator TDateTime.Implicit(const AValue: TDateTime): System.DateTime;
begin
  Result := AValue.FValue;
end;

// IFormattable
function TDateTime.ToString(Fmt: String; Provider: IFormatProvider): String;
begin
  Result := FValue.ToString(Fmt,Provider);
end;

// IComparable
function TDateTime.CompareTo(AValue: System.Object): Integer;
begin
  Result := FValue.CompareTo(AValue);
end;

// IConvertible
function TDateTime.GetTypeCode: TypeCode;
begin
  Result := TypeCode.DateTime;
end;

function TDateTime.ToInt16(Provider: IFormatProvider): SmallInt;
begin
  Result := Convert.ToInt16(FValue, Provider);
end;

function TDateTime.ToInt32(Provider: IFormatProvider): Integer;
begin
  Result := Convert.ToInt32(FValue, Provider);
end;

function TDateTime.ToSingle(Provider: IFormatProvider): Single;
begin
  Result := Convert.ToSingle(FValue, Provider);
end;

function TDateTime.ToDouble(Provider: IFormatProvider): Double;
begin
  Result := Convert.ToDouble(FValue, Provider);
end;

function TDateTime.ToDateTime(Provider: IFormatProvider): DateTime;
begin
  Result := Convert.ToDateTime(FValue, Provider);
end;

function TDateTime.ToBoolean(Provider: IFormatProvider): Boolean;
begin
  Result := Convert.ToBoolean(FValue, Provider);
end;

function TDateTime.ToDecimal(Provider: IFormatProvider): Decimal;
begin
  Result := Convert.ToDecimal(FValue, Provider);
end;

function TDateTime.ToSByte(Provider: IFormatProvider): ShortInt;
begin
  Result := Convert.ToSByte(FValue, Provider);
end;

function TDateTime.ToByte(Provider: IFormatProvider): Byte;
begin
  Result := Convert.ToByte(FValue, Provider);
end;

function TDateTime.ToUInt16(Provider: IFormatProvider): Word;
begin
  Result := Convert.ToUInt16(FValue, Provider);
end;

function TDateTime.ToUInt32(Provider: IFormatProvider): LongWord;
begin
  Result := Convert.ToUInt32(FValue, Provider);
end;

function TDateTime.ToInt64(Provider: IFormatProvider): Int64;
begin
  Result := Convert.ToInt64(FValue, Provider);
end;

function TDateTime.ToUInt64(Provider: IFormatProvider): UInt64;
begin
  Result := Convert.ToUInt64(FValue, Provider);
end;

function TDateTime.ToString(Provider: IFormatProvider): String;
begin
  Result := Convert.ToString(FValue, Provider);
end;

function TDateTime.ToChar(Provider: IFormatProvider): Char;
begin
  Result := Convert.ToChar(FValue, Provider);
end;

function TDateTime.ToType(Typ: System.Type; Provider: IFormatProvider): System.Object;
begin
  Result := Convert.ChangeType(FValue, Typ, Provider);
end;


{ AnsiString }

method AnsiString.get_Chars(Index:Int32): Char;
require
  Index > 0;
begin
  Result := FString[Index-1];
end;

method AnsiString.set_Chars(Index:Int32; value: Char);
require
  Index > 0;
begin
  // String doesn't support changing chars in the String, but we make an exception for AnsiString :)
  FString := FString.Remove(Index-1, 1).Insert(Index-1, value);
end;

constructor AnsiString(S:String); 
begin
  inherited Create;
  FString := S;
end;

constructor AnsiString(S:AnsiString); 
begin
  inherited Create;
  FString := S.ToString;
end;

class operator AnsiString.Add(const Left, Right: AnsiString): AnsiString; 
begin
  Result := new AnsiString(Left.ToString + Right.ToString);
end;

class operator AnsiString.Equal(const Left, Right: AnsiString): Boolean; 
begin
  Result := Left.ToString = Right.ToString;
end;

class operator AnsiString.NotEqual(const Left, Right: AnsiString): Boolean; 
begin
  Result := Left.ToString <> Right.ToString;
end;

class operator AnsiString.Less(const Left, Right: AnsiString): Boolean; 
begin
  Result := Left.ToString < Right.ToString;
end;

class operator AnsiString.LessOrEqual(const Left, Right: AnsiString): Boolean; 
begin
  Result := Left.ToString <= Right.ToString;
end;

class operator AnsiString.Greater(const Left, Right: AnsiString): Boolean; 
begin
  Result := Left.ToString > Right.ToString;
end;

class operator AnsiString.GreaterOrEqual(const Left, Right: AnsiString): Boolean; 
begin
  Result := Left.ToString >= Right.ToString;
end;

class operator AnsiString.Implicit(const Value: String): AnsiString; 
begin
   Result := new AnsiString(Value);
end;

class operator AnsiString.Implicit(const Value: AnsiString): String; 
begin
  Result := Value.ToString;
end;

function AnsiString.ToString(Provider: IFormatProvider): String; 
begin
  Result := FString.ToString(Provider);
end;

function AnsiString.ToString: String; 
begin
  Result := FString;
end;


end.
