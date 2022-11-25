unit createcr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  Tcreatecrfm = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    ComboBox1: TComboBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    liaohao:string;
    cancel:boolean;
  end;

var
  createcrfm: Tcreatecrfm;

implementation

{$R *.dfm}

procedure Tcreatecrfm.Button1Click(Sender: TObject);
begin
if combobox1.Text='' then
begin
    application.MessageBox(' 无效的机种名！！                  ','错误',mb_ok+MB_ICONSTOP);
    abort;
end;
//liaohao:=combobox1.Text;
cancel:=false;
close;
end;

procedure Tcreatecrfm.Button2Click(Sender: TObject);
begin
//liaohao:='cancel';
cancel:=true;
close;

end;

procedure Tcreatecrfm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
//if not (key in ['0'..'9','a'..'z','A'..'Z',#8]) then
//   key:=#0;
end;

procedure Tcreatecrfm.FormActivate(Sender: TObject);
begin
cancel:=true;
liaohao:='';
end;

procedure Tcreatecrfm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
//if cancel<>true then
 //  canclose:=false;

end;

end.
