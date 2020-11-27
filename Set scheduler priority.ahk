; Scheduler priority defaults for MP games.

; Games: Above normal (should be prioritised over system)
; OBS: High (game can afford to lose a few frames)

#NoEnv
#Warn
#Persistent
SendMode Input
SetWorkingDir %A_ScriptDir%
DetectHiddenWindows, On

GroupAdd, Games, ahk_exe acs.exe
GroupAdd, Games, ahk_exe WatchDogs2.exe
GroupAdd, Games, ahk_exe ACS.exe
GroupAdd, Games, ahk_exe WatchDogsLegion.exe
GroupAdd, Recorders, ahk_exe obs64.exe

SetTimer, UpdateSchedulerPriorities, 60000

UpdateSchedulerPriorities:
    WinGet, games, List, ahk_group Games
    Loop %games% {
		wid := games%A_Index%
		WinGet, pid, ProcessName, ahk_id %wid%
		Process, priority, %pid%, AboveNormal
    }

    WinGet, recorders, List, ahk_group Recorders
    Loop %recorders% {
		wid := recorders%A_Index%
		WinGet, pid, ProcessName, ahk_id %wid%
		Process, priority, %pid%, High
    }
