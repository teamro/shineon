namespace ShineOn.Rtl;

interface

uses
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

  TCustomConnection = public class(TComponent)
  private
    FLoginPrompt: Boolean;
    protected
    method GetConnected: Boolean; virtual;
    method SetConnected(Value: Boolean); virtual;
    public
    property Connected: Boolean read GetConnected write SetConnected;
    property LoginPrompt: Boolean read FLoginPrompt write FLoginPrompt;
    end;

  TNamedItem = public class(TCollectionItem)
  private
    protected
    public
    end;

  TDefCollection = public class(TCollection)
  private
    protected
    public
    method IndexOf(const AName: WideString): Integer;
    end;

  TFieldDefs = public class(TDefCollection)
  private
    protected
    public
    end;

  TIndexDef = public class(TNamedItem)
  private
    method GetFields: WideString;
    method SetFields(const Value: WideString);
    protected
    public
    public
    property Fields: WideString read GetFields write SetFields;
    end;

  TIndexDefs = public class(TDefCollection)
  private
    method GetIndexDef(Index: Integer): TIndexDef;
    method SetIndexDef(Index: Integer; Value: TIndexDef);
  public
    property Items[Index: Integer]: TIndexDef read GetIndexDef write SetIndexDef; default; reintroduce;
  end;

  TFieldKind = public (fkData, fkCalculated, fkLookup, fkInternalCalc, fkAggregate);

  TFields = public class(TObject)
  private
    protected
    method GetField(Index: Integer): TField;
    method SetField(Index: Integer; Value: TField);
    public
    method Clear;
    property Fields[Index: Integer]: TField read GetField write SetField; default;
  end;

  TEditMask = public String;

  TField = public class(TComponent)
  private
    FDataSet: TDataSet;
    FFieldName: WideString;
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
    method GetDataSize: Integer; virtual;
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
    method Clear; virtual;
    //method SetData(Buffer: Pointer; NativeFormat: Boolean := True);
    property AsBoolean: Boolean read GetAsBoolean write SetAsBoolean;
    property AsDateTime: TDateTime read GetAsDateTime write SetAsDateTime;
    property AsInteger: LongInt read GetAsInteger write SetAsInteger;
    property AsString: WideString read GetAsString write SetAsString;
    property DataSet: TDataSet read FDataSet write SetDataSet;
    property DataSize: Integer read GetDataSize;
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

  TParam = public class(TCollectionItem)
  private
    FName: WideString;
    protected
    method GetAsString: WideString;
    method SetAsString(const Value: WideString);
    public
    property AsString: WideString read GetAsString write SetAsString;
    public
    property Name: WideString read FName write FName;
    end;

  TParams = public class(TCollection)
  private
    method GetItem(Index: Integer): TParam;
    method SetItem(Index: Integer; Value: TParam);
  protected
    public
    property Items[Index: Integer]: TParam read GetItem write SetItem; default; reintroduce;
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

  TDataSet = public class(TComponent)
  private
    FFields: TFields;
    FFieldDefs: TFieldDefs;
    FBufferCount: Integer;
    FRecordCount: Integer;
    FActiveRecord: Integer;
    FBookmarkSize: Integer;
    FFilterText: WideString;
    FState: TDataSetState;
    FBOF: Boolean;
    FEOF: Boolean;
    FModified: Boolean;
    FFiltered: Boolean;
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
    method SetFieldDefs(Value: TFieldDefs);
    protected
    protected
    method BookmarkAvailable: Boolean;
    method CheckActive; virtual;
    method CheckBiDirectional;
    method ClearBuffers; virtual;
    method DataEvent(&Event: TDataEvent; Info: LongInt); virtual;
    method DoAfterDelete; virtual;
    method DoAfterPost; virtual;
    method DoAfterRefresh; virtual;
    method DoAfterScroll; virtual;
    method DoBeforeDelete; virtual;
    method DoBeforePost; virtual;
    method DoBeforeRefresh; virtual;
    method DoBeforeScroll; virtual;
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
  protected     
  public
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
    property FieldDefs: TFieldDefs read FFieldDefs write SetFieldDefs;
    property Fields: TFields read FFields;
    property Modified: Boolean read FModified;
    property RecordCount: Integer read GetRecordCount;
    property State: TDataSetState read FState;
    property Filter: WideString read FFilterText write SetFilterText;
    property Filtered: Boolean read FFiltered write SetFiltered;
    property Active: Boolean read GetActive write SetActive ;
    property AfterOpen: TDataSetNotifyEvent read FAfterOpen write FAfterOpen;
    property BeforePost: TDataSetNotifyEvent read FBeforePost write FBeforePost;
    property AfterCancel: TDataSetNotifyEvent read FAfterCancel write FAfterCancel;
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
end;

method TCustomConnection.SetConnected(Value: Boolean);
begin
end;

method TCustomConnection.GetConnected: Boolean;
begin
end;

method TDefCollection.IndexOf(const AName: WideString): Integer;
begin
end;

method TFields.Clear;
begin
end;

method TFields.GetField(Index: Integer): TField;
begin
end;

method TFields.SetField(Index: Integer; Value: TField);
begin
end;

method TField.Clear;
begin
end;

method TField.GetAsBoolean: Boolean;
begin
end;

method TField.GetAsDateTime: TDateTime;
begin
end;

method TField.GetAsInteger: LongInt;
begin
end;

method TField.GetAsString: WideString;
begin
end;

method TField.GetAsVariant: Variant;
begin
end;

method TField.GetDataSize: Integer;
begin
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

method TIndexDef.GetFields: WideString;
begin
end;

method TIndexDef.SetFields(const Value: WideString);
begin
end;

method TIndexDefs.GetIndexDef(Index: Integer): TIndexDef;
begin
end;

method TIndexDefs.SetIndexDef(Index: Integer; Value: TIndexDef);
begin
end;

method TParams.GetItem(Index: Integer): TParam;
begin
end;

method TParams.SetItem(Index: Integer; Value: TParam);
begin
end;

method TParam.SetAsString(const Value: WideString);
begin
end;

method TParam.GetAsString: WideString;
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

method TDataSet.SetFieldDefs(Value: TFieldDefs);
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

end.
