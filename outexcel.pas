unit outexcel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtnrs, StdCtrls, Buttons, ToolWin, ComCtrls, Menus;

type
  Toutexcelfm = class(TForm)
    OleC: TOleContainer;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    MainMenu1: TMainMenu;
    procedure createExcelbyfile(excelfilename:string);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    excelfilename:string;
  end;

var
  outexcelfm: Toutexcelfm;

implementation

{$R *.dfm}
procedure Toutexcelfm.createExcelbyfile(excelfilename:string);
begin

 olec.createObjectFromFile(excelfilename,false);
   OleC.doverb(0);
 //OleC.OleObject.application.CommandBars['Standard'].Visible:=false;
 //OleC.OleObject.OleObject.application.CommandBars['Formatting'].Visible:=false;
 //OleC.OleObject.OleObject.application.CommandBars['Reviewing'].Visible:=false;
 //OleC.OleObject.doverb(0);



end;

procedure Toutexcelfm.Button1Click(Sender: TObject);
begin

  //  excelfilename:=opendialog1.FileName;
  //  createexcelbyfile(excelfilename);
end;

procedure Toutexcelfm.SpeedButton2Click(Sender: TObject);
begin
close;
end;

procedure Toutexcelfm.FormActivate(Sender: TObject);
begin
if excelfilename<>'' then
begin
try
//createexcelbyfile(excelfilename);

excelfilename:='';
except
    close;
end;
end;
end;

procedure Toutexcelfm.SpeedButton1Click(Sender: TObject);
begin
olec.Visible:=false;
olec.Visible:=true;
end;

procedure Toutexcelfm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
OleC.Close;
//olec.OleObject.application.quit;
end;

end.
