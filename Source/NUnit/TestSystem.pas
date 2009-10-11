// The contents of this file are subject to the Mozilla Public License Version 1.1 (the "License"); 
// you may not use this file except in compliance with the License. You may obtain a copy of the 
// License at http://www.mozilla.org/MPL/ 
// 
// Software distributed under the License is distributed on an "AS IS" basis, WITHOUT WARRANTY OF 
// ANY KIND, either express or implied. See the License for the specificlanguage governing rights and 
// limitations under the License.

// $Id: TestSystem.pas 81 2006-04-09 11:23:09Z msgclb $

// History:
//
// 2006-02-17   :   Jeroen Vandezande   : Fixed the StringOfChar Test method.
// 2006-02-17   :   Jeroen Vandezande   : Fixed SystemTests.TruncTDateTime.  
// 2006-03-21   :   Corwin Burgess         : Fixed SystemTests.TruncTDateTime. 
// 2006-03-09   :   Corwin Burgess         : Changed TDateTime to match change to record

namespace NUnit.ShineOn.RTL;

interface
uses
  System,
  Nunit.Framework,
  ShineOn.RTL;

type
  [TestFixture]
  SystemTests = public class(System.Object)
  public
    [Setup]
    method Setup;
    [TearDown]
    method TearDown;
    [Test]
    method Pos;
    [Test]
    method Concat;
    [Test]
    method Delete1;
    [Test]
    method Delete2;
    [Test]
    method Delete3;
    [Test]
    method Delete4;
    [Test]
    method Delete5;
    [Test]
    method Delete6;
    [Test]
    method Delete7;
    [Test]
    method Delete8;
    [Test]
    method Insert;
    [Test]
    method Copy;
    [Test, Ignore('Test not implemented')] 
    method Str;
    [Test]
    method Val;
    [Test]
    method OrdChar;
    [Test]
    method OrdBool;
    [Test]
    method IncTest;
    [Test]
    method IncAmountTest;
    [Test]
    method DecTest;
    [Test]
    method DecAmountTest;
    [Test]
    method Pred;
    [Test]
    method Succ;
    [Test]
    method RoundDouble;
    [ExpectedException(typeof(InvalidCastException))]    
    method RoundTDateTime;
    [Test]
    method TruncDouble;
    [Test]
    method TruncTDateTime;
    [Test]
    method IntDouble;
    [Test, Ignore('Test not implemented')] 
    method IntTDateTime;
    [Test]
    method FracDouble;
    [Test, Ignore('Test not implemented')] 
    method FracTDateTime;
    [Test]
    method Odd;
    [Test]
    method Sqrt;
    [Test]
    method SqrExtended;
    [Test]
    method SqrInteger;
    [Test]
    method AbsInteger;
    [Test]
    method AbsDouble;
    [Test]
    method AbsTDateTime;
    [Test]
    method Exp;
    [Test]
    method SetLength;
    [Test, Ignore('Test not implemented')] 
    method Write;
    [Test, Ignore('Test not implemented')] 
    method WriteLn;
    [Test, Ignore('Test not implemented')] 
    method Read;
    [Test, Ignore('Test not implemented')] 
    method ReadLn;
    [Test]
    method StringOfChar;
  end;

implementation

method SystemTests.Setup; 
begin
end;

method SystemTests.TearDown; 
begin
end;

method SystemTests.Pos; 
begin
  //               0         1         2
  //               012345678901234567890
  var S:String := 'This is a TestString';
  ShineOn.RTL.Pos(String(','), S);
  NUnit.Framework.Assert.AreEqual(ShineOn.RTL.Pos(String(','), S), -1);
  NUnit.Framework.Assert.AreEqual(ShineOn.RTL.Pos('This', S), 0);
  NUnit.Framework.Assert.AreEqual(ShineOn.RTL.Pos('his', S), 1);
  NUnit.Framework.Assert.AreEqual(ShineOn.RTL.Pos('is', S), 2);
  NUnit.Framework.Assert.AreEqual(ShineOn.RTL.Pos('s is', S), 3);
  NUnit.Framework.Assert.AreEqual(ShineOn.RTL.Pos(String(' '), S), 4);
  NUnit.Framework.Assert.AreEqual(ShineOn.RTL.Pos('is a', S), 5);
  NUnit.Framework.Assert.AreEqual(ShineOn.RTL.Pos('a Test', S), 8);
  NUnit.Framework.Assert.AreEqual(ShineOn.RTL.Pos('TestString', S), 10);
  NUnit.Framework.Assert.AreEqual(ShineOn.RTL.Pos('teststring', S), -1);
  NUnit.Framework.Assert.AreEqual(ShineOn.RTL.Pos(String(nil), String(nil)), -1);
end;

method SystemTests.Concat; 
begin
  NUnit.Framework.Assert.AreEqual(ShineOn.RTL.Concat('Test','String'), 'Test' + 'String');
end;

method SystemTests.Delete1; 
begin
  var S:string := 'TestString'; 
  ShineOn.RTL.Delete(S, 0, 0); // if Count <= 0 then nothing should happen
  NUnit.Framework.Assert.AreEqual(S, 'TestString');
end;

method SystemTests.Delete2; 
begin
  var S:string := 'TestString'; 
  ShineOn.RTL.Delete(S, S.Length, 0); // if Count <= 0 then nothing should happen
  NUnit.Framework.Assert.AreEqual(S, 'TestString');
end;

method SystemTests.Delete3; 
begin
  var S:string := 'TestString'; 
  ShineOn.RTL.Delete(S, 0, 1); 
  NUnit.Framework.Assert.AreEqual(S, 'estString');
end;


method SystemTests.Delete4; 
begin
  var S:string := 'TestString'; 
  ShineOn.RTL.Delete(S, S.Length - 1, 1);
  NUnit.Framework.Assert.AreEqual(S, 'TestStrin');
end;


method SystemTests.Delete5; 
begin
  var S:string := 'TestString'; 
  ShineOn.RTL.Delete(S, S.Length, 1); // if Index + Count >= S.Length then nothing should happen
  NUnit.Framework.Assert.AreEqual(S, 'TestString');
end;


method SystemTests.Delete6; 
begin
  var S:string := 'TestString'; 
  ShineOn.RTL.Delete(S, -1, -1); // if Index or Count are < 0 then nothing should happen
  NUnit.Framework.Assert.AreEqual(S, 'TestString');
end;

method SystemTests.Delete7; 
begin
  var S:string := 'TestString'; 
  ShineOn.RTL.Delete(S, 4, 3); 
  NUnit.Framework.Assert.AreEqual(S, 'Testing');
end;

method SystemTests.Delete8; 
begin
  var S:string := 'TestString'; 
  ShineOn.RTL.Delete(S, 4, 10000); 
  NUnit.Framework.Assert.AreEqual(S, 'Test');
end;

method SystemTests.Insert; 
begin
 var S:String := 'TestString';
 ShineOn.RTL.Insert(' ', S, 4);
 NUnit.Framework.Assert.AreEqual(S, 'Test String');

 ShineOn.RTL.Insert(' ', S, 0);
 NUnit.Framework.Assert.AreEqual(S, ' Test String');

 ShineOn.RTL.Insert(' ', S, S.Length);
 NUnit.Framework.Assert.AreEqual(S, ' Test String ');
end;

method SystemTests.Copy; 
begin
  NUnit.Framework.Assert.AreEqual('TestString',ShineOn.RTL.Copy('TestString', 0, MaxInt));
  NUnit.Framework.Assert.AreEqual('',ShineOn.RTL.Copy('TestString', 0, 0));
  NUnit.Framework.Assert.AreEqual('Test',ShineOn.RTL.Copy('TestString', 0, 4));
end;

method SystemTests.Str; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SystemTests.Val; 
var S:String;V:Double; C:integer;
begin
  S := '11.5';
  ShineOn.RTL.Val(S, V, C);
  NUnit.Framework.Assert.AreEqual(V, 11.5);
  NUnit.Framework.Assert.AreEqual(0, C);
  
  S := '11T5'; // Val should not adjust to locale settings (i.e decimal separator should always be '.')
  ShineOn.RTL.Val(S, V, C);
  NUnit.Framework.Assert.AreEqual(3, C);  // remember, "C" is 1-based (0 == success)!
end;

method SystemTests.OrdChar; 
begin
  NUnit.Framework.Assert.AreEqual(Ord('a'), Convert.ToInt32('a'));
  NUnit.Framework.Assert.AreEqual(Ord('A'), Convert.ToInt32('A'));
end;

method SystemTests.OrdBool; 
begin
  NUnit.Framework.Assert.AreEqual(Integer(Ord(false)), 0);
  NUnit.Framework.Assert.AreEqual(Integer(Ord(true)), 1);
end;

method SystemTests.IncTest; 
begin
  var i:integer := 1;
  Inc(i);
  NUnit.Framework.Assert.AreEqual(i, 2);
  i := 0;
  inc(i);
  NUnit.Framework.Assert.AreEqual(i, 1);
  i := -1;
  inc(i);
  NUnit.Framework.Assert.AreEqual(i, 0);
end;

method SystemTests.IncAmountTest; 
begin
  var i:integer := 1;
  inc(i, 1);
  NUnit.Framework.Assert.AreEqual(i, 2);
  i := -1;
  inc(i, 1);
  NUnit.Framework.Assert.AreEqual(i, 0);
  i := -1;
  inc(i, 0);
  NUnit.Framework.Assert.AreEqual(i, -1);
  i := -1;
  inc(i, -2);
  NUnit.Framework.Assert.AreEqual(i, -3);
end;

method SystemTests.DecTest; 
begin
  var i:integer := 2;
  dec(i);
  NUnit.Framework.Assert.AreEqual(i, 1);
  i := 0;
  dec(i);
  NUnit.Framework.Assert.AreEqual(i, -1);
  i := -1;
  dec(i);
  NUnit.Framework.Assert.AreEqual(i, -2);
end;

method SystemTests.DecAmountTest; 
begin
  var i:integer := 2;
  dec(i, 1);
  NUnit.Framework.Assert.AreEqual(i, 1);
  i := -1;
  dec(i, 1);
  NUnit.Framework.Assert.AreEqual(i, -2);

  i := -1;
  dec(i, 0);
  NUnit.Framework.Assert.AreEqual(i, -1);
  i := -1;
  dec(i, -2);
  NUnit.Framework.Assert.AreEqual(i, 1);
end;

method SystemTests.Pred; 
begin
  NUnit.Framework.Assert.AreEqual(ShineOn.RTL.Pred(2), 1);
  NUnit.Framework.Assert.AreEqual(ShineOn.RTL.Pred(-2), -3);
end;

method SystemTests.Succ; 
begin
  NUnit.Framework.Assert.AreEqual(ShineOn.RTL.Succ(1), 2);
  NUnit.Framework.Assert.AreEqual(ShineOn.RTL.Succ(-1), 0);
end;

method SystemTests.RoundDouble; 
begin
  NUnit.Framework.Assert.AreEqual(ShineOn.RTL.Round(1.4), 1);
  NUnit.Framework.Assert.AreEqual(ShineOn.RTL.Round(1.5), 2);
  NUnit.Framework.Assert.AreEqual(ShineOn.RTL.Round(1.6), 2);
  NUnit.Framework.Assert.AreEqual(ShineOn.RTL.Round(-1.4), -1);
  NUnit.Framework.Assert.AreEqual(ShineOn.RTL.Round(-1.5), -2);
  NUnit.Framework.Assert.AreEqual(ShineOn.RTL.Round(-1.6), -2);
end;

method SystemTests.RoundTDateTime; 
begin
  var D:TDateTime := new TDateTime(2005, 01, 01, 8, 0, 0, 0);
  NUnit.Framework.Assert.AreEqual(D.ToInt32(nil), ShineOn.RTL.Round(D));
  D := new TDateTime(2005, 01, 01, 12, 1, 0, 0);
  NUnit.Framework.Assert.AreEqual(D.ToInt32(nil) + 1, ShineOn.RTL.Round(D));
end;

method SystemTests.TruncDouble; 
begin
  NUnit.Framework.Assert.AreEqual(ShineOn.RTL.Trunc(1.5), 1);
  NUnit.Framework.Assert.AreEqual(ShineOn.RTL.Trunc(-1.5), -1);
end;

method SystemTests.TruncTDateTime; 
begin
  var D:TDateTime := new TDateTime(2005, 01, 01, 23, 0, 0, 0);  
  var D2: Double := D;
  // Changed Math.Truncate to Decimal.Truncate to be vs2003 compatible
  //NUnit.Framework.Assert.AreEqual(Math.Truncate(D2), ShineOn.RTL.Trunc(D));
  NUnit.Framework.Assert.AreEqual((Decimal.Truncate(Decimal(D2))),  ShineOn.RTL.Trunc(D)); 
end;

method SystemTests.IntDouble; 
begin
  NUnit.Framework.Assert.AreEqual(ShineOn.RTL.Int(1.5), 1.0);
  NUnit.Framework.Assert.AreEqual(ShineOn.RTL.Int(-1.5), -1.0);
end;

method SystemTests.IntTDateTime; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SystemTests.FracDouble; 
begin
  NUnit.Framework.Assert.AreEqual(ShineOn.RTL.Frac(1.5), 0.5);
  NUnit.Framework.Assert.AreEqual(ShineOn.RTL.Frac(-1.5), -0.5);
end;

method SystemTests.FracTDateTime; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SystemTests.Odd; 
begin
  var i:integer := 0;
  while i < 255 do
  begin
    NUnit.Framework.Assert.IsFalse(ShineOn.RTL.Odd(i));
    i := i + 1;
    NUnit.Framework.Assert.IsTrue(ShineOn.RTL.Odd(i));
    i := i + 1;
  end;
end;

method SystemTests.Sqrt; 
begin
  NUnit.Framework.Assert.AreEqual(3, ShineOn.RTL.Sqrt(9));
end;

method SystemTests.SqrExtended; 
begin
  NUnit.Framework.Assert.AreEqual(3.0 * 3.0, ShineOn.RTL.Sqr(3.0));
end;

method SystemTests.SqrInteger; 
begin
  NUnit.Framework.Assert.AreEqual(3 * 3, ShineOn.RTL.Sqr(3));
end;

method SystemTests.AbsInteger; 
begin
  var i:integer := 1;
  NUnit.Framework.Assert.AreEqual(integer(i), ShineOn.RTL.Abs(integer(-i)));
end;

method SystemTests.AbsDouble; 
begin
  var D:double := 2.0;
  NUnit.Framework.Assert.AreEqual(double(d), ShineOn.RTL.Abs(double(-d)));
end;

method SystemTests.AbsTDateTime; 
begin
  var D:TDateTime := TDateTime(DateTime.Today);
  //NUnit.Framework.Assert.AreEqual(d, ShineOn.RTL.Abs(-d));
  //NUnit.Framework.Assert.AreNotEqual(d, ShineOn.RTL.Abs(-d));
  NUnit.Framework.Assert.AreNotSame(d, ShineOn.RTL.Abs(-d));
  
end;

method SystemTests.Exp; 
begin
  NUnit.Framework.Assert.AreEqual(ShineOn.RTL.Exp(1.0), Math.E);
end;

method SystemTests.SetLength; 
begin
  var S:String := 'This is a string';
  ShineOn.RTL.SetLength(S, 4);
  NUnit.Framework.Assert.AreEqual(S, 'This');
end;

method SystemTests.Write; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SystemTests.WriteLn; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SystemTests.Read; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SystemTests.ReadLn; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SystemTests.StringOfChar; 
begin
  var S:String := ShineOn.RTL.StringOfChar('A', 1);
  NUnit.Framework.Assert.AreEqual(String('A'), S);    
  S := ShineOn.RTL.StringOfChar('A', 2);
  NUnit.Framework.Assert.AreEqual('AA', S);
end;

end.
