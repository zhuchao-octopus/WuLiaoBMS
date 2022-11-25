unit lingjianliaohao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ToolWin;

type
  Tlingjianliaohaofm = class(TForm)
    StatusBar1: TStatusBar;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    SpeedButton1: TSpeedButton;
    SpeedButton4: TSpeedButton;
    ToolButton1: TToolButton;
    SpeedButton6: TSpeedButton;
    ToolBar2: TToolBar;
    cb: TComboBox;
    procedure SpeedButton6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  lingjianliaohaofm: Tlingjianliaohaofm;

implementation

{$R *.dfm}

procedure Tlingjianliaohaofm.SpeedButton6Click(Sender: TObject);
begin
close;
end;

end.
