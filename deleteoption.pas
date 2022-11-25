unit deleteoption;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  Tdeleteoptionfm = class(TForm)
    R1: TRadioButton;
    R2: TRadioButton;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
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
  deleteoptionfm: Tdeleteoptionfm;

implementation

{$R *.dfm}

procedure Tdeleteoptionfm.Button2Click(Sender: TObject);
begin
cancel:=true;
close;
end;

procedure Tdeleteoptionfm.Button1Click(Sender: TObject);
begin
cancel:=false;
close;
end;

procedure Tdeleteoptionfm.FormActivate(Sender: TObject);
begin
cancel:=true;
end;

end.
