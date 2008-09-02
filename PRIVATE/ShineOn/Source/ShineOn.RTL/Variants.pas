namespace ShineOn.Rtl;

interface

uses
  System.Collections.Generic,
  System.Text;

type
  EVariantError = public class(Exception) end;
  EVariantTypeCastError = public class(EVariantError) end;
  EVariantInvalidOpError = public class(EVariantError) end;
  TVarType = public Word;
  TBinOperator = (otAdd = 0, otSub = 1, otMul = 2,otIntDiv = 3,otDiv = 4,otMod = 5,otShl = 6,otShr = 7,otAnd = 8,otOr = 9,otXor = 10,otGreaterEqual = 11,otLessEqual = 12,otGreater = 13,otLess = 14,otEqual = 15,otNotEqual = 16);
  Variant = public record
  private
    fValue: Object; readonly;
    class method IsIntType(b: TVarType): Boolean;
    class method IsIntRealType(b: TVarType): Boolean;
    class method GetHighestType(A,B: TVarType): TVarType;
    class method GetResultType(t1,t2: TVarType; op: TBinOperator): TVarType; // returns the caclulation type for bools
  protected
  public
    constructor (aValue: Object);
    property Value: Object read fValue;
    class property Null: Variant := new Variant(nil); readonly;
    class property Unassigned: Variant := new Variant(DBNull.Value);readonly;
    // unary:
    class operator Plus(val: Variant): Variant;
    class operator Minus(val: Variant): Variant;
    class operator BitwiseNot(val: Variant): Variant;

    // binary:
    class operator Add(val1, val2: Variant): Variant;
    class operator Subtract(val1, val2: Variant): Variant;
    class operator Multiply(val1, val2: Variant): Variant;
    class operator Divide(val1, val2: Variant): Variant;
    class operator Modulus(val1, val2: Variant): Variant;
    class operator BitwiseAnd(val1, val2: Variant): Variant;
    class operator BitwiseOr(val1, val2: Variant): Variant;
    class operator BitwiseXor(val1, val2: Variant): Variant;
    class operator ShiftLeft(val1: Variant; val2: Integer): Variant;
    class operator ShiftRight(val1: Variant; val2: Integer): Variant;
    class operator Equal(val1, val2: Variant): Boolean;
    class operator NotEqual(val1, val2: Variant): Boolean;
    class operator Less(val1, val2: Variant): Boolean;
    class operator Greater(val1, val2: Variant): Boolean;
    class operator LessOrEqual(val1, val2: Variant): Boolean;
    class operator GreaterOrEqual(val1, val2: Variant): Boolean;

    class operator implicit(val: Boolean): Variant;
    class operator implicit(val: Byte): Variant;
    class operator implicit(val: DateTime): Variant;
    class operator implicit(val: Decimal): Variant;
    class operator implicit(val: Double): Variant;
    class operator implicit(val: Int16): Variant;
    class operator implicit(val: Int32): Variant;
    class operator implicit(val: Int64): Variant;
    class operator implicit(val: SByte): Variant;
    class operator implicit(val: Single): Variant;
    class operator implicit(val: String): Variant;
    class operator implicit(val: UInt16): Variant;
    class operator implicit(val: UInt32): Variant;
    class operator implicit(val: UInt64): Variant;
    class operator implicit(val: Variant): Boolean;
    class operator implicit(val: Variant): Byte;
    class operator implicit(val: Variant): DateTime;
    class operator implicit(val: Variant): Decimal;
    class operator implicit(val: Variant): Double;
    class operator implicit(val: Variant): Int16;
    class operator implicit(val: Variant): Int32;
    class operator implicit(val: Variant): Int64;
    class operator implicit(val: Variant): SByte;
    class operator implicit(val: Variant): Single;
    class operator implicit(val: Variant): String;
    class operator implicit(val: Variant): UInt16;
    class operator implicit(val: Variant): UInt32;
    class operator implicit(val: Variant): UInt64;
  end;

const
  varEmpty    = $0000; { vt_empty        0 }
  varNull     = $0001; { vt_null         1 }
  varSmallint = $0002; { vt_i2           2 }
  varInteger  = $0003; { vt_i4           3 }
  varSingle   = $0004; { vt_r4           4 }
  varDouble   = $0005; { vt_r8           5 }
  varCurrency = $0006; { vt_cy           6 }
  varDate     = $0007; { vt_date         7 }
  varOleStr   = $0008; { vt_bstr         8 }
  varDispatch = $0009; { vt_dispatch     9 }
  varError    = $000A; { vt_error       10 }
  varBoolean  = $000B; { vt_bool        11 }
  varVariant  = $000C; { vt_variant     12 }
  varUnknown  = $000D; { vt_unknown     13 }
  varDecimal  = $000E; { vt_decimal     14 } 
  varShortInt = $0010; { vt_i1          16 }
  varByte     = $0011; { vt_ui1         17 }
  varWord     = $0012; { vt_ui2         18 }
  varLongWord = $0013; { vt_ui4         19 }
  varInt64    = $0014; { vt_i8          20 }
  varWord64   = $0015; { vt_ui8         21 } 
  
{ Variant support procedures and functions }

function VarType(const V: Variant): TVarType;public;
function VarAsType(const V: Variant; AVarType: TVarType): Variant;public;
function VarIsType(const V: Variant; AVarType: TVarType): Boolean; public;
function VarIsType(const V: Variant; const AVarTypes: array of TVarType): Boolean; public;

function VarIsEmpty(const V: Variant): Boolean;public;
procedure VarCheckEmpty(const V: Variant);public;
function VarIsNull(const V: Variant): Boolean;public;
function VarIsClear(const V: Variant): Boolean;public;

function VarIsOrdinal(const V: Variant): Boolean;public;
function VarIsFloat(const V: Variant): Boolean;public;
function VarIsNumeric(const V: Variant): Boolean;public;
function VarIsStr(const V: Variant): Boolean;public;

function VarToStr(const V: Variant): String;public;
function VarToStrDef(const V: Variant; const ADefault: String): String;public;
function VarToWideStr(const V: Variant): String;public;
function VarToWideStrDef(const V: Variant; const ADefault: String): String;public;

function VarToDateTime(const V: Variant): TDateTime;public;
function VarFromDateTime(const DateTime: TDateTime): Variant;public;

type
  TVariantRelationship = public (vrEqual, vrLessThan, vrGreaterThan, vrNotEqual);

function VarSameValue(const A, B: Variant): Boolean;public;

{ Global constants }

function Unassigned: Variant;public; // Unassigned standard constant
function Null: Variant;public;       // Null standard constant

implementation

function VarType(const V: Variant): TVarType;
begin
  if V.Value = nil then exit(varNull);
  case &Type.GetTypeCode(V.Value.GetType) of
    TypeCode.Boolean: result := varBoolean;
    TypeCode.Byte: result := varByte;
    TypeCode.DateTime: result := varDate;
    TypeCode.DBNull: result := varEmpty;
    TypeCode.Decimal: result := varDecimal;
    TypeCode.Double: result := varDouble;
    TypeCode.Int16: result := varSmallint;
    TypeCode.Int32: result := varInteger;
    TypeCode.Int64: result := varInt64;
    TypeCode.SByte: result := varShortInt;
    TypeCode.Single: result := varSingle;
    TypeCode.String: result := varOleStr;
    TypeCode.UInt16: result := varWord;
    TypeCode.UInt32: result := varLongWord;
    TypeCode.UInt64: result := varWord64;
  end; // case
end;

function VarAsType(const V: Variant; AVarType: TVarType): Variant;
begin
  if (V = nil) and (VarType(V) <> AVarType) then raise new EVariantTypeCastError('Invalid variant type');
  result := VarType(V);
  case &Type.GetTypeCode(V.Value.GetType) of
    TypeCode.Boolean: result := varBoolean;
    TypeCode.Byte: result := varByte;
    TypeCode.DateTime: result := varDate;
    TypeCode.DBNull: result := varEmpty;
    TypeCode.Decimal: result := varDecimal;
    TypeCode.Double: result := varDouble;
    TypeCode.Int16: result := varSmallint;
    TypeCode.Int32: result := varInteger;
    TypeCode.Int64: result := varInt64;
    TypeCode.SByte: result := varShortInt;
    TypeCode.Single: result := varSingle;
    TypeCode.String: result := varOleStr;
    TypeCode.UInt16: result := varWord;
    TypeCode.UInt32: result := varLongWord;
    TypeCode.UInt64: result := varWord64;
  else result := varError;
  end; // case
end;

function VarIsType(const V: Variant; AVarType: TVarType): Boolean;
begin
  result := VarType(V) = AVarType;
end;

function VarIsType(const V: Variant; const AVarTypes: array of TVarType): Boolean; 
var
  lVarType := VarType(V);
begin
  for i: Integer := 0 to length(AVarTypes) -1 do
    if lVarType = AVarTypes[i] then exit(true);
  exit(false);
end;


function VarIsEmpty(const V: Variant): Boolean;
begin
  result := VarType(V) = varEmpty;
end;

procedure VarCheckEmpty(const V: Variant);
begin
  if VarIsEmpty(V) then raise new EVariantError('Variant is empty');
end;

function VarIsNull(const V: Variant): Boolean;
begin
  result := VarType(V) = varNull;
end;

function VarIsClear(const V: Variant): Boolean;
begin
  result := VarIsEmpty(V);
end;

function VarIsOrdinal(const V: Variant): Boolean;
begin
  result := VarType(V) in [varSmallint, varInteger, varBoolean, varShortInt,
                         varByte, varWord, varLongWord, varInt64];
end;

function VarIsFloat(const V: Variant): Boolean;
begin
  result := VarType(V) in [varSingle, varDouble, varCurrency];
end;

function VarIsNumeric(const V: Variant): Boolean;
begin
  result := VarIsOrdinal(V) or VarIsFloat(V);
end;

function VarIsStr(const V: Variant): Boolean;
begin
  result := VarType(V) in [varOleStr];
end;


function VarToStr(const V: Variant): String;
begin
  result := VarToStrDef(V, '');
end;

function VarToStrDef(const V: Variant; const ADefault: String): String;
begin
  if (V.Value = nil) or (V.Value = DBNull.Value) then result := ADefault else result := V.Value.ToString;
end;

function VarToWideStr(const V: Variant): String;
begin
 result := VarToStr(V);
end;

function VarToWideStrDef(const V: Variant; const ADefault: String): String;
begin
 result := VarToStrDef(V, ADefault);
end;

function VarToDateTime(const V: Variant): TDateTime;
begin
  if VarType(V) = varOleStr then begin
    result := DateTime.Parse(String(V.Value));
  end else if VarType(V) = varDate then
    result := V.Value as DateTime
  else
    raise new EVariantTypeCastError('Invalid variant conversion');
end;

function VarFromDateTime(const DateTime: TDateTime): Variant;
begin
  result := new Variant(DateTime);
end;


function VarSameValue(const A, B: Variant): Boolean;
begin
  if (A.Value = nil) or (B.Value = nil) then result := A.Value = B.Value else begin
    result := A.Value.Equals(B.Value);
  end;
end;

function Unassigned: Variant;
begin
  result := Variant.Unassigned;
end;

function Null: Variant;
begin
  result := Variant.Null;
end;

constructor Variant(aValue: Object);
begin
  fValue := aValue;
end;

class operator Variant.Plus(val: Variant): Variant;
begin
  case VarType(val) of
    varByte,
    varDate,
    varDecimal,
    varDouble,
    varSmallint,
    varInteger,
    varInt64,
    varShortInt,
    varSingle,
    varWord,
    varLongWord,
    varWord64: result := val;
  else
    raise new EVariantInvalidOpError('Invalid Variant Operation');
  end; // case
end;

class operator Variant.Minus(val: Variant): Variant;
begin
  case VarType(val) of
    varDecimal: result := - Decimal(val.Value);
    varDouble: result := - Double(val.Value);
    varSmallint: result := - SmallInt(val.Value);
    varInteger: result := - Integer(val.Value);
    varInt64: result := - Int64(val.Value);
    varShortInt: result := - ShortInt(val.Value);
    varSingle: result := - Single(val.Value);
  else
    raise new EVariantInvalidOpError('Invalid Variant Operation');
  end; // case
end;

class operator Variant.BitwiseNot(val: Variant): Variant;
begin
  case VarType(val) of
    varBoolean: result := not Boolean(val.Value);
    varByte: result := not Byte(val.Value);
    varSmallint: result := not SmallInt(val.Value);
    varInteger: result := not Integer(val.Value);
    varInt64: result := not Int64(val.Value);
    varShortInt: result := not ShortInt(val.Value);
    varWord: result := not Word(val.Value);
    varLongWord: result := not LongWord(val.Value);
    varWord64: result := not UInt64(val.Value);
  else
    raise new EVariantInvalidOpError('Invalid Variant Operation');
  end; // case
end;

class operator Variant.Add(val1, val2: Variant): Variant;
begin
  case GetResultType(VarType(val1), VarType(val2), TBinOperator.otAdd) of
    varSmallint: Result := SmallInt(val1) + SmallInt(val2);
    varInteger:Result := Integer(val1) + Integer(val2);
    varSingle:Result := Single(val1) + Single(val2);
    varDouble:Result := Double(val1) + Double(val2);
    varDate:
      if VarType(val1) = varDate then Result := DateTime(val1).AddDays(Double(val2)) else Result := DateTime(val2).AddDays(Double(val1));
    varOleStr:Result := String(val1) + String(val2);
//    varBoolean:Result := Boolean(val1) + SmallInt(val2);
    varCurrency,
    varDecimal:Result := Decimal(val1) + Decimal(val2);
    varShortInt:Result := ShortInt(val1) + ShortInt(val2);
    varByte:Result := Byte(val1) + Byte(val2);
    varWord:Result := Word(val1) + Word(val2);
    varLongWord:Result := LongWord(val1) + LongWord(val2);
    varInt64:Result := Int64(val1) + Int64(val2);
    varWord64:Result := UInt64(val1) + UInt64(val2);
  else
    raise new EVariantInvalidOpError('Invalid Variant Operation');
  end; // case
end;

class operator Variant.Subtract(val1, val2: Variant): Variant;
begin
  case GetResultType(VarType(val1), VarType(val2), TBinOperator.otSub) of
    varSmallint: Result := SmallInt(val1) - SmallInt(val2);
    varInteger:Result := Integer(val1) - Integer(val2);
    varSingle:Result := Single(val1) - Single(val2);
    varDouble:Result := Double(val1) - Double(val2);
//    varOleStr:Result := String(val1) - String(val2);
//    varBoolean:Result := Boolean(val1) + SmallInt(val2);
    varCurrency,
    varDecimal:Result := Decimal(val1) - Decimal(val2);
    varShortInt:Result := ShortInt(val1) - ShortInt(val2);
    varByte:Result := Byte(val1) - Byte(val2);
    varWord:Result := Word(val1) - Word(val2);
    varLongWord:Result := LongWord(val1) - LongWord(val2);
    varInt64:Result := Int64(val1) - Int64(val2);
    varWord64:Result := UInt64(val1) - UInt64(val2);
  else
    raise new EVariantInvalidOpError('Invalid Variant Operation');
  end; // case
end;

class operator Variant.Multiply(val1, val2: Variant): Variant;
begin
  case GetResultType(VarType(val1), VarType(val2), TBinOperator.otMul) of
    varSmallint: Result := SmallInt(val1) * SmallInt(val2);
    varInteger:Result := Integer(val1) * Integer(val2);
    varSingle:Result := Single(val1) * Single(val2);
    varDouble:Result := Double(val1) * Double(val2);
    varCurrency,
    varDecimal:Result := Decimal(val1) * Decimal(val2);
    varShortInt:Result := ShortInt(val1) * ShortInt(val2);
    varByte:Result := Byte(val1) * Byte(val2);
    varWord:Result := Word(val1) * Word(val2);
    varLongWord:Result := LongWord(val1) * LongWord(val2);
    varInt64:Result := Int64(val1) * Int64(val2);
    varWord64:Result := UInt64(val1) * UInt64(val2);
  else
    raise new EVariantInvalidOpError('Invalid Variant Operation');
  end; // caseend;
end;

class operator Variant.Divide(val1, val2: Variant): Variant;
begin
  case GetResultType(VarType(val1), VarType(val2), TBinOperator.otDiv) of
    varSmallint: Result := SmallInt(val1) / SmallInt(val2);
    varInteger:Result := Integer(val1) / Integer(val2);
    varSingle:Result := Single(val1) / Single(val2);
    varDouble:Result := Double(val1) / Double(val2);
    varCurrency,
    varDecimal:Result := Decimal(val1) / Decimal(val2);
    varShortInt:Result := ShortInt(val1) / ShortInt(val2);
    varByte:Result := Byte(val1) / Byte(val2);
    varWord:Result := Word(val1) / Word(val2);
    varLongWord:Result := LongWord(val1) / LongWord(val2);
    varInt64:Result := Int64(val1) / Int64(val2);
    varWord64:Result := UInt64(val1) / UInt64(val2);
  else
    raise new EVariantInvalidOpError('Invalid Variant Operation');
  end; // caseend;
end;

class operator Variant.Modulus(val1, val2: Variant): Variant;
begin
  case GetResultType(VarType(val1), VarType(val2), TBinOperator.otMod) of
    varSmallint: Result := SmallInt(val1) mod SmallInt(val2);
    varInteger:Result := Integer(val1) mod Integer(val2);
    varShortInt:Result := ShortInt(val1) mod ShortInt(val2);
    varByte:Result := Byte(val1) mod Byte(val2);
    varWord:Result := Word(val1) mod Word(val2);
    varLongWord:Result := LongWord(val1) mod LongWord(val2);
    varInt64:Result := Int64(val1) mod Int64(val2);
    varWord64:Result := UInt64(val1) mod UInt64(val2);
  else
    raise new EVariantInvalidOpError('Invalid Variant Operation');
  end; // caseend;
end;

class operator Variant.BitwiseAnd(val1, val2: Variant): Variant;
begin
  case GetResultType(VarType(val1), VarType(val2), TBinOperator.otAnd) of
    varSmallint: Result := SmallInt(val1) and SmallInt(val2);
    varInteger:Result := Integer(val1) and Integer(val2);
    varShortInt:Result := ShortInt(val1) and ShortInt(val2);
    varBoolean: Result := Boolean(val1) and Boolean(val2);
    varByte:Result := Byte(val1) and Byte(val2);
    varWord:Result := Word(val1) and Word(val2);
    varLongWord:Result := LongWord(val1) and LongWord(val2);
    varInt64:Result := Int64(val1) and Int64(val2);
    varWord64:Result := UInt64(val1) and UInt64(val2);
  else
    raise new EVariantInvalidOpError('Invalid Variant Operation');
  end; // caseend;
end;

class operator Variant.BitwiseOr(val1, val2: Variant): Variant;
begin
  case GetResultType(VarType(val1), VarType(val2), TBinOperator.otOr) of
    varSmallint: Result := SmallInt(val1) or SmallInt(val2);
    varInteger:Result := Integer(val1) or Integer(val2);
    varShortInt:Result := ShortInt(val1) or ShortInt(val2);
    varBoolean: Result := Boolean(val1) or Boolean(val2);
    varByte:Result := Byte(val1) or Byte(val2);
    varWord:Result := Word(val1) or Word(val2);
    varLongWord:Result := LongWord(val1) or LongWord(val2);
    varInt64:Result := Int64(val1) or Int64(val2);
    varWord64:Result := UInt64(val1) or UInt64(val2);
  else
    raise new EVariantInvalidOpError('Invalid Variant Operation');
  end; // caseend;
end;

class operator Variant.BitwiseXor(val1, val2: Variant): Variant;
begin
  case GetResultType(VarType(val1), VarType(val2), TBinOperator.otXor) of
    varSmallint: Result := SmallInt(val1) xor SmallInt(val2);
    varInteger:Result := Integer(val1) xor Integer(val2);
    varShortInt:Result := ShortInt(val1) xor ShortInt(val2);
    varBoolean: Result := Boolean(val1) xor Boolean(val2);
    varByte:Result := Byte(val1) xor Byte(val2);
    varWord:Result := Word(val1) xor Word(val2);
    varLongWord:Result := LongWord(val1) xor LongWord(val2);
    varInt64:Result := Int64(val1) xor Int64(val2);
    varWord64:Result := UInt64(val1) xor UInt64(val2);
  else
    raise new EVariantInvalidOpError('Invalid Variant Operation');
  end; // caseend;
end;

class operator Variant.ShiftLeft(val1: Variant; val2: Integer): Variant;
begin
  case GetResultType(VarType(val1), VarType(val2), TBinOperator.otShl) of
    varSmallint: Result := SmallInt(val1) shl Integer(val2);
    varInteger:Result := Integer(val1) shl Integer(val2);
    varShortInt:Result := ShortInt(val1) shl Integer(val2);
    varByte:Result := Byte(val1) shl Integer(val2);
    varWord:Result := Word(val1) shl Integer(val2);
    varLongWord:Result := LongWord(val1) shl Integer(val2);
    varInt64:Result := Int64(val1) shl Integer(val2);
    varWord64:Result := UInt64(val1) shl Integer(val2);
  else
    raise new EVariantInvalidOpError('Invalid Variant Operation');
  end; // caseend;
end;

class operator Variant.ShiftRight(val1: Variant; val2: Integer): Variant;
begin
  case GetResultType(VarType(val1), VarType(val2), TBinOperator.otShr) of
    varSmallint: Result := SmallInt(val1) shr Integer(val2);
    varInteger:Result := Integer(val1) shr Integer(val2);
    varShortInt:Result := ShortInt(val1) shr Integer(val2);
    varByte:Result := Byte(val1) shr Integer(val2);
    varWord:Result := Word(val1) shr Integer(val2);
    varLongWord:Result := LongWord(val1) shr Integer(val2);
    varInt64:Result := Int64(val1) shr Integer(val2);
    varWord64:Result := UInt64(val1) shr Integer(val2);
  else
    raise new EVariantInvalidOpError('Invalid Variant Operation');
  end; // caseend;
end;

class operator Variant.Equal(val1, val2: Variant): Boolean;
begin
  case GetResultType(VarType(val1), VarType(val2), TBinOperator.otEqual) of
    varSmallint: Result := SmallInt(val1) = SmallInt(val2);
    varInteger:Result := Integer(val1) = Integer(val2);
    varSingle:Result := Single(val1) = Single(val2);
    varDouble:Result := Double(val1) = Double(val2);
    varDate:Result := DateTime(val1) = DateTime(val2);
    varOleStr:Result := String(val1) = String(val2);
    varBoolean:Result := Boolean(val1) = Boolean(val2);
    varCurrency,
    varDecimal:Result := Decimal(val1) = Decimal(val2);
    varShortInt:Result := ShortInt(val1) = ShortInt(val2);
    varByte:Result := Byte(val1) = Byte(val2);
    varWord:Result := Word(val1) = Word(val2);
    varLongWord:Result := LongWord(val1) = LongWord(val2);
    varInt64:Result := Int64(val1) = Int64(val2);
    varWord64:Result := UInt64(val1) = UInt64(val2);
  else
    raise new EVariantInvalidOpError('Invalid Variant Operation');
  end; // case
end;

class operator Variant.NotEqual(val1, val2: Variant): Boolean;
begin
  case GetResultType(VarType(val1), VarType(val2), TBinOperator.otNotEqual) of
    varSmallint: Result := SmallInt(val1) <> SmallInt(val2);
    varInteger:Result := Integer(val1) <> Integer(val2);
    varSingle:Result := Single(val1) <> Single(val2);
    varDouble:Result := Double(val1) <> Double(val2);
    varDate:Result := DateTime(val1) <> DateTime(val2);
    varOleStr:Result := String(val1) <> String(val2);
    varBoolean:Result := Boolean(val1) <> Boolean(val2);
    varCurrency,
    varDecimal:Result := Decimal(val1) <> Decimal(val2);
    varShortInt:Result := ShortInt(val1) <> ShortInt(val2);
    varByte:Result := Byte(val1) <> Byte(val2);
    varWord:Result := Word(val1) <> Word(val2);
    varLongWord:Result := LongWord(val1) <> LongWord(val2);
    varInt64:Result := Int64(val1) <> Int64(val2);
    varWord64:Result := UInt64(val1) <> UInt64(val2);
  else
    raise new EVariantInvalidOpError('Invalid Variant Operation');
  end; // case
end;

class operator Variant.Less(val1, val2: Variant): Boolean;
begin
  case GetResultType(VarType(val1), VarType(val2), TBinOperator.otLess) of
    varSmallint: Result := SmallInt(val1) < SmallInt(val2);
    varInteger:Result := Integer(val1) < Integer(val2);
    varSingle:Result := Single(val1) < Single(val2);
    varDouble:Result := Double(val1) < Double(val2);
    varDate:Result := DateTime(val1) < DateTime(val2);
    varOleStr:Result := String(val1) < String(val2);
    varCurrency,
    varDecimal:Result := Decimal(val1) < Decimal(val2);
    varShortInt:Result := ShortInt(val1) < ShortInt(val2);
    varByte:Result := Byte(val1) < Byte(val2);
    varWord:Result := Word(val1) < Word(val2);
    varLongWord:Result := LongWord(val1) < LongWord(val2);
    varInt64:Result := Int64(val1) < Int64(val2);
    varWord64:Result := UInt64(val1) < UInt64(val2);
  else
    raise new EVariantInvalidOpError('Invalid Variant Operation');
  end; // case
end;

class operator Variant.Greater(val1, val2: Variant): Boolean;
begin
  case GetResultType(VarType(val1), VarType(val2), TBinOperator.otGreater) of
    varSmallint: Result := SmallInt(val1) > SmallInt(val2);
    varInteger:Result := Integer(val1) > Integer(val2);
    varSingle:Result := Single(val1) > Single(val2);
    varDouble:Result := Double(val1) > Double(val2);
    varDate:Result := DateTime(val1) > DateTime(val2);
    varOleStr:Result := String(val1) > String(val2);
    varCurrency,
    varDecimal:Result := Decimal(val1) > Decimal(val2);
    varShortInt:Result := ShortInt(val1) > ShortInt(val2);
    varByte:Result := Byte(val1) > Byte(val2);
    varWord:Result := Word(val1) > Word(val2);
    varLongWord:Result := LongWord(val1) > LongWord(val2);
    varInt64:Result := Int64(val1) > Int64(val2);
    varWord64:Result := UInt64(val1) > UInt64(val2);
  else
    raise new EVariantInvalidOpError('Invalid Variant Operation');
  end; // case
end;

class operator Variant.LessOrEqual(val1, val2: Variant): Boolean;
begin
  case GetResultType(VarType(val1), VarType(val2), TBinOperator.otLessEqual) of
    varSmallint: Result := SmallInt(val1) <= SmallInt(val2);
    varInteger:Result := Integer(val1) <= Integer(val2);
    varSingle:Result := Single(val1) <= Single(val2);
    varDouble:Result := Double(val1) <= Double(val2);
    varDate:Result := DateTime(val1) <= DateTime(val2);
    varOleStr:Result := String(val1) <= String(val2);
    varCurrency,
    varDecimal:Result := Decimal(val1) <= Decimal(val2);
    varShortInt:Result := ShortInt(val1) <= ShortInt(val2);
    varByte:Result := Byte(val1) <= Byte(val2);
    varWord:Result := Word(val1) <= Word(val2);
    varLongWord:Result := LongWord(val1) <= LongWord(val2);
    varInt64:Result := Int64(val1) <= Int64(val2);
    varWord64:Result := UInt64(val1) <= UInt64(val2);
  else
    raise new EVariantInvalidOpError('Invalid Variant Operation');
  end; // case
end;

class operator Variant.GreaterOrEqual(val1, val2: Variant): Boolean;
begin
  case GetResultType(VarType(val1), VarType(val2), TBinOperator.otGreaterEqual) of
    varSmallint: Result := SmallInt(val1) >= SmallInt(val2);
    varInteger:Result := Integer(val1) >= Integer(val2);
    varSingle:Result := Single(val1) >= Single(val2);
    varDouble:Result := Double(val1) >= Double(val2);
    varDate:Result := DateTime(val1) >= DateTime(val2);
    varOleStr:Result := String(val1) >= String(val2);
    varCurrency,
    varDecimal:Result := Decimal(val1) >= Decimal(val2);
    varShortInt:Result := ShortInt(val1) >= ShortInt(val2);
    varByte:Result := Byte(val1) >= Byte(val2);
    varWord:Result := Word(val1) >= Word(val2);
    varLongWord:Result := LongWord(val1) >= LongWord(val2);
    varInt64:Result := Int64(val1) >= Int64(val2);
    varWord64:Result := UInt64(val1) >= UInt64(val2);
  else
    raise new EVariantInvalidOpError('Invalid Variant Operation');
  end; // case
end;

class operator Variant.implicit(val: Boolean): Variant;
begin
  result := new Variant(val);
end;

class operator Variant.implicit(val: Byte): Variant;
begin
  result := new Variant(val);
end;

class operator Variant.implicit(val: DateTime): Variant;
begin
  result := new Variant(val);
end;

class operator Variant.implicit(val: Decimal): Variant;
begin
  result := new Variant(val);
end;

class operator Variant.implicit(val: Double): Variant;
begin
  result := new Variant(val);
end;

class operator Variant.implicit(val: Int16): Variant;
begin
  result := new Variant(val);
end;

class operator Variant.implicit(val: Int32): Variant;
begin
  result := new Variant(val);
end;

class operator Variant.implicit(val: Int64): Variant;
begin
  result := new Variant(val);
end;

class operator Variant.implicit(val: SByte): Variant;
begin
  result := new Variant(val);
end;

class operator Variant.implicit(val: Single): Variant;
begin
  result := new Variant(val);
end;

class operator Variant.implicit(val: String): Variant;
begin
  if val = nil then result := Variant.Unassigned else  result := new Variant(val);
end;

class operator Variant.implicit(val: UInt16): Variant;
begin
  result := new Variant(val);
end;

class operator Variant.implicit(val: UInt32): Variant;
begin
  result := new Variant(val);
end;

class operator Variant.implicit(val: UInt64): Variant;
begin
  result := new Variant(val);
end;

class operator Variant.implicit(val: Variant): Boolean;
begin
  result := Convert.ToBoolean(val.Value);
end;

class operator Variant.implicit(val: Variant): Byte;
begin
  result := Convert.ToByte(val.Value);
end;

class operator Variant.implicit(val: Variant): DateTime;
begin
  result := Convert.ToDateTime(val.Value);
end;

class operator Variant.implicit(val: Variant): Decimal;
begin
  result := Convert.ToDecimal(val.Value);
end;

class operator Variant.implicit(val: Variant): Double;
begin
  result := Convert.ToDouble(val.Value);
end;

class operator Variant.implicit(val: Variant): Int16;
begin
  result := Convert.ToInt16(val.Value);
end;

class operator Variant.implicit(val: Variant): Int32;
begin
  result := Convert.ToInt32(val.Value);
end;

class operator Variant.implicit(val: Variant): Int64;
begin
  result := Convert.ToInt64(val.Value);
end;

class operator Variant.implicit(val: Variant): SByte;
begin
  result := Convert.ToSByte(val.Value);
end;

class operator Variant.implicit(val: Variant): Single;
begin
  result := Convert.ToSingle(val.Value);
end;

class operator Variant.implicit(val: Variant): String;
begin
  result := Convert.ToString(val.Value);
end;

class operator Variant.implicit(val: Variant): UInt16;
begin
  result := Convert.ToUInt16(val.Value);
end;

class operator Variant.implicit(val: Variant): UInt32;
begin
  result := Convert.ToUInt32(val.Value);
end;

class operator Variant.implicit(val: Variant): UInt64;
begin
  result := Convert.ToUInt64(val.Value);
end;

class method Variant.IsIntType(b: TVarType): Boolean;
begin
  case b of
    varByte,
    varSmallint,
    varInteger,
    varInt64,
    varShortInt,
    varWord,
    varLongWord,
    varWord64: result := true;
  end; // case
end;

class method Variant.IsIntRealType(b: TVarType): Boolean;
begin
  case b of 
    varByte,
    varDouble,
    varSmallint,
    varInteger,
    varInt64,
    varShortInt,
    varSingle,
    varWord,
    varLongWord,
    varWord64,
    varDecimal: result := true;
  end;
end;

class method Variant.GetHighestType(A,B: TVarType): TVarType;
begin
  var lASigned: Boolean := false;
  var lBSigned: Boolean := false;
  case A of
    varShortInt: begin lASigned := true; A := varByte; end;
    varInteger: begin lASigned := true; A := varLongWord; end;
    varInt64: begin lASigned := true; A := varWord64; end;
    varSmallint: begin lASigned := true; A := varWord; end;
  end; // case
  case B of
    varShortInt: begin lBSigned := true; B := varByte; end;
    varInteger: begin lBSigned := true; B := varLongWord; end;
    varInt64: begin lBSigned := true; B := varWord64; end;
    varSmallint: begin lBSigned := true; B := varWord; end;
  end; // case

  result := iif(A > B, A, B);

  if lASigned or lBSigned then begin
    case B of
      varByte: Result := varShortInt;
      varLongWord: Result := varInteger;
      varWord64: result := varInt64;
      varWord: result := varSmallint;
    end; // case
  end;
end;

class method Variant.GetResultType(t1,t2: TVarType; op: TBinOperator): TVarType;
begin
  case op of
    TBinOperator.otAdd: 
      if IsIntType(t1) and (t2 = varDate) then exit(t2) else
      if IsIntType(t2) and (t1 = varDate) then exit(t1) else
      if IsIntType(t1) and IsIntType(t2) then exit(GetHighestType(t1, t2)) else 
      if IsIntRealType(t1) and IsIntRealType(t2) then begin
        if t1 in [varDouble, varSingle, varDecimal] then exit t1 else exit t2;
      end else if (t1 = varOleStr) and (t2 = varOleStr) then exit(t1);
    TBinOperator.otSub: 
      if IsIntType(t1) and IsIntType(t2) then exit(GetHighestType(t1, t2)) else 
      if IsIntRealType(t1) and IsIntRealType(t2) then begin
        if t1 in [varDouble, varSingle, varDecimal] then exit t1 else exit t2;
      end;
    TBinOperator.otMul,
    TBinOperator.otIntDiv,
    TBinOperator.otDiv:
      if IsIntType(t1) and IsIntType(t2) then
        exit GetHighestType(t1, t2)
      else if IsIntRealType(t1) and IsIntRealType(t2) then begin
        if t1 in [varDouble, varSingle, varDecimal] then exit t1 else exit t2;
      end;
    TBinOperator.otAnd,
    TBinOperator.otOr,
    TBinOperator.otXor:
      if IsIntType(t1) and IsIntType(t2) then
        exit GetHighestType(t1, t2)
      else if (t1 = varBoolean) or (t2 = varBoolean) then
        exit t1;
    TBinOperator.otMod:
      if IsIntType(t1) and IsIntType(t2) then 
        exit GetHighestType(t1, t2);
    TBinOperator.otShl,
    TBinOperator.otShr:
      if IsIntType(t1) and IsIntType(t2) then exit t1;
    TBinOperator.otGreater,
    TBinOperator.otLess,
    TBinOperator.otGreaterEqual,
    TBinOperator.otLessEqual:
      begin
        if IsIntType(t1) and IsIntType(t2) then exit GetHighestType(t1, t2) else
        if IsIntRealType(t1) and IsIntRealType(t2) then begin
          if t1 in [varDouble, varSingle, varDecimal] then exit t1 else exit t2;
        end else if (t1 = varOleStr) and (t2 = varOleStr) then exit t1;
      end;
    else begin
      //TBinOperator.otEqual:
      //TBinOperator.otNotEqual:
      if IsIntType(t1) and IsIntType(t2) then exit GetHighestType(t1, t2) else
      if IsIntRealType(t1) and IsIntRealType(t2) then begin
        if t1 in [varDouble, varSingle, varDecimal] then exit t1 else exit t2;
      end else if (t1 = t2) then exit t1;
    end;
  end; // case
end;

end.