namespace ShineOn.Rtl;

interface

uses
  System.Collections,
  System.Globalization,
  System.Text, 
  System.Xml,
  System.Xml.Serialization;

type
  DelphiString = public sealed class(ICollection, IXmlSerializable)
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
    class operator &Add(const Left: DelphiString; aRight: Char): DelphiString;

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
    property Chars[i: Integer]: Char read fChars[i-1] write fChars[i-1]; default;
    property CharData: Array of Char read fChars write fChars; 

    method ToString: String; override;
    method CopyTo(array: System.Array; index: System.Int32);
  protected
    {$REGION IXmlSerializable}
    method GetSchema: System.Xml.Schema.XmlSchema; empty;
    method ReadXml(reader: System.Xml.XmlReader);
    method WriteXml(writer: System.Xml.XmlWriter);    
    {$ENDREGION}
    
    {$REGION ICollection}
    property SyncRoot: Object read self;
    property IsSynchronized: Boolean read false;
    method GetEnumerator: IEnumerator;
    {$ENDREGION}
  end;
  
implementation

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
    Array.Copy(Right.CharData, 0, result.CharData, valueOrDefault(Left:Length), Right.CharData.Length);
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
    if lLeft[i] < lRight[i] then exit true;
    if lLeft[i] > lRight[i] then exit false;
  end;
  exit false;
end;

class operator DelphiString.LessOrEqual(const Left, Right: DelphiString): Boolean;
begin
  result := (Left > Right);
  result := not result;
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
    if lLeft[i] < lRight[i] then exit false;
    if lLeft[i] > lRight[i] then exit true;
  end;
  exit false;
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
  result := DelphiString(Left) = (Right);
end;

class operator DelphiString.NotEqual(const Left: String; Right: DelphiString): Boolean;
begin
  result := DelphiString(Left) <> (Right);
end;

class operator DelphiString.Less(const Left: String; Right: DelphiString): Boolean;
begin
  result := DelphiString(Left) < (Right);
end;

class operator DelphiString.LessOrEqual(const Left: String; Right: DelphiString): Boolean;
begin
  result := DelphiString(Left) <= (Right);
end;

class operator DelphiString.Greater(const Left: String; Right: DelphiString): Boolean;
begin
  result := DelphiString(Left) > (Right);
end;

class operator DelphiString.GreaterOrEqual(const Left: String; Right: DelphiString): Boolean;
begin
  result := DelphiString(Left) >= (Right);
end;

class operator DelphiString.Add(const Left: DelphiString; aRight: String): DelphiString;
begin
  Result := DelphiString(String(Left) + aRight);
end;

class operator DelphiString.Add(const Left: DelphiString; aRight: Char): DelphiString;
begin
  Result := DelphiString(String(Left) + aRight);
end;

class operator DelphiString.Equal(const Left: DelphiString; aRight: String): Boolean;
begin
  result := (Left) = DelphiString(aRight);
end;

class operator DelphiString.NotEqual(const Left: DelphiString; aRight: String): Boolean;
begin
  result := (Left) <> DelphiString(aRight);
end;

class operator DelphiString.Less(const Left: DelphiString; aRight: String): Boolean;
begin
  result := (Left) < DelphiString(aRight);
end;

class operator DelphiString.LessOrEqual(const Left: DelphiString; aRight: String): Boolean;
begin
  result := (Left) <= DelphiString(aRight);
end;

class operator DelphiString.Greater(const Left: DelphiString; aRight: String): Boolean;
begin
  result := (Left) > DelphiString(aRight);
end;

class operator DelphiString.GreaterOrEqual(const Left: DelphiString; aRight: String): Boolean;
begin
  result := (Left) >= DelphiString(aRight);
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
  result := new DelphiString(String(Value));
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

method DelphiString.ReadXml(reader: System.Xml.XmlReader);
begin
  var attr := reader.GetAttribute("nil", "http://www.w3.org/2001/XMLSchema-instance");
  if not String.IsNullOrEmpty(attr)
  and XmlConvert.ToBoolean(attr) then
    fChars := []
  else
    with readChars := reader.ReadElementString():ToCharArray() do
    if assigned(readChars) then
      fChars := readChars
    else
      fChars := [];
end;

method DelphiString.WriteXml(writer: System.Xml.XmlWriter);
begin
  if Length = 0 then
    writer.WriteAttributeString("xsi", "nil", "http://www.w3.org/2001/XMLSchema-instance", "true")
  else
    writer.WriteCData(self);
end;

end.