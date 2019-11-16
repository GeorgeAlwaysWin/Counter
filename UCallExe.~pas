unit UCallExe;

interface

uses Windows, Messages, SysUtils;

var   StartInfo:TStartupInfo;
  ProcessInfo:TProcessInformation;

const Name='Stones';
      Host='127.0.0.1 ';
      Port='8888 ';

implementation

Initialization
begin
CreateProcess
(nil,'PCounter.exe '+Host+Port+Name+' Enter',nil,nil,
false,NORMAL_PRIORITY_CLASS,nil,nil,StartInfo,ProcessInfo);

end;

finalization
begin
CreateProcess
(nil,'PCounter.exe '+Host+Port+Name+' Exit',nil,nil,false,NORMAL_PRIORITY_CLASS,nil,nil,StartInfo,ProcessInfo);
end;


end.
