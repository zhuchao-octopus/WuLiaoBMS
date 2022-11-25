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
                                        //将PRNTEXT声明为一个在SYSTEM程序单元当中定义的文本文件
begin
if printdialog1.execute then

assignprn(prntext);                                  //将PRNTEST分配给打印机
rewrite(prntext);                             //调用REWRITE函数,为输出打开已分配的文件
printer.canvas.font:=memo1.font;
                                              //把当前MEMO1的字体指定给打印对象的CANVAS的字体属性
for lines:=0 to memo1.lines.count-1 do 
writeln(prntext,memo1.lines[lines]); 
                                               //把MEMO的内容写到打印机对象
system.close(prntext);                    //关闭打印文件
end;





procedure TBOMFM.SpeedButton2Click(Sender: TObject);
begin
if ps.Execute then
   begin

   end;

end;

end.
