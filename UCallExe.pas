unit UCallExe;

interface

uses Windows, Messages, SysUtils;

var   StartInfo:TStartupInfo;
  ProcessInfo:TProcessInformation;

implementation

Initialization
begin
CreateProcess
(nil,'C:\Users\user\Desktop\Counter\PCounter.exe',nil,nil,false,NORMAL_PRIORITY_CLASS,nil,nil,StartInfo,ProcessInfo);
end;

{finalization
begin
CreateProcess
(nil,'C:\Users\user\Desktop\Counter\PCounter.exe',nil,nil,false,NORMAL_PRIORITY_CLASS,nil,nil,StartInfo,ProcessInfo);
end;                       }


end.
 