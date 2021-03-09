#IfWinActive, ahk_exe alacritty.exe

; Ctrl+Shift+V -- change line endings
^+v::
    ClipboardBackup := Clipboard                        ; To restore clipboard contents after paste
    FixString := StrReplace(Clipboard, "`r`n", "`n")    ; Change endings
    Clipboard := FixString                              ; Set to clipboard
    Send ^+v                                            ; Paste text
    Clipboard := ClipboardBackup                        ; Restore clipboard that has windows endings
    return

#IfWinActive