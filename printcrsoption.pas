unit printcrsoption;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, ADODB, Grids, DBGrids, DBCtrls;

type
  Tprintcrsoptionfm = class(TForm)
    R1: TRadioButton;
    R2: TRadioButton;
    R3: TRadioButton;
    Button1: TButton;
    Button2: TButton;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    C1: TCheckBox;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    Edit1: TEdit;
    DBNavigator1: TDBNavigator;
    ADOQuery1DSDesigner: TStringField;
    ADOQuery1DSDesigner2: TWideStringField;
    ADOQuery1DSDesigner3: TStringField;
    ADOQuery1DSDesigner4: TStringField;
    ADOQuery1DSDesigner5: TWideStringField;
    ADOQuery1DSDesigner6: TWideStringField;
    ADOQuery1DSDesigner7: TStringField;
    ADOQuery1DSDesigner8: TStringField;
    ADOQuery1DSDesigner9: TStringField;
    C2: TCheckBox;
    DBGrid2: TDBGrid;
    DataSource2: TDataSource;
    ADOQuery2: TADOQuery;
    Edit2: TEdit;
    DBNavigator2: TDBNavigator;
    Panel1: TPanel;
    ADOQuery2StringField: TStringField;
    ADOQuery2WideStringField: TWideStringField;
    ADOQuery2StringField2: TStringField;
    ADOQuery2StringField3: TStringField;
    ADOQuery2WideStringField2: TWideStringField;
    ADOQuery2WideStringField3: TWideStringField;
    ADOQuery2StringField4: TStringField;
    ADOQuery2StringField5: TStringField;
    ADOQuery2StringField6: TStringField;
    procedure FormActivate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure C1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
  cancel:boolean;
    { Public declarations }
  end;

var
  printcrsoptionfm: Tprintcrsoptionfm;

implementation
     uses dmut;
{$R *.dfm}

procedure Tprintcrsoptionfm.FormActivate(Sender: TObject);
begin
adoquery1.Active:=true;
cancel:=true;
end;

procedure Tprintcrsoptionfm.Button2Click(Sender: TObject);
begin
edit1.Text:='';
edit2.Text:='';
cancel:=true;
close;
end;

procedure Tprintcrsoptionfm.Button1Click(Sender: TObject);
begin
cancel:=false;
close;
end;

procedure Tprintcrsoptionfm.C1Click(Sender: TObject);
begin
if c1.Checked=true then
   dbgrid1.Color:=clwhite
else
   dbgrid1.Color:=clmenu;
end;

procedure Tprintcrsoptionfm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
   begin
       adoquery1.Close;
       adoquery1.SQL.Clear;
       adoquery1.SQL.Add('select * from surplyer where 简称 like '+''''+'%'+trim(edit1.Text)+'%'+'''');
       adoquery1.Open
   end;
end;

procedure Tprintcrsoptionfm.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
   begin
       adoquery2.Close;
       adoquery2.SQL.Clear;
       adoquery2.SQL.Add('select * from surplyer where 简称 like '+''''+'%'+trim(edit2.Text)+'%'+'''');
       adoquery2.Open
   end;
end;

procedure Tprintcrsoptionfm.DBGrid1CellClick(Column: TColumn);
begin
if adoquery1.Active=true then
edit1.Text:=adoquery1.FieldValues['简称'];
if trim(edit1.Text)='' then
edit1.Text:=  adoquery1.FieldValues['全名'];
//adoquery1.Close;
end;

procedure Tprintcrsoptionfm.DBGrid2CellClick(Column: TColumn);
begin
if adoquery2.Active=true then
edit2.Text:=adoquery2.FieldValues['简称'];
end;

procedure Tprintcrsoptionfm.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure Tprintcrsoptionfm.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
with DBGrid2 do
begin 
if ((State = [gdSelected]) or (State=[gdSelected,gdFocused])) then 
begin 
Canvas.Font.Color :=Clwhite;
Canvas.Brush.Color :=ClNavy; 
end 
else 
begin 
if DataSource2.DataSet.RecNo mod 2<>0 then {判断当前数据是奇数还是偶数行} 
Canvas.brush.Color :=Clcream {如果是奇数行，DBGrid背景以白色显示}
else
Canvas.brush.Color :=$00EAEAEA; {如果是偶数行，DBGrid背景以浅灰色显示}
end; 
DefaultDrawColumnCell(Rect, DataCol, Column, State); {这行很关键的，一定不要遗漏了} 
end;
end;

end.
