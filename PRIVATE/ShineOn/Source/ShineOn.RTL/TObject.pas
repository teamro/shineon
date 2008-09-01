namespace ShineOn.Rtl;

interface

uses
  System.ComponentModel, // for IComponent
  System.Runtime.InteropServices, // for guid attribute
  System.Runtime.CompilerServices,
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
  result := typeOf(self);
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
  o.GetType.BaseType;
  NotImplemented;
end;

class function TObjectExtender.ClassInfo(o: Object): System.Type;
begin
  result := typeOf(self);
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

end.