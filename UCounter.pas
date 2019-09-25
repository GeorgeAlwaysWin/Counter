unit UCounter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Dialogs;

var f: Text;
    ActiveWindow, FirstWindow : HWND;
    Title : String;
    I : boolean;


implementation

function GetWindowTitle(h:HWND):string;
var
  buf : array[0..255] of char;
begin
  GetWindowText(h, buf, 256);
  result:=buf;
end;

begin
FirstWindow:=GetForegroundWindow;

Repeat
ActiveWindow:=GetForegroundWindow;
If ActiveWindow<>FirstWindow then
break;
Until I=True;

AssignFile(f,'C:\Users\user\Desktop\Counter\logs\log.txt');
If fileexists('C:\Users\user\Desktop\Counter\logs\log.txt') then
Append(f)
else
Rewrite(f);
Title:=GetWindowTitle(ActiveWindow);
 Writeln(f,TimeToStr(Time)+' '+DateToStr(Date)+' '+Title);
 CloseFile(f);


end.
