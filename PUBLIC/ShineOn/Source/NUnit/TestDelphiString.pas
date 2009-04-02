namespace NUnit.ShineOn.RTL;

interface
uses
  System.Net.Mail,
  Nunit.Framework,
  ShineOn.RTL;

type
  [TestFixture]
  DelphiStringTests = public class(TestCase)
  public
    [Test]
    method TestPos;
    [Test]
    method TestInsert;
    [Test]
    method TestCopy;
    [Test]
    method TestDelete;
    [Test]
    method TestConversion;
    [Test]
    method TestComparison;
  end;
  
implementation

method DelphiStringTests.TestPos;
begin
  var s: DelphiString := 'Test This';
  NUnit.Framework.Assert.AreEqual(6, Pos(DelphiString('This'), s), 'Pos is broken');
  NUnit.Framework.Assert.AreEqual(0, Pos(DelphiString('That'), s), 'Pos is broken');
  NUnit.Framework.Assert.AreEqual(0, Pos(DelphiString('that'), s), 'Pos is broken');
  NUnit.Framework.Assert.AreEqual(1, Pos(DelphiString('Test'), s), 'Pos is broken');
end;

method DelphiStringTests.TestInsert;
begin
  var lOrg: DelphiString := 'My String';
  var lNew := lOrg;
  Insert('Own ', lNew, 4);
  NUnit.Framework.Assert.AreEqual('My Own String', lNew.ToString, 'Insert');
  lNew := lOrg;
  Insert('Really ', lNew, 1);
  NUnit.Framework.Assert.AreEqual('Really My String', lNew.ToString, 'Insert');
  lNew := lOrg;
  Insert(DelphiString('y'), lNew, 10);
  NUnit.Framework.Assert.AreEqual('My Stringy', lNew.ToString, 'Insert');
end;

method DelphiStringTests.TestCopy;
begin
  var lOrg:DelphiString := 'Hello World';
  NUnit.Framework.Assert.AreEqual(Copy(lOrg, 1, 4).ToString, 'Hell', 'Copy'); 
  NUnit.Framework.Assert.AreEqual(Copy(lOrg, 2, 4).ToString , 'ello', 'Copy'); 
  NUnit.Framework.Assert.AreEqual(Copy(lOrg, 7, 3).ToString , 'Wor', 'Copy'); 
  NUnit.Framework.Assert.AreEqual(Copy(lOrg, 7, Int32.MaxValue).ToString, 'World', 'Copy'); 
end;

method DelphiStringTests.TestDelete;
begin
  var lOrg: DelphiString := 'My String';
  var lNew := lOrg;
  Delete(lNew, 1, 3);
  NUnit.Framework.Assert.AreEqual(lNew.ToString, 'String', 'Delete'); 
  lNew := lOrg;
  Delete(lNew, 2, 5);
  NUnit.Framework.Assert.AreEqual(lNew.ToString, 'Ming', 'Delete'); 
  lNew := lOrg;
  Delete(lNew, 4, MaxInt);
  NUnit.Framework.Assert.AreEqual(lNew.ToString, 'My ', 'Delete'); 
end;

method DelphiStringTests.TestConversion;
begin
  var lStr := DelphiString('AAAA');
  var l := lStr.ToBytes;
  NUnit.Framework.Assert.AreEqual(l.Length, 4, 'Conversion'); 
  NUnit.Framework.Assert.AreEqual(Byte(ord('A')), l[0], 'Conversion'); 
  NUnit.Framework.Assert.AreEqual(Byte(ord('A')), l[1], 'Conversion'); 
  NUnit.Framework.Assert.AreEqual(Byte(ord('A')), l[2], 'Conversion'); 
  NUnit.Framework.Assert.AreEqual(Byte(ord('A')), l[3], 'Conversion'); 
  lStr := lStr + 'B';
  NUnit.Framework.Assert.AreEqual('AAAAB', lStr.ToString, 'Concat');
  lStr := 'B' + lStr;
  NUnit.Framework.Assert.AreEqual('BAAAAB', lStr.ToString, 'Concat');
end;

method DelphiStringTests.TestComparison;
begin
  var lVal := DelphiString('AAAA');
  NUnit.Framework.Assert.IsTrue(lVal.ToString = 'AAAA', 'Equals');
  NUnit.Framework.Assert.IsTrue(lVal.ToString = DelphiString('AAAA'), 'Equals');

  NUnit.Framework.Assert.IsFalse(lVal.ToString <> DelphiString('AAAA'), 'Equals');
  NUnit.Framework.Assert.IsTrue(lVal.ToString < DelphiString('AAAB'), 'Equals');
  NUnit.Framework.Assert.IsTrue(lVal.ToString > DelphiString('AAA0'), 'Equals');
  NUnit.Framework.Assert.IsTrue(lVal.ToString <= DelphiString('AAAA'), 'Equals');
  NUnit.Framework.Assert.IsTrue(lVal.ToString >= DelphiString('AAAA'), 'Equals');
  NUnit.Framework.Assert.IsTrue(lVal.ToString >= DelphiString('AAA0'), 'Equals');
  NUnit.Framework.Assert.IsTrue(lVal.ToString <= DelphiString('AAAB'), 'Equals');
end;

end.