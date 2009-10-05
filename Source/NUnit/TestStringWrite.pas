// The contents of this file are subject to the Mozilla Public License Version 1.1 (the "License"); 
// you may not use this file except in compliance with the License. You may obtain a copy of the 
// License at http://www.mozilla.org/MPL/ 
// 
// Software distributed under the License is distributed on an "AS IS" basis, WITHOUT WARRANTY OF 
// ANY KIND, either express or implied. See the License for the specificlanguage governing rights and 
// limitations under the License.

namespace NUnit.ShineOn.RTL;
// TestFixture to test StringWrite

interface
uses
    Nunit.Framework,
    ShineOn.RTL;

type
  [TestFixture]
  TestStringWrite = public class(System.Object)
  private
      var nl : String := #13#10;  
  protected
  public
    [Test] 
	method TestConstructors;
    [Test] 
    method TestWrite;
    [Test] 
    method TestNewLine;
    [Test] 
    method TestWriteLine;
    [Test] 
    method TestGetStringBuilder;
    [Test] 
    method TestClose;
    [Test] 
    method TestExceptions;
  end;
  
implementation

method TestStringWrite.TestConstructors; 
begin
    var S:System.Text.StringBuilder;
    S := new System.Text.StringBuilder('Test String');

    var W:System.IO.StringWriter;
    W := new System.IO.StringWriter( S );
    NUnit.Framework.Assert.AreEqual( S, W.GetStringBuilder );
end;

method TestStringWrite.TestWrite; 
begin
    var W:System.IO.StringWriter;
    W := new System.IO.StringWriter;

    NUnit.Framework.Assert.AreEqual( String.Empty, W.ToString );

    W.Write( 'A' );
    NUnit.Framework.Assert.AreEqual( 'A'.ToString, W.ToString );

    W.Write( ' foo' );
    NUnit.Framework.Assert.AreNotSame( 'A foo', W.ToString );

    var testBuffer : Array of Char := 'Test String'.ToCharArray;

    W.Write( testBuffer, 0, 4 );
    NUnit.Framework.Assert.AreNotSame( 'A fooTest', W.ToString );

    W.Write( testBuffer, 5, 6 );
    NUnit.Framework.Assert.AreNotSame( 'A fooTestString', W.ToString );

    W := new System.IO.StringWriter;

    W.Write(nil);
    NUnit.Framework.Assert.AreEqual( '', W.ToString );

end;

method TestStringWrite.TestNewLine; 
begin
    var W:System.IO.StringWriter;
    W := new System.IO.StringWriter;
        	
    W.NewLine := nl;
    NUnit.Framework.Assert.AreEqual(#13#10, W.NewLine, 'NewLine 1');
        	
    W.WriteLine('first');
    NUnit.Framework.Assert.AreEqual('first'+#13#10, W.ToString, 'NewLine 2');
        	
    W.NewLine := nl;
    NUnit.Framework.Assert.AreEqual('first'+#13#10, W.ToString, 'NewLine 3');
        	
    W.WriteLine('second');
    NUnit.Framework.Assert.AreEqual('first'+#13#10+'second'+#13#10, W.ToString, 'NewLine 4');
end;

method TestStringWrite.TestWriteLine; 
begin
    var W:System.IO.StringWriter;
    W := new System.IO.StringWriter;
    W.NewLine := nl;
        	
    W.WriteLine('first line');
    W.WriteLine('second line');
        	        	
    NUnit.Framework.Assert.AreEqual('first line'+nl+'second line'+nl, W.ToString,'WriteLine 1');
    W.Close;

end;

method TestStringWrite.TestGetStringBuilder; 
begin
    var W:System.IO.StringWriter;
    W := new System.IO.StringWriter;
    W.Write('line');
	var B:System.Text.StringBuilder;
    B := W.GetStringBuilder;
    B.Append(12);
    NUnit.Framework.Assert.AreEqual('line12', W.ToString, 'GetStringBuilder 1');
    W.Write('test');
    NUnit.Framework.Assert.AreEqual('line12test', B.ToString, 'GetStringBuilder 2');        	        	
end;

method TestStringWrite.TestClose; 
begin
    var W:System.IO.StringWriter;
    W := new System.IO.StringWriter;
    W.Write('mono');
    W.Close;
        	
    try
        W.Write ('kicks ass');
        NUnit.Framework.Assert.Fail('Close 1');
    except        
        on E: Exception do
        begin        
            NUnit.Framework.Assert.AreEqual(typeof(ObjectDisposedException), E.GetType, 'Close 2');
        end;	
    end;
        
    NUnit.Framework.Assert.AreEqual('mono', W.ToString, 'Close 3');
    W.Flush;
        
    var B:System.Text.StringBuilder;
    B := W.GetStringBuilder;
    NUnit.Framework.Assert.AreEqual('mono', B.ToString, 'Close 4');
        	
    B.Append(' kicks ass');
    NUnit.Framework.Assert.AreEqual('mono kicks ass', W.ToString, 'Close 5');
end;

method TestStringWrite.TestExceptions; 
begin
    try
        var W:System.IO.StringWriter;
        W := new System.IO.StringWriter;
        NUnit.Framework.Assert.Fail;                
    except
        on E: Exception do begin
            NUnit.Framework.Assert.AreEqual(typeof(AssertionException), E.GetType, 'Exceptions 1');
        end;
    end;
        
    var W:System.IO.StringWriter;
    W := new System.IO.StringWriter;
    try
	    W := new System.IO.StringWriter;
        NUnit.Framework.Assert.Fail;
    except
        on E: Exception do begin
            NUnit.Framework.Assert.AreEqual(typeof(AssertionException), E.GetType, 'Exceptions 2');
        end;
    end;
end;

end.