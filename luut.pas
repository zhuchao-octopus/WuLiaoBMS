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

   sqlstr:='select 品名, 料号, 规格说明, 制造商, 供应商, 厂家料号, 规格书, 承认,使用机种,单价 from  lingjianliaohao';

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
   sqlstr:='select 品名, 料号, 规格说明, 制造商, 供应商, 厂家料号, 规格书,使用机种, 承认,单价 from  lingjianliaohao where '+ fieldname +' like '+ ''''+'%'+keystr+'%'+''''
   else
    sqlstr:='select 品名, 料号, 规格说明, 制造商, 供应商, 厂家料号, 规格书,使用机种, 承认,单价 from  lingjianliaohao where '+ fieldname +' like '+ ''''+'%'+keystr+'%'+''''+' and 料号 like '+''''+trim(edit1.Text)+'%'+'''';

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
     sqlstr:='select 品名, 料号, 规格说明, 制造商, 供应商, 厂家料号, 规格书,使用机种,客户,最新版本,客户机种号, 承认,单价,币种 from  lingjianliaohao where  料号 like '+ ''''+trim(edit1.Text)+'%'+''''
   else
      sqlstr:='select 品名, 料号, 规格说明, 制造商, 供应商, 厂家料号, 规格书,使用机种,客户,最新版本,客户机种号, 承认,单价,币种 from  lingjianliaohao where  料号 like '+ ''''+trim(edit1.Text)+'%'+'''' +' and 规格说明 like '+''''+'%'+trim(edit3.Text)+'%'+'''';

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
       lookupdata(edit2.Text,'品名');
       statusbar1.Panels.Items[2].Text:=inttostr(adoquery1.RecordCount);
   end;

end;

procedure Tlufm.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
   begin
       lookupdata(edit3.Text,'规格说明');
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
    lookupdata(edit1.Text,'料号')
else if edit2.Text<>'' then
    lookupdata(edit2.Text,'品名')
else if edit3.Text<>'' then
    lookupdata(edit3.Text,'规格说明');
end;

procedure Tlufm.SpeedButton9Click(Sender: TObject);
begin
if edit1.Text<>'' then
    lookupdata(edit1.Text,'料号')
else if edit2.Text<>'' then
    lookupdata(edit2.Text,'品名')
else if edit3.Text<>'' then
    lookupdata(edit3.Text,'规格说明');
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

liaohaoprint.liaohao.DataField:='料号';
liaohaoprint.pingming.DataField:='品名';
liaohaoprint.guigeshuoming.DataField:='规格说明';
//liaohaoprint.jizhong.DataField:='机种';

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
filename:=adoquery1.FieldValues['规格书'];
except

end;
runapplication(handle,'\\rdsv\规格书'+'\'+filename);
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
if DataSource1.DataSet.RecNo mod 2<>0 then {判断当前数据是奇数还是偶数行} 
Canvas.brush.Color :=Clcream {如果是奇数行，DBGrid背景以白色显示}
else
Canvas.brush.Color :=$00EAEAEA; {如果是偶数行，DBGrid背景以浅灰色显示} 
end; 
DefaultDrawColumnCell(Rect, DataCol, Column, State); {这行很关键的，一定不要遗漏了} 
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

if adoquery1.FieldValues['料号']<>'' then
begin
 excelfilename:=ExtractFilePath(Application.Exename)+'ECR\judagebook.xls';
 if not fileexists(excelfilename) then
    begin
       application.MessageBox('ECN摸板丢失！！                  ','错误',mb_ok+MB_ICONinformation);
       exit;
    end;
 try
 outexcelfm.createExcelbyfile(excelfilename);
 except
 exit;
 end;
 outexcelfm.OleC.OleObject.application.workbooks[1].sheets[1].cells[5,2]:=adoquery1.FieldValues['料号'];
 outexcelfm.OleC.OleObject.application.workbooks[1].sheets[1].cells[6,2]:=adoquery1.FieldValues['规格说明'];
// outexcelfm.OleC.OleObject.application.workbooks[1].sheets[1].cells[5,5]:=adoquery1.FieldValues['使用机种'];
 outexcelfm.OleC.OleObject.application.workbooks[1].sheets[1].cells[6,5]:=adoquery1.FieldValues['制造商'];
 outexcelfm.OleC.OleObject.application.workbooks[1].sheets[1].cells[7,2]:=surplyer;
 outexcelfm.OleC.OleObject.application.workbooks[1].sheets[1].cells[8,2]:=adoquery1.FieldValues['厂家料号'];
 outexcelfm.ShowModal;
 end;
 end;
end;

procedure Tlufm.N100Click(Sender: TObject);
begin
if adoquery1.Active=true then
begin
     if adoquery1.FieldValues['料号']<>'' then
        begin
         modalliaofm.keyliao:=trim(adoquery1.FieldValues['料号']);
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
adoquery1.FieldValues['供应商']:=adoquery1.FieldValues['供应商']+','+surplyer;
adoquery1.Post;
except
    showmessage('无法承认此物料');
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
adoquery1.FieldValues['供应商']:=adoquery1.FieldValues['供应商']+','+surplyer;
adoquery1.Post;
except
    showmessage('无法承认此物料');
end;
end;
end;
procedure createExcel(var v:variant);
var
sheet:variant;
tname:string;
begin
tname:='导出料号';
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
//品名, 料号, 规格说明, 制造商, 供应商, 厂家料号, 规格书, 承认,使用机种,单价
v.workbooks[1].sheets[1].cells[1,1]:='品名';
v.workbooks[1].sheets[1].cells[1,2]:='料号';
v.workbooks[1].sheets[1].cells[1,3]:='规格说明';
v.workbooks[1].sheets[1].cells[1,4]:='制造商';
v.workbooks[1].sheets[1].cells[1,5]:='供应商';
v.workbooks[1].sheets[1].cells[1,6]:='厂家料号';
v.workbooks[1].sheets[1].cells[1,7]:='规格书';
v.workbooks[1].sheets[1].cells[1,8]:='承认';
v.workbooks[1].sheets[1].cells[1,9]:='使用机种';
v.workbooks[1].sheets[1].cells[1,10]:='单价';
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
   Column.Title.Font.Color := clBlue;         //改变标题行字体为红色，表示当前的排序方式为降序
   Column.Title.Font.Style := [fsBold];
end
else
  begin
      ADOQuery1.Sort := Column.FieldName+' ASC';
      Column.Title.Font.Color := clred;         //改变标题行字体为红色，表示当前的排序方式为降序
      Column.Title.Font.Style := [fsBold];
  end;

end;

procedure Tlufm.DBGrid1DblClick(Sender: TObject);
begin
breaked:=true;
end;

end.
