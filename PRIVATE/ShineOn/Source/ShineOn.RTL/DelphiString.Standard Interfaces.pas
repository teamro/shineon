namespace ShineOn.Rtl;

interface

type
  DelphiString = public partial sealed class(IConvertible,
                                             ICloneable,
                                             IComparable<String>,
                                             IEquatable<String>,
                                             IComparable<DelphiString>,
                                             IEquatable<DelphiString>)
  protected
    property ImplementingString : String
      read self;
      implements IConvertible,
                 IComparable<String>,
                 IEquatable<String>;
    method UntypedClone : Object;
      implements ICloneable.Clone;
  public
    method Equals(other: DelphiString): Boolean;
    method CompareTo(other: DelphiString): Int32;
  end;
  
implementation

method DelphiString.UntypedClone : Object;
begin
  exit Duplicate();
end;

method DelphiString.Equals(other: DelphiString): Boolean;
begin
  exit other = self;
end;

method DelphiString.CompareTo(other: DelphiString): Int32;
begin
  if ReferenceEquals(self, other) then
    exit 0
  else if not assigned(other) then
    exit 1
  else if other < self then
    exit 1
  else if self < other then
    exit -1
  else
    exit 0;
end;

end.