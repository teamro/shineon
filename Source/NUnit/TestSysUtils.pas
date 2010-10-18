// The contents of this file are subject to the Mozilla Public License Version 1.1 (the "License"); 
// you may not use this file except in compliance with the License. You may obtain a copy of the 
// License at http://www.mozilla.org/MPL/ 
// 
// Software distributed under the License is distributed on an "AS IS" basis, WITHOUT WARRANTY OF 
// ANY KIND, either express or implied. See the License for the specificlanguage governing rights and 
// limitations under the License.

// $Id: TestSysUtils.pas 86 2007-06-09 22:24:03Z loonquawl $

namespace NUnit.ShineOn.RTL;

interface
uses
  Nunit.Framework,
  ShineOn.Rtl;

type
  [TestFixture]
  SysUtilsTests = public class(System.Object)
  public
    [Setup]
    method Setup;
    [TearDown]
    method TearDown;
    [Test] 
    method AnsiUpperCase;
    [Test, Ignore('Test not implemented')] 
    method AnsiLowerCase;
    [Test, Ignore('Test not implemented')] 
    method AnsiCompareStr;
    [Test, Ignore('Test not implemented')] 
    method AnsiSameStr;
    [Test, Ignore('Test not implemented')] 
    method AnsiCompareText;
    [Test, Ignore('Test not implemented')] 
    method AnsiSameText;
    [Test, Ignore('Test not implemented')] 
    method AnsiStrComp;
    [Test, Ignore('Test not implemented')] 
    method AnsiStrIComp;
    [Test, Ignore('Test not implemented')] 
    method AnsiStrLComp;
    [Test, Ignore('Test not implemented')] 
    method AnsiStrLIComp;
    [Test, Ignore('Test not implemented')] 
    method AnsiStrLower;
    [Test, Ignore('Test not implemented')] 
    method AnsiStrUpper;
    [Test, Ignore('Test not implemented')] 
    method AnsiLastChar;
    [Test, Ignore('Test not implemented')] 
    method AnsiStrLastChar;
    [Test, Ignore('Test not implemented')] 
    method WideUpperCase;
    [Test, Ignore('Test not implemented')] 
    method WideLowerCase;
    [Test, Ignore('Test not implemented')] 
    method WideCompareStr;
    [Test, Ignore('Test not implemented')] 
    method WideSameStr;
    [Test, Ignore('Test not implemented')] 
    method WideCompareText;
    [Test, Ignore('Test not implemented')] 
    method WideSameText;
    [Test, Ignore('Test not implemented')] 
    method Trim;
    [Test, Ignore('Test not implemented')] 
    method TrimLeft;
    [Test, Ignore('Test not implemented')] 
    method TrimRight;
    [Test] 
    method TestQuotedStr;
    [Test] 
    method TestAnsiQuotedStr;
    [Test, Ignore('Test not implemented')] 
    method AnsiExtractQuotedStr;
    [Test] 
    method AnsiDequotedStr;
    [Test] 
    method IntToStr;
    [Test, Ignore('Test not implemented')] 
    method IntToHex;
    [Test] 
    method TestStrToInt;
    [Test] 
    method TestStrToIntDef;
    [Test, Ignore('Test not implemented')] 
    method TryStrToInt;
    [Test, Ignore('Test not implemented')] 
    method StrToInt64;
    [Test, Ignore('Test not implemented')] 
    method StrToInt64Def;
    [Test, Ignore('Test not implemented')] 
    method TryStrToInt64;
    [Test, Ignore('Test not implemented')] 
    method StrToBool;
    [Test, Ignore('Test not implemented')] 
    method BoolToStr;
    [Test, Ignore('Test not implemented')] 
    method StrToDate;
    [Test, Ignore('Test not implemented')] 
    method StrToDateDef;
    [Test, Ignore('Test not implemented')] 
    method StrToDateTime;
    [Test, Ignore('Test not implemented')] 
    method StrToDateTimeDef;
    [Test, Ignore('Test not implemented')] 
    method StrToTime;
    [Test, Ignore('Test not implemented')] 
    method StrToTimeDef;
    [Test, Ignore('Test not implemented')] 
    method DateToStr;
    [Test, Ignore('Test not implemented')] 
    method DateTimeToStr;
    [Test, Ignore('Test not implemented')] 
    method TimeToStr;
    [Test, Ignore('Test not implemented')] 
    method FreeAndNil;
    [Test, Ignore('Test not implemented')] 
    method FileExists;
    [Test, Ignore('Test not implemented')] 
    method DirectoryExists;
    [Test, Ignore('Test not implemented')] 
    method ForceDirectories;
    [Test, Ignore('Test not implemented')] 
    method DeleteFile;
    [Test, Ignore('Test not implemented')] 
    method RenameFile;
    [Test, Ignore('Test not implemented')] 
    method ChangeFileExt;
    [Test] 
    method ChangeFilePath;
    [Test, Ignore('Test not implemented')] 
    method ExtractFilePath;
    [Test, Ignore('Test not implemented')] 
    method ExtractFileDir;
    [Test, Ignore('Test not implemented')] 
    method ExtractFileDrive;
    [Test, Ignore('Test not implemented')] 
    method ExtractFileName;
    [Test, Ignore('Test not implemented')] 
    method ExtractFileExt;
    [Test, Ignore('Test not implemented')] 
    method ExpandFileName;
    [Test, Ignore('Test not implemented')] 
    method ExpandUNCFileName;
    [Test, Ignore('Test not implemented')] 
    method ExtractRelativePath;
    [Test, Ignore('Test not implemented')] 
    method ExtractShortPathName;
    [Test, Ignore('Test not implemented')] 
    method GetCurrentDir;
    [Test, Ignore('Test not implemented')] 
    method SetCurrentDir;
    [Test, Ignore('Test not implemented')] 
    method CreateDir;
    [Test, Ignore('Test not implemented')] 
    method RemoveDir;
    [Test, Ignore('Test not implemented')] 
    method IsPathDelimiter;
    [Test, Ignore('Test not implemented')] 
    method IsDelimiter;
    [Test, Ignore('Test not implemented')] 
    method IncludeTrailingPathDelimiter;
    [Test, Ignore('Test not implemented')] 
    method IncludeTrailingBackslash;
    [Test, Ignore('Test not implemented')] 
    method ExcludeTrailingPathDelimiter;
    [Test, Ignore('Test not implemented')] 
    method ExcludeTrailingBackslash;
    [Test, Ignore('Test not implemented')] 
    method LastDelimiter;
    [Test, Ignore('Test not implemented')] 
    method AnsiCompareFileName;
    [Test, Ignore('Test not implemented')] 
    method SameFileName;
    [Test, Ignore('Test not implemented')] 
    method AnsiLowerCaseFileName;
    [Test, Ignore('Test not implemented')] 
    method AnsiUpperCaseFileName;
    [Test, Ignore('Test not implemented')] 
    method AnsiPos;
    [Test, Ignore('Test not implemented')] 
    method AnsiStrPos;
    [Test, Ignore('Test not implemented')] 
    method AnsiStrRScan;
    [Test, Ignore('Test not implemented')] 
    method AnsiStrScan;
    [Test, Ignore('Test not implemented')] 
    method StringReplace;
    [Test, Ignore('Test not implemented')] 
    method GetEnvironmentVariable;
    [Test]
    method Format;
    [Test]
    method Supports;
  end;

implementation

type
  IInterface1 = interface(IInterface)
  end;

  IInterface2 = interface(IInterface)
  end;

  TIntfObject12 = class(TObject, IInterface1, IInterface2)
  end;

method SysUtilsTests.Setup; 
begin
end;

method SysUtilsTests.TearDown; 
begin
end;

method SysUtilsTests.AnsiUpperCase; 
begin
  NUnit.Framework.Assert.AreEqual('THIS IS A TEST', SysUtils.UpperCase('This Is A Test'));
end;

method SysUtilsTests.AnsiLowerCase; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.AnsiCompareStr; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.AnsiSameStr; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.AnsiCompareText; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.AnsiSameText; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.AnsiStrComp; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.AnsiStrIComp; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.AnsiStrLComp; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.AnsiStrLIComp; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.AnsiStrLower; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.AnsiStrUpper; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.AnsiLastChar; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.AnsiStrLastChar; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.WideUpperCase; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.WideLowerCase; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.WideCompareStr; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.WideSameStr; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.WideCompareText; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.WideSameText; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.Trim; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.TrimLeft; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.TrimRight; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.TestQuotedStr;
begin
  var S := 'This is a test';
  var R := QuotedStr(S);
  NUnit.Framework.Assert.AreEqual('''This is a test''', R);

  S := 'This is ''a'' test';
  R := QuotedStr(S);
  NUnit.Framework.Assert.AreEqual('''This is ''''a'''' test''', R);

  S := 'This is "a'' test';
  R := QuotedStr(S, '"');
  NUnit.Framework.Assert.AreEqual('"This is ""a'' test"', R);

  S := '';
  R := QuotedStr(S, '"');
  NUnit.Framework.Assert.AreEqual('""', R);
end;

method SysUtilsTests.TestAnsiQuotedStr; 
begin
  var S := 'This is a test';
  var R := AnsiQuotedStr(S, '''');
  NUnit.Framework.Assert.AreEqual('''This is a test''', R);

  S := 'This is ''a'' test';
  R := AnsiQuotedStr(S, '"');
  NUnit.Framework.Assert.AreEqual('"This is ''a'' test"', R);
end;

method SysUtilsTests.AnsiExtractQuotedStr; 
begin
 NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.AnsiDequotedStr; 
var
  S : string;
  R : string;
  E : string;
begin
  S := '"This is a string"';
  E := 'This is a string';
  R := DequotedStr(S);
  NUnit.Framework.Assert.AreEqual(E, R, 'AnsiDequotedString Failed -- Test#01');

  S := '"This is "a" string"';
  E := 'This is a string';
  R := DequotedStr(S);
  NUnit.Framework.Assert.AreEqual(E, R, 'AnsiDequotedString Failed -- Test#02');

  S := '"This is a" string"';
  E := 'This is a string';
  R := DequotedStr(S);
  NUnit.Framework.Assert.AreEqual(E, R, 'AnsiDequotedString Failed -- Test#03');

  S := '"This is open ended';
  E := 'This is open ended';
  R := DequotedStr(S);
  NUnit.Framework.Assert.AreEqual(E, R, 'AnsiDequotedString Failed -- Test#04');

end;

method SysUtilsTests.IntToStr; 
var
  S: Integer;
  R: String;
  E: String;
begin
  S := 42;
  R := SysUtils.IntToStr(S);
  E := '42';
  
  NUnit.Framework.Assert.AreEqual(E, R, 'IntToStr failed -- Test #1');
  
  S := -42;
  R := SysUtils.IntToStr(S);
  E := '-42';

  NUnit.Framework.Assert.AreEqual(E, R, 'IntToStr failed -- Test#2');

  S := 0;
  R := SysUtils.IntToStr(S);
  E := '0';

  NUnit.Framework.Assert.AreEqual(E, R, 'IntToStr failed -- Test#3');
end;

method SysUtilsTests.IntToHex; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.TestStrToInt; 
var
  S: string;
  R: Integer;
  Exp: Integer;

begin
  S := '42';
  R := SysUtils.StrToInt(S);
  Exp := 42;

  Nunit.Framework.Assert.AreEqual(Exp, R, 'StrToInt failed -- Test#01');

  S := '-42';
  R := SysUtils.StrToInt(S);
  Exp := -42;

  Nunit.Framework.Assert.AreEqual(Exp, R, 'StrToInt failed -- Test#02');

  S := '0';
  R := SysUtils.StrToInt(S);
  Exp := 0;

  Nunit.Framework.Assert.AreEqual(Exp, R, 'StrToInt failed -- Test#03');

  S := 'Foobar';
  try
    R := SysUtils.StrToInt(S);
    NUnit.Framework.Assert.Fail;
  except
    on E: Exception do begin
        NUnit.Framework.Assert.AreEqual(typeof (FormatException), E.GetType, 'test#04');
    end;
  end;
end;

method SysUtilsTests.TestStrToIntDef; 
var
  Submitted: String;
  Expected: Integer;
  Default: Integer;
  Actual: Integer;
begin
  Submitted := '42';
  Expected := 42;
  Actual := SysUtils.StrToIntDef(Submitted, Expected);
  NUnit.Framework.Assert.IsTrue(Actual = Expected, 'StrToIntDef Failed - Test #01');

  Submitted := 'xyz';
  Expected := 42;
  Default := 0;
  Actual := SysUtils.StrToIntDef(Submitted, Default);
  NUnit.Framework.Assert.IsTrue(Actual = Default, 'StrToIntDef Failed - Test #02');


end;

method SysUtilsTests.TryStrToInt; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.StrToInt64; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.StrToInt64Def; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.TryStrToInt64; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.StrToBool; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.BoolToStr; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.StrToDate; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.StrToDateDef; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.StrToDateTime; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.StrToDateTimeDef; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.StrToTime; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.StrToTimeDef; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.DateToStr; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.DateTimeToStr; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.TimeToStr; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.FreeAndNil; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.FileExists; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.DirectoryExists; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.ForceDirectories; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.DeleteFile; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.RenameFile; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.ChangeFileExt; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.ChangeFilePath;
const
  cPath1 = 'c:\path1';
  cPath2 = 'c:\path2';
  cFileName = 'FileName.txt';
begin
  var sFileName: String := SysUtils.ChangeFilePath(SysUtils.IncludeTrailingPathDelimiter(cPath1) + cFileName, cPath2);
  NUnit.Framework.Assert.IsTrue(String.Equals(sFileName, SysUtils.IncludeTrailingPathDelimiter(cPath2) + cFileName));
end;

method SysUtilsTests.ExtractFilePath; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.ExtractFileDir; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.ExtractFileDrive; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.ExtractFileName; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.ExtractFileExt; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.ExpandFileName; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.ExpandUNCFileName; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.ExtractRelativePath; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.ExtractShortPathName; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.GetCurrentDir; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.SetCurrentDir; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.CreateDir; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.RemoveDir; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.IsPathDelimiter; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.IsDelimiter; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.IncludeTrailingPathDelimiter; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.IncludeTrailingBackslash; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.ExcludeTrailingPathDelimiter; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.ExcludeTrailingBackslash; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.LastDelimiter; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.AnsiCompareFileName; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.SameFileName; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.AnsiLowerCaseFileName; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.AnsiUpperCaseFileName; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.AnsiPos; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.AnsiStrPos; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.AnsiStrRScan; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.AnsiStrScan; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.StringReplace; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.GetEnvironmentVariable; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method SysUtilsTests.Format; 
begin
  NUnit.Framework.Assert.AreEqual('Decimal          = -123', SysUtils.Format('Decimal          = %d', [-123]));
  NUnit.Framework.Assert.AreEqual('Reposition after 3 strings = Zero One Two One Two', SysUtils.Format('Reposition after 3 strings = %s %s %s %1:s %s', ['Zero', 'One', 'Two', 'Three']));
  NUnit.Framework.Assert.AreEqual('Justified decimal = <1234   >', SysUtils.Format('Justified decimal = <%-7d>', [1234]));
  NUnit.Framework.Assert.AreEqual('0 padded decimal  = <001234>', SysUtils.Format('0 padded decimal  = <%.6d>', [1234]));
  NUnit.Framework.Assert.AreEqual('Width + precision = <  001234>', SysUtils.Format('Width + precision = <%8.6d>', [1234]));
end;

method SysUtilsTests.Supports;
begin
  var pIntf1: IInterface1 := new TIntfObject12;
  var pIntf2: IInterface2;

  NUnit.Framework.Assert.AreEqual(false, SysUtils.Supports(TObject(nil), typeof(IInterface2), pIntf2));
  NUnit.Framework.Assert.AreEqual(nil, pIntf2);

  NUnit.Framework.Assert.AreEqual(true, SysUtils.Supports(pIntf1, typeof(IInterface2), pIntf2));
  NUnit.Framework.Assert.AreEqual(pIntf1, pIntf2);
end;

end.
