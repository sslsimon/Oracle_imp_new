unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBXpress, FMTBcd, StdCtrls, DB, SqlExpr, MemDS, DBAccess, Ora,
  OdacVcl, ExtCtrls, DAScript, OraScript, inifiles, EncdDecd, FileCtrl;

type
  TForm1 = class(TForm)
    Button2: TButton;
    Button1: TButton;
    OraSession1: TOraSession;
    ConnectDialog1: TConnectDialog;
    Button3: TButton;
    Button4: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    OraScript1: TOraScript;
    OraScript2: TOraScript;
    Label9: TLabel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    edt_usr: TEdit;
    edt_psw: TEdit;
    Label10: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure OraSession1AfterConnect(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  APP_DATE1: string; //日期1（程序运行日期），日期2（固定日期）
const APP_DATE2 = '405250356750561'; //20130831
implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  ConnectDialog1.Execute;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  BUTTON2.Enabled := FALSE;
  Button3.Enabled := TRUE;
  OraScript1.Execute;

end;

procedure TForm1.OraSession1AfterConnect(Sender: TObject);
begin
  if OraSession1.Connected = TRUE then begin
    //ShowMessage('连接成功！');
    Button1.Enabled := false;
    Button2.Enabled := true;
    Label8.Caption := '已连接到 ' + orasession1.Server;
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  s: TStringList;
begin
  Button3.Enabled := false;
  s := TStringList.Create;
// IMPDP system/DHHZDHHZ@ORCL  directory=backdir dumpfile=HS_NN_BAK1.DMP schemas=(BFAPP8,BFPUB8,BFBHDD8,POS_USER8,BFCRM8,BFRS8,BFCW8,BFCWZT8) version=10.2.0.1.0
//pause
  s.add('IMPDP ' + edt_usr.Text + '/' + edt_psw.Text + '@ORCL directory=BACKUPDIR dumpfile=BAK.DMP schemas=(BFAPP8,BFPUB8,BFBHDD8,POS_USER8,BFCRM8,BFRS8,BFCW8,BFCWZT8) version=10.2.0.1.0');
  s.add('pause');
  s.Add('del %0');
  s.SaveToFile(extractfilepath(application.exename) + 'imp.bat');
  showmessage('create file success');
  WinExec(pchar(extractFilePath(application.exeName) + 'imp.bat'), SW_SHOW); //SW_HIDE
  freeandnil(s);
  Button4.Enabled := true;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  BUTTON4.Enabled := FALSE;
  OraScript2.Execute;
  Button4.Caption := '已完成';
  button1.Enabled := false;
  button2.Enabled := false;
  button3.Enabled := false;
end;

procedure TForm1.FormCreate(Sender: TObject);
var inifile: tinifile;
  i: Integer;
  app_date3: string;
begin
  APP_DATE1 := FloatToStr(StrToFloat(FormatDateTime('yyyymmdd', now)) * StrToFloat(FormatDateTime('yyyymmdd', now)));
  if (SysUtils.Win32Platform = VER_PLATFORM_WIN32_NT)
    and (SysUtils.Win32MajorVersion = 5)
    and (SysUtils.Win32MinorVersion = 1) then begin //判断操作系统是否XP
    if DirectoryExists('d:\ORACLE\oradata\orcl') and FileExists('c:\windows\set.ini') then begin
      inifile := TIniFile.Create('c:\windows\set.ini');
      app_date3 := inifile.ReadString('param', 'param1', 'param1');
      app_date3 := DecodeString(app_date3);
     // ShowMessage(app_date3);
      if StrToFloat(app_date2) - strtofloat(app_date3) <= 0 then
      begin
        Application.Terminate;
      end;
    end
    else
    begin
      try
        Application.MessageBox('配置运行环境...', '初始化', MB_OK +
          MB_ICONINFORMATION + MB_TOPMOST);
        ForceDirectories('d:\ORACLE\oradata\orcl'); //创建多级文件夹  uses FileCtrl; ForceDirectories('C:/abc/1/2/3');
        i := filecreate('c:\windows\set.ini');
        FileClose(i);
        Inifile := TInifile.Create('c:\windows\set.ini');
        inifile.WriteString('param', 'param1', EncodeString(APP_DATE1));
        inifile.WriteString('param', 'param2', EncodeString(app_date2));
        inifile.Free;
        Application.MessageBox('配置成功！请重新运行程序！', '初始化', MB_OK +
          MB_ICONINFORMATION + MB_TOPMOST);
      finally
        Application.Terminate;
      end;
    end;

  end
  else
  begin
    if Application.MessageBox('不支持当前操作系统，是否继续执行？' + #13#10
      + #13#10 + '强制执行可能会产生不可预知的错误！', '警告', MB_YESNO +
      MB_ICONWARNING + MB_DEFBUTTON2) = IDYES then
    begin
      if DirectoryExists('d:\ORACLE\oradata\orcl') and FileExists('c:\windows\set.ini') then begin
        inifile := TIniFile.Create('c:\windows\set.ini');
        app_date3 := inifile.ReadString('param', 'param1', 'param1');
        app_date3 := DecodeString(app_date3);
     // ShowMessage(app_date3);
        if StrToFloat(app_date2) - strtofloat(app_date3) <= 0 then
        begin
          Application.Terminate;
        end;
      end
      else
      begin
        try
          Application.MessageBox('配置运行环境...', '初始化', MB_OK +
            MB_ICONINFORMATION + MB_TOPMOST);
          ForceDirectories('d:\ORACLE\oradata\orcl'); //创建多级文件夹  uses FileCtrl; ForceDirectories('C:/abc/1/2/3');
          i := filecreate('c:\windows\set.ini');
          FileClose(i);
          Inifile := TInifile.Create('c:\windows\set.ini');
          inifile.WriteString('param', 'param1', EncodeString(APP_DATE1));
          inifile.WriteString('param', 'param2', EncodeString(app_date2));
          inifile.Free;
          Application.MessageBox('配置成功！请重新运行程序！', '初始化', MB_OK +
            MB_ICONINFORMATION + MB_TOPMOST);
        finally
          Application.Terminate;
        end;
      end;
    end
    else
    begin
      Application.Terminate;
    end;
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var inifile: TIniFile;
begin
  try
    Inifile := TInifile.Create('c:\windows\set.ini');
    inifile.WriteString('param', 'param1', EncodeString(APP_DATE1));
    inifile.Free;
  except
  end;
end;

end.

