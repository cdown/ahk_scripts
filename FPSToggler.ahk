#SingleInstance force

if !A_IsAdmin {
    Run *RunAs %A_ScriptFullPath%
    ExitApp
}

idx = 1

; Examples that make sense in Fallout 4.
; 
; 0: Unlimited, since load time is tied to FPS (...)
; 90: The game generally works fine at this framerate
; 30: Sometimes door/terminal pathing will get stuck, this fixes it
;
; Hold the key until the desired effect is achieved, then the game will revert
; to default_fps.
default_fps = 90
pathing_fps = 30
unlimited_fps = 0

; GroupAdd for each game this should apply to.
GroupAdd, Games, ahk_exe Fallout4.exe

set_fps(fps) {
    ControlClick, x480 y230, RivaTunerStatisticsServer
    ControlSend, ahk_parent, %fps%{enter}, RivaTunerStatisticsServer
}

set_fps(default_fps)

#IfWinActive, ahk_group Games
PgUp::
    set_fps(unlimited_fps)
    KeyWait, PgUp
    set_fps(default_fps)
Return

PgDn::
    set_fps(pathing_fps)
    KeyWait, PgDn
    set_fps(default_fps)
Return
#IfWinActive
