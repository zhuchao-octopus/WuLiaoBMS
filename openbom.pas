unit openbom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, StdCtrls, Grids, DBGrids, DB, ADODB, Buttons;

type
  Topenbomfm = class(TForm)
    DBGrid1: TDBGrid;
    Label1: TLabel;
    ComboBox1: TComboBox;
    DBNavigator1: TDBNavigator;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    CB: TComboBox;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    Button1: TButton;
    Button2: TButton;
    ADOQuery1DSDesigner: TStringField;
    ADOQuery1DSDesigner2: TStringField;
    ADOQuery1DSDesigner3: TStringField;
    ADOQuery1DSDesigner4: TStringField;
    ADOQuery1DSDesigner6: TStringField;
    ADOQuery1DSDesigner7: TStringField;
    ADOQuery1DSDesigner8: TStringField;
    ADOQuery1DSDesigner9: TStringField;
    ADOQuery1DSDesigner10: TStringField;
    ADOQuery1DSDesigner11: TWideStringField;
    ADOQuery1DSDesigner12: TStringField;
    ADOQuery1DSDesigner13: TStringField;
    ADOQuery1DSDesigner14: TWideStringField;
    ADOQuery1DSDesigner15: TStringField;
    ADOQuery1DSDesigner16: TStringField;
    ADOQuery1DSDesigner17: TBCDField;
    ADOQuery1DSDesigner18: TStringField;
    ADOQuery1DSDesigner19: TStringField;
    ADOQuery1DSDesigner20: TStringField;
    Memo1: TMemo;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure CBChange(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cancel:boolean;
  end;

var
  openbomfm: Topenbomfm;

implementation
        uses dmut,glbut;
{$R *.dfm}

procedure Topenbomfm.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
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

procedure Topenbomfm.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
   begin
       adoquery1.Close;
       adoquery1.SQL.Clear;
       adoquery1.SQL.Add('select * from lingjianliaohao where 料号 like '+''''+'%'+trim(combobox1.Text)+'%'+'''');
       adoquery1.Open;
       MakeDBGridColumnsAutoFixItsWidth(DBGrid1);
   end;
end;

procedure Topenbomfm.CBChange(Sender: TObject);
var
str:string;
begin
if trim(cb.Text)='成品BOM' then
   str:='select * from lingjianliaohao where 品名 like '+''''+'%成品%'+''''
else if trim(cb.Text)='半成品BOM' then
    str:='select * from lingjianliaohao where 料号 like '+''''+'9%'+''''
else if trim(cb.Text)='用户自己创建的BOM' then
    str:='select * from lingjianliaohao where 料号 like '+''''+'9%'+'''' +' and 申请人='+''''+userrealname+''''
else if trim(cb.Text)='所有存在BOM' then
str:='select * from lingjianliaohao where 料号 like '+''''+'9%'+'''' 
else
exit;

       adoquery1.Close;
       adoquery1.SQL.Clear;
       adoquery1.SQL.Add(str);
       adoquery1.Open;
       MakeDBGridColumnsAutoFixItsWidth(DBGrid1);
end;

procedure Topenbomfm.DBGrid1CellClick(Column: TColumn);
begin
if adoquery1.Active=true then
   begin
       memo1.Text:=adoquery1.FieldValues['规格说明'];
       edit1.Text:=adoquery1.FieldValues['料号'];
   end;
end;

procedure Topenbomfm.Button2Click(Sender: TObject);
begin
cancel:=true;
close;
end;

procedure Topenbomfm.FormActivate(Sender: TObject);
begin
edit1.Clear;
cancel:=true;
try
adoquery1.Close;
adoquery1.Open;
MakeDBGridColumnsAutoFixItsWidth(DBGrid1);
except

end;
end;

procedure Topenbomfm.Button1Click(Sender: TObject);
var
liaohao:string;
begin
fomatliaohao(trim(edit1.Text),liaohao);
if existbom(liaohao)=false then
begin
    showmessage('选种的料号无效！不是可以打开的BOM');
    exit;
end;
cancel:=false;
close;
end;

procedure Topenbomfm.BitBtn1Click(Sender: TObject);
begin
cancel:=true;
close;
end;

end.
