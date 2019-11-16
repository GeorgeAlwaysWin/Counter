unit UServer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Sockets, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    TcpServer1: TTcpServer;
    Host: TLabeledEdit;
    Port: TLabeledEdit;
    Button1: TButton;
    procedure TcpServer1Accept(Sender: TObject;
      ClientSocket: TCustomIpClient);
    procedure Button1Click(Sender: TObject);
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



procedure TForm1.Button1Click(Sender: TObject);
begin
TcpServer1.LocalHost:=Host.Text;
TcpServer1.LocalPort:=Port.Text;
end;

end.
