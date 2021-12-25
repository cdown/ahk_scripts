#SingleInstance force

if !A_IsAdmin {
    Run *RunAs %A_ScriptFullPath%
    ExitApp
}

idx = 1

; Examples that make sense in Fallout 4.
; 
; 90: The game generally works fine at this framerate
; 30: Sometimes door/terminal pathing will get stuck, this fixes it
fps_list := [90, 30]
Return

Home::
    fps := fps_list[idx]
    idx := Mod(idx, fps_list.MaxIndex()) + 1

    ControlClick,x480 y230,RivaTunerStatisticsServer
    ControlSend,ahk_parent,%fps%{enter},RivaTunerStatisticsServer
Return
