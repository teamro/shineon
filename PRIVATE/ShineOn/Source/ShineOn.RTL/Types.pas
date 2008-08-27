// The contents of this file are subject to the Mozilla Public License Version 1.1 (the "License"); 
// you may not use this file except in compliance with the License. You may obtain a copy of the 
// License at http://www.mozilla.org/MPL/ 
// 
// Software distributed under the License is distributed on an "AS IS" basis, WITHOUT WARRANTY OF 
// ANY KIND, either express or implied. See the License for the specificlanguage governing rights and 
// limitations under the License.

namespace ShineOn.Rtl;

interface

uses
  System,
  System.Collections,
  System.Globalization,
  System.IO,
  System.Reflection.Emit,
  System.Runtime.Remoting.Activation,
  System.Text,
  System.Runtime.InteropServices, 
  System.Windows.Forms; // for guid attribute and FILETIME
  
type
{ TStream seek origins }
  TSeekOrigin = public (Beginning, Current, &End);

type  
  HRESULT = public LongInt;

  TGUID = public System.Guid;
  DWORD = public LongWord;

  TIntegerDynArray      = public array of Integer;
  TCardinalDynArray     = public array of Cardinal;
  TWordDynArray         = public array of Word;
  TSmallIntDynArray     = public array of SmallInt;
  TByteDynArray         = public array of Byte;
  TShortIntDynArray     = public array of ShortInt;
  TInt64DynArray        = public array of Int64;
  TLongWordDynArray     = public array of LongWord;
  TSingleDynArray       = public array of Single;
  TDoubleDynArray       = public array of Double;
  TBooleanDynArray      = public array of Boolean;
  TStringDynArray       = public array of String;
  TWideStringDynArray   = public array of WideString;

  TPoint = public System.Drawing.Point;
  TRect = public System.Drawing.Rectangle; 
  TSize = public System.Drawing.Size;
  TSmallPoint = public System.Drawing.Point;

  TOleChar = public WideChar;
  
  TCLSID = public TGUID;

  Largeint = public Int64;
  
  LCID = public Word;
  LANGID = public Word;

  TFileTime = public FILETIME;

  IUnknown = public interface // there's no "root" interface type in .NET
  end;
    

  // Exceptions

  EOutOfMemory = public OutOfMemoryException;

  EInOutError = public IOException;
  EExternal = public SystemException;
  EExternalException = public SystemException;

  EIntError = public ArithmeticException;
  EDivByZero = public DivideByZeroException;
  ERangeError = public IndexOutOfRangeException ;
  EIntOverflow = public OverflowException;

  EMathError = public ArithmeticException;
  EInvalidOp = public InvalidOperationException;
  EZeroDivide = public DivideByZeroException;
  EOverflow = public OverflowException;
  EUnderflow = public OverflowException;

  EInvalidPointer = public AccessViolationException;

  EInvalidCast = public InvalidCastException;

  EConvertError = public FormatException;

  EAccessViolation = public AccessViolationException;
  EStackOverflow = public StackOverflowException;
  

type

{ Text alignment types }
  TAlignment = public (LeftJustify, RightJustify, Center);
  TLeftRight = public (taLeftJustify,taRightJustify); //!!! Not compatible with global taLeftJustify/taRightJustify
  TBiDiMode = public (LeftToRight, RightToLeft, RightToLeftNoAlign, RightToLeftReadingOnly);
  TShiftState = public set of (Shift, Alt, Ctrl, Left, Right, Middle, Double);
  THelpType = public (Keyword, Context);
  
  
{ Types used by standard events }
type

{ Standard events }

  TNotifyEvent = public procedure(Sender: Object) of object;
  TGetStrProc = public procedure(S: String) of object;

{ Exception classes }

  (*
  EFCreateError = public class(EStreamError);
  EFOpenError = public class(EStreamError);
  EClassNotFound = public class(EFilerError);
  EMethodNotFound = public class(EFilerError);
  EInvalidImage = public class(EFilerError);
  EResNotFound = public class(Exception);
  EBitsError = public class(Exception);
  EStringListError = public class(Exception);
  EComponentError = public class(Exception);
  EParserError = public class(Exception);
  EOutOfResources = public class(EOutOfMemory);*)
  EStreamError = public class(Exception);
  EFilerError = public class(EStreamError);
  EReadError = public class(EFilerError);
  EWriteError = public class(EFilerError);
  EListError = public class(Exception);
  EInvalidOperation = public InvalidOperationException;

{ Duplicate management }

  TDuplicates = public (Ignore, Accept, Error);
  

type
{ TList class }

  TTextLineBreakStyle = public (LF, CRLF);
  
type  
  THandle = public IntPtr;
  Currency = public Decimal;     
    

type
  DelphiString = public sealed class(ICollection)
  private
    fChars: Array of Char;
  public
    constructor;
    constructor (aEncoding: Encoding := nil; aData: Array of Byte);
    constructor (aOriginal: DelphiString);
    constructor (aChars: Array of Char);
    constructor (aOriginal: String);
    
    class operator &Add(const Left, Right: DelphiString): DelphiString;
    class operator Equal(const Left, Right: DelphiString): Boolean;
    class operator NotEqual(const Left, Right: DelphiString): Boolean;
    class operator Less(const Left, Right: DelphiString): Boolean;
    class operator LessOrEqual(const Left, Right: DelphiString): Boolean;
    class operator Greater(const Left, Right: DelphiString): Boolean;
    class operator GreaterOrEqual(const Left, Right: DelphiString): Boolean;

    class operator &Add(const Left: String; Right: DelphiString): DelphiString;
    class operator Equal(const Left: String; Right: DelphiString): Boolean;
    class operator NotEqual(const Left: String; Right: DelphiString): Boolean;
    class operator Less(const Left: String; Right: DelphiString): Boolean;
    class operator LessOrEqual(const Left: String; Right: DelphiString): Boolean;
    class operator Greater(const Left: String; Right: DelphiString): Boolean;
    class operator GreaterOrEqual(const Left: String; Right: DelphiString): Boolean;

    class operator &Add(const Left: DelphiString; aRight: String): DelphiString;
    class operator Equal(const Left: DelphiString; aRight: String): Boolean;
    class operator NotEqual(const Left: DelphiString; aRight: String): Boolean;
    class operator Less(const Left: DelphiString; aRight: String): Boolean;
    class operator LessOrEqual(const Left: DelphiString; aRight: String): Boolean;
    class operator Greater(const Left: DelphiString; aRight: String): Boolean;
    class operator GreaterOrEqual(const Left: DelphiString; aRight: String): Boolean;

    class operator Implicit(const Value: Char): DelphiString;
    class operator Implicit(const Value: String): DelphiString;
    class operator Implicit(const Value: DelphiString): String;

    class operator Implicit(const Value: Array of Char): DelphiString;
    class operator Explicit(const Value: DelphiString): Array of Char;

    class operator Implicit(const Value: Array of Byte): DelphiString;
    class operator Explicit(const Value: DelphiString): Array of Byte;

    method ToBytes(aEncoding: Encoding := nil): Array of Byte;

    method Duplicate: DelphiString;

    method SetLength(aNewLength: Integer);
    property Length: Integer read RemObjects.Oxygene.System.Length(fChars); implements ICollection.Count;
    property Chars[i: Integer]: Char read fChars[i+1] write fChars[i+1]; default;
    property CharData: Array of Char read fChars write fChars; 

    method ToString: String; override;
    method CopyTo(array: System.Array; index: System.Int32);

    {$REGION ICollection}
    property SyncRoot: Object read self;
    property IsSynchronized: Boolean read false;
    method GetEnumerator: IEnumerator;
    {$ENDREGION}
  end;
  
function EqualRect(const R1, R2: TRect): Boolean;
function Rect(Left, Top, Right, Bottom: Integer): TRect;
function Bounds(ALeft, ATop, AWidth, AHeight: Integer): TRect;
function Point(X, Y: Integer): TPoint;
function SmallPoint(X, Y: Integer): TSmallPoint;
function SmallPoint(XY: LongWord): TSmallPoint;
function PtInRect(const aRect: TRect; const P: TPoint): Boolean;
function IntersectRect(out aRect: TRect; const R1, R2: TRect): Boolean;
function UnionRect(out aRect: TRect; const R1, R2: TRect): Boolean;
function IsRectEmpty(const aRect: TRect): Boolean;
function OffsetRect(var aRect: TRect; DX: Integer; DY: Integer): Boolean;
function CenterPoint(const aRect: TRect): TPoint;
  
implementation

function EqualRect(const R1, R2: TRect): Boolean;
begin
  Result := ((R1.Left = R2.Left) and (R1.Top = R2.Top) and (R1.Right = R2.Right) and (R1.Bottom = R2.Bottom));
end;

function Rect(Left, Top, Right, Bottom: Integer): TRect;
begin
  Result := new TRect(Left,Top,Right - Left,Bottom - Top);
end;

function Bounds(ALeft, ATop, AWidth, AHeight: Integer): TRect;
begin
  Result := new TRect(ALeft,ATop,AWidth,AHeight);
end;

function Point(X, Y: Integer): TPoint;
begin
  Result := new TPoint(X,Y);
end;

function SmallPoint(X, Y: Integer): TSmallPoint; 
begin
  Result := new TSmallPoint(X,Y);
end;

function SmallPoint(XY: LongWord): TSmallPoint;
begin
  Result := new TSmallPoint(XY);
end;

function PtInRect(const aRect: TRect; const P: TPoint): Boolean;
begin
  Result :=  ((P.X >= aRect.Left) and (P.X <= aRect.Right) and (P.Y >= aRect.Top) and (P.Y <= aRect.Bottom));
end;

function IntersectRect(out aRect: TRect; const R1, R2: TRect): Boolean;
begin
  aRect := R1;

  if R2.Left > R1.Left then aRect.X := R2.X;
  if R2.Top > R1.Top then aRect.Y := R2.Y;
  if R2.Right < R1.Right then aRect.Width := (R2.Right - R2.Left);
  if R2.Bottom < R1.Bottom then aRect.Height := (R2.Bottom - R2.Top);

  Result := not IsRectEmpty(aRect);

  if not Result then aRect := new TRect(0,0,0,0);
end;

function UnionRect(out aRect: TRect; const R1, R2: TRect): Boolean;
begin
  aRect := R1;

  if not IsRectEmpty(R2) then
    begin
      if R2.Left < R1.Left then aRect.X := R2.X;
      if R2.Top < R1.Top then aRect.Y := R2.Y;
      if R2.Right > R1.Right then aRect.Width := (R2.Right - R2.Left);
      if R2.Bottom > R1.Bottom then aRect.Height := (R2.Bottom - R2.Top);
    end;

  Result := not IsRectEmpty(aRect);

  if not Result then aRect := new TRect(0,0,0,0);
end;

function IsRectEmpty(const aRect: TRect): Boolean;
begin
  Result := (aRect.Right <= aRect.Left) or (aRect.Bottom <= aRect.Top);
end;

function OffsetRect(var aRect: TRect; DX: Integer; DY: Integer): Boolean;
begin
  if aRect <> nil then
    begin
      aRect.X := aRect.X + DX;
      aRect.Width := aRect.Right + DX;
      aRect.Y := aRect.Y + DY;
      aRect.Height := aRect.Bottom + DY;

      Result := True;
    end
  else
    Result := False;
end;

function CenterPoint(const aRect: TRect): TPoint;
begin
  with aRect do
    begin
      Result.X := (Right - Left) div 2 + Left;
      Result.Y := (Bottom - Top) div 2 + Top;
    end;
end;

{ DelphiString }

constructor DelphiString;
begin
end;

constructor DelphiString(aEncoding: Encoding := nil; aData: Array of Byte);
begin
  if aData <> nil then begin 
    if aEncoding = nil then aEncoding := Encoding.Default;
    fChars := aEncoding.GetChars(aData, 0, aData.Length);
  end;
end;

constructor DelphiString(aOriginal: DelphiString);
begin
  if assigned(aOriginal) then begin
    if aOriginal.fChars <> nil then begin
      fChars := new Char[aOriginal.fChars.Length];
      Array.Copy(aOriginal.fChars, 0, fChars, 0, fChars.Length);
    end;
  end;
end;

constructor DelphiString(aOriginal: String);
begin
  if assigned(aOriginal) then fChars := aOriginal.ToCharArray;
end;


constructor DelphiString(aChars: Array of Char);
begin
  if aChars <> nil then begin
    fChars := new Char[aChars.Length];
    Array.Copy(aChars, 0, fChars, 0, aChars.Length);
  end;
end;

class operator DelphiString.Add(const Left, Right: DelphiString): DelphiString;
begin
  result := new DelphiString;
  result.SetLength(valueOrDefault(Left:Length)+valueOrDefault(Right:Length));
  if (Left <> nil) and (Left.CharData <> nil) then 
    Array.Copy(Left.CharData, 0, result.CharData, 0, Left.CharData.Length);
  if (Right <> nil) and (Right.CharData <> nil) then 
    Array.Copy(Right.CharData, 0, result.CharData, valueOrDefault(Right:Length), Right.CharData.Length);
end;

class operator DelphiString.Equal(const Left, Right: DelphiString): Boolean;
begin
  var lLeft := Left:CharData;
  var lRight := Right:CharData;
  if (RemObjects.Oxygene.System.length(lLeft) = 0) and (RemObjects.Oxygene.System.length(lRight) = 0) then exit(true);
  if (RemObjects.Oxygene.System.length(lLeft) = 0) or 
    (RemObjects.Oxygene.System.length(lRight) = 0) then exit(false);
  for i: Integer := 0 to Math.Max(lLeft.Length, lRight.Length) -1 do begin
    if i >= lLeft.Length then exit(false);
    if i >= lRight.Length then exit(false);
    if lRight[i] <> lLeft[i] then exit false;
  end;
  exit true;
end;

class operator DelphiString.NotEqual(const Left, Right: DelphiString): Boolean;
begin
  result := not (Left = Right);
end;

class operator DelphiString.Less(const Left, Right: DelphiString): Boolean;
begin
  var lLeft := Left:CharData;
  var lRight := Right:CharData;
  if (RemObjects.Oxygene.System.length(lLeft) = 0) and (RemObjects.Oxygene.System.length(lRight) = 0) then exit(false);
  if (RemObjects.Oxygene.System.length(lLeft) = 0) then exit(true); 
  if (RemObjects.Oxygene.System.length(lRight) = 0) then exit(false);

  for i: Integer := 0 to Math.Max(lLeft.Length, lRight.Length) -1 do begin
    if i >= lLeft.Length then exit(true);
    if i >= lRight.Length then exit(false);
    if lRight[i] < lLeft[i] then exit true;
    if lRight[i] > lLeft[i] then exit false;
  end;
  exit true;
end;

class operator DelphiString.LessOrEqual(const Left, Right: DelphiString): Boolean;
begin
  result := not (Left > Right);
end;

class operator DelphiString.Greater(const Left, Right: DelphiString): Boolean;
begin
  var lLeft := Left:CharData;
  var lRight := Right:CharData;
  if (RemObjects.Oxygene.System.length(lLeft) = 0) and (RemObjects.Oxygene.System.length(lRight) = 0) then exit(false);
  if (RemObjects.Oxygene.System.length(lLeft) = 0) then exit(false); 
  if (RemObjects.Oxygene.System.length(lRight) = 0) then exit(true);

  for i: Integer := 0 to Math.Max(lLeft.Length, lRight.Length) -1 do begin
    if i >= lLeft.Length then exit(false);
    if i >= lRight.Length then exit(true);
    if lRight[i] < lLeft[i] then exit false;
    if lRight[i] > lLeft[i] then exit true;
  end;
  exit true;
end;

class operator DelphiString.GreaterOrEqual(const Left, Right: DelphiString): Boolean;
begin
  result := not (Left < Right);
end;

class operator DelphiString.Add(const Left: String; Right: DelphiString): DelphiString;
begin
  result := DelphiString(Left + String(Right));
end;

class operator DelphiString.Equal(const Left: String; Right: DelphiString): Boolean;
begin
  result := Left = String(Right);
end;

class operator DelphiString.NotEqual(const Left: String; Right: DelphiString): Boolean;
begin
  result := Left <> String(Right);
end;

class operator DelphiString.Less(const Left: String; Right: DelphiString): Boolean;
begin
  result := Left < String(Right);
end;

class operator DelphiString.LessOrEqual(const Left: String; Right: DelphiString): Boolean;
begin
  result := Left <= String(Right);
end;

class operator DelphiString.Greater(const Left: String; Right: DelphiString): Boolean;
begin
  result := Left > String(Right);
end;

class operator DelphiString.GreaterOrEqual(const Left: String; Right: DelphiString): Boolean;
begin
  result := Left >= String(Right);
end;

class operator DelphiString.Add(const Left: DelphiString; aRight: String): DelphiString;
begin
  Result := DelphiString(String(Left) + aRight);
end;

class operator DelphiString.Equal(const Left: DelphiString; aRight: String): Boolean;
begin
  result := String(Left) = aRight;
end;

class operator DelphiString.NotEqual(const Left: DelphiString; aRight: String): Boolean;
begin
  result := String(Left) <> aRight;
end;

class operator DelphiString.Less(const Left: DelphiString; aRight: String): Boolean;
begin
  result := String(Left) < aRight;
end;

class operator DelphiString.LessOrEqual(const Left: DelphiString; aRight: String): Boolean;
begin
  result := String(Left) <= aRight;
end;

class operator DelphiString.Greater(const Left: DelphiString; aRight: String): Boolean;
begin
  result := String(Left) > aRight;
end;

class operator DelphiString.GreaterOrEqual(const Left: DelphiString; aRight: String): Boolean;
begin
  result := String(Left) >= aRight;
end;

class operator DelphiString.Implicit(const Value: String): DelphiString;
begin
  result := new DelphiString(Value);
end;

class operator DelphiString.Implicit(const Value: DelphiString): String;
begin
  if (Value = nil) then exit(nil);
  if Value.fChars = nil then exit('');
  result := new String(Value.fChars);
end;

class operator DelphiString.Implicit(const Value: Array of Char): DelphiString;
begin
  result := new DelphiString(Value);
end;

class operator DelphiString.Explicit(const Value: DelphiString): Array of Char;
begin
  if Value = nil then 
     result := new Char[0] 
  else 
    result := Value.Duplicate().fChars;
end;

class operator DelphiString.Implicit(const Value: Array of Byte): DelphiString;
begin
  result := new DelphiString(Value);
end;

class operator DelphiString.Explicit(const Value: DelphiString): Array of Byte;
begin
  if Value = nil then result := new Byte[0] else
  result := Value.ToBytes;
end;

class operator DelphiString.Implicit(const Value: Char): DelphiString;
begin
  result := new DelphiString(Value);
end;

method DelphiString.ToBytes(aEncoding: Encoding := nil): Array of Byte;
begin
  if aEncoding = nil then aEncoding := Encoding.Default;
  if fChars = nil then 
    result := new Byte[0] 
  else 
    result := aEncoding.GetBytes(fChars);
end;

method DelphiString.Duplicate: DelphiString;
begin
  result := new DelphiString(self);
end;

method DelphiString.SetLength(aNewLength: Integer);
begin
  if RemObjects.Oxygene.System.length(fChars) = aNewLength then exit;
  if fChars = nil then fChars := new Char[aNewLength] else begin
    var lNewChars := new Char[aNewLength];
    var lCopyLength := Math.Min(fChars.Length, aNewLength);
    if lCopyLength > 0 then Array.Copy(fChars, 0, lNewChars, 0, lCopyLength);
    fChars := lNewChars;
  end;
end;

method DelphiString.ToString: String;
begin
  result := String(self);
end;

method DelphiString.CopyTo(array: System.Array; index: System.Int32);
begin
end;

method DelphiString.GetEnumerator: System.Collections.IEnumerator;
begin
  result := fChars.GetEnumerator;
end;

end.


