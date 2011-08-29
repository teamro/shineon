// The contents of this file are subject to the Mozilla Public License Version 1.1 (the "License"); 
// you may not use this file except in compliance with the License. You may obtain a copy of the 
// License at http://www.mozilla.org/MPL/ 
// 
// Software distributed under the License is distributed on an "AS IS" basis, WITHOUT WARRANTY OF 
// ANY KIND, either express or implied. See the License for the specificlanguage governing rights and 
// limitations under the License.

namespace ShineOn.Rtl;

// ToDo: not worth changing just for the sake of it, but these methids should just be defined globally, 
// instead of relying on the SystemUnit class. it's just dupe work. making the class internal for now. mh.

interface

uses
  System.Diagnostics,
  System.Reflection.Emit,
  System.Runtime.InteropServices,
  System.Text,
  System.Globalization, 
  System.Windows.Forms, 
  System.Windows.Forms.VisualStyles;
    
type
  EShineOnError = public class(Exception);
  EAbort = public class(Exception) constructor; empty; end;
{$ifdef LegacyStrIndexing}
  //Give dependent classes of ShineOn a way of ensuring that LegacyStrIndexing 
  //was defined at compile time 
  LegacyStrIndexingDefinedAttribute = public class(Attribute);
{$endif}
  
  SystemUnit = assembly sealed class 
  private
    class var fParams: array of String;
    class procedure PrepareParams;
  public
    class procedure NotImplemented;

    class procedure Str(X:Double; Width:Int32;Decimals:Int32;var S:DelphiString);
    class function Pos(SubStr, aStr:DelphiString):Int32;
    class function Concat(S1, S2:DelphiString):DelphiString;
    class procedure Delete(var S: DelphiString; Index, Count:Integer);
    class procedure Insert(Source: DelphiString; var S: DelphiString; Index: Integer);
    class function Copy(Source:DelphiString; StartIndex, length: Integer):DelphiString;
    class function Copy(Source: TBytes; StartIndex, Length: Integer): TBytes;

    class function Pos(SubStr, aStr:String):Int32;
    class function Concat(S1, S2:String):String;
    class procedure Delete(var S: String; Index, Count:Integer);
    class procedure Insert(Source: String; var S: String; Index: Integer);
    class function Copy(Source:String; StartIndex, length: Integer):String;
    class function Copy(Source:String; StartIndex: Integer):String;
    class function UpCase(Letter: Char): Char;
    class function LoCase(Letter: Char): Char;
    class function StringOfChar(RepeatCharacter: Char; RepeatCount: Integer): String;

    class procedure Str(X:Double; Width:Int32;Decimals:Int32;var S:String);
    class procedure Val(S:String; var V:Double; var Code: Integer);
    class procedure Val(s: String; var V: Integer; var Code: Integer);
    class procedure Val(s: String; var V: Int64; var Code: Integer);

    class function Pred(Value:Integer):Integer;
    class function Pred(Value:Char):Char;
    class function Succ(Value:Integer):Integer;
    class function Succ(Value:Char):Char;

    class function Round(Value:Double):Int64;
    class function Round(Value:TDateTime):Int64;
    class function Trunc(Value:Double):Int64;
    class function Trunc(Value:TDateTime):Int64;
    class function Int(X: Double): Double;
    class function Int(X: TDateTime): Double;
    class function Frac(Value:Double):Double;
    class function Frac(Value:TDateTime):Double;
    class function Odd(Value:Integer):Boolean;
    
    class function Sqrt(Number:Extended):Extended; 
    class function Sqr(Number:Extended):Extended; 
    class function Sqr(Number:Integer):Integer; 

    // TODO: add more overloads
    class function Abs(X:Integer):Integer;
    class function Abs(X:Double):Double;
    class function Abs(X:TDateTime):TDateTime;
    class function Exp(X: Double): Double;

    class procedure SetLength(var S: String; length: Int32);
    class procedure SetLength<T>(var S: Array of T; length: Int32);
    class procedure SetLength(var S: DelphiString; length: Int32);
    class procedure Write(S:String);
    class procedure WriteLn(S:String);
    class procedure Write(params S: Array of Object);
    class procedure WriteLn(params S: Array of Object);
    class procedure Read(var P);
    class procedure ReadLn(var P);
    class function ParamCount: Integer;
    class function ParamStr(i: Integer): String;
    class function GetDir: String;
    class procedure Abort;
  end;
  

procedure NotImplemented;public;

procedure Abort; public;
function Pos(SubStr, aStr:String):Int32;public;
function Concat(S1, S2:String):String;public;
procedure Delete(var S: String; Index, Count:Integer);public;
procedure Insert(Source: String; var S: String; Index: Integer);public;
function Copy(Source:String; StartIndex, length: Integer):String;public;
function Copy(Source:String; StartIndex: Integer):String; public;
function Copy(Source: TBytes; StartIndex, Length: Integer): TBytes; public;
function UpCase(Letter: Char): Char;public;
function LoCase(Letter: Char): Char;public;
function StringOfChar(RepeatCharacter: Char; RepeatCount: Integer ): String; public;
procedure Str(X:Double; Width:Int32;Decimals:Int32;var S:String);public;
procedure Val(S:String; var V:Double; var Code: Integer);public;
procedure Val(S:String; var V:Integer; var Code: Integer);public;
procedure Val(S:String; var V:Int64; var Code: Integer);public;
procedure Str(X:Double; Width:Int32;Decimals:Int32;var S:DelphiString);

function GetDir: String; public;
function Pos(SubStr, aStr:DelphiString):Int32; public;
function Pos(SubStr: String; aStr:DelphiString):Int32; public;
function Pos(SubStr: DelphiString; aStr:String):Int32; public;
function Concat(S1, S2:DelphiString):DelphiString; public;
procedure Delete(var S: DelphiString; Index, Count:Integer); public;
procedure Insert(Source: DelphiString; var S: DelphiString; Index: Integer); public;
procedure Insert(Source: String; var S: DelphiString; Index: Integer); public;
function Copy(Source:DelphiString; StartIndex, length: Integer):DelphiString; public;


function Pred(Value:Integer):Integer;public;
function Pred(Value:Char):Char;public;
function Succ(Value:Integer):Integer;public;
function Succ(Value:Char):Char;public;
function Round(Value:Double):Int64;public;
function Round(Value:TDateTime):Int64;public;
function Trunc(Value:Double):Int64;public;
function Trunc(Value:TDateTime):Int64;public;
function Int(X: Double): Double;public;
function Int(X: TDateTime): Double;public;
function Frac(Value:Double):Double;public;
function Frac(Value:TDateTime):Double;public;
function Odd(Value:Integer):Boolean;public;
function Sqrt(Number:Extended):Extended;public;
function Sqr(Number:Extended):Extended;public;
function Sqr(Number:Integer):Integer;public;

function Abs(X:Integer):Integer;public;
function Abs(X:Double):Double;public;
function Abs(X:TDateTime):TDateTime;public;
function Exp(X: Double): Double;public;
procedure SetLength<T>(var S: Array of T; length: Int32);public;
procedure SetLength(var S: String; length: Int32);public;
procedure SetLength(var S: DelphiString; length: Int32);public;
procedure &Write(S:String);public;
procedure WriteLn(S:String);public;
procedure &Write(params S: Array of Object); public;
procedure WriteLn(params S: Array of Object); public;
procedure Read(var P);public;
procedure ReadLn(var P);public;
function ParamCount: Integer; public;
function ParamStr(i: Integer): String; public;


implementation

class procedure SystemUnit.NotImplemented;
begin
  {$IFNDEF SHINEON_DISABLE_NOTIMPLEMENTED_ERROR}
  raise EShineOnError.Create('Not implemented.');
  {$ENDIF} 
end;

class function SystemUnit.Pos(SubStr, aStr:String):Int32;
begin
  if (SubStr = nil) or (aStr = nil) or (SubStr.Length = 0) or (aStr.Length = 0) then
    Result := -1
  else
    Result := aStr.IndexOf(SubStr);
{$IFDEF LegacyStrIndexing}
  Inc(Result);
{$ENDIF}
end;

class function SystemUnit.Concat(S1, S2:String):String;
begin
  Result := S1 + S2;
end;

class procedure SystemUnit.Delete(var S: String; Index, 
Count:Integer);
begin
{$IFDEF LegacyStrIndexing}
  if (Index > 0) and (Index <= S.Length) and (Count > 0) then
  begin
    if Index + Count - 1 > S.Length then
      Count := S.Length - Index + 1;
    if Count > 0 then
      S := S.Remove(Index-1, Count);
  end;
{$ELSE}
  if (Index >= 0) and (Index <= S.Length - 1) and (Count >  0) then
  begin
    if Index + Count > S.Length then
      Count := S.Length - Index;
    if Count > 0 then
      S := S.Remove(Index, Count);
  end;
{$ENDIF}
end;

class procedure SystemUnit.Insert(Source: String; var S: String; 
Index: Integer);
begin
{$IFDEF LegacyStrIndexing}
  S := S.Substring(0, Index-1) + Source + S.Substring(Index-1);
{$ELSE}
  S := S.Substring(0, Index) + Source + S.Substring(Index);
{$ENDIF}
end;


class function SystemUnit.Copy(Source:String; StartIndex, length: Integer):String;
begin
{$IFDEF LegacyStrIndexing}
  if (Source = nil) or (StartIndex > Source.Length) or (length < 1) then
    Result := ''
  else
  begin
    if StartIndex + length > Source.Length then
      Result := Source.Substring(StartIndex-1)
    else
      Result := Source.Substring(StartIndex-1, length);
  end; 
{$ELSE}
  if (Source = nil) or (StartIndex >= Source.Length) or (length < 1) then
    Result := ''
  else 
  begin
    if StartIndex + length >= Source.Length then
      Result := Source.Substring(StartIndex)
    else if length > 0 then  //Not needed since already checked  length above
      Result := Source.Substring(StartIndex, length)
    else
      Result := '';
  end;
{$ENDIF}  
end;

class function SystemUnit.Copy(Source: TBytes; StartIndex, Length: Integer): TBytes;
begin
  if (Source = nil) or (StartIndex > Source.Length) or (Length < 1) then
    Result := nil
  else
  begin
    if StartIndex + Length > Source.Length then
      Result := new TBytes(Source.Length - StartIndex)
    else
      Result := new TBytes(Length);
    Array.Copy(Source, StartIndex, Result, 0, Result.Length);
  end; 
end;

class function SystemUnit.UpCase ( Letter : Char ) : Char; 
begin
  Result :=  Char.ToUpperInvariant(Letter);
end;

class function SystemUnit.LoCase ( Letter : Char ) : Char; 
begin
  Result := Char.ToLowerInvariant(Letter);
end;

class function SystemUnit.StringOfChar ( RepeatCharacter : Char; RepeatCount : Integer ) : String; 
begin
  Result := new String(RepeatCharacter, RepeatCount);

{ 
  // This is a lot slower:
  with SB:StringBuilder := new StringBuilder do
  begin
    for i:Int32 := 0 to RepeatCount - 1 do
      SB.Append(RepeatCharacter);
    Result := SB.ToString;
  end;
  }
end;

class procedure SystemUnit.Str(X:Double; Width:Int32;Decimals:Int32;var S:String);
begin
  S := X.ToString(Width.ToString + '.' + Decimals.ToString);
end;

class procedure SystemUnit.Val(S:String; var V:Double; var Code: Integer);
const
  SNumeric:String = '0123456789.+-eE';
begin
  Code := 0;
  if not Double.TryParse(S, NumberStyles.Any, NumberFormatInfo.InvariantInfo, V) then
  begin
    // find first non-numeric value
    for i:Int32 := 0 to S.Length - 1 do
      if SNumeric.IndexOf(S[i]) < 0 then
      begin
        Code := i + 1; // since Val in Delphi sets Code = 0 on success, we add an additional 1 to the result here as well
        Exit;
      end;
    Code := S.Length;
  end;
end;

class procedure SystemUnit.Val(s: String; var V: Integer; var Code: Integer);
const
  SNumeric = '0123456789';
begin
  Code := 0;
  if not Int32.TryParse(s, NumberStyles.Any, NumberFormatInfo.InvariantInfo, V) then
  begin
    // find first non-numeric value
    for i:Int32 := 0 to s.Length - 1 do
      if SNumeric.IndexOf(s[i]) < 0 then
      begin
        Code := i + 1; // since Val in Delphi sets Code = 0 on success, we add an additional 1 to the result here as well
        Exit;
      end;
    Code := s.Length;
  end;
end;

class procedure SystemUnit.Val(s: String; var V: Int64; var Code: Integer);
const
  SNumeric = '0123456789';
begin
  Code := 0;
  if not Int64.TryParse(s, NumberStyles.Any, NumberFormatInfo.InvariantInfo, V) then
  begin
    // find first non-numeric value
    for i:Int32 := 0 to s.Length - 1 do
      if SNumeric.IndexOf(s[i]) < 0 then
      begin
        Code := i + 1; // since Val in Delphi sets Code = 0 on success, we add an additional 1 to the result here as well
        Exit;
      end;
    Code := s.Length;
  end;
end;





class function SystemUnit.Pred(Value:Integer):Integer;
begin
  Result := Value - 1;
end;

class function SystemUnit.Succ(Value:Integer):Integer;
begin
  Result := Value + 1;
end;

class function SystemUnit.Pred(Value:Char): Char; 
begin
  Result := Char(Integer(Value) - 1);
end;


class function SystemUnit.Succ(Value:Char): Char; 
begin
  Result := Char(Integer(Value) + 1);
end;

class function SystemUnit.Round(Value:Double):Int64;
begin
  Result := System.Convert.ToInt64(Math.Round(Value));
end;

class function SystemUnit.Round(Value: TDateTime): Int64;
begin
  Result := Int64(Math.Round(Value));
end;
  
class function SystemUnit.Trunc(Value:Double):Int64;
begin
  Result := Int64(Value);
end;

class function SystemUnit.Trunc(Value: TDateTime): Int64;
var
  Buffer: Double;
begin
  Buffer := Value;
  Result := Int64(Buffer);
end;

class function SystemUnit.Int(X: Double): Double;
begin
  Result := Integer(X);
end;  

class function SystemUnit.Int(X: TDateTime): Double;
begin
  Result := X.Date;
end;  

class function SystemUnit.Frac(Value:Double):Double;
begin
  Result := Abs(Value) - Integer(Abs(Value));
  if Value < 0 then
    Result := -Result;
end;

class function SystemUnit.Frac(Value:TDateTime):Double;
begin
  Result := Value.Time;
end;

class function SystemUnit.Odd(Value:Integer):Boolean;
begin
  Result := Value and 1 <> 0;
end;

class function SystemUnit.Abs(X:Integer):Integer;
begin
  Result := Math.Abs(X);
end;

class function SystemUnit.Abs(X:Double):Double;
begin
  Result := Math.Abs(X);
end;

class function SystemUnit.Abs(X: TDateTime): TDateTime;
var
  Buffer: Double;
begin
  Buffer := X;
  Result := new TDateTime(Abs(Buffer));
end;

class function SystemUnit.Exp(X: Double): Double;
begin
  Result := Math.Exp(X);
end; 

class function SystemUnit.Sqrt(Number:Extended): Extended; 
begin
  Result := Math.Sqrt(Number);
end;

class function SystemUnit.Sqr(Number:Extended): Extended; 
begin 
  Result := Number * Number;
end;

class function SystemUnit.Sqr(Number:Integer): Integer; 
begin
  Result := Number * Number;
end; 


class procedure SystemUnit.SetLength(var S: String; length: Int32);
begin
  if S = nil then S := '';

  if S.Length > length then
    S := S.Substring(0, length)
  else if S.Length < length then
    S := S.PadRight(length, #0000);
end;
class procedure SystemUnit.SetLength(var S: DelphiString; length: Int32);
begin
  if S = nil then S := new DelphiString();
  S.SetLength(length);
end;

class procedure SystemUnit.SetLength<T>(var S: Array of T; length: Int32);
begin
  var lNew: &Array := &Array.CreateInstance(typeOf(T), length);
  if assigned(S) then
  begin
    var lLength: Int32 := iif(S.Length > length, length, S.Length);
    &Array.Copy(S, lNew, lLength);
  end;
  S := array of T(lNew);
end;

class procedure SystemUnit.WriteLn(S:String);
begin
  Console.WriteLine(S);
end;

class procedure SystemUnit.Write(S:String);
begin
  Console.Write(S);
end;

class procedure SystemUnit.Write(params S: Array of Object);
begin
  for i: Integer := 0 to length(S) -1 do begin
    Console.Write(S[i]);
  end;
end;

class procedure SystemUnit.WriteLn(params S: Array of Object);
begin
  Write(S);
  Write(#13#10);
end;

class procedure SystemUnit.Read(var P);
begin
  var i:Int32 := Console.Read;
  if i >= 0 then
    P := i
  else
    P := nil;
end;

class procedure SystemUnit.ReadLn(var P);
begin
  P := Console.ReadLine;
end;


class procedure SystemUnit.Str(X:Double; Width:Int32;Decimals:Int32;var S:DelphiString);
begin
  var lTemp: String;
  Str(X,Width,Decimals, lTemp);
  S := lTemp;
end;

function CompareChars(aLeft: Array of Char; aLeftStart: Integer; aRight: Array of Char; aRightStart, aCount: Integer): Boolean;
begin
  for i: Integer := 0 to aCount -1 do begin
    if aLeft[i+aLeftStart] <> aRight[i+aRightStart] then exit false;
  end;
  exit true;
end;

class function SystemUnit.Pos(SubStr, aStr:DelphiString): Int32;
begin
  if (SubStr = nil) or (aStr = nil) or (SubStr.Length = 0) or (aStr.Length = 0) or (SubStr.Length > aStr.Length) then exit(0);
  for i: Integer := 0 to aStr.Length - SubStr.Length do begin
    if CompareChars(SubStr.CharData, 0, aStr.CharData, i, SubStr.Length) then exit(i+1);
  end;
end;

class function SystemUnit.Concat(S1, S2:DelphiString): DelphiString;
begin
  result := S1 + S2;
end;

class procedure SystemUnit.Delete(var S: DelphiString; &Index, Count:Integer);
begin
  if S = nil then exit;
  if &Index > S.Length then begin S := ''; exit; end;
  if &Index + Count > S.Length then Count := S.Length - &Index +1;
  if Count = 0 then begin S := ''; exit; end;
  S := DelphiString(String(S).Substring(0, &Index -1) + String(S).Substring(&Index + Count- 1));
end;

class procedure SystemUnit.Insert(Source: DelphiString; var S: DelphiString; &Index: Integer);
begin
  if (Source = nil) or (Source.Length = 0) then exit;
  if S = nil then begin S := Source.Duplicate;exit; end;
  if &Index > S.Length + 1 then S.SetLength(&Index);
  var lNewString := new DelphiString;
  lNewString.SetLength(S.Length + Source.Length);
  Array.Copy(S.CharData, 0, lNewString.CharData, 0, &Index -1);
  Array.Copy(Source.CharData, 0, lNewString.CharData, &Index -1, Source.CharData.Length);
  Array.Copy(S.CharData, &Index-1, lNewString.CharData, &Index -1 + Source.CharData.Length, 
  S.CharData.Length - &Index +1);
  S := lNewString;
end;

class function SystemUnit.Copy(Source:DelphiString; StartIndex, length: Integer): DelphiString;
begin
  if Source = nil then exit('');
  if StartIndex > Source.Length then exit('');
  if (StartIndex + length > Source.Length) or (StartIndex + length < 0) then length := Source.Length - StartIndex +1;
  if length = 0 then begin result  := ''; exit; end;
  result := new DelphiString;
  result.SetLength(length);
  Array.Copy(Source.CharData, StartIndex-1, result.CharData, 0, length);
end;

class function SystemUnit.ParamCount: Integer;
begin
  PrepareParams;
  result := length(fParams)-1;  //Bug fix: don't count path param in 0
end;

class function SystemUnit.ParamStr(i: Integer): String;
begin
  if i = 0 then begin
    exit System.Reflection.Assembly.GetEntryAssembly:Location;
  end;

  PrepareParams;
  if (i < 0) or (i >= length(fParams)) then
    result := ''  //Bug fix (reversed): was fParams[i]
  else
    
    result := fParams[i];  //Bug fix: was ''
end;

class procedure SystemUnit.PrepareParams;
begin
  if fParams <> nil then exit;  //Bug fix: changed from = to <>
  fParams := Environment.GetCommandLineArgs;
  if fParams = nil then fParams := new String[0];
end;

class function SystemUnit.GetDir: String;
begin
  result := Environment.CurrentDirectory;
end;

class procedure SystemUnit.Abort;
begin
  raise new EAbort();
end;

class function SystemUnit.Copy(Source:String; StartIndex: Integer): String;
begin
  result:=SystemUnit.Copy(Source, StartIndex, iif(Assigned(Source), Source.Length, 0));
end;

// DELPHI COMPATIBLE GLOBAL METHODS
procedure NotImplemented;
begin
  ShineOn.Rtl.SystemUnit.NotImplemented;
end;

function Pos(SubStr, aStr:String):Int32;
begin
  Result := ShineOn.Rtl.SystemUnit.Pos(SubStr, aStr);
end;
  
function Concat(S1, S2:String):String;
begin
  Result := ShineOn.Rtl.SystemUnit.Concat(S1, S2);
end;
  
procedure Delete(var S: String; Index, Count:Integer);
begin
  ShineOn.Rtl.SystemUnit.Delete(S, Index, Count);
end;
  
procedure Insert(Source: String; var S: String; Index: Integer);
begin
  ShineOn.Rtl.SystemUnit.Insert(Source, S, Index);
end;
  
function Copy(Source:String; StartIndex, length: Integer):String;
begin
  Result := ShineOn.Rtl.SystemUnit.Copy(Source, StartIndex, length);
end;

function Copy(Source:String; StartIndex: Integer):String;
begin
  Result := ShineOn.Rtl.SystemUnit.Copy(Source, StartIndex);
end;

function Copy(Source: TBytes; StartIndex, Length: Integer): TBytes;
begin
  Result := ShineOn.Rtl.SystemUnit.Copy(Source, StartIndex, Length);
end;

function UpCase(Letter: Char): Char;
begin
  result := ShineOn.Rtl.SystemUnit.UpCase(Letter);
end;

function LoCase(Letter: Char): Char;
begin
  result := ShineOn.Rtl.SystemUnit.LoCase(Letter);
end;

function StringOfChar(RepeatCharacter: Char; RepeatCount: Integer ): String; 
begin
  result := ShineOn.Rtl.SystemUnit.StringOfChar(RepeatCharacter, RepeatCount);
end;
  
procedure Str(X:Double; Width:Int32;Decimals:Int32;var S:String);
begin
  ShineOn.Rtl.SystemUnit.Str(X, Width, Decimals, S);
end;
  
procedure Val(S:String; var V:Double; var Code: Integer);
begin
  ShineOn.Rtl.SystemUnit.Val(S, V, Code);
end;

procedure Val(S:String; var V:Integer; var Code: Integer);
begin
  ShineOn.Rtl.SystemUnit.Val(S, V, Code);
end;

procedure Val(S:String; var V:Int64; var Code: Integer);
begin
  ShineOn.Rtl.SystemUnit.Val(S, V, Code);
end;


function Pred(Value:Integer):Integer;
begin
  Result := ShineOn.Rtl.SystemUnit.Pred(Value);
end;
  
function Pred(Value:Char):Char;
begin
  Result := ShineOn.Rtl.SystemUnit.Pred(Value);
end;

function Succ(Value:Integer):Integer;
begin
  Result := ShineOn.Rtl.SystemUnit.Succ(Value);
end;
   
function Succ(Value:Char):Char;
begin
  Result := ShineOn.Rtl.SystemUnit.Succ(Value);
end;

function Round(Value:Double):Int64;
begin
  Result := ShineOn.Rtl.SystemUnit.Round(Value);
end;
  
function Round(Value:TDateTime):Int64;
begin
  Result := ShineOn.Rtl.SystemUnit.Round(Value);
end;
  
function Trunc(Value:Double):Int64;
begin
  Result := ShineOn.Rtl.SystemUnit.Trunc(Value);
end;
  
function Trunc(Value:TDateTime):Int64;
begin
  Result := ShineOn.Rtl.SystemUnit.Trunc(Value);
end;
  
function Int(X: Double): Double;
begin
  Result := ShineOn.Rtl.SystemUnit.Int(X);
end;
  
function Int(X: TDateTime): Double;
begin
  Result := ShineOn.Rtl.SystemUnit.Int(X);
end;
  
function Frac(Value:Double):Double;
begin
  Result := ShineOn.Rtl.SystemUnit.Frac(Value);
end;
  
function Frac(Value:TDateTime):Double;
begin
  Result := ShineOn.Rtl.SystemUnit.Frac(Value);
end;
  
function Odd(Value:Integer):Boolean;
begin
  Result := ShineOn.Rtl.SystemUnit.Odd(Value);
end;
  
function Abs(X:Integer):Integer;
begin
  Result := ShineOn.Rtl.SystemUnit.Abs(X);
end;
  
function Abs(X:Double):Double;
begin
  Result := ShineOn.Rtl.SystemUnit.Abs(X);
end;
  
function Abs(X:TDateTime):TDateTime;
begin
  Result := ShineOn.Rtl.SystemUnit.Abs(X);
end;
  
function Exp(X: Double): Double;
begin
  Result := ShineOn.Rtl.SystemUnit.Exp(X);
end;
  
function Sqrt(Number:Extended): Extended; 
begin
  result := ShineOn.Rtl.SystemUnit.Sqrt(Number);
end;  

function Sqr(Number:Extended): Extended; 
begin
  result := ShineOn.Rtl.SystemUnit.Sqr(Number);
end;  

function Sqr(Number:Integer): Integer; 
begin
  result := ShineOn.Rtl.SystemUnit.Sqr(Number);
end;  
  
procedure SetLength<T>(var S: Array of T; length: Int32);
begin
  ShineOn.Rtl.SystemUnit.SetLength<T>(S, length);
end;
procedure SetLength(var S: String; length: Int32);
begin
  ShineOn.Rtl.SystemUnit.SetLength(S, length);
end;
procedure SetLength(var S: DelphiString; length: Int32);
begin
  ShineOn.Rtl.SystemUnit.SetLength(S, length);
end;

  
procedure Write(S:String);
begin
  ShineOn.Rtl.SystemUnit.Write(S);
end;
  
procedure WriteLn(S:String);
begin
  ShineOn.Rtl.SystemUnit.WriteLn(S);
end;

procedure &Write(params S: Array of Object); 
begin
  ShineOn.Rtl.SystemUnit.Write(S);
end;

procedure WriteLn(params S: Array of Object); 
begin
  ShineOn.Rtl.SystemUnit.WriteLn(S);
end;

  
procedure Read(var P);
begin
  ShineOn.Rtl.SystemUnit.Read(P);
end;
  
procedure ReadLn(var P);
begin
  ShineOn.Rtl.SystemUnit.ReadLn(P);
end;
  
procedure Str(X:Double; Width:Int32;Decimals:Int32;var S:DelphiString);
begin
  ShineOn.Rtl.SystemUnit.Str(X,Width, Decimals, S);
end;
function Pos(SubStr, aStr:DelphiString):Int32;
begin
  result :=ShineOn.Rtl.SystemUnit.Pos(SubStr, aStr);
end;
function Concat(S1, S2:DelphiString):DelphiString;
begin
  result :=ShineOn.Rtl.SystemUnit.Concat(S1,S2);
end;
procedure Delete(var S: DelphiString; Index, Count:Integer);
begin
  ShineOn.Rtl.SystemUnit.Delete(S, &Index, Count);
end;
procedure Insert(Source: DelphiString; var S: DelphiString; Index: Integer);
begin
  ShineOn.Rtl.SystemUnit.Insert(Source, S, &Index);
end;

procedure Insert(Source: String; var S: DelphiString; Index: Integer); 
begin
  ShineOn.Rtl.SystemUnit.Insert(DelphiString(Source), S, &Index);
end;

function Copy(Source:DelphiString; StartIndex, length: Integer):DelphiString;
begin
  result := ShineOn.Rtl.SystemUnit.Copy(Source, StartIndex, length);
end;


function Pos(SubStr: String; aStr:DelphiString):Int32; 
begin
  result :=ShineOn.Rtl.SystemUnit.Pos(DelphiString(SubStr), aStr);
end;
function Pos(SubStr: DelphiString; aStr:String):Int32; 
begin
  result :=ShineOn.Rtl.SystemUnit.Pos(SubStr, DelphiString(aStr));
end;

function ParamCount: Integer; 
begin
  result :=ShineOn.Rtl.SystemUnit.ParamCount;
end;

function ParamStr(i: Integer): String; 
begin
  result := ShineOn.Rtl.SystemUnit.ParamStr(i);
end;

function GetDir: String; 
begin
  result := ShineOn.Rtl.SystemUnit.GetDir;
end;

procedure Abort;
begin
  ShineOn.Rtl.SystemUnit.Abort;
end;

end.



