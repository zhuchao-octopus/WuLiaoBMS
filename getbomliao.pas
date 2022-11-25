unit getbomliao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, LOOKUPBOM, ADODB, DB, Grids, DBGrids, ExtCtrls, ComCtrls,
  StdCtrls, Buttons, ToolWin, Menus,comobj, ImgList, Mask, DBCtrls;

type
  TLOOKUPBOMFM2 = class(TLOOKUPBOMFM)
    SpeedButton8: TSpeedButton;
    DBGrid3: TDBGrid;
    Splitter3: TSplitter;
    DataSource3: TDataSource;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    ADOTable2: TADOTable;
    ADOCommand1: TADOCommand;
    SpeedButton12: TSpeedButton;
    AO: TADOTable;
    SpeedButton13: TSpeedButton;
    PopupMenu2: TPopupMenu;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    ADOQuery3: TADOQuery;
    SpeedButton14: TSpeedButton;
    aqecnlist: TADOQuery;
    N7: TMenuItem;
    ECN1: TMenuItem;
    N8: TMenuItem;
    ECN2: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    ECN3: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    ECN4: TMenuItem;
    N23: TMenuItem;
    procedure N1Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure TVClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure addecn(a,cmd,b,c,d,e,f,g,h,bg,ag:string);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure lookupbom(liaohao:string);
    procedure DBGrid3CellClick(Column: TColumn);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure cbKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure exportData();
    procedure gettitles(vv:variant);
    procedure createExcel(var v:variant);
    procedure madeecroutstr(var strlist: Tstringlist;i:integer);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure getecn(liaohao:string);
    procedure BOM2Click(Sender: TObject);
    procedure DBGrid3DblClick(Sender: TObject);
    procedure ECN1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure ecnlist(comp,keys:string);
    procedure ECN2Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure allecnlist();
    procedure N12Click(Sender: TObject);
    procedure allecnlistnotchecked();
    procedure N13Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure allecnlistdone();
    procedure allecnlistnotdone();
    procedure N16Click(Sender: TObject);
    procedure allecnlistuser();
    procedure ECN3Click(Sender: TObject);
    procedure DBGrid3TitleClick(Column: TColumn);
    procedure setbuttonactive(a:boolean);
    procedure ECN4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    liaohao,wenhao,updateversion:string;
   
  end;

var
  LOOKUPBOMFM2: TLOOKUPBOMFM2;
  excelfilename:string;
  mainliao,mainguige:string;

implementation
       uses  CREATEECN, lingjian, createcr,glbut, lookupliaohao, checkerc,
  checkecr2, dmut,importut, outexcel, ecnroption, tidailiao;
{$R *.dfm}
procedure Tlookupbomfm2.allecnlistuser();
begin
   aqecnlist.Close;
   aqecnlist.SQL.Clear;
   aqecnlist.SQL.Add('select Main_No �ļ���,wenhao ECN�ĺ�,liaohao �����Ϻ�,App_person ������,Create_date ��������,checked �Ƿ����,state ״̬ from ecr where App_person='+''''+trim(userrealname)+'''');
   aqecnlist.Open;
   adotable2.Close;
   statusbar1.Panels.Items[2].Text:='ECN�б�';

   if aqecnlist.RecordCount<1 then
   begin
   aqecnlist.Close;
   statusbar1.Panels.Items[2].Text:='';
   exit;
   end;
   datasource3.DataSet:=aqecnlist;
   MakeDBGridColumnsAutoFixItsWidth(DBGrid3);
end;
procedure Tlookupbomfm2.allecnlistnotdone();
begin
   aqecnlist.Close;
   aqecnlist.SQL.Clear;
   aqecnlist.SQL.Add('select Main_No �ļ���,wenhao ECN�ĺ�,liaohao �����Ϻ�,App_person ������,Create_date ��������,checked �Ƿ����,state ״̬ from ecr where state<>'+''''+'��Ӧ��'+''''+' and checked='+''''+'�Ѻ�׼'+'''');
   aqecnlist.Open;
   adotable2.Close;
   statusbar1.Panels.Items[2].Text:='ECN�б�';

   if aqecnlist.RecordCount<1 then
   begin
   aqecnlist.Close;
   statusbar1.Panels.Items[2].Text:='';
   exit;
   end;
   datasource3.DataSet:=aqecnlist;
   MakeDBGridColumnsAutoFixItsWidth(DBGrid3);
end;
procedure Tlookupbomfm2.allecnlistdone();
begin
   aqecnlist.Close;
   aqecnlist.SQL.Clear;
   aqecnlist.SQL.Add('select Main_No �ļ���,wenhao ECN�ĺ�,liaohao �����Ϻ�,App_person ������,Create_date ��������,checked �Ƿ����,state ״̬ from ecr where state='+''''+'��Ӧ��'+'''');
   aqecnlist.Open;
   adotable2.Close;
   statusbar1.Panels.Items[2].Text:='ECN�б�';

   if aqecnlist.RecordCount<1 then
   begin
   aqecnlist.Close;
   statusbar1.Panels.Items[2].Text:='';
   exit;
   end;
   datasource3.DataSet:=aqecnlist;
   MakeDBGridColumnsAutoFixItsWidth(DBGrid3);
end;
procedure Tlookupbomfm2.allecnlistnotchecked();
begin
   aqecnlist.Close;
   aqecnlist.SQL.Clear;
   aqecnlist.SQL.Add('select Main_No �ļ���,wenhao ECN�ĺ�,liaohao �����Ϻ�,App_person ������,Create_date ��������,checked �Ƿ����,state ״̬ from ecr where checked <>'+''''+'�����'+''''+' and checked<>'+''''+'�Ѻ�׼'+'''');
   aqecnlist.Open;
   adotable2.Close;
   statusbar1.Panels.Items[3].Text:='ECN�б�';
   
   if aqecnlist.RecordCount<1 then
   begin
   aqecnlist.Close;
   statusbar1.Panels.Items[3].Text:='';
   exit;
   end;
   datasource3.DataSet:=aqecnlist;
   MakeDBGridColumnsAutoFixItsWidth(DBGrid3);
end;
procedure Tlookupbomfm2.allecnlist();
begin
   aqecnlist.Close;
   aqecnlist.SQL.Clear;
   aqecnlist.SQL.Add('select Main_No �ļ���,wenhao ECN�ĺ�,liaohao �����Ϻ�,App_person ������,Create_date ��������,checked �Ƿ����,state ״̬ from ecr ');
   aqecnlist.Open;
   adotable2.Close;
   statusbar1.Panels.Items[3].Text:='ECN�б�';
   
   if aqecnlist.RecordCount<1 then
   begin
   aqecnlist.Close;
   statusbar1.Panels.Items[2].Text:='';
   exit;
   end;
   datasource3.DataSet:=aqecnlist;
   MakeDBGridColumnsAutoFixItsWidth(DBGrid3);
end;
procedure Tlookupbomfm2.ecnlist(comp,keys:string);
begin
   aqecnlist.Close;
   aqecnlist.SQL.Clear;
   aqecnlist.SQL.Add('select Main_No �ļ���,wenhao ECN�ĺ�,liaohao �����Ϻ�,App_person ������,Create_date ��������,checked �Ƿ����,state ״̬ from ecr where checked'+trim(comp)+''''+trim(keys)+'''');
   aqecnlist.Open;
   adotable2.Close;
   statusbar1.Panels.Items[3].Text:='ECN�б�';
   
   if aqecnlist.RecordCount<1 then
   begin
   aqecnlist.Close;
   statusbar1.Panels.Items[3].Text:='';
   exit;
   end;
   datasource3.DataSet:=aqecnlist;
   MakeDBGridColumnsAutoFixItsWidth(DBGrid3);
end;
procedure Tlookupbomfm2.getecn(liaohao:string);
begin
   aqecnlist.Close;
   aqecnlist.SQL.Clear;
   aqecnlist.SQL.Add('select Main_No �ļ���,wenhao ECN�ĺ�,liaohao �����Ϻ�,App_person ������,Create_date ��������,checked �Ƿ����,state ״̬ from ecr where liaohao='+''''+liaohao+'''');
   aqecnlist.Open;
   adotable2.Close;
   statusbar1.Panels.Items[3].Text:='ECN�б�';
   
   if aqecnlist.RecordCount<1 then
   begin
   aqecnlist.Close;
   statusbar1.Panels.Items[3].Text:='';
   exit;
   end;
   datasource3.DataSet:=aqecnlist;
   MakeDBGridColumnsAutoFixItsWidth(DBGrid3);
end;
function parseliaohao(liaohao:string):string;
var
   i:integer;
   newliaohao:string;
begin
newliaohao:='';
if liaohao[1]='B' then                             //0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
     for i:=0 to length(liaohao)do                 //B A A X B B B B B B -  C  C  -  D:
     begin                                         //1 2 3
         if i+2>length(liaohao) then
         break;
         if i=9 then
         newliaohao:=newliaohao+'-';
         
         newliaohao:=newliaohao+liaohao[i+2];

     end;
     result:=newliaohao;
end;
procedure acttable(liaohao:string;ds:Tadotable);
var
tablename:string;
begin
      tablename:=liaohao;
      ds.Close;
      ds.TableName:=tablename;
      ds.Active:=true;
      ds.First;
end;
procedure TLOOKUPBOMFM2.lookupbom(liaohao:string);
var
  l1, l2,l3,l4,l5,l6,l7: TTreeNode;
  i1,i2,i3,i4,i5,i6,i7:integer;
  //liaohao:string;
  sqlstr:string;
begin


begin
   sqlstr:='select * from lingjianliaohao where �Ϻ�='+''''+liaohao+'''';
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
           for i1:=0 to adoquery2.RecordCount-1 do
                begin
                    l1:=add(nil ,adoquery2.FieldValues['Ʒ��']+'('+trim(adoquery2.FieldValues['�Ϻ�'])+')');
                    fomatliaohao(trim(adoquery2.FieldValues['�Ϻ�']),liaohao);
                         if existbom(liaohao)=true then
                            begin
                                 acttable(liaohao,t2);
                                 for i2:=0 to t2.recordcount-1 do
                                    begin
                                         l2:=AddChild(l1 ,trim(t2.FieldValues['�Ϻ�']));
                                         fomatliaohao(trim(t2.FieldValues['�Ϻ�']),liaohao);
                                           if existbom(liaohao)=true then
                                              begin
                                                 acttable(liaohao,t3);
                                                 for i3:=0 to t3.recordcount-1 do
                                                     begin
                                                        l3:=AddChild(l2 ,trim(t3.FieldValues['�Ϻ�']));
                                                        fomatliaohao(trim(t3.FieldValues['�Ϻ�']),liaohao);
                                                        if existbom(liaohao)=true then
                                                        begin
                                                          acttable(liaohao,t4);
                                                          for i4:=0 to t4.recordcount-1 do
                                                          begin
                                                            l4:=AddChild(l3 ,trim(t4.FieldValues['�Ϻ�']));
                                                            fomatliaohao(trim(t4.FieldValues['�Ϻ�']),liaohao);
                                                              if existbom(liaohao)=true then
                                                                begin
                                                                 acttable(liaohao,t5);
                                                                 for i5:=0 to t5.recordcount-1 do
                                                                 begin
                                                                   l5:=AddChild(l4 ,trim(t5.FieldValues['�Ϻ�']));
                                                                   fomatliaohao(trim(t5.FieldValues['�Ϻ�']),liaohao);
                                                                   if existbom(liaohao)=true then
                                                                      begin
                                                                         acttable(liaohao,t6);
                                                                         for i6:=0 to t6.recordcount-1 do
                                                                         begin
                                                                           l6:=AddChild(l5 ,trim(t6.FieldValues['�Ϻ�']));
                                                                              fomatliaohao(trim(t6.FieldValues['�Ϻ�']),liaohao);
                                                                             if existbom(liaohao)=true then
                                                                             begin
                                                                                 acttable(liaohao,t7);
                                                                                  for i7:=0 to t7.recordcount-1 do
                                                                                  begin
                                                                                      l7:=AddChild(l6 ,trim(t7.FieldValues['�Ϻ�']));
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



                    adoquery2.Next;
                end;
       end;

end;

   end;
   end;
function getshuoming(liaohao:string):string;
var
   sqlstr:string;
   aq:Tadoquery;
begin
aq:=Tadoquery.Create(application);
aq.Connection:=dm.adoconnection1;
sqlstr:='select * from lingjianliaohao where �Ϻ�='+''''+liaohao+'''';
   aq.Close;
   aq.SQL.Clear;
   aq.SQL.Add(sqlstr);
   try
   aq.Open;
   if aq.RecordCount>=1 then
     result:=aq.fieldvalues['���˵��']
     else
     result:='';
   finally
   aq.Close;
   aq.Free;
   end;

end;
procedure createecn(ecrname:string);
var
cmd:string;
promote:string;
begin
promote:='No change';
 cmd:=
// 'if exists (select * from sysobjects where id = object_id('+''''+ecrname+''''+')' +
//'         drop table ['+ECrname+']       '+
//'     go        '+

'CREATE TABLE [dbo].['+ecrname+'] (                                     '+
  '[���] [int] IDENTITY (1, 1) NOT FOR REPLICATION  NOT NULL,          '+
	'[���Ϻ�] [char] (15) COLLATE Chinese_PRC_CI_AS NOT NULL ,            '+
	'[���ǰ�Ϻ�] [char] (15) COLLATE Chinese_PRC_CI_AS NOT NULL ,        '+
	'[������Ϻ�] [char] (15) COLLATE Chinese_PRC_CI_AS NULL default '+''''+promote+''''+','+
	'[����] [char] (10) COLLATE Chinese_PRC_CI_AS NOT NULL ,              '+
	'[���ǰ����] [char] (10) COLLATE Chinese_PRC_CI_AS NULL ,'+
	'[���������] [char] (10) COLLATE Chinese_PRC_CI_AS NULL default '+''''+promote+''''+','+
	'[���ǰλ��] [varchar] (1000) COLLATE Chinese_PRC_CI_AS NULL ,'+
	'[�����λ��] [varchar] (1000) COLLATE Chinese_PRC_CI_AS NULL default'+''''+promote+''''+','+

	'[���ǰ���] [varchar] (100) COLLATE Chinese_PRC_CI_AS NULL,          '+
  '[�������] [varchar] (100) COLLATE Chinese_PRC_CI_AS NULL            '+
') ON [PRIMARY]                                                         ';

 //	'[�������] [datetime] NULL ,                                             '+
with   LOOKUPBOMFM2.ADOCommand1 do
      begin
             CommandText:='';
             CommandText:=cmd;
             execute;
      end;


end;
procedure copystring(str:string;bs,es:string;var newstr:string);
var
  i:integer;
  pass:boolean;
begin
pass:=false;
          for i:=1 to length(str) do
            begin
            if  (str[i]=bs)or (pass=true)  then
                if (str[i+1]<>es) then
                begin
                pass:=true;
                newstr:=newstr+str[i+1];
                end
               else
                  break;
            end;
end;
procedure TLOOKUPBOMFM2.N1Click(Sender: TObject);
begin
  inherited;
 if adotable1.Active=true then
  liaohao:=adotable1.FieldValues['�Ϻ�'];
  close;
end;

procedure TLOOKUPBOMFM2.SpeedButton8Click(Sender: TObject);
var
  yongliang:string;
  weizhi:string;
  liaohao:string;
  fatherliao,guige:string;
  aliaohao,aguige,aweizhi,ayongliang:string;
begin

if (adotable1.Active=true)and(adotable2.Active=true) then
begin
  weizhi:=adotable1.FieldValues['���λ��'];
  yongliang:=adotable1.FieldValues['��λ����'];
  liaohao:=adotable1.FieldValues['�Ϻ�'];
  guige:=getshuoming(liaohao);

  /////////////////initialize createecnfm vaiant/////////////////
 // createecnfm.bl:=adotable1.FieldValues['�Ϻ�'];
  //createecnfm.yongliang:=adotable1.FieldValues['��λ����'];
  //createecnfm.weizhi:=adotable1.FieldValues['���λ��'];
 // createecnfm.guige:='';
   createecnfm.Edit3.Text:=liaohao;
   createecnfm.Edit1.Text:=yongliang;
   createecnfm.Memo1.Text:=weizhi;
   createecnfm.Edit2.Text:=guige;

   createecnfm.Edit4.Text:=liaohao;
   createecnfm.Edit5.Text:=guige;
   createecnfm.Edit6.Text:=yongliang;
   createecnfm.Memo2.Text:=weizhi;


 ////////////////////////////////////////////////////////////////
  createecnfm.showmodal;
  if  createecnfm.cancel=true then
      exit;

   aliaohao:=trim(createecnfm.Edit4.Text);
   aguige:=trim(createecnfm.Edit5.Text);
   ayongliang:=trim(createecnfm.Edit6.Text);
   aweizhi:=trim(createecnfm.Memo2.Text);
  if (aliaohao='')or(aguige='') then
     begin
         showmessage('����Ĳ���������');
         exit;
     end;

  fatherliao:=parseliaohao(adotable1.TableName);
  adoquery3.close;
  adoquery3.SQL.clear;
  adoquery3.SQL.Add('select * from '+adotable2.TableName+' where ���ǰ�Ϻ�='+''''+liaohao+'''');
  adoquery3.Open;
  if (adoquery3.RecordCount>=1)and (trim(adoquery3.FieldValues['���Ϻ�'])=fatherliao) then
  begin
     application.MessageBox('���Ϻ��ڴ�BOM���ѱ�����һ��(ɾ��/�޸�)�����ɽ������β�����������                  ','����',mb_ok+MB_ICONSTOP);
     exit;
  end;

  //if trim(createecnfm.Edit2.Text)<>trim(createecnfm.Edit3.Text) then
 // addecn(fatherliao,'�޸�',liaohao,createecnfm.bl,yongliang,createecnfm.yongliang,weizhi,createecnfm.weizhi,datetostr(date()),guige,createecnfm.guige)
 // else
   addecn(fatherliao,'�޸�',liaohao,aliaohao,yongliang,ayongliang,weizhi,aweizhi,datetostr(date()),guige,aguige);

end;


  
end;

procedure TLOOKUPBOMFM2.TVClick(Sender: TObject);
var
str:string;
begin
  inherited;
  str:=tv.Selected.Text;
  
  if trim(str)='' then
    exit;
  if not (str[1] in ['0'..'9']) then
   begin
   str:='';
   copystring(tv.Selected.Text,'(',')',str);
   cb.Text:=str;
   end;


   //getecn(str);

end;

procedure TLOOKUPBOMFM2.SpeedButton4Click(Sender: TObject);
var
liaohao:string;
yongliang:string;
gg,wh:string;
mlh,mgg,myl,mwh:string;
begin
 // try
//lufm2.mn:=adoquery1.FieldValues['�Ϻ�'];
//except
//application.MessageBox('��Ч�Ĳ�����������         ','��ʾ��',MB_OK+MB_iconinformation) ;
//end;
tidailiaofm.Edit2.Text:=adotable1.FieldValues['�Ϻ�'];
mlh:=trim(adotable1.FieldValues['�Ϻ�']);
if aqljlh.Locate('�Ϻ�',mlh,[])=false then
   begin
       showmessage('BOM������˲����޷����');
       exit;
   end;
tidailiaofm.Edit3.Text:=aqljlh.FieldValues['���˵��'];
mgg:=trim(aqljlh.FieldValues['���˵��']);
//tidailiaofm.Edit1.Text:=adotable1.FieldValues['��λ����'];
myl:=trim(adotable1.FieldValues['��λ����']);
mwh:=trim(adotable1.FieldValues['���λ��']);
tidailiaofm.showmodal;
if tidailiaofm.cancel=true then
   exit;
if tidailiaofm.R1.Checked=true then
   begin
       liaohao:=trim(tidailiaofm.Edit2.Text);
       gg:=trim(tidailiaofm.edit3.Text);
       yongliang:=trim(tidailiaofm.Edit1.Text);
       wh:=trim(tidailiaofm.Memo1.Text);
   end
else if tidailiaofm.R2.Checked=true then
   begin
        liaohao:=trim(tidailiaofm.Edit4.Text);
        gg:=trim(tidailiaofm.edit5.Text);
   end
else
   begin
       showmessage('�����Զ�ȡ������');
       exit;
   end;

if (adotable1.Active=true)and(adotable2.Active=true) then
begin
 // lookupliaohaofm.showmodal;
 // if lookupliaohaofm.guigeshuoming='cancel' then
 // begin
 // lookupliaohaofm.guigeshuoming:='';
 //    abort;
 // end;
 // liaohao:=lookupliaohaofm.liaohao;
  adoquery3.close;
  adoquery3.SQL.clear;
  adoquery3.SQL.Add('select * from '+adotable1.TableName+' where �Ϻ�='+''''+liaohao+'''');
  adoquery3.Open;
  if adoquery3.RecordCount>=1 then
  begin
     application.MessageBox('���Ϻ��Ѵ��ڣ����ɽ��д˲�����������                  ','����',mb_ok+MB_ICONSTOP);
     abort;
  end;
   adoquery3.close;
  adoquery3.SQL.clear;
  adoquery3.SQL.Add('select * from '+adotable2.TableName+' where ������Ϻ�='+''''+liaohao+'''');
  adoquery3.Open;
  if (adoquery3.RecordCount>=1)and (trim(adoquery3.FieldValues['���Ϻ�'])=parseliaohao(adotable1.TableName)) then
  begin
     application.MessageBox('���Ϻ�����һ����Ӳ������������ɽ������β�����������                  ','����',mb_ok+MB_ICONSTOP);
     abort;
  end;
if tidailiaofm.R2.Checked=true then
 begin
  addecn(parseliaohao(adotable1.TableName),'','',mlh,' ',myl,' ',mwh,datetostr(date()),' ',mgg);
  addecn(parseliaohao(adotable1.TableName),'����','',liaohao,'�����','�����','�����','�����',datetostr(date()),'',gg);
 end
 else
 addecn(parseliaohao(adotable1.TableName),'����','',liaohao,' ',yongliang,' ',wh,datetostr(date()),' ',gg);
end
else
   begin
       showmessage('��δ��ECN�ļ�����˫����һ��ECN�ļ�������');
       exit;
   end;

end;
procedure TLOOKUPBOMFM2.addecn(a,cmd,b,c,d,e,f,g,h,bg,ag:string);
begin
//     adotable2.Close;
//adotable2.Open;
//addecn(cb.Text,'�޸�',liaohao,createecnfm.bl,yongliang,createecnfm.yongliang,weizhi,createecnfm.weizhi,datetostr(date()),getshuoming(liaohao))
adotable2.Append;
adotable2.FieldValues['���Ϻ�']:=a;
adotable2.FieldValues['����']:=cmd;
adotable2.FieldValues['���ǰ�Ϻ�']:=b;
adotable2.FieldValues['������Ϻ�']:=c;
adotable2.FieldValues['���ǰ����']:=d;
adotable2.FieldValues['���������']:=e;
adotable2.FieldValues['���ǰλ��']:=f;
adotable2.FieldValues['�����λ��']:=g;
//adotable2.FieldValues['�������']:=strtodate(h);
adotable2.FieldValues['���ǰ���']:=bg;
adotable2.FieldValues['�������']:=ag;
adotable2.post;
//adotable2.Close;
end;
procedure TLOOKUPBOMFM2.SpeedButton5Click(Sender: TObject);
var
  liaohao:string;
  weizhi:string;
  yongliang:string;
  
begin
  weizhi:=adotable1.FieldValues['���λ��'];
  yongliang:=adotable1.FieldValues['��λ����'];
    liaohao:=adotable1.FieldValues['�Ϻ�'];

if (adotable1.Active=true)and(adotable2.Active=true) then
begin
//try
liaohao:=adotable1.FieldValues['�Ϻ�'];
//except
//abort;
//end;
  adoquery3.close;
  adoquery3.SQL.clear;
  adoquery3.SQL.Add('select * from '+adotable2.TableName+' where ���ǰ�Ϻ�='+''''+liaohao+'''');
  adoquery3.Open;
  if (adoquery3.RecordCount>=1)and (trim(adoquery3.FieldValues['���Ϻ�'])=parseliaohao(adotable1.TableName)) then
  begin
     application.MessageBox('���Ϻ��ڵ�ǰBOM���ѱ�����һ��(ɾ��)�����ɽ������β�����������                  ','����',mb_ok+MB_ICONSTOP);
     abort;
  end;

 addecn(parseliaohao(adotable1.TableName),'ɾ��',liaohao,' ',yongliang,' ',weizhi,'',datetostr(date()),getshuoming(liaohao),'');
 //addecn(fatherliao,'�޸�',liaohao,liaohao,yongliang,createecnfm.yongliang,weizhi,createecnfm.weizhi,datetostr(date()),getshuoming(liaohao),createecnfm.guige);

 end;

end;
procedure fomatstr_ecr(ecrname:string;var newliaohao:string);

begin

     newliaohao:=stringreplace(ecrname,'-','',[rfReplaceAll]);
end;
function getecnwh(model:string):string;
var
   aq:Tadoquery;
   i:integer;
   wenhao:string;
begin
   wenhao:='';
   for i:=1 to  1024 do
   begin
       wenhao:='ECN-HME'+MODEL+'-'+inttostr(i);

   aq:=Tadoquery.Create(application);
   aq.Connection:=dm.ADOConnection1;
   aq.Close;
   aq.SQL.Clear;
   aq.SQL.Add('select * from ecr where wenhao ='+''''+trim(wenhao)+'''');
   aq.Open;
   if aq.RecordCount<1 then
      begin
          result:=wenhao;
          break;
      end;
   end;
   aq.Close;
   aq.Free;
end;
procedure TLOOKUPBOMFM2.SpeedButton3Click(Sender: TObject);
var
ecrname,wh:string;
liaohao,bomliao:string;
//wenhao:string;
ecr_tname:string;
model:string;
substrs:array of string;
i:integer;
ok:boolean;
begin
ok:=false;
if adoquery1.Active=false then
   begin
     application.MessageBox('��ѡ��һ������BOM�Ϻţ���                  ','����',mb_ok+MB_ICONinformation);
     exit;
   end;
liaohao:=trim(adoquery1.FieldValues['�Ϻ�']);    //get main liaohao

if liaohao='' then
begin
   application.MessageBox('��Ч����BOM�Ϻţ���                  ','����',mb_ok+MB_ICONinformation);
   exit;
end;
fomatliaohao(liaohao,bomliao);
if not existbom(bomliao) then
 begin
     application.MessageBox('��ЧBOM�Ϻţ���                  ','����',mb_ok+MB_ICONinformation);
     exit;
 end;
if adoquery1.FieldValues['״̬']<>true then
begin
   application.MessageBox('�Ƕ���BOM���ܴ���ECN����                  ','����',mb_ok+MB_ICONinformation);
   exit;
end;
if trim(adoquery1.FieldValues['����'])<>'�Ѻ�׼' then
   begin
      application.MessageBox('��ѡ�ֵ�����BOMδ����׼����                  ','����',mb_ok+MB_ICONinformation);
      exit;
   end;

   mainliao:=liaohao;
   checkercfm2.mliao:=mainliao;
if adoquery1.FieldValues['���°汾']<>null then
   updateversion:=adoquery1.FieldValues['���°汾'];
   mainguige:=trim(adoquery1.FieldValues['���˵��']);

//createcrfm.showmodal;
//if createcrfm.cancel=true then
//begin
//   createcrfm.liaohao:='';
//   abort;
//end;
model:=trim(adoquery1.FieldValues['ʹ�û���']);
if model='' then
  begin
       application.MessageBox('������Ϣ��ʧ����                  ','����',mb_ok+MB_ICONinformation);
       exit;
  end;
//fomatliaohao(liaohao,ecr_tname);
//ecrname:='ECR_'+ecr_tname;
//wenhao:=trim(createcrfm.liaohao);
setlength(substrs,length(model)+1);
for i:=0 to high(substrs) do
 begin
    substrs[i]:='';
 end;
if checkmodel(model,substrs)  then
   begin
      createcrfm.ComboBox1.Clear;
     for i:=0 to high(substrs) do
         begin
             createcrfm.ComboBox1.Items.Add(substrs[i]);
         end;
     createcrfm.showmodal;

     if createcrfm.cancel=true then
        exit;
      ok:=false;
    model:=trim(createcrfm.combobox1.Text);
    for i:=0 to high(substrs) do
    begin
        if  model=substrs[i] then
            begin
              ok:=true;
              break;
            end;
    end;
    if ok<>true then
    begin
        showmessage('û��ѡ����Ч�Ļ��֣���  ');
        exit;
    end;
    // model:=trim(createcrfm.combobox1.Text);
   end;
try

wenhao:=getecnwh(model);
except
    showmessage('���ܲ���ECN�ĺ�');
    exit;
end;
if trim(wenhao)='' then
begin
     application.MessageBox('��ЧECN �ĺţ���                  ','����',mb_ok+MB_ICONinformation);
     exit;
end;

fomatliaohao(wenhao,wh);
ecrname:=wh;
//fomatstr_ecr(ecrname);
if existbom(ecrname) then
begin
      IF application.MessageBox(' ��ECR�ļ��Ѿ����ڣ����Ƿ񸲸�������                  ','����',mb_YESNO+MB_ICONinformation)=ID_NO THEN
      abort
      else
      begin
          showmessage('�ܾ�����');
          exit;
          adocommand1.CommandText:='';
          adocommand1.CommandText:='drop table '+ecrname;
          try
          adocommand1.Execute;
          createecn(ecrname);
           ao.Close;
           ao.Open;
           ao.Append;
           ao.FieldByName('Main_No').Value:=ecrname;
           ao.FieldByName('app_person').Value:=userrealname;
           ao.FieldByName('create_date').Value:=date();
           ao.FieldByName('wenhao').Value:=wenhao;
           ao.FieldByName('liaohao').Value:=liaohao;
           ao.Append;
          adotable2.Close;
          adotable2.TableName:=ecrname;
          adotable2.Open;
          setbuttonactive(true);
          except
               application.MessageBox('����ECR�ļ�ʧ�ܣ�������                  ','����',mb_ok+MB_ICONSTOP);
          end;
      end;
end
else begin
try
createecn(ecrname);
adotable2.Close;
adotable2.TableName:=ecrname;
datasource3.DataSet:=adotable2;
adotable2.Open;
setbuttonactive(true);
statusbar1.Panels.Items[1].Text:=liaohao;
statusbar1.Panels.Items[2].Text:=wenhao;
 ao.Close;
 ao.Open;
 ao.Edit;
 ao.Append;
 ao.FieldByName('Main_No').Value:=ecrname;         //tablename
 ao.FieldByName('app_person').Value:=userrealname;
 ao.FieldByName('create_date').Value:=date();
 ao.FieldByName('wenhao').Value:=wenhao;
 ao.FieldByName('liaohao').Value:=liaohao;
 ao.Append;
except
   application.MessageBox('����ECR�ļ�ʧ�ܣ�������                  ','����',mb_ok+MB_ICONSTOP);
end;
 end;
end;

procedure TLOOKUPBOMFM2.SpeedButton13Click(Sender: TObject);
begin

 checkercfm2.showmodal;
 checkercfm2.fmcaption:=caption;
{if adoquery1.Active=false then
   begin
     application.MessageBox('��ѡ��һ������BOM�Ϻţ���                  ','����',mb_ok+MB_ICONinformation);
     exit;
   end;
liaohao:=trim(adoquery1.FieldValues['�Ϻ�']);
if liaohao='' then
begin
   application.MessageBox('��Ч����BOM�Ϻţ���                  ','����',mb_ok+MB_ICONinformation);
   exit;
end;
if (liaohao[1]<>'9')and(liaohao[2]<>'9') then
begin
   application.MessageBox('��Ч����BOM�Ϻţ���                  ','����',mb_ok+MB_ICONinformation);
   exit;
end;
  checkercfm2.fmcaption:=caption;
  mainliao:=trim(adoquery1.FieldValues['�Ϻ�']);
  checkercfm2.mliao:=mainliao;
  mainguige:=trim(adoquery1.FieldValues['���˵��']);
if adoquery1.FieldValues['���°汾']<>null then
  updateversion:=adoquery1.FieldValues['���°汾'];
  checkercfm2.showmodal;
  wenhao:=checkercfm2.wenhao;

if checkercfm2.ecrname='cancel' then
   begin
    checkercfm2.ecrname:='';
    abort;
   end;
 adotable2.Close;
 adotable2.TableName:=checkercfm2.ecrname;
 datasource3.DataSet:=adotable2;
 adotable2.Open;}


end;

procedure TLOOKUPBOMFM2.DBGrid3CellClick(Column: TColumn);
begin
// if adotable2.Active=true then
//   begin
 //  try
  //     if adotable2.FieldValues['���Ϻ�']<>'' then
 //         cb.Text:=adotable2.FieldValues['���Ϻ�'];
 //  except
//   end;
 //  end;
if adotable2.Active=true then
   exit;
try
  if (trim(aqecnlist.FieldValues['�Ƿ����'])='�����') or ((trim(aqecnlist.FieldValues['�Ƿ����'])='�Ѻ�׼'))or(trim(aqecnlist.FieldValues['״̬'])='��Ӧ��')or(trim(aqecnlist.FieldValues['������'])<>trim(userrealname)) then
  begin
    ecn4.Enabled:=false;
    EXIT;
  end
  else ecn4.Enabled:=true;
except
end;
end;

procedure TLOOKUPBOMFM2.N2Click(Sender: TObject);
begin
  inherited;
  if adotable2.Active=true then
  begin
     adotable2.Delete;
  end
  else
     showmessage('��Ч��������');
  //adotable2.Edit;
  //adotable2.Post;
end;

procedure TLOOKUPBOMFM2.N3Click(Sender: TObject);
begin
  inherited;
adotable2.Edit;
adotable2.Post;
end;

procedure TLOOKUPBOMFM2.cbKeyPress(Sender: TObject; var Key: Char);
var
str:string;
begin
if key =#13 then
begin
statusbar1.Panels.Items[3].Text:='���Ե�...����ˢ��BOM.................';
statusbar1.update;
  inherited;
statusbar1.Panels.Items[3].Text:='ˢ��BOM��ɣ�������'  ;
try
 str:=tv.Items.Item[0].Text;
except
    ;
end;
if trim(str)='' then
   exit;
  if not (str[1] in ['0'..'9']) then
   begin
   str:='';
   copystring(tv.Items.Item[0].Text,'(',')',str);
   end;
   cb.Text:=str;
  // getecn(str);
end;
end;
procedure TLOOKUPBOMFM2.SpeedButton1Click(Sender: TObject);
begin
statusbar1.Panels.Items[3].Text:='���Ե�...����ˢ��BOM.................' ;
statusbar1.update;

  inherited;

statusbar1.Panels.Items[3].Text:='ˢ��BOM��ɣ�������';
end;
procedure TLOOKUPBOMFM2.createExcel(var v:variant);
var
sheet:variant;
tablename:string;
begin
tablename:=LOOKUPBOMFM2.ADOTable2.TableName;
v:=createoleobject('Excel.Application');
v.visible:=true;
v.workbooks.add(-4167);
v.workbooks[1].sheets[1].name:=tablename;
sheet:=v.workbooks[1].sheets[tablename];
end;

procedure TLOOKUPBOMFM2.gettitles(vv:variant);
var l :integer ;
begin
            for l:=1 to LOOKUPBOMFM2.ADOTable2.FieldCount do
                begin
                   vv.workbooks[1].sheets[1].cells[1,l]:=LOOKUPBOMFM2.ADOTable2.Fields.Fields[l-1].FieldName  ;
                end;
end;
procedure Tlookupbomfm2.madeecroutstr(var strlist: Tstringlist;i:integer);

begin
 strlist.Clear;

       begin
           if trim(adotable2.FieldValues['����'])='�޸�' then
           begin
              strlist.Append(inttostr(i+1));
              strlist.Append('BC');
              strlist.Append(adotable2.FieldValues['���ǰ�Ϻ�']);
              strlist.Append(adotable2.FieldValues['���ǰ���']);
              strlist.Append(adotable2.FieldValues['���ǰ����']);
              strlist.Append(adotable2.FieldValues['���ǰλ��']);

              strlist.Append('AC');
              strlist.Append(adotable2.FieldValues['������Ϻ�']);
              strlist.Append(adotable2.FieldValues['�������']);
              strlist.Append(adotable2.FieldValues['���������']);
              strlist.Append(adotable2.FieldValues['�����λ��']);
           end;
           if trim(adotable2.FieldValues['����'])='����' then
           begin
              if (trim(adotable2.FieldValues['���������'])='�����')or(trim(adotable2.FieldValues['���������'])='�����')  then
                 begin
                 strlist.Append('');
                 strlist.Append('AS');
                 end
              else
                begin
                 strlist.Append(inttostr(i+1));
                 strlist.Append('A');
                end;
              strlist.Append(adotable2.FieldValues['������Ϻ�']);
              strlist.Append(adotable2.FieldValues['�������']);
              strlist.Append(adotable2.FieldValues['���������']);
              strlist.Append(adotable2.FieldValues['�����λ��']);
           end;
           if trim(adotable2.FieldValues['����'])='ɾ��' then
           begin
              strlist.Append(inttostr(i+1));
              strlist.Append('D');
              strlist.Append(adotable2.FieldValues['���ǰ�Ϻ�']);
              strlist.Append(adotable2.FieldValues['���ǰ���']);
              strlist.Append(adotable2.FieldValues['���ǰ����']);
              strlist.Append(adotable2.FieldValues['���ǰλ��']);
           end;
           if trim(adotable2.FieldValues['����'])='' then
           begin
              //if (trim(adotable2.FieldValues['���������'])='�����')or(trim(adotable2.FieldValues['���������'])='�����')  then
              // strlist.Append('AS')
             // else
             
              strlist.Append(inttostr(i+1));
              strlist.Append('O');
              strlist.Append(adotable2.FieldValues['������Ϻ�']);
              strlist.Append(adotable2.FieldValues['�������']);
              strlist.Append(adotable2.FieldValues['���������']);
              strlist.Append(adotable2.FieldValues['�����λ��']);
           end;
       end;
end;
procedure printecntitle(var strlist:Tstringlist);
begin
   strlist.Clear;
   strlist.Append('�������(ADC������A ɾ��D ���C ���ǰBC �����AC)');
end;
procedure TLOOKUPBOMFM2.SpeedButton9Click(Sender: TObject);
begin
if aqecnlist.Active=true then           //check ecn
begin
 liaohao:=aqecnlist.FieldValues['�ļ���'];
if trim(liaohao)='' then
exit;
aqecnlist.Edit;
aqecnlist.FieldValues['�Ƿ����']:='�����';
aqecnlist.Post;
showmessage('�����ɣ�����');

end
else
  begin
      showmessage('��Ч�Ĳ���������');
      exit;
  end;

end;
procedure TLOOKUPBOMFM2.exportData();
var

I,j:integer;
strlist:Tstringlist;
Excel_No:integer;
Excel_Y:integer;
v:variant;
begin

Excel_NO:=12;
Excel_Y:=1;
if not fileexists(excelfilename) then
begin
  application.MessageBox('ECN���嶪ʧ����                  ','����',mb_ok+MB_ICONinformation);
  exit;
end;
strlist:=Tstringlist.Create;
//createExcel(v);
 try
 outexcelfm.createExcelbyfile(excelfilename);
 //v:=outexcelfm.OleC.OleObject.application;
 //outexcelfm.Show;
 except
 exit;
 end;
  outexcelfm.OleC.OleObject.application.workbooks[1].sheets[1].cells[6,3]:=trim(mainliao);
  outexcelfm.OleC.OleObject.application.workbooks[1].sheets[1].cells[6,5]:=trim(updateversion);
  outexcelfm.OleC.OleObject.application.workbooks[1].sheets[1].cells[7,3]:=trim(mainguige);
  outexcelfm.OleC.OleObject.application.workbooks[1].sheets[1].cells[2,6]:=trim(wenhao);
 // outexcelfm.OleC.OleObject.application.workbooks[1].sheets[1].cells[32,4]:=ecnroptionfm.strs;;
  
LOOKUPBOMFM2.ADOTable2.First;
for I:=0 to LOOKUPBOMFM2.ADOTable2.RecordCount-1 do
    begin
         madeecroutstr(strlist,i);
         for j:=0 to strlist.Count-1 do
             begin
                 if (trim(adotable2.FieldValues['����'])='�޸�')and(strlist[j]='AC') then
                  begin
                     Excel_Y:=2;
                     Excel_No:=Excel_No+1;
                     outexcelfm.OleC.OleObject.application.workbooks[1].sheets[1].cells[Excel_No,Excel_Y]:=strlist[j];
                  end
                 else
                     outexcelfm.OleC.OleObject.application.workbooks[1].sheets[1].cells[Excel_No,Excel_Y]:=strlist[j];
             Excel_Y:=Excel_Y+1;
             end;
            // outexcelfm.OleC.OleObject.application.rows[1].insert;
        Excel_Y:=1;
        Excel_No:=Excel_No+1;
        LOOKUPBOMFM2.ADOTable2.Next;
    end;
    strlist.Free;
     outexcelfm.Show;
END;
procedure TLOOKUPBOMFM2.SpeedButton14Click(Sender: TObject);
//var
//excelfilename:string;
begin
//excelfilename:='.\ecr\ecn.xls';
ecnroptionfm.showmodal;
if ecnroptionfm.flag=true then
   abort;
if ecnroptionfm.ECN.Checked=true     then
   excelfilename:=ExtractFilePath(Application.Exename)+'ECR\ecn.xls'
else if ecnroptionfm.ECR.Checked=true then
    excelfilename:=ExtractFilePath(Application.Exename)+'ECR\changebom.xls'
else
   exit;






if adotable2.Active=true then
      begin
         exportData();
      end
 else
    showmessage('û�д�ӡ��Ŀ,�����޷����У�����');

end;

procedure TLOOKUPBOMFM2.DBGrid1DblClick(Sender: TObject);
begin
;
end;

procedure TLOOKUPBOMFM2.BOM2Click(Sender: TObject);
var
str:string;
begin

  inherited;
try
 str:=tv.Items.Item[0].Text;
except
    ;
end;
if trim(str)='' then
   exit;
  if not (str[1] in ['0'..'9']) then
   begin
   str:='';
   copystring(tv.Items.Item[0].Text,'(',')',str);
   end;
   cb.Text:=str;
   getecn(str);
   statusbar1.Panels.Items[0].Text:=inttostr(tv.Items.Count)+'������';
end;
procedure openecnrecordlist(filename:string);
begin
    //adotable2.Close;
   // adotable2.TableName:=trim(filemane);
   // datasource3.DataSet:=adotable2;
   // adotable2.Open;
end;
procedure TLOOKUPBOMFM2.setbuttonactive(a:boolean);
begin
   speedbutton8.Enabled:=a;
   speedbutton10.Enabled:=a;
   speedbutton11.Enabled:=a;
   n2.Enabled:=a;
   n3.Enabled:=a;
   ecn4.Enabled:=a;
end;
procedure TLOOKUPBOMFM2.DBGrid3DblClick(Sender: TObject);
var
liaohao:string;
creator:string;
begin
  inherited;
if adotable2.Active=true then
exit;
if aqecnlist.Active=true then
begin
liaohao:=aqecnlist.FieldValues['�ļ���'];
creator:=trim(aqecnlist.FieldValues['������']);
setbuttonactive(true);

if caption='�����ţã�'  then
if AnsiStricomp(pchar(creator),pchar(userrealname))<>0 then
 begin
     // application.MessageBox('��û�б༭�鿴��ECR��Ȩ�ޣ���              ','����',mb_ok+MB_ICONerror);
      setbuttonactive(false);
      //openecnrecordlist(liaohao);
     // exit;
 end ;
if caption='�����ţã�'  then
if (trim(aqecnlist.FieldValues['�Ƿ����'])='�����') or ((trim(aqecnlist.FieldValues['�Ƿ����'])='�Ѻ�׼'))or(trim(aqecnlist.FieldValues['״̬'])='��Ӧ��') then
  begin
      //showmessage('��ǰECN�����ٱ༭����');
     // exit;
     setbuttonactive(false);
  end;


if caption='��ˣţã�' then
if ((trim(aqecnlist.FieldValues['�Ƿ����'])='�Ѻ�׼'))or(trim(aqecnlist.FieldValues['״̬'])='��Ӧ��') then
  begin
     // showmessage('��ǰECN�����ٱ༭����');
     // exit;
     setbuttonactive(false);
  end;

if trim(liaohao)='' then
exit;

   statusbar1.Panels.Items[1].Text:='�����Ϻ�:'+trim(aqecnlist.FieldValues['�����Ϻ�']);
   statusbar1.Panels.Items[2].Text:='ECN�ĺ�:'+trim(aqecnlist.FieldValues['ECN�ĺ�']);
   mainliao:=trim(aqecnlist.FieldValues['�����Ϻ�']);

   adoquery1.Close;
   adoquery1.SQL.Clear;
   adoquery1.SQL.Add('select * from lingjianliaohao where �Ϻ�='+''''+mainliao+'''');
   adoquery1.Open;
   if adoquery1.FieldValues['���°汾']<>null then
   updateversion:=adoquery1.FieldValues['���°汾'];
   mainguige:=trim(adoquery1.FieldValues['���˵��']);
   wenhao:=trim(aqecnlist.FieldValues['ECN�ĺ�']);


adotable2.Close;
adotable2.TableName:=liaohao;
datasource3.DataSet:=adotable2;
adotable2.Open;

 tv.items.clear;
 extendbom(mainliao,nil);
 tv.Items.Item[0].Selected:=true;
 tv.OnClick(self);
statusbar1.Panels.Items[3].Text:='BOM �����¼';
aqecnlist.close;
end;
end;
procedure TLOOKUPBOMFM2.ECN1Click(Sender: TObject);
var
str:string;
begin
  inherited;
try
 str:=tv.Selected.Text;
except
    ;
end;
if trim(str)='' then
   exit;
if not (str[1] in ['0'..'9']) then
   begin
   str:='';
   copystring(tv.Items.Item[0].Text,'(',')',str);
   end;
   cb.Text:=str;
   getecn(str);
end;

procedure TLOOKUPBOMFM2.FormActivate(Sender: TObject);
begin
  inherited;
//allecnlist();
setbuttonactive(false);
//ecn4.Enabled:=true;

if caption='�����ţã�'  then
begin
    n8.Enabled:=false;
    n9.Enabled:=false;
    speedbutton9.Enabled:=false;
   // allecnlistuser();
end
else
   begin
     n8.Enabled:=true;
     n9.Enabled:=true;
     speedbutton9.Enabled:=true;
    // allecnlistnotchecked;
   end;
end;

procedure TLOOKUPBOMFM2.N8Click(Sender: TObject);
begin
if aqecnlist.Active=true then
begin
 liaohao:=aqecnlist.FieldValues['�ļ���'];
if trim(liaohao)='' then
exit;
aqecnlist.Edit;
aqecnlist.FieldValues['�Ƿ����']:='�����';
aqecnlist.Post;
showmessage('�����ɣ�����');
end
else
  begin
      showmessage('��Ч�Ĳ���������');
      exit;
  end;
end;
procedure TLOOKUPBOMFM2.ECN2Click(Sender: TObject);
begin
statusbar1.Panels.Items[0].Text:='';
statusbar1.Panels.Items[1].Text:='';
statusbar1.Panels.Items[2].Text:='';
aqljlh.Close;
adotable1.Close;
tv.Items.Clear;
allecnlistnotchecked;

end;

procedure TLOOKUPBOMFM2.N9Click(Sender: TObject);
begin
if aqecnlist.Active=true then
begin
 liaohao:=aqecnlist.FieldValues['�ļ���'];
if trim(liaohao)='' then
exit;
aqecnlist.Edit;
aqecnlist.FieldValues['�Ƿ����']:='�ܾ����';
aqecnlist.Post;
showmessage('������ɣ�����');
end
else
  begin
      showmessage('��Ч�Ĳ���������');
      exit;
  end;

end;

procedure TLOOKUPBOMFM2.N12Click(Sender: TObject);
begin
statusbar1.Panels.Items[0].Text:='';
statusbar1.Panels.Items[1].Text:='';
statusbar1.Panels.Items[2].Text:='';
aqljlh.Close;
adotable1.Close;
tv.Items.Clear;
allecnlist;

end;

procedure TLOOKUPBOMFM2.N13Click(Sender: TObject);
begin
statusbar1.Panels.Items[0].Text:='';
statusbar1.Panels.Items[1].Text:='';
statusbar1.Panels.Items[2].Text:='';
aqljlh.Close;
adotable1.Close;
tv.Items.Clear;
ecnlist('=','�����');

end;

procedure TLOOKUPBOMFM2.N11Click(Sender: TObject);
begin
statusbar1.Panels.Items[0].Text:='';
statusbar1.Panels.Items[1].Text:='';
statusbar1.Panels.Items[2].Text:='';
aqljlh.Close;
adotable1.Close;
tv.Items.Clear;
ecnlist('=','�Ѻ�׼');

end;

procedure TLOOKUPBOMFM2.N14Click(Sender: TObject);
begin
statusbar1.Panels.Items[0].Text:='';
statusbar1.Panels.Items[1].Text:='';
statusbar1.Panels.Items[2].Text:='';
aqljlh.Close;
adotable1.Close;
tv.Items.Clear;
allecnlistdone;

end;

procedure TLOOKUPBOMFM2.N15Click(Sender: TObject);
begin
statusbar1.Panels.Items[0].Text:='';
statusbar1.Panels.Items[1].Text:='';
statusbar1.Panels.Items[2].Text:='';
aqljlh.Close;
adotable1.Close;
tv.Items.Clear;
ecnlist('=','�����');

end;

procedure TLOOKUPBOMFM2.N16Click(Sender: TObject);
begin
statusbar1.Panels.Items[0].Text:='';
statusbar1.Panels.Items[1].Text:='';
statusbar1.Panels.Items[2].Text:='';
aqljlh.Close;
adotable1.Close;
tv.Items.Clear;
allecnlistnotdone();

end;

procedure TLOOKUPBOMFM2.ECN3Click(Sender: TObject);
begin
statusbar1.Panels.Items[0].Text:='';
statusbar1.Panels.Items[1].Text:='';
statusbar1.Panels.Items[2].Text:='';
aqljlh.Close;
adotable1.Close;
tv.Items.Clear;
allecnlistuser();

end;

procedure TLOOKUPBOMFM2.DBGrid3TitleClick(Column: TColumn);
var
i:integer;
begin
if adotable2.Active=true then
   exit;
if not aqecnlist.Active then
   exit;
//for i:= 1 to DBGrid3.Columns.Count do
//  begin
//    DBGrid3.Columns[i-1].Title.Font.Color := clWindowText;
//    DBGrid3.Columns[i-1].Title.Font.Style := [];
//  end;

if aqecnlist.Sort<>Column.FieldName+' DESC' then
begin
   aqecnlist.Sort := Column.FieldName+' DESC';
   Column.Title.Font.Color := clBlue;         //�ı����������Ϊ��ɫ����ʾ��ǰ������ʽΪ����
   Column.Title.Font.Style := [fsBold];
end
else
  begin
      aqecnlist.Sort := Column.FieldName+' ASC';
      Column.Title.Font.Color := clred;         //�ı����������Ϊ��ɫ����ʾ��ǰ������ʽΪ����
      Column.Title.Font.Style := [fsBold];
  end;

end;

procedure TLOOKUPBOMFM2.ECN4Click(Sender: TObject);
VAR
  ECRNAME:STRING;
begin
if aqecnlist.Active=true then
begin
  if (trim(aqecnlist.FieldValues['�Ƿ����'])='�����') or ((trim(aqecnlist.FieldValues['�Ƿ����'])='�Ѻ�׼'))or(trim(aqecnlist.FieldValues['״̬'])='��Ӧ��')or(trim(aqecnlist.FieldValues['������'])<>trim(userrealname)) then
  begin
    ecn4.Enabled:=false;
    EXIT;
  end
  else ecn4.Enabled:=true;
  IF application.MessageBox('���Ҫɾ��ECN��                  ','ɾ����ʾ',mb_YESNO+MB_ICONinformation)=ID_NO THEN
      abort;
          ecrname:=trim(aqecnlist.FieldValues['�ļ���']);
          adocommand1.CommandText:='';
          adocommand1.CommandText:='drop table '+ecrname;
          try
          adocommand1.Execute;
          aqecnlist.Delete;
          except
          showmessage('ɾ��ʧ�ܣ���������');
          exit;
          end;
end;
END;
procedure TLOOKUPBOMFM2.FormCreate(Sender: TObject);
begin
  inherited;
setbuttonactive(false);
//ecn4.Enabled:=true;

if caption='�����ţã�'  then
begin
    n8.Enabled:=false;
    n9.Enabled:=false;
    speedbutton9.Enabled:=false;
   // allecnlistuser();
end
else
   begin
     n8.Enabled:=true;
     n9.Enabled:=true;
     speedbutton9.Enabled:=true;
    // allecnlistnotchecked;
   end;

end;

end.
