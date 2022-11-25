unit editprice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, luut, Menus, DB, ADODB, ComCtrls, Grids, DBGrids, ExtCtrls,
  StdCtrls, Buttons, ToolWin;

type
  Tlufm3 = class(Tlufm)
    CoolBar4: TCoolBar;
    ToolBar6: TToolBar;
    Label3: TLabel;
    Edit4: TEdit;
    PopupMenu2: TPopupMenu;
    N4: TMenuItem;
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  lufm3: Tlufm3;
 clicks:boolean;
implementation

uses price;

{$R *.dfm}

procedure Tlufm3.Edit4KeyPress(Sender: TObject; var Key: Char);

begin

if key=#13 then
   begin
       lookupdata(edit4.Text,'单价');
   end;
end;

procedure Tlufm3.DBGrid1CellClick(Column: TColumn);
begin
if clicks=true then
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
end;

procedure Tlufm3.DBGrid1DblClick(Sender: TObject);
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
pricefm.ComboBox1.Text:=trim(adoquery1.FieldValues['币种']);
pricefm.showmodal;
if pricefm.flag=true then
begin
adoquery1.Edit;
adoquery1.FieldValues['币种']:=trim(pricefm.currency);
adoquery1.FieldValues['单价']:=pricefm.price;
adoquery1.Post;
end;
end;


procedure Tlufm3.N3Click(Sender: TObject);
begin
  inherited;
clicks:=true;
end;

procedure Tlufm3.N4Click(Sender: TObject);
begin
  inherited;
clicks:=false;
end;

end.
