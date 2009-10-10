// The contents of this file are subject to the Mozilla Public License Version 1.1 (the "License"); 
// you may not use this file except in compliance with the License. You may obtain a copy of the 
// License at http://www.mozilla.org/MPL/ 
// 
// Software distributed under the License is distributed on an "AS IS" basis, WITHOUT WARRANTY OF 
// ANY KIND, either express or implied. See the License for the specificlanguage governing rights and 
// limitations under the License.

namespace ShineOn.Rtl;
// TODO:
// * implement all NotImplemented


interface

uses
  System.ComponentModel, // for IComponent
  System.Runtime.InteropServices, // for guid attribute
  System.Runtime.CompilerServices,
  System.Threading,
  System.Collections,
  System.Reflection,
  System.Windows.Forms, // for Form
  Microsoft.Win32.SafeHandles;
  
type
  (*class(Component, IComponent, IDisposable)
  private
    FOwner:TComponent;
  protected
  public

    constructor Create(AOwner:TComponent);virtual;
    method ToString:String;override;
  end;*)
  
  TListSortCompare = public function (Item1, Item2: Object): Integer;
  TComponent = public Component;
  
  TListNotification = public enum(Added, Extracted, Deleted);
  
  EStringListError = class(Exception);
 
type   
  TListAssignOp = public enum(Copy, &And, &Or, &Xor, SrcUnique, DestUnique);
  
  
type  
  TListSortCompareWrapper = assembly class(TObject, IComparer)
  private
    FComparer:TListSortCompare;
  public
    constructor Create(AComparer:TListSortCompare);
    function Compare(X,Y:Object):Integer;
  end;
  
  TList = public class(TObject, IEnumerable)
  private
    FList:ArrayList;
    function GetCapacity:Int32;
    procedure SetCapacity(const Value:Int32);
    function GetCount:Int32;
    procedure SetCount(const Value:Int32);
    function Get(Index:Int32):Object;
    procedure Put(Index:Int32; const Value:Object);
  protected
    procedure Notify(Ptr: Object; Action: TListNotification); virtual;
  public
    constructor Create;
    class procedure Error(Msg: String; Data: Integer); 
    function Add(Item: Object): Integer;
    procedure Clear; virtual;
    procedure Delete(Index: Integer);
    procedure Exchange(Index1, Index2: Integer);
    function Expand: TList;
    function Extract(Item: Object): Object;
    function First: Object;
    function GetEnumerator: IEnumerator;
    function IndexOf(Item: Object): Integer;
    procedure Insert(Index: Integer; Item: Object);
    function Last: Object;
    procedure Move(CurIndex, NewIndex: Integer);
    function Remove(Item: Object): Integer;
    procedure Pack;
    procedure Sort(Compare: TListSortCompare);
    procedure Assign(ListA: TList; AOperator: TListAssignOp; ListB: TList);
    procedure Assign(ListA: TList; AOperator: TListAssignOp);
    procedure Assign(ListA: TList);
    property Capacity: Integer read GetCapacity write SetCapacity;
    property Count: Integer read GetCount write SetCount;
    property Items[Index: Integer]: Object read Get write Put; default;
    property List: ArrayList read FList;
  end;
  
  TThreadList = public class(TObject)
  private
    FList:TList;
    FDuplicates:TDuplicates;
  public
    constructor Create;
    // destructor Destroy;override;
    procedure Add(Item: Object);
    procedure Clear;
    function  LockList: TList;
    procedure Remove(Item: Object);
    procedure UnlockList;
    property Duplicates: TDuplicates read FDuplicates write FDuplicates;
  end;
  
  IInterfaceList = public interface
    procedure Clear;
    procedure Delete(Index: Integer);
    procedure Exchange(Index1, Index2: Integer);
    function First: Object;
    function IndexOf(const Item: Object): Integer;
    function Add(const Item: Object): Integer;
    procedure Insert(Index: Integer; const Item: Object);
    function Last: Object;
    function Remove(const Item: Object): Integer;
    procedure Lock;
    procedure Unlock;
    property Capacity: Integer read write;
    property Count: Integer  read write;
    property Items[Index: Integer]: Object read write;
  end;

  TInterfacedObject = public class(TObject); // in .NET, all objects are interfaced
  
  TInterfaceList = public class(TInterfacedObject, IInterfaceList)
  protected
    // IInterfaceList 
    FList:TThreadList;
    function Get(Index: Integer): Object;
    function GetCapacity: Integer;
    function GetCount: Integer;
    procedure Put(Index: Integer; const Value: Object);
    procedure SetCapacity(const Value: Integer);
    procedure SetCount(const Value: Integer);
  public
    constructor Create;
    procedure Clear;
    procedure Delete(Index: Integer);
    procedure Exchange(Index1, Index2: Integer);
    function Expand: TInterfaceList;
    function First: Object;
    function IndexOf(const Item: Object): Integer;
    function Add(const Item: Object): Integer;
    procedure Insert(Index: Integer; const Item: Object);
    function Last: Object;
    function Remove(const Item: Object): Integer;
    procedure Lock;
    procedure Unlock;
    property Capacity: Integer read GetCapacity write SetCapacity;
    property Count: Integer read GetCount write SetCount;
    property Items[Index: Integer]: Object read Get write Put; default;
 end;


{ TBits class }

 TBits = public class(TObject)
 private
    FBits:BitArray;
    function GetBit(Index:Integer):Boolean;
    procedure SetBit(const Index:Integer; const Value:Boolean);
    procedure SetSize(const Value:Int32);
    function GetSize:Int32;
  public
    constructor Create;
    function OpenBit: Integer;
    property Bits[Index: Integer]: Boolean read GetBit write SetBit; default;
    property Size: Integer read GetSize write SetSize;
  end;

  TPersistent = public class(TObject)
  private
    procedure AssignError(Source: TPersistent);
  protected
    function GetOwner: TPersistent; virtual; 
    procedure AssignTo(Dest: TPersistent); virtual; 
  public
   procedure Assign(Source: TPersistent); virtual;
   function GetNamePath: String; virtual;
  end;
  
  TStrings = public abstract class(TPersistent)
  private
    //FStringsAdapter:IStringsAdapter;
    FUpdateCount:Int32;
    FDelimiter, FQuoteChar:Char;
    function GetCommaText:String;
    procedure SetCommaText(Value:String);
    function GetName(Index:Integer):String;
    function GetValue(Name:String):String;
    procedure SetValue(Name, Value:String);
    function GetDelimitedText:String;
    procedure SetDelimitedText(Value:String);
//    procedure SetStringsAdapter(const Value:IStringsAdapter);
  protected
    function Get(Index: Integer): String; virtual; abstract;
    function GetCapacity: Integer; virtual;
    function GetCount: Integer; virtual; abstract;
    function GetObject(Index: Integer): Object; virtual; abstract;
    function GetTextStr: String; virtual;
    procedure Put(Index: Integer; S: String); virtual; abstract;
    procedure PutObject(Index: Integer; AObject: Object); virtual; abstract;
    procedure SetCapacity(NewCapacity: Integer); virtual;
    procedure SetTextStr(Value: String); virtual;
    property UpdateCount: Integer read FUpdateCount;
    function CompareStrings(S1, S2: String): Integer; virtual;
    function CompareObjects(O1, O2: Object): Integer; virtual;
    procedure Changed; virtual;
    procedure Changing; virtual;
  public
    constructor Create;
    function Add(S: String): Integer; virtual;
    function AddObject(S: String; AObject: Object): Integer; virtual;
    procedure Append(S: String);
    procedure AddStrings(aStrings: TStrings); virtual;
    procedure Assign(Source: TPersistent); override;
    procedure BeginUpdate;
    procedure Clear; virtual; abstract;
    procedure Delete(Index: Integer); virtual; abstract;
    procedure EndUpdate;
    function Equals(aStrings: TStrings): Boolean;
    procedure Exchange(Index1, Index2: Integer); virtual;
    function GetText: String; virtual;
    function IndexOf(S: String): Integer; virtual;
    function IndexOfName(Name: String): Integer; virtual;
    function IndexOfObject(AObject: Object): Integer; virtual;
    procedure Insert(Index: Integer; S: String); virtual; abstract;
    procedure InsertObject(Index: Integer; S: String; AObject: Object); virtual;
    procedure LoadFromFile(FileName: String); virtual;
    procedure LoadFromStream(Stream: TStream); virtual;
    procedure Move(CurIndex, NewIndex: Integer); virtual;
    procedure SaveToFile(FileName: String); virtual;
    procedure SaveToStream(Stream: TStream); virtual;
    procedure SetText(aText: String); virtual;
    property Capacity: Integer read GetCapacity write SetCapacity;
    property CommaText: String read GetCommaText write SetCommaText;
    property Count: Integer read GetCount;
    property Delimiter: Char read FDelimiter write FDelimiter;
    property DelimitedText: String read GetDelimitedText write SetDelimitedText;
    property Names[Index: Integer]: String read GetName;
    property Objects[Index: Integer]: Object read GetObject write PutObject;
    property QuoteChar: Char read FQuoteChar write FQuoteChar;
    property Values[Name: String]: String read GetValue write SetValue;
    property Strings[Index: Integer]: String read Get write Put; default;
    property Text: String read GetTextStr write SetTextStr;
    //property StringsAdapter: IStringsAdapter read FStringsAdapter write SetStringsAdapter;
  end;
  
  TStringListSortCompare = public function(List: TStringList; Index1, Index2: Integer): Integer;

  TStringList = public class(TStrings)
  private
    FStrings:ArrayList;
    FDuplicates:TDuplicates;
    FSorted, FCaseSensitive:Boolean;
    FOnChange, FOnChanging:TNotifyEvent;
    procedure ExchangeItems(Index1, Index2: Integer);
    function FindBin(S: String; var Index: Integer): Boolean;
    function FindLinear(S: String; var Index: Integer): Boolean;
    procedure QuickSort(Left, Right: Integer; Compare: TStringListSortCompare);
   protected
    function Get(Index: Integer): String; override;
    function GetCapacity: Integer; override;
    function GetCount: Integer; override;
    function GetObject(Index: Integer): Object; override;
    procedure Put(Index: Integer; S: String); override;
    procedure PutObject(Index: Integer; AObject: Object); override;
    procedure SetCapacity(NewCapacity: Integer); override;
    procedure SetSorted(Value:Boolean);
    procedure SetCaseSensitive(Value:Boolean);
    procedure Changing;override;
    procedure Changed;override;
  public
    constructor Create;
    function CompareStrings(S1, S2: String): Integer; override;
    // destructor Destroy;override;
    procedure Clear; override;
    procedure Delete(Index: Integer); override;
    procedure Exchange(Index1, Index2: Integer); override;
    function Find(S: String; var Index: Integer): Boolean; virtual;
    function IndexOf(S: String): Integer; override;
    procedure InsertObject(Index: Integer; S: String; AObject: Object); override;
    procedure Insert(Index: Integer; S: String);override;
    procedure Sort; virtual;
    procedure CustomSort(Compare: TStringListSortCompare); virtual;
    property Duplicates: TDuplicates read FDuplicates write FDuplicates;
    property Sorted: Boolean read FSorted write SetSorted;
    property CaseSensitive: Boolean read FCaseSensitive write SetCaseSensitive;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnChanging: TNotifyEvent read FOnChanging write FOnChanging;
  end;

  TStream = public abstract class(TObject, IDisposable)
  private
    function GetPosition:Int64;
    procedure SetPosition(const Value:Int64);
    function GetSize:Int64;
  assembly or protected
    function ReadLine:String;virtual;abstract;
    procedure WriteLine(Value:String);virtual;abstract;
  protected
    procedure SetSize(const NewSize: Int64); virtual;abstract;
  public
    function Read(var Buffer:array of Byte; Count: LongInt): LongInt; virtual; abstract;
    function Write(const Buffer:array of Byte; Count: LongInt): LongInt; virtual; abstract;
    function Seek(const Offset: Int64; Origin: TSeekOrigin): Int64; virtual; abstract;
    function Seek(const Offset: Int64; Origin: Int32): Int64; 
    procedure ReadBuffer(var Buffer:array of Byte; Count: LongInt);
    procedure WriteBuffer(const Buffer:array of Byte; Count: LongInt);
    function CopyFrom(Source: TStream; Count: Int64): Int64;
    function ReadComponent(Instance: TComponent): TComponent;
    function ReadComponentRes(Instance: TComponent): TComponent;
    procedure WriteComponent(Instance: TComponent);
    procedure WriteComponentRes(ResName: String; Instance: TComponent);
    procedure WriteDescendent(Instance, Ancestor: TComponent); 
    procedure WriteDescendentRes(ResName: String; Instance, Ancestor: TComponent);
    procedure WriteResourceHeader(ResName: String; out FixupInfo: Integer);
    procedure FixupResourceHeader(FixupInfo: Integer);
    procedure ReadResHeader;
    property Position: Int64 read GetPosition write SetPosition;
    property Size: Int64 read GetSize write SetSize;

    procedure Dispose; virtual; empty;
  end;
  
  
  THandleStream = public class(TStream)
  protected
    FHandle: SafeFileHandle;
    FStream: System.IO.FileStream;
    FReader: System.IO.StreamReader;
    function GetHandle: SafeFileHandle;
    procedure SetSize(const NewSize: Int64); override;
  assembly or protected
    function ReadLine:String;override;
    procedure WriteLine(Value:String);override;
  public
    constructor Create(AHandle: SafeFileHandle);
    function Read(var Buffer:array of Byte; Count: LongInt): LongInt; override;
    function Write(const Buffer:array of Byte; Count: LongInt): LongInt; override;
    function Seek(const Offset: Int64; Origin: TSeekOrigin): Int64; override;
    procedure Dispose; override;
    property Handle: SafeFileHandle read GetHandle;
  end;
  
  TFileStream = public class(THandleStream)
  public
    constructor Create(FileName: String; Mode: Word); 
    constructor Create(FileName: String; Mode: Word; Rights: Cardinal); 
  end;
  
  TCustomMemoryStream = public abstract class(TStream)
  private
    function GetMemory:array of Byte;
  protected
    FStream:System.IO.MemoryStream;
    procedure SetSize(const NewSize: Int64);override;
  assembly or protected
    function ReadLine:String;override;
  public
    constructor Create;
    function Read(var Buffer:array of Byte; Count: LongInt): LongInt; override;
    function Seek(Offset: Int64; Origin: TSeekOrigin): Int64; override;
    procedure SaveToStream(Stream: TStream);
    procedure SaveToFile(FileName: String);
    //procedure Destroy;override;
    property Memory: array of Byte read GetMemory;
  end;
  
  TMemoryStream = public class(TCustomMemoryStream)
  private
    function GetCapacity: LongInt;
    procedure SetCapacity(NewCapacity: LongInt);
  protected
    function Realloc(var NewCapacity: LongInt): Object; virtual;
    property Capacity: LongInt read GetCapacity write SetCapacity;
  assembly or protected
    procedure WriteLine(Value:String);override;
  public
    procedure Clear;
    procedure LoadFromStream(Stream: TStream);
    procedure LoadFromFile(FileName: String);
    function Write(const Buffer:array of Byte; Count: LongInt): LongInt; override;
  end;
  
  TStringStream = public class(TStream)
  private
    FStream:System.Text.StringBuilder;
    function GetDataString:String;
    FPosition: Integer;
  protected
    procedure SetSize(NewSize: Int64); override;
  assembly or protected
    function ReadLine:String;override;
    procedure WriteLine(Value:String);override;
  public
    constructor Create(AString: String);
    function Read(var Buffer:array of Byte; Count: LongInt): LongInt; override;
    function ReadString(Count: LongInt): String;
    function Seek(Offset: Int64; Origin: TSeekOrigin): Int64; override;
    function Write(const Buffer:array of Byte; Count: LongInt): LongInt; override;
    procedure WriteString(AString: String);
    property DataString: String read GetDataString;
  end;
  
  TResourceStream = public class(TCustomMemoryStream)
  private
    // FStream:System.Resources.ResourceReader;
  protected
    procedure SetSize(NewSize: Int64); override;
  assembly or protected
    function ReadLine:String;override;
    procedure WriteLine(Value:String);override;
  public
    constructor Create(Instance: THandle; ResName: String; ResType: String);
    // chrome doesn't support constructors not named "Create"
    class function CreateFromID(aInstance: THandle; ResID: Integer; ResType: String):TResourceStream;
    function Write(const Buffer:array of Byte; Count: LongInt): LongInt; override;
    function Read(var Buffer:array of Byte; Count: LongInt): LongInt; override;
  end;

 
  EThread = public class(Exception);

  TThreadMethod = public procedure of object;
  TThreadMethodWithArgs = public procedure (Args:array of Object) of object;

  TThreadPriority = public (Idle, Lowest, Lower, Normal, Higher, Highest, TimeCritical);
  
type  
  TThread = public abstract class
  private
    FThread, FSynchThread:Thread;
    FSynchControl:Control;
    FReturnValue:Integer;
    FFatalException:Object;
    FFreeOnTerminate:Boolean;
    FHandle:THandle;
    FThreadID:THandle;
    FOnTerminate:TNotifyEvent;
    function GetPriority:TThreadPriority;
    procedure SetPriority(const Value:TThreadPriority);
    function GetSuspended:Boolean;
    function GetTerminated:Boolean;
    procedure SetSuspended(const Value:Boolean);
  protected
    procedure DoTerminate; virtual;
    procedure Execute; virtual; abstract;
    
    procedure Synchronize(AMethod: TThreadMethod);
    property ReturnValue: Integer read FReturnValue write FReturnValue; // TODO: this is always 0 for now
    property Terminated: Boolean read GetTerminated;
  public
    constructor Create(CreateSuspended: Boolean);
    constructor Create(CreateSuspended: Boolean; SynchThread:Thread);
    constructor Create(CreateSuspended: Boolean; SynchControl:Control);
    constructor Create(CreateSuspended: Boolean; SynchForm:Form);
    
    procedure Resume;
    procedure Suspend;
    procedure Terminate;
    function WaitFor: LongWord;

    property FatalException: Object read FFatalException;
    property FreeOnTerminate: Boolean read FFreeOnTerminate write FFreeOnTerminate;
    property Handle: THandle read FHandle;
    property Priority: TThreadPriority read GetPriority write SetPriority;
    property Suspended: Boolean read GetSuspended write SetSuspended;
    property ThreadID: THandle read FThreadID;
    property OnTerminate: TNotifyEvent read FOnTerminate write FOnTerminate;
  end;  
  
implementation

function RTLStreamToDotNetStream(AStream:TStream):System.IO.Stream;
var 
  buf:array of Byte := new Byte[1024]; // need to be dynamic
  ACount:Int32;
begin
  Result := new System.IO.MemoryStream;
  while AStream.Position <= AStream.Size do
  begin
    ACount := AStream.Read(buf, buf.Length);
    Result.Write(buf, 0, ACount);
    if ACount < buf.Length then 
      Exit;
  end;
end;

function DotNetStreamToRTLStream(AStream:System.IO.Stream):TStream;
var 
  buf:array of Byte := new Byte [1024];
  ACount:Int32;
begin
  Result := new TMemoryStream;
  while AStream.Position <= AStream.Length do
  begin
    ACount := AStream.Read(buf, 0, buf.Length);
    Result.Write(buf, ACount);
    if ACount < buf.Length then 
      Exit;
  end;
end;


{ TListSortCompareWrapper }

constructor TListSortCompareWrapper.Create(AComparer:TListSortCompare);
begin
  inherited Create;
  FComparer := AComparer;
end;

function TListSortCompareWrapper.Compare(X,Y:Object):Integer;
begin
  if FComparer <> nil then
    Result := FComparer(X, Y)
  else
    Result := X.GetHashCode - Y.GetHashCode;
end;

{ TList }

function TList.GetEnumerator: IEnumerator;
begin
 Result := IEnumerator(FList.GetEnumerator); //pass the enumerator of the internal arraylist.
end;

function TList.GetCapacity:Int32;
begin
  Result := FList.Capacity;
end;

procedure TList.SetCapacity(const Value:Int32);
begin
  FList.Capacity := Value;
end;

function TList.GetCount:Int32;
begin
  Result := FList.Count;
end;

procedure TList.SetCount(const Value:Int32);
var
  I: Integer;
begin
  if (Value < 0) or (Value > MaxListSize) then
    Error(SListCountError, Value);
  if Value > Capacity then
    Capacity := Value;
  if Value > Count then
    for I := Count + 1 to Value do
      Add(nil)
  else
    for I := Count - 1 downto Value do
      Delete(I);
end;

function TList.Get(Index:Int32):Object;
begin
  if (Index < 0) or (Index >= Count) then
    Error(SListIndexError, Index);
  Result := FList[Index];
end;

procedure TList.Put(Index:Int32; const Value:Object);
var Temp:Object;
begin
  if (Index < 0) or (Index >= Count) then
    Error(SListIndexError, Index);
  if Value <> FList[Index] then
  begin
    Temp := FList[Index]; 
    FList[Index] := Value;
    if Temp <> nil then
      Notify(Temp, TListNotification.Deleted);
    if Value <> nil then
      Notify(Value, TListNotification.Added);
  end;
end;

procedure TList.Notify(Ptr: Object; Action: TListNotification);
begin
  // do nothing
end;

constructor TList.Create;
begin
  inherited;
  FList := new ArrayList;
end;

class procedure TList.Error(Msg: String; Data: Integer); 
begin
  raise EListError.Create(String.Format(Msg, Data));
end;

function TList.Add(Item: Object): Integer;
begin
  Result := FList.Add(Item);
  if Item <> nil then
    Notify(Item, TListNotification.Added);
end;

procedure TList.Clear; 
begin
  Count := 0;
end;

procedure TList.Delete(Index: Integer);
var Temp:Object;
begin
  if (Index < 0) or (Index >= Count) then
    Error(SListIndexError, Index);
  Temp := FList[Index];
  FList.RemoveAt(Index);
  if Temp <> nil then
    Notify(Temp, TListNotification.Deleted);
end;

procedure TList.Exchange(Index1, Index2: Integer);
var
  Item: Object;
begin
  if (Index1 < 0) or (Index1 >= Count) then
    Error(SListIndexError, Index1);
  if (Index2 < 0) or (Index2 >= Count) then
    Error(SListIndexError, Index2);
  Item := FList[Index1];
  FList[Index1] := FList[Index2];
  FList[Index2] := Item;
end;

function TList.Expand: TList;
begin
  FList.Capacity := FList.Capacity * 2;
  Result := self;
end;  

function TList.Extract(Item: Object): Object;
var
  I: Integer;
begin
  Result := nil;
  I := IndexOf(Item);
  if I >= 0 then
  begin
    Result := Item;
    FList[I] := nil;
    Delete(I);
    Notify(Result, TListNotification.Extracted);
  end;
end;

function TList.First: Object;
begin
  Result := Get(0);
end;

function TList.IndexOf(Item: Object): Integer;
begin
  Result := FList.IndexOf(Item);
end;

procedure TList.Insert(Index: Integer; Item: Object);
begin
  if (Index < 0) or (Index >= Count) then
    Error(SListIndexError, Index);
  FList.Insert(Index, Item);
  if Item <> nil then
    Notify(Item, TListNotification.Added);
end;

function TList.Last: Object;
begin
  Result := Get(Count-1);
end;

procedure TList.Move(CurIndex, NewIndex: Integer);
var
  Item: Object;
begin
  if CurIndex <> NewIndex then
  begin
    if (NewIndex < 0) or (NewIndex >= Count) then
      Error(SListIndexError, NewIndex);
    Item := Get(CurIndex);
    FList[CurIndex] := nil;
    Delete(CurIndex);
    Insert(NewIndex, nil);
    Put(NewIndex, Item);
  end;
end;

function TList.Remove(Item: Object): Integer;
begin
  Result := FList.IndexOf(Item);
  if Result >= 0 then
    Delete(Result);
end;

procedure TList.Pack;
var
  I: Integer;
begin
  for I := Count - 1 downto 0 do
    if Items[I] = nil then
      Delete(I);
end;

procedure TList.Sort(Compare: TListSortCompare);
begin
  if Count > 1 then 
  begin
    if Compare = nil then
      FList.Sort
    else
      FList.Sort(new TListSortCompareWrapper(Compare));
  end;
end;

procedure TList.Assign(ListA: TList; AOperator: TListAssignOp);
Var
  TempList: ArrayList;
begin
  Clear;
  case AOperator of
    TListAssignOp.Copy: //dest becomes a copy of the source, dest's original content is forgotten
    begin
      Clear;
      FList.AddRange(ListA.List);
    end;
    TListAssignOp.And: //intersection of the two lists
    begin
      for ThisListObject: Object in FList do
      begin
        If not ListA.List.Contains(ThisListObject) then
        begin
          FList.Remove(ThisListObject);  
        end;
      end;       
    end;
    TListAssignOp.Or: //union of the two lists
    begin
      for ListAObject: Object in ListA.List do
      begin
        If not FList.Contains(ListAObject) then
        begin
          FList.Add(ListAObject);  
        end;
      end;    
    end;
    TListAssignOp.Xor:  //only those not in both lists
    begin
      for ListAObject: Object in ListA.List do
      begin
        If FList.Contains(ListAObject) then
        begin
          FList.Remove(ListAObject);  
        end
        else
        begin
          FList.Add(ListAObject);
        end;
      end;    
    end;
    TListAssignOp.SrcUnique: //Replaces the destination list with those elements of the source list that do not appear in the destination list. 
    begin
      TempList := New ArrayList;
      for ListAObject: Object in ListA.List do
      begin
        If not FList.Contains(ListAObject) then
        begin
          TempList.Add(ListAObject);  
        end;
        FList := TempList;
      end;  
    end; 
    TListAssignOp.DestUnique: //Removes all elements from the destination list that appear in the source list. The destination list ends up containing the elements unique to the original destination list
    begin
      for ThisListObject: Object in FList do
      begin
        If ListA.List.Contains(ThisListObject) then
        begin
          FList.Remove(ThisListObject);  
        end;
      end;  
    end;    
  End;  
end;

procedure TList.Assign(ListA: TList);
begin
  Assign(ListA, TListAssignOp.Copy);  
end;

procedure TList.Assign(ListA: TList; AOperator: TListAssignOp; ListB: TList);
begin
  Assign(ListA, TListAssignOp.Copy);
  Assign(ListB, AOperator);  
end;

{ TThreadList }

constructor TThreadList.Create;
begin
  inherited Create;
  FList := new TList;
end;

procedure TThreadList.Add(Item: Object);
begin
  LockList;
  try
    if (Duplicates = TDuplicates.Accept) or (FList.IndexOf(Item) < 0) then
      FList.Add(Item)
    else if Duplicates = TDuplicates.Error then
      FList.Error(SDuplicateItem, Integer(Item));
  finally
    UnlockList;
  end;
end;

procedure TThreadList.Clear;
begin
  LockList;
  try
    FList.Clear;
  finally
    UnlockList;
  end;
end;

function  TThreadList.LockList: TList;
begin
  Monitor.Enter(FList);
  Result := FList;
end;

procedure TThreadList.Remove(Item: Object);
begin
  LockList;
  try
    FList.Remove(Item);
  finally
    UnlockList;
  end;
end;

procedure TThreadList.UnlockList;
begin
  Monitor.Exit(FList);
end;


{ TInterfaceList }

function TInterfaceList.Get(Index: Integer): Object;
begin
  Result := FList.LockList[Index];
  FList.UnlockList;
end;

function TInterfaceList.GetCapacity: Integer;
begin
  Result := FList.LockList.Capacity;
  FList.UnlockList;
end;

function TInterfaceList.GetCount: Integer;
begin
  Result := FList.LockList.Count;
  FList.UnlockList;
end;

procedure TInterfaceList.Put(Index: Integer; const Value: Object);
begin
  FList.LockList[Index] := Value;
  FList.UnlockList;
end;

procedure TInterfaceList.SetCapacity(const Value: Integer);
begin
  FList.LockList.Capacity := Value;
  FList.UnlockList;
end;

procedure TInterfaceList.SetCount(const Value: Integer);
var AList:TList;
begin
  AList := FList.LockList;
  try
    if Value = 0 then
      AList.Clear
    else 
    begin
      while AList.Count < Value do
        AList.Add(nil);
      while AList.Count > Value do
        AList.Delete(AList.Count-1);
    end;
  finally
    FList.UnlockList;
  end;
end;

constructor TInterfaceList.Create;
begin
  inherited Create;
  FList := new TThreadList;
end;

procedure TInterfaceList.Clear;
begin
  FList.LockList.Clear;
  FList.UnlockList;
end;

procedure TInterfaceList.Delete(Index: Integer);
var AList:TList;
begin
  AList :=  FList.LockList;
  try
    AList.Delete(Index);
  finally
    FList.UnlockList;
  end;
end;

procedure TInterfaceList.Exchange(Index1, Index2: Integer);
var 
  AList:TList;
  Temp:Object;
begin
  AList := FList.LockList;
  try
    Temp := AList.Items[Index1];
    AList.Items[Index1] := AList.Items[Index2];
    AList.Items[Index2] := Temp;
  finally
    FList.UnlockList;
  end;
end;

function TInterfaceList.Expand: TInterfaceList;
var 
  AList:TList;
begin
  AList := FList.LockList;
  try
    AList.Capacity := AList.Capacity + 1;
  finally
    FList.UnlockList;
  end;
  Result := self;
end;

function TInterfaceList.First: Object;
begin
  Result := FList.LockList.First;
  FList.UnlockList;
end;

function TInterfaceList.IndexOf(const Item: Object): Integer;
begin
  Result := FList.LockList.IndexOf(Item);
  FList.UnlockList;
end;

function TInterfaceList.Add(const Item: Object): Integer;
begin
  Result := FList.LockList.Add(Item);
  FList.UnlockList;
end;

procedure TInterfaceList.Insert(Index: Integer; const Item: Object);
begin
  FList.LockList.Insert(Index, Item);
  FList.UnlockList;
end;

function TInterfaceList.Last: Object;
begin
  Result := FList.LockList.Last;
  FList.UnlockList;
end;

function TInterfaceList.Remove(const Item: Object): Integer;
begin
  FList.LockList.Remove(Item);
  FList.UnlockList;
end;

procedure TInterfaceList.Lock;
begin
  FList.LockList;
end;

procedure TInterfaceList.Unlock;
begin
  FList.UnlockList;
end;


{ TBits }

function TBits.GetBit(Index:Integer):Boolean;
begin
  Result := FBits.Get(Index);
end;

procedure TBits.SetBit(const Index:Integer; const Value:Boolean);
begin
  FBits.Set(Index, Value);
end;

procedure TBits.SetSize(const Value:Int32);
begin
  FBits.Length := Value;
end;

function TBits.GetSize:Int32;
begin
  Result := FBits.Length;
end;

constructor TBits.Create;
begin
  inherited Create;
  FBits := new BitArray(0);
end;

function TBits.OpenBit: Integer;
begin
  for Result := 0 to FBits.Length - 1 do
    if not FBits.Get(Result) then
      Exit;
  Result := -1;
end;


{ TPersistent}

function TPersistent.GetOwner: TPersistent; 
begin
  Result := nil;
end;

procedure TPersistent.Assign(Source: TPersistent); 
begin
  if Source <> nil then
    Source.AssignTo(Self) 
  else 
    AssignError(nil);
end;

procedure TPersistent.AssignTo(Dest: TPersistent); 
begin
  Dest.AssignError(Self);
end;

function TPersistent.GetNamePath: String; 
var
  S: String;
begin
  Result := Self.ToString;
  if (GetOwner <> nil) then
  begin
    S := GetOwner.GetNamePath;
    if S <> '' then
      Result := S + '.' + Result;
  end;
end;

procedure TPersistent.AssignError(Source: TPersistent); 
var
  SourceName: String;
begin
  if Source <> nil then
    SourceName := Source.ToString 
  else
    SourceName := 'nil';
  raise EConvertError.Create(String.Format(SAssignError, SourceName, ToString));
end;


{ TStrings }

function TStrings.GetCommaText:String;
var ASep, AQuote:Char;
begin
  ASep := Delimiter;
  AQuote := QuoteChar;
  try
    Delimiter := ',';
    QuoteChar := '"';
    Result :=  GetDelimitedText;
  finally
    Delimiter := ASep;
    QuoteChar := AQuote;
  end;
end;

procedure TStrings.SetCommaText(Value:String);
var ASep, AQuote:Char;
begin
  ASep := Delimiter;
  AQuote := QuoteChar;
  try
    Delimiter := ',';
    QuoteChar := '"';  
    SetDelimitedText(Value);
  finally
    Delimiter := ASep;
    QuoteChar := AQuote;
  end;
end;


function TStrings.GetName(Index:Integer):String;
var i:Int32;
begin
  i := Strings[Index].IndexOf('=');
  if i >= 0 then
    // truncating Substring
    //Result := Strings[Index].Substring(0, i - 1)
    Result := Strings[Index].Substring(0, i)
  else
    Result := '';
end;

function TStrings.GetValue(Name:String):String;
var i:Int32;
begin
  i := IndexOfName(Name);
  if i >= 0 then
    Result := Strings[i].Substring(Name.Length + 1)
  else
    Result := '';
end;

procedure TStrings.SetValue(Name, Value:String);
var i:Int32;
begin
  i := IndexOfName(Name);
  if Value <> '' then
  begin
    if i >= 0 then
      Strings[i] := Name + '=' + Value
    else
      Add(Name + '=' + Value);
  end
  else if i >= 0 then
    Delete(i);
end;

function TStrings.GetDelimitedText:String;
var S:System.Text.StringBuilder;
begin
  S := new System.Text.StringBuilder;
  for i:Int32 := 0 to Count -1 do
  begin
    S.Append(QuoteChar);
    S.Append(Strings[i]);
    S.Append(QuoteChar);
    if i <> Count -1 then
      S.Append(Delimiter);
  end;
  Result := S.ToString;
end;

procedure TStrings.SetDelimitedText(Value:String);
begin
  Clear;
  if Value <> nil then
    for each S:String in Value.Split([Delimiter]) do  
      Add(AnsiDequotedStr(S, QuoteChar));
end;

    
function TStrings.GetCapacity: Integer; 
begin
  Result := Count;
end;

function TStrings.GetTextStr: String; 
var S:System.Text.StringBuilder;
begin
  S := new System.Text.StringBuilder;
  for i:Int32 := 0 to Count - 1 do
  begin
    S.Append(Strings[i]);
    if i <> Count -1 then
      S.Append(System.Environment.NewLine);
  end;
  Result := S.ToString;
end;


procedure TStrings.SetCapacity(NewCapacity: Integer); 
begin
  // do nothing
end;

procedure TStrings.SetTextStr(Value: String); 
var S:String;
begin
  Clear;
  if Value <> nil then
    with T:System.IO.StringReader := new System.IO.StringReader(Value) do
    begin
      while true do
      begin 
        S := T.ReadLine;
        if S = nil then
          Exit;
        Add(S);  
      end;
    end;
end;

function TStrings.CompareStrings(S1, S2: String): Integer; 
begin
  Result := AnsiCompareText(S1, S2);
end;

function TStrings.CompareObjects(O1, O2: Object): Integer; 
begin
  Result := O1.GetHashCode - O2.GetHashCode;
end;

procedure TStrings.Changed; 
begin
end;

procedure TStrings.Changing; 
begin
end;

constructor TStrings.Create;
begin
  inherited Create;
  FQuoteChar := '"';
  FDelimiter := ',';
end;

function TStrings.Add(S: String): Integer; 
begin
  Result := AddObject(S, nil);
end;

function TStrings.AddObject(S: String; AObject: Object): Integer; 
begin
  Result := Count;
  InsertObject(Count, S, AObject);
end;

procedure TStrings.Append(S: String);
begin
  Add(S);
end;

procedure TStrings.AddStrings(aStrings: TStrings); 
begin
  if aStrings <> nil then
  begin
    BeginUpdate;
    try
      for i:Int32 := 0 to aStrings.Count - 1 do
        AddObject(aStrings[i], aStrings.Objects[i]);
    finally
      EndUpdate;
    end;
  end;
end;

procedure TStrings.Assign(Source: TPersistent); 
begin
  if Source is TStrings then
  begin
    Clear;
    AddStrings(TStrings(Source));
  end  
  else
    inherited Assign(Source);
end;

procedure TStrings.BeginUpdate;
begin
  if FUpdateCount = 0 then
    Changing;
  inc(FUpdateCount);
end;

procedure TStrings.EndUpdate;
begin
  dec(FUpdateCount);
  if FUpdateCount = 0 then
    Changed;
end;

function TStrings.Equals(aStrings: TStrings): Boolean;
begin
  Result := false;
  if (aStrings = nil) or (Count <> aStrings.Count) then Exit;
  for i:Int32 := 0 to Count - 1 do
    if (CompareStrings(Self.Strings[i], aStrings[i]) <> 0) or 
      (CompareObjects(Self.Objects[i], aStrings.Objects[i]) <> 0) then
        Exit;
  Result := true;
end;

procedure TStrings.Exchange(Index1, Index2: Integer); 
var
  AObject:Object;
  AString:String;
begin
  BeginUpdate;
  try
    AObject := Objects[Index1];
    AString := Strings[Index1];
    Objects[Index1] := Objects[Index2];
    Strings[Index1] := Strings[Index2];
    Objects[Index2] := AObject;
    Strings[Index2] := AString;
  finally
    EndUpdate;
  end;
end;

function TStrings.GetText: String; 
begin
  Result := GetTextStr;
end;

procedure TStrings.SetText(aText: String); 
begin
  SetTextStr(aText);
end;

function TStrings.IndexOf(S: String): Integer; 
begin
  for Result := 0 to Count -1 do
    if CompareStrings(Strings[Result], S) = 0 then
      Exit;
  Result := -1;
end;

function TStrings.IndexOfName(Name: String): Integer; 
var 
  AName:String;
  i:Int32;
begin
  for Result := 0 to Count -1 do
  begin
    i := Strings[Result].IndexOf('=');
    if i >= 0 then
    begin
      // Truncating String    
      //AName := Strings[Result].Substring(0,i-1);
      AName := Strings[Result].Substring(0,i);
      if CompareStrings(AName, Name) = 0 then
        Exit;
    end;
  end;
  Result := -1;
end;

function TStrings.IndexOfObject(AObject: Object): Integer; 
begin
  for Result := 0 to Count - 1 do
    if CompareObjects(Objects[Result], AObject) = 0 then
      Exit;
  Result := -1;
end;

procedure TStrings.InsertObject(Index: Integer; S: String; AObject: Object); 
begin
  Insert(Index, S);
  PutObject(Index, AObject);
end;

procedure TStrings.LoadFromFile(FileName: String); 
var F:TFileStream;
begin
  F := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
    LoadFromStream(F);
  finally
    F.Free; // closes the file
  end;
end;

procedure TStrings.LoadFromStream(Stream: TStream); 
var 
  S:String;
begin
  Clear;
  while true do
  begin
    S := Stream.ReadLine;
    if S = nil then Exit;
    Add(S);
  end;
end;

procedure TStrings.Move(CurIndex, NewIndex: Integer); 
var 
  AObject:Object;
  AString:String;
begin
  AString := Strings[CurIndex];
  AObject := Objects[CurIndex];
  Delete(CurIndex);
  InsertObject(NewIndex, AString, AObject);
end;

procedure TStrings.SaveToFile(FileName: String); 
var F:TFileStream;
begin
  F := TFileStream.Create(FileName, fmCreate or fmShareExclusive);
  try
    SaveToStream(F);
  finally
    F.Free;
  end;
end;

procedure TStrings.SaveToStream(Stream: TStream); 
begin
  for i:Int32 := 0 to Count -1 do
    Stream.WriteLine(Strings[i]);
end;

{ TStringList }

type
  TStringItem = class
  assembly
    AString: String;
    AObject: Object;
  end;
  
function TStringList.Get(Index: Integer): String; 
begin
  Result := TStringItem(FStrings[Index]).AString;
end;

function TStringList.GetCapacity: Integer; 
begin
  Result := FStrings.Capacity;
end;

function TStringList.GetCount: Integer; 
begin
  Result := FStrings.Count;
end;

function TStringList.GetObject(Index: Integer): Object; 
begin
  Result := TStringItem(FStrings[Index]).AObject;
end;

procedure TStringList.Put(Index: Integer; S: String); 
begin
  if CompareStrings(TStringItem(FStrings[Index]).AString,S) <> 0 then
  begin
    Changing;
    TStringItem(FStrings[Index]).AString := S;
    Changed;
   end;
end;

procedure TStringList.PutObject(Index: Integer; AObject: Object); 
begin
  if CompareObjects(TStringItem(FStrings[Index]).AObject, AObject) <> 0 then
  begin
    Changing;
    TStringItem(FStrings[Index]).AObject := AObject;
    Changed;
   end;
end;

procedure TStringList.SetCapacity(NewCapacity: Integer); 
begin
  FStrings.Capacity := NewCapacity;
end;

function TStringList.CompareStrings(S1, S2: String): Integer; 
begin
  if CaseSensitive then
    Result := AnsiCompareStr(S1, S2)
  else
    Result := AnsiCompareText(S1, S2);
end;

procedure TStringList.SetSorted(Value:Boolean);
begin
  if FSorted <> Value then
  begin
    FSorted := Value;
    if FSorted then Sort;
  end;
end;

procedure TStringList.SetCaseSensitive(Value:Boolean);
begin
  if FCaseSensitive <> Value then
  begin
    FCaseSensitive := Value;
    if Sorted then Sort;
  end;
end;

procedure TStringList.Changing;
begin
  if (UpdateCount = 0) and assigned(FOnChanging) then
    FOnChanging(Self);
end;

procedure TStringList.Changed;
begin
  if (UpdateCount = 0) and assigned(FOnChange) then
    FOnChange(Self);
end;

constructor TStringList.Create;
begin
  inherited Create;
  FStrings := ArrayList.Create;
end;

procedure TStringList.Clear; 
begin
  Changing;
  FStrings.Clear;
  Changed;
end;

procedure TStringList.Delete(Index: Integer); 
begin
  Changing;
  FStrings.RemoveAt(Index);
  Changed;
end;

procedure TStringList.Exchange(Index1, Index2: Integer); 
begin
  Changing;
  ExchangeItems(Index1, Index2);
  Changed;
end;

function TStringList.Find(S: String; var Index: Integer): Boolean; 
begin
  if Sorted then
    Result := FindBin(S, Index)
  else
    Result := FindLinear(S, Index);
end;

function TStringList.FindBin(S: String; var Index: Integer): Boolean; 
var
  iLeft, iRight, iCurrent: Integer;
  iCompare: Integer;
begin
  Result := False;
  iLeft := 0;
  iRight := Count - 1;
  while iLeft <= iRight do
  begin
    iCurrent := (iLeft + iRight) shr 1;
    iCompare := CompareStrings(Strings[iCurrent], S);
    if iCompare < 0 then
      iLeft := iCurrent + 1
    else
    begin
      iRight := iCurrent - 1;
      if iCompare = 0 then
      begin
        Result := True;
        if Duplicates <> Duplicates.Accept then
          iLeft := iCurrent;
      end;
    end;
  end;
  Index := iLeft;
end;

function TStringList.FindLinear(S: String; var Index: Integer): Boolean; 
begin
  for Index := 0 to Count -1 do
  begin
    if CompareStrings(TStringItem(FStrings[Index]).AString, S) = 0 then
    begin
      Result := true;
      Exit;
    end;
  end;
  Index := -1; 
  Result := false;
end;

function TStringList.IndexOf(S: String): Integer; 
begin
  if not Sorted then 
    Result := inherited IndexOf(S) 
  else
    if not Find(S, Result) then 
      Result := -1;
end;

procedure TStringList.Insert(Index: Integer; S: String); 
begin
  InsertObject(Index, S, nil);
end;

procedure TStringList.InsertObject(Index: Integer; S: String; AObject: Object); 
var 
  AItem:TStringItem;
begin
  if Sorted then
    raise new EStringListError(SSortedListError);

  Changing;
  AItem := new TStringItem;
  AItem.AString := S;
  AItem.AObject := AObject;
  FStrings.Insert(Index, AItem);
  Changed;
end;

function MethodCompareStrings(List: TStringList; Index1, Index2: Integer): Integer;
begin
  Result := List.CompareStrings(List[Index1], List[Index2]);
end;

procedure TStringList.Sort; 
begin
  Changing;
  CustomSort(@MethodCompareStrings);
  Changed;
end;

procedure TStringList.CustomSort(Compare: TStringListSortCompare); 
begin
  QuickSort(0, Count - 1, Compare);
end;

procedure TStringList.ExchangeItems(Index1, Index2: Integer);
var
  pTemp: TStringItem;
begin
  pTemp := TStringItem(FStrings[Index1]);
  FStrings[Index1] := FStrings[Index2];
  FStrings[Index2] := pTemp;
end;

procedure TStringList.QuickSort(Left, Right: Integer; Compare: TStringListSortCompare);
var
  I, J, P: Integer;
begin
  repeat
    I := Left;
    J := Right;
    P := (Left + Right) shr 1;
    repeat
      while Compare(Self, I, P) < 0 do
        inc(I);
      while Compare(Self, J, P) > 0 do
        dec(J);
      if I <= J then
      begin
        ExchangeItems(I, J);
        if P = I then
          P := J
        else if P = J then
          P := I;
        inc(I);
        dec(J);
      end;
    until I > J;
    if Left < J then
      QuickSort(Left, J, Compare);
    Left := I;
  until I >= Right;
end;

{ TStream }

function TStream.GetPosition:Int64;
begin
  Result := Seek(0, soFromCurrent);
end;

procedure TStream.SetPosition(const Value:Int64);
begin
  Seek(Value, soFromBeginning);
end;

function TStream.Seek(const Offset: Int64; Origin: Int32): Int64; 
begin
  Result := Seek(Offset, TSeekOrigin(Origin));
end;  

function TStream.GetSize:Int64;
var CurPos:Int64;
begin
  CurPos := GetPosition;
  Result := Seek(0, soFromEnd);
  Seek(CurPos, soFromBeginning);
end;

procedure TStream.ReadBuffer(var Buffer:array of Byte; Count: LongInt);
begin
  if Count <> 0 then
    if Self.Read(Buffer, Count) <> Count then
      raise EReadError.Create(SReadError);
end;

procedure TStream.WriteBuffer(const Buffer:array of Byte; Count: LongInt);
begin
  if Count <> 0 then
    if Self.Write(Buffer, Count) <> Count then
      raise EReadError.Create(SWriteError);
end;

function TStream.CopyFrom(Source: TStream; Count: Int64): Int64;
var 
  buf:TByteDynArray;
require
  Source <> nil;
begin
  // we don't try to implement any opimization (like reading smaller buffers, for example):just make it work
  if Count = 0 then
  begin 
    // copy everything
    Source.Position := 0;
    Result := Source.Size;
  end
  else
    Result := Count;
    
  buf := new TByteDynArray(Result);
  Source.ReadBuffer(buf, Result);
  WriteBuffer(buf, Result);
end;

function TStream.ReadComponent(Instance: TComponent): TComponent;
begin
  NotImplemented;
end;

function TStream.ReadComponentRes(Instance: TComponent): TComponent;
begin
  NotImplemented;
end;

procedure TStream.WriteComponent(Instance: TComponent);
begin
  NotImplemented;
end;

procedure TStream.WriteComponentRes(ResName: String; Instance: TComponent);
begin
  NotImplemented;
end;

procedure TStream.WriteDescendent(Instance, Ancestor: TComponent); 
begin
  NotImplemented;
end;

procedure TStream.WriteDescendentRes(ResName: String; Instance, Ancestor: TComponent);
begin
  NotImplemented;
end;

procedure TStream.WriteResourceHeader(ResName: String; out FixupInfo: Integer);
begin
  FixupInfo := 0;
  NotImplemented;
end;

procedure TStream.FixupResourceHeader(FixupInfo: Integer);
begin
  NotImplemented;
end;

procedure TStream.ReadResHeader;
begin
  NotImplemented;
end;

{ THandleStream }

function THandleStream.GetHandle: SafeFileHandle;
begin
  Result := FStream.SafeFileHandle;
end;

procedure THandleStream.SetSize(const NewSize: Int64); 
begin
  FStream.SetLength(NewSize);
end;

constructor THandleStream.Create(AHandle: SafeFileHandle);
begin
  inherited Create;
  if assigned(AHandle) then
  begin
    FHandle := AHandle;
    FStream := new System.IO.FileStream(FHandle, System.IO.FileAccess.ReadWrite);
    FReader := new System.IO.StreamReader(FStream);
  end;
end;

function THandleStream.Read(var Buffer:array of Byte; Count: LongInt): LongInt; 
begin
  Result := FStream.Read(Buffer, 0, Count);
end;

function THandleStream.Write(const Buffer:array of Byte; Count: LongInt): LongInt; 
begin
  Result := FStream.Position;
  FStream.Write(Buffer, 0, Count);
  Result := FStream.Position - Result;
end;

function THandleStream.Seek(const Offset: Int64; Origin: TSeekOrigin): Int64; 
begin
  Result := FStream.Seek(Offset, Origin);
end;

procedure THandleStream.Dispose;
begin
  if FStream <> nil then
  begin
    FStream.Flush;
    FStream.Close;

    FReader:Dispose;

    FHandle:Dispose;
    FStream := nil;
  end;
  inherited Dispose;
end;

function THandleStream.ReadLine: String; 
begin
  Result := FReader.ReadLine;
end;

procedure THandleStream.WriteLine(Value:String); 
begin
  with T := new System.IO.StreamWriter(FStream) do 
  begin  
    T.WriteLine(Value);
   T.Flush; // Need Flush to write files
  end;
end;


{ TFileStream }

constructor TFileStream.Create(FileName: String; Mode: Word); 
begin
  Create(FileName , Mode, 0);
end;


constructor TFileStream.Create(FileName: String; Mode: Word; Rights: Cardinal); 
var 
  FileMode:System.IO.FileMode;
  FileAccess:System.IO.FileAccess;
  FileShare:System.IO.FileShare;
begin
  inherited Create(nil);
  
  if Mode and fmCreate = fmCreate then
  begin
    FileMode := System.IO.FileMode.&Create;
    FileAccess := System.IO.FileAccess.ReadWrite;
  end
  else if Mode and fmOpenWrite = fmOpenWrite then
  begin
    FileMode := System.IO.FileMode.Open;
    FileAccess := System.IO.FileAccess.Write;
  end
  else if Mode and fmOpenReadWrite = fmOpenReadWrite then
  begin
    FileMode := System.IO.FileMode.Open;
    FileAccess := System.IO.FileAccess.ReadWrite;
  end
  else // if Mode and fmOpenRead = fmOpenRead then
  begin
    FileMode := System.IO.FileMode.Open;
    FileAccess := System.IO.FileAccess.Read;
  end;

  if (Mode <> 0) and (Mode and fmShareCompat = fmShareCompat) then
    FileShare := System.IO.FileShare.ReadWrite 
  else if Mode and fmShareDenyWrite = fmShareDenyWrite then
    FileShare := System.IO.FileShare.Read
  else if Mode and fmShareDenyRead = fmShareDenyRead then
    FileShare := System.IO.FileShare.Write
  else if Mode and fmShareDenyNone = fmShareDenyNone then
    FileShare := System.IO.FileShare.ReadWrite
  else // if Mode and fmShareExclusive = fmShareExclusive then
    FileShare := System.IO.FileShare.None;

  FStream := new System.IO.FileStream(FileName, FileMode, FileAccess, FileShare);
  FReader := new System.IO.StreamReader(FStream);
end;

{ TCustomMemoryStream }

function TCustomMemoryStream.GetMemory:array of Byte;
begin
  Result := FStream.GetBuffer;
end;

constructor TCustomMemoryStream.Create;
begin
  inherited Create;
  FStream := new System.IO.MemoryStream;
end;

function TCustomMemoryStream.Read(var Buffer:array of Byte; Count: LongInt): LongInt; 
begin
  Result := FStream.Read(Buffer, 0, Count);
end;

function TCustomMemoryStream.ReadLine: String; 
begin
  with T:System.IO.StreamReader := new System.IO.StreamReader(FStream) do
    Result := T.ReadLine;
end;

function TCustomMemoryStream.Seek(Offset: Int64; Origin: TSeekOrigin): Int64; 
begin
  Result := FStream.Seek(Offset, Origin);
end;

procedure TCustomMemoryStream.SaveToStream(Stream: TStream);
begin
  Stream.CopyFrom(Self, 0);
end;

procedure TCustomMemoryStream.SaveToFile(FileName: String);
var F:TFileStream;
begin
  F := new TFileStream(FileName, fmCreate or fmShareExclusive);
  try
    SaveToStream(F);    
  finally
    F.Free;
  end;
end;

procedure TCustomMemoryStream.SetSize(const NewSize: Int64);
begin
  FStream.SetLength(NewSize);
end;

{ TMemoryStream }

function TMemoryStream.GetCapacity: LongInt;
begin
  Result := FStream.Capacity;
end;

procedure TMemoryStream.SetCapacity(NewCapacity: LongInt);
begin
  FStream.Capacity := NewCapacity;
end;

function TMemoryStream.Realloc(var NewCapacity: LongInt): Object; 
begin
  FStream.Capacity := NewCapacity;
  Result := nil;
end;

procedure TMemoryStream.WriteLine(Value:String);
begin
  with T:System.IO.StreamWriter := new System.IO.StreamWriter(FStream) do
    T.WriteLine(Value); 
end;

procedure TMemoryStream.Clear;
begin
  SetSize(0);
end;

procedure TMemoryStream.LoadFromStream(Stream: TStream);
begin
  Clear;
  CopyFrom(Stream, 0);
end;

procedure TMemoryStream.LoadFromFile(FileName: String);
var F:TFileStream;
begin
  F := new TFileStream(FileName, fmOpenRead or fmShareDenyWrite);
  try
    LoadFromStream(F);
  finally
    F.Free;
  end;
end;

function TMemoryStream.Write(const Buffer:array of Byte; Count: LongInt): LongInt; 
begin
  Result := FStream.Position;
  FStream.Write(Buffer, 0, Count);
  Result := FStream.Position - Result;
end;

{ TStringStream }

function TStringStream.GetDataString:String;
begin
  Result := FStream.ToString;
end;

procedure TStringStream.SetSize(NewSize: Int64); 
begin
  FStream.Length := NewSize;
  if FPosition > NewSize then 
    FPosition := NewSize;
end;

constructor TStringStream.Create(AString: String);
begin
  inherited Create;
  FStream := new System.Text.StringBuilder;
  WriteString(AString);
end;

function TStringStream.Read(var Buffer:array of Byte; Count: LongInt): LongInt; 
var S:String;b:array of Char;
begin
  S := ReadString(Count);
  b := S.ToCharArray;
  &Array.Copy(b, Buffer, Count);
  Result := b.Length;
end;

function TStringStream.ReadString(Count: LongInt): String;
begin
  Result := DataString.Substring(0, Count);
  Seek(Result.Length, TSeekOrigin.Current);
end;

function TStringStream.Seek(Offset: Int64; Origin: TSeekOrigin): Int64; 
begin
  case Origin of
    TSeekOrigin.Begin: 
      FPosition := Offset;
    TSeekOrigin.Current: 
      FPosition := FPosition + Offset;
    TSeekOrigin.End: 
      FPosition := DataString.Length - Offset;
  end;
  if FPosition > DataString.Length then
    FPosition := DataString.Length
  else if FPosition < 0 then 
    FPosition := 0;
  Result := FPosition;
end;

function TStringStream.Write(const Buffer:array of Byte; Count: LongInt): LongInt; 
var b:array of Char;
begin
  &Array.Copy(Buffer, b, Count);
  WriteString(b.ToString);
end;

procedure TStringStream.WriteString(AString: String);
begin
  if AString <> '' then
  begin
    FStream.Append(AString);
    FPosition := FPosition + AString.Length;
  end;
end;

function TStringStream.ReadLine: String; 
var i:Int32;
begin
  i := DataString.IndexOf(Environment.NewLine, Position);
  if i >= 0 then
    Result := ReadString(i)
  else if Position < Size then
    Result := ReadString(Size - Position)
  else
    Result := nil;
end;

procedure TStringStream.WriteLine(Value:String); 
begin
  WriteString(Value);
end;

{ TResourceStream }

constructor TResourceStream.Create(Instance: THandle; ResName: String; ResType: String);
begin
  inherited Create;
end;

class function TResourceStream.CreateFromID(aInstance: THandle; ResID: Integer; ResType: String):TResourceStream;
begin
  Result := new TResourceStream(aInstance, ResID.ToString, ResType);
end;

function TResourceStream.Write(const Buffer:array of Byte; Count: LongInt): LongInt; 
begin
  raise EStreamError.Create(SCantWriteResourceStreamError);
end;

function TResourceStream.Read(var Buffer:array of Byte; Count: LongInt): LongInt; 
begin
  NotImplemented;
end;

procedure TResourceStream.SetSize(NewSize: Int64); 
begin
  raise EStreamError.Create(SStreamSetSize);
end;

function TResourceStream.ReadLine: String; 
begin
  NotImplemented;
end;

procedure TResourceStream.WriteLine(Value:String); 
begin
  raise EStreamError.Create(SCantWriteResourceStreamError);
end;

{ TThread }

function TThread.GetPriority:TThreadPriority;
begin
  case FThread.Priority of
    ThreadPriority.Lowest:
      Result := TThreadPriority.Lowest;
    ThreadPriority.BelowNormal:
      Result := TThreadPriority.Lower;
    ThreadPriority.Normal:
      Result := TThreadPriority.Normal;
    ThreadPriority.AboveNormal:
      Result := TThreadPriority.Higher;
    ThreadPriority.Highest:
      Result := TThreadPriority.Highest;
  end; // case
end;

procedure TThread.SetPriority(const Value:TThreadPriority);
begin
  case Value of
    TThreadPriority.Idle, TThreadPriority.Lowest:
      FThread.Priority := ThreadPriority.Lowest;
    TThreadPriority.Lower:
      FThread.Priority := ThreadPriority.BelowNormal;
    TThreadPriority.Normal:
      FThread.Priority := ThreadPriority.Normal;
    TThreadPriority.Higher:
      FThread.Priority := ThreadPriority.AboveNormal;
    TThreadPriority.Highest, TThreadPriority.TimeCritical:
      FThread.Priority := ThreadPriority.Highest;
  end; // case
end;

function TThread.GetSuspended:Boolean;
begin
  Result := FThread.ThreadState and ThreadState.Suspended = ThreadState.Suspended; 
end;

function TThread.GetTerminated:Boolean;
begin
  Result := (FThread.ThreadState and ThreadState.Stopped = ThreadState.Stopped) or
    (FThread.ThreadState and ThreadState.Aborted = ThreadState.Aborted);
end;

procedure TThread.SetSuspended(const Value:Boolean);
begin
  if Value <> GetSuspended then
  begin
    if Value then
      Suspend
    else
      Resume;
  end;
end;

procedure TThread.DoTerminate; 
begin
  FThread.Abort;
  if assigned(FOnTerminate) then
    FOnTerminate(Self);
end;

procedure TThread.Synchronize(AMethod: TThreadMethod);
var AForm:Form;
begin
  if FThread <> nil then
  begin
    FThread.Join();
    AMethod();
  end
  else if assigned(FSynchControl) then
    FSynchControl.Invoke(AMethod)
  else 
  begin
    AForm := nil;
    if not assigned(AForm) 
    and (Application.OpenForms.Count > 0) then
      AForm := Application.OpenForms[0]; // user hasn't set the global ApplicationMainForm variable, so check if there is another active form

    if not assigned(AForm) then
      raise new EThread('Cannot call TThread.Synchronize without an active form, control or thread');

    AForm.Invoke(AMethod);  
  end;
end;

constructor TThread.Create(CreateSuspended: Boolean);
begin
  inherited Create;
  FThread := new Thread(new ThreadStart(Execute));
  if not CreateSuspended then
    FThread.Start;
end;

constructor TThread.Create(CreateSuspended: Boolean; SynchThread:Thread);
begin
  Create(CreateSuspended);
  FSynchThread := SynchThread;
end;

constructor TThread.Create(CreateSuspended: Boolean; SynchControl:Control);
begin
  Create(CreateSuspended);
  FSynchControl := SynchControl;
end;

constructor TThread.Create(CreateSuspended: Boolean; SynchForm:Form);
begin
  Create(CreateSuspended, Control(SynchForm));
end;

procedure TThread.Resume;
begin
  if FThread.ThreadState and ThreadState.Unstarted = ThreadState.Unstarted then
    FThread.Start
  else
    {$HIDE PW3}
    FThread.Resume;
    {$SHOW PW3}
end;

procedure TThread.Suspend;
begin
  {$HIDE PW3}
  FThread.Suspend;
  {$SHOW PW3}
end;

procedure TThread.Terminate;
begin
  FThread.Abort;
  Synchronize(new TThreadMethod(DoTerminate));
end;

function TThread.WaitFor: LongWord;
begin
  FThread.Join;
  result := 0;
end;


end.