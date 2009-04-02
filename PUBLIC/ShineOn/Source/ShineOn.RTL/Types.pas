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

  TSeekOrigin = public System.IO.SeekOrigin;

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
    
  IInterface = public IUnknown; // Delphi's interfaces are always IUnknown
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
  TAlignment = public System.Windows.Forms.HorizontalAlignment;
  TLeftRight = public enum(LeftJustify,RightJustify); //!!! Not compatible with global taLeftJustify/taRightJustify
  TBiDiMode = public enum(LeftToRight, RightToLeft, RightToLeftNoAlign, RightToLeftReadingOnly);
  TShiftState = public flags(Shift, Alt, Ctrl, Left, Right, Middle, Double);
  THelpType = public enum(Keyword, Context);
  
  
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

  TDuplicates = public enum(Ignore, Accept, Error);
  

type
{ TList class }

  TTextLineBreakStyle = public enum(LF, CRLF);
  
type  
  THandle = public IntPtr;
  Currency = public Decimal;     
    
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

end.


