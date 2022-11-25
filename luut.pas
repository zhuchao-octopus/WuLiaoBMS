unit luut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Buttons, ToolWin, Grids, DBGrids, StdCtrls, ExtCtrls,comobj,
  DB, ADODB, Menus;

type
  Tlufm = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    SpeedButton2: TSpeedButton;
    ToolButton1: TToolButton;
    SpeedButton9: TSpeedButton;
    SpeedButton11: TSpeedButton;
    ToolButton3: TToolButton;
    SpeedButton6: TSpeedButton;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    FontDialog1: TFontDialog;
    SpeedButton3: TSpeedButton;
    print: TSpeedButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    ToolBar2: TToolBar;
    CoolBar2: TCoolBar;
    ToolBar4: TToolBar;
    Label1: TLabel;
    Edit1: TEdit;
    CoolBar3: TCoolBar;
    ToolBar5: TToolBar;
    Label4: TLabel;
    Edit3: TEdit;
    ToolBar3: TToolBar;
    Edit2: TEdit;
    Label2: TLabel;
    N3: TMenuItem;
    Nn4: TMenuItem;
    N100: TMenuItem;
    N44: TMenuItem;
    exportliao: TSpeedButton;
    procedure SpeedButton6Click(Sender: TObject);
    procedure lookupdata(keystr,fieldname:string);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure browsedata();
    procedure printClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ToolBar1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Nn4Click(Sender: TObject);
    procedure N100Click(Sender: TObject);
    procedure N44Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure exportliaoClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1DblClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  lufm: Tlufm;
  click:boolean;
 
implementation
  uses dmut,glbut,liaohaoprintut,glut, price, outexcel, modalliao, lookup;
{$R *.dfm}
procedure Tlufm.browsedata();
VAR
   sqlstr:string;
begin

   sqlstr:='select Ʒ��, �Ϻ�, ���˵��, ������, ��Ӧ��, �����Ϻ�, �����, ����,ʹ�û���,���� from  lingjianliaohao';

     with adoquery1 do
         begin
             ADOQuery1.Close;
             ADOQuery1.SQL.Clear;
             ADOQuery1.SQL.Add(sqlstr);
             ADOQuery1.Open;
             MakeDBGridColumnsAutoFixItsWidth(dbgrid1);
         end;
end;

procedure tlufm.lookupdata(keystr,fieldname:string);
VAR
   sqlstr:string;
begin
  if trim(edit1.Text)='' then
   sqlstr:='select Ʒ��, �Ϻ�, ���˵��, ������, ��Ӧ��, �����Ϻ�, �����,ʹ�û���, ����,���� from  lingjianliaohao where '+ fieldname +' like '+ ''''+'%'+keystr+'%'+''''
   else
    sqlstr:='select Ʒ��, �Ϻ�, ���˵��, ������, ��Ӧ��, �����Ϻ�, �����,ʹ�û���, ����,���� from  lingjianliaohao where '+ fieldname +' like '+ ''''+'%'+keystr+'%'+''''+' and �Ϻ� like '+''''+trim(edit1.Text)+'%'+'''';

     with adoquery1 do
         begin
             ADOQuery1.Close;
             ADOQuery1.SQL.Clear;
             ADOQuery1.SQL.Add(sqlstr);
             ADOQuery1.Open;
             MakeDBGridColumnsAutoFixItsWidth(dbgrid1);
         end;
end;
procedure Tlufm.SpeedButton6Click(Sender: TObject);
begin
close;
end;

procedure Tlufm.Edit1KeyPress(Sender: TObject; var Key: Char);
VAR
   sqlstr:string;
begin
if key=#13 then
  begin
  if trim(edit3.Text)='' then
     sqlstr:='select Ʒ��, �Ϻ�, ���˵��, ������, ��Ӧ��, �����Ϻ�, �����,ʹ�û���,�ͻ�,���°汾,�ͻ����ֺ�, ����,����,���� from  lingjianliaohao where  �Ϻ� like '+ ''''+trim(edit1.Text)+'%'+''''
   else
      sqlstr:='select Ʒ��, �Ϻ�, ���˵��, ������, ��Ӧ��, �����Ϻ�, �����,ʹ�û���,�ͻ�,���°汾,�ͻ����ֺ�, ����,����,���� from  lingjianliaohao where  �Ϻ� like '+ ''''+trim(edit1.Text)+'%'+'''' +' and ���˵�� like '+''''+'%'+trim(edit3.Text)+'%'+'''';

     with adoquery1 do
         begin
             ADOQuery1.Close;
             ADOQuery1.SQL.Clear;
             ADOQuery1.SQL.Add(sqlstr);
             ADOQuery1.Open;

             MakeDBGridColumnsAutoFixItsWidth(dbgrid1);
         end;
         statusbar1.Panels.Items[2].Text:=inttostr(adoquery1.RecordCount);
  end;

end;
procedure Tlufm.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
   begin
       lookupdata(edit2.Text,'Ʒ��');
       statusbar1.Panels.Items[2].Text:=inttostr(adoquery1.RecordCount);
   end;

end;

procedure Tlufm.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
   begin
       lookupdata(edit3.Text,'���˵��');
        statusbar1.Panels.Items[2].Text:=inttostr(adoquery1.RecordCount);
   end;

end;

procedure Tlufm.SpeedButton2Click(Sender: TObject);
begin
if fontdialog1.Execute then
   dbgrid1.Font:=fontdialog1.Font;
end;

procedure Tlufm.SpeedButton11Click(Sender: TObject);
begin
if edit1.Text<>'' then
    lookupdata(edit1.Text,'�Ϻ�')
else if edit2.Text<>'' then
    lookupdata(edit2.Text,'Ʒ��')
else if edit3.Text<>'' then
    lookupdata(edit3.Text,'���˵��');
end;

procedure Tlufm.SpeedButton9Click(Sender: TObject);
begin
if edit1.Text<>'' then
    lookupdata(edit1.Text,'�Ϻ�')
else if edit2.Text<>'' then
    lookupdata(edit2.Text,'Ʒ��')
else if edit3.Text<>'' then
    lookupdata(edit3.Text,'���˵��');
end;

procedure Tlufm.BitBtn1Click(Sender: TObject);
begin
FixDBGridColumnsWidth(dbgrid1);
end;

procedure Tlufm.SpeedButton3Click(Sender: TObject);
begin
browsedata();
end;

procedure Tlufm.printClick(Sender: TObject);
begin
liaohaoprint.DataSet:=adoquery1;
liaohaoprint.liaohao.DataSet:=adoquery1;
liaohaoprint.pingming.DataSet:=adoquery1;
liaohaoprint.guigeshuoming.DataSet:=adoquery1;
//liaohaoprint.jizhong.DataSet:=adoquery1;

liaohaoprint.liaohao.DataField:='�Ϻ�';
liaohaoprint.pingming.DataField:='Ʒ��';
liaohaoprint.guigeshuoming.DataField:='���˵��';
//liaohaoprint.jizhong.DataField:='����';

liaohaoprint.username.Caption:=user;

liaohaoprint.Preview;
end;

procedure Tlufm.N1Click(Sender: TObject);
begin
 runapplication(handle,'.\ftp.exe');
end;

procedure Tlufm.N2Click(Sender: TObject);
begin
 runapplication(handle,'.\ftp.exe');
end;

procedure Tlufm.FormCreate(Sender: TObject);
begin
{edit1.AutoSize:=false;
edit2.AutoSize:=false;
edit3.AutoSize:=false;
edit1.AutoSize:=true;
edit2.AutoSize:=true;
edit3.AutoSize:=true;
edit1.Update;
edit2.Update;
edit3.Update; }
end;

procedure Tlufm.ToolBar1Click(Sender: TObject);
begin
{edit1.AutoSize:=false;
edit2.AutoSize:=false;
edit3.AutoSize:=false;
edit1.AutoSize:=true;
edit2.AutoSize:=true;
edit3.AutoSize:=true;
edit1.Update;
edit2.Update;
edit3.Update; }
end;

procedure Tlufm.N3Click(Sender: TObject);
var
filename:string;
begin
try
if adoquery1.Active=true then
filename:=adoquery1.FieldValues['�����'];
except

end;
runapplication(handle,'\\rdsv\�����'+'\'+filename);
end;


procedure Tlufm.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
 // var
  //flag:boolean;
begin
{ if flag=true then
 begin
dbgrid1.Canvas.Brush.Color:=clcream;
dbgrid1.DefaultDrawColumnCell(rect,datacol,column,state);
 flag:=false;
end
else
begin
dbgrid1.Canvas.Brush.Color:=cllime;
dbgrid1.DefaultDrawColumnCell(rect,datacol,column,state);
 flag:=true;
end;    }

inherited; 
with DBGrid1 do 
begin 
if ((State = [gdSelected]) or (State=[gdSelected,gdFocused])) then 
begin 
Canvas.Font.Color :=Clwhite;
Canvas.Brush.Color :=ClNavy; 
end 
else 
begin 
if DataSource1.DataSet.RecNo mod 2<>0 then {�жϵ�ǰ��������������ż����} 
Canvas.brush.Color :=Clcream {����������У�DBGrid�����԰�ɫ��ʾ}
else
Canvas.brush.Color :=$00EAEAEA; {�����ż���У�DBGrid������ǳ��ɫ��ʾ} 
end; 
DefaultDrawColumnCell(Rect, DataCol, Column, State); {���кܹؼ��ģ�һ����Ҫ��©��} 
end; 

end;

procedure Tlufm.Nn4Click(Sender: TObject);
var
excelfilename:string;
surplyer:string;
begin
  inherited;

if  adoquery1.Active=true then
begin
lookupsurplyerfm.showmodal;
surplyer:=lookupsurplyerfm.surplyer;

if adoquery1.FieldValues['�Ϻ�']<>'' then
begin
 excelfilename:=ExtractFilePath(Application.Exename)+'ECR\judagebook.xls';
 if not fileexists(excelfilename) then
    begin
       application.MessageBox('ECN���嶪ʧ����                  ','����',mb_ok+MB_ICONinformation);
       exit;
    end;
 try
 outexcelfm.createExcelbyfile(excelfilename);
 except
 exit;
 end;
 outexcelfm.OleC.OleObject.application.workbooks[1].sheets[1].cells[5,2]:=adoquery1.FieldValues['�Ϻ�'];
 outexcelfm.OleC.OleObject.application.workbooks[1].sheets[1].cells[6,2]:=adoquery1.FieldValues['���˵��'];
// outexcelfm.OleC.OleObject.application.workbooks[1].sheets[1].cells[5,5]:=adoquery1.FieldValues['ʹ�û���'];
 outexcelfm.OleC.OleObject.application.workbooks[1].sheets[1].cells[6,5]:=adoquery1.FieldValues['������'];
 outexcelfm.OleC.OleObject.application.workbooks[1].sheets[1].cells[7,2]:=surplyer;
 outexcelfm.OleC.OleObject.application.workbooks[1].sheets[1].cells[8,2]:=adoquery1.FieldValues['�����Ϻ�'];
 outexcelfm.ShowModal;
 end;
 end;
end;

procedure Tlufm.N100Click(Sender: TObject);
begin
if adoquery1.Active=true then
begin
     if adoquery1.FieldValues['�Ϻ�']<>'' then
        begin
         modalliaofm.keyliao:=trim(adoquery1.FieldValues['�Ϻ�']);
         modalliaofm.showmodal;
        end;
end;
end;

procedure Tlufm.N44Click(Sender: TObject);
var
surplyer:string;
begin

if  adoquery1.Active=true then
begin
lookupsurplyerfm.showmodal;
surplyer:=lookupsurplyerfm.surplyer;
try
adoquery1.Edit;
adoquery1.FieldValues['��Ӧ��']:=adoquery1.FieldValues['��Ӧ��']+','+surplyer;
adoquery1.Post;
except
    showmessage('�޷����ϴ�����');
end;
end;
end;
procedure Tlufm.SpeedButton1Click(Sender: TObject);
var
surplyer:string;
begin

if  adoquery1.Active=true then
begin
lookupsurplyerfm.showmodal;
surplyer:=lookupsurplyerfm.surplyer;
try
adoquery1.Edit;
adoquery1.FieldValues['��Ӧ��']:=adoquery1.FieldValues['��Ӧ��']+','+surplyer;
adoquery1.Post;
except
    showmessage('�޷����ϴ�����');
end;
end;
end;
procedure createExcel(var v:variant);
var
sheet:variant;
tname:string;
begin
tname:='�����Ϻ�';
v:=createoleobject('Excel.Application');
v.visible:=true;
v.workbooks.add(-4167);
v.workbooks[1].sheets[1].name:=tname;
sheet:=v.workbooks[1].sheets[tname];
end;
procedure Tlufm.exportliaoClick(Sender: TObject);
var
 v:variant;
 i,j:integer;
 s:string;
begin
createExcel(v);
//Ʒ��, �Ϻ�, ���˵��, ������, ��Ӧ��, �����Ϻ�, �����, ����,ʹ�û���,����
v.workbooks[1].sheets[1].cells[1,1]:='Ʒ��';
v.workbooks[1].sheets[1].cells[1,2]:='�Ϻ�';
v.workbooks[1].sheets[1].cells[1,3]:='���˵��';
v.workbooks[1].sheets[1].cells[1,4]:='������';
v.workbooks[1].sheets[1].cells[1,5]:='��Ӧ��';
v.workbooks[1].sheets[1].cells[1,6]:='�����Ϻ�';
v.workbooks[1].sheets[1].cells[1,7]:='�����';
v.workbooks[1].sheets[1].cells[1,8]:='����';
v.workbooks[1].sheets[1].cells[1,9]:='ʹ�û���';
v.workbooks[1].sheets[1].cells[1,10]:='����';
if adoquery1.Active=true then
begin
adoquery1.First;
for i:=2 to adoquery1.RecordCount+1 do
    begin
        for j:=0 to adoquery1.Fields.Count-1 do
            begin
                 if adoquery1.Fields.Fields[j].Value<>Null then
                 s:=trim(adoquery1.Fields.Fields[j].Value)
                 else s:='';
                 v.workbooks[1].sheets[1].cells[i,j+1]:=s;
            end;
        adoquery1.Next;
    end;
v.workbooks[1].sheets[1].cells[i+2,1]:='Export Successfully';
end;
end;

procedure Tlufm.DBGrid1TitleClick(Column: TColumn);
var
i:integer;
begin
for i:= 1 to DBGrid1.Columns.Count do
  begin
    DBGrid1.Columns[i-1].Title.Font.Color := clWindowText;
    DBGrid1.Columns[i-1].Title.Font.Style := [];
  end;

if ADOQuery1.Sort<>Column.FieldName+' DESC' then
begin
   ADOQuery1.Sort := Column.FieldName+' DESC';
   Column.Title.Font.Color := clBlue;         //�ı����������Ϊ��ɫ����ʾ��ǰ������ʽΪ����
   Column.Title.Font.Style := [fsBold];
end
else
  begin
      ADOQuery1.Sort := Column.FieldName+' ASC';
      Column.Title.Font.Color := clred;         //�ı����������Ϊ��ɫ����ʾ��ǰ������ʽΪ����
      Column.Title.Font.Style := [fsBold];
  end;

end;

procedure Tlufm.DBGrid1DblClick(Sender: TObject);
begin
breaked:=true;
end;

end.
