namespace ShineOn.Rtl;

interface

uses
  System.Runtime.InteropServices;

type
  { Types.pas }
  TValueRelationship = Int16; //-1..1;
 
const
  LessThanValue = -1;
  EqualsValue = 0;
  GreaterThanValue = +1;

type
  { System time is represented with the following structure: }
  [StructLayout(LayoutKind.Sequential)]
  _SYSTEMTIME = record
    wYear: Word;
    wMonth: Word;
    wDayOfWeek: Word;
    wDay: Word;
    wHour: Word;
    wMinute: Word;
    wSecond: Word;
    wMilliseconds: Word;
  end;
  TSystemTime = _SYSTEMTIME;

  HWND = THandle;
  
implementation

end.