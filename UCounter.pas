unit UCounter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Dialogs, StdCtrls, Sockets, Forms;

var f, foff: Text;
    ename, SParam, enameoff, Soff: String;
    I: integer;
    TcpC: TTcpClient;
    online: boolean;

implementation

procedure SendLog;
var
  stream: TMemoryStream;
begin
  TcpC.Active:=True;
  if TcpC.Connect then
  begin
    stream := TMemoryStream.Create;
    stream.LoadFromFile(ename);
    TcpC.Sendln(IntToStr(stream.Size));
    if TcpC.Receiveln = 'ok' then
      TcpC.SendBuf(stream.Memory^, stream.Size);
    TcpC.Active := false;
    TcpC.Disconnect;
  end
  else online:=false;
end;

Procedure GetLog;
var
msg : string;
sz : integer;
  stream: TMemoryStream;
begin
  tcpC.Active := true;
 if TcpC.Connect then
  begin
    TcpC.Sendln('Update');
    msg := TcpC.Receiveln;
      sz := StrToInt(msg);
      stream := TMemoryStream.Create;
      stream.SetSize(sz);
      tcpC.Sendln('go');

      TcpC.ReceiveBuf(stream.Memory^, sz);
      stream.SaveToFile(ename);
    TcpC.Disconnect;
  end
  else online:=false;
  TcpC.Active := false;
end;

begin
CreateDir('logs');
ename:=ExtractFilePath(ParamStr(0))+'logs\log.txt';
enameoff:=ExtractFilePath(ParamStr(0))+'logs\offlinelog.txt';

 for I:=1 to paramcount do
 SParam:=SParam+' '+ParamStr(I);

  AssignFile(foff, enameoff);
  If fileexists(enameoff) then
  Append(foff)
  else
  Rewrite(foff);

  Writeln(foff,TimeToStr(Time)+' '+DateToStr(Date)+SParam);


  TcpC := TTcpClient.Create(Application);
  TcpC.RemoteHost:='127.0.0.1';
  TcpC.RemotePort:='8888';
  online:=true;

  GetLog;

if online=true then
begin

  AssignFile(f, ename);
  If fileexists(ename) then
  Append(f)
  else
  Rewrite(f);

  reset(foff);
  while not eof (foff) do begin
  Readln(foff,soff);
  writeln(f, soff);
  end;
  CloseFile(f);

  SendLog;
end;

if online=true then
Rewrite(foff);

CloseFile(foff);

end.
