#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

;Alt::Ctrl
;Ctrl::Alt
SetCapsLockState, AlwaysOff
; CapsLock::Send {Esc}

CapsLock & i::
    if GetKeyState("Alt", "P") and GetKeyState("Shift", "P")
        send ^+{up}
    Else If GetKeyState("Shift", "P")
        send +{up}
    Else if GetKeyState("Alt", "P")
        send ^{up}
    Else if GetKeyState("Ctrl", "P")
        send !{up}
    Else
        send {up}

return
CapsLock & j::
    if GetKeyState("Alt", "P") and GetKeyState("Shift", "P")
        send ^+{left}
    Else If GetKeyState("Shift", "P")
        send +{left}
    Else if GetKeyState("Alt", "P")
        send ^{left}
    Else if GetKeyState("Ctrl", "P")
        send !{left}
    Else
        send {left}
return

CapsLock & k::
    if GetKeyState("Alt", "P") and GetKeyState("Shift", "P")
        send ^+{down}
    Else If GetKeyState("Shift", "P")
        send +{down}
    Else if GetKeyState("Alt", "P")
        send ^{down}
    Else if GetKeyState("Ctrl", "P")
        send !{down}
    Else
        send {down}
return

CapsLock & l::
    if GetKeyState("Alt", "P") and GetKeyState("Shift", "P")
        send ^+{right}
    Else If GetKeyState("Shift", "P")
        send +{right}
    Else if GetKeyState("Alt", "P")
        send ^{right}
    Else if GetKeyState("Ctrl", "P")
        send !{right}
    Else
        send {right}
return

;CapsLock & h::
;	If GetKeyState("Shift", "P")
;		send +{home}
;	Else
;		send {home}
;return

; CapsLock & n::
;     If GetKeyState("Shift", "P")
;         send +{end}
;     Else
;         send {end}
; return

CapsLock & u::
    If GetKeyState("Shift", "P")
        send +{home}
    Else
        send {home}
return

CapsLock & o::
    If GetKeyState("Shift", "P")
        send +{end}
    Else
        send {end}
return

CapsLock & [::
    If GetKeyState("Alt", "P")
        send ^{backspace}
    Else
        send {backspace}
return
CapsLock & ]::
    If GetKeyState("Alt", "P")
        send ^{delete}
    Else
        send {delete}
return

