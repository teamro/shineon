// The contents of this file are subject to the Mozilla Public License Version 1.1 (the "License"); 
// you may not use this file except in compliance with the License. You may obtain a copy of the 
// License at http://www.mozilla.org/MPL/ 
// 
// Software distributed under the License is distributed on an "AS IS" basis, WITHOUT WARRANTY OF 
// ANY KIND, either express or implied. See the License for the specificlanguage governing rights and 
// limitations under the License.

namespace NUnit.ShineOn.RTL;
// TestFixture to test StringRead

interface
uses
    Nunit.Framework,
    ShineOn.RTL;

type
  [TestFixture]
  TestStringRead = public class(TestCase)
  private
      var nl : String := #13#10;  
  protected
  public
    [Test] 
	method TestReadLine;
    [Test] 
 	method TestPeekRead;
    [Test] 
  	method TestPeekAndReadAtEndOfString;
    [Test] 
	method TestPeekAndReadEmptyString;
    [Test] 
	method TestRead;
    [Test] 
    method TestReadEOL;
    [Test] 
    method TestClose;
    [Test] 
    method TestExceptions;
  end;
  
implementation

method TestStringRead.TestReadLine; 
begin
    var testme : String := 'a' + nl + 'b' + nl + 'c' + nl;
        
	var S:System.IO.StringReader;
    S := new System.IO.StringReader(testme);
	var inputLine : String := 'dummy';
	var lines : Integer := 0;
 	
    inputLine := S.ReadLine; 	
    while (inputLine <> nil) do
    begin	
	    lines := lines + 1;
        inputLine := S.ReadLine;    
	end;
 		
	NUnit.Framework.Assert.AreEqual(3, lines, 'Read number of lines');
end;

method TestStringRead.TestPeekRead; 
begin
    var R:System.IO.StringReader;
    R := new System.IO.StringReader( 'Test String' );

	var c:Char := Char(R.Peek);
	NUnit.Framework.Assert.AreEqual('T', c, 'A1');

	var readChar : Char := Char(R.Read);

	NUnit.Framework.Assert.AreEqual('T', readChar, 'A2');

	c := Char(R.Peek);

	NUnit.Framework.Assert.AreEqual('e', c, 'A3');
end;

method TestStringRead.TestPeekAndReadAtEndOfString; 
begin
    var R:System.IO.StringReader;
    R := new System.IO.StringReader('x');

	var c:Char := Char(R.Peek);
	NUnit.Framework.Assert.AreEqual('x', c, 'A1');

	c := Char(R.Read);
	NUnit.Framework.Assert.AreEqual('x', c, 'A2');

	var i:Integer := R.Peek;
	NUnit.Framework.Assert.AreEqual(-1, i, 'A3');

	i := R.Read;
	NUnit.Framework.Assert.AreEqual(-1, i, 'A4');

	i := R.Peek;
	NUnit.Framework.Assert.AreEqual(-1, i, 'A5');
end;

method TestStringRead.TestPeekAndReadEmptyString; 
begin
    var R:System.IO.StringReader;
    R := new System.IO.StringReader('');

	var i:Integer := R.Peek;
	NUnit.Framework.Assert.AreEqual(-1, i, 'A1');

	i := R.Read;
	NUnit.Framework.Assert.AreEqual(-1, i, 'A2');
end;

method TestStringRead.TestRead; 
begin
    var R:System.IO.StringReader;
    R := new System.IO.StringReader( 'Test String' );

	(* Read from start of string *)
	var test:array of Char := new Char[5];

    var charsRead:Integer := R.Read( test, 0, 5 );

	NUnit.Framework.Assert.AreEqual( 5, charsRead );
	NUnit.Framework.Assert.AreEqual( 'Test ', new String(test)  );

	(* Read to end of string *)
	test := new char[6];
	charsRead := R.Read( test, 0, 6 );
	NUnit.Framework.Assert.AreEqual( 6, charsRead);
	NUnit.Framework.Assert.AreEqual( 'String', new String( test )  );

	(* Read past end of string *)
	test := new char[6];
	R := new System.IO.StringReader( 'Foo' );
	charsRead := R.Read( test, 0, 6 );
	NUnit.Framework.Assert.AreEqual( 3, charsRead );
    var snil := char(0);
	NUnit.Framework.Assert.AreEqual(  'Foo'+snil+snil+snil, new String( test ) );

	(* Check that a new invocation on the empty reader will return 0 *)
	charsRead := R.Read (test, 0, 6);
	NUnit.Framework.Assert.AreEqual(0, charsRead);
end;

method TestStringRead.TestReadEOL; 
begin
    // StringReader reader = new StringReader( "Line1\rLine2\r\nLine3\nLine4" );
    var R:System.IO.StringReader;
    R := new System.IO.StringReader( 'Line1'+nl+'Line2'+nl+'Line3'+nl+'Line4' );

    var test:String := R.ReadLine;
    NUnit.Framework.Assert.AreEqual( 'Line1', test );
    test := R.ReadLine;
    NUnit.Framework.Assert.AreEqual( 'Line2', test );
    test := R.ReadLine;
    NUnit.Framework.Assert.AreEqual( 'Line3', test );
    test := R.ReadLine;
    NUnit.Framework.Assert.AreEqual( 'Line4', test );
end;

method TestStringRead.TestClose; 
begin
    var R:System.IO.StringReader;
    R := new System.IO.StringReader('reader');
    R.Close;
        	
    try
        R.Read;
        Fail;
    except
        on E: Exception do begin
            NUnit.Framework.Assert.AreEqual(typeof (ObjectDisposedException), E.GetType, 'Close 1');
        end;
    end;
        	
    try 
        R.Peek;
        Fail;
    except
        on E: Exception do begin
            NUnit.Framework.Assert.AreEqual(typeof (ObjectDisposedException), E.GetType, 'Close 2');        		             
        end;
    end;
end;

method TestStringRead.TestExceptions; 
begin
    var R:System.IO.StringReader;
        	
    try 
	    R := new System.IO.StringReader(nil);
        Fail;
    except
        on E: Exception do begin
            NUnit.Framework.Assert.AreEqual(typeof (ArgumentNullException), E.GetType, 'Exception 1');
        end;
    end;
        	
    R := new System.IO.StringReader ('this is a test'+nl+'And nothing else');
		
	try
 	    R.Read (nil, 0, 12);
		Fail;
    except
        on E: Exception do begin
		    NUnit.Framework.Assert.AreEqual(typeof (ArgumentNullException), E.GetType, 'Exception 2');
        end;
    end;
end;

end.