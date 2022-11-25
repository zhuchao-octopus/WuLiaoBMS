unit createecrmodel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, OleCtnrs, ToolWin, ComCtrls;

type
  TForm1 = class(TForm)
    ToolBar1: TToolBar;
    OleContainer1: TOleContainer;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    OD: TOpenDialog;
    sd: TSaveDialog;
    SpeedButton3: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
   f:string;
implementation

{$R *.dfm}

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
if od.Execute then
   begin
 OleContainer1.createObjectFromFile(od.FileName,false);

 OleContainer1.doverb(0);
 //OleContainer1.OleObject.application.CommandBars['Standard'].Visible:=false;
 //OleContainer1.OleObject.application.CommandBars['Formatting'].Visible:=false;
 //OleContainer1.OleObject.application.CommandBars['Reviewing'].Visible:=false;
 //OleContainer1.doverb(0);

   end;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
     if sd.Execute then
        begin
           f:=sd.FileName;
           // olecontainer1.OleObject.application.save;
            OleContainer1.SaveToFile(sd.FileName+'.ECR');

        end;
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
  IF f='' then
    f:='ECR';
    olecontainer1.LoadFromFile(f+'.ecr');
end;

end.
