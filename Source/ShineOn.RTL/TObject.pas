namespace ShineOn.Rtl;

interface

uses
  System.ComponentModel, // for IComponent
  System.Runtime.InteropServices, // for guid attribute
  System.Runtime.CompilerServices, // for Extension attribute
  System.Threading,
  System.Collections,
  System.Reflection,
  System.Windows.Forms, // for Form
  Microsoft.Win32.SafeHandles;

type
  TObject = public Object;

  [Extension]
  TObjectExtender = public static sealed class
  public
    class function InitInstance(aInstance: Object): TObject;
    procedure CleanupInstance;
    [Extension] function ClassType(o: Object): TClass;
    [Extension] function ClassName(o: Object): String;
    [Extension] function ClassNameIs(o: Object; const Name: String): Boolean;
    [Extension] function ClassParent(o: Object): TClass;
    [Extension] function ClassInfo(o: Object): System.Type;
    [Extension] function InheritsFrom(o: Object; AClass: TClass): Boolean;

    [Extension] procedure AfterConstruction(o: Object); 
    [Extension] procedure BeforeDestruction(o: Object);
    //[Extension] procedure Dispatch(o: Object; var Message);
    
    [Extension] procedure Free(o: Object); 
    [Extension] procedure Destroy(o: Object);

    // this variant won't not need to box if the type is not Diposable
    [Extension] procedure Free<T>(o: T); 
    [Extension] procedure Destroy<T>(o: T);
  end;
  
  TClass = public &Type;

implementation

{ TObject }

class function TObjectExtender.InitInstance(aInstance: Object): TObject;
begin
  Result := aInstance as TObject;
end;

procedure TObjectExtender.CleanupInstance;
begin
  // 
end;

function TObjectExtender.ClassType(o: Object): TClass;
begin
  Result := o.ClassInfo;
end;

class function TObjectExtender.ClassName(o: Object): String;
begin
  Result := o.ClassInfo.Name;
end;

class function TObjectExtender.ClassNameIs(o: Object; const Name: String): Boolean;
begin
  Result := System.String.Compare(Name, o.ClassName, true) = 0;
end;

class function TObjectExtender.ClassParent(o: Object): TClass;
begin
  Result := o.GetType.BaseType;
  NotImplemented;
end;

class function TObjectExtender.ClassInfo(o: Object): System.Type;
begin
  //o is a System.Type if the caller used typeof(TExampleClass)
  Result := iif(o is &Type, &Type(o), o.GetType);
end;

class function TObjectExtender.InheritsFrom(o: Object; AClass: TClass): Boolean;
begin
  AClass.IsAssignableFrom(o.ClassInfo);
end;

procedure TObjectExtender.AfterConstruction(o: Object);
begin
  // do nothing
end;

procedure TObjectExtender.BeforeDestruction(o: Object); 
begin
  // do nothing
end;

procedure TObjectExtender.Destroy(o: Object);
begin
  // dispose, if necessary. noop, otherwise.
  IDisposable(o):Dispose;
end;

procedure TObjectExtender.Free(o: Object);
begin
  o.Destroy;
end;    

type
  DisposableHelper<T> nested in TObjectExtender
    = private static class
  public
    constructor;
    property DisposeCall : Action<T>; readonly;
    procedure DisposeReferenceType(o: T);
    procedure DisposeValueType(o: T);
  end;
  
procedure TObjectExtender.Destroy<T>(o: T);
begin
  // dispose, if necessary. noop, otherwise.
  DisposableHelper<T>.DisposeCall(o);
end;

procedure TObjectExtender.Free<T>(o: T);
begin
  Destroy<T>(o);
end;    
  
constructor TObjectExtender.DisposableHelper<T>;
begin
  var typeRef := typeOf(T);
  var call : Action<T>;
  // dispose, if necessary. noop, otherwise.
  if not typeRef.IsSealed
  or typeOf(IDisposable).IsAssignableFrom(typeRef) then
    call := @DisposeReferenceType
  else
    call := @DisposeValueType;
  
  DisposeCall := call;
end;

procedure TObjectExtender.DisposableHelper<T>.DisposeReferenceType(o: T);
begin
  TObjectExtender.Destroy(Object(o));
end;

procedure TObjectExtender.DisposableHelper<T>.DisposeValueType(o: T);
begin
  // noop
end;

end.