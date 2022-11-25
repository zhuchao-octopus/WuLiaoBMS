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
      application.MessageBox('没有选种ECR！！              ','错误！',mb_ok+MB_ICONerror);
      abort;
end;
if  adoquery1.FieldValues['liaohao']=Null then
begin
    application.MessageBox('无效的主挡BOM料号！！！           ','错误！',mb_ok+MB_ICONerror);
    abort;
end;
   if (adoquery1.FieldValues['Main_No']='')or(trim(adoquery1.FieldValues['liaohao'])<>mliao) then
begin
      application.MessageBox('没有选种ECR！！,或选种的ECN与主挡BOM料号不匹配！！！           ','错误！',mb_ok+MB_ICONerror);
      abort;
end;
if AnsiStricomp(pchar(creator),pchar(userrealname))<>0 then
 begin
      application.MessageBox('你没有编辑此ECR的权限！！              ','错误！',mb_ok+MB_ICONerror);
      abort;
 end ;
 if fmcaption='创建ＥＣＮ' then
if (trim(adoquery1.FieldValues['是否核准'])='已审核') or ((trim(adoquery1.FieldValues['是否核准'])='已核准'))or(trim(adoquery1.FieldValues['状态'])='已应用') then
  begin
      showmessage('当前ECN不可再编辑！！');
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
