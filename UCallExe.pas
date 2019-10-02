unit UCallExe;

interface

uses Windows, Messages, SysUtils;

var   StartInfo:TStartupInfo;
  ProcessInfo:TProcessInformation;

implementation

Initialization
begin
CreateProcess
(nil,'PCounter.exe TaskMaker_Fono Enter',nil,nil,
false,NORMAL_PRIORITY_CLASS,nil,nil,StartInfo,ProcessInfo);

end;

finalization
begin
CreateProcess
(nil,'PCounter.exe TaskMaker_Fono Exit',nil,nil,false,NORMAL_PRIORITY_CLASS,nil,nil,StartInfo,ProcessInfo);
end;


end.
