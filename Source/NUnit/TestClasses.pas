// The contents of this file are subject to the Mozilla Public License Version 1.1 (the "License"); 
// you may not use this file except in compliance with the License. You may obtain a copy of the 
// License at http://www.mozilla.org/MPL/ 
// 
// Software distributed under the License is distributed on an "AS IS" basis, WITHOUT WARRANTY OF 
// ANY KIND, either express or implied. See the License for the specificlanguage governing rights and 
// limitations under the License.

// $Id: TestClasses.pas 60 2006-03-17 14:24:58Z loonquawl $
namespace NUnit.ShineOn.RTL;

interface
uses
  System.IO,
  Nunit.Framework,
  ShineOn.RTL;
    
type
  [TestFixture]
  TObjectTests = public class(System.Object)
  public
    [Setup]
    method Setup;
    [TearDown]
    method TearDown;
    [Test, Ignore('Test not implemented')] 
    method ClassType;
    [Test, Ignore('Test not implemented')] 
    method ClassName;
    [Test, Ignore('Test not implemented')] 
    method ClassNameIs;
    [Test, Ignore('Test not implemented')] 
    method ClassParent;
    [Test, Ignore('Test not implemented')] 
    method ClassInfo;
  end;
 
  [TestFixture]
  TListTests = public class(System.Object)
  public
    [Setup]
    method Setup;
    [TearDown]
    method TearDown;

    [Test, Ignore('Test not implemented')] 
    method Add;
    [Test, Ignore('Test not implemented')] 
    method Clear;
    [Test, Ignore('Test not implemented')] 
    method Delete;
    [Test, Ignore('Test not implemented')] 
    method Exchange;
    [Test, Ignore('Test not implemented')] 
    method Expand;
    [Test, Ignore('Test not implemented')] 
    method Extract;
    [Test, Ignore('Test not implemented')] 
    method First;
    [Test, Ignore('Test not implemented')] 
    method GetEnumerator;
    [Test, Ignore('Test not implemented')] 
    method IndexOf;
    [Test, Ignore('Test not implemented')] 
    method Insert;
    [Test, Ignore('Test not implemented')] 
    method Last;
    [Test, Ignore('Test not implemented')] 
    method Move;
    [Test, Ignore('Test not implemented')] 
    method Remove;
    [Test, Ignore('Test not implemented')] 
    method Pack;
    [Test, Ignore('Test not implemented')] 
    method Sort;
    [Test, Ignore('Test not implemented')] 
    method Assign1;
    [Test, Ignore('Test not implemented')] 
    method Assign2;
    [Test, Ignore('Test not implemented')] 
    method Assign3;
    [Test, Ignore('Test not implemented')] 
    method Capacity;
    [Test, Ignore('Test not implemented')] 
    method Count;
    [Test, Ignore('Test not implemented')] 
    method Items;
  end;

  [TestFixture]
  TInterfaceListTests = public class(System.Object)
  public
    [Setup]
    method Setup;
    [TearDown]
    method TearDown;
    [Test, Ignore('Test not implemented')] 
    method Clear;
    [Test, Ignore('Test not implemented')] 
    method Delete;
    [Test, Ignore('Test not implemented')] 
    method Exchange;
    [Test, Ignore('Test not implemented')] 
    method Expand;
    [Test, Ignore('Test not implemented')] 
    method First;
    [Test, Ignore('Test not implemented')] 
    method IndexOf;
    [Test, Ignore('Test not implemented')] 
    method Add;
    [Test, Ignore('Test not implemented')] 
    method Insert;
    [Test, Ignore('Test not implemented')] 
    method Last;
    [Test, Ignore('Test not implemented')] 
    method Remove;
    [Test, Ignore('Test not implemented')] 
    method Lock;
    [Test, Ignore('Test not implemented')] 
    method Unlock;
    [Test, Ignore('Test not implemented')] 
    method Capacity;
    [Test, Ignore('Test not implemented')] 
    method Count;
    [Test, Ignore('Test not implemented')] 
    method Items;
  end;
  
  [TestFixture]
  TBitsTests = public class(System.Object)
  public
    [Setup]
    method Setup;
    [TearDown]
    method TearDown;

    [Test, Ignore('Test not implemented')] 
    method OpenBit;
    [Test, Ignore('Test not implemented')] 
    method Bits;
    [Test, Ignore('Test not implemented')] 
    method Size;
  end;
  
  [TestFixture]
  TPersistentTests = public class(System.Object)
  public
    [Setup]
    method Setup;
    [TearDown]
    method TearDown;

    [Test, Ignore('Test not implemented')] 
    method Assign;
    [Test, Ignore('Test not implemented')] 
    method GetNamePath;
  end;

  [TestFixture]
  TStringlistTests = public class(System.Object)
  public
    [Setup]
    method Setup;
    [TearDown]
    method TearDown;

    [Test, Ignore('Test not implemented')] 
    method Add;
    [Test, Ignore('Test not implemented')] 
    method AddObject;
    [Test, Ignore('Test not implemented')] 
    method Append;
    [Test, Ignore('Test not implemented')] 
    method AddStrings;
    [Test, Ignore('Test not implemented')] 
    method Assign;
    [Test, Ignore('Test not implemented')] 
    method BeginUpdate;
    [Test, Ignore('Test not implemented')] 
    method Clear;
    [Test, Ignore('Test not implemented')] 
    method Delete;
    [Test, Ignore('Test not implemented')] 
    method EndUpdate;
    [Test, Ignore('Test not implemented')] 
    method Equals;
    [Test, Ignore('Test not implemented')] 
    method Exchange;
    [Test]
    method Find;
    [Test, Ignore('Test not implemented')] 
    method GetText;
    [Test, Ignore('Test not implemented')] 
    method IndexOf;
    [Test, Ignore('Test not implemented')] 
    method IndexOfName;
    [Test, Ignore('Test not implemented')] 
    method IndexOfObject;
    [Test, Ignore('Test not implemented')] 
    method Insert;
    [Test, Ignore('Test not implemented')] 
    method InsertObject;
    [Test, Ignore('Test not implemented')] 
    method LoadFromFile;
    [Test, Ignore('Test not implemented')] 
    method LoadFromStream;
    [Test, Ignore('Test not implemented')] 
    method Move;
    [Test, Ignore('Test not implemented')] 
    method SaveToFile;
    [Test, Ignore('Test not implemented')] 
    method SaveToStream;
    [Test, Ignore('Test not implemented')] 
    method SetText;
    [Test, Ignore('Test not implemented')] 
    method Capacity;
    [Test, Ignore('Test not implemented')] 
    method CommaText;
    [Test, Ignore('Test not implemented')] 
    method Count;
    [Test, Ignore('Test not implemented')] 
    method Delimiter;
    [Test, Ignore('Test not implemented')] 
    method DelimitedText;
    [Test, Ignore('Test not implemented')] 
    method Names;
    [Test, Ignore('Test not implemented')] 
    method Objects;
    [Test, Ignore('Test not implemented')] 
    method QuoteChar;
    [Test, Ignore('Test not implemented')] 
    method Values;
    [Test, Ignore('Test not implemented')] 
    method Strings;
    [Test, Ignore('Test not implemented')] 
    method Text;

    [Test] 
    method Sort;
    [Test, Ignore('Test not implemented')] 
    method CustomSort;
    [Test, Ignore('Test not implemented')] 
    method Duplicates;
    [Test, Ignore('Test not implemented')] 
    method Sorted;
    [Test, Ignore('Test not implemented')] 
    method CaseSensitive;
  end;

  [TestFixture]
  THandleStreamTests = public class(System.Object)
  public
    [Setup]
    method Setup;
    [TearDown]
    method TearDown;

    [Test, Ignore('Test not implemented')] 
    method Read;
    [Test, Ignore('Test not implemented')] 
    method Write;
    [Test, Ignore('Test not implemented')] 
    method SeekSeekOrigin;
    [Test, Ignore('Test not implemented')] 
    method SeekInteger;
    [Test, Ignore('Test not implemented')] 
    method CopyFrom;
    [Test, Ignore('Test not implemented')] 
    method Position;
    [Test, Ignore('Test not implemented')] 
    method Size;
  end;

  [TestFixture]
  TFileStreamTests = public class(System.Object)
  private
    const fmCreate = $FFFF; // Classes
    const fmOpenRead = $0000; // SysUtils
    const fmOpenWrite = $0001; // SysUtils
    const fmOpenReadWrite = $0002; // SysUtils    
    var Mode : System.IO.FileMode;

    var FFilename : String;
    var tmpFile : TFileStream;
  public
    [Setup]
    method Setup;
    [TearDown]
    method TearDown;

    [Test, Ignore('Test not implemented')] 
    method Read;
    [Test, Ignore('Test not implemented')] 
    method Write;
    [Test, Ignore('Test not implemented')] 
    method SeekSeekOrigin;
    [Test, Ignore('Test not implemented')] 
    method SeekInteger;
    [Test, Ignore('Test not implemented')] 
    method CopyFrom;
    [Test, Ignore('Test not implemented')] 
    method Position;
    [Test, Ignore('Test not implemented')] 
    method Size;

  end;

  [TestFixture]
  TMemoryStreamTests = public class(System.Object)
  public
    [Setup]
    method Setup;
    [TearDown]
    method TearDown;

    [Test, Ignore('Test not implemented')] 
    method Read;
    [Test, Ignore('Test not implemented')] 
    method Write;
    [Test, Ignore('Test not implemented')] 
    method SeekSeekOrigin;
    [Test, Ignore('Test not implemented')] 
    method SeekInteger;
    [Test, Ignore('Test not implemented')] 
    method CopyFrom;
    [Test, Ignore('Test not implemented')] 
    method Position;
    [Test, Ignore('Test not implemented')] 
    method Size;

    [Test, Ignore('Test not implemented')] 
    method SaveToStream;
    [Test, Ignore('Test not implemented')] 
    method SaveToFile;
    [Test, Ignore('Test not implemented')] 
    method Clear;
    [Test, Ignore('Test not implemented')] 
    method LoadFromStream;
    [Test, Ignore('Test not implemented')] 
    method LoadFromFile;
  end;

  [TestFixture]
  TStringStreamTests = public class(System.Object)
  public
    [Setup]
    method Setup;
    [TearDown]
    method TearDown;

    [Test, Ignore('Test not implemented')] 
    method Read;
    [Test, Ignore('Test not implemented')] 
    method Write;
    [Test, Ignore('Test not implemented')] 
    method SeekSeekOrigin;
    [Test, Ignore('Test not implemented')] 
    method SeekInteger;
    [Test, Ignore('Test not implemented')] 
    method CopyFrom;
    [Test, Ignore('Test not implemented')] 
    method Position;
    [Test, Ignore('Test not implemented')] 
    method Size;

    [Test, Ignore('Test not implemented')] 
    method ReadString;
    [Test, Ignore('Test not implemented')] 
    method WriteString;
  end;
  
  [TestFixture]
  TResourceStreamTests = public class(System.Object)
  public
    [Setup]
    method Setup;
    [TearDown]
    method TearDown;

    [Test, Ignore('Test not implemented')] 
    method Read;
    [Test, Ignore('Test not implemented')] 
    method Write;
    [Test, Ignore('Test not implemented')] 
    method SeekSeekOrigin;
    [Test, Ignore('Test not implemented')] 
    method SeekInteger;
    [Test, Ignore('Test not implemented')] 
    method CopyFrom;
    [Test, Ignore('Test not implemented')] 
    method Position;
    [Test, Ignore('Test not implemented')] 
    method Size;
  end;

  [TestFixture]
  TThreadTests = public class(System.Object)
  public
    [Setup]
    method Setup;
    [TearDown]
    method TearDown;

    [Test, Ignore('Test not implemented')] 
    method Resume;
    [Test, Ignore('Test not implemented')] 
    method Suspend;
    [Test, Ignore('Test not implemented')] 
    method Terminate;
    [Test, Ignore('Test not implemented')] 
    method WaitFor;

    [Test, Ignore('Test not implemented')] 
    method FatalException;
    [Test, Ignore('Test not implemented')] 
    method FreeOnTerminate;
    [Test, Ignore('Test not implemented')] 
    method Handle;
    [Test, Ignore('Test not implemented')] 
    method Priority;
    [Test, Ignore('Test not implemented')] 
    method Suspended;
    [Test, Ignore('Test not implemented')] 
    method ThreadID;
  end;
  
implementation


method TObjectTests.Setup; 
begin
end;

method TObjectTests.TearDown; 
begin
end;

method TObjectTests.ClassType; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TObjectTests.ClassName; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TObjectTests.ClassNameIs; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TObjectTests.ClassParent; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TObjectTests.ClassInfo; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TListTests.Setup; 
begin
end;

method TListTests.TearDown; 
begin
end;

method TListTests.Add; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TListTests.Clear; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TListTests.Delete; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TListTests.Exchange; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TListTests.Expand; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TListTests.Extract; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TListTests.First; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TListTests.GetEnumerator; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TListTests.IndexOf; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TListTests.Insert; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TListTests.Last; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TListTests.Move; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TListTests.Remove; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TListTests.Pack; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TListTests.Sort; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TListTests.Assign1; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TListTests.Assign2; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TListTests.Assign3; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TListTests.Capacity; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TListTests.Count; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TListTests.Items; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TInterfaceListTests.Setup; 
begin
end;

method TInterfaceListTests.TearDown; 
begin
end;

method TInterfaceListTests.Clear; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TInterfaceListTests.Delete; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TInterfaceListTests.Exchange; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TInterfaceListTests.Expand; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TInterfaceListTests.First; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TInterfaceListTests.IndexOf; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TInterfaceListTests.Add; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TInterfaceListTests.Insert; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TInterfaceListTests.Last; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TInterfaceListTests.Remove; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TInterfaceListTests.Lock; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TInterfaceListTests.Unlock; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TInterfaceListTests.Capacity; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TInterfaceListTests.Count; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TInterfaceListTests.Items; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TBitsTests.Setup; 
begin
end;

method TBitsTests.TearDown; 
begin
end;

method TBitsTests.OpenBit; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TBitsTests.Bits; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TBitsTests.Size; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TPersistentTests.Setup; 
begin
end;

method TPersistentTests.TearDown; 
begin
end;

method TPersistentTests.Assign; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TPersistentTests.GetNamePath; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TStringlistTests.Setup; 
begin
end;

method TStringlistTests.TearDown; 
begin
end;

method TStringlistTests.Add; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TStringlistTests.AddObject; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TStringlistTests.Append; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TStringlistTests.AddStrings; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TStringlistTests.Assign; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TStringlistTests.BeginUpdate; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TStringlistTests.Clear; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TStringlistTests.Delete; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TStringlistTests.EndUpdate; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TStringlistTests.Equals; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TStringlistTests.Exchange; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TStringlistTests.GetText; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TStringlistTests.IndexOf; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TStringlistTests.IndexOfName; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TStringlistTests.IndexOfObject; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TStringlistTests.Insert; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TStringlistTests.InsertObject; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TStringlistTests.LoadFromFile; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TStringlistTests.LoadFromStream; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TStringlistTests.Move; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TStringlistTests.SaveToFile; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TStringlistTests.SaveToStream; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TStringlistTests.SetText; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TStringlistTests.Capacity; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TStringlistTests.CommaText; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TStringlistTests.Count; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TStringlistTests.Delimiter; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TStringlistTests.DelimitedText; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TStringlistTests.Names; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TStringlistTests.Objects; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TStringlistTests.QuoteChar; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TStringlistTests.Values; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TStringlistTests.Strings; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TStringlistTests.Text; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TStringlistTests.Sort; 
const
  cFirstItem = 'First';
  cSecondItem = 'Second';
var
  pList: TStringList;
begin
  pList := new TStringList();
  pList.Add(cSecondItem);
  pList.Add(cFirstItem);
  pList.Sorted := true;
  NUnit.Framework.Assert.IsTrue(String.Equals(pList[0], cFirstItem));
end;

method TStringlistTests.CustomSort; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TStringlistTests.Duplicates; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TStringlistTests.Sorted; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TStringlistTests.CaseSensitive; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TStringlistTests.Find;
const
  cItem1 = '1';
  cItem2 = '2';
  cItem3 = '3';
var
  pList: TStringList;
begin
  pList := new TStringList();
  pList.Add(cItem2);
  pList.Add(cItem3);
  pList.Add(cItem1);
  NUnit.Framework.Assert.IsTrue(pList.IndexOf(cItem3) = 1);
  pList.Sorted := True;
  NUnit.Framework.Assert.IsTrue(pList.IndexOf(cItem3) = 2);
end;

method THandleStreamTests.Setup; 
begin
end;

method THandleStreamTests.TearDown; 
begin
end;

method THandleStreamTests.Read; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method THandleStreamTests.Write; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method THandleStreamTests.SeekSeekOrigin; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method THandleStreamTests.SeekInteger; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method THandleStreamTests.CopyFrom; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method THandleStreamTests.Position; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method THandleStreamTests.Size; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TFileStreamTests.Setup; 
begin
end;

method TFileStreamTests.TearDown; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TFileStreamTests.Read; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TFileStreamTests.Write; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TFileStreamTests.SeekSeekOrigin; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TFileStreamTests.SeekInteger; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TFileStreamTests.CopyFrom; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TFileStreamTests.Position; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TFileStreamTests.Size; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TMemoryStreamTests.Setup; 
begin
end;

method TMemoryStreamTests.TearDown; 
begin
end;

method TMemoryStreamTests.Read; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TMemoryStreamTests.Write; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TMemoryStreamTests.SeekSeekOrigin; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TMemoryStreamTests.SeekInteger; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TMemoryStreamTests.CopyFrom; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TMemoryStreamTests.Position; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TMemoryStreamTests.Size; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TMemoryStreamTests.SaveToStream; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TMemoryStreamTests.SaveToFile; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TMemoryStreamTests.Clear; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TMemoryStreamTests.LoadFromStream; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TMemoryStreamTests.LoadFromFile; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TStringStreamTests.Setup; 
begin
end;

method TStringStreamTests.TearDown; 
begin
end;

method TStringStreamTests.Read; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TStringStreamTests.Write; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TStringStreamTests.SeekSeekOrigin; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TStringStreamTests.SeekInteger; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TStringStreamTests.CopyFrom; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TStringStreamTests.Position; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TStringStreamTests.Size; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TStringStreamTests.ReadString; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TStringStreamTests.WriteString; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TResourceStreamTests.Setup; 
begin
end;

method TResourceStreamTests.TearDown; 
begin
end;

method TResourceStreamTests.Read; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TResourceStreamTests.Write; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TResourceStreamTests.SeekSeekOrigin; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TResourceStreamTests.SeekInteger; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TResourceStreamTests.CopyFrom; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TResourceStreamTests.Position; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TResourceStreamTests.Size; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TThreadTests.Setup; 
begin
end;

method TThreadTests.TearDown; 
begin
end;

method TThreadTests.Resume; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TThreadTests.Suspend; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TThreadTests.Terminate; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TThreadTests.WaitFor; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TThreadTests.FatalException; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TThreadTests.FreeOnTerminate; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TThreadTests.Handle; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TThreadTests.Priority; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TThreadTests.Suspended; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TThreadTests.ThreadID; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

end.
