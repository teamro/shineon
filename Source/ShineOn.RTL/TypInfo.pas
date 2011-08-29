namespace ShineOn.Rtl;

interface

uses
  System;

function GetEnumName(TypeInfo: System.Type; Value: Integer): String; public;
function GetEnumValue(TypeInfo: System.Type; Value: String): Integer; public;

implementation

function GetEnumName(TypeInfo: System.Type; Value: Integer): String;
begin
  //Unmanaged Delphi gives an access violation for an invalid Value.  We will just return a blank string here.
  Result:=Enum.GetName(TypeInfo, Value);
  if not Assigned(Result) then Result:='';  //Blank string rather than nil
end;

function GetEnumValue(TypeInfo: System.Type; Value: String): Integer; 
begin
  try
    Result:=Convert.ToInt32(Enum.Parse(TypeInfo, Value, False));  //Unmanaged Delphi is not case sensitive
  except
    //Unmanaged Delphi returns -1 if the conversion does not work
    Result:=-1;
  end;
end;

end.