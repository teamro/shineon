namespace ShineOn.Rtl;

interface

type
  MathUnit = public sealed class
  public
    class method CompareValue(A, B: Int32): TValueRelationship;
    class method CompareValue(A, B: Int64): TValueRelationship;
    class method Max(A, B: Int32): Integer; 
    class method Max(A, B: Int64): Integer; 
    class method MaxIntValue(Data: array of Int32): Int32;
    class method MaxIntValue(Data: array of Int64): Int64;
    class method Min(A, B: Int32): Integer; 
    class method Min(A, B: Int64): Integer; 
  end;

implementation

{ MathUnit }

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

  Result := Data[Low(Data)];
  for I: Integer := Low(Data) + 1 to High(Data) do
  begin
    if Result < Data[I] then
      Result := Data[I];
  end;
end;

class method MathUnit.MaxIntValue(Data: array of Int64): Int64;
begin
  if (Data = nil) or (Data.Length = 0) then
    exit 0;

  Result := Data[Low(Data)];
  for I: Integer := Low(Data) + 1 to High(Data) do
  begin
    if Result < Data[I] then
      Result := Data[I];
  end;
end;

end.
