namespace ShineOn.Rtl;

interface

type
  MathUnit = public sealed class
  private
    const FuzzFactor = 1000;
    const DoubleResolution = 1E-15 * FuzzFactor;
  public
    class method CompareValue(A, B: Double; Epsilon: Double = 0): TValueRelationship;
    class method CompareValue(A, B: Int32): TValueRelationship;
    class method CompareValue(A, B: Int64): TValueRelationship;
    class method IsZero(A: Double; Epsilon: Double = 0): Boolean;
    class method Max(A, B: Double): Double; 
    class method Max(A, B: Int32): Integer; 
    class method Max(A, B: Int64): Integer; 
    class method MaxIntValue(Data: array of Int32): Int32;
    class method MaxIntValue(Data: array of Int64): Int64;
    class method Min(A, B: Double): Double; 
    class method Min(A, B: Int32): Integer; 
    class method Min(A, B: Int64): Integer; 
    class method SameValue(A, B, Epsilon: Double): Boolean;
  end;

implementation

{ MathUnit }

class method MathUnit.CompareValue(A, B: Double; Epsilon: Double = 0): TValueRelationship;
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

class method MathUnit.IsZero(A: Double; Epsilon: Double = 0): Boolean;
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

end.
