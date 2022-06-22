#Persistent
#SingleInstance, Force
#NoEnv
#UseHook
#InstallKeybdHook
#InstallMouseHook
#HotkeyInterval, 2000
#MaxHotkeysPerInterval,200
Process, Priority,, Realtime2
SendMode, Input
SetWorkingDir %A_ScriptDir%
SetTitleMatchMode, 2

;; -------------------------------
;; jis2us
;; -------------------------------

;;; -- 1st row

  VKF4::Send,{``}           ;         半角/全角     -> `
  +VKF4::Send,{~}           ; Shift + 半角/全角     -> ~
  +2::Send,{@}              ; Shift + 2         ["] -> @
  +6::Send,{^}              ; Shift + 6         [&] -> ^
  +7::Send,{&}              ; Shift + 7         ['] -> &
  +8::Send,{*}              ; Shift + 8         [(] -> *
  +9::Send,{(}              ; Shift + 9         [)] -> (
  +0::Send,{)}              ; Shift + 0         [ ] -> )
  +-::Send,{_}              ; Shift + -         [=] -> _
  ^::Send,{=}               ;                   [^] -> =
  +^::Send,{+}              ; Shift + ^         [~] -> +

;; -- 2nd row

  @::[                      ;                   [@] -> [
  +@::{                     ; Shift + @         [`] -> {
  [::]                      ;                   [[] -> ]
  +[::Send,{}}              ; Shift + [         [{] -> }

;; -- 3rd row

  +;::Send,{:}              ; Shift + ;         [+] -> :
  :::Send,{'}               ;                   [:] -> '
  *::Send,{"}               ; Shift + :         [*] -> "


;; -------------------------------
;; alt-ime
;; -------------------------------

  *~LAlt::Send,{Blind}{vk07}
  LAlt up::
    if (A_PriorHotkey == "*~LAlt")
    {
       Send,{VK1D}
    }
    Return

  *~RAlt::Send,{Blind}{vk07}
  RAlt up::
    if (A_PriorHotkey == "*~RAlt")
    {
        Send,{VK1C}
    }
    Return


