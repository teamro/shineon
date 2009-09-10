// The contents of this file are subject to the Mozilla Public License Version 1.1 (the "License"); 
// you may not use this file except in compliance with the License. You may obtain a copy of the 
// License at http://www.mozilla.org/MPL/ 
// 
// Software distributed under the License is distributed on an "AS IS" basis, WITHOUT WARRANTY OF 
// ANY KIND, either express or implied. See the License for the specificlanguage governing rights and 
// limitations under the License.

// History:
//
// 2006-03-19   :   Corwin Burgess    : Converted to Chrome from DateTime
// 2006-04-09   :   Corwin Burgess    : Changes to convert TDateTime to record

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
  TDateTimeTest = public class(TestCase)
  private
      var oldcult:CultureInfo;
		var myTicks:Array of Int64 := [
											 631501920000000000,	// 25 Feb 2002 - 00:00:00
											 631502475130080000,	// 25 Feb 2002 - 15:25:13,8
											 631502115130080000,	// 25 Feb 2002 - 05:25:13,8
											 631502115000000000,	// 25 Feb 2002 - 05:25:00
											 631502115130000000,	// 25 Feb 2002 - 05:25:13
											 631502079130000000,	// 25 Feb 2002 - 04:25:13
											 629197085770000000	// 06 Nov 1994 - 08:49:37 
										 ];
  
  protected
  public
  	[SetUp]
 		method SetUp;override;
		[TearDown]
		method TearDown;override;
		[Test] // [Ignore('Ignore this test')]
		method TestCtors;
		[Test] // [Ignore('Ignore this test')]
 		method TestToString;
		[Test] // [Ignore('Ignore this test')]
		method TestParse;
		[Test] // [Ignore('Ignore this test')]
		method TestTicks;
    constructor;		
  end;
  
implementation

constructor TDateTimeTest; 
begin
end;

method TDateTimeTest.SetUp; 
begin
  // the current culture determines the result of formatting
	oldcult := Thread.CurrentThread.CurrentCulture;
	Thread.CurrentThread.CurrentCulture := new CultureInfo ('');
end;

method TDateTimeTest.TearDown; 
begin
  Thread.CurrentThread.CurrentCulture := oldcult;		
end;

method TDateTimeTest.TestCtors; 
begin
  var t1:DateTime := new DateTime (2002,2,25);
  var td1:TDateTime := new TDateTime (2002,2,25,0,0,0,0);
  // Year, Month, Day, Hour, Minute, Second, MSec
 	NUnit.Framework.Assert.AreEqual(myTicks[0], td1.Ticks, 'A01');
	var t2:DateTime := new DateTime (2002,2,25,15,25,13,8);
	var td2:TDateTime := new TDateTime (2002,2,25,15,25,13,8);
	NUnit.Framework.Assert.AreEqual(myTicks[1], td2.Ticks, 'A02');
 	Console.Out.WriteLine('A03: expected: {0} was: {1}', myTicks[0], td2.Date.Ticks);
 	//NUnit.Framework.Assert.AreEqual(myTicks[0], td2.Date.Ticks, 'A03');
	NUnit.Framework.Assert.AreEqual(2002, td2.Year, 'A04');
	NUnit.Framework.Assert.AreEqual(2, td2.Month, 'A05');
	NUnit.Framework.Assert.AreEqual(25, td2.Day, 'A06');
	NUnit.Framework.Assert.AreEqual(15, td2.Hour, 'A07');
	NUnit.Framework.Assert.AreEqual(25, td2.Minute, 'A08');
	NUnit.Framework.Assert.AreEqual(13, td2.Second, 'A09');
	NUnit.Framework.Assert.AreEqual(8, td2.Msec, 'A10');
	var td3:TDateTime := new TDateTime (2002,2,25,5,25,13,8);
	NUnit.Framework.Assert.AreEqual(myTicks[2], td3.Ticks, 'A11');
  // added	
  NUnit.Framework.Assert.AreEqual(t1.Year, td1.Year, 'A12');
  NUnit.Framework.Assert.AreEqual(t1.Month, td1.Month, 'A13');
  NUnit.Framework.Assert.AreEqual(t1.Day, td1.Day, 'A14');
  NUnit.Framework.Assert.AreEqual(t2.Year, td2.Year, 'A15');
  NUnit.Framework.Assert.AreEqual(t2.Month, td2.Month, 'A16');
  NUnit.Framework.Assert.AreEqual(t2.Day, td2.Day, 'A17');
  NUnit.Framework.Assert.AreEqual(t2.Hour, td2.Hour, 'A18');
  NUnit.Framework.Assert.AreEqual(t2.Minute, td2.Minute, 'A19');
  NUnit.Framework.Assert.AreEqual(t2.Second, td2.Second, 'A20');
     
end;

method TDateTimeTest.TestToString; 
begin
	var dt1:DateTime := new DateTime(2002, 02, 25, 15, 25, 13, 8); // 1
	var dt2:DateTime := new DateTime(2002, 02, 25, 05, 25, 13, 8); // 2
	var td1:TDateTime := new TDateTime(2002, 02, 25, 15, 25, 13, 8);
	var td2:TDateTime := new TDateTime(2002, 02, 25, 05, 25, 13, 8);

  var IFP:IFormatProvider;
    
	NUnit.Framework.Assert.AreEqual(dt1.ToString('d', IFP), td1.ToString ('d', IFP), 'B01');
	NUnit.Framework.Assert.AreEqual(dt1.ToString('D',IFP), td1.ToString ('D', IFP), 'B02');
	NUnit.Framework.Assert.AreEqual(dt1.ToString('f', IFP), td1.ToString ('f', IFP), 'B03');
	NUnit.Framework.Assert.AreEqual(dt1.ToString('F', IFP), td1.ToString ('F', IFP), 'B04');
	NUnit.Framework.Assert.AreEqual(dt1.ToString('g', IFP), td1.ToString ('g', IFP), 'B05');
	NUnit.Framework.Assert.AreEqual(dt1.ToString('G', IFP), td1.ToString ('G', IFP), 'B06');
	NUnit.Framework.Assert.AreEqual(dt1.ToString('m', IFP), td1.ToString ('m', IFP), 'B07');
	NUnit.Framework.Assert.AreEqual(dt1.ToString('M', IFP), td1.ToString ('M', IFP), 'B08');
	NUnit.Framework.Assert.AreEqual(dt1.ToString('r', IFP), td1.ToString ('r', IFP), 'B09');
	NUnit.Framework.Assert.AreEqual(dt1.ToString('R', IFP), td1.ToString ('R', IFP), 'B10');
	NUnit.Framework.Assert.AreEqual(dt1.ToString('s', IFP), td1.ToString ('s', IFP), 'B11');
	NUnit.Framework.Assert.AreEqual(dt1.ToString('t', IFP), td1.ToString ('t', IFP), 'B12');
	NUnit.Framework.Assert.AreEqual(dt1.ToString('T', IFP), td1.ToString ('T', IFP), 'B13');
	NUnit.Framework.Assert.AreEqual(dt1.ToString('u', IFP), td1.ToString ('u', IFP), 'B14');
  // no ToUniversalTime in TDateTime
	//NUnit.Framework.Assert.AreEqual(dt1.ToUniversalTime.ToString('U', IFP), td1.ToUniversalTime.ToString ('U', IFP), 'B15');
	NUnit.Framework.Assert.AreEqual(dt1.ToString('y', IFP), td1.ToString ('y', IFP), 'B16');
	NUnit.Framework.Assert.AreEqual(dt1.ToString('Y', IFP), td1.ToString ('Y', IFP), 'B17');

	// Custom patterns
	NUnit.Framework.Assert.AreEqual('25', td1.ToString ('%d', IFP), 'C01');
	NUnit.Framework.Assert.AreEqual('25', td1.ToString ('dd', IFP), 'C02');
	NUnit.Framework.Assert.AreEqual('Mon', td1.ToString ('ddd', IFP), 'C03');
	NUnit.Framework.Assert.AreEqual('Monday', td1.ToString ('dddd', IFP), 'C04');
	NUnit.Framework.Assert.AreEqual(string('2'), td1.ToString ('%M', IFP), 'C05');
	NUnit.Framework.Assert.AreEqual('02', td1.ToString ('MM', IFP), 'C06');
	NUnit.Framework.Assert.AreEqual('Feb', td1.ToString ('MMM', IFP), 'C07');
	NUnit.Framework.Assert.AreEqual('February', td1.ToString ('MMMM', IFP), 'C08');
	NUnit.Framework.Assert.AreEqual(string('2'), td1.ToString ('%y', IFP), 'C09');
	NUnit.Framework.Assert.AreEqual('02', td1.ToString ('yy', IFP), 'C10');
	NUnit.Framework.Assert.AreEqual('2002', td1.ToString ('yyyy', IFP), 'C11');
 	Console.Out.WriteLine('C12: expected: {0} was: {1}', string('5'), td1.ToString ('%h', IFP));
	//NUnit.Framework.Assert.AreEqual(string('5'), td1.ToString ('%h', IFP), 'C12');
 	Console.Out.WriteLine('C13: expected: {0} was: {1}', '05', td1.ToString ('hh', IFP));
	//NUnit.Framework.Assert.AreEqual('05', td1.ToString ('hh', IFP), 'C13');
 	Console.Out.WriteLine('C14: expected: {0} was: {1}', string('3'), td2.ToString ('%h', IFP));
	//NUnit.Framework.Assert.AreEqual(string('3'), td2.ToString ('%h', IFP), 'C14');
 	Console.Out.WriteLine('C15: expected: {0} was: {1}', '03', td2.ToString ('hh', IFP));
 	//NUnit.Framework.Assert.AreEqual('03', td2.ToString ('hh', IFP), 'C15');
 	Console.Out.WriteLine('C16: expected: {0} was: {1}', '15', td2.ToString ('%H', IFP));
	//NUnit.Framework.Assert.AreEqual('15', td2.ToString ('%H', IFP), 'C16');
 	Console.Out.WriteLine('C17: expected: {0} was: {1}', '15', td2.ToString ('HH', IFP));
	//NUnit.Framework.Assert.AreEqual('15', td2.ToString ('HH', IFP), 'C17');
	NUnit.Framework.Assert.AreEqual('25', td2.ToString ('%m', IFP), 'C18');
	NUnit.Framework.Assert.AreEqual('25', td2.ToString ('mm', IFP), 'C19');
	NUnit.Framework.Assert.AreEqual('13', td2.ToString ('%s', IFP), 'C20');
	NUnit.Framework.Assert.AreEqual('13', td2.ToString ('ss', IFP), 'C21');
 	Console.Out.WriteLine('C22: expected: {0} was: {1}', string('A'), td1.ToString ('%t', IFP));
	//NUnit.Framework.Assert.AreEqual(string('A'), td1.ToString ('%t', IFP), 'C22');
 	Console.Out.WriteLine('C23: expected: {0} was: {1}', string('P'), td2.ToString ('%t', IFP));
	//NUnit.Framework.Assert.AreEqual(string('P'), td2.ToString ('%t', IFP), 'C23');
 	Console.Out.WriteLine('C24: expected: {0} was: {1}', 'AM', td1.ToString ('tt', IFP));
	//NUnit.Framework.Assert.AreEqual('AM', td1.ToString ('tt', IFP), 'C24');
 	Console.Out.WriteLine('C25: expected: {0} was: {1}', 'PM', td2.ToString ('tt', IFP));
	//NUnit.Framework.Assert.AreEqual('PM', td2.ToString ('tt', IFP), 'C25');
 	
	var offset:Int64 := TimeZone.CurrentTimeZone.GetUtcOffset(td1).Ticks div 36000000000;
	NUnit.Framework.Assert.AreEqual(offset.ToString('+#;-#;0'), td1.ToString ('%z', IFP), 'C26');
	NUnit.Framework.Assert.AreEqual(offset.ToString('+00;-00;00'), td1.ToString ('zz', IFP), 'C27');
	NUnit.Framework.Assert.AreEqual(offset.ToString('+00;-00;00') + ':00', td1.ToString ('zzz', IFP), 'C28');
	NUnit.Framework.Assert.AreEqual(' : ', td1.ToString (' : ', IFP), 'C29');
	NUnit.Framework.Assert.AreEqual(' / ', td1.ToString (' / ', IFP), 'C30');
	NUnit.Framework.Assert.AreEqual(' yyy ', td1.ToString (' ''yyy'' ', IFP), 'C31');
 	NUnit.Framework.Assert.AreEqual(' d', td1.ToString (' \d', IFP), 'C32');
end;

method TDateTimeTest.TestParse; 
begin
  // Standard patterns
	var td1:TDateTime := TDateTime.Parse ('02/25/2002');
	NUnit.Framework.Assert.AreEqual (myTicks[0], td1.Ticks, 'H00');
	try 
	  td1 := TDateTime.Parse ('2002-02-25');
	except
	  on E: Exception do begin
      Fail ('Unexpected exception. E=' + E.Message);
	  end;
  end;	  
	NUnit.Framework.Assert.AreEqual (myTicks[0], td1.Ticks, 'H01');
	td1 := TDateTime.Parse ('Monday, 25 February 2002');
	NUnit.Framework.Assert.AreEqual (myTicks[0], td1.Ticks, 'H02');
	td1 := TDateTime.Parse ('Monday, 25 February 2002 05:25');
	NUnit.Framework.Assert.AreEqual (myTicks[3], td1.Ticks, 'H03');
	td1 := TDateTime.Parse ('Monday, 25 February 2002 05:25:13');
	NUnit.Framework.Assert.AreEqual (myTicks[4], td1.Ticks, 'H04');
	td1 := TDateTime.Parse ('02/25/2002 05:25');
	NUnit.Framework.Assert.AreEqual (myTicks[3], td1.Ticks, 'H05');
	td1 := TDateTime.Parse ('02/25/2002 05:25:13');
	NUnit.Framework.Assert.AreEqual (myTicks[4], td1.Ticks, 'H06');
	td1 := TDateTime.Parse ('2002-02-25 04:25:13Z');
	td1 := TimeZone.CurrentTimeZone.ToUniversalTime(td1);
	NUnit.Framework.Assert.AreEqual (2002, td1.Year, 'H07a');
	NUnit.Framework.Assert.AreEqual (02, td1.Month, 'H07b');
	NUnit.Framework.Assert.AreEqual (25, td1.Day, 'H07c');
	NUnit.Framework.Assert.AreEqual (04, td1.Hour, 'H07d');
	NUnit.Framework.Assert.AreEqual (25, td1.Minute, 'H07e');
	NUnit.Framework.Assert.AreEqual (13, td1.Second, 'H07f');

	var td2:TDateTime := new TDateTime(TDateTime.Now.Year, 2, 25,0,0,0,0);
	td1 := TDateTime.Parse ('February 25');
	NUnit.Framework.Assert.AreEqual (td2.Ticks, td1.Ticks, 'H08');

	td2 := new TDateTime(TDateTime.Now.Year, 2, 8,0,0,0,0);
	td1 := TDateTime.Parse ('February 08');
	NUnit.Framework.Assert.AreEqual (td2.Ticks, td1.Ticks, 'H09');

	td1 := TDateTime.Parse ('Mon, 25 Feb 2002 04:25:13 GMT');
	td1 := TimeZone.CurrentTimeZone.ToUniversalTime(td1);
	NUnit.Framework.Assert.AreEqual (2002, td1.Year, 'H10a');
	NUnit.Framework.Assert.AreEqual (02, td1.Month, 'H10b');
	NUnit.Framework.Assert.AreEqual (25, td1.Day, 'H10c');
	NUnit.Framework.Assert.AreEqual (04, td1.Hour, 'H10d');
	NUnit.Framework.Assert.AreEqual (25, td1.Minute, 'H10e');
	NUnit.Framework.Assert.AreEqual (13, td1.Second, 'H10f');

	td1 := TDateTime.Parse ('2002-02-25T05:25:13');
	NUnit.Framework.Assert.AreEqual (myTicks[4], td1.Ticks, 'H11');

	td2 := TDateTime.Now + new TimeSpan (5,25,0);
	td1 := TDateTime.Parse ('05:25');
 	Console.Out.WriteLine('H12: expected: {0} was: {1}', td2.Ticks, td1.Ticks);
	//NUnit.Framework.Assert.AreEqual(td2.Ticks, td1.Ticks, 'H12');

	td2 := TDateTime.Now + new TimeSpan (5,25,13);
	td1 := TDateTime.Parse ('05:25:13');
 	Console.Out.WriteLine('H13: expected: {0} was: {1}', td2.Ticks, td1.Ticks);
	//NUnit.Framework.Assert.AreEqual(td2.Ticks, td1.Ticks, 'H13');

	td2 := new TDateTime (2002, 2, 1,0,0,0,0);
	td1 := TDateTime.Parse ('2002 February');
	NUnit.Framework.Assert.AreEqual (td2.Ticks, td1.Ticks, 'H14');

	td2 := new TDateTime (2002, 2, 1,0,0,0,0);
	td1 := TDateTime.Parse ('2002 February');
	NUnit.Framework.Assert.AreEqual (td2.Ticks, td1.Ticks, 'H15');

	td2 := new TDateTime (TDateTime.Now.Year, 2, 8,0,0,0,0);
	td1 := TDateTime.Parse ('February 8');
	NUnit.Framework.Assert.AreEqual (td2.Ticks, td1.Ticks, 'H16');
end;

method TDateTimeTest.TestTicks; 
begin
  var dt1:DateTime := new DateTime(2002, 02, 25,	00, 00, 00, 00); // 0
	var dt2:DateTime := new DateTime(2002, 02, 25, 15, 25, 13, 8); // 1
	var dt3:DateTime := new DateTime(2002, 02, 25, 05, 25, 13, 8); // 2
	var dt4:DateTime := new DateTime(2002, 02, 25, 05, 25, 00, 00); // 3
	var dt5:DateTime := new DateTime(2002, 02, 25, 05, 25, 13, 00); // 4
	var dt6:DateTime := new DateTime(2002, 02, 25, 04, 25, 13, 00); // 5
	var dt7:DateTime := new DateTime(1994, 11, 06, 08, 49, 37, 00); // 6

  var td1:TDateTime := new TDateTime(2002, 02, 25,	00, 00, 00, 00);
	var td2:TDateTime := new TDateTime(2002, 02, 25, 15, 25, 13, 8);
	var td3:TDateTime := new TDateTime(2002, 02, 25, 05, 25, 13, 8);
	var td4:TDateTime := new TDateTime(2002, 02, 25, 05, 25, 00, 00);
	var td5:TDateTime := new TDateTime(2002, 02, 25, 05, 25, 13, 00);
	var td6:TDateTime := new TDateTime(2002, 02, 25, 04, 25, 13, 00);
	var td7:TDateTime := new TDateTime(1994, 11, 06, 08, 49, 37, 00);

	NUnit.Framework.Assert.AreEqual(dt1.Ticks, td1.Ticks, 'Z01');
	NUnit.Framework.Assert.AreEqual(dt2.Ticks, td2.Ticks, 'Z02');
	NUnit.Framework.Assert.AreEqual(dt3.Ticks, td3.Ticks, 'Z03');
	NUnit.Framework.Assert.AreEqual(dt4.Ticks, td4.Ticks, 'Z04');
	NUnit.Framework.Assert.AreEqual(dt5.Ticks, td5.Ticks, 'Z05');
	NUnit.Framework.Assert.AreEqual(dt6.Ticks, td6.Ticks, 'Z06');
	NUnit.Framework.Assert.AreEqual(dt7.Ticks, td7.Ticks, 'Z07');
end;

end.