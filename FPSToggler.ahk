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
fps_list := [0, 90, 30]

; GroupAdd for each game this should apply to.
GroupAdd, Games, ahk_exe Fallout4.exe

set_fps(fps) {
    ControlClick, x480 y230, RivaTunerStatisticsServer
    ControlSend, ahk_parent, %fps%{enter}, RivaTunerStatisticsServer
}

#IfWinActive, ahk_group Games
Home::
    set_fps(fps_list[idx])
    idx := Mod(idx, fps_list.MaxIndex()) + 1
Return
#IfWinActive
