namespace ShineOn.Rtl;

interface

uses
  System.Collections.Generic,
  System.Text;

type
  StrUtils = public class
  public
    class method LeftStr(aStr: String; aCount: Integer): String;
    class method RightStr(aStr: String; aCount: Integer): String;
    class method MidStr(aStr: String; aStart, aCount: Integer): String;
    class method AnsiReverseString(S: String): String;
    class method AnsiDupeStr(aStr: String; aCount: Integer): String;
    class method DupeString(AText: String; ACount: Integer): String;
    class method AnsiLeftStr(aStr: String; aCount: Integer): String;
    class method AnsiRightStr(aStr: String; aCount: Integer): String;
    class method AnsiMidStr(aStr: String; aStart, aCount: Integer): String;
    class method ContainsText(const AText, ASubText: String): Boolean; inline;
    class method AnsiContainsStr(aStr, aSubstring: String): Boolean;
  end;


method LeftStr(aStr: String; aCount: Integer): String; public;
method RightStr(aStr: String; aCount: Integer): String; public;
method MidStr(aStr: String; aStart, aCount: Integer): String; public;
method AnsiDupeStr(aStr: String; aCount: Integer): String; public;
method DupeString(AText: String; ACount: Integer): String; public;
method AnsiReverseString(S: String): String; public;
method AnsiLeftStr(aStr: String; aCount: Integer): String; public;
method AnsiRightStr(aStr: String; aCount: Integer): String; public;
method AnsiMidStr(aStr: String; aStart, aCount: Integer): String; public;
method AnsiContainsStr(aStr, aSubstring: String): Boolean; public;
  
implementation

{ StrUtils }

class method StrUtils.LeftStr(aStr: String; aCount: Integer): String;
begin
  if aCount > length(aStr) then aCount := length(aStr);
  Result := aStr.Substring(0, aCount);
end;

class method StrUtils.RightStr(aStr: String; aCount: Integer): String;
begin
  if aCount > length(aStr) then aCount := length(aStr);
  Result := aStr.Substring(aStr.Length - aCount);
end;

class method StrUtils.MidStr(aStr: String; aStart, aCount: Integer): String;
begin
  dec(aStart);
  if aStart < 0 then aStart := 0;
  if aStart > length(aStr) then exit('');
  if aStart + aCount > length(aStr) then aCount := length(aStr);
  result := aStr.Substring(aStart, aCount);
end;

class method StrUtils.AnsiDupeStr(aStr: String; aCount: Integer): String;
begin
  if aCount <= 0 then exit('');
  if aCount = 1 then exit(aStr);
  if aCount = 2 then exit(aStr+aStr);
  if aCount = 3 then exit(aStr+aStr+aStr);
  var fSb: StringBuilder := new StringBuilder(aStr.Length * aCount);
  for i: Integer := 0 to aCount -1 do 
    fSb.Append(aStr);
  result := fSb.ToString;
end;

class method StrUtils.DupeString(AText: String; ACount: Integer): String;
begin
  exit(AnsiDupeStr(AText, ACount));
end;

class method StrUtils.AnsiLeftStr(aStr: String; aCount: Integer): String;
begin
  result := LeftStr(aStr, aCount);
end;

class method StrUtils.AnsiReverseString(S: String): String;
begin
  if S = nil then  
    exit(nil);

  if S.Length = 0 then
    exit(S);

  var pChars: array of System.Char := S.ToCharArray;
  Array.Reverse(pChars);

  exit(new String(pChars));
end;

class method StrUtils.AnsiRightStr(aStr: String; aCount: Integer): String;
begin
  result := RightStr(aStr, aCount);
end;

class method StrUtils.AnsiMidStr(aStr: String; aStart, aCount: Integer): String;
begin
  Result := MidStr(aStr, aStart, aCount);
end;

class method StrUtils.AnsiContainsStr(aStr, aSubstring: String): Boolean;
begin
  Result := aStr.Contains(aSubstring);
end;

class method StrUtils.ContainsText(const AText, ASubText: String): Boolean;
begin
  Result := AText.Contains(ASubText);
end;

// Standalone versions

method LeftStr(aStr: String; aCount: Integer): String;
begin
  result := StrUtils.LeftStr(aStr, aCount);
end;

method RightStr(aStr: String; aCount: Integer): String;
begin
  result := StrUtils.RightStr(aStr, aCount);
end;

method MidStr(aStr: String; aStart, aCount: Integer): String;
begin
  result := StrUtils.MidStr(aStr, aStart, aCount);
end;

method AnsiDupeStr(aStr: String; aCount: Integer): String;
begin
  result := StrUtils.AnsiDupeStr(aStr, aCount);
end;

method DupeString(AText: String; ACount: Integer): String;
begin
  exit(StrUtils.DupeString(AText, ACount));
end;

method AnsiLeftStr(aStr: String; aCount: Integer): String;
begin
  result := StrUtils.AnsiLeftStr(aStr, aCount);
end;

method AnsiReverseString(S: String): String; 
begin
  Result := StrUtils.AnsiReverseString(S);
end;

method AnsiRightStr(aStr: String; aCount: Integer): String;
begin
  result := StrUtils.AnsiRightStr(aStr, aCount);
end;

method AnsiMidStr(aStr: String; aStart, aCount: Integer): String;
begin
  result := StrUtils.AnsiMidStr(aStr, aStart, aCount);
end;

method AnsiContainsStr(aStr, aSubstring: String): Boolean; 
begin
  result := StrUtils.AnsiContainsStr(aStr, aSubstring);
end;

end.