#InstallKeybdHook

; https://autohotkey.com/board/topic/15574-morse-find-hotkey-press-and-hold-patterns/

; F13 and F14 are valid keys but not used, so I added it to logitech's software and handle it here
;
; https://www.reddit.com/r/AutoHotkey/comments/945x2q/unused_keys_for_mapping/
;
; Use this command to set FN key when in logitech's software
;
; LButton::Send {F15}

F13 & WheelUp::Send {Volume_Up}
F13 & WheelDown::Send {Volume_Down}

F14 & WheelUp::Send {WheelRight}
F14 & WheelDown::Send {WheelLeft}

F14 & F13::Send ^;
F13 & F14::Send ^;

F14 & LButton::Send {Backspace}
F14 & RButton::Send {Enter}

Morse(timeout = 200) { 
   tout := timeout/1000
   key := RegExReplace(A_ThisHotKey,"[\*\~\$\#\+\!\^]")
   Loop {
      t := A_TickCount
      KeyWait %key%
      Pattern .= A_TickCount-t > timeout
      KeyWait %key%,DT%tout%
      If (ErrorLevel)
         Return Pattern
   }
}

F14::
   p := Morse()
   If (p = "0")
      Send {Home}
   Else If (p = "00")
      Send {F5}
   Else If (p = "01")
      Send !{Right}
   Else
      MsgBox Press pattern %p%
Return

F13::
   p := Morse()
   If (p = "0")
      Send {End}
   Else If (p = "00")
      Send +{F5}
   Else If (p = "01")
      Send !{Left}
   Else
      MsgBox Press pattern %p%
Return

+F14::
   p := Morse()
   If (p = "0")
      Send +{Home}
   Else If (p = "00")
      Send +{F5}
   Else
      MsgBox Press pattern %p%
Return

+F13::
   p := Morse()
   If (p = "0")
      Send +{End}
   Else If (p = "00")
      Send +{F5}
   Else
      MsgBox Press pattern %p%
Return

^F14::
   p := Morse()
   If (p = "0")
      Send ^{Home}
   Else If (p = "00")
      Send ^{F5}
   Else
      MsgBox Press pattern %p%
Return

^F13::
   p := Morse()
   If (p = "0")
      Send ^{End}
   Else If (p = "00")
      Send ^{F5}
   Else
      MsgBox Press pattern %p%
Return

^+F14::
   p := Morse()
   If (p = "0")
      Send ^+{Home}
   Else If (p = "00")
      Send ^+{F5}
   Else
      MsgBox Press pattern %p%
Return

^+F13::
   p := Morse()
   If (p = "0")
      Send ^+{End}
   Else If (p = "00")
      Send ^+{F5}
   Else
      MsgBox Press pattern %p%
Return