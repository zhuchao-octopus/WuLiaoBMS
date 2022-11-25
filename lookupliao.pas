unit lookupliao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  Tlookupliaofm = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    CheckBox1: TCheckBox;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cancel:boolean;
    liaohao:string;
  end;

var
  lookupliaofm: Tlookupliaofm;

implementation

{$R *.dfm}

procedure Tlookupliaofm.Button2Click(Sender: TObject);
begin
cancel:=true;
//flag:=true;
 close;
end;

procedure Tlookupliaofm.Button1Click(Sender: TObject);
begin
cancel:=false;
liaohao:=trim(edit1.Text);
//flag:=true;
close;
end;

procedure Tlookupliaofm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
//if flag=false then
//canclose:=false;
//if cancel=true then
 //  canclose:=true
   
end;

procedure Tlookupliaofm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
    button1.Click;
end;

procedure Tlookupliaofm.FormActivate(Sender: TObject);
begin
cancel:=true;
end;

end.
