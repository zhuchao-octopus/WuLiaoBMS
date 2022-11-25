unit thhp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bjbm, StdCtrls;

type
  Tthhpfm = class(TBJBMFM)
    R1: TRadioButton;
    R2: TRadioButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    procedure FormActivate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    newliaowz:string;
    oldljwz:string;
  end;

var
  thhpfm: Tthhpfm;

implementation

{$R *.dfm}

procedure Tthhpfm.FormActivate(Sender: TObject);
begin
  inherited;
   button4.Enabled:=true;
   button5.Enabled:=true;
end;

procedure Tthhpfm.Button4Click(Sender: TObject);
begin
r2.Checked:=true;
button5.Enabled:=false;
memo1.Text:=newliaowz;
end;

procedure Tthhpfm.Button5Click(Sender: TObject);

begin
r1.Checked:=true;
button4.Enabled:=false;
memo1.Text:=memo1.Text+newliaowz;
end;

procedure Tthhpfm.Button6Click(Sender: TObject);
begin
memo1.Text:=oldljwz;

end;

end.
