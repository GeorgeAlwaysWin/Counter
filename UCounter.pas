unit UCounter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Dialogs;

var f: Text;
    ename, SParam: String;
    I:integer;

implementation

begin
CreateDir('logs');
ename:=ExtractFilePath(ParamStr(0))+'logs\log.txt';

AssignFile(f, ename);
If fileexists(ename) then
Append(f)
else
Rewrite(f);
 for I:=1 to paramcount do
 SParam:=SParam+' '+ParamStr(I);
 Writeln(f,TimeToStr(Time)+' '+DateToStr(Date)+SParam);
 CloseFile(f);


end.
