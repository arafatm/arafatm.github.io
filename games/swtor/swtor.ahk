Del::Suspend  ; Assign the toggle-suspend function to a hotkey.

d::
  ;; Send %A_Tab%
  Send ^1
  Send ^2
  Send ^3
  Send ^4
  Send ^5
  Send ^6
  Send ^7
  Send ^8
  Send ^9
  Send ^0
  Send ^-
  Send ^1
  Send ^2
  Send ^3
  ;; Send ^``
  ;; Send ``
Return

F8::
  Loop 600
  {
    Send l
    Sleep 3300
  }
Return
