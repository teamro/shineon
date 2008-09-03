namespace ShineOn.Rtl;

interface

uses
  System.IO,
  System.Collections.Generic,
  System.Text;

type
  TSearchRec = public record
  private
    fInfo: Array of FileInfo;
    fIndex: Integer;
  assembly
    method SetIndex(i: Integer);
  public
    class function FindFirst(const aPath: String; Attr: Integer; var F: TSearchRec): Integer;
    class function FindNext(var F: TSearchRec): Integer;
    class procedure FindClose(var F: TSearchRec);

    Time: Integer;
    Size: Int64;
    Attr: Integer;
    Name: String;
  end;

const
  faReadOnly  = $00000001;
  faHidden    = $00000002;
  faSysFile   = $00000004;
  faVolumeID  = $00000008;
  faDirectory = $00000010;
  faArchive   = $00000020;
  faSymLink   = $00000040;
  faAnyFile   = $0000003F;

function FindFirst(const aPath: String; Attr: Integer; var F: TSearchRec): Integer;public;
function FindNext(var F: TSearchRec): Integer;public;
procedure FindClose(var F: TSearchRec);public;
function FileDateToDateTime(aDateTime: Integer): DateTime;public;
function DateTimeToFileDate(aDateTime: DateTime): Integer;public;

implementation

class function TSearchRec.FindFirst(const aPath: String; Attr: Integer; var F: TSearchRec): Integer;
begin
  var lIndx := aPath.LastIndexOf(Path.DirectorySeparatorChar);
  var lPath, lMask: String;
  if lIndx = -1 then begin
    lPath := '';
    lMask := aPath;
  end else begin
    lPath := aPath.Substring(0, lIndx +1);
    lMask := aPath.Substring(lIndx + 1);
  end;

  try 
    var lDirectoryInfo := new DirectoryInfo(lPath);
  
    F.fInfo := lDirectoryInfo.GetFiles(lMask);
    if length(F.fInfo) = 0 then exit 1;
    F.SetIndex(0);
    result := 0;
  except
    exit 1;
  end;
end;

class function TSearchRec.FindNext(var F: TSearchRec): Integer;
begin
  if F.fIndex +1 < length(F.fInfo) then begin
    F.SetIndex(F.fIndex+1);
    result := 0;
  end else begin
    F.SetIndex(length(F.fInfo)+1);
    result := 1;
  end;
end;

class procedure TSearchRec.FindClose(var F: TSearchRec);
begin
  F.fInfo := nil;
  F.fIndex := 0;
  F.Name := '';
  F.Size := 0;
  F.Time := 0;
end;

method TSearchRec.SetIndex(i: Integer);
begin
  fIndex := i;
  if fIndex >= length(fInfo) then exit;
  var lItem := fInfo[fIndex];

  Name :=  lItem.Name;
  Size := lItem.Length;
  Time := DateTimeToFileDate(lItem.LastWriteTime);
  Attr := 0;
  if FileAttributes.Archive in lItem.Attributes then
    Attr := Attr or faArchive;
  if FileAttributes.System in lItem.Attributes then
    Attr := Attr or faSysFile;
  if FileAttributes.ReadOnly in lItem.Attributes then
    Attr := Attr or faReadOnly;
  if FileAttributes.Hidden in lItem.Attributes then
    Attr := Attr or faHidden;
  if FileAttributes.Directory in lItem.Attributes then
    Attr := Attr or faDirectory;
end;

function FindFirst(const aPath: String; Attr: Integer; var F: TSearchRec): Integer;
begin
  result := TSearchRec.FindFirst(aPath, Attr, var F);
end;

function FindNext(var F: TSearchRec): Integer;
begin
  result := TSearchRec.FindNext(var F);
end;

procedure FindClose(var F: TSearchRec);
begin
  TSearchRec.FindClose(var F);
end;

function FileDateToDateTime(aDateTime: Integer): DateTime;
begin
  var lLo: Word := Word(aDateTime);
  var lHi: Word := LongWord(aDateTime) shr 16;
  Result :=
    EncodeDateTime(
      lHi shr 9 + 1980,
      lHi shr 5 and 15,
      lHi and 31,
      lLo shr 11,
      lLo shr 5 and 63,
      lLo and 31 shl 1, 0);
end;


function DateTimeToFileDate(aDateTime: DateTime): Integer;
var
  Year, Month, Day, Hour, Min, Sec, MSec: Word;
begin
  DecodeDate(aDateTime, Year, Month, Day);
  if (Year < 1980) or (Year > 2107) then Result := 0 else
  begin
    DecodeTime(aDateTime, Hour, Min, Sec, MSec);
    Result := ((Sec shr 1) or (Min shl 5) or (Hour shl 11)) or
      ((Day or (Month shl 5) or ((Year - 1980) shl 9)) shl 16);
  end;
end;


end.