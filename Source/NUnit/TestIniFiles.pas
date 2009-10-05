// The contents of this file are subject to the Mozilla Public License Version 1.1 (the "License"); 
// you may not use this file except in compliance with the License. You may obtain a copy of the 
// License at http://www.mozilla.org/MPL/ 
// 
// Software distributed under the License is distributed on an "AS IS" basis, WITHOUT WARRANTY OF 
// ANY KIND, either express or implied. See the License for the specificlanguage governing rights and 
// limitations under the License.

// History:
//
// 2006-03-21   :   Corwin Burgess  : Added TIniFilesTests.ReadString test.
// 2006-03-21   :   Corwin Burgess  : Added IniFiles.UpdateFile to AddSomeData.
// 2006-03-21   :   Corwin Burgess  : Added TIniFilesTests.WriteString.
// 2006-03-21   :   Corwin Burgess  : Added TIniFilesTests.ReadInteger.
// 2006-03-21   :   Corwin Burgess  : Added TIniFilesTests.WriteInteger.
// 2006-03-21   :   Corwin Burgess  : Added TIniFilesTests.ReadBool.
// 2006-03-21   :   Corwin Burgess  : Added TIniFilesTests.WriteBool.
// 2006-03-21   :   Corwin Burgess  : Added TIniFilesTests.ReadFloat.
// 2006-03-21   :   Corwin Burgess  : Added TIniFilesTests.WriteFloat.
// 2006-03-21   :   Corwin Burgess  : Added TIniFilesTests.Clear.
// 2006-03-21   :   Corwin Burgess  : Added TIniFilesTests.UpdateFile.
// 2006-03-21   :   Corwin Burgess  : Added TIniFilesTests.ReadSection.
// 2006-03-21   :   Corwin Burgess  : Added TIniFilesTests.GetStrings.
// 2006-03-21   :   Corwin Burgess  : Added TIniFilesTests.SetStrings.
// 2006-03-27   :   Corwin Burgess  : Added TIniFilesTests.ValueExists.
// 2006-03-27   :   Corwin Burgess  : Added TIniFilesTests.DeleteKey.
// 2006-03-27   :   Corwin Burgess  : Added TIniFilesTests.ReadSectionValues.
// 2006-03-27   :   Corwin Burgess  : Added TIniFilesTests.ReadSections.
// 2006-03-27   :   Corwin Burgess  : Added TIniFilesTests.EraseSection.

// $Id: TestIniFiles.pas 77 2006-03-27 06:07:25Z msgclb $
namespace NUnit.ShineOn.RTL;

interface
uses
  System.IO,
  Nunit.Framework,
  ShineOn.RTL;

type
  [TestFixture]
  TIniFilesTests = public class(System.Object)
  private
    FFilename:string;
    IniFile:TIniFile;
    method AddSomeData;
  public
    [Setup]
    method Setup;
    [TearDown]
    method TearDown;
    [Test] 
    method Clear;
    [Test] 
    method GetStrings;
    [Test] 
    method SetStrings;
    [Test, Ignore('Test not implemented')] 
    method Rename;
    [Test] 
    method SectionExists;
    [Test] 
    method ReadString;
    [Test] 
    method WriteString;
    [Test] 
    method ReadInteger;
    [Test] 
    method WriteInteger;
    [Test] 
    method ReadBool;
    [Test] 
    method WriteBool;
    [Test, Ignore('Test not implemented')] 
    method ReadBinaryStream;
    [Test, Ignore('Test not implemented')] 
    method ReadDate;
    [Test, Ignore('Test not implemented')] 
    method ReadDateTime;
    [Test] 
    method ReadFloat;
    [Test, Ignore('Test not implemented')] 
    method ReadTime;
    [Test, Ignore('Test not implemented')] 
    method WriteBinaryStream;
    [Test, Ignore('Test not implemented')] 
    method WriteDate;
    [Test, Ignore('Test not implemented')] 
    method WriteDateTime;
    [Test] 
    method WriteFloat;
    [Test, Ignore('Test not implemented')] 
    method WriteTime;
    [Test] 
    method ReadSection;
    [Test] 
    method ReadSections;
    [Test] 
    method ReadSectionValues;
    [Test] 
    method EraseSection;
    [Test] 
    method DeleteKey;
    [Test] 
    method UpdateFile;
    [Test] 
    method ValueExists;
  end;
  
implementation

method TIniFilesTests.Setup; 
begin
  FFilename := Path.GetTempPath + 'IniFileTest.ini'; 
  IniFile := new TIniFile(FFilename);
  AddSomeData;
end;

method TIniFilesTests.TearDown; 
begin
  IniFile.Free;
  IniFile := nil;
  if File.Exists(FFilename) then
    File.Delete(FFilename);
end;

method TIniFilesTests.Clear; 
begin
  IniFile.Clear;
  with S := new TStringlist do
  begin
    IniFile.ReadSections(S);
    NUnit.Framework.Assert.AreEqual(0, S.Count);
 end;
end;

method TIniFilesTests.GetStrings; 
begin
  var SL:TStringList;
  var S:String;
  SL := new TStringList;
  IniFile.GetStrings(SL);
  S := IniFile.ReadString('Test','String', 'error');
  NUnit.Framework.Assert.AreEqual('TextData', S);
  SL.free;
end;

method TIniFilesTests.SetStrings; 
begin
  var S:String;
  var SL:TStringList;
  SL := new TStringList;
  IniFile.GetStrings(SL);
  S := IniFile.ReadString('Test','String', 'error');
  NUnit.Framework.Assert.AreEqual('TextData', S);
  IniFile.Clear;
  S := IniFile.ReadString('Test','String', 'error');
  NUnit.Framework.Assert.AreEqual('error', S);
  IniFile.SetStrings(SL);
  S := IniFile.ReadString('Test','String', 'error');
  NUnit.Framework.Assert.AreEqual('TextData', S);
  SL.free;
end;

method TIniFilesTests.Rename; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TIniFilesTests.SectionExists; 
begin
  if IniFile.SectionExists('Test') then
    NUnit.Framework.Assert.IsTrue(true, 'Section Exists')
  else
    NUnit.Framework.Assert.IsTrue(false, 'Section Exists Failed');
end;

method TIniFilesTests.ReadString; 
begin
  var S:String;
  S := IniFile.ReadString('Test','String','');
  NUnit.Framework.Assert.AreEqual('TextData', S);
end;

method TIniFilesTests.WriteString; 
begin
  var S:String;
  IniFile.WriteString('NewTest','NewString','NewTextData');
  IniFile.UpdateFile;
  S := IniFile.ReadString('NewTest','NewString','');
  NUnit.Framework.Assert.AreEqual('NewTextData', S);
end;

method TIniFilesTests.ReadInteger; 
begin
  var I1:Integer;
  var I2:Integer;
  var I3:Integer;
  var I4:Integer;
  I1 := IniFile.ReadInteger('Test','Int0',99);
  I2 := IniFile.ReadInteger('Test','Int1',99);
  I3 := IniFile.ReadInteger('Test','Int2',99);
  I4 := IniFile.ReadInteger('Test','Int3',99);
  NUnit.Framework.Assert.AreEqual(0, I1);
  NUnit.Framework.Assert.AreEqual(1, I2);
  NUnit.Framework.Assert.AreEqual(-1, I3);
  NUnit.Framework.Assert.AreEqual(2, I4);
end;

method TIniFilesTests.WriteInteger; 
begin
  var I1:Integer;
  var I2:Integer;
  var I3:Integer;
  var I4:Integer;
  IniFile.WriteInteger('NewTest','NewInt0',0);
  IniFile.WriteInteger('NewTest','NewInt1',1);
  IniFile.WriteInteger('NewTest','NewInt2',-1);
  IniFile.WriteInteger('NewTest','NewInt3',2);
  IniFile.UpdateFile;
  I1 := IniFile.ReadInteger('NewTest','NewInt0',99);
  I2 := IniFile.ReadInteger('NewTest','NewInt1',99);
  I3 := IniFile.ReadInteger('NewTest','NewInt2',99);
  I4 := IniFile.ReadInteger('NewTest','NewInt3',99);
  NUnit.Framework.Assert.AreEqual(0, I1);
  NUnit.Framework.Assert.AreEqual(1, I2);
  NUnit.Framework.Assert.AreEqual(-1, I3);
  NUnit.Framework.Assert.AreEqual(2, I4);
end;

method TIniFilesTests.ReadBool; 
begin
  var BT:Boolean;
  var BF:Boolean;
  BT := IniFile.ReadBool('Test','BoolTrue',False);
  BF := IniFile.ReadBool('Test','BoolFalse',True);
  NUnit.Framework.Assert.AreEqual(True, BT);
  NUnit.Framework.Assert.AreEqual(False, BF);
end;

method TIniFilesTests.WriteBool; 
begin
  var BT:Boolean;
  var BF:Boolean;
  IniFile.WriteBool('NewTest','BoolTrue',True);
  IniFile.WriteBool('NewTest','BoolFalse',False);
  IniFile.UpdateFile;
  BT := IniFile.ReadBool('Test','BoolTrue',False);
  BF := IniFile.ReadBool('Test','BoolFalse',True);
  NUnit.Framework.Assert.AreEqual(True, BT);
  NUnit.Framework.Assert.AreEqual(False, BF);
end;

method TIniFilesTests.ReadBinaryStream; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TIniFilesTests.ReadDate; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TIniFilesTests.ReadDateTime; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TIniFilesTests.ReadFloat; 
begin
  var F1:Double;
  var F2:Double;
  var F3:Double;
  var F4:Double;
  var F5:Double;
  F1 := IniFile.ReadFloat('Test','Float1',9.9);
  F2 := IniFile.ReadFloat('Test','Float2',9.9);
  F3 := IniFile.ReadFloat('Test','Float3',9.9);
  F4 := IniFile.ReadFloat('Test','Float4',9.9);
  F5 := IniFile.ReadFloat('Test','Float5',9.9);
  NUnit.Framework.Assert.AreEqual(0.0, F1);
  NUnit.Framework.Assert.AreEqual(1.5, F2);
  NUnit.Framework.Assert.AreEqual(3.141592, F3);
  NUnit.Framework.Assert.AreEqual(-1.0, F4);
  NUnit.Framework.Assert.AreEqual(-0.0, F5);
end;

method TIniFilesTests.ReadTime; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TIniFilesTests.WriteBinaryStream; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TIniFilesTests.WriteDate; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TIniFilesTests.WriteDateTime; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TIniFilesTests.WriteFloat; 
begin
  var F1:Double;
  var F2:Double;
  var F3:Double;
  var F4:Double;
  var F5:Double;
  IniFile.WriteFloat('NewTest','Float1',0.0);
  IniFile.WriteFloat('NewTest','Float2',1.5);
  IniFile.WriteFloat('NewTest','Float3',3.141592);
  IniFile.WriteFloat('NewTest','Float4',-1.0);
  IniFile.WriteFloat('NewTest','Float5',-0.0);
  IniFile.UpdateFile;
  F1 := IniFile.ReadFloat('NewTest','Float1',0.0);
  F2 := IniFile.ReadFloat('NewTest','Float2',1.5);
  F3 := IniFile.ReadFloat('NewTest','Float3',3.141592);
  F4 := IniFile.ReadFloat('NewTest','Float4',-1.0);
  F5 := IniFile.ReadFloat('NewTest','Float5',-0.0);
  NUnit.Framework.Assert.AreEqual(0.0, F1);
  NUnit.Framework.Assert.AreEqual(1.5, F2);
  NUnit.Framework.Assert.AreEqual(3.141592, F3);
  NUnit.Framework.Assert.AreEqual(-1.0, F4);
  NUnit.Framework.Assert.AreEqual(-0.0, F5);
end;

method TIniFilesTests.WriteTime; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TIniFilesTests.ReadSection; 
begin
  var S:TStringList;
  S := new TStringlist;
  { Read the specified section }
  IniFile.ReadSection('Test', S);
  { Output the section to the screen }
  NUnit.Framework.Assert.AreEqual('String', S.Strings[0].ToString);
  NUnit.Framework.Assert.AreEqual('Int0', S.Strings[1].ToString);
  NUnit.Framework.Assert.AreEqual('Int1', S.Strings[2].ToString);
  S.free;
end;

method TIniFilesTests.ReadSections; 
begin
  Var I: Integer;
  Var T:TStringList;
  Var S:String;
  try
    T := new TStringlist;
    IniFile.ReadSections(T);
    // if S Count equal 0 then somethings wrong! 
    NUnit.Framework.Assert.AreNotEqual(0, T.Count);
    if T.Count > 0 then
    begin    
      S := T[0];
      NUnit.Framework.Assert.AreEqual('Test', S);
    end
    else
      NUnit.Framework.Assert.AreEqual('Unkown', S);
  finally
    T.Free;
  end;
end;

method TIniFilesTests.ReadSectionValues; 
begin
  Var I: Integer;
  Var T:TStringList;
  Var S:String;
  try
    T := new TStringlist;
    IniFile.ReadSectionValues('Test', T);
    // if S Count equal 0 then somethings wrong! 
    NUnit.Framework.Assert.AreNotEqual(0, T.Count);
    if T.Count > 0 then
    begin    
      S := T[0];
      NUnit.Framework.Assert.AreEqual('String=TextData', S);
    end
    else
      NUnit.Framework.Assert.AreEqual('Unknown=Value', S);
  finally
    T.Free;
  end;
end;

method TIniFilesTests.EraseSection; 
begin
  var S:String;
  IniFile.WriteString('NewTest','NewString','NewTextData');
  IniFile.UpdateFile;
  S := IniFile.ReadString('NewTest','NewString','');
  NUnit.Framework.Assert.AreEqual('NewTextData', S);
  IniFile.EraseSection('NewTest');
  if IniFile.SectionExists('NewTest') then
    NUnit.Framework.Assert.IsTrue(false, 'EraseSection Failed')
  else
    NUnit.Framework.Assert.IsTrue(true, 'EraseSection Worked');

end;

method TIniFilesTests.DeleteKey; 
begin
  var S:String;
  IniFile.WriteString('NewTest','NewString','NewTextData');
  IniFile.UpdateFile;
  S := IniFile.ReadString('NewTest','NewString','');
  NUnit.Framework.Assert.AreEqual('NewTextData', S);
  IniFile.DeleteKey('NewTest','NewString');
  S := IniFile.ReadString('NewTest','NewString','');
  NUnit.Framework.Assert.AreNotEqual('NewTextData', S);
end;

method TIniFilesTests.UpdateFile; 
begin
  var S:String;
  IniFile.WriteString('Update','String','TextData');
  IniFile.UpdateFile;
  S := IniFile.ReadString('Update','String','');
  NUnit.Framework.Assert.AreEqual('TextData', S);
end;

method TIniFilesTests.ValueExists; 
begin
  var S:String;
  if IniFile.ValueExists('Test','String') then
  begin  
    S := IniFile.ReadString('Test','String','');
    NUnit.Framework.Assert.AreEqual('TextData', S);
  end
  else
  begin
    S := IniFile.ReadString('Test','String','');
    NUnit.Framework.Assert.AreNotEqual('TextData', S);
  end;
end;

method TIniFilesTests.AddSomeData; 
begin
  IniFile.WriteString('Test','String','TextData');

  IniFile.WriteInteger('Test','Int0',0);
  IniFile.WriteInteger('Test','Int1',1);
  IniFile.WriteInteger('Test','Int2',-1);
  IniFile.WriteInteger('Test','Int3',2);

  IniFile.WriteBool('Test','BoolTrue',True);
  IniFile.WriteBool('Test','BoolFalse',False);

  IniFile.WriteFloat('Test','Float1',0.0);
  IniFile.WriteFloat('Test','Float2',1.5);
  IniFile.WriteFloat('Test','Float3',3.141592);
  IniFile.WriteFloat('Test','Float4',-1.0);
  IniFile.WriteFloat('Test','Float5',-0.0);
  
  //IniFile.WriteDate('Test', 'Date', TDateTime.Date);
  //IniFile.WriteDateTime('Test', 'Now', TDateTime.Now);
  //IniFile.WriteTime('Test', 'Time', TDateTime.Time);

  IniFile.UpdateFile;  
          
end;

end.
