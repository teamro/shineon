namespace ShineOn.Rtl;

interface

type
  TRoundToEXRangeExtended = -20..20;

  MathUnit = public sealed class
  private
    const FuzzFactor = 1000;
    const ExtendedResolution = 1E-19 * FuzzFactor;
    const DoubleResolution = 1E-15 * FuzzFactor;
    const SingleResolution   = 1E-7 * FuzzFactor;

  public
    class method CompareValue(A, B: Double; Epsilon: Double := 0): TValueRelationship;
    class method CompareValue(A, B: Int32): TValueRelationship;
    class method CompareValue(A, B: Int64): TValueRelationship;
    class method IsZero(A: Double; Epsilon: Double := 0): Boolean;
    class method Max(A, B: Double): Double; 
    class method Max(A, B: Int32): Integer; 
    class method Max(A, B: Int64): Integer; 
    class method MaxIntValue(Data: array of Int32): Int32;
    class method MaxIntValue(Data: array of Int64): Int64;
    class method Min(A, B: Double): Double; 
    class method Min(A, B: Int32): Integer; 
    class method Min(A, B: Int64): Integer; 
    class method SameValue(A, B, Epsilon: Double): Boolean;


    class method IsNan(const AValue: Double): Boolean;

    class method NaN: Double;
    class method Sign(const AValue: Double): Integer;


    { Trigonometric functions }
    class method ArcCos(const X : Double) : Double; 
    class method ArcSin(const X : Double) : Double;

    { Angle unit conversion routines }
    class method RadToDeg(const Radians: Double): Double;
    class method DegToRad(const Degrees: Double): Double;

    { Floating point compare functions }
    //function SameValue(const A, B: Extended; Epsilon: Extended := 0): Boolean; public;  //Does not appear to be a need for this one
    class method SameValue(const A, B: Single; Epsilon: Single := 0): Boolean;

    class method RoundTo(const AValue: Decimal; const ADigit: TRoundToEXRangeExtended): Decimal;
    class method RoundTo(const AValue: Double; const ADigit: TRoundToEXRangeExtended): Double;
  end;

method IsZero(const A: Double; Epsilon: Double := 0): Boolean; public;
method IsNan(const AValue: Double): Boolean; public; 
method NaN: Double; public;
method Max(A, B: Double): Double; public; 
method Max(A, B: Int32): Integer; public; 
method Max(A, B: Int64): Integer; public; 
method Min(A, B: Double): Double; public; 
method Min(A, B: Int32): Integer; public; 
method Min(A, B: Int64): Integer; public; 
method Sign(const AValue: Double): Integer; public;
method ArcCos(const X : Double) : Double; public; 
method ArcSin(const X : Double) : Double; public;
method RadToDeg(const Radians: Double): Double; public;
method DegToRad(const Degrees: Double): Double; public;
method SameValue(const A, B: Double; Epsilon: Double := 0): Boolean; public;
method SameValue(const A, B: Single; Epsilon: Single := 0): Boolean; public;    
method CompareValue(A, B: Double; Epsilon: Double := 0): TValueRelationship; public;
method CompareValue(A, B: Int32): TValueRelationship; public;
method CompareValue(A, B: Int64): TValueRelationship; public;
method RoundTo(AValue: Double; const ADigit: TRoundToEXRangeExtended): Double; public;
method RoundTo(AValue: Decimal; const ADigit: TRoundToEXRangeExtended): Decimal; public;


implementation

{ MathUnit }

class method MathUnit.CompareValue(A, B: Double; Epsilon: Double := 0): TValueRelationship;
begin
  if SameValue(A, B, Epsilon) then
    exit EqualsValue
  else if A < B then
    exit LessThanValue
  else
    exit GreaterThanValue;
end;

class method MathUnit.CompareValue(A, B: Int32): TValueRelationship;
begin
  if A = B then
    exit EqualsValue
  else if A < B then
    exit LessThanValue
  else
    exit GreaterThanValue;
end;

class method MathUnit.CompareValue(A, B: Int64): TValueRelationship;
begin
  if A = B then
    exit EqualsValue
  else if A < B then
    exit LessThanValue
  else
    exit GreaterThanValue;
end;

class method MathUnit.IsZero(A: Double; Epsilon: Double := 0): Boolean;
begin
  if Epsilon = 0 then
    Epsilon := DoubleResolution;
  Result := Abs(A) <= Epsilon;
end;

class method MathUnit.Max(A, B: Double): Double;
begin
  if A > B then
    exit A
  else
    exit B;
end;

class method MathUnit.Max(A, B: Int32): Integer;
begin
  if A > B then
    exit A
  else
    exit B;
end;

class method MathUnit.Max(A, B: Int64): Integer;
begin
  if A > B then
    exit A
  else
    exit B;
end;

class method MathUnit.Min(A, B: Double): Double;
begin
  if A < B then
    exit A
  else
    exit B;
end;

class method MathUnit.Min(A, B: Int32): Integer;
begin
  if A < B then
    exit A
  else
    exit B;
end;

class method MathUnit.Min(A, B: Int64): Integer;
begin
  if A < B then
    exit A
  else
    exit B;
end;

class method MathUnit.MaxIntValue(Data: array of Int32): Int32;
begin
  if (Data = nil) or (Data.Length = 0) then
    exit 0;

  Result := Data[low(Data)];
  for I: Integer := low(Data) + 1 to high(Data) do
  begin
    if Result < Data[I] then
      Result := Data[I];
  end;
end;

class method MathUnit.MaxIntValue(Data: array of Int64): Int64;
begin
  if (Data = nil) or (Data.Length = 0) then
    exit 0;

  Result := Data[low(Data)];
  for I: Integer := low(Data) + 1 to high(Data) do
  begin
    if Result < Data[I] then
      Result := Data[I];
  end;
end;

class method MathUnit.SameValue(A, B, Epsilon: Double): Boolean;
begin
  if Epsilon = 0 then
    Epsilon := Max(Min(Abs(A), Abs(B)) * DoubleResolution, DoubleResolution);
  if A > B then
    exit  (A - B) <= Epsilon
  else
    exit (B - A) <= Epsilon;
end;

class method MathUnit.ArcCos(const X : Double) : Double; 
begin
  Result:=Math.Acos(X);
end;

class method MathUnit.ArcSin(const X : Double) : Double;
begin
  Result:=Math.Asin(X);
end;

class method MathUnit.RadToDeg(const Radians: Double): Double;
begin
  Result := Radians * (180 / PI);
end;

class method MathUnit.DegToRad(const Degrees: Double): Double;
begin
  Result := Degrees * (PI / 180);
end;

class method MathUnit.IsNan(const AValue: Double): Boolean; 
begin
  Result:=Double.IsNan(AValue);
end;

class method MathUnit.NaN: Double;
begin
  Result:=Double.NaN;
end;

class method MathUnit.Sign(const AValue: Double): Integer;
begin
  Result:=Math.Sign(AValue);
end;

class method MathUnit.SameValue(const A, B: Single; Epsilon: Single): Boolean;
begin
  if Epsilon = 0 then
    Epsilon := Max(Min(Abs(A), Abs(B)) * SingleResolution, SingleResolution);
  if A > B then
    Result := (A - B) <= Epsilon
  else
    Result := (B - A) <= Epsilon;
end;

class method MathUnit.RoundTo(AValue: Double; const ADigit: TRoundToEXRangeExtended): Double;
begin
  Result:=Convert.ToDouble(RoundTo(Convert.ToDecimal(AValue), ADigit));
end;

class method MathUnit.RoundTo(AValue: Decimal; const ADigit: TRoundToEXRangeExtended): Decimal;
var
  Scaler: Decimal;
  TempVal: Decimal;
begin
  //Need to use Decimal data type in order to avoid issues that 
  //can arrise as a result of double division and multiplication
  Scaler := Convert.ToDecimal(Math.Pow(10.0, ADigit));
  TempVal := Convert.ToDecimal(AValue) / Scaler;
  //Need to use "Bankers Rounding"
  TempVal := System.Math.Round(TempVal, MidpointRounding.ToEven); 
  Result := TempVal * Scaler;
end;

method RoundTo(AValue: Double; const ADigit: TRoundToEXRangeExtended): Double;
begin
  Result:=MathUnit.RoundTo(AValue, ADigit);
end;

method RoundTo(AValue: Decimal; const ADigit: TRoundToEXRangeExtended): Decimal;
begin
  Result:=MathUnit.RoundTo(AValue, ADigit);
end;

method IsZero(const A: Double; Epsilon: Double := 0): Boolean;
begin
  Result:=MathUnit.IsZero(A, Epsilon);
end;

method IsNan(const AValue: Double): Boolean; 
begin
  Result:=MathUnit.IsNan(AValue);
end;

method NaN: Double;
begin
  Result:=MathUnit.NaN;
end;

method Max(A, B: Double): Double;
begin
  Result:=MathUnit.Max(A, B);
end;

method Max(A, B: Int32): Integer;
begin
  Result:=MathUnit.Max(A, B);
end;

method Max(A, B: Int64): Integer;
begin
  Result:=MathUnit.Max(A, B);
end;

method Min(A, B: Double): Double; 
begin
  Result:=MathUnit.Min(A, B);
end;

method Min(A, B: Int32): Integer;
begin
  Result:=MathUnit.Min(A, B);
end;

method Min(A, B: Int64): Integer;
begin
  Result:=MathUnit.Min(A, B);
end;

method Sign(const AValue: Double): Integer;
begin
  Result:=MathUnit.Sign(AValue);
end;

method ArcCos(const X : Double) : Double;
begin
  Result:=MathUnit.ArcCos(X);
end;

method ArcSin(const X : Double) : Double;
begin
  Result:=MathUnit.ArcSin(X);
end;

method RadToDeg(const Radians: Double): Double;
begin
  Result:=MathUnit.RadToDeg(Radians);
end;

method DegToRad(const Degrees: Double): Double;
begin
  Result:=MathUnit.DegToRad(Degrees);
end;

method SameValue(const A, B: Double; Epsilon: Double := 0): Boolean;
begin
  Result:=MathUnit.SameValue(A, B, Epsilon);
end;

method SameValue(const A, B: Single; Epsilon: Single := 0): Boolean;
begin
  Result:=MathUnit.SameValue(A, B, Epsilon);
end;

    
method CompareValue(A, B: Double; Epsilon: Double := 0): TValueRelationship; 
begin
  Result:=MathUnit.CompareValue(A,B,Epsilon);
end;

method CompareValue(A, B: Int32): TValueRelationship; 
begin
  Result:=MathUnit.CompareValue(A,B);
end;

method CompareValue(A, B: Int64): TValueRelationship; 
begin
  Result:=MathUnit.CompareValue(A,B);
end;

end.
