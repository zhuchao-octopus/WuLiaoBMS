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
     application.MessageBox('������һ������Ϊ��ֵ!','�����������',mb_ok+MB_ICONSTOP);
     abort;
     end;
if (excelflag=true)and(bomimportfm.OleContainer1.Visible=true) then
begin
     try
     bomimportfm.importbom(strtoint(edit1.Text),strtoint(edit3.Text),strtoint(edit2.Text),'lingjianliaohao',ds);

     application.MessageBox('�����ѳɹ��������ݿ⣡����                         ','����ɹ�',mb_ok+MB_ICONinformation);
     speedbutton2.Enabled:=true;
     except
       application.MessageBox('�������ݱ�ʱ���ִ���������������Ƿ���ȷ,EXCEL�Ƿ��ڼ���״̬,�Ƿ����������ͻ��','�������ݴ���',mb_ok+MB_ICONSTOP);
       speedbutton2.Enabled:=true;
     end;
 end
  else
      application.MessageBox('û�����ݶ���ɹ����룬���һ��EXCEL�ļ���','�������ݴ���',mb_ok+MB_ICONSTOP);


    speedbutton2.Enabled:=true;

end;





end.
