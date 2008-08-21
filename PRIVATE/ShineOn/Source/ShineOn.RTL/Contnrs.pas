// The contents of this file are subject to the Mozilla Public License Version 1.1 (the "License"); 
// you may not use this file except in compliance with the License. You may obtain a copy of the 
// License at http://www.mozilla.org/MPL/ 
// 
// Software distributed under the License is distributed on an "AS IS" basis, WITHOUT WARRANTY OF 
// ANY KIND, either express or implied. See the License for the specificlanguage governing rights and 
// limitations under the License.

// $Id: Contnrs.pas 49 2005-06-28 13:29:37Z peter3 $

namespace ShineOn.RTL;

interface
  
type
  TObjectList = public class(TList)
  private
    FOwnsObjects: Boolean;
  protected
    procedure Notify(Ptr: Object; Action: TListNotification); override;
    function GetItem(Index: Integer): TObject;
    procedure SetItem(Index: Integer; AObject: TObject);
  public
    constructor Create; 
    constructor Create(AOwnsObjects: Boolean); 

    function Add(AObject: TObject): Integer;
    function Extract(Item: TObject): TObject;
    function Remove(AObject: TObject): Integer;
    function IndexOf(AObject: TObject): Integer;
    function FindInstanceOf(AClass: TClass; AExact: Boolean := True; AStartAt: Integer := 0): Integer;
    procedure Insert(Index: Integer; AObject: TObject);
    function First: TObject;reintroduce;
    function Last: TObject;reintroduce;
    property OwnsObjects: Boolean read FOwnsObjects write FOwnsObjects;
    property Items[Index: Integer]: TObject read GetItem write SetItem; default;reintroduce;
  end;

{ TComponentList class }

  TComponentList = public class(TObjectList)
  private
    FNexus:TComponent;
  protected
    procedure Notify(Ptr: Object; Action: TListNotification); override;
    function GetItems(Index: Integer): TComponent;
    procedure SetItems(Index: Integer; AComponent: TComponent);
    procedure HandleFreeNotify(Sender: TObject; AComponent: TComponent);
  public
    function Add(AComponent: TComponent): Integer;
    function Extract(Item: TComponent): TComponent;
    function Remove(AComponent: TComponent): Integer;
    function IndexOf(AComponent: TComponent): Integer;
    function First: TComponent;reintroduce;
    function Last: TComponent;reintroduce;
    procedure Insert(Index: Integer; AComponent: TComponent);
    property Items[Index: Integer]: TComponent read GetItems write SetItems; default;reintroduce;
  end;

{ TClassList class }

  TClassList = public class(TList)
  protected
    function GetItems(Index: Integer): TClass;
    procedure SetItems(Index: Integer; AClass: TClass);
  public
    function Add(AClass: TClass): Integer;
    function Extract(Item: TClass): TClass;
    function Remove(AClass: TClass): Integer;
    function IndexOf(AClass: TClass): Integer;
    function First: TClass;reintroduce;
    function Last: TClass;reintroduce;
    procedure Insert(Index: Integer; AClass: TClass);
    property Items[Index: Integer]: TClass read GetItems write SetItems; default;reintroduce;
  end;

{ TOrdered class }

  TOrderedList = public abstract class(TObject)
  private
    FList: TList;
  protected
    procedure PushItem(AItem: Object); virtual; abstract;
    function PopItem: Object; virtual;
    function PeekItem: Object; virtual;
    property List: TList read FList;
  public
    constructor Create;
    function Count: Integer;
    function AtLeast(ACount: Integer): Boolean;
    function Push(AItem: Object): Object;
    function Pop: Object;
    function Peek: Object;
  end;
  
{ TStack class }

  TStack = public class(TOrderedList)
  protected
    procedure PushItem(AItem: Object); override;
  end;

{ TObjectStack class }

  TObjectStack = public class(TStack)
  public
    function Push(AObject: TObject): TObject;
    function Pop: TObject;reintroduce;
    function Peek: TObject;reintroduce;
  end;

{ TQueue class }

  TQueue = public class(TOrderedList)
  protected
    procedure PushItem(AItem: Object); override;
  end;

{ TObjectQueue class }

  TObjectQueue = public class(TQueue)
  public
    function Push(AObject: TObject): TObject;
    function Pop: TObject;reintroduce;
    function Peek: TObject;reintroduce;
  end;

{ TBucketList, Hashed associative list }

  TBucketProc = public procedure (AInfo, AItem, AData: Object; out AContinue: Boolean) of object;

  TCustomBucketList = public class(TObject)
  private
    FListLocked:Boolean;
    function GetData(AItem: Object): Object;
    procedure SetData(AItem: Object; const AData: Object);
  protected
    FBuckets:System.Collections.Hashtable;
  public
    constructor Create;
    procedure Clear;
    function Add(AItem, AData: Object): Object;
    function Remove(AItem: Object): Object;
    function ForEach(AProc: TBucketProc; AInfo: Object := nil): Boolean;
    procedure Assign(AList: TCustomBucketList);
    function Exists(AItem: Object): Boolean;
    function Find(AItem: Object; out AData: Object): Boolean;
    property Data[AItem: Object]: Object read GetData write SetData; default;
    property Buckets:System.Collections.Hashtable read FBuckets;
  end;

{ TBucketList }

  TBucketListSizes = public (BucketSize2, BucketSize4, BucketSize8, BucketSize16, BucketSize32, BucketSize64, BucketSize128, BucketSize256);
  
  
type
  TBucketList = public class(TCustomBucketList)
  public
    constructor Create(ABuckets: TBucketListSizes := TBucketListSizes.BucketSize16);
  end;

{ TObjectBucketList }

  TObjectBucketList = public class(TBucketList)
  protected
    function GetData(AItem: TObject): TObject;
    procedure SetData(AItem: TObject; const AData: TObject);
  public
    function Add(AItem, AData: TObject): TObject;
    function Remove(AItem: TObject): TObject;

    property Data[AItem: TObject]: TObject read GetData write SetData; default;
  end;

implementation


{ TObjectList }

function TObjectList.Add(AObject: TObject): Integer;
begin
  Result := inherited Add(AObject);
end;

constructor TObjectList.Create;
begin
  inherited Create;
  FOwnsObjects := True;
end;

constructor TObjectList.Create(AOwnsObjects: Boolean);
begin
  inherited Create;
  FOwnsObjects := AOwnsObjects;
end;

function TObjectList.Extract(Item: TObject): TObject;
begin
  Result := TObject(inherited Extract(Item));
end;

function TObjectList.FindInstanceOf(AClass: TClass; AExact: Boolean;
  AStartAt: Integer): Integer;
var
  I: Integer;
begin
  Result := -1;
  // TODO: check that this is correct  
  for I := AStartAt to Count - 1 do
    if (AExact and (Items[I].GetType = AClass.GetType)) or
       (not AExact and Items[I].GetType.IsSubclassOf(AClass.GetType)) then
    begin
      Result := I;
      break;
    end;
end;

function TObjectList.First: TObject;
begin
  Result := TObject(inherited First);
end;

function TObjectList.GetItem(Index: Integer): TObject;
begin
  Result := inherited Items[Index] as TObject;
end;

function TObjectList.IndexOf(AObject: TObject): Integer;
begin
  Result := inherited IndexOf(AObject);
end;

procedure TObjectList.Insert(Index: Integer; AObject: TObject);
begin
  inherited Insert(Index, AObject);
end;

function TObjectList.Last: TObject;
begin
  Result := TObject(inherited Last);
end;

procedure TObjectList.Notify(Ptr: Object; Action: TListNotification);
begin
  if OwnsObjects then
    if (Action = TListNotification.Deleted) and (Ptr is TObject) then
      TObject(Ptr).Free;
  inherited Notify(Ptr, Action);
end;

function TObjectList.Remove(AObject: TObject): Integer;
begin
  Result := inherited Remove(AObject);
end;

procedure TObjectList.SetItem(Index: Integer; AObject: TObject);
begin
  inherited Items[Index] := AObject;
end;


{ TComponentList }

function TComponentList.Add(AComponent: TComponent): Integer;
begin
  Result := inherited Add(AComponent);
end;

function TComponentList.Extract(Item: TComponent): TComponent;
begin
  Result := TComponent(inherited Extract(Item));
end;

function TComponentList.First: TComponent;
begin
  Result := TComponent(inherited First);
end;

function TComponentList.GetItems(Index: Integer): TComponent;
begin
  Result := TComponent(inherited Items[Index]);
end;

procedure TComponentList.HandleFreeNotify(Sender: TObject; AComponent: TComponent);
begin
  Extract(AComponent);
end;

function TComponentList.IndexOf(AComponent: TComponent): Integer;
begin
  Result := inherited IndexOf(AComponent);
end;

procedure TComponentList.Insert(Index: Integer; AComponent: TComponent);
begin
  inherited Insert(Index, AComponent);
end;

function TComponentList.Last: TComponent;
begin
  Result := TComponent(inherited Last);
end;

procedure TComponentList.Notify(Ptr: Object; Action: TListNotification);
begin
  // TODO: implement notification support
{
  case Action of
    TListNotification.lnAdded:
      if Ptr <> nil then
        TComponent(Ptr).FreeNotification(FNexus);
    TListNotification.lnExtracted,
    TListNotification.lnDeleted:
      if Ptr <> nil then
        TComponent(Ptr).RemoveFreeNotification(FNexus);
  end;
  }
  inherited Notify(Ptr, Action);
end;

function TComponentList.Remove(AComponent: TComponent): Integer;
begin
  Result := inherited Remove(AComponent);
end;

procedure TComponentList.SetItems(Index: Integer; AComponent: TComponent);
begin
  inherited Items[Index] := AComponent;
end;

{ TClassList }

function TClassList.Add(AClass: TClass): Integer;
begin
  Result := inherited Add(AClass);
end;

function TClassList.Extract(Item: TClass): TClass;
begin
  Result := TClass(inherited Extract(Item));
end;

function TClassList.First: TClass;
begin
  Result := TClass(inherited First);
end;

function TClassList.GetItems(Index: Integer): TClass;
begin
  Result := TClass(inherited Items[Index]);
end;

function TClassList.IndexOf(AClass: TClass): Integer;
begin
  Result := inherited IndexOf(AClass);
end;

procedure TClassList.Insert(Index: Integer; AClass: TClass);
begin
  inherited Insert(Index, AClass);
end;

function TClassList.Last: TClass;
begin
  Result := TClass(inherited Last);
end;

function TClassList.Remove(AClass: TClass): Integer;
begin
  Result := inherited Remove(AClass);
end;

procedure TClassList.SetItems(Index: Integer; AClass: TClass);
begin
  inherited Items[Index] := AClass;
end;

{ TOrderedList }

function TOrderedList.AtLeast(ACount: Int32): Boolean;
begin
  Result := List.Count >= ACount;
end;

function TOrderedList.Peek: Object;
begin
  Result := PeekItem;
end;

function TOrderedList.Pop: Object;
begin
  Result := PopItem;
end;

function TOrderedList.Push(AItem: Object): Object;
begin
  PushItem(AItem);
  Result := AItem;
end;

function TOrderedList.Count: Integer;
begin
  Result := List.Count;
end;

constructor TOrderedList.Create;
begin
  inherited Create;
  FList := TList.Create;
end;


function TOrderedList.PeekItem: Object;
begin
  Result := List[List.Count-1];
end;

function TOrderedList.PopItem: Object;
begin
  Result := PeekItem;
  List.Delete(List.Count-1);
end;

{ TStack }

procedure TStack.PushItem(AItem: Object);
begin
  List.Add(AItem);
end;

{ TObjectStack }

function TObjectStack.Peek: TObject;
begin
  Result := TObject(inherited Peek);
end;

function TObjectStack.Pop: TObject;
begin
  Result := TObject(inherited Pop);
end;

function TObjectStack.Push(AObject: TObject): TObject;
begin
  Result := TObject(inherited Push(AObject));
end;

{ TQueue }

procedure TQueue.PushItem(AItem: Object);
begin
  List.Insert(0, AItem);
end;

{ TObjectQueue }

function TObjectQueue.Peek: TObject;
begin
  Result := TObject(inherited Peek);
end;

function TObjectQueue.Pop: TObject;
begin
  Result := TObject(inherited Pop);
end;

function TObjectQueue.Push(AObject: TObject): TObject;
begin
  Result := TObject(inherited Push(AObject));
end;

{ TCustomBucketList }

function TCustomBucketList.Add(AItem, AData: Object): Object;
var
  Dummy:Object;
begin
  if FListLocked then
    raise EListError.Create(SBucketListLocked);
    
  if Find(AItem, Dummy) then
    raise EListError.Create(System.String.Format(SDuplicateItem, Integer(AItem)))
  else
    Result := Add(AItem, AData);
end;

constructor TCustomBucketList.Create;
begin
  inherited Create;
  FBuckets := new System.Collections.Hashtable;
end;
  
procedure TCustomBucketList.Assign(AList: TCustomBucketList);
begin
  FBuckets := new System.Collections.Hashtable(AList.Buckets);
end;

procedure TCustomBucketList.Clear;
begin
  if FListLocked then
    raise EListError.Create(SBucketListLocked);
  FBuckets.Clear;
end;

function TCustomBucketList.Exists(AItem: Object): Boolean;
var
  Dummy:Object;
begin
  Result := Find(AItem, Dummy);
end;

function TCustomBucketList.Find(AItem: Object; out AData: Object): Boolean;
begin
  Result := FBuckets.Contains(AItem);
  if Result then
    AData := FBuckets[AItem]
  else
    AData := nil;
end;

function TCustomBucketList.ForEach(AProc: TBucketProc; AInfo: Object): Boolean;
var
  E:System.Collections.IDictionaryEnumerator;
begin
  if FListLocked then
    raise EListError.Create(SBucketListLocked);
  Result := True;
  FListLocked := True;
  //!!! this is different from the Delphi implementation in that the extracted items cannot be modified
  E := FBuckets.GetEnumerator;
  try
    while E.MoveNext do
    begin
      AProc(AInfo, E.Key , E.Value, Result);
      if not Result then 
        Exit;
    end;
  finally
    FListLocked := False;
  end;
end;

function TCustomBucketList.GetData(AItem: Object): Object;
begin
  Result := FBuckets[AItem];
end;

function TCustomBucketList.Remove(AItem: Object): Object;
begin
  if FListLocked then
    raise EListError.Create(SBucketListLocked);
  Result := nil;
  FBuckets.Remove(AItem);
end;

procedure TCustomBucketList.SetData(AItem: Object; const AData: Object);
begin
  if not FBuckets.Contains(AItem) then
    raise EListError.Create(System.String.Format(SItemNotFound, Integer(AItem)));
  FBuckets[AItem] := AData;
end;


constructor TBucketList.Create(ABuckets: TBucketListSizes);
var
  ABucketSizes: array [0..7] of Byte := [$01, $03, $07, $0F, $1F, $3F, $7F, $FF];
begin    
  inherited Create;
  FBuckets := new System.Collections.Hashtable(ABucketSizes[Byte(ABuckets)] + 1);
end;  

{ TObjectBucketList }

function TObjectBucketList.Add(AItem, AData: TObject): TObject;
begin
  Result := TObject(inherited Add(AItem, AData));
end;

function TObjectBucketList.GetData(AItem: TObject): TObject;
begin
  Result := TObject(inherited Data[AItem]);
end;

function TObjectBucketList.Remove(AItem: TObject): TObject;
begin
  Result := TObject(inherited Remove(AItem));
end;

procedure TObjectBucketList.SetData(AItem: TObject; const AData: TObject);
begin
  inherited Data[AItem] := AData;
end;

end.
