namespace ShineOn.Rtl;

interface

uses
  System.Collections.Generic,
  System.Text;

type
  TCollectionNotification = public enum (cnAdded, cnExtracting, cnDeleting);

  TCollectionItem = public class(TPersistent, IDisposable)
  public
    constructor Create; virtual; empty;
    method Dispose; virtual; empty;
  end;

  TCollection<T> = public class(List<T>, IDisposable) 
    where T is TCollectionItem, T has constructor;
  public
    constructor Create; empty;
    method Dispose; virtual;
    method Add: T;
    method BeginUpdate; virtual; empty;
    method Delete(aIndex: Integer);
    method EndUpdate; virtual; empty;
    method Insert(aIndex: Integer): T;
    property ItemClass: TCollectionItemClass read typeOf(T);
    property Items[aIndex: Integer]: T read inherited Item[aIndex] write Item[aIndex];
  end;

  TCollectionItemClass = public &Type;
  TCollection = public TCollection<TCollectionItem>;
  TCollectionEnumerator = public IEnumerator<TCollectionItem>;

implementation

method TCollection<T>.Dispose;
begin
  for each i: T in self do
    IDisposable(i):Dispose;
end;

method TCollection<T>.Add: T;
begin
  result := new T;
  Add(result);
end;

method TCollection<T>.Delete(aIndex: Integer);
begin
  RemoveAt(aIndex);
end;
method TCollection<T>.Insert(aIndex: Integer): T;
begin
  result := new T;
  inherited Insert(aIndex, result);
end;

end.