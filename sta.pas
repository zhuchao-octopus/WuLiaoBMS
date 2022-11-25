unit sta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, LOOKUPBOM, Menus, ADODB, DB, Grids, DBGrids, ExtCtrls, ComCtrls,
  StdCtrls, Buttons, ToolWin, ImgList, Mask, DBCtrls;

type
  Tstafm = class(TLOOKUPBOMFM)
    Panel2: TPanel;
    SpeedButton8: TSpeedButton;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Label3: TLabel;
    Edit2: TEdit;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    ADOQuery1DSDesigner7: TBCDField;
    ADOTable1DSDesigner7: TFloatField;
    ADOTable1DSDesigner8: TFloatField;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    ProgressBar1: TProgressBar;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    sta: TADOTable;
    ADOQuery1Field: TStringField;
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure TVClick(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure acttable(liaohao:string;ds:Tadotable);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure ADOTable1BeforePost(DataSet: TDataSet);
    procedure ADOTable1AfterPost(DataSet: TDataSet);
    procedure ADOQuery1BeforePost(DataSet: TDataSet);
    procedure DBGrid2DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
type
  TPThread = class(TThread)
  protected
  procedure Execute; override;
  end;
var
  stafm: Tstafm;
   sum:double;
   pt:Tpthread;
implementation

uses exchange,glut,glbut, dmut, bomedit, avg, liaohaolist, price;

{$R *.dfm}
procedure tpthread.Execute;
begin
while true do
  begin
     if stafm.ProgressBar1.Position=200 then
       begin
       stafm.ProgressBar1.Position:=0;
       stafm.ProgressBar1.Update;
       end;
    stafm.ProgressBar1.StepBy(1);
    stafm.ProgressBar1.Update;
    end;
end;
procedure Tstafm.SpeedButton8Click(Sender: TObject);
begin
 // inherited;
exchangefm.showmodal;
end;

procedure Tstafm.SpeedButton11Click(Sender: TObject);
begin
  inherited;
runapplication(handle,'calc.exe');
end;

procedure Tstafm.TVClick(Sender: TObject);
var
bomliaohao:string;
begin
  inherited;
  bomliaohao:=tv.Selected.Text;
if not (bomliaohao[1] in ['0'..'9']) then
begin
bomliaohao:='';
copystring(tv.Selected.Text,'(',')',bomliaohao);
end;
edit1.Text:=bomliaohao;
cb.Text:=bomliaohao;
end;
function getprice(liaohao:string;var bibie:string):double;
var
   ad:tadoquery;
begin
try
     ad:=Tadoquery.Create(application);
     ad.Connection:=dm.ADOConnection1;
     ad.Close;
     ad.SQL.Clear;
     ad.SQL.Add('select * from lingjianliaohao where 料号='+''''+liaohao+'''');
     ad.Open;
     ad.First;
     if ad.FieldValues['币种']=Null then
     bibie:='人民币'
     else
     bibie:=trim(ad.FieldValues['币种']);
     if ad.FieldValues['单价']=Null then
     result:=0.00
     else
     result:=ad.FieldValues['单价'];
finally
     ad.Close;
     ad.Free;
end;

end;
procedure Tstafm.acttable(liaohao:string;ds:Tadotable);
var
tablename:string;
i:integer;
begin
      tablename:=liaohao;
      ds.Close;
      ds.TableName:=tablename;
      ds.Active:=true;
      ds.First;

    //  for i:=0 to ds.RecordCount-1 do
    // begin
     // if existbom(ds.FieldValues['料号'])=false then
     // begin
         // ds.Edit;
         // ds.FieldValues['单价']:=getprice(ds.FieldValues['料号']);
          //ds.FieldValues['合计']:=ds.FieldValues['单价']*ds.FieldValues['数量'];
         // ds.Post;
     // end;
       //   ds.Next;
     // end;
     // ds.Close;
end;
//converte to renmingbi
function conversioncurrency(b1:double;bizhong:string):double;
begin
if bizhong='人民币' then
   result:=b1
else if bizhong='美元' then
   result:=b1*strtofloat(trim(exchangefm.edit1.Text))
else if bizhong='台币' then
   result:=b1*strtofloat(trim(exchangefm.edit3.Text))
else if bizhong='港币' then
    result:=b1*strtofloat(trim(exchangefm.edit2.Text))
else if  bizhong='欧元' then
   result:=b1*strtofloat(trim(exchangefm.edit4.Text))

end;
procedure setpriceq(ds:Tadoquery);
var
yongliang,price:double;
bibie,yls,yl:string;
i:integer;
begin
                     yl:='';
                     ds.Edit;
                     if (ds.FieldValues['单位用量']='')or(ds.FieldValues['单位用量']=Null) then
                        begin
                          yongliang:=0;
                        end
                     else
                        yls:=trim(ds.FieldValues['单位用量']);

                     for i:=1 to length(yls)  do
                      begin
                          try
                            if (not (yls[i]  in ['A'..'Z','a'..'z']))and ((yls[i]  in ['0'..'9','.'])) then
                               yl:=yl+yls[i];
                          except
                          end;
                      end;
                     if trim(yl)='' then
                     yl:='0';
                     yongliang:=strtofloat(yl);
                     price:=getprice(ds.FieldValues['料号'],bibie);
                     ds.FieldValues['单价']:=conversioncurrency(price,trim(bibie));
                     ds.FieldValues['合计']:=ds.FieldValues['单价']*yongliang;
                     ds.Post;
end;
procedure setprice(ds:Tadotable);
var
yongliang,price:double;
bibie,yls,yl:string;
i:integer;
begin
                  yl:='';
                     ds.Edit;
                     if (ds.FieldValues['单位用量']='')or(ds.FieldValues['单位用量']=Null) then
                        begin
                          yongliang:=0;
                        end
                     else
                        yls:=trim(ds.FieldValues['单位用量']);

                     for i:=1 to length(yls)  do
                      begin
                          try
                            if (not (yls[i]  in ['A'..'Z','a'..'z']))and ((yls[i]  in ['0'..'9','.'])) then
                               yl:=yl+yls[i];
                          except
                          end;
                      end;
                     if trim(yl)='' then
                     yl:='0';
                     yongliang:=strtofloat(yl);
                     price:=getprice(ds.FieldValues['料号'],bibie);
                     if price=10 then
                       showmessage(ds.FieldValues['料号']);
                     ds.FieldValues['单价']:=conversioncurrency(price,trim(bibie));       //convert currency to ren ming bi
                     ds.FieldValues['合计']:=ds.FieldValues['单价']*yongliang;
                     ds.Post;
end;
procedure Tstafm.SpeedButton12Click(Sender: TObject);

var
  l1, l2,l3,l4,l5,l6,l7: TTreeNode;
  i1,i2,i3,i4,i5,i6,i7:integer;
  liaohao:string;
  sqlstr:string;
begin
progressbar1.Position:=0;
progressbar1.Update;
//  PT := TPThread.Create (False);
try
if trim(cb.Text)='' then
begin
   application.MessageBox('没有刷新项目 ！！！，请输入要刷新的BOM料号  ','提示！',mb_ok+MB_ICONinformation);
   exit;
  end; 
statusbar1.Panels.Items[3].Text:='请稍等...正在刷新价格.................' ;
statusbar1.Update;
with tv.Items do
   begin
    clear;
          sqlstr:='SELECT * FROM lingjianliaohao WHERE 料号 ='+''''+cb.Text+'''';

       with tq do
       begin
           close;
           sql.Clear;
           sql.Add(sqlstr);

           open;
           tq.First;
           for i1:=0 to tq.RecordCount-1 do
                begin
                    l1:=add(nil ,tq.FieldValues['品名']+'('+trim(tq.FieldValues['料号'])+')');
                   //  setpriceq(tq);
                    fomatliaohao(trim(tq.FieldValues['料号']),liaohao);
                         if existbom(liaohao)=true then
                            begin
                                 acttable(liaohao,t2);
                                 for i2:=0 to t2.recordcount-1 do
                                    begin
                                    setprice(t2);
                                         l2:=AddChild(l1 ,trim(t2.FieldValues['料号']));
                                         fomatliaohao(trim(t2.FieldValues['料号']),liaohao);
                                           if existbom(liaohao)=true then
                                              begin
                                                 acttable(liaohao,t3);
                                                 for i3:=0 to t3.recordcount-1 do
                                                     begin
                                                     setprice(t3);
                                                        l3:=AddChild(l2 ,trim(t3.FieldValues['料号']));
                                                        fomatliaohao(trim(t3.FieldValues['料号']),liaohao);
                                                        if existbom(liaohao)=true then
                                                        begin
                                                          acttable(liaohao,t4);
                                                          for i4:=0 to t4.recordcount-1 do
                                                          begin
                                                          setprice(t4);
                                                            l4:=AddChild(l3 ,trim(t4.FieldValues['料号']));
                                                            fomatliaohao(trim(t4.FieldValues['料号']),liaohao);
                                                              if existbom(liaohao)=true then
                                                                begin
                                                                 acttable(liaohao,t5);
                                                                 for i5:=0 to t5.recordcount-1 do
                                                                 begin
                                                                 setprice(t5);
                                                                   l5:=AddChild(l4 ,trim(t5.FieldValues['料号']));
                                                                   fomatliaohao(trim(t5.FieldValues['料号']),liaohao);
                                                                   if existbom(liaohao)=true then
                                                                      begin
                                                                         acttable(liaohao,t6);
                                                                         for i6:=0 to t6.recordcount-1 do
                                                                         begin
                                                                           setprice(t6);
                                                                           l6:=AddChild(l5 ,trim(t6.FieldValues['料号']));
                                                                           fomatliaohao(trim(t6.FieldValues['料号']),liaohao);
                                                                             if existbom(liaohao)=true then
                                                                             begin
                                                                                 acttable(liaohao,t7);
                                                                                  for i7:=0 to t7.recordcount-1 do
                                                                                  begin
                                                                                      setprice(t7);
                                                                                      l7:=AddChild(l6 ,trim(t7.FieldValues['料号']));
                                                                                      t7.Next;
                                                                                  end;
                                                                             end;
                                                                           t6.Next;
                                                                         end;
                                                                      end;

                                                                   t5.Next;
                                                                 end;
                                                                end;

                                                            t4.Next
                                                          end;
                                                        end;

                                                         t3.Next;
                                                     end;
                                              end;



                                         t2.Next;
                                    end;
                            end;



                    tq.Next;
                end;
       end;

 // PT.Free;

   end;
except
  showmessage('无法从服务器物料库中获得最新价格！！！！');
  statusbar1.Panels.Items[3].Text:='刷新价格没有完成！！！！' ;
  exit;
end;
progressbar1.Position:=200;
statusbar1.Panels.Items[3].Text:='刷新任务完成！！！！' ;
end;
function getsums(ds :Tadoquery):double;
var
  i:integer;
begin
    ds.First;
    for i:=0 to ds.RecordCount-1 do
    begin
       sum:=sum+ds.FieldValues['合计'];
       ds.Next;
    end;
end;
function getsum(ds :Tadotable):double;
var
  i:integer;
begin
    ds.First;
    for i:=0 to ds.RecordCount-1 do
    begin
       sum:=sum+ds.FieldValues['合计'];
       ds.Next;
    end;
end;
procedure Tstafm.SpeedButton10Click(Sender: TObject);
var
  l1, l2,l3,l4,l5,l6: TTreeNode;
  i1,i2,i3,i4,i5,i6:integer;
  liaohao:string;
  sqlstr:string;
begin
progressbar1.Position:=0;
progressbar1.Update;
 // PT := TPThread.Create (False);
 try
 liaohao:=trim(edit1.Text);
 if liaohao='' then
     application.MessageBox('没有统计项目 ！！！  ','失败！',mb_ok+MB_ICONerror);
 except
     application.MessageBox('没有统计项目 ！！！  ','失败！',mb_ok+MB_ICONerror);
 end;
 statusbar1.Panels.Items[3].Text:='请稍等...正在统计总成本.................' ;
 statusbar1.Update;


   if not (liaohao[1] in ['0'..'9']) then
   begin
   liaohao:='';
   copystring(edit1.Text,'(',')',liaohao);
   end;
  fomatliaohao(liaohao,liaohao);
   sqlstr:='select * from '+liaohao;

with adoquery2 do
       begin
           close;
           sql.Clear;
           sql.Add(sqlstr);
           open;
           First;
          // if adoquery2.recordcount>1 then
          // begin
          //     showmessage('主档料号有问题，无法统计！！！');
          //     exit;
          // end;
           for i1:=0 to adoquery2.RecordCount-1 do     //1       it must be one record
                begin

                    fomatliaohao(trim(adoquery2.FieldValues['料号']),liaohao);
                         if existbom(liaohao)=true then
                            begin
                                 acttable(liaohao,t2);
                                 for i2:=0 to t2.recordcount-1 do       //2
                                    begin


                                         fomatliaohao(trim(t2.FieldValues['料号']),liaohao);
                                           if existbom(liaohao)=true then
                                              begin
                                                 acttable(liaohao,t3);
                                                 for i3:=0 to t3.recordcount-1 do          //3
                                                     begin

                                                      
                                                        fomatliaohao(trim(t3.FieldValues['料号']),liaohao);
                                                        if existbom(liaohao)=true then
                                                        begin
                                                          acttable(liaohao,t4);
                                                          for i4:=0 to t4.recordcount-1 do          //4
                                                          begin


                                                            fomatliaohao(trim(t4.FieldValues['料号']),liaohao);
                                                              if existbom(liaohao)=true then
                                                                begin
                                                                 acttable(liaohao,t5);
                                                                 for i5:=0 to t5.recordcount-1 do        //5
                                                                 begin


                                                                   fomatliaohao(trim(t5.FieldValues['料号']),liaohao);
                                                                   if existbom(liaohao)=true then
                                                                      begin
                                                                         acttable(liaohao,t6);
                                                                          for i6:=0 to t6.recordcount-1 do          //6
                                                                         begin

                                                                           fomatliaohao(trim(t6.FieldValues['料号']),liaohao);
                                                                             if existbom(liaohao)=true then
                                                                             begin
                                                                                 acttable(liaohao,t7);                //7
                                                                                 getsum(t7);
                                                                                  t6.Edit;
                                                                             t6.FieldValues['单价']:=sum;
                                                                             t6.Post;
                                                                             sum:=0;
                                                                             end;

                                                                           t6.Next;
                                                                         end;
                                                                         getsum(t6);
                                                                           t5.Edit;
                                                                      t5.FieldValues['单价']:=sum;
                                                                      t5.Post;
                                                                      sum:=0;
                                                                      end;

                                                                      t5.Next;
                                                                 end;
                                                                  getsum(t5);
                                                                  t4.Edit;
                                                             t4.FieldValues['单价']:=sum;
                                                             t4.Post;
                                                             sum:=0;
                                                                end;

                                                            t4.Next
                                                          end;
                                                           getsum(t4);
                                                           t3.Edit;
                                                             t3.FieldValues['单价']:=sum;
                                                             t3.Post;
                                                             sum:=0;
                                                        end;

                                                         t3.Next;
                                                     end;
                                                    getsum(t3);
                                                     t2.Edit;
                                               t2.FieldValues['单价']:=sum;
                                               t2.Post;
                                               sum:=0;
                                              end;



                                         t2.Next;
                                    end;
                                    getsum(t2);
                                     adoquery2.Edit;
                            adoquery2.FieldValues['单价']:=sum;
                            adoquery2.Post;
                            sum:=0;
                            end;

                    adoquery2.Next;
                end;
                getsums(adoquery2);
                adoquery1.Edit;
       adoquery1.FieldValues['单价']:=sum;
       adoquery1.Post;
       end;

 // PT.Free;
progressbar1.Position:=200;       
 statusbar1.Panels.Items[3].Text:='就绪' ;
 statusbar1.Update;
if combobox1.Text='人民币' then
  edit2.Text:=floattostr(sum)
else if combobox1.Text='美元' then
   edit2.Text:=floattostr(sum*strtofloat(trim(exchangefm.edit1.Text)))
else if combobox1.Text='台币' then
 edit2.Text:=floattostr(sum*strtofloat(trim(exchangefm.edit3.Text)))
else if combobox1.Text='港币' then
 edit2.Text:=floattostr(sum*strtofloat(trim(exchangefm.edit2.Text)))
else if  combobox1.Text='欧元' then
 edit2.Text:=floattostr(sum*strtofloat(trim(exchangefm.edit4.Text)))
END;

{var
  l1, l2,l3,l4,l5,l6: TTreeNode;
  i1,i2,i3,i4,i5,i6:integer;
  liaohao:string;
  sqlstr:string;
begin

 statusbar1.Panels.Items[3].Text:='请稍等...正在统计总成本.................' ;
 statusbar1.Update;
begin
   sqlstr:='select * from lingjianliaohao where 料号='+''''+edit1.Text+'''';
with tv.Items do
   begin
    // clear;
       with adoquery2 do
       begin
           close;
           sql.Clear;
           sql.Add(sqlstr);
           open;
           First;
           for i1:=0 to adoquery2.RecordCount-1 do
                begin
                   // l1:=add(nil ,adoquery2.FieldValues['品名']+'('+trim(adoquery2.FieldValues['料号'])+')');
                   // getsums(adoquery2);
                    fomatliaohao(trim(adoquery2.FieldValues['料号']),liaohao);
                         if existbom(liaohao)=true then
                            begin
                                 acttable(liaohao,t2);
                                 for i2:=0 to t2.recordcount-1 do
                                    begin
                                       getsum(t2);
                                     //    l2:=AddChild(l1 ,trim(t2.FieldValues['料号']));
                                         fomatliaohao(trim(t2.FieldValues['料号']),liaohao);
                                           if existbom(liaohao)=true then
                                              begin
                                                 acttable(liaohao,t3);
                                                 for i3:=0 to t3.recordcount-1 do
                                                     begin
                                                      getsum(t3);
                                                      //  l3:=AddChild(l2 ,trim(t3.FieldValues['料号']));
                                                        fomatliaohao(trim(t3.FieldValues['料号']),liaohao);
                                                        if existbom(liaohao)=true then
                                                        begin
                                                          acttable(liaohao,t4);
                                                          for i4:=0 to t4.recordcount-1 do
                                                          begin
                                                              getsum(t4);
                                                          //  l4:=AddChild(l3 ,trim(t4.FieldValues['料号']));
                                                            fomatliaohao(trim(t4.FieldValues['料号']),liaohao);
                                                              if existbom(liaohao)=true then
                                                                begin
                                                                 acttable(liaohao,t5);
                                                                 for i5:=0 to t5.recordcount-1 do
                                                                 begin
                                                                  getsum(t5);
                                                                //   l5:=AddChild(l4 ,trim(t5.FieldValues['料号']));
                                                                   fomatliaohao(trim(t5.FieldValues['料号']),liaohao);
                                                                   if existbom(liaohao)=true then
                                                                      begin
                                                                         acttable(liaohao,t6);
                                                                         for i6:=0 to t6.recordcount-1 do
                                                                         begin
                                                                          getsum(t6);
                                                                         //  l6:=AddChild(l5 ,trim(t6.FieldValues['料号']));
                                                                           t6.Next;
                                                                         end;
                                                                      end;

                                                                   t5.Next;
                                                                 end;
                                                                end;

                                                            t4.Next
                                                          end;
                                                        end;

                                                         t3.Next;
                                                     end;
                                              end;



                                         t2.Next;
                                    end;
                            end;



                    adoquery2.Next;
                end;
       end;

end;

   end;


  statusbar1.Panels.Items[3].Text:='统计完成！！！！！';
  getsum(adotable1);
end;     }
procedure Tstafm.SpeedButton13Click(Sender: TObject);
begin
  if combobox1.Text='人民币' then
  edit2.Text:=floattostr(sum)
else if combobox1.Text='美元' then
   edit2.Text:=floattostr(sum*strtofloat(trim(exchangefm.edit1.Text)))
else if combobox1.Text='台币' then
 edit2.Text:=floattostr(sum*strtofloat(trim(exchangefm.edit3.Text)))
else if combobox1.Text='港币' then
 edit2.Text:=floattostr(sum*strtofloat(trim(exchangefm.edit2.Text)))
else if  combobox1.Text='欧元' then
 edit2.Text:=floattostr(sum*strtofloat(trim(exchangefm.edit4.Text)))

end;

procedure Tstafm.Timer1Timer(Sender: TObject);
begin
  inherited;

if progressbar1.Position=200 then
  begin
   progressbar1.Position:=0;
   progressbar1.Update;
   end;
progressbar1.StepBy(10);
progressbar1.Update;
 end;
procedure Tstafm.SpeedButton1Click(Sender: TObject);
begin
progressbar1.Position:=0;
progressbar1.Update;
 // PT := TPThread.Create (False);
  inherited;
 // PT.Free;
progressbar1.Position:=200;
end;

procedure Tstafm.SpeedButton14Click(Sender: TObject);
begin
  inherited;

sta.Close;
sta.Open;
sta.Append;
sta.FieldValues['计算结果']:=strtofloat(trim(edit2.Text));
sta.FieldValues['BOM名称']:=trim(edit1.Text);
sta.Post;
sta.Close;
end;

procedure Tstafm.SpeedButton15Click(Sender: TObject);
begin
  inherited;
avgfm.show;
end;

procedure Tstafm.DBGrid1DblClick(Sender: TObject);
begin
 if adotable1.Active=true then
begin
  if  adotable1.FieldValues['料号']='' then
      abort;
    liaohaolistfm.liaohao:=adotable1.FieldValues['料号'];
    liaohaolistfm.showmodal;
end
else
abort;

end;

procedure Tstafm.ADOTable1BeforePost(DataSet: TDataSet);
begin
;

end;

procedure Tstafm.ADOTable1AfterPost(DataSet: TDataSet);
begin
;

end;

procedure Tstafm.ADOQuery1BeforePost(DataSet: TDataSet);
begin
;

end;

procedure Tstafm.DBGrid2DblClick(Sender: TObject);
begin

if  adoquery1.FieldValues['单价']=Null then
begin
    adoquery1.Edit;
    adoquery1.FieldValues['单价']:=0;
    adoquery1.Post;
end;
if  adoquery1.FieldValues['币种']=Null then
begin
    adoquery1.Edit;
    adoquery1.FieldValues['币种']:='人民币';
    adoquery1.Post;
end;

pricefm.Edit1.Text:=floattostr(adoquery1.FieldValues['单价']);
pricefm.ComboBox1.Text:=adoquery1.FieldValues['币种'];
pricefm.showmodal;
if pricefm.flag=true then
begin
adoquery1.Edit;
adoquery1.FieldValues['单价']:=pricefm.price;
adoquery1.FieldValues['币种']:=trim(pricefm.currency);
adoquery1.Post;
end;
end;

end.
