namespace NUnit.ShineOn.RTL;

interface

uses
  NUnit.Framework,
  System.Collections.Generic,
  ShineOn.Rtl,
  System.Data,
  System.Text;

type
  [TestFixture]
  TestCDS = public class
  private
    fDt: DataTable;
    fCds: ShineOn.Rtl.TCustomClientDataSet;
  protected
  public
    [SetUp]
    method CreateCDS;

    [Test]
    method TestEOF;

    [Test]
    method TestInsertEdit;

    [Test]
    method TestData;
  end;

  TMyCustomClientDataset = class(TCustomClientDataSet)
  private
    method set_Active(value: System.Boolean);
  public
    property Active: System.Boolean read true write set_Active; override;
  end;
implementation

method TestCDS.CreateCDS;
begin
  fDt := new Dataset1.DataTable1DataTable();
  fCds := new TMyCustomClientDataset(fDt);
end;

method TestCDS.TestEOF;
begin
  fCds.CommandText := 'select * from table where condition=:a and test='':b'' and value=@c';
  NUnit.Framework.Assert.AreEqual(fCds.Params.Count, 2);
  NUnit.Framework.Assert.AreEqual(fCds.Params[0].Name, String('a'));
  NUnit.Framework.Assert.AreEqual(fCds.Params[1].Name, '@c');

  fDt.Rows.Clear;
  NUnit.Framework.Assert.AreEqual(fCds.Eof, true);
  NUnit.Framework.Assert.AreEqual(fCds.Fields.Count, 3);
  NUnit.Framework.Assert.AreEqual(fCds.Fields[0].FieldName, 'ID');
  NUnit.Framework.Assert.AreEqual(fCds.Fields[1].FieldName, 'Name');
  NUnit.Framework.Assert.AreEqual(fCds.Fields[2].FieldName, 'Description');
end;

method TestCDS.TestData;
begin
  fDt.Rows.Clear;
  fDt.Rows.Add([1, 'Test1', 'Description']);
  fDt.Rows.Add([2, 'Test2', 'Description']);
  fDt.Rows.Add([3, 'Test3', 'Description']);
  var lCount: Integer := 0;
  fCds.Last;
  fCds.Insert;
  fCds.FieldByName('Id').Value := 4;
  fCds.FieldByName('Name').Value := 'Test4';
  fCds.FieldByName('Description').Value := 'Description';
  fCds.Cancel;
  fCds.First;
  if not fCds.EOF then begin
    repeat
      NUnit.Framework.Assert.AreEqual(lCount +1, fCds.FieldByName('ID').AsInteger);
      NUnit.Framework.Assert.AreEqual('Test'+(lCount +1), fCds.FieldByName('Name').AsString);
      NUnit.Framework.Assert.AreEqual('Description', fCds.FieldByName('Description').AsString);
      fCds.Next;
      Inc(lCount);
    until fCds.EOF;
  end;
  NUnit.Framework.Assert.AreEqual(lCount, 3);
end;

method TestCDS.TestInsertEdit;
begin
  fDt.Rows.Clear;
  fDt.Rows.Add([1, 'Test0', 'Description']);
  fDt.Rows.Add([2, 'Test2', 'Description']);
  fDt.Rows.Add([3, 'Test3', 'Description']);
  var lCount: Integer := 0;
  fCds.Last;
  fCds.Insert;
  fCds.FieldByName('Id').Value := 4;
  fCds.FieldByName('Name').Value := 'Test4';
  fCds.FieldByName('Description').Value := 'Description';
  fCds.Post;
  fCds.First;
  fCds.Edit;
  fCds.FieldByName('Name').AsString := 'Test1';
  fCds.Post;
  fCds.Edit;
  fCds.FieldByName('Id').AsInteger := 15;
  fCds.Cancel;
  if not fCds.EOF then begin
    repeat
      NUnit.Framework.Assert.AreEqual(lCount +1, fCds.FieldByName('ID').AsInteger);
      NUnit.Framework.Assert.AreEqual('Test'+(lCount +1), fCds.FieldByName('Name').AsString);
      NUnit.Framework.Assert.AreEqual('Description', fCds.FieldByName('Description').AsString);
      fCds.Next;
      Inc(lCount);
    until fCds.EOF;
  end;
  NUnit.Framework.Assert.AreEqual(lCount, 4);
end;

method TMyCustomClientDataset.set_Active(value: System.Boolean);
begin
end;

end.