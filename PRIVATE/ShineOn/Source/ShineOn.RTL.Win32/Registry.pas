// The contents of this file are subject to the Mozilla Public License Version 1.1 (the "License"); 
// you may not use this file except in compliance with the License. You may obtain a copy of the 
// License at http://www.mozilla.org/MPL/ 
// 
// Software distributed under the License is distributed on an "AS IS" basis, WITHOUT WARRANTY OF 
// ANY KIND, either express or implied. See the License for the specificlanguage governing rights and 
// limitations under the License.

namespace ShineOn.Rtl.Win32;

// TODO: 
// * handle relative paths (those not starting with a '\')
// * map Access to System.Security.Permissions.RegistryPermission
// * implement missing methods (marked with NotImplemented)
// * put this into its own Win32 assembly (ShineOn.Rtl.Win32) - DONE

interface
uses
  ShineOn.*,
  Microsoft.Win32;
  
const
  READ_CONTROL             = $00020000;
  STANDARD_RIGHTS_ALL      = $001F0000;
  STANDARD_RIGHTS_READ     = READ_CONTROL;
  STANDARD_RIGHTS_WRITE    = READ_CONTROL;

  KEY_QUERY_VALUE    = $0001;
  KEY_SET_VALUE      = $0002;
  KEY_CREATE_SUB_KEY = $0004;
  KEY_ENUMERATE_SUB_KEYS = $0008;
  KEY_NOTIFY         = $0010;
  KEY_CREATE_LINK    = $0020;

  SYNCHRONIZE = $00100000;

  KEY_READ           = (STANDARD_RIGHTS_READ or
                        KEY_QUERY_VALUE or
                        KEY_ENUMERATE_SUB_KEYS or
                        KEY_NOTIFY) and not
                        SYNCHRONIZE;
  KEY_WRITE          = (STANDARD_RIGHTS_WRITE or
                        KEY_SET_VALUE or
                        KEY_CREATE_SUB_KEY) and not
                        SYNCHRONIZE;
  KEY_EXECUTE        =  KEY_READ and not SYNCHRONIZE;

  KEY_ALL_ACCESS     = (STANDARD_RIGHTS_ALL or
                        KEY_QUERY_VALUE or
                        KEY_SET_VALUE or
                        KEY_CREATE_SUB_KEY or
                        KEY_ENUMERATE_SUB_KEYS or
                        KEY_NOTIFY or
                        KEY_CREATE_LINK) and not
                        SYNCHRONIZE;
  
type
  HKEY = public Microsoft.Win32.RegistryKey;
  ERegistryException = public class(Exception);
  
  TRegKeyInfo = public record
  public 
    NumSubKeys: Integer;
    MaxSubKeyLen: Integer;
    NumValues: Integer;
    MaxValueLen: Integer;
    MaxDataLen: Integer;
    FileTime: TFileTime;
  end;

  TRegDataType = public Microsoft.Win32.RegistryValueKind;

  TRegDataInfo = public record
  public
    RegData: TRegDataType;
    DataSize: Integer;
  end;

  TRegistry = public class(TObject)
  private
    FRootKey:Microsoft.Win32.RegistryKey;
    FCurrentHive:Microsoft.Win32.RegistryHive;
    FLazyWrite:Boolean;
    FAccess:LongWord; // not used (only for property accessor)
    function GetParentPath:String;
    function GetCurrentPath:String;
    function GetRootKey:HKEY;
    procedure SetRootKey(Value:HKEY);
    function SplitKey(const Key:String): array of String;
    function GetKey(const Key:String):HKEY;
    function IsRelative(const Key:String):Boolean;
  protected
     FCurrentKey:Microsoft.Win32.RegistryKey;
  public
    constructor Create; 
    constructor Create(AAccess: LongWord); 
    procedure CloseKey;
    function CreateKey(const Key: String): Boolean;
    function DeleteKey(const Key: String): Boolean;
    function DeleteValue(const Name: String): Boolean;
    function GetDataInfo(const ValueName: String; var Value: TRegDataInfo): Boolean;
    function GetDataSize(const ValueName: String): Integer;
    function GetDataType(const ValueName: String): TRegDataType;
    function GetKeyInfo(var Value: TRegKeyInfo): Boolean;
    procedure GetKeyNames(Strings: TStrings);
    procedure GetValueNames(Strings: TStrings);
    function HasSubKeys: Boolean;
    function KeyExists(const Key: String): Boolean;
    function LoadKey(const Key, FileName: String): Boolean;
    procedure MoveKey(const OldName, NewName: String; Delete: Boolean);
    function OpenKey(const Key: String; CanCreate: Boolean): Boolean;
    function OpenKeyReadOnly(const Key: String): Boolean;
    function ReadCurrency(const Name: String): Double;
    function ReadBinaryData(const Name: String; var Buffer; BufSize: Integer): Integer;
    function ReadBool(const Name: String): Boolean;
    function ReadDate(const Name: String): TDateTime;
    function ReadDateTime(const Name: String): TDateTime;
    function ReadFloat(const Name: String): Double;
    function ReadInteger(const Name: String): Integer;
    function ReadString(const Name: String): String;
    function ReadTime(const Name: String): TDateTime;
    function RegistryConnect(const UNCName: String): Boolean;
    procedure RenameValue(const OldName, NewName: String);
    function ReplaceKey(const Key, FileName, BackUpFileName: String): Boolean;
    function RestoreKey(const Key, FileName: String): Boolean;
    function SaveKey(const Key, FileName: String): Boolean;
    function UnLoadKey(const Key: String): Boolean;
    function ValueExists(const Name: String): Boolean;
    procedure WriteCurrency(const Name: String; Value: Double);
    procedure WriteBinaryData(const Name: String; var Buffer; BufSize: Integer);
    procedure WriteBool(const Name: String; Value: Boolean);
    procedure WriteDate(const Name: String; Value: TDateTime);
    procedure WriteDateTime(const Name: String; Value: TDateTime);
    procedure WriteFloat(const Name: String; Value: Double);
    procedure WriteInteger(const Name: String; Value: Integer);
    procedure WriteString(const Name, Value: String);
    procedure WriteExpandString(const Name, Value: String);
    procedure WriteTime(const Name: String; Value: TDateTime);
    property CurrentKey: HKEY read FCurrentKey;
    property CurrentPath: String read GetCurrentPath;
    property LazyWrite: Boolean read FLazyWrite write FLazyWrite;
    property RootKey: HKEY read GetRootKey write SetRootKey;
    property Access: LongWord read FAccess write FAccess;
  end;

  TRegIniFile = public class(TRegistry)
  private
    FFileName:String;
  public
    constructor Create(const aFileName: String); 
    constructor Create(const aFileName: String; AAccess: LongWord); 
    function ReadString(const Section, Name, Default: String): String;
    function ReadInteger(const Section, Name: String; Default: LongInt): LongInt;
    procedure WriteInteger(const Section, Name: String; Value: LongInt);
    procedure WriteString(const Section, Name, Value: String);
    function ReadBool(const Section, Name: String; Default: Boolean): Boolean;
    procedure WriteBool(const Section, Name: String; Value: Boolean);
    procedure ReadSection(const Section: String; Strings: TStrings);
    procedure ReadSections(Strings: TStrings);
    procedure ReadSectionValues(const Section: String; Strings: TStrings);
    procedure EraseSection(const Section: String);
    procedure DeleteKey(const Section, Name: String);
    property FileName: String read FFileName;
  end;


  TRegistryIniFile = public class(TCustomIniFile)
 private
    FRegIniFile: TRegIniFile;
  public
    constructor Create(const FileName: String); 
    constructor Create(const FileName: String; AAccess: LongWord); 
    function ReadDate(const Section, Name: String; Default: TDateTime): TDateTime; override;
    function ReadDateTime(const Section, Name: String; Default: TDateTime): TDateTime; override;
    function ReadInteger(const Section, Name: String; Default: LongInt): LongInt; override;
    function ReadFloat(const Section, Name: String; Default: Double): Double; override;
    function ReadString(const Section, Name, Default: String): String; override;
    function ReadTime(const Section, Name: String; Default: TDateTime): TDateTime; override;
    function ReadBinaryStream(const Section, Name: String; Value: TStream): Integer; override;
    procedure WriteDate(const Section, Name: String; Value: TDateTime); override;
    procedure WriteDateTime(const Section, Name: String; Value: TDateTime); override;
    procedure WriteFloat(const Section, Name: String; Value: Double); override;
    procedure WriteInteger(const Section, Name: String; Value: LongInt); override;
    procedure WriteString(const Section, Name, Value: String); override;
    procedure WriteTime(const Section, Name: String; Value: TDateTime); override;
    procedure WriteBinaryStream(const Section, Name: String; Value: TStream); override;
    procedure ReadSection(const Section: String; Strings: TStrings); override;
    procedure ReadSections(Strings: TStrings); override;
    procedure ReadSectionValues(const Section: String; Strings: TStrings); override;
    procedure EraseSection(const Section: String); override;
    procedure DeleteKey(const Section, Name: String); override;
    procedure UpdateFile; override;
    property RegIniFile: TRegIniFile read FRegIniFile;
  end;

const
  rdUnknown      = TRegDataType.Unknown; 
  rdString       = TRegDataType.String; 
  rdExpandString = TRegDataType.ExpandString;
  rdInteger      = TRegDataType.DWord;
  rdBinary       = TRegDataType.Binary;

implementation

{ TRegistry }
constructor TRegistry.Create; 
begin
  Create(KEY_ALL_ACCESS);
end;

constructor TRegistry.Create(AAccess: LongWord); 
begin
  inherited Create;
  FRootKey := Microsoft.Win32.Registry.CurrentUser;
  FCurrentHive := Microsoft.Win32.RegistryHive.CurrentUser;
  FCurrentKey := FRootKey;
  FAccess := AAccess;
end;

procedure TRegistry.CloseKey; 
begin
  if not LazyWrite then
    FCurrentKey.Flush;
  FCurrentKey.Close;
  FCurrentKey := FRootKey;
end;

function TRegistry.CreateKey(const Key: String): Boolean; 
var tmp:HKEY;
begin
  tmp := FCurrentKey.CreateSubKey(Key);
  Result := tmp <> nil;
  if Result then
    FCurrentKey := tmp;
end;

function TRegistry.DeleteKey(const Key: String): Boolean; 
begin
  Result := true;
  try
    FCurrentKey.DeleteSubKey(Key, true);
  except
    Result := false;
  end;
end;

function TRegistry.DeleteValue(const Name: String): Boolean; 
begin
  Result := true;
  try
    FCurrentKey.DeleteValue(Name, true);
  except
    Result := false;
  end;
end;

function TRegistry.GetDataInfo(const ValueName: String; var Value: TRegDataInfo): Boolean; 
begin
  Value.RegData := GetDataType(ValueName); 
  Value.DataSize := GetDataSize(ValueName);
end;

function TRegistry.GetDataSize(const ValueName: String): Integer; 
begin
  Result := -1;
end;

function TRegistry.GetDataType(const ValueName: String): TRegDataType; 
var 
  aValue:Object;
  aType:System.Type;
begin
  Result := TRegDataType.Unknown;
  aValue := FCurrentKey.GetValue(ValueName);
  if aValue <> nil then
  begin
    aType := aValue.GetType;
    case aType type of 
      System.String:
        Result := TRegDataType.String;
      Integer:
        Result := TRegDataType.DWord
    else 
      Result := TRegDataType.Binary;
    end;
  end;
end;

function TRegistry.GetKeyInfo(var Value: TRegKeyInfo): Boolean; 
begin
  Value.MaxSubKeyLen := 0;
  Value.NumValues := 0;
  Value.MaxValueLen := 0;
  Value.MaxDataLen := 0;
  Value.FileTime.dwLowDateTime := 0;
  Value.FileTime.dwHighDateTime := 0;
  Value.NumSubKeys := FCurrentKey.SubKeyCount;

  for each s:String in FCurrentKey.GetSubKeyNames do
    if s.Length > Value.MaxSubKeyLen then
      Value.MaxSubKeyLen := s.Length;

  for each s:String in FCurrentKey.GetValueNames do
  begin
    if s.Length > Value.MaxValueLen then
      Value.MaxValueLen := s.Length;
    var aValue:Object := FCurrentKey.GetValue(s);
    if aValue.ToString.Length > Value.MaxDataLen then
      Value.MaxDataLen := aValue.ToString.Length;
  end;
end;

procedure TRegistry.GetKeyNames(Strings: TStrings); 
var str:array of String;
begin
  Strings.Clear;
  str := FCurrentKey.GetSubKeyNames;
  for each s:String in str do
    Strings.Add(s);
end;

procedure TRegistry.GetValueNames(Strings: TStrings); 
var str:array of String;
begin
  Strings.Clear;
  str := FCurrentKey.GetValueNames;
  for each s:String in str do
    Strings.Add(s);
end;

function TRegistry.HasSubKeys: Boolean; 
begin
  Result := FCurrentKey.SubKeyCount > 0;
end;

function TRegistry.KeyExists(const Key: String): Boolean; 
var tmp:HKEY;
begin
  tmp := FCurrentKey;
  Result := OpenKeyReadOnly(Key);
  FCurrentKey := tmp;
end;

function TRegistry.LoadKey(const Key, FileName: String): Boolean; 
begin
  NotImplemented;
end;

procedure TRegistry.MoveKey(const OldName, NewName: String; Delete: Boolean); 
begin
  NotImplemented;
end;

function TRegistry.OpenKey(const Key: String; CanCreate: Boolean): Boolean; 
var tmp:HKEY;
begin
  Result := false;
  if IsRelative(Key) then
    tmp := FCurrentKey.OpenSubKey(Key, CanCreate)
  else
  begin
    tmp := FRootKey;
    for each s:String in SplitKey(Key) do
    begin
      tmp := tmp.OpenSubKey(s, CanCreate);
      if tmp = nil then
        Exit;
    end;
  end;
  if tmp <> nil then
  begin
    FCurrentKey := tmp;
    Result := true;
  end;
end;

function TRegistry.OpenKeyReadOnly(const Key: String): Boolean; 
begin
  Result := OpenKey(Key, false);
end;

function TRegistry.ReadCurrency(const Name: String): Double; 
begin
  Result := Convert.ToDouble(FCurrentKey.GetValue(Name));
end;

function TRegistry.ReadBinaryData(const Name: String; var Buffer; BufSize: Integer): Integer; 
begin
  Buffer := FCurrentKey.GetValue(Name);
  Result := Buffer.ToString.Length; //!!! This is probably not correct, but there is really no other way except returning BufSize (which is also wrong)
end;

function TRegistry.ReadBool(const Name: String): Boolean; 
begin
  Result := Convert.ToBoolean(FCurrentKey.GetValue(Name));
end;

function TRegistry.ReadDate(const Name: String): TDateTime; 
begin
  Result := Convert.ToDateTime(FCurrentKey.GetValue(Name));
end;

function TRegistry.ReadDateTime(const Name: String): TDateTime; 
begin
  Result := Convert.ToDateTime(FCurrentKey.GetValue(Name));
end;

function TRegistry.ReadFloat(const Name: String): Double; 
begin
  Result := Convert.ToDouble(FCurrentKey.GetValue(Name));
end;

function TRegistry.ReadInteger(const Name: String): Integer; 
begin
  Result := Convert.ToInt32(FCurrentKey.GetValue(Name));
end;

function TRegistry.ReadString(const Name: String): String; 
begin
  Result := Convert.ToString(FCurrentKey.GetValue(Name));
end;

function TRegistry.ReadTime(const Name: String): TDateTime; 
begin
  Result := TDateTime(DateTime(FCurrentKey.GetValue(Name)));
end;

function TRegistry.RegistryConnect(const UNCName: String): Boolean; 
var tmp:HKEY;
begin
  tmp := FCurrentKey.OpenRemoteBaseKey(FCurrentHive, UNCName);
  Result := tmp <> nil;
  if Result then
    FCurrentKey := tmp;
end;

procedure TRegistry.RenameValue(const OldName, NewName: String); 
var aValue:Object;
begin
  aValue := FCurrentKey.GetValue(OldName, nil);
  if (aValue <> nil) then
  begin
    FCurrentKey.SetValue(NewName, aValue);
    FCurrentKey.DeleteValue(OldName);
  end;
end;

function TRegistry.ReplaceKey(const Key, FileName, BackUpFileName: String): Boolean; 
begin
  NotImplemented;
end;

function TRegistry.RestoreKey(const Key, FileName: String): Boolean; 
begin
  NotImplemented;
end;

function TRegistry.SaveKey(const Key, FileName: String): Boolean; 
begin
  NotImplemented;
end;

function TRegistry.UnLoadKey(const Key: String): Boolean; 
begin
  NotImplemented;
end;

function TRegistry.ValueExists(const Name: String): Boolean; 
var Strings:array of String;
begin
  Strings := FCurrentKey.GetValueNames;
  for each s:String in Strings do
    if s.ToLower.CompareTo(Name.ToLower) = 0 then
    begin
      Result := true;
      Exit;
    end;
  Result := false;
end;

procedure TRegistry.WriteCurrency(const Name: String; Value: Double); 
begin
  FCurrentKey.SetValue(Name, Value);
end;

procedure TRegistry.WriteBinaryData(const Name: String; var Buffer; BufSize: Integer); 
begin
  FCurrentKey.SetValue(Name, Object(Buffer));
end;

procedure TRegistry.WriteBool(const Name: String; Value: Boolean); 
begin
  FCurrentKey.SetValue(Name, Value);
end;

procedure TRegistry.WriteDate(const Name: String; Value: TDateTime); 
begin
  FCurrentKey.SetValue(Name, Value);
end;

procedure TRegistry.WriteDateTime(const Name: String; Value: TDateTime); 
begin
  FCurrentKey.SetValue(Name, Value);
end;

procedure TRegistry.WriteFloat(const Name: String; Value: Double); 
begin
  FCurrentKey.SetValue(Name, Value);
end;

procedure TRegistry.WriteInteger(const Name: String; Value: Integer); 
begin
  FCurrentKey.SetValue(Name, Value);
end;

procedure TRegistry.WriteString(const Name, Value: String); 
begin
  FCurrentKey.SetValue(Name, Value);
end;

procedure TRegistry.WriteExpandString(const Name, Value: String); 
begin
  FCurrentKey.SetValue(Name, Value);
end;

procedure TRegistry.WriteTime(const Name: String; Value: TDateTime); 
begin
  FCurrentKey.SetValue(Name, Value);
end;

function TRegistry.GetParentPath: String; 
var i:Int32;
begin
  Result := GetCurrentPath;
  i := Result.LastIndexOf('\');
  if i > 0 then
    Result := Result.Substring(0, i - 1);
end;

function TRegistry.GetCurrentPath: String; 
begin
  Result := FCurrentKey.Name;
end;

function TRegistry.GetRootKey: HKEY; 
begin
  Result := FRootKey;
end;

procedure TRegistry.SetRootKey(Value:HKEY); 
begin
  case Value of
    Registry.ClassesRoot:
      FCurrentHive := RegistryHive.ClassesRoot;
    Registry.CurrentConfig :
      FCurrentHive := RegistryHive.CurrentConfig;
    Registry.CurrentUser:
      FCurrentHive := RegistryHive.CurrentUser;
    Registry.DynData:
      FCurrentHive := RegistryHive.DynData;
    Registry.LocalMachine:
      FCurrentHive := RegistryHive.LocalMachine;
    Registry.PerformanceData:
      FCurrentHive := RegistryHive.PerformanceData;
    Registry.Users:
      FCurrentHive := RegistryHive.Users;
  else
    raise new ERegistryException('Invalid registry root');
  end;
  CloseKey;
  FRootKey := Value;
  FCurrentKey := Value;
end;


function TRegistry.SplitKey(const Key:String): array of String; 
begin
  if (Key = '') or (Key = nil) then
    Result := nil
  else
    Result := Key.Split(['\']);
end;

function TRegistry.GetKey(const Key:String): HKEY; 
var tmp:HKEY;
begin
  tmp := FCurrentKey;
  if OpenKey(Key, false) then
    Result := FCurrentKey
  else
    Result := nil;
  FCurrentKey := tmp;
end;

function TRegistry.IsRelative(const Key:String): Boolean; 
begin
  Result := (Key = nil) or (Key = '') or not Key.StartsWith('\');
end;

constructor TRegIniFile.Create(const aFileName: String); 
begin
  Create(aFileName, KEY_ALL_ACCESS);
end;

constructor TRegIniFile.Create(const aFileName: String; AAccess: LongWord); 
begin
  inherited Create(AAccess);
  OpenKey(aFileName, true);
end;

function TRegIniFile.ReadString(const Section, Name, Default: String): String; 
var tmp:HKEY;
begin
  Result := nil;
  tmp := FCurrentKey;
  if OpenKey(Section, true) then
    Result := ReadString(Name);
  if Result = nil then
    Result := Default;
  FCurrentKey := tmp;
end;

function TRegIniFile.ReadInteger(const Section, Name: String; Default: LongInt): LongInt; 
var tmp:HKEY;
begin
  tmp := FCurrentKey;
  if OpenKey(Section, true) and KeyExists(Name) then
    Result := ReadInteger(Name)
  else
    Result := Default;
  FCurrentKey := tmp;
end;

procedure TRegIniFile.WriteInteger(const Section, Name: String; Value: LongInt); 
var tmp:HKEY;
begin
  tmp := FCurrentKey;
  if OpenKey(Section, true) then
    WriteInteger(Name,Value);
  FCurrentKey := tmp;
end;

procedure TRegIniFile.WriteString(const Section, Name, Value: String); 
var tmp:HKEY;
begin
  tmp := FCurrentKey;
  if OpenKey(Section, true) then
    WriteString(Name,Value);
  FCurrentKey := tmp;
end;

function TRegIniFile.ReadBool(const Section, Name: String; Default: Boolean): Boolean; 
var tmp:HKEY;
begin
  tmp := FCurrentKey;
  if OpenKey(Section, true) and KeyExists(Name) then
    Result := ReadBool(Name)
  else
    Result := Default;
  FCurrentKey := tmp;
end;

procedure TRegIniFile.WriteBool(const Section, Name: String; Value: Boolean); 
var tmp:HKEY;
begin
  tmp := FCurrentKey;
  if OpenKey(Section, true) then
    WriteBool(Name,Value);
  FCurrentKey := tmp;
end;

procedure TRegIniFile.ReadSection(const Section: String; Strings: TStrings); 
var tmp:HKEY;
begin
  tmp := FCurrentKey;
  if OpenKey(Section, true) then
    GetValueNames(Strings);
  FCurrentKey := tmp;
end;

procedure TRegIniFile.ReadSections(Strings: TStrings); 
begin
  GetKeyNames(Strings);
end;

procedure TRegIniFile.ReadSectionValues(const Section: String; Strings: TStrings); 
var 
  tmp:HKEY;
  
begin
  tmp := FCurrentKey;
  if OpenKey(Section, true) then
  with S:TStringList := new TStringList do
  begin
    GetKeyNames(S);
    for i:Int32 := 0 to S.Count - 1 do
      Strings.Values[S[i]] := ReadString(Section, S[i], '');
  end;
  FCurrentKey := tmp;
end;

procedure TRegIniFile.EraseSection(const Section: String); 
begin
  inherited DeleteKey(Section);
end;

procedure TRegIniFile.DeleteKey(const Section, Name: String); 
var tmp:HKEY;
begin
  tmp := FCurrentKey;
  if OpenKey(Section, true) then
    DeleteKey(Name);    
  FCurrentKey := tmp;
end;

{ TRegistryIniFile }
constructor TRegistryIniFile.Create(const FileName: String); 
begin
  Create(FileName, KEY_ALL_ACCESS);
end;

constructor TRegistryIniFile.Create(const FileName: String; AAccess: LongWord); 
begin
  inherited Create('');
  FRegIniFile := new TRegIniFile(FileName, AAccess);
end;

function TRegistryIniFile.ReadDate(const Section, Name: String; Default: TDateTime): TDateTime; 
var tmp:String;
begin
  tmp := FRegIniFile.CurrentPath;
  if FRegIniFile.OpenKey(Section, false) then
    Result := FRegIniFile.ReadDate(Name)
  else
    Result := Default;
   FRegIniFile.OpenKey(tmp, true);
end;

function TRegistryIniFile.ReadDateTime(const Section, Name: String; Default: TDateTime): TDateTime; 
var tmp:String;
begin
  tmp := FRegIniFile.CurrentPath;
  if FRegIniFile.OpenKey(Section, false) then
    Result := FRegIniFile.ReadDateTime(Name)
  else
    Result := Default;
   FRegIniFile.OpenKey(tmp, true);
end;

function TRegistryIniFile.ReadInteger(const Section, Name: String; Default: LongInt): LongInt; 
begin
  Result := FRegIniFile.ReadInteger(Section, Name, Default);
end;

function TRegistryIniFile.ReadFloat(const Section, Name: String; Default: Double): Double; 
var tmp:String;
begin
  tmp := FRegIniFile.CurrentPath;
  if FRegIniFile.OpenKey(Section, false) then
    Result := FRegIniFile.ReadFloat(Name)
  else
    Result := Default;
   FRegIniFile.OpenKey(tmp, true);
end;

function TRegistryIniFile.ReadString(const Section, Name, Default: String): String; 
begin
  Result := FRegIniFile.ReadString(Section, Name, Default);
end;

function TRegistryIniFile.ReadTime(const Section, Name: String; Default: TDateTime): TDateTime; 
var tmp:String;
begin
  tmp := FRegIniFile.CurrentPath;
  if FRegIniFile.OpenKey(Section, false) then
    Result := FRegIniFile.ReadTime(Name)
  else
    Result := Default;
   FRegIniFile.OpenKey(tmp, true);
end;

function TRegistryIniFile.ReadBinaryStream(const Section, Name: String; Value: TStream): Integer; 
begin
  NotImplemented;
end;

procedure TRegistryIniFile.WriteDate(const Section, Name: String; Value: TDateTime); 
var tmp:String;
begin
  tmp := FRegIniFile.CurrentPath;
  if FRegIniFile.OpenKey(Section, true) then
    FRegIniFile.WriteDate(Name, Value);
  FRegIniFile.OpenKey(tmp, true);
end;

procedure TRegistryIniFile.WriteDateTime(const Section, Name: String; Value: TDateTime); 
var tmp:String;
begin
  tmp := FRegIniFile.CurrentPath;
  if FRegIniFile.OpenKey(Section, true) then
    FRegIniFile.WriteDateTime(Name, Value);
  FRegIniFile.OpenKey(tmp, true);
end;

procedure TRegistryIniFile.WriteFloat(const Section, Name: String; Value: Double); 
var tmp:String;
begin
  tmp := FRegIniFile.CurrentPath;
  if FRegIniFile.OpenKey(Section, true) then
    FRegIniFile.WriteFloat(Name, Value);
  FRegIniFile.OpenKey(tmp, true);
end;

procedure TRegistryIniFile.WriteInteger(const Section, Name: String; Value: LongInt); 
begin
  FRegIniFile.WriteInteger(Section, Name, Value);
end;

procedure TRegistryIniFile.WriteString(const Section, Name, Value: String); 
begin
  FRegIniFile.WriteString(Section, Name, Value);
end;

procedure TRegistryIniFile.WriteTime(const Section, Name: String; Value: TDateTime); 
var tmp:String;
begin
  tmp := FRegIniFile.CurrentPath;
  if FRegIniFile.OpenKey(Section, true) then
    FRegIniFile.WriteTime(Name, Value);
  FRegIniFile.OpenKey(tmp, true);
end;

procedure TRegistryIniFile.WriteBinaryStream(const Section, Name: String; Value: TStream); 
begin
  NotImplemented;
end;

procedure TRegistryIniFile.ReadSection(const Section: String; Strings: TStrings); 
begin
  FRegIniFile.ReadSection(Section, Strings);
end;

procedure TRegistryIniFile.ReadSections(Strings: TStrings); 
begin
  FRegIniFile.ReadSections(Strings);
end;

procedure TRegistryIniFile.ReadSectionValues(const Section: String; Strings: TStrings); 
begin
  FRegIniFile.ReadSectionValues(Section, Strings);
end;

procedure TRegistryIniFile.EraseSection(const Section: String); 
begin
  FRegIniFile.EraseSection(Section);
end;

procedure TRegistryIniFile.DeleteKey(const Section, Name: String); 
begin
  FRegIniFile.DeleteKey(Section, Name);
end;

procedure TRegistryIniFile.UpdateFile; 
begin
  // do nothing
end;

end.
