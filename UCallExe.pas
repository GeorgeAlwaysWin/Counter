unit UCallExe;

interface

uses Windows, Messages, SysUtils;

var   StartInfo:TStartupInfo;
  ProcessInfo:TProcessInformation;

const Name='Stones';

implementation

Initialization
begin
CreateProcess
(nil,'PCounter.exe '+Name+' Enter',nil,nil,
false,NORMAL_PRIORITY_CLASS,nil,nil,StartInfo,ProcessInfo);

end;

finalization
begin
CreateProcess
(nil,'PCounter.exe '+Name+' Exit',nil,nil,false,NORMAL_PRIORITY_CLASS,nil,nil,StartInfo,ProcessInfo);
end;


end.
