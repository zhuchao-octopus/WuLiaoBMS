unit liaohaolist;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ADODB, Buttons, ExtCtrls;

type
  Tliaohaolistfm = class(TForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    ADOQuery1: TADOQuery;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    liaohao:string;
  end;

var
  liaohaolistfm: Tliaohaolistfm;

implementation
      uses glbut,dmut, price;
{$R *.dfm}

procedure Tliaohaolistfm.SpeedButton1Click(Sender: TObject);
begin
close;
end;

procedure Tliaohaolistfm.FormActivate(Sender: TObject);
var
   sqlstr:string;
begin
sqlstr:='select  品名, 料号, 规格说明, 制造商, 供应商, 厂家料号, 规格书, 承认,单价,币种  from lingjianliaohao where 料号='+''''+liaohao+'''';
   adoquery1.Close;
   adoquery1.SQL.Clear;
   adoquery1.SQL.Add(sqlstr);
   adoquery1.Open;
   MakeDBGridColumnsAutoFixItsWidth(DBGrid1) ;
end;

procedure Tliaohaolistfm.DBGrid1DblClick(Sender: TObject);
begin


if  adoquery1.FieldValues['单价']=Null then
begin
    adoquery1.Edit;
    adoquery1.FieldValues['单价']:=0;
    adoquery1.Post;
end;
if  adoquery1.FieldValues['币种']=Null then
begin
    adoquery1.Edit;
    adoquery1.FieldValues['币种']:='人民币';
    adoquery1.Post;
end;

pricefm.Edit1.Text:=floattostr(adoquery1.FieldValues['单价']);
pricefm.ComboBox1.Text:=adoquery1.FieldValues['币种'];
pricefm.showmodal;
if pricefm.flag=true then
begin
adoquery1.Edit;
adoquery1.FieldValues['单价']:=pricefm.price;
adoquery1.FieldValues['币种']:=trim(pricefm.currency);
adoquery1.Post;
end;
end;

procedure Tliaohaolistfm.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
{inherited;
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
//Canvas.brush.Color :=ClWhite {如果是奇数行，DBGrid背景以白色显示}
//else
//Canvas.brush.Color :=$00EAEAEA; {如果是偶数行，DBGrid背景以浅灰色显示}
//end;
//DefaultDrawColumnCell(Rect, DataCol, Column, State); {这行很关键的，一定不要遗漏了}
//end;
   
end;

end.
