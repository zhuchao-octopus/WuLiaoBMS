unit gpnameut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB;

type
  Tgpfm = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    ad: TADOQuery;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  gpfm: Tgpfm;

implementation
        uses userut,dmut ;
{$R *.dfm}

procedure Tgpfm.Button2Click(Sender: TObject);
begin
close;
end;

procedure Tgpfm.Button1Click(Sender: TObject);
var
sqlstr:string;
gpname,newname:string;
begin
gpname:=trim(userfm.cb.Text);
newname:=trim(edit1.text);
if gpname='' then
   begin
      application.MessageBox('  ��Ч���û��飡����                 ','FALCON ERP ��ʾ',mb_ok+MB_ICONinformation);
      abort;
   end;

   sqlstr:='update userp set �û���='   +''''+newname+''''+   ' where �û���='+'''' + gpname+'''';
try
ad.Close;
ad.SQL.Clear;
ad.SQL.Add(sqlstr);
ad.ExecSQL;
 application.MessageBox('  �û������޸ĳɹ�������                 ','FALCON ERP ��ʾ',mb_ok+MB_ICONinformation);
 userfm.updatecb;
except
   application.MessageBox('  �����޷��޸ģ��޸�ʧ�ܣ�����                 ','FALCON ERP ��ʾ',mb_ok+MB_ICONinformation);
   abort;
end;

end;


end.
