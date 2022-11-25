unit appliaohao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, ADODB, DB, Buttons, Grids, DBGrids;

type
  Tappliaohaofm = class(TForm)
    Label8: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Memo1: TMemo;
    Memo2: TMemo;
    Button1: TButton;
    Button2: TButton;
    ADOQuery1: TADOQuery;
    ADOTable1: TADOTable;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    SpeedButton2: TSpeedButton;
    BitBtn1: TBitBtn;
    OpenDialog1: TOpenDialog;
    Edit10: TEdit;
    DBGrid1: TDBGrid;
    ADOQuery2: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery2DSDesigner: TStringField;
    ADOQuery2DSDesigner2: TWideStringField;
    ADOQuery2DSDesigner3: TStringField;
    ADOQuery2DSDesigner4: TStringField;
    ADOQuery2DSDesigner6: TStringField;
    ADOQuery2DSDesigner10: TStringField;
    ADOQuery2DSDesigner11: TWideStringField;
    ADOQuery2DSDesigner12: TStringField;
    ADOQuery2DSDesigner13: TStringField;
    ADOQuery2DSDesigner14: TWideStringField;
    ADOQuery2DSDesigner15: TStringField;
    ADOQuery2DSDesigner16: TStringField;
    ADOQuery2DSDesigner19: TStringField;
    ADOQuery2DSDesigner20: TStringField;
    Button3: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label11: TLabel;
    Label12: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label9: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    procedure Button1Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  appliaohaofm: Tappliaohaofm;

implementation
       uses dmut,glbut, lookup, appendliaohao, printcrsoption;
{$R *.dfm}

procedure Tappliaohaofm.Button1Click(Sender: TObject);
var
sqlstr1,sqlstr2:string;
liaohao:string;
filename:string;
begin
liaohao:=trim(edit2.Text);
sqlstr1:='select * from lingjianliaohao where �Ϻ�= '+''''+liaohao+'''';
sqlstr2:='select * from prelingjianliaohao where �Ϻ�='+''''+liaohao+'''';
if (edit1.Text='')or(edit2.Text='')or(memo1.Text='') then
    begin
         application.MessageBox('�Ϻ���Ϣ����ɣ���������ϸ��д�����Ϣ�����Ϻţ�Ʒ�������˵������Ϊ�գ�       ','��ʾ��',mb_ok+MB_ICONinformation);
         exit;
    end;
adoquery1.Close;
adoquery1.SQL.Clear;
adoquery1.SQL.Add(sqlstr1);
adoquery1.Open;
if adoquery1.RecordCount>=1 then
begin
   application.MessageBox('���Ϻ������Ͽ����Ѵ��ڣ����ʵ��������                  ','��ʾ��',mb_ok+MB_ICONinformation);
   exit;
end;
adoquery2.Close;
adoquery2.SQL.Clear;
adoquery2.SQL.Add('select * from lingjianliaohao where ���˵�� like '+''''+'%'+trim(memo1.Text)+'%'+'''');
adoquery2.Open;
if adoquery1.RecordCount>=1 then
begin
   if application.MessageBox('���Ϻ������Ͽ���������ͬ�����ƹ���������������ʵ�������� �Ƿ�Ҫ�������룿         ','��ʾ��',mb_okcancel+MB_ICONinformation)=ID_cancel then
   exit;
end;


adoquery1.Close;
adoquery1.SQL.Clear;
adoquery1.SQL.Add(sqlstr2);
adoquery1.Open;
if adoquery1.RecordCount>=1 then
begin
   application.MessageBox('���Ϻ������Ͽ��в����ڣ������������� �����ʵ��������                  ','��ʾ��',mb_ok+MB_ICONinformation);
   exit;
end;
if trim(edit9.Text)<>'' then
   begin
      filename:=trim(commondir)+trim(edit9.Text);
      copyfile(pchar(trim(edit8.Text)),pchar(filename),false);
   end;
 try
adotable1.Close;
adotable1.Open;
adotable1.Append;
adotable1.FieldValues['Ʒ��']:=edit1.Text;
adotable1.FieldValues['�Ϻ�']:=trim(edit2.Text);
adotable1.FieldValues['��Ӧ��']:=edit3.Text;
adotable1.FieldValues['���˵��']:=memo1.Text;
adotable1.FieldValues['�����Ϻ�']:=trim(edit5.Text);
adotable1.FieldValues['������']:=edit4.Text;
adotable1.FieldValues['������']:=edit6.Text;
adotable1.FieldValues['ʹ�û���']:=edit7.Text;
adotable1.FieldValues['�����']:=trim(edit9.Text);
adotable1.FieldValues['�汾']:=trim(edit10.Text);
adotable1.Post;
adotable1.Close;
application.MessageBox('��������Ϻ��ѳɹ��ύ �������ĵȴ����ȷ�ϣ�����                  ','��ʾ��',mb_ok+MB_ICONinformation);
except
  application.MessageBox('����ʧ�� ����Ѱ����֧�֣�����                  ','��ʾ��',mb_ok+MB_ICONinformation);
   exit;
end;



end;

procedure Tappliaohaofm.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
adoquery2.Close;
adoquery2.SQL.Clear;
adoquery2.SQL.Add('select * from lingjianliaohao where �Ϻ� like '+''''+trim(edit2.Text)+'%'+'''');
adoquery2.Open;
MakeDBGridColumnsAutoFixItsWidth(DBGrid1);
end

else
begin
  exit;

if (length(trim(edit2.Text))>=0) and (length(trim(edit2.Text))<2) then
   begin
       if not (key in ['0'..'9']) then
        application.MessageBox('�˳�ֻ��Ϊ���ӣ����������Ϲ�����ϺŽ��޷�ͨ����ˣ�������              ','��ʾ��',mb_ok+MB_ICONinformation);
   end;
if (length(trim(edit2.Text))=2) then
begin
    if key in ['0'..'9'] then
 application.MessageBox('�˳�ֻ��Ϊ�ַ������������Ϲ�����ϺŽ��޷�ͨ����ˣ�������              ','��ʾ��',mb_ok+MB_ICONinformation);
 end;
if length(trim(edit2.Text))>3 then
  begin
        if key='o' then
        begin
         application.MessageBox('�˴�����Ϊ"o"�����������Ϲ�����ϺŽ��޷�ͨ����ˣ�������              ','��ʾ��',mb_ok+MB_ICONinformation);
         key:=#0;
        end;

  end;

end;


end;

procedure Tappliaohaofm.FormActivate(Sender: TObject);
begin
edit4.Text:=userrealname;
adoquery2.Close;
adoquery2.SQL.Clear;
adoquery2.SQL.Add('select * from lingjianliaohao where Ʒ��='+''''+'����'+'''');
adoquery2.Open;
MakeDBGridColumnsAutoFixItsWidth(DBGrid1);
end;

procedure Tappliaohaofm.Edit2Change(Sender: TObject);
var
f:textfile;
filename:string;
begin
if length(trim(edit2.Text))=2 then
begin
  // AssignFile(F, FileName);
  // Reset(F);
  // CloseFile(F);
  try
   memo2.Clear;
   filename:='.\material\'+trim(edit2.Text)+'.txt';
   memo2.Lines.LoadFromFile(filename);
  except
  end;
end;
end;

procedure Tappliaohaofm.Button2Click(Sender: TObject);
begin
close;
end;

procedure Tappliaohaofm.SpeedButton1Click(Sender: TObject);
begin
//lookupsurplyerfm.showmodal;
//edit3.Text:=lookupsurplyerfm.surplyer;
printcrsoptionfm.R1.Enabled:=false;
printcrsoptionfm.R2.Enabled:=false;
printcrsoptionfm.R3.Enabled:=false;
printcrsoptionfm.showmodal;
 edit3.Text:= printcrsoptionfm.edit1.Text;
end;

procedure Tappliaohaofm.SpeedButton2Click(Sender: TObject);
begin
if edit2.Text='' then
   begin
       showmessage('����������Ч�Ϻ�');
       exit;
   end;
if opendialog1.Execute then
   edit8.Text:=opendialog1.FileName;
   edit9.Text:=trim(edit2.Text)+'_'+ExtractFileName(edit8.Text);
end;

procedure Tappliaohaofm.BitBtn1Click(Sender: TObject);
begin
//    application.CreateForm(Tftpfm,ftpfm);
  {  ftpfm.liaohao:=edit2.text;
    ftpfm.Edit7.Text:=trim(edit8.Text);
    ftpfm.edit8.Text:=trim(edit9.Text);
    ftpfm.Edit8.ReadOnly:=true;
    ftpfm.SpeedButton1.Enabled:=false;

    ftpfm.show;    }
   // showmessage('ok');
end;

procedure Tappliaohaofm.DBGrid1CellClick(Column: TColumn);
begin
if adoquery2.Active=true then
   begin
       edit1.Text:=adoquery2.FieldValues['Ʒ��'];
       edit2.Text:=adoquery2.FieldValues['�Ϻ�'];
       memo1.Text:=adoquery2.FieldValues['���˵��'];
   end;
end;

procedure Tappliaohaofm.Memo1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
  begin
adoquery2.Close;
adoquery2.SQL.Clear;
adoquery2.SQL.Add('selelct * form lingjianliaohao where ���˵�� like '+''''+'%'+trim(memo1.Text)+'%'+'''');
adoquery2.Open;
  end;
end;

procedure Tappliaohaofm.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
with DBGrid1 do
begin
if ((State = [gdSelected]) or (State=[gdSelected,gdFocused])) then
begin
Canvas.Font.Color :=ClYellow;
Canvas.Brush.Color :=ClNavy;
end
else
begin
if DataSource1.DataSet.RecNo mod 2<>0 then {�жϵ�ǰ��������������ż����}
Canvas.brush.Color :=ClWhite {����������У�DBGrid�����԰�ɫ��ʾ}
else
Canvas.brush.Color :=$00EAEAEA; {�����ż���У�DBGrid������ǳ��ɫ��ʾ}
end;
DefaultDrawColumnCell(Rect, DataCol, Column, State); {���кܹؼ��ģ�һ����Ҫ��©��}
end;

end;

procedure Tappliaohaofm.Button3Click(Sender: TObject);
begin
appliaofm.show;
end;

end.
