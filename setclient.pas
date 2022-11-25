unit setclient;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons,registry, DB, ADODB, ComCtrls;

type
  Tsetclientfm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    c1: TCheckBox;
    c2: TCheckBox;
    c3: TCheckBox;
    Edit6: TEdit;
    Edit7: TEdit;
    CheckBox4: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit8: TEdit;
    Edit10: TEdit;
    C4: TCheckBox;
    Edit9: TEdit;
    Button3: TButton;
    C5: TCheckBox;
    Edit11: TEdit;
    AD: TADOQuery;
    GroupBox1: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Panel3: TPanel;
    Label14: TLabel;
    Panel4: TPanel;
    Panel5: TPanel;
    ColorDialog1: TColorDialog;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Label15: TLabel;
    Panel6: TPanel;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    procedure Button2Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure c3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  setclientfm: Tsetclientfm;

implementation
      uses glbut,glut,dmut;
{$R *.dfm}

procedure Tsetclientfm.Button2Click(Sender: TObject);
begin
close;
end;

procedure Tsetclientfm.BitBtn2Click(Sender: TObject);
begin
ad.Close;
ad.SQL.Clear;
ad.SQL.Add('select * from client where UN='+''''+trim(user)+'''');
//ad.SQL.Add('select * from client where ip='+''''+ip+'''');
try
ad.Open;
except
application.MessageBox('ÍøÂç´íÎó£¡£¡£¡                     ','Ê§°Ü!',mb_ok+MB_ICONerror);
abort;
end;
if ad.RecordCount=1 then
begin
//if trim(ad.FieldValues['IP'])<>trim(IP) then
//   begin
//       showmessage('´íÎóµÄ×¢²áÂë£¬ÇëÖØÐÂÉú³É×¢²áÂë£¡£¡£¡');
//       exit;
//   end;
 edit10.Text:=ad.FieldValues['CLIENT_ID'];
 clientID:=trim(edit10.Text);
// ad.Edit;
// ad.FieldValues['state']:='Online';
// ad.Post;
//application.MessageBox('×¢²áID´íÎó£¡£¡£¡                     ','Ê§°Ü!',mb_ok+MB_ICONerror);
//abort;
end
else begin
         application.MessageBox('×¢²áID´íÎó£¡£¡£¡ÇëÖØÐÂÉú³É×¢²áÂë£¡£¡£¡                     ','Ê§°Ü!',mb_ok+MB_ICONerror);
         abort;
     end;

try
sqlserver:=trim(edit1.Text);
if trim(edit1.Text)='Ò»ºÅ·þÎñÆ÷' then
  sqlserver:='MackyLee';
if trim(edit1.Text)='¶þºÅ·þÎñÆ÷' then
  sqlserver:='FalconServer';

registerFALCON(sqlserver,trim(edit8.Text),trim(edit9.Text),trim(edit2.text),
                        trim(edit3.Text),trim(edit4.text),trim(edit5.text),trim(edit10.Text),trim(edit11.text));

application.MessageBox('¹§Ï²Äã×¢²á³É¹¦£¡£¡£¡£¡£¡  ','×¢²á³É¹¦!',mb_ok+MB_ICONinformation);
except
      application.MessageBox('×¢²áÊ§°Ü£¡£¡£¡£¬×¢²áÊ§°Ü  ','Ê§°Ü!',mb_ok+MB_ICONerror);
end;
end;

procedure Tsetclientfm.BitBtn1Click(Sender: TObject);
begin

runapplication(handle,'upgrade.exe');
end;

procedure Tsetclientfm.c3Click(Sender: TObject);
begin
if c3.Checked=true then
begin
   edit6.Enabled:=true;
   edit6.Color:=clWindow;
   edit7.Enabled:=true;
   edit7.Color:=clWindow;
end else
    begin
   edit6.Enabled:=false;
   edit6.Color:=clScrollBar;
   edit7.Enabled:=false;
   edit7.Color:=clScrollBar;
    end;
end;

procedure Tsetclientfm.Button1Click(Sender: TObject);
var
reg:tregistry;
filename:string;
begin
//ShowMessage(ExtractFileDir(Application.Exename)); // Èç: c:\temp
//ExtractFilePath(Application.Exename); // Èç: c:\temp\ ¡¡¡¡

 filename:='FALCON.EXE';

   begin
   try
       reg:=Tregistry.Create;
       reg.RootKey:=HKEY_CURRENT_USER;
       reg.OpenKey('Software\FALCON',true);
       reg.DeleteValue('autocheckupdatefile');
       reg.DeleteValue('autoupdate');
       //reg.CreateKey('Software\FALCON\autocheckupdatefile');
       if c1.Checked=true then
       reg.WriteString('autocheckupdatefile','true')
       else  reg.WriteString('autocheckupdatefile','False');
       if c4.Checked=true then
       reg.WriteString('autoupdate','true')
       else  reg.WriteString('autoupdate','False');
       if c5.Checked=true then
       begin
       reg.RootKey := HKEY_LOCAL_MACHINE;
       if reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\run',True) then
        begin
            reg.WriteString(filename,ExtractFilePath(Application.Exename)+filename);
        end;
        end
        else
        begin
           reg.RootKey := HKEY_LOCAL_MACHINE;
           if reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\run',True) then
             begin
             reg.DeleteValue(filename);
             end;
        end;
       reg.CloseKey;
   except
          showmessage('Èí¼þÃ»ÓÐ×¢²á»ò×¢²áÐÅÏ¢¶ªÊ§£¬Çë×¢²á');
          reg.CloseKey;
   end;
   end;
 close;
end;

procedure Tsetclientfm.FormActivate(Sender: TObject);
var
reg:tregistry;
autoupdate:string;
begin
     reg:=Tregistry.Create;
     try
         reg.RootKey:=HKEY_CURRENT_USER;
         if (reg.OpenKey('Software\FALCON',true)) then
            begin
              autoupdate:=Reg.ReadString('autocheckupdatefile');
              reg.CloseKey;
            end;
     finally
        reg.CloseKey;
        reg.Free;
        if  autoupdate='true' then
            c1.Checked:=true
        else c1.Checked:=false;
     end;
end;

procedure Tsetclientfm.Button3Click(Sender: TObject);
var
ips:string;
begin
if trim(edit10.Text)<>'' then
begin
try
ad.Close;
ad.SQL.Clear;
ad.SQL.Add('select * from client where UN='+''''+trim(user)+'''');
ad.Open;
if ad.RecordCount>=1 then
   begin
      // ad.First;
       edit10.Text:=ad.FieldValues['client_id'];
      // ad.Edit;
      // ad.FieldValues['ip']:=ip;
     //  ad.FieldValues['mac']:=mac;
    //   ad.FieldValues['host']:=host;
     //  ad.FieldValues['version']:=clientversion;
    //   ad.FieldValues['state']:='Online';
    //   ad.Post;
    //   ad.close;
       exit;
   end;
except
end;
end;
////////////////////////////////////// create a new ID
   begin
      ad.Close;
      ad.SQL.Clear;
      ad.SQL.Add('select * from client');
      ad.Open;
      ad.Append;
      ad.FieldValues['UN']:=user;
      ad.FieldValues['host']:=host;
      ad.FieldValues['ip']:=ip;
      ad.FieldValues['MAC']:=mac;
      ad.FieldValues['version']:=edit9.Text;
      ad.FieldValues['state']:='ONline';
      try
        ad.Post;
        ad.Close;
      except
          application.MessageBox('»ñÈ¡ID´íÎó£¡£¡£¡                     ','Ê§°Ü',mb_ok+MB_ICONerror);
          abort;
       end;
      try
            ad.Close;
            ad.SQL.Clear;
            ad.SQL.Add('select * from client where ip='+''''+trim(ip)+'''');
            ad.Open;
            edit10.Text:=ad.FieldValues['client_id'];
      except
            application.MessageBox('»ñÈ¡ID´íÎó£¡£¡£¡                     ','Ê§°Ü',mb_ok+MB_ICONerror);
            abort;
      end;
   end;




end;


procedure Tsetclientfm.SpeedButton1Click(Sender: TObject);
begin
if colordialog1.Execute then
   begin
       panel3.Color:=colordialog1.Color;
   end;
end;

procedure Tsetclientfm.SpeedButton2Click(Sender: TObject);
begin
if colordialog1.Execute then
   begin
       panel4.Color:=colordialog1.Color;
       fcolor:=panel4.color;
   end;
end;

procedure Tsetclientfm.SpeedButton3Click(Sender: TObject);
begin
if colordialog1.Execute then
   begin
       panel5.Color:=colordialog1.Color;
       bcolor:=panel5.color;
   end;
end;

procedure Tsetclientfm.SpeedButton4Click(Sender: TObject);
begin
if colordialog1.Execute then
    panel6.Color:=colordialog1.Color;
end;

end.
