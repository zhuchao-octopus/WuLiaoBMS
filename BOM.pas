unit BOM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Buttons, ToolWin, StdCtrls, Grids, DBGrids;

type
  TBOMFM = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    SpeedButton1: TSpeedButton;
    ToolButton1: TToolButton;
    SpeedButton6: TSpeedButton;
    Memo1: TMemo;
    StatusBar1: TStatusBar;
    PrintDialog1: TPrintDialog;
    SpeedButton2: TSpeedButton;
    ps: TPrinterSetupDialog;
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BOMFM: TBOMFM;


implementation 
uses printers;


{$R *.dfm}




procedure TBOMFM.SpeedButton6Click(Sender: TObject);
begin
CLOSE;
end;

procedure TBOMFM.SpeedButton1Click(Sender: TObject);
var
lines:integer; 
prntext:system.text;
                                        //��PRNTEXT����Ϊһ����SYSTEM����Ԫ���ж�����ı��ļ�
begin
if printdialog1.execute then

assignprn(prntext);                                  //��PRNTEST�������ӡ��
rewrite(prntext);                             //����REWRITE����,Ϊ������ѷ�����ļ�
printer.canvas.font:=memo1.font;
                                              //�ѵ�ǰMEMO1������ָ������ӡ�����CANVAS����������
for lines:=0 to memo1.lines.count-1 do 
writeln(prntext,memo1.lines[lines]); 
                                               //��MEMO������д����ӡ������
system.close(prntext);                    //�رմ�ӡ�ļ�
end;





procedure TBOMFM.SpeedButton2Click(Sender: TObject);
begin
if ps.Execute then
   begin

   end;

end;

end.
