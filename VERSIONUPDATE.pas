unit VERSIONUPDATE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TVERSIONUPDATEFM = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
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
  VERSIONUPDATEFM: TVERSIONUPDATEFM;

implementation

{$R *.dfm}

procedure TVERSIONUPDATEFM.Button2Click(Sender: TObject);
begin
cancel:=true;
close;
end;

procedure TVERSIONUPDATEFM.Button1Click(Sender: TObject);
begin
cancel:=false;
close;
end;

procedure TVERSIONUPDATEFM.FormActivate(Sender: TObject);
begin
cancel:=true;
end;

end.
