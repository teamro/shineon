namespace ShineOn.Rtl;

{ *********************************************************************** }
{                                                                         }
{ Based on the Delphi Visual Component Library                            }
{                                                                         }
{ Copyright (c) CodeGear and RemObjects Software                          }
{                                                                         }
{ *********************************************************************** }

interface

{ The following unit is ISO 8601 compliant.  What that means is this unit
  considers Monday the first day of the week (5.2.3).  Additionally ISO 8601
  dictates the following "the first calendar week of the year is the one
  that includes the first Thursday of that year" (3.17).  In other words the
  first week of the week is the first one that has four or more days.  For
  more information about ISO 8601 see: http://www.iso.ch/markete/8601.pdf

  The functions most impacted by ISO 8601 are marked as such in the interface
  section.

  The functions marked with "ISO 8601x" are not directly covered by ISO 8601
  but their functionality is a logical extension to the standard.

  Some of the functions, concepts or constants in this unit were provided by
  Jeroen W. Pluimers (http://www.all-im.com), Glenn Crouch, Rune Moberg and
  Ray Lischner (http://www.tempest-sw.com).

  The Julian Date and Modified Julian Date functions are based on code
  from NASA's SOHO site (http://sohowww.nascom.nasa.gov/solarsoft/gen/idl/time)
  in which they credit the underlying algorithms as by Fliegel and Van
  Flandern (1968) which was reprinted in the Explanatory Supplement to the
  Astronomical Almanac, 1992.

  Julian Date and Modified Julian Date is discussed in some detail on the
  US Naval Observatory Time Service site (http://tycho.usno.navy.mil/mjd.html).
  Additional information can be found at (http://www.treasure-troves.com/astro).
}

{ Simple trimming functions }

method DateOf(const AValue: TDateTime): TDateTime; public;
method TimeOf(const AValue: TDateTime): TDateTime; public;

{ Misc functions }

method IsInLeapYear(const AValue: TDateTime): Boolean; public;
method IsPM(const AValue: TDateTime): Boolean; public;
method IsValidDate(const AYear, AMonth, ADay: Word): Boolean; public;
method IsValidTime(const AHour, AMinute, ASecond, AMilliSecond: Word): Boolean; public;
method IsValidDateTime(const AYear, AMonth, ADay, AHour, AMinute, ASecond,
  AMilliSecond: Word): Boolean; public;
method IsValidDateDay(const AYear, ADayOfYear: Word): Boolean; public;
method IsValidDateWeek(const AYear, AWeekOfYear,                    {ISO 8601}
  ADayOfWeek: Word): Boolean; public;
method IsValidDateMonthWeek(const AYear, AMonth, AWeekOfMonth,     {ISO 8601x}
  ADayOfWeek: Word): Boolean; public;
method WeeksInYear(const AValue: TDateTime): Word; public;                 {ISO 8601}
method WeeksInAYear(const AYear: Word): Word; public;                       {ISO 8601}
method DaysInYear(const AValue: TDateTime): Word; public;
method DaysInAYear(const AYear: Word): Word; public;
method DaysInMonth(const AValue: TDateTime): Word; public;
method DaysInAMonth(const AYear, AMonth: Word): Word; public;
method Today: TDateTime; public;
method Yesterday: TDateTime; public;
method Tomorrow: TDateTime; public;
method IsToday(const AValue: TDateTime): Boolean; public;
method IsSameDay(const AValue, ABasis: TDateTime): Boolean; public;

{ Pick-a-field functions }

method YearOf(const AValue: TDateTime): Word; public;
method MonthOf(const AValue: TDateTime): Word; public;
method WeekOf(const AValue: TDateTime): Word; public;                      {ISO 8601}
method DayOf(const AValue: TDateTime): Word; public;
method HourOf(const AValue: TDateTime): Word; public;
method MinuteOf(const AValue: TDateTime): Word; public;
method SecondOf(const AValue: TDateTime): Word; public;
method MilliSecondOf(const AValue: TDateTime): Word; public;

{ Start/End functions }

method StartOfTheYear(const AValue: TDateTime): TDateTime; public;
method EndOfTheYear(const AValue: TDateTime): TDateTime; public;
method StartOfAYear(const AYear: Word): TDateTime; public;
method EndOfAYear(const AYear: Word): TDateTime; public;

method StartOfTheMonth(const AValue: TDateTime): TDateTime; public;
method EndOfTheMonth(const AValue: TDateTime): TDateTime; public;
method StartOfAMonth(const AYear, AMonth: Word): TDateTime; public;
method EndOfAMonth(const AYear, AMonth: Word): TDateTime; public;

method StartOfTheWeek(const AValue: TDateTime): TDateTime; public;         {ISO 8601}
method EndOfTheWeek(const AValue: TDateTime): TDateTime; public;           {ISO 8601}
method StartOfAWeek(const AYear, AWeekOfYear: Word;                 {ISO 8601}
  const ADayOfWeek: Word := 1): TDateTime; public;
method EndOfAWeek(const AYear, AWeekOfYear: Word;                   {ISO 8601}
  const ADayOfWeek: Word := 7): TDateTime; public;

method StartOfTheDay(const AValue: TDateTime): TDateTime; public;
method EndOfTheDay(const AValue: TDateTime): TDateTime; public;
method StartOfADay(const AYear, AMonth, ADay: Word): TDateTime; public; 
method EndOfADay(const AYear, AMonth, ADay: Word): TDateTime; public;
method StartOfADay(const AYear, ADayOfYear: Word): TDateTime; public;
method EndOfADay(const AYear, ADayOfYear: Word): TDateTime; public;

{ This of that functions }

method MonthOfTheYear(const AValue: TDateTime): Word; public;
method WeekOfTheYear(const AValue: TDateTime): Word; public;      {ISO 8601}
method WeekOfTheYear(const AValue: TDateTime;                       {ISO 8601}
  var AYear: Word): Word; public;
method DayOfTheYear(const AValue: TDateTime): Word; public;
method HourOfTheYear(const AValue: TDateTime): Word; public;
method MinuteOfTheYear(const AValue: TDateTime): LongWord; public;
method SecondOfTheYear(const AValue: TDateTime): LongWord; public;
method MilliSecondOfTheYear(const AValue: TDateTime): Int64; public;

method WeekOfTheMonth(const AValue: TDateTime): Word; public;    {ISO 8601x}
method WeekOfTheMonth(const AValue: TDateTime; var AYear,          {ISO 8601x}
  AMonth: Word): Word; public;
method DayOfTheMonth(const AValue: TDateTime): Word; public;
method HourOfTheMonth(const AValue: TDateTime): Word; public;
method MinuteOfTheMonth(const AValue: TDateTime): Word; public;
method SecondOfTheMonth(const AValue: TDateTime): LongWord; public;
method MilliSecondOfTheMonth(const AValue: TDateTime): LongWord; public;

method DayOfTheWeek(const AValue: TDateTime): Word; public;                {ISO 8601}
method HourOfTheWeek(const AValue: TDateTime): Word; public;               {ISO 8601}
method MinuteOfTheWeek(const AValue: TDateTime): Word; public;             {ISO 8601}
method SecondOfTheWeek(const AValue: TDateTime): LongWord; public;         {ISO 8601}
method MilliSecondOfTheWeek(const AValue: TDateTime): LongWord; public;     {ISO 8601}

method HourOfTheDay(const AValue: TDateTime): Word; public;
method MinuteOfTheDay(const AValue: TDateTime): Word; public;
method SecondOfTheDay(const AValue: TDateTime): LongWord; public;
method MilliSecondOfTheDay(const AValue: TDateTime): LongWord; public;

method MinuteOfTheHour(const AValue: TDateTime): Word; public;
method SecondOfTheHour(const AValue: TDateTime): Word; public;
method MilliSecondOfTheHour(const AValue: TDateTime): LongWord; public;

method SecondOfTheMinute(const AValue: TDateTime): Word; public;
method MilliSecondOfTheMinute(const AValue: TDateTime): LongWord; public;

method MilliSecondOfTheSecond(const AValue: TDateTime): Word; public;

{ Range checking functions }

method WithinPastYears(const ANow, AThen: TDateTime;
  const AYears: Integer): Boolean; public;
method WithinPastMonths(const ANow, AThen: TDateTime;
  const AMonths: Integer): Boolean; public;
method WithinPastWeeks(const ANow, AThen: TDateTime;
  const AWeeks: Integer): Boolean; public;
method WithinPastDays(const ANow, AThen: TDateTime;
  const ADays: Integer): Boolean; public;
method WithinPastHours(const ANow, AThen: TDateTime;
  const AHours: Int64): Boolean; public;
method WithinPastMinutes(const ANow, AThen: TDateTime;
  const AMinutes: Int64): Boolean; public;
method WithinPastSeconds(const ANow, AThen: TDateTime;
  const ASeconds: Int64): Boolean; public;
method WithinPastMilliSeconds(const ANow, AThen: TDateTime;
  const AMilliSeconds: Int64): Boolean; public;

{ Range query functions }

method YearsBetween(const ANow, AThen: TDateTime): Integer; public;
method MonthsBetween(const ANow, AThen: TDateTime): Integer; public;
method WeeksBetween(const ANow, AThen: TDateTime): Integer; public;
method DaysBetween(const ANow, AThen: TDateTime): Integer; public;
method HoursBetween(const ANow, AThen: TDateTime): Int64; public;
method MinutesBetween(const ANow, AThen: TDateTime): Int64; public;
method SecondsBetween(const ANow, AThen: TDateTime): Int64; public;
method MilliSecondsBetween(const ANow, AThen: TDateTime): Int64; public;

{ Range spanning functions }
{ YearSpan and MonthSpan are approximates, not exact but pretty darn close }
method YearSpan(const ANow, AThen: TDateTime): Double; public;
method MonthSpan(const ANow, AThen: TDateTime): Double; public;
method WeekSpan(const ANow, AThen: TDateTime): Double; public;
method DaySpan(const ANow, AThen: TDateTime): Double; public;
method HourSpan(const ANow, AThen: TDateTime): Double; public;
method MinuteSpan(const ANow, AThen: TDateTime): Double; public;
method SecondSpan(const ANow, AThen: TDateTime): Double; public;
method MilliSecondSpan(const ANow, AThen: TDateTime): Double; public;

{ Increment/decrement datetime fields }

method IncYear(const AValue: TDateTime;
  const ANumberOfYears: Integer := 1): TDateTime; public;
// function IncMonth is in SysUtils
method IncWeek(const AValue: TDateTime;
  const ANumberOfWeeks: Integer := 1): TDateTime; public;
method IncDay(const AValue: TDateTime;
  const ANumberOfDays: Integer := 1): TDateTime; public;
method IncHour(const AValue: TDateTime;
  const ANumberOfHours: Int64 := 1): TDateTime; public;
method IncMinute(const AValue: TDateTime;
  const ANumberOfMinutes: Int64 := 1): TDateTime; public;
method IncSecond(const AValue: TDateTime;
  const ANumberOfSeconds: Int64 := 1): TDateTime; public;
method IncMilliSecond(const AValue: TDateTime;
  const ANumberOfMilliSeconds: Int64 := 1): TDateTime; public;

{ Unified encode/decode functions that deal with all datetime fields at once }

method EncodeDateTime(const AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond: Word): TDateTime; public;
{method DecodeDateTime(const AValue: TDateTime; out AYear, AMonth, ADay,
  AHour, AMinute, ASecond, AMilliSecond: Word);}

{ Encode/decode functions that work with week of year and day of week }

method EncodeDateWeek(const AYear, AWeekOfYear: Word;               {ISO 8601}
  const ADayOfWeek: Word := 1): TDateTime; public;

{ Encode/decode functions that work with day of year }

method EncodeDateDay(const AYear, ADayOfYear: Word): TDateTime; public;
method DecodeDateDay(const AValue: TDateTime; out AYear, ADayOfYear: Word); public;

{ Encode/decode functions that work with week of month }

method EncodeDateMonthWeek(const AYear, AMonth, AWeekOfMonth,      {ISO 8601x}
  ADayOfWeek: Word): TDateTime; public;

{ The following functions are similar to the above ones except these don't
  generated exceptions on failure, they return false instead }

{method TryEncodeDateTime(const AYear, AMonth, ADay, AHour, AMinute, ASecond,
  AMilliSecond: Word; out AValue: TDateTime): Boolean;}
method TryEncodeDateMonthWeek(const AYear, AMonth, AWeekOfMonth,   {ISO 8601x}
  ADayOfWeek: Word; var AValue: TDateTime): Boolean; public;

{ Recode functions for datetime fields }

method RecodeYear(const AValue: TDateTime; const AYear: Word): TDateTime; public;
method RecodeMonth(const AValue: TDateTime; const AMonth: Word): TDateTime; public;
method RecodeDay(const AValue: TDateTime; const ADay: Word): TDateTime; public;
method RecodeHour(const AValue: TDateTime; const AHour: Word): TDateTime; public;
method RecodeMinute(const AValue: TDateTime; const AMinute: Word): TDateTime; public;
method RecodeSecond(const AValue: TDateTime; const ASecond: Word): TDateTime; public;
method RecodeMilliSecond(const AValue: TDateTime;
  const AMilliSecond: Word): TDateTime; public;

method RecodeDate(const AValue: TDateTime; const AYear, AMonth,
  ADay: Word): TDateTime; public;
method RecodeTime(const AValue: TDateTime; const AHour, AMinute, ASecond,
  AMilliSecond: Word): TDateTime; public;
method RecodeDateTime(const AValue: TDateTime; const AYear, AMonth, ADay,
  AHour, AMinute, ASecond, AMilliSecond: Word): TDateTime; public;

{ The following function is similar to the above one except it doesn't
  generated an exception on failure, it return false instead }

{ Fuzzy comparison }

method CompareDateTime(const A, B: TDateTime): TValueRelationship; public;
method SameDateTime(const A, B: TDateTime): Boolean; public;
method CompareDate(const A, B: TDateTime): TValueRelationship; public;
method SameDate(const A, B: TDateTime): Boolean; public;
method CompareTime(const A, B: TDateTime): TValueRelationship; public;
method SameTime(const A, B: TDateTime): Boolean; public;

{ For a given date these functions tell you the which day of the week of the
  month (or year).  If its a Thursday, they will tell you if its the first,
  second, etc Thursday of the month (or year).  Remember, even though its
  the first Thursday of the year it doesn't mean its the first week of the
  year.  See ISO 8601 above for more information. }

method NthDayOfWeek(const AValue: TDateTime): Word; public;

method DecodeDayOfWeekInMonth(const AValue: TDateTime; out AYear, AMonth,
  ANthDayOfWeek, ADayOfWeek: Word); public;

method EncodeDayOfWeekInMonth(const AYear, AMonth, ANthDayOfWeek,
  ADayOfWeek: Word): TDateTime; public;
method TryEncodeDayOfWeekInMonth(const AYear, AMonth, ANthDayOfWeek,
  ADayOfWeek: Word; out AValue: TDateTime): Boolean; public;

{ Error reporting }

method InvalidDateTimeError(const AYear, AMonth, ADay, AHour, AMinute,
  ASecond, AMilliSecond: Word; const ABaseDate: TDateTime := 0); public;
method InvalidDateWeekError(const AYear, AWeekOfYear, ADayOfWeek: Word); public;
method InvalidDateDayError(const AYear, ADayOfYear: Word); public;
method InvalidDateMonthWeekError(const AYear, AMonth, AWeekOfMonth,
  ADayOfWeek: Word); public;
method InvalidDayOfWeekInMonthError(const AYear, AMonth, ANthDayOfWeek,
  ADayOfWeek: Word); public;

{ Julian and Modified Julian Date conversion support }
{ Be aware that not all Julian Dates (or MJD) are encodable as a TDateTime }

method DateTimeToJulianDate(const AValue: TDateTime): Double; public;
method JulianDateToDateTime(const AValue: Double): TDateTime; public;
method TryJulianDateToDateTime(const AValue: Double; 
  out ADateTime: TDateTime): Boolean; public;

method DateTimeToModifiedJulianDate(const AValue: TDateTime): Double; public;
method ModifiedJulianDateToDateTime(const AValue: Double): TDateTime; public;
method TryModifiedJulianDateToDateTime(const AValue: Double; 
  out ADateTime: TDateTime): Boolean; public;

{ Unix date conversion support }

method DateTimeToUnix(const AValue: TDateTime): Int64; public;
method UnixToDateTime(const AValue: Int64): TDateTime; public;

{ Constants used in this unit }

const
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

  OneHour = 1 / HoursPerDay;
  OneMinute = 1 / MinsPerDay;
  OneSecond = 1 / SecsPerDay;
  OneMillisecond = 1 / MSecsPerDay;

  { This is actual days per year but you need to know if it's a leap year}
  DaysPerYear: array [{Boolean}0..1] of Word = [365, 366];

  { Used in RecodeDate, RecodeTime and RecodeDateTime for those datetime }
  {  fields you want to leave alone }
  RecodeLeaveFieldAsIs = $ffff; //High(Word);

{ Global variable used in this unit }

var

  { average over a 4 year span }
  ApproxDaysPerMonth: Double := 30.4375;
  ApproxDaysPerYear: Double := 365.25;

  { The above are the average days per month/year over a normal 4 year period. }
  { We use these approximations because they are more accurate for the next }
  {  century or so.  After that you may want to switch over to these 400 year }
  {  approximations... }
  {    ApproxDaysPerMonth = 30.436875 }
  {    ApproxDaysPerYear  = 365.2425 }

{ Originally private helper functions }

method DecodeDateWeek(const AValue: TDateTime; out AYear, AWeekOfYear, ADayOfWeek: Word); public;
method DecodeDateMonthWeek(const AValue: TDateTime; out AYear, AMonth, AWeekOfMonth, ADayOfWeek: Word); public;
method TryEncodeDateWeek(const AYear, AWeekOfYear: Word; out AValue: TDateTime; const ADayOfWeek: Word): Boolean; public;
method TryEncodeDateDay(const AYear, ADayOfYear: Word; out AValue: TDateTime): Boolean; public;
method TryEncodeDateTime(const AYear, AMonth, ADay, AHour, AMinute, ASecond, AMSec: Word; out Rslt: TDateTime): Boolean;
method TryRecodeDateTime(const AValue: TDateTime; const AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond: Word; out AResult: TDateTime): Boolean;


implementation

method DateOf(const AValue: TDateTime): TDateTime;
begin
  Result := Trunc(AValue);
end;

method TimeOf(const AValue: TDateTime): TDateTime;
begin
  Result := Frac(AValue);
end;


method IsInLeapYear(const AValue: TDateTime): Boolean;
begin
  Result := IsLeapYear(YearOf(AValue));
end;

method IsPM(const AValue: TDateTime): Boolean;
begin
  Result := HourOf(AValue) >= 12;
end;

method IsValidDate(const AYear, AMonth, ADay: Word): Boolean;
begin
  Result := (AYear >= 1) and (AYear <= 9999) and
            (AMonth >= 1) and (AMonth <= 12) and
            (ADay >= 1) and (ADay <= DaysInAMonth(AYear, AMonth));
end;

method IsValidTime(const AHour, AMinute, ASecond, AMilliSecond: Word): Boolean;
begin
  Result := ((AHour < HoursPerDay) and (AMinute < MinsPerHour) and
             (ASecond < SecsPerMin) and (AMilliSecond < MSecsPerSec)) or
            ((AHour = 24) and (AMinute = 0) and // midnight early next day
             (ASecond = 0) and (AMilliSecond = 0));
end;

method IsValidDateTime(const AYear, AMonth, ADay, AHour, AMinute, ASecond,
  AMilliSecond: Word): Boolean;
begin
  Result := IsValidDate(AYear, AMonth, ADay) and
            IsValidTime(AHour, AMinute, ASecond, AMilliSecond);
end;

method IsValidDateMonthWeek(const AYear, AMonth, AWeekOfMonth,
  ADayOfWeek: Word): Boolean;
begin
  Result := (AYear >= 1) and (AYear <= 9999) and
            (AMonth >= 1) and (AMonth <= 12) and
            (AWeekOfMonth >= 1) and (AWeekOfMonth <= 5) and
            (ADayOfWeek >= DayMonday) and (ADayOfWeek <= DaySunday);
end;

method IsValidDateDay(const AYear, ADayOfYear: Word): Boolean;
begin
  Result := (AYear >= 1) and (AYear <= 9999) and
            (ADayOfYear >= 1) and (ADayOfYear <= DaysInAYear(AYear));
end;

method IsValidDateWeek(const AYear, AWeekOfYear, ADayOfWeek: Word): Boolean;
begin
  Result := (AYear >= 1) and (AYear <= 9999) and
            (AWeekOfYear >= 1) and (AWeekOfYear <= WeeksInAYear(AYear)) and
            (ADayOfWeek >= DayMonday) and (ADayOfWeek <= DaySunday);
end;

method DaysInYear(const AValue: TDateTime): Word;
begin
  Result := DaysInAYear(YearOf(AValue));
end;

method DaysInAYear(const AYear: Word): Word;
begin
  Result := DaysPerYear[iif(IsLeapYear(AYear),0,1)];
end;

method DaysInMonth(const AValue: TDateTime): Word;
var
  LYear, LMonth, LDay: Word;
begin
  DecodeDate(AValue, LYear, LMonth, LDay);
  Result := DaysInAMonth(LYear, LMonth);
end;

method DaysInAMonth(const AYear, AMonth: Word): Word;
begin
  var isLeapFebruary := iif((AMonth = 2) and IsLeapYear(AYear),0,1);
  Result := MonthDays[isLeapFebruary][AMonth];
end;

method WeeksInYear(const AValue: TDateTime): Word;
begin
  Result := WeeksInAYear(YearOf(AValue));
end;

method WeeksInAYear(const AYear: Word): Word;
var
  LDayOfWeek: Word;
begin
  Result := 52;
  LDayOfWeek := DayOfTheWeek(EncodeDate(AYear, 1, 1));
  if (LDayOfWeek = DayThursday) or
     ((LDayOfWeek = DayWednesday) and IsLeapYear(AYear)) then
    inc(Result);
end;

method Today: TDateTime;
begin
  Result := Date;
end;

method Yesterday: TDateTime;
begin
  Result := Date - 1;
end;

method Tomorrow: TDateTime;
begin
  Result := Date + 1;
end;

method IsToday(const AValue: TDateTime): Boolean;
begin
  Result := IsSameDay(AValue, Date);
end;

method IsSameDay(const AValue, ABasis: TDateTime): Boolean;
begin
  Result := (AValue >= Trunc(ABasis)) and
            (AValue < Trunc(ABasis) + 1);
end;

method YearOf(const AValue: TDateTime): Word;
var
  LMonth, LDay: Word;
begin
  DecodeDate(AValue, Result, LMonth, LDay);
end;

method MonthOf(const AValue: TDateTime): Word;
var
  LYear, LDay: Word;
begin
  DecodeDate(AValue, LYear, Result, LDay);
end;

method WeekOf(const AValue: TDateTime): Word;
begin
  Result := WeekOfTheYear(AValue);
end;

method DayOf(const AValue: TDateTime): Word;
var
  LYear, LMonth: Word;
begin
  DecodeDate(AValue, LYear, LMonth, Result);
end;

method HourOf(const AValue: TDateTime): Word;
var
  LMinute, LSecond, LMilliSecond: Word;
begin
  DecodeTime(AValue, Result, LMinute, LSecond, LMilliSecond);
end;

method MinuteOf(const AValue: TDateTime): Word;
var
  LHour, LSecond, LMilliSecond: Word;
begin
  DecodeTime(AValue, LHour, Result, LSecond, LMilliSecond);
end;

method SecondOf(const AValue: TDateTime): Word;
var
  LHour, LMinute, LMilliSecond: Word;
begin
  DecodeTime(AValue, LHour, LMinute, Result, LMilliSecond);
end;

method MilliSecondOf(const AValue: TDateTime): Word;
var
  LHour, LMinute, LSecond: Word;
begin
  DecodeTime(AValue, LHour, LMinute, LSecond, Result);
end;

method StartOfTheYear(const AValue: TDateTime): TDateTime;
begin
  Result := EncodeDate(YearOf(AValue), 1, 1);
end;

method EndOfTheYear(const AValue: TDateTime): TDateTime;
begin
  Result := EndOfTheDay(EncodeDate(YearOf(AValue), 12, 31));
end;

method StartOfTheMonth(const AValue: TDateTime): TDateTime;
var
  LYear, LMonth, LDay: Word;
begin
  DecodeDate(AValue, LYear, LMonth, LDay);
  Result := EncodeDate(LYear, LMonth, 1);
end;

method EndOfTheMonth(const AValue: TDateTime): TDateTime;
var
  LYear, LMonth, LDay: Word;
begin
  DecodeDate(AValue, LYear, LMonth, LDay);
  Result := EndOfTheDay(EncodeDate(LYear, LMonth, DaysInAMonth(LYear, LMonth)));
end;

method StartOfTheWeek(const AValue: TDateTime): TDateTime;
begin
  Result := Trunc(AValue) - (DayOfTheWeek(AValue) - 1);
end;

method EndOfTheWeek(const AValue: TDateTime): TDateTime;
begin
  Result := EndOfTheDay(StartOfTheWeek(AValue) + 6);
end;

method StartOfTheDay(const AValue: TDateTime): TDateTime;
begin
  Result := Trunc(AValue);
end;

method EndOfTheDay(const AValue: TDateTime): TDateTime;
begin
  Result := RecodeTime(AValue, 23, 59, 59, 999);
end;

method StartOfAYear(const AYear: Word): TDateTime;
begin
  Result := EncodeDate(AYear, 1, 1);
end;

method EndOfAYear(const AYear: Word): TDateTime;
begin
  Result := EndOfTheDay(EncodeDate(AYear, 12, 31));
end;

method StartOfAMonth(const AYear, AMonth: Word): TDateTime;
begin
  Result := EncodeDate(AYear, AMonth, 1);
end;

method EndOfAMonth(const AYear, AMonth: Word): TDateTime;
begin
  Result := EndOfTheDay(EncodeDate(AYear, AMonth, DaysInAMonth(AYear, AMonth)));
end;

method StartOfAWeek(const AYear, AWeekOfYear, ADayOfWeek: Word): TDateTime;
begin
  Result := EncodeDateWeek(AYear, AWeekOfYear, ADayOfWeek);
end;

method EndOfAWeek(const AYear, AWeekOfYear, ADayOfWeek: Word): TDateTime;
begin
  Result := EndOfTheDay(EncodeDateWeek(AYear, AWeekOfYear, ADayOfWeek));
end;

method StartOfADay(const AYear, ADayOfYear: Word): TDateTime;
begin
  Result := EncodeDateDay(AYear, ADayOfYear);
end;

method EndOfADay(const AYear, ADayOfYear: Word): TDateTime;
begin
  Result := EndOfTheDay(EncodeDateDay(AYear, ADayOfYear));
end;

method StartOfADay(const AYear, AMonth, ADay: Word): TDateTime;
begin
  Result := StartOfAMonth(AYear, AMonth) + ADay - 1;
end;

method EndOfADay(const AYear, AMonth, ADay: Word): TDateTime;
begin
  Result := EndOfTheDay(EncodeDate(AYear, AMonth, ADay));
end;


method MonthOfTheYear(const AValue: TDateTime): Word;
begin
  Result := MonthOf(AValue);
end;

method WeekOfTheYear(const AValue: TDateTime): Word;
var
  LYear, LDOW: Word;
begin
  DecodeDateWeek(AValue, LYear, Result, LDOW);
end;

method WeekOfTheYear(const AValue: TDateTime; var AYear: Word): Word;
var
  LDOW: Word;
begin
  DecodeDateWeek(AValue, AYear, Result, LDOW);
end;

method DayOfTheYear(const AValue: TDateTime): Word;
begin
  Result := Trunc(AValue - StartOfTheYear(AValue)) + 1;
end;

method HourOfTheYear(const AValue: TDateTime): Word;
begin
  Result := HourOf(AValue) + (DayOfTheYear(AValue) - 1) * HoursPerDay;
end;

method MinuteOfTheYear(const AValue: TDateTime): LongWord;
begin
  Result := MinuteOf(AValue) + HourOfTheYear(AValue) * MinsPerHour;
end;

method SecondOfTheYear(const AValue: TDateTime): LongWord;
begin
  Result := SecondOf(AValue) + MinuteOfTheYear(AValue) * SecsPerMin;
end;

method MilliSecondOfTheYear(const AValue: TDateTime): Int64;
begin
  Result := MilliSecondOf(AValue) + Int64(SecondOfTheYear(AValue)) * MSecsPerSec;
end;


method WeekOfTheMonth(const AValue: TDateTime): Word;
var
  LYear, LMonth, LDayOfWeek: Word;
begin
  DecodeDateMonthWeek(AValue, LYear, LMonth, Result, LDayOfWeek);
end;

method WeekOfTheMonth(const AValue: TDateTime; var AYear, AMonth: Word): Word;
var
  LDayOfWeek: Word;
begin
  DecodeDateMonthWeek(AValue, AYear, AMonth, Result, LDayOfWeek);
end;

method DayOfTheMonth(const AValue: TDateTime): Word;
begin
  Result := DayOf(AValue);
end;

method HourOfTheMonth(const AValue: TDateTime): Word;
begin
  Result := HourOf(AValue) + (DayOfTheMonth(AValue) - 1) * HoursPerDay;
end;

method MinuteOfTheMonth(const AValue: TDateTime): Word;
begin
  Result := MinuteOf(AValue) + HourOfTheMonth(AValue) * MinsPerHour;
end;

method SecondOfTheMonth(const AValue: TDateTime): LongWord;
begin
  Result := SecondOf(AValue) + MinuteOfTheMonth(AValue) * SecsPerMin;
end;

method MilliSecondOfTheMonth(const AValue: TDateTime): LongWord;
begin
  Result := MilliSecondOf(AValue) + SecondOfTheMonth(AValue) * MSecsPerSec;
end;


method DayOfTheWeek(const AValue: TDateTime): Word;
begin
  Result := (DateTimeToTimeStamp(AValue).Date - 1) mod 7 + 1;
end;

method HourOfTheWeek(const AValue: TDateTime): Word;
begin
  Result := HourOf(AValue) + (DayOfTheWeek(AValue) - 1) * HoursPerDay;
end;

method MinuteOfTheWeek(const AValue: TDateTime): Word;
begin
  Result := MinuteOf(AValue) + HourOfTheWeek(AValue) * MinsPerHour;
end;

method SecondOfTheWeek(const AValue: TDateTime): LongWord;
begin
  Result := SecondOf(AValue) + MinuteOfTheWeek(AValue) * SecsPerMin;
end;

method MilliSecondOfTheWeek(const AValue: TDateTime): LongWord;
begin
  Result := MilliSecondOf(AValue) + SecondOfTheWeek(AValue) * MSecsPerSec;
end;


method HourOfTheDay(const AValue: TDateTime): Word;
begin
  Result := HourOf(AValue);
end;

method MinuteOfTheDay(const AValue: TDateTime): Word;
var
  LHours, LMinutes, LSeconds, LMilliSeconds: Word;
begin
  DecodeTime(AValue, LHours, LMinutes, LSeconds, LMilliSeconds);
  Result := LMinutes + LHours * MinsPerHour;
end;

method SecondOfTheDay(const AValue: TDateTime): LongWord;
var
  LHours, LMinutes, LSeconds, LMilliSeconds: Word;
begin
  DecodeTime(AValue, LHours, LMinutes, LSeconds, LMilliSeconds);
  Result := LSeconds + (LMinutes + LHours * MinsPerHour) * SecsPerMin;
end;

method MilliSecondOfTheDay(const AValue: TDateTime): LongWord;
var
  LHours, LMinutes, LSeconds, LMilliSeconds: Word;
begin
  DecodeTime(AValue, LHours, LMinutes, LSeconds, LMilliSeconds);
  Result := LMilliSeconds + (LSeconds + (LMinutes + LHours * MinsPerHour) * SecsPerMin) * MSecsPerSec;
end;


method MinuteOfTheHour(const AValue: TDateTime): Word;
begin
  Result := MinuteOf(AValue);
end;

method SecondOfTheHour(const AValue: TDateTime): Word;
var
  LHours, LMinutes, LSeconds, LMilliSeconds: Word;
begin
  DecodeTime(AValue, LHours, LMinutes, LSeconds, LMilliSeconds);
  Result := LSeconds + (LMinutes * SecsPerMin);
end;

method MilliSecondOfTheHour(const AValue: TDateTime): LongWord;
var
  LHours, LMinutes, LSeconds, LMilliSeconds: Word;
begin
  DecodeTime(AValue, LHours, LMinutes, LSeconds, LMilliSeconds);
  Result := LMilliSeconds + (LSeconds + LMinutes * SecsPerMin) * MSecsPerSec;
end;


method SecondOfTheMinute(const AValue: TDateTime): Word;
begin
  Result := SecondOf(AValue);
end;

method MilliSecondOfTheMinute(const AValue: TDateTime): LongWord;
var
  LHours, LMinutes, LSeconds, LMilliSeconds: Word;
begin
  DecodeTime(AValue, LHours, LMinutes, LSeconds, LMilliSeconds);
  Result := LMilliSeconds + LSeconds * MSecsPerSec;
end;


method MilliSecondOfTheSecond(const AValue: TDateTime): Word;
begin
  Result := MilliSecondOf(AValue);
end;


method WithinPastYears(const ANow, AThen: TDateTime;
  const AYears: Integer): Boolean;
begin
  Result := YearsBetween(ANow, AThen) <= AYears;
end;

method WithinPastMonths(const ANow, AThen: TDateTime;
  const AMonths: Integer): Boolean;
begin
  Result := MonthsBetween(ANow, AThen) <= AMonths;
end;

method WithinPastWeeks(const ANow, AThen: TDateTime;
  const AWeeks: Integer): Boolean;
begin
  Result := WeeksBetween(ANow, AThen) <= AWeeks;
end;

method WithinPastDays(const ANow, AThen: TDateTime;
  const ADays: Integer): Boolean;
begin
  Result := DaysBetween(ANow, AThen) <= ADays;
end;

method WithinPastHours(const ANow, AThen: TDateTime;
  const AHours: Int64): Boolean;
begin
  Result := HoursBetween(ANow, AThen) <= AHours;
end;

method WithinPastMinutes(const ANow, AThen: TDateTime;
  const AMinutes: Int64): Boolean;
begin
  Result := MinutesBetween(ANow, AThen) <= AMinutes;
end;

method WithinPastSeconds(const ANow, AThen: TDateTime;
  const ASeconds: Int64): Boolean;
begin
  Result := SecondsBetween(ANow, AThen) <= ASeconds;
end;

method WithinPastMilliSeconds(const ANow, AThen: TDateTime;
  const AMilliSeconds: Int64): Boolean;
begin
  Result := MilliSecondsBetween(ANow, AThen) <= AMilliSeconds;
end;


method YearsBetween(const ANow, AThen: TDateTime): Integer;
begin
  Result := Trunc(YearSpan(ANow, AThen));
end;

method MonthsBetween(const ANow, AThen: TDateTime): Integer;
begin
  Result := Trunc(MonthSpan(ANow, AThen));
end;

method WeeksBetween(const ANow, AThen: TDateTime): Integer;
begin
  Result := Trunc(WeekSpan(ANow, AThen));
end;

method DaysBetween(const ANow, AThen: TDateTime): Integer;
begin
  Result := Trunc(DaySpan(ANow, AThen));
end;

method HoursBetween(const ANow, AThen: TDateTime): Int64;
begin
  Result := Trunc(HourSpan(ANow, AThen));
end;

method MinutesBetween(const ANow, AThen: TDateTime): Int64;
begin
  Result := Trunc(MinuteSpan(ANow, AThen));
end;

method SecondsBetween(const ANow, AThen: TDateTime): Int64;
begin
  Result := Trunc(SecondSpan(ANow, AThen));
end;

method MilliSecondsBetween(const ANow, AThen: TDateTime): Int64;
begin
  Result := Trunc(MilliSecondSpan(ANow, AThen));
end;


method SpanOfNowAndThen(const ANow, AThen: TDateTime): Double;
begin
  if ANow < AThen then
    Result := AThen - ANow
  else
    Result := ANow - AThen;
end;

method YearSpan(const ANow, AThen: TDateTime): Double;
begin
  Result := DaySpan(ANow, AThen) / ApproxDaysPerYear;
end;

method MonthSpan(const ANow, AThen: TDateTime): Double;
begin
  Result := DaySpan(ANow, AThen) / ApproxDaysPerMonth;
end;

method WeekSpan(const ANow, AThen: TDateTime): Double;
begin
  Result := DaySpan(ANow, AThen) / DaysPerWeek;
end;

method DaySpan(const ANow, AThen: TDateTime): Double;
begin
  Result := SpanOfNowAndThen(ANow, AThen);
end;

method HourSpan(const ANow, AThen: TDateTime): Double;
begin
  Result := HoursPerDay * SpanOfNowAndThen(ANow, AThen);
end;

method MinuteSpan(const ANow, AThen: TDateTime): Double;
begin
  Result := MinsPerDay * SpanOfNowAndThen(ANow, AThen);
end;

method SecondSpan(const ANow, AThen: TDateTime): Double;
begin
  Result := SecsPerDay * SpanOfNowAndThen(ANow, AThen);
end;

method MilliSecondSpan(const ANow, AThen: TDateTime): Double;
begin
  Result := MSecsPerDay * SpanOfNowAndThen(ANow, AThen);
end;


method IncYear(const AValue: TDateTime;
  const ANumberOfYears: Integer): TDateTime;
begin
  Result := IncMonth(AValue, ANumberOfYears * MonthsPerYear);
end;

method IncWeek(const AValue: TDateTime;
  const ANumberOfWeeks: Integer): TDateTime;
begin
  Result := AValue + ANumberOfWeeks * DaysPerWeek;
end;

method IncDay(const AValue: TDateTime;
  const ANumberOfDays: Integer): TDateTime;
begin
  Result := AValue + ANumberOfDays;
end;

method IncHour(const AValue: TDateTime;
  const ANumberOfHours: Int64): TDateTime;
begin
  result := AValue.Value.AddHours(ANumberOfHours);
  //((AValue * HoursPerDay) + ANumberOfHours) / HoursPerDay;
end;

method IncMinute(const AValue: TDateTime;
  const ANumberOfMinutes: Int64): TDateTime;
begin
  result := AValue.Value.AddMinutes(ANumberOfMinutes);
  //Result := ((AValue * MinsPerDay) + ANumberOfMinutes) / MinsPerDay;
end;

method IncSecond(const AValue: TDateTime;
  const ANumberOfSeconds: Int64): TDateTime;
begin
  result := AValue.Value.AddSeconds(ANumberOfSeconds);
  //Result := ((AValue * SecsPerDay) + ANumberOfSeconds) / SecsPerDay;
end;

method IncMilliSecond(const AValue: TDateTime;
  const ANumberOfMilliSeconds: Int64): TDateTime;
begin
  result := AValue.Value.AddMilliseconds(ANumberOfMilliSeconds);
  //Result := ((AValue * MSecsPerDay) + ANumberOfMilliSeconds) / MSecsPerDay;
end;


method EncodeDateTime(const AYear, AMonth, ADay, AHour, AMinute, ASecond,
  AMilliSecond: Word): TDateTime;
begin
  if not TryEncodeDateTime(AYear, AMonth, ADay,
                           AHour, AMinute, ASecond, AMilliSecond, Result) then
    InvalidDateTimeError(AYear, AMonth, ADay,
                         AHour, AMinute, ASecond, AMilliSecond);
end;

method DecodeDateTime(const AValue: TDateTime; out AYear, AMonth, ADay,
  AHour, AMinute, ASecond, AMilliSecond: Word);
begin
  DecodeDate(AValue, AYear, AMonth, ADay);
  DecodeTime(AValue, AHour, AMinute, ASecond, AMilliSecond);
end;

method EncodeDateWeek(const AYear, AWeekOfYear, ADayOfWeek: Word): TDateTime;
begin
  if not TryEncodeDateWeek(AYear, AWeekOfYear, Result, ADayOfWeek) then
    InvalidDateWeekError(AYear, AWeekOfYear, ADayOfWeek);
end;

const
  CDayMap: array [1..7] of Word = [7, 1, 2, 3, 4, 5, 6];

method DecodeDateWeek(const AValue: TDateTime; out AYear, AWeekOfYear,
  ADayOfWeek: Word);
var
  LDayOfYear: Integer;
  LMonth, LDay: Word;
  LStart: TDateTime;
  LStartDayOfWeek, LEndDayOfWeek: Word;
  LLeap: Boolean;
begin
  LLeap := DecodeDateFully(AValue, AYear, LMonth, LDay, ADayOfWeek);
  ADayOfWeek := CDayMap[ADayOfWeek];
  LStart := EncodeDate(AYear, 1, 1);
  LDayOfYear := Trunc(AValue - LStart + 1);
  LStartDayOfWeek := DayOfTheWeek(LStart);
  if LStartDayOfWeek in [DayFriday, DaySaturday, DaySunday] then
    dec(LDayOfYear, 8 - LStartDayOfWeek)
  else
    inc(LDayOfYear, LStartDayOfWeek - 1);
  if LDayOfYear <= 0 then
    DecodeDateWeek(LStart - 1, AYear, AWeekOfYear, LDay)
  else
  begin
    AWeekOfYear := LDayOfYear div 7;
    if LDayOfYear mod 7 <> 0 then
      inc(AWeekOfYear);
    if AWeekOfYear > 52 then
    begin
      LEndDayOfWeek := LStartDayOfWeek;
      if LLeap then
      begin
        if LEndDayOfWeek = DaySunday then
          LEndDayOfWeek := DayMonday
        else
          inc(LEndDayOfWeek);
      end;
      if LEndDayOfWeek in [DayMonday, DayTuesday, DayWednesday] then
      begin
        inc(AYear);
        AWeekOfYear := 1;
      end;
    end;
  end;
end;

method EncodeDateDay(const AYear, ADayOfYear: Word): TDateTime;
begin
  if not TryEncodeDateDay(AYear, ADayOfYear, Result) then
    InvalidDateDayError(AYear, ADayOfYear);
end;

method DecodeDateDay(const AValue: TDateTime; out AYear, ADayOfYear: Word);
begin
  AYear := YearOf(AValue);
  ADayOfYear := DayOfTheYear(AValue);
end;

method EncodeDateMonthWeek(const AYear, AMonth, AWeekOfMonth,
  ADayOfWeek: Word): TDateTime;
begin
  if not TryEncodeDateMonthWeek(AYear, AMonth, AWeekOfMonth, ADayOfWeek,
                                Result) then
    InvalidDateMonthWeekError(AYear, AMonth, AWeekOfMonth, ADayOfWeek);
end;

method DecodeDateMonthWeek(const AValue: TDateTime;
  out AYear, AMonth, AWeekOfMonth, ADayOfWeek: Word);
var
  LDay, LDaysInMonth: Word;
  LDayOfMonth: Integer;
  LStart: TDateTime;
  LStartDayOfWeek, LEndOfMonthDayOfWeek: Word;
begin
  DecodeDateFully(AValue, AYear, AMonth, LDay, ADayOfWeek);
  ADayOfWeek := CDayMap[ADayOfWeek];
  LStart := EncodeDate(AYear, AMonth, 1);
  LStartDayOfWeek := DayOfTheWeek(LStart);
  LDayOfMonth := LDay;
  if LStartDayOfWeek in [DayFriday, DaySaturday, DaySunday] then
    dec(LDayOfMonth, 8 - LStartDayOfWeek)
  else
    inc(LDayOfMonth, LStartDayOfWeek - 1);
  if LDayOfMonth <= 0 then
    DecodeDateMonthWeek(LStart - 1, AYear, AMonth, AWeekOfMonth, LDay)
  else
  begin
    AWeekOfMonth := LDayOfMonth div 7;
    if LDayOfMonth mod 7 <> 0 then
      inc(AWeekOfMonth);
    LDaysInMonth := DaysInAMonth(AYear, AMonth);
    LEndOfMonthDayOfWeek := DayOfTheWeek(EncodeDate(AYear, AMonth, LDaysInMonth));
    if (LEndOfMonthDayOfWeek in [DayMonday, DayTuesday, DayWednesday]) and
       (LDaysInMonth - LDay < LEndOfMonthDayOfWeek) then
    begin
      inc(AMonth);
      if AMonth = 13 then
      begin
        AMonth := 1;
        inc(AYear);
      end;
      AWeekOfMonth := 1;
    end;
  end;
end;


method TryEncodeDateTime(const AYear, AMonth, ADay, AHour, AMinute, ASecond,
  AMSec: Word; out Rslt: TDateTime): Boolean;
begin
  Result := TDateTime.TryEncodeDateTime(AYear, AMonth, ADay, AHour, AMinute,
    ASecond, AMSec, Rslt);
end;

method TryEncodeDateWeek(const AYear, AWeekOfYear: Word;
  out AValue: TDateTime; const ADayOfWeek: Word): Boolean;
var
  LDayOfYear: Integer;
  LStartDayOfWeek: Word;
begin
  AValue := default(TDateTime);
  Result := IsValidDateWeek(AYear, AWeekOfYear, ADayOfWeek);
  if Result then
  begin
    AValue := EncodeDate(AYear, 1, 1);
    LStartDayOfWeek := DayOfTheWeek(AValue);
    LDayOfYear := (AWeekOfYear - 1) * 7 + ADayOfWeek - 1;
    if LStartDayOfWeek in [DayFriday, DaySaturday, DaySunday] then
      inc(LDayOfYear, 8 - LStartDayOfWeek)
    else
      dec(LDayOfYear, LStartDayOfWeek - 1);
    AValue := AValue + LDayOfYear;
  end;
end;

method TryEncodeDateDay(const AYear, ADayOfYear: Word;
  out AValue: TDateTime): Boolean;
begin
  AValue := default(TDateTime);
  Result := IsValidDateDay(AYear, ADayOfYear);
  if Result then
    AValue := StartOfAYear(AYear) + ADayOfYear - 1;
end;

method TryEncodeDateMonthWeek(const AYear, AMonth, AWeekOfMonth,
  ADayOfWeek: Word; var AValue: TDateTime): Boolean;
var
  LStartDayOfWeek: Word;
  LDayOfMonth: Integer;
begin
  Result := IsValidDateMonthWeek(AYear, AMonth, AWeekOfMonth, ADayOfWeek);
  if Result then
  begin
    AValue := EncodeDate(AYear, AMonth, 1);
    LStartDayOfWeek := DayOfTheWeek(AValue);
    LDayOfMonth := (AWeekOfMonth - 1) * 7 + ADayOfWeek - 1;
    if LStartDayOfWeek in [DayFriday, DaySaturday, DaySunday] then
      inc(LDayOfMonth, 8 - LStartDayOfWeek)
    else
      dec(LDayOfMonth, LStartDayOfWeek - 1);
    AValue := AValue + LDayOfMonth;
  end;
end;


method RecodeYear(const AValue: TDateTime; const AYear: Word): TDateTime;
begin
  Result := RecodeDateTime(AValue, AYear, RecodeLeaveFieldAsIs,
    RecodeLeaveFieldAsIs, RecodeLeaveFieldAsIs, RecodeLeaveFieldAsIs,
    RecodeLeaveFieldAsIs, RecodeLeaveFieldAsIs);
end;

method RecodeMonth(const AValue: TDateTime; const AMonth: Word): TDateTime;
begin
  Result := RecodeDateTime(AValue, RecodeLeaveFieldAsIs, AMonth,
    RecodeLeaveFieldAsIs, RecodeLeaveFieldAsIs, RecodeLeaveFieldAsIs,
    RecodeLeaveFieldAsIs, RecodeLeaveFieldAsIs);
end;

method RecodeDay(const AValue: TDateTime; const ADay: Word): TDateTime;
begin
  Result := RecodeDateTime(AValue, RecodeLeaveFieldAsIs, RecodeLeaveFieldAsIs,
    ADay, RecodeLeaveFieldAsIs, RecodeLeaveFieldAsIs, RecodeLeaveFieldAsIs,
    RecodeLeaveFieldAsIs);
end;

method RecodeHour(const AValue: TDateTime; const AHour: Word): TDateTime;
begin
  Result := RecodeDateTime(AValue, RecodeLeaveFieldAsIs, RecodeLeaveFieldAsIs,
    RecodeLeaveFieldAsIs, AHour, RecodeLeaveFieldAsIs, RecodeLeaveFieldAsIs,
    RecodeLeaveFieldAsIs);
end;

method RecodeMinute(const AValue: TDateTime; const AMinute: Word): TDateTime;
begin
  Result := RecodeDateTime(AValue, RecodeLeaveFieldAsIs, RecodeLeaveFieldAsIs,
    RecodeLeaveFieldAsIs, RecodeLeaveFieldAsIs, AMinute, RecodeLeaveFieldAsIs,
    RecodeLeaveFieldAsIs);
end;

method RecodeSecond(const AValue: TDateTime; const ASecond: Word): TDateTime;
begin
  Result := RecodeDateTime(AValue, RecodeLeaveFieldAsIs, RecodeLeaveFieldAsIs,
    RecodeLeaveFieldAsIs, RecodeLeaveFieldAsIs, RecodeLeaveFieldAsIs, ASecond,
    RecodeLeaveFieldAsIs);
end;

method RecodeMilliSecond(const AValue: TDateTime;
  const AMilliSecond: Word): TDateTime;
begin
  Result := RecodeDateTime(AValue, RecodeLeaveFieldAsIs, RecodeLeaveFieldAsIs,
    RecodeLeaveFieldAsIs, RecodeLeaveFieldAsIs, RecodeLeaveFieldAsIs,
    RecodeLeaveFieldAsIs, AMilliSecond);
end;

method RecodeDate(const AValue: TDateTime; const AYear, AMonth,
  ADay: Word): TDateTime;
begin
  Result := RecodeDateTime(AValue, AYear, AMonth, ADay, RecodeLeaveFieldAsIs,
    RecodeLeaveFieldAsIs, RecodeLeaveFieldAsIs, RecodeLeaveFieldAsIs);
end;

method RecodeTime(const AValue: TDateTime; const AHour, AMinute, ASecond,
  AMilliSecond: Word): TDateTime;
begin
  Result := RecodeDateTime(AValue, RecodeLeaveFieldAsIs, RecodeLeaveFieldAsIs,
    RecodeLeaveFieldAsIs, AHour, AMinute, ASecond, AMilliSecond);
end;

method RecodeDateTime(const AValue: TDateTime; const AYear, AMonth, ADay,
  AHour, AMinute, ASecond, AMilliSecond: Word): TDateTime;
begin
  if not TryRecodeDateTime(AValue, AYear, AMonth, ADay,
                           AHour, AMinute, ASecond, AMilliSecond, Result) then
    InvalidDateTimeError(AYear, AMonth, ADay,
                         AHour, AMinute, ASecond, AMilliSecond,
                         AValue);
end;

method TryRecodeDateTime(const AValue: TDateTime; const AYear, AMonth, ADay,
  AHour, AMinute, ASecond, AMilliSecond: Word; out AResult: TDateTime): Boolean;
var
  LYear, LMonth, LDay, LHour, LMinute, LSecond, LMilliSecond: Word;
begin
  DecodeDateTime(AValue, LYear, LMonth, LDay,
                         LHour, LMinute, LSecond, LMilliSecond);
  if AYear <> RecodeLeaveFieldAsIs then LYear := AYear;
  if AMonth <> RecodeLeaveFieldAsIs then LMonth := AMonth;
  if ADay <> RecodeLeaveFieldAsIs then LDay := ADay;
  if AHour <> RecodeLeaveFieldAsIs then LHour := AHour;
  if AMinute <> RecodeLeaveFieldAsIs then LMinute := AMinute;
  if ASecond <> RecodeLeaveFieldAsIs then LSecond := ASecond;
  if AMilliSecond <> RecodeLeaveFieldAsIs then LMilliSecond := AMilliSecond;
  Result := TryEncodeDateTime(LYear, LMonth, LDay,
                              LHour, LMinute, LSecond, LMilliSecond, AResult);
end;

{ Fuzzy comparison }

method CompareDateTime(const A, B: TDateTime): TValueRelationship;
begin
  if Abs(A - B) < OneMillisecond then
    Result := EqualsValue
  else if A < B then
    Result := LessThanValue
  else
    Result := GreaterThanValue;
end;

method SameDateTime(const A, B: TDateTime): Boolean;
begin
  Result := Abs(A - B) < OneMillisecond;
end;

method CompareDate(const A, B: TDateTime): TValueRelationship;
begin
  if Trunc(A) = Trunc(B) then
    Result := EqualsValue
  else if A < B then
    Result := LessThanValue
  else
    Result := GreaterThanValue;
end;

method SameDate(const A, B: TDateTime): Boolean;
begin
  Result := Trunc(A) = Trunc(B);
end;

method CompareTime(const A, B: TDateTime): TValueRelationship;
begin
  if Abs(Frac(A) - Frac(B)) < OneMillisecond then
    Result := EqualsValue
  else if Frac(A) < Frac(B) then
    Result := LessThanValue
  else
    Result := GreaterThanValue;
end;

method SameTime(const A, B: TDateTime): Boolean;
begin
  Result := Abs(Frac(A) - Frac(B)) < OneMillisecond;
end;


{ NthDayOfWeek conversion }

method NthDayOfWeek(const AValue: TDateTime): Word;
begin
  Result := (DayOfTheMonth(AValue) - 1) div 7 + 1;
end;

method DecodeDayOfWeekInMonth(const AValue: TDateTime; out AYear, AMonth,
  ANthDayOfWeek, ADayOfWeek: Word);
var
  ADay: Word;
begin
  DecodeDate(AValue, AYear, AMonth, ADay);
  ANthDayOfWeek := (ADay - 1) div 7 + 1;
  ADayOfWeek := DayOfTheWeek(AValue);
end;

method EncodeDayOfWeekInMonth(const AYear, AMonth, ANthDayOfWeek,
  ADayOfWeek: Word): TDateTime;
begin
  if not TryEncodeDayOfWeekInMonth(AYear, AMonth, ANthDayOfWeek, ADayOfWeek, Result) then
    InvalidDayOfWeekInMonthError(AYear, AMonth, ANthDayOfWeek, ADayOfWeek);
end;

method TryEncodeDayOfWeekInMonth(const AYear, AMonth,
  ANthDayOfWeek, ADayOfWeek: Word; out AValue: TDateTime): Boolean;
var
  LStartOfMonth, LDay: Word;
begin
  LStartOfMonth := DayOfTheWeek(StartOfAMonth(AYear, AMonth));
  if LStartOfMonth <= ADayOfWeek then
    LDay := (ADayOfWeek - LStartOfMonth + 1) + 7 * (ANthDayOfWeek - 1)
  else
    LDay := (7 - LStartOfMonth + 1) + ADayOfWeek + 7 * (ANthDayOfWeek - 1);
  Result := TryEncodeDate(AYear, AMonth, LDay, AValue);
end;


{ Julian and Modified Julian Date conversion support }

method DateTimeToJulianDate(const AValue: TDateTime): Double;
var
  LYear, LMonth, LDay: Word;
begin
  DecodeDate(AValue, LYear, LMonth, LDay);
  Result := (1461 * (LYear + 4800 + (LMonth - 14) div 12)) div 4 +
            (367 * (LMonth - 2 - 12 * ((LMonth - 14) div 12))) div 12 -
            (3 * ((LYear + 4900 + (LMonth - 14) div 12) div 100)) div 4 +
            LDay - 32075.5 + Frac(AValue);
end;

method JulianDateToDateTime(const AValue: Double): TDateTime;
begin
  if not TryJulianDateToDateTime(AValue, Result) then
    raise EConvertError.Create(Format(SInvalidJulianDate, [AValue]));
end;

method TryJulianDateToDateTime(const AValue: Double;
  out ADateTime: TDateTime): Boolean;
var
  L, N, LYear, LMonth, LDay: Integer;
begin
  L := Trunc(AValue) + 68570;
  N := 4 * L div 146097;
  L := L - (146097 * N + 3) div 4;
  LYear := 4000 * (L + 1) div 1461001;
  L := L - 1461 * LYear div 4 + 31;
  LMonth := 80 * L div 2447;
  LDay := L - 2447 * LMonth div 80;
  L := LMonth div 11;
  LMonth := LMonth + 2 - 12 * L;
  LYear := 100 * (N - 49) + LYear + L;
  Result := TryEncodeDate(LYear, LMonth, LDay, ADateTime);
  if Result then
    ADateTime := ADateTime + Frac(AValue) - 0.5;
end;

var {const}
  CJDToMJDOffset: TDateTime := 2400000.5;

method DateTimeToModifiedJulianDate(const AValue: TDateTime): Double;
begin
  Result := DateTimeToJulianDate(AValue) - CJDToMJDOffset;
end;

method ModifiedJulianDateToDateTime(const AValue: Double): TDateTime;
begin
  Result := JulianDateToDateTime(AValue + CJDToMJDOffset);
end;

method TryModifiedJulianDateToDateTime(const AValue: Double;
  out ADateTime: TDateTime): Boolean;
begin
  Result := TryJulianDateToDateTime(AValue + CJDToMJDOffset, ADateTime);
end;


{ Unix date conversion support }

method DateTimeToUnix(const AValue: TDateTime): Int64;
var
  LDouble: Double;
begin
  LDouble := AValue; // See 188271 for more info
  Result := Trunc((LDouble - UnixDateDelta) * SecsPerDay);
end;

method UnixToDateTime(const AValue: Int64): TDateTime;
var
  LDouble: Double;
begin
  LDouble := AValue; // See 188271 for more info
  Result := (LDouble / SecsPerDay) + UnixDateDelta;
end;


{ Error reporting }

method InvalidDateTimeError(const AYear, AMonth, ADay, AHour, AMinute,
  ASecond, AMilliSecond: Word; const ABaseDate: TDateTime);
  method Translate(AOrig, AValue: Word): DelphiString;
  begin
    if AValue = RecodeLeaveFieldAsIs then
      if ABaseDate = 0 then
        Result := SMissingDateTimeField
      else
        Result := IntToStr(AOrig)
    else
      Result := IntToStr(AValue);
  end;
var
  LYear, LMonth, LDay, LHour, LMinute, LSecond, LMilliSecond: Word;
begin
  DecodeDate(ABaseDate, LYear, LMonth, LDay);
  DecodeTime(ABaseDate, LHour, LMinute, LSecond, LMilliSecond);
  raise EConvertError.Create(Format(SInvalidDateTime,
                                [Translate(LYear, AYear) + DateSeparator +
                                 Translate(LMonth, AMonth) + DateSeparator +
                                 Translate(LDay, ADay) + ' ' +
                                 Translate(LHour, AHour) + TimeSeparator +
                                 Translate(LMinute, AMinute) + TimeSeparator +
                                 Translate(LSecond, ASecond) + DecimalSeparator +
                                 Translate(LMilliSecond, AMilliSecond)]));
end;

method InvalidDateWeekError(const AYear, AWeekOfYear, ADayOfWeek: Word);
begin
  raise EConvertError.Create(Format(SInvalidDateWeek, [AYear, AWeekOfYear, ADayOfWeek]));
end;

method InvalidDateDayError(const AYear, ADayOfYear: Word);
begin
  raise EConvertError.Create(Format(SInvalidDateDay, [AYear, ADayOfYear]));
end;

method InvalidDateMonthWeekError(const AYear, AMonth, AWeekOfMonth,
  ADayOfWeek: Word);
begin
  raise EConvertError.Create(Format(SInvalidDateMonthWeek, [AYear, AMonth,
    AWeekOfMonth, ADayOfWeek]));
end;

method InvalidDayOfWeekInMonthError(const AYear, AMonth, ANthDayOfWeek,
  ADayOfWeek: Word);
begin
  raise EConvertError.Create(Format(SInvalidDayOfWeekInMonth, [AYear, AMonth,
    ANthDayOfWeek, ADayOfWeek]));
end;

end.