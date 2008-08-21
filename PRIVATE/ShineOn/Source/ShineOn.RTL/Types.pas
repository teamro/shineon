// The contents of this file are subject to the Mozilla Public License Version 1.1 (the "License"); 
// you may not use this file except in compliance with the License. You may obtain a copy of the 
// License at http://www.mozilla.org/MPL/ 
// 
// Software distributed under the License is distributed on an "AS IS" basis, WITHOUT WARRANTY OF 
// ANY KIND, either express or implied. See the License for the specificlanguage governing rights and 
// limitations under the License.

namespace ShineOn.Rtl;

interface

uses
  System,
  System.Globalization,
  System.IO,
  System.Runtime.InteropServices, // for guid attribute and FILETIME
  System.Text;
  
type
{ TStream seek origins }
  TSeekOrigin = public (Beginning, Current, &End);

type  
  HRESULT = public LongInt;

  TGUID = public System.Guid;
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
  
  TCLSID = public TGUID;

  Largeint = public Int64;
  
  LCID = public Word;
  LANGID = public Word;

  TFileTime = public FILETIME;

  IUnknown = public interface // there's no "root" interface type in .NET
  end;
    

  // Exceptions

  EOutOfMemory = public OutOfMemoryException;

  EInOutError = public IOException;
  EExternal = public SystemException;
  EExternalException = public SystemException;

  EIntError = public ArithmeticException;
  EDivByZero = public DivideByZeroException;
  ERangeError = public IndexOutOfRangeException ;
  EIntOverflow = public OverflowException;

  EMathError = public ArithmeticException;
  EInvalidOp = public InvalidOperationException;
  EZeroDivide = public DivideByZeroException;
  EOverflow = public OverflowException;
  EUnderflow = public OverflowException;

  EInvalidPointer = public AccessViolationException;

  EInvalidCast = public InvalidCastException;

  EConvertError = public FormatException;

  EAccessViolation = public AccessViolationException;
  EStackOverflow = public StackOverflowException;
  

type

{ Text alignment types }
  TAlignment = public (LeftJustify, RightJustify, Center);
  TLeftRight = public (taLeftJustify,taRightJustify); //!!! Not compatible with global taLeftJustify/taRightJustify
  TBiDiMode = public (LeftToRight, RightToLeft, RightToLeftNoAlign, RightToLeftReadingOnly);
  TShiftState = public set of (Shift, Alt, Ctrl, Left, Right, Middle, Double);
  THelpType = public (Keyword, Context);
  
  
{ Types used by standard events }
type

{ Standard events }

  TNotifyEvent = public procedure(Sender: Object) of object;
  TGetStrProc = public procedure(S: String) of object;

{ Exception classes }

  (*
  EFCreateError = public class(EStreamError);
  EFOpenError = public class(EStreamError);
  EClassNotFound = public class(EFilerError);
  EMethodNotFound = public class(EFilerError);
  EInvalidImage = public class(EFilerError);
  EResNotFound = public class(Exception);
  EBitsError = public class(Exception);
  EStringListError = public class(Exception);
  EComponentError = public class(Exception);
  EParserError = public class(Exception);
  EOutOfResources = public class(EOutOfMemory);*)
  EStreamError = public class(Exception);
  EFilerError = public class(EStreamError);
  EReadError = public class(EFilerError);
  EWriteError = public class(EFilerError);
  EListError = public class(Exception);
  EInvalidOperation = public InvalidOperationException;

{ Duplicate management }

  TDuplicates = public (Ignore, Accept, Error);
  

type
{ TList class }

  TTextLineBreakStyle = public (LF, CRLF);
  
type  
  THandle = public IntPtr;
  Currency = public Decimal;     
  
{ TDateTime Class }
  
type
  TDate = TDateTime;
  TTime = TDateTime;

  
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

type
  DelphiString = public class
  private
    FString: String;

    method GetChar(Index: Integer): Char;
    method SetChar(Index: Integer; Value: Char);
    method GetLength(): Integer;
  protected
    method GetEncoding(): Encoding; virtual;
  public
    constructor(const S: String);
    constructor(const S: DelphiString);

    method ToString(): String; override;

    class operator &Add(const Left, Right: DelphiString): DelphiString;
    class operator Equal(const Left, Right: DelphiString): Boolean;
    class operator NotEqual(const Left, Right: DelphiString): Boolean;
    class operator Less(const Left, Right: DelphiString): Boolean;
    class operator LessOrEqual(const Left, Right: DelphiString): Boolean;
    class operator Greater(const Left, Right: DelphiString): Boolean;
    class operator GreaterOrEqual(const Left, Right: DelphiString): Boolean;

    class operator Implicit(const Value: String): DelphiString;
    class operator Implicit(const Value: DelphiString): String;

    property Chars[Index: Integer]: Char read GetChar write SetChar; default;
    property Encoding: System.Text.Encoding read GetEncoding;
    property Length: Integer read GetLength;
  end;

  AnsiString = public sealed class(DelphiString)
  protected
    method GetEncoding(): Encoding; override;
  public
    class operator Implicit(const Value: String): AnsiString;
  end;

  WideString = public sealed class(DelphiString)
  protected
    method GetEncoding(): Encoding; override;
  public
    class operator Implicit(const Value: String): WideString;
  end;

function EqualRect(const R1, R2: TRect): Boolean;
function Rect(Left, Top, Right, Bottom: Integer): TRect;
function Bounds(ALeft, ATop, AWidth, AHeight: Integer): TRect;
function Point(X, Y: Integer): TPoint;
function SmallPoint(X, Y: Integer): TSmallPoint;
function SmallPoint(XY: LongWord): TSmallPoint;
function PtInRect(const Rect: TRect; const P: TPoint): Boolean;
function IntersectRect(out Rect: TRect; const R1, R2: TRect): Boolean;
function UnionRect(out Rect: TRect; const R1, R2: TRect): Boolean;
function IsRectEmpty(const Rect: TRect): Boolean;
function OffsetRect(var Rect: TRect; DX: Integer; DY: Integer): Boolean;
function CenterPoint(const Rect: TRect): TPoint;
  
implementation

function EqualRect(const R1, R2: TRect): Boolean;
begin
  Result := ((R1.Left = R2.Left) and (R1.Top = R2.Top) and (R1.Right = R2.Right) and (R1.Bottom = R2.Bottom));
end;

function Rect(Left, Top, Right, Bottom: Integer): TRect;
begin
  Result := new TRect(Left,Top,Right - Left,Bottom - Top);
end;

function Bounds(ALeft, ATop, AWidth, AHeight: Integer): TRect;
begin
  Result := new TRect(ALeft,ATop,AWidth,AHeight);
end;

function Point(X, Y: Integer): TPoint;
begin
  Result := new TPoint(X,Y);
end;

function SmallPoint(X, Y: Integer): TSmallPoint; 
begin
  Result := new TSmallPoint(X,Y);
end;

function SmallPoint(XY: LongWord): TSmallPoint;
begin
  Result := new TSmallPoint(XY);
end;

function PtInRect(const Rect: TRect; const P: TPoint): Boolean;
begin
  Result :=  ((P.X >= Rect.Left) and (P.X <= Rect.Right) and (P.Y >= Rect.Top) and (P.Y <= Rect.Bottom));
end;

function IntersectRect(out Rect: TRect; const R1, R2: TRect): Boolean;
begin
  Rect := R1;

  if R2.Left > R1.Left then Rect.X := R2.X;
  if R2.Top > R1.Top then Rect.Y := R2.Y;
  if R2.Right < R1.Right then Rect.Width := (R2.Right - R2.Left);
  if R2.Bottom < R1.Bottom then Rect.Height := (R2.Bottom - R2.Top);

  Result := not IsRectEmpty(Rect);

  if not Result then Rect := new TRect(0,0,0,0);
end;

function UnionRect(out Rect: TRect; const R1, R2: TRect): Boolean;
begin
  Rect := R1;

  if not IsRectEmpty(R2) then
    begin
      if R2.Left < R1.Left then Rect.X := R2.X;
      if R2.Top < R1.Top then Rect.Y := R2.Y;
      if R2.Right > R1.Right then Rect.Width := (R2.Right - R2.Left);
      if R2.Bottom > R1.Bottom then Rect.Height := (R2.Bottom - R2.Top);
    end;

  Result := not IsRectEmpty(Rect);

  if not Result then Rect := new TRect(0,0,0,0);
end;

function IsRectEmpty(const Rect: TRect): Boolean;
begin
  Result := (Rect.Right <= Rect.Left) or (Rect.Bottom <= Rect.Top);
end;

function OffsetRect(var Rect: TRect; DX: Integer; DY: Integer): Boolean;
begin
  if Rect <> nil then
    begin
      Rect.X := Rect.X + DX;
      Rect.Width := Rect.Right + DX;
      Rect.Y := Rect.Y + DY;
      Rect.Height := Rect.Bottom + DY;

      Result := True;
    end
  else
    Result := False;
end;

function CenterPoint(const Rect: TRect): TPoint;
begin
  with Rect do
    begin
      Result.X := (Right - Left) div 2 + Left;
      Result.Y := (Bottom - Top) div 2 + Top;
    end;
end;

{}

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
  Offset, DIM: Word;
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
  Offset, DIM: Word;
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
  Result := ShineOn.Rtl.SystemUnit.Trunc(AValue);
end;

class function TDateTime.Frac(const AValue: TDateTime): Double;
begin
  Result := ShineOn.Rtl.SystemUnit.Frac(AValue);
end;

class function TDateTime.Round(const AValue: TDateTime): Int64;
begin
  Result := ShineOn.Rtl.SystemUnit.Round(AValue);
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


{ DelphiString }

constructor DelphiString(const S: String);
begin
  inherited constructor;

  FString := S;
end;

constructor DelphiString(const S: DelphiString);
begin
  inherited constructor;

  FString := S.ToString();
end;

method DelphiString.ToString(): String;
begin
  Result := FString;
end;

method DelphiString.GetEncoding(): Encoding;
begin
  Result := System.Text.Encoding.Default;
end;

method DelphiString.GetChar(Index: Integer): Char;
require
  Index > 0;
begin
  Result := FString[Index - 1];
end;

method DelphiString.SetChar(Index: Int32; Value: Char);
require
  Index > 0;
begin
  FString := FString.Remove(Index - 1,1);
  FString := FString.Insert(Index - 1,Value);
end;

method DelphiString.GetLength(): Integer;
begin
  Result := FString.Length - 1;
end;

class operator DelphiString.&Add(const Left, Right: DelphiString): DelphiString;
begin
  Result := new DelphiString(Left.ToString() + Right.ToString());
end;

class operator DelphiString.Equal(const Left, Right: DelphiString): Boolean;
begin
  Result := (String.Compare(Left.ToString(),Right.ToString()) = 0);
end;

class operator DelphiString.NotEqual(const Left, Right: DelphiString): Boolean;
begin
  Result := not (String.Compare(Left.ToString(),Right.ToString()) = 0);
end;

class operator DelphiString.Less(const Left, Right: DelphiString): Boolean;
begin
  Result := (String.Compare(Left.ToString(),Right.ToString()) < 0);
end;

class operator DelphiString.LessOrEqual(const Left, Right: DelphiString): Boolean;
begin
  Result := ((String.Compare(Left.ToString(),Right.ToString()) < 0) and (String.Compare(Left.ToString(),Right.ToString()) = 0));
end;

class operator DelphiString.Greater(const Left, Right: DelphiString): Boolean;
begin
  Result := (String.Compare(Left.ToString(),Right.ToString()) > 0);
end;

class operator DelphiString.GreaterOrEqual(const Left, Right: DelphiString): Boolean;
begin
  Result := ((String.Compare(Left.ToString(),Right.ToString()) < 0) and (String.Compare(Left.ToString(),Right.ToString()) = 0));
end;

class operator DelphiString.Implicit(const Value: String): DelphiString;
begin
  Result := new DelphiString(Value);
end;

// TODO: should we really allow implicit conversion from AnsiString to String? 
// What happens when users call RTL String routines (i.e Pos) with AnsiString parameters?
class operator DelphiString.Implicit(const Value: DelphiString): String;
begin
  Result := Value.ToString();
end;

{ AnsiString }

class operator AnsiString.Implicit(const Value: String): AnsiString;
begin
  Result := new AnsiString(Value);
end;

method AnsiString.GetEncoding(): Encoding;
begin
  Result := System.Text.Encoding.Default;
end;

{ WideString }

class operator WideString.Implicit(const Value: String): WideString;
begin
  Result := new WideString(Value);
end;

method WideString.GetEncoding: Encoding;
begin
  Result := System.Text.Encoding.Unicode;
end;


end.


