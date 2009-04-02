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
  TextFile = public record(IDisposable)
  assembly
    fFile: FileStream;
    fReader: StreamReader;
    fWriter: StreamWriter;
    fOpenMode: FileAccess;
    fFilename: String;

    method Init(fs: FileStream; Mode: FileAccess);
  public
    property Filename: String read fFilename;
    property OpenMode: FileAccess read fOpenMode;

    property File: FileStream read fFile;
    property Reader: StreamReader read fReader;
    property Writer: StreamWriter read fWriter;

    method Dispose; 
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
procedure AssignFile(var fs: TextFile; aFilename: String); public;
procedure Rewrite(var fs: TextFile); public; 
procedure Reset(var fs: TextFile; aMode: FileAccess := FileAccess.Read); public;
procedure CloseFile(var fs: TextFile); public;
procedure Append(var fs: TextFile); public;
procedure ReadLine(var fs: TextFile; var s: String); public;
procedure WriteLine(var fs: TextFile; s: String); public;
procedure WriteLine(var fs: TextFile; params s: array of String); public;
function EOF(var fs: TextFile): Boolean; public;

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


method TextFile.Dispose;
begin
  fWriter:Flush;
  fFile:Dispose;
  fFile := nil;
  fWriter := nil;
  fReader := nil;
  fFilename := nil;
end;

method TextFile.Init(fs: FileStream; Mode: FileAccess);
begin
  fFile := fs;
  if Mode in [FileAccess.ReadWrite, FileAccess.Write] then fWriter := new StreamWriter(fFile, Encoding.Default);
  if Mode in [FileAccess.Read, FileAccess.Read] then fReader := new StreamReader(fFile, Encoding.Default, true);
end;

procedure AssignFile(var fs: TextFile; aFilename: String);
begin
  if fs.File <> nil then 
    fs.Dispose;
  fs.fFilename := aFilename;
end;

procedure Rewrite(var fs: TextFile);
begin
  var r := new FileStream(fs.Filename, FileMode.&Create, FileAccess.Write);
  fs.Init(r, FileAccess.Write);
end;

procedure Reset(var fs: TextFile; aMode: FileAccess := FileAccess.Read);
begin
  var r := new FileStream(fs.Filename, FileMode.Open, aMode);
  fs.Init(r, aMode);
end;

procedure CloseFile(var fs: TextFile);
begin
  fs.Dispose;
end;

procedure Append(var fs: TextFile);
begin
  var r := new FileStream(fs.Filename, FileMode.Open, FileAccess.ReadWrite);
  r.Position := r.Length;
  fs.Init(r, FileAccess.ReadWrite);
end;

procedure ReadLine(var fs: TextFile; var s: String);
begin
  s := fs.fReader.ReadLine;
end;

procedure WriteLine(var fs: TextFile; s: String);
begin
  fs.fWriter.WriteLine(s);
end;

procedure WriteLine(var fs: TextFile; params s: array of String);
begin
  for i: Integer := 0 to length(s) -1 do begin 
    fs.fWriter.Write(s[i]);
  end;
end;

function EOF(var fs: TextFile): Boolean; 
begin
  result := fs.fReader.EndOfStream;
end;

end.