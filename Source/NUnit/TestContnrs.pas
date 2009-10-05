// The contents of this file are subject to the Mozilla Public License Version 1.1 (the "License"); 
// you may not use this file except in compliance with the License. You may obtain a copy of the 
// License at http://www.mozilla.org/MPL/ 
// 
// Software distributed under the License is distributed on an "AS IS" basis, WITHOUT WARRANTY OF 
// ANY KIND, either express or implied. See the License for the specificlanguage governing rights and 
// limitations under the License.

// $Id: TestContnrs.pas 60 2006-03-17 14:24:58Z loonquawl $
namespace NUnit.ShineOn.RTL;

interface
uses
  Nunit.Framework,
  ShineOn.RTL;

type
  [TestFixture]
  TObjectListTests = public class(System.Object)
  public
    [Setup]
    method Setup;
    [TearDown]
    method TearDown;
    [Test, Ignore('Test not implemented')] 
    method Add;
    [Test, Ignore('Test not implemented')] 
    method Extract;
    [Test, Ignore('Test not implemented')] 
    method Remove;
    [Test, Ignore('Test not implemented')] 
    method IndexOf;
    [Test, Ignore('Test not implemented')] 
    method FindInstanceOf;
    [Test, Ignore('Test not implemented')] 
    method Insert;
    [Test, Ignore('Test not implemented')] 
    method First;
    [Test, Ignore('Test not implemented')] 
    method Last;
    [Test, Ignore('Test not implemented')] 
    method Items;
  end;

  [TestFixture]
  TComponentListTests = public class(System.Object)
  public
    [Setup]
    method Setup;
    [TearDown]
    method TearDown;

    [Test, Ignore('Test not implemented')] 
    method Add;
    [Test, Ignore('Test not implemented')] 
    method Extract;
    [Test, Ignore('Test not implemented')] 
    method Remove;
    [Test, Ignore('Test not implemented')] 
    method IndexOf;
    [Test, Ignore('Test not implemented')] 
    method First;
    [Test, Ignore('Test not implemented')] 
    method Last;
    [Test, Ignore('Test not implemented')] 
    method Insert;
    [Test, Ignore('Test not implemented')] 
    method Items;
  end;

  [TestFixture]
  TClassListTests = public class(System.Object)
  public
    [Setup]
    method Setup;
    [TearDown]
    method TearDown;

    [Test, Ignore('Test not implemented')] 
    method Add;
    [Test, Ignore('Test not implemented')] 
    method Extract;
    [Test, Ignore('Test not implemented')] 
    method Remove;
    [Test, Ignore('Test not implemented')] 
    method IndexOf;
    [Test, Ignore('Test not implemented')] 
    method First;
    [Test, Ignore('Test not implemented')] 
    method Last;
    [Test, Ignore('Test not implemented')] 
    method Insert;
    [Test, Ignore('Test not implemented')] 
    method Items;
  end;

  [TestFixture]
  TStackTests = public class(System.Object)
  public
    [Setup]
    method Setup;
    [TearDown]
    method TearDown;

    [Test, Ignore('Test not implemented')] 
    method Count;
    [Test, Ignore('Test not implemented')] 
    method AtLeast;
    [Test, Ignore('Test not implemented')] 
    method Push;
    [Test, Ignore('Test not implemented')] 
    method Pop;
    [Test, Ignore('Test not implemented')] 
    method Peek;
  end;

  [TestFixture]
  TObjectStackTests = public class(System.Object)
  public
    [Setup]
    method Setup;
    [TearDown]
    method TearDown;

    [Test, Ignore('Test not implemented')] 
    method Count;
    [Test, Ignore('Test not implemented')] 
    method AtLeast;
    [Test, Ignore('Test not implemented')] 
    method Push;
    [Test, Ignore('Test not implemented')] 
    method Pop;
    [Test, Ignore('Test not implemented')] 
    method Peek;
  end;

  [TestFixture]
  TQueueTests = public class(System.Object)
  public
    [Setup]
    method Setup;
    [TearDown]
    method TearDown;

    [Test, Ignore('Test not implemented')] 
    method Count;
    [Test, Ignore('Test not implemented')] 
    method AtLeast;
    [Test, Ignore('Test not implemented')] 
    method Push;
    [Test, Ignore('Test not implemented')] 
    method Pop;
    [Test, Ignore('Test not implemented')] 
    method Peek;
  end;
  
  [TestFixture]
  TObjectQueueTests = public class(System.Object)
  public
    [Setup]
    method Setup;
    [TearDown]
    method TearDown;

    [Test, Ignore('Test not implemented')] 
    method Count;
    [Test, Ignore('Test not implemented')] 
    method AtLeast;
    [Test, Ignore('Test not implemented')] 
    method Push;
    [Test, Ignore('Test not implemented')] 
    method Pop;
    [Test, Ignore('Test not implemented')] 
    method Peek;
  end;
  
  [TestFixture]
  TBucketListTests = public class(System.Object)
  public
    [Setup]
    method Setup;
    [TearDown]
    method TearDown;

    [Test, Ignore('Test not implemented')] 
    method Clear;
    [Test, Ignore('Test not implemented')] 
    method Add;
    [Test, Ignore('Test not implemented')] 
    method Remove;
    [Test, Ignore('Test not implemented')] 
    method ForEach;
    [Test, Ignore('Test not implemented')] 
    method Assign;
    [Test, Ignore('Test not implemented')] 
    method Exists;
    [Test, Ignore('Test not implemented')] 
    method Find;
    [Test, Ignore('Test not implemented')] 
    method Data;
  end;

implementation

method TObjectListTests.Setup; 
begin
end;

method TObjectListTests.TearDown; 
begin
end;

method TObjectListTests.Add; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TObjectListTests.Extract; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TObjectListTests.Remove; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TObjectListTests.IndexOf; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TObjectListTests.FindInstanceOf; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TObjectListTests.Insert; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TObjectListTests.First; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TObjectListTests.Last; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TObjectListTests.Items; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TComponentListTests.Setup; 
begin
end;

method TComponentListTests.TearDown; 
begin
end;

method TComponentListTests.Add; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TComponentListTests.Extract; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TComponentListTests.Remove; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TComponentListTests.IndexOf; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TComponentListTests.First; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TComponentListTests.Last; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TComponentListTests.Insert; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TComponentListTests.Items; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TClassListTests.Setup; 
begin
end;

method TClassListTests.TearDown; 
begin
end;

method TClassListTests.Add; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TClassListTests.Extract; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TClassListTests.Remove; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TClassListTests.IndexOf; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TClassListTests.First; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TClassListTests.Last; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TClassListTests.Insert; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TClassListTests.Items; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TStackTests.Setup; 
begin
end;

method TStackTests.TearDown; 
begin
end;

method TStackTests.Count; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TStackTests.AtLeast; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TStackTests.Push; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TStackTests.Pop; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TStackTests.Peek; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TObjectStackTests.Setup; 
begin
end;

method TObjectStackTests.TearDown; 
begin
end;

method TObjectStackTests.Count; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TObjectStackTests.AtLeast; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TObjectStackTests.Push; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TObjectStackTests.Pop; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TObjectStackTests.Peek; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TQueueTests.Setup; 
begin
end;

method TQueueTests.TearDown; 
begin
end;

method TQueueTests.Count; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TQueueTests.AtLeast; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TQueueTests.Push; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TQueueTests.Pop; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TQueueTests.Peek; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TObjectQueueTests.Setup; 
begin
end;

method TObjectQueueTests.TearDown; 
begin
end;

method TObjectQueueTests.Count; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TObjectQueueTests.AtLeast; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TObjectQueueTests.Push; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TObjectQueueTests.Pop; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TObjectQueueTests.Peek; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TBucketListTests.Setup; 
begin
end;

method TBucketListTests.TearDown; 
begin
end;

method TBucketListTests.Clear; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TBucketListTests.Add; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TBucketListTests.Remove; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TBucketListTests.ForEach; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TBucketListTests.Assign; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TBucketListTests.Exists; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TBucketListTests.Find; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

method TBucketListTests.Data; 
begin
  NUnit.Framework.Assert.IsTrue(false, 'Not implemented');
end;

end.
