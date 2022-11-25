unit bomdelete;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  Tbomdeletefm = class(TForm)
    R1: TRadioButton;
    R2: TRadioButton;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Panel2: TPanel;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure R2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
      captions:string;
      cancel:boolean;
  end;

var
  bomdeletefm: Tbomdeletefm;

implementation

{$R *.dfm}

procedure Tbomdeletefm.Button2Click(Sender: TObject);
begin
cancel:=true;
close;
end;

procedure Tbomdeletefm.Button1Click(Sender: TObject);
begin
cancel:=false;
close;
end;

procedure Tbomdeletefm.R2Click(Sender: TObject);
begin
//r1.Checked:=true;
//showmessage('此项功能不可用');
end;

procedure Tbomdeletefm.FormActivate(Sender: TObject);
begin
cancel:=true;
if captions='BOM维护' then
begin
  r2.Enabled:=true;
  captions:='';
end
else
  r2.Enabled:=false;
end;

end.
