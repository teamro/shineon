namespace ShineOn.Rtl;

interface

uses
  System.ComponentModel,
  ShineOn.Rtl;

type
  EDatabaseError = public class(Exception);

  TFieldType = public (ftUnknown, ftString, ftSmallint, ftInteger, ftWord,
    ftBoolean, ftFloat, ftCurrency, ftBCD, ftDate, ftTime, ftDateTime,
    ftBytes, ftVarBytes, ftAutoInc, ftBlob, ftMemo, ftGraphic, ftFmtMemo,
    ftParadoxOle, ftDBaseOle, ftTypedBinary, ftCursor, ftFixedChar, ftWideString,
    ftLargeint, ftADT, ftArray, ftReference, ftDataSet, ftOraBlob, ftOraClob,
    ftVariant, ftInterface, ftIDispatch, ftGuid, ftTimeStamp, ftFMTBcd);

  TDataSetState = public (dsInactive, dsBrowse, dsEdit, dsInsert, dsSetKey,
    dsCalcFields, dsFilter, dsNewValue, dsOldValue, dsCurValue, dsBlockRead,
    dsInternalCalc, dsOpening);
  TDataSetStates = public set of TDataSetState;

  TDataEvent = public (deFieldChange, deRecordChange, deDataSetChange,
    deDataSetScroll, deLayoutChange, deUpdateRecord, deUpdateState,
    deCheckBrowseMode, dePropertyChange, deFieldListChange,
    deFocusControl, deParentScroll, deConnectChange);

  TUpdateKind = public (ukModify, ukInsert, ukDelete);

  TFieldKind = public (fkData, fkCalculated, fkLookup, fkInternalCalc, fkAggregate);

  TFields = public class(TObject)
  private
    FList: System.Collections.Generic.List<TField>;
    FDataSet: TDataSet;
    FOnChange: TNotifyEvent;
  protected
    procedure Changed;
    procedure SetFieldIndex(Field: TField; Value: Integer);
    event OnChange: TNotifyEvent delegate FOnChange;
  public
    constructor Create(ADataSet: TDataSet);
    procedure Add(Field: TField);
    procedure Clear;
    function FindField(const FieldName: String): TField;
    function FieldByName(const FieldName: String): TField;
    procedure GetFieldNames(List: TStrings);
    function IndexOf(Field: TField): Integer;
    procedure Remove(Field: TField);
    property Count: Integer read FList.Count;
    property DataSet: TDataSet read FDataSet;
    property Fields[Index: Integer]: TField read FList[&Index] write FList[&Index]; default;
  end;

  TEditMask = public String;

  TField = public class(Component)
  assembly
    FFields: TFields;
  private
    FFieldName: WideString;
    FDataSet: TDataSet;
    FDataType: TFieldType;
    FFieldKind: TFieldKind;
    FVisible: Boolean;
    FEditMask: TEditMask;
    method GetDisplayLabel: WideString;
    method GetDisplayWidth: Integer;
    method GetIndex: Integer;
    method GetNewValue: Variant;
    method GetOldValue: Variant;
    method IsDisplayLabelStored: Boolean;
    method IsDisplayWidthStored: Boolean;
    method SetDisplayLabel(aValue: WideString);
    method SetDisplayWidth(aValue: Integer);
    method SetEditMask(const aValue: TEditMask);
    method SetFieldName(const aValue: WideString);
    method SetIndex(aValue: Integer);
    method SetNewValue(const aValue: Variant);
    method SetVisible(aValue: Boolean);
    protected
    method GetAsBoolean: Boolean; virtual;
    method GetAsDateTime: TDateTime; virtual;
    method GetAsInteger: LongInt; virtual;
    method GetAsString: WideString; virtual;
    method GetAsVariant: Variant; virtual;
    method GetIsNull: Boolean; virtual;
    method GetSize: Integer; virtual;
    method SetAsBoolean(aValue: Boolean); virtual;
    method SetAsDateTime(aValue: TDateTime); virtual;
    method SetAsInteger(aValue: LongInt); virtual;
    method SetAsString(const aValue: WideString); virtual;
    method SetAsVariant(const aValue: Variant); virtual;
    method SetDataSet(ADataSet: TDataSet); virtual;
    method SetFieldKind(aValue: TFieldKind); virtual;
    method SetSize(aValue: Integer); virtual;
  public
    constructor Create(AOwner: TComponent); virtual;
    method Clear; virtual;
    //method SetData(Buffer: Pointer; NativeFormat: Boolean := True);
    property AsBoolean: Boolean read GetAsBoolean write SetAsBoolean;
    property AsDateTime: TDateTime read GetAsDateTime write SetAsDateTime;
    property AsInteger: LongInt read GetAsInteger write SetAsInteger;
    property AsString: WideString read GetAsString write SetAsString;
    property DataSet: TDataSet read FDataSet write SetDataSet;
    property DataType: TFieldType read FDataType;
    property EditMask: TEditMask read FEditMask write SetEditMask;
    property IsNull: Boolean read GetIsNull;
    property NewValue: Variant read GetNewValue write SetNewValue;
    property OldValue: Variant read GetOldValue;
    property Size: Integer read GetSize write SetSize;
    property Value: Variant read GetAsVariant write SetAsVariant;
  public
    property DisplayLabel: WideString read GetDisplayLabel write SetDisplayLabel;
    property DisplayWidth: Integer read GetDisplayWidth write SetDisplayWidth;
    property FieldKind: TFieldKind read FFieldKind write SetFieldKind;
    property FieldName: WideString read FFieldName write SetFieldName;
    property Index: Integer read GetIndex write SetIndex;
    property Visible: Boolean read FVisible write SetVisible;
    property Fields: TFields read FFields;
  end;

  TStringField = public class(TField)
  private
    protected
    public
    constructor Create(AOwner: TComponent); override;
    public
    end;

  TNumericField = public class(TField)
  private
    protected
    public
    public
    end;

  TIntegerField = public class(TNumericField)
  private
    protected
    public
    constructor Create(AOwner: TComponent); override;
    public
    end;

  TBlobField = public class(TField)
  private
    protected
    public
    method LoadFromStream(Stream: TStream);
    method SaveToStream(Stream: TStream);
  end;

  TBookmark = public Object;

  TBookmarkStr = public WideString;

  TBookmarkFlag = public (bfCurrent, bfBOF, bfEOF, bfInserted);

  TResyncMode = public set of (rmExact, rmCenter);

  TDataAction = public (daFail, daAbort, daRetry);

  TBlobStreamMode = public (bmRead, bmWrite, bmReadWrite);

  TLocateOption = public (loCaseInsensitive, loPartialKey);

  TLocateOptions = public set of TLocateOption;

  TDataOperation = public delegate ;

  TDataSetNotifyEvent = public delegate(DataSet: TDataSet) ;

  TDataSetErrorEvent = public delegate(DataSet: TDataSet; E: EDatabaseError;
    var Action: TDataAction) ;

  TFilterRecordEvent = public delegate(DataSet: TDataSet; var Accept: Boolean) of object;


  TDataSet = public abstract class(Component)
  private
    FFields: TFields;
    FRecordCount: Integer;
    FActiveRecord: Integer;
    FFilterText: WideString;
    FState: TDataSetState;
    FBOF: Boolean;
    FEOF: Boolean;
    FModified: Boolean;
    FFiltered: Boolean;
    
    FOnFilterRecord: TFilterRecordEvent;
    FBeforeClose: TDataSetNotifyEvent;
    FBeforeOpen: TDataSetNotifyEvent;
    FBeforeCancel: TDataSetNotifyEvent;
    FBeforeDelete: TDataSetNotifyEvent;
    FAfterDelete: TDataSetNotifyEvent;
    FBeforeScroll: TDataSetNotifyEvent;
    FAfterScroll: TDataSetNotifyEvent;
    FBeforeRefresh: TDataSetNotifyEvent;
    FAfterRefresh: TDataSetNotifyEvent;
    FOnCalcFields: TDataSetNotifyEvent;
    FOnEditError: TDataSetErrorEvent;
    FOnNewRecord: TDataSetNotifyEvent;
    FAfterClose: TDataSetNotifyEvent;
    FBeforeInsert: TDataSetNotifyEvent;
    FAfterInsert: TDataSetNotifyEvent;
    FBeforeEdit: TDataSetNotifyEvent;
    FAfterEdit: TDataSetNotifyEvent;
    FAfterPost: TDataSetNotifyEvent;
    FAfterOpen: TDataSetNotifyEvent;
    FBeforePost: TDataSetNotifyEvent;
    FAfterCancel: TDataSetNotifyEvent;
    FOnPostError: TDataSetErrorEvent;
    FOnDeleteError: TDataSetErrorEvent;
    method BeginInsertAppend;
    method CheckOperation(Operation: TDataOperation;
      ErrorEvent: TDataSetErrorEvent);
    method EndInsertAppend;
    method GetActive: Boolean;
    method GetFieldCount: Integer;
    method MoveBuffer(CurIndex, NewIndex: Integer);
    protected
    method BookmarkAvailable: Boolean;
    method CheckActive; virtual;
    method CheckBiDirectional;
    method ClearBuffers; virtual;
    method DataEvent(&Event: TDataEvent; Info: LongInt); virtual;
    procedure DoAfterCancel; virtual;
    procedure DoAfterClose; virtual;
    procedure DoAfterDelete; virtual;
    procedure DoAfterEdit; virtual;
    procedure DoAfterInsert; virtual;
    procedure DoAfterOpen; virtual;
    procedure DoAfterPost; virtual;
    procedure DoAfterRefresh; virtual;
    procedure DoAfterScroll; virtual;
    procedure DoBeforeCancel; virtual;
    procedure DoBeforeClose; virtual;
    procedure DoBeforeDelete; virtual;
    procedure DoBeforeEdit; virtual;
    procedure DoBeforeInsert; virtual;
    procedure DoBeforeOpen; virtual;
    procedure DoBeforePost; virtual;
    procedure DoBeforeRefresh; virtual;
    procedure DoBeforeScroll; virtual;
    method FreeFieldBuffers; virtual;
    method GetBookmarkStr: TBookmarkStr; virtual;
    method GetPriorRecords: Integer; virtual;
    method GetPriorRecord: Boolean; virtual;
    method GetRecordCount: Integer; virtual;
    method InternalInsert; virtual;
    method InternalRefresh; virtual;
    method SetActive(Value: Boolean); virtual;
    method SetBookmarkStr(const Value: TBookmarkStr); virtual;
    method SetFiltered(Value: Boolean); virtual;
    method SetFilterText(const Value: WideString); virtual;
    method SetState(Value: TDataSetState);
  protected     
    method InternalDelete; virtual;
    method InternalLast; virtual;
    method InternalPost; virtual;
  assembly or protected
    method IntGetFieldValue(FieldNo: Integer): Object; abstract;
    method IntSetFieldValue(FieldNo: Integer; Value: Object); abstract;
  protected     
  public
    constructor Create;
    method Append;
    method Cancel; virtual;
    method CheckBrowseMode;
    method Close;
    method CreateBlobStream(Field: TField; Mode: TBlobStreamMode): TStream; virtual;
    method Delete;
    method DisableControls;
    method Edit;
    method EnableControls;
    method FieldByName(const FieldName: WideString): TField;
    method FindField(const FieldName: WideString): TField;
    method First;
    method GetBookmark: TBookmark; virtual;
    method GotoBookmark(aBookmark: TBookmark);
    method Insert;
    method IsEmpty: Boolean;
    method Last;
    method Next;
    method Open;
    method Post; virtual;
    method Refresh;
    method Resync(Mode: TResyncMode); virtual;
    method UpdateCursorPos;
    method UpdateRecord;
    property Bof: Boolean read FBOF;
    property Bookmark: TBookmarkStr read GetBookmarkStr write SetBookmarkStr;
    property Eof: Boolean read FEOF;     property FieldCount: Integer read GetFieldCount;
    property Fields: TFields read FFields;
    property Modified: Boolean read FModified;
    property RecordCount: Integer read GetRecordCount;
    property State: TDataSetState read FState;
    property Filter: WideString read FFilterText write SetFilterText;
    property Filtered: Boolean read FFiltered write SetFiltered;
    property Active: Boolean read GetActive write SetActive ;
    property BeforeOpen: TDataSetNotifyEvent read FBeforeOpen write FBeforeOpen;
    property AfterOpen: TDataSetNotifyEvent read FAfterOpen write FAfterOpen;
    property BeforeClose: TDataSetNotifyEvent read FBeforeClose write FBeforeClose;
    property AfterClose: TDataSetNotifyEvent read FAfterClose write FAfterClose;
    property BeforeInsert: TDataSetNotifyEvent read FBeforeInsert write FBeforeInsert;
    property AfterInsert: TDataSetNotifyEvent read FAfterInsert write FAfterInsert;
    property BeforeEdit: TDataSetNotifyEvent read FBeforeEdit write FBeforeEdit;
    property AfterEdit: TDataSetNotifyEvent read FAfterEdit write FAfterEdit;
    property BeforePost: TDataSetNotifyEvent read FBeforePost write FBeforePost;
    property AfterPost: TDataSetNotifyEvent read FAfterPost write FAfterPost;
    property BeforeCancel: TDataSetNotifyEvent read FBeforeCancel write FBeforeCancel;
    property AfterCancel: TDataSetNotifyEvent read FAfterCancel write FAfterCancel;
    property BeforeDelete: TDataSetNotifyEvent read FBeforeDelete write FBeforeDelete;
    property AfterDelete: TDataSetNotifyEvent read FAfterDelete write FAfterDelete;
    property BeforeScroll: TDataSetNotifyEvent read FBeforeScroll write FBeforeScroll;
    property AfterScroll: TDataSetNotifyEvent read FAfterScroll write FAfterScroll;
    property BeforeRefresh: TDataSetNotifyEvent read FBeforeRefresh write FBeforeRefresh;
    property AfterRefresh: TDataSetNotifyEvent read FAfterRefresh write FAfterRefresh;
    property OnCalcFields: TDataSetNotifyEvent read FOnCalcFields write FOnCalcFields;
    property OnDeleteError: TDataSetErrorEvent read FOnDeleteError write FOnDeleteError;
    property OnEditError: TDataSetErrorEvent read FOnEditError write FOnEditError;
    property OnFilterRecord: TFilterRecordEvent read FOnFilterRecord write FOnFilterRecord;
    property OnNewRecord: TDataSetNotifyEvent read FOnNewRecord write FOnNewRecord;
    property OnPostError: TDataSetErrorEvent read FOnPostError write FOnPostError;
    end;
const
  dsEditModes: TDataSetStates = [TDataSetState.dsEdit, TDataSetState.dsInsert, TDataSetState.dsSetKey]; 

  FieldTypeNames: array[TFieldType] of WideString = [
    'Unknown', 'String', 'SmallInt', 'Integer', 'Word', 'Boolean', 'Float',
    'Currency', 'BCD', 'Date', 'Time', 'DateTime', 'Bytes', 'VarBytes',
    'AutoInc', 'Blob', 'Memo', 'Graphic', 'FmtMemo', 'ParadoxOle',
    'dBaseOle', 'TypedBinary', 'Cursor', 'FixedChar', 'WideString',
    'LargeInt', 'ADT', 'Array', 'Reference', 'DataSet', 'HugeBlob', 'HugeClob',
    'Variant', 'Interface', 'Dispatch', 'Guid', 'SQLTimeStamp', 'FMTBcdField'];

method DatabaseError(const Message: WideString; Component: TComponent := nil);public;
implementation

method DatabaseError(const Message: WideString; Component: TComponent := nil);
begin
//  if assigned(Component) and (Component.Name <> '') then
//    raise EDatabaseError.Create(Format('%s: %s', [Component.Name, Message])) else
    raise EDatabaseError.Create(Message);
end;


method TFields.Clear;
begin
  FList.Clear;
end;

procedure TFields.Changed;
begin
  if FOnChange <> nil then FOnChange(self);
end;

procedure TFields.SetFieldIndex(Field: TField; Value: Integer);
var
  CurIndex, lCount: Integer;
begin
  CurIndex := FList.IndexOf(Field);
  if CurIndex >= 0 then
  begin
    lCount := FList.Count;
    if Value < 0 then Value := 0;
    if Value >= lCount then Value := Count - 1;
    if Value <> CurIndex then
    begin
      FList.RemoveAt(CurIndex);
      FList.Insert(Value, Field);
//      Field.PropertyChanged(True);
      Changed;
    end;
  end;
end;

constructor TFields.Create(ADataSet: TDataSet);
begin
  FList := new System.Collections.Generic.List<TField>;;
  FDataSet := ADataSet;
end;

procedure TFields.Add(Field: TField);
begin
  FList.Add(Field);
  Field.FFields := Self;
  Changed;
end;

function TFields.FindField(const FieldName: String): TField;
var
  I: Integer;
begin
  for I := 0 to FList.Count - 1 do
  begin
    Result := FList[I];
    if AnsiCompareText(Result.FieldName, FieldName) = 0 then Exit;
  end;
  Result := nil;
end;

function TFields.FieldByName(const FieldName: String): TField;
begin
  Result := FindField(FieldName);
  if Result = nil then DatabaseError('Field not found: '+FieldName);
end;

procedure TFields.GetFieldNames(List: TStrings);
begin
  for i: Integer := 0 to FList.Count -1 do
    List.Add(FList[i].FieldName);
end;

function TFields.IndexOf(Field: TField): Integer;
begin
  result := FList.IndexOf(Field);
end;

procedure TFields.Remove(Field: TField);
begin
  FList.Remove(Field);
end;

method TField.Clear;
begin
  FFields.Clear;
end;

method TField.GetAsBoolean: Boolean;
begin
  Result := Convert.ToBoolean(FDataSet.IntGetFieldValue(Index));
end;

method TField.GetAsDateTime: TDateTime;
begin
  Result := Convert.ToDateTime(FDataSet.IntGetFieldValue(Index));
end;

method TField.GetAsInteger: LongInt;
begin
  Result := Convert.ToInt32(FDataSet.IntGetFieldValue(Index));
end;

method TField.GetAsString: WideString;
begin
  Result := Convert.ToString(FDataSet.IntGetFieldValue(Index));
end;

method TField.GetAsVariant: Variant;
begin
  result := FDataSet.IntSetFieldValue(Index);
end;

method TField.GetDisplayLabel: WideString;
begin
end;

method TField.GetDisplayWidth: Integer;
begin
end;

method TField.GetIndex: Integer;
begin
end;

method TField.GetIsNull: Boolean;
begin
end;

method TField.GetNewValue: Variant;
begin
end;

method TField.GetOldValue: Variant;
begin
end;

method TField.IsDisplayLabelStored: Boolean;
begin
end;

method TField.IsDisplayWidthStored: Boolean;
begin
end;

method TField.SetAsBoolean(aValue: Boolean);
begin
end;

method TField.SetAsDateTime(aValue: TDateTime);
begin
end;

method TField.SetAsInteger(aValue: LongInt);
begin
end;

method TField.SetAsString(const aValue: WideString);
begin
end;

method TField.SetAsVariant(const aValue: Variant);
begin
end;

method TField.SetDataSet(ADataSet: TDataSet);
begin
end;

method TField.SetDisplayLabel(aValue: WideString);
begin
end;

method TField.SetDisplayWidth(aValue: Integer);
begin
end;

method TField.SetEditMask(const aValue: TEditMask);
begin
end;

method TField.SetFieldKind(aValue: TFieldKind);
begin
end;

method TField.SetFieldName(const aValue: WideString);
begin
end;

method TField.SetIndex(aValue: Integer);
begin
end;

method TField.SetNewValue(const aValue: Variant);
begin
end;

method TField.SetSize(aValue: Integer);
begin
end;

method TField.GetSize: Integer;
begin
end;

method TField.SetVisible(aValue: Boolean);
begin
end;

constructor TField.Create(AOwner: TComponent);
begin

end;

constructor TStringField.Create(AOwner: TComponent);
begin
end;

constructor TIntegerField.Create(AOwner: TComponent);
begin
end;

method TBlobField.LoadFromStream(Stream: TStream);
begin
end;

method TBlobField.SaveToStream(Stream: TStream);
begin
end;


method TDataSet.SetState(Value: TDataSetState);
begin
end;

method TDataSet.Open;
begin
end;

method TDataSet.Close;
begin
end;

method TDataSet.CheckBiDirectional;
begin
end;

method TDataSet.CheckActive;
begin
end;

method TDataSet.GetActive: Boolean;
begin
end;

method TDataSet.SetActive(Value: Boolean);
begin
end;

method TDataSet.FreeFieldBuffers;
begin
end;

method TDataSet.GetFieldCount: Integer;
begin
end;

method TDataSet.FieldByName(const FieldName: WideString): TField;
begin
end;

method TDataSet.FindField(const FieldName: WideString): TField;
begin
end;

method TDataSet.CreateBlobStream(Field: TField; Mode: TBlobStreamMode): TStream;
begin
end;

method TDataSet.DataEvent(&Event: TDataEvent; Info: LongInt);

  begin
end;

method TDataSet.DisableControls;
begin
end;

method TDataSet.EnableControls;
begin
end;

method TDataSet.UpdateRecord;
begin
end;

method TDataSet.GetPriorRecord: Boolean;
begin
end;

method TDataSet.Resync(Mode: TResyncMode);
begin
end;

method TDataSet.MoveBuffer(CurIndex, NewIndex: Integer);
begin
end;

method TDataSet.ClearBuffers;
begin
end;

method TDataSet.UpdateCursorPos;
begin
end;

method TDataSet.GetPriorRecords: Integer;
begin
end;

method TDataSet.IsEmpty: Boolean;
begin
end;

method TDataSet.First;
begin
end;

method TDataSet.InternalLast;
begin
end;

method TDataSet.Last;
begin
end;

method TDataSet.Next;
begin
end;

method TDataSet.Refresh;
begin
end;

method TDataSet.Edit;
begin
end;

method TDataSet.Insert;
begin
end;

method TDataSet.Append;
begin
end;

method TDataSet.Post;
begin
end;

method TDataSet.Cancel;

  begin
end;

method TDataSet.Delete;
begin
end;

method TDataSet.BeginInsertAppend;
begin
end;

method TDataSet.EndInsertAppend;
begin
end;

method TDataSet.CheckOperation(Operation: TDataOperation;
  ErrorEvent: TDataSetErrorEvent);
begin
end;

method TDataSet.InternalDelete;
begin
end;

method TDataSet.InternalPost;
begin
end;

method TDataSet.InternalInsert;
begin
end;

method TDataSet.InternalRefresh;
begin
end;

method TDataSet.BookmarkAvailable: Boolean;
begin
end;

method TDataSet.GetBookmark: TBookmark;
begin
end;

method TDataSet.GetBookmarkStr: TBookmarkStr;
begin
end;

method TDataSet.SetBookmarkStr(const Value: TBookmarkStr);
begin
end;

method TDataSet.GotoBookmark(aBookmark: TBookmark);
begin
end;

method TDataSet.SetFiltered(Value: Boolean);
begin
end;

method TDataSet.SetFilterText(const Value: WideString);
begin
end;

method TDataSet.CheckBrowseMode;
begin
end;

method TDataSet.GetRecordCount: LongInt;
begin
end;

method TDataSet.DoAfterDelete;
begin
end;

method TDataSet.DoAfterPost;
begin
end;

method TDataSet.DoAfterRefresh;
begin
end;

method TDataSet.DoAfterScroll;
begin
end;

method TDataSet.DoBeforeDelete;
begin
end;

method TDataSet.DoBeforePost;
begin
end;

method TDataSet.DoBeforeRefresh;
begin
end;

method TDataSet.DoBeforeScroll;
begin
end;

procedure TDataSet.DoAfterCancel;
begin

end;

procedure TDataSet.DoAfterClose;
begin
end;

procedure TDataSet.DoAfterEdit;
begin
end;

procedure TDataSet.DoAfterInsert;
begin
end;

procedure TDataSet.DoAfterOpen;
begin
end;

procedure TDataSet.DoBeforeCancel;
begin
end;

procedure TDataSet.DoBeforeClose;
begin
end;

procedure TDataSet.DoBeforeEdit;
begin
end;

procedure TDataSet.DoBeforeInsert;
begin
end;

procedure TDataSet.DoBeforeOpen;
begin
end;

constructor TDataSet.Create;
begin
  FFields := TFields.Create(self);
end;

end.
