; #########################################################################################
; jis2us
; #########################################################################################

#UseHook

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ; 1�i��
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 VKF4::Send,{``}    ;         ���p/�S�p     -> `
 +VKF4::Send,{~}    ; Shift + ���p/�S�p     -> ~
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
 ; 2�i��
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 @::[              ;                   [@] -> [
 +@::{             ; Shift + @         [`] -> {
 [::]              ;                   [[] -> ]
 +[::Send,{}}      ; Shift + [         [{] -> }

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ; 3�i��
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

; ���E Alt �L�[�̋�ł��� IME �� OFF/ON ��؂�ւ���
;
; �� Alt �L�[�̋�ł��� IME ���u�p���v�ɐ؂�ւ�
; �E Alt �L�[�̋�ł��� IME ���u���ȁv�ɐ؂�ւ�
; Alt �L�[�������Ă���Ԃɑ��̃L�[��łƒʏ�� Alt �L�[�Ƃ��ē���
;
; Author:     karakaram   http://www.karakaram.com/alt-ime-on-off

#Include IME.ahk

; Razer Synapse�ȂǁA�L�[�J�X�^�}�C�Y�n�̃c�[���𕹗p���Ă���Ƃ��̃G���[�΍�
#MaxHotkeysPerInterval 350

; �㕔���j���[���A�N�e�B�u�ɂȂ�̂�}��
*~LAlt::Send {Blind}{vk07}
*~RAlt::Send {Blind}{vk07}

; �� Alt ��ł��� IME �� OFF
LAlt up::
    if (A_PriorHotkey == "*~LAlt")
    {
        IME_SET(0)
    }
    Return

; �E Alt ��ł��� IME �� ON
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
      if SandS_guard = True           ;�X�y�[�X�L�[�K�[�h
          return
      SandS_guard = True              ;�X�y�[�X�L�[�ɃK�[�h��������
      Send,{Shift Down}               ;�V�t�g�L�[�����z�I�ɉ���������
      ifNotEqual SandS_key            ;���ɓ��͍ς݂̏ꍇ�͔�����
          return
      SandS_key=
      Input,SandS_key,L1 V            ;1�������͂��󂯕t���i���͗L������p�j
      return

  $Space up::                         ;�X�y�[�X�����
      input                           ;������Input�R�}���h�̏I��
      if SandS_guard = False          ;�K�[�h���������ĂȂ������ꍇ�i�C���L�[�{Space�̃����[�X�j
          return
      SandS_guard = False             ;�X�y�[�X�L�[�K�[�h���O��
      Send,{Shift Up}                 ;�V�t�g�L�[���
      ifEqual SandS_key               ;SandS�������͂Ȃ�
          Send,{Space}                ;�X�y�[�X�𔭎�
      SandS_key=
      return

