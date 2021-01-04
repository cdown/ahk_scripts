#NoEnv
#Warn
#SingleInstance force
SendMode Input
SetWorkingDir %A_ScriptDir%

activeWindowIsFullscreen() {
    winID := WinExist("A")
    WinGet style, Style, ahk_id %winID%
    WinGetPos ,,,winW,winH, A
    ; 0x800000 is WS_BORDER, 0x20000000 is WS_MINIMIZE.
    Return ((style & 0x20800000) or winH < A_ScreenHeight or winW < A_ScreenWidth) ? false : true
}

#If activeWindowIsFullscreen()
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
