#NoEnv
#SingleInstance force

#InstallKeybdHook
#InstallMouseHook

SendMode Event
SetKeyDelay 10

;; Configuration

jaWindow := "Jedi Knight�: Jedi Academy (MP)"

; Make sure you don't map any keys in-game to Alt or [.

bind_toggle := "Alt"
bind_swingBlock := "["

bind_attack := "LButton"
bind_block := "RButton"
bind_run := "Space" ; Make sure "Always Run" is set to "No" inside the game.

;; Main Logic

isDuelMode := true
isRunToggled := false

; yellowComboDelay := 550 ; ~100 half swing ~160 upper diagonal
; purpleComboDelay := 600
; redComboDelay := 700

; Hotkey, *%bind_toggle%, label_toggle

; Hotkey %bind_attack%, label_attack
; Hotkey %bind_block%, label_block
; Hotkey %bind_walk%, label_moveBack

; Hotkey %bind_attack% Up, label_attack_release
; Hotkey, %bind_block% Up, label_block_release
; Hotkey %bind_walk% Up, label_walk_release

StartAttacking() {
  global bind_attack
  Send, {%bind_attack% DownTemp}
}

FinishAttacking() {
  global bind_attack
  Send, {%bind_attack% Up}
}

Guard() {
  global bind_block
  Send, {%bind_block% Down}
}

CancelGuard() {
  global bind_block
  Send, {%bind_block% Up}
}

Run() {
  global bind_run
  Send, {%bind_run% Down}
}

CancelRun() {
  global bind_run
  Send, {%bind_run% Up}
}

ReleaseAllButtons() {
  CancelGuard()
  CancelRun()
  isRunToggled := false
}

WinActivate, %jaWindow%
WinWaitActive, %jaWindow%
Sleep, 100
Guard()

; TODO: Get this dynamically from bind_toggle
~*Alt::
  Suspend
  ;if (!WinActive(jaWindow))
  ;  return
  isDuelMode := !isDuelMode
  if (!isDuelMode) {
    ReleaseAllButtons()
  } else {
    Guard()
  }
  return

; Swing-block with one key.
; TODO: Get this dynamically from bind_swingBlock
~*[::
  CancelGuard()
  StartAttacking()
  FinishAttacking()
  Guard()
  return
  
~*[ Up::
  Sleep, 10
  if (isRunToggled) {
    isRunToggled := false
    CancelRun()
  }

; Always block in duel mode.
; TODO: Get this dynamically from bind_block
~*RButton Up::
  Sleep, 10
  if (isRunToggled) {
    isRunToggled := false
    CancelRun()
  }
  Guard()
  return
  
; In case of a manual attack, cancel running.
; TODO: Get this dynamically from bind_attack
~*LButton Up::
  Sleep, 10
  if (isRunToggled) {
    isRunToggled := false
    CancelRun()
  }
  return
  
; Toggle run on/off instead of having to keep the run button pressed.
; TODO: Get this dynamically from bind_run
~*Space Up::
  Sleep, 10
  isRunToggled := !isRunToggled
  if (isRunToggled) {
    CancelGuard()
    Run()
  } else {
    CancelRun()
    Guard()
  }
  return
  
OnExit:
  ReleaseAllButtons()
  return
