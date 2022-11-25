unit EP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unit11, StdCtrls, ComCtrls, ExtCtrls, Buttons,adodb;

type
  TEPFM = class(TForm11)
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EPFM: TEPFM;

implementation

uses dmut, BOMIMPORT;

{$R *.dfm}

procedure TEPFM.SpeedButton1Click(Sender: TObject);
var
i:integer;
ds :tadotable;
begin
speedbutton2.Enabled:=false;
ds:=bomimportfm.adotable1;
if (edit1.Text='')or(edit2.Text='') then
    begin
     application.MessageBox('至少有一个参数为空值!','输入参数错误',mb_ok+MB_ICONSTOP);
     abort;
     end;
if (excelflag=true)and(bomimportfm.OleContainer1.Visible=true) then
begin
     try
     bomimportfm.importbom(strtoint(edit1.Text),strtoint(edit3.Text),strtoint(edit2.Text),'lingjianliaohao',ds);

     application.MessageBox('数据已成功导入数据库！！！                         ','导入成功',mb_ok+MB_ICONinformation);
     speedbutton2.Enabled:=true;
     except
       application.MessageBox('导入数据表时出现错误，请检查参数设置是否正确,EXCEL是否处于激活状态,是否出现主键冲突！','导入数据错误',mb_ok+MB_ICONSTOP);
       speedbutton2.Enabled:=true;
     end;
 end
  else
      application.MessageBox('没有数据对象可供导入，请打开一个EXCEL文件！','导入数据错误',mb_ok+MB_ICONSTOP);


    speedbutton2.Enabled:=true;

end;





end.
