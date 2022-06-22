; #########################################################################################
; jis2us
; #########################################################################################

#UseHook

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ; 1段目
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 VKF4::Send,{``}    ;         半角/全角     -> `
 +VKF4::Send,{~}    ; Shift + 半角/全角     -> ~
 +2::Send,{@}       ; Shift + 2         ["] -> @
 +6::Send,{^}       ; Shift + 6         [&] -> ^
 +7::Send,{&}       ; Shift + 7         ['] -> &
 +8::Send,{*}       ; Shift + 8         [(] -> *
 +9::Send,{(}       ; Shift + 9         [)] -> (
 +0::Send,{)}       ; Shift + 0         [ ] -> )
 +-::Send,{_}       ; Shift + -         [=] -> _
 ^::Send,{=}        ;                   [^] -> =
 +^::Send,{+}       ; Shift + ^         [~] -> +
 \::Send,{BS}       ;                   [\] -> Backspace

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ; 2段目
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 @::[              ;                   [@] -> [
 +@::{             ; Shift + @         [`] -> {
 [::]              ;                   [[] -> ]
 +[::Send,{}}      ; Shift + [         [{] -> }

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ; 3段目
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 +;::Send,{:}      ; Shift + ;         [+] -> :
 :::Send,{'}       ;                   [:] -> '
 *::Send,{"}       ; Shift + :         [*] -> "
 ]::ENTER          ;                   []] -> ENTER
 +]::+ENTER        ; Shift + ]         [}] -> Shift + ENTER
 _::Send,{|}       ; Shift + \         [_] -> |



; #########################################################################################
; alt-ime
; #########################################################################################

; 左右 Alt キーの空打ちで IME の OFF/ON を切り替える
;
; 左 Alt キーの空打ちで IME を「英数」に切り替え
; 右 Alt キーの空打ちで IME を「かな」に切り替え
; Alt キーを押している間に他のキーを打つと通常の Alt キーとして動作
;
; Author:     karakaram   http://www.karakaram.com/alt-ime-on-off

#Include IME.ahk

; Razer Synapseなど、キーカスタマイズ系のツールを併用しているときのエラー対策
#MaxHotkeysPerInterval 350

; 上部メニューがアクティブになるのを抑制
*~LAlt::Send {Blind}{vk07}
*~RAlt::Send {Blind}{vk07}

; 左 Alt 空打ちで IME を OFF
LAlt up::
    if (A_PriorHotkey == "*~LAlt")
    {
        IME_SET(0)
    }
    Return

; 右 Alt 空打ちで IME を ON
RAlt up::
    if (A_PriorHotkey == "*~RAlt")
    {
        IME_SET(1)
    }
    Return


; #########################################################################################
; sands
; #########################################################################################

#InstallKeybdHook
  $Space::
      if SandS_guard = True           ;スペースキーガード
          return
      SandS_guard = True              ;スペースキーにガードをかける
      Send,{Shift Down}               ;シフトキーを仮想的に押し下げる
      ifNotEqual SandS_key            ;既に入力済みの場合は抜ける
          return
      SandS_key=
      Input,SandS_key,L1 V            ;1文字入力を受け付け（入力有無判定用）
      return

  $Space up::                         ;スペース解放時
      input                           ;既存のInputコマンドの終了
      if SandS_guard = False          ;ガードがかかってなかった場合（修飾キー＋Spaceのリリース）
          return
      SandS_guard = False             ;スペースキーガードを外す
      Send,{Shift Up}                 ;シフトキー解放
      ifEqual SandS_key               ;SandS文字入力なし
          Send,{Space}                ;スペースを発射
      SandS_key=
      return

