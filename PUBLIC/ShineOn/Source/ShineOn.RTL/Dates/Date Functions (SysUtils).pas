namespace ShineOn.Rtl;

{ *********************************************************************** }
{                                                                         }
{ Based on the Delphi Visual Component Library                            }
{                                                                         }
{ Copyright (c) CodeGear and RemObjects Software                          }
{                                                                         }
{ *********************************************************************** }

interface 

uses
  System.Globalization,
  System.Text;

{*******************************************************}
{       SysUtils Date/Time Support Section              }
{*******************************************************}

const

/// Units of time and DateDelta have been moved to Borland.Delphi.System

{ Days between TDateTime basis (12/31/1899) and Unix time_t basis (1/1/1970) }
  UnixDateDelta = 25569;

type

{ Date and time record }

  TTimeStamp = public record
    Time: Integer;      { Number of milliseconds since midnight }
    Date: Integer;      { One plus number of days since 1/1/0001 }
  end;

{ Date/time support routines }

method DateTimeToTimeStamp(ADateTime: TDateTime): TTimeStamp; public;

method TimeStampToDateTime(const ATimeStamp: TTimeStamp): TDateTime; public;

{! MSecsToTimeStamp/TimeStampToMSecs used to use Comp as their working type,
  they now use Int64. }

method MSecsToTimeStamp(MSecs: Int64): TTimeStamp; public;
method TimeStampToMSecs(const ATimeStamp: TTimeStamp): Int64; public;

{ EncodeDate encodes the given year, month, and day into a TDateTime value.
  The year must be between 1 and 9999, the month must be between 1 and 12,
  and the day must be between 1 and N, where N is the number of days in the
  specified month. If the specified values are not within range, an
  EConvertError exception is raised. The resulting value is the number of
  days between 12/30/1899 and the given date. }

method EncodeDate(Year, Month, Day: Word): TDateTime; public;

{ EncodeTime encodes the given hour, minute, second, and millisecond into a
  TDateTime value. The hour must be between 0 and 23, the minute must be
  between 0 and 59, the second must be between 0 and 59, and the millisecond
  must be between 0 and 999. If the specified values are not within range, an
  EConvertError exception is raised. The resulting value is a number between
  0 (inclusive) and 1 (not inclusive) that indicates the fractional part of
  a day given by the specified time. The value 0 corresponds to midnight,
  0.5 corresponds to noon, 0.75 corresponds to 6:00 pm, etc. }

method EncodeTime(Hour, Min, Sec, MSec: Word): TDateTime; public;

{ Instead of generating errors the following variations of EncodeDate and
  EncodeTime simply return False if the parameters given are not valid.
  Other than that, these functions are functionally the same as the above
  functions. }

method TryEncodeDate(Year, Month, Day: Word; out aDate: TDateTime): Boolean; public;
method TryEncodeTime(Hour, Min, Sec, MSec: Word; out aTime: TDateTime): Boolean; public;

{ DecodeDate decodes the integral (date) part of the given TDateTime value
  into its corresponding year, month, and day. If the given TDateTime value
  is less than or equal to zero, the year, month, and day return parameters
  are all set to zero. }

method DecodeDate(const ADateTime: TDateTime; var Year, Month, Day: Word); public;

{ This variation of DecodeDate works similarly to the above function but
  returns more information.  The result value of this function indicates
  whether the year decoded is a leap year or not.  }

method DecodeDateFully(const ADateTime: TDateTime; var Year, Month, Day,
  DOW: Word): Boolean; public;

{ DecodeTime decodes the fractional (time) part of the given TDateTime value
  into its corresponding hour, minute, second, and millisecond. }

method DecodeTime(const ADateTime: TDateTime; var Hour, Min, Sec, MSec: Word); public;

{ DateTimeToSystemTime converts a date and time from Delphi's TDateTime
  format into the Win32 API's TSystemTime format. }

method DateTimeToSystemTime(const ADateTime: TDateTime; var SystemTime: TSystemTime); public;

{ SystemTimeToDateTime converts a date and time from the Win32 API's
  TSystemTime format into Delphi's TDateTime format. }

method SystemTimeToDateTime(const SystemTime: TSystemTime): TDateTime; public;

{ DayOfWeek returns the day of the week of the given date. The result is an
  integer between 1 and 7, corresponding to Sunday through Saturday.
  This function is not ISO 8601 compliant, for that see the DateUtils unit. }

//method DayOfWeek(const ADateTime: TDateTime): Word; 

{ Date returns the current date. }

method Date: TDateTime; public;

{ Time returns the current time. }

method Time: TDateTime; public;
method GetTime: TDateTime; public;

{ Now returns the current date and time, corresponding to Date + Time. }

method Now: TDateTime; public;

{ Current year returns the year portion of the date returned by Now }

method CurrentYear: Word; public;

{ IncMonth returns Date shifted by the specified number of months.
  NumberOfMonths parameter can be negative, to return a date N months ago.
  If the input day of month is greater than the last day of the resulting
  month, the day is set to the last day of the resulting month.
  Input time of day is copied to the DateTime result.  }

method IncMonth(const ADateTime: TDateTime; NumberOfMonths: Integer := 1): TDateTime; public;

{ Optimized version of IncMonth that works with years, months and days
  directly.  See above comments for more detail as to what happens to the day
  when incrementing months }

method IncAMonth(var Year, Month, Day: Word; NumberOfMonths: Integer := 1); public;

{ ReplaceTime replaces the time portion of the DateTime parameter with the given
  time value, adjusting the signs as needed if the date is prior to 1900
  (Date value less than zero)  }

method ReplaceTime(var ADateTime: TDateTime; const NewTime: TDateTime); public;

{ ReplaceDate replaces the date portion of the DateTime parameter with the given
  date value, adjusting as needed for negative dates }

method ReplaceDate(var ADateTime: TDateTime; const NewDate: TDateTime); public;

{ IsLeapYear determines whether the given year is a leap year. }

method IsLeapYear(Year: Word): Boolean; public;

type
  TDayTable = array[1..12] of Word;

{ The MonthDays array can be used to quickly find the number of
  days in a month:  MonthDays[IsLeapYear(Y), M]      }

const
  MonthDays: array [{Boolean}0..1] of TDayTable =
    [[31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31],
     [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]];

{ Each of the date/time formatting routines that uses global variables
  for formatting (separators, decimals, etc.), have 2 overloaded
  equivalents. One requires a parameter of type TFormatSettings, the
  other IFormatProvider. These additional parameters provides the
  formatting information rather than the global variables. }

{ DateToStr converts the date part of the given TDateTime value to a string.
  The conversion uses the format specified by the ShortDateFormat global
  variable. }

method DateToStr(const ADateTime: TDateTime): DelphiString; public;
method DateToStr(const ADateTime: TDateTime; const FormatSettings: TFormatSettings): DelphiString; public;
method DateToStr(const ADateTime: TDateTime; Provider: IFormatProvider): DelphiString; public;

{ TimeToStr converts the time part of the given TDateTime value to a string.
  The conversion uses the format specified by the LongTimeFormat global
  variable. }

method TimeToStr(const ADateTime: TDateTime): DelphiString; public;
method TimeToStr(const ADateTime: TDateTime; const FormatSettings: TFormatSettings): DelphiString; public;
method TimeToStr(const ADateTime: TDateTime; Provider: IFormatProvider): DelphiString; public;

{ DateTimeToStr converts the given date and time to a string. The resulting
  string consists of a date and time formatted using the ShortDateFormat and
  LongTimeFormat global variables. Time information is included in the
  resulting string only if the fractional part of the given date and time
  value is non-zero. }

method DateTimeToStr(const ADateTime: TDateTime): DelphiString; public; 
method DateTimeToStr(const ADateTime: TDateTime; const FormatSettings: TFormatSettings): DelphiString; public;
method DateTimeToStr(const ADateTime: TDateTime; Provider: IFormatProvider): DelphiString; public;

{ StrToDate converts the given string to a date value. The string must
  consist of two or three numbers, separated by the character defined by
  the DateSeparator global variable. The order for month, day, and year is
  determined by the ShortDateFormat global variable--possible combinations
  are m/d/y, d/m/y, and y/m/d. If the string contains only two numbers, it
  is interpreted as a date (m/d or d/m) in the current year. Year values
  between 0 and 99 are assumed to be in the current century. If the given
  string does not contain a valid date, an EConvertError exception is
  raised. }

method StrToDate(const S: DelphiString): TDateTime; public;
method StrToDate(const S: DelphiString; const FormatSettings: TFormatSettings): TDateTime; public;
method StrToDate(const S: DelphiString; Provider: IFormatProvider): TDateTime; public;

method StrToDateDef(const S: DelphiString; const Default: TDateTime): TDateTime; public;
method StrToDateDef(const S: DelphiString; const Default: TDateTime; 
  const FormatSettings: TFormatSettings): TDateTime; public;
method StrToDateDef(const S: DelphiString; const Default: TDateTime; 
  Provider: IFormatProvider): TDateTime;  public;

method TryStrToDate(const S: DelphiString; out Value: TDateTime): Boolean; public;
method TryStrToDate(const S: DelphiString; out Value: TDateTime; 
  const FormatSettings: TFormatSettings): Boolean; public;
method TryStrToDate(const S: DelphiString; out Value: TDateTime;
  Provider: IFormatProvider): Boolean; public;

{ StrToTime converts the given string to a time value. The string must
  consist of two or three numbers, separated by the character defined by
  the TimeSeparator global variable, optionally followed by an AM or PM
  indicator. The numbers represent hour, minute, and (optionally) second,
  in that order. If the time is followed by AM or PM, it is assumed to be
  in 12-hour clock format. If no AM or PM indicator is included, the time
  is assumed to be in 24-hour clock format. If the given string does not
  contain a valid time, an EConvertError exception is raised. }

method StrToTime(const S: DelphiString): TDateTime; public;
method StrToTime(const S: DelphiString; const FormatSettings: TFormatSettings): TDateTime; public;
method StrToTime(const S: DelphiString; Provider: IFormatProvider): TDateTime; public;

method StrToTimeDef(const S: DelphiString; const Default: TDateTime): TDateTime; public;
method StrToTimeDef(const S: DelphiString; const Default: TDateTime; 
  const FormatSettings: TFormatSettings): TDateTime; public;
method StrToTimeDef(const S: DelphiString; const Default: TDateTime; 
  Provider: IFormatProvider): TDateTime; public;

method TryStrToTime(const S: DelphiString; out Value: TDateTime): Boolean; public;
method TryStrToTime(const S: DelphiString; out Value: TDateTime;
  const FormatSettings: TFormatSettings): Boolean; public;
method TryStrToTime(const S: DelphiString; out Value: TDateTime;
  Provider: IFormatProvider): Boolean; public;

{ StrToDateTime converts the given string to a date and time value. The
  string must contain a date optionally followed by a time. The date and
  time parts of the string must follow the formats described for the
  StrToDate and StrToTime functions. }

method StrToDateTime(const S: DelphiString): TDateTime; public;
method StrToDateTime(const S: DelphiString; const FormatSettings: TFormatSettings): TDateTime; public;
method StrToDateTime(const S: DelphiString; Provider: IFormatProvider): TDateTime; public;

method StrToDateTimeDef(const S: DelphiString; const Default: TDateTime): TDateTime; public;
method StrToDateTimeDef(const S: DelphiString; const Default: TDateTime;
  const FormatSettings: TFormatSettings): TDateTime; public;
method StrToDateTimeDef(const S: DelphiString; const Default: TDateTime;
  Provider: IFormatProvider): TDateTime; public;

method TryStrToDateTime(const S: DelphiString; out Value: TDateTime): Boolean; public;
method TryStrToDateTime(const S: DelphiString; out Value: TDateTime;
  const FormatSettings: TFormatSettings): Boolean; public;
method TryStrToDateTime(const S: DelphiString; out Value: TDateTime;
  Provider: IFormatProvider): Boolean; public;

{ FormatDateTime formats the date-and-time value given by DateTime using the
  format given by Format. The following format specifiers are supported:

  c       Displays the date using the format given by the ShortDateFormat
          global variable, followed by the time using the format given by
          the LongTimeFormat global variable. The time is not displayed if
          the fractional part of the DateTime value is zero.

  d       Displays the day as a number without a leading zero (1-31).

  dd      Displays the day as a number with a leading zero (01-31).

  ddd     Displays the day as an abbreviation (Sun-Sat) using the strings
          given by the ShortDayNames global variable.

  dddd    Displays the day as a full name (Sunday-Saturday) using the strings
          given by the LongDayNames global variable.

  ddddd   Displays the date using the format given by the ShortDateFormat
          global variable.

  dddddd  Displays the date using the format given by the LongDateFormat
          global variable.

  g       Displays the period/era as an abbreviation (Japanese and
          Taiwanese locales only). -- uses gg instead in clr

  gg      Displays the period/era as a full name.

  e       Displays the year in the current period/era as a number without
          a leading zero (Japanese, Korean and Taiwanese locales only).
          -- uses gg instead in clr

  ee      Displays the year in the current period/era as a number with
          a leading zero (Japanese, Korean and Taiwanese locales only).
          -- uses gg instead in clr

  m       Displays the month as a number without a leading zero (1-12). If
          the m specifier immediately follows an h or hh specifier, the
          minute rather than the month is displayed.

  mm      Displays the month as a number with a leading zero (01-12). If
          the mm specifier immediately follows an h or hh specifier, the
          minute rather than the month is displayed.

  mmm     Displays the month as an abbreviation (Jan-dec) using the strings
          given by the ShortMonthNames global variable.

  mmmm    Displays the month as a full name (January-December) using the
          strings given by the LongMonthNames global variable.

  yy      Displays the year as a two-digit number (00-99).

  yyyy    Displays the year as a four-digit number (0000-9999).

  h       Displays the hour without a leading zero (0-23).

  hh      Displays the hour with a leading zero (00-23).

  n       Displays the minute without a leading zero (0-59).

  nn      Displays the minute with a leading zero (00-59).

  s       Displays the second without a leading zero (0-59).

  ss      Displays the second with a leading zero (00-59).

  z       Displays the millisecond without a leading zero (0-999). not supported
          in clr -- uses zzz instead.

  zzz     Displays the millisecond with a leading zero (000-999).

  t       Displays the time using the format given by the ShortTimeFormat
          global variable.

  tt      Displays the time using the format given by the LongTimeFormat
          global variable.

  am/pm   Uses the 12-hour clock for the preceding h or hh specifier, and
          displays 'am' for any hour before noon, and 'pm' for any hour
          after noon. Not supported in clr, uses ampm instead.

  a/p     Uses the 12-hour clock for the preceding h or hh specifier, and
          displays 'a' for any hour before noon, and 'p' for any hour after
          noon. Except on CLR, The a/p specifier can use lower, upper,
          or mixed case, and the result is displayed accordingly.

  ampm    Uses the 12-hour clock for the preceding h or hh specifier, and
          displays the contents of the TimeAMString global variable for any
          hour before noon, and the contents of the TimePMString global
          variable for any hour after noon.

  /       Displays the date separator character given by the DateSeparator
          global variable.

  :       Displays the time separator character given by the TimeSeparator
          global variable.

  'xx'    Characters enclosed in single or double quotes are displayed as-is,
  "xx"    and do not affect formatting.

  Format specifiers may be written in upper case as well as in lower case
  letters--both produce the same result.

  If the string given by the Format parameter is empty, the date and time
  value is formatted as if a 'c' format specifier had been given.

  The following example:

    S := FormatDateTime('"The meeting is on" dddd, mmmm d, yyyy, ' +
      '"at" hh:mm AM/PM', StrToDateTime('2/15/95 10:30am'));

  assigns 'The meeting is on Wednesday, February 15, 1995 at 10:30 AM' to
  the string variable S. }

method FormatDateTime(const aFormat: DelphiString; ADateTime: TDateTime): DelphiString; public; 
method FormatDateTime(const aFormat: DelphiString; ADateTime: TDateTime;
  const FormatSettings: TFormatSettings): DelphiString; public;
method FormatDateTime(const aFormat: DelphiString; ADateTime: TDateTime;
  Provider: IFormatProvider): DelphiString; public;

{ DateTimeToString converts the date and time value given by DateTime using
  the format string given by Format into the string variable given by Result.
  For further details, see the description of the FormatDateTime function. }

method DateTimeToString(var &&Result: DelphiString; const aFormat: DelphiString;
  ADateTime: TDateTime); public;
method DateTimeToString(var &&Result: DelphiString; const aFormat: DelphiString;
  ADateTime: TDateTime; const FormatSettings: TFormatSettings); public;
method DateTimeToString(var &&Result: DelphiString; const aFormat: DelphiString;
  ADateTime: TDateTime; Provider: IFormatProvider); public;

{ ConvertDelphiDateTimeFormat and ConvertClrDateTimeFormat convert between
 our date time format strings and the ones used by System.DateTime. This
 comes close, but there are some cases where the mapping must be approximate.
  For Delphi formats, this means
    * am/pm maps to ampm (that is, must use system setting)
    * a/p is based on current settings, not hardcoded to 'a' or 'p'
    * no control over case in the am/pm or a/p strings
    * no options for how to represent era, they all map to gg
    * no support for z -- it maps to fractional seconds with 3 decimals (zzz)

  For CLR formats, this means
    * no support for single-digit years, they map to 2 digit years.
    * no support for 12-hour clock when there is no am/pm symbol, 24-hour is used.
    * no support for fractional seconds, they map to milliseconds (zzz)
    * no support for time zone offsets
 }
method ConvertDelphiDateTimeFormat(const aFormat: DelphiString): DelphiString; public;
method ConvertClrDateTimeFormat(const aFormat: DelphiString): DelphiString; public;

{ FloatToDateTime will range validate a value to make sure it falls
  within the acceptable date range }

method MinDateTime: TDateTime; public;  { 01/01/0100 12:00:00.000 AM }
method MaxDateTime: TDateTime; public; { 12/31/9999 11:59:59.999 PM }

method FloatToDateTime(const Value: Extended): TDateTime; public;
method TryFloatToDateTime(const Value: Extended; out AResult: TDateTime): Boolean; public;


implementation

method ConvertError(const ResString: DelphiString);
begin
  raise EConvertError.Create(ResString); // ..CreateRes(ResString);
end;

method ConvertErrorFmt(const ResString: DelphiString; const Args: array of Object {const});
begin
  raise EConvertError.Create(Format(ResString, Args)); // ..CreateResFmt(ResString, Args);
end;

{*******************************************************}
{       SysUtils Date/Time Support Section              }
{*******************************************************}

{ Date/time support routines }

const
  FMSecsPerDay: Single = MSecsPerDay;
  IMSecsPerDay: Integer = MSecsPerDay;

method DateTimeToTimeStamp(ADateTime: TDateTime): TTimeStamp;
begin
  Result.Date := Trunc(ADateTime) + DateDelta;
  Result.Time := System.Convert.ToInt32(Double(ADateTime.Time) * MSecsPerDay);
  if Result.Time < 0 then
    Result.Time := -Result.Time;
end;

method ValidateTimeStamp(const ATimeStamp: TTimeStamp);
begin
  if (ATimeStamp.Time < 0) or (ATimeStamp.Date <= 0) then
    ConvertErrorFmt(SInvalidTimeStamp, [ATimeStamp.Date, ATimeStamp.Time]);
end;

method TimeStampToDateTime(const ATimeStamp: TTimeStamp): TDateTime;
begin
  ValidateTimeStamp(ATimeStamp);
  Result := ATimeStamp.Date - DateDelta;
  if Result < 0 then
    Result := Result - (ATimeStamp.Time / MSecsPerDay)
  else
    Result := Result + (ATimeStamp.Time / MSecsPerDay);
end;

method MSecsToTimeStamp(MSecs: Int64): TTimeStamp;
begin
  Result.Date := MSecs div MSecsPerDay;
  Result.Time := MSecs mod MSecsPerDay;
end;

method TimeStampToMSecs(const ATimeStamp: TTimeStamp): Int64;
begin
  ValidateTimeStamp(ATimeStamp);
  Result := Int64(ATimeStamp.Date) * MSecsPerDay + ATimeStamp.Time;
end;

{ Time encoding and decoding }

method TryEncodeTime(Hour, Min, Sec, MSec: Word; out aTime: TDateTime): Boolean;
begin
  Result := TDateTime.TryEncodeTime(Hour, Min, Sec, MSec, aTime);
end;

method EncodeTime(Hour, Min, Sec, MSec: Word): TDateTime;
begin
  Result := TDateTime.EncodeTime(Hour, Min, Sec, MSec);
end;

method DecodeTime(const ADateTime: TDateTime; var Hour, Min, Sec, MSec: Word);
begin
  TDateTime.DecodeTime(ADateTime, Hour, Min, Sec, MSec);
end;

{ Date encoding and decoding }

method IsLeapYear(Year: Word): Boolean; 
begin
  Result := TDateTime.IsLeapYear(Year);
end;

method TryEncodeDate(Year, Month, Day: Word; out aDate: TDateTime): Boolean;
begin
  Result := TDateTime.TryEncodeDate(Year, Month, Day, aDate);
end;

method EncodeDate(Year, Month, Day: Word): TDateTime;
begin
  Result := TDateTime.EncodeDate(Year, Month, Day);
end;

method DecodeDateFully(const ADateTime: TDateTime; var Year, Month, Day, DOW: Word): Boolean;
begin
  Result := TDateTime.DecodeDate(ADateTime, Year, Month, Day, DOW);
end;

method DecodeDate(const ADateTime: TDateTime; var Year, Month, Day: Word);
begin
  TDateTime.DecodeDate(ADateTime, Year, Month, Day);
end;

method DateTimeToSystemTime(const ADateTime: TDateTime; var SystemTime: TSystemTime);
begin
  with SystemTime do
  begin
    DecodeDateFully(ADateTime, wYear, wMonth, wDay, wDayOfWeek);
    dec(wDayOfWeek);
    DecodeTime(ADateTime, wHour, wMinute, wSecond, wMilliseconds);
  end;
end;

method SystemTimeToDateTime(const SystemTime: TSystemTime): TDateTime;
begin
  with SystemTime do
  begin
    Result := EncodeDate(wYear, wMonth, wDay);
    if Result >= 0 then
      Result := Result + EncodeTime(wHour, wMinute, wSecond, wMilliseconds)
    else
      Result := Result - EncodeTime(wHour, wMinute, wSecond, wMilliseconds);
  end;
end;
(*
method DayOfWeek(const ADateTime: TDateTime): Word; 
begin
  Result := ADateTime.DayOfWeek;
end;
*)
method Date: TDateTime; 
begin
  Result := TDateTime.TheDate;
end;

method Time: TDateTime; 
begin
  Result := TDateTime.TheTime;
end;

method GetTime: TDateTime;
begin
  Result := Time;
end;

method Now: TDateTime; 
begin
  Result := TDateTime.Now;
end;

method IncMonth(const ADateTime: TDateTime; NumberOfMonths: Integer): TDateTime; 
begin
  Result := ADateTime.AddMonth(NumberOfMonths);
end;

method IncAMonth(var Year, Month, Day: Word; NumberOfMonths: Integer);
begin
  DecodeDate(EncodeDate(Year, Month, Day).AddMonth(NumberOfMonths), Year, Month, Day);
end;

method ReplaceTime(var ADateTime: TDateTime; const NewTime: TDateTime); 
begin
  ADateTime := ADateTime.ReplaceTime(NewTime);
end;

method ReplaceDate(var ADateTime: TDateTime; const NewDate: TDateTime); 
begin
  ADateTime := ADateTime.ReplaceDate(NewDate);
end;

method CurrentYear: Word; 
begin
  Result := TDateTime.TheYear;
end;

method DateToStr(const ADateTime: TDateTime): DelphiString; 
begin
  DateTimeToString(Result, ShortDateFormat, ADateTime);
end;

method DateToStr(const ADateTime: TDateTime; const FormatSettings: TFormatSettings): DelphiString; 
begin
  DateTimeToString(Result, ShortDateFormat, ADateTime, FormatSettings);
end;

method DateToStr(const ADateTime: TDateTime; Provider: IFormatProvider): DelphiString;
var
  FormatStr: DelphiString;
  LFormat: DateTimeFormatInfo;
begin
  if assigned(Provider) then
    LFormat := DateTimeFormatInfo(Provider.GetFormat(typeOf(DateTimeFormatInfo)));
  if assigned(LFormat) then
    FormatStr := ConvertClrDateTimeFormat(LFormat.ShortDatePattern)
  else
    FormatStr := ShortDateFormat;
  DateTimeToString(Result, FormatStr, ADateTime, Provider);
end;

method TimeToStr(const ADateTime: TDateTime): DelphiString; 
begin
  DateTimeToString(Result, LongTimeFormat, ADateTime);
end;

method TimeToStr(const ADateTime: TDateTime; const FormatSettings: TFormatSettings): DelphiString; 
begin
  DateTimeToString(Result, LongTimeFormat, ADateTime, FormatSettings);
end;

method TimeToStr(const ADateTime: TDateTime; Provider: IFormatProvider): DelphiString;
var
  FormatStr: DelphiString;
  LFormat: DateTimeFormatInfo;
begin
  if assigned(Provider) then
    LFormat := DateTimeFormatInfo(Provider.GetFormat(typeOf(DateTimeFormatInfo)));
  if assigned(LFormat) then
    FormatStr := ConvertClrDateTimeFormat(LFormat.LongTimePattern)
  else
    FormatStr := LongTimeFormat;
  DateTimeToString(Result, FormatStr, ADateTime, Provider);
end;

method DateTimeToStr(const ADateTime: TDateTime): DelphiString;
begin
  if ADateTime.Time = 0 then
    DateTimeToString(Result, ShortDateFormat, ADateTime)
  else
    DateTimeToString(Result, '', ADateTime);
end;

method DateTimeToStr(const ADateTime: TDateTime; const FormatSettings: TFormatSettings): DelphiString;
begin
  if ADateTime.Time = 0 then
    DateTimeToString(Result, FormatSettings.ShortDateFormat, ADateTime, FormatSettings)
  else
    DateTimeToString(Result, '', ADateTime, FormatSettings);
end;

method DateTimeToStr(const ADateTime: TDateTime; Provider: IFormatProvider): DelphiString;
var
  LFormat: DateTimeFormatInfo;
begin
  LFormat := nil;
  if ADateTime.Time = 0 then
  begin
    if assigned(Provider) then
      LFormat := DateTimeFormatInfo(Provider.GetFormat(typeOf(DateTimeFormatInfo)));
    if assigned(LFormat) then
      DateTimeToString(Result, ConvertClrDateTimeFormat(LFormat.ShortDatePattern), ADateTime, Provider)
    else
      DateTimeToString(Result, ShortDateFormat, ADateTime, Provider);
  end
  else
    DateTimeToString(Result, '', ADateTime, Provider);
end;

method FormatDateTime(const aFormat: DelphiString; ADateTime: TDateTime): DelphiString; 
begin
  DateTimeToString(Result, aFormat, ADateTime);
end;

method FormatDateTime(const aFormat: DelphiString; ADateTime: TDateTime;
  const FormatSettings: TFormatSettings): DelphiString;
begin
  DateTimeToString(Result, aFormat, ADateTime, FormatSettings);
end;

method FormatDateTime(const aFormat: DelphiString; ADateTime: TDateTime;
  Provider: IFormatProvider): DelphiString;
begin
  DateTimeToString(Result, aFormat, ADateTime, Provider);
end;

method ScanBlanks(const S: DelphiString; var aPos: Integer);
var
  I: Integer;
begin
  I := aPos;
  while (I <= length(S)) and (S[I] = ' ') do inc(I);
  aPos := I;
end;

method ScanNumber(const S: DelphiString; var lPos: Integer;
  var Number: Word; var CharCount: Byte): Boolean;
var
  I: Integer;
  N: Word;
begin
  Result := False;
  CharCount := 0;
  ScanBlanks(S, lPos);
  I := lPos;
  N := 0;
  while (I <= length(S)) and System.Char.IsDigit(S[I]) and (N < 1000) do
  begin
    N := N * 10 + (ord(S[I]) - ord('0'));
    inc(I);
  end;
  if I > lPos then
  begin
    CharCount := I - lPos;
    lPos := I;
    Number := N;
    Result := True;
  end;
end;

method ScanString(const S: DelphiString; var lPos: Integer;
  const Symbol: DelphiString): Boolean;
begin
  Result := False;
  if Symbol <> '' then
  begin
    ScanBlanks(S, lPos);
    if AnsiCompareText(Symbol, Copy(S, lPos, length(Symbol))) = 0 then
    begin
      inc(lPos, length(Symbol));
      Result := True;
    end;
  end;
end;

type
  TDateOrder = (doMDY, doDMY, doYMD);

method GetDateOrder(const DateFormat: DelphiString): TDateOrder;
var
  I: Integer;
begin
  Result := TDateOrder.doMDY;
  I := 1;
  while I <= length(DateFormat) do
  begin
    case chr(ord(DateFormat[I]) and $DF) of
      'E': Result := TDateOrder.doYMD;
      'Y': Result := TDateOrder.doYMD;
      'M': Result := TDateOrder.doMDY;
      'D': Result := TDateOrder.doDMY;
    else begin begin
      inc(I);
      Continue;
    end; end; end;
    Exit;
  end;
end;

method ScanDate(const S: DelphiString; var lPos: Integer;
  var aDate: TDateTime): Boolean; 
var
  DateOrder: TDateOrder;
  N1, N2, N3, Y, M, D: Word;
  L1, L2, L3, YearLen: Byte;
  CenturyBase: Integer;
begin
  Y := 0;
  M := 0;
  D := 0;
  YearLen := 0;
  Result := False;
  DateOrder := GetDateOrder(ShortDateFormat);

  {TODO: On Windows, this functions sets EraYearOffset here. EraYearOffset
   is 0 unless ShortDateFormat starts with g or gg, or includes e or ee.
   If nonzero, it is set by reading the era name and converting.
   This is left for international.
   A list of eras for the current culture is available from
   System.Globalization.CultureInfo.CurrentCulture.Calendar.Eras. The mapping
   to a name can be retrieved from
   System.Globalization.CultureInfo.CurrentCulture.DateTimeFormat.GetEraName
   (or GetAbbreviatedEraName).  }

  if not (ScanNumber(S, lPos, N1, L1) and ScanString(S, lPos, DateSeparator) and
    ScanNumber(S, lPos, N2, L2)) then Exit;
  if ScanString(S, lPos, DateSeparator) then
  begin
    if not ScanNumber(S, lPos, N3, L3) then Exit;
    case DateOrder of
      TDateOrder.doMDY: begin Y := N3; YearLen := L3; M := N1; D := N2; end;
      TDateOrder.doDMY: begin Y := N3; YearLen := L3; M := N2; D := N1; end;
      TDateOrder.doYMD: begin Y := N1; YearLen := L1; M := N2; D := N3; end;
    end;
    { TODO: If there is Era support, the Era year offset is added to Y here }
    if (YearLen <= 2) then
    begin
      CenturyBase := CurrentYear - TwoDigitYearCenturyWindow;
      inc(Y, CenturyBase div 100 * 100);
      if (TwoDigitYearCenturyWindow > 0) and (Y < CenturyBase) then
        inc(Y, 100);
    end;
  end else
  begin
    Y := CurrentYear;
    if DateOrder = TDateOrder.doDMY then
    begin
      D := N1; M := N2;
    end else
    begin
      M := N1; D := N2;
    end;
  end;
  ScanString(S, lPos, DateSeparator);
  ScanBlanks(S, lPos);
  {TODO: In far east locales, the Windows product checks for 'ddd' in
   the short date format, and if found, scans forward to the time }
  Result := TryEncodeDate(Y, M, D, aDate);
end;

method ScanDate(const S: DelphiString; var lPos: Integer;
  var aDate: TDateTime; const FormatSettings: TFormatSettings): Boolean; 
var
  DateOrder: TDateOrder;
  N1, N2, N3, Y, M, D: Word;
  L1, L2, L3, YearLen: Byte;
  CenturyBase: Integer;
begin
  Y := 0;
  M := 0;
  D := 0;
  YearLen := 0;
  Result := False;
  DateOrder := GetDateOrder(FormatSettings.ShortDateFormat);

  {TODO: On Windows, this functions sets EraYearOffset here. EraYearOffset
   is 0 unless ShortDateFormat starts with g or gg, or includes e or ee.
   If nonzero, it is set by reading the era name and converting.
   This is left for international.
   A list of eras for the current culture is available from
   System.Globalization.CultureInfo.CurrentCulture.Calendar.Eras. The mapping
   to a name can be retrieved from
   System.Globalization.CultureInfo.CurrentCulture.DateTimeFormat.GetEraName
   (or GetAbbreviatedEraName).  }

  if not (ScanNumber(S, lPos, N1, L1) and ScanString(S, lPos, FormatSettings.DateSeparator) and
    ScanNumber(S, lPos, N2, L2)) then Exit;
  if ScanString(S, lPos, FormatSettings.DateSeparator) then
  begin
    if not ScanNumber(S, lPos, N3, L3) then Exit;
    case DateOrder of
      TDateOrder.doMDY: begin Y := N3; YearLen := L3; M := N1; D := N2; end;
      TDateOrder.doDMY: begin Y := N3; YearLen := L3; M := N2; D := N1; end;
      TDateOrder.doYMD: begin Y := N1; YearLen := L1; M := N2; D := N3; end;
    end;
    { TODO: If there is Era support, the Era year offset is added to Y here }
    if (YearLen <= 2) then
    begin
      CenturyBase := CurrentYear - FormatSettings.TwoDigitYearCenturyWindow;
      inc(Y, CenturyBase div 100 * 100);
      if (FormatSettings.TwoDigitYearCenturyWindow > 0) and (Y < CenturyBase) then
        inc(Y, 100);
    end;
  end else
  begin
    Y := CurrentYear;
    if DateOrder = TDateOrder.doDMY then
    begin
      D := N1; M := N2;
    end else
    begin
      M := N1; D := N2;
    end;
  end;
  ScanString(S, lPos, FormatSettings.DateSeparator);
  ScanBlanks(S, lPos);
  {TODO: In far east locales, the Windows product checks for 'ddd' in
   the short date format, and if found, scans forward to the time }
  Result := TryEncodeDate(Y, M, D, aDate);
end;

method ScanTime(const S: DelphiString; var lPos: Integer;
  var aTime: TDateTime): Boolean; 
var
  BaseHour: Integer;
  Hour, Min, Sec, MSec: Word;
  Junk: Byte;
begin
  Result := False;
  BaseHour := -1;
  if ScanString(S, lPos, TimeAMString) or ScanString(S, lPos, 'AM') then
    BaseHour := 0
  else if ScanString(S, lPos, TimePMString) or ScanString(S, lPos, 'PM') then
    BaseHour := 12;
  if BaseHour >= 0 then ScanBlanks(S, lPos);
  if not ScanNumber(S, lPos, Hour, Junk) then Exit;
  Min := 0;
  Sec := 0;
  MSec := 0;
  if ScanString(S, lPos, TimeSeparator) then
  begin
    if not ScanNumber(S, lPos, Min, Junk) then Exit;
    if ScanString(S, lPos, TimeSeparator) then
    begin
      if not ScanNumber(S, lPos, Sec, Junk) then Exit;
      if ScanString(S, lPos, DecimalSeparator) then
        if not ScanNumber(S, lPos, MSec, Junk) then Exit;
    end;
  end;
  if BaseHour < 0 then
    if ScanString(S, lPos, TimeAMString) or ScanString(S, lPos, 'AM') then
      BaseHour := 0
    else
      if ScanString(S, lPos, TimePMString) or ScanString(S, lPos, 'PM') then
        BaseHour := 12;
  if BaseHour >= 0 then
  begin
    if (Hour = 0) or (Hour > 12) then Exit;
    if Hour = 12 then Hour := 0;
    inc(Hour, BaseHour);
  end;
  ScanBlanks(S, lPos);
  Result := TryEncodeTime(Hour, Min, Sec, MSec, aTime);
end;

method ScanTime(const S: DelphiString; var lPos: Integer;
  var aTime: TDateTime; const FormatSettings: TFormatSettings): Boolean; 
var
  BaseHour: Integer;
  Hour, Min, Sec, MSec: Word;
  Junk: Byte;
begin
  Result := False;
  BaseHour := -1;
  if ScanString(S, lPos, FormatSettings.TimeAMString) or ScanString(S, lPos, 'AM') then
    BaseHour := 0
  else if ScanString(S, lPos, FormatSettings.TimePMString) or ScanString(S, lPos, 'PM') then
    BaseHour := 12;
  if BaseHour >= 0 then ScanBlanks(S, lPos);
  if not ScanNumber(S, lPos, Hour, Junk) then Exit;
  Min := 0;
  Sec := 0;
  MSec := 0;
  if ScanString(S, lPos, FormatSettings.TimeSeparator) then
  begin
    if not ScanNumber(S, lPos, Min, Junk) then Exit;
    if ScanString(S, lPos, FormatSettings.TimeSeparator) then
    begin
      if not ScanNumber(S, lPos, Sec, Junk) then Exit;
      if ScanString(S, lPos, FormatSettings.DecimalSeparator) then
        if not ScanNumber(S, lPos, MSec, Junk) then Exit;
    end;
  end;
  if BaseHour < 0 then
    if ScanString(S, lPos, FormatSettings.TimeAMString) or ScanString(S, lPos, 'AM') then
      BaseHour := 0
    else
      if ScanString(S, lPos, FormatSettings.TimePMString) or ScanString(S, lPos, 'PM') then
        BaseHour := 12;
  if BaseHour >= 0 then
  begin
    if (Hour = 0) or (Hour > 12) then Exit;
    if Hour = 12 then Hour := 0;
    inc(Hour, BaseHour);
  end;
  ScanBlanks(S, lPos);
  Result := TryEncodeTime(Hour, Min, Sec, MSec, aTime);
end;

method StrToDate(const S: DelphiString): TDateTime;
begin
  if not TryStrToDate(S, Result) then
    ConvertErrorFmt(SInvalidDate, [S]);
end;

method StrToDate(const S: DelphiString; const FormatSettings: TFormatSettings): TDateTime;
begin
  if not TryStrToDate(S, Result, FormatSettings) then
    ConvertErrorFmt(SInvalidDate, [S]);
end;

method StrToDate(const S: DelphiString; Provider: IFormatProvider): TDateTime;
begin
  if not TryStrToDate(S, Result, Provider) then
    ConvertErrorFmt(SInvalidDate, [S]);
end;

method StrToDateDef(const S: DelphiString; const Default: TDateTime): TDateTime;
begin
  if not TryStrToDate(S, Result) then
    Result := Default;
end;

method StrToDateDef(const S: DelphiString; const Default: TDateTime;
  const FormatSettings: TFormatSettings): TDateTime;
begin
  if not TryStrToDate(S, Result, FormatSettings) then
    Result := Default;
end;

method StrToDateDef(const S: DelphiString; const Default: TDateTime;
  Provider: IFormatProvider): TDateTime;
begin
  if not TryStrToDate(S, Result, Provider) then
    Result := Default;
end;

method TryStrToDate(const S: DelphiString; out Value: TDateTime): Boolean;
var
  lPos: Integer;
begin
  Value := default(TDateTime);
  lPos := 1;
  Result := ScanDate(S, lPos, Value) and (lPos > length(S));
end;

method TryStrToDate(const S: DelphiString; out Value: TDateTime;
  const FormatSettings: TFormatSettings): Boolean;
var
  lPos: Integer;
begin
  Value := default(TDateTime);
  lPos := 1;
  Result := ScanDate(S, lPos, Value, FormatSettings) and (lPos > length(S));
end;

method TryStrToDate(const S: DelphiString; out Value: TDateTime;
  Provider: IFormatProvider): Boolean;
begin
  Value := default(TDateTime);
  Result := False;
  try
    Value := TDateTime.Parse(S, Provider);
    Result := True;
  except
  end;
end;

method StrToTime(const S: DelphiString): TDateTime;
begin
  if not TryStrToTime(S, Result) then
    ConvertErrorFmt(SInvalidTime, [S]);
end;

method StrToTime(const S: DelphiString; const FormatSettings: TFormatSettings): TDateTime;
begin
  if not TryStrToTime(S, Result, FormatSettings) then
    ConvertErrorFmt(SInvalidTime, [S]);
end;

method StrToTime(const S: DelphiString; Provider: IFormatProvider): TDateTime; 
begin
  if not TryStrToTime(S, Result, Provider) then
    ConvertErrorFmt(SInvalidTime, [S]);
end;

method StrToTimeDef(const S: DelphiString; const Default: TDateTime): TDateTime;
begin
  if not TryStrToTime(S, Result) then
    Result := Default;
end;

method StrToTimeDef(const S: DelphiString; const Default: TDateTime;
  const FormatSettings: TFormatSettings): TDateTime;
begin
  if not TryStrToTime(S, Result, FormatSettings) then
    Result := Default;
end;

method StrToTimeDef(const S: DelphiString; const Default: TDateTime;
  Provider: IFormatProvider): TDateTime;
begin
  if not TryStrToTime(S, Result, Provider) then
    Result := Default;
end;

method TryStrToTime(const S: DelphiString; out Value: TDateTime): Boolean;
var
  lPos: Integer;
begin
  Value := default(TDateTime);
  lPos := 1;
  Result := ScanTime(S, lPos, Value) and (lPos > length(S));
end;

method TryStrToTime(const S: DelphiString; out Value: TDateTime;
  const FormatSettings: TFormatSettings): Boolean;
var
  lPos: Integer;
begin
  Value := default(TDateTime);
  lPos := 1;
  Result := ScanTime(S, lPos, Value, FormatSettings) and (lPos > length(S));
end;

method TryStrToTime(const S: DelphiString; out Value: TDateTime;
  Provider: IFormatProvider): Boolean;
begin
  Value := default(TDateTime);
  Result := False;
  try
    Value := TDateTime.Parse(S, Provider, DateTimeStyles.NoCurrentDateDefault);
    Result := True;
  except
  end;
end;

method StrToDateTime(const S: DelphiString): TDateTime;
begin
  if not TryStrToDateTime(S, Result) then
    ConvertErrorFmt(SInvalidDateTime, [S]);
end;

method StrToDateTime(const S: DelphiString; const FormatSettings: TFormatSettings): TDateTime;
begin
  if not TryStrToDateTime(S, Result, FormatSettings) then
    ConvertErrorFmt(SInvalidDateTime, [S]);
end;

method StrToDateTime(const S: DelphiString; Provider: IFormatProvider): TDateTime;
begin
  if not TryStrToDateTime(S, Result, Provider) then
    ConvertErrorFmt(SInvalidDateTime, [S]);
end;

method StrToDateTimeDef(const S: DelphiString; const Default: TDateTime): TDateTime;
begin
  if not TryStrToDateTime(S, Result) then
    Result := Default;
end;

method StrToDateTimeDef(const S: DelphiString; const Default: TDateTime;
  const FormatSettings: TFormatSettings): TDateTime;
begin
  if not TryStrToDateTime(S, Result, FormatSettings) then
    Result := Default;
end;

method StrToDateTimeDef(const S: DelphiString; const Default: TDateTime;
  Provider: IFormatProvider): TDateTime;
begin
  if not TryStrToDateTime(S, Result, Provider) then
    Result := Default;
end;

method TryStrToDateTime(const S: DelphiString; out Value: TDateTime): Boolean;
var
  lPos: Integer;
  lDate, lTime: TDateTime;
begin
  Value := default(TDateTime);
  Result := True;
  lPos := 1;
  lTime := 0;
  if not ScanDate(S, lPos, lDate) or
     not ((lPos > length(S)) or ScanTime(S, lPos, lTime)) then

    // Try time only
    Result := TryStrToTime(S, Value)
  else
    if lDate >= 0 then
      Value := lDate + lTime
    else
      Value := lDate - lTime;
end;

method TryStrToDateTime(const S: DelphiString; out Value: TDateTime;
  const FormatSettings: TFormatSettings): Boolean;
var
  lPos: Integer;
  lDate, lTime: TDateTime;
begin
  Value := default(TDateTime);
  Result := True;
  lPos := 1;
  lTime := 0;
  if not ScanDate(S, lPos, lDate, FormatSettings) or
     not ((lPos > length(S)) or ScanTime(S, lPos, lTime, FormatSettings)) then

    // Try lTime only
    Result := TryStrToTime(S, Value, FormatSettings)
  else
    if lDate >= 0 then
      Value := lDate + lTime
    else
      Value := lDate - lTime;
end;

method TryStrToDateTime(const S: DelphiString; out Value: TDateTime;
  Provider: IFormatProvider): Boolean;
begin
  Value := default(TDateTime);
  Result := False;
  try
    Value := TDateTime.Parse(S, Provider, DateTimeStyles.NoCurrentDateDefault);
    Result := True;
  except
    //TODO!
  end;
end;

{ Date/time to string conversions }

{ Conversions between date formats: This is close, but there are some
  cases where the mapping must be approximate.
  For Delphi formats, this means
    * am/pm maps to ampm (that is, must use system setting)
    * a/p is based on current settings, not hardcoded to 'a' or 'p'
    * no control over case in the am/pm or a/p strings
    * no options for how to represent era, they all map to gg
    * no support for z -- it maps to fractional seconds with 3 decimals (zzz)

  For CLR formats, this means
    * no support for single-digit years, they map to 2 digit years.
    * no support for 12-hour clock when there is no am/pm symbol, 24-hour is used.
    * no support for fractional seconds, they map to milliseconds (zzz)
    * no support for time zone offsets
 }
method AddStringToFormat(SB: StringBuilder; I: Integer; S: DelphiString): Integer;
begin
  SB.Append(S);
  Result := I + 1;
end;

method ConvertDelphiDateTimeFormat(const aFormat: DelphiString): DelphiString;
var
  I, Count, HPos, H2Pos, Len: Integer;
  C : Char;
  DTInfo: System.Globalization.DateTimeFormatInfo;
  SB: StringBuilder;
begin
  Len := length(aFormat);
  if Len = 0 then
  begin
    Result := '';
    Exit;
  end;
  if (Len = 1) and ((aFormat[1] = 'c') or (aFormat[1] = 'C')) then
  begin
    Result := 'G';
    Exit;
  end;
  DTInfo := System.Threading.Thread.CurrentThread.CurrentCulture.DateTimeFormat;
  SB := StringBuilder.Create(Len);
  I := 1;
  HPos := -1;
  H2Pos := -1;
  while I <= Len do
  begin
    C := aFormat[I];
    case C of
      'd', 'D':   { ddddd and dddddd must be remapped }
        begin
          Count := 0;
          while (I + Count <= Len) and
                 ((aFormat[I + Count] = 'd') or (aFormat[I + Count] = 'D')) do
            Count := Count + 1;
          case Count of
            5: SB.Append(DTInfo.ShortDatePattern);
            6: SB.Append(DTInfo.LongDatePattern);
            else begin begin
                SB.Append(StringOfChar('d', Count));
          end; end; end;
          inc(I, Count);
        end;
      't', 'T':  { t -> ShortTimeFormat, tt -> LongTimeFormat }
        begin
          if (I < Len) and
             ((aFormat[I + 1] = 't') or (aFormat[I + 1] = 'T')) then
          begin
            SB.Append(DTInfo.LongTimePattern);
            I := I + 2;
          end
          else
          begin
            SB.Append(DTInfo.ShortTimePattern);
            I := I + 1;
          end
        end;
      'c', 'C': { embedded general format }
        begin
          SB.Append(DTInfo.ShortDatePattern);
          I := AddStringToFormat(SB, I, ' ');
          SB.Append(DTInfo.LongTimePattern);
        end;
      'h', 'H': { assume 24-hour clock for now }
        begin
          { remember this position -- we will convert to 12-hour later if we
            find and am/pm string }
          HPos := SB.Length;
          I := AddStringToFormat(SB, I, 'H');
          if (I <= Len) and ((aFormat[I] = 'h') or (aFormat[I] = 'H')) then
          begin
            H2Pos := SB.Length;
            I := AddStringToFormat(SB, I, 'H');
          end;
        end;
      'a', 'A': { check for AM/PM strings -- note we cant honor case here }
        begin
          if System.String.Compare(aFormat, I - 1, 'am/pm', 0, 5, True) = 0 then
          begin
            SB.Append('tt');
            I := I + 5;
          end
          else if System.String.Compare(aFormat, I - 1, 'ampm', 0, 4, True) = 0 then
          begin
            SB.Append('tt');
            I := I + 4;
          end
          else if System.String.Compare(aFormat, I - 1, 'a/p', 0, 3, True) = 0 then
          begin
            AddStringToFormat(SB, I, 't');
            inc(I, 3);
          end
          else
            I := AddStringToFormat(SB, I, C);
          if HPos <> -1 then // check if we need to convert hour code to 12-hour
          begin
            SB.Chars[HPos] := 'h';
            if H2Pos <> -1 then
              SB.Chars[H2Pos] := 'h';
            HPos := -1;
            H2Pos := -1;
          end;
        end;
      '\': { need to double this }
        I := AddStringToFormat(SB, I, '\\');
      'e', 'E', 'g', 'G': { only gg is supported }
        begin
          I := AddStringToFormat(SB, I, 'gg');
          if (I <= Len) and (UpCase(C) = UpCase(aFormat[I])) then
            I := I + 1;
        end;
      '''', '"': {start of quoted literal sequence}
        begin
          I := AddStringToFormat(SB, I, C);
          Count := 0;
          while (I + Count <= Len) and (aFormat[I + Count] <> C) do
            inc(Count);
          SB.Append(aFormat, I - 1, Count);
          inc(I, Count);
          if I <= Len then
            I := AddStringToFormat(SB, I, C);
        end;
      'z', 'Z' : { milliseconds not supported, use fff }
        begin
          SB.Append('fff');
          while (I <= Len) and ((aFormat[I] = 'z') or (aFormat[I] = 'Z')) do
            I := I + 1;
        end;
      'n', 'N': { minutes}
        I := AddStringToFormat(SB, I, 'm');
      'm', 'M': { lower case m must be upper cased, upper case M is fine as is}
        I := AddStringToFormat(SB, I, 'M');
      'y', 'Y': { upper case Y must be lower cased, lower case y is fine as is}
        I := AddStringToFormat(SB, I, 'y');
      's', 'S': { upper case S must be lower cased, lower case s is fine as is}
        I := AddStringToFormat(SB, I, 's');
      else begin begin { anything else works the same }
        I := AddStringToFormat(SB, I, C);
    end; end; end;
  end;
  Result := SB.ToString;
end;

method ConvertClrDateTimeFormat(const aFormat: DelphiString): DelphiString;
var
  I, Len: Integer;
  DTInfo: System.Globalization.DateTimeFormatInfo;
  SB: StringBuilder;
begin
  Len := length(aFormat);
  if Len = 0 then
  begin
    Result := '';
    Exit;
  end;
  if Len = 1 then
  begin
    DTInfo := System.Threading.Thread.CurrentThread.CurrentCulture.DateTimeFormat;
    case aFormat[1] of
      'd': Result := ShortDateFormat;
      'D': Result := LongDateFormat;
      'f': Result := LongDateFormat + ' ' + ShortTimeFormat;
      'F', 'U': Result := LongDateFormat + ' ' + LongTimeFormat;
      'g': Result := ShortDateFormat + ' ' + ShortTimeFormat;
      'G': Result := 'c';
      'm','M': Result :=  ConvertClrDateTimeFormat(DTInfo.MonthDayPattern);
      'r','R': Result := ConvertClrDateTimeFormat(DTInfo.RFC1123Pattern);
      's': Result := ConvertClrDateTimeFormat(DTInfo.SortableDateTimePattern);
      't': Result := ShortTimeFormat;
      'T' : Result := LongTimeFormat;
      'u': Result := ConvertClrDateTimeFormat(DTInfo.UniversalSortableDateTimePattern);
      'y', 'Y': Result := ConvertClrDateTimeFormat(DTInfo.YearMonthPattern);
      else begin begin Result := '';
    end; end; end;
    Exit;
  end;
//  Result := aFormat;
  SB := StringBuilder.Create(Len);
  I := 1;
  while I <= Len do
  begin
    case aFormat[I] of
      'm':   { minutes are n in Delphi formats }
        I := AddStringToFormat(SB, I, 'n');
      'f':  { not supported, use milliseconds instead }
        begin
          SB.Append('zzz');
          while (I <= Len) and (aFormat[I] = 'f') do
            I := I + 1;
        end;
      't':  { t -> 'a/p' while tt -> 'ampm' }
        begin
          if (I < Len) and (aFormat[I + 1] = 't') then
          begin
            SB.Append('ampm');
            I := I + 2;
          end
          else
            I := AddStringToFormat(SB, I, 'a/p');
        end;
      'y': { y not supported, use yy, otherwise, just copy }
        begin
          if (I < Len) and (aFormat[I + 1] <> 'y') then
            I := AddStringToFormat(SB, I, 'yy')
          else
            while (I <= Len) and (aFormat[I] = 'y') do
              I := AddStringToFormat(SB, I, 'y');
        end;
      '\': { escape character for literals }
        if I < Len then
        begin
          SB.Append(QuotedStr(aFormat[I + 1]));
          inc(I, 2);
        end
        else
          I := AddStringToFormat(SB, I, '\');
      '''': {start of quoted literal sequence}
        begin
          I := AddStringToFormat(SB, I, '''');
          while (I <= Len) and (aFormat[I] <> '''') do
            I := AddStringToFormat(SB, I, aFormat[I]);
          if I <= Len then
            I := AddStringToFormat(SB, I, '''');
        end;
      'z', '%': { ignore: no support for time zones, % is escape for 1-char custom }
        I := I + 1;
      else begin begin { anything else works the same or is as close as we can get }
        I := AddStringToFormat(SB, I, aFormat[I]);
    end; end; end;
  end;
  Result := SB.ToString;
end;

method DateTimeToString(var &Result: DelphiString; const aFormat: DelphiString;
  ADateTime: TDateTime);
var
  LFormat: DateTimeFormatInfo;
  LShortMonthNames, LLongMonthNames: array[0..12] of DelphiString;
begin
  LFormat := DateTimeFormatInfo(System.Threading.Thread.CurrentThread.CurrentCulture.DateTimeFormat.Clone);
  with LFormat do
  begin
    //DateSeparator := Borland.Vcl.SysUtils.DateSeparator;
    ShortDatePattern := ConvertDelphiDateTimeFormat(ShortDateFormat);
    LongDatePattern := ConvertDelphiDateTimeFormat(LongDateFormat);
    //TimeSeparator := Borland.Vcl.SysUtils.TimeSeparator;
    AMDesignator := TimeAMString;
    PMDesignator := TimePMString;
    ShortTimePattern := ConvertDelphiDateTimeFormat(ShortTimeFormat);
    LongTimePattern := ConvertDelphiDateTimeFormat(LongTimeFormat);

    System.Array.Copy(ShortMonthNames, LShortMonthNames, length(ShortMonthNames));
    LShortMonthNames[12] := '';
    System.Array.Copy(LongMonthNames, LLongMonthNames, length(LongMonthNames));
    LLongMonthNames[12] := '';
    AbbreviatedMonthNames := LShortMonthNames;
    MonthNames := LLongMonthNames;
    AbbreviatedDayNames := ShortDayNames;
    DayNames := LongDayNames;
  end;
  DateTimeToString(&Result, aFormat, ADateTime, LFormat);
end;

method DateTimeToString(var &Result: DelphiString; const aFormat: DelphiString;
  ADateTime: TDateTime; const FormatSettings: TFormatSettings);
var
  LFormat: DateTimeFormatInfo;
  LShortMonthNames, LLongMonthNames: array[0..12] of DelphiString;
begin
  LFormat := DateTimeFormatInfo(System.Threading.Thread.CurrentThread.CurrentCulture.DateTimeFormat.Clone);
  with LFormat, FormatSettings do
  begin
    LFormat.DateSeparator := FormatSettings.DateSeparator;
    ShortDatePattern := ConvertDelphiDateTimeFormat(ShortDateFormat);
    LongDatePattern := ConvertDelphiDateTimeFormat(LongDateFormat);
    LFormat.TimeSeparator := FormatSettings.TimeSeparator;
    AMDesignator := TimeAMString;
    PMDesignator := TimePMString;
    ShortTimePattern := ConvertDelphiDateTimeFormat(ShortTimeFormat);
    LongTimePattern := ConvertDelphiDateTimeFormat(LongTimeFormat);

    System.Array.Copy(ShortMonthNames, LShortMonthNames, length(ShortMonthNames));
    LShortMonthNames[12] := '';
    System.Array.Copy(LongMonthNames, LLongMonthNames, length(LongMonthNames));
    LLongMonthNames[12] := '';
    AbbreviatedMonthNames := LShortMonthNames;
    MonthNames := LLongMonthNames;
    AbbreviatedDayNames := ShortDayNames;
    DayNames := LongDayNames;
  end;
  DateTimeToString(&Result, aFormat, ADateTime, LFormat);
end;

method DateTimeToString(var &&Result: DelphiString; const aFormat: DelphiString;
  ADateTime: TDateTime; Provider: IFormatProvider);
begin
  &Result := ADateTime.ToString(ConvertDelphiDateTimeFormat(aFormat), Provider);
end;

method MinDateTime: TDateTime;
begin
  Result := TDateTime.MinValue;
end;

method MaxDateTime: TDateTime; 
begin
  Result := TDateTime.MaxValue;
end;

method TryFloatToDateTime(const Value: Extended; out AResult: TDateTime): Boolean;
begin
  AResult := default(TDateTime);
  Result := not ((Value < MinDateTimeAsDouble) or (Value >= Int(MaxDateTimeAsDouble) + 1.0));
  if Result then
    AResult := Value;
end;

method FloatToDateTime(const Value: Extended): TDateTime;
begin
  if not TryFloatToDateTime(Value, Result) then
    ConvertErrorFmt(SInvalidDateTimeFloat, [Value]);
end;

end.