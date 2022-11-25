unit bomwh;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bomedit, Menus, ImgList, ADODB, DB, StdCtrls, ComCtrls, Grids,
  DBGrids, ExtCtrls, Mask, DBCtrls, Buttons, ToolWin;

type
  Tbomwhfm = class(Tbomeditfm)
    BOM1: TMenuItem;
    procedure cbKeyPress(Sender: TObject; var Key: Char);
    procedure TVClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure getbomlistbymodal(modal:string);
    procedure getmodel(model:string);
    procedure Edit10KeyPress(Sender: TObject; var Key: Char);
    procedure BOM1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  bomwhfm: Tbomwhfm;

implementation
       uses glbut, editbom, bomdelete, lingjian, addliao, saveas;
{$R *.dfm}

procedure Tbomwhfm.getmodel(model:string);
begin

adoquery1.Close;
adoquery1.SQL.Clear;
adoquery1.SQL.Add('select * from lingjianliaohao where 使用机种 like '+''''+'%'+trim(model)+'%'+''''+' and 料号 like '+''''+'99%'+'''');
adoquery1.Open;
if adoquery1.RecordCount<1 then
   showmessage('没有发现此机种相关的BOM，如果确实存在，请更新机种信息！！！');

end;
procedure Tbomwhfm.getbomlistbymodal(modal:string);
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
procedure Tbomwhfm.cbKeyPress(Sender: TObject; var Key: Char);
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
{ getbomlists(cb.Text);
 exit;

 statusbar1.Panels.Items[3].Text:='请稍等...正在刷新BOM.................' ;
 statusbar1.Update;
        // 'select * from lingjianliaohao where 料号 like '+''''+'%'+trim(edit10.Text)+'%'+''''+ ' and 承认<>'+''''+'已核准'+''''
   sqlstr:='select * from lingjianliaohao where 料号 like '+''''+'%'+trim(cb.text    )+'%'+'''';
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
                end;      //for adoquery2
       end;

end;

end;        //key=#13
  statusbar1.Panels.Items[2].Text:=inttostr(tv.Items.Count);
  statusbar1.Panels.Items[3].Text:='刷新BOM完成！！！！！';     }
end;


procedure Tbomwhfm.TVClick(Sender: TObject);
var
  sqlstr,estr:string;
  liaohao:string;
  bomliaohao:string;
begin

try
   try
   tv.Selected.ImageIndex:=0;
   tv.Update;
   tv.Selected.ImageIndex:=1;
   tv.Update;
   liaohao:=tv.Selected.Text;
   lbom.Caption:=trim(liaohao);
   except
   end;
   if trim(liaohao)='' then
       exit;
   if not (liaohao[1] in ['0'..'9']) then
   begin
   liaohao:='';
   copystring(tv.Selected.Text,'(',')',liaohao);
   end;
   if liaohao[1]<>'9' then
   begin
      aqljlh.Close;
      adotable1.Close;
      exit;
   end;
   bomliaohao:=liaohao;
   sqlstr:='select * from lingjianliaohao where 料号='+''''+liaohao+'''';
   adoquery1.Close;
   adoquery1.SQL.Clear;
   adoquery1.SQL.Add(sqlstr);
   adoquery1.Open;
   if adoquery1.RecordCount<1 then
      exit;

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
   end
   else
   begin
       aqljlh.Close;
       adotable1.Close;
       exit;
   end;
   adotable1.Locate('料号',bomliaohao, [loPartialKey]);
   
except
   adotable1.Close;
end;
try
 estr:='SELECT '+liaohao+'.料号 AS 料号, '  +
      'lingjianliaohao.品名 AS 品名, lingjianliaohao.规格说明 AS 规格说明,  '+
       liaohao+'.阶层 AS 阶层, ' +liaohao+'.单位用量 AS 单位用量, '+liaohao+'.零件位置 AS 零件位置, ' +
      'lingjianliaohao.承认 AS 承认 ' +
      'FROM '+liaohao+' cross JOIN lingjianliaohao '+
      'where '+liaohao+'.料号 = lingjianliaohao.料号  order by 料号';
aqljlh.Close;
aqljlh.SQL.Clear;
aqljlh.SQL.Add(estr);
aqljlh.Open ;
aqljlh.Locate('料号',bomliaohao, [loPartialKey]);
except
end;
try
   MakeDBGridColumnsAutoFixItsWidth(DBGrid2) ;
   MakeDBGridColumnsAutoFixItsWidth(DBGrid1);
except
end;
end;

procedure Tbomwhfm.DBGrid2DblClick(Sender: TObject);
var
mainliao:string;
bomhao:string;
begin
if aqljlh.Active=true then
begin

mainliao:=trim(tv.Items.Item[0].text);
if not (mainliao[1] in ['0'..'9']) then
   begin
   bomhao:='';
   copystring(mainliao,'(',')',bomhao);
   end;
fomatliaohao(bomhao,bomhao);
    try
    if  aqljlh.FieldValues['阶层']<>null then
    editbomffm.jieceng:=aqljlh.FieldValues['阶层']
    else   editbomffm.jieceng:='';
    if  aqljlh.FieldValues['单位用量']<>null then
    editbomffm.yongliang:=aqljlh.FieldValues['单位用量']
    else  editbomffm.yongliang:='';
    if  aqljlh.FieldValues['零件位置']<>null then
    editbomffm.weizhi:=aqljlh.FieldValues['零件位置']
    else editbomffm.weizhi:='';
     editbomffm.Edit3.Text:=aqljlh.FieldValues['料号'];
     editbomffm.Edit4.Text:=aqljlh.FieldValues['规格说明'];
    except
     application.MessageBox('网络正忙！请重试！！！！','提示！',MB_OK+MB_iconstop);
    end;
    editbomffm.ShowModal;
    if editbomffm.flag=false then
       begin
           try
           aqljlh.Edit;
           aqljlh.FieldValues['阶层']:=editbomffm.jieceng;
           aqljlh.FieldValues['单位用量']:=editbomffm.yongliang;
           aqljlh.FieldValues['零件位置']:=editbomffm.weizhi;
           aqljlh.Post;
           except
             application.MessageBox('网络正忙！请重试！！！！','提示！！',MB_OK+MB_iconstop) ;
           end;
           
       end;

end;
end;
procedure Tbomwhfm.DBGrid1DblClick(Sender: TObject);
var
mainliao:string;
bomhao:string;
begin


exit;






if adotable1.Active=true then
begin

mainliao:=trim(tv.Items.Item[0].text);
if not (mainliao[1] in ['0'..'9']) then
   begin
   bomhao:='';
   copystring(mainliao,'(',')',bomhao);
   end;
fomatliaohao(bomhao,bomhao);

    try
    if  adotable1.FieldValues['阶层']<>null then
    editbomffm.jieceng:=adotable1.FieldValues['阶层']
    else   editbomffm.jieceng:='';
    if  adotable1.FieldValues['单位用量']<>null then
    editbomffm.yongliang:=adotable1.FieldValues['单位用量']
    else  editbomffm.yongliang:='';
    if  adotable1.FieldValues['零件位置']<>null then
    editbomffm.weizhi:=adotable1.FieldValues['零件位置']
    else editbomffm.weizhi:='';
    except
     application.MessageBox('网络正忙！请重试！！！！','提示！',MB_OK+MB_iconstop);
    end;
    editbomffm.ShowModal;
    if editbomffm.flag=false then
       begin
           try
           adotable1.Edit;
           adotable1.FieldValues['阶层']:=editbomffm.jieceng;
           adotable1.FieldValues['单位用量']:=editbomffm.yongliang;
           adotable1.FieldValues['零件位置']:=editbomffm.weizhi;
           adotable1.Post;
           except
             application.MessageBox('网络正忙！请重试！！！！','提示！！',MB_OK+MB_iconstop) ;
           end;
           
       end;

end;

end;

procedure Tbomwhfm.SpeedButton5Click(Sender: TObject);
var
liaohao,str,mainliao,bomhao:string;
begin

if adotable1.Active=true then
begin

mainliao:=trim(tv.Items.Item[0].text);          //get one  liao
if not (mainliao[1] in ['0'..'9']) then
   begin
   bomhao:='';
   copystring(mainliao,'(',')',bomhao);
   end;
fomatliaohao(bomhao,bomhao);
bomdeletefm.captions:='BOM维护';
bomdeletefm.showmodal;


if bomdeletefm.cancel=true then
    begin
    abort;
    end;

try
    fomatliaohao(trim(adoquery1.FieldValues['料号']),liaohao);
except
    application.MessageBox('操作错误啦！！         ','提示',MB_OK+MB_iconinformation);
    abort;
end;
    str:='drop table '+liaohao;

if bomdeletefm.R2.Checked=true then
    begin
        if existbom(liaohao)=true then
            begin
                             with ad do
                                  begin
                                       CommandText:='';
                                       CommandText:=str;
                                       try
                                     
                                       adoquery1.Delete;
                                       if existbom(liaohao)=true then
                                       execute;
                                       application.MessageBox('删除BOM成功！！         ','提示？',MB_OK+MB_iconinformation) ;
                                        except
                                       application.MessageBox('删除BOM出错！         ','提示？',MB_OK+MB_iconinformation) ;
                                        end;
                                  end;
            end
            else     application.MessageBox('BOM已被删除！！         ','提示？',MB_OK+MB_iconinformation) ;
        exit;
     end;

if bomdeletefm.R1.Checked=true then          //delete from Father layer
      begin
       adotable1.Edit;
       adotable1.Delete;

       application.MessageBox('删除成功！！         ','提示！',MB_OK+MB_iconinformation);
       exit;
     end;
end;
end;

procedure Tbomwhfm.SpeedButton4Click(Sender: TObject);
var
mainliao,bomhao:string;
begin
addliaofm.adotable:=adotable1;
addliaofm.showmodal;
end;

procedure Tbomwhfm.Edit10KeyPress(Sender: TObject; var Key: Char);
var
i,count:integer;
strsql,tname,liaohao,bomliao:string;
begin
if key=#13 then
begin                                                                                                                           //+' and 类别='+''''+'true'+''''
lv.Clear;
bomlist.Close;
bomlist.SQL.Clear;
bomlist.SQL.Add('select * from lingjianliaohao where 料号 like '+''''+'%'+trim(edit10.Text)+'%'+'''');                           //get all bom
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
                             lv.Items[count-1].SubItems.add(trim(bomlist.FieldValues['品名']));
                         lv.Items[count-1].SubItems.add(bomlist.FieldValues['规格说明']);
                         end;
               bomlist.Next;
            end;
            bomlist.Close;
   end;
end;
end;


procedure Tbomwhfm.BOM1Click(Sender: TObject);
var
  liaohao,bomliao,sqlstr,NEWbomLIAO,newliao:string;
begin
   if adoquery1.Active=false then
      begin
          showmessage('请选种一个有效的BOM后再操作！！   ');
          exit;
      end;
   liaohao:=trim(adoquery1.FieldValues['料号']);
   if liaohao='' then
       begin
           showmessage('无效的BOM料号，料号为空！！请重新选择料号！！　');
           exit;
       end;
   fomatliaohao(liaohao,bomliao);
   if existbom(bomliao)=false then
      begin
          showmessage('选种的料号不是一个ＢＯＭ料号，不存在的ＢＯＭ！！  ');
          exit;
      end;
      
   try
    saveasfm.Caption:='ＢＯＭ重命名为';
    saveasfm.Edit1.Text:=liaohao;
   // saveasfm.Edit1.OnKeyPress(self,'s');
    saveasfm.ComboBox1.Clear;
    saveasfm.showmodal;
    IF saveasfm.cancel=true then
       exit;
    newliao:=trim(saveasfm.Edit1.Text);
    fomatliaohao(newliao,newbomliao);
    sqlstr:='sp_rename '+bomliao+','+newbomliao;
    ad.CommandText:='';
    ad.CommandText:=sqlstr;
    ad.Execute;
    showmessage('ＢＯＭ　重命名完成！！！　　');
   except
       showmessage('ＢＯＭ　重命名失败！！！　　');
       EXIT;
   end;
   try
   adoquery1.Edit;
   adoquery1.FieldValues['料号']:=newliao;
   adoquery1.Post;
   except
       showmessage('重命名料库中之料号失败！请手动完成！！！');
   end;
end;

end.
