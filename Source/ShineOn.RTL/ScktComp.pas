namespace ShineOn.Rtl;

interface

uses
  ShineOn.Rtl,
  System.Net.Sockets;

type
  TClientType = public (ctNonBlocking, ctBlocking);
  ESocketError = public class(Exception);


  TCustomWinSocket = public class
  private
    fSocket: Socket;
    function getConnected: Boolean;
  protected
    function DoGetNewSocket: Socket; virtual;
  public
    procedure Open(const Name, Address: string; Port: Word);
    procedure Close; 
    procedure Disconnect; virtual;
    property NetSocket: Socket read fSocket;
    property Connected: Boolean read getConnected;
  end;

  TClientWinSocket = public class(TCustomWinSocket)
  private
    fClientType: TClientType := TClientType.ctBlocking;
    function getClientType: TClientType;
    procedure setClientType(AValue: TClientType);
  protected
    function DoGetNewSocket: Socket; override;
  public
    property ClientType: TClientType read getClientType write setClientType;
  end;




  TAbstractSocket = public class
  private
  protected
    FPort: Integer;
    FAddress: string;
    FHost: string;
    function GetActive: Boolean; virtual; abstract;
    procedure DoActivate(Value: Boolean); virtual; abstract;
    procedure SetActive(Value: Boolean);
    procedure SetAddress(Value: string);
    procedure SetHost(Value: string);
    procedure SetPort(Value: Integer);
  public
    constructor Create; virtual;
    procedure Open;
    procedure Close;
    property Active: Boolean read GetActive write SetActive;
    property Address: string read FAddress write SetAddress;
    property Host: string read FHost write SetHost;
    property Port: Integer read FPort write SetPort;
  end;

  TCustomSocket = public class(TAbstractSocket)
  private
  public
  end;

  TWinSocketStream = public class(TStream)
  private
    FSocket: TCustomWinSocket;
    FTimeout: Longint;
  assembly or protected
    //All abstract methods from TStream need to be implemented
    function ReadLine:String; override;
    procedure WriteLine(Value:String); override;
  protected
    procedure SetSize(const NewSize: Int64); override;
  public
    constructor Create(ASocket: TCustomWinSocket; TimeOut: Longint);
    function WaitForData(Timeout: Longint): Boolean;
    function Read(var Buffer: TBytes; Offset: LongInt; Count: LongInt): Longint; override;
    function Write(const Buffer: TBytes; Offset: LongInt; Count: LongInt): Longint; override;
    function Seek(const Offset: Int64; Origin: TSeekOrigin): Int64; override;
    property TimeOut: Longint read FTimeout write FTimeout;
  end;

  TClientSocket = public class(TCustomSocket)
  private
    FClientSocket: TClientWinSocket;
  protected
    function GetActive: Boolean; override;
    procedure DoActivate(Value: Boolean); override;
    function GetClientType: TClientType;
    procedure SetClientType(Value: TClientType);
  public
    constructor Create; override; 
    property ClientType: TClientType read GetClientType write SetClientType;
    property Socket: TClientWinSocket read FClientSocket;
  end;

implementation

uses
  System.Net;

constructor TClientSocket.Create;
begin
  inherited Create;
  FClientSocket:=TClientWinSocket.Create;
end;

procedure TClientSocket.DoActivate(Value: Boolean);
begin
  if Value<>FClientSocket.Connected then
  begin
    if FClientSocket.Connected then
      FClientSocket.Disconnect
    else FClientSocket.Open(FHost, FAddress, FPort);
  end;
end;

function TClientSocket.GetClientType: TClientType;
begin
  Result:=FClientSocket.ClientType;
end;

procedure TClientSocket.SetClientType(Value: TClientType);
begin
  FClientSocket.ClientType:=Value;
end;

function TClientSocket.GetActive: Boolean;
begin
  Result:=FClientSocket.Connected;
end;

procedure TAbstractSocket.SetActive(Value: Boolean);
begin
  DoActivate(Value);
end;

procedure TAbstractSocket.SetAddress(Value: string);
begin
  if Active then
    raise ESocketError.Create(sCantChangeWhileActive);
  fAddress:=Value;
end;

procedure TAbstractSocket.SetHost(Value: string);
begin
  if Active then
    raise ESocketError.Create(sCantChangeWhileActive);
  fHost:=Value;
end;

procedure TAbstractSocket.SetPort(Value: Integer);
begin
  if Active then
    raise ESocketError.Create(sCantChangeWhileActive);
  fPort:=Value;
end;

procedure TAbstractSocket.Open;
begin
  Active:=True;
end;

procedure TAbstractSocket.Close;
begin
  Active:=False;
end;

constructor TAbstractSocket.Create;
begin
  inherited Create;
end;

procedure TCustomWinSocket.Disconnect;
begin
  if Assigned(fSocket) then fSocket.Close;  //Check if Assigned for better efficiency

  //The winsocket cannot be re-used because of some limitation with the .net socket componet.
  //So... we will remove it and make a new one for the case that a person wants to do the 
  //connection again...  RPB 2010/09/30
  fSocket.Free;
  fSocket:=nil; 
end;

function TCustomWinSocket.getConnected: Boolean;
begin
  Result:=Assigned(fSocket) and fSocket.Connected;
end;

procedure TCustomWinSocket.Open(const Name, Address: string; Port: Word);
var
  lIPAddress: IPAddress;
  lIPHost: IPHostEntry;
  lEndPoint: EndPoint;
begin
  if Name<>'' then
  begin
    lIPHost := Dns.Resolve(Name);
    if Length(lIPHost.AddressList) > 0 then
      lIPAddress := lIPHost.AddressList[0]
    else
      raise new ESocketError(Format('Host %s not found.', [Name]));
  end 
  else if Address<>'' then
  begin
    lIPAddress:=IPAddress.Parse(Address);
  end else
  begin
    raise new ESocketError(Format('No host or address specified.', [Name]));
  end;
  
  lEndPoint := IPEndPoint.Create(lIPAddress, Port);

  //We need to reload the socket because we cannot connect more than once on the same socket
  Disconnect;  
  fSocket:=DoGetNewSocket;
  fSocket.Connect(lEndPoint);
end;

function TCustomWinSocket.DoGetNewSocket: Socket;
begin
  Result:=new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
  Result.Blocking:=True;  //Defaults to blocking...
end;

procedure TCustomWinSocket.Close;
begin
  Disconnect;
end;

function TClientWinSocket.getClientType: TClientType;
begin
  result:=fClientType;
end;

procedure TClientWinSocket.setClientType(AValue: TClientType);
begin
  fClientType:=AValue;
  if AValue <> FClientType then
  begin
    if Connected then
      FClientType := AValue
    else 
      raise ESocketError.Create(sCantChangeWhileActive);
  end;
end;

function TClientWinSocket.DoGetNewSocket: Socket;
begin
  Result:=inherited DoGetNewSocket;
  //We want to be sure that the client type is set correctly
  Result.Blocking:=fClientType = TClientType.ctBlocking;
end;

constructor TWinSocketStream.Create(ASocket: TCustomWinSocket; TimeOut: Longint);
begin
  FSocket:=ASocket;  
  FTimeOut:=TimeOut;
end;

function TWinSocketStream.WaitForData(Timeout: Longint): Boolean;
begin
  //For now return true if assigned
  Result:=Assigned(FSocket.NetSocket);
end;

function TWinSocketStream.Read(var Buffer: TBytes; Offset: LongInt; Count: LongInt): Longint;
begin
  if Assigned(FSocket.NetSocket) then 
    Result:=FSocket.NetSocket.Receive(Buffer, Offset, Count, SocketFlags.None)
  else
    Result:=0;
end;

function TWinSocketStream.Write(const Buffer: TBytes; Offset: LongInt; Count: LongInt): Longint;
begin
  if Assigned(FSocket.NetSocket) then 
    Result:=FSocket.NetSocket.Send(Buffer, Offset, Count, SocketFlags.None)
  else
    Result:=0;
end;

function TWinSocketStream.Seek(const Offset: Int64; Origin: TSeekOrigin): Int64;
begin
  Result:=0;
end;

function TWinSocketStream.ReadLine: String;
begin
  Result:='';
end;

procedure TWinSocketStream.WriteLine(Value:String);
begin
  //Not implemented
end;

procedure TWinSocketStream.SetSize(const NewSize: Int64);
begin
end;

end.