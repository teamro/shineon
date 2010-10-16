// The contents of this file are subject to the Mozilla Public License Version 1.1 (the "License"); 
// you may not use this file except in compliance with the License. You may obtain a copy of the 
// License at http://www.mozilla.org/MPL/ 
// 
// Software distributed under the License is distributed on an "AS IS" basis, WITHOUT WARRANTY OF 
// ANY KIND, either express or implied. See the License for the specificlanguage governing rights and 
// limitations under the License.

namespace NUnit.ShineOn.RTL;

interface

uses
  Nunit.Framework,
  ShineOn.Rtl;

type
  [TestFixture]
  StrUtilsTests = public class(System.Object)
  public
    [Setup]
    method Setup;
    [TearDown]
    method TearDown;
    [Test, Ignore('Test not implemented')] 
    method TestLeftStr;
    [Test, Ignore('Test not implemented')] 
    method TestRightStr;
    [Test, Ignore('Test not implemented')] 
    method TestMidStr;
    [Test, Ignore('Test not implemented')] 
    method TestAnsiDupeStr;
    [Test, Ignore('Test not implemented')] 
    method TestAnsiLeftStr;
    [Test] 
    method AnsiReverseString;
    [Test, Ignore('Test not implemented')] 
    method TestAnsiRightStr;
    [Test, Ignore('Test not implemented')] 
    method TestAnsiMidStr;
    [Test, Ignore('Test not implemented')] 
    method TestContainsText;
    [Test, Ignore('Test not implemented')] 
    method TestAnsiContainsStr;
  end;

implementation

method StrUtilsTests.Setup; 
begin

end;


method StrUtilsTests.TearDown; 
begin

end;

method StrUtilsTests.TestLeftStr;
begin
 NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method StrUtilsTests.TestRightStr;
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method StrUtilsTests.TestMidStr;
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method StrUtilsTests.TestAnsiDupeStr;
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method StrUtilsTests.TestAnsiLeftStr;
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method StrUtilsTests.AnsiReverseString; 
begin
  NUnit.Framework.Assert.AreEqual(nil, SysUtils.AnsiReverseString(nil));
  NUnit.Framework.Assert.AreEqual('', SysUtils.AnsiReverseString(''));
  NUnit.Framework.Assert.AreEqual('ollaH', SysUtils.AnsiReverseString('Hallo'));
end;

method StrUtilsTests.TestAnsiRightStr;
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method StrUtilsTests.TestAnsiMidStr;
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method StrUtilsTests.TestContainsText;
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method StrUtilsTests.TestAnsiContainsStr;
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

end.