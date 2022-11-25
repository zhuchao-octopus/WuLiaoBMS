unit bomcheck;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bomedit, ADODB, DB, Grids, DBGrids, ExtCtrls, ComCtrls,
  StdCtrls, Buttons, ToolWin, Menus, ImgList, Mask, DBCtrls;

type
  Tbomcheckfm = class(Tbomeditfm)
    SpeedButton8: TSpeedButton;
    SpeedButton10: TSpeedButton;
    BOM1: TMenuItem;
    procedure ADOQuery1BeforePost(DataSet: TDataSet);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure TVClick(Sender: TObject);
    procedure cbKeyPress(Sender: TObject; var Key: Char);
    procedure TabSheet1Show(Sender: TObject);
    procedure Edit10KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure getbomlist();
    procedure getbomlistCHECKED();
    procedure BOM1Click(Sender: TObject);
    procedure getbomlistbymodal(modal:string);
    procedure getmodel(model:string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  bomcheckfm: Tbomcheckfm;

implementation
         uses glbut, appliaohao, VERSIONUPDATE, APPROVEBOM;
{$R *.dfm}

procedure Tbomcheckfm.ADOQuery1BeforePost(DataSet: TDataSet);
begin
 //if application.MessageBox('BOM已经被审核通过！是否保存审核结果？','提示？',MB_OKCANCEL+MB_iconinformation)<>idok then
    //  begin
    //    adoquery1.Cancel;
    //  end;

end;

procedure Tbomcheckfm.SpeedButton9Click(Sender: TObject);
var
liaohao:string;
backupliaohao:string;
begin
if ADOQUERY1.Active<> TRUE THEN
begin
   application.MessageBox(' 您需要选种你要想审核的BOM！！！   未选种！！！！！                            ','HME提示 未选种！',mb_Ok+MB_ICONINFORMATION);
    abort;
end;
try

fomatliaohao(trim(adoquery1.FieldValues['料号']),liaohao);
except
    application.MessageBox(' 您需要选种要审核的BOM！！！   未选种！！！！！                            ','HME提示 未选种！',mb_Ok+MB_ICONINFORMATION);
    abort;
end;
APPROVEBOMFM.DataSource1.DataSet:=adoquery1;
APPROVEBOMFM.showmodal;
if approvebomfm.cancel=true then
   exit;
if existbom(liaohao)=true then
  begin
     adoquery1.Edit;
     
     adoquery1.FieldValues['承认']:='已核准';
    // if application.MessageBox('当前核准之BOM是否当作独立的BOM来处理！！！！！                            ','HME提示！',mb_YESNO+MB_ICONINFORMATION)=ID_YES THEN
     if APPROVEBOMFM.C2.Checked=true then
          begin
           adoquery1.FieldValues['状态']:=true;
          end
     else  adoquery1.FieldValues['状态']:=false;
     try
     adoquery1.Post;
    // showmessage('核准成功完成！！！');
     except
          application.MessageBox(' BOM 出现异常 核准该BOM是出现错误！！！！！                            ','HME提示！',mb_OK+MB_ICONINFORMATION);
          abort;
     end;

   //  if application.MessageBox('当前核准之BOM是否进行级联核准！！！！！                            ','HME提示！',mb_YESNO+MB_ICONINFORMATION)=ID_YES THEN
     if APPROVEBOMFM.C1.Checked=true then
          begin
          try
            updatestatus(trim(adoquery1.FieldValues['料号']));
           // showmessage('级联核准成功完成！！！');
          except
            showmessage('级联核准异常终止！！！');
          end;
          end;
    // application.MessageBox('核准操作完成！！！！                            ','HME提示！',mb_OK+MB_ICONINFORMATION);
  END
  else
    begin
     application.MessageBox(' 您选种的是BOM中的物料而并非要承认的BOM！！！   选错了！！！！！                            ','HME提示 选错了！',mb_OK+MB_ICONINFORMATION);
     abort;
    END;

//backup bom
//if application.MessageBox('  是否需要备份此BOM！！！！！                            ','HME提示！',mb_YESNO+MB_ICONINFORMATION)=id_NO THEN
if APPROVEBOMFM.C3.Checked=false then
BEGIN
  EXIT;
END;
if adoquery1.FieldValues['最新版本']=Null then
begin
    showmessage('版本信息丢失！备份被取消！！！');
    exit;
end;
backupliaohao:=trim(trim(adoquery1.FieldValues['料号'])+trim(adoquery1.FieldValues['最新版本'])+'_BACKUP');
if (backupliaohao[1]<>'9')or(backupliaohao[2]<>'9') then
exit;

if trim(adoquery1.FieldValues['最新版本'])='' then
begin
    showmessage('版本信息丢失！备份被取消！！！');
    exit;
end;
try

backupbom(backupliaohao,trim(adoquery1.FieldValues['料号']));
//showmessage('备份完成！！！');
except

end;
if  APPROVEBOMFM.C4.Checked=true then
    begin
         sbutton15.OnClick(self);
    end;
application.MessageBox('操作完成！！！！                            ','HME提示！',mb_OK+MB_ICONINFORMATION);
end;
procedure Tbomcheckfm.getbomlistCHECKED();
var
  l1: TTreeNode;
  i:integer;
  liaohao:string;
begin
LIAOHAO:='99';
statusbar1.Panels.Items[3].Text:='请稍等...正在刷新BOM.................' ;
statusbar1.Update;
///////////////////////////get bom list///////////////////////
    tv.Items.Clear;
     with tq do
       begin
           close;
           tq.SQL.Clear;
           tq.SQL.Add('select * from lingjianliaohao where 料号 like '+''''+'%'+trim(liaohao)+'%'+''''+' and 品名 like '+''''+'%成品%'+''''+' and 承认='+''''+'已核准'+'''');
           open;
           First;
       end;
 for i:=0 to tq.RecordCount-1 do
   begin
        l1:=tv.Items.add(nil ,tq.FieldValues['品名']+'('+trim(tq.FieldValues['料号'])+')');
        tq.Next;
   end;
  statusbar1.Panels.Items[2].Text:=inttostr(tv.Items.Count);
  statusbar1.Panels.Items[3].Text:='刷新任务完成！！！！' ;
end;
procedure Tbomcheckfm.getbomlist();
var
  l1: TTreeNode;
  i:integer;
  liaohao:string;
begin
LIAOHAO:='99';
statusbar1.Panels.Items[3].Text:='请稍等...正在刷新BOM.................' ;
statusbar1.Update;
///////////////////////////get bom list///////////////////////
    tv.Items.Clear;
     with tq do
       begin
           close;
           tq.SQL.Clear;
           tq.SQL.Add('select * from lingjianliaohao where 料号 like '+''''+'%'+trim(liaohao)+'%'+''''+' and 品名 like '+''''+'%成品%'+''''+' and 承认='+''''+'已审核'+'''');
           open;
           First;
       end;
 for i:=0 to tq.RecordCount-1 do
   begin
        l1:=tv.Items.add(nil ,tq.FieldValues['品名']+'('+trim(tq.FieldValues['料号'])+')');
        tq.Next;
   end;
  statusbar1.Panels.Items[2].Text:=inttostr(tv.Items.Count);
  statusbar1.Panels.Items[3].Text:='刷新任务完成！！！！' ;
end;
procedure Tbomcheckfm.SpeedButton1Click(Sender: TObject);
begin
getbomlist();
end;

procedure Tbomcheckfm.DBGrid1DblClick(Sender: TObject);
begin
;

end;

procedure Tbomcheckfm.TVClick(Sender: TObject);
//var
 // sqlstr:string;
 // liaohao:string;
 // bomliaohao:string;
begin
   inherited;
{try
//if tv.Items.Item[0].Selected=false    then
 //  exit;
   tv.Selected.ImageIndex:=0;
   tv.Update;
   tv.Selected.ImageIndex:=1;
   tv.Update;
   liaohao:=tv.Selected.Text;
   if trim(liaohao)='' then
       exit;
   if not (liaohao[1] in ['0'..'9']) then
   begin
   liaohao:='';
   copystring(tv.Selected.Text,'(',')',liaohao);
   end;
   bomliaohao:=liaohao;
   sqlstr:='select * from lingjianliaohao where 料号='+''''+liaohao+'''';
   adoquery1.Close;
   adoquery1.SQL.Clear;
   adoquery1.SQL.Add(sqlstr);
   adoquery1.Open;
   adotable1.Close;
   MakeDBGridColumnsAutoFixItsWidth(DBGrid2) ;
except
    adoquery1.Close;
    adotable1.Close;
end;
try
   fomatliaohao(liaohao,liaohao);
   if existbom(liaohao) then
   begin
   adotable1.Close;
   datasource1.DataSet:=adotable1;
   adotable1.TableName:=liaohao;
   adotable1.Open;
   MakeDBGridColumnsAutoFixItsWidth(DBGrid1);
 end;
except
   adotable1.Close;
end;   }
end;

procedure Tbomcheckfm.getmodel(model:string);
begin

adoquery1.Close;
adoquery1.SQL.Clear;
adoquery1.SQL.Add('select * from lingjianliaohao where 使用机种 like '+''''+'%'+trim(model)+'%'+''''+' and 料号 like '+''''+'99%'+''''+' and 承认='+''''+'已审核'+'''');
adoquery1.Open;
if adoquery1.RecordCount<1 then
   showmessage('没有发现此机种相关的BOM，如果确实存在，请更新机种信息！！！');

end;
procedure Tbomcheckfm.getbomlistbymodal(modal:string);
var
  l1, l2: TTreeNode;
  i:integer;
begin
if trim(modal)='' then
exit;
   getmodel(modal);
   if adoquery1.RecordCount>=1 then
      begin
      statusbar1.Panels.Items[2].Text:='';
      statusbar1.Panels.Items[3].Text:='请稍等，正在查询BOM！！！！' ;
          with tv.Items do
               begin
                   tv.Items.Clear;
                   adoquery1.First;
                   l1:=add(nil ,'机种型号'+'('+trim(adoquery1.FieldValues['使用机种'])+')');
                   for i:=0 to adoquery1.RecordCount-1 do
                       begin
                          addchild(l1 ,adoquery1.FieldValues['品名']+'('+trim(adoquery1.FieldValues['料号'])+')');
                          adoquery1.Next;
                       end;
               end;
      end;
statusbar1.Panels.Items[2].Text:=inttostr(tv.Items.Count)+'个物料';
statusbar1.Panels.Items[3].Text:='刷新任务完成！！！！' ;

end;
procedure Tbomcheckfm.cbKeyPress(Sender: TObject; var Key: Char);
var
  l1, l2,l3,l4,l5,l6,l7: TTreeNode;
  i1,i2,i3,i4,i5,i6,i7:integer;
  liaohao:string;
  sqlstr:string;
begin
if key=#13 then
begin
if trim(cb.Text)='' then
   exit;
getbomlistbymodal(trim(cb.Text));
end;



{
 statusbar1.Panels.Items[3].Text:='请稍等...正在刷新BOM.................' ;
 statusbar1.Update;

 sqlstr:='select * from lingjianliaohao where 料号 like '+''''+'%'+trim(cb.text)+'%'+''''+' and 承认='+''''+'已审核'+'''';
with tv.Items do
   begin
     clear;
       with adoquery2 do
       begin
           close;
           sql.Clear;
           sql.Add(sqlstr);
           open;
           First;
           if recordcount<1 then    //select bom
           begin
               application.MessageBox('没有找到匹配的BOM，请输入有效关键字！！！！         ','提示！',MB_OK+MB_iconinformation) ;
               statusbar1.Panels.Items[2].Text:=inttostr(tv.Items.Count);
               statusbar1.Panels.Items[3].Text:='刷新BOM完成！！！！！';
               exit;
           end;

           for i1:=0 to adoquery2.RecordCount-1 do        //expent bom
                begin
                fomatliaohao(trim(adoquery2.FieldValues['料号']),liaohao);
                if existbom(liaohao)=true then    //check bom
                   begin
                   l1:=add(nil ,adoquery2.FieldValues['品名']+'('+trim(adoquery2.FieldValues['料号'])+')');
                   end;
                    adoquery2.Next;
                end;
       end;

end;

   end;


  statusbar1.Panels.Items[2].Text:=inttostr(tv.Items.Count);
  statusbar1.Panels.Items[3].Text:='刷新BOM完成！！！！！';  }
end;



procedure Tbomcheckfm.TabSheet1Show(Sender: TObject);
var
i,count:integer;
strsql,tname,liaohao:string;
begin
exit;
bomlist.Close;                            //get all bom
bomlist.Open;
if bomlist.RecordCount>=1 then
   begin
        for i:=0 to bomlist.RecordCount-1 do
            begin
               tname:=parseliaohao(bomlist.FieldValues['name']);
               strsql:='select * from lingjianliaohao where 料号='+''''+tname+''''+' and 承认='+''''+'已审核'+'''';
               adoquery1.Close;
               adoquery1.SQL.Clear;                              //get checked bom
               adoquery1.SQL.Add(strsql);
               adoquery1.Open;

               if  adoquery1.RecordCount=1 then
                   begin
                    //  liaohao:=adoquery1.FieldValues['料号'];
                    //  adoquery2.Close;                          //get checked bom information
                    //  adoquery2.SQL.Clear;
                    //  adoquery2.SQL.Add('select * from lingjianliaohao where 料号= '+''''+liaohao+'''');
                   //   adoquery2.Open;
                      lv.Items.Add;
                      count:=lv.Items.Count;
                      lv.Items[count-1].Caption:=adoquery1.FieldValues['料号'];          //add to string list
                      if  adoquery1.FieldValues['品名']<>null then
                      lv.Items[count-1].SubItems.add(adoquery1.FieldValues['品名']);
                      lv.Items[count-1].SubItems.add(adoquery1.FieldValues['规格说明']);

                   end;


               bomlist.Next;
            end;
            adoquery1.Close;
   end;
end;

procedure Tbomcheckfm.Edit10KeyPress(Sender: TObject; var Key: Char);
var
i,count:integer;
strsql,tname,liaohao,bomliao:string;
begin
if key=#13 then
begin                                                                                                               //+' and 类别='+''''+'true'+''''
lv.Clear;
bomlist.Close;
bomlist.SQL.Clear;
//('select * from lingjianliaohao where 料号 like '+''''+'%'+trim(edit10.Text)+'%'+''''+ ' and 承认='+''''+'已审核'+''''+' and 类别='+''''+'true'+''''); 
bomlist.SQL.Add('select * from lingjianliaohao where 料号 like '+''''+'%'+trim(edit10.Text)+'%'+''''+ ' and 承认='+''''+'已审核'+'''');                           //get all bom
bomlist.Open;
if bomlist.RecordCount>=1 then
   begin
        for i:=0 to bomlist.RecordCount-1 do
            begin
                      bomliao:=bomlist.FieldValues['料号'];
                      fomatliaohao(bomliao,bomliao);
                      if existbom(bomliao)=true then
                         begin
                      lv.Items.Add;
                      count:=lv.Items.Count;
                      lv.Items[count-1].Caption:=trim(bomlist.FieldValues['料号']);          //add to string list
                      if  bomlist.FieldValues['品名']<>null then
                      lv.Items[count-1].SubItems.add(bomlist.FieldValues['品名']);
                      lv.Items[count-1].SubItems.add(bomlist.FieldValues['规格说明']);
                   end;


               bomlist.Next;
            end;
            bomlist.Close;
   end;
end;
end;

procedure Tbomcheckfm.SpeedButton7Click(Sender: TObject);
begin
  appliaohaofm.show;
end;

procedure Tbomcheckfm.SpeedButton10Click(Sender: TObject);
var
backupliaohao:string;
begin
if adoquery1.FieldValues['最新版本']=Null then
begin
    showmessage('版本信息丢失！备份被取消！！！');
    exit;
end;
backupliaohao:=trim(trim(adoquery1.FieldValues['料号'])+trim(adoquery1.FieldValues['最新版本'])+'_BACKUP');
  if (backupliaohao[1]<>'9')or(backupliaohao[2]<>'9') then
  begin
  showmessage('不能对半成品进行备份！！！！');
  exit;
  end;

if trim(adoquery1.FieldValues['最新版本'])='' then
begin
    showmessage('版本信息丢失！备份被取消！！！');
    exit;
end;
try
backupbom(backupliaohao,trim(adoquery1.FieldValues['料号']));
showmessage('备份完成！！！');
except
showmessage('备份时出现异常，数据可能备份不完整！！！');
end;


end;

procedure Tbomcheckfm.SpeedButton8Click(Sender: TObject);
var
backupliaohao:string;
begin
if application.MessageBox('  真要升级当前BOM吗！！！！！                            ','HME提示！',mb_YESNO+MB_ICONINFORMATION)=id_NO THEN
BEGIN
  EXIT;
END;
 statusbar1.Panels.Items[3].Text:='请稍等...正在更新版本信息.................' ;
 statusbar1.Update;
  if adoquery1.FieldValues['最新版本']=Null then
begin
    showmessage('版本信息丢失！版本为空！！！');
    exit;
end;
if trim(adoquery1.FieldValues['最新版本'])='' then
begin
    showmessage('版本信息丢失！版本为空！！！');
    exit;
end;

versionupdatefm.Edit1.Text:=adoquery1.FieldValues['最新版本'];
versionupdatefm.showmodal;
if versionupdatefm.cancel=true then
   exit;
backupliaohao:=trim(trim(adoquery1.FieldValues['料号'])+trim(adoquery1.FieldValues['最新版本'])+'_BACKUP');
if (backupliaohao[1]<>'9')or(backupliaohao[2]<>'9') then
begin
      showmessage('非成品BOM，不能进行版本升级！！！');
      exit;
end;
if  trim(versionupdatefm.Edit2.Text)='' then
   begin
       showmessage('无效的版本号!!!');
       exit;
   end;

//if application.MessageBox('  是否需要备份此BOM！！！！！                            ','HME提示！',mb_YESNO+MB_ICONINFORMATION)=id_NO THEN
//BEGIN
//  EXIT;
//END;
try
 statusbar1.Panels.Items[3].Text:='请稍等...正在备份原有BOM.................正在升级中' ;
 statusbar1.Update;
backupbom(backupliaohao,trim(adoquery1.FieldValues['料号']));
adoquery1.Edit;
adoquery1.FieldValues['最新版本']:=trim(versionupdatefm.Edit2.Text);
adoquery1.FieldValues['承认']:='';
adoquery1.Post;

showmessage('BOM升级完成！！！           ');
//lastliao:='FullExtended' ;
except
    showmessage('备份中断，备份的数据可能不完整！！！');
end;



 statusbar1.Panels.Items[3].Text:='BOM升级完成！！！！.................' ;
 statusbar1.Update;
end;

procedure Tbomcheckfm.BOM1Click(Sender: TObject);
begin
 getbomlistCHECKED();

end;

end.
