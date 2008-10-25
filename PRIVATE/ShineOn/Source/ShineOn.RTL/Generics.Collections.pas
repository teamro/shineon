namespace ShineOn.Rtl;

interface

uses
  System.Collections,
  System.Collections.Generic;

type

  TList<T> = public class(TObject, IEnumerable<T>, IEnumerable)
  private
    fItems: List<T> := new List<T>; implements IEnumerable<T>;
  public
    method Add(const aItem: T);
    method AddRange(const aItems: array of T);
    method RemoveAt(aIndex: Integer);
    method Clear;
    property Item[aIndex: Integer]: T read fItems.Item[aIndex] write fItems.Item[aIndex];
    property Count: Integer read fItems.Count;
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

method TList<T>.Add(const AItem: T);
begin
  fItems.Add(AItem);
end;

method TList<T>.AddRange(const aItems: array of T);
begin
  fItems.AddRange(aItems);
end;

method TList<T>.RemoveAt(aIndex: Integer);
begin
  fItems.RemoveAt(aIndex);
end;

method TList<T>.Clear;
begin
  fItems.Clear;
end;

end.