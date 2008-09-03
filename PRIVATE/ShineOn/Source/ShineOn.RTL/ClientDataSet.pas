namespace ShineOn.Rtl;

interface

uses
  System.Collections,
  System.Collections.Generic,
  System.ComponentModel,
  System.Data,
  System.Text;

type
  EDatsetException = public class(Exception) end;
  TCDSState = public enum (dsBrowse=0, dsEdit=1, dsInactive=2, dsInsert=3);
  TCDSFields = public class
  private
    FDataSet: TCustomClientDataSet;
    FItems: List<TCDSField> := new List<TCDSField>;
  assembly
    method Invalidate;
  public 
    constructor Create(aDataset: TCustomClientDataSet);


    property Items[aIndex: Integer]: TCDSField read FItems[aIndex]; default;
    property Count: Integer read FItems.Count;
    method FieldByName(aFieldName: String): TCDSField;

    [Browsable(false)]
    property DataSet: TCustomClientDataSet read FDataSet;
  end;
  TCDSField = public class
  private
    FColumn: DataColumn;
    FDataset: TCustomClientDataSet;
    method get_Value: Object;
    method set_Value(aValue: Object);
  assembly
    method Row: DataRow;
    constructor (aDataset: TCustomClientDataSet;aColumn: DataColumn);
    property IntColumn: DataColumn read FColumn write FColumn;
  public 
   public method IsNull: Boolean;
    { Properties }
    [Browsable(false)]
    public property AsBoolean: Boolean read Convert.ToBoolean(Value) write Value;
    [Browsable(false)]
    public property AsInteger: Int32 read Convert.ToInt32(Value) write Value;
    [Browsable(false)]
    public property AsString: String read Convert.ToString(Value) write Value;
    [Browsable(false)]
    public property DataSet: TCustomClientDataSet read FDataset;
    [Browsable(false)]
    public property FieldName: String read FColumn.ColumnName write FColumn.ColumnName;
    [Browsable(false)]
    public property Value: Object read get_Value write set_Value;
    [Browsable(false)]
    property Column: DataColumn read FColumn;
  end;

  // 
  TCustomClientDataSet = public abstract class(Component, IBindingListView, IBindingList, IList, ITypedList)
  private
    method set_Filtered(value: Boolean);
    method set_Filter(value: String);
    class method ValueToString(aField: DataColumn; aValue: Object): String;
  assembly 
    FActiveDataView: DataView;
    FBOF: Boolean;
    FEOF: Boolean;
    FFilter: String;
    FFiltered: Boolean;
    fDataTable: DataTable;
    method ApplyFilter;
    method CalcRecNo;
    method CheckBOF;
    method CheckBrowseMode;
    method CheckEOF;
    method ColumnsCollectionChanged(Sender: Object; e: CollectionChangeEventArgs);
    method InsertAt(pos: Int32);
  assembly or protected 
    FState: TCDSState;
    FFields: TCDSFields;
    FLastInsertID: Int32;
    FRowsAffected: Int32;
    InternalRecNo: Int32;
    Row: DataRow;
    SavedRow: DataRow;
  protected
    method SetDataTable(value: System.Data.DataTable); virtual;
  public 
    constructor;
    constructor(aDataTable: DataTable);

    property DataTable: System.Data.DataTable read fDataTable write SetDataTable;
    
    method Append;
    method CloneCursor(Source: TCustomClientDataSet);
    
    property Bof: Boolean read FBOF;
    method Cancel; virtual;
    method Delete; virtual;
    method Edit; virtual;
    property Eof: Boolean read FEOF;
    method FieldByName(FieldName: String): TCDSField;
    property FieldCount: Int32 read FFields.Count;
    method First; virtual;
    method Insert; virtual;
    method Last; virtual;
    method Locate(KeyFields: String; params KeyValues: array of Object): Boolean; virtual;
    method Locate(KeyField: String; KeyValue: Object): Boolean; virtual;
    method Next; virtual;
    method Post; virtual;
    method Prior; virtual;
    method RecNo: Int32;
    method RecordCount: Int32;
    

    { Properties }
    [Browsable(false)]
    property Active: Boolean read write; abstract;
    [Browsable(false)]
    property ActiveDataView: DataView read FActiveDataView;
    [Browsable(false)]
    property DV: DataView read FActiveDataView; implements IBindingListView, ITypedList;
    [Browsable(false)]
    property Fields: TCDSFields read FFields;
    [Browsable(false)]
    property Filter: String read FFilter write set_Filter;
    [Browsable(false)]
    property Filtered: Boolean read FFiltered write set_Filtered;
    [Browsable(false)]
    property State: TCDSState read FState;
  end;

  TClientDataSet = public abstract class(TCustomClientDataSet)
  private
  public
  end;


implementation

method TCustomClientDataSet.SetDataTable(value: System.Data.DataTable);
begin
  if assigned(fDataTable) then begin
     fDataTable.Columns.CollectionChanged -= new CollectionChangeEventHandler(ColumnsCollectionChanged);
  end;

  fDataTable := value;
  if assigned(fDataTable) then begin
    fDataTable.Columns.CollectionChanged += new CollectionChangeEventHandler(ColumnsCollectionChanged);
    FActiveDataView := new DataView(fDataTable);
    ColumnsCollectionChanged(nil, nil);
  end else begin 
    FActiveDataView := new DataView();
  end;
end;

method TCustomClientDataSet.ApplyFilter;
begin
  if FFiltered then
    DV.RowFilter := Filter
  else
    DV.RowFilter := '';
  CalcRecNo;
  if InternalRecNo = -1 then First;
end;

method TCustomClientDataSet.CalcRecNo;
begin
  InternalRecNo := -1;
  if Row <> nil then begin 
    for i: Integer := 0 to DV.Count -1 do begin 
      if Object.ReferenceEquals(DV[i].Row, Row) then begin
        InternalRecNo := i;
        break;
      end;
    end;
  end;
  CheckEOF;
  CheckBOF;
end;

method TCustomClientDataSet.CheckBOF;
begin
  FBOF := InternalRecNo = -1;
end;

method TCustomClientDataSet.CheckBrowseMode;
begin
  if FState not in [TCDSState.dsBrowse, TCDSState.dsInactive] then 
    raise new EDatsetException('Dataset not in browse state');
end;

method TCustomClientDataSet.CheckEOF;
begin
  FEOF := (InternalRecNo = -1) or (DV.Count = InternalRecNo);
end;

method TCustomClientDataSet.ColumnsCollectionChanged(Sender: Object; e: CollectionChangeEventArgs);
begin
  FFields.Invalidate;
end;

method TCustomClientDataSet.InsertAt(pos: Int32);
begin
  CheckBrowseMode;
  SavedRow := Row;
  Row := fDataTable.NewRow;
  fDataTable.Rows.InsertAt(Row, pos);
  FState := TCDSState.dsInsert;
  CalcRecNo();
end;

constructor TCustomClientDataSet;
begin
  inherited constructor;
  FFilter := '';
  FFields := new TCDSFields(self);
  FState := TCDSState.dsInactive;
  FActiveDataView := nil; 
  FLastInsertID := -1;
  FRowsAffected := -1;
  FActiveDataView := new DataView();
end;

constructor TCustomClientDataSet(aDataTable: DataTable);
begin
  constructor;
  DataTable := aDataTable;
end;

method TCustomClientDataSet.Append;
begin
  InsertAt(RecordCount());
end;

method TCustomClientDataSet.Cancel;
begin
  if FState = TCDSState.dsInsert then begin
    Row := nil;
    Row := SavedRow;
  end else if FState = TCDSState.dsEdit then 
    Row.CancelEdit;
  
  FState := TCDSState.dsBrowse;
  CalcRecNo();
end;

method TCustomClientDataSet.Delete;
begin
  CheckBrowseMode();
  Row.Delete();
  FState := TCDSState.dsBrowse;
end;

method TCustomClientDataSet.Edit;
begin
  CheckBrowseMode;
  Row.BeginEdit;
  FState := TCDSState.dsEdit;
end;

method TCustomClientDataSet.FieldByName(FieldName: String): TCDSField;
begin
  result := FFields.FieldByName(FieldName);
end;

method TCustomClientDataSet.First;
begin
  if DV.Count > 0 then
    Row := DV[0].Row
  else if Row <> nil then 
    Row := nil;
  
  CalcRecNo();
end;

method TCustomClientDataSet.Insert;
begin
  InsertAt(RecNo() + 1);
end;

method TCustomClientDataSet.CloneCursor(Source: TCustomClientDataSet);
begin
  // Todo: This probably should do a lot more ?
  
  DV.Table := Source.fDataTable;
end;

method TCustomClientDataSet.Last;
begin
  if DV.Count > 0 then
    Row := DV[DV.Count - 1].Row
  else if Row <> nil then 
    Row := nil;
  
  CalcRecNo;
end;

class method TCustomClientDataSet.ValueToString(aField: DataColumn; aValue: Object): String;
begin
  case &Type.GetTypeCode(aField.DataType) of
    TypeCode.DBNull: Result := 'null';
    TypeCode.Boolean,
    TypeCode.Byte,
    TypeCode.Int16,
    TypeCode.Int32,
    TypeCode.Int64,
    TypeCode.UInt16,
    TypeCode.UInt32,
    TypeCode.UInt64,
    TypeCode.SByte: Result := aValue.ToString;
    TypeCode.Decimal: Result := Decimal(aValue).ToString(System.Globalization.NumberFormatInfo.InvariantInfo);
    TypeCode.Double: result := Double(aValue).ToString(System.Globalization.NumberFormatInfo.InvariantInfo);
    TypeCode.Single: Result := Single(aValue).ToString(System.Globalization.NumberFormatInfo.InvariantInfo);
  else
    result := #39+aValue.ToString.Replace(#39, #39#39)+#39;
  end; // case
end;

method TCustomClientDataSet.Locate(KeyFields: String; params KeyValues: array of Object): Boolean;
var
  lKeyFields: Array of String := KeyFields.Split(';');
  fsb: StringBuilder;
begin
  if lKeyFields.Length <> length(KeyValues) then raise new EDatsetException('KeyFields and KeyValues have a different number of elements');
  fsb := new StringBuilder;
  for i: Integer := 0 to lKeyFields.Length -1 do begin
    var lField := FieldByName(lKeyFields[i]);
    if lField = nil then raise new EDatsetException('Unknown field: '+lKeyFields[i]);
    if i <> 0 then fsb.Append(' AND ');
    fsb.Append('(');
    fsb.Append(lField);
    fsb.Append(' = ');
    fsb.Append(ValueToString(lField.Column, KeyValues[i]));
    fsb.Append(')');
  end;
  var lRows := fDataTable.Select(fsb.ToString);
  if length(lRows) > 0 then begin
     Row := lRows[0];
     CalcRecNo;
     result := true;
   end;
end;

method TCustomClientDataSet.Locate(KeyField: String; KeyValue: Object): Boolean;
begin
  var lField := FieldByName(KeyField);
  if lField = nil then raise new EDatsetException('Unknown field: '+KeyField);
  var lValue: String := ValueToString(lField.Column, KeyValue);
  var lRows := fDataTable.Select(KeyField + ' = '+lValue);
  if length(lRows) > 0 then begin
     Row := lRows[0];
     CalcRecNo;
     result := true;
   end;
end;

method TCustomClientDataSet.Next;
begin
  if (DV.Count - 1 <> InternalRecNo) and (InternalRecNo > -1) then begin 
    Row := DV[InternalRecNo + 1].Row;
    CalcRecNo;
  end else if (DV.Count - 1 = InternalRecNo) then begin
    InternalRecNo := -1;
    FEOF := true;
  end;
end;

method TCustomClientDataSet.Post;
begin
  Row.EndEdit();
  FState := TCDSState.dsBrowse;
end;

method TCustomClientDataSet.Prior;
begin
  if InternalRecNo > 0 then begin
    Row := DV[InternalRecNo - 1].Row;
    CalcRecNo();
  end 
  else begin
    InternalRecNo := -1;
    FBOF := true;
  end;
end;

method TCustomClientDataSet.RecNo: Int32;
begin
  result := InternalRecNo;
end;

method TCustomClientDataSet.RecordCount: Int32;
begin
  result := DV.Count;
end;

method TCustomClientDataSet.set_Filter(value: String);
begin
  if FFilter <> value then begin
    FFilter := value;
    if Filtered then ApplyFilter;
  end;
end;

method TCustomClientDataSet.set_Filtered(value: Boolean);
begin
  if FFiltered <> value then begin
    FFiltered := value;
    ApplyFilter();
  end;
end;

method TCDSField.Row: DataRow;
begin
  Result := FDataset.Row;
end;

constructor TCDSField(aDataset: TCustomClientDataSet;aColumn: DataColumn);
begin
  FDataset := aDataset;
  FColumn := aColumn;
end;

method TCDSField.IsNull: Boolean;
begin
  result := Row.IsNull(FColumn);
end;

method TCDSField.set_Value(aValue: Object);
begin
  Row[FColumn] := aValue;
end;

method TCDSField.get_Value: Object;
begin
  Result := Row[FColumn];
end;

method TCDSFields.Invalidate;
begin
  if FItems.Count = FDataSet.fDataTable.Columns.Count then begin
    for i: Integer := 0 to FItems.Count -1 do begin
      FItems[i].IntColumn := FDataSet.fDataTable.Columns[i];
    end;
  end;

  FItems.Clear;
  for i: Integer := 0 to FDataSet.fDataTable.Columns.Count -1 do begin
    FItems.Add(new TCDSField(FDataSet, FDataSet.fDataTable.Columns[i]));
  end;
end;

constructor TCDSFields.Create(aDataset: TCustomClientDataSet);
begin
  FDataSet := aDataset;
  Invalidate;
end;

method TCDSFields.FieldByName(aFieldName: String): TCDSField;
begin
  for i: Integer := 0 to FItems.Count -1 do begin
    if String.Compare(FItems[i].FieldName, aFieldName, StringComparison.InvariantCultureIgnoreCase) = 0 then exit FItems[i];
  end;
end;

end.