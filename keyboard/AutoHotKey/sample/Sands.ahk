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