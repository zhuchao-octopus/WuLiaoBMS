unit checkecr2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, checkerc, DB, ADODB, ComCtrls, Grids, DBGrids, ExtCtrls,
  DBCtrls, StdCtrls, Buttons, ToolWin;

type
  Tcheckercfm2 = class(Tcheckercfm)
    ToolButton2: TToolButton;
    SpeedButton7: TSpeedButton;
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    mliao,wenhao,updateversion:string;
  //  ecrname:string;
  fmcaption:string;
  end;

var
  checkercfm2: Tcheckercfm2;

implementation
         uses glbut;
{$R *.dfm}

procedure Tcheckercfm2.SpeedButton7Click(Sender: TObject);
var
creator:string;
begin
creator:= adoquery1.FieldValues['app_person'];
if adoquery1.Active=false then
begin
      application.MessageBox('û��ѡ��ECR����              ','����',mb_ok+MB_ICONerror);
      abort;
end;
if  adoquery1.FieldValues['liaohao']=Null then
begin
    application.MessageBox('��Ч������BOM�Ϻţ�����           ','����',mb_ok+MB_ICONerror);
    abort;
end;
   if (adoquery1.FieldValues['Main_No']='')or(trim(adoquery1.FieldValues['liaohao'])<>mliao) then
begin
      application.MessageBox('û��ѡ��ECR����,��ѡ�ֵ�ECN������BOM�ϺŲ�ƥ�䣡����           ','����',mb_ok+MB_ICONerror);
      abort;
end;
if AnsiStricomp(pchar(creator),pchar(userrealname))<>0 then
 begin
      application.MessageBox('��û�б༭��ECR��Ȩ�ޣ���              ','����',mb_ok+MB_ICONerror);
      abort;
 end ;
 if fmcaption='�����ţã�' then
if (trim(adoquery1.FieldValues['�Ƿ��׼'])='�����') or ((trim(adoquery1.FieldValues['�Ƿ��׼'])='�Ѻ�׼'))or(trim(adoquery1.FieldValues['״̬'])='��Ӧ��') then
  begin
      showmessage('��ǰECN�����ٱ༭����');
      exit;
  end;
ecrname:=adoquery1.FieldValues['Main_No'];
wenhao:=adoquery1.fieldvalues['wenhao'];
close;
end;

procedure Tcheckercfm2.SpeedButton6Click(Sender: TObject);
begin
ecrname:='cancel';
  inherited;

end;

end.
