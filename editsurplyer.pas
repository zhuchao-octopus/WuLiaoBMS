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
     aq.SQL.Add('select * from surplyer where ��� like '+''''+'%'+combobox1.Text+'%'+''''+' order by surplyer_ID');
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
if DataSource1.DataSet.RecNo mod 2<>0 then {�жϵ�ǰ��������������ż����} 
Canvas.brush.Color :=Clcream {����������У�DBGrid�����԰�ɫ��ʾ}
else
Canvas.brush.Color :=$00EAEAEA; {�����ż���У�DBGrid������ǳ��ɫ��ʾ} 
end; 
DefaultDrawColumnCell(Rect, DataCol, Column, State); {���кܹؼ��ģ�һ����Ҫ��©��} 
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
   Column.Title.Font.Color := clBlue;         //�ı����������Ϊ��ɫ����ʾ��ǰ������ʽΪ����
   Column.Title.Font.Style := [fsBold];
end
else
  begin
      AQ.Sort := Column.FieldName+' ASC';
      Column.Title.Font.Color := clred;         //�ı����������Ϊ��ɫ����ʾ��ǰ������ʽΪ����
      Column.Title.Font.Style := [fsBold];
  end;

end;

end.
