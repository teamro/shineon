namespace NUnit.ShineOn.RTL;

interface

uses
  NUnit.Framework,
  System,
  System.Threading,
  System.Globalization,
  ShineOn.RTL;

type
  [TestFixture]
  TestVariants = public class(System.Object)
  private
  protected
  public
    [Test]
    method TestVariantOperations;
    [Test]
    method TestVariantConversions;
    [Test]
    method TestVariantTypes;
    [Test]
    method TestArrayVariants;
  end;
  
implementation

method TestVariants.TestVariantOperations;
var
  a: Variant;
  b: Variant;
begin
  a := 15;
  b := 3;
  var n: Int64;
  n := Variant(a * b);
  NUnit.Framework.Assert.AreEqual(Int64(Variant(a * b)), (15 * 3), '');
  NUnit.Framework.Assert.AreEqual(n, (15 * 3), '');
  NUnit.Framework.Assert.AreEqual(Int64(Variant(a + b)), (15 + 3), '');
  NUnit.Framework.Assert.AreEqual(Int64(Variant(a - b)), (15 - 3), '');
end;

method TestVariants.TestVariantConversions;
begin
  var v: Variant := 15;
  var R: Double := V;
  NUnit.Framework.Assert.AreEqual(Double(V), R);
end;

method TestVariants.TestVariantTypes;
begin
  NUnit.Framework.Assert.AreEqual(VarType(15), varInteger);
  NUnit.Framework.Assert.AreEqual(VarType('carlo'), varOleStr);
  NUnit.Framework.Assert.AreEqual(VarType(15.2), varDouble);
  NUnit.Framework.Assert.AreEqual(VarType(Single(15)), varSingle);
  NUnit.Framework.Assert.AreEqual(VarType(DateTime.Now), varDate);
  NUnit.Framework.Assert.AreEqual(VarType(VarArrayOf([1,2,3])), varArray or varVariant);
end;

method TestVariants.TestArrayVariants;
begin
  var r: Variant := VarArrayOf([1,2,3,4,15]);
  var lColl: System.Collections.ICollection := R;
  NUnit.Framework.Assert.AreEqual(Length(lColl), 5);
  NUnit.Framework.Assert.AreEqual(r[1], 2);
  NUnit.Framework.Assert.AreEqual(r[4], 15);
end;

end.