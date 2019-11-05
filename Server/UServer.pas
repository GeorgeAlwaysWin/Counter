unit UServer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Sockets, StdCtrls;

type
  TForm1 = class(TForm)
    TcpServer1: TTcpServer;
    procedure TcpServer1Accept(Sender: TObject;
      ClientSocket: TCustomIpClient);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.TcpServer1Accept(Sender: TObject;
  ClientSocket: TCustomIpClient);
var
  stream: TMemoryStream;
  msg: string;
  sz: integer;
begin
  if ClientSocket.Connect then
  begin
    msg := ClientSocket.Receiveln;
      if msg = 'Update' then
      begin
      stream := TMemoryStream.Create;
      stream.LoadFromFile('log.txt');
      ClientSocket.Sendln(inttostr(stream.Size));
       if (ClientSocket.Receiveln = 'go') then  ClientSocket.SendBuf(stream.Memory^, stream.Size);
      end
      else
      begin
      stream := TMemoryStream.Create;
      sz := StrToInt(msg);
      stream.SetSize(sz);
      ClientSocket.Sendln('ok');

      ClientSocket.ReceiveBuf(stream.Memory^, sz);
      stream.SaveToFile('log.txt');
      stream.Free;
      end;
    end;

    ClientSocket.Disconnect;
  end;



end.
