unit changeps;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, ExtCtrls;

type
  Tchangepsfm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    ADOQuery1: TADOQuery;
    Panel1: TPanel;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  changepsfm: Tchangepsfm;

implementation
      uses glbut,dmut;
{$R *.dfm}

procedure Tchangepsfm.Button2Click(Sender: TObject);
begin
close;
end;

procedure Tchangepsfm.Button1Click(Sender: TObject);
var
sqlstr:string;
ps:string;
begin
if trim(edit1.Text)='' then
   begin
      application.MessageBox('  �����Կ����룡����                 ','FALCON ERP ��ʾ',mb_ok+MB_ICONinformation);
      abort;
   end;
if trim(edit1.Text)<>trim(edit2.Text) then
   begin
       application.MessageBox('  �����������벻һֱ�����������룡����                 ','FALCON ERP ��ʾ',mb_ok+MB_ICONinformation);
       abort;
   end;
   ps:=trim(edit1.Text);
   sqlstr:='update users set ����='   +''''+ps+''''+   ' where �û���='+'''' + user+'''';
try
adoquery1.Close;
adoquery1.SQL.Clear;
adoquery1.SQL.Add(sqlstr);
adoquery1.ExecSQL;
 application.MessageBox('  �����޸ĳɹ������µ�½����Ч������                 ','FALCON ERP ��ʾ',mb_ok+MB_ICONinformation);
      
except
   application.MessageBox('  �����޷��޸ģ��޸�ʧ�ܣ�����                 ','FALCON ERP ��ʾ',mb_ok+MB_ICONinformation);
   abort;
end;

end;

end.
