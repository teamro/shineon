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
  ShineOn.RTL;

type
  [TestFixture]
  TestStrings = public class(Object)
  public
  [Test] 
  	method SetTextStr;
  end;

implementation

{ TestStrings }

method TestStrings.SetTextStr;
const
  cLine1: String = 'A';
  cLine2: String = 'B';
  cLine3: String = cLine1 + #0 + cLine2;
var
  pList: TStringList;
begin
  //Nil Text
  pList := new TStringList();
  pList.Text := nil;
  Assert.AreEqual(pList.Count, 0);

  //EmptyText
  pList := new TStringList();
  pList.Text := '';
  Assert.AreEqual(pList.Count, 0);

  //Normal Text
  pList := new TStringList();
  pList.Text := cLine1 + System.Environment.NewLine + cLine2;
  Assert.AreEqual(pList.Count, 2);
  Assert.AreEqual(pList[0], cLine1);
  Assert.AreEqual(pList[1], cLine2);

  //Special Text
  pList := new TStringList();
  pList.Text := cLine3;
  Assert.AreEqual(pList.Count, 1);
  Assert.AreEqual(pList[0], cLine3);

  //No LineBreak
  pList := new TStringList();
  pList.LineBreak := nil;
  pList.Text := cLine1 + System.Environment.NewLine + cLine2;
  Assert.AreEqual(pList.Count, 1);
  Assert.AreEqual(pList[0], pList.Text);
end;

end.