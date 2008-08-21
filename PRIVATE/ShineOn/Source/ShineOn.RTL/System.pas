// The contents of this file are subject to the Mozilla Public License Version 1.1 (the "License"); 
// you may not use this file except in compliance with the License. You may obtain a copy of the 
// License at http://www.mozilla.org/MPL/ 
// 
// Software distributed under the License is distributed on an "AS IS" basis, WITHOUT WARRANTY OF 
// ANY KIND, either express or implied. See the License for the specificlanguage governing rights and 
// limitations under the License.

// $Id: System.pas 53 2005-06-30 10:26:36Z peter3 $

// History:
//
// 2005-06-04   :   Lloyd Kinsella    :   Modifications to support newer TDateTime implementation
// 2005-06-16   :   Lloyd Kinsella    :   Implemented NotImplemented as a method of the System class
// 2005-06-27   :   Jeroen Vandezande :   Fixed the Delete implementation, it copied a part of the String instead of deleting a part.
// 2005-06-27   :   Jeroen Vandezande :   Implemented the LoCase and UpCase functions.
// 2005-06-28   :   Jeroen Vandezande :   Implemented the StringOfChar function.

namespace ShineOn.RTL;

interface

uses
  System.Text,
  System.Globalization;
    
type
  EShineOnError = public class(Exception);
  
  System = public sealed class 
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


    class function Ord(Value:Char):Int32;
    class function Ord(Value:Boolean):Int32;

    class procedure Inc(var Value:Int32);
    class procedure Inc(var Value:Int32; Amount:Int32);
    class procedure Dec(var Value:Int32);
    class procedure Dec(var Value:Int32; Amount:Int32);
    class procedure Inc(var Value:Char);
    class procedure Inc(var Value:Char; Amount:Int32);
    class procedure Dec(var Value:Char);
    class procedure Dec(var Value:Char; Amount:Int32);

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
procedure Inc(var Value:Char); public;
procedure Inc(var Value:Char;Amount:Int32); public;
procedure Dec(var Value:Char); public;
procedure Dec(var Value:Char;Amount:Int32); public;

function Ord(Value:Char):Int32;public;
function Ord(Value:Boolean):Int32;public;
procedure Inc(var Value:Int32);public;
procedure Inc(var Value:Int32; Amount:Int32);public;
procedure Dec(var Value:Int32);public;
procedure Dec(var Value:Int32; Amount:Int32);public;
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

class procedure System.NotImplemented;
begin
  {$IFNDEF SHINEON_DISABLE_NOTIMPLEMENTED_ERROR}
  raise EShineOnError.Create('Not implemented.');
  {$ENDIF} 
end;

class function System.Pos(SubStr, aStr:String):Int32;
begin
  //TODO: Should this function return 0 or -1 if substr not found?
  Result := aStr.IndexOf(SubStr);
end;

class function System.Concat(S1, S2:String):String;
begin
  Result := S1 + S2;
end;

class procedure System.Delete(var S: String; Index, Count:Integer);
begin
  if (Index >= 0) and (Index <= S.Length - 1) and (Count > 0) then
  begin
    if Index + Count > S.Length then
      Count := S.Length - Index;
    if Count > 0 then
      S := S.Remove(Index, Count);
  end;
end;

class procedure System.Insert(Source: String; var S: String; Index: Integer);
begin
  S := S.Substring(0, Index) + Source + S.Substring(Index);
end;

class function System.Copy(Source:String; StartIndex, length: Integer):String;
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

class function System.UpCase ( Letter : Char ) : Char; 
begin
  Result := Letter.ToString.ToUpper[0];
end;

class function System.LoCase ( Letter : Char ) : Char; 
begin
  Result := Letter.ToString.ToLower[0];
end;

class function System.StringOfChar ( RepeatCharacter : Char; RepeatCount : Integer ) : String; 
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

class procedure System.Str(X:Double; Width:Int32;Decimals:Int32;var S:String);
begin
  X.ToString(Width.ToString + '.' + Decimals.ToString);
end;

class procedure System.Val(S:String; var V:Double; var Code: Integer);
const
  SNumeric:String = '0123456789.+-eE';
begin
  // TODO: should we use NumberFormatInfo.CurrentInfo here?
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

class procedure System.Inc(var Value:Int32);
begin
  Value := Value + 1;
end;

class procedure System.Inc(var Value:Int32; Amount:Int32);
begin
  Value := Value + Amount;
end;

class procedure System.Dec(var Value:Int32);
begin
  Value := Value - 1;
end;

class procedure System.Dec(var Value:Int32; Amount:Int32);
begin
  Value := Value - Amount;
end;

class procedure System.Inc(var Value:Char); 
begin
  Value := Char(Integer(Value) + 1);
end;

class procedure System.Inc(var Value:Char; Amount:Int32); 
begin
  Value := Char(Integer(Value) + Amount);
end;

class procedure System.Dec(var Value:Char); 
begin
  Value := Char(Integer(Value) - 1);
end;

class procedure System.Dec(var Value:Char; Amount:Int32); 
begin
  Value := Char(Integer(Value) - Amount);
end;

class function System.Ord(Value:Char):Int32;
begin
  Result := Int32(Value);
end;

class function System.Ord(Value:Boolean):Int32;
begin
  if Value then
    Result := 1
  else
    Result := 0;
end;

class function System.Pred(Value:Integer):Integer;
begin
  Result := Value - 1;
end;

class function System.Succ(Value:Integer):Integer;
begin
  Result := Value + 1;
end;

class function System.Pred(Value:Char): Char; 
begin
  Result := Char(Integer(Value) - 1);
end;


class function System.Succ(Value:Char): Char; 
begin
  Result := Char(Integer(Value) + 1);
end;

class function System.Round(Value:Double):Integer;
begin
  Result := Convert.ToInt32(Value);
end;

class function System.Round(Value: TDateTime): Integer;
begin
  Result := Integer(Math.Round(Value));
end;
  
class function System.Trunc(Value:Double):Integer;
begin
  Result := Integer(Value);
end;

class function System.Trunc(Value: TDateTime): Integer;
var
  Buffer: Double;
begin
  Buffer := Value;
  Result := Integer(Buffer);
end;

class function System.Int(X: Double): Double;
begin
  Result := Integer(X);
end;  

class function System.Int(X: TDateTime): Double;
begin
  Result := X.Date;
end;  

class function System.Frac(Value:Double):Double;
begin
  Result := Abs(Value) - Integer(Abs(Value));
  if Value < 0 then
    Result := -Result;
end;

class function System.Frac(Value:TDateTime):Double;
begin
  Result := Value.Time;
end;

class function System.Odd(Value:Integer):Boolean;
begin
  Result := Value and 1 <> 0;
end;

class function System.Abs(X:Integer):Integer;
begin
  Result := Math.Abs(X);
end;

class function System.Abs(X:Double):Double;
begin
  Result := Math.Abs(X);
end;

class function System.Abs(X: TDateTime): TDateTime;
var
  Buffer: Double;
begin
  Buffer := X;
  Result := new TDateTime(Abs(Buffer));
end;

class function System.Exp(X: Double): Double;
begin
  Result := Math.Exp(X);
end; 

class function System.Sqrt(Number:Extended): Extended; 
begin
  Result := Math.Sqrt(Number);
end;

class function System.Sqr(Number:Extended): Extended; 
begin 
  Result := Number * Number;
end;

class function System.Sqr(Number:Integer): Integer; 
begin
  Result := Number * Number;
end; 

class procedure System.SetLength(var S; length: Int32);
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

class procedure System.WriteLn(S:String);
begin
  Console.WriteLine(S);
end;

class procedure System.Write(S:String);
begin
  Console.Write(S);
end;

class procedure System.Read(var P);
begin
  var i:Int32 := Console.Read;
  if i >= 0 then
    P := i
  else
    P := nil;
end;

class procedure System.ReadLn(var P);
begin
  P := Console.ReadLine;
end;


// DELPHI COMPATIBLE GLOBAL METHODS

procedure NotImplemented;
begin
  ShineOn.RTL.System.NotImplemented;
end;

function Pos(SubStr, aStr:String):Int32;
begin
  Result := ShineOn.RTL.System.Pos(SubStr, aStr);
end;
  
function Concat(S1, S2:String):String;
begin
  Result := ShineOn.RTL.System.Concat(S1, S2);
end;
  
procedure Delete(var S: String; Index, Count:Integer);
begin
  ShineOn.RTL.System.Delete(S, Index, Count);
end;
  
procedure Insert(Source: String; var S: String; Index: Integer);
begin
  ShineOn.RTL.System.Insert(Source, S, Index);
end;
  
function Copy(Source:String; StartIndex, length: Integer):String;
begin
  Result := ShineOn.RTL.System.Copy(Source, StartIndex, length);
end;

function UpCase(Letter: Char): Char;
begin
  result := ShineOn.RTL.System.UpCase(Letter);
end;

function LoCase(Letter: Char): Char;
begin
  result := ShineOn.RTL.System.LoCase(Letter);
end;

function StringOfChar(RepeatCharacter: Char; RepeatCount: Integer ): String; 
begin
  result := ShineOn.RTL.System.StringOfChar(RepeatCharacter, RepeatCount);
end;
  
procedure Str(X:Double; Width:Int32;Decimals:Int32;var S:String);
begin
  ShineOn.RTL.System.Str(X, Width, Decimals, S);
end;
  
procedure Val(S:String; var V:Double; var Code: Integer);
begin
  ShineOn.RTL.System.Val(S, V, Code);
end;

procedure Inc(var Value:Char); 
begin
  ShineOn.RTL.System.Inc(Value);
end;

procedure Inc(var Value:Char; Amount:Int32); 
begin
  ShineOn.RTL.System.Inc(Value, Amount);
end;

procedure Dec(var Value:Char); 
begin
  ShineOn.RTL.System.Dec(Value);
end;

procedure Dec(var Value:Char; Amount:Int32); 
begin
  ShineOn.RTL.System.Dec(Value, Amount);
end;
  
function Ord(Value:Char):Int32;
begin
  Result := ShineOn.RTL.System.Ord(Value);
end;
  
function Ord(Value:Boolean):Int32;
begin
  Result := ShineOn.RTL.System.Ord(Value);
end;
  
procedure Inc(var Value:Int32);
begin
  ShineOn.RTL.System.Inc(Value);
end;
  
procedure Inc(var Value:Int32; Amount:Int32);
begin
  ShineOn.RTL.System.Inc(Value, Amount);
end;
  
procedure Dec(var Value:Int32);
begin
  ShineOn.RTL.System.Dec(Value);
end;
  
procedure Dec(var Value:Int32; Amount:Int32);
begin
  ShineOn.RTL.System.Dec(Value, Amount);
end;
  
function Pred(Value:Integer):Integer;
begin
  Result := ShineOn.RTL.System.Pred(Value);
end;
  
function Pred(Value:Char):Char;
begin
  Result := ShineOn.RTL.System.Pred(Value);
end;

function Succ(Value:Integer):Integer;
begin
  Result := ShineOn.RTL.System.Succ(Value);
end;
   
function Succ(Value:Char):Char;
begin
  Result := ShineOn.RTL.System.Succ(Value);
end;

function Round(Value:Double):Integer;
begin
  Result := ShineOn.RTL.System.Round(Value);
end;
  
function Round(Value:TDateTime):Integer;
begin
  Result := ShineOn.RTL.System.Round(Value);
end;
  
function Trunc(Value:Double):Integer;
begin
  Result := ShineOn.RTL.System.Trunc(Value);
end;
  
function Trunc(Value:TDateTime):Integer;
begin
  Result := ShineOn.RTL.System.Trunc(Value);
end;
  
function Int(X: Double): Double;
begin
  Result := ShineOn.RTL.System.Int(X);
end;
  
function Int(X: TDateTime): Double;
begin
  Result := ShineOn.RTL.System.Int(X);
end;
  
function Frac(Value:Double):Double;
begin
  Result := ShineOn.RTL.System.Frac(Value);
end;
  
function Frac(Value:TDateTime):Double;
begin
  Result := ShineOn.RTL.System.Frac(Value);
end;
  
function Odd(Value:Integer):Boolean;
begin
  Result := ShineOn.RTL.System.Odd(Value);
end;
  
function Abs(X:Integer):Integer;
begin
  Result := ShineOn.RTL.System.Abs(X);
end;
  
function Abs(X:Double):Double;
begin
  Result := ShineOn.RTL.System.Abs(X);
end;
  
function Abs(X:TDateTime):TDateTime;
begin
  Result := ShineOn.RTL.System.Abs(X);
end;
  
function Exp(X: Double): Double;
begin
  Result := ShineOn.RTL.System.Exp(X);
end;
  
function Sqrt(Number:Extended): Extended; 
begin
  result := ShineOn.RTL.System.Sqrt(Number);
end;  

function Sqr(Number:Extended): Extended; 
begin
  result := ShineOn.RTL.System.Sqr(Number);
end;  

function Sqr(Number:Integer): Integer; 
begin
  result := ShineOn.RTL.System.Sqr(Number);
end;  
  
procedure SetLength(var S; length: Int32);
begin
  ShineOn.RTL.System.SetLength(S, length);
end;
  
procedure Write(S:String);
begin
  ShineOn.RTL.System.Write(S);
end;
  
procedure WriteLn(S:String);
begin
  ShineOn.RTL.System.WriteLn(S);
end;
  
procedure Read(var P);
begin
  ShineOn.RTL.System.Read(P);
end;
  
procedure ReadLn(var P);
begin
  ShineOn.RTL.System.ReadLn(P);
end;
  
end.



