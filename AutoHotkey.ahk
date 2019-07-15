#InstallKeybdHook

;https://autohotkey.com/board/topic/15574-morse-find-hotkey-press-and-hold-patterns/

XButton1 & WheelUp::Send {Volume_Up}
XButton1 & WheelDown::Send {Volume_Down}

XButton2 & WheelUp::Send {WheelRight}
XButton2 & WheelDown::Send {WheelLeft}

XButton2 & XButton1::Send ^;
XButton1 & XButton2::Send ^;

XButton2 & LButton::Send {Backspace}
XButton2 & RButton::Send {Delete}

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

XButton2::
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

XButton1::
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

+XButton2::
   p := Morse()
   If (p = "0")
      Send +{Home}
   Else If (p = "00")
      Send +{F5}
   Else
      MsgBox Press pattern %p%
Return

+XButton1::
   p := Morse()
   If (p = "0")
      Send +{End}
   Else If (p = "00")
      Send +{F5}
   Else
      MsgBox Press pattern %p%
Return

^XButton2::
   p := Morse()
   If (p = "0")
      Send ^{Home}
   Else If (p = "00")
      Send ^{F5}
   Else
      MsgBox Press pattern %p%
Return

^XButton1::
   p := Morse()
   If (p = "0")
      Send ^{End}
   Else If (p = "00")
      Send ^{F5}
   Else
      MsgBox Press pattern %p%
Return

^+XButton2::
   p := Morse()
   If (p = "0")
      Send ^+{Home}
   Else If (p = "00")
      Send ^+{F5}
   Else
      MsgBox Press pattern %p%
Return

^+XButton1::
   p := Morse()
   If (p = "0")
      Send ^+{End}
   Else If (p = "00")
      Send ^+{F5}
   Else
      MsgBox Press pattern %p%
Return