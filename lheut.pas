unit lheut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, luut, DB, ADODB, ComCtrls, Grids, DBGrids, StdCtrls, ExtCtrls,
  Buttons, ToolWin, Menus, DBCtrls;

type
  Tlhefm = class(Tlufm)
    SpeedButton1: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton7: TSpeedButton;
    ToolButton2: TToolButton;
    DBNavigator1: TDBNavigator;
    ADOCommand1: TADOCommand;
    N4: TMenuItem;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure ADOQuery1BeforePost(DataSet: TDataSet);
    procedure ADOQuery1BeforeEdit(DataSet: TDataSet);
    procedure ADOQuery1BeforeInsert(DataSet: TDataSet);
    procedure ADOQuery1BeforeRefresh(DataSet: TDataSet);
    procedure ADOQuery1PostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure checkrecords(fieldname,keystr:string;var count:integer);
    procedure checkrecord(fieldname,keystr:string;var count:integer);
    procedure N100Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  lhefm: Tlhefm;

implementation

uses dmut, checkut,glbut, checkoptionut, modalliao, shenqingprintut;

{$R *.dfm}

procedure Tlhefm.checkrecord(fieldname,keystr:string;var count:integer);
VAR
   sqlstr:string;
begin
   sqlstr:='select * from lingjianliaohao where '+fieldname+ '='+ ''''+keystr+'''';

     with checkfm.ADOQuery1 do
         begin
             Close;
             SQL.Clear;
             SQL.Add(sqlstr);
             Open;
             count:=RecordCount;
         end;
end;

procedure Tlhefm.checkrecords(fieldname,keystr:string;var count:integer);
VAR
   sqlstr:string;
begin
   sqlstr:='select * from lingjianliaohao where '+fieldname+ '  like '+ ''''+'%'+keystr+'%'+'''';

     with checkfm.ADOQuery1 do
         begin
             Close;
             SQL.Clear;
             SQL.Add(sqlstr);
             Open;
             count:=RecordCount;
         end;
end;



procedure Tlhefm.SpeedButton1Click(Sender: TObject);
begin
try
  adoquery1.Edit;
  adoquery1.Post;
except

end;

end;

procedure Tlhefm.SpeedButton7Click(Sender: TObject);
begin
 //dbgrid1.Options[dgrowselect]:=false;
   adoquery1.Edit;
   dbgrid1.ReadOnly:=false;
end;

procedure Tlhefm.ADOQuery1BeforePost(DataSet: TDataSet);
begin
// showmessage('before post') ;
 if   application.MessageBox('你要保存编辑过的记录吗？','HME提示？          ',MB_OKCANCEL+MB_iconinformation)=idok then
      begin
      try
          abort;
        // adoquery1.Post;
      except

          // showmessage('fdfdsfs') ;
      end;

      end
      else
      begin
              adoquery1.Cancel;
              dataset.Cancel;
              abort;
        end;
        // 
end;

procedure Tlhefm.ADOQuery1BeforeEdit(DataSet: TDataSet);
begin
  showmessage('before edit') ;

end;

procedure Tlhefm.ADOQuery1BeforeInsert(DataSet: TDataSet);
begin
   showmessage('before insert') ;

end;

procedure Tlhefm.ADOQuery1BeforeRefresh(DataSet: TDataSet);
begin
 showmessage('before refresh') ;

end;

procedure Tlhefm.ADOQuery1PostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
// showmessage('fdfdsfs') ;
       
end;

procedure Tlhefm.SpeedButton5Click(Sender: TObject);
var
sqlstr,liaohao:string;

begin
fomatliaohao(adoquery1.FieldValues['料号'],liaohao);
if existbom(liaohao)=true then
begin
    if application.MessageBox('您要删除的料号是已经创建的BOM料号，删除此BOM可能将影响多表！！！真的要删除吗？','删除提示！          ',MB_OKcancel+MB_iconinformation)=ID_OK then
            begin
            try
            sqlstr:='drop table '+trim(liaohao);
            adocommand1.CommandText:='';
            adocommand1.CommandText:=sqlstr;
            adocommand1.Execute;

            adoquery1.Delete;
            exit;
            except
              showmessage('删除失败！！！    ') ;
              exit;
            end;
            end;

end
else
begin
if   application.MessageBox('你真的要删除当前记录吗？             ','HME提示？          ',MB_OKCANCEL+MB_iconinformation)=idok then
      begin
      try
         adoquery1.Delete;
      except

           showmessage('删除失败！！！    ') ;
      end;

      end;

end;
end;
procedure Tlhefm.SpeedButton4Click(Sender: TObject);
begin
    checkoptionfm.showmodal;
end;


procedure Tlhefm.N100Click(Sender: TObject);
begin
  inherited;
modalliaofm.speedbutton3.Enabled:=true;
end;

procedure Tlhefm.N4Click(Sender: TObject);
begin
//adoquery2.Close;
//adoquery2.SQL.Clear;
//adoquery2.SQL.Add('select * from prelingjianliaohao where 选项='+''''+'打印'+'''');
//adoquery2.Open;

   shenqingprint.ADOTable1.Close;
   shenqingprint.qp.DataSet:=adoquery1;
   shenqingprint.QRDBText1.DataSet:=adoquery1;
   shenqingprint.QRDBText2.DataSet:=adoquery1;
   shenqingprint.QRDBText3.DataSet:=adoquery1;
   shenqingprint.QRDBText4.DataSet:=adoquery1;
   shenqingprint.QRDBText5.DataSet:=adoquery1;
   shenqingprint.QRDBText6.DataSet:=adoquery1;
   shenqingprint.username.Caption:=userrealname;
   try
   shenqingprint.qp.Preview;
   except
       application.MessageBox('    未知错误！！ ','HME提示！',mb_ok+MB_ICONerror);

   end;

end;

procedure Tlhefm.Edit1KeyPress(Sender: TObject; var Key: Char);
VAR
   sqlstr:string;
begin
if key=#13 then
  begin
  if trim(edit3.Text)='' then
     sqlstr:='select * from  lingjianliaohao where  料号 like '+ ''''+'%'+trim(edit1.Text)+'%'+''''
   else
     sqlstr:='select * from  lingjianliaohao where  料号 like '+ ''''+trim(edit1.Text)+'%'+'''' +' and 规格说明 like '+''''+'%'+trim(edit3.Text)+'%'+'''';

     with adoquery1 do
         begin
             ADOQuery1.Close;
             ADOQuery1.SQL.Clear;
             ADOQuery1.SQL.Add(sqlstr);
             ADOQuery1.Open;
             MakeDBGridColumnsAutoFixItsWidth(dbgrid1);
         end;
         statusbar1.Panels.Items[2].Text:=inttostr(adoquery1.RecordCount);
  end;

end;

end.
