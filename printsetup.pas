unit printsetup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  Tprintsetupfm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Panel2: TPanel;
    Panel3: TPanel;
    C1: TCheckBox;
    C2: TCheckBox;
    C3: TCheckBox;
    Allbom: TRadioButton;
    partbom: TRadioButton;
    Label1: TLabel;
    Panel1: TPanel;
    Label2: TLabel;
    rdonelayer: TRadioButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cancel:boolean;
  end;

var
  printsetupfm: Tprintsetupfm;

implementation

{$R *.dfm}

procedure Tprintsetupfm.Button2Click(Sender: TObject);
begin
cancel:=true;
close;

end;

procedure Tprintsetupfm.Button1Click(Sender: TObject);
begin
//if adotable1.
//lastliao:=trim(edit1.Text);

cancel:=false;
close;
end;

procedure Tprintsetupfm.FormActivate(Sender: TObject);
begin
cancel:=true;
end;

end.
