; https://chrisdown.name/2020/11/16/living-with-the-kinesis-advantage-2.html

#NoEnv
#Warn
#SingleInstance force
SendMode Input
SetWorkingDir %A_ScriptDir%

GroupAdd, Games, ahk_exe WatchDogs2.exe
GroupAdd, Games, ahk_exe WatchDogsLegion.exe

#If WinActive("ahk_group Games")
Space::Backspace
Backspace::Space
#If
