unit checklh;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  Tchecklhfm = class(TForm)
    C1: TCheckBox;
    C2: TCheckBox;
    C3: TCheckBox;
    C4: TCheckBox;
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    R1: TRadioButton;
    R2: TRadioButton;
    Panel3: TPanel;
    Button1: TButton;
    Button2: TButton;
    procedure C3Click(Sender: TObject);
    procedure C4Click(Sender: TObject);
    procedure R2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cancel:boolean;
  end;

var
  checklhfm: Tchecklhfm;

implementation

{$R *.dfm}

procedure Tchecklhfm.C3Click(Sender: TObject);
begin
if (c3.Checked=true)or(c4.Checked=true) then
   begin
       r1.Checked:=true;
       r2.Enabled:=false;
   end
else
    begin
        r2.Enabled:=true;

    end;

end;

procedure Tchecklhfm.C4Click(Sender: TObject);
begin
if (c3.Checked=true)or(c4.Checked=true) then
   begin
       r1.Checked:=true;
       r2.Enabled:=false;
   end
else r2.Enabled:=true;

end;

procedure Tchecklhfm.R2Click(Sender: TObject);
begin
if (c3.Checked=true)or(c4.Checked=true) then
   begin
       r1.Checked:=true;
       r2.Enabled:=false;
   end
else r2.Enabled:=true;
end;

procedure Tchecklhfm.FormActivate(Sender: TObject);
begin
cancel:=true;
end;

procedure Tchecklhfm.Button2Click(Sender: TObject);
begin
cancel:=true;
close;
end;

procedure Tchecklhfm.Button1Click(Sender: TObject);
begin
cancel:=false;
close;
end;

end.
