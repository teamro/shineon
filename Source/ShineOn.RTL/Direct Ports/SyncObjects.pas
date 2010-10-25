namespace ShineOn.Rtl;

{ *********************************************************************** }
{                                                                         }
{ Based on the Delphi Visual Component Library                            }
{                                                                         }
{ Copyright (c) CodeGear and RemObjects Software                          }
{                                                                         }
{ *********************************************************************** }

interface

type
  TSynchroObject = public class(TObject)
  public
    method Acquire; virtual; empty;
    method Release; virtual; empty;
  end;

  TWaitResult = public enum(Signaled, Timeout, Abandoned, Error);

  //THandleObject = class(TSynchroObject, IDisposable)
  //protected
    //FHandle: THandle;
    //FLastError: Integer;
    //FUseCOMWait: Boolean;
  //protected
    //finalizer Finalize;
  //public
    //{ Specify UseCOMWait to ensure that when blocked waiting for the object
      //any STA COM calls back into this thread can be made. }
    //constructor Create(UseCOMWait: Boolean := False);
    //method Dispose; 
    //method WaitFor(Timeout: LongWord): TWaitResult; virtual;
    //property LastError: Integer read FLastError;
    //property Handle: THandle read FHandle;
  //end;

  //TEvent = class(THandleObject)
  //public
    //{TODO:constructor Create(var EventAttributes: TSecurityAttributes; ManualReset,
      //InitialState: Boolean; const Name: DelphiString; UseCOMWait: Boolean := False); 
    //constructor Create(EventAttributes: IntPtr; ManualReset,
      //InitialState: Boolean; const Name: DelphiString; UseCOMWait: Boolean := False); }
    //constructor Create(UseCOMWait: Boolean := False); 
    //method SetEvent;
    //method ResetEvent;
  //end;

  //TODO: TSimpleEvent = class(TEvent);

  //TMutex = class(THandleObject)
  //public
    //constructor Create(UseCOMWait: Boolean := False); 
    //{TODO:constructor Create(var MutexAttributes: TSecurityAttributes;
      //InitialOwner: Boolean; const Name: DelphiString; UseCOMWait: Boolean := False); 
    //constructor Create(MutexAttributes: IntPtr;
      //InitialOwner: Boolean; const Name: DelphiString; UseCOMWait: Boolean := False); }
    //constructor Create(DesiredAccess: LongWord; InheritHandle: Boolean; const Name: DelphiString; UseCOMWait: Boolean := False); 
    //method Acquire; override;
    //method Release; override;
  //end;

  TCriticalSection = public class(TSynchroObject)
  private
    FObject: Object;
  public
    constructor Create;
    method Acquire; override;
    method Release; override;
    method TryEnter: Boolean;
    method Enter;
    method Leave;
  end;

// global enum constants
const
  wrSignaled  = TWaitResult.Signaled;
  wrTimeout   = TWaitResult.Timeout;
  wrAbandoned = TWaitResult.Abandoned;
  wrError     = TWaitResult.Error;


implementation

uses
  System.Runtime.InteropServices;

//type
  //TCoWaitForMultipleHandlesProc = delegate (dwFlags: DWORD; dwTimeOut: DWORD;
    //cHandles: LongWord; lpHandles: array of THandle; var lpdwIndex: DWORD): HRESULT;

//var
  //CanCoWaitForMultipleHandles: Boolean;
  //CoWaitChecked: Boolean := False;

//[DllImport('ole32.dll', CharSet := CharSet.Ansi, SetLastError := True, EntryPoint := 'CoWaitForMultipleHandles')] // do not localize
//method _CoWaitForMultipleHandles(dwFlags: DWORD; dwTimeOut: DWORD;
    //cHandles: LongWord; lpHandles: array of THandle; var lpdwIndex: DWORD): HRESULT; external;

{TODO:threadvar}
//var
  //OleThreadWnd: HWND;
//
//const
  //OleThreadWndClassName = 'OleMainThreadWndClass'; //do not localize
  //COWAIT_WAITALL = $00000001;
  //COWAIT_ALERTABLE = $00000002;

//method GetOleThreadWindow: HWND;
//var
  //ChildWnd: HWND;
  //ParentWnd: HWND;
//begin
  //if (OleThreadWnd = 0) or not IsWindow(OleThreadWnd) then
  //begin
    //if (Win32Platform = VER_PLATFORM_WIN32_NT) and (Win32MajorVersion >= 5) then
      //ParentWnd := HWND(HWND_MESSAGE)
    //else
      //ParentWnd := 0;
    //ChildWnd := 0;
    //repeat
      //OleThreadWnd := FindWindowEx(ParentWnd, ChildWnd, OleThreadWndClassName, nil);
      //ChildWnd := OleThreadWnd;
    //until (OleThreadWnd = 0) or (GetWindowThreadProcessId(OleThreadWnd, nil) = GetCurrentThreadId);
  //end;
  //Result := OleThreadWnd;
//end;

//method InternalCoWaitForMultipleHandles(dwFlags: DWORD; dwTimeOut: DWORD;
  //cHandles: LongWord; const lpHandles: array of THandle; var lpdwIndex: DWORD): HRESULT;
//var
  //WaitResult: DWORD;
  //OleThreadWnd: HWnd;
  //Msg: TMsg;
//begin
  //WaitResult := 0; // supress warning
  //OleThreadWnd := GetOleThreadWindow;
  //if OleThreadWnd <> 0 then
    //while True do
    //begin
      //WaitResult := MsgWaitForMultipleObjectsEx(cHandles, lpHandles, dwTimeOut, QS_ALLEVENTS, dwFlags);
      //if WaitResult = WAIT_OBJECT_0 + cHandles then
      //begin
        //if PeekMessage(Msg, OleThreadWnd, 0, 0, PM_REMOVE) then
        //begin
          //TranslateMessage(Msg);
          //DispatchMessage(Msg);
        //end;
      //end else
        //Break;
    //end
  //else
    //WaitResult := WaitForMultipleObjectsEx(cHandles, lpHandles,
      //dwFlags and COWAIT_WAITALL <> 0, dwTimeOut, dwFlags and COWAIT_ALERTABLE <> 0);
  //if WaitResult = WAIT_TIMEOUT then
    //Result := RPC_E_TIMEOUT
  //else if WaitResult = WAIT_IO_COMPLETION then
    //Result := RPC_S_CALLPENDING
  //else
  //begin
    //Result := S_OK;
    //if (WaitResult >= WAIT_ABANDONED_0) and (WaitResult < WAIT_ABANDONED_0 + cHandles) then
      //lpdwIndex := WaitResult - WAIT_ABANDONED_0
    //else
      //lpdwIndex := WaitResult - WAIT_OBJECT_0;
  //end;
//end;
//
//method CoWaitForMultipleHandles(dwFlags: DWORD; dwTimeOut: DWORD;
  //cHandles: LongWord; const Handles: array of THandle; var lpdwIndex: DWORD): HRESULT;
//
  //method LookupProc;
  //var
    //Ole32Handle: HMODULE;
  //begin
    //CoWaitChecked := True;
    //Ole32Handle := GetModuleHandle('ole32.dll'); //do not localize
    //if Ole32Handle <> 0 then
      //CanCoWaitForMultipleHandles := GetProcAddress(Ole32Handle, 'CoWaitForMultipleHandles') <> nil; { do not localize}
  //end;
//
//begin
  //if not CoWaitChecked then
    //LookupProc;
  //if CanCoWaitForMultipleHandles then
    //Result := _CoWaitForMultipleHandles(dwFlags, dwTimeOut, cHandles, Handles, lpdwIndex)
  //else
    //Result := InternalCoWaitForMultipleHandles(dwFlags, dwTimeOut, cHandles, Handles, lpdwIndex);
//end;

{ THandleObject }

//constructor THandleObject.Create(UseComWait: Boolean);
//begin
  //inherited Create;
  //FUseCOMWait := UseCOMWait;
//end;
//
//method THandleObject.Finalize;
//begin
  //if FHandle <> 0 then
    //CloseHandle(FHandle);
  //inherited;
//end;
//
//destructor THandleObject.Destroy;
//begin
  //if FHandle <> 0 then
    //CloseHandle(FHandle);
  //FHandle := 0;
  //System.GC.SuppressFinalize(self);
  //inherited;
//end;
//
//method THandleObject.WaitFor(Timeout: LongWord): TWaitResult;
//var
  //Index: DWORD;
//begin
  //if FUseCOMWait then
  //begin
    //case CoWaitForMultipleHandles(0, TimeOut, 1, FHandle, Index) of
      //S_OK: Result := wrSignaled;
      //RPC_S_CALLPENDING,
      //RPC_E_TIMEOUT: Result := wrTimeout;
    //else begin begin
      //Result := wrError;
      //FLastError := GetLastError;
    //end; end; end;
  //end else
  //begin
    //case WaitForSingleObject(Handle, Timeout) of
      //WAIT_ABANDONED: Result := wrAbandoned;
      //WAIT_OBJECT_0: Result := wrSignaled;
      //WAIT_TIMEOUT: Result := wrTimeout;
      //WAIT_FAILED:
        //begin
          //Result := wrError;
          //FLastError := GetLastError;
        //end;
    //else begin begin
      //Result := wrError;
    //end; end; end;
  //end;
//end;

{ TEvent }

//constructor TEvent.Create(var EventAttributes: TSecurityAttributes; ManualReset,
  //InitialState: Boolean; const Name: DelphiString; UseCOMWait: Boolean);
//begin
  //inherited Create(UseCOMWait);
  //FHandle := CreateEvent(EventAttributes, ManualReset, InitialState, Name);
//end;
//
//constructor TEvent.Create(EventAttributes: IntPtr; ManualReset,
  //InitialState: Boolean; const Name: DelphiString; UseCOMWait: Boolean);
//begin
  //inherited Create(UseCOMWait);
  //FHandle := CreateEvent(EventAttributes, ManualReset, InitialState, Name);
//end;
//
//constructor TEvent.Create(UseCOMWait: Boolean);
//begin
  //Create(nil, True, False, '', UseCOMWait);
//end;
//
//method TEvent.SetEvent;
//begin
  //Windows.SetEvent(Handle);
//end;
//
//method TEvent.ResetEvent;
//begin
  //Windows.ResetEvent(Handle);
//end;
//
{ TCriticalSection }

constructor TCriticalSection;
begin
  inherited Create;
  FObject := new Object;
end;

method TCriticalSection.Acquire;
begin
  System.Threading.Monitor.Enter(FObject);
end;

method TCriticalSection.Release;
begin
  System.Threading.Monitor.Exit(FObject);
end;

method TCriticalSection.TryEnter: Boolean;
begin
  Result := System.Threading.Monitor.TryEnter(FObject);
end;

method TCriticalSection.Enter;
begin
  Acquire;
end;

method TCriticalSection.Leave;
begin
  Release;
end;

{TMutex }

//method TMutex.Acquire;
//begin
  //if WaitFor(INFINITE) = wrError then
    //RaiseLastOSError;
//end;
//
//constructor TMutex.Create(UseCOMWait: Boolean);
//begin
  //Create(nil, False, '', UseCOMWait);
//end;
//
//constructor TMutex.Create(var MutexAttributes: TSecurityAttributes;
  //InitialOwner: Boolean; const Name: DelphiString; UseCOMWait: Boolean);
//begin
  //inherited Create(UseCOMWait);
  //FHandle := CreateMutex(MutexAttributes, InitialOwner, Name);
  //if FHandle = 0 then
    //RaiseLastOSError;
//end;
//
//constructor TMutex.Create(MutexAttributes: IntPtr;
  //InitialOwner: Boolean; const Name: DelphiString; UseCOMWait: Boolean);
//begin
  //inherited Create(UseCOMWait);
  //FHandle := CreateMutex(MutexAttributes, InitialOwner, Name);
  //if FHandle = 0 then
    //RaiseLastOSError;
//end;
//
//constructor TMutex.Create(DesiredAccess: LongWord; InheritHandle: Boolean;
  //const Name: DelphiString; UseCOMWait: Boolean);
//begin
  //inherited Create(UseCOMWait);
  //FHandle := OpenMutex(DesiredAccess, InheritHandle, Name);
  //if FHandle = 0 then
    //RaiseLastOSError;
//end;
//
//method TMutex.Release;
//begin
  //if not ReleaseMutex(FHandle) then
    //RaiseLastOSError;
//end;

end.