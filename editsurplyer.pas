unit editsurplyer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Buttons, ToolWin, Grids, DBGrids, DB, ADODB, StdCtrls,
  ExtCtrls, DBCtrls;

type
  Teditsurplyerfm = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    SpeedButton6: TSpeedButton;
    DBGrid1: TDBGrid;
    StatusBar1: TStatusBar;
    AQ: TADOQuery;
    DataSource1: TDataSource;
    ToolBar2: TToolBar;
    ComboBox1: TComboBox;
    DBNavigator1: TDBNavigator;
    SpeedButton1: TSpeedButton;
    ToolButton2: TToolButton;
    AQDSDesigner: TStringField;
    AQDSDesigner2: TWideStringField;
    AQDSDesigner3: TStringField;
    AQDSDesigner4: TStringField;
    AQDSDesigner5: TWideStringField;
    AQDSDesigner6: TWideStringField;
    AQDSDesigner7: TStringField;
    AQDSDesigner8: TStringField;
    AQDSDesigner9: TStringField;
    SpeedButton3: TSpeedButton;
    procedure SpeedButton6Click(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton3Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  editsurplyerfm: Teditsurplyerfm;

implementation
      uses dmut,glbut;
{$R *.dfm}

procedure Teditsurplyerfm.SpeedButton6Click(Sender: TObject);
begin
close;
end;

procedure Teditsurplyerfm.ComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then
   begin
     aq.Close;
     aq.SQL.Clear;
     aq.SQL.Add('select * from surplyer where 简称 like '+''''+'%'+combobox1.Text+'%'+''''+' order by surplyer_ID');
     aq.Open;
     MakeDBGridColumnsAutoFixItsWidth(dbgrid1);
   end;
end;

procedure Teditsurplyerfm.FormActivate(Sender: TObject);
begin
aq.Close;
aq.Open;
end;

procedure Teditsurplyerfm.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure Teditsurplyerfm.SpeedButton3Click(Sender: TObject);
begin
aq.Close;
aq.Open;
end;

procedure Teditsurplyerfm.DBGrid1TitleClick(Column: TColumn);
var
i:integer;
begin
for i:= 1 to DBGrid1.Columns.Count do
  begin
    DBGrid1.Columns[i-1].Title.Font.Color := clWindowText;
    DBGrid1.Columns[i-1].Title.Font.Style := [];
  end;

if AQ.Sort<>Column.FieldName+' DESC' then
begin
   AQ.Sort := Column.FieldName+' DESC';
   Column.Title.Font.Color := clBlue;         //改变标题行字体为红色，表示当前的排序方式为降序
   Column.Title.Font.Style := [fsBold];
end
else
  begin
      AQ.Sort := Column.FieldName+' ASC';
      Column.Title.Font.Color := clred;         //改变标题行字体为红色，表示当前的排序方式为降序
      Column.Title.Font.Style := [fsBold];
  end;

end;

end.
