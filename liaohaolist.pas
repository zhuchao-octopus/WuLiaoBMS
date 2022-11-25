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
sqlstr:='select  Ʒ��, �Ϻ�, ���˵��, ������, ��Ӧ��, �����Ϻ�, �����, ����,����,����  from lingjianliaohao where �Ϻ�='+''''+liaohao+'''';
   adoquery1.Close;
   adoquery1.SQL.Clear;
   adoquery1.SQL.Add(sqlstr);
   adoquery1.Open;
   MakeDBGridColumnsAutoFixItsWidth(DBGrid1) ;
end;

procedure Tliaohaolistfm.DBGrid1DblClick(Sender: TObject);
begin


if  adoquery1.FieldValues['����']=Null then
begin
    adoquery1.Edit;
    adoquery1.FieldValues['����']:=0;
    adoquery1.Post;
end;
if  adoquery1.FieldValues['����']=Null then
begin
    adoquery1.Edit;
    adoquery1.FieldValues['����']:='�����';
    adoquery1.Post;
end;

pricefm.Edit1.Text:=floattostr(adoquery1.FieldValues['����']);
pricefm.ComboBox1.Text:=adoquery1.FieldValues['����'];
pricefm.showmodal;
if pricefm.flag=true then
begin
adoquery1.Edit;
adoquery1.FieldValues['����']:=pricefm.price;
adoquery1.FieldValues['����']:=trim(pricefm.currency);
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
if DataSource1.DataSet.RecNo mod 2<>0 then {�жϵ�ǰ��������������ż����} 
//Canvas.brush.Color :=ClWhite {����������У�DBGrid�����԰�ɫ��ʾ}
//else
//Canvas.brush.Color :=$00EAEAEA; {�����ż���У�DBGrid������ǳ��ɫ��ʾ}
//end;
//DefaultDrawColumnCell(Rect, DataCol, Column, State); {���кܹؼ��ģ�һ����Ҫ��©��}
//end;
   
end;

end.
