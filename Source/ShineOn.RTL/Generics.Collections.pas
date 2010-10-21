namespace ShineOn.Rtl;

interface

uses
  System.Collections,
  System.Collections.Generic;

type
  TComparer<T> = public class(Comparer<T>);
  TEqualityComparer<T> = public class(EqualityComparer<T>);

  TPair<TKey, TValue> = public record
  public
    Key: TKey;
    Value: TValue;
    constructor Create(AKey: TKey; AValue: TValue);
  end;

  TArray<T> = public class(List<T>);

  TList<T> = public class(TObject, IEnumerable<T>, IEnumerable)
  private
    FItems: List<T> := new List<T>; implements IEnumerable<T>;
  public
    method Add(AItem: T);
    method AddRange(AItems: array of T);
    method Delete(AIndex: Integer);
    method Exchange(AIndex1, AIndex2: Integer);
    method Insert(AIndex: Integer; AItem: T);
    method RemoveAt(AIndex: Integer);
    method Reverse;
    method Clear;
    method Sort;
    method Sort(AComparer: IComparer<T>);
    property Items[AIndex: Integer]: T read FItems.Item[AIndex] write FItems.Item[AIndex]; default;
    property Count: Integer read FItems.Count;
  end;

  TObjectList<T> = public class(TList<T>)
  private
    FOwnsObjects: Boolean;
  public
    property OwnsObjects: Boolean read FOwnsObjects write FOwnsObjects;
  end;

  TQueue<T> = public class(TObject, IEnumerable<T>, IEnumerable)
  private
    FItems: Queue<T> := new Queue<T>; implements IEnumerable<T>;
  end;

  TStack<T> = public class(TObject, IEnumerable<T>, IEnumerable)
  private
    FItems: Stack<T> := new Stack<T>; implements IEnumerable<T>;
  end;

  TDictionary<K,V> = public class(TObject, IEnumerable<KeyValuePair<K, V>>, IEnumerable)
  private
    FItems: Dictionary<K,V> := new Dictionary<K,V>; implements IEnumerable<KeyValuePair<K, V>>; 
  end;

  
implementation

{ TPair<TKey,TValue> }

constructor TPair<TKey,TValue>.Create(AKey: TKey; AValue: TValue);
begin
  Key := AKey;
  Value := AValue;
end;

{ TList<T> }

method TList<T>.Add(AItem: T);
begin
  FItems.Add(AItem);
end;

method TList<T>.AddRange(AItems: array of T);
begin
  FItems.AddRange(aItems);
end;

method TList<T>.Delete(AIndex: Integer);
begin
  RemoveAt(AIndex);
end;

method TList<T>.Clear;
begin
  FItems.Clear;
end;

method TList<T>.Exchange(AIndex1, AIndex2: Integer);
begin
  var pItem: T := FItems[AIndex1];
  FItems[AIndex1] := FItems[AIndex2];
  FItems[AIndex2] := pItem;
end;

method TList<T>.Insert(AIndex: Integer; AItem: T);
begin
  FItems.Insert(AIndex, AItem);
end;

method TList<T>.RemoveAt(AIndex: Integer);
begin
  FItems.RemoveAt(AIndex);
end;

method TList<T>.Reverse;
begin
  FItems.Reverse;
end;

method TList<T>.Sort;
begin
  FItems.Sort;
end;

method TList<T>.Sort(AComparer: IComparer<T>);
begin
  FItems.Sort(AComparer);
end;

end.