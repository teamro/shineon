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
  System.Text,
  System.Globalization;
    
type
  EShineOnError = public class(Exception);
  
  SystemUnit = assembly sealed class 
  public
    class procedure NotImplemented;
    
    class function Pos(SubStr, aStr:String):Int32;
    class function Concat(S1, S2:String):String;
    class procedure Delete(var S: String; Index, Count:Integer);
    class procedure Insert(Source: String; var S: String; Index: Integer);
    class function Copy(Source:String; StartIndex, length: Integer):String;
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

    class function Round(Value:Double):Integer;
    class function Round(Value:TDateTime):Integer;
    class function Trunc(Value:Double):Integer;
    class function Trunc(Value:TDateTime):Integer;
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

    class procedure SetLength(var S; length: Int32);
    class procedure Write(S:String);
    class procedure WriteLn(S:String);
    class procedure Read(var P);
    class procedure ReadLn(var P);
  end;
  

procedure NotImplemented;public;
 
function Pos(SubStr, aStr:String):Int32;public;
function Concat(S1, S2:String):String;public;
procedure Delete(var S: String; Index, Count:Integer);public;
procedure Insert(Source: String; var S: String; Index: Integer);public;
function Copy(Source:String; StartIndex, length: Integer):String;public;
function UpCase(Letter: Char): Char;public;
function LoCase(Letter: Char): Char;public;
function StringOfChar(RepeatCharacter: Char; RepeatCount: Integer ): String; public;
procedure Str(X:Double; Width:Int32;Decimals:Int32;var S:String);public;
procedure Val(S:String; var V:Double; var Code: Integer);public;
procedure Val(S:String; var V:Integer; var Code: Integer);public;
procedure Val(S:String; var V:Int64; var Code: Integer);public;

function Pred(Value:Integer):Integer;public;
function Pred(Value:Char):Char;public;
function Succ(Value:Integer):Integer;public;
function Succ(Value:Char):Char;public;
function Round(Value:Double):Integer;public;
function Round(Value:TDateTime):Integer;public;
function Trunc(Value:Double):Integer;public;
function Trunc(Value:TDateTime):Integer;public;
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
procedure SetLength(var S; length: Int32);public;
procedure Write(S:String);public;
procedure WriteLn(S:String);public;
procedure Read(var P);public;
procedure ReadLn(var P);public;


implementation

class procedure SystemUnit.NotImplemented;
begin
  {$IFNDEF SHINEON_DISABLE_NOTIMPLEMENTED_ERROR}
  raise EShineOnError.Create('Not implemented.');
  {$ENDIF} 
end;

class function SystemUnit.Pos(SubStr, aStr:String):Int32;
begin
  //TODO: Should this function return 0 or -1 if substr not found?
  Result := aStr.IndexOf(SubStr);
end;

class function SystemUnit.Concat(S1, S2:String):String;
begin
  Result := S1 + S2;
end;

class procedure SystemUnit.Delete(var S: String; Index, Count:Integer);
begin
  if (Index >= 0) and (Index <= S.Length - 1) and (Count > 0) then
  begin
    if Index + Count > S.Length then
      Count := S.Length - Index;
    if Count > 0 then
      S := S.Remove(Index, Count);
  end;
end;

class procedure SystemUnit.Insert(Source: String; var S: String; Index: Integer);
begin
  S := S.Substring(0, Index) + Source + S.Substring(Index);
end;

class function SystemUnit.Copy(Source:String; StartIndex, length: Integer):String;
begin
  if (Source = nil) or (StartIndex >= Source.Length) or (length < 1) then
    Result := ''
  else 
  begin
    if StartIndex + length >= Source.Length then
      Result := Source.Substring(StartIndex)
    else if length > 0 then
      Result := Source.Substring(StartIndex, length)
    else
      Result := '';
  end;
end;

class function SystemUnit.UpCase ( Letter : Char ) : Char; 
begin
  Result := Letter.ToString.ToUpper[0];
end;

class function SystemUnit.LoCase ( Letter : Char ) : Char; 
begin
  Result := Letter.ToString.ToLower[0];
end;

class function SystemUnit.StringOfChar ( RepeatCharacter : Char; RepeatCount : Integer ) : String; 
begin
  Result := ''.PadLeft(RepeatCount, RepeatCharacter);

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
  X.ToString(Width.ToString + '.' + Decimals.ToString);
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
  if not Int32.TryParse(S, NumberStyles.Any, NumberFormatInfo.InvariantInfo, V) then
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

class procedure SystemUnit.Val(s: String; var V: Int64; var Code: Integer);
const
  SNumeric = '0123456789';
begin
  Code := 0;
  if not Int64.TryParse(S, NumberStyles.Any, NumberFormatInfo.InvariantInfo, V) then
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

class function SystemUnit.Round(Value:Double):Integer;
begin
  Result := Convert.ToInt32(Value);
end;

class function SystemUnit.Round(Value: TDateTime): Integer;
begin
  Result := Integer(Math.Round(Value));
end;
  
class function SystemUnit.Trunc(Value:Double):Integer;
begin
  Result := Integer(Value);
end;

class function SystemUnit.Trunc(Value: TDateTime): Integer;
var
  Buffer: Double;
begin
  Buffer := Value;
  Result := Integer(Buffer);
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

class procedure SystemUnit.SetLength(var S; length: Int32);
require
  assigned(S);
begin
  case S type of
    System.Array: 
      with aArray := System.Array(S) do 
      begin
        var lLength: Int32 := iif(aArray.Length > length, length, aArray.Length);
        var lNew: &Array := &Array.CreateInstance(aArray.GetType.GetElementType, length);
        &Array.Copy(aArray, lNew, lLength);
        S := lNew;
      end;
    System.String: 
      with aString := System.String(S) do 
      begin
        if aString.Length > length then
          S := aString.Substring(0, length)
        else if aString.Length < length then
          S := aString.PadRight(length, #0000);
        // else keep original.
      end;
    else 
      raise new ArgumentException(String.Format(sFmtSetLengthError,S.GetType.Name));
  end;
end;

class procedure SystemUnit.WriteLn(S:String);
begin
  Console.WriteLine(S);
end;

class procedure SystemUnit.Write(S:String);
begin
  Console.Write(S);
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

function Round(Value:Double):Integer;
begin
  Result := ShineOn.Rtl.SystemUnit.Round(Value);
end;
  
function Round(Value:TDateTime):Integer;
begin
  Result := ShineOn.Rtl.SystemUnit.Round(Value);
end;
  
function Trunc(Value:Double):Integer;
begin
  Result := ShineOn.Rtl.SystemUnit.Trunc(Value);
end;
  
function Trunc(Value:TDateTime):Integer;
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
  
procedure SetLength(var S; length: Int32);
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
  
procedure Read(var P);
begin
  ShineOn.Rtl.SystemUnit.Read(P);
end;
  
procedure ReadLn(var P);
begin
  ShineOn.Rtl.SystemUnit.ReadLn(P);
end;
  
end.



