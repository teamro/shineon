namespace ShineOn.Rtl;

{ *********************************************************************** }
{                                                                         }
{ Delphi Visual Component Library                                         }
{                                                                         }
{ Copyright (c) 1997-2005 Borland Software Corporation                    }
{                                                                         }
{ *********************************************************************** }

interface

type
{ Standard Character set type }

  TSysCharSet = set of {Ansi}Char;
  
  SeparatorType = DelphiString;

{ MultiByte Character Set (MBCS) byte type }
  TMbcsByteType = (mbSingleByte, mbLeadByte, mbTrailByte);

{ System Locale information record }
  TSysLocale = public record
    DefaultLCID: Integer;
    PriLangID: Integer;
    SubLangID: Integer;
    FarEast: Boolean;
    MiddleEast: Boolean;
  end;

{ Currency and date/time formatting options

  The initial values of these variables are fetched from the system registry
  using the GetLocaleInfo function in the Win32 API. The description of each
  variable specifies the LOCALE_XXXX constant used to fetch the initial
  value.

  CurrencyString - Defines the currency symbol used in floating-point to
  decimal conversions. The initial value is fetched from LOCALE_SCURRENCY.

  CurrencyFormat - Defines the currency symbol placement and separation
  used in floating-point to decimal conversions. Possible values are:

    0 = '$1'
    1 = '1$'
    2 = '$ 1'
    3 = '1 $'

  The initial value is fetched from LOCALE_ICURRENCY.

  NegCurrFormat - Defines the currency format for used in floating-point to
  decimal conversions of negative numbers. Possible values are:

    0 = '($1)'      4 = '(1$)'      8 = '-1 $'      12 = '$ -1'
    1 = '-$1'       5 = '-1$'       9 = '-$ 1'      13 = '1- $'
    2 = '$-1'       6 = '1-$'      10 = '1 $-'      14 = '($ 1)'
    3 = '$1-'       7 = '1$-'      11 = '$ 1-'      15 = '(1 $)'

  The initial value is fetched from LOCALE_INEGCURR.

  ThousandSeparator - The character used to separate thousands in numbers
  with more than three digits to the left of the decimal separator. The
  initial value is fetched from LOCALE_STHOUSAND.  A value of #0 indicates
  no thousand separator character should be output even if the format string
  specifies thousand separators.

  DecimalSeparator - The character used to separate the integer part from
  the fractional part of a number. The initial value is fetched from
  LOCALE_SDECIMAL.  DecimalSeparator must be a non-zero value.

  CurrencyDecimals - The number of digits to the right of the decimal point
  in a currency amount. The initial value is fetched from LOCALE_ICURRDIGITS.

  DateSeparator - The character used to separate the year, month, and day
  parts of a date value. The initial value is fetched from LOCATE_SDATE.

  ShortDateFormat - The format string used to convert a date value to a
  short string suitable for editing. For a complete description of date and
  time format strings, refer to the documentation for the FormatDate
  function. The short date format should only use the date separator
  character and the  m, mm, d, dd, yy, and yyyy format specifiers. The
  initial value is fetched from LOCALE_SSHORTDATE.

  LongDateFormat - The format string used to convert a date value to a long
  string suitable for display but not for editing. For a complete description
  of date and time format strings, refer to the documentation for the
  FormatDate function. The initial value is fetched from LOCALE_SLONGDATE.

  TimeSeparator - The character used to separate the hour, minute, and
  second parts of a time value. The initial value is fetched from
  LOCALE_STIME.

  TimeAMString - The suffix string used for time values between 00:00 and
  11:59 in 12-hour clock format. The initial value is fetched from
  LOCALE_S1159.

  TimePMString - The suffix string used for time values between 12:00 and
  23:59 in 12-hour clock format. The initial value is fetched from
  LOCALE_S2359.

  ShortTimeFormat - The format string used to convert a time value to a
  short string with only hours and minutes. The default value is computed
  from LOCALE_ITIME and LOCALE_ITLZERO.

  LongTimeFormat - The format string used to convert a time value to a long
  string with hours, minutes, and seconds. The default value is computed
  from LOCALE_ITIME and LOCALE_ITLZERO.

  ShortMonthNames - Array of strings containing short month names. The mmm
  format specifier in a format string passed to FormatDate causes a short
  month name to be substituted. The default values are fecthed from the
  LOCALE_SABBREVMONTHNAME system locale entries.

  LongMonthNames - Array of strings containing long month names. The mmmm
  format specifier in a format string passed to FormatDate causes a long
  month name to be substituted. The default values are fecthed from the
  LOCALE_SMONTHNAME system locale entries.

  ShortDayNames - Array of strings containing short day names. The ddd
  format specifier in a format string passed to FormatDate causes a short
  day name to be substituted. The default values are fecthed from the
  LOCALE_SABBREVDAYNAME system locale entries.

  LongDayNames - Array of strings containing long day names. The dddd
  format specifier in a format string passed to FormatDate causes a long
  day name to be substituted. The default values are fecthed from the
  LOCALE_SDAYNAME system locale entries.

  ListSeparator - The character used to separate items in a list.  The
  initial value is fetched from LOCALE_SLIST.

  TwoDigitYearCenturyWindow - Determines what century is added to two
  digit years when converting string dates to numeric dates.  This value
  is subtracted from the current year before extracting the century.
  This can be used to extend the lifetime of existing applications that
  are inextricably tied to 2 digit year data entry.  The best solution
  to Year 2000 (Y2k) issues is not to accept 2 digit years at all - require
  4 digit years in data entry to eliminate century ambiguities.

  Examples:

  Current TwoDigitCenturyWindow  Century  StrToDate() of:
  Year    Value                  Pivot    '01/01/03' '01/01/68' '01/01/50'
  -------------------------------------------------------------------------
  1998    0                      1900     1903       1968       1950
  2002    0                      2000     2003       2068       2050
  1998    50 (default)           1948     2003       1968       1950
  2002    50 (default)           1952     2003       1968       2050
  2020    50 (default)           1970     2003       2068       2050
 }

var
  CurrencyString: DelphiString;
  CurrencyFormat: Byte;
  NegCurrFormat: Byte;
  ThousandSeparator: SeparatorType;
  DecimalSeparator: SeparatorType;
  CurrencyDecimals: Byte;
  DateSeparator: SeparatorType;
  ShortDateFormat: DelphiString;
  LongDateFormat: DelphiString;
  TimeSeparator: SeparatorType;
  TimeAMString: DelphiString;
  TimePMString: DelphiString;
  ShortTimeFormat: DelphiString;
  LongTimeFormat: DelphiString;
  ShortMonthNames: array[1..12] of DelphiString;
  LongMonthNames: array[1..12] of DelphiString;
  ShortDayNames: array[1..7] of DelphiString;
  LongDayNames: array[1..7] of DelphiString;
  SysLocale: TSysLocale;
  TwoDigitYearCenturyWindow: Word := 50;
  ListSeparator: SeparatorType;

{ Thread safe currency and date/time formatting

  The TFormatSettings record is designed to allow thread safe formatting,
  equivalent to the gloabal variables described above. Each of the
  formatting routines that use the gloabal variables have overloaded
  equivalents, requiring an additional parameter of type TFormatSettings.

  A TFormatSettings record must be populated before use. This can be done
  using the GetLocaleFormatSettings function, which will populate the
  record with values based on the given locale. Note that some format
  specifiers still require specific thread locale settings
  (such as period/era names).  }

type
  TFormatSettings = public record
    CurrencyFormat: Byte;
    NegCurrFormat: Byte;
    ThousandSeparator: SeparatorType;
    DecimalSeparator: SeparatorType;
    CurrencyDecimals: Byte;
    DateSeparator: SeparatorType;
    TimeSeparator: SeparatorType;
    ListSeparator: SeparatorType;
    CurrencyString: DelphiString;
    ShortDateFormat: DelphiString;
    LongDateFormat: DelphiString;
    TimeAMString: DelphiString;
    TimePMString: DelphiString;
    ShortTimeFormat: DelphiString;
    LongTimeFormat: DelphiString;
    ShortMonthNames: array[1..12] of DelphiString;
    LongMonthNames: array[1..12] of DelphiString;
    ShortDayNames: array[1..7] of DelphiString;
    LongDayNames: array[1..7] of DelphiString;
    TwoDigitYearCenturyWindow: Word;
  end;

  TLocaleOptions = public enum (loInvariantLocale, loUserLocale);

implementation

end.