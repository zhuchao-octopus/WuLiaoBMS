unit sysinf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls;

type
  Tsysinffm = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  sysinffm: Tsysinffm;

implementation

{$R *.dfm}

procedure Tsysinffm.FormCreate(Sender: TObject);
begin
SetWindowPos(handle, HWND_TOPMOST,
Left, Top, Width, Height,0);
end;

procedure Tsysinffm.Button1Click(Sender: TObject);
begin
close;
end;

end.
