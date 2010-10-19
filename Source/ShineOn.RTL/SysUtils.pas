// The contents of this file are subject to the Mozilla Public License Version 1.1 (the "License"); 
// you may not use this file except in compliance with the License. You may obtain a copy of the 
// License at http://www.mozilla.org/MPL/ 
// 
// Software distributed under the License is distributed on an "AS IS" basis, WITHOUT WARRANTY OF 
// ANY KIND, either express or implied. See the License for the specificlanguage governing rights and 
// limitations under the License.

namespace ShineOn.Rtl;

interface

uses System,
     System.Collections,
     System.Globalization,
     System.IO,
     System.Runtime.CompilerServices, // for Extension attribute
     System.Text,
     System.Threading,
     System.Windows.Forms;

type
  TReplaceFlags = public flags(ReplaceAll, IgnoreCase);
  TFloatFormat = public enum(ffGeneral, ffExponent, ffFixed, ffNumber, ffCurrency);
  
type
  TOpenedFile = public FileStream;

type
  TEncoding = public System.Text.Encoding;

  [Extension]
  TEncodingExtender = public static sealed class
  public
    [Extension]class function ContainsPreamble(ABuffer, APreamble: TBytes): Boolean;
    [Extension]class function GetBufferEncoding(ABuffer: TBytes; var AEncoding: TEncoding): Integer;
  end;

type
  TBytes = public array of Byte;

type
  TInterfaceRef = &Type;

type
  SysUtils = public sealed class
  private
    class function _CompareText(const S1, S2: String; Culture: CultureInfo): Integer;
    class function FormatBuf(Buffer: System.Text.StringBuilder; const aFormat: String; const Args: array of Object; Provider: IFormatProvider): Cardinal;

    class procedure AdjustFormatProvider(AFormat: NumberFormatInfo; AdjustCurrencyFormat: Boolean; const FormatSettings: TFormatSettings);
    class procedure AdjustFormatProvider(AFormat: DateTimeFormatInfo; FormatSettings: TFormatSettings);
  public
    class function UpperCase(const S: String): String; 
    class function UpperCase(const S: String; LocaleOptions: TLocaleOptions): String; 

    class function LowerCase(const S: String): String;
    class function LowerCase(const S: String; LocaleOptions: TLocaleOptions): String; 

    class function CompareStr(const S1, S2: String): Integer; 
    class function CompareStr(const S1, S2: String; LocaleOptions: TLocaleOptions): Integer; 

    class function SameStr(const S1, S2: String): Boolean; 
    class function SameStr(const S1, S2: String; LocaleOptions: TLocaleOptions): Boolean; 

    class function CompareText(const S1, S2: String): Integer; 
    class function CompareText(const S1, S2: String; LocaleOptions: TLocaleOptions): Integer; 

    class function SameText(const S1, S2: String): Boolean; 
    class function SameText(const S1, S2: String; LocaleOptions: TLocaleOptions): Boolean; 

    class function AnsiUpperCase(S: String): String;
    class function AnsiLowerCase(S: String): String;
    
    class function Format(const AFormatting: String; const AData: array of Object): String;
    class function Format(const AFormatting: String; const AData: array of Object; const AFormatSettings: TFormatSettings): String;
    
    class function AnsiCompareStr(S1, S2: String): Integer;  
    class function AnsiSameStr(S1, S2: String): Boolean;  
    class function AnsiCompareText(S1, S2: String): Integer;
    class function AnsiSameText(S1, S2: String): Boolean;
    class function AnsiStrComp(S1, S2: String): Integer;
    class function AnsiStrIComp(S1, S2: String): Integer;
    class function AnsiStrLComp(S1, S2: String; MaxLen: Cardinal): Integer;
    class function AnsiStrLIComp(S1, S2: String; MaxLen: Cardinal): Integer;
    class function AnsiStrLower(Str: String): String;
    class function AnsiStrUpper(Str: String): String;
    class function AnsiLastChar(S: String): String;
    class function AnsiStrLastChar(P: String): String;
    
    class function WideUpperCase(S: WideString): WideString;
    class function WideLowerCase(S: WideString): WideString;
    class function WideCompareStr(S1, S2: WideString): Integer;
    class function WideSameStr(S1, S2: WideString): Boolean;
    class function WideCompareText(S1, S2: WideString): Integer;
    class function WideSameText(S1, S2: WideString): Boolean;
    
    class function Trim(S: String): String; 
    class function TrimLeft(S: String): String; 
    class function TrimRight(S: String): String; 
    
    class function AnsiPos(const SubS, S: String): Integer;
    
    class function QuotedStr(const S: String): String;
    class function QuotedStr(const S: String; QuoteChar: Char): String;
    
    class function AnsiQuotedStr(const S: String; Quote: Char): String;
    
    class function DequotedStr(const S: String): String;
    class function DequotedStr(const S: String; QuoteChar: Char): String;
    class function DequotedStr(const S: String; QuoteChar: Char; var p: Int32): String;
    
    class function AnsiDequotedStr(const S: String; Quote: Char): String;
    class function AdjustLineBreaks(const S: String; Style: TTextLineBreakStyle): String;
    class function IsValidIdent(const Ident: String; AllowDots: Boolean): Boolean;    

    class function IntToStr(Value: Integer): String; 
    class function IntToHex(Value: Integer; Digits: Integer): String; 
    class function StrToInt(S: String): Integer;
    class function StrToIntDef(S: String; Default: Integer): Integer;
    class function TryStrToInt(S: String; out Value: Integer): Boolean;
    class function StrToInt64(S: String): Int64;
    class function StrToInt64Def(S: String; Default: Int64): Int64;
    class function TryStrToInt64(S: String; out Value: Int64): Boolean;
    class function StrToBool(S:String):Boolean;
    class function BoolToStr(B: Boolean; UseBoolStrs: Boolean): String;
    class function StrToDate(S:String):TDateTime;
    class function StrToDateDef(S:String; Default:TDateTime):TDateTime;
    class function StrToDateTime(S:String):TDateTime;
    class function StrToDateTimeDef(S:String; Default:TDateTime):TDateTime;
    class function StrToTime(S:String):TDateTime;
    class function StrToTimeDef(S:String; Default:TDateTime):TDateTime;

    class function DateToStr(ADate: TDateTime): String;
    class function DateToStr(ADate: TDateTime; ASettings: TFormatSettings): String;

    class function DateTimeToStr(ADateTime: TDateTime): String;
    class function DateTimeToStr(ADateTime: TDateTime; ASettings: TFormatSettings): String;

    class function TimeToStr(ATime:TDateTime):String;
    class procedure FreeAndNil(var Obj);

    class function BytesOf(S: String): TBytes;
    class function StringOf(B: TBytes): String;

    class function FileAge(const FileName: String; out FileDateTime: TDateTime): Boolean;
    class function FileCreate(const FileName: String): TOpenedFile;
    class function FileExists(FileName: String): Boolean;
    class procedure FileClose(Handle: TOpenedFile);
    
    class function FileSetDate(const AFileName: String; AAge: TDateTime): Integer;
    class function FileSetDate(const AFileName: String; AAge: Integer): Integer;

    class function CharInSet(C: Char; const CharSet: TSysCharSet): Boolean;  

    class procedure GetLocaleFormatSettings(LCID: Integer; var FormatSettings: TFormatSettings);

    class function DirectoryExists(Directory: String): Boolean;
    class function ForceDirectories(Dir: String): Boolean;
    class function DeleteFile(FileName: String): Boolean;
    class function RenameFile(OldName, NewName: String): Boolean;
    class function ChangeFileExt(FileName, Extension: String): String;
    class function ChangeFilePath(FileName, Path: String): String;
    class function ExtractFilePath(FileName: String): String;
    class function ExtractFileDir(FileName: String): String;
    class function ExtractFileDrive(FileName: String): String;
    class function ExtractFileName(FileName: String): String;
    class function ExtractFileExt(FileName: String): String;
    class function ExpandFileName(FileName: String): String;
    class function ExpandUNCFileName(FileName: String): String;
    class function ExtractRelativePath(BaseName, DestName: String): String;
    class function ExtractShortPathName(FileName: String): String;
    class function GetCurrentDir: String;
    class function SetCurrentDir(Dir: String): Boolean;
    class function CreateDir(Dir: String): Boolean;
    class function RemoveDir(Dir: String): Boolean;
    class function IsPathDelimiter(S: String; Index: Integer): Boolean;
    class function IsDelimiter(Delimiters, S: String; Index: Integer): Boolean;
    class function IncludeTrailingPathDelimiter(S: String): String;
    [Obsolete('This method has been replaced by IncludeTrailingPathDelimiter')]
    class function IncludeTrailingBackslash(S: String): String; 
    class function ExcludeTrailingPathDelimiter(S: String): String;
    [Obsolete('This method has been replaced by ExcludeTrailingPathDelimiter')]
    class function ExcludeTrailingBackslash(S: String): String;
    class function LastDelimiter(Delimiters, S: String): Integer;
    class function AnsiCompareFileName(S1, S2: String): Integer;
    class function SameFileName(S1, S2: String): Boolean;
    class function AnsiLowerCaseFileName(S: String): String;
    class function AnsiUpperCaseFileName(S: String): String;
    class function AnsiStrPos(Str, SubStr: String): String;
    class function AnsiStrRScan(Str: String; Chr: Char): String;
    class function AnsiStrScan(Str: String; Chr: Char): String;
    class function StringReplace(S, OldPattern, NewPattern: String; Flags: TReplaceFlags): String;
    class function GetEnvironmentVariable(Name: String): String;
    class procedure Sleep(val: Integer);

    class function FormatFloat(AFormat: String; V: Double): String;
    class function FormatFloat(AFormat: String; V: Double; FormatSettings: TFormatSettings): String;

    class function PathDelim: Char;
    class function DirectorySeparator: Char;
    class function DriveDelim: Char;
    class function DriveSeparator: Char;
    class function PathSep: Char;
    class function PathSeparator: Char;

    class function FloatToStr(Value: Extended): String;
    class function FloatToStr(Value: Extended; FormatSettings: TFormatSettings): String;
    class function FloatToStrF(Value: Extended; AFormat: TFloatFormat; Precision, Digits: Integer): String;
    class function FloatToStrF(Value: Extended; AFormat: TFloatFormat; Precision, Digits: Integer; FormatSettings: TFormatSettings ): String;

    class function StrToFloat(S: String; FormatSettings: TFormatSettings): Double;
    class function TryStrToFloat(S: String; out Value: Double; FormatSettings: TFormatSettings): Boolean;
    class function TryStrToFloat(S: String; out Value: Double; Provider: IFormatProvider): Boolean;

    class function Supports(Instance: IInterface; IID: TInterfaceRef): Boolean; 
    class function Supports(Instance: IInterface; IID: TInterfaceRef; out Intf): Boolean; 
    class function Supports(Instance: TObject; IID: TInterfaceRef): Boolean; 
    class function Supports(Instance: TObject; IID: TInterfaceRef; out Intf): Boolean; 
  end;

var
  EmptyStr: String := '';
  
function UpperCase(const S: String): String;public;
function UpperCase(const S: String; LocaleOptions: TLocaleOptions): String;public;

function LowerCase(const S: String): String;public;
function LowerCase(const S: String; LocaleOptions: TLocaleOptions): String;public;

function CompareStr(const S1, S2: String): Integer;public;
function CompareStr(const S1, S2: String; LocaleOptions: TLocaleOptions): Integer;public;

function SameStr(const S1, S2: String): Boolean;public;
function SameStr(const S1, S2: String; LocaleOptions: TLocaleOptions): Boolean;public;

function CompareText(const S1, S2: String): Integer;public;
function CompareText(const S1, S2: String; LocaleOptions: TLocaleOptions): Integer;public;

function SameText(const S1, S2: String): Boolean;public;
function SameText(const S1, S2: String; LocaleOptions: TLocaleOptions): Boolean;public;
   
function AnsiUpperCase(S: String): String;public;
function AnsiLowerCase(S: String): String;public;
function AnsiCompareStr(S1, S2: String): Integer;public;
function AnsiSameStr(S1, S2: String): Boolean;public;
function AnsiCompareText(S1, S2: String): Integer;public;
function AnsiSameText(S1, S2: String): Boolean;public;
function AnsiStrComp(S1, S2: String): Integer;public;
function AnsiStrIComp(S1, S2: String): Integer;public;
function AnsiStrLComp(S1, S2: String; MaxLen: Cardinal): Integer;public;
function AnsiStrLIComp(S1, S2: String; MaxLen: Cardinal): Integer;public;
function AnsiStrLower(aStr: String): String;public;
function AnsiStrUpper(aStr: String): String;public;
function AnsiLastChar(S: String): String;public;
function AnsiStrLastChar(P: String): String;public;

function WideUpperCase(S: WideString): WideString;public;
function WideLowerCase(S: WideString): WideString;public;
function WideCompareStr(S1, S2: WideString): Integer;public;
function WideSameStr(S1, S2: WideString): Boolean;public;
function WideCompareText(S1, S2: WideString): Integer;public;
function WideSameText(S1, S2: WideString): Boolean;public;

function Trim(S: String): String; public;
function TrimLeft(S: String): String; public;
function TrimRight(S: String): String; public;

function AnsiPos(const SubS, S: String): Integer;public;

function QuotedStr(const S: String): String;public;
function QuotedStr(const S: String; QuoteChar: Char): String;public;

function AnsiQuotedStr(const S: String; Quote: Char): String;public;

function DequotedStr(const S: String): String;public;
function DequotedStr(const S: String; QuoteChar: Char): String;public;
function DequotedStr(const S: String; QuoteChar: Char; var p: Int32): String;public;

function AnsiDequotedStr(const S: String; Quote: Char): String;public;

function AdjustLineBreaks(const S: String; Style: TTextLineBreakStyle): String;public;
function IsValidIdent(const Ident: String; AllowDots: Boolean): Boolean;public;

function IntToStr(Value: Integer): String; public;
function IntToHex(Value: Integer; Digits: Integer): String; public;
function StrToInt(S: String): Integer;public;
function StrToIntDef(S: String; Default: Integer): Integer;public;
function TryStrToInt(S: String; out Value: Integer): Boolean;public;
function StrToInt64(S: String): Int64;public;
function StrToInt64Def(S: String; Default: Int64): Int64;public;
function TryStrToInt64(S: String; out Value: Int64): Boolean;public;
function StrToBool(S:String):Boolean;public;
function BoolToStr(B: Boolean; UseBoolStrs: Boolean): String;public;
function StrToDate(S:String):TDateTime;public;
function StrToDateDef(S:String; Default:TDateTime):TDateTime;public;
function StrToDateTime(S:String):TDateTime;public;
function StrToDateTimeDef(S:String; Default:TDateTime):TDateTime;public;
function StrToTime(S:String):TDateTime;public;
function StrToTimeDef(S:String; Default:TDateTime):TDateTime;public;
{function DateToStr(ADate:TDateTime):String;public;
function DateTimeToStr(ADateTime:TDateTime):String;public;
function TimeToStr(ATime:TDateTime):String;public;}
procedure FreeAndNil(var obj);public;
function FileExists(FileName: String): Boolean;public;
function DirectoryExists(Directory: String): Boolean;public;
function ForceDirectories(Dir: String): Boolean;public;
function DeleteFile(FileName: String): Boolean;public;
function RenameFile(OldName, NewName: String): Boolean;public;
function ChangeFileExt(FileName, Extension: String): String;public;
function ExtractFilePath(FileName: String): String;public;
function ExtractFileDir(FileName: String): String;public;
function ExtractFileDrive(FileName: String): String;public;
function ExtractFileName(FileName: String): String;public;
function ExtractFileExt(FileName: String): String;public;
function ExpandFileName(FileName: String): String;public;
function ExpandUNCFileName(FileName: String): String;public;
function ExtractRelativePath(BaseName, DestName: String): String;public;
function ExtractShortPathName(FileName: String): String;public;
function GetCurrentDir: String;public;
function SetCurrentDir(Dir: String): Boolean;public;
function CreateDir(Dir: String): Boolean;public;
function RemoveDir(Dir: String): Boolean;public;
function IsPathDelimiter(S: String; Index: Integer): Boolean;public;
function IsDelimiter(Delimiters, S: String; Index: Integer): Boolean;public;
function IncludeTrailingPathDelimiter(S: String): String;public;
[Obsolete('This method has been replaced by IncludeTrailingPathDelimiter')]
function IncludeTrailingBackslash(S: String): String; public;
function ExcludeTrailingPathDelimiter(S: String): String;public;
[Obsolete('This method has been replaced by ExcludeTrailingPathDelimiter')]
function ExcludeTrailingBackslash(S: String): String;public;
function LastDelimiter(Delimiters, S: String): Integer;public;
function AnsiCompareFileName(S1, S2: String): Integer;public;
function SameFileName(S1, S2: String): Boolean;public;
function AnsiLowerCaseFileName(S: String): String;public;
function AnsiUpperCaseFileName(S: String): String;public;
function AnsiStrPos(aStr, SubStr: String): String;public;
function AnsiStrRScan(aStr: String; Chr: Char): String;public;
function AnsiStrScan(aStr: String; Chr: Char): String;public;
function StringReplace(S, OldPattern, NewPattern: String; Flags: TReplaceFlags): String;public;
function GetEnvironmentVariable(Name: String): String;   public;
procedure Sleep(aVal: Integer);public;

function Format (Const aFormatting: String; Const aData: array of Object ) : String; public;

function PathDelim: Char; public;
function DirectorySeparator: Char; public;
function DriveDelim: Char; public;
function DriveSeparator: Char; public;
function PathSep: Char; public;
function PathSeparator: Char; public;

function BytesOf(S: String): TBytes; public;
function StringOf(B: TBytes): String; public;

function FloatToStr(Value: Extended): String; public;
function FloatToStrF(Value: Extended; AFormat: TFloatFormat; Precision, Digits: Integer): String; public;
function FloatToStrF(Value: Extended; AFormat: TFloatFormat; Precision, Digits: Integer; const FormatSettings: TFormatSettings ): String; public;


implementation

uses
  System.Text, System.Text.RegularExpressions;

class function SysUtils.UpperCase(const S: String): String;
begin
  if S <> nil then
    Result := S.ToUpper
  else
    Result := '';
end;

class function SysUtils.UpperCase(const S: String; LocaleOptions: TLocaleOptions): String;
var
  Culture: CultureInfo;
begin
  if S <> nil then
    begin
      Culture := System.Threading.Thread.CurrentThread.CurrentCulture;
      
      if LocaleOptions = TLocaleOptions.UserLocale then
        Result := S.ToUpper
      else
        Result := S.ToUpper(Culture.InvariantCulture)
    end
  else
    Result := '';
end;

class function SysUtils.LowerCase(const S: String): String;
begin
  if S <> nil then
    Result := S.ToLower
  else
    Result := '';
end;

class function SysUtils.LowerCase(const S: String; LocaleOptions: TLocaleOptions): String;
var
  Culture: CultureInfo;
begin
  if S <> nil then
    begin
      Culture := System.Threading.Thread.CurrentThread.CurrentCulture;

      if LocaleOptions = TLocaleOptions.UserLocale then
        Result := S.ToLower
      else
        Result := S.ToLower(Culture.InvariantCulture)
    end
  else
    Result := '';
end;

class function SysUtils.CompareStr(const S1, S2: String): Integer;
begin
  Result := System.String.Compare(S1,S2,False);
end;

class function SysUtils.CompareStr(const S1, S2: String; LocaleOptions: TLocaleOptions): Integer;
var
  Culture: CultureInfo;
begin
  Culture := System.Threading.Thread.CurrentThread.CurrentCulture;

  if LocaleOptions = TLocaleOptions.UserLocale then
    Result := System.String.Compare(S1, S2, False)
  else
    Result := System.String.Compare(S1,S2,False,Culture.InvariantCulture);
end;

class function SysUtils.SameStr(const S1, S2: String): Boolean;
begin
  Result := (CompareStr(S1,S2) = 0);
end;

class function SysUtils.SameStr(const S1, S2: String; LocaleOptions: TLocaleOptions): Boolean;
begin
  Result := (CompareStr(S1,S2,LocaleOptions) = 0);
end;

class function SysUtils._CompareText(const S1, S2: String; Culture: CultureInfo): Integer;
var
  I, LA, LB: Integer;

begin
  LA := length(S1);
  LB := length(S2);

  for I := 0 to LA - 1 do
    begin
      if I >= LB then
        begin
          Result := 1;
          Exit;
        end;

      Result := ord(System.Char.ToUpper(S1[I],Culture)) - ord(System.Char.ToUpper(S2[I],Culture));

      if Result <> 0 then Exit;
    end;

  Result := LA - LB;
end;

class function SysUtils.CompareText(const S1, S2: String): Integer;
var
  Culture: CultureInfo;
begin
  Culture := System.Threading.Thread.CurrentThread.CurrentCulture;
  Result := _CompareText(S1,S2,Culture);
end;

class function SysUtils.CompareText(const S1, S2: String; LocaleOptions: TLocaleOptions): Integer;
var
  Culture: CultureInfo;
begin
  Culture := System.Threading.Thread.CurrentThread.CurrentCulture;

  if LocaleOptions = TLocaleOptions.UserLocale then
    Result := _CompareText(S1,S2,Culture)
  else
    Result := _CompareText(S1,S2,Culture.InvariantCulture);
end;

class function SysUtils.SameText(const S1, S2: String): Boolean;
begin
  Result := (CompareText(S1,S2) = 0);
end;

class function SysUtils.SameText(const S1, S2: String; LocaleOptions: TLocaleOptions): Boolean;
begin
  Result := (CompareText(S1,S2,LocaleOptions) = 0);
end;

class function SysUtils.AnsiUpperCase(S: String): String;
begin
  if Length(S) = 0 then
    Result := ''
  else
    Result := S.ToUpper
end;

class function SysUtils.AnsiLowerCase(S: String): String;
begin
  if length(S) = 0 then
    Result := ''
  else
    Result := S.ToLower;
end;

class function SysUtils.AnsiCompareStr(S1, S2: String): Integer;
begin
  Result := System.String.Compare(S1,S2, false);
end;

class function SysUtils.AnsiSameStr(S1, S2: String): Boolean;
begin
  Result := AnsiCompareStr(S1, S2) = 0;
end;

class function SysUtils.AnsiCompareText(S1, S2: String): Integer;
begin
  Result := System.String.Compare(S1,S2, true);
end;

class function SysUtils.AnsiSameText(S1, S2: String): Boolean;
begin
  Result := AnsiCompareText(S1, S2) = 0;
end;

class function SysUtils.AnsiStrComp(S1, S2: String): Integer;
begin
  Result := AnsiCompareStr(S1,S2);
end;

class function SysUtils.AnsiStrIComp(S1, S2: String): Integer;
begin
  Result := AnsiCompareText(S1,S2);
end;

class function SysUtils.AnsiStrLComp(S1, S2: String; MaxLen: Cardinal): Integer;
begin
  Result := System.String.Compare(S1, 0, S2, 0, MaxLen, true);
end;

class function SysUtils.AnsiStrLIComp(S1, S2: String; MaxLen: Cardinal): Integer;
begin
  Result := System.String.Compare(S1, 0, S2, 0, MaxLen, false);
end;

class function SysUtils.AnsiStrLower(Str: String): String;
begin
  Result := AnsiLowerCase(Str);
end;

class function SysUtils.AnsiStrUpper(Str: String): String;
begin
  Result := AnsiUpperCase(Str);
end;

class function SysUtils.AnsiLastChar(S: String): String;
begin
  if String.IsNullOrEmpty(S) then
    Result := ''
  else
    Result := S.Substring(S.Length-1);
end;

class function SysUtils.AnsiStrLastChar(P: String): String;
begin
  Result := AnsiLastChar(P);
end;

class function SysUtils.WideUpperCase(S: WideString): WideString;
begin
  Result := AnsiUpperCase(S);
end;

class function SysUtils.WideLowerCase(S: WideString): WideString;
begin
  Result := AnsiLowerCase(S);
end;

class function SysUtils.WideCompareStr(S1, S2: WideString): Integer;
begin
  Result := AnsiCompareStr(S1, S2);
end;

class function SysUtils.WideSameStr(S1, S2: WideString): Boolean;
begin
  Result := AnsiSameStr(S1, S2);
end;

class function SysUtils.WideCompareText(S1, S2: WideString): Integer;
begin
  Result := AnsiCompareText(S1, S2);
end;

class function SysUtils.WideSameText(S1, S2: WideString): Boolean;
begin
  Result := AnsiSameText(S1, S2);
end;

class function SysUtils.Trim(S: String): String; 
begin
  if length(S) = 0 then
    Result := ''
  else
    Result := S.Trim;
end;

class function SysUtils.TrimLeft(S: String): String; 
begin
  if length(S) = 0 then
    Result := ''
  else
    Result := S.TrimStart(nil);
end;

class function SysUtils.TrimRight(S: String): String; 
begin
  if length(S) = 0 then
    Result := ''
  else
    Result := S.TrimEnd(nil);
end;

class function SysUtils.AnsiPos(const SubS, S: String): Integer;
begin
  Result := Pos(SubS,S);
end;

class function SysUtils.QuotedStr(const S: String): String;
begin
  Result := QuotedStr(S,'''');
end;

class function SysUtils.QuotedStr(const S: String; QuoteChar: Char): String;
var 
  I: Integer;
begin
  if String.IsNullOrEmpty(S) then
    Result := QuoteChar + QuoteChar
  else begin
    Result := S;
    for I := Result.Length - 1 downto 0 do
      if Result[I] = QuoteChar then 
        Result := Result.Insert(I, QuoteChar);
    Result := QuoteChar + Result + QuoteChar;
  end;
end;

class function SysUtils.AnsiQuotedStr(const S: String; Quote: Char): String;
begin
  Result := QuotedStr(S,Quote);
end;

class function SysUtils.DequotedStr(const S: String): String;
begin
  Result := DequotedStr(S,'"');
end;

class function SysUtils.DequotedStr(const S: String; QuoteChar: Char): String;
var
  I: Integer;
begin
  // First, remove the outside quotes
  Result := S;
  if not Result.StartsWith(QuoteChar) then 
  begin
    Result := String.Empty;
    Exit;
  end;    
  Result := Result.TrimStart(QuoteChar);
  Result := Result.TrimEnd(QuoteChar);
  // Now remove inside quotes
  for I := 0 to length(Result) - 1 do
    begin
      if Result[I] = QuoteChar then
        begin
          Result := Result.Remove(I, 1);
          Break;
        end;
    end;

  for I := length(Result) - 1 downto 0 do
    begin
      if Result[I] = QuoteChar then
        begin
          Result := Result.Remove(I, 1);
          Break;
        end;
    end;
end;

class function SysUtils.DequotedStr(const S: String; QuoteChar: Char; var p: Int32): String;
var
  DoubleQS: String;
begin
 NotImplemented
end;

class function SysUtils.AnsiDequotedStr(const S: String; Quote: Char): String;
begin
  Result := DequotedStr(S,Quote);
end;

class function SysUtils.AdjustLineBreaks(const S: String; Style: TTextLineBreakStyle): String;
begin
  NotImplemented;
end;

class function SysUtils.IsValidIdent(const Ident: String; AllowDots: Boolean): Boolean;
begin
  Result := False;

  NotImplemented;
end;

class function SysUtils.IntToStr(Value: Integer): String; 
begin
  Result := Value.ToString;
end;

class function SysUtils.IntToHex(Value: Integer; Digits: Integer): String; 
begin
  Result := Value.ToString('X' + Digits.ToString);
end;

class function SysUtils.StrToInt(S: String): Integer;
begin
  if S.StartsWith('$') then
    Result := Int32.Parse(S.Substring(1),NumberStyles.AllowHexSpecifier)
  else
    Result := Int32.Parse(S);
end;

class function SysUtils.StrToIntDef(S: String; Default: Integer): Integer;
begin
  if not TryStrToInt(S, Result) then
    Result := Default;
end;

class function SysUtils.TryStrToInt(S: String; out Value: Integer): Boolean;
begin
  result := Int32.TryParse(S, out Value);
end;

class function SysUtils.StrToInt64(S: String): Int64;
begin
  if S.StartsWith('$') then
    Result := Int64.Parse(S.Substring(1),NumberStyles.AllowHexSpecifier)
  else
    Result := Int64.Parse(S);
end;

class function SysUtils.StrToInt64Def(S: String; Default: Int64): Int64;
begin
  if not TryStrToInt64(S, Result) then
    Result := Default;
end;

class function SysUtils.TryStrToInt64(S: String; out Value: Int64): Boolean;
begin
  result := Int64.TryParse(S, out Value);
end;

class function SysUtils.StrToBool(S:String):Boolean;
begin
  Result := Boolean.Parse(S);
end;

class function SysUtils.BoolToStr(B: Boolean; UseBoolStrs: Boolean): String;
begin
  if UseBoolStrs then
    Result := B.ToString
  else 
  begin
    if B then
      Result := '-1'
    else
      Result := '0';
  end;
end;

class function SysUtils.StrToDate(S:String):TDateTime;
begin
  Result := StrToDateTime(S);
end;

class function SysUtils.StrToDateDef(S:String; Default:TDateTime):TDateTime;
begin
  Result := StrToDateTimeDef(S, Default);
end;

class function SysUtils.StrToDateTime(S:String):TDateTime;
begin
  Result := DateTime.Parse(S);
end;

class function SysUtils.StrToDateTimeDef(S:String; Default:TDateTime):TDateTime;
begin
  var lRes: DateTime;
  if not DateTime.TryParse(S, out lRes) then result := Default else result := lRes;
end;

class function SysUtils.StrToTime(S:String):TDateTime;
begin
  Result := StrToDateTime(S);
end;

class function SysUtils.StrToTimeDef(S:String; Default:TDateTime):TDateTime;
begin
  result := StrToDateTimeDef(S,Default);
end;

class function SysUtils.DateToStr(ADate: TDateTime): String;
begin
  Result := ADate.ToString;
end;

class function SysUtils.DateToStr(ADate: TDateTime; ASettings: TFormatSettings): String;
begin
  var pFormat: DateTimeFormatInfo;
  AdjustFormatProvider(pFormat, ASettings);
  Result := ADate.ToString(pFormat);
end;

class function SysUtils.DateTimeToStr(ADateTime: TDateTime): String;
begin
  Result := ADateTime.ToString;
end;

class function SysUtils.DateTimeToStr(ADateTime: TDateTime; ASettings: TFormatSettings): String;
begin
  var pFormat: DateTimeFormatInfo;
  AdjustFormatProvider(pFormat, ASettings);
  Result := ADateTime.ToString(pFormat);
end;

class function SysUtils.TimeToStr(ATime:TDateTime):String;
begin
  Result := ATime.ToString;
end;

class procedure SysUtils.FreeAndNil(var Obj);
begin
  Obj.Free;
  Obj := nil;
end;

class function SysUtils.FileAge(const FileName: String; out FileDateTime: TDateTime): Boolean;
begin
  Result := FileExists(FileName);
  if Result then
    FileDateTime := System.IO.File.GetLastWriteTime(FileName)
  else
    FileDateTime := DelphiEpoch;
end;

class function SysUtils.FileExists(FileName: String): Boolean;
begin
  Result := System.IO.File.Exists(FileName);
end;

class function SysUtils.DirectoryExists(Directory: String): Boolean;
begin
  Result := System.IO.Directory.Exists(Directory);
end;

class function SysUtils.ForceDirectories(Dir: String): Boolean;
begin
  result := true;
  try
    System.IO.Directory.CreateDirectory(Dir);
  except
    on e: IOException do result := false;
  end;
end;

class function SysUtils.DeleteFile(FileName: String): Boolean;
begin
  result := System.IO.File.Exists(FileName);
  if Result then
  try
    System.IO.File.Delete(FileName);
    Result := not System.IO.File.Exists(FileName);
  except
    on IOException do result := false;
  end;
end;

class function SysUtils.RenameFile(OldName, NewName: String): Boolean;
begin
  Result := System.IO.File.Exists(OldName);
  if result then
  try
    System.IO.File.Move(OldName, NewName);
    result := System.IO.File.Exists(NewName);
  except
    on IOException do result := false;
  end;
end;

class function SysUtils.ChangeFileExt(FileName, Extension: String): String;
begin
  if String.IsNullOrEmpty(FileName) then
    Result := ''
  else
    Result := System.IO.Path.ChangeExtension(FileName, Extension);
end;

class function SysUtils.ExtractFilePath(FileName: String): String;
begin
  Result := IncludeTrailingPathDelimiter(System.IO.Path.GetDirectoryName(FileName));
end;

class function SysUtils.ExtractFileDir(FileName: String): String;
begin
  Result := ExtractFilePath(FileName).TrimEnd([System.IO.Path.DirectorySeparatorChar]);
end;

class function SysUtils.ExtractFileDrive(FileName: String): String;
begin
  Result := System.IO.Path.GetPathRoot(FileName);
end;

class function SysUtils.ExtractFileName(FileName: String): String;
begin
  Result := System.IO.Path.GetFileName(FileName);
end;

class function SysUtils.ExtractFileExt(FileName: String): String;
begin
  Result := System.IO.Path.GetExtension(FileName);
end;

class function SysUtils.ExpandFileName(FileName: String): String;
begin
  Result := System.IO.Path.GetFullPath(FileName);
end;

class function SysUtils.ExpandUNCFileName(FileName: String): String;
begin
  Result := System.IO.Path.GetFullPath(FileName);
end;

class function SysUtils.ExtractRelativePath(BaseName, DestName: String): String;
var
  baseTokens,
  destTokens : array of String;
  baseIdx    : Integer := 1;
  destIdx    : Integer := 1;
  builder    : StringBuilder;
begin
  result := DestName;
  if SameFileName( ExtractFileDrive(BaseName), ExtractFileDrive(DestName) ) then begin
    baseTokens := ExtractFileDir(BaseName).Split([System.IO.Path.DirectorySeparatorChar]);
    destTokens := ExtractFileDir(DestName).Split([System.IO.Path.DirectorySeparatorChar]);
    while (baseIdx < baseTokens.Length) and 
          (destIdx < destTokens.Length) and 
          SameFileName(baseTokens[baseIdx], destTokens[destIdx]) do begin
      inc(baseIdx);
      inc(destIdx);
    end;
    builder := new StringBuilder;
    while baseIdx < baseTokens.Length do begin
      builder.Append( '..' );
      builder.Append( System.IO.Path.DirectorySeparatorChar );
      inc(baseIdx);
    end;
    while destIdx < destTokens.Length do begin
      builder.Append( destTokens[destIdx] );
      builder.Append( System.IO.Path.DirectorySeparatorChar );
      inc(destIdx);
    end;
    builder.Append( ExtractFileName(DestName) );
    result := builder.ToString;
  end;
end;

class function SysUtils.ExtractShortPathName(FileName: String): String;
begin
  Result := System.IO.Path.GetDirectoryName(FileName);
end;

class function SysUtils.GetCurrentDir: String;
begin
  Result := System.IO.Directory.GetCurrentDirectory;
end;

class function SysUtils.SetCurrentDir(Dir: String): Boolean;
begin
  Result := true;
  try
    System.IO.Directory.SetCurrentDirectory(Dir);
  except
    on IOException do result := false;
  end;
end;

class function SysUtils.CreateDir(Dir: String): Boolean;
begin
  Result := true;
  try
    System.IO.Directory.CreateDirectory(Dir);
  except
    on IOException do result := false;
  end;
end;

class function SysUtils.RemoveDir(Dir: String): Boolean;
begin
  Result := true;
  try
    System.IO.Directory.Delete(Dir);
  except
    on IOException do result := false;
  end;
end;

class function SysUtils.IsPathDelimiter(S: String; Index: Integer): Boolean;
begin
  if String.IsNullOrEmpty(S) then
    Result := false
  else
    Result := S[Index] = System.IO.Path.DirectorySeparatorChar;
end;

class function SysUtils.IsDelimiter(Delimiters, S: String; Index: Integer): Boolean;
begin
  if String.IsNullOrEmpty(Delimiters) or String.IsNullOrEmpty(S) then
    Result := false
  else
    Result := Delimiters.IndexOf(S[Index]) >= 0;
end;

class function SysUtils.IncludeTrailingPathDelimiter(S: String): String;
begin
  if String.IsNullOrEmpty(S) then
    Result := ''
  else if not S.EndsWith(System.IO.Path.DirectorySeparatorChar) then
    Result := S + System.IO.Path.DirectorySeparatorChar
  else
    Result := S;
end;

class function SysUtils.IncludeTrailingBackslash(S: String): String; 
begin
  Result := IncludeTrailingPathDelimiter(S);
end;

class function SysUtils.ExcludeTrailingPathDelimiter(S: String): String;
begin
  if String.IsNullOrEmpty(S) then
    Result := ''
  else
    Result := S.TrimEnd([System.IO.Path.DirectorySeparatorChar])
end;

class function SysUtils.ExcludeTrailingBackslash(S: String): String;
begin
  ExcludeTrailingPathDelimiter(S);
end;

class function SysUtils.LastDelimiter(Delimiters, S: String): Integer;
begin
  if String.IsNullOrEmpty(S) or String.IsNullOrEmpty(Delimiters)  then
    Result := -1
  else
    Result := S.LastIndexOfAny(Delimiters.ToCharArray);
end;

class function SysUtils.AnsiCompareFileName(S1, S2: String): Integer;
begin
  Result := AnsiCompareText(S1, S2);
end;

class function SysUtils.SameFileName(S1, S2: String): Boolean;
begin
  Result := AnsiSameText(S1, S2);
end;

class function SysUtils.AnsiLowerCaseFileName(S: String): String;
begin
  Result := AnsiLowerCase(S);
end;

class function SysUtils.AnsiUpperCaseFileName(S: String): String;
begin
  Result := AnsiUpperCase(S);
end;

class function SysUtils.AnsiStrPos(Str, SubStr: String): String;
var i:Int32;
begin
{$IFDEF LegacyStrIndexing}
  i := AnsiPos(SubStr, Str);
  if i > 0 then
    Result := Str.Substring(i - 1)
  else
    Result := nil;
{$ELSE}
  i := AnsiPos(SubStr, Str);
  if i >= 0 then
    Result := Str.Substring(i)  // TODO: should this be + 1?
  else
    Result := nil;
{$ENDIF}
end;

class function SysUtils.AnsiStrRScan(Str: String; Chr: Char): String;
var i:Int32;
begin
  if String.IsNullOrEmpty(Str) then
    Result := nil
  else 
  begin
    i := Str.LastIndexOf(Chr);
    if i >= 0 then
      Result := Str.Substring(i) // TODO: should this be + 1?
    else
      Result := nil;
  end;
end;

class function SysUtils.AnsiStrScan(Str: String; Chr: Char): String;
var i:Int32;
begin
  if String.IsNullOrEmpty(Str) then
    Result := nil
  else
  begin
    i := Str.IndexOf(Chr);
    if i >= 0 then
      Result := Str.Substring(i) // TODO: should this be + 1?
    else
      Result := nil;
  end;
end;

class function SysUtils.StringReplace(S, OldPattern, NewPattern: String;
  Flags: TReplaceFlags): String;
var
  tempRegex: Regex;
begin
  if TReplaceFlags.IgnoreCase in Flags then
  begin
    tempRegex := new Regex(OldPattern, RegexOptions.IgnoreCase);
  end
  else
  begin
    tempRegex := new Regex(OldPattern);
  end;
  if TReplaceFlags.ReplaceAll in Flags then
  begin
   Result := tempRegex.Replace(S,NewPattern);
  end
  else
  begin
    Result := tempRegex.Replace(S,NewPattern,1);
  end;  
end;
 
class function SysUtils.GetEnvironmentVariable(Name: String): String;   
begin
  Result := System.Environment.GetEnvironmentVariable(Name);
end;



class function SysUtils.FormatBuf(Buffer: System.Text.StringBuilder; const aFormat: String; const Args: array of Object; Provider: IFormatProvider): Cardinal;

   procedure Error;
   begin
     raise new FormatException('Invalid Format String');
   end;

var
   s, srclen: Cardinal;
   argIndex: Cardinal;
   fmtSpec: System.Text.StringBuilder;
   argStr, precisionString: String;
begin
   s := 0;
   argIndex := 0;
   srclen := length(aFormat);
   fmtSpec := new System.Text.StringBuilder;

   while s < srclen do
   begin
     if aFormat[s] = '%' then
     begin
       inc(s);
       if s >= srclen then break;
       if aFormat[s] = '%' then
       begin
         Buffer.Append(aFormat[s]);
         inc(s);
         Continue;
       end;

       fmtSpec.Length := 0;
       fmtSpec.Append('{0,');

       if aFormat[s] = '-' then   // width might be first
       begin
         fmtSpec.Append(Char('-'));
         inc(s);
       end;

       if aFormat[s] = '*' then
       begin
         fmtSpec.Append(Args[argIndex]);
         inc(argIndex);
         inc(s);
       end
       else
       begin
         while (s+1 < srclen) and System.Char.IsDigit(aFormat[s]) do
         begin
           fmtSpec.Append(aFormat[s]);
           inc(s);
         end;
       end;

       if s >= srclen then Error;
       
       if aFormat[s] = ':' then
       begin
         inc(s);

         // something got added, it must be the index
         if fmtSpec.Length > 3 then
         begin
           argStr := fmtSpec.ToString(3, fmtSpec.Length - 3);
           argIndex := Int32.Parse(argStr);
           fmtSpec.Length := 3;
         end

         // nothing got added, the index then defaults to zero
         else
           argIndex := 0;

         //  width follows argIndex
         if aFormat[s] = '-' then
         begin
           fmtSpec.Append(Char('-'));
           inc(s);
         end;

         if aFormat[s] = '*' then
         begin
           fmtSpec.Append(Args[argIndex]);
           inc(argIndex);
           inc(s);
         end
         else
         begin
           while (s+1 < srclen) and System.Char.IsDigit(aFormat[s]) do
           begin
             fmtSpec.Append(aFormat[s]);
             inc(s);
           end;
         end;
       end;

       if fmtSpec.Length = 3 then
         fmtSpec.Length := 2;    // remove comma if no width spec was found

       if s >= srclen then Error;
         
       if aFormat[s] = '.' then
       begin
         inc(s);
         if aFormat[s] = '*' then
         begin
          // precisionStart := Convert.ToUInt32(Args[argIndex]);
          // precisionLen := -1;
           precisionString := '';
           inc(argIndex);
           inc(s);
         end
         else
         begin
          // precisionStart := s - 1;
           while (s +1 < srclen) and System.Char.IsDigit(aFormat[s]) do
           begin
             precisionString := precisionString + aFormat[s];
             inc(s);
           end;
          // precisionLen := s - precisionStart - 1;
         end;
       end
       else
       begin
         precisionString := '';
         //precisionStart := 0;
         //precisionLen := 0;
       end;

       fmtSpec.Append(Char(':'));
       case aFormat[s] of
         'd', 'D',
         'u', 'U': fmtSpec.Append(Char('d'));
         'e', 'E',
         'f', 'F',
         'g', 'G',
         'n', 'N': fmtSpec.Append(Char(aFormat[s]));
         'x', 'X': fmtSpec.Append('X');
         'm', 'M': fmtSpec.Append(Char('c'));
         'p', 'P': fmtSpec.Append(Char('X'));
         's', 'S': ;   // no format spec needed for strings
       else
         Error;
       end;

       if precisionString.Length > 0 then 
        // fmtSpec.Append(aFormat, precisionStart, precisionLen)
         fmtSpec.Append(precisionString);
      // else if precisionLen < 0 then
      //   fmtSpec.Append(precisionStart);

       fmtSpec.Append(Char('}'));
       // With THandle being an IntPtr we need to special case
       // IntPtr, since AppendFormat treats an IntPtr as a string.
       if not (Args[argIndex] is IntPtr) then
         Buffer.AppendFormat(Provider, fmtSpec.ToString, [Args[argIndex]])
       else
       begin
         // If running a 32-bit platform, treat it as an Int32,
         // otherwise as an Int64.
         if IntPtr.Size = 4 then
           Buffer.AppendFormat(Provider, fmtSpec.ToString,[IntPtr(Args[argIndex]).ToInt32])
         else
           Buffer.AppendFormat(Provider, fmtSpec.ToString,[IntPtr(Args[argIndex]).ToInt64]);
       end;
       inc(argIndex);
     end
     else
       Buffer.Append(aFormat[s]);

     inc(s);
   end;
   Result := Buffer.Length;
end;

class function SysUtils.Format(const AFormatting: String; const AData: array of Object): String; 
var
  fsb: StringBuilder;
begin
  fsb := new StringBuilder(length(AFormatting) * 2);
  FormatBuf(fsb, AFormatting, AData, System.Threading.Thread.CurrentThread.CurrentCulture.NumberFormat.Clone as IFormatProvider);
  result := fsb.ToString;
end;

class function SysUtils.Format(const AFormatting: String; const AData: array of Object; const AFormatSettings: TFormatSettings): String;
var
  pBuilder: StringBuilder;
  pFormat: NumberFormatInfo;
begin
  pFormat := NumberFormatInfo(System.Threading.Thread.CurrentThread.CurrentCulture.NumberFormat.Clone);
  AdjustFormatProvider(pFormat, True, AFormatSettings);
  pBuilder := new StringBuilder(length(AFormatting) * 2);
  FormatBuf(pBuilder, AFormatting, AData, pFormat as IFormatProvider);
  result := pBuilder.ToString;
end;

class procedure SysUtils.Sleep(val: Integer);
begin
  Thread.Sleep(val);
end;

function AdjustCommaInFormat(const aFormat: String): String;
var
   I, Removed, LCommaPos: Integer;
   C: Char;
   FoundComma, CommaInResult, BeforeDecimal, Scientific: Boolean;
begin
   Result := aFormat;
   Scientific := False;
   FoundComma := False;
   CommaInResult := False;
   BeforeDecimal := True;
   Removed := 0;
   LCommaPos := 0;
   I := 0;
   while I < length(aFormat) do
   begin
     C := aFormat[I];
     case C of
       '.':
         BeforeDecimal := False;
       '''', '"':
         repeat
           inc(I);
         until (I+1 > length(aFormat)) or (aFormat[I] <> C);
       'e', 'E':
         Scientific := True;
       ',':
         begin
           LCommaPos := I;
           FoundComma := True;
           if (not BeforeDecimal) or (CommaInResult) or
               (I = 1) or
               ((aFormat[I - 1] <> '0') and (aFormat[I - 1] <> '#')) or
               (I+1 = length(aFormat)) or
               ((aFormat[I + 1] <> '0') and (aFormat[I + 1] <> '#')) then
           begin
             Result := Result.Remove(I - Removed, 1);
             Removed := Removed + 1;
           end
           else
             CommaInResult := True; // this one is ok
         end;
       '%':
         begin
           Result := Result.Insert(I, '\');
           inc(I);
         end;
     end;
     inc(I);
   end;
   if FoundComma and (not CommaInResult) and (not Scientific) then
     if (Result[0] = '0') or (Result[0] = '#') then
       Result := '#,' + Result
     else
       Result := Result.Insert(LCommaPos, '#,#');
end;


class function SysUtils.FormatFloat(AFormat: String; V: Double): String;
begin
  Result := Double(V).ToString(AdjustCommaInFormat(AFormat), System.Threading.Thread.CurrentThread.CurrentCulture.NumberFormat);
end;

class function SysUtils.FormatFloat(AFormat: String; V: Double; FormatSettings: TFormatSettings): String;
begin
  var LFormat: NumberFormatInfo := NumberFormatInfo(System.Threading.Thread.CurrentThread.CurrentCulture.NumberFormat.Clone);
  AdjustFormatProvider(LFormat, False, FormatSettings);
  Result := Double(V).ToString(AdjustCommaInFormat(AFormat), LFormat);
end;

class function SysUtils.PathDelim: Char;
begin
  result := Path.PathSeparator;
end;

class function SysUtils.DirectorySeparator: Char;
begin
  result := Path.PathSeparator;
end;

class function SysUtils.DriveDelim: Char;
begin
  result := Path.VolumeSeparatorChar;
end;

class function SysUtils.DriveSeparator: Char;
begin
  result := Path.VolumeSeparatorChar;
end;

class function SysUtils.PathSep: Char;
begin
  result := Path.PathSeparator;
end;

class function SysUtils.PathSeparator: Char;
begin
  result := Path.PathSeparator;
end;

class function SysUtils.FileCreate(const FileName: String): TOpenedFile;
begin
  result := System.IO.File.Open(FileName, System.IO.FileMode.&Create);
end;

class procedure SysUtils.FileClose(Handle: TOpenedFile);
begin
  if Handle <> nil then
    Handle.Close();
end;

class function SysUtils.FileSetDate(const AFileName: String; AAge: TDateTime): Integer;
begin
  result := 0;
  try
    System.IO.File.SetLastWriteTime(AFileName, AAge);
  except
    on E: Exception do
      result := 1;    
  end;
end;

class function SysUtils.FileSetDate(const AFileName: String; AAge: Integer): Integer;
begin
  Result := FileSetDate(AFileName, FileDateToDateTime(AAge));
end;

class function SysUtils.ChangeFilePath(FileName, Path: String): String;
begin
  result := IncludeTrailingPathDelimiter(Path) + ExtractFileName(FileName);
end;


class function SysUtils.CharInSet(C: Char; const CharSet: TSysCharSet): Boolean;
begin
  result := C in CharSet;
end;

class procedure SysUtils.GetLocaleFormatSettings(LCID: Integer; var FormatSettings: TFormatSettings);
var
  iCount: Integer;
  pInfo: CultureInfo;
begin
  pInfo := CultureInfo.Create(System.Threading.Thread.CurrentThread.CurrentCulture.LCID);
  FormatSettings.CurrencyString := pInfo.NumberFormat.CurrencySymbol;
  FormatSettings.CurrencyFormat := pInfo.NumberFormat.CurrencyPositivePattern;
  FormatSettings.NegCurrFormat := pInfo.NumberFormat.CurrencyNegativePattern;
  FormatSettings.ThousandSeparator := pInfo.NumberFormat.NumberGroupSeparator;
  FormatSettings.DecimalSeparator := pInfo.NumberFormat.NumberDecimalSeparator;
  FormatSettings.CurrencyDecimals := pInfo.NumberFormat.CurrencyDecimalDigits;

  FormatSettings.DateSeparator := pInfo.DateTimeFormat.DateSeparator;
  FormatSettings.ShortDateFormat := ConvertClrDateTimeFormat(pInfo.DateTimeFormat.ShortDatePattern);
  FormatSettings.LongDateFormat := ConvertClrDateTimeFormat(pInfo.DateTimeFormat.LongDatePattern);
  FormatSettings.TimeSeparator := pInfo.DateTimeFormat.TimeSeparator;
  FormatSettings.TimeAMString := pInfo.DateTimeFormat.AMDesignator;
  FormatSettings.TimePMString := pInfo.DateTimeFormat.PMDesignator;
  FormatSettings.ShortTimeFormat := ConvertClrDateTimeFormat(pInfo.DateTimeFormat.ShortTimePattern);
  FormatSettings.LongTimeFormat := ConvertClrDateTimeFormat(pInfo.DateTimeFormat.LongTimePattern);
  for iCount := 0 to MonthsPerYear - 1 do
  begin
    FormatSettings.ShortMonthNames[iCount + 1] := pInfo.DateTimeFormat.AbbreviatedMonthNames[iCount];
    FormatSettings.LongMonthNames[iCount + 1] := pInfo.DateTimeFormat.MonthNames[iCount];
  end;
  for iCount := 0 to DaysPerWeek -1  do
  begin
    FormatSettings.ShortDayNames[iCount + 1] := pInfo.DateTimeFormat.AbbreviatedDayNames[iCount];
    FormatSettings.LongDayNames[iCount + 1] := pInfo.DateTimeFormat.DayNames[iCount];
  end;

  ListSeparator := pInfo.TextInfo.ListSeparator;
end;          

class procedure SysUtils.AdjustFormatProvider(AFormat: NumberFormatInfo; AdjustCurrencyFormat: Boolean; const FormatSettings: TFormatSettings);
begin
  if AFormat.CurrencyDecimalSeparator <> FormatSettings.DecimalSeparator then
    AFormat.CurrencyDecimalSeparator := FormatSettings.DecimalSeparator;
  if AFormat.CurrencyGroupSeparator <> FormatSettings.ThousandSeparator then
    AFormat.CurrencyGroupSeparator := FormatSettings.ThousandSeparator;
  if AFormat.NumberDecimalSeparator <> FormatSettings.DecimalSeparator then
    AFormat.NumberDecimalSeparator := FormatSettings.DecimalSeparator;
  if AFormat.NumberGroupSeparator <> FormatSettings.ThousandSeparator then
    AFormat.NumberGroupSeparator := FormatSettings.ThousandSeparator;

  if AdjustCurrencyFormat then
  begin
    if AFormat.CurrencySymbol <> FormatSettings.CurrencyString then
      AFormat.CurrencySymbol := FormatSettings.CurrencyString;
    if AFormat.CurrencyPositivePattern <> FormatSettings.CurrencyFormat then
      AFormat.CurrencyPositivePattern := FormatSettings.CurrencyFormat;
    if AFormat.CurrencyNegativePattern <> FormatSettings.NegCurrFormat then
      AFormat.CurrencyNegativePattern := FormatSettings.NegCurrFormat;
  end;
end;

class procedure SysUtils.AdjustFormatProvider(AFormat: DateTimeFormatInfo; FormatSettings: TFormatSettings);
begin
  NotImplemented;
end;

class function SysUtils.FloatToStr(Value: Extended): String;
begin
  Result := FloatToStrF(Value, TFloatFormat.ffGeneral, 15, 0);
end;

class function SysUtils.FloatToStr(Value: Extended; FormatSettings: TFormatSettings): String;
begin
  Result := FloatToStrF(Value, TFloatFormat.ffGeneral, 15, 0, FormatSettings);
end;

class function SysUtils.FloatToStrF(Value: Extended; AFormat: TFloatFormat; Precision, Digits: Integer): String;
begin
  var formatChar: Char;
  case AFormat of
    TFloatFormat.ffCurrency: formatChar := 'C';
    TFloatFormat.ffExponent: formatChar := 'E';
    TFloatFormat.ffFixed: formatChar := 'f';
    TFloatFormat.ffGeneral: formatChar := 'G';
    TFloatFormat.ffNumber: formatChar := 'N';
  end;
  result := String.Format('{0,' + Precision.ToString + ':' + formatChar + Digits.ToString +  '}', Value);
  result := String.Format('{0:00.0000}', Value);
end;

class function SysUtils.FloatToStrF(Value: Extended; AFormat: TFloatFormat; Precision, Digits: Integer; FormatSettings: TFormatSettings ): String;
begin
  var formatChar: Char;
  case AFormat of
    TFloatFormat.ffCurrency: formatChar := 'C';
    TFloatFormat.ffExponent: formatChar := 'E';
    TFloatFormat.ffFixed: formatChar := 'f';
    TFloatFormat.ffGeneral: formatChar := 'G';
    TFloatFormat.ffNumber: formatChar := 'N';
  end;
  var LFormat: NumberFormatInfo := NumberFormatInfo(System.Threading.Thread.CurrentThread.CurrentCulture.NumberFormat.Clone);
  AdjustFormatProvider(LFormat, False, FormatSettings);

  result := String.Format(LFormat, '{0,' + Precision.ToString + ':' + formatChar + Digits.ToString +  '}', Value);
  result := String.Format(LFormat, '{0:00.0000}', Value);
end;

class function SysUtils.BytesOf(S: String): TBytes;
begin
  Result := TEncoding.Unicode.GetBytes(S);
end;

class function SysUtils.StringOf(B: TBytes): String;
begin
  Result := TEncoding.Unicode.GetString(B);
end;

class function SysUtils.Supports(Instance: IInterface; IID: TInterfaceRef): Boolean;
begin
  var pInst: TObject;
  exit Supports(Instance as TObject, IID, pInst);
end;

class function SysUtils.Supports(Instance: IInterface; IID: TInterfaceRef; out Intf): Boolean;
begin
  exit Supports(Instance as TObject, IID, Intf);
end;

class function SysUtils.Supports(Instance: TObject; IID: TInterfaceRef): Boolean;
begin
  var pInst: TObject;
  exit Supports(Instance as TObject, IID, pInst);
end;

class function SysUtils.Supports(Instance: TObject; IID: TInterfaceRef; out Intf): Boolean;
begin
  if Instance = nil then
  begin
    Intf := nil;
    exit False;
  end;

  var pInstanceType: &Type := Instance.GetType;
  var pInstanceTypes: array of &Type := pInstanceType.GetInterfaces;
  for each pType: &Type in pInstanceTypes do 
  begin
    if pType.Equals(IID) then
    begin
      Intf := Instance;
      exit True;
    end;
  end;

  Intf := nil;
  exit False;
end;

class function SysUtils.TryStrToFloat(S: String; out Value: Double; Provider: IFormatProvider): Boolean;
begin
  Result := System.Double.TryParse(S, NumberStyles.Float, Provider, Value);
end;

class function SysUtils.TryStrToFloat(S: String; out Value: Double; FormatSettings: TFormatSettings): Boolean;
var
  LFormat: NumberFormatInfo;
begin
  LFormat := NumberFormatInfo(System.Threading.Thread.CurrentThread.CurrentCulture.NumberFormat.Clone);
  AdjustFormatProvider(LFormat, False, FormatSettings);
  Result := TryStrToFloat(S, Value, LFormat);
end;

class function SysUtils.StrToFloat(S: String; FormatSettings: TFormatSettings): Double;
var
  Value: Double;
begin
  if not TryStrToFloat(S, Value, FormatSettings) then
    ConvertErrorFmt(SInvalidFloat, [S]);
  Result := Value;
end;

// DELPHI COMPATIBLE GLOBAL METHODS

function BytesOf(S: String): TBytes;
begin
  Result := ShineOn.Rtl.SysUtils.BytesOf(S);
end;

function StringOf(B: TBytes): String;
begin
  Result := ShineOn.Rtl.SysUtils.StringOf(B);
end;

function FloatToStr(Value: Extended): String;
begin
  result := ShineOn.Rtl.SysUtils.FloatToStr(Value);
end;

function FloatToStrF(Value: Extended; AFormat: TFloatFormat; Precision, Digits: Integer): String;
begin
  result := ShineOn.Rtl.SysUtils.FloatToStrF(Value, AFormat, Precision, Digits);
end;

function FloatToStrF(Value: Extended; AFormat: TFloatFormat; Precision, Digits: Integer; const FormatSettings: TFormatSettings ): String;
begin
  result := ShineOn.Rtl.SysUtils.FloatToStrF(Value, AFormat, Precision, Digits, FormatSettings);
end;

procedure Sleep(aVal: Integer);
begin
  ShineOn.Rtl.SysUtils.Sleep(aVal);
end;

function Format (Const aFormatting: String; Const aData: array of Object ) : String;
begin
  result := ShineOn.Rtl.SysUtils.Format(aFormatting, aData);
end;

function UpperCase(const S: String): String;
begin
  Result := ShineOn.Rtl.SysUtils.UpperCase(S);
end;

function UpperCase(const S: String; LocaleOptions: TLocaleOptions): String;
begin
  Result := ShineOn.Rtl.SysUtils.UpperCase(S,LocaleOptions);
end;

function LowerCase(const S: String): String;
begin
  Result := ShineOn.Rtl.SysUtils.LowerCase(S);
end;

function LowerCase(const S: String; LocaleOptions: TLocaleOptions): String;
begin
  Result := ShineOn.Rtl.SysUtils.LowerCase(S,LocaleOptions);
end;

function CompareStr(const S1, S2: String): Integer;
begin
  Result := ShineOn.Rtl.SysUtils.CompareStr(S1,S2);
end;

function CompareStr(const S1, S2: String; LocaleOptions: TLocaleOptions): Integer;
begin
  Result := ShineOn.Rtl.SysUtils.CompareStr(S1,S2,LocaleOptions);
end;

function SameStr(const S1, S2: String): Boolean;
begin
  Result := ShineOn.Rtl.SysUtils.SameStr(S1,S2);
end;

function SameStr(const S1, S2: String; LocaleOptions: TLocaleOptions): Boolean;
begin
  Result := ShineOn.Rtl.SysUtils.SameStr(S1,S2,LocaleOptions);
end;

function CompareText(const S1, S2: String): Integer;
begin
  Result := ShineOn.Rtl.SysUtils.CompareText(S1,S2);
end;

function CompareText(const S1, S2: String; LocaleOptions: TLocaleOptions): Integer;
begin
  Result := ShineOn.Rtl.SysUtils.CompareText(S1,S2,LocaleOptions);
end;

function SameText(const S1, S2: String): Boolean;
begin
  Result := ShineOn.Rtl.SysUtils.SameText(S1,S2);
end;

function SameText(const S1, S2: String; LocaleOptions: TLocaleOptions): Boolean;
begin
  Result := ShineOn.Rtl.SysUtils.SameText(S1,S2,LocaleOptions);
end;

function AnsiUpperCase(S: String): String;
begin
  Result := ShineOn.Rtl.SysUtils.AnsiUpperCase(S);
end;
  
function AnsiLowerCase(S: String): String;
begin
  Result := ShineOn.Rtl.SysUtils.AnsiLowerCase(S);
end;
  
function AnsiCompareStr(S1, S2: String): Integer;
begin
  Result := ShineOn.Rtl.SysUtils.AnsiCompareStr(S1, S2);
end;
  
function AnsiSameStr(S1, S2: String): Boolean;
begin
  Result := ShineOn.Rtl.SysUtils.AnsiSameStr(S1, S2);
end;
  
function AnsiCompareText(S1, S2: String): Integer;
begin
  Result := ShineOn.Rtl.SysUtils.AnsiCompareText(S1, S2);
end;
  
function AnsiSameText(S1, S2: String): Boolean;
begin
  Result := ShineOn.Rtl.SysUtils.AnsiSameText(S1, S2);
end;
  
function AnsiStrComp(S1, S2: String): Integer;
begin
  Result := ShineOn.Rtl.SysUtils.AnsiStrComp(S1, S2);
end;
  
function AnsiStrIComp(S1, S2: String): Integer;
begin
  Result := ShineOn.Rtl.SysUtils.AnsiStrIComp(S1, S2);
end;
  
function AnsiStrLComp(S1, S2: String; MaxLen: Cardinal): Integer;
begin
  Result := ShineOn.Rtl.SysUtils.AnsiStrLComp(S1, S2, MaxLen);
end;
  
function AnsiStrLIComp(S1, S2: String; MaxLen: Cardinal): Integer;
begin
  Result := ShineOn.Rtl.SysUtils.AnsiStrLIComp(S1, S2, MaxLen);
end;
  
function AnsiStrLower(aStr: String): String;
begin
  Result := ShineOn.Rtl.SysUtils.AnsiStrLower(aStr);
end;
  
function AnsiStrUpper(aStr: String): String;
begin
  Result := ShineOn.Rtl.SysUtils.AnsiStrUpper(aStr);
end;
  
function AnsiLastChar(S: String): String;
begin
  Result := ShineOn.Rtl.SysUtils.AnsiLastChar(S);
end;
  
function AnsiStrLastChar(P: String): String;
begin
  Result := ShineOn.Rtl.SysUtils.AnsiStrLastChar(P);
end;
  
function WideUpperCase(S: WideString): WideString;
begin
  Result := ShineOn.Rtl.SysUtils.WideUpperCase(S);
end;
  
function WideLowerCase(S: WideString): WideString;
begin
  Result := ShineOn.Rtl.SysUtils.WideLowerCase(S);
end;
  
function WideCompareStr(S1, S2: WideString): Integer;
begin
  Result := ShineOn.Rtl.SysUtils.WideCompareStr(S1, S2);
end;
  
function WideSameStr(S1, S2: WideString): Boolean;
begin
  Result := ShineOn.Rtl.SysUtils.WideSameStr(S1, S2);
end;
  
function WideCompareText(S1, S2: WideString): Integer;
begin
  Result := ShineOn.Rtl.SysUtils.WideCompareText(S1, S2);
end;
  
function WideSameText(S1, S2: WideString): Boolean;
begin
  Result := ShineOn.Rtl.SysUtils.WideSameText(S1, S2);
end;
  
function Trim(S: String): String; 
begin
  Result := ShineOn.Rtl.SysUtils.Trim(S);
end;
  
function TrimLeft(S: String): String; 
begin
  Result := ShineOn.Rtl.SysUtils.TrimLeft(S);
end;
  
function TrimRight(S: String): String; 
begin
  Result := ShineOn.Rtl.SysUtils.TrimRight(S);
end;

function AnsiPos(const SubS, S: String): Integer;
begin
  Result := ShineOn.Rtl.SysUtils.AnsiPos(SubS,S);
end;

function QuotedStr(const S: String): String;
begin
  Result := ShineOn.Rtl.SysUtils.QuotedStr(S);
end;

function QuotedStr(const S: String; QuoteChar: Char): String;
begin
  Result := ShineOn.Rtl.SysUtils.QuotedStr(S,QuoteChar);
end;

function AnsiQuotedStr(const S: String; Quote: Char): String;
begin
  Result := ShineOn.Rtl.SysUtils.AnsiQuotedStr(S,Quote);
end;

function DequotedStr(const S: String): String;
begin
  Result := ShineOn.Rtl.SysUtils.DequotedStr(S);
end;

function DequotedStr(const S: String; QuoteChar: Char): String;
begin
  Result := ShineOn.Rtl.SysUtils.DequotedStr(S,QuoteChar);
end;

function DequotedStr(const S: String; QuoteChar: Char; var p: Int32): String;
begin
  Result := ShineOn.Rtl.SysUtils.DequotedStr(S,QuoteChar,p);
end;

function AnsiDequotedStr(const S: String; Quote: Char): String;
begin
  Result := ShineOn.Rtl.SysUtils.AnsiDequotedStr(S,Quote);
end;

function AdjustLineBreaks(const S: String; Style: TTextLineBreakStyle): String;
begin
  Result := ShineOn.Rtl.SysUtils.AdjustLineBreaks(S,Style);
end;

function IsValidIdent(const Ident: String; AllowDots: Boolean): Boolean;
begin
  Result := ShineOn.Rtl.SysUtils.IsValidIdent(Ident,AllowDots);
end;

function IntToStr(Value: Integer): String; 
begin
  Result := ShineOn.Rtl.SysUtils.IntToStr(Value);
end;
  
function IntToHex(Value: Integer; Digits: Integer): String; 
begin
  Result := ShineOn.Rtl.SysUtils.IntToHex(Value, Digits);
end;
  
function StrToInt(S: String): Integer;
begin
  Result := ShineOn.Rtl.SysUtils.StrToInt(S);
end;
  
function StrToIntDef(S: String; Default: Integer): Integer;
begin
  Result := ShineOn.Rtl.SysUtils.StrToIntDef(S, Default);
end;
  
function TryStrToInt(S: String; out Value: Integer): Boolean;
begin
  Result := ShineOn.Rtl.SysUtils.TryStrToInt(S, Value);
end;
  
function StrToInt64(S: String): Int64;
begin
  Result := ShineOn.Rtl.SysUtils.StrToInt64(S);
end;
  
function StrToInt64Def(S: String; Default: Int64): Int64;
begin
  Result := ShineOn.Rtl.SysUtils.StrToInt64Def(S, Default);
end;
  
function TryStrToInt64(S: String; out Value: Int64): Boolean;
begin
  Result := ShineOn.Rtl.SysUtils.TryStrToInt64(S, Value);
end;
  
function StrToBool(S:String):Boolean;
begin
  Result := ShineOn.Rtl.SysUtils.StrToBool(S);
end;
  
function BoolToStr(B: Boolean; UseBoolStrs: Boolean): String;
begin
  Result := ShineOn.Rtl.SysUtils.BoolToStr(B, UseBoolStrs);
end;
  
function StrToDate(S:String):TDateTime;
begin
  Result := ShineOn.Rtl.SysUtils.StrToDate(S);
end;
  
function StrToDateDef(S:String; Default:TDateTime):TDateTime;
begin
  Result := ShineOn.Rtl.SysUtils.StrToDateDef(S, Default);
end;
  
function StrToDateTime(S:String):TDateTime;
begin
  Result := ShineOn.Rtl.SysUtils.StrToDateTime(S);
end;
  
function StrToDateTimeDef(S:String; Default:TDateTime):TDateTime;
begin
  Result := ShineOn.Rtl.SysUtils.StrToDateTimeDef(S, Default);
end;
  
function StrToTime(S:String):TDateTime;
begin
  Result := ShineOn.Rtl.SysUtils.StrToTime(S);
end;
  
function StrToTimeDef(S:String; Default:TDateTime):TDateTime;
begin
  Result := ShineOn.Rtl.SysUtils.StrToTimeDef(S, Default);
end;
  
function DateToStr(ADate:TDateTime):String;
begin
  Result := ShineOn.Rtl.SysUtils.DateToStr(ADate);
end;
  
function DateTimeToStr(ADateTime: TDateTime): String;
begin
  Result := ShineOn.Rtl.SysUtils.DateTimeToStr(ADateTime);
end;
  
function TimeToStr(ATime:TDateTime):String;
begin
  Result := ShineOn.Rtl.SysUtils.TimeToStr(ATime);
end;
  
procedure FreeAndNil(var obj);
begin
  ShineOn.Rtl.SysUtils.FreeAndNil(obj);
end;
  
function FileExists(FileName: String): Boolean;
begin
  Result := ShineOn.Rtl.SysUtils.FileExists(FileName); 
end;
  
function DirectoryExists(Directory: String): Boolean;
begin
  Result := ShineOn.Rtl.SysUtils.DirectoryExists(Directory);
end;
  
function ForceDirectories(Dir: String): Boolean;
begin
  Result := ShineOn.Rtl.SysUtils.ForceDirectories(Dir);
end;
  
function DeleteFile(FileName: String): Boolean;
begin
  Result := ShineOn.Rtl.SysUtils.DeleteFile(FileName)
end;
  
function RenameFile(OldName, NewName: String): Boolean;
begin
  Result := ShineOn.Rtl.SysUtils.RenameFile(OldName, NewName);
end;
  
function ChangeFileExt(FileName, Extension: String): String;
begin
  Result := ShineOn.Rtl.SysUtils.ChangeFileExt(FileName, Extension);
end;
  
function ExtractFilePath(FileName: String): String;
begin
  Result := ShineOn.Rtl.SysUtils.ExtractFilePath(FileName)
end;
  
function ExtractFileDir(FileName: String): String;
begin
  Result := ShineOn.Rtl.SysUtils.ExtractFileDir(FileName)
end;
  
function ExtractFileDrive(FileName: String): String;
begin
  Result := ShineOn.Rtl.SysUtils.ExtractFileDrive(FileName)
end;
  
function ExtractFileName(FileName: String): String;
begin
  Result := ShineOn.Rtl.SysUtils.ExtractFileName(FileName)
end;
  
function ExtractFileExt(FileName: String): String;
begin
  Result := ShineOn.Rtl.SysUtils.ExtractFileExt(FileName)
end;
  
function ExpandFileName(FileName: String): String;
begin
  Result := ShineOn.Rtl.SysUtils.ExpandFileName(FileName)
end;
  
function ExpandUNCFileName(FileName: String): String;
begin
  Result := ShineOn.Rtl.SysUtils.ExpandUNCFileName(FileName)
end;
  
function ExtractRelativePath(BaseName, DestName: String): String;
begin
  Result := ShineOn.Rtl.SysUtils.ExtractRelativePath(BaseName, DestName);
end;
  
function ExtractShortPathName(FileName: String): String;
begin
  Result := ShineOn.Rtl.SysUtils.ExtractShortPathName(FileName);
end;
  
function GetCurrentDir: String;
begin
  Result := ShineOn.Rtl.SysUtils.GetCurrentDir;
end;
  
function SetCurrentDir(Dir: String): Boolean;
begin
  Result := ShineOn.Rtl.SysUtils.SetCurrentDir(Dir);
end;
  
function CreateDir(Dir: String): Boolean;
begin
  Result := ShineOn.Rtl.SysUtils.CreateDir(Dir);
end;
  
function RemoveDir(Dir: String): Boolean;
begin
  Result := ShineOn.Rtl.SysUtils.RemoveDir(Dir);
end;
  
  function IsPathDelimiter(S: String; Index: Integer): Boolean;
begin
  Result := ShineOn.Rtl.SysUtils.IsPathDelimiter(S, Index);
end;
  
function IsDelimiter(Delimiters, S: String; Index: Integer): Boolean;
begin
  Result := ShineOn.Rtl.SysUtils.IsDelimiter(Delimiters, S, Index);
end;
  
function IncludeTrailingPathDelimiter(S: String): String;
begin
  Result := ShineOn.Rtl.SysUtils.IncludeTrailingPathDelimiter(S);
end;
  
function IncludeTrailingBackslash(S: String): String; 
begin
  Result := ShineOn.Rtl.SysUtils.IncludeTrailingPathDelimiter(S);
end;
  
function ExcludeTrailingPathDelimiter(S: String): String;
begin
  Result := ShineOn.Rtl.SysUtils.ExcludeTrailingPathDelimiter(S);
end;
  
function ExcludeTrailingBackslash(S: String): String;
begin
  Result := ShineOn.Rtl.SysUtils.ExcludeTrailingPathDelimiter(S);
end;
  
function LastDelimiter(Delimiters, S: String): Integer;
begin
  Result := ShineOn.Rtl.SysUtils.LastDelimiter(Delimiters, S);
end;
  
function AnsiCompareFileName(S1, S2: String): Integer;
begin
  Result := ShineOn.Rtl.SysUtils.AnsiCompareFileName(S1, S2);
end;
  
function SameFileName(S1, S2: String): Boolean;
begin
  Result := ShineOn.Rtl.SysUtils.SameFileName(S1, S2);
end;
  
function AnsiLowerCaseFileName(S: String): String;
begin
  Result := ShineOn.Rtl.SysUtils.AnsiLowerCaseFileName(S);
end;
  
function AnsiUpperCaseFileName(S: String): String;
begin
  Result := ShineOn.Rtl.SysUtils.AnsiUpperCaseFileName(S);
end;

function AnsiStrPos(aStr, SubStr: String): String;
begin
  Result := ShineOn.Rtl.SysUtils.AnsiStrPos(aStr, SubStr);
end;
  
function AnsiStrRScan(aStr: String; Chr: Char): String;
begin
  Result := ShineOn.Rtl.SysUtils.AnsiStrRScan(aStr, Chr);
end;
  
function AnsiStrScan(aStr: String; Chr: Char): String;
begin
  Result := ShineOn.Rtl.SysUtils.AnsiStrScan(aStr, Chr);
end;
  
function StringReplace(S, OldPattern, NewPattern: String; Flags: TReplaceFlags): String;
begin
  Result := ShineOn.Rtl.SysUtils.StringReplace(S, OldPattern, NewPattern, Flags);
end;
  
function GetEnvironmentVariable(Name: String): String;   
begin
  Result := ShineOn.Rtl.SysUtils.GetEnvironmentVariable(Name);
end;

function PathDelim: Char;
begin
  Result := ShineOn.Rtl.SysUtils.PathDelim;
end;

function DirectorySeparator: Char;
begin
  Result := ShineOn.Rtl.SysUtils.DirectorySeparator;
end;

function DriveDelim: Char;
begin
  Result := ShineOn.Rtl.SysUtils.DriveDelim;
end;

function DriveSeparator: Char;
begin
  Result := ShineOn.Rtl.SysUtils.DriveSeparator;
end;

function PathSep: Char;
begin
  Result := ShineOn.Rtl.SysUtils.PathSep;
end;

function PathSeparator: Char;  
begin
  Result := ShineOn.Rtl.SysUtils.PathSeparator;
end;

{ TEncodingExtender }  

class function TEncodingExtender.ContainsPreamble(ABuffer, APreamble: TBytes): Boolean;
var
  I: Integer;
begin
  if (APreamble = nil) or (APreamble.Length > ABuffer.Length) then
    exit(False);

  for I := 0 to APreamble.Length - 1 do
  begin
    if APreamble[I] <> ABuffer[I] then
      exit(False);
  end;
  exit(True);
end;

class function TEncodingExtender.GetBufferEncoding(ABuffer: TBytes; var AEncoding: TEncoding): Integer;
var
  pPreamble: TBytes;
begin
  Result := 0;
  if AEncoding = nil then
  begin
    if ContainsPreamble(ABuffer, TEncoding.Unicode.GetPreamble) then
      AEncoding := TEncoding.Unicode
    else if ContainsPreamble(ABuffer, TEncoding.BigEndianUnicode.GetPreamble) then
      AEncoding := TEncoding.BigEndianUnicode
    else if ContainsPreamble(ABuffer, TEncoding.UTF8.GetPreamble) then
      AEncoding := TEncoding.UTF8
    else
      AEncoding := TEncoding.Default;
    pPreamble := AEncoding.GetPreamble;
    if pPreamble <> nil then
      Result := pPreamble.Length;
  end
  else
  begin
    pPreamble := AEncoding.GetPreamble;
    if (pPreamble <> nil) and ContainsPreamble(ABuffer, pPreamble) then
      Result := pPreamble.Length;
  end;
end;

end.
