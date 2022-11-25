unit BOMIMPORT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, importut, Menus, ImgList, DB, ADODB, Grids, DBGrids, ComCtrls,
  Buttons, ToolWin, OleCtnrs, ExtCtrls;

type
  TBOMIMPORTFM = class(Timportfm)
    lhdb: TADOTable;
    ADOCommand1: TADOCommand;
    procedure N48Click(Sender: TObject);
    PROCEDURE importbom(k,m,l:integer;tablename:string;ds:tadotable);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BOMIMPORTFM: TBOMIMPORTFM;

implementation

uses EP, dmut,glbut;

{$R *.dfm}

procedure createtable(tablename:string);
var
  str:string;
begin

str:=
'CREATE TABLE [dbo].['+tablename+'] (                           '+
 '	[xuhao_ID] [int] IDENTITY (1, 1) NOT NULL  ,                       '+
 '	[料号] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,         '+
 '	[阶层] [char] (2) COLLATE Chinese_PRC_CI_AS NULL ,                 '+
 '	[单位用量] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,         '+
 '	[工单用量] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,         '+
 '	[零件位置] [varchar] (100) COLLATE Chinese_PRC_CI_AS NULL,         '+
 ' 	[承认] [nchar] (10) COLLATE Chinese_PRC_CI_AS NULL                 '+
') ON [PRIMARY]';

    //primary key

  // '	[序号] [nchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,  '+
  // 	' [品名] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL , '+
  //'	[规格说明] [varchar] (200) COLLATE Chinese_PRC_CI_AS NOT NULL , '+

   with bomimportfm.ADOCommand1 do
         begin

             CommandText:='';
             CommandText:=str;
             execute;

         end;

end;

PROCEDURE tbomimportfm.importbom(k,m,l:integer;tablename:string;ds:tadotable);
var
 i,j,jieceng,nextjieceng:integer;
 p,pl,ti:integer;
strs:string;
liaohao,preliaohao:string;
ldb,dbl:Tadotable;
tn:array[0..100] of string;
tj:array[0..100] of integer;
begin
ldb:=bomimportfm.lhdb;
ti:=0;
for p:=low(tn) to high(tn) do
   begin
       tn[p]:='';
       tj[p]:=101;
   end;
i:=k;
j:=l;
jieceng:=0;
nextjieceng:=0;
   //ds.Close;
   //ds.TableName:=tablename;
   //ds.Active:=true;
   epfm.ProgressBar1.Position:=0;
   epfm.ProgressBar2.Position:=0;
   epfm.ProgressBar2.Max:=strtoint(epfm.Edit1.Text);
   epfm.ProgressBar1.Max:=strtoint(epfm.Edit2.Text);
 // form1.adotable1.First;
   //form1.ADOTable1.Open;
   for i:=k to m do
    begin
       epfm.Edit1.Text:=inttostr(i);
       epfm.Update;

         liaohao:=bomimportfm.OleContainer1.OleObject.application.cells[i,4].value;
         jieceng:=strtoint(bomimportfm.OleContainer1.OleObject.application.cells[i,3].value);
         nextjieceng:=strtoint(bomimportfm.OleContainer1.OleObject.application.cells[i+1,3].value);
         fomatliaohao(liaohao,liaohao);
        { case jieceng of
            0: tn[0]:=form1.OleContainer1.OleObject.application.cells[i,4].value;
            1: tn[1]:=form1.OleContainer1.OleObject.application.cells[i,4].value;
            2: tn[2]:=form1.OleContainer1.OleObject.application.cells[i,4].value;
            3: tn[3]:=form1.OleContainer1.OleObject.application.cells[i,4].value;
            4: tn[4]:=form1.OleContainer1.OleObject.application.cells[i,4].value;
            5: tn[5]:=form1.OleContainer1.OleObject.application.cells[i,4].value;
            6: tn[6]:=form1.OleContainer1.OleObject.application.cells[i,4].value;
            7: tn[7]:=form1.OleContainer1.OleObject.application.cells[i,4].value;
            8: tn[8]:=form1.OleContainer1.OleObject.application.cells[i,4].value;
         end; }


         if jieceng<nextjieceng then
             begin
                   if existbom(liaohao)=false then
                    createtable(liaohao);
                    ldb.Close;
                    ldb.TableName:='lingjianliaohao';
                    ldb.Active:=true;
                    ds.Active:=false;
                    dbl:=ldb;
                    tn[ti]:=liaohao;
                    tj[ti]:=jieceng;
                    ti:=ti+1;
             end
             else
            begin
                      for   pl:=low(tj) to high(tj)   do
                       begin
                           if tj[100-pl]<>101 then
                           begin
                               if tj[100-pl]=jieceng-1 then
                               begin
                               preliaohao:=tn[100-pl];
                               break;
                               end;
                           end;
                       end;
                    ds.Close;
                    ds.TableName:=preliaohao;
                    ds.Active:=true;
                    ldb.Active:=false;
                    dbl:=ds;
            end;
              dbl.Close;
              dbl.Open;
         if ldb.TableName<>'lingjianliao' then
                      begin
                          l:=6;
                      end;
         for j:=0 to l-1 do
              begin
                   dbl.Edit;
                   strs:=bomimportfm.OleContainer1.OleObject.application.cells[i,j+2].value;                //stringreplace(str,'''','',[rfReplaceAll]);
                   dbl.Fields.Fields[j].Value:=strs;
                   epfm.ProgressBar1.StepBy(1);

              end;
           try
           dbl.Append;
           except
           //application.MessageBox('导入数据表时出现错误！','导入数据错误',mb_ok+MB_ICONSTOP);
           //abort;
           end;

           epfm.ProgressBar1.Position:=0;
           epfm.ProgressBar2.StepBy(1);
          // form1.ADOTable1.Insert;;
          // form1.adotable1.Last;

          // form1.adotable1.Append;
         //  form1.ADOTable1.
        // form1.ADODataSet1.DataSetField.FieldValues[1]:=form1.OleContainer1.OleObject.application.cells[i,j].value;
    end;
   // form1.ADOTable1.Post;
   epfm.ProgressBar1.Position:=strtoint(epfm.Edit2.Text);

end;

procedure TBOMIMPORTFM.N48Click(Sender: TObject);
begin
 EPFM.SHOWMODAL;
end;

end.
