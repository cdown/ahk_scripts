; https://chrisdown.name/2020/11/16/living-with-the-kinesis-advantage-2.html

#NoEnv
#Warn
#SingleInstance force
SendMode Input
SetWorkingDir %A_ScriptDir%

GroupAdd, Games, ahk_exe WatchDogs2.exe
GroupAdd, Games, ahk_exe WatchDogsLegion.exe
GroupAdd, Games, ahk_exe Cyberpunk2077.exe

#If WinActive("ahk_group Games")
Space::Backspace
Backspace::Space

; Rebound in Windows, but games using raw input still see Caps Lock
CapsLock::Ctrl

; Only activate Windows key in game if it's held for half a second
$LWin::
    KeyWait, LWin, T0.5
    If ErrorLevel {
        ; More than 0.5 seconds
        Send, {LWin Down}
        KeyWait, LWin
        Send, {LWin Up}
    }
Return
#If
