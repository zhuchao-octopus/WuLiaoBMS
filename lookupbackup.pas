unit lookupbackup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, StdCtrls, ExtCtrls, Grids, DBGrids, DB, ADODB,
  Buttons;

type
  Tlookupbackupfm = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    Panel1: TPanel;
    ComboBox1: TComboBox;
    DBGrid1: TDBGrid;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    StatusBar1: TStatusBar;
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  lookupbackupfm: Tlookupbackupfm;
  bomlist:boolean;
implementation
      uses dmut,glbut;
{$R *.dfm}

procedure Tlookupbackupfm.ComboBox1KeyPress(Sender: TObject;
  var Key: Char);
  var
  str:string;
begin
    str:='select * from sysobjects where name like '+''''+'%'+trim(combobox1.Text)+'%'+''''+' and name like '+''''+'%backup'+'''';
    if key=#13 then
    begin
     with adoquery1 do
         begin
             Close;
             SQL.Clear;
             SQL.Add(str);
             Open;
             MakeDBGridColumnsAutoFixItsWidth(DBGrid1);
             bomlist:=false;
         end;
    end;
end;

procedure Tlookupbackupfm.DBGrid1DblClick(Sender: TObject);
var
  tname:string;
begin
if bomlist=true then
   exit;
   
   try
    tname:=trim(adoquery1.FieldValues['name']);
   except
   exit;
   bomlist:=false;
   end;

   adoquery1.Close;
   adoquery1.SQL.Clear;
   adoquery1.SQL.Add('select * from '+tname);
   adoquery1.Open;
   MakeDBGridColumnsAutoFixItsWidth(DBGrid1);
   bomlist:=true;
end;

procedure Tlookupbackupfm.SpeedButton3Click(Sender: TObject);
begin
close;
end;

procedure Tlookupbackupfm.DBGrid1DrawColumnCell(Sender: TObject;
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
if DataSource1.DataSet.RecNo mod 2<>0 then {判断当前数据是奇数还是偶数行}
Canvas.brush.Color :=ClWhite {如果是奇数行，DBGrid背景以白色显示}
else
Canvas.brush.Color :=$00EAEAEA; {如果是偶数行，DBGrid背景以浅灰色显示}
end;
DefaultDrawColumnCell(Rect, DataCol, Column, State); {这行很关键的，一定不要遗漏了}
end;

end;

procedure Tlookupbackupfm.DBGrid1TitleClick(Column: TColumn);
var
i:integer;
begin
for i:= 1 to DBGrid1.Columns.Count do
  begin
    DBGrid1.Columns[i-1].Title.Font.Color := clWindowText;
    DBGrid1.Columns[i-1].Title.Font.Style := [];
  end;

if adoquery1.Sort<>Column.FieldName+' DESC' then
begin
   adoquery1.Sort := Column.FieldName+' DESC';
   Column.Title.Font.Color := clBlue;         //改变标题行字体为红色，表示当前的排序方式为降序
   Column.Title.Font.Style := [fsBold];
end
else
  begin
      adoquery1.Sort := Column.FieldName+' ASC';
      Column.Title.Font.Color := clred;         //改变标题行字体为红色，表示当前的排序方式为降序
      Column.Title.Font.Style := [fsBold];
  end;

end;

end.
