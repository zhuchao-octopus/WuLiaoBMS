unit price;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  Tpricefm = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    ComboBox1: TComboBox;
    Label2: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    price:double;
    currency:string;
    flag:boolean;
  end;

var
  pricefm: Tpricefm;

implementation

{$R *.dfm}

procedure Tpricefm.Button2Click(Sender: TObject);
begin
flag:=false;
close;
end;

procedure Tpricefm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9','.',#8]) then
   key:=#0;
end;

procedure Tpricefm.Button1Click(Sender: TObject);
begin
flag:=true;
price:=strtofloat(edit1.Text);
currency:=trim(combobox1.Text);
close;
end;

procedure Tpricefm.FormActivate(Sender: TObject);
begin

flag:=false;
end;

end.
