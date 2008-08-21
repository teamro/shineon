// The contents of this file are subject to the Mozilla Public License Version 1.1 (the "License"); 
// you may not use this file except in compliance with the License. You may obtain a copy of the 
// License at http://www.mozilla.org/MPL/ 
// 
// Software distributed under the License is distributed on an "AS IS" basis, WITHOUT WARRANTY OF 
// ANY KIND, either express or implied. See the License for the specificlanguage governing rights and 
// limitations under the License.

namespace NUnit.ShineOn.RTL;
// TestFixture to test FileSteam

interface
uses
    System.IO,
    System.Collections,    
    Nunit.Framework,
    ShineOn.RTL;

type
    [TestFixture]
    TestFileStream = public class(TestCase)
  private
      var nl : String := #13#10;  
      var bazFileName : String; // := Path.GetTempPath + 'TestFileStream.txt';
      //var bazFileName : String := Path.Combine ('resources', 'baz');
  protected
  public
    [Setup]
    method Setup;override;
    [TearDown]
    method TearDown;override;
    [Test] 
	[ExpectedException(typeof(IOException))]	// used by an another process
 	method CtorIOException; 
    [Test] 
	method Flush;
    [Test] 
    method Seek;
    [Test] 
    [ExpectedException (typeof(NotSupportedException))]
	method TestWriteVerifyAccessMode; // Write not enabled (read only)
    [Test] 
    [ExpectedException (typeof (NotSupportedException))]
	method TestWriteByteVerifyAccessMode; // Write not enabled (read only)
    [Test] 
	method TestReadVerifyAccessMode; 	// works without [ExpectedException (typeof (NotSupportedException))]
    [Test] 
	method TestReadByteVerifyAccessMode; // workds without [ExpectedException (typeof (NotSupportedException))]

    // add test attribute
    [Test] 
    method TestCtr;
    [Test] 
    method TestCtorExceptions;
    [Test] 
    method TestCtorExceptions2;
    [Test] 
    method TestDefaultProperties;
    [Test] 
    method TestLock;
    [Test] 
    method TestSeek;
    [Test] 
    method TestClose;
           
    // Added to test StreamWriter           
    [Test]  //[ExpectedException(typeof(NullReferenceException))]
    method SaveToFile;
    [Test] 
    method SaveToFileSystemIO;
    
  end;
  
implementation

method TestFileStream.Setup; 
begin
    bazFileName := System.IO.Path.GetTempPath + 'TestFileStream.txt';
    System.IO.File.Delete (bazFileName);
end;

method TestFileStream.TearDown; 
begin
    System.IO.File.Delete (bazFileName);
end;

method TestFileStream.CtorIOException; 
begin
    var path : String := System.IO.Path.GetTempPath + 'CTorIOException.Test';
	if (System.IO.File.Exists (path)) then
	    System.IO.File.Delete (path);
			
	var S:System.IO.FileStream;
    S := new System.IO.FileStream (path, System.IO.FileMode.CreateNew);
	// used by an another process
	var S2:System.IO.FileStream;
    S2 := new System.IO.FileStream (path, System.IO.FileMode.OpenOrCreate);
end;

method TestFileStream.Flush; 
begin
    var path : String := System.IO.Path.GetTempPath + 'FileStreamTest.Flush';
	if (System.IO.File.Exists(path)) then
	    System.IO.File.Delete(path);
			
	var S:System.IO.FileStream;
    S := new System.IO.FileStream (path, System.IO.FileMode.CreateNew, System.IO.FileAccess.ReadWrite, System.IO.FileShare.ReadWrite);
	var S2:System.IO.FileStream;
    S2 := new System.IO.FileStream (path, System.IO.FileMode.Open, System.IO.FileAccess.ReadWrite, System.IO.FileShare.ReadWrite);

    var wbyte : Array of Byte := [1, 2, 3, 4, 5];
    // 		stream.Write (new byte [] {1, 2, 3, 4, 5}, 0, 5);
	//stream.Write (new Byte [1, 2, 3, 4, 5], 0, 5); //}, 0, 5);
	S.Write(wbyte, 0, 5);
						
	var bytes : Array of Byte := new byte [5];
	S2.Read(bytes, 0, 5);
			
	NUnit.Framework.Assert.AreEqual(0, Int32(bytes[0]), 'test#01');
	NUnit.Framework.Assert.AreEqual(0, Int32(bytes[1]), 'test#02');
	NUnit.Framework.Assert.AreEqual(0, Int32(bytes[2]), 'test#03');
	NUnit.Framework.Assert.AreEqual(0, Int32(bytes[3]), 'test#04');
			
	S.Flush ();
	S2.Read (bytes, 0, 5);			
	NUnit.Framework.Assert.AreEqual(1, Int32(bytes[0]), 'test#05');
	NUnit.Framework.Assert.AreEqual(2, Int32(bytes[1]), 'test#06');
	NUnit.Framework.Assert.AreEqual(3, Int32(bytes[2]), 'test#07');
	NUnit.Framework.Assert.AreEqual(4, Int32(bytes[3]), 'test#08');
	S.Close;
	S2.Close;
			
	if (System.IO.File.Exists(path)) then
	    System.IO.File.Delete(path);			
end;

method TestFileStream.Seek; 
begin
    var path : String := System.IO.Path.GetTempPath + 'Seek.Test';
    if (System.IO.File.Exists(path)) then
        System.IO.File.Delete(path);
                	
    var S:System.IO.FileStream;
    S := new System.IO.FileStream(path, System.IO.FileMode.CreateNew, System.IO.FileAccess.ReadWrite, System.IO.FileShare.ReadWrite);
    var S2:System.IO.FileStream;
    S2 := new System.IO.FileStream (path, System.IO.FileMode.Open, System.IO.FileAccess.ReadWrite, System.IO.FileShare.ReadWrite);
           
    var wbyte : Array of Byte := [1, 2, 3, 4, 5, 6, 7, 8, 10];
    //stream.Write (new byte [] {1, 2, 3, 4, 5, 6, 7, 8, 10}, 0, 9);
	S.Write (wbyte, 0, 9);
    NUnit.Framework.Assert.AreEqual(5, S2.Seek (5, System.IO.SeekOrigin.Begin), 'test#01');
    NUnit.Framework.Assert.AreEqual(-1, S2.ReadByte, 'test#02');
                	
    NUnit.Framework.Assert.AreEqual(2, S2.Seek (-3, System.IO.SeekOrigin.Current), 'test#03');
    NUnit.Framework.Assert.AreEqual(-1, S2.ReadByte, 'test#04');
                	
    NUnit.Framework.Assert.AreEqual(12, S.Seek (3, System.IO.SeekOrigin.Current), 'test#05');
    NUnit.Framework.Assert.AreEqual(-1, S.ReadByte, 'test#06');

    NUnit.Framework.Assert.AreEqual(5, S.Seek (-7, System.IO.SeekOrigin.Current), 'test#07');
    NUnit.Framework.Assert.AreEqual(6, S.ReadByte, 'test#08');

    NUnit.Framework.Assert.AreEqual(5, S2.Seek (5, System.IO.SeekOrigin.Begin), 'test#09');
    NUnit.Framework.Assert.AreEqual(6, S2.ReadByte, 'test#10');
                	                	
    S.Close;
    S2.Close;

    if (System.IO.File.Exists(path)) then
        System.IO.File.Delete(path);                	
end;

method TestFileStream.TestWriteVerifyAccessMode; 
begin
    var bazFileStream:System.IO.FileStream := nil;
	var buffer : Array of Byte;

	try
        buffer := System.Text.Encoding.ASCII.GetBytes ('test');
		bazFileStream := new System.IO.FileStream (bazFileName, System.IO.FileMode.OpenOrCreate, System.IO.FileAccess.Read);
		bazFileStream.Write (buffer, 0, buffer.Length);
    finally
        if (bazFileStream <> nil) then
		    bazFileStream.Close;
    end;
end;

method TestFileStream.TestWriteByteVerifyAccessMode; 
begin
    var bazFileStream : System.IO.FileStream := nil;

	try
	    bazFileStream := new System.IO.FileStream (bazFileName, System.IO.FileMode.OpenOrCreate, System.IO.FileAccess.Read);
		bazFileStream.WriteByte(Byte.MinValue);
    finally
	    if (bazFileStream <> nil) then
		    bazFileStream.Close;
    end;
end;

method TestFileStream.TestReadVerifyAccessMode; 
begin
    var bazFileStream : System.IO.FileStream := nil;
	var buffer : Array of Byte := new byte [100];

	try
        bazFileStream := new System.IO.FileStream (bazFileName, System.IO.FileMode.OpenOrCreate, System.IO.FileAccess.Write);
		bazFileStream.Read (buffer, 0, buffer.Length);
    except
	    if (bazFileStream <> nil) then
		    bazFileStream.Close;
    end;
end;

method TestFileStream.TestReadByteVerifyAccessMode; 
begin
    var bazFileStream : System.IO.FileStream := nil;

	try
	    bazFileStream := new System.IO.FileStream (bazFileName, System.IO.FileMode.OpenOrCreate, System.IO.FileAccess.Write);
		var readByte : Integer := bazFileStream.ReadByte;
    except
	    if (bazFileStream <> nil) then
		    bazFileStream.Close;
    end;
end;

method TestFileStream.TestCtr; 
begin
    var S:System.IO.FileStream;
    S := new System.IO.FileStream ('testfilestream.tmp.1', System.IO.FileMode.&Create);
    S.Close;
    System.IO.File.Delete ('testfilestream.tmp.1');
end;

method TestFileStream.TestCtorExceptions; 
begin
    var S:System.IO.FileStream;
                	
    try 
        S := new System.IO.FileStream ('', System.IO.FileMode.&Create);
        Fail;
    except
        on E: Exception do begin
            NUnit.Framework.Assert.AreEqual(typeof (ArgumentException), E.GetType, 'test#01');                		
        end;
    end;

    try 
        S := new System.IO.FileStream (nil, System.IO.FileMode.&Create);
        Fail;
    except
        on E: Exception do begin
            NUnit.Framework.Assert.AreEqual(typeof (ArgumentNullException), E.GetType, 'test#02');                		
        end;
    end;
                	
    try 
        if (System.IO.File.Exists ('thisfileshouldnotexists.test')) then
            System.IO.File.Delete ('thisfileshouldnotexists.test');
                		
        S := new System.IO.FileStream ('thisfileshouldnotexists.test', System.IO.FileMode.Open);
        Fail;
    except
        on E: Exception do begin
            NUnit.Framework.Assert.AreEqual(typeof (System.IO.FileNotFoundException), E.GetType, 'test#03');
        end;
    end;

    try 
        if (System.IO.File.Exists ('thisfileshouldNOTexists.test')) then
            System.IO.File.Delete ('thisfileshouldNOTexists.test');
                
        S := new System.IO.FileStream ('thisfileshouldNOTexists.test', System.IO.FileMode.Truncate);
        Fail;
    except
        on E: Exception do begin
            NUnit.Framework.Assert.AreEqual(typeof (System.IO.FileNotFoundException), E.GetType, 'test#04');
        end;
    end;

    try 
        S := new System.IO.FileStream ('thisfileshouldexists.test', System.IO.FileMode.CreateNew);
        S.Close;
        S := nil;
        S := new System.IO.FileStream ('thisfileshouldexists.test', System.IO.FileMode.CreateNew);
        Fail;
    except
        on E: Exception do begin
            if (System.IO.File.Exists ('thisfileshouldexists.test')) then // remove file
                System.IO.File.Delete ('thisfileshouldexists.test');
                  
            NUnit.Framework.Assert.AreEqual(typeof (System.IO.IOException), E.GetType, 'test#04');
        end;
    end;
                	
    try 
        if (System.IO.Directory.Exists ('thisDicrectoryShouldNotExists')) then
            System.IO.Directory.Delete ('thisDicrectoryShouldNotExists');                		
                
      S := new System.IO.FileStream ('thisDicrectoryShouldNotExists/eitherthisfile.test', System.IO.FileMode.CreateNew);
      Fail;
    except
        on E: Exception do begin
            NUnit.Framework.Assert.AreEqual(typeof (System.IO.DirectoryNotFoundException), E.GetType, 'test#05');
        end;
    end;
                	
    try 
        S := new System.IO.FileStream ('test.test.test', System.IO.FileMode.Append or System.IO.FileMode.CreateNew);
        Fail;
    except
        on E: Exception do begin
            NUnit.Framework.Assert.AreEqual(typeof (ArgumentOutOfRangeException), E.GetType, 'test#08');
        end;
    end;
                	
    try 
        S := new System.IO.FileStream ('test.test.test', System.IO.FileMode.Append or System.IO.FileMode.Open);
        Fail;
    except
        on E: Exception do begin
            NUnit.Framework.Assert.AreEqual(typeof (ArgumentOutOfRangeException), E.GetType, 'test#09');
        end;
    end;
end;

method TestFileStream.TestCtorExceptions2; 
begin
    var S:System.IO.FileStream;
                	
    try 
      S := new System.IO.FileStream ('.test.test.test.2', System.IO.FileMode.CreateNew, System.IO.FileAccess.Read, System.IO.FileShare.None or System.IO.FileShare.Inheritable);
      Fail;
    except
        on E: Exception do begin
            NUnit.Framework.Assert.AreEqual(typeof (ArgumentOutOfRangeException), E.GetType, 'test#01');
        end;
    end;

    try 
      S := new System.IO.FileStream ('.test.test.test.2', System.IO.FileMode.CreateNew, System.IO.FileAccess.Read, System.IO.FileShare.None or System.IO.FileShare.Write);
      Fail;
    except
        on E: Exception do begin
            // FileMode.CreateNew && FileAccess.Read
            NUnit.Framework.Assert.AreEqual(typeof (ArgumentException), E.GetType, 'test#02');
        end;
    end;
                	
    try 
      S := new System.IO.FileStream ('.test.test.test.2', System.IO.FileMode.CreateNew, System.IO.FileAccess.Read, System.IO.FileShare.Inheritable or System.IO.FileShare.ReadWrite);
      Fail;
    except
        on E: Exception do begin
            NUnit.Framework.Assert.AreEqual(typeof (ArgumentOutOfRangeException), E.GetType, 'test#03');
        end;
    end;
                	
    try 
      S := new System.IO.FileStream ('.test.test.test.2', System.IO.FileMode.Truncate, System.IO.FileAccess.Read);
      Fail;
    except
        on E: Exception do begin
            // FileMode.Truncate && FileAccess.Read
            NUnit.Framework.Assert.AreEqual(typeof (ArgumentException), E.GetType, 'test#04');
        end;
    end;
                	
    try 
      S := new System.IO.FileStream (new IntPtr (12), System.IO.FileAccess.Read);
      Fail;
    except
        on E: Exception do begin
            // Invalid handle
            NUnit.Framework.Assert.AreEqual(typeof (AssertionException), E.GetType, 'test#05');
        end;
    end;
                	
    try 
      S := new System.IO.FileStream ('.test.test.test.2', System.IO.FileMode.Truncate, System.IO.FileAccess.Read, System.IO.FileShare.ReadWrite, -1);
      Fail;
    except
        on E: Exception do begin
            // FileMode.Truncate && FileAccess.Read
            NUnit.Framework.Assert.AreEqual(typeof (ArgumentOutOfRangeException), E.GetType, 'test#06');
        end;
    end;
end;

method TestFileStream.TestDefaultProperties; 
begin
    var S:System.IO.FileStream;
    S := new System.IO.FileStream ('testfilestream.tmp.2', System.IO.FileMode.&Create);
                	
    NUnit.Framework.Assert.AreEqual(true, S.CanRead, 'test#01');
    NUnit.Framework.Assert.AreEqual(true, S.CanSeek, 'test#02');
    NUnit.Framework.Assert.AreEqual(true, S.CanWrite, 'test#03');
    NUnit.Framework.Assert.AreEqual(false, S.IsAsync, 'test#04');
    NUnit.Framework.Assert.AreEqual(true, S.Name.EndsWith ('testfilestream.tmp.2'), 'test#05');
    NUnit.Framework.Assert.AreEqual(0, S.Position, 'test#06');
    NUnit.Framework.Assert.AreEqual('System.IO.FileStream', S.ToString, 'test#07');                	
    S.Close;
    System.IO.File.Delete('testfilestream.tmp.2');

    S := new System.IO.FileStream ('testfilestream.tmp.2', System.IO.FileMode.OpenOrCreate, System.IO.FileAccess.Read);
    NUnit.Framework.Assert.AreEqual(true, S.CanRead, 'test#08');
    NUnit.Framework.Assert.AreEqual(true, S.CanSeek, 'test#09');
    NUnit.Framework.Assert.AreEqual(false, S.CanWrite, 'test#10');
    NUnit.Framework.Assert.AreEqual(false, S.IsAsync, 'test#11');
    NUnit.Framework.Assert.AreEqual(true, S.Name.EndsWith ('testfilestream.tmp.2'), 'test#12');
    NUnit.Framework.Assert.AreEqual(0, S.Position, 'test#13');
    NUnit.Framework.Assert.AreEqual('System.IO.FileStream', S.ToString, 'test#14');                	
    S.Close;
                	
    S := new System.IO.FileStream ('testfilestream.tmp.2', System.IO.FileMode.Truncate, System.IO.FileAccess.Write, System.IO.FileShare.ReadWrite);
    NUnit.Framework.Assert.AreEqual(false, S.CanRead, 'test#15');
    NUnit.Framework.Assert.AreEqual(true, S.CanSeek, 'test#16');
    NUnit.Framework.Assert.AreEqual(true, S.CanWrite, 'test#17');
    NUnit.Framework.Assert.AreEqual(false, S.IsAsync, 'test#18');
    NUnit.Framework.Assert.AreEqual(true, S.Name.EndsWith('testfilestream.tmp.2'), 'test#19');
    NUnit.Framework.Assert.AreEqual(0, S.Position, 'test#20');
    NUnit.Framework.Assert.AreEqual('System.IO.FileStream', S.ToString, 'test#21');                	
    S.Close;
    System.IO.File.Delete('testfilestream.tmp.2');                	
end;

method TestFileStream.TestLock; 
begin
    if (System.IO.File.Exists ('.testFileStream.Test.1')) then
  	    System.IO.File.Delete ('.testFileStream.Test.1');
                	
    var S:System.IO.FileStream;
    S := new System.IO.FileStream ('.testFileStream.Test.1', System.IO.FileMode.CreateNew, System.IO.FileAccess.ReadWrite);
  
    var wbyte : Array of Byte := [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    //stream.Write (new Byte [] {0,1,2,3,4,5,6,7,8,9,10}, 0, 10);                              	
    S.Write (wbyte, 0, 10);
    S.Close;

    S := new System.IO.FileStream ('.testFileStream.Test.1', System.IO.FileMode.Open, System.IO.FileAccess.ReadWrite);
                	
    S.Lock (0, 5);
                	
    var S2 : System.IO.FileStream;
    S2 := new System.IO.FileStream ('.testFileStream.Test.1', System.IO.FileMode.Open, System.IO.FileAccess.Read, System.IO.FileShare.ReadWrite);
                     	
    var bytes : Array of Byte := new byte [5];
    try 
        S2.Read (bytes, 0, 5);
        Fail;
    except
        on E: Exception do begin
            // locked
            NUnit.Framework.Assert.AreEqual(typeof (System.IO.IOException), E.GetType, 'test#01');
        end;
    end;
               		                
    S2.Seek (5, System.IO.SeekOrigin.Begin);               		
    S2.Read (bytes, 0, 5);                		
                	
    NUnit.Framework.Assert.AreEqual(5, Int32(bytes[0]), 'test#02');
    NUnit.Framework.Assert.AreEqual(6, Int32(bytes[1]), 'test#03');                	
    NUnit.Framework.Assert.AreEqual(7, Int32(bytes[2]), 'test#04'); 
    NUnit.Framework.Assert.AreEqual(8, Int32(bytes[3]), 'test#05');
    NUnit.Framework.Assert.AreEqual(9, Int32(bytes[4]), 'test#06');
                	
    S.Unlock (0,5);
    S2.Seek (0, System.IO.SeekOrigin.Begin);	
    S2.Read (bytes, 0, 5);
                	
    NUnit.Framework.Assert.AreEqual(0, Int32(bytes[0]), 'test#02');
    NUnit.Framework.Assert.AreEqual(1, Int32(bytes[1]), 'test#03');                	
    NUnit.Framework.Assert.AreEqual(2, Int32(bytes[2]), 'test#04'); 
    NUnit.Framework.Assert.AreEqual(3, Int32(bytes[3]), 'test#05');
    NUnit.Framework.Assert.AreEqual(4, Int32(bytes[4]), 'test#06');
                	                	
    S.Close ();
    S2.Close ();
                	
    if (System.IO.File.Exists ('.testFileStream.Test.1')) then
  	    System.IO.File.Delete ('.testFileStream.Test.1');
end;

method TestFileStream.TestSeek; 
begin
    if (System.IO.File.Exists ('.testFileStream.Test.2')) then
  	    System.IO.File.Delete ('.testFileStream.Test.2');
			
    var S:System.IO.FileStream;
    S := new System.IO.FileStream ('.testFileStream.Test.2', System.IO.FileMode.CreateNew, System.IO.FileAccess.ReadWrite, System.IO.FileShare.ReadWrite);

    var wbyte : Array of Byte := [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    //stream.Write (new byte[] {1, 2, 3, 4, 5, 6, 7, 8 , 9, 10}, 0, 10);
    S.Write (wbyte, 0, 10);
                	
    S.Seek (5, System.IO.SeekOrigin.End);
    NUnit.Framework.Assert.AreEqual(-1, S.ReadByte, 'test#01');

    S.Seek(-5, System.IO.SeekOrigin.End);
    NUnit.Framework.Assert.AreEqual(6, S.ReadByte, 'test#02');
                	
    try 
        S.Seek (-11, System.IO.SeekOrigin.End);
        Fail;
    except
        on E: Exception do begin
            NUnit.Framework.Assert.AreEqual(typeof (System.IO.IOException), E.GetType, 'test#03');
        end;
    end;
                	
    S.Seek (19, System.IO.SeekOrigin.Begin);
    NUnit.Framework.Assert.AreEqual(-1, S.ReadByte, 'test#04');

    S.Seek (1, System.IO.SeekOrigin.Begin);
    NUnit.Framework.Assert.AreEqual(2, S.ReadByte, 'test#05');
                	
    S.Seek (3, System.IO.SeekOrigin.Current);
    NUnit.Framework.Assert.AreEqual(6, S.ReadByte, 'test#06');

    S.Seek (-2, System.IO.SeekOrigin.Current);
    NUnit.Framework.Assert.AreEqual(5, S.ReadByte, 'test#07');

    S.Flush;
    S.Close;
    if (System.IO.File.Exists ('.testFileStream.Test.2')) then
        System.IO.File.Delete ('.testFileStream.Test.2');
end;

method TestFileStream.TestClose; 
begin
    if (System.IO.File.Exists ('.testFileStream.Test.3')) then
  	    System.IO.File.Delete ('.testFileStream.Test.3');
                	
    var S:System.IO.FileStream;
    S := new System.IO.FileStream ('.testFileStream.Test.3', System.IO.FileMode.CreateNew, System.IO.FileAccess.ReadWrite);
  
    var wbyte : Array of Byte := [1, 2, 3, 4];
    //stream.Write (new byte [] {1, 2, 3, 4}, 0, 4);
    S.Write (wbyte, 0, 4);
    S.ReadByte;                	
    S.Close;
			
    try 
        S.ReadByte;
	    Fail;
    except
        on E: Exception do begin
            NUnit.Framework.Assert.AreEqual(typeof (ObjectDisposedException), E.GetType, 'test#01');
        end;
    end;
			
    try 
        S.WriteByte(64);
	    Fail;
    except
        on E: Exception do begin
            NUnit.Framework.Assert.AreEqual(typeof (ObjectDisposedException), E.GetType, 'test#02');
        end;
    end;
			
    try 
        S.Flush;
	    Fail;
    except
        on E: Exception do begin
            NUnit.Framework.Assert.AreEqual(typeof (ObjectDisposedException), E.GetType, 'test#03');
        end;
    end;
			
    try 
        var l : Int64 := S.Length;
        Fail;
    except
        on E: Exception do begin
            NUnit.Framework.Assert.AreEqual(typeof (ObjectDisposedException), E.GetType, 'test#04');
        end;
    end;
			
    try 
        var l : Int64 := S.Position;
        Fail;
    except
        on E: Exception do begin
            NUnit.Framework.Assert.AreEqual(typeof (ObjectDisposedException), E.GetType, 'test#05');
        end;
    end;

    NUnit.Framework.Assert.AreEqual(false, S.CanRead, 'test#06');
    NUnit.Framework.Assert.AreEqual(false, S.CanSeek, 'test#07');
    NUnit.Framework.Assert.AreEqual(false, S.CanWrite, 'test#08');                	
    NUnit.Framework.Assert.AreEqual(true, S.Name.EndsWith ('.testFileStream.Test.3'), 'test#09');
                	
    if (System.IO.File.Exists ('.testFileStream.Test.3')) then
        System.IO.File.Delete ('.testFileStream.Test.3');
end;

method TestFileStream.SaveToFile; 
begin
    var SFilename:String := System.IO.Path.GetTempPath + 'SaveToFile.txt'; 
        
    if (System.IO.File.Exists (SFilename)) then
        System.IO.File.Delete (SFilename);

    var SL:TStringList;    
    SL := TStringList.Create;    
    
    try
        SL.Add('This is a test of StringList SaveToFile');
        SL.Add('[Test]');
        SL.Add('Int1=1');    
                
        SL.SaveToFile(SFilename);

    except
        on E: Exception do begin
            NUnit.Framework.Assert.AreEqual(typeof (System.Exception), E.GetType, 'SaveToFile#01');
        end;
    finally
        SL.free;                
    end;
        
end;

method TestFileStream.SaveToFileSystemIO; 
begin
    var SIOFilename := System.IO.Path.GetTempPath + 'SaveToStream.txt'; 
    
    if (System.IO.File.Exists (SIOFilename)) then
        System.IO.File.Delete (SIOFilename);

    var AL:System.Collections.ArrayList;
    AL := new System.Collections.ArrayList;
        
    var FS:System.IO.FileStream;
    var T:System.IO.StreamWriter;
                
    try
        AL.Add('This is a test of ArrayList SaveToStream');
        AL.Add('[Test]');
        AL.Add('Int1=1');    
                
        FS := new System.IO.FileStream(SIOFilename, System.IO.FileMode.&Create, System.IO.FileAccess.Write);
                
        T := new System.IO.StreamWriter(FS);     
                   
        for i:Integer := 0 to AL.Count-1do
        begin    
            T.WriteLine(AL[i]);
        end;        

    except
        on E: Exception do begin
            NUnit.Framework.Assert.AreEqual(typeof (System.Exception), E.GetType, 'SaveToFile#01');
        end;
    finally
        T.Flush;
        T.Close;            
        FS.Close;
    end;
    
end;

end.
