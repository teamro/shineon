namespace ShineOn.Rtl;

interface

uses
  System.Collections,
  System.Collections.Generic;

type
  TPair<TKey, TValue> = public record
    Key: TKey;
    Value: TValue;
    constructor Create(AKey: TKey; AValue: TValue);
  end;

  TArray<T> = public class(List<T>);

  TList<T> = public class(TObject, IEnumerable<T>, IEnumerable)
  private
    fItems: List<T> := new List<T>; implements IEnumerable<T>;
  public
    method Add(const AItem: T);
    method AddRange(const aItems: array of T);
    method Delete(AIndex: Integer);
    method Exchange(Index1, Index2: Integer);
    method Insert(AIndex: Integer; AItem: T);
    method RemoveAt(aIndex: Integer);
    method Clear;
    method Sort;
    method Sort(aComparer: IComparer<T>);
    property Item[aIndex: Integer]: T read fItems.Item[aIndex] write fItems.Item[aIndex]; default;
    property Count: Integer read fItems.Count;
  end;

  TObjectList<T> = public class(TList<T>)
  private
    FOwnsObjects: Boolean;
  public
    property OwnsObjects: Boolean read FOwnsObjects write FOwnsObjects;
  end;

  TQueue<T> = public class(TObject, IEnumerable<T>, IEnumerable)
  private
    fItems: Queue<T> := new Queue<T>; implements IEnumerable<T>;
  public
  end;

  TStack<T> = public class(TObject, IEnumerable<T>, IEnumerable)
  private
    fItems: Stack<T> := new Stack<T>; implements IEnumerable<T>;
  public
  end;

  TDictionary<K,V> = public class(TObject, IEnumerable<KeyValuePair<K, V>>, IEnumerable)
  private
    fItems: Dictionary<K,V> := new Dictionary<K,V>; implements IEnumerable<KeyValuePair<K, V>>; 
  public
  end;

  
implementation

{ TPair<TKey,TValue> }

constructor TPair<TKey,TValue>.Create(AKey: TKey; AValue: TValue);
begin
  Key := AKey;
  Value := AValue;
end;

{ TList<T> }

method TList<T>.Add(const AItem: T);
begin
  fItems.Add(AItem);
end;

method TList<T>.AddRange(const aItems: array of T);
begin
  fItems.AddRange(aItems);
end;

method TList<T>.Delete(AIndex: Integer);
begin
  RemoveAt(AIndex);
end;

method TList<T>.Exchange(Index1, Index2: Integer);
begin
  var pItem: T := fItems[Index1];
  fItems[Index1] := fItems[Index2];
  fItems[Index2] := pItem;
end;

method TList<T>.Insert(AIndex: Integer; AItem: T);
begin
  fItems.Insert(AIndex, AItem);
end;

method TList<T>.RemoveAt(aIndex: Integer);
begin
  fItems.RemoveAt(aIndex);
end;

method TList<T>.Clear;
begin
  fItems.Clear;
end;

method TList<T>.Sort;
begin
  fItems.Sort;
end;

method TList<T>.Sort(aComparer: IComparer<T>);
begin
  fItems.Sort(aComparer);
end;

end.