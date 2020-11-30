; Stop Oculus service from running when OculusClient.exe is stopped
; Amazingly it can take up to 500mb(!) of anonymous memory and doesn't release it

; TODO: Better handling if UAC elevation fails.

#NoEnv
#Warn
#Persistent
SendMode Input
SetWorkingDir %A_ScriptDir%

if !A_IsAdmin {
    Run *RunAs %A_ScriptFullPath%
    ExitApp
}

SetTimer, StopIfOculusNotRunning, 60000

ProcessExists(exe){
    Process,Exist,%exe%
    return errorlevel
}

StopIfOculusNotRunning:
    If (ProcessExists("OVRServer_x64.exe") && !WinExist("ahk_exe OculusClient.exe")) {
        TrayTip, Stopping Oculus service, , , 1
        RunWait, sc stop OVRService, , Hide
    }
