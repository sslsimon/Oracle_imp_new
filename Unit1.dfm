object Form1: TForm1
  Left = 646
  Top = 370
  BorderStyle = bsDialog
  Caption = #23548#20837#39044#35774
  ClientHeight = 325
  ClientWidth = 350
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Consolas'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 18
  object Label1: TLabel
    Left = 15
    Top = 302
    Width = 336
    Height = 18
    Caption = #23436#25104#21518#30331#24405'PL/SQL'#24037#20855#65292#25191#34892#8220#32534#35793#26080#25928#23545#35937#8221
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -15
    Font.Name = 'Consolas'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label2: TLabel
    Left = 96
    Top = 126
    Width = 242
    Height = 18
    Caption = #25913#21517#21518#30340#25991#20214#25335#20837'D:\backup'#30446#24405
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -15
    Font.Name = 'Consolas'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 5
    Top = 80
    Width = 896
    Height = 18
    Caption = 
      '----------------------------------------------------------------' +
      '------------------------------------------------'
  end
  object Label6: TLabel
    Left = 5
    Top = 257
    Width = 896
    Height = 18
    Caption = 
      '----------------------------------------------------------------' +
      '------------------------------------------------'
  end
  object Label7: TLabel
    Left = 22
    Top = 126
    Width = 75
    Height = 18
    Caption = #27493#39588'2.2'#65306
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -15
    Font.Name = 'Consolas'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 98
    Top = 30
    Width = 63
    Height = 15
    Caption = #26410#36830#25509'...'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel
    Left = 22
    Top = 102
    Width = 318
    Height = 18
    Caption = #27493#39588'2.1'#65306#38656#35201#23548#20837#30340#25991#20214#37325#21629#21517#20026'bak.dmp'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -15
    Font.Name = 'Consolas'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label10: TLabel
    Left = 69
    Top = 4
    Width = 213
    Height = 19
    Caption = #26412#36719#20214#20165#25903#25345'Windows Xp '
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'Consolas'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button2: TButton
    Left = 16
    Top = 58
    Width = 75
    Height = 25
    Caption = #27493#39588'1'
    Enabled = False
    TabOrder = 0
    OnClick = Button2Click
  end
  object Button1: TButton
    Left = 16
    Top = 26
    Width = 75
    Height = 25
    Caption = 'Connect'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button3: TButton
    Left = 16
    Top = 233
    Width = 75
    Height = 25
    Caption = #27493#39588'2'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 16
    Top = 280
    Width = 75
    Height = 25
    Caption = #27493#39588'3'
    Enabled = False
    TabOrder = 3
    OnClick = Button4Click
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 154
    Width = 281
    Height = 73
    Caption = #23548#20837#24211#30340#29992#25143#21517#12289#23494#30721
    TabOrder = 4
    object Label3: TLabel
      Left = 6
      Top = 23
      Width = 80
      Height = 18
      Caption = 'User_name:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -15
      Font.Name = 'Consolas'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 95
      Top = 23
      Width = 72
      Height = 18
      Caption = 'Password:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -15
      Font.Name = 'Consolas'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edt_usr: TEdit
      Left = 6
      Top = 39
      Width = 86
      Height = 26
      TabOrder = 0
      Text = 'system'
    end
    object edt_psw: TEdit
      Left = 95
      Top = 39
      Width = 121
      Height = 26
      PasswordChar = '*'
      TabOrder = 1
    end
  end
  object OraSession1: TOraSession
    Options.Direct = True
    ConnectDialog = ConnectDialog1
    AfterConnect = OraSession1AfterConnect
    Left = 264
    Top = 26
  end
  object ConnectDialog1: TConnectDialog
    StoreLogInfo = False
    Caption = 'Connect'
    UsernameLabel = 'User Name'
    PasswordLabel = 'Password'
    ServerLabel = 'ip:port:'#23454#20363#21517
    ConnectButton = 'Connect'
    CancelButton = 'Cancel'
    LabelSet = lsCustom
    Left = 192
    Top = 31
  end
  object OraScript1: TOraScript
    SQL.Strings = (
      'create temporary tablespace BFTEMP'
      'tempfile '#39'D:\ORACLE\oradata\orcl\BFTEMP.dbf'#39
      'size 32m'
      'autoextend on'
      'next 32m maxsize 2048m'
      'extent management local;'
      ''
      'create tablespace BFDATA'
      'logging'
      'datafile '#39'D:\ORACLE\oradata\orcl\BFDATA.DBF'#39
      'size 32m'
      'autoextend on'
      'next 32m maxsize 2048m'
      'extent management local;'
      ''
      'create user BFAPP8'
      '  identified by "DHHZDHHZ"'
      '  default tablespace BFDATA'
      '  temporary tablespace BFTEMP'
      '  profile DEFAULT;'
      ''
      'create user BFBHDD8'
      '  identified by "DHHZDHHZ"'
      '  default tablespace BFDATA'
      '  temporary tablespace BFTEMP'
      '  profile DEFAULT;'
      ''
      'create user BFPUB8'
      '  identified by "DHHZDHHZ"'
      '  default tablespace BFDATA'
      '  temporary tablespace BFTEMP'
      '  profile DEFAULT;'
      ''
      'create user POS_USER8'
      '  identified by "DHHZDHHZ"'
      '  default tablespace BFDATA'
      '  temporary tablespace BFTEMP'
      '  profile DEFAULT;'
      ''
      ''
      'create user BFCRM8'
      '  identified by "DHHZDHHZ"'
      '  default tablespace BFDATA'
      '  temporary tablespace BFTEMP'
      '  profile DEFAULT;'
      ''
      'create user BFRS8'
      '  identified by "DHHZDHHZ"'
      '  default tablespace BFDATA'
      '  temporary tablespace BFTEMP'
      '  profile DEFAULT;'
      ''
      'create user BFCW8'
      '  identified by "DHHZDHHZ"'
      '  default tablespace BFDATA'
      '  temporary tablespace BFTEMP'
      '  profile DEFAULT;'
      ''
      'create user BFCWZT8'
      '  identified by "DHHZDHHZ"'
      '  default tablespace BFDATA'
      '  temporary tablespace BFTEMP'
      '  profile DEFAULT;'
      ' '
      ''
      ''
      '--GRANT TO USER LIST'
      
        '--BFAPP8,BFBHDD8,BFPUB8,POS_USER8,BFCRM8,BFRS8,BFCW8,BFCWZT8,BFR' +
        'S8'
      ''
      ''
      'grant dba to BFAPP8 with admin option;'
      'grant dba to BFBHDD8 with admin option;'
      'grant dba to BFPUB8 with admin option;'
      'grant dba to POS_USER8 with admin option;'
      'grant dba to BFCRM8 with admin option;'
      'grant dba to BFRS8 with admin option;'
      'grant dba to BFCW8 with admin option;'
      'grant dba to BFCWZT8 with admin option;'
      ''
      'create directory backupdir as '#39'D:\backup'#39';')
    Session = OraSession1
    Left = 104
    Top = 56
  end
  object OraScript2: TOraScript
    SQL.Strings = (
      'ALTER TABLE BFPUB8.MODULE_DEF modify name VARCHAR2(50);--- '#26356#26032#33756#21333#21517
      'UPDATE BFPUB8.MODULE_DEF SET NAME =  '#39'TEST_JXC'#39'||name;'
      
        'UPDATE BFPUB8.XTCZY SET LOGIN_PASSWORD='#39'5608C86E5DE15EB0C13E20A8' +
        #39' WHERE PERSON_ID=788;'
      'DELETE FROM BFPUB8.BFLOG;--'#28165#38500#31243#24207#25805#20316#26085#24535
      'COMMIT;')
    Session = OraSession1
    Left = 104
    Top = 272
  end
end
