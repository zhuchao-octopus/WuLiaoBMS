unit Unit22;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls;

type
  TForm22 = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Button1: TButton;
    Label8: TLabel;
    Label7: TLabel;
    Panel2: TPanel;
    Label6: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label14: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Label9: TLabel;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form22: TForm22;

implementation

{$R *.dfm}

procedure TForm22.Button1Click(Sender: TObject);
begin
CLOSE;
end;

end.
